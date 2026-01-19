require "json"
require "time"

module AwsSdk
  module LookoutEquipment
    module Types

      # The request could not be completed because you do not have access to the resource.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Entity that comprises information on categorical values in data.
      struct CategoricalValues
        include JSON::Serializable

        # Indicates whether there is a potential data issue related to categorical values.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Indicates the number of categories in the data.
        @[JSON::Field(key: "NumberOfCategory")]
        getter number_of_category : Int32?

        def initialize(
          @status : String,
          @number_of_category : Int32? = nil
        )
        end
      end

      # The request could not be completed due to a conflict with the current state of the target resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Entity that comprises information of count and percentage.
      struct CountPercent
        include JSON::Serializable

        # Indicates the count of occurences of the given statistic.
        @[JSON::Field(key: "Count")]
        getter count : Int32

        # Indicates the percentage of occurances of the given statistic.
        @[JSON::Field(key: "Percentage")]
        getter percentage : Float64

        def initialize(
          @count : Int32,
          @percentage : Float64
        )
        end
      end

      struct CreateDatasetRequest
        include JSON::Serializable

        # A unique identifier for the request. If you do not set the client request token, Amazon Lookout for
        # Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The name of the dataset being created.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # A JSON description of the data that is in each time series dataset, including names, column names,
        # and data types.
        @[JSON::Field(key: "DatasetSchema")]
        getter dataset_schema : Types::DatasetSchema?

        # Provides the identifier of the KMS key used to encrypt dataset data by Amazon Lookout for Equipment.
        @[JSON::Field(key: "ServerSideKmsKeyId")]
        getter server_side_kms_key_id : String?

        # Any tags associated with the ingested data described in the dataset.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @dataset_name : String,
          @dataset_schema : Types::DatasetSchema? = nil,
          @server_side_kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDatasetResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset being created.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset being created.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # Indicates the status of the CreateDataset operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateInferenceSchedulerRequest
        include JSON::Serializable

        # A unique identifier for the request. If you do not set the client request token, Amazon Lookout for
        # Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Specifies configuration information for the input data for the inference scheduler, including
        # delimiter, format, and dataset location.
        @[JSON::Field(key: "DataInputConfiguration")]
        getter data_input_configuration : Types::InferenceInputConfiguration

        # Specifies configuration information for the output results for the inference scheduler, including
        # the S3 location for the output.
        @[JSON::Field(key: "DataOutputConfiguration")]
        getter data_output_configuration : Types::InferenceOutputConfiguration

        # How often data is uploaded to the source Amazon S3 bucket for the input data. The value chosen is
        # the length of time between data uploads. For instance, if you select 5 minutes, Amazon Lookout for
        # Equipment will upload the real-time data to the source bucket once every 5 minutes. This frequency
        # also determines how often Amazon Lookout for Equipment runs inference on your data. For more
        # information, see Understanding the inference process .
        @[JSON::Field(key: "DataUploadFrequency")]
        getter data_upload_frequency : String

        # The name of the inference scheduler being created.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String

        # The name of the previously trained machine learning model being used to create the inference
        # scheduler.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        # The Amazon Resource Name (ARN) of a role with permission to access the data source being used for
        # the inference.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The interval (in minutes) of planned delay at the start of each inference segment. For example, if
        # inference is set to run every ten minutes, the delay is set to five minutes and the time is 09:08.
        # The inference scheduler will wake up at the configured interval (which, without a delay configured,
        # would be 09:10) plus the additional five minute delay time (so 09:15) to check your Amazon S3
        # bucket. The delay provides a buffer for you to upload data at the same frequency, so that you don't
        # have to stop and restart the scheduler when uploading new data. For more information, see
        # Understanding the inference process .
        @[JSON::Field(key: "DataDelayOffsetInMinutes")]
        getter data_delay_offset_in_minutes : Int64?

        # Provides the identifier of the KMS key used to encrypt inference scheduler data by Amazon Lookout
        # for Equipment.
        @[JSON::Field(key: "ServerSideKmsKeyId")]
        getter server_side_kms_key_id : String?

        # Any tags associated with the inference scheduler.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @data_input_configuration : Types::InferenceInputConfiguration,
          @data_output_configuration : Types::InferenceOutputConfiguration,
          @data_upload_frequency : String,
          @inference_scheduler_name : String,
          @model_name : String,
          @role_arn : String,
          @data_delay_offset_in_minutes : Int64? = nil,
          @server_side_kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateInferenceSchedulerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the inference scheduler being created.
        @[JSON::Field(key: "InferenceSchedulerArn")]
        getter inference_scheduler_arn : String?

        # The name of inference scheduler being created.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String?

        # Provides a quality assessment for a model that uses labels. If Lookout for Equipment determines that
        # the model quality is poor based on training metrics, the value is POOR_QUALITY_DETECTED . Otherwise,
        # the value is QUALITY_THRESHOLD_MET . If the model is unlabeled, the model quality can't be assessed
        # and the value of ModelQuality is CANNOT_DETERMINE_QUALITY . In this situation, you can get a model
        # quality assessment by adding labels to the input dataset and retraining the model. For information
        # about using labels with your models, see Understanding labeling . For information about improving
        # the quality of a model, see Best practices with Amazon Lookout for Equipment .
        @[JSON::Field(key: "ModelQuality")]
        getter model_quality : String?

        # Indicates the status of the CreateInferenceScheduler operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @inference_scheduler_arn : String? = nil,
          @inference_scheduler_name : String? = nil,
          @model_quality : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateLabelGroupRequest
        include JSON::Serializable

        # A unique identifier for the request to create a label group. If you do not set the client request
        # token, Lookout for Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Names a group of labels. Data in this field will be retained for service usage. Follow best
        # practices for the security of your data.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String

        # The acceptable fault codes (indicating the type of anomaly associated with the label) that can be
        # used with this label group. Data in this field will be retained for service usage. Follow best
        # practices for the security of your data.
        @[JSON::Field(key: "FaultCodes")]
        getter fault_codes : Array(String)?

        # Tags that provide metadata about the label group you are creating. Data in this field will be
        # retained for service usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @label_group_name : String,
          @fault_codes : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateLabelGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the label group that you have created.
        @[JSON::Field(key: "LabelGroupArn")]
        getter label_group_arn : String?

        # The name of the label group that you have created. Data in this field will be retained for service
        # usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String?

        def initialize(
          @label_group_arn : String? = nil,
          @label_group_name : String? = nil
        )
        end
      end

      struct CreateLabelRequest
        include JSON::Serializable

        # A unique identifier for the request to create a label. If you do not set the client request token,
        # Lookout for Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The end time of the labeled event.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The name of a group of labels. Data in this field will be retained for service usage. Follow best
        # practices for the security of your data.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String

        # Indicates whether a labeled event represents an anomaly.
        @[JSON::Field(key: "Rating")]
        getter rating : String

        # The start time of the labeled event.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # Indicates that a label pertains to a particular piece of equipment. Data in this field will be
        # retained for service usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "Equipment")]
        getter equipment : String?

        # Provides additional information about the label. The fault code must be defined in the FaultCodes
        # attribute of the label group. Data in this field will be retained for service usage. Follow best
        # practices for the security of your data.
        @[JSON::Field(key: "FaultCode")]
        getter fault_code : String?

        # Metadata providing additional information about the label. Data in this field will be retained for
        # service usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "Notes")]
        getter notes : String?

        def initialize(
          @client_token : String,
          @end_time : Time,
          @label_group_name : String,
          @rating : String,
          @start_time : Time,
          @equipment : String? = nil,
          @fault_code : String? = nil,
          @notes : String? = nil
        )
        end
      end

      struct CreateLabelResponse
        include JSON::Serializable

        # The ID of the label that you have created.
        @[JSON::Field(key: "LabelId")]
        getter label_id : String?

        def initialize(
          @label_id : String? = nil
        )
        end
      end

      struct CreateModelRequest
        include JSON::Serializable

        # A unique identifier for the request. If you do not set the client request token, Amazon Lookout for
        # Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The name of the dataset for the machine learning model being created.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # The name for the machine learning model to be created.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        # The configuration is the TargetSamplingRate , which is the sampling rate of the data after post
        # processing by Amazon Lookout for Equipment. For example, if you provide data that has been collected
        # at a 1 second level and you want the system to resample the data at a 1 minute rate before training,
        # the TargetSamplingRate is 1 minute. When providing a value for the TargetSamplingRate , you must
        # attach the prefix "PT" to the rate you want. The value for a 1 second rate is therefore PT1S , the
        # value for a 15 minute rate is PT15M , and the value for a 1 hour rate is PT1H
        @[JSON::Field(key: "DataPreProcessingConfiguration")]
        getter data_pre_processing_configuration : Types::DataPreProcessingConfiguration?

        # The data schema for the machine learning model being created.
        @[JSON::Field(key: "DatasetSchema")]
        getter dataset_schema : Types::DatasetSchema?

        # Indicates the time reference in the dataset that should be used to end the subset of evaluation data
        # for the machine learning model.
        @[JSON::Field(key: "EvaluationDataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_data_end_time : Time?

        # Indicates the time reference in the dataset that should be used to begin the subset of evaluation
        # data for the machine learning model.
        @[JSON::Field(key: "EvaluationDataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_data_start_time : Time?

        # The input configuration for the labels being used for the machine learning model that's being
        # created.
        @[JSON::Field(key: "LabelsInputConfiguration")]
        getter labels_input_configuration : Types::LabelsInputConfiguration?

        # The Amazon S3 location where you want Amazon Lookout for Equipment to save the pointwise model
        # diagnostics. You must also specify the RoleArn request parameter.
        @[JSON::Field(key: "ModelDiagnosticsOutputConfiguration")]
        getter model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration?

        # Indicates that the asset associated with this sensor has been shut off. As long as this condition is
        # met, Lookout for Equipment will not use data from this asset for training, evaluation, or inference.
        @[JSON::Field(key: "OffCondition")]
        getter off_condition : String?

        # The Amazon Resource Name (ARN) of a role with permission to access the data source being used to
        # create the machine learning model.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Provides the identifier of the KMS key used to encrypt model data by Amazon Lookout for Equipment.
        @[JSON::Field(key: "ServerSideKmsKeyId")]
        getter server_side_kms_key_id : String?

        # Any tags associated with the machine learning model being created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Indicates the time reference in the dataset that should be used to end the subset of training data
        # for the machine learning model.
        @[JSON::Field(key: "TrainingDataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_data_end_time : Time?

        # Indicates the time reference in the dataset that should be used to begin the subset of training data
        # for the machine learning model.
        @[JSON::Field(key: "TrainingDataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_data_start_time : Time?

        def initialize(
          @client_token : String,
          @dataset_name : String,
          @model_name : String,
          @data_pre_processing_configuration : Types::DataPreProcessingConfiguration? = nil,
          @dataset_schema : Types::DatasetSchema? = nil,
          @evaluation_data_end_time : Time? = nil,
          @evaluation_data_start_time : Time? = nil,
          @labels_input_configuration : Types::LabelsInputConfiguration? = nil,
          @model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration? = nil,
          @off_condition : String? = nil,
          @role_arn : String? = nil,
          @server_side_kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @training_data_end_time : Time? = nil,
          @training_data_start_time : Time? = nil
        )
        end
      end

      struct CreateModelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the model being created.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # Indicates the status of the CreateModel operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @model_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateRetrainingSchedulerRequest
        include JSON::Serializable

        # A unique identifier for the request. If you do not set the client request token, Amazon Lookout for
        # Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The number of past days of data that will be used for retraining.
        @[JSON::Field(key: "LookbackWindow")]
        getter lookback_window : String

        # The name of the model to add the retraining scheduler to.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        # This parameter uses the ISO 8601 standard to set the frequency at which you want retraining to occur
        # in terms of Years, Months, and/or Days (note: other parameters like Time are not currently
        # supported). The minimum value is 30 days (P30D) and the maximum value is 1 year (P1Y). For example,
        # the following values are valid: P3M15D – Every 3 months and 15 days P2M – Every 2 months P150D –
        # Every 150 days
        @[JSON::Field(key: "RetrainingFrequency")]
        getter retraining_frequency : String

        # Indicates how the service will use new models. In MANAGED mode, new models will automatically be
        # used for inference if they have better performance than the current model. In MANUAL mode, the new
        # models will not be used until they are manually activated .
        @[JSON::Field(key: "PromoteMode")]
        getter promote_mode : String?

        # The start date for the retraining scheduler. Lookout for Equipment truncates the time you provide to
        # the nearest UTC day.
        @[JSON::Field(key: "RetrainingStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter retraining_start_date : Time?

        def initialize(
          @client_token : String,
          @lookback_window : String,
          @model_name : String,
          @retraining_frequency : String,
          @promote_mode : String? = nil,
          @retraining_start_date : Time? = nil
        )
        end
      end

      struct CreateRetrainingSchedulerResponse
        include JSON::Serializable

        # The ARN of the model that you added the retraining scheduler to.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the model that you added the retraining scheduler to.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The status of the retraining scheduler.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides information about a specified data ingestion job, including dataset information, data
      # ingestion configuration, and status.
      struct DataIngestionJobSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset used in the data ingestion job.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset used for the data ingestion job.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # Specifies information for the input data for the data inference job, including data Amazon S3
        # location parameters.
        @[JSON::Field(key: "IngestionInputConfiguration")]
        getter ingestion_input_configuration : Types::IngestionInputConfiguration?

        # Indicates the job ID of the data ingestion job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Indicates the status of the data ingestion job.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @ingestion_input_configuration : Types::IngestionInputConfiguration? = nil,
          @job_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The configuration is the TargetSamplingRate , which is the sampling rate of the data after post
      # processing by Amazon Lookout for Equipment. For example, if you provide data that has been collected
      # at a 1 second level and you want the system to resample the data at a 1 minute rate before training,
      # the TargetSamplingRate is 1 minute. When providing a value for the TargetSamplingRate , you must
      # attach the prefix "PT" to the rate you want. The value for a 1 second rate is therefore PT1S , the
      # value for a 15 minute rate is PT15M , and the value for a 1 hour rate is PT1H
      struct DataPreProcessingConfiguration
        include JSON::Serializable

        # The sampling rate of the data after post processing by Amazon Lookout for Equipment. For example, if
        # you provide data that has been collected at a 1 second level and you want the system to resample the
        # data at a 1 minute rate before training, the TargetSamplingRate is 1 minute. When providing a value
        # for the TargetSamplingRate , you must attach the prefix "PT" to the rate you want. The value for a 1
        # second rate is therefore PT1S , the value for a 15 minute rate is PT15M , and the value for a 1 hour
        # rate is PT1H
        @[JSON::Field(key: "TargetSamplingRate")]
        getter target_sampling_rate : String?

        def initialize(
          @target_sampling_rate : String? = nil
        )
        end
      end

      # DataQualitySummary gives aggregated statistics over all the sensors about a completed ingestion job.
      # It primarily gives more information about statistics over different incorrect data like
      # MissingCompleteSensorData, MissingSensorData, UnsupportedDateFormats, InsufficientSensorData,
      # DuplicateTimeStamps.
      struct DataQualitySummary
        include JSON::Serializable

        # Parameter that gives information about duplicate timestamps in the input data.
        @[JSON::Field(key: "DuplicateTimestamps")]
        getter duplicate_timestamps : Types::DuplicateTimestamps

        # Parameter that gives information about insufficient data for sensors in the dataset. This includes
        # information about those sensors that have complete data missing and those with a short date range.
        @[JSON::Field(key: "InsufficientSensorData")]
        getter insufficient_sensor_data : Types::InsufficientSensorData

        # Parameter that gives information about data that is invalid over all the sensors in the input data.
        @[JSON::Field(key: "InvalidSensorData")]
        getter invalid_sensor_data : Types::InvalidSensorData

        # Parameter that gives information about data that is missing over all the sensors in the input data.
        @[JSON::Field(key: "MissingSensorData")]
        getter missing_sensor_data : Types::MissingSensorData

        # Parameter that gives information about unsupported timestamps in the input data.
        @[JSON::Field(key: "UnsupportedTimestamps")]
        getter unsupported_timestamps : Types::UnsupportedTimestamps

        def initialize(
          @duplicate_timestamps : Types::DuplicateTimestamps,
          @insufficient_sensor_data : Types::InsufficientSensorData,
          @invalid_sensor_data : Types::InvalidSensorData,
          @missing_sensor_data : Types::MissingSensorData,
          @unsupported_timestamps : Types::UnsupportedTimestamps
        )
        end
      end

      # Provides information about the data schema used with the given dataset.
      struct DatasetSchema
        include JSON::Serializable

        # The data schema used within the given dataset.
        @[JSON::Field(key: "InlineDataSchema")]
        getter inline_data_schema : String?

        def initialize(
          @inline_data_schema : String? = nil
        )
        end
      end

      # Contains information about the specific data set, including name, ARN, and status.
      struct DatasetSummary
        include JSON::Serializable

        # The time at which the dataset was created in Amazon Lookout for Equipment.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the specified dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # Indicates the status of the dataset.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteDatasetRequest
        include JSON::Serializable

        # The name of the dataset to be deleted.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        def initialize(
          @dataset_name : String
        )
        end
      end

      struct DeleteInferenceSchedulerRequest
        include JSON::Serializable

        # The name of the inference scheduler to be deleted.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String

        def initialize(
          @inference_scheduler_name : String
        )
        end
      end

      struct DeleteLabelGroupRequest
        include JSON::Serializable

        # The name of the label group that you want to delete. Data in this field will be retained for service
        # usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String

        def initialize(
          @label_group_name : String
        )
        end
      end

      struct DeleteLabelRequest
        include JSON::Serializable

        # The name of the label group that contains the label that you want to delete. Data in this field will
        # be retained for service usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String

        # The ID of the label that you want to delete.
        @[JSON::Field(key: "LabelId")]
        getter label_id : String

        def initialize(
          @label_group_name : String,
          @label_id : String
        )
        end
      end

      struct DeleteModelRequest
        include JSON::Serializable

        # The name of the machine learning model to be deleted.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        def initialize(
          @model_name : String
        )
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which the resource policy should be deleted.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DeleteRetrainingSchedulerRequest
        include JSON::Serializable

        # The name of the model whose retraining scheduler you want to delete.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        def initialize(
          @model_name : String
        )
        end
      end

      struct DescribeDataIngestionJobRequest
        include JSON::Serializable

        # The job ID of the data ingestion job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeDataIngestionJobResponse
        include JSON::Serializable

        # The time at which the data ingestion job was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Indicates the latest timestamp corresponding to data that was successfully ingested during this
        # specific ingestion job.
        @[JSON::Field(key: "DataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_end_time : Time?

        # Gives statistics about a completed ingestion job. These statistics primarily relate to quantifying
        # incorrect data such as MissingCompleteSensorData, MissingSensorData, UnsupportedDateFormats,
        # InsufficientSensorData, and DuplicateTimeStamps.
        @[JSON::Field(key: "DataQualitySummary")]
        getter data_quality_summary : Types::DataQualitySummary?

        # Indicates the earliest timestamp corresponding to data that was successfully ingested during this
        # specific ingestion job.
        @[JSON::Field(key: "DataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_start_time : Time?

        # The Amazon Resource Name (ARN) of the dataset being used in the data ingestion job.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # Specifies the reason for failure when a data ingestion job has failed.
        @[JSON::Field(key: "FailedReason")]
        getter failed_reason : String?

        # Indicates the size of the ingested dataset.
        @[JSON::Field(key: "IngestedDataSize")]
        getter ingested_data_size : Int64?

        @[JSON::Field(key: "IngestedFilesSummary")]
        getter ingested_files_summary : Types::IngestedFilesSummary?

        # Specifies the S3 location configuration for the data input for the data ingestion job.
        @[JSON::Field(key: "IngestionInputConfiguration")]
        getter ingestion_input_configuration : Types::IngestionInputConfiguration?

        # Indicates the job ID of the data ingestion job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access the data source being
        # ingested.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The Amazon Resource Name (ARN) of the source dataset from which the data used for the data ingestion
        # job was imported from.
        @[JSON::Field(key: "SourceDatasetArn")]
        getter source_dataset_arn : String?

        # Indicates the status of the DataIngestionJob operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Provides details about status of the ingestion job that is currently in progress.
        @[JSON::Field(key: "StatusDetail")]
        getter status_detail : String?

        def initialize(
          @created_at : Time? = nil,
          @data_end_time : Time? = nil,
          @data_quality_summary : Types::DataQualitySummary? = nil,
          @data_start_time : Time? = nil,
          @dataset_arn : String? = nil,
          @failed_reason : String? = nil,
          @ingested_data_size : Int64? = nil,
          @ingested_files_summary : Types::IngestedFilesSummary? = nil,
          @ingestion_input_configuration : Types::IngestionInputConfiguration? = nil,
          @job_id : String? = nil,
          @role_arn : String? = nil,
          @source_dataset_arn : String? = nil,
          @status : String? = nil,
          @status_detail : String? = nil
        )
        end
      end

      struct DescribeDatasetRequest
        include JSON::Serializable

        # The name of the dataset to be described.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        def initialize(
          @dataset_name : String
        )
        end
      end

      struct DescribeDatasetResponse
        include JSON::Serializable

        # Specifies the time the dataset was created in Lookout for Equipment.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Indicates the latest timestamp corresponding to data that was successfully ingested during the most
        # recent ingestion of this particular dataset.
        @[JSON::Field(key: "DataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_end_time : Time?

        # Gives statistics associated with the given dataset for the latest successful associated ingestion
        # job id. These statistics primarily relate to quantifying incorrect data such as
        # MissingCompleteSensorData, MissingSensorData, UnsupportedDateFormats, InsufficientSensorData, and
        # DuplicateTimeStamps.
        @[JSON::Field(key: "DataQualitySummary")]
        getter data_quality_summary : Types::DataQualitySummary?

        # Indicates the earliest timestamp corresponding to data that was successfully ingested during the
        # most recent ingestion of this particular dataset.
        @[JSON::Field(key: "DataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_start_time : Time?

        # The Amazon Resource Name (ARN) of the dataset being described.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset being described.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # IngestedFilesSummary associated with the given dataset for the latest successful associated
        # ingestion job id.
        @[JSON::Field(key: "IngestedFilesSummary")]
        getter ingested_files_summary : Types::IngestedFilesSummary?

        # Specifies the S3 location configuration for the data input for the data ingestion job.
        @[JSON::Field(key: "IngestionInputConfiguration")]
        getter ingestion_input_configuration : Types::IngestionInputConfiguration?

        # Specifies the time the dataset was last updated, if it was.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The Amazon Resource Name (ARN) of the IAM role that you are using for this the data ingestion job.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # A JSON description of the data that is in each time series dataset, including names, column names,
        # and data types.
        @[JSON::Field(key: "Schema")]
        getter schema : String?

        # Provides the identifier of the KMS key used to encrypt dataset data by Amazon Lookout for Equipment.
        @[JSON::Field(key: "ServerSideKmsKeyId")]
        getter server_side_kms_key_id : String?

        # The Amazon Resource Name (ARN) of the source dataset from which the current data being described was
        # imported from.
        @[JSON::Field(key: "SourceDatasetArn")]
        getter source_dataset_arn : String?

        # Indicates the status of the dataset.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @data_end_time : Time? = nil,
          @data_quality_summary : Types::DataQualitySummary? = nil,
          @data_start_time : Time? = nil,
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @ingested_files_summary : Types::IngestedFilesSummary? = nil,
          @ingestion_input_configuration : Types::IngestionInputConfiguration? = nil,
          @last_updated_at : Time? = nil,
          @role_arn : String? = nil,
          @schema : String? = nil,
          @server_side_kms_key_id : String? = nil,
          @source_dataset_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeInferenceSchedulerRequest
        include JSON::Serializable

        # The name of the inference scheduler being described.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String

        def initialize(
          @inference_scheduler_name : String
        )
        end
      end

      struct DescribeInferenceSchedulerResponse
        include JSON::Serializable

        # Specifies the time at which the inference scheduler was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A period of time (in minutes) by which inference on the data is delayed after the data starts. For
        # instance, if you select an offset delay time of five minutes, inference will not begin on the data
        # until the first data measurement after the five minute mark. For example, if five minutes is
        # selected, the inference scheduler will wake up at the configured frequency with the additional five
        # minute delay time to check the customer S3 bucket. The customer can upload data at the same
        # frequency and they don't need to stop and restart the scheduler when uploading new data.
        @[JSON::Field(key: "DataDelayOffsetInMinutes")]
        getter data_delay_offset_in_minutes : Int64?

        # Specifies configuration information for the input data for the inference scheduler, including
        # delimiter, format, and dataset location.
        @[JSON::Field(key: "DataInputConfiguration")]
        getter data_input_configuration : Types::InferenceInputConfiguration?

        # Specifies information for the output results for the inference scheduler, including the output S3
        # location.
        @[JSON::Field(key: "DataOutputConfiguration")]
        getter data_output_configuration : Types::InferenceOutputConfiguration?

        # Specifies how often data is uploaded to the source S3 bucket for the input data. This value is the
        # length of time between data uploads. For instance, if you select 5 minutes, Amazon Lookout for
        # Equipment will upload the real-time data to the source bucket once every 5 minutes. This frequency
        # also determines how often Amazon Lookout for Equipment starts a scheduled inference on your data. In
        # this example, it starts once every 5 minutes.
        @[JSON::Field(key: "DataUploadFrequency")]
        getter data_upload_frequency : String?

        # The Amazon Resource Name (ARN) of the inference scheduler being described.
        @[JSON::Field(key: "InferenceSchedulerArn")]
        getter inference_scheduler_arn : String?

        # The name of the inference scheduler being described.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String?

        # Indicates whether the latest execution for the inference scheduler was Anomalous (anomalous events
        # found) or Normal (no anomalous events found).
        @[JSON::Field(key: "LatestInferenceResult")]
        getter latest_inference_result : String?

        # The Amazon Resource Name (ARN) of the machine learning model of the inference scheduler being
        # described.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the machine learning model of the inference scheduler being described.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The Amazon Resource Name (ARN) of a role with permission to access the data source for the inference
        # scheduler being described.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Provides the identifier of the KMS key used to encrypt inference scheduler data by Amazon Lookout
        # for Equipment.
        @[JSON::Field(key: "ServerSideKmsKeyId")]
        getter server_side_kms_key_id : String?

        # Indicates the status of the inference scheduler.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Specifies the time at which the inference scheduler was last updated, if it was.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @data_delay_offset_in_minutes : Int64? = nil,
          @data_input_configuration : Types::InferenceInputConfiguration? = nil,
          @data_output_configuration : Types::InferenceOutputConfiguration? = nil,
          @data_upload_frequency : String? = nil,
          @inference_scheduler_arn : String? = nil,
          @inference_scheduler_name : String? = nil,
          @latest_inference_result : String? = nil,
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @role_arn : String? = nil,
          @server_side_kms_key_id : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct DescribeLabelGroupRequest
        include JSON::Serializable

        # Returns the name of the label group.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String

        def initialize(
          @label_group_name : String
        )
        end
      end

      struct DescribeLabelGroupResponse
        include JSON::Serializable

        # The time at which the label group was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Codes indicating the type of anomaly associated with the labels in the lagbel group.
        @[JSON::Field(key: "FaultCodes")]
        getter fault_codes : Array(String)?

        # The Amazon Resource Name (ARN) of the label group.
        @[JSON::Field(key: "LabelGroupArn")]
        getter label_group_arn : String?

        # The name of the label group.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String?

        # The time at which the label group was updated.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @fault_codes : Array(String)? = nil,
          @label_group_arn : String? = nil,
          @label_group_name : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct DescribeLabelRequest
        include JSON::Serializable

        # Returns the name of the group containing the label.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String

        # Returns the ID of the label.
        @[JSON::Field(key: "LabelId")]
        getter label_id : String

        def initialize(
          @label_group_name : String,
          @label_id : String
        )
        end
      end

      struct DescribeLabelResponse
        include JSON::Serializable

        # The time at which the label was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The end time of the requested label.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Indicates that a label pertains to a particular piece of equipment.
        @[JSON::Field(key: "Equipment")]
        getter equipment : String?

        # Indicates the type of anomaly associated with the label. Data in this field will be retained for
        # service usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "FaultCode")]
        getter fault_code : String?

        # The Amazon Resource Name (ARN) of the requested label group.
        @[JSON::Field(key: "LabelGroupArn")]
        getter label_group_arn : String?

        # The name of the requested label group.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String?

        # The ID of the requested label.
        @[JSON::Field(key: "LabelId")]
        getter label_id : String?

        # Metadata providing additional information about the label. Data in this field will be retained for
        # service usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # Indicates whether a labeled event represents an anomaly.
        @[JSON::Field(key: "Rating")]
        getter rating : String?

        # The start time of the requested label.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @created_at : Time? = nil,
          @end_time : Time? = nil,
          @equipment : String? = nil,
          @fault_code : String? = nil,
          @label_group_arn : String? = nil,
          @label_group_name : String? = nil,
          @label_id : String? = nil,
          @notes : String? = nil,
          @rating : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct DescribeModelRequest
        include JSON::Serializable

        # The name of the machine learning model to be described.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        def initialize(
          @model_name : String
        )
        end
      end

      struct DescribeModelResponse
        include JSON::Serializable

        # Indicates the end time of the inference data that has been accumulated.
        @[JSON::Field(key: "AccumulatedInferenceDataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter accumulated_inference_data_end_time : Time?

        # Indicates the start time of the inference data that has been accumulated.
        @[JSON::Field(key: "AccumulatedInferenceDataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter accumulated_inference_data_start_time : Time?

        # The name of the model version used by the inference schedular when running a scheduled inference
        # execution.
        @[JSON::Field(key: "ActiveModelVersion")]
        getter active_model_version : Int64?

        # The Amazon Resource Name (ARN) of the model version used by the inference scheduler when running a
        # scheduled inference execution.
        @[JSON::Field(key: "ActiveModelVersionArn")]
        getter active_model_version_arn : String?

        # Indicates the time and date at which the machine learning model was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The configuration is the TargetSamplingRate , which is the sampling rate of the data after post
        # processing by Amazon Lookout for Equipment. For example, if you provide data that has been collected
        # at a 1 second level and you want the system to resample the data at a 1 minute rate before training,
        # the TargetSamplingRate is 1 minute. When providing a value for the TargetSamplingRate , you must
        # attach the prefix "PT" to the rate you want. The value for a 1 second rate is therefore PT1S , the
        # value for a 15 minute rate is PT15M , and the value for a 1 hour rate is PT1H
        @[JSON::Field(key: "DataPreProcessingConfiguration")]
        getter data_pre_processing_configuration : Types::DataPreProcessingConfiguration?

        # The Amazon Resouce Name (ARN) of the dataset used to create the machine learning model being
        # described.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset being used by the machine learning being described.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # Indicates the time reference in the dataset that was used to end the subset of evaluation data for
        # the machine learning model.
        @[JSON::Field(key: "EvaluationDataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_data_end_time : Time?

        # Indicates the time reference in the dataset that was used to begin the subset of evaluation data for
        # the machine learning model.
        @[JSON::Field(key: "EvaluationDataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_data_start_time : Time?

        # If the training of the machine learning model failed, this indicates the reason for that failure.
        @[JSON::Field(key: "FailedReason")]
        getter failed_reason : String?

        # The date and time when the import job was completed. This field appears if the active model version
        # was imported.
        @[JSON::Field(key: "ImportJobEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter import_job_end_time : Time?

        # The date and time when the import job was started. This field appears if the active model version
        # was imported.
        @[JSON::Field(key: "ImportJobStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter import_job_start_time : Time?

        # Specifies configuration information about the labels input, including its S3 location.
        @[JSON::Field(key: "LabelsInputConfiguration")]
        getter labels_input_configuration : Types::LabelsInputConfiguration?

        # Indicates the last time the machine learning model was updated. The type of update is not specified.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # Indicates the number of days of data used in the most recent scheduled retraining run.
        @[JSON::Field(key: "LatestScheduledRetrainingAvailableDataInDays")]
        getter latest_scheduled_retraining_available_data_in_days : Int32?

        # If the model version was generated by retraining and the training failed, this indicates the reason
        # for that failure.
        @[JSON::Field(key: "LatestScheduledRetrainingFailedReason")]
        getter latest_scheduled_retraining_failed_reason : String?

        # Indicates the most recent model version that was generated by retraining.
        @[JSON::Field(key: "LatestScheduledRetrainingModelVersion")]
        getter latest_scheduled_retraining_model_version : Int64?

        # Indicates the start time of the most recent scheduled retraining run.
        @[JSON::Field(key: "LatestScheduledRetrainingStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_scheduled_retraining_start_time : Time?

        # Indicates the status of the most recent scheduled retraining run.
        @[JSON::Field(key: "LatestScheduledRetrainingStatus")]
        getter latest_scheduled_retraining_status : String?

        # The Amazon Resource Name (ARN) of the machine learning model being described.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # Configuration information for the model's pointwise model diagnostics.
        @[JSON::Field(key: "ModelDiagnosticsOutputConfiguration")]
        getter model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration?

        # The Model Metrics show an aggregated summary of the model's performance within the evaluation time
        # range. This is the JSON content of the metrics created when evaluating the model.
        @[JSON::Field(key: "ModelMetrics")]
        getter model_metrics : String?

        # The name of the machine learning model being described.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # Provides a quality assessment for a model that uses labels. If Lookout for Equipment determines that
        # the model quality is poor based on training metrics, the value is POOR_QUALITY_DETECTED . Otherwise,
        # the value is QUALITY_THRESHOLD_MET . If the model is unlabeled, the model quality can't be assessed
        # and the value of ModelQuality is CANNOT_DETERMINE_QUALITY . In this situation, you can get a model
        # quality assessment by adding labels to the input dataset and retraining the model. For information
        # about using labels with your models, see Understanding labeling . For information about improving
        # the quality of a model, see Best practices with Amazon Lookout for Equipment .
        @[JSON::Field(key: "ModelQuality")]
        getter model_quality : String?

        # The date the active model version was activated.
        @[JSON::Field(key: "ModelVersionActivatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter model_version_activated_at : Time?

        # Indicates the date and time that the next scheduled retraining run will start on. Lookout for
        # Equipment truncates the time you provide to the nearest UTC day.
        @[JSON::Field(key: "NextScheduledRetrainingStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter next_scheduled_retraining_start_date : Time?

        # Indicates that the asset associated with this sensor has been shut off. As long as this condition is
        # met, Lookout for Equipment will not use data from this asset for training, evaluation, or inference.
        @[JSON::Field(key: "OffCondition")]
        getter off_condition : String?

        # The model version that was set as the active model version prior to the current active model
        # version.
        @[JSON::Field(key: "PreviousActiveModelVersion")]
        getter previous_active_model_version : Int64?

        # The ARN of the model version that was set as the active model version prior to the current active
        # model version.
        @[JSON::Field(key: "PreviousActiveModelVersionArn")]
        getter previous_active_model_version_arn : String?

        # The date and time when the previous active model version was activated.
        @[JSON::Field(key: "PreviousModelVersionActivatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter previous_model_version_activated_at : Time?

        # If the model version was retrained, this field shows a summary of the performance of the prior model
        # on the new training range. You can use the information in this JSON-formatted object to compare the
        # new model version and the prior model version.
        @[JSON::Field(key: "PriorModelMetrics")]
        getter prior_model_metrics : String?

        # Indicates the status of the retraining scheduler.
        @[JSON::Field(key: "RetrainingSchedulerStatus")]
        getter retraining_scheduler_status : String?

        # The Amazon Resource Name (ARN) of a role with permission to access the data source for the machine
        # learning model being described.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # A JSON description of the data that is in each time series dataset, including names, column names,
        # and data types.
        @[JSON::Field(key: "Schema")]
        getter schema : String?

        # Provides the identifier of the KMS key used to encrypt model data by Amazon Lookout for Equipment.
        @[JSON::Field(key: "ServerSideKmsKeyId")]
        getter server_side_kms_key_id : String?

        # The Amazon Resource Name (ARN) of the source model version. This field appears if the active model
        # version was imported.
        @[JSON::Field(key: "SourceModelVersionArn")]
        getter source_model_version_arn : String?

        # Specifies the current status of the model being described. Status describes the status of the most
        # recent action of the model.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Indicates the time reference in the dataset that was used to end the subset of training data for the
        # machine learning model.
        @[JSON::Field(key: "TrainingDataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_data_end_time : Time?

        # Indicates the time reference in the dataset that was used to begin the subset of training data for
        # the machine learning model.
        @[JSON::Field(key: "TrainingDataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_data_start_time : Time?

        # Indicates the time at which the training of the machine learning model was completed.
        @[JSON::Field(key: "TrainingExecutionEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_execution_end_time : Time?

        # Indicates the time at which the training of the machine learning model began.
        @[JSON::Field(key: "TrainingExecutionStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_execution_start_time : Time?

        def initialize(
          @accumulated_inference_data_end_time : Time? = nil,
          @accumulated_inference_data_start_time : Time? = nil,
          @active_model_version : Int64? = nil,
          @active_model_version_arn : String? = nil,
          @created_at : Time? = nil,
          @data_pre_processing_configuration : Types::DataPreProcessingConfiguration? = nil,
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @evaluation_data_end_time : Time? = nil,
          @evaluation_data_start_time : Time? = nil,
          @failed_reason : String? = nil,
          @import_job_end_time : Time? = nil,
          @import_job_start_time : Time? = nil,
          @labels_input_configuration : Types::LabelsInputConfiguration? = nil,
          @last_updated_time : Time? = nil,
          @latest_scheduled_retraining_available_data_in_days : Int32? = nil,
          @latest_scheduled_retraining_failed_reason : String? = nil,
          @latest_scheduled_retraining_model_version : Int64? = nil,
          @latest_scheduled_retraining_start_time : Time? = nil,
          @latest_scheduled_retraining_status : String? = nil,
          @model_arn : String? = nil,
          @model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration? = nil,
          @model_metrics : String? = nil,
          @model_name : String? = nil,
          @model_quality : String? = nil,
          @model_version_activated_at : Time? = nil,
          @next_scheduled_retraining_start_date : Time? = nil,
          @off_condition : String? = nil,
          @previous_active_model_version : Int64? = nil,
          @previous_active_model_version_arn : String? = nil,
          @previous_model_version_activated_at : Time? = nil,
          @prior_model_metrics : String? = nil,
          @retraining_scheduler_status : String? = nil,
          @role_arn : String? = nil,
          @schema : String? = nil,
          @server_side_kms_key_id : String? = nil,
          @source_model_version_arn : String? = nil,
          @status : String? = nil,
          @training_data_end_time : Time? = nil,
          @training_data_start_time : Time? = nil,
          @training_execution_end_time : Time? = nil,
          @training_execution_start_time : Time? = nil
        )
        end
      end

      struct DescribeModelVersionRequest
        include JSON::Serializable

        # The name of the machine learning model that this version belongs to.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        # The version of the machine learning model.
        @[JSON::Field(key: "ModelVersion")]
        getter model_version : Int64

        def initialize(
          @model_name : String,
          @model_version : Int64
        )
        end
      end

      struct DescribeModelVersionResponse
        include JSON::Serializable

        # Indicates whether the model version was promoted to be the active version after retraining or if
        # there was an error with or cancellation of the retraining.
        @[JSON::Field(key: "AutoPromotionResult")]
        getter auto_promotion_result : String?

        # Indicates the reason for the AutoPromotionResult . For example, a model might not be promoted if its
        # performance was worse than the active version, if there was an error during training, or if the
        # retraining scheduler was using MANUAL promote mode. The model will be promoted in MANAGED promote
        # mode if the performance is better than the previous model.
        @[JSON::Field(key: "AutoPromotionResultReason")]
        getter auto_promotion_result_reason : String?

        # Indicates the time and date at which the machine learning model version was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        @[JSON::Field(key: "DataPreProcessingConfiguration")]
        getter data_pre_processing_configuration : Types::DataPreProcessingConfiguration?

        # The Amazon Resource Name (ARN) of the dataset used to train the model version.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset used to train the model version.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # The date on which the data in the evaluation set began being gathered. If you imported the version,
        # this is the date that the evaluation set data in the source version finished being gathered.
        @[JSON::Field(key: "EvaluationDataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_data_end_time : Time?

        # The date on which the data in the evaluation set began being gathered. If you imported the version,
        # this is the date that the evaluation set data in the source version began being gathered.
        @[JSON::Field(key: "EvaluationDataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_data_start_time : Time?

        # The failure message if the training of the model version failed.
        @[JSON::Field(key: "FailedReason")]
        getter failed_reason : String?

        # The date and time when the import job completed. This field appears if the model version was
        # imported.
        @[JSON::Field(key: "ImportJobEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter import_job_end_time : Time?

        # The date and time when the import job began. This field appears if the model version was imported.
        @[JSON::Field(key: "ImportJobStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter import_job_start_time : Time?

        # The size in bytes of the imported data. This field appears if the model version was imported.
        @[JSON::Field(key: "ImportedDataSizeInBytes")]
        getter imported_data_size_in_bytes : Int64?

        @[JSON::Field(key: "LabelsInputConfiguration")]
        getter labels_input_configuration : Types::LabelsInputConfiguration?

        # Indicates the last time the machine learning model version was updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The Amazon Resource Name (ARN) of the parent machine learning model that this version belong to.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The Amazon S3 location where Amazon Lookout for Equipment saves the pointwise model diagnostics for
        # the model version.
        @[JSON::Field(key: "ModelDiagnosticsOutputConfiguration")]
        getter model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration?

        # The Amazon S3 output prefix for where Lookout for Equipment saves the pointwise model diagnostics
        # for the model version.
        @[JSON::Field(key: "ModelDiagnosticsResultsObject")]
        getter model_diagnostics_results_object : Types::S3Object?

        # Shows an aggregated summary, in JSON format, of the model's performance within the evaluation time
        # range. These metrics are created when evaluating the model.
        @[JSON::Field(key: "ModelMetrics")]
        getter model_metrics : String?

        # The name of the machine learning model that this version belongs to.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # Provides a quality assessment for a model that uses labels. If Lookout for Equipment determines that
        # the model quality is poor based on training metrics, the value is POOR_QUALITY_DETECTED . Otherwise,
        # the value is QUALITY_THRESHOLD_MET . If the model is unlabeled, the model quality can't be assessed
        # and the value of ModelQuality is CANNOT_DETERMINE_QUALITY . In this situation, you can get a model
        # quality assessment by adding labels to the input dataset and retraining the model. For information
        # about using labels with your models, see Understanding labeling . For information about improving
        # the quality of a model, see Best practices with Amazon Lookout for Equipment .
        @[JSON::Field(key: "ModelQuality")]
        getter model_quality : String?

        # The version of the machine learning model.
        @[JSON::Field(key: "ModelVersion")]
        getter model_version : Int64?

        # The Amazon Resource Name (ARN) of the model version.
        @[JSON::Field(key: "ModelVersionArn")]
        getter model_version_arn : String?

        # Indicates that the asset associated with this sensor has been shut off. As long as this condition is
        # met, Lookout for Equipment will not use data from this asset for training, evaluation, or inference.
        @[JSON::Field(key: "OffCondition")]
        getter off_condition : String?

        # If the model version was retrained, this field shows a summary of the performance of the prior model
        # on the new training range. You can use the information in this JSON-formatted object to compare the
        # new model version and the prior model version.
        @[JSON::Field(key: "PriorModelMetrics")]
        getter prior_model_metrics : String?

        # Indicates the number of days of data used in the most recent scheduled retraining run.
        @[JSON::Field(key: "RetrainingAvailableDataInDays")]
        getter retraining_available_data_in_days : Int32?

        # The Amazon Resource Name (ARN) of the role that was used to train the model version.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The schema of the data used to train the model version.
        @[JSON::Field(key: "Schema")]
        getter schema : String?

        # The identifier of the KMS key key used to encrypt model version data by Amazon Lookout for
        # Equipment.
        @[JSON::Field(key: "ServerSideKmsKeyId")]
        getter server_side_kms_key_id : String?

        # If model version was imported, then this field is the arn of the source model version.
        @[JSON::Field(key: "SourceModelVersionArn")]
        getter source_model_version_arn : String?

        # Indicates whether this model version was created by training or by importing.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The current status of the model version.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date on which the training data finished being gathered. If you imported the version, this is
        # the date that the training data in the source version finished being gathered.
        @[JSON::Field(key: "TrainingDataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_data_end_time : Time?

        # The date on which the training data began being gathered. If you imported the version, this is the
        # date that the training data in the source version began being gathered.
        @[JSON::Field(key: "TrainingDataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_data_start_time : Time?

        # The time when the training of the version completed.
        @[JSON::Field(key: "TrainingExecutionEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_execution_end_time : Time?

        # The time when the training of the version began.
        @[JSON::Field(key: "TrainingExecutionStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_execution_start_time : Time?

        def initialize(
          @auto_promotion_result : String? = nil,
          @auto_promotion_result_reason : String? = nil,
          @created_at : Time? = nil,
          @data_pre_processing_configuration : Types::DataPreProcessingConfiguration? = nil,
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @evaluation_data_end_time : Time? = nil,
          @evaluation_data_start_time : Time? = nil,
          @failed_reason : String? = nil,
          @import_job_end_time : Time? = nil,
          @import_job_start_time : Time? = nil,
          @imported_data_size_in_bytes : Int64? = nil,
          @labels_input_configuration : Types::LabelsInputConfiguration? = nil,
          @last_updated_time : Time? = nil,
          @model_arn : String? = nil,
          @model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration? = nil,
          @model_diagnostics_results_object : Types::S3Object? = nil,
          @model_metrics : String? = nil,
          @model_name : String? = nil,
          @model_quality : String? = nil,
          @model_version : Int64? = nil,
          @model_version_arn : String? = nil,
          @off_condition : String? = nil,
          @prior_model_metrics : String? = nil,
          @retraining_available_data_in_days : Int32? = nil,
          @role_arn : String? = nil,
          @schema : String? = nil,
          @server_side_kms_key_id : String? = nil,
          @source_model_version_arn : String? = nil,
          @source_type : String? = nil,
          @status : String? = nil,
          @training_data_end_time : Time? = nil,
          @training_data_start_time : Time? = nil,
          @training_execution_end_time : Time? = nil,
          @training_execution_start_time : Time? = nil
        )
        end
      end

      struct DescribeResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that is associated with the resource policy.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DescribeResourcePolicyResponse
        include JSON::Serializable

        # The time when the resource policy was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The time when the resource policy was last modified.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # A unique identifier for a revision of the resource policy.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        # The resource policy in a JSON-formatted string.
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String?

        def initialize(
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @policy_revision_id : String? = nil,
          @resource_policy : String? = nil
        )
        end
      end

      struct DescribeRetrainingSchedulerRequest
        include JSON::Serializable

        # The name of the model that the retraining scheduler is attached to.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        def initialize(
          @model_name : String
        )
        end
      end

      struct DescribeRetrainingSchedulerResponse
        include JSON::Serializable

        # Indicates the time and date at which the retraining scheduler was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The number of past days of data used for retraining.
        @[JSON::Field(key: "LookbackWindow")]
        getter lookback_window : String?

        # The ARN of the model that the retraining scheduler is attached to.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the model that the retraining scheduler is attached to.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # Indicates how the service uses new models. In MANAGED mode, new models are used for inference if
        # they have better performance than the current model. In MANUAL mode, the new models are not used
        # until they are manually activated .
        @[JSON::Field(key: "PromoteMode")]
        getter promote_mode : String?

        # The frequency at which the model retraining is set. This follows the ISO 8601 guidelines.
        @[JSON::Field(key: "RetrainingFrequency")]
        getter retraining_frequency : String?

        # The start date for the retraining scheduler. Lookout for Equipment truncates the time you provide to
        # the nearest UTC day.
        @[JSON::Field(key: "RetrainingStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter retraining_start_date : Time?

        # The status of the retraining scheduler.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Indicates the time and date at which the retraining scheduler was updated.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @lookback_window : String? = nil,
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @promote_mode : String? = nil,
          @retraining_frequency : String? = nil,
          @retraining_start_date : Time? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Entity that comprises information abount duplicate timestamps in the dataset.
      struct DuplicateTimestamps
        include JSON::Serializable

        # Indicates the total number of duplicate timestamps.
        @[JSON::Field(key: "TotalNumberOfDuplicateTimestamps")]
        getter total_number_of_duplicate_timestamps : Int32

        def initialize(
          @total_number_of_duplicate_timestamps : Int32
        )
        end
      end

      struct ImportDatasetRequest
        include JSON::Serializable

        # A unique identifier for the request. If you do not set the client request token, Amazon Lookout for
        # Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the dataset to import.
        @[JSON::Field(key: "SourceDatasetArn")]
        getter source_dataset_arn : String

        # The name of the machine learning dataset to be created. If the dataset already exists, Amazon
        # Lookout for Equipment overwrites the existing dataset. If you don't specify this field, it is filled
        # with the name of the source dataset.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # Provides the identifier of the KMS key key used to encrypt model data by Amazon Lookout for
        # Equipment.
        @[JSON::Field(key: "ServerSideKmsKeyId")]
        getter server_side_kms_key_id : String?

        # Any tags associated with the dataset to be created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @source_dataset_arn : String,
          @dataset_name : String? = nil,
          @server_side_kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ImportDatasetResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset that was imported.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the created machine learning dataset.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # A unique identifier for the job of importing the dataset.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the ImportDataset operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @job_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ImportModelVersionRequest
        include JSON::Serializable

        # A unique identifier for the request. If you do not set the client request token, Amazon Lookout for
        # Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The name of the dataset for the machine learning model being imported.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # The Amazon Resource Name (ARN) of the model version to import.
        @[JSON::Field(key: "SourceModelVersionArn")]
        getter source_model_version_arn : String

        # Indicates how to import the accumulated inference data when a model version is imported. The
        # possible values are as follows: NO_IMPORT – Don't import the data. ADD_WHEN_EMPTY – Only import the
        # data from the source model if there is no existing data in the target model. OVERWRITE – Import the
        # data from the source model and overwrite the existing data in the target model.
        @[JSON::Field(key: "InferenceDataImportStrategy")]
        getter inference_data_import_strategy : String?

        @[JSON::Field(key: "LabelsInputConfiguration")]
        getter labels_input_configuration : Types::LabelsInputConfiguration?

        # The name for the machine learning model to be created. If the model already exists, Amazon Lookout
        # for Equipment creates a new version. If you do not specify this field, it is filled with the name of
        # the source model.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The Amazon Resource Name (ARN) of a role with permission to access the data source being used to
        # create the machine learning model.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Provides the identifier of the KMS key key used to encrypt model data by Amazon Lookout for
        # Equipment.
        @[JSON::Field(key: "ServerSideKmsKeyId")]
        getter server_side_kms_key_id : String?

        # The tags associated with the machine learning model to be created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @dataset_name : String,
          @source_model_version_arn : String,
          @inference_data_import_strategy : String? = nil,
          @labels_input_configuration : Types::LabelsInputConfiguration? = nil,
          @model_name : String? = nil,
          @role_arn : String? = nil,
          @server_side_kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ImportModelVersionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the model being created.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name for the machine learning model.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The version of the model being created.
        @[JSON::Field(key: "ModelVersion")]
        getter model_version : Int64?

        # The Amazon Resource Name (ARN) of the model version being created.
        @[JSON::Field(key: "ModelVersionArn")]
        getter model_version_arn : String?

        # The status of the ImportModelVersion operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @model_version : Int64? = nil,
          @model_version_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about the specific inference event, including start and end time, diagnostics
      # information, event duration and so on.
      struct InferenceEventSummary
        include JSON::Serializable

        # An array which specifies the names and values of all sensors contributing to an inference event.
        @[JSON::Field(key: "Diagnostics")]
        getter diagnostics : String?

        # Indicates the size of an inference event in seconds.
        @[JSON::Field(key: "EventDurationInSeconds")]
        getter event_duration_in_seconds : Int64?

        # Indicates the ending time of an inference event.
        @[JSON::Field(key: "EventEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter event_end_time : Time?

        # Indicates the starting time of an inference event.
        @[JSON::Field(key: "EventStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter event_start_time : Time?

        # The Amazon Resource Name (ARN) of the inference scheduler being used for the inference event.
        @[JSON::Field(key: "InferenceSchedulerArn")]
        getter inference_scheduler_arn : String?

        # The name of the inference scheduler being used for the inference events.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String?

        def initialize(
          @diagnostics : String? = nil,
          @event_duration_in_seconds : Int64? = nil,
          @event_end_time : Time? = nil,
          @event_start_time : Time? = nil,
          @inference_scheduler_arn : String? = nil,
          @inference_scheduler_name : String? = nil
        )
        end
      end

      # Contains information about the specific inference execution, including input and output data
      # configuration, inference scheduling information, status, and so on.
      struct InferenceExecutionSummary
        include JSON::Serializable

        # The S3 object that the inference execution results were uploaded to.
        @[JSON::Field(key: "CustomerResultObject")]
        getter customer_result_object : Types::S3Object?

        # Indicates the time reference in the dataset at which the inference execution stopped.
        @[JSON::Field(key: "DataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_end_time : Time?

        # Specifies configuration information for the input data for the inference scheduler, including
        # delimiter, format, and dataset location.
        @[JSON::Field(key: "DataInputConfiguration")]
        getter data_input_configuration : Types::InferenceInputConfiguration?

        # Specifies configuration information for the output results from for the inference execution,
        # including the output Amazon S3 location.
        @[JSON::Field(key: "DataOutputConfiguration")]
        getter data_output_configuration : Types::InferenceOutputConfiguration?

        # Indicates the time reference in the dataset at which the inference execution began.
        @[JSON::Field(key: "DataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_start_time : Time?

        # Specifies the reason for failure when an inference execution has failed.
        @[JSON::Field(key: "FailedReason")]
        getter failed_reason : String?

        # The Amazon Resource Name (ARN) of the inference scheduler being used for the inference execution.
        @[JSON::Field(key: "InferenceSchedulerArn")]
        getter inference_scheduler_arn : String?

        # The name of the inference scheduler being used for the inference execution.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String?

        # The Amazon Resource Name (ARN) of the machine learning model used for the inference execution.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the machine learning model being used for the inference execution.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The model version used for the inference execution.
        @[JSON::Field(key: "ModelVersion")]
        getter model_version : Int64?

        # The Amazon Resource Number (ARN) of the model version used for the inference execution.
        @[JSON::Field(key: "ModelVersionArn")]
        getter model_version_arn : String?

        # Indicates the start time at which the inference scheduler began the specific inference execution.
        @[JSON::Field(key: "ScheduledStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter scheduled_start_time : Time?

        # Indicates the status of the inference execution.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @customer_result_object : Types::S3Object? = nil,
          @data_end_time : Time? = nil,
          @data_input_configuration : Types::InferenceInputConfiguration? = nil,
          @data_output_configuration : Types::InferenceOutputConfiguration? = nil,
          @data_start_time : Time? = nil,
          @failed_reason : String? = nil,
          @inference_scheduler_arn : String? = nil,
          @inference_scheduler_name : String? = nil,
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @model_version : Int64? = nil,
          @model_version_arn : String? = nil,
          @scheduled_start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies configuration information for the input data for the inference, including Amazon S3
      # location of input data..
      struct InferenceInputConfiguration
        include JSON::Serializable

        # Specifies configuration information for the input data for the inference, including timestamp format
        # and delimiter.
        @[JSON::Field(key: "InferenceInputNameConfiguration")]
        getter inference_input_name_configuration : Types::InferenceInputNameConfiguration?

        # Indicates the difference between your time zone and Coordinated Universal Time (UTC).
        @[JSON::Field(key: "InputTimeZoneOffset")]
        getter input_time_zone_offset : String?

        # Specifies configuration information for the input data for the inference, including Amazon S3
        # location of input data.
        @[JSON::Field(key: "S3InputConfiguration")]
        getter s3_input_configuration : Types::InferenceS3InputConfiguration?

        def initialize(
          @inference_input_name_configuration : Types::InferenceInputNameConfiguration? = nil,
          @input_time_zone_offset : String? = nil,
          @s3_input_configuration : Types::InferenceS3InputConfiguration? = nil
        )
        end
      end

      # Specifies configuration information for the input data for the inference, including timestamp format
      # and delimiter.
      struct InferenceInputNameConfiguration
        include JSON::Serializable

        # Indicates the delimiter character used between items in the data.
        @[JSON::Field(key: "ComponentTimestampDelimiter")]
        getter component_timestamp_delimiter : String?

        # The format of the timestamp, whether Epoch time, or standard, with or without hyphens (-).
        @[JSON::Field(key: "TimestampFormat")]
        getter timestamp_format : String?

        def initialize(
          @component_timestamp_delimiter : String? = nil,
          @timestamp_format : String? = nil
        )
        end
      end

      # Specifies configuration information for the output results from for the inference, including KMS key
      # ID and output S3 location.
      struct InferenceOutputConfiguration
        include JSON::Serializable

        # Specifies configuration information for the output results from for the inference, output S3
        # location.
        @[JSON::Field(key: "S3OutputConfiguration")]
        getter s3_output_configuration : Types::InferenceS3OutputConfiguration

        # The ID number for the KMS key key used to encrypt the inference output.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @s3_output_configuration : Types::InferenceS3OutputConfiguration,
          @kms_key_id : String? = nil
        )
        end
      end

      # Specifies configuration information for the input data for the inference, including input data S3
      # location.
      struct InferenceS3InputConfiguration
        include JSON::Serializable

        # The bucket containing the input dataset for the inference.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The prefix for the S3 bucket used for the input data for the inference.
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String,
          @prefix : String? = nil
        )
        end
      end

      # Specifies configuration information for the output results from the inference, including output S3
      # location.
      struct InferenceS3OutputConfiguration
        include JSON::Serializable

        # The bucket containing the output results from the inference
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The prefix for the S3 bucket used for the output results from the inference.
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String,
          @prefix : String? = nil
        )
        end
      end

      # Contains information about the specific inference scheduler, including data delay offset, model name
      # and ARN, status, and so on.
      struct InferenceSchedulerSummary
        include JSON::Serializable

        # A period of time (in minutes) by which inference on the data is delayed after the data starts. For
        # instance, if an offset delay time of five minutes was selected, inference will not begin on the data
        # until the first data measurement after the five minute mark. For example, if five minutes is
        # selected, the inference scheduler will wake up at the configured frequency with the additional five
        # minute delay time to check the customer S3 bucket. The customer can upload data at the same
        # frequency and they don't need to stop and restart the scheduler when uploading new data.
        @[JSON::Field(key: "DataDelayOffsetInMinutes")]
        getter data_delay_offset_in_minutes : Int64?

        # How often data is uploaded to the source S3 bucket for the input data. This value is the length of
        # time between data uploads. For instance, if you select 5 minutes, Amazon Lookout for Equipment will
        # upload the real-time data to the source bucket once every 5 minutes. This frequency also determines
        # how often Amazon Lookout for Equipment starts a scheduled inference on your data. In this example,
        # it starts once every 5 minutes.
        @[JSON::Field(key: "DataUploadFrequency")]
        getter data_upload_frequency : String?

        # The Amazon Resource Name (ARN) of the inference scheduler.
        @[JSON::Field(key: "InferenceSchedulerArn")]
        getter inference_scheduler_arn : String?

        # The name of the inference scheduler.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String?

        # Indicates whether the latest execution for the inference scheduler was Anomalous (anomalous events
        # found) or Normal (no anomalous events found).
        @[JSON::Field(key: "LatestInferenceResult")]
        getter latest_inference_result : String?

        # The Amazon Resource Name (ARN) of the machine learning model used by the inference scheduler.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the machine learning model used for the inference scheduler.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # Indicates the status of the inference scheduler.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @data_delay_offset_in_minutes : Int64? = nil,
          @data_upload_frequency : String? = nil,
          @inference_scheduler_arn : String? = nil,
          @inference_scheduler_name : String? = nil,
          @latest_inference_result : String? = nil,
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Gives statistics about how many files have been ingested, and which files have not been ingested,
      # for a particular ingestion job.
      struct IngestedFilesSummary
        include JSON::Serializable

        # Indicates the number of files that were successfully ingested.
        @[JSON::Field(key: "IngestedNumberOfFiles")]
        getter ingested_number_of_files : Int32

        # Indicates the total number of files that were submitted for ingestion.
        @[JSON::Field(key: "TotalNumberOfFiles")]
        getter total_number_of_files : Int32

        # Indicates the number of files that were discarded. A file could be discarded because its format is
        # invalid (for example, a jpg or pdf) or not readable.
        @[JSON::Field(key: "DiscardedFiles")]
        getter discarded_files : Array(Types::S3Object)?

        def initialize(
          @ingested_number_of_files : Int32,
          @total_number_of_files : Int32,
          @discarded_files : Array(Types::S3Object)? = nil
        )
        end
      end

      # Specifies configuration information for the input data for the data ingestion job, including input
      # data S3 location.
      struct IngestionInputConfiguration
        include JSON::Serializable

        # The location information for the S3 bucket used for input data for the data ingestion.
        @[JSON::Field(key: "S3InputConfiguration")]
        getter s3_input_configuration : Types::IngestionS3InputConfiguration

        def initialize(
          @s3_input_configuration : Types::IngestionS3InputConfiguration
        )
        end
      end

      # Specifies S3 configuration information for the input data for the data ingestion job.
      struct IngestionS3InputConfiguration
        include JSON::Serializable

        # The name of the S3 bucket used for the input data for the data ingestion.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The pattern for matching the Amazon S3 files that will be used for ingestion. If the schema was
        # created previously without any KeyPattern, then the default KeyPattern {prefix}/{component_name}/*
        # is used to download files from Amazon S3 according to the schema. This field is required when
        # ingestion is being done for the first time. Valid Values: {prefix}/{component_name}_* |
        # {prefix}/{component_name}/* | {prefix}/{component_name}[DELIMITER]* (Allowed delimiters : space,
        # dot, underscore, hyphen)
        @[JSON::Field(key: "KeyPattern")]
        getter key_pattern : String?

        # The prefix for the S3 location being used for the input data for the data ingestion.
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String,
          @key_pattern : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Entity that comprises aggregated information on sensors having insufficient data.
      struct InsufficientSensorData
        include JSON::Serializable

        # Parameter that describes the total number of sensors that have data completely missing for it.
        @[JSON::Field(key: "MissingCompleteSensorData")]
        getter missing_complete_sensor_data : Types::MissingCompleteSensorData

        # Parameter that describes the total number of sensors that have a short date range of less than 14
        # days of data overall.
        @[JSON::Field(key: "SensorsWithShortDateRange")]
        getter sensors_with_short_date_range : Types::SensorsWithShortDateRange

        def initialize(
          @missing_complete_sensor_data : Types::MissingCompleteSensorData,
          @sensors_with_short_date_range : Types::SensorsWithShortDateRange
        )
        end
      end

      # Processing of the request has failed because of an unknown error, exception or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Entity that comprises aggregated information on sensors having insufficient data.
      struct InvalidSensorData
        include JSON::Serializable

        # Indicates the number of sensors that have at least some invalid values.
        @[JSON::Field(key: "AffectedSensorCount")]
        getter affected_sensor_count : Int32

        # Indicates the total number of invalid values across all the sensors.
        @[JSON::Field(key: "TotalNumberOfInvalidValues")]
        getter total_number_of_invalid_values : Int32

        def initialize(
          @affected_sensor_count : Int32,
          @total_number_of_invalid_values : Int32
        )
        end
      end

      # Contains information about the label group.
      struct LabelGroupSummary
        include JSON::Serializable

        # The time at which the label group was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the label group.
        @[JSON::Field(key: "LabelGroupArn")]
        getter label_group_arn : String?

        # The name of the label group.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String?

        # The time at which the label group was updated.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @label_group_arn : String? = nil,
          @label_group_name : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Information about the label.
      struct LabelSummary
        include JSON::Serializable

        # The time at which the label was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp indicating the end of the label.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Indicates that a label pertains to a particular piece of equipment.
        @[JSON::Field(key: "Equipment")]
        getter equipment : String?

        # Indicates the type of anomaly associated with the label. Data in this field will be retained for
        # service usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "FaultCode")]
        getter fault_code : String?

        # The Amazon Resource Name (ARN) of the label group.
        @[JSON::Field(key: "LabelGroupArn")]
        getter label_group_arn : String?

        # The name of the label group.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String?

        # The ID of the label.
        @[JSON::Field(key: "LabelId")]
        getter label_id : String?

        # Indicates whether a labeled event represents an anomaly.
        @[JSON::Field(key: "Rating")]
        getter rating : String?

        # The timestamp indicating the start of the label.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @created_at : Time? = nil,
          @end_time : Time? = nil,
          @equipment : String? = nil,
          @fault_code : String? = nil,
          @label_group_arn : String? = nil,
          @label_group_name : String? = nil,
          @label_id : String? = nil,
          @rating : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Contains the configuration information for the S3 location being used to hold label data.
      struct LabelsInputConfiguration
        include JSON::Serializable

        # The name of the label group to be used for label data.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String?

        # Contains location information for the S3 location being used for label data.
        @[JSON::Field(key: "S3InputConfiguration")]
        getter s3_input_configuration : Types::LabelsS3InputConfiguration?

        def initialize(
          @label_group_name : String? = nil,
          @s3_input_configuration : Types::LabelsS3InputConfiguration? = nil
        )
        end
      end

      # The location information (prefix and bucket name) for the s3 location being used for label data.
      struct LabelsS3InputConfiguration
        include JSON::Serializable

        # The name of the S3 bucket holding the label data.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The prefix for the S3 bucket used for the label data.
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String,
          @prefix : String? = nil
        )
        end
      end

      # Entity that comprises information on large gaps between consecutive timestamps in data.
      struct LargeTimestampGaps
        include JSON::Serializable

        # Indicates whether there is a potential data issue related to large gaps in timestamps.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Indicates the size of the largest timestamp gap, in days.
        @[JSON::Field(key: "MaxTimestampGapInDays")]
        getter max_timestamp_gap_in_days : Int32?

        # Indicates the number of large timestamp gaps, if there are any.
        @[JSON::Field(key: "NumberOfLargeTimestampGaps")]
        getter number_of_large_timestamp_gaps : Int32?

        def initialize(
          @status : String,
          @max_timestamp_gap_in_days : Int32? = nil,
          @number_of_large_timestamp_gaps : Int32? = nil
        )
        end
      end

      struct ListDataIngestionJobsRequest
        include JSON::Serializable

        # The name of the dataset being used for the data ingestion job.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # Specifies the maximum number of data ingestion jobs to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An opaque pagination token indicating where to continue the listing of data ingestion jobs.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Indicates the status of the data ingestion job.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @dataset_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListDataIngestionJobsResponse
        include JSON::Serializable

        # Specifies information about the specific data ingestion job, including dataset name and status.
        @[JSON::Field(key: "DataIngestionJobSummaries")]
        getter data_ingestion_job_summaries : Array(Types::DataIngestionJobSummary)?

        # An opaque pagination token indicating where to continue the listing of data ingestion jobs.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data_ingestion_job_summaries : Array(Types::DataIngestionJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetsRequest
        include JSON::Serializable

        # The beginning of the name of the datasets to be listed.
        @[JSON::Field(key: "DatasetNameBeginsWith")]
        getter dataset_name_begins_with : String?

        # Specifies the maximum number of datasets to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An opaque pagination token indicating where to continue the listing of datasets.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dataset_name_begins_with : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetsResponse
        include JSON::Serializable

        # Provides information about the specified dataset, including creation time, dataset ARN, and status.
        @[JSON::Field(key: "DatasetSummaries")]
        getter dataset_summaries : Array(Types::DatasetSummary)?

        # An opaque pagination token indicating where to continue the listing of datasets.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dataset_summaries : Array(Types::DatasetSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInferenceEventsRequest
        include JSON::Serializable

        # The name of the inference scheduler for the inference events listed.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String

        # Returns all the inference events with an end start time equal to or greater than less than the end
        # time given.
        @[JSON::Field(key: "IntervalEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter interval_end_time : Time

        # Lookout for Equipment will return all the inference events with an end time equal to or greater than
        # the start time given.
        @[JSON::Field(key: "IntervalStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter interval_start_time : Time

        # Specifies the maximum number of inference events to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An opaque pagination token indicating where to continue the listing of inference events.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @inference_scheduler_name : String,
          @interval_end_time : Time,
          @interval_start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInferenceEventsResponse
        include JSON::Serializable

        # Provides an array of information about the individual inference events returned from the
        # ListInferenceEvents operation, including scheduler used, event start time, event end time,
        # diagnostics, and so on.
        @[JSON::Field(key: "InferenceEventSummaries")]
        getter inference_event_summaries : Array(Types::InferenceEventSummary)?

        # An opaque pagination token indicating where to continue the listing of inference executions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @inference_event_summaries : Array(Types::InferenceEventSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInferenceExecutionsRequest
        include JSON::Serializable

        # The name of the inference scheduler for the inference execution listed.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String

        # The time reference in the inferenced dataset before which Amazon Lookout for Equipment stopped the
        # inference execution.
        @[JSON::Field(key: "DataEndTimeBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_end_time_before : Time?

        # The time reference in the inferenced dataset after which Amazon Lookout for Equipment started the
        # inference execution.
        @[JSON::Field(key: "DataStartTimeAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_start_time_after : Time?

        # Specifies the maximum number of inference executions to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An opaque pagination token indicating where to continue the listing of inference executions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status of the inference execution.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @inference_scheduler_name : String,
          @data_end_time_before : Time? = nil,
          @data_start_time_after : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListInferenceExecutionsResponse
        include JSON::Serializable

        # Provides an array of information about the individual inference executions returned from the
        # ListInferenceExecutions operation, including model used, inference scheduler, data configuration,
        # and so on. If you don't supply the InferenceSchedulerName request parameter, or if you supply the
        # name of an inference scheduler that doesn't exist, ListInferenceExecutions returns an empty array in
        # InferenceExecutionSummaries .
        @[JSON::Field(key: "InferenceExecutionSummaries")]
        getter inference_execution_summaries : Array(Types::InferenceExecutionSummary)?

        # An opaque pagination token indicating where to continue the listing of inference executions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @inference_execution_summaries : Array(Types::InferenceExecutionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInferenceSchedulersRequest
        include JSON::Serializable

        # The beginning of the name of the inference schedulers to be listed.
        @[JSON::Field(key: "InferenceSchedulerNameBeginsWith")]
        getter inference_scheduler_name_begins_with : String?

        # Specifies the maximum number of inference schedulers to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The name of the machine learning model used by the inference scheduler to be listed.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # An opaque pagination token indicating where to continue the listing of inference schedulers.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies the current status of the inference schedulers.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @inference_scheduler_name_begins_with : String? = nil,
          @max_results : Int32? = nil,
          @model_name : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListInferenceSchedulersResponse
        include JSON::Serializable

        # Provides information about the specified inference scheduler, including data upload frequency, model
        # name and ARN, and status.
        @[JSON::Field(key: "InferenceSchedulerSummaries")]
        getter inference_scheduler_summaries : Array(Types::InferenceSchedulerSummary)?

        # An opaque pagination token indicating where to continue the listing of inference schedulers.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @inference_scheduler_summaries : Array(Types::InferenceSchedulerSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLabelGroupsRequest
        include JSON::Serializable

        # The beginning of the name of the label groups to be listed.
        @[JSON::Field(key: "LabelGroupNameBeginsWith")]
        getter label_group_name_begins_with : String?

        # Specifies the maximum number of label groups to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An opaque pagination token indicating where to continue the listing of label groups.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @label_group_name_begins_with : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLabelGroupsResponse
        include JSON::Serializable

        # A summary of the label groups.
        @[JSON::Field(key: "LabelGroupSummaries")]
        getter label_group_summaries : Array(Types::LabelGroupSummary)?

        # An opaque pagination token indicating where to continue the listing of label groups.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @label_group_summaries : Array(Types::LabelGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLabelsRequest
        include JSON::Serializable

        # Returns the name of the label group.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String

        # Lists the labels that pertain to a particular piece of equipment.
        @[JSON::Field(key: "Equipment")]
        getter equipment : String?

        # Returns labels with a particular fault code.
        @[JSON::Field(key: "FaultCode")]
        getter fault_code : String?

        # Returns all labels with a start time earlier than the end time given.
        @[JSON::Field(key: "IntervalEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter interval_end_time : Time?

        # Returns all the labels with a end time equal to or later than the start time given.
        @[JSON::Field(key: "IntervalStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter interval_start_time : Time?

        # Specifies the maximum number of labels to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An opaque pagination token indicating where to continue the listing of label groups.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @label_group_name : String,
          @equipment : String? = nil,
          @fault_code : String? = nil,
          @interval_end_time : Time? = nil,
          @interval_start_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLabelsResponse
        include JSON::Serializable

        # A summary of the items in the label group. If you don't supply the LabelGroupName request parameter,
        # or if you supply the name of a label group that doesn't exist, ListLabels returns an empty array in
        # LabelSummaries .
        @[JSON::Field(key: "LabelSummaries")]
        getter label_summaries : Array(Types::LabelSummary)?

        # An opaque pagination token indicating where to continue the listing of datasets.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @label_summaries : Array(Types::LabelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListModelVersionsRequest
        include JSON::Serializable

        # Then name of the machine learning model for which the model versions are to be listed.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        # Filter results to return all the model versions created before this time.
        @[JSON::Field(key: "CreatedAtEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at_end_time : Time?

        # Filter results to return all the model versions created after this time.
        @[JSON::Field(key: "CreatedAtStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at_start_time : Time?

        # Specifies the highest version of the model to return in the list.
        @[JSON::Field(key: "MaxModelVersion")]
        getter max_model_version : Int64?

        # Specifies the maximum number of machine learning model versions to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies the lowest version of the model to return in the list.
        @[JSON::Field(key: "MinModelVersion")]
        getter min_model_version : Int64?

        # If the total number of results exceeds the limit that the response can display, the response returns
        # an opaque pagination token indicating where to continue the listing of machine learning model
        # versions. Use this token in the NextToken field in the request to list the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter the results based on the way the model version was generated.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # Filter the results based on the current status of the model version.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @model_name : String,
          @created_at_end_time : Time? = nil,
          @created_at_start_time : Time? = nil,
          @max_model_version : Int64? = nil,
          @max_results : Int32? = nil,
          @min_model_version : Int64? = nil,
          @next_token : String? = nil,
          @source_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListModelVersionsResponse
        include JSON::Serializable

        # Provides information on the specified model version, including the created time, model and dataset
        # ARNs, and status. If you don't supply the ModelName request parameter, or if you supply the name of
        # a model that doesn't exist, ListModelVersions returns an empty array in ModelVersionSummaries .
        @[JSON::Field(key: "ModelVersionSummaries")]
        getter model_version_summaries : Array(Types::ModelVersionSummary)?

        # If the total number of results exceeds the limit that the response can display, the response returns
        # an opaque pagination token indicating where to continue the listing of machine learning model
        # versions. Use this token in the NextToken field in the request to list the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @model_version_summaries : Array(Types::ModelVersionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListModelsRequest
        include JSON::Serializable

        # The beginning of the name of the dataset of the machine learning models to be listed.
        @[JSON::Field(key: "DatasetNameBeginsWith")]
        getter dataset_name_begins_with : String?

        # Specifies the maximum number of machine learning models to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The beginning of the name of the machine learning models being listed.
        @[JSON::Field(key: "ModelNameBeginsWith")]
        getter model_name_begins_with : String?

        # An opaque pagination token indicating where to continue the listing of machine learning models.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status of the machine learning model.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @dataset_name_begins_with : String? = nil,
          @max_results : Int32? = nil,
          @model_name_begins_with : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListModelsResponse
        include JSON::Serializable

        # Provides information on the specified model, including created time, model and dataset ARNs, and
        # status.
        @[JSON::Field(key: "ModelSummaries")]
        getter model_summaries : Array(Types::ModelSummary)?

        # An opaque pagination token indicating where to continue the listing of machine learning models.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @model_summaries : Array(Types::ModelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRetrainingSchedulersRequest
        include JSON::Serializable

        # Specifies the maximum number of retraining schedulers to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specify this field to only list retraining schedulers whose machine learning models begin with the
        # value you specify.
        @[JSON::Field(key: "ModelNameBeginsWith")]
        getter model_name_begins_with : String?

        # If the number of results exceeds the maximum, a pagination token is returned. Use the token in the
        # request to show the next page of retraining schedulers.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specify this field to only list retraining schedulers whose status matches the value you specify.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @model_name_begins_with : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListRetrainingSchedulersResponse
        include JSON::Serializable

        # If the number of results exceeds the maximum, this pagination token is returned. Use this token in
        # the request to show the next page of retraining schedulers.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Provides information on the specified retraining scheduler, including the model name, model ARN,
        # status, and start date.
        @[JSON::Field(key: "RetrainingSchedulerSummaries")]
        getter retraining_scheduler_summaries : Array(Types::RetrainingSchedulerSummary)?

        def initialize(
          @next_token : String? = nil,
          @retraining_scheduler_summaries : Array(Types::RetrainingSchedulerSummary)? = nil
        )
        end
      end

      struct ListSensorStatisticsRequest
        include JSON::Serializable

        # The name of the dataset associated with the list of Sensor Statistics.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # The ingestion job id associated with the list of Sensor Statistics. To get sensor statistics for a
        # particular ingestion job id, both dataset name and ingestion job id must be submitted as inputs.
        @[JSON::Field(key: "IngestionJobId")]
        getter ingestion_job_id : String?

        # Specifies the maximum number of sensors for which to retrieve statistics.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An opaque pagination token indicating where to continue the listing of sensor statistics.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dataset_name : String,
          @ingestion_job_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSensorStatisticsResponse
        include JSON::Serializable

        # An opaque pagination token indicating where to continue the listing of sensor statistics.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Provides ingestion-based statistics regarding the specified sensor with respect to various
        # validation types, such as whether data exists, the number and percentage of missing values, and the
        # number and percentage of duplicate timestamps.
        @[JSON::Field(key: "SensorStatisticsSummaries")]
        getter sensor_statistics_summaries : Array(Types::SensorStatisticsSummary)?

        def initialize(
          @next_token : String? = nil,
          @sensor_statistics_summaries : Array(Types::SensorStatisticsSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource (such as the dataset or model) that is the focus of
        # the ListTagsForResource operation.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Any tags associated with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Entity that comprises information on sensors that have sensor data completely missing.
      struct MissingCompleteSensorData
        include JSON::Serializable

        # Indicates the number of sensors that have data missing completely.
        @[JSON::Field(key: "AffectedSensorCount")]
        getter affected_sensor_count : Int32

        def initialize(
          @affected_sensor_count : Int32
        )
        end
      end

      # Entity that comprises aggregated information on sensors having missing data.
      struct MissingSensorData
        include JSON::Serializable

        # Indicates the number of sensors that have atleast some data missing.
        @[JSON::Field(key: "AffectedSensorCount")]
        getter affected_sensor_count : Int32

        # Indicates the total number of missing values across all the sensors.
        @[JSON::Field(key: "TotalNumberOfMissingValues")]
        getter total_number_of_missing_values : Int32

        def initialize(
          @affected_sensor_count : Int32,
          @total_number_of_missing_values : Int32
        )
        end
      end

      # Output configuration information for the pointwise model diagnostics for an Amazon Lookout for
      # Equipment model.
      struct ModelDiagnosticsOutputConfiguration
        include JSON::Serializable

        # The Amazon S3 location for the pointwise model diagnostics.
        @[JSON::Field(key: "S3OutputConfiguration")]
        getter s3_output_configuration : Types::ModelDiagnosticsS3OutputConfiguration

        # The Amazon Web Services Key Management Service (KMS) key identifier to encrypt the pointwise model
        # diagnostics files.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @s3_output_configuration : Types::ModelDiagnosticsS3OutputConfiguration,
          @kms_key_id : String? = nil
        )
        end
      end

      # The Amazon S3 location for the pointwise model diagnostics for an Amazon Lookout for Equipment
      # model.
      struct ModelDiagnosticsS3OutputConfiguration
        include JSON::Serializable

        # The name of the Amazon S3 bucket where the pointwise model diagnostics are located. You must be the
        # owner of the Amazon S3 bucket.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The Amazon S3 prefix for the location of the pointwise model diagnostics. The prefix specifies the
        # folder and evaluation result file name. ( bucket ). When you call CreateModel or UpdateModel ,
        # specify the path within the bucket that you want Lookout for Equipment to save the model to. During
        # training, Lookout for Equipment creates the model evaluation model as a compressed JSON file with
        # the name model_diagnostics_results.json.gz . When you call DescribeModel or DescribeModelVersion ,
        # prefix contains the file path and filename of the model evaluation file.
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String,
          @prefix : String? = nil
        )
        end
      end

      # Provides information about the specified machine learning model, including dataset and model names
      # and ARNs, as well as status.
      struct ModelSummary
        include JSON::Serializable

        # The model version that the inference scheduler uses to run an inference execution.
        @[JSON::Field(key: "ActiveModelVersion")]
        getter active_model_version : Int64?

        # The Amazon Resource Name (ARN) of the model version that is set as active. The active model version
        # is the model version that the inference scheduler uses to run an inference execution.
        @[JSON::Field(key: "ActiveModelVersionArn")]
        getter active_model_version_arn : String?

        # The time at which the specific model was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the dataset used to create the model.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset being used for the machine learning model.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # Indicates the most recent model version that was generated by retraining.
        @[JSON::Field(key: "LatestScheduledRetrainingModelVersion")]
        getter latest_scheduled_retraining_model_version : Int64?

        # Indicates the start time of the most recent scheduled retraining run.
        @[JSON::Field(key: "LatestScheduledRetrainingStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_scheduled_retraining_start_time : Time?

        # Indicates the status of the most recent scheduled retraining run.
        @[JSON::Field(key: "LatestScheduledRetrainingStatus")]
        getter latest_scheduled_retraining_status : String?

        # The Amazon Resource Name (ARN) of the machine learning model.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        @[JSON::Field(key: "ModelDiagnosticsOutputConfiguration")]
        getter model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration?

        # The name of the machine learning model.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # Provides a quality assessment for a model that uses labels. If Lookout for Equipment determines that
        # the model quality is poor based on training metrics, the value is POOR_QUALITY_DETECTED . Otherwise,
        # the value is QUALITY_THRESHOLD_MET . If the model is unlabeled, the model quality can't be assessed
        # and the value of ModelQuality is CANNOT_DETERMINE_QUALITY . In this situation, you can get a model
        # quality assessment by adding labels to the input dataset and retraining the model. For information
        # about using labels with your models, see Understanding labeling . For information about improving
        # the quality of a model, see Best practices with Amazon Lookout for Equipment .
        @[JSON::Field(key: "ModelQuality")]
        getter model_quality : String?

        # Indicates the date that the next scheduled retraining run will start on. Lookout for Equipment
        # truncates the time you provide to the nearest UTC day .
        @[JSON::Field(key: "NextScheduledRetrainingStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter next_scheduled_retraining_start_date : Time?

        # Indicates the status of the retraining scheduler.
        @[JSON::Field(key: "RetrainingSchedulerStatus")]
        getter retraining_scheduler_status : String?

        # Indicates the status of the machine learning model.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @active_model_version : Int64? = nil,
          @active_model_version_arn : String? = nil,
          @created_at : Time? = nil,
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @latest_scheduled_retraining_model_version : Int64? = nil,
          @latest_scheduled_retraining_start_time : Time? = nil,
          @latest_scheduled_retraining_status : String? = nil,
          @model_arn : String? = nil,
          @model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration? = nil,
          @model_name : String? = nil,
          @model_quality : String? = nil,
          @next_scheduled_retraining_start_date : Time? = nil,
          @retraining_scheduler_status : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about the specific model version.
      struct ModelVersionSummary
        include JSON::Serializable

        # The time when this model version was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the model that this model version is a version of.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the model that this model version is a version of.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # Provides a quality assessment for a model that uses labels. If Lookout for Equipment determines that
        # the model quality is poor based on training metrics, the value is POOR_QUALITY_DETECTED . Otherwise,
        # the value is QUALITY_THRESHOLD_MET . If the model is unlabeled, the model quality can't be assessed
        # and the value of ModelQuality is CANNOT_DETERMINE_QUALITY . In this situation, you can get a model
        # quality assessment by adding labels to the input dataset and retraining the model. For information
        # about improving the quality of a model, see Best practices with Amazon Lookout for Equipment .
        @[JSON::Field(key: "ModelQuality")]
        getter model_quality : String?

        # The version of the model.
        @[JSON::Field(key: "ModelVersion")]
        getter model_version : Int64?

        # The Amazon Resource Name (ARN) of the model version.
        @[JSON::Field(key: "ModelVersionArn")]
        getter model_version_arn : String?

        # Indicates how this model version was generated.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The current status of the model version.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @model_quality : String? = nil,
          @model_version : Int64? = nil,
          @model_version_arn : String? = nil,
          @source_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Entity that comprises information on monotonic values in the data.
      struct MonotonicValues
        include JSON::Serializable

        # Indicates whether there is a potential data issue related to having monotonic values.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Indicates the monotonicity of values. Can be INCREASING, DECREASING, or STATIC.
        @[JSON::Field(key: "Monotonicity")]
        getter monotonicity : String?

        def initialize(
          @status : String,
          @monotonicity : String? = nil
        )
        end
      end

      # Entity that comprises information on operating modes in data.
      struct MultipleOperatingModes
        include JSON::Serializable

        # Indicates whether there is a potential data issue related to having multiple operating modes.
        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # A unique identifier for the request. If you do not set the client request token, Amazon Lookout for
        # Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the resource for which the policy is being created.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The JSON-formatted resource policy to create.
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String

        # A unique identifier for a revision of the resource policy.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @client_token : String,
          @resource_arn : String,
          @resource_policy : String,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct PutResourcePolicyResponse
        include JSON::Serializable

        # A unique identifier for a revision of the resource policy.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        # The Amazon Resource Name (ARN) of the resource for which the policy was created.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @policy_revision_id : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # The resource requested could not be found. Verify the resource ID and retry your request.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Provides information about the specified retraining scheduler, including model name, status, start
      # date, frequency, and lookback window.
      struct RetrainingSchedulerSummary
        include JSON::Serializable

        # The number of past days of data used for retraining.
        @[JSON::Field(key: "LookbackWindow")]
        getter lookback_window : String?

        # The ARN of the model that the retraining scheduler is attached to.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the model that the retraining scheduler is attached to.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The frequency at which the model retraining is set. This follows the ISO 8601 guidelines.
        @[JSON::Field(key: "RetrainingFrequency")]
        getter retraining_frequency : String?

        # The start date for the retraining scheduler. Lookout for Equipment truncates the time you provide to
        # the nearest UTC day.
        @[JSON::Field(key: "RetrainingStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter retraining_start_date : Time?

        # The status of the retraining scheduler.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @lookback_window : String? = nil,
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @retraining_frequency : String? = nil,
          @retraining_start_date : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about an S3 bucket.
      struct S3Object
        include JSON::Serializable

        # The name of the specific S3 bucket.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The Amazon Web Services Key Management Service (KMS key) key being used to encrypt the S3 object.
        # Without this key, data in the bucket is not accessible.
        @[JSON::Field(key: "Key")]
        getter key : String

        def initialize(
          @bucket : String,
          @key : String
        )
        end
      end

      # Summary of ingestion statistics like whether data exists, number of missing values, number of
      # invalid values and so on related to the particular sensor.
      struct SensorStatisticsSummary
        include JSON::Serializable

        # Parameter that describes potential risk about whether data associated with the sensor is
        # categorical.
        @[JSON::Field(key: "CategoricalValues")]
        getter categorical_values : Types::CategoricalValues?

        # Name of the component to which the particular sensor belongs for which the statistics belong to.
        @[JSON::Field(key: "ComponentName")]
        getter component_name : String?

        # Indicates the time reference to indicate the end of valid data associated with the sensor that the
        # statistics belong to.
        @[JSON::Field(key: "DataEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_end_time : Time?

        # Parameter that indicates whether data exists for the sensor that the statistics belong to.
        @[JSON::Field(key: "DataExists")]
        getter data_exists : Bool?

        # Indicates the time reference to indicate the beginning of valid data associated with the sensor that
        # the statistics belong to.
        @[JSON::Field(key: "DataStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_start_time : Time?

        # Parameter that describes the total number of duplicate timestamp records associated with the sensor
        # that the statistics belong to.
        @[JSON::Field(key: "DuplicateTimestamps")]
        getter duplicate_timestamps : Types::CountPercent?

        # Parameter that describes the total number of invalid date entries associated with the sensor that
        # the statistics belong to.
        @[JSON::Field(key: "InvalidDateEntries")]
        getter invalid_date_entries : Types::CountPercent?

        # Parameter that describes the total number of, and percentage of, values that are invalid for the
        # sensor that the statistics belong to.
        @[JSON::Field(key: "InvalidValues")]
        getter invalid_values : Types::CountPercent?

        # Parameter that describes potential risk about whether data associated with the sensor contains one
        # or more large gaps between consecutive timestamps.
        @[JSON::Field(key: "LargeTimestampGaps")]
        getter large_timestamp_gaps : Types::LargeTimestampGaps?

        # Parameter that describes the total number of, and percentage of, values that are missing for the
        # sensor that the statistics belong to.
        @[JSON::Field(key: "MissingValues")]
        getter missing_values : Types::CountPercent?

        # Parameter that describes potential risk about whether data associated with the sensor is mostly
        # monotonic.
        @[JSON::Field(key: "MonotonicValues")]
        getter monotonic_values : Types::MonotonicValues?

        # Parameter that describes potential risk about whether data associated with the sensor has more than
        # one operating mode.
        @[JSON::Field(key: "MultipleOperatingModes")]
        getter multiple_operating_modes : Types::MultipleOperatingModes?

        # Name of the sensor that the statistics belong to.
        @[JSON::Field(key: "SensorName")]
        getter sensor_name : String?

        def initialize(
          @categorical_values : Types::CategoricalValues? = nil,
          @component_name : String? = nil,
          @data_end_time : Time? = nil,
          @data_exists : Bool? = nil,
          @data_start_time : Time? = nil,
          @duplicate_timestamps : Types::CountPercent? = nil,
          @invalid_date_entries : Types::CountPercent? = nil,
          @invalid_values : Types::CountPercent? = nil,
          @large_timestamp_gaps : Types::LargeTimestampGaps? = nil,
          @missing_values : Types::CountPercent? = nil,
          @monotonic_values : Types::MonotonicValues? = nil,
          @multiple_operating_modes : Types::MultipleOperatingModes? = nil,
          @sensor_name : String? = nil
        )
        end
      end

      # Entity that comprises information on sensors that have shorter date range.
      struct SensorsWithShortDateRange
        include JSON::Serializable

        # Indicates the number of sensors that have less than 14 days of data.
        @[JSON::Field(key: "AffectedSensorCount")]
        getter affected_sensor_count : Int32

        def initialize(
          @affected_sensor_count : Int32
        )
        end
      end

      # Resource limitations have been exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct StartDataIngestionJobRequest
        include JSON::Serializable

        # A unique identifier for the request. If you do not set the client request token, Amazon Lookout for
        # Equipment generates one.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The name of the dataset being used by the data ingestion job.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # Specifies information for the input data for the data ingestion job, including dataset S3 location.
        @[JSON::Field(key: "IngestionInputConfiguration")]
        getter ingestion_input_configuration : Types::IngestionInputConfiguration

        # The Amazon Resource Name (ARN) of a role with permission to access the data source for the data
        # ingestion job.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        def initialize(
          @client_token : String,
          @dataset_name : String,
          @ingestion_input_configuration : Types::IngestionInputConfiguration,
          @role_arn : String
        )
        end
      end

      struct StartDataIngestionJobResponse
        include JSON::Serializable

        # Indicates the job ID of the data ingestion job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Indicates the status of the StartDataIngestionJob operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @job_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct StartInferenceSchedulerRequest
        include JSON::Serializable

        # The name of the inference scheduler to be started.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String

        def initialize(
          @inference_scheduler_name : String
        )
        end
      end

      struct StartInferenceSchedulerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the inference scheduler being started.
        @[JSON::Field(key: "InferenceSchedulerArn")]
        getter inference_scheduler_arn : String?

        # The name of the inference scheduler being started.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String?

        # The Amazon Resource Name (ARN) of the machine learning model being used by the inference scheduler.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the machine learning model being used by the inference scheduler.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # Indicates the status of the inference scheduler.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @inference_scheduler_arn : String? = nil,
          @inference_scheduler_name : String? = nil,
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct StartRetrainingSchedulerRequest
        include JSON::Serializable

        # The name of the model whose retraining scheduler you want to start.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        def initialize(
          @model_name : String
        )
        end
      end

      struct StartRetrainingSchedulerResponse
        include JSON::Serializable

        # The ARN of the model whose retraining scheduler is being started.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the model whose retraining scheduler is being started.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The status of the retraining scheduler.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct StopInferenceSchedulerRequest
        include JSON::Serializable

        # The name of the inference scheduler to be stopped.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String

        def initialize(
          @inference_scheduler_name : String
        )
        end
      end

      struct StopInferenceSchedulerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the inference schedule being stopped.
        @[JSON::Field(key: "InferenceSchedulerArn")]
        getter inference_scheduler_arn : String?

        # The name of the inference scheduler being stopped.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String?

        # The Amazon Resource Name (ARN) of the machine learning model used by the inference scheduler being
        # stopped.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the machine learning model used by the inference scheduler being stopped.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # Indicates the status of the inference scheduler.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @inference_scheduler_arn : String? = nil,
          @inference_scheduler_name : String? = nil,
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct StopRetrainingSchedulerRequest
        include JSON::Serializable

        # The name of the model whose retraining scheduler you want to stop.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        def initialize(
          @model_name : String
        )
        end
      end

      struct StopRetrainingSchedulerResponse
        include JSON::Serializable

        # The ARN of the model whose retraining scheduler is being stopped.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the model whose retraining scheduler is being stopped.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The status of the retraining scheduler.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A tag is a key-value pair that can be added to a resource as metadata.
      struct Tag
        include JSON::Serializable

        # The key for the specified tag.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for the specified tag.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specific resource to which the tag should be associated.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag or tags to be associated with a specific resource. Both the tag key and value are specified.
        @[JSON::Field(key: "Tags")]
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

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Entity that comprises information abount unsupported timestamps in the dataset.
      struct UnsupportedTimestamps
        include JSON::Serializable

        # Indicates the total number of unsupported timestamps across the ingested data.
        @[JSON::Field(key: "TotalNumberOfUnsupportedTimestamps")]
        getter total_number_of_unsupported_timestamps : Int32

        def initialize(
          @total_number_of_unsupported_timestamps : Int32
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which the tag is currently associated.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Specifies the key of the tag to be removed from a specified resource.
        @[JSON::Field(key: "TagKeys")]
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

      struct UpdateActiveModelVersionRequest
        include JSON::Serializable

        # The name of the machine learning model for which the active model version is being set.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        # The version of the machine learning model for which the active model version is being set.
        @[JSON::Field(key: "ModelVersion")]
        getter model_version : Int64

        def initialize(
          @model_name : String,
          @model_version : Int64
        )
        end
      end

      struct UpdateActiveModelVersionResponse
        include JSON::Serializable

        # The version that is currently active of the machine learning model for which the active model
        # version was set.
        @[JSON::Field(key: "CurrentActiveVersion")]
        getter current_active_version : Int64?

        # The Amazon Resource Name (ARN) of the machine learning model version that is the current active
        # model version.
        @[JSON::Field(key: "CurrentActiveVersionArn")]
        getter current_active_version_arn : String?

        # The Amazon Resource Name (ARN) of the machine learning model for which the active model version was
        # set.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # The name of the machine learning model for which the active model version was set.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The previous version that was active of the machine learning model for which the active model
        # version was set.
        @[JSON::Field(key: "PreviousActiveVersion")]
        getter previous_active_version : Int64?

        # The Amazon Resource Name (ARN) of the machine learning model version that was the previous active
        # model version.
        @[JSON::Field(key: "PreviousActiveVersionArn")]
        getter previous_active_version_arn : String?

        def initialize(
          @current_active_version : Int64? = nil,
          @current_active_version_arn : String? = nil,
          @model_arn : String? = nil,
          @model_name : String? = nil,
          @previous_active_version : Int64? = nil,
          @previous_active_version_arn : String? = nil
        )
        end
      end

      struct UpdateInferenceSchedulerRequest
        include JSON::Serializable

        # The name of the inference scheduler to be updated.
        @[JSON::Field(key: "InferenceSchedulerName")]
        getter inference_scheduler_name : String

        # A period of time (in minutes) by which inference on the data is delayed after the data starts. For
        # instance, if you select an offset delay time of five minutes, inference will not begin on the data
        # until the first data measurement after the five minute mark. For example, if five minutes is
        # selected, the inference scheduler will wake up at the configured frequency with the additional five
        # minute delay time to check the customer S3 bucket. The customer can upload data at the same
        # frequency and they don't need to stop and restart the scheduler when uploading new data.
        @[JSON::Field(key: "DataDelayOffsetInMinutes")]
        getter data_delay_offset_in_minutes : Int64?

        # Specifies information for the input data for the inference scheduler, including delimiter, format,
        # and dataset location.
        @[JSON::Field(key: "DataInputConfiguration")]
        getter data_input_configuration : Types::InferenceInputConfiguration?

        # Specifies information for the output results from the inference scheduler, including the output S3
        # location.
        @[JSON::Field(key: "DataOutputConfiguration")]
        getter data_output_configuration : Types::InferenceOutputConfiguration?

        # How often data is uploaded to the source S3 bucket for the input data. The value chosen is the
        # length of time between data uploads. For instance, if you select 5 minutes, Amazon Lookout for
        # Equipment will upload the real-time data to the source bucket once every 5 minutes. This frequency
        # also determines how often Amazon Lookout for Equipment starts a scheduled inference on your data. In
        # this example, it starts once every 5 minutes.
        @[JSON::Field(key: "DataUploadFrequency")]
        getter data_upload_frequency : String?

        # The Amazon Resource Name (ARN) of a role with permission to access the data source for the inference
        # scheduler.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @inference_scheduler_name : String,
          @data_delay_offset_in_minutes : Int64? = nil,
          @data_input_configuration : Types::InferenceInputConfiguration? = nil,
          @data_output_configuration : Types::InferenceOutputConfiguration? = nil,
          @data_upload_frequency : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct UpdateLabelGroupRequest
        include JSON::Serializable

        # The name of the label group to be updated.
        @[JSON::Field(key: "LabelGroupName")]
        getter label_group_name : String

        # Updates the code indicating the type of anomaly associated with the label. Data in this field will
        # be retained for service usage. Follow best practices for the security of your data.
        @[JSON::Field(key: "FaultCodes")]
        getter fault_codes : Array(String)?

        def initialize(
          @label_group_name : String,
          @fault_codes : Array(String)? = nil
        )
        end
      end

      struct UpdateModelRequest
        include JSON::Serializable

        # The name of the model to update.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        @[JSON::Field(key: "LabelsInputConfiguration")]
        getter labels_input_configuration : Types::LabelsInputConfiguration?

        # The Amazon S3 location where you want Amazon Lookout for Equipment to save the pointwise model
        # diagnostics for the model. You must also specify the RoleArn request parameter.
        @[JSON::Field(key: "ModelDiagnosticsOutputConfiguration")]
        getter model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration?

        # The ARN of the model to update.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @model_name : String,
          @labels_input_configuration : Types::LabelsInputConfiguration? = nil,
          @model_diagnostics_output_configuration : Types::ModelDiagnosticsOutputConfiguration? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct UpdateRetrainingSchedulerRequest
        include JSON::Serializable

        # The name of the model whose retraining scheduler you want to update.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        # The number of past days of data that will be used for retraining.
        @[JSON::Field(key: "LookbackWindow")]
        getter lookback_window : String?

        # Indicates how the service will use new models. In MANAGED mode, new models will automatically be
        # used for inference if they have better performance than the current model. In MANUAL mode, the new
        # models will not be used until they are manually activated .
        @[JSON::Field(key: "PromoteMode")]
        getter promote_mode : String?

        # This parameter uses the ISO 8601 standard to set the frequency at which you want retraining to occur
        # in terms of Years, Months, and/or Days (note: other parameters like Time are not currently
        # supported). The minimum value is 30 days (P30D) and the maximum value is 1 year (P1Y). For example,
        # the following values are valid: P3M15D – Every 3 months and 15 days P2M – Every 2 months P150D –
        # Every 150 days
        @[JSON::Field(key: "RetrainingFrequency")]
        getter retraining_frequency : String?

        # The start date for the retraining scheduler. Lookout for Equipment truncates the time you provide to
        # the nearest UTC day.
        @[JSON::Field(key: "RetrainingStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter retraining_start_date : Time?

        def initialize(
          @model_name : String,
          @lookback_window : String? = nil,
          @promote_mode : String? = nil,
          @retraining_frequency : String? = nil,
          @retraining_start_date : Time? = nil
        )
        end
      end

      # The input fails to satisfy constraints specified by Amazon Lookout for Equipment or a related Amazon
      # Web Services service that's being utilized.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
