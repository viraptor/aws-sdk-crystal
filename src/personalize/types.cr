require "json"
require "time"

module Aws
  module Personalize
    module Types

      # Describes a custom algorithm.

      struct Algorithm
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the algorithm.

        @[JSON::Field(key: "algorithmArn")]
        getter algorithm_arn : String?

        # The URI of the Docker container for the algorithm image.

        @[JSON::Field(key: "algorithmImage")]
        getter algorithm_image : Types::AlgorithmImage?

        # The date and time (in Unix time) that the algorithm was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # Specifies the default hyperparameters, their ranges, and whether they are tunable. A tunable
        # hyperparameter can have its value determined during hyperparameter optimization (HPO).

        @[JSON::Field(key: "defaultHyperParameterRanges")]
        getter default_hyper_parameter_ranges : Types::DefaultHyperParameterRanges?

        # Specifies the default hyperparameters.

        @[JSON::Field(key: "defaultHyperParameters")]
        getter default_hyper_parameters : Hash(String, String)?

        # Specifies the default maximum number of training jobs and parallel training jobs.

        @[JSON::Field(key: "defaultResourceConfig")]
        getter default_resource_config : Hash(String, String)?

        # The date and time (in Unix time) that the algorithm was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the algorithm.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the role.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The training input mode.

        @[JSON::Field(key: "trainingInputMode")]
        getter training_input_mode : String?

        def initialize(
          @algorithm_arn : String? = nil,
          @algorithm_image : Types::AlgorithmImage? = nil,
          @creation_date_time : Time? = nil,
          @default_hyper_parameter_ranges : Types::DefaultHyperParameterRanges? = nil,
          @default_hyper_parameters : Hash(String, String)? = nil,
          @default_resource_config : Hash(String, String)? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @training_input_mode : String? = nil
        )
        end
      end

      # Describes an algorithm image.

      struct AlgorithmImage
        include JSON::Serializable

        # The URI of the Docker container for the algorithm image.

        @[JSON::Field(key: "dockerURI")]
        getter docker_uri : String

        # The name of the algorithm image.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @docker_uri : String,
          @name : String? = nil
        )
        end
      end

      # When the solution performs AutoML ( performAutoML is true in CreateSolution ), Amazon Personalize
      # determines which recipe, from the specified list, optimizes the given metric. Amazon Personalize
      # then uses that recipe for the solution.

      struct AutoMLConfig
        include JSON::Serializable

        # The metric to optimize.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # The list of candidate recipes.

        @[JSON::Field(key: "recipeList")]
        getter recipe_list : Array(String)?

        def initialize(
          @metric_name : String? = nil,
          @recipe_list : Array(String)? = nil
        )
        end
      end

      # When the solution performs AutoML ( performAutoML is true in CreateSolution ), specifies the recipe
      # that best optimized the specified metric.

      struct AutoMLResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the best recipe.

        @[JSON::Field(key: "bestRecipeArn")]
        getter best_recipe_arn : String?

        def initialize(
          @best_recipe_arn : String? = nil
        )
        end
      end

      # The automatic training configuration to use when performAutoTraining is true.

      struct AutoTrainingConfig
        include JSON::Serializable

        # Specifies how often to automatically train new solution versions. Specify a rate expression in rate(
        # value unit ) format. For value, specify a number between 1 and 30. For unit, specify day or days .
        # For example, to automatically create a new solution version every 5 days, specify rate(5 days) . The
        # default is every 7 days. For more information about auto training, see Creating and configuring a
        # solution .

        @[JSON::Field(key: "schedulingExpression")]
        getter scheduling_expression : String?

        def initialize(
          @scheduling_expression : String? = nil
        )
        end
      end

      # Contains information on a batch inference job.

      struct BatchInferenceJob
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the batch inference job.

        @[JSON::Field(key: "batchInferenceJobArn")]
        getter batch_inference_job_arn : String?

        # A string to string map of the configuration details of a batch inference job.

        @[JSON::Field(key: "batchInferenceJobConfig")]
        getter batch_inference_job_config : Types::BatchInferenceJobConfig?

        # The job's mode.

        @[JSON::Field(key: "batchInferenceJobMode")]
        getter batch_inference_job_mode : String?

        # The time at which the batch inference job was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If the batch inference job failed, the reason for the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ARN of the filter used on the batch inference job.

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The Amazon S3 path that leads to the input data used to generate the batch inference job.

        @[JSON::Field(key: "jobInput")]
        getter job_input : Types::BatchInferenceJobInput?

        # The name of the batch inference job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The Amazon S3 bucket that contains the output data generated by the batch inference job.

        @[JSON::Field(key: "jobOutput")]
        getter job_output : Types::BatchInferenceJobOutput?

        # The time at which the batch inference job was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The number of recommendations generated by the batch inference job. This number includes the error
        # messages generated for failed input records.

        @[JSON::Field(key: "numResults")]
        getter num_results : Int32?

        # The ARN of the Amazon Identity and Access Management (IAM) role that requested the batch inference
        # job.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The Amazon Resource Name (ARN) of the solution version from which the batch inference job was
        # created.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        # The status of the batch inference job. The status is one of the following values: PENDING IN
        # PROGRESS ACTIVE CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        # The job's theme generation settings.

        @[JSON::Field(key: "themeGenerationConfig")]
        getter theme_generation_config : Types::ThemeGenerationConfig?

        def initialize(
          @batch_inference_job_arn : String? = nil,
          @batch_inference_job_config : Types::BatchInferenceJobConfig? = nil,
          @batch_inference_job_mode : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @filter_arn : String? = nil,
          @job_input : Types::BatchInferenceJobInput? = nil,
          @job_name : String? = nil,
          @job_output : Types::BatchInferenceJobOutput? = nil,
          @last_updated_date_time : Time? = nil,
          @num_results : Int32? = nil,
          @role_arn : String? = nil,
          @solution_version_arn : String? = nil,
          @status : String? = nil,
          @theme_generation_config : Types::ThemeGenerationConfig? = nil
        )
        end
      end

      # The configuration details of a batch inference job.

      struct BatchInferenceJobConfig
        include JSON::Serializable

        # A string to string map specifying the exploration configuration hyperparameters, including
        # explorationWeight and explorationItemAgeCutOff , you want to use to configure the amount of item
        # exploration Amazon Personalize uses when recommending items. See User-Personalization .

        @[JSON::Field(key: "itemExplorationConfig")]
        getter item_exploration_config : Hash(String, String)?

        # A map of ranking influence values for POPULARITY and FRESHNESS. For each key, specify a numerical
        # value between 0.0 and 1.0 that determines how much influence that ranking factor has on the final
        # recommendations. A value closer to 1.0 gives more weight to the factor, while a value closer to 0.0
        # reduces its influence.

        @[JSON::Field(key: "rankingInfluence")]
        getter ranking_influence : Hash(String, Float64)?

        def initialize(
          @item_exploration_config : Hash(String, String)? = nil,
          @ranking_influence : Hash(String, Float64)? = nil
        )
        end
      end

      # The input configuration of a batch inference job.

      struct BatchInferenceJobInput
        include JSON::Serializable

        # The URI of the Amazon S3 location that contains your input data. The Amazon S3 bucket must be in the
        # same region as the API endpoint you are calling.

        @[JSON::Field(key: "s3DataSource")]
        getter s3_data_source : Types::S3DataConfig

        def initialize(
          @s3_data_source : Types::S3DataConfig
        )
        end
      end

      # The output configuration parameters of a batch inference job.

      struct BatchInferenceJobOutput
        include JSON::Serializable

        # Information on the Amazon S3 bucket in which the batch inference job's output is stored.

        @[JSON::Field(key: "s3DataDestination")]
        getter s3_data_destination : Types::S3DataConfig

        def initialize(
          @s3_data_destination : Types::S3DataConfig
        )
        end
      end

      # A truncated version of the BatchInferenceJob . The ListBatchInferenceJobs operation returns a list
      # of batch inference job summaries.

      struct BatchInferenceJobSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the batch inference job.

        @[JSON::Field(key: "batchInferenceJobArn")]
        getter batch_inference_job_arn : String?

        # The job's mode.

        @[JSON::Field(key: "batchInferenceJobMode")]
        getter batch_inference_job_mode : String?

        # The time at which the batch inference job was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If the batch inference job failed, the reason for the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The name of the batch inference job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The time at which the batch inference job was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The ARN of the solution version used by the batch inference job.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        # The status of the batch inference job. The status is one of the following values: PENDING IN
        # PROGRESS ACTIVE CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @batch_inference_job_arn : String? = nil,
          @batch_inference_job_mode : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @job_name : String? = nil,
          @last_updated_date_time : Time? = nil,
          @solution_version_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information on a batch segment job.

      struct BatchSegmentJob
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the batch segment job.

        @[JSON::Field(key: "batchSegmentJobArn")]
        getter batch_segment_job_arn : String?

        # The time at which the batch segment job was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If the batch segment job failed, the reason for the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ARN of the filter used on the batch segment job.

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The Amazon S3 path that leads to the input data used to generate the batch segment job.

        @[JSON::Field(key: "jobInput")]
        getter job_input : Types::BatchSegmentJobInput?

        # The name of the batch segment job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The Amazon S3 bucket that contains the output data generated by the batch segment job.

        @[JSON::Field(key: "jobOutput")]
        getter job_output : Types::BatchSegmentJobOutput?

        # The time at which the batch segment job last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The number of predicted users generated by the batch segment job for each line of input data. The
        # maximum number of users per segment is 5 million.

        @[JSON::Field(key: "numResults")]
        getter num_results : Int32?

        # The ARN of the Amazon Identity and Access Management (IAM) role that requested the batch segment
        # job.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The Amazon Resource Name (ARN) of the solution version used by the batch segment job to generate
        # batch segments.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        # The status of the batch segment job. The status is one of the following values: PENDING IN PROGRESS
        # ACTIVE CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @batch_segment_job_arn : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @filter_arn : String? = nil,
          @job_input : Types::BatchSegmentJobInput? = nil,
          @job_name : String? = nil,
          @job_output : Types::BatchSegmentJobOutput? = nil,
          @last_updated_date_time : Time? = nil,
          @num_results : Int32? = nil,
          @role_arn : String? = nil,
          @solution_version_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The input configuration of a batch segment job.

      struct BatchSegmentJobInput
        include JSON::Serializable


        @[JSON::Field(key: "s3DataSource")]
        getter s3_data_source : Types::S3DataConfig

        def initialize(
          @s3_data_source : Types::S3DataConfig
        )
        end
      end

      # The output configuration parameters of a batch segment job.

      struct BatchSegmentJobOutput
        include JSON::Serializable


        @[JSON::Field(key: "s3DataDestination")]
        getter s3_data_destination : Types::S3DataConfig

        def initialize(
          @s3_data_destination : Types::S3DataConfig
        )
        end
      end

      # A truncated version of the BatchSegmentJob datatype. ListBatchSegmentJobs operation returns a list
      # of batch segment job summaries.

      struct BatchSegmentJobSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the batch segment job.

        @[JSON::Field(key: "batchSegmentJobArn")]
        getter batch_segment_job_arn : String?

        # The time at which the batch segment job was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If the batch segment job failed, the reason for the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The name of the batch segment job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The time at which the batch segment job was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The Amazon Resource Name (ARN) of the solution version used by the batch segment job to generate
        # batch segments.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        # The status of the batch segment job. The status is one of the following values: PENDING IN PROGRESS
        # ACTIVE CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @batch_segment_job_arn : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @job_name : String? = nil,
          @last_updated_date_time : Time? = nil,
          @solution_version_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # An object that describes the deployment of a solution version. For more information on campaigns,
      # see CreateCampaign .

      struct Campaign
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String?

        # The configuration details of a campaign.

        @[JSON::Field(key: "campaignConfig")]
        getter campaign_config : Types::CampaignConfig?

        # The date and time (in Unix format) that the campaign was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If a campaign fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time (in Unix format) that the campaign was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Provides a summary of the properties of a campaign update. For a complete listing, call the
        # DescribeCampaign API. The latestCampaignUpdate field is only returned when the campaign has had at
        # least one UpdateCampaign call.

        @[JSON::Field(key: "latestCampaignUpdate")]
        getter latest_campaign_update : Types::CampaignUpdateSummary?

        # Specifies the requested minimum provisioned transactions (recommendations) per second. A high
        # minProvisionedTPS will increase your bill. We recommend starting with 1 for minProvisionedTPS (the
        # default). Track your usage using Amazon CloudWatch metrics, and increase the minProvisionedTPS as
        # necessary.

        @[JSON::Field(key: "minProvisionedTPS")]
        getter min_provisioned_tps : Int32?

        # The name of the campaign.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the solution version the campaign uses.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        # The status of the campaign. A campaign can be in one of the following states: CREATE PENDING &gt;
        # CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @campaign_arn : String? = nil,
          @campaign_config : Types::CampaignConfig? = nil,
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @latest_campaign_update : Types::CampaignUpdateSummary? = nil,
          @min_provisioned_tps : Int32? = nil,
          @name : String? = nil,
          @solution_version_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The configuration details of a campaign.

      struct CampaignConfig
        include JSON::Serializable

        # Whether metadata with recommendations is enabled for the campaign. If enabled, you can specify the
        # columns from your Items dataset in your request for recommendations. Amazon Personalize returns this
        # data for each item in the recommendation response. For information about enabling metadata for a
        # campaign, see Enabling metadata in recommendations for a campaign . If you enable metadata in
        # recommendations, you will incur additional costs. For more information, see Amazon Personalize
        # pricing .

        @[JSON::Field(key: "enableMetadataWithRecommendations")]
        getter enable_metadata_with_recommendations : Bool?

        # Specifies the exploration configuration hyperparameters, including explorationWeight and
        # explorationItemAgeCutOff , you want to use to configure the amount of item exploration Amazon
        # Personalize uses when recommending items. Provide itemExplorationConfig data only if your solution
        # uses the User-Personalization recipe.

        @[JSON::Field(key: "itemExplorationConfig")]
        getter item_exploration_config : Hash(String, String)?

        # A map of ranking influence values for POPULARITY and FRESHNESS. For each key, specify a numerical
        # value between 0.0 and 1.0 that determines how much influence that ranking factor has on the final
        # recommendations. A value closer to 1.0 gives more weight to the factor, while a value closer to 0.0
        # reduces its influence.

        @[JSON::Field(key: "rankingInfluence")]
        getter ranking_influence : Hash(String, Float64)?

        # Whether the campaign automatically updates to use the latest solution version (trained model) of a
        # solution. If you specify True , you must specify the ARN of your solution for the SolutionVersionArn
        # parameter. It must be in SolutionArn/$LATEST format. The default is False and you must manually
        # update the campaign to deploy the latest solution version. For more information about automatic
        # campaign updates, see Enabling automatic campaign updates .

        @[JSON::Field(key: "syncWithLatestSolutionVersion")]
        getter sync_with_latest_solution_version : Bool?

        def initialize(
          @enable_metadata_with_recommendations : Bool? = nil,
          @item_exploration_config : Hash(String, String)? = nil,
          @ranking_influence : Hash(String, Float64)? = nil,
          @sync_with_latest_solution_version : Bool? = nil
        )
        end
      end

      # Provides a summary of the properties of a campaign. For a complete listing, call the
      # DescribeCampaign API.

      struct CampaignSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String?

        # The date and time (in Unix time) that the campaign was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If a campaign fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time (in Unix time) that the campaign was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the campaign.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the campaign. A campaign can be in one of the following states: CREATE PENDING &gt;
        # CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @campaign_arn : String? = nil,
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the properties of a campaign update. For a complete listing, call the
      # DescribeCampaign API.

      struct CampaignUpdateSummary
        include JSON::Serializable


        @[JSON::Field(key: "campaignConfig")]
        getter campaign_config : Types::CampaignConfig?

        # The date and time (in Unix time) that the campaign update was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If a campaign update fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time (in Unix time) that the campaign update was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Specifies the requested minimum provisioned transactions (recommendations) per second that Amazon
        # Personalize will support.

        @[JSON::Field(key: "minProvisionedTPS")]
        getter min_provisioned_tps : Int32?

        # The Amazon Resource Name (ARN) of the deployed solution version.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        # The status of the campaign update. A campaign update can be in one of the following states: CREATE
        # PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE
        # IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @campaign_config : Types::CampaignConfig? = nil,
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @min_provisioned_tps : Int32? = nil,
          @solution_version_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides the name and range of a categorical hyperparameter.

      struct CategoricalHyperParameterRange
        include JSON::Serializable

        # The name of the hyperparameter.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of the categories for the hyperparameter.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Provides the name and range of a continuous hyperparameter.

      struct ContinuousHyperParameterRange
        include JSON::Serializable

        # The maximum allowable value for the hyperparameter.

        @[JSON::Field(key: "maxValue")]
        getter max_value : Float64?

        # The minimum allowable value for the hyperparameter.

        @[JSON::Field(key: "minValue")]
        getter min_value : Float64?

        # The name of the hyperparameter.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @max_value : Float64? = nil,
          @min_value : Float64? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateBatchInferenceJobRequest
        include JSON::Serializable

        # The Amazon S3 path that leads to the input file to base your recommendations on. The input material
        # must be in JSON format.

        @[JSON::Field(key: "jobInput")]
        getter job_input : Types::BatchInferenceJobInput

        # The name of the batch inference job to create.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The path to the Amazon S3 bucket where the job's output will be stored.

        @[JSON::Field(key: "jobOutput")]
        getter job_output : Types::BatchInferenceJobOutput

        # The ARN of the Amazon Identity and Access Management role that has permissions to read and write to
        # your input and output Amazon S3 buckets respectively.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The Amazon Resource Name (ARN) of the solution version that will be used to generate the batch
        # inference recommendations.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String

        # The configuration details of a batch inference job.

        @[JSON::Field(key: "batchInferenceJobConfig")]
        getter batch_inference_job_config : Types::BatchInferenceJobConfig?

        # The mode of the batch inference job. To generate descriptive themes for groups of similar items, set
        # the job mode to THEME_GENERATION . If you don't want to generate themes, use the default
        # BATCH_INFERENCE . When you get batch recommendations with themes, you will incur additional costs.
        # For more information, see Amazon Personalize pricing .

        @[JSON::Field(key: "batchInferenceJobMode")]
        getter batch_inference_job_mode : String?

        # The ARN of the filter to apply to the batch inference job. For more information on using filters,
        # see Filtering batch recommendations .

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The number of recommendations to retrieve.

        @[JSON::Field(key: "numResults")]
        getter num_results : Int32?

        # A list of tags to apply to the batch inference job.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # For theme generation jobs, specify the name of the column in your Items dataset that contains each
        # item's name.

        @[JSON::Field(key: "themeGenerationConfig")]
        getter theme_generation_config : Types::ThemeGenerationConfig?

        def initialize(
          @job_input : Types::BatchInferenceJobInput,
          @job_name : String,
          @job_output : Types::BatchInferenceJobOutput,
          @role_arn : String,
          @solution_version_arn : String,
          @batch_inference_job_config : Types::BatchInferenceJobConfig? = nil,
          @batch_inference_job_mode : String? = nil,
          @filter_arn : String? = nil,
          @num_results : Int32? = nil,
          @tags : Array(Types::Tag)? = nil,
          @theme_generation_config : Types::ThemeGenerationConfig? = nil
        )
        end
      end


      struct CreateBatchInferenceJobResponse
        include JSON::Serializable

        # The ARN of the batch inference job.

        @[JSON::Field(key: "batchInferenceJobArn")]
        getter batch_inference_job_arn : String?

        def initialize(
          @batch_inference_job_arn : String? = nil
        )
        end
      end


      struct CreateBatchSegmentJobRequest
        include JSON::Serializable

        # The Amazon S3 path for the input data used to generate the batch segment job.

        @[JSON::Field(key: "jobInput")]
        getter job_input : Types::BatchSegmentJobInput

        # The name of the batch segment job to create.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The Amazon S3 path for the bucket where the job's output will be stored.

        @[JSON::Field(key: "jobOutput")]
        getter job_output : Types::BatchSegmentJobOutput

        # The ARN of the Amazon Identity and Access Management role that has permissions to read and write to
        # your input and output Amazon S3 buckets respectively.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The Amazon Resource Name (ARN) of the solution version you want the batch segment job to use to
        # generate batch segments.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String

        # The ARN of the filter to apply to the batch segment job. For more information on using filters, see
        # Filtering batch recommendations .

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The number of predicted users generated by the batch segment job for each line of input data. The
        # maximum number of users per segment is 5 million.

        @[JSON::Field(key: "numResults")]
        getter num_results : Int32?

        # A list of tags to apply to the batch segment job.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @job_input : Types::BatchSegmentJobInput,
          @job_name : String,
          @job_output : Types::BatchSegmentJobOutput,
          @role_arn : String,
          @solution_version_arn : String,
          @filter_arn : String? = nil,
          @num_results : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateBatchSegmentJobResponse
        include JSON::Serializable

        # The ARN of the batch segment job.

        @[JSON::Field(key: "batchSegmentJobArn")]
        getter batch_segment_job_arn : String?

        def initialize(
          @batch_segment_job_arn : String? = nil
        )
        end
      end


      struct CreateCampaignRequest
        include JSON::Serializable

        # A name for the new campaign. The campaign name must be unique within your account.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the trained model to deploy with the campaign. To specify the
        # latest solution version of your solution, specify the ARN of your solution in SolutionArn/$LATEST
        # format. You must use this format if you set syncWithLatestSolutionVersion to True in the
        # CampaignConfig . To deploy a model that isn't the latest solution version of your solution, specify
        # the ARN of the solution version. For more information about automatic campaign updates, see Enabling
        # automatic campaign updates .

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String

        # The configuration details of a campaign.

        @[JSON::Field(key: "campaignConfig")]
        getter campaign_config : Types::CampaignConfig?

        # Specifies the requested minimum provisioned transactions (recommendations) per second that Amazon
        # Personalize will support. A high minProvisionedTPS will increase your bill. We recommend starting
        # with 1 for minProvisionedTPS (the default). Track your usage using Amazon CloudWatch metrics, and
        # increase the minProvisionedTPS as necessary.

        @[JSON::Field(key: "minProvisionedTPS")]
        getter min_provisioned_tps : Int32?

        # A list of tags to apply to the campaign.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @solution_version_arn : String,
          @campaign_config : Types::CampaignConfig? = nil,
          @min_provisioned_tps : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCampaignResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String?

        def initialize(
          @campaign_arn : String? = nil
        )
        end
      end


      struct CreateDataDeletionJobRequest
        include JSON::Serializable

        # The Amazon S3 bucket that contains the list of userIds of the users to delete.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource

        # The Amazon Resource Name (ARN) of the dataset group that has the datasets you want to delete records
        # from.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String

        # The name for the data deletion job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The Amazon Resource Name (ARN) of the IAM role that has permissions to read from the Amazon S3 data
        # source.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A list of tags to apply to the data deletion job.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @data_source : Types::DataSource,
          @dataset_group_arn : String,
          @job_name : String,
          @role_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDataDeletionJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the data deletion job.

        @[JSON::Field(key: "dataDeletionJobArn")]
        getter data_deletion_job_arn : String?

        def initialize(
          @data_deletion_job_arn : String? = nil
        )
        end
      end


      struct CreateDatasetExportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset that contains the data to export.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        # The name for the dataset export job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The path to the Amazon S3 bucket where the job's output is stored.

        @[JSON::Field(key: "jobOutput")]
        getter job_output : Types::DatasetExportJobOutput

        # The Amazon Resource Name (ARN) of the IAM service role that has permissions to add data to your
        # output Amazon S3 bucket.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The data to export, based on how you imported the data. You can choose to export only BULK data that
        # you imported using a dataset import job, only PUT data that you imported incrementally (using the
        # console, PutEvents, PutUsers and PutItems operations), or ALL for both types. The default value is
        # PUT .

        @[JSON::Field(key: "ingestionMode")]
        getter ingestion_mode : String?

        # A list of tags to apply to the dataset export job.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dataset_arn : String,
          @job_name : String,
          @job_output : Types::DatasetExportJobOutput,
          @role_arn : String,
          @ingestion_mode : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDatasetExportJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset export job.

        @[JSON::Field(key: "datasetExportJobArn")]
        getter dataset_export_job_arn : String?

        def initialize(
          @dataset_export_job_arn : String? = nil
        )
        end
      end


      struct CreateDatasetGroupRequest
        include JSON::Serializable

        # The name for the new dataset group.

        @[JSON::Field(key: "name")]
        getter name : String

        # The domain of the dataset group. Specify a domain to create a Domain dataset group. The domain you
        # specify determines the default schemas for datasets and the use cases available for recommenders. If
        # you don't specify a domain, you create a Custom dataset group with solution versions that you deploy
        # with a campaign.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        # The Amazon Resource Name (ARN) of a Key Management Service (KMS) key used to encrypt the datasets.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The ARN of the Identity and Access Management (IAM) role that has permissions to access the Key
        # Management Service (KMS) key. Supplying an IAM role is only valid when also specifying a KMS key.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # A list of tags to apply to the dataset group.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @domain : String? = nil,
          @kms_key_arn : String? = nil,
          @role_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDatasetGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new dataset group.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The domain for the new Domain dataset group.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        def initialize(
          @dataset_group_arn : String? = nil,
          @domain : String? = nil
        )
        end
      end


      struct CreateDatasetImportJobRequest
        include JSON::Serializable

        # The Amazon S3 bucket that contains the training data to import.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource

        # The ARN of the dataset that receives the imported data.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        # The name for the dataset import job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # Specify how to add the new records to an existing dataset. The default import mode is FULL . If you
        # haven't imported bulk records into the dataset previously, you can only specify FULL . Specify FULL
        # to overwrite all existing bulk data in your dataset. Data you imported individually is not replaced.
        # Specify INCREMENTAL to append the new records to the existing data in your dataset. Amazon
        # Personalize replaces any record with the same ID with the new one.

        @[JSON::Field(key: "importMode")]
        getter import_mode : String?

        # If you created a metric attribution, specify whether to publish metrics for this import job to
        # Amazon S3

        @[JSON::Field(key: "publishAttributionMetricsToS3")]
        getter publish_attribution_metrics_to_s3 : Bool?

        # The ARN of the IAM role that has permissions to read from the Amazon S3 data source.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # A list of tags to apply to the dataset import job.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @data_source : Types::DataSource,
          @dataset_arn : String,
          @job_name : String,
          @import_mode : String? = nil,
          @publish_attribution_metrics_to_s3 : Bool? = nil,
          @role_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDatasetImportJobResponse
        include JSON::Serializable

        # The ARN of the dataset import job.

        @[JSON::Field(key: "datasetImportJobArn")]
        getter dataset_import_job_arn : String?

        def initialize(
          @dataset_import_job_arn : String? = nil
        )
        end
      end


      struct CreateDatasetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group to add the dataset to.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String

        # The type of dataset. One of the following (case insensitive) values: Interactions Items Users
        # Actions Action_Interactions

        @[JSON::Field(key: "datasetType")]
        getter dataset_type : String

        # The name for the dataset.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the schema to associate with the dataset. The schema defines the dataset fields.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String

        # A list of tags to apply to the dataset.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dataset_group_arn : String,
          @dataset_type : String,
          @name : String,
          @schema_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDatasetResponse
        include JSON::Serializable

        # The ARN of the dataset.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        def initialize(
          @dataset_arn : String? = nil
        )
        end
      end


      struct CreateEventTrackerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group that receives the event data.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String

        # The name for the event tracker.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of tags to apply to the event tracker.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dataset_group_arn : String,
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateEventTrackerResponse
        include JSON::Serializable

        # The ARN of the event tracker.

        @[JSON::Field(key: "eventTrackerArn")]
        getter event_tracker_arn : String?

        # The ID of the event tracker. Include this ID in requests to the PutEvents API.

        @[JSON::Field(key: "trackingId")]
        getter tracking_id : String?

        def initialize(
          @event_tracker_arn : String? = nil,
          @tracking_id : String? = nil
        )
        end
      end


      struct CreateFilterRequest
        include JSON::Serializable

        # The ARN of the dataset group that the filter will belong to.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String

        # The filter expression defines which items are included or excluded from recommendations. Filter
        # expression must follow specific format rules. For information about filter expression structure and
        # syntax, see Filter expressions .

        @[JSON::Field(key: "filterExpression")]
        getter filter_expression : String

        # The name of the filter to create.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of tags to apply to the filter.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dataset_group_arn : String,
          @filter_expression : String,
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateFilterResponse
        include JSON::Serializable

        # The ARN of the new filter.

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        def initialize(
          @filter_arn : String? = nil
        )
        end
      end


      struct CreateMetricAttributionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination dataset group for the metric attribution.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String

        # A list of metric attributes for the metric attribution. Each metric attribute specifies an event
        # type to track and a function. Available functions are SUM() or SAMPLECOUNT() . For SUM() functions,
        # provide the dataset type (either Interactions or Items) and column to sum as a parameter. For
        # example SUM(Items.PRICE).

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(Types::MetricAttribute)

        # The output configuration details for the metric attribution.

        @[JSON::Field(key: "metricsOutputConfig")]
        getter metrics_output_config : Types::MetricAttributionOutput

        # A name for the metric attribution.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @dataset_group_arn : String,
          @metrics : Array(Types::MetricAttribute),
          @metrics_output_config : Types::MetricAttributionOutput,
          @name : String
        )
        end
      end


      struct CreateMetricAttributionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the new metric attribution.

        @[JSON::Field(key: "metricAttributionArn")]
        getter metric_attribution_arn : String?

        def initialize(
          @metric_attribution_arn : String? = nil
        )
        end
      end


      struct CreateRecommenderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination domain dataset group for the recommender.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String

        # The name of the recommender.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the recipe that the recommender will use. For a recommender, a
        # recipe is a Domain dataset group use case. Only Domain dataset group use cases can be used to create
        # a recommender. For information about use cases see Choosing recommender use cases .

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String

        # The configuration details of the recommender.

        @[JSON::Field(key: "recommenderConfig")]
        getter recommender_config : Types::RecommenderConfig?

        # A list of tags to apply to the recommender.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dataset_group_arn : String,
          @name : String,
          @recipe_arn : String,
          @recommender_config : Types::RecommenderConfig? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRecommenderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recommender.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String?

        def initialize(
          @recommender_arn : String? = nil
        )
        end
      end


      struct CreateSchemaRequest
        include JSON::Serializable

        # The name for the schema.

        @[JSON::Field(key: "name")]
        getter name : String

        # A schema in Avro JSON format.

        @[JSON::Field(key: "schema")]
        getter schema : String

        # The domain for the schema. If you are creating a schema for a dataset in a Domain dataset group,
        # specify the domain you chose when you created the Domain dataset group.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        def initialize(
          @name : String,
          @schema : String,
          @domain : String? = nil
        )
        end
      end


      struct CreateSchemaResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created schema.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String?

        def initialize(
          @schema_arn : String? = nil
        )
        end
      end


      struct CreateSolutionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group that provides the training data.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String

        # The name for the solution.

        @[JSON::Field(key: "name")]
        getter name : String

        # When your have multiple event types (using an EVENT_TYPE schema field), this parameter specifies
        # which event type (for example, 'click' or 'like') is used for training the model. If you do not
        # provide an eventType , Amazon Personalize will use all interactions for training with equal weight
        # regardless of type.

        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # We don't recommend enabling automated machine learning. Instead, match your use case to the
        # available Amazon Personalize recipes. For more information, see Choosing a recipe . Whether to
        # perform automated machine learning (AutoML). The default is false . For this case, you must specify
        # recipeArn . When set to true , Amazon Personalize analyzes your training data and selects the
        # optimal USER_PERSONALIZATION recipe and hyperparameters. In this case, you must omit recipeArn .
        # Amazon Personalize determines the optimal recipe by running tests with different values for the
        # hyperparameters. AutoML lengthens the training process as compared to selecting a specific recipe.

        @[JSON::Field(key: "performAutoML")]
        getter perform_auto_ml : Bool?

        # Whether the solution uses automatic training to create new solution versions (trained models). The
        # default is True and the solution automatically creates new solution versions every 7 days. You can
        # change the training frequency by specifying a schedulingExpression in the AutoTrainingConfig as part
        # of solution configuration. For more information about automatic training, see Configuring automatic
        # training . Automatic solution version creation starts within one hour after the solution is ACTIVE.
        # If you manually create a solution version within the hour, the solution skips the first automatic
        # training. After training starts, you can get the solution version's Amazon Resource Name (ARN) with
        # the ListSolutionVersions API operation. To get its status, use the DescribeSolutionVersion .

        @[JSON::Field(key: "performAutoTraining")]
        getter perform_auto_training : Bool?

        # Whether to perform hyperparameter optimization (HPO) on the specified or selected recipe. The
        # default is false . When performing AutoML, this parameter is always true and you should not set it
        # to false .

        @[JSON::Field(key: "performHPO")]
        getter perform_hpo : Bool?

        # Whether to perform incremental training updates on your model. When enabled, this allows the model
        # to learn from new data more frequently without requiring full retraining, which enables near
        # real-time personalization. This parameter is supported only for solutions that use the
        # semantic-similarity recipe.

        @[JSON::Field(key: "performIncrementalUpdate")]
        getter perform_incremental_update : Bool?

        # The Amazon Resource Name (ARN) of the recipe to use for model training. This is required when
        # performAutoML is false. For information about different Amazon Personalize recipes and their ARNs,
        # see Choosing a recipe .

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String?

        # The configuration properties for the solution. When performAutoML is set to true, Amazon Personalize
        # only evaluates the autoMLConfig section of the solution configuration. Amazon Personalize doesn't
        # support configuring the hpoObjective at this time.

        @[JSON::Field(key: "solutionConfig")]
        getter solution_config : Types::SolutionConfig?

        # A list of tags to apply to the solution.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dataset_group_arn : String,
          @name : String,
          @event_type : String? = nil,
          @perform_auto_ml : Bool? = nil,
          @perform_auto_training : Bool? = nil,
          @perform_hpo : Bool? = nil,
          @perform_incremental_update : Bool? = nil,
          @recipe_arn : String? = nil,
          @solution_config : Types::SolutionConfig? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateSolutionResponse
        include JSON::Serializable

        # The ARN of the solution.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String?

        def initialize(
          @solution_arn : String? = nil
        )
        end
      end


      struct CreateSolutionVersionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the solution containing the training configuration information.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String

        # The name of the solution version.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of tags to apply to the solution version.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The scope of training to be performed when creating the solution version. The default is FULL . This
        # creates a completely new model based on the entirety of the training data from the datasets in your
        # dataset group. If you use User-Personalization , you can specify a training mode of UPDATE . This
        # updates the model to consider new items for recommendations. It is not a full retraining. You should
        # still complete a full retraining weekly. If you specify UPDATE , Amazon Personalize will stop
        # automatic updates for the solution version. To resume updates, create a new solution with training
        # mode set to FULL and deploy it in a campaign. For more information about automatic updates, see
        # Automatic updates . The UPDATE option can only be used when you already have an active solution
        # version created from the input solution using the FULL option and the input solution was trained
        # with the User-Personalization recipe or the legacy HRNN-Coldstart recipe.

        @[JSON::Field(key: "trainingMode")]
        getter training_mode : String?

        def initialize(
          @solution_arn : String,
          @name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @training_mode : String? = nil
        )
        end
      end


      struct CreateSolutionVersionResponse
        include JSON::Serializable

        # The ARN of the new solution version.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        def initialize(
          @solution_version_arn : String? = nil
        )
        end
      end

      # Describes a job that deletes all references to specific users from an Amazon Personalize dataset
      # group in batches. For information about creating a data deletion job, see Deleting users .

      struct DataDeletionJob
        include JSON::Serializable

        # The creation date and time (in Unix time) of the data deletion job.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the data deletion job.

        @[JSON::Field(key: "dataDeletionJobArn")]
        getter data_deletion_job_arn : String?


        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource?

        # The Amazon Resource Name (ARN) of the dataset group the job deletes records from.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # If a data deletion job fails, provides the reason why.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The name of the data deletion job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The date and time (in Unix time) the data deletion job was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The number of records deleted by a COMPLETED job.

        @[JSON::Field(key: "numDeleted")]
        getter num_deleted : Int32?

        # The Amazon Resource Name (ARN) of the IAM role that has permissions to read from the Amazon S3 data
        # source.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the data deletion job. A data deletion job can have one of the following statuses:
        # PENDING &gt; IN_PROGRESS &gt; COMPLETED -or- FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @data_deletion_job_arn : String? = nil,
          @data_source : Types::DataSource? = nil,
          @dataset_group_arn : String? = nil,
          @failure_reason : String? = nil,
          @job_name : String? = nil,
          @last_updated_date_time : Time? = nil,
          @num_deleted : Int32? = nil,
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the properties of a data deletion job. For a complete listing, call the
      # DescribeDataDeletionJob API operation.

      struct DataDeletionJobSummary
        include JSON::Serializable

        # The creation date and time (in Unix time) of the data deletion job.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the data deletion job.

        @[JSON::Field(key: "dataDeletionJobArn")]
        getter data_deletion_job_arn : String?

        # The Amazon Resource Name (ARN) of the dataset group the job deleted records from.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # If a data deletion job fails, provides the reason why.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The name of the data deletion job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The date and time (in Unix time) the data deletion job was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The status of the data deletion job. A data deletion job can have one of the following statuses:
        # PENDING &gt; IN_PROGRESS &gt; COMPLETED -or- FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @data_deletion_job_arn : String? = nil,
          @dataset_group_arn : String? = nil,
          @failure_reason : String? = nil,
          @job_name : String? = nil,
          @last_updated_date_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the data source that contains the data to upload to a dataset, or the list of records to
      # delete from Amazon Personalize.

      struct DataSource
        include JSON::Serializable

        # For dataset import jobs, the path to the Amazon S3 bucket where the data that you want to upload to
        # your dataset is stored. For data deletion jobs, the path to the Amazon S3 bucket that stores the
        # list of records to delete. For example: s3://bucket-name/folder-name/fileName.csv If your CSV files
        # are in a folder in your Amazon S3 bucket and you want your import job or data deletion job to
        # consider multiple files, you can specify the path to the folder. With a data deletion job, Amazon
        # Personalize uses all files in the folder and any sub folder. Use the following syntax with a / after
        # the folder name: s3://bucket-name/folder-name/

        @[JSON::Field(key: "dataLocation")]
        getter data_location : String?

        def initialize(
          @data_location : String? = nil
        )
        end
      end

      # Provides metadata for a dataset.

      struct Dataset
        include JSON::Serializable

        # The creation date and time (in Unix time) of the dataset.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset that you want metadata for.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # The Amazon Resource Name (ARN) of the dataset group.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # One of the following values: Interactions Items Users Actions Action_Interactions

        @[JSON::Field(key: "datasetType")]
        getter dataset_type : String?

        # A time stamp that shows when the dataset was updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Describes the latest update to the dataset.

        @[JSON::Field(key: "latestDatasetUpdate")]
        getter latest_dataset_update : Types::DatasetUpdateSummary?

        # The name of the dataset.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ARN of the associated schema.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String?

        # The status of the dataset. A dataset can be in one of the following states: CREATE PENDING &gt;
        # CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the event tracker for an Action interactions dataset. You specify the tracker's ID in the
        # PutActionInteractions API operation. Amazon Personalize uses it to direct new data to the Action
        # interactions dataset in your dataset group.

        @[JSON::Field(key: "trackingId")]
        getter tracking_id : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_arn : String? = nil,
          @dataset_group_arn : String? = nil,
          @dataset_type : String? = nil,
          @last_updated_date_time : Time? = nil,
          @latest_dataset_update : Types::DatasetUpdateSummary? = nil,
          @name : String? = nil,
          @schema_arn : String? = nil,
          @status : String? = nil,
          @tracking_id : String? = nil
        )
        end
      end

      # Describes a job that exports a dataset to an Amazon S3 bucket. For more information, see
      # CreateDatasetExportJob . A dataset export job can be in one of the following states: CREATE PENDING
      # &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED

      struct DatasetExportJob
        include JSON::Serializable

        # The creation date and time (in Unix time) of the dataset export job.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset to export.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # The Amazon Resource Name (ARN) of the dataset export job.

        @[JSON::Field(key: "datasetExportJobArn")]
        getter dataset_export_job_arn : String?

        # If a dataset export job fails, provides the reason why.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The data to export, based on how you imported the data. You can choose to export BULK data that you
        # imported using a dataset import job, PUT data that you imported incrementally (using the console,
        # PutEvents, PutUsers and PutItems operations), or ALL for both types. The default value is PUT .

        @[JSON::Field(key: "ingestionMode")]
        getter ingestion_mode : String?

        # The name of the export job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The path to the Amazon S3 bucket where the job's output is stored. For example:
        # s3://bucket-name/folder-name/

        @[JSON::Field(key: "jobOutput")]
        getter job_output : Types::DatasetExportJobOutput?

        # The date and time (in Unix time) the status of the dataset export job was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The Amazon Resource Name (ARN) of the IAM service role that has permissions to add data to your
        # output Amazon S3 bucket.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the dataset export job. A dataset export job can be in one of the following states:
        # CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_arn : String? = nil,
          @dataset_export_job_arn : String? = nil,
          @failure_reason : String? = nil,
          @ingestion_mode : String? = nil,
          @job_name : String? = nil,
          @job_output : Types::DatasetExportJobOutput? = nil,
          @last_updated_date_time : Time? = nil,
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The output configuration parameters of a dataset export job.

      struct DatasetExportJobOutput
        include JSON::Serializable


        @[JSON::Field(key: "s3DataDestination")]
        getter s3_data_destination : Types::S3DataConfig

        def initialize(
          @s3_data_destination : Types::S3DataConfig
        )
        end
      end

      # Provides a summary of the properties of a dataset export job. For a complete listing, call the
      # DescribeDatasetExportJob API.

      struct DatasetExportJobSummary
        include JSON::Serializable

        # The date and time (in Unix time) that the dataset export job was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset export job.

        @[JSON::Field(key: "datasetExportJobArn")]
        getter dataset_export_job_arn : String?

        # If a dataset export job fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The name of the dataset export job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The date and time (in Unix time) that the dataset export job status was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The status of the dataset export job. A dataset export job can be in one of the following states:
        # CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_export_job_arn : String? = nil,
          @failure_reason : String? = nil,
          @job_name : String? = nil,
          @last_updated_date_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # A dataset group is a collection of related datasets (Item interactions, Users, Items, Actions,
      # Action interactions). You create a dataset group by calling CreateDatasetGroup . You then create a
      # dataset and add it to a dataset group by calling CreateDataset . The dataset group is used to create
      # and train a solution by calling CreateSolution . A dataset group can contain only one of each type
      # of dataset. You can specify an Key Management Service (KMS) key to encrypt the datasets in the
      # group.

      struct DatasetGroup
        include JSON::Serializable

        # The creation date and time (in Unix time) of the dataset group.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset group.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The domain of a Domain dataset group.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        # If creating a dataset group fails, provides the reason why.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The Amazon Resource Name (ARN) of the Key Management Service (KMS) key used to encrypt the datasets.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The last update date and time (in Unix time) of the dataset group.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the dataset group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ARN of the Identity and Access Management (IAM) role that has permissions to access the Key
        # Management Service (KMS) key. Supplying an IAM role is only valid when also specifying a KMS key.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The current status of the dataset group. A dataset group can be in one of the following states:
        # CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @domain : String? = nil,
          @failure_reason : String? = nil,
          @kms_key_arn : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the properties of a dataset group. For a complete listing, call the
      # DescribeDatasetGroup API.

      struct DatasetGroupSummary
        include JSON::Serializable

        # The date and time (in Unix time) that the dataset group was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset group.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The domain of a Domain dataset group.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        # If creating a dataset group fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time (in Unix time) that the dataset group was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the dataset group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the dataset group. A dataset group can be in one of the following states: CREATE
        # PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @domain : String? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes a job that imports training data from a data source (Amazon S3 bucket) to an Amazon
      # Personalize dataset. For more information, see CreateDatasetImportJob . A dataset import job can be
      # in one of the following states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE
      # FAILED

      struct DatasetImportJob
        include JSON::Serializable

        # The creation date and time (in Unix time) of the dataset import job.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon S3 bucket that contains the training data to import.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource?

        # The Amazon Resource Name (ARN) of the dataset that receives the imported data.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # The ARN of the dataset import job.

        @[JSON::Field(key: "datasetImportJobArn")]
        getter dataset_import_job_arn : String?

        # If a dataset import job fails, provides the reason why.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The import mode used by the dataset import job to import new records.

        @[JSON::Field(key: "importMode")]
        getter import_mode : String?

        # The name of the import job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The date and time (in Unix time) the dataset was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Whether the job publishes metrics to Amazon S3 for a metric attribution.

        @[JSON::Field(key: "publishAttributionMetricsToS3")]
        getter publish_attribution_metrics_to_s3 : Bool?

        # The ARN of the IAM role that has permissions to read from the Amazon S3 data source.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the dataset import job. A dataset import job can be in one of the following states:
        # CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @data_source : Types::DataSource? = nil,
          @dataset_arn : String? = nil,
          @dataset_import_job_arn : String? = nil,
          @failure_reason : String? = nil,
          @import_mode : String? = nil,
          @job_name : String? = nil,
          @last_updated_date_time : Time? = nil,
          @publish_attribution_metrics_to_s3 : Bool? = nil,
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the properties of a dataset import job. For a complete listing, call the
      # DescribeDatasetImportJob API.

      struct DatasetImportJobSummary
        include JSON::Serializable

        # The date and time (in Unix time) that the dataset import job was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset import job.

        @[JSON::Field(key: "datasetImportJobArn")]
        getter dataset_import_job_arn : String?

        # If a dataset import job fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The import mode the dataset import job used to update the data in the dataset. For more information
        # see Updating existing bulk data .

        @[JSON::Field(key: "importMode")]
        getter import_mode : String?

        # The name of the dataset import job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The date and time (in Unix time) that the dataset import job status was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The status of the dataset import job. A dataset import job can be in one of the following states:
        # CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_import_job_arn : String? = nil,
          @failure_reason : String? = nil,
          @import_mode : String? = nil,
          @job_name : String? = nil,
          @last_updated_date_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the schema for a dataset. For more information on schemas, see CreateSchema .

      struct DatasetSchema
        include JSON::Serializable

        # The date and time (in Unix time) that the schema was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The domain of a schema that you created for a dataset in a Domain dataset group.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        # The date and time (in Unix time) that the schema was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the schema.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The schema.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        # The Amazon Resource Name (ARN) of the schema.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @domain : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @schema : String? = nil,
          @schema_arn : String? = nil
        )
        end
      end

      # Provides a summary of the properties of a dataset schema. For a complete listing, call the
      # DescribeSchema API.

      struct DatasetSchemaSummary
        include JSON::Serializable

        # The date and time (in Unix time) that the schema was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The domain of a schema that you created for a dataset in a Domain dataset group.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        # The date and time (in Unix time) that the schema was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the schema.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the schema.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @domain : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @schema_arn : String? = nil
        )
        end
      end

      # Provides a summary of the properties of a dataset. For a complete listing, call the DescribeDataset
      # API.

      struct DatasetSummary
        include JSON::Serializable

        # The date and time (in Unix time) that the dataset was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # The dataset type. One of the following values: Interactions Items Users Event-Interactions

        @[JSON::Field(key: "datasetType")]
        getter dataset_type : String?

        # The date and time (in Unix time) that the dataset was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the dataset.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the dataset. A dataset can be in one of the following states: CREATE PENDING &gt;
        # CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_arn : String? = nil,
          @dataset_type : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes an update to a dataset.

      struct DatasetUpdateSummary
        include JSON::Serializable

        # The creation date and time (in Unix time) of the dataset update.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If updating a dataset fails, provides the reason why.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The last update date and time (in Unix time) of the dataset.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The Amazon Resource Name (ARN) of the schema that replaced the previous schema of the dataset.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String?

        # The status of the dataset update.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @schema_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides the name and default range of a categorical hyperparameter and whether the hyperparameter
      # is tunable. A tunable hyperparameter can have its value determined during hyperparameter
      # optimization (HPO).

      struct DefaultCategoricalHyperParameterRange
        include JSON::Serializable

        # Whether the hyperparameter is tunable.

        @[JSON::Field(key: "isTunable")]
        getter is_tunable : Bool?

        # The name of the hyperparameter.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of the categories for the hyperparameter.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @is_tunable : Bool? = nil,
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Provides the name and default range of a continuous hyperparameter and whether the hyperparameter is
      # tunable. A tunable hyperparameter can have its value determined during hyperparameter optimization
      # (HPO).

      struct DefaultContinuousHyperParameterRange
        include JSON::Serializable

        # Whether the hyperparameter is tunable.

        @[JSON::Field(key: "isTunable")]
        getter is_tunable : Bool?

        # The maximum allowable value for the hyperparameter.

        @[JSON::Field(key: "maxValue")]
        getter max_value : Float64?

        # The minimum allowable value for the hyperparameter.

        @[JSON::Field(key: "minValue")]
        getter min_value : Float64?

        # The name of the hyperparameter.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @is_tunable : Bool? = nil,
          @max_value : Float64? = nil,
          @min_value : Float64? = nil,
          @name : String? = nil
        )
        end
      end

      # Specifies the hyperparameters and their default ranges. Hyperparameters can be categorical,
      # continuous, or integer-valued.

      struct DefaultHyperParameterRanges
        include JSON::Serializable

        # The categorical hyperparameters and their default ranges.

        @[JSON::Field(key: "categoricalHyperParameterRanges")]
        getter categorical_hyper_parameter_ranges : Array(Types::DefaultCategoricalHyperParameterRange)?

        # The continuous hyperparameters and their default ranges.

        @[JSON::Field(key: "continuousHyperParameterRanges")]
        getter continuous_hyper_parameter_ranges : Array(Types::DefaultContinuousHyperParameterRange)?

        # The integer-valued hyperparameters and their default ranges.

        @[JSON::Field(key: "integerHyperParameterRanges")]
        getter integer_hyper_parameter_ranges : Array(Types::DefaultIntegerHyperParameterRange)?

        def initialize(
          @categorical_hyper_parameter_ranges : Array(Types::DefaultCategoricalHyperParameterRange)? = nil,
          @continuous_hyper_parameter_ranges : Array(Types::DefaultContinuousHyperParameterRange)? = nil,
          @integer_hyper_parameter_ranges : Array(Types::DefaultIntegerHyperParameterRange)? = nil
        )
        end
      end

      # Provides the name and default range of a integer-valued hyperparameter and whether the
      # hyperparameter is tunable. A tunable hyperparameter can have its value determined during
      # hyperparameter optimization (HPO).

      struct DefaultIntegerHyperParameterRange
        include JSON::Serializable

        # Indicates whether the hyperparameter is tunable.

        @[JSON::Field(key: "isTunable")]
        getter is_tunable : Bool?

        # The maximum allowable value for the hyperparameter.

        @[JSON::Field(key: "maxValue")]
        getter max_value : Int32?

        # The minimum allowable value for the hyperparameter.

        @[JSON::Field(key: "minValue")]
        getter min_value : Int32?

        # The name of the hyperparameter.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @is_tunable : Bool? = nil,
          @max_value : Int32? = nil,
          @min_value : Int32? = nil,
          @name : String? = nil
        )
        end
      end


      struct DeleteCampaignRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign to delete.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String

        def initialize(
          @campaign_arn : String
        )
        end
      end


      struct DeleteDatasetGroupRequest
        include JSON::Serializable

        # The ARN of the dataset group to delete.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String

        def initialize(
          @dataset_group_arn : String
        )
        end
      end


      struct DeleteDatasetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset to delete.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        def initialize(
          @dataset_arn : String
        )
        end
      end


      struct DeleteEventTrackerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the event tracker to delete.

        @[JSON::Field(key: "eventTrackerArn")]
        getter event_tracker_arn : String

        def initialize(
          @event_tracker_arn : String
        )
        end
      end


      struct DeleteFilterRequest
        include JSON::Serializable

        # The ARN of the filter to delete.

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String

        def initialize(
          @filter_arn : String
        )
        end
      end


      struct DeleteMetricAttributionRequest
        include JSON::Serializable

        # The metric attribution's Amazon Resource Name (ARN).

        @[JSON::Field(key: "metricAttributionArn")]
        getter metric_attribution_arn : String

        def initialize(
          @metric_attribution_arn : String
        )
        end
      end


      struct DeleteRecommenderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recommender to delete.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String

        def initialize(
          @recommender_arn : String
        )
        end
      end


      struct DeleteSchemaRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schema to delete.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String

        def initialize(
          @schema_arn : String
        )
        end
      end


      struct DeleteSolutionRequest
        include JSON::Serializable

        # The ARN of the solution to delete.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String

        def initialize(
          @solution_arn : String
        )
        end
      end


      struct DescribeAlgorithmRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the algorithm to describe.

        @[JSON::Field(key: "algorithmArn")]
        getter algorithm_arn : String

        def initialize(
          @algorithm_arn : String
        )
        end
      end


      struct DescribeAlgorithmResponse
        include JSON::Serializable

        # A listing of the properties of the algorithm.

        @[JSON::Field(key: "algorithm")]
        getter algorithm : Types::Algorithm?

        def initialize(
          @algorithm : Types::Algorithm? = nil
        )
        end
      end


      struct DescribeBatchInferenceJobRequest
        include JSON::Serializable

        # The ARN of the batch inference job to describe.

        @[JSON::Field(key: "batchInferenceJobArn")]
        getter batch_inference_job_arn : String

        def initialize(
          @batch_inference_job_arn : String
        )
        end
      end


      struct DescribeBatchInferenceJobResponse
        include JSON::Serializable

        # Information on the specified batch inference job.

        @[JSON::Field(key: "batchInferenceJob")]
        getter batch_inference_job : Types::BatchInferenceJob?

        def initialize(
          @batch_inference_job : Types::BatchInferenceJob? = nil
        )
        end
      end


      struct DescribeBatchSegmentJobRequest
        include JSON::Serializable

        # The ARN of the batch segment job to describe.

        @[JSON::Field(key: "batchSegmentJobArn")]
        getter batch_segment_job_arn : String

        def initialize(
          @batch_segment_job_arn : String
        )
        end
      end


      struct DescribeBatchSegmentJobResponse
        include JSON::Serializable

        # Information on the specified batch segment job.

        @[JSON::Field(key: "batchSegmentJob")]
        getter batch_segment_job : Types::BatchSegmentJob?

        def initialize(
          @batch_segment_job : Types::BatchSegmentJob? = nil
        )
        end
      end


      struct DescribeCampaignRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String

        def initialize(
          @campaign_arn : String
        )
        end
      end


      struct DescribeCampaignResponse
        include JSON::Serializable

        # The latestCampaignUpdate field is only returned when the campaign has had at least one
        # UpdateCampaign call. The properties of the campaign. The latestCampaignUpdate field is only returned
        # when the campaign has had at least one UpdateCampaign call.

        @[JSON::Field(key: "campaign")]
        getter campaign : Types::Campaign?

        def initialize(
          @campaign : Types::Campaign? = nil
        )
        end
      end


      struct DescribeDataDeletionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the data deletion job.

        @[JSON::Field(key: "dataDeletionJobArn")]
        getter data_deletion_job_arn : String

        def initialize(
          @data_deletion_job_arn : String
        )
        end
      end


      struct DescribeDataDeletionJobResponse
        include JSON::Serializable

        # Information about the data deletion job, including the status. The status is one of the following
        # values: PENDING IN_PROGRESS COMPLETED FAILED

        @[JSON::Field(key: "dataDeletionJob")]
        getter data_deletion_job : Types::DataDeletionJob?

        def initialize(
          @data_deletion_job : Types::DataDeletionJob? = nil
        )
        end
      end


      struct DescribeDatasetExportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset export job to describe.

        @[JSON::Field(key: "datasetExportJobArn")]
        getter dataset_export_job_arn : String

        def initialize(
          @dataset_export_job_arn : String
        )
        end
      end


      struct DescribeDatasetExportJobResponse
        include JSON::Serializable

        # Information about the dataset export job, including the status. The status is one of the following
        # values: CREATE PENDING CREATE IN_PROGRESS ACTIVE CREATE FAILED

        @[JSON::Field(key: "datasetExportJob")]
        getter dataset_export_job : Types::DatasetExportJob?

        def initialize(
          @dataset_export_job : Types::DatasetExportJob? = nil
        )
        end
      end


      struct DescribeDatasetGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group to describe.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String

        def initialize(
          @dataset_group_arn : String
        )
        end
      end


      struct DescribeDatasetGroupResponse
        include JSON::Serializable

        # A listing of the dataset group's properties.

        @[JSON::Field(key: "datasetGroup")]
        getter dataset_group : Types::DatasetGroup?

        def initialize(
          @dataset_group : Types::DatasetGroup? = nil
        )
        end
      end


      struct DescribeDatasetImportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset import job to describe.

        @[JSON::Field(key: "datasetImportJobArn")]
        getter dataset_import_job_arn : String

        def initialize(
          @dataset_import_job_arn : String
        )
        end
      end


      struct DescribeDatasetImportJobResponse
        include JSON::Serializable

        # Information about the dataset import job, including the status. The status is one of the following
        # values: CREATE PENDING CREATE IN_PROGRESS ACTIVE CREATE FAILED

        @[JSON::Field(key: "datasetImportJob")]
        getter dataset_import_job : Types::DatasetImportJob?

        def initialize(
          @dataset_import_job : Types::DatasetImportJob? = nil
        )
        end
      end


      struct DescribeDatasetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset to describe.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        def initialize(
          @dataset_arn : String
        )
        end
      end


      struct DescribeDatasetResponse
        include JSON::Serializable

        # A listing of the dataset's properties.

        @[JSON::Field(key: "dataset")]
        getter dataset : Types::Dataset?

        def initialize(
          @dataset : Types::Dataset? = nil
        )
        end
      end


      struct DescribeEventTrackerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the event tracker to describe.

        @[JSON::Field(key: "eventTrackerArn")]
        getter event_tracker_arn : String

        def initialize(
          @event_tracker_arn : String
        )
        end
      end


      struct DescribeEventTrackerResponse
        include JSON::Serializable

        # An object that describes the event tracker.

        @[JSON::Field(key: "eventTracker")]
        getter event_tracker : Types::EventTracker?

        def initialize(
          @event_tracker : Types::EventTracker? = nil
        )
        end
      end


      struct DescribeFeatureTransformationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the feature transformation to describe.

        @[JSON::Field(key: "featureTransformationArn")]
        getter feature_transformation_arn : String

        def initialize(
          @feature_transformation_arn : String
        )
        end
      end


      struct DescribeFeatureTransformationResponse
        include JSON::Serializable

        # A listing of the FeatureTransformation properties.

        @[JSON::Field(key: "featureTransformation")]
        getter feature_transformation : Types::FeatureTransformation?

        def initialize(
          @feature_transformation : Types::FeatureTransformation? = nil
        )
        end
      end


      struct DescribeFilterRequest
        include JSON::Serializable

        # The ARN of the filter to describe.

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String

        def initialize(
          @filter_arn : String
        )
        end
      end


      struct DescribeFilterResponse
        include JSON::Serializable

        # The filter's details.

        @[JSON::Field(key: "filter")]
        getter filter : Types::Filter?

        def initialize(
          @filter : Types::Filter? = nil
        )
        end
      end


      struct DescribeMetricAttributionRequest
        include JSON::Serializable

        # The metric attribution's Amazon Resource Name (ARN).

        @[JSON::Field(key: "metricAttributionArn")]
        getter metric_attribution_arn : String

        def initialize(
          @metric_attribution_arn : String
        )
        end
      end


      struct DescribeMetricAttributionResponse
        include JSON::Serializable

        # The details of the metric attribution.

        @[JSON::Field(key: "metricAttribution")]
        getter metric_attribution : Types::MetricAttribution?

        def initialize(
          @metric_attribution : Types::MetricAttribution? = nil
        )
        end
      end


      struct DescribeRecipeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recipe to describe.

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String

        def initialize(
          @recipe_arn : String
        )
        end
      end


      struct DescribeRecipeResponse
        include JSON::Serializable

        # An object that describes the recipe.

        @[JSON::Field(key: "recipe")]
        getter recipe : Types::Recipe?

        def initialize(
          @recipe : Types::Recipe? = nil
        )
        end
      end


      struct DescribeRecommenderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recommender to describe.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String

        def initialize(
          @recommender_arn : String
        )
        end
      end


      struct DescribeRecommenderResponse
        include JSON::Serializable

        # The properties of the recommender.

        @[JSON::Field(key: "recommender")]
        getter recommender : Types::Recommender?

        def initialize(
          @recommender : Types::Recommender? = nil
        )
        end
      end


      struct DescribeSchemaRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schema to retrieve.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String

        def initialize(
          @schema_arn : String
        )
        end
      end


      struct DescribeSchemaResponse
        include JSON::Serializable

        # The requested schema.

        @[JSON::Field(key: "schema")]
        getter schema : Types::DatasetSchema?

        def initialize(
          @schema : Types::DatasetSchema? = nil
        )
        end
      end


      struct DescribeSolutionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the solution to describe.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String

        def initialize(
          @solution_arn : String
        )
        end
      end


      struct DescribeSolutionResponse
        include JSON::Serializable

        # An object that describes the solution.

        @[JSON::Field(key: "solution")]
        getter solution : Types::Solution?

        def initialize(
          @solution : Types::Solution? = nil
        )
        end
      end


      struct DescribeSolutionVersionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the solution version.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String

        def initialize(
          @solution_version_arn : String
        )
        end
      end


      struct DescribeSolutionVersionResponse
        include JSON::Serializable

        # The solution version.

        @[JSON::Field(key: "solutionVersion")]
        getter solution_version : Types::SolutionVersion?

        def initialize(
          @solution_version : Types::SolutionVersion? = nil
        )
        end
      end

      # Describes the parameters of events, which are used in solution creation.

      struct EventParameters
        include JSON::Serializable

        # The name of the event type to be considered for solution creation.

        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # The threshold of the event type. Only events with a value greater or equal to this threshold will be
        # considered for solution creation.

        @[JSON::Field(key: "eventValueThreshold")]
        getter event_value_threshold : Float64?

        # The weight of the event type. A higher weight means higher importance of the event type for the
        # created solution.

        @[JSON::Field(key: "weight")]
        getter weight : Float64?

        def initialize(
          @event_type : String? = nil,
          @event_value_threshold : Float64? = nil,
          @weight : Float64? = nil
        )
        end
      end

      # Provides information about an event tracker.

      struct EventTracker
        include JSON::Serializable

        # The Amazon Web Services account that owns the event tracker.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The date and time (in Unix format) that the event tracker was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset group that receives the event data.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The ARN of the event tracker.

        @[JSON::Field(key: "eventTrackerArn")]
        getter event_tracker_arn : String?

        # The date and time (in Unix time) that the event tracker was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the event tracker.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the event tracker. An event tracker can be in one of the following states: CREATE
        # PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE
        # IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the event tracker. Include this ID in requests to the PutEvents API.

        @[JSON::Field(key: "trackingId")]
        getter tracking_id : String?

        def initialize(
          @account_id : String? = nil,
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @event_tracker_arn : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tracking_id : String? = nil
        )
        end
      end

      # Provides a summary of the properties of an event tracker. For a complete listing, call the
      # DescribeEventTracker API.

      struct EventTrackerSummary
        include JSON::Serializable

        # The date and time (in Unix time) that the event tracker was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the event tracker.

        @[JSON::Field(key: "eventTrackerArn")]
        getter event_tracker_arn : String?

        # The date and time (in Unix time) that the event tracker was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the event tracker.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the event tracker. An event tracker can be in one of the following states: CREATE
        # PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE
        # IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @event_tracker_arn : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the configuration of events, which are used in solution creation.

      struct EventsConfig
        include JSON::Serializable

        # A list of event parameters, which includes event types and their event value thresholds and weights.

        @[JSON::Field(key: "eventParametersList")]
        getter event_parameters_list : Array(Types::EventParameters)?

        def initialize(
          @event_parameters_list : Array(Types::EventParameters)? = nil
        )
        end
      end

      # Provides feature transformation information. Feature transformation is the process of modifying raw
      # input data into a form more suitable for model training.

      struct FeatureTransformation
        include JSON::Serializable

        # The creation date and time (in Unix time) of the feature transformation.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # Provides the default parameters for feature transformation.

        @[JSON::Field(key: "defaultParameters")]
        getter default_parameters : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the FeatureTransformation object.

        @[JSON::Field(key: "featureTransformationArn")]
        getter feature_transformation_arn : String?

        # The last update date and time (in Unix time) of the feature transformation.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the feature transformation.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the feature transformation. A feature transformation can be in one of the following
        # states: CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @default_parameters : Hash(String, String)? = nil,
          @feature_transformation_arn : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A string to string map of the configuration details for theme generation.

      struct FieldsForThemeGeneration
        include JSON::Serializable

        # The name of the Items dataset column that stores the name of each item in the dataset.

        @[JSON::Field(key: "itemName")]
        getter item_name : String

        def initialize(
          @item_name : String
        )
        end
      end

      # Contains information on a recommendation filter, including its ARN, status, and filter expression.

      struct Filter
        include JSON::Serializable

        # The time at which the filter was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The ARN of the dataset group to which the filter belongs.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # If the filter failed, the reason for its failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ARN of the filter.

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # Specifies the type of item interactions to filter out of recommendation results. The filter
        # expression must follow specific format rules. For information about filter expression structure and
        # syntax, see Filter expressions .

        @[JSON::Field(key: "filterExpression")]
        getter filter_expression : String?

        # The time at which the filter was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the filter.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the filter.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @failure_reason : String? = nil,
          @filter_arn : String? = nil,
          @filter_expression : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A short summary of a filter's attributes.

      struct FilterSummary
        include JSON::Serializable

        # The time at which the filter was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The ARN of the dataset group to which the filter belongs.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # If the filter failed, the reason for the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ARN of the filter.

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String?

        # The time at which the filter was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the filter.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the filter.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @failure_reason : String? = nil,
          @filter_arn : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetSolutionMetricsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the solution version for which to get metrics.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String

        def initialize(
          @solution_version_arn : String
        )
        end
      end


      struct GetSolutionMetricsResponse
        include JSON::Serializable

        # The metrics for the solution version. For more information, see Evaluating a solution version with
        # metrics .

        @[JSON::Field(key: "metrics")]
        getter metrics : Hash(String, Float64)?

        # The same solution version ARN as specified in the request.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        def initialize(
          @metrics : Hash(String, Float64)? = nil,
          @solution_version_arn : String? = nil
        )
        end
      end

      # Describes the properties for hyperparameter optimization (HPO).

      struct HPOConfig
        include JSON::Serializable

        # The hyperparameters and their allowable ranges.

        @[JSON::Field(key: "algorithmHyperParameterRanges")]
        getter algorithm_hyper_parameter_ranges : Types::HyperParameterRanges?

        # The metric to optimize during HPO. Amazon Personalize doesn't support configuring the hpoObjective
        # at this time.

        @[JSON::Field(key: "hpoObjective")]
        getter hpo_objective : Types::HPOObjective?

        # Describes the resource configuration for HPO.

        @[JSON::Field(key: "hpoResourceConfig")]
        getter hpo_resource_config : Types::HPOResourceConfig?

        def initialize(
          @algorithm_hyper_parameter_ranges : Types::HyperParameterRanges? = nil,
          @hpo_objective : Types::HPOObjective? = nil,
          @hpo_resource_config : Types::HPOResourceConfig? = nil
        )
        end
      end

      # The metric to optimize during hyperparameter optimization (HPO). Amazon Personalize doesn't support
      # configuring the hpoObjective at this time.

      struct HPOObjective
        include JSON::Serializable

        # The name of the metric.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # A regular expression for finding the metric in the training job logs.

        @[JSON::Field(key: "metricRegex")]
        getter metric_regex : String?

        # The type of the metric. Valid values are Maximize and Minimize .

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @metric_name : String? = nil,
          @metric_regex : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes the resource configuration for hyperparameter optimization (HPO).

      struct HPOResourceConfig
        include JSON::Serializable

        # The maximum number of training jobs when you create a solution version. The maximum value for
        # maxNumberOfTrainingJobs is 40 .

        @[JSON::Field(key: "maxNumberOfTrainingJobs")]
        getter max_number_of_training_jobs : String?

        # The maximum number of parallel training jobs when you create a solution version. The maximum value
        # for maxParallelTrainingJobs is 10 .

        @[JSON::Field(key: "maxParallelTrainingJobs")]
        getter max_parallel_training_jobs : String?

        def initialize(
          @max_number_of_training_jobs : String? = nil,
          @max_parallel_training_jobs : String? = nil
        )
        end
      end

      # Specifies the hyperparameters and their ranges. Hyperparameters can be categorical, continuous, or
      # integer-valued.

      struct HyperParameterRanges
        include JSON::Serializable

        # The categorical hyperparameters and their ranges.

        @[JSON::Field(key: "categoricalHyperParameterRanges")]
        getter categorical_hyper_parameter_ranges : Array(Types::CategoricalHyperParameterRange)?

        # The continuous hyperparameters and their ranges.

        @[JSON::Field(key: "continuousHyperParameterRanges")]
        getter continuous_hyper_parameter_ranges : Array(Types::ContinuousHyperParameterRange)?

        # The integer-valued hyperparameters and their ranges.

        @[JSON::Field(key: "integerHyperParameterRanges")]
        getter integer_hyper_parameter_ranges : Array(Types::IntegerHyperParameterRange)?

        def initialize(
          @categorical_hyper_parameter_ranges : Array(Types::CategoricalHyperParameterRange)? = nil,
          @continuous_hyper_parameter_ranges : Array(Types::ContinuousHyperParameterRange)? = nil,
          @integer_hyper_parameter_ranges : Array(Types::IntegerHyperParameterRange)? = nil
        )
        end
      end

      # Provides the name and range of an integer-valued hyperparameter.

      struct IntegerHyperParameterRange
        include JSON::Serializable

        # The maximum allowable value for the hyperparameter.

        @[JSON::Field(key: "maxValue")]
        getter max_value : Int32?

        # The minimum allowable value for the hyperparameter.

        @[JSON::Field(key: "minValue")]
        getter min_value : Int32?

        # The name of the hyperparameter.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @max_value : Int32? = nil,
          @min_value : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      # Provide a valid value for the field or parameter.

      struct InvalidInputException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The token is not valid.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The limit on the number of requests per second has been exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListBatchInferenceJobsRequest
        include JSON::Serializable

        # The maximum number of batch inference job results to return in each page. The default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the solution version from which the batch inference jobs were
        # created.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @solution_version_arn : String? = nil
        )
        end
      end


      struct ListBatchInferenceJobsResponse
        include JSON::Serializable

        # A list containing information on each job that is returned.

        @[JSON::Field(key: "batchInferenceJobs")]
        getter batch_inference_jobs : Array(Types::BatchInferenceJobSummary)?

        # The token to use to retrieve the next page of results. The value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @batch_inference_jobs : Array(Types::BatchInferenceJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBatchSegmentJobsRequest
        include JSON::Serializable

        # The maximum number of batch segment job results to return in each page. The default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the solution version that the batch segment jobs used to generate
        # batch segments.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @solution_version_arn : String? = nil
        )
        end
      end


      struct ListBatchSegmentJobsResponse
        include JSON::Serializable

        # A list containing information on each job that is returned.

        @[JSON::Field(key: "batchSegmentJobs")]
        getter batch_segment_jobs : Array(Types::BatchSegmentJobSummary)?

        # The token to use to retrieve the next page of results. The value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @batch_segment_jobs : Array(Types::BatchSegmentJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCampaignsRequest
        include JSON::Serializable

        # The maximum number of campaigns to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListCampaigns for getting the next set of campaigns (if
        # they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the solution to list the campaigns for. When a solution is not
        # specified, all the campaigns associated with the account are listed.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @solution_arn : String? = nil
        )
        end
      end


      struct ListCampaignsResponse
        include JSON::Serializable

        # A list of the campaigns.

        @[JSON::Field(key: "campaigns")]
        getter campaigns : Array(Types::CampaignSummary)?

        # A token for getting the next set of campaigns (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @campaigns : Array(Types::CampaignSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataDeletionJobsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group to list data deletion jobs for.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The maximum number of data deletion jobs to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListDataDeletionJobs for getting the next set of jobs (if
        # they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_group_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataDeletionJobsResponse
        include JSON::Serializable

        # The list of data deletion jobs.

        @[JSON::Field(key: "dataDeletionJobs")]
        getter data_deletion_jobs : Array(Types::DataDeletionJobSummary)?

        # A token for getting the next set of data deletion jobs (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_deletion_jobs : Array(Types::DataDeletionJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetExportJobsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset to list the dataset export jobs for.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # The maximum number of dataset export jobs to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListDatasetExportJobs for getting the next set of dataset
        # export jobs (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetExportJobsResponse
        include JSON::Serializable

        # The list of dataset export jobs.

        @[JSON::Field(key: "datasetExportJobs")]
        getter dataset_export_jobs : Array(Types::DatasetExportJobSummary)?

        # A token for getting the next set of dataset export jobs (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_export_jobs : Array(Types::DatasetExportJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetGroupsRequest
        include JSON::Serializable

        # The maximum number of dataset groups to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListDatasetGroups for getting the next set of dataset
        # groups (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetGroupsResponse
        include JSON::Serializable

        # The list of your dataset groups.

        @[JSON::Field(key: "datasetGroups")]
        getter dataset_groups : Array(Types::DatasetGroupSummary)?

        # A token for getting the next set of dataset groups (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_groups : Array(Types::DatasetGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetImportJobsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset to list the dataset import jobs for.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # The maximum number of dataset import jobs to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListDatasetImportJobs for getting the next set of dataset
        # import jobs (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetImportJobsResponse
        include JSON::Serializable

        # The list of dataset import jobs.

        @[JSON::Field(key: "datasetImportJobs")]
        getter dataset_import_jobs : Array(Types::DatasetImportJobSummary)?

        # A token for getting the next set of dataset import jobs (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_import_jobs : Array(Types::DatasetImportJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group that contains the datasets to list.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The maximum number of datasets to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListDatasets for getting the next set of dataset import
        # jobs (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_group_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasetsResponse
        include JSON::Serializable

        # An array of Dataset objects. Each object provides metadata information.

        @[JSON::Field(key: "datasets")]
        getter datasets : Array(Types::DatasetSummary)?

        # A token for getting the next set of datasets (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @datasets : Array(Types::DatasetSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventTrackersRequest
        include JSON::Serializable

        # The ARN of a dataset group used to filter the response.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The maximum number of event trackers to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListEventTrackers for getting the next set of event
        # trackers (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_group_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventTrackersResponse
        include JSON::Serializable

        # A list of event trackers.

        @[JSON::Field(key: "eventTrackers")]
        getter event_trackers : Array(Types::EventTrackerSummary)?

        # A token for getting the next set of event trackers (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_trackers : Array(Types::EventTrackerSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFiltersRequest
        include JSON::Serializable

        # The ARN of the dataset group that contains the filters.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The maximum number of filters to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListFilters for getting the next set of filters (if they
        # exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_group_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFiltersResponse
        include JSON::Serializable

        # A list of returned filters.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::FilterSummary)?

        # A token for getting the next set of filters (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::FilterSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMetricAttributionMetricsRequest
        include JSON::Serializable

        # The maximum number of metrics to return in one page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The Amazon Resource Name (ARN) of the metric attribution to retrieve attributes for.

        @[JSON::Field(key: "metricAttributionArn")]
        getter metric_attribution_arn : String?

        # Specify the pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @metric_attribution_arn : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMetricAttributionMetricsResponse
        include JSON::Serializable

        # The metrics for the specified metric attribution.

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(Types::MetricAttribute)?

        # Specify the pagination token from a previous ListMetricAttributionMetricsResponse request to
        # retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @metrics : Array(Types::MetricAttribute)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMetricAttributionsRequest
        include JSON::Serializable

        # The metric attributions' dataset group Amazon Resource Name (ARN).

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The maximum number of metric attributions to return in one page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_group_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMetricAttributionsResponse
        include JSON::Serializable

        # The list of metric attributions.

        @[JSON::Field(key: "metricAttributions")]
        getter metric_attributions : Array(Types::MetricAttributionSummary)?

        # Specify the pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @metric_attributions : Array(Types::MetricAttributionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecipesRequest
        include JSON::Serializable

        # Filters returned recipes by domain for a Domain dataset group. Only recipes (Domain dataset group
        # use cases) for this domain are included in the response. If you don't specify a domain, all recipes
        # are returned.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        # The maximum number of recipes to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListRecipes for getting the next set of recipes (if they
        # exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The default is SERVICE .

        @[JSON::Field(key: "recipeProvider")]
        getter recipe_provider : String?

        def initialize(
          @domain : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @recipe_provider : String? = nil
        )
        end
      end


      struct ListRecipesResponse
        include JSON::Serializable

        # A token for getting the next set of recipes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of available recipes.

        @[JSON::Field(key: "recipes")]
        getter recipes : Array(Types::RecipeSummary)?

        def initialize(
          @next_token : String? = nil,
          @recipes : Array(Types::RecipeSummary)? = nil
        )
        end
      end


      struct ListRecommendersRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Domain dataset group to list the recommenders for. When a
        # Domain dataset group is not specified, all the recommenders associated with the account are listed.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The maximum number of recommenders to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListRecommenders for getting the next set of recommenders
        # (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_group_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendersResponse
        include JSON::Serializable

        # A token for getting the next set of recommenders (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of the recommenders.

        @[JSON::Field(key: "recommenders")]
        getter recommenders : Array(Types::RecommenderSummary)?

        def initialize(
          @next_token : String? = nil,
          @recommenders : Array(Types::RecommenderSummary)? = nil
        )
        end
      end


      struct ListSchemasRequest
        include JSON::Serializable

        # The maximum number of schemas to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListSchemas for getting the next set of schemas (if they
        # exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSchemasResponse
        include JSON::Serializable

        # A token used to get the next set of schemas (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of schemas.

        @[JSON::Field(key: "schemas")]
        getter schemas : Array(Types::DatasetSchemaSummary)?

        def initialize(
          @next_token : String? = nil,
          @schemas : Array(Types::DatasetSchemaSummary)? = nil
        )
        end
      end


      struct ListSolutionVersionsRequest
        include JSON::Serializable

        # The maximum number of solution versions to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListSolutionVersions for getting the next set of solution
        # versions (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the solution.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @solution_arn : String? = nil
        )
        end
      end


      struct ListSolutionVersionsResponse
        include JSON::Serializable

        # A token for getting the next set of solution versions (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of solution versions describing the version properties.

        @[JSON::Field(key: "solutionVersions")]
        getter solution_versions : Array(Types::SolutionVersionSummary)?

        def initialize(
          @next_token : String? = nil,
          @solution_versions : Array(Types::SolutionVersionSummary)? = nil
        )
        end
      end


      struct ListSolutionsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The maximum number of solutions to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token returned from the previous call to ListSolutions for getting the next set of solutions (if
        # they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_group_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSolutionsResponse
        include JSON::Serializable

        # A token for getting the next set of solutions (if they exist).

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of the current solutions.

        @[JSON::Field(key: "solutions")]
        getter solutions : Array(Types::SolutionSummary)?

        def initialize(
          @next_token : String? = nil,
          @solutions : Array(Types::SolutionSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource's Amazon Resource Name (ARN).

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The resource's tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains information on a metric that a metric attribution reports on. For more information, see
      # Measuring impact of recommendations .

      struct MetricAttribute
        include JSON::Serializable

        # The metric's event type.

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The attribute's expression. Available functions are SUM() or SAMPLECOUNT() . For SUM() functions,
        # provide the dataset type (either Interactions or Items) and column to sum as a parameter. For
        # example SUM(Items.PRICE).

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The metric's name. The name helps you identify the metric in Amazon CloudWatch or Amazon S3.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        def initialize(
          @event_type : String,
          @expression : String,
          @metric_name : String
        )
        end
      end

      # Contains information on a metric attribution. A metric attribution creates reports on the data that
      # you import into Amazon Personalize. Depending on how you import the data, you can view reports in
      # Amazon CloudWatch or Amazon S3. For more information, see Measuring impact of recommendations .

      struct MetricAttribution
        include JSON::Serializable

        # The metric attribution's creation date time.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The metric attribution's dataset group Amazon Resource Name (ARN).

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The metric attribution's failure reason.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The metric attribution's last updated date time.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The metric attribution's Amazon Resource Name (ARN).

        @[JSON::Field(key: "metricAttributionArn")]
        getter metric_attribution_arn : String?

        # The metric attribution's output configuration.

        @[JSON::Field(key: "metricsOutputConfig")]
        getter metrics_output_config : Types::MetricAttributionOutput?

        # The metric attribution's name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The metric attribution's status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @metric_attribution_arn : String? = nil,
          @metrics_output_config : Types::MetricAttributionOutput? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The output configuration details for a metric attribution.

      struct MetricAttributionOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM service role that has permissions to add data to your
        # output Amazon S3 bucket and add metrics to Amazon CloudWatch. For more information, see Measuring
        # impact of recommendations .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String


        @[JSON::Field(key: "s3DataDestination")]
        getter s3_data_destination : Types::S3DataConfig?

        def initialize(
          @role_arn : String,
          @s3_data_destination : Types::S3DataConfig? = nil
        )
        end
      end

      # Provides a summary of the properties of a metric attribution. For a complete listing, call the
      # DescribeMetricAttribution .

      struct MetricAttributionSummary
        include JSON::Serializable

        # The metric attribution's creation date time.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The metric attribution's failure reason.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The metric attribution's last updated date time.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The metric attribution's Amazon Resource Name (ARN).

        @[JSON::Field(key: "metricAttributionArn")]
        getter metric_attribution_arn : String?

        # The name of the metric attribution.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The metric attribution's status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @metric_attribution_arn : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the additional objective for the solution, such as maximizing streaming minutes or
      # increasing revenue. For more information see Optimizing a solution .

      struct OptimizationObjective
        include JSON::Serializable

        # The numerical metadata column in an Items dataset related to the optimization objective. For
        # example, VIDEO_LENGTH (to maximize streaming minutes), or PRICE (to maximize revenue).

        @[JSON::Field(key: "itemAttribute")]
        getter item_attribute : String?

        # Specifies how Amazon Personalize balances the importance of your optimization objective versus
        # relevance.

        @[JSON::Field(key: "objectiveSensitivity")]
        getter objective_sensitivity : String?

        def initialize(
          @item_attribute : String? = nil,
          @objective_sensitivity : String? = nil
        )
        end
      end

      # Provides information about a recipe. Each recipe provides an algorithm that Amazon Personalize uses
      # in model training when you use the CreateSolution operation.

      struct Recipe
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the algorithm that Amazon Personalize uses to train the model.

        @[JSON::Field(key: "algorithmArn")]
        getter algorithm_arn : String?

        # The date and time (in Unix format) that the recipe was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The description of the recipe.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the FeatureTransformation object.

        @[JSON::Field(key: "featureTransformationArn")]
        getter feature_transformation_arn : String?

        # The date and time (in Unix format) that the recipe was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the recipe.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the recipe.

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String?

        # One of the following values: PERSONALIZED_RANKING RELATED_ITEMS USER_PERSONALIZATION

        @[JSON::Field(key: "recipeType")]
        getter recipe_type : String?

        # The status of the recipe.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @algorithm_arn : String? = nil,
          @creation_date_time : Time? = nil,
          @description : String? = nil,
          @feature_transformation_arn : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @recipe_arn : String? = nil,
          @recipe_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the properties of a recipe. For a complete listing, call the DescribeRecipe
      # API.

      struct RecipeSummary
        include JSON::Serializable

        # The date and time (in Unix time) that the recipe was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The domain of the recipe (if the recipe is a Domain dataset group use case).

        @[JSON::Field(key: "domain")]
        getter domain : String?

        # The date and time (in Unix time) that the recipe was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the recipe.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the recipe.

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String?

        # The status of the recipe.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @domain : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @recipe_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes a recommendation generator for a Domain dataset group. You create a recommender in a
      # Domain dataset group for a specific domain use case (domain recipe), and specify the recommender in
      # a GetRecommendations request.

      struct Recommender
        include JSON::Serializable

        # The date and time (in Unix format) that the recommender was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the Domain dataset group that contains the recommender.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # If a recommender fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time (in Unix format) that the recommender was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Provides a summary of the latest updates to the recommender.

        @[JSON::Field(key: "latestRecommenderUpdate")]
        getter latest_recommender_update : Types::RecommenderUpdateSummary?

        # Provides evaluation metrics that help you determine the performance of a recommender. For more
        # information, see Evaluating a recommender .

        @[JSON::Field(key: "modelMetrics")]
        getter model_metrics : Hash(String, Float64)?

        # The name of the recommender.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the recipe (Domain dataset group use case) that the recommender
        # was created for.

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String?

        # The Amazon Resource Name (ARN) of the recommender.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String?

        # The configuration details of the recommender.

        @[JSON::Field(key: "recommenderConfig")]
        getter recommender_config : Types::RecommenderConfig?

        # The status of the recommender. A recommender can be in one of the following states: CREATE PENDING
        # &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED STOP PENDING &gt; STOP IN_PROGRESS &gt;
        # INACTIVE &gt; START PENDING &gt; START IN_PROGRESS &gt; ACTIVE DELETE PENDING &gt; DELETE
        # IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @latest_recommender_update : Types::RecommenderUpdateSummary? = nil,
          @model_metrics : Hash(String, Float64)? = nil,
          @name : String? = nil,
          @recipe_arn : String? = nil,
          @recommender_arn : String? = nil,
          @recommender_config : Types::RecommenderConfig? = nil,
          @status : String? = nil
        )
        end
      end

      # The configuration details of the recommender.

      struct RecommenderConfig
        include JSON::Serializable

        # Whether metadata with recommendations is enabled for the recommender. If enabled, you can specify
        # the columns from your Items dataset in your request for recommendations. Amazon Personalize returns
        # this data for each item in the recommendation response. For information about enabling metadata for
        # a recommender, see Enabling metadata in recommendations for a recommender . If you enable metadata
        # in recommendations, you will incur additional costs. For more information, see Amazon Personalize
        # pricing .

        @[JSON::Field(key: "enableMetadataWithRecommendations")]
        getter enable_metadata_with_recommendations : Bool?

        # Specifies the exploration configuration hyperparameters, including explorationWeight and
        # explorationItemAgeCutOff , you want to use to configure the amount of item exploration Amazon
        # Personalize uses when recommending items. Provide itemExplorationConfig data only if your
        # recommenders generate personalized recommendations for a user (not popular items or similar items).

        @[JSON::Field(key: "itemExplorationConfig")]
        getter item_exploration_config : Hash(String, String)?

        # Specifies the requested minimum provisioned recommendation requests per second that Amazon
        # Personalize will support. A high minRecommendationRequestsPerSecond will increase your bill. We
        # recommend starting with 1 for minRecommendationRequestsPerSecond (the default). Track your usage
        # using Amazon CloudWatch metrics, and increase the minRecommendationRequestsPerSecond as necessary.

        @[JSON::Field(key: "minRecommendationRequestsPerSecond")]
        getter min_recommendation_requests_per_second : Int32?

        # Specifies the training data configuration to use when creating a domain recommender.

        @[JSON::Field(key: "trainingDataConfig")]
        getter training_data_config : Types::TrainingDataConfig?

        def initialize(
          @enable_metadata_with_recommendations : Bool? = nil,
          @item_exploration_config : Hash(String, String)? = nil,
          @min_recommendation_requests_per_second : Int32? = nil,
          @training_data_config : Types::TrainingDataConfig? = nil
        )
        end
      end

      # Provides a summary of the properties of the recommender.

      struct RecommenderSummary
        include JSON::Serializable

        # The date and time (in Unix format) that the recommender was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the Domain dataset group that contains the recommender.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The date and time (in Unix format) that the recommender was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the recommender.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the recipe (Domain dataset group use case) that the recommender
        # was created for.

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String?

        # The Amazon Resource Name (ARN) of the recommender.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String?

        # The configuration details of the recommender.

        @[JSON::Field(key: "recommenderConfig")]
        getter recommender_config : Types::RecommenderConfig?

        # The status of the recommender. A recommender can be in one of the following states: CREATE PENDING
        # &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED STOP PENDING &gt; STOP IN_PROGRESS &gt;
        # INACTIVE &gt; START PENDING &gt; START IN_PROGRESS &gt; ACTIVE DELETE PENDING &gt; DELETE
        # IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @recipe_arn : String? = nil,
          @recommender_arn : String? = nil,
          @recommender_config : Types::RecommenderConfig? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the properties of a recommender update. For a complete listing, call the
      # DescribeRecommender API.

      struct RecommenderUpdateSummary
        include JSON::Serializable

        # The date and time (in Unix format) that the recommender update was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If a recommender update fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time (in Unix time) that the recommender update was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The configuration details of the recommender update.

        @[JSON::Field(key: "recommenderConfig")]
        getter recommender_config : Types::RecommenderConfig?

        # The status of the recommender update. A recommender update can be in one of the following states:
        # CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @recommender_config : Types::RecommenderConfig? = nil,
          @status : String? = nil
        )
        end
      end

      # The specified resource already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource is in use.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Could not find the specified resource.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration details of an Amazon S3 input or output bucket.

      struct S3DataConfig
        include JSON::Serializable

        # The file path of the Amazon S3 bucket.

        @[JSON::Field(key: "path")]
        getter path : String

        # The Amazon Resource Name (ARN) of the Key Management Service (KMS) key that Amazon Personalize uses
        # to encrypt or decrypt the input and output files.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @path : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # By default, all new solutions use automatic training. With automatic training, you incur training
      # costs while your solution is active. To avoid unnecessary costs, when you are finished you can
      # update the solution to turn off automatic training. For information about training costs, see Amazon
      # Personalize pricing . An object that provides information about a solution. A solution includes the
      # custom recipe, customized parameters, and trained models (Solution Versions) that Amazon Personalize
      # uses to generate recommendations. After you create a solution, you can’t change its configuration.
      # If you need to make changes, you can clone the solution with the Amazon Personalize console or
      # create a new one.

      struct Solution
        include JSON::Serializable

        # When performAutoML is true, specifies the best recipe found.

        @[JSON::Field(key: "autoMLResult")]
        getter auto_ml_result : Types::AutoMLResult?

        # The creation date and time (in Unix time) of the solution.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset group that provides the training data.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The event type (for example, 'click' or 'like') that is used for training the model. If no eventType
        # is provided, Amazon Personalize uses all interactions for training with equal weight regardless of
        # type.

        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # The date and time (in Unix time) that the solution was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Provides a summary of the latest updates to the solution.

        @[JSON::Field(key: "latestSolutionUpdate")]
        getter latest_solution_update : Types::SolutionUpdateSummary?

        # Describes the latest version of the solution, including the status and the ARN.

        @[JSON::Field(key: "latestSolutionVersion")]
        getter latest_solution_version : Types::SolutionVersionSummary?

        # The name of the solution.

        @[JSON::Field(key: "name")]
        getter name : String?

        # We don't recommend enabling automated machine learning. Instead, match your use case to the
        # available Amazon Personalize recipes. For more information, see Determining your use case. When
        # true, Amazon Personalize performs a search for the best USER_PERSONALIZATION recipe from the list
        # specified in the solution configuration ( recipeArn must not be specified). When false (the
        # default), Amazon Personalize uses recipeArn for training.

        @[JSON::Field(key: "performAutoML")]
        getter perform_auto_ml : Bool?

        # Specifies whether the solution automatically creates solution versions. The default is True and the
        # solution automatically creates new solution versions every 7 days. For more information about auto
        # training, see Creating and configuring a solution .

        @[JSON::Field(key: "performAutoTraining")]
        getter perform_auto_training : Bool?

        # Whether to perform hyperparameter optimization (HPO) on the chosen recipe. The default is false .

        @[JSON::Field(key: "performHPO")]
        getter perform_hpo : Bool?

        # A Boolean value that indicates whether incremental training updates are performed on the model. When
        # enabled, this allows the model to learn from new data more frequently without requiring full
        # retraining, which enables near real-time personalization. This parameter is supported only for
        # solutions that use the semantic-similarity recipe

        @[JSON::Field(key: "performIncrementalUpdate")]
        getter perform_incremental_update : Bool?

        # The ARN of the recipe used to create the solution. This is required when performAutoML is false.

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String?

        # The ARN of the solution.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String?

        # Describes the configuration properties for the solution.

        @[JSON::Field(key: "solutionConfig")]
        getter solution_config : Types::SolutionConfig?

        # The status of the solution. A solution can be in one of the following states: CREATE PENDING &gt;
        # CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @auto_ml_result : Types::AutoMLResult? = nil,
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @event_type : String? = nil,
          @last_updated_date_time : Time? = nil,
          @latest_solution_update : Types::SolutionUpdateSummary? = nil,
          @latest_solution_version : Types::SolutionVersionSummary? = nil,
          @name : String? = nil,
          @perform_auto_ml : Bool? = nil,
          @perform_auto_training : Bool? = nil,
          @perform_hpo : Bool? = nil,
          @perform_incremental_update : Bool? = nil,
          @recipe_arn : String? = nil,
          @solution_arn : String? = nil,
          @solution_config : Types::SolutionConfig? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the configuration properties for the solution.

      struct SolutionConfig
        include JSON::Serializable

        # Lists the algorithm hyperparameters and their values.

        @[JSON::Field(key: "algorithmHyperParameters")]
        getter algorithm_hyper_parameters : Hash(String, String)?

        # The AutoMLConfig object containing a list of recipes to search when AutoML is performed.

        @[JSON::Field(key: "autoMLConfig")]
        getter auto_ml_config : Types::AutoMLConfig?

        # Specifies the automatic training configuration to use.

        @[JSON::Field(key: "autoTrainingConfig")]
        getter auto_training_config : Types::AutoTrainingConfig?

        # Only events with a value greater than or equal to this threshold are used for training a model.

        @[JSON::Field(key: "eventValueThreshold")]
        getter event_value_threshold : String?

        # Describes the configuration of an event, which includes a list of event parameters. You can specify
        # up to 10 event parameters. Events are used in solution creation.

        @[JSON::Field(key: "eventsConfig")]
        getter events_config : Types::EventsConfig?

        # Lists the feature transformation parameters.

        @[JSON::Field(key: "featureTransformationParameters")]
        getter feature_transformation_parameters : Hash(String, String)?

        # Describes the properties for hyperparameter optimization (HPO).

        @[JSON::Field(key: "hpoConfig")]
        getter hpo_config : Types::HPOConfig?

        # Describes the additional objective for the solution, such as maximizing streaming minutes or
        # increasing revenue. For more information see Optimizing a solution .

        @[JSON::Field(key: "optimizationObjective")]
        getter optimization_objective : Types::OptimizationObjective?

        # Specifies the training data configuration to use when creating a custom solution version (trained
        # model).

        @[JSON::Field(key: "trainingDataConfig")]
        getter training_data_config : Types::TrainingDataConfig?

        def initialize(
          @algorithm_hyper_parameters : Hash(String, String)? = nil,
          @auto_ml_config : Types::AutoMLConfig? = nil,
          @auto_training_config : Types::AutoTrainingConfig? = nil,
          @event_value_threshold : String? = nil,
          @events_config : Types::EventsConfig? = nil,
          @feature_transformation_parameters : Hash(String, String)? = nil,
          @hpo_config : Types::HPOConfig? = nil,
          @optimization_objective : Types::OptimizationObjective? = nil,
          @training_data_config : Types::TrainingDataConfig? = nil
        )
        end
      end

      # Provides a summary of the properties of a solution. For a complete listing, call the
      # DescribeSolution API.

      struct SolutionSummary
        include JSON::Serializable

        # The date and time (in Unix time) that the solution was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The date and time (in Unix time) that the solution was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the solution.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the recipe used by the solution.

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String?

        # The Amazon Resource Name (ARN) of the solution.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String?

        # The status of the solution. A solution can be in one of the following states: CREATE PENDING &gt;
        # CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED DELETE PENDING &gt; DELETE IN_PROGRESS

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @recipe_arn : String? = nil,
          @solution_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The configuration details of the solution update.

      struct SolutionUpdateConfig
        include JSON::Serializable


        @[JSON::Field(key: "autoTrainingConfig")]
        getter auto_training_config : Types::AutoTrainingConfig?

        # Describes the configuration of an event, which includes a list of event parameters. You can specify
        # up to 10 event parameters. Events are used in solution creation.

        @[JSON::Field(key: "eventsConfig")]
        getter events_config : Types::EventsConfig?

        def initialize(
          @auto_training_config : Types::AutoTrainingConfig? = nil,
          @events_config : Types::EventsConfig? = nil
        )
        end
      end

      # Provides a summary of the properties of a solution update. For a complete listing, call the
      # DescribeSolution API.

      struct SolutionUpdateSummary
        include JSON::Serializable

        # The date and time (in Unix format) that the solution update was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If a solution update fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time (in Unix time) that the solution update was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Whether the solution automatically creates solution versions.

        @[JSON::Field(key: "performAutoTraining")]
        getter perform_auto_training : Bool?

        # A Boolean value that indicates whether incremental training updates are performed on the model. When
        # enabled, this allows the model to learn from new data more frequently without requiring full
        # retraining, which enables near real-time personalization. This parameter is supported only for
        # solutions that use the semantic-similarity recipe.

        @[JSON::Field(key: "performIncrementalUpdate")]
        getter perform_incremental_update : Bool?

        # The configuration details of the solution.

        @[JSON::Field(key: "solutionUpdateConfig")]
        getter solution_update_config : Types::SolutionUpdateConfig?

        # The status of the solution update. A solution update can be in one of the following states: CREATE
        # PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @perform_auto_training : Bool? = nil,
          @perform_incremental_update : Bool? = nil,
          @solution_update_config : Types::SolutionUpdateConfig? = nil,
          @status : String? = nil
        )
        end
      end

      # An object that provides information about a specific version of a Solution in a Custom dataset
      # group.

      struct SolutionVersion
        include JSON::Serializable

        # The date and time (in Unix time) that this version of the solution was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) of the dataset group providing the training data.

        @[JSON::Field(key: "datasetGroupArn")]
        getter dataset_group_arn : String?

        # The event type (for example, 'click' or 'like') that is used for training the model.

        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # If training a solution version fails, the reason for the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time (in Unix time) that the solution was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the solution version.

        @[JSON::Field(key: "name")]
        getter name : String?

        # When true, Amazon Personalize searches for the most optimal recipe according to the solution
        # configuration. When false (the default), Amazon Personalize uses recipeArn .

        @[JSON::Field(key: "performAutoML")]
        getter perform_auto_ml : Bool?

        # Whether to perform hyperparameter optimization (HPO) on the chosen recipe. The default is false .

        @[JSON::Field(key: "performHPO")]
        getter perform_hpo : Bool?

        # Whether the solution version should perform an incremental update. When set to true, the training
        # will process only the data that has changed since the latest training, similar to when trainingMode
        # is set to UPDATE. This can only be used with solution versions that use the User-Personalization
        # recipe.

        @[JSON::Field(key: "performIncrementalUpdate")]
        getter perform_incremental_update : Bool?

        # The ARN of the recipe used in the solution.

        @[JSON::Field(key: "recipeArn")]
        getter recipe_arn : String?

        # The ARN of the solution.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String?

        # Describes the configuration properties for the solution.

        @[JSON::Field(key: "solutionConfig")]
        getter solution_config : Types::SolutionConfig?

        # The ARN of the solution version.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        # The status of the solution version. A solution version can be in one of the following states: CREATE
        # PENDING CREATE IN_PROGRESS ACTIVE CREATE FAILED CREATE STOPPING CREATE STOPPED

        @[JSON::Field(key: "status")]
        getter status : String?

        # The time used to train the model. You are billed for the time it takes to train a model. This field
        # is visible only after Amazon Personalize successfully trains a model.

        @[JSON::Field(key: "trainingHours")]
        getter training_hours : Float64?

        # The scope of training to be performed when creating the solution version. A FULL training considers
        # all of the data in your dataset group. An UPDATE processes only the data that has changed since the
        # latest training. Only solution versions created with the User-Personalization recipe can use UPDATE
        # .

        @[JSON::Field(key: "trainingMode")]
        getter training_mode : String?

        # Whether the solution version was created automatically or manually.

        @[JSON::Field(key: "trainingType")]
        getter training_type : String?

        # If hyperparameter optimization was performed, contains the hyperparameter values of the best
        # performing model.

        @[JSON::Field(key: "tunedHPOParams")]
        getter tuned_hpo_params : Types::TunedHPOParams?

        def initialize(
          @creation_date_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @event_type : String? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @perform_auto_ml : Bool? = nil,
          @perform_hpo : Bool? = nil,
          @perform_incremental_update : Bool? = nil,
          @recipe_arn : String? = nil,
          @solution_arn : String? = nil,
          @solution_config : Types::SolutionConfig? = nil,
          @solution_version_arn : String? = nil,
          @status : String? = nil,
          @training_hours : Float64? = nil,
          @training_mode : String? = nil,
          @training_type : String? = nil,
          @tuned_hpo_params : Types::TunedHPOParams? = nil
        )
        end
      end

      # Provides a summary of the properties of a solution version. For a complete listing, call the
      # DescribeSolutionVersion API.

      struct SolutionVersionSummary
        include JSON::Serializable

        # The date and time (in Unix time) that this version of a solution was created.

        @[JSON::Field(key: "creationDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # If a solution version fails, the reason behind the failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time (in Unix time) that the solution version was last updated.

        @[JSON::Field(key: "lastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The Amazon Resource Name (ARN) of the solution version.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        # The status of the solution version. A solution version can be in one of the following states: CREATE
        # PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED

        @[JSON::Field(key: "status")]
        getter status : String?

        # The scope of training to be performed when creating the solution version. A FULL training considers
        # all of the data in your dataset group. An UPDATE processes only the data that has changed since the
        # latest training. Only solution versions created with the User-Personalization recipe can use UPDATE
        # .

        @[JSON::Field(key: "trainingMode")]
        getter training_mode : String?

        # Whether the solution version was created automatically or manually.

        @[JSON::Field(key: "trainingType")]
        getter training_type : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @failure_reason : String? = nil,
          @last_updated_date_time : Time? = nil,
          @solution_version_arn : String? = nil,
          @status : String? = nil,
          @training_mode : String? = nil,
          @training_type : String? = nil
        )
        end
      end


      struct StartRecommenderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recommender to start.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String

        def initialize(
          @recommender_arn : String
        )
        end
      end


      struct StartRecommenderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recommender you started.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String?

        def initialize(
          @recommender_arn : String? = nil
        )
        end
      end


      struct StopRecommenderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recommender to stop.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String

        def initialize(
          @recommender_arn : String
        )
        end
      end


      struct StopRecommenderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recommender you stopped.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String?

        def initialize(
          @recommender_arn : String? = nil
        )
        end
      end


      struct StopSolutionVersionCreationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the solution version you want to stop creating.

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String

        def initialize(
          @solution_version_arn : String
        )
        end
      end

      # The optional metadata that you apply to resources to help you categorize and organize them. Each tag
      # consists of a key and an optional value, both of which you define. For more information see Tagging
      # Amazon Personalize resources .

      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that makes up a tag. A key is a general label that acts like a category
        # for more specific tag values.

        @[JSON::Field(key: "tagKey")]
        getter tag_key : String

        # The optional part of a key-value pair that makes up a tag. A value acts as a descriptor within a tag
        # category (key).

        @[JSON::Field(key: "tagValue")]
        getter tag_value : String

        def initialize(
          @tag_key : String,
          @tag_value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The resource's Amazon Resource Name (ARN).

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Tags to apply to the resource. For more information see Tagging Amazon Personalize resources .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration details for generating themes with a batch inference job.

      struct ThemeGenerationConfig
        include JSON::Serializable

        # Fields used to generate descriptive themes for a batch inference job.

        @[JSON::Field(key: "fieldsForThemeGeneration")]
        getter fields_for_theme_generation : Types::FieldsForThemeGeneration

        def initialize(
          @fields_for_theme_generation : Types::FieldsForThemeGeneration
        )
        end
      end

      # The request contains more tag keys than can be associated with a resource (50 tag keys per
      # resource).

      struct TooManyTagKeysException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have exceeded the maximum number of tags you can apply to this resource.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The training data configuration to use when creating a domain recommender or custom solution version
      # (trained model).

      struct TrainingDataConfig
        include JSON::Serializable

        # Specifies the columns to exclude from training. Each key is a dataset type, and each value is a list
        # of columns. Exclude columns to control what data Amazon Personalize uses to generate
        # recommendations. For example, you might have a column that you want to use only to filter
        # recommendations. You can exclude this column from training and Amazon Personalize considers it only
        # when filtering.

        @[JSON::Field(key: "excludedDatasetColumns")]
        getter excluded_dataset_columns : Hash(String, Array(String))?

        # A map that specifies which columns to include from each dataset during training. The map can contain
        # up to 3 entries, where each key is a dataset name (maximum length of 256 characters, must contain
        # only letters and underscores) and each value is an array of up to 50 column names. Column names can
        # be up to 150 characters long, must start with a letter or underscore, and can contain only letters,
        # numbers, and underscores.

        @[JSON::Field(key: "includedDatasetColumns")]
        getter included_dataset_columns : Hash(String, Array(String))?

        def initialize(
          @excluded_dataset_columns : Hash(String, Array(String))? = nil,
          @included_dataset_columns : Hash(String, Array(String))? = nil
        )
        end
      end

      # If hyperparameter optimization (HPO) was performed, contains the hyperparameter values of the best
      # performing model.

      struct TunedHPOParams
        include JSON::Serializable

        # A list of the hyperparameter values of the best performing model.

        @[JSON::Field(key: "algorithmHyperParameters")]
        getter algorithm_hyper_parameters : Hash(String, String)?

        def initialize(
          @algorithm_hyper_parameters : Hash(String, String)? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The resource's Amazon Resource Name (ARN).

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to be removed.

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


      struct UpdateCampaignRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String

        # The configuration details of a campaign.

        @[JSON::Field(key: "campaignConfig")]
        getter campaign_config : Types::CampaignConfig?

        # Specifies the requested minimum provisioned transactions (recommendations) per second that Amazon
        # Personalize will support. A high minProvisionedTPS will increase your bill. We recommend starting
        # with 1 for minProvisionedTPS (the default). Track your usage using Amazon CloudWatch metrics, and
        # increase the minProvisionedTPS as necessary.

        @[JSON::Field(key: "minProvisionedTPS")]
        getter min_provisioned_tps : Int32?

        # The Amazon Resource Name (ARN) of a new model to deploy. To specify the latest solution version of
        # your solution, specify the ARN of your solution in SolutionArn/$LATEST format. You must use this
        # format if you set syncWithLatestSolutionVersion to True in the CampaignConfig . To deploy a model
        # that isn't the latest solution version of your solution, specify the ARN of the solution version.
        # For more information about automatic campaign updates, see Enabling automatic campaign updates .

        @[JSON::Field(key: "solutionVersionArn")]
        getter solution_version_arn : String?

        def initialize(
          @campaign_arn : String,
          @campaign_config : Types::CampaignConfig? = nil,
          @min_provisioned_tps : Int32? = nil,
          @solution_version_arn : String? = nil
        )
        end
      end


      struct UpdateCampaignResponse
        include JSON::Serializable

        # The same campaign ARN as given in the request.

        @[JSON::Field(key: "campaignArn")]
        getter campaign_arn : String?

        def initialize(
          @campaign_arn : String? = nil
        )
        end
      end


      struct UpdateDatasetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset that you want to update.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String

        # The Amazon Resource Name (ARN) of the new schema you want use.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String

        def initialize(
          @dataset_arn : String,
          @schema_arn : String
        )
        end
      end


      struct UpdateDatasetResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset you updated.

        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        def initialize(
          @dataset_arn : String? = nil
        )
        end
      end


      struct UpdateMetricAttributionRequest
        include JSON::Serializable

        # Add new metric attributes to the metric attribution.

        @[JSON::Field(key: "addMetrics")]
        getter add_metrics : Array(Types::MetricAttribute)?

        # The Amazon Resource Name (ARN) for the metric attribution to update.

        @[JSON::Field(key: "metricAttributionArn")]
        getter metric_attribution_arn : String?

        # An output config for the metric attribution.

        @[JSON::Field(key: "metricsOutputConfig")]
        getter metrics_output_config : Types::MetricAttributionOutput?

        # Remove metric attributes from the metric attribution.

        @[JSON::Field(key: "removeMetrics")]
        getter remove_metrics : Array(String)?

        def initialize(
          @add_metrics : Array(Types::MetricAttribute)? = nil,
          @metric_attribution_arn : String? = nil,
          @metrics_output_config : Types::MetricAttributionOutput? = nil,
          @remove_metrics : Array(String)? = nil
        )
        end
      end


      struct UpdateMetricAttributionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the metric attribution that you updated.

        @[JSON::Field(key: "metricAttributionArn")]
        getter metric_attribution_arn : String?

        def initialize(
          @metric_attribution_arn : String? = nil
        )
        end
      end


      struct UpdateRecommenderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the recommender to modify.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String

        # The configuration details of the recommender.

        @[JSON::Field(key: "recommenderConfig")]
        getter recommender_config : Types::RecommenderConfig

        def initialize(
          @recommender_arn : String,
          @recommender_config : Types::RecommenderConfig
        )
        end
      end


      struct UpdateRecommenderResponse
        include JSON::Serializable

        # The same recommender Amazon Resource Name (ARN) as given in the request.

        @[JSON::Field(key: "recommenderArn")]
        getter recommender_arn : String?

        def initialize(
          @recommender_arn : String? = nil
        )
        end
      end


      struct UpdateSolutionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the solution to update.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String

        # Whether the solution uses automatic training to create new solution versions (trained models). You
        # can change the training frequency by specifying a schedulingExpression in the AutoTrainingConfig as
        # part of solution configuration. If you turn on automatic training, the first automatic training
        # starts within one hour after the solution update completes. If you manually create a solution
        # version within the hour, the solution skips the first automatic training. For more information about
        # automatic training, see Configuring automatic training . After training starts, you can get the
        # solution version's Amazon Resource Name (ARN) with the ListSolutionVersions API operation. To get
        # its status, use the DescribeSolutionVersion .

        @[JSON::Field(key: "performAutoTraining")]
        getter perform_auto_training : Bool?

        # Whether to perform incremental training updates on your model. When enabled, this allows the model
        # to learn from new data more frequently without requiring full retraining, which enables near
        # real-time personalization. This parameter is supported only for solutions that use the
        # semantic-similarity recipe.

        @[JSON::Field(key: "performIncrementalUpdate")]
        getter perform_incremental_update : Bool?

        # The new configuration details of the solution.

        @[JSON::Field(key: "solutionUpdateConfig")]
        getter solution_update_config : Types::SolutionUpdateConfig?

        def initialize(
          @solution_arn : String,
          @perform_auto_training : Bool? = nil,
          @perform_incremental_update : Bool? = nil,
          @solution_update_config : Types::SolutionUpdateConfig? = nil
        )
        end
      end


      struct UpdateSolutionResponse
        include JSON::Serializable

        # The same solution Amazon Resource Name (ARN) as given in the request.

        @[JSON::Field(key: "solutionArn")]
        getter solution_arn : String?

        def initialize(
          @solution_arn : String? = nil
        )
        end
      end
    end
  end
end
