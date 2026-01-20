require "json"

module Aws
  module FraudDetector
    module Types

      # The Account Takeover Insights (ATI) model performance metrics data points.

      struct ATIMetricDataPoint
        include JSON::Serializable

        # The anomaly discovery rate. This metric quantifies the percentage of anomalies that can be detected
        # by the model at the selected score threshold. A lower score threshold increases the percentage of
        # anomalies captured by the model, but would also require challenging a larger percentage of login
        # events, leading to a higher customer friction.

        @[JSON::Field(key: "adr")]
        getter adr : Float64?

        # The account takeover discovery rate. This metric quantifies the percentage of account compromise
        # events that can be detected by the model at the selected score threshold. This metric is only
        # available if 50 or more entities with at-least one labeled account takeover event is present in the
        # ingested dataset.

        @[JSON::Field(key: "atodr")]
        getter atodr : Float64?

        # The challenge rate. This indicates the percentage of login events that the model recommends to
        # challenge such as one-time password, multi-factor authentication, and investigations.

        @[JSON::Field(key: "cr")]
        getter cr : Float64?

        # The model's threshold that specifies an acceptable fraud capture rate. For example, a threshold of
        # 500 means any model score 500 or above is labeled as fraud.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?

        def initialize(
          @adr : Float64? = nil,
          @atodr : Float64? = nil,
          @cr : Float64? = nil,
          @threshold : Float64? = nil
        )
        end
      end

      # The Account Takeover Insights (ATI) model performance score.

      struct ATIModelPerformance
        include JSON::Serializable

        # The anomaly separation index (ASI) score. This metric summarizes the overall ability of the model to
        # separate anomalous activities from the normal behavior. Depending on the business, a large fraction
        # of these anomalous activities can be malicious and correspond to the account takeover attacks. A
        # model with no separability power will have the lowest possible ASI score of 0.5, whereas the a model
        # with a high separability power will have the highest possible ASI score of 1.0

        @[JSON::Field(key: "asi")]
        getter asi : Float64?

        def initialize(
          @asi : Float64? = nil
        )
        end
      end

      # The Account Takeover Insights (ATI) model training metric details.

      struct ATITrainingMetricsValue
        include JSON::Serializable

        # The model's performance metrics data points.

        @[JSON::Field(key: "metricDataPoints")]
        getter metric_data_points : Array(Types::ATIMetricDataPoint)?

        # The model's overall performance scores.

        @[JSON::Field(key: "modelPerformance")]
        getter model_performance : Types::ATIModelPerformance?

        def initialize(
          @metric_data_points : Array(Types::ATIMetricDataPoint)? = nil,
          @model_performance : Types::ATIModelPerformance? = nil
        )
        end
      end

      # An exception indicating Amazon Fraud Detector does not have the needed permissions. This can occur
      # if you submit a request, such as PutExternalModel , that specifies a role that is not in your
      # account.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The log odds metric details. Account Takeover Insights (ATI) model uses event variables from the
      # login data you provide to continuously calculate a set of variables (aggregated variables) based on
      # historical events. For example, your ATI model might calculate the number of times an user has
      # logged in using the same IP address. In this case, event variables used to derive the aggregated
      # variables are IP address and user .

      struct AggregatedLogOddsMetric
        include JSON::Serializable

        # The relative importance of the variables in the list to the other event variable.

        @[JSON::Field(key: "aggregatedVariablesImportance")]
        getter aggregated_variables_importance : Float64

        # The names of all the variables.

        @[JSON::Field(key: "variableNames")]
        getter variable_names : Array(String)

        def initialize(
          @aggregated_variables_importance : Float64,
          @variable_names : Array(String)
        )
        end
      end

      # The details of the impact of aggregated variables on the prediction score. Account Takeover Insights
      # (ATI) model uses the login data you provide to continuously calculate a set of variables (aggregated
      # variables) based on historical events. For example, the model might calculate the number of times an
      # user has logged in using the same IP address. In this case, event variables used to derive the
      # aggregated variables are IP address and user .

      struct AggregatedVariablesImpactExplanation
        include JSON::Serializable

        # The names of all the event variables that were used to derive the aggregated variables.

        @[JSON::Field(key: "eventVariableNames")]
        getter event_variable_names : Array(String)?

        # The raw, uninterpreted value represented as log-odds of the fraud. These values are usually between
        # -10 to +10, but range from -infinity to +infinity. A positive value indicates that the variables
        # drove the risk score up. A negative value indicates that the variables drove the risk score down.

        @[JSON::Field(key: "logOddsImpact")]
        getter log_odds_impact : Float64?

        # The relative impact of the aggregated variables in terms of magnitude on the prediction scores.

        @[JSON::Field(key: "relativeImpact")]
        getter relative_impact : String?

        def initialize(
          @event_variable_names : Array(String)? = nil,
          @log_odds_impact : Float64? = nil,
          @relative_impact : String? = nil
        )
        end
      end

      # The details of the relative importance of the aggregated variables. Account Takeover Insights (ATI)
      # model uses event variables from the login data you provide to continuously calculate a set of
      # variables (aggregated variables) based on historical events. For example, your ATI model might
      # calculate the number of times an user has logged in using the same IP address. In this case, event
      # variables used to derive the aggregated variables are IP address and user .

      struct AggregatedVariablesImportanceMetrics
        include JSON::Serializable

        # List of variables' metrics.

        @[JSON::Field(key: "logOddsMetrics")]
        getter log_odds_metrics : Array(Types::AggregatedLogOddsMetric)?

        def initialize(
          @log_odds_metrics : Array(Types::AggregatedLogOddsMetric)? = nil
        )
        end
      end

      # The metadata of a list.

      struct AllowDenyList
        include JSON::Serializable

        # The name of the list.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the list.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time the list was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The description of the list.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time the list was last updated.

        @[JSON::Field(key: "updatedTime")]
        getter updated_time : String?

        # The variable type of the list.

        @[JSON::Field(key: "variableType")]
        getter variable_type : String?

        def initialize(
          @name : String,
          @arn : String? = nil,
          @created_time : String? = nil,
          @description : String? = nil,
          @updated_time : String? = nil,
          @variable_type : String? = nil
        )
        end
      end

      # Provides the error of the batch create variable API.

      struct BatchCreateVariableError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "code")]
        getter code : Int32?

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @code : Int32? = nil,
          @message : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct BatchCreateVariableRequest
        include JSON::Serializable

        # The list of variables for the batch create variable request.

        @[JSON::Field(key: "variableEntries")]
        getter variable_entries : Array(Types::VariableEntry)

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @variable_entries : Array(Types::VariableEntry),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct BatchCreateVariableResult
        include JSON::Serializable

        # Provides the errors for the BatchCreateVariable request.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchCreateVariableError)?

        def initialize(
          @errors : Array(Types::BatchCreateVariableError)? = nil
        )
        end
      end

      # Provides the error of the batch get variable API.

      struct BatchGetVariableError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "code")]
        getter code : Int32?

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The error name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @code : Int32? = nil,
          @message : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct BatchGetVariableRequest
        include JSON::Serializable

        # The list of variable names to get.

        @[JSON::Field(key: "names")]
        getter names : Array(String)

        def initialize(
          @names : Array(String)
        )
        end
      end


      struct BatchGetVariableResult
        include JSON::Serializable

        # The errors from the request.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetVariableError)?

        # The returned variables.

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::Variable)?

        def initialize(
          @errors : Array(Types::BatchGetVariableError)? = nil,
          @variables : Array(Types::Variable)? = nil
        )
        end
      end

      # The batch import job details.

      struct BatchImport
        include JSON::Serializable

        # The ARN of the batch import job.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Timestamp of when batch import job completed.

        @[JSON::Field(key: "completionTime")]
        getter completion_time : String?

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # The number of records that failed to import.

        @[JSON::Field(key: "failedRecordsCount")]
        getter failed_records_count : Int32?

        # The reason batch import job failed.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ARN of the IAM role to use for this job request.

        @[JSON::Field(key: "iamRoleArn")]
        getter iam_role_arn : String?

        # The Amazon S3 location of your data file for batch import.

        @[JSON::Field(key: "inputPath")]
        getter input_path : String?

        # The ID of the batch import job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The Amazon S3 location of your output file.

        @[JSON::Field(key: "outputPath")]
        getter output_path : String?

        # The number of records processed by batch import job.

        @[JSON::Field(key: "processedRecordsCount")]
        getter processed_records_count : Int32?

        # Timestamp of when the batch import job started.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # The status of the batch import job.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The total number of records in the batch import job.

        @[JSON::Field(key: "totalRecordsCount")]
        getter total_records_count : Int32?

        def initialize(
          @arn : String? = nil,
          @completion_time : String? = nil,
          @event_type_name : String? = nil,
          @failed_records_count : Int32? = nil,
          @failure_reason : String? = nil,
          @iam_role_arn : String? = nil,
          @input_path : String? = nil,
          @job_id : String? = nil,
          @output_path : String? = nil,
          @processed_records_count : Int32? = nil,
          @start_time : String? = nil,
          @status : String? = nil,
          @total_records_count : Int32? = nil
        )
        end
      end

      # The batch prediction details.

      struct BatchPrediction
        include JSON::Serializable

        # The ARN of batch prediction job.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Timestamp of when the batch prediction job completed.

        @[JSON::Field(key: "completionTime")]
        getter completion_time : String?

        # The name of the detector.

        @[JSON::Field(key: "detectorName")]
        getter detector_name : String?

        # The detector version.

        @[JSON::Field(key: "detectorVersion")]
        getter detector_version : String?

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # The reason a batch prediction job failed.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ARN of the IAM role to use for this job request.

        @[JSON::Field(key: "iamRoleArn")]
        getter iam_role_arn : String?

        # The Amazon S3 location of your training file.

        @[JSON::Field(key: "inputPath")]
        getter input_path : String?

        # The job ID for the batch prediction.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # Timestamp of most recent heartbeat indicating the batch prediction job was making progress.

        @[JSON::Field(key: "lastHeartbeatTime")]
        getter last_heartbeat_time : String?

        # The Amazon S3 location of your output file.

        @[JSON::Field(key: "outputPath")]
        getter output_path : String?

        # The number of records processed by the batch prediction job.

        @[JSON::Field(key: "processedRecordsCount")]
        getter processed_records_count : Int32?

        # Timestamp of when the batch prediction job started.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # The batch prediction status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The total number of records in the batch prediction job.

        @[JSON::Field(key: "totalRecordsCount")]
        getter total_records_count : Int32?

        def initialize(
          @arn : String? = nil,
          @completion_time : String? = nil,
          @detector_name : String? = nil,
          @detector_version : String? = nil,
          @event_type_name : String? = nil,
          @failure_reason : String? = nil,
          @iam_role_arn : String? = nil,
          @input_path : String? = nil,
          @job_id : String? = nil,
          @last_heartbeat_time : String? = nil,
          @output_path : String? = nil,
          @processed_records_count : Int32? = nil,
          @start_time : String? = nil,
          @status : String? = nil,
          @total_records_count : Int32? = nil
        )
        end
      end


      struct CancelBatchImportJobRequest
        include JSON::Serializable

        # The ID of an in-progress batch import job to cancel. Amazon Fraud Detector will throw an error if
        # the batch import job is in FAILED , CANCELED , or COMPLETED state.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct CancelBatchImportJobResult
        include JSON::Serializable

        def initialize
        end
      end


      struct CancelBatchPredictionJobRequest
        include JSON::Serializable

        # The ID of the batch prediction job to cancel.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct CancelBatchPredictionJobResult
        include JSON::Serializable

        def initialize
        end
      end

      # An exception indicating there was a conflict during a delete operation.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CreateBatchImportJobRequest
        include JSON::Serializable

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        # The ARN of the IAM role created for Amazon S3 bucket that holds your data file. The IAM role must
        # have read permissions to your input S3 bucket and write permissions to your output S3 bucket. For
        # more information about bucket permissions, see User policy examples in the Amazon S3 User Guide .

        @[JSON::Field(key: "iamRoleArn")]
        getter iam_role_arn : String

        # The URI that points to the Amazon S3 location of your data file.

        @[JSON::Field(key: "inputPath")]
        getter input_path : String

        # The ID of the batch import job. The ID cannot be of a past job, unless the job exists in
        # CREATE_FAILED state.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The URI that points to the Amazon S3 location for storing your results.

        @[JSON::Field(key: "outputPath")]
        getter output_path : String

        # A collection of key-value pairs associated with this request.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @event_type_name : String,
          @iam_role_arn : String,
          @input_path : String,
          @job_id : String,
          @output_path : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateBatchImportJobResult
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateBatchPredictionJobRequest
        include JSON::Serializable

        # The name of the detector.

        @[JSON::Field(key: "detectorName")]
        getter detector_name : String

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        # The ARN of the IAM role to use for this job request. The IAM Role must have read permissions to your
        # input S3 bucket and write permissions to your output S3 bucket. For more information about bucket
        # permissions, see User policy examples in the Amazon S3 User Guide .

        @[JSON::Field(key: "iamRoleArn")]
        getter iam_role_arn : String

        # The Amazon S3 location of your training file.

        @[JSON::Field(key: "inputPath")]
        getter input_path : String

        # The ID of the batch prediction job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The Amazon S3 location of your output file.

        @[JSON::Field(key: "outputPath")]
        getter output_path : String

        # The detector version.

        @[JSON::Field(key: "detectorVersion")]
        getter detector_version : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @detector_name : String,
          @event_type_name : String,
          @iam_role_arn : String,
          @input_path : String,
          @job_id : String,
          @output_path : String,
          @detector_version : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateBatchPredictionJobResult
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateDetectorVersionRequest
        include JSON::Serializable

        # The ID of the detector under which you want to create a new version.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The rules to include in the detector version.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::Rule)

        # The description of the detector version.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Sagemaker model endpoints to include in the detector version.

        @[JSON::Field(key: "externalModelEndpoints")]
        getter external_model_endpoints : Array(String)?

        # The model versions to include in the detector version.

        @[JSON::Field(key: "modelVersions")]
        getter model_versions : Array(Types::ModelVersion)?

        # The rule execution mode for the rules included in the detector version. You can define and edit the
        # rule mode at the detector version level, when it is in draft status. If you specify FIRST_MATCHED ,
        # Amazon Fraud Detector evaluates rules sequentially, first to last, stopping at the first matched
        # rule. Amazon Fraud dectector then provides the outcomes for that single rule. If you specifiy
        # ALL_MATCHED , Amazon Fraud Detector evaluates all rules and returns the outcomes for all matched
        # rules. The default behavior is FIRST_MATCHED .

        @[JSON::Field(key: "ruleExecutionMode")]
        getter rule_execution_mode : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @detector_id : String,
          @rules : Array(Types::Rule),
          @description : String? = nil,
          @external_model_endpoints : Array(String)? = nil,
          @model_versions : Array(Types::ModelVersion)? = nil,
          @rule_execution_mode : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDetectorVersionResult
        include JSON::Serializable

        # The ID for the created version's parent detector.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The ID for the created detector.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String?

        # The status of the detector version.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @detector_id : String? = nil,
          @detector_version_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct CreateListRequest
        include JSON::Serializable

        # The name of the list.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the list.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The names of the elements, if providing. You can also create an empty list and add elements later
        # using the UpdateList API.

        @[JSON::Field(key: "elements")]
        getter elements : Array(String)?

        # A collection of the key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The variable type of the list. You can only assign the variable type with String data type. For more
        # information, see Variable types .

        @[JSON::Field(key: "variableType")]
        getter variable_type : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @elements : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @variable_type : String? = nil
        )
        end
      end


      struct CreateListResult
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateModelRequest
        include JSON::Serializable

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String

        # The model description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @event_type_name : String,
          @model_id : String,
          @model_type : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateModelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateModelVersionRequest
        include JSON::Serializable

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String

        # The training data schema.

        @[JSON::Field(key: "trainingDataSchema")]
        getter training_data_schema : Types::TrainingDataSchema

        # The training data source location in Amazon S3.

        @[JSON::Field(key: "trainingDataSource")]
        getter training_data_source : String

        # Details of the external events data used for model version training. Required if trainingDataSource
        # is EXTERNAL_EVENTS .

        @[JSON::Field(key: "externalEventsDetail")]
        getter external_events_detail : Types::ExternalEventsDetail?

        # Details of the ingested events data used for model version training. Required if trainingDataSource
        # is INGESTED_EVENTS .

        @[JSON::Field(key: "ingestedEventsDetail")]
        getter ingested_events_detail : Types::IngestedEventsDetail?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @model_id : String,
          @model_type : String,
          @training_data_schema : Types::TrainingDataSchema,
          @training_data_source : String,
          @external_events_detail : Types::ExternalEventsDetail? = nil,
          @ingested_events_detail : Types::IngestedEventsDetail? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateModelVersionResult
        include JSON::Serializable

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String?

        # The model version number of the model version created.

        @[JSON::Field(key: "modelVersionNumber")]
        getter model_version_number : String?

        # The model version status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @model_id : String? = nil,
          @model_type : String? = nil,
          @model_version_number : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct CreateRuleRequest
        include JSON::Serializable

        # The detector ID for the rule's parent detector.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The rule expression.

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The language of the rule.

        @[JSON::Field(key: "language")]
        getter language : String

        # The outcome or outcomes returned when the rule expression matches.

        @[JSON::Field(key: "outcomes")]
        getter outcomes : Array(String)

        # The rule ID.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String

        # The rule description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @detector_id : String,
          @expression : String,
          @language : String,
          @outcomes : Array(String),
          @rule_id : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRuleResult
        include JSON::Serializable

        # The created rule.

        @[JSON::Field(key: "rule")]
        getter rule : Types::Rule?

        def initialize(
          @rule : Types::Rule? = nil
        )
        end
      end


      struct CreateVariableRequest
        include JSON::Serializable

        # The source of the data.

        @[JSON::Field(key: "dataSource")]
        getter data_source : String

        # The data type of the variable.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The default value for the variable when no value is received.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String

        # The name of the variable.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The variable type. For more information see Variable types . Valid Values: AUTH_CODE | AVS |
        # BILLING_ADDRESS_L1 | BILLING_ADDRESS_L2 | BILLING_CITY | BILLING_COUNTRY | BILLING_NAME |
        # BILLING_PHONE | BILLING_STATE | BILLING_ZIP | CARD_BIN | CATEGORICAL | CURRENCY_CODE | EMAIL_ADDRESS
        # | FINGERPRINT | FRAUD_LABEL | FREE_FORM_TEXT | IP_ADDRESS | NUMERIC | ORDER_ID | PAYMENT_TYPE |
        # PHONE_NUMBER | PRICE | PRODUCT_CATEGORY | SHIPPING_ADDRESS_L1 | SHIPPING_ADDRESS_L2 | SHIPPING_CITY
        # | SHIPPING_COUNTRY | SHIPPING_NAME | SHIPPING_PHONE | SHIPPING_STATE | SHIPPING_ZIP | USERAGENT

        @[JSON::Field(key: "variableType")]
        getter variable_type : String?

        def initialize(
          @data_source : String,
          @data_type : String,
          @default_value : String,
          @name : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @variable_type : String? = nil
        )
        end
      end


      struct CreateVariableResult
        include JSON::Serializable

        def initialize
        end
      end

      # The model training data validation metrics.

      struct DataValidationMetrics
        include JSON::Serializable

        # The field-specific model training validation messages.

        @[JSON::Field(key: "fieldLevelMessages")]
        getter field_level_messages : Array(Types::FieldValidationMessage)?

        # The file-specific model training data validation messages.

        @[JSON::Field(key: "fileLevelMessages")]
        getter file_level_messages : Array(Types::FileValidationMessage)?

        def initialize(
          @field_level_messages : Array(Types::FieldValidationMessage)? = nil,
          @file_level_messages : Array(Types::FileValidationMessage)? = nil
        )
        end
      end


      struct DeleteBatchImportJobRequest
        include JSON::Serializable

        # The ID of the batch import job to delete.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DeleteBatchImportJobResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteBatchPredictionJobRequest
        include JSON::Serializable

        # The ID of the batch prediction job to delete.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DeleteBatchPredictionJobResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDetectorRequest
        include JSON::Serializable

        # The ID of the detector to delete.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @detector_id : String
        )
        end
      end


      struct DeleteDetectorResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDetectorVersionRequest
        include JSON::Serializable

        # The ID of the parent detector for the detector version to delete.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The ID of the detector version to delete.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String

        def initialize(
          @detector_id : String,
          @detector_version_id : String
        )
        end
      end


      struct DeleteDetectorVersionResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEntityTypeRequest
        include JSON::Serializable

        # The name of the entity type to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteEntityTypeResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEventRequest
        include JSON::Serializable

        # The ID of the event to delete.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        # Specifies whether or not to delete any predictions associated with the event. If set to True ,

        @[JSON::Field(key: "deleteAuditHistory")]
        getter delete_audit_history : Bool?

        def initialize(
          @event_id : String,
          @event_type_name : String,
          @delete_audit_history : Bool? = nil
        )
        end
      end


      struct DeleteEventResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEventTypeRequest
        include JSON::Serializable

        # The name of the event type to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteEventTypeResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEventsByEventTypeRequest
        include JSON::Serializable

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        def initialize(
          @event_type_name : String
        )
        end
      end


      struct DeleteEventsByEventTypeResult
        include JSON::Serializable

        # Name of event type for which to delete the events.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # The status of the delete request.

        @[JSON::Field(key: "eventsDeletionStatus")]
        getter events_deletion_status : String?

        def initialize(
          @event_type_name : String? = nil,
          @events_deletion_status : String? = nil
        )
        end
      end


      struct DeleteExternalModelRequest
        include JSON::Serializable

        # The endpoint of the Amazon Sagemaker model to delete.

        @[JSON::Field(key: "modelEndpoint")]
        getter model_endpoint : String

        def initialize(
          @model_endpoint : String
        )
        end
      end


      struct DeleteExternalModelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLabelRequest
        include JSON::Serializable

        # The name of the label to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteLabelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteListRequest
        include JSON::Serializable

        # The name of the list to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteListResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteModelRequest
        include JSON::Serializable

        # The model ID of the model to delete.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The model type of the model to delete.

        @[JSON::Field(key: "modelType")]
        getter model_type : String

        def initialize(
          @model_id : String,
          @model_type : String
        )
        end
      end


      struct DeleteModelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteModelVersionRequest
        include JSON::Serializable

        # The model ID of the model version to delete.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The model type of the model version to delete.

        @[JSON::Field(key: "modelType")]
        getter model_type : String

        # The model version number of the model version to delete.

        @[JSON::Field(key: "modelVersionNumber")]
        getter model_version_number : String

        def initialize(
          @model_id : String,
          @model_type : String,
          @model_version_number : String
        )
        end
      end


      struct DeleteModelVersionResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteOutcomeRequest
        include JSON::Serializable

        # The name of the outcome to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteOutcomeResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRuleRequest
        include JSON::Serializable


        @[JSON::Field(key: "rule")]
        getter rule : Types::Rule

        def initialize(
          @rule : Types::Rule
        )
        end
      end


      struct DeleteRuleResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteVariableRequest
        include JSON::Serializable

        # The name of the variable to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteVariableResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeDetectorRequest
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The maximum number of results to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token from the previous response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDetectorResult
        include JSON::Serializable

        # The detector ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The status and description for each detector version.

        @[JSON::Field(key: "detectorVersionSummaries")]
        getter detector_version_summaries : Array(Types::DetectorVersionSummary)?

        # The next token to be used for subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @arn : String? = nil,
          @detector_id : String? = nil,
          @detector_version_summaries : Array(Types::DetectorVersionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeModelVersionsRequest
        include JSON::Serializable

        # The maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String?

        # The model version number.

        @[JSON::Field(key: "modelVersionNumber")]
        getter model_version_number : String?

        # The next token from the previous results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @model_id : String? = nil,
          @model_type : String? = nil,
          @model_version_number : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeModelVersionsResult
        include JSON::Serializable

        # The model version details.

        @[JSON::Field(key: "modelVersionDetails")]
        getter model_version_details : Array(Types::ModelVersionDetail)?

        # The next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @model_version_details : Array(Types::ModelVersionDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The detector.

      struct Detector
        include JSON::Serializable

        # The detector ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Timestamp of when the detector was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The detector description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # Timestamp of when the detector was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @description : String? = nil,
          @detector_id : String? = nil,
          @event_type_name : String? = nil,
          @last_updated_time : String? = nil
        )
        end
      end

      # The summary of the detector version.

      struct DetectorVersionSummary
        include JSON::Serializable

        # The detector version description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String?

        # Timestamp of when the detector version was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The detector version status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @detector_version_id : String? = nil,
          @last_updated_time : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The entity details.

      struct Entity
        include JSON::Serializable

        # The entity ID. If you do not know the entityId , you can pass unknown , which is areserved string
        # literal.

        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The entity type.

        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        def initialize(
          @entity_id : String,
          @entity_type : String
        )
        end
      end

      # The entity type details.

      struct EntityType
        include JSON::Serializable

        # The entity type ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Timestamp of when the entity type was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The entity type description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Timestamp of when the entity type was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The entity type name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @description : String? = nil,
          @last_updated_time : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The details of the external (Amazon Sagemaker) model evaluated for generating predictions.

      struct EvaluatedExternalModel
        include JSON::Serializable

        # Input variables use for generating predictions.

        @[JSON::Field(key: "inputVariables")]
        getter input_variables : Hash(String, String)?

        # The endpoint of the external (Amazon Sagemaker) model.

        @[JSON::Field(key: "modelEndpoint")]
        getter model_endpoint : String?

        # Output variables.

        @[JSON::Field(key: "outputVariables")]
        getter output_variables : Hash(String, String)?

        # Indicates whether event variables were used to generate predictions.

        @[JSON::Field(key: "useEventVariables")]
        getter use_event_variables : Bool?

        def initialize(
          @input_variables : Hash(String, String)? = nil,
          @model_endpoint : String? = nil,
          @output_variables : Hash(String, String)? = nil,
          @use_event_variables : Bool? = nil
        )
        end
      end

      # The model version evaluated for generating prediction.

      struct EvaluatedModelVersion
        include JSON::Serializable

        # Evaluations generated for the model version.

        @[JSON::Field(key: "evaluations")]
        getter evaluations : Array(Types::ModelVersionEvaluation)?

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The model type. Valid values: ONLINE_FRAUD_INSIGHTS | TRANSACTION_FRAUD_INSIGHTS

        @[JSON::Field(key: "modelType")]
        getter model_type : String?

        # The model version.

        @[JSON::Field(key: "modelVersion")]
        getter model_version : String?

        def initialize(
          @evaluations : Array(Types::ModelVersionEvaluation)? = nil,
          @model_id : String? = nil,
          @model_type : String? = nil,
          @model_version : String? = nil
        )
        end
      end

      # The details of the rule used for evaluating variable values.

      struct EvaluatedRule
        include JSON::Serializable

        # Indicates whether the rule was evaluated.

        @[JSON::Field(key: "evaluated")]
        getter evaluated : Bool?

        # The rule expression.

        @[JSON::Field(key: "expression")]
        getter expression : String?

        # The rule expression value.

        @[JSON::Field(key: "expressionWithValues")]
        getter expression_with_values : String?

        # Indicates whether the rule matched.

        @[JSON::Field(key: "matched")]
        getter matched : Bool?

        # The rule outcome.

        @[JSON::Field(key: "outcomes")]
        getter outcomes : Array(String)?

        # The rule ID.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        # The rule version.

        @[JSON::Field(key: "ruleVersion")]
        getter rule_version : String?

        def initialize(
          @evaluated : Bool? = nil,
          @expression : String? = nil,
          @expression_with_values : String? = nil,
          @matched : Bool? = nil,
          @outcomes : Array(String)? = nil,
          @rule_id : String? = nil,
          @rule_version : String? = nil
        )
        end
      end

      # The event details.

      struct Event
        include JSON::Serializable

        # The label associated with the event.

        @[JSON::Field(key: "currentLabel")]
        getter current_label : String?

        # The event entities.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::Entity)?

        # The event ID.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The timestamp that defines when the event under evaluation occurred. The timestamp must be specified
        # using ISO 8601 standard in UTC.

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : String?

        # The event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # Names of the event type's variables you defined in Amazon Fraud Detector to represent data elements
        # and their corresponding values for the event you are sending for evaluation.

        @[JSON::Field(key: "eventVariables")]
        getter event_variables : Hash(String, String)?

        # The timestamp associated with the label to update. The timestamp must be specified using ISO 8601
        # standard in UTC.

        @[JSON::Field(key: "labelTimestamp")]
        getter label_timestamp : String?

        def initialize(
          @current_label : String? = nil,
          @entities : Array(Types::Entity)? = nil,
          @event_id : String? = nil,
          @event_timestamp : String? = nil,
          @event_type_name : String? = nil,
          @event_variables : Hash(String, String)? = nil,
          @label_timestamp : String? = nil
        )
        end
      end

      # The event orchestration status.

      struct EventOrchestration
        include JSON::Serializable

        # Specifies if event orchestration is enabled through Amazon EventBridge.

        @[JSON::Field(key: "eventBridgeEnabled")]
        getter event_bridge_enabled : Bool

        def initialize(
          @event_bridge_enabled : Bool
        )
        end
      end

      # Information about the summary of an event prediction.

      struct EventPredictionSummary
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String?

        # The event ID.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The timestamp of the event.

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : String?

        # The event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # The timestamp when the prediction was generated.

        @[JSON::Field(key: "predictionTimestamp")]
        getter prediction_timestamp : String?

        def initialize(
          @detector_id : String? = nil,
          @detector_version_id : String? = nil,
          @event_id : String? = nil,
          @event_timestamp : String? = nil,
          @event_type_name : String? = nil,
          @prediction_timestamp : String? = nil
        )
        end
      end

      # The event type details.

      struct EventType
        include JSON::Serializable

        # The entity type ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Timestamp of when the event type was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The event type description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The event type entity types.

        @[JSON::Field(key: "entityTypes")]
        getter entity_types : Array(String)?

        # If Enabled , Amazon Fraud Detector stores event data when you generate a prediction and uses that
        # data to update calculated variables in near real-time. Amazon Fraud Detector uses this data, known
        # as INGESTED_EVENTS , to train your model and improve fraud predictions.

        @[JSON::Field(key: "eventIngestion")]
        getter event_ingestion : String?

        # The event orchestration status.

        @[JSON::Field(key: "eventOrchestration")]
        getter event_orchestration : Types::EventOrchestration?

        # The event type event variables.

        @[JSON::Field(key: "eventVariables")]
        getter event_variables : Array(String)?

        # Data about the stored events.

        @[JSON::Field(key: "ingestedEventStatistics")]
        getter ingested_event_statistics : Types::IngestedEventStatistics?

        # The event type labels.

        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        # Timestamp of when the event type was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The event type name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @description : String? = nil,
          @entity_types : Array(String)? = nil,
          @event_ingestion : String? = nil,
          @event_orchestration : Types::EventOrchestration? = nil,
          @event_variables : Array(String)? = nil,
          @ingested_event_statistics : Types::IngestedEventStatistics? = nil,
          @labels : Array(String)? = nil,
          @last_updated_time : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about the summary of an event variable that was evaluated for generating prediction.

      struct EventVariableSummary
        include JSON::Serializable

        # The event variable name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The event variable source.

        @[JSON::Field(key: "source")]
        getter source : String?

        # The value of the event variable.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @source : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Details for the external events data used for model version training.

      struct ExternalEventsDetail
        include JSON::Serializable

        # The ARN of the role that provides Amazon Fraud Detector access to the data location.

        @[JSON::Field(key: "dataAccessRoleArn")]
        getter data_access_role_arn : String

        # The Amazon S3 bucket location for the data.

        @[JSON::Field(key: "dataLocation")]
        getter data_location : String

        def initialize(
          @data_access_role_arn : String,
          @data_location : String
        )
        end
      end

      # The Amazon SageMaker model.

      struct ExternalModel
        include JSON::Serializable

        # The model ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Timestamp of when the model was last created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The input configuration.

        @[JSON::Field(key: "inputConfiguration")]
        getter input_configuration : Types::ModelInputConfiguration?

        # The role used to invoke the model.

        @[JSON::Field(key: "invokeModelEndpointRoleArn")]
        getter invoke_model_endpoint_role_arn : String?

        # Timestamp of when the model was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The Amazon SageMaker model endpoints.

        @[JSON::Field(key: "modelEndpoint")]
        getter model_endpoint : String?

        # The Amazon Fraud Detector status for the external model endpoint

        @[JSON::Field(key: "modelEndpointStatus")]
        getter model_endpoint_status : String?

        # The source of the model.

        @[JSON::Field(key: "modelSource")]
        getter model_source : String?

        # The output configuration.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::ModelOutputConfiguration?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @input_configuration : Types::ModelInputConfiguration? = nil,
          @invoke_model_endpoint_role_arn : String? = nil,
          @last_updated_time : String? = nil,
          @model_endpoint : String? = nil,
          @model_endpoint_status : String? = nil,
          @model_source : String? = nil,
          @output_configuration : Types::ModelOutputConfiguration? = nil
        )
        end
      end

      # The fraud prediction scores from Amazon SageMaker model.

      struct ExternalModelOutputs
        include JSON::Serializable

        # The Amazon SageMaker model.

        @[JSON::Field(key: "externalModel")]
        getter external_model : Types::ExternalModelSummary?

        # The fraud prediction scores from Amazon SageMaker model.

        @[JSON::Field(key: "outputs")]
        getter outputs : Hash(String, String)?

        def initialize(
          @external_model : Types::ExternalModelSummary? = nil,
          @outputs : Hash(String, String)? = nil
        )
        end
      end

      # The Amazon SageMaker model.

      struct ExternalModelSummary
        include JSON::Serializable

        # The endpoint of the Amazon SageMaker model.

        @[JSON::Field(key: "modelEndpoint")]
        getter model_endpoint : String?

        # The source of the model.

        @[JSON::Field(key: "modelSource")]
        getter model_source : String?

        def initialize(
          @model_endpoint : String? = nil,
          @model_source : String? = nil
        )
        end
      end

      # The message details.

      struct FieldValidationMessage
        include JSON::Serializable

        # The message content.

        @[JSON::Field(key: "content")]
        getter content : String?

        # The field name.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String?

        # The message ID.

        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        # The message title.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The message type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @content : String? = nil,
          @field_name : String? = nil,
          @identifier : String? = nil,
          @title : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The message details.

      struct FileValidationMessage
        include JSON::Serializable

        # The message content.

        @[JSON::Field(key: "content")]
        getter content : String?

        # The message title.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The message type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @content : String? = nil,
          @title : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A conditional statement for filtering a list of past predictions.

      struct FilterCondition
        include JSON::Serializable

        # A statement containing a resource property and a value to specify filter condition.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @value : String? = nil
        )
        end
      end


      struct GetBatchImportJobsRequest
        include JSON::Serializable

        # The ID of the batch import job to get.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The maximum number of objects to return for request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token from the previous request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBatchImportJobsResult
        include JSON::Serializable

        # An array containing the details of each batch import job.

        @[JSON::Field(key: "batchImports")]
        getter batch_imports : Array(Types::BatchImport)?

        # The next token for the subsequent resquest.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @batch_imports : Array(Types::BatchImport)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBatchPredictionJobsRequest
        include JSON::Serializable

        # The batch prediction job for which to get the details.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token from the previous request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBatchPredictionJobsResult
        include JSON::Serializable

        # An array containing the details of each batch prediction job.

        @[JSON::Field(key: "batchPredictions")]
        getter batch_predictions : Array(Types::BatchPrediction)?

        # The next token for the subsequent request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @batch_predictions : Array(Types::BatchPrediction)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetDeleteEventsByEventTypeStatusRequest
        include JSON::Serializable

        # Name of event type for which to get the deletion status.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        def initialize(
          @event_type_name : String
        )
        end
      end


      struct GetDeleteEventsByEventTypeStatusResult
        include JSON::Serializable

        # The event type name.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # The deletion status.

        @[JSON::Field(key: "eventsDeletionStatus")]
        getter events_deletion_status : String?

        def initialize(
          @event_type_name : String? = nil,
          @events_deletion_status : String? = nil
        )
        end
      end


      struct GetDetectorVersionRequest
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String

        def initialize(
          @detector_id : String,
          @detector_version_id : String
        )
        end
      end


      struct GetDetectorVersionResult
        include JSON::Serializable

        # The detector version ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the detector version was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The detector version description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String?

        # The Amazon SageMaker model endpoints included in the detector version.

        @[JSON::Field(key: "externalModelEndpoints")]
        getter external_model_endpoints : Array(String)?

        # The timestamp when the detector version was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The model versions included in the detector version.

        @[JSON::Field(key: "modelVersions")]
        getter model_versions : Array(Types::ModelVersion)?

        # The execution mode of the rule in the dectector FIRST_MATCHED indicates that Amazon Fraud Detector
        # evaluates rules sequentially, first to last, stopping at the first matched rule. Amazon Fraud
        # dectector then provides the outcomes for that single rule. ALL_MATCHED indicates that Amazon Fraud
        # Detector evaluates all rules and returns the outcomes for all matched rules. You can define and edit
        # the rule mode at the detector version level, when it is in draft status.

        @[JSON::Field(key: "ruleExecutionMode")]
        getter rule_execution_mode : String?

        # The rules included in the detector version.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::Rule)?

        # The status of the detector version.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @description : String? = nil,
          @detector_id : String? = nil,
          @detector_version_id : String? = nil,
          @external_model_endpoints : Array(String)? = nil,
          @last_updated_time : String? = nil,
          @model_versions : Array(Types::ModelVersion)? = nil,
          @rule_execution_mode : String? = nil,
          @rules : Array(Types::Rule)? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetDetectorsRequest
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token for the subsequent request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetDetectorsResult
        include JSON::Serializable

        # The detectors.

        @[JSON::Field(key: "detectors")]
        getter detectors : Array(Types::Detector)?

        # The next page token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detectors : Array(Types::Detector)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEntityTypesRequest
        include JSON::Serializable

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next token for the subsequent request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEntityTypesResult
        include JSON::Serializable

        # An array of entity types.

        @[JSON::Field(key: "entityTypes")]
        getter entity_types : Array(Types::EntityType)?

        # The next page token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entity_types : Array(Types::EntityType)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEventPredictionMetadataRequest
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String

        # The event ID.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The event type associated with the detector specified for the prediction.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        # The timestamp that defines when the prediction was generated. The timestamp must be specified using
        # ISO 8601 standard in UTC. We recommend calling ListEventPredictions first, and using the
        # predictionTimestamp value in the response to provide an accurate prediction timestamp value.

        @[JSON::Field(key: "predictionTimestamp")]
        getter prediction_timestamp : String

        def initialize(
          @detector_id : String,
          @detector_version_id : String,
          @event_id : String,
          @event_type_name : String,
          @prediction_timestamp : String
        )
        end
      end


      struct GetEventPredictionMetadataResult
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String?

        # The status of the detector version.

        @[JSON::Field(key: "detectorVersionStatus")]
        getter detector_version_status : String?

        # The entity ID.

        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The entity type.

        @[JSON::Field(key: "entityType")]
        getter entity_type : String?

        # External (Amazon SageMaker) models that were evaluated for generating predictions.

        @[JSON::Field(key: "evaluatedExternalModels")]
        getter evaluated_external_models : Array(Types::EvaluatedExternalModel)?

        # Model versions that were evaluated for generating predictions.

        @[JSON::Field(key: "evaluatedModelVersions")]
        getter evaluated_model_versions : Array(Types::EvaluatedModelVersion)?

        # The event ID.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The timestamp for when the prediction was generated for the associated event ID.

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : String?

        # The event type associated with the detector specified for this prediction.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # A list of event variables that influenced the prediction scores.

        @[JSON::Field(key: "eventVariables")]
        getter event_variables : Array(Types::EventVariableSummary)?

        # The outcomes of the matched rule, based on the rule execution mode.

        @[JSON::Field(key: "outcomes")]
        getter outcomes : Array(String)?

        # The timestamp that defines when the prediction was generated.

        @[JSON::Field(key: "predictionTimestamp")]
        getter prediction_timestamp : String?

        # The execution mode of the rule used for evaluating variable values.

        @[JSON::Field(key: "ruleExecutionMode")]
        getter rule_execution_mode : String?

        # List of rules associated with the detector version that were used for evaluating variable values.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::EvaluatedRule)?

        def initialize(
          @detector_id : String? = nil,
          @detector_version_id : String? = nil,
          @detector_version_status : String? = nil,
          @entity_id : String? = nil,
          @entity_type : String? = nil,
          @evaluated_external_models : Array(Types::EvaluatedExternalModel)? = nil,
          @evaluated_model_versions : Array(Types::EvaluatedModelVersion)? = nil,
          @event_id : String? = nil,
          @event_timestamp : String? = nil,
          @event_type_name : String? = nil,
          @event_variables : Array(Types::EventVariableSummary)? = nil,
          @outcomes : Array(String)? = nil,
          @prediction_timestamp : String? = nil,
          @rule_execution_mode : String? = nil,
          @rules : Array(Types::EvaluatedRule)? = nil
        )
        end
      end


      struct GetEventPredictionRequest
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The entity type (associated with the detector's event type) and specific entity ID representing who
        # performed the event. If an entity id is not available, use "UNKNOWN."

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::Entity)

        # The unique ID used to identify the event.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # Timestamp that defines when the event under evaluation occurred. The timestamp must be specified
        # using ISO 8601 standard in UTC.

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : String

        # The event type associated with the detector specified for the prediction.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        # Names of the event type's variables you defined in Amazon Fraud Detector to represent data elements
        # and their corresponding values for the event you are sending for evaluation. You must provide at
        # least one eventVariable To ensure most accurate fraud prediction and to simplify your data
        # preparation, Amazon Fraud Detector will replace all missing variables or values as follows: For
        # Amazon Fraud Detector trained models: If a null value is provided explicitly for a variable or if a
        # variable is missing, model will replace the null value or the missing variable (no variable name in
        # the eventVariables map) with calculated default mean/medians for numeric variables and with special
        # values for categorical variables. For imported SageMaker models: If a null value is provided
        # explicitly for a variable, the model and rules will use “null” as the value. If a variable is not
        # provided (no variable name in the eventVariables map), model and rules will use the default value
        # that is provided for the variable.

        @[JSON::Field(key: "eventVariables")]
        getter event_variables : Hash(String, String)

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String?

        # The Amazon SageMaker model endpoint input data blobs.

        @[JSON::Field(key: "externalModelEndpointDataBlobs")]
        getter external_model_endpoint_data_blobs : Hash(String, Types::ModelEndpointDataBlob)?

        def initialize(
          @detector_id : String,
          @entities : Array(Types::Entity),
          @event_id : String,
          @event_timestamp : String,
          @event_type_name : String,
          @event_variables : Hash(String, String),
          @detector_version_id : String? = nil,
          @external_model_endpoint_data_blobs : Hash(String, Types::ModelEndpointDataBlob)? = nil
        )
        end
      end


      struct GetEventPredictionResult
        include JSON::Serializable

        # The model scores for Amazon SageMaker models.

        @[JSON::Field(key: "externalModelOutputs")]
        getter external_model_outputs : Array(Types::ExternalModelOutputs)?

        # The model scores. Amazon Fraud Detector generates model scores between 0 and 1000, where 0 is low
        # fraud risk and 1000 is high fraud risk. Model scores are directly related to the false positive rate
        # (FPR). For example, a score of 600 corresponds to an estimated 10% false positive rate whereas a
        # score of 900 corresponds to an estimated 2% false positive rate.

        @[JSON::Field(key: "modelScores")]
        getter model_scores : Array(Types::ModelScores)?

        # The results from the rules.

        @[JSON::Field(key: "ruleResults")]
        getter rule_results : Array(Types::RuleResult)?

        def initialize(
          @external_model_outputs : Array(Types::ExternalModelOutputs)? = nil,
          @model_scores : Array(Types::ModelScores)? = nil,
          @rule_results : Array(Types::RuleResult)? = nil
        )
        end
      end


      struct GetEventRequest
        include JSON::Serializable

        # The ID of the event to retrieve.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The event type of the event to retrieve.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        def initialize(
          @event_id : String,
          @event_type_name : String
        )
        end
      end


      struct GetEventResult
        include JSON::Serializable

        # The details of the event.

        @[JSON::Field(key: "event")]
        getter event : Types::Event?

        def initialize(
          @event : Types::Event? = nil
        )
        end
      end


      struct GetEventTypesRequest
        include JSON::Serializable

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next token for the subsequent request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEventTypesResult
        include JSON::Serializable

        # An array of event types.

        @[JSON::Field(key: "eventTypes")]
        getter event_types : Array(Types::EventType)?

        # The next page token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_types : Array(Types::EventType)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetExternalModelsRequest
        include JSON::Serializable

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The Amazon SageMaker model endpoint.

        @[JSON::Field(key: "modelEndpoint")]
        getter model_endpoint : String?

        # The next page token for the request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @model_endpoint : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetExternalModelsResult
        include JSON::Serializable

        # Gets the Amazon SageMaker models.

        @[JSON::Field(key: "externalModels")]
        getter external_models : Array(Types::ExternalModel)?

        # The next page token to be used in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @external_models : Array(Types::ExternalModel)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetKMSEncryptionKeyResult
        include JSON::Serializable

        # The KMS encryption key.

        @[JSON::Field(key: "kmsKey")]
        getter kms_key : Types::KMSKey?

        def initialize(
          @kms_key : Types::KMSKey? = nil
        )
        end
      end


      struct GetLabelsRequest
        include JSON::Serializable

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the label or labels to get.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next token for the subsequent request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetLabelsResult
        include JSON::Serializable

        # An array of labels.

        @[JSON::Field(key: "labels")]
        getter labels : Array(Types::Label)?

        # The next page token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @labels : Array(Types::Label)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetListElementsRequest
        include JSON::Serializable

        # The name of the list.

        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token for the subsequent request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetListElementsResult
        include JSON::Serializable

        # The list elements.

        @[JSON::Field(key: "elements")]
        getter elements : Array(String)?

        # The next page token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @elements : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetListsMetadataRequest
        include JSON::Serializable

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the list.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next token for the subsequent request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetListsMetadataResult
        include JSON::Serializable

        # The metadata of the specified list or all lists under the account.

        @[JSON::Field(key: "lists")]
        getter lists : Array(Types::AllowDenyList)?

        # The next page token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @lists : Array(Types::AllowDenyList)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetModelVersionRequest
        include JSON::Serializable

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String

        # The model version number.

        @[JSON::Field(key: "modelVersionNumber")]
        getter model_version_number : String

        def initialize(
          @model_id : String,
          @model_type : String,
          @model_version_number : String
        )
        end
      end


      struct GetModelVersionResult
        include JSON::Serializable

        # The model version ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The details of the external events data used for training the model version. This will be populated
        # if the trainingDataSource is EXTERNAL_EVENTS

        @[JSON::Field(key: "externalEventsDetail")]
        getter external_events_detail : Types::ExternalEventsDetail?

        # The details of the ingested events data used for training the model version. This will be populated
        # if the trainingDataSource is INGESTED_EVENTS .

        @[JSON::Field(key: "ingestedEventsDetail")]
        getter ingested_events_detail : Types::IngestedEventsDetail?

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String?

        # The model version number.

        @[JSON::Field(key: "modelVersionNumber")]
        getter model_version_number : String?

        # The model version status. Possible values are: TRAINING_IN_PROGRESS TRAINING_COMPLETE
        # ACTIVATE_REQUESTED ACTIVATE_IN_PROGRESS ACTIVE INACTIVATE_REQUESTED INACTIVATE_IN_PROGRESS INACTIVE
        # ERROR

        @[JSON::Field(key: "status")]
        getter status : String?

        # The training data schema.

        @[JSON::Field(key: "trainingDataSchema")]
        getter training_data_schema : Types::TrainingDataSchema?

        # The training data source.

        @[JSON::Field(key: "trainingDataSource")]
        getter training_data_source : String?

        def initialize(
          @arn : String? = nil,
          @external_events_detail : Types::ExternalEventsDetail? = nil,
          @ingested_events_detail : Types::IngestedEventsDetail? = nil,
          @model_id : String? = nil,
          @model_type : String? = nil,
          @model_version_number : String? = nil,
          @status : String? = nil,
          @training_data_schema : Types::TrainingDataSchema? = nil,
          @training_data_source : String? = nil
        )
        end
      end


      struct GetModelsRequest
        include JSON::Serializable

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String?

        # The next token for the subsequent request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @model_id : String? = nil,
          @model_type : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetModelsResult
        include JSON::Serializable

        # The array of models.

        @[JSON::Field(key: "models")]
        getter models : Array(Types::Model)?

        # The next page token to be used in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @models : Array(Types::Model)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetOutcomesRequest
        include JSON::Serializable

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the outcome or outcomes to get.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next page token for the request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetOutcomesResult
        include JSON::Serializable

        # The next page token for subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The outcomes.

        @[JSON::Field(key: "outcomes")]
        getter outcomes : Array(Types::Outcome)?

        def initialize(
          @next_token : String? = nil,
          @outcomes : Array(Types::Outcome)? = nil
        )
        end
      end


      struct GetRulesRequest
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The maximum number of rules to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next page token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The rule ID.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        # The rule version.

        @[JSON::Field(key: "ruleVersion")]
        getter rule_version : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @rule_id : String? = nil,
          @rule_version : String? = nil
        )
        end
      end


      struct GetRulesResult
        include JSON::Serializable

        # The next page token to be used in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The details of the requested rule.

        @[JSON::Field(key: "ruleDetails")]
        getter rule_details : Array(Types::RuleDetail)?

        def initialize(
          @next_token : String? = nil,
          @rule_details : Array(Types::RuleDetail)? = nil
        )
        end
      end


      struct GetVariablesRequest
        include JSON::Serializable

        # The max size per page determined for the get variable request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the variable.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next page token of the get variable request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetVariablesResult
        include JSON::Serializable

        # The next page token to be used in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The names of the variables returned.

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::Variable)?

        def initialize(
          @next_token : String? = nil,
          @variables : Array(Types::Variable)? = nil
        )
        end
      end

      # Data about the stored events.

      struct IngestedEventStatistics
        include JSON::Serializable

        # The total size of the stored events.

        @[JSON::Field(key: "eventDataSizeInBytes")]
        getter event_data_size_in_bytes : Int64?

        # Timestamp of when the stored event was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The oldest stored event.

        @[JSON::Field(key: "leastRecentEvent")]
        getter least_recent_event : String?

        # The newest stored event.

        @[JSON::Field(key: "mostRecentEvent")]
        getter most_recent_event : String?

        # The number of stored events.

        @[JSON::Field(key: "numberOfEvents")]
        getter number_of_events : Int64?

        def initialize(
          @event_data_size_in_bytes : Int64? = nil,
          @last_updated_time : String? = nil,
          @least_recent_event : String? = nil,
          @most_recent_event : String? = nil,
          @number_of_events : Int64? = nil
        )
        end
      end

      # The details of the ingested event.

      struct IngestedEventsDetail
        include JSON::Serializable

        # The start and stop time of the ingested events.

        @[JSON::Field(key: "ingestedEventsTimeWindow")]
        getter ingested_events_time_window : Types::IngestedEventsTimeWindow

        def initialize(
          @ingested_events_time_window : Types::IngestedEventsTimeWindow
        )
        end
      end

      # The start and stop time of the ingested events.

      struct IngestedEventsTimeWindow
        include JSON::Serializable

        # Timestamp of the final ingested event.

        @[JSON::Field(key: "endTime")]
        getter end_time : String

        # Timestamp of the first ingensted event.

        @[JSON::Field(key: "startTime")]
        getter start_time : String

        def initialize(
          @end_time : String,
          @start_time : String
        )
        end
      end

      # An exception indicating an internal server error.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The KMS key details.

      struct KMSKey
        include JSON::Serializable

        # The encryption key ARN.

        @[JSON::Field(key: "kmsEncryptionKeyArn")]
        getter kms_encryption_key_arn : String?

        def initialize(
          @kms_encryption_key_arn : String? = nil
        )
        end
      end

      # The label details.

      struct Label
        include JSON::Serializable

        # The label ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Timestamp of when the event type was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The label description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Timestamp of when the label was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The label name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @description : String? = nil,
          @last_updated_time : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The label schema.

      struct LabelSchema
        include JSON::Serializable

        # The label mapper maps the Amazon Fraud Detector supported model classification labels ( FRAUD ,
        # LEGIT ) to the appropriate event type labels. For example, if " FRAUD " and " LEGIT " are Amazon
        # Fraud Detector supported labels, this mapper could be: {"FRAUD" =&gt; ["0"] , "LEGIT" =&gt; ["1"]}
        # or {"FRAUD" =&gt; ["false"] , "LEGIT" =&gt; ["true"]} or {"FRAUD" =&gt; ["fraud", "abuse"] , "LEGIT"
        # =&gt; ["legit", "safe"]} . The value part of the mapper is a list, because you may have multiple
        # label variants from your event type for a single Amazon Fraud Detector label.

        @[JSON::Field(key: "labelMapper")]
        getter label_mapper : Hash(String, Array(String))?

        # The action to take for unlabeled events. Use IGNORE if you want the unlabeled events to be ignored.
        # This is recommended when the majority of the events in the dataset are labeled. Use FRAUD if you
        # want to categorize all unlabeled events as “Fraud”. This is recommended when most of the events in
        # your dataset are fraudulent. Use LEGIT if you want to categorize all unlabeled events as “Legit”.
        # This is recommended when most of the events in your dataset are legitimate. Use AUTO if you want
        # Amazon Fraud Detector to decide how to use the unlabeled data. This is recommended when there is
        # significant unlabeled events in the dataset. By default, Amazon Fraud Detector ignores the unlabeled
        # data.

        @[JSON::Field(key: "unlabeledEventsTreatment")]
        getter unlabeled_events_treatment : String?

        def initialize(
          @label_mapper : Hash(String, Array(String))? = nil,
          @unlabeled_events_treatment : String? = nil
        )
        end
      end


      struct ListEventPredictionsRequest
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : Types::FilterCondition?

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : Types::FilterCondition?

        # The event ID.

        @[JSON::Field(key: "eventId")]
        getter event_id : Types::FilterCondition?

        # The event type associated with the detector.

        @[JSON::Field(key: "eventType")]
        getter event_type : Types::FilterCondition?

        # The maximum number of predictions to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return. Use the token to make the call again to retrieve the
        # next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The time period for when the predictions were generated.

        @[JSON::Field(key: "predictionTimeRange")]
        getter prediction_time_range : Types::PredictionTimeRange?

        def initialize(
          @detector_id : Types::FilterCondition? = nil,
          @detector_version_id : Types::FilterCondition? = nil,
          @event_id : Types::FilterCondition? = nil,
          @event_type : Types::FilterCondition? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @prediction_time_range : Types::PredictionTimeRange? = nil
        )
        end
      end


      struct ListEventPredictionsResult
        include JSON::Serializable

        # The summary of the past predictions.

        @[JSON::Field(key: "eventPredictionSummaries")]
        getter event_prediction_summaries : Array(Types::EventPredictionSummary)?

        # Identifies the next page of results to return. Use the token to make the call again to retrieve the
        # next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_prediction_summaries : Array(Types::EventPredictionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN that specifies the resource whose tags you want to list.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # The maximum number of objects to return for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token from the previous results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResult
        include JSON::Serializable

        # The next token for subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The log odds metric details.

      struct LogOddsMetric
        include JSON::Serializable

        # The relative importance of the variable. For more information, see Model variable importance .

        @[JSON::Field(key: "variableImportance")]
        getter variable_importance : Float64

        # The name of the variable.

        @[JSON::Field(key: "variableName")]
        getter variable_name : String

        # The type of variable.

        @[JSON::Field(key: "variableType")]
        getter variable_type : String

        def initialize(
          @variable_importance : Float64,
          @variable_name : String,
          @variable_type : String
        )
        end
      end

      # Model performance metrics data points.

      struct MetricDataPoint
        include JSON::Serializable

        # The false positive rate. This is the percentage of total legitimate events that are incorrectly
        # predicted as fraud.

        @[JSON::Field(key: "fpr")]
        getter fpr : Float64?

        # The percentage of fraud events correctly predicted as fraudulent as compared to all events predicted
        # as fraudulent.

        @[JSON::Field(key: "precision")]
        getter precision : Float64?

        # The model threshold that specifies an acceptable fraud capture rate. For example, a threshold of 500
        # means any model score 500 or above is labeled as fraud.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?

        # The true positive rate. This is the percentage of total fraud the model detects. Also known as
        # capture rate.

        @[JSON::Field(key: "tpr")]
        getter tpr : Float64?

        def initialize(
          @fpr : Float64? = nil,
          @precision : Float64? = nil,
          @threshold : Float64? = nil,
          @tpr : Float64? = nil
        )
        end
      end

      # The model.

      struct Model
        include JSON::Serializable

        # The ARN of the model.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Timestamp of when the model was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The model description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # Timestamp of last time the model was updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @description : String? = nil,
          @event_type_name : String? = nil,
          @last_updated_time : String? = nil,
          @model_id : String? = nil,
          @model_type : String? = nil
        )
        end
      end

      # A pre-formed Amazon SageMaker model input you can include if your detector version includes an
      # imported Amazon SageMaker model endpoint with pass-through input configuration.

      struct ModelEndpointDataBlob
        include JSON::Serializable

        # The byte buffer of the Amazon SageMaker model endpoint input data blob.

        @[JSON::Field(key: "byteBuffer")]
        getter byte_buffer : Bytes?

        # The content type of the Amazon SageMaker model endpoint input data blob.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        def initialize(
          @byte_buffer : Bytes? = nil,
          @content_type : String? = nil
        )
        end
      end

      # The Amazon SageMaker model input configuration.

      struct ModelInputConfiguration
        include JSON::Serializable

        # The event variables.

        @[JSON::Field(key: "useEventVariables")]
        getter use_event_variables : Bool

        # Template for constructing the CSV input-data sent to SageMaker. At event-evaluation, the
        # placeholders for variable-names in the template will be replaced with the variable values before
        # being sent to SageMaker.

        @[JSON::Field(key: "csvInputTemplate")]
        getter csv_input_template : String?

        # The event type name.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String?

        # The format of the model input configuration. The format differs depending on if it is passed through
        # to SageMaker or constructed by Amazon Fraud Detector.

        @[JSON::Field(key: "format")]
        getter format : String?

        # Template for constructing the JSON input-data sent to SageMaker. At event-evaluation, the
        # placeholders for variable names in the template will be replaced with the variable values before
        # being sent to SageMaker.

        @[JSON::Field(key: "jsonInputTemplate")]
        getter json_input_template : String?

        def initialize(
          @use_event_variables : Bool,
          @csv_input_template : String? = nil,
          @event_type_name : String? = nil,
          @format : String? = nil,
          @json_input_template : String? = nil
        )
        end
      end

      # Provides the Amazon Sagemaker model output configuration.

      struct ModelOutputConfiguration
        include JSON::Serializable

        # The format of the model output configuration.

        @[JSON::Field(key: "format")]
        getter format : String

        # A map of CSV index values in the SageMaker response to the Amazon Fraud Detector variables.

        @[JSON::Field(key: "csvIndexToVariableMap")]
        getter csv_index_to_variable_map : Hash(String, String)?

        # A map of JSON keys in response from SageMaker to the Amazon Fraud Detector variables.

        @[JSON::Field(key: "jsonKeyToVariableMap")]
        getter json_key_to_variable_map : Hash(String, String)?

        def initialize(
          @format : String,
          @csv_index_to_variable_map : Hash(String, String)? = nil,
          @json_key_to_variable_map : Hash(String, String)? = nil
        )
        end
      end

      # The fraud prediction scores.

      struct ModelScores
        include JSON::Serializable

        # The model version.

        @[JSON::Field(key: "modelVersion")]
        getter model_version : Types::ModelVersion?

        # The model's fraud prediction scores.

        @[JSON::Field(key: "scores")]
        getter scores : Hash(String, Float64)?

        def initialize(
          @model_version : Types::ModelVersion? = nil,
          @scores : Hash(String, Float64)? = nil
        )
        end
      end

      # The model version.

      struct ModelVersion
        include JSON::Serializable

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String

        # The model version number.

        @[JSON::Field(key: "modelVersionNumber")]
        getter model_version_number : String

        # The model version ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @model_id : String,
          @model_type : String,
          @model_version_number : String,
          @arn : String? = nil
        )
        end
      end

      # The details of the model version.

      struct ModelVersionDetail
        include JSON::Serializable

        # The model version ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the model was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The external events data details. This will be populated if the trainingDataSource for the model
        # version is specified as EXTERNAL_EVENTS .

        @[JSON::Field(key: "externalEventsDetail")]
        getter external_events_detail : Types::ExternalEventsDetail?

        # The ingested events data details. This will be populated if the trainingDataSource for the model
        # version is specified as INGESTED_EVENTS .

        @[JSON::Field(key: "ingestedEventsDetail")]
        getter ingested_events_detail : Types::IngestedEventsDetail?

        # The timestamp when the model was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String?

        # The model version number.

        @[JSON::Field(key: "modelVersionNumber")]
        getter model_version_number : String?

        # The status of the model version.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The training data schema.

        @[JSON::Field(key: "trainingDataSchema")]
        getter training_data_schema : Types::TrainingDataSchema?

        # The model version training data source.

        @[JSON::Field(key: "trainingDataSource")]
        getter training_data_source : String?

        # The training results.

        @[JSON::Field(key: "trainingResult")]
        getter training_result : Types::TrainingResult?

        # The training result details. The details include the relative importance of the variables.

        @[JSON::Field(key: "trainingResultV2")]
        getter training_result_v2 : Types::TrainingResultV2?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @external_events_detail : Types::ExternalEventsDetail? = nil,
          @ingested_events_detail : Types::IngestedEventsDetail? = nil,
          @last_updated_time : String? = nil,
          @model_id : String? = nil,
          @model_type : String? = nil,
          @model_version_number : String? = nil,
          @status : String? = nil,
          @training_data_schema : Types::TrainingDataSchema? = nil,
          @training_data_source : String? = nil,
          @training_result : Types::TrainingResult? = nil,
          @training_result_v2 : Types::TrainingResultV2? = nil
        )
        end
      end

      # The model version evalutions.

      struct ModelVersionEvaluation
        include JSON::Serializable

        # The evaluation score generated for the model version.

        @[JSON::Field(key: "evaluationScore")]
        getter evaluation_score : String?

        # The output variable name.

        @[JSON::Field(key: "outputVariableName")]
        getter output_variable_name : String?

        # The prediction explanations generated for the model version.

        @[JSON::Field(key: "predictionExplanations")]
        getter prediction_explanations : Types::PredictionExplanations?

        def initialize(
          @evaluation_score : String? = nil,
          @output_variable_name : String? = nil,
          @prediction_explanations : Types::PredictionExplanations? = nil
        )
        end
      end

      # The Online Fraud Insights (OFI) model performance metrics data points.

      struct OFIMetricDataPoint
        include JSON::Serializable

        # The false positive rate. This is the percentage of total legitimate events that are incorrectly
        # predicted as fraud.

        @[JSON::Field(key: "fpr")]
        getter fpr : Float64?

        # The percentage of fraud events correctly predicted as fraudulent as compared to all events predicted
        # as fraudulent.

        @[JSON::Field(key: "precision")]
        getter precision : Float64?

        # The model threshold that specifies an acceptable fraud capture rate. For example, a threshold of 500
        # means any model score 500 or above is labeled as fraud.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?

        # The true positive rate. This is the percentage of total fraud the model detects. Also known as
        # capture rate.

        @[JSON::Field(key: "tpr")]
        getter tpr : Float64?

        def initialize(
          @fpr : Float64? = nil,
          @precision : Float64? = nil,
          @threshold : Float64? = nil,
          @tpr : Float64? = nil
        )
        end
      end

      # The Online Fraud Insights (OFI) model performance score.

      struct OFIModelPerformance
        include JSON::Serializable

        # The area under the curve (auc). This summarizes the total positive rate (tpr) and false positive
        # rate (FPR) across all possible model score thresholds.

        @[JSON::Field(key: "auc")]
        getter auc : Float64?

        # Indicates the range of area under curve (auc) expected from the OFI model. A range greater than 0.1
        # indicates higher model uncertainity.

        @[JSON::Field(key: "uncertaintyRange")]
        getter uncertainty_range : Types::UncertaintyRange?

        def initialize(
          @auc : Float64? = nil,
          @uncertainty_range : Types::UncertaintyRange? = nil
        )
        end
      end

      # The Online Fraud Insights (OFI) model training metric details.

      struct OFITrainingMetricsValue
        include JSON::Serializable

        # The model's performance metrics data points.

        @[JSON::Field(key: "metricDataPoints")]
        getter metric_data_points : Array(Types::OFIMetricDataPoint)?

        # The model's overall performance score.

        @[JSON::Field(key: "modelPerformance")]
        getter model_performance : Types::OFIModelPerformance?

        def initialize(
          @metric_data_points : Array(Types::OFIMetricDataPoint)? = nil,
          @model_performance : Types::OFIModelPerformance? = nil
        )
        end
      end

      # The outcome.

      struct Outcome
        include JSON::Serializable

        # The outcome ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the outcome was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The outcome description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp when the outcome was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The outcome name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @description : String? = nil,
          @last_updated_time : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The prediction explanations that provide insight into how each event variable impacted the model
      # version's fraud prediction score.

      struct PredictionExplanations
        include JSON::Serializable

        # The details of the aggregated variables impact on the prediction score. Account Takeover Insights
        # (ATI) model uses event variables from the login data you provide to continuously calculate a set of
        # variables (aggregated variables) based on historical events. For example, your ATI model might
        # calculate the number of times an user has logged in using the same IP address. In this case, event
        # variables used to derive the aggregated variables are IP address and user .

        @[JSON::Field(key: "aggregatedVariablesImpactExplanations")]
        getter aggregated_variables_impact_explanations : Array(Types::AggregatedVariablesImpactExplanation)?

        # The details of the event variable's impact on the prediction score.

        @[JSON::Field(key: "variableImpactExplanations")]
        getter variable_impact_explanations : Array(Types::VariableImpactExplanation)?

        def initialize(
          @aggregated_variables_impact_explanations : Array(Types::AggregatedVariablesImpactExplanation)? = nil,
          @variable_impact_explanations : Array(Types::VariableImpactExplanation)? = nil
        )
        end
      end

      # The time period for when the predictions were generated.

      struct PredictionTimeRange
        include JSON::Serializable

        # The end time of the time period for when the predictions were generated.

        @[JSON::Field(key: "endTime")]
        getter end_time : String

        # The start time of the time period for when the predictions were generated.

        @[JSON::Field(key: "startTime")]
        getter start_time : String

        def initialize(
          @end_time : String,
          @start_time : String
        )
        end
      end


      struct PutDetectorRequest
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The name of the event type.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        # The description of the detector.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @detector_id : String,
          @event_type_name : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutDetectorResult
        include JSON::Serializable

        def initialize
        end
      end


      struct PutEntityTypeRequest
        include JSON::Serializable

        # The name of the entity type.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutEntityTypeResult
        include JSON::Serializable

        def initialize
        end
      end


      struct PutEventTypeRequest
        include JSON::Serializable

        # The entity type for the event type. Example entity types: customer, merchant, account.

        @[JSON::Field(key: "entityTypes")]
        getter entity_types : Array(String)

        # The event type variables.

        @[JSON::Field(key: "eventVariables")]
        getter event_variables : Array(String)

        # The name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the event type.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies if ingestion is enabled or disabled.

        @[JSON::Field(key: "eventIngestion")]
        getter event_ingestion : String?

        # Enables or disables event orchestration. If enabled, you can send event predictions to select AWS
        # services for downstream processing of the events.

        @[JSON::Field(key: "eventOrchestration")]
        getter event_orchestration : Types::EventOrchestration?

        # The event type labels.

        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @entity_types : Array(String),
          @event_variables : Array(String),
          @name : String,
          @description : String? = nil,
          @event_ingestion : String? = nil,
          @event_orchestration : Types::EventOrchestration? = nil,
          @labels : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutEventTypeResult
        include JSON::Serializable

        def initialize
        end
      end


      struct PutExternalModelRequest
        include JSON::Serializable

        # The model endpoint input configuration.

        @[JSON::Field(key: "inputConfiguration")]
        getter input_configuration : Types::ModelInputConfiguration

        # The IAM role used to invoke the model endpoint.

        @[JSON::Field(key: "invokeModelEndpointRoleArn")]
        getter invoke_model_endpoint_role_arn : String

        # The model endpoints name.

        @[JSON::Field(key: "modelEndpoint")]
        getter model_endpoint : String

        # The model endpoint’s status in Amazon Fraud Detector.

        @[JSON::Field(key: "modelEndpointStatus")]
        getter model_endpoint_status : String

        # The source of the model.

        @[JSON::Field(key: "modelSource")]
        getter model_source : String

        # The model endpoint output configuration.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::ModelOutputConfiguration

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @input_configuration : Types::ModelInputConfiguration,
          @invoke_model_endpoint_role_arn : String,
          @model_endpoint : String,
          @model_endpoint_status : String,
          @model_source : String,
          @output_configuration : Types::ModelOutputConfiguration,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutExternalModelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct PutKMSEncryptionKeyRequest
        include JSON::Serializable

        # The KMS encryption key ARN. The KMS key must be single-Region key. Amazon Fraud Detector does not
        # support multi-Region KMS key.

        @[JSON::Field(key: "kmsEncryptionKeyArn")]
        getter kms_encryption_key_arn : String

        def initialize(
          @kms_encryption_key_arn : String
        )
        end
      end


      struct PutKMSEncryptionKeyResult
        include JSON::Serializable

        def initialize
        end
      end


      struct PutLabelRequest
        include JSON::Serializable

        # The label name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The label description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutLabelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct PutOutcomeRequest
        include JSON::Serializable

        # The name of the outcome.

        @[JSON::Field(key: "name")]
        getter name : String

        # The outcome description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutOutcomeResult
        include JSON::Serializable

        def initialize
        end
      end

      # An exception indicating the specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An exception indicating that the attached customer-owned (external) model threw an exception when
      # Amazon Fraud Detector invoked the model.

      struct ResourceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A rule.

      struct Rule
        include JSON::Serializable

        # The detector for which the rule is associated.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The rule ID.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String

        # The rule version.

        @[JSON::Field(key: "ruleVersion")]
        getter rule_version : String

        def initialize(
          @detector_id : String,
          @rule_id : String,
          @rule_version : String
        )
        end
      end

      # The details of the rule.

      struct RuleDetail
        include JSON::Serializable

        # The rule ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp of when the rule was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The rule description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The detector for which the rule is associated.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The rule expression.

        @[JSON::Field(key: "expression")]
        getter expression : String?

        # The rule language.

        @[JSON::Field(key: "language")]
        getter language : String?

        # Timestamp of the last time the rule was updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The rule outcomes.

        @[JSON::Field(key: "outcomes")]
        getter outcomes : Array(String)?

        # The rule ID.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        # The rule version.

        @[JSON::Field(key: "ruleVersion")]
        getter rule_version : String?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @description : String? = nil,
          @detector_id : String? = nil,
          @expression : String? = nil,
          @language : String? = nil,
          @last_updated_time : String? = nil,
          @outcomes : Array(String)? = nil,
          @rule_id : String? = nil,
          @rule_version : String? = nil
        )
        end
      end

      # The rule results.

      struct RuleResult
        include JSON::Serializable

        # The outcomes of the matched rule, based on the rule execution mode.

        @[JSON::Field(key: "outcomes")]
        getter outcomes : Array(String)?

        # The rule ID that was matched, based on the rule execution mode.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        def initialize(
          @outcomes : Array(String)? = nil,
          @rule_id : String? = nil
        )
        end
      end


      struct SendEventRequest
        include JSON::Serializable

        # An array of entities.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::Entity)

        # The event ID to upload.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The timestamp that defines when the event under evaluation occurred. The timestamp must be specified
        # using ISO 8601 standard in UTC.

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : String

        # The event type name of the event.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        # Names of the event type's variables you defined in Amazon Fraud Detector to represent data elements
        # and their corresponding values for the event you are sending for evaluation.

        @[JSON::Field(key: "eventVariables")]
        getter event_variables : Hash(String, String)

        # The label to associate with the event. Required if specifying labelTimestamp .

        @[JSON::Field(key: "assignedLabel")]
        getter assigned_label : String?

        # The timestamp associated with the label. Required if specifying assignedLabel .

        @[JSON::Field(key: "labelTimestamp")]
        getter label_timestamp : String?

        def initialize(
          @entities : Array(Types::Entity),
          @event_id : String,
          @event_timestamp : String,
          @event_type_name : String,
          @event_variables : Hash(String, String),
          @assigned_label : String? = nil,
          @label_timestamp : String? = nil
        )
        end
      end


      struct SendEventResult
        include JSON::Serializable

        def initialize
        end
      end

      # The performance metrics data points for Transaction Fraud Insights (TFI) model.

      struct TFIMetricDataPoint
        include JSON::Serializable

        # The false positive rate. This is the percentage of total legitimate events that are incorrectly
        # predicted as fraud.

        @[JSON::Field(key: "fpr")]
        getter fpr : Float64?

        # The percentage of fraud events correctly predicted as fraudulent as compared to all events predicted
        # as fraudulent.

        @[JSON::Field(key: "precision")]
        getter precision : Float64?

        # The model threshold that specifies an acceptable fraud capture rate. For example, a threshold of 500
        # means any model score 500 or above is labeled as fraud.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?

        # The true positive rate. This is the percentage of total fraud the model detects. Also known as
        # capture rate.

        @[JSON::Field(key: "tpr")]
        getter tpr : Float64?

        def initialize(
          @fpr : Float64? = nil,
          @precision : Float64? = nil,
          @threshold : Float64? = nil,
          @tpr : Float64? = nil
        )
        end
      end

      # The Transaction Fraud Insights (TFI) model performance score.

      struct TFIModelPerformance
        include JSON::Serializable

        # The area under the curve (auc). This summarizes the total positive rate (tpr) and false positive
        # rate (FPR) across all possible model score thresholds.

        @[JSON::Field(key: "auc")]
        getter auc : Float64?

        # Indicates the range of area under curve (auc) expected from the TFI model. A range greater than 0.1
        # indicates higher model uncertainity.

        @[JSON::Field(key: "uncertaintyRange")]
        getter uncertainty_range : Types::UncertaintyRange?

        def initialize(
          @auc : Float64? = nil,
          @uncertainty_range : Types::UncertaintyRange? = nil
        )
        end
      end

      # The Transaction Fraud Insights (TFI) model training metric details.

      struct TFITrainingMetricsValue
        include JSON::Serializable

        # The model's performance metrics data points.

        @[JSON::Field(key: "metricDataPoints")]
        getter metric_data_points : Array(Types::TFIMetricDataPoint)?

        # The model performance score.

        @[JSON::Field(key: "modelPerformance")]
        getter model_performance : Types::TFIModelPerformance?

        def initialize(
          @metric_data_points : Array(Types::TFIMetricDataPoint)? = nil,
          @model_performance : Types::TFIModelPerformance? = nil
        )
        end
      end

      # A key and value pair.

      struct Tag
        include JSON::Serializable

        # A tag key.

        @[JSON::Field(key: "key")]
        getter key : String

        # A value assigned to a tag key.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The resource ARN.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # The tags to assign to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      # An exception indicating a throttling error.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The training data schema.

      struct TrainingDataSchema
        include JSON::Serializable

        # The training data schema variables.

        @[JSON::Field(key: "modelVariables")]
        getter model_variables : Array(String)


        @[JSON::Field(key: "labelSchema")]
        getter label_schema : Types::LabelSchema?

        def initialize(
          @model_variables : Array(String),
          @label_schema : Types::LabelSchema? = nil
        )
        end
      end

      # The training metric details.

      struct TrainingMetrics
        include JSON::Serializable

        # The area under the curve. This summarizes true positive rate (TPR) and false positive rate (FPR)
        # across all possible model score thresholds. A model with no predictive power has an AUC of 0.5,
        # whereas a perfect model has a score of 1.0.

        @[JSON::Field(key: "auc")]
        getter auc : Float64?

        # The data points details.

        @[JSON::Field(key: "metricDataPoints")]
        getter metric_data_points : Array(Types::MetricDataPoint)?

        def initialize(
          @auc : Float64? = nil,
          @metric_data_points : Array(Types::MetricDataPoint)? = nil
        )
        end
      end

      # The training metrics details.

      struct TrainingMetricsV2
        include JSON::Serializable

        # The Account Takeover Insights (ATI) model training metric details.

        @[JSON::Field(key: "ati")]
        getter ati : Types::ATITrainingMetricsValue?

        # The Online Fraud Insights (OFI) model training metric details.

        @[JSON::Field(key: "ofi")]
        getter ofi : Types::OFITrainingMetricsValue?

        # The Transaction Fraud Insights (TFI) model training metric details.

        @[JSON::Field(key: "tfi")]
        getter tfi : Types::TFITrainingMetricsValue?

        def initialize(
          @ati : Types::ATITrainingMetricsValue? = nil,
          @ofi : Types::OFITrainingMetricsValue? = nil,
          @tfi : Types::TFITrainingMetricsValue? = nil
        )
        end
      end

      # The training result details.

      struct TrainingResult
        include JSON::Serializable

        # The validation metrics.

        @[JSON::Field(key: "dataValidationMetrics")]
        getter data_validation_metrics : Types::DataValidationMetrics?

        # The training metric details.

        @[JSON::Field(key: "trainingMetrics")]
        getter training_metrics : Types::TrainingMetrics?

        # The variable importance metrics.

        @[JSON::Field(key: "variableImportanceMetrics")]
        getter variable_importance_metrics : Types::VariableImportanceMetrics?

        def initialize(
          @data_validation_metrics : Types::DataValidationMetrics? = nil,
          @training_metrics : Types::TrainingMetrics? = nil,
          @variable_importance_metrics : Types::VariableImportanceMetrics? = nil
        )
        end
      end

      # The training result details.

      struct TrainingResultV2
        include JSON::Serializable

        # The variable importance metrics of the aggregated variables. Account Takeover Insights (ATI) model
        # uses event variables from the login data you provide to continuously calculate a set of variables
        # (aggregated variables) based on historical events. For example, your ATI model might calculate the
        # number of times an user has logged in using the same IP address. In this case, event variables used
        # to derive the aggregated variables are IP address and user .

        @[JSON::Field(key: "aggregatedVariablesImportanceMetrics")]
        getter aggregated_variables_importance_metrics : Types::AggregatedVariablesImportanceMetrics?


        @[JSON::Field(key: "dataValidationMetrics")]
        getter data_validation_metrics : Types::DataValidationMetrics?

        # The training metric details.

        @[JSON::Field(key: "trainingMetricsV2")]
        getter training_metrics_v2 : Types::TrainingMetricsV2?


        @[JSON::Field(key: "variableImportanceMetrics")]
        getter variable_importance_metrics : Types::VariableImportanceMetrics?

        def initialize(
          @aggregated_variables_importance_metrics : Types::AggregatedVariablesImportanceMetrics? = nil,
          @data_validation_metrics : Types::DataValidationMetrics? = nil,
          @training_metrics_v2 : Types::TrainingMetricsV2? = nil,
          @variable_importance_metrics : Types::VariableImportanceMetrics? = nil
        )
        end
      end

      # Range of area under curve (auc) expected from the model. A range greater than 0.1 indicates higher
      # model uncertainity. A range is the difference between upper and lower bound of auc.

      struct UncertaintyRange
        include JSON::Serializable

        # The lower bound value of the area under curve (auc).

        @[JSON::Field(key: "lowerBoundValue")]
        getter lower_bound_value : Float64

        # The upper bound value of the area under curve (auc).

        @[JSON::Field(key: "upperBoundValue")]
        getter upper_bound_value : Float64

        def initialize(
          @lower_bound_value : Float64,
          @upper_bound_value : Float64
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource from which to remove the tag.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # The resource ARN.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDetectorVersionMetadataRequest
        include JSON::Serializable

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String

        def initialize(
          @description : String,
          @detector_id : String,
          @detector_version_id : String
        )
        end
      end


      struct UpdateDetectorVersionMetadataResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDetectorVersionRequest
        include JSON::Serializable

        # The parent detector ID for the detector version you want to update.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String

        # The Amazon SageMaker model endpoints to include in the detector version.

        @[JSON::Field(key: "externalModelEndpoints")]
        getter external_model_endpoints : Array(String)

        # The rules to include in the detector version.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::Rule)

        # The detector version description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The model versions to include in the detector version.

        @[JSON::Field(key: "modelVersions")]
        getter model_versions : Array(Types::ModelVersion)?

        # The rule execution mode to add to the detector. If you specify FIRST_MATCHED , Amazon Fraud Detector
        # evaluates rules sequentially, first to last, stopping at the first matched rule. Amazon Fraud
        # dectector then provides the outcomes for that single rule. If you specifiy ALL_MATCHED , Amazon
        # Fraud Detector evaluates all rules and returns the outcomes for all matched rules. You can define
        # and edit the rule mode at the detector version level, when it is in draft status. The default
        # behavior is FIRST_MATCHED .

        @[JSON::Field(key: "ruleExecutionMode")]
        getter rule_execution_mode : String?

        def initialize(
          @detector_id : String,
          @detector_version_id : String,
          @external_model_endpoints : Array(String),
          @rules : Array(Types::Rule),
          @description : String? = nil,
          @model_versions : Array(Types::ModelVersion)? = nil,
          @rule_execution_mode : String? = nil
        )
        end
      end


      struct UpdateDetectorVersionResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDetectorVersionStatusRequest
        include JSON::Serializable

        # The detector ID.

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The detector version ID.

        @[JSON::Field(key: "detectorVersionId")]
        getter detector_version_id : String

        # The new status. The only supported values are ACTIVE and INACTIVE

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @detector_id : String,
          @detector_version_id : String,
          @status : String
        )
        end
      end


      struct UpdateDetectorVersionStatusResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateEventLabelRequest
        include JSON::Serializable

        # The new label to assign to the event.

        @[JSON::Field(key: "assignedLabel")]
        getter assigned_label : String

        # The ID of the event associated with the label to update.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The event type of the event associated with the label to update.

        @[JSON::Field(key: "eventTypeName")]
        getter event_type_name : String

        # The timestamp associated with the label. The timestamp must be specified using ISO 8601 standard in
        # UTC.

        @[JSON::Field(key: "labelTimestamp")]
        getter label_timestamp : String

        def initialize(
          @assigned_label : String,
          @event_id : String,
          @event_type_name : String,
          @label_timestamp : String
        )
        end
      end


      struct UpdateEventLabelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateListRequest
        include JSON::Serializable

        # The name of the list to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The new description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # One or more list elements to add or replace. If you are providing the elements, make sure to specify
        # the updateMode to use. If you are deleting all elements from the list, use REPLACE for the
        # updateMode and provide an empty list (0 elements).

        @[JSON::Field(key: "elements")]
        getter elements : Array(String)?

        # The update mode (type). Use APPEND if you are adding elements to the list. Use REPLACE if you
        # replacing existing elements in the list. Use REMOVE if you are removing elements from the list.

        @[JSON::Field(key: "updateMode")]
        getter update_mode : String?

        # The variable type you want to assign to the list. You cannot update a variable type of a list that
        # already has a variable type assigned to it. You can assign a variable type to a list only if the
        # list does not already have a variable type.

        @[JSON::Field(key: "variableType")]
        getter variable_type : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @elements : Array(String)? = nil,
          @update_mode : String? = nil,
          @variable_type : String? = nil
        )
        end
      end


      struct UpdateListResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateModelRequest
        include JSON::Serializable

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String

        # The new model description.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @model_id : String,
          @model_type : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateModelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateModelVersionRequest
        include JSON::Serializable

        # The major version number.

        @[JSON::Field(key: "majorVersionNumber")]
        getter major_version_number : String

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String

        # The details of the external events data used for training the model version. Required if
        # trainingDataSource is EXTERNAL_EVENTS .

        @[JSON::Field(key: "externalEventsDetail")]
        getter external_events_detail : Types::ExternalEventsDetail?

        # The details of the ingested event used for training the model version. Required if your
        # trainingDataSource is INGESTED_EVENTS .

        @[JSON::Field(key: "ingestedEventsDetail")]
        getter ingested_events_detail : Types::IngestedEventsDetail?

        # A collection of key and value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @major_version_number : String,
          @model_id : String,
          @model_type : String,
          @external_events_detail : Types::ExternalEventsDetail? = nil,
          @ingested_events_detail : Types::IngestedEventsDetail? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct UpdateModelVersionResult
        include JSON::Serializable

        # The model ID.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String?

        # The model version number of the model version updated.

        @[JSON::Field(key: "modelVersionNumber")]
        getter model_version_number : String?

        # The status of the updated model version.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @model_id : String? = nil,
          @model_type : String? = nil,
          @model_version_number : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateModelVersionStatusRequest
        include JSON::Serializable

        # The model ID of the model version to update.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The model type.

        @[JSON::Field(key: "modelType")]
        getter model_type : String

        # The model version number.

        @[JSON::Field(key: "modelVersionNumber")]
        getter model_version_number : String

        # The model version status.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @model_id : String,
          @model_type : String,
          @model_version_number : String,
          @status : String
        )
        end
      end


      struct UpdateModelVersionStatusResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateRuleMetadataRequest
        include JSON::Serializable

        # The rule description.

        @[JSON::Field(key: "description")]
        getter description : String

        # The rule to update.

        @[JSON::Field(key: "rule")]
        getter rule : Types::Rule

        def initialize(
          @description : String,
          @rule : Types::Rule
        )
        end
      end


      struct UpdateRuleMetadataResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateRuleVersionRequest
        include JSON::Serializable

        # The rule expression.

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The language.

        @[JSON::Field(key: "language")]
        getter language : String

        # The outcomes.

        @[JSON::Field(key: "outcomes")]
        getter outcomes : Array(String)

        # The rule to update.

        @[JSON::Field(key: "rule")]
        getter rule : Types::Rule

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags to assign to the rule version.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @expression : String,
          @language : String,
          @outcomes : Array(String),
          @rule : Types::Rule,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct UpdateRuleVersionResult
        include JSON::Serializable

        # The new rule version that was created.

        @[JSON::Field(key: "rule")]
        getter rule : Types::Rule?

        def initialize(
          @rule : Types::Rule? = nil
        )
        end
      end


      struct UpdateVariableRequest
        include JSON::Serializable

        # The name of the variable.

        @[JSON::Field(key: "name")]
        getter name : String

        # The new default value of the variable.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The new description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The variable type. For more information see Variable types .

        @[JSON::Field(key: "variableType")]
        getter variable_type : String?

        def initialize(
          @name : String,
          @default_value : String? = nil,
          @description : String? = nil,
          @variable_type : String? = nil
        )
        end
      end


      struct UpdateVariableResult
        include JSON::Serializable

        def initialize
        end
      end

      # An exception indicating a specified value is not allowed.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The variable.

      struct Variable
        include JSON::Serializable

        # The ARN of the variable.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time when the variable was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : String?

        # The data source of the variable.

        @[JSON::Field(key: "dataSource")]
        getter data_source : String?

        # The data type of the variable. For more information see Variable types .

        @[JSON::Field(key: "dataType")]
        getter data_type : String?

        # The default value of the variable.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The description of the variable.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time when variable was last updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : String?

        # The name of the variable.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The variable type of the variable. Valid Values: AUTH_CODE | AVS | BILLING_ADDRESS_L1 |
        # BILLING_ADDRESS_L2 | BILLING_CITY | BILLING_COUNTRY | BILLING_NAME | BILLING_PHONE | BILLING_STATE |
        # BILLING_ZIP | CARD_BIN | CATEGORICAL | CURRENCY_CODE | EMAIL_ADDRESS | FINGERPRINT | FRAUD_LABEL |
        # FREE_FORM_TEXT | IP_ADDRESS | NUMERIC | ORDER_ID | PAYMENT_TYPE | PHONE_NUMBER | PRICE |
        # PRODUCT_CATEGORY | SHIPPING_ADDRESS_L1 | SHIPPING_ADDRESS_L2 | SHIPPING_CITY | SHIPPING_COUNTRY |
        # SHIPPING_NAME | SHIPPING_PHONE | SHIPPING_STATE | SHIPPING_ZIP | USERAGENT

        @[JSON::Field(key: "variableType")]
        getter variable_type : String?

        def initialize(
          @arn : String? = nil,
          @created_time : String? = nil,
          @data_source : String? = nil,
          @data_type : String? = nil,
          @default_value : String? = nil,
          @description : String? = nil,
          @last_updated_time : String? = nil,
          @name : String? = nil,
          @variable_type : String? = nil
        )
        end
      end

      # A variable in the list of variables for the batch create variable request.

      struct VariableEntry
        include JSON::Serializable

        # The data source of the variable.

        @[JSON::Field(key: "dataSource")]
        getter data_source : String?

        # The data type of the variable.

        @[JSON::Field(key: "dataType")]
        getter data_type : String?

        # The default value of the variable.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The description of the variable.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the variable.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of the variable. For more information see Variable types . Valid Values: AUTH_CODE | AVS |
        # BILLING_ADDRESS_L1 | BILLING_ADDRESS_L2 | BILLING_CITY | BILLING_COUNTRY | BILLING_NAME |
        # BILLING_PHONE | BILLING_STATE | BILLING_ZIP | CARD_BIN | CATEGORICAL | CURRENCY_CODE | EMAIL_ADDRESS
        # | FINGERPRINT | FRAUD_LABEL | FREE_FORM_TEXT | IP_ADDRESS | NUMERIC | ORDER_ID | PAYMENT_TYPE |
        # PHONE_NUMBER | PRICE | PRODUCT_CATEGORY | SHIPPING_ADDRESS_L1 | SHIPPING_ADDRESS_L2 | SHIPPING_CITY
        # | SHIPPING_COUNTRY | SHIPPING_NAME | SHIPPING_PHONE | SHIPPING_STATE | SHIPPING_ZIP | USERAGENT

        @[JSON::Field(key: "variableType")]
        getter variable_type : String?

        def initialize(
          @data_source : String? = nil,
          @data_type : String? = nil,
          @default_value : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @variable_type : String? = nil
        )
        end
      end

      # The details of the event variable's impact on the prediction score.

      struct VariableImpactExplanation
        include JSON::Serializable

        # The event variable name.

        @[JSON::Field(key: "eventVariableName")]
        getter event_variable_name : String?

        # The raw, uninterpreted value represented as log-odds of the fraud. These values are usually between
        # -10 to +10, but range from - infinity to + infinity. A positive value indicates that the variable
        # drove the risk score up. A negative value indicates that the variable drove the risk score down.

        @[JSON::Field(key: "logOddsImpact")]
        getter log_odds_impact : Float64?

        # The event variable's relative impact in terms of magnitude on the prediction scores. The relative
        # impact values consist of a numerical rating (0-5, 5 being the highest) and direction
        # (increased/decreased) impact of the fraud risk.

        @[JSON::Field(key: "relativeImpact")]
        getter relative_impact : String?

        def initialize(
          @event_variable_name : String? = nil,
          @log_odds_impact : Float64? = nil,
          @relative_impact : String? = nil
        )
        end
      end

      # The variable importance metrics details.

      struct VariableImportanceMetrics
        include JSON::Serializable

        # List of variable metrics.

        @[JSON::Field(key: "logOddsMetrics")]
        getter log_odds_metrics : Array(Types::LogOddsMetric)?

        def initialize(
          @log_odds_metrics : Array(Types::LogOddsMetric)? = nil
        )
        end
      end
    end
  end
end
