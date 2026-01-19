require "json"
require "time"

module AwsSdk
  module IoTAnalytics
    module Types

      # An activity that adds other attributes based on existing attributes in the message.
      struct AddAttributesActivity
        include JSON::Serializable

        # A list of 1-50 AttributeNameMapping objects that map an existing attribute to a new attribute. The
        # existing attributes remain in the message, so if you want to remove the originals, use
        # RemoveAttributeActivity .
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)

        # The name of the addAttributes activity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The next activity in the pipeline.
        @[JSON::Field(key: "next")]
        getter next : String?

        def initialize(
          @attributes : Hash(String, String),
          @name : String,
          @next : String? = nil
        )
        end
      end

      # Contains informations about errors.
      struct BatchPutMessageErrorEntry
        include JSON::Serializable

        # The code associated with the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message associated with the error.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the message that caused the error. See the value corresponding to the messageId key in the
        # message object.
        @[JSON::Field(key: "messageId")]
        getter message_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @message_id : String? = nil
        )
        end
      end

      struct BatchPutMessageRequest
        include JSON::Serializable

        # The name of the channel where the messages are sent.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The list of messages to be sent. Each message has the format: { "messageId": "string", "payload":
        # "string"}. The field names of message payloads (data) that you send to IoT Analytics: Must contain
        # only alphanumeric characters and undescores (_). No other special characters are allowed. Must begin
        # with an alphabetic character or single underscore (_). Cannot contain hyphens (-). In regular
        # expression terms: "^[A-Za-z_]([A-Za-z0-9]*|[A-Za-z0-9][A-Za-z0-9_]*)$". Cannot be more than 255
        # characters. Are case insensitive. (Fields named foo and FOO in the same payload are considered
        # duplicates.) For example, {"temp_01": 29} or {"_temp_01": 29} are valid, but {"temp-01": 29},
        # {"01_temp": 29} or {"__temp_01": 29} are invalid in message payloads.
        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)

        def initialize(
          @channel_name : String,
          @messages : Array(Types::Message)
        )
        end
      end

      struct BatchPutMessageResponse
        include JSON::Serializable

        # A list of any errors encountered when sending the messages to the channel.
        @[JSON::Field(key: "batchPutMessageErrorEntries")]
        getter batch_put_message_error_entries : Array(Types::BatchPutMessageErrorEntry)?

        def initialize(
          @batch_put_message_error_entries : Array(Types::BatchPutMessageErrorEntry)? = nil
        )
        end
      end

      struct CancelPipelineReprocessingRequest
        include JSON::Serializable

        # The name of pipeline for which data reprocessing is canceled.
        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # The ID of the reprocessing task (returned by StartPipelineReprocessing ).
        @[JSON::Field(key: "reprocessingId")]
        getter reprocessing_id : String

        def initialize(
          @pipeline_name : String,
          @reprocessing_id : String
        )
        end
      end

      struct CancelPipelineReprocessingResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A collection of data from an MQTT topic. Channels archive the raw, unprocessed messages before
      # publishing the data to a pipeline.
      struct Channel
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # When the channel was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The last time when a new message arrived in the channel. IoT Analytics updates this value at most
        # once per minute for one channel. Hence, the lastMessageArrivalTime value is an approximation. This
        # feature only applies to messages that arrived in the data store after October 23, 2020.
        @[JSON::Field(key: "lastMessageArrivalTime")]
        getter last_message_arrival_time : Time?

        # When the channel was last updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the channel.
        @[JSON::Field(key: "name")]
        getter name : String?

        # How long, in days, message data is kept for the channel.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # The status of the channel.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Where channel data is stored. You can choose one of serviceManagedS3 or customerManagedS3 storage.
        # If not specified, the default is serviceManagedS3 . You can't change this storage option after the
        # channel is created.
        @[JSON::Field(key: "storage")]
        getter storage : Types::ChannelStorage?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @last_message_arrival_time : Time? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @status : String? = nil,
          @storage : Types::ChannelStorage? = nil
        )
        end
      end

      # The activity that determines the source of the messages to be processed.
      struct ChannelActivity
        include JSON::Serializable

        # The name of the channel from which the messages are processed.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The name of the channel activity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The next activity in the pipeline.
        @[JSON::Field(key: "next")]
        getter next : String?

        def initialize(
          @channel_name : String,
          @name : String,
          @next : String? = nil
        )
        end
      end

      # Specifies one or more sets of channel messages.
      struct ChannelMessages
        include JSON::Serializable

        # Specifies one or more keys that identify the Amazon Simple Storage Service (Amazon S3) objects that
        # save your channel messages. You must use the full path for the key. Example path:
        # channel/mychannel/__dt=2020-02-29
        # 00:00:00/1582940490000_1582940520000_123456789012_mychannel_0_2118.0.json.gz
        @[JSON::Field(key: "s3Paths")]
        getter s3_paths : Array(String)?

        def initialize(
          @s3_paths : Array(String)? = nil
        )
        end
      end

      # Statistics information about the channel.
      struct ChannelStatistics
        include JSON::Serializable

        # The estimated size of the channel.
        @[JSON::Field(key: "size")]
        getter size : Types::EstimatedResourceSize?

        def initialize(
          @size : Types::EstimatedResourceSize? = nil
        )
        end
      end

      # Where channel data is stored. You may choose one of serviceManagedS3 , customerManagedS3 storage. If
      # not specified, the default is serviceManagedS3 . This can't be changed after creation of the
      # channel.
      struct ChannelStorage
        include JSON::Serializable

        # Used to store channel data in an S3 bucket that you manage. If customer managed storage is selected,
        # the retentionPeriod parameter is ignored. You can't change the choice of S3 storage after the data
        # store is created.
        @[JSON::Field(key: "customerManagedS3")]
        getter customer_managed_s3 : Types::CustomerManagedChannelS3Storage?

        # Used to store channel data in an S3 bucket managed by IoT Analytics. You can't change the choice of
        # S3 storage after the data store is created.
        @[JSON::Field(key: "serviceManagedS3")]
        getter service_managed_s3 : Types::ServiceManagedChannelS3Storage?

        def initialize(
          @customer_managed_s3 : Types::CustomerManagedChannelS3Storage? = nil,
          @service_managed_s3 : Types::ServiceManagedChannelS3Storage? = nil
        )
        end
      end

      # Where channel data is stored.
      struct ChannelStorageSummary
        include JSON::Serializable

        # Used to store channel data in an S3 bucket that you manage.
        @[JSON::Field(key: "customerManagedS3")]
        getter customer_managed_s3 : Types::CustomerManagedChannelS3StorageSummary?

        # Used to store channel data in an S3 bucket managed by IoT Analytics.
        @[JSON::Field(key: "serviceManagedS3")]
        getter service_managed_s3 : Types::ServiceManagedChannelS3StorageSummary?

        def initialize(
          @customer_managed_s3 : Types::CustomerManagedChannelS3StorageSummary? = nil,
          @service_managed_s3 : Types::ServiceManagedChannelS3StorageSummary? = nil
        )
        end
      end

      # A summary of information about a channel.
      struct ChannelSummary
        include JSON::Serializable

        # The name of the channel.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # Where channel data is stored.
        @[JSON::Field(key: "channelStorage")]
        getter channel_storage : Types::ChannelStorageSummary?

        # When the channel was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The last time when a new message arrived in the channel. IoT Analytics updates this value at most
        # once per minute for one channel. Hence, the lastMessageArrivalTime value is an approximation. This
        # feature only applies to messages that arrived in the data store after October 23, 2020.
        @[JSON::Field(key: "lastMessageArrivalTime")]
        getter last_message_arrival_time : Time?

        # The last time the channel was updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The status of the channel.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @channel_name : String? = nil,
          @channel_storage : Types::ChannelStorageSummary? = nil,
          @creation_time : Time? = nil,
          @last_message_arrival_time : Time? = nil,
          @last_update_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about a column that stores your data.
      struct Column
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of data. For more information about the supported data types, see Common data types in the
        # Glue Developer Guide .
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # Information required to run the containerAction to produce dataset contents.
      struct ContainerDatasetAction
        include JSON::Serializable

        # The ARN of the role that gives permission to the system to access required resources to run the
        # containerAction . This includes, at minimum, permission to retrieve the dataset contents that are
        # the input to the containerized application.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The ARN of the Docker container stored in your account. The Docker container contains an application
        # and required support libraries and is used to generate dataset contents.
        @[JSON::Field(key: "image")]
        getter image : String

        # Configuration of the resource that executes the containerAction .
        @[JSON::Field(key: "resourceConfiguration")]
        getter resource_configuration : Types::ResourceConfiguration

        # The values of variables used in the context of the execution of the containerized application
        # (basically, parameters passed to the application). Each variable must have a name and a value given
        # by one of stringValue , datasetContentVersionValue , or outputFileUriValue .
        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::Variable)?

        def initialize(
          @execution_role_arn : String,
          @image : String,
          @resource_configuration : Types::ResourceConfiguration,
          @variables : Array(Types::Variable)? = nil
        )
        end
      end

      struct CreateChannelRequest
        include JSON::Serializable

        # The name of the channel.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # Where channel data is stored. You can choose one of serviceManagedS3 or customerManagedS3 storage.
        # If not specified, the default is serviceManagedS3 . You can't change this storage option after the
        # channel is created.
        @[JSON::Field(key: "channelStorage")]
        getter channel_storage : Types::ChannelStorage?

        # How long, in days, message data is kept for the channel. When customerManagedS3 storage is selected,
        # this parameter is ignored.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # Metadata which can be used to manage the channel.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @channel_name : String,
          @channel_storage : Types::ChannelStorage? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateChannelResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String?

        # The name of the channel.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # How long, in days, message data is kept for the channel.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        def initialize(
          @channel_arn : String? = nil,
          @channel_name : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil
        )
        end
      end

      struct CreateDatasetContentRequest
        include JSON::Serializable

        # The name of the dataset.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # The version ID of the dataset content. To specify versionId for a dataset content, the dataset must
        # use a DeltaTimer filter.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @dataset_name : String,
          @version_id : String? = nil
        )
        end
      end

      struct CreateDatasetContentResponse
        include JSON::Serializable

        # The version ID of the dataset contents that are being created.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @version_id : String? = nil
        )
        end
      end

      struct CreateDatasetRequest
        include JSON::Serializable

        # A list of actions that create the dataset contents.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::DatasetAction)

        # The name of the dataset.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # When dataset contents are created, they are delivered to destinations specified here.
        @[JSON::Field(key: "contentDeliveryRules")]
        getter content_delivery_rules : Array(Types::DatasetContentDeliveryRule)?

        # A list of data rules that send notifications to CloudWatch, when data arrives late. To specify
        # lateDataRules , the dataset must use a DeltaTimer filter.
        @[JSON::Field(key: "lateDataRules")]
        getter late_data_rules : Array(Types::LateDataRule)?

        # Optional. How long, in days, versions of dataset contents are kept for the dataset. If not specified
        # or set to null , versions of dataset contents are retained for at most 90 days. The number of
        # versions of dataset contents retained is determined by the versioningConfiguration parameter. For
        # more information, see Keeping Multiple Versions of IoT Analytics datasets in the IoT Analytics User
        # Guide .
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # Metadata which can be used to manage the dataset.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # A list of triggers. A trigger causes dataset contents to be populated at a specified time interval
        # or when another dataset's contents are created. The list of triggers can be empty or contain up to
        # five DataSetTrigger objects.
        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::DatasetTrigger)?

        # Optional. How many versions of dataset contents are kept. If not specified or set to null, only the
        # latest version plus the latest succeeded version (if they are different) are kept for the time
        # period specified by the retentionPeriod parameter. For more information, see Keeping Multiple
        # Versions of IoT Analytics datasets in the IoT Analytics User Guide .
        @[JSON::Field(key: "versioningConfiguration")]
        getter versioning_configuration : Types::VersioningConfiguration?

        def initialize(
          @actions : Array(Types::DatasetAction),
          @dataset_name : String,
          @content_delivery_rules : Array(Types::DatasetContentDeliveryRule)? = nil,
          @late_data_rules : Array(Types::LateDataRule)? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @tags : Array(Types::Tag)? = nil,
          @triggers : Array(Types::DatasetTrigger)? = nil,
          @versioning_configuration : Types::VersioningConfiguration? = nil
        )
        end
      end

      struct CreateDatasetResponse
        include JSON::Serializable

        # The ARN of the dataset.
        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # The name of the dataset.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String?

        # How long, in days, dataset contents are kept for the dataset.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        def initialize(
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil
        )
        end
      end

      struct CreateDatastoreRequest
        include JSON::Serializable

        # The name of the data store.
        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String

        # Contains information about the partition dimensions in a data store.
        @[JSON::Field(key: "datastorePartitions")]
        getter datastore_partitions : Types::DatastorePartitions?

        # Where data in a data store is stored.. You can choose serviceManagedS3 storage, customerManagedS3
        # storage, or iotSiteWiseMultiLayerStorage storage. The default is serviceManagedS3 . You can't change
        # the choice of Amazon S3 storage after your data store is created.
        @[JSON::Field(key: "datastoreStorage")]
        getter datastore_storage : Types::DatastoreStorage?

        # Contains the configuration information of file formats. IoT Analytics data stores support JSON and
        # Parquet . The default file format is JSON. You can specify only one format. You can't change the
        # file format after you create the data store.
        @[JSON::Field(key: "fileFormatConfiguration")]
        getter file_format_configuration : Types::FileFormatConfiguration?

        # How long, in days, message data is kept for the data store. When customerManagedS3 storage is
        # selected, this parameter is ignored.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # Metadata which can be used to manage the data store.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @datastore_name : String,
          @datastore_partitions : Types::DatastorePartitions? = nil,
          @datastore_storage : Types::DatastoreStorage? = nil,
          @file_format_configuration : Types::FileFormatConfiguration? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDatastoreResponse
        include JSON::Serializable

        # The ARN of the data store.
        @[JSON::Field(key: "datastoreArn")]
        getter datastore_arn : String?

        # The name of the data store.
        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String?

        # How long, in days, message data is kept for the data store.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        def initialize(
          @datastore_arn : String? = nil,
          @datastore_name : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil
        )
        end
      end

      struct CreatePipelineRequest
        include JSON::Serializable

        # A list of PipelineActivity objects. Activities perform transformations on your messages, such as
        # removing, renaming or adding message attributes; filtering messages based on attribute values;
        # invoking your Lambda unctions on messages for advanced processing; or performing mathematical
        # transformations to normalize device data. The list can be 2-25 PipelineActivity objects and must
        # contain both a channel and a datastore activity. Each entry in the list must contain only one
        # activity. For example: pipelineActivities = [ { "channel": { ... } }, { "lambda": { ... } }, ... ]
        @[JSON::Field(key: "pipelineActivities")]
        getter pipeline_activities : Array(Types::PipelineActivity)

        # The name of the pipeline.
        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # Metadata which can be used to manage the pipeline.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @pipeline_activities : Array(Types::PipelineActivity),
          @pipeline_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePipelineResponse
        include JSON::Serializable

        # The ARN of the pipeline.
        @[JSON::Field(key: "pipelineArn")]
        getter pipeline_arn : String?

        # The name of the pipeline.
        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String?

        def initialize(
          @pipeline_arn : String? = nil,
          @pipeline_name : String? = nil
        )
        end
      end

      # Used to store channel data in an S3 bucket that you manage. If customer-managed storage is selected,
      # the retentionPeriod parameter is ignored. You can't change the choice of S3 storage after the data
      # store is created.
      struct CustomerManagedChannelS3Storage
        include JSON::Serializable

        # The name of the S3 bucket in which channel data is stored.
        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The ARN of the role that grants IoT Analytics permission to interact with your Amazon S3 resources.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # (Optional) The prefix used to create the keys of the channel data objects. Each object in an S3
        # bucket has a key that is its unique identifier in the bucket. Each object in a bucket has exactly
        # one key. The prefix must end with a forward slash (/).
        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String,
          @role_arn : String,
          @key_prefix : String? = nil
        )
        end
      end

      # Used to store channel data in an S3 bucket that you manage.
      struct CustomerManagedChannelS3StorageSummary
        include JSON::Serializable

        # The name of the S3 bucket in which channel data is stored.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # (Optional) The prefix used to create the keys of the channel data objects. Each object in an S3
        # bucket has a key that is its unique identifier within the bucket (each object in a bucket has
        # exactly one key). The prefix must end with a forward slash (/).
        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        # The ARN of the role that grants IoT Analytics permission to interact with your Amazon S3 resources.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @bucket : String? = nil,
          @key_prefix : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # S3-customer-managed; When you choose customer-managed storage, the retentionPeriod parameter is
      # ignored. You can't change the choice of Amazon S3 storage after your data store is created.
      struct CustomerManagedDatastoreS3Storage
        include JSON::Serializable

        # The name of the Amazon S3 bucket where your data is stored.
        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The ARN of the role that grants IoT Analytics permission to interact with your Amazon S3 resources.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # (Optional) The prefix used to create the keys of the data store data objects. Each object in an
        # Amazon S3 bucket has a key that is its unique identifier in the bucket. Each object in a bucket has
        # exactly one key. The prefix must end with a forward slash (/).
        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String,
          @role_arn : String,
          @key_prefix : String? = nil
        )
        end
      end

      # Contains information about the data store that you manage.
      struct CustomerManagedDatastoreS3StorageSummary
        include JSON::Serializable

        # The name of the Amazon S3 bucket where your data is stored.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # (Optional) The prefix used to create the keys of the data store data objects. Each object in an
        # Amazon S3 bucket has a key that is its unique identifier in the bucket. Each object in a bucket has
        # exactly one key. The prefix must end with a forward slash (/).
        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        # The ARN of the role that grants IoT Analytics permission to interact with your Amazon S3 resources.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @bucket : String? = nil,
          @key_prefix : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Information about a dataset.
      struct Dataset
        include JSON::Serializable

        # The DatasetAction objects that automatically create the dataset contents.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::DatasetAction)?

        # The ARN of the dataset.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # When dataset contents are created they are delivered to destinations specified here.
        @[JSON::Field(key: "contentDeliveryRules")]
        getter content_delivery_rules : Array(Types::DatasetContentDeliveryRule)?

        # When the dataset was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The last time the dataset was updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # A list of data rules that send notifications to CloudWatch, when data arrives late. To specify
        # lateDataRules , the dataset must use a DeltaTimer filter.
        @[JSON::Field(key: "lateDataRules")]
        getter late_data_rules : Array(Types::LateDataRule)?

        # The name of the dataset.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Optional. How long, in days, message data is kept for the dataset.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # The status of the dataset.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The DatasetTrigger objects that specify when the dataset is automatically updated.
        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::DatasetTrigger)?

        # Optional. How many versions of dataset contents are kept. If not specified or set to null, only the
        # latest version plus the latest succeeded version (if they are different) are kept for the time
        # period specified by the retentionPeriod parameter. For more information, see Keeping Multiple
        # Versions of IoT Analytics datasets in the IoT Analytics User Guide .
        @[JSON::Field(key: "versioningConfiguration")]
        getter versioning_configuration : Types::VersioningConfiguration?

        def initialize(
          @actions : Array(Types::DatasetAction)? = nil,
          @arn : String? = nil,
          @content_delivery_rules : Array(Types::DatasetContentDeliveryRule)? = nil,
          @creation_time : Time? = nil,
          @last_update_time : Time? = nil,
          @late_data_rules : Array(Types::LateDataRule)? = nil,
          @name : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @status : String? = nil,
          @triggers : Array(Types::DatasetTrigger)? = nil,
          @versioning_configuration : Types::VersioningConfiguration? = nil
        )
        end
      end

      # A DatasetAction object that specifies how dataset contents are automatically created.
      struct DatasetAction
        include JSON::Serializable

        # The name of the dataset action by which dataset contents are automatically created.
        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # Information that allows the system to run a containerized application to create the dataset
        # contents. The application must be in a Docker container along with any required support libraries.
        @[JSON::Field(key: "containerAction")]
        getter container_action : Types::ContainerDatasetAction?

        # An SqlQueryDatasetAction object that uses an SQL query to automatically create dataset contents.
        @[JSON::Field(key: "queryAction")]
        getter query_action : Types::SqlQueryDatasetAction?

        def initialize(
          @action_name : String? = nil,
          @container_action : Types::ContainerDatasetAction? = nil,
          @query_action : Types::SqlQueryDatasetAction? = nil
        )
        end
      end

      # Information about the action that automatically creates the dataset's contents.
      struct DatasetActionSummary
        include JSON::Serializable

        # The name of the action that automatically creates the dataset's contents.
        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # The type of action by which the dataset's contents are automatically created.
        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        def initialize(
          @action_name : String? = nil,
          @action_type : String? = nil
        )
        end
      end

      # The destination to which dataset contents are delivered.
      struct DatasetContentDeliveryDestination
        include JSON::Serializable

        # Configuration information for delivery of dataset contents to IoT Events.
        @[JSON::Field(key: "iotEventsDestinationConfiguration")]
        getter iot_events_destination_configuration : Types::IotEventsDestinationConfiguration?

        # Configuration information for delivery of dataset contents to Amazon S3.
        @[JSON::Field(key: "s3DestinationConfiguration")]
        getter s3_destination_configuration : Types::S3DestinationConfiguration?

        def initialize(
          @iot_events_destination_configuration : Types::IotEventsDestinationConfiguration? = nil,
          @s3_destination_configuration : Types::S3DestinationConfiguration? = nil
        )
        end
      end

      # When dataset contents are created, they are delivered to destination specified here.
      struct DatasetContentDeliveryRule
        include JSON::Serializable

        # The destination to which dataset contents are delivered.
        @[JSON::Field(key: "destination")]
        getter destination : Types::DatasetContentDeliveryDestination

        # The name of the dataset content delivery rules entry.
        @[JSON::Field(key: "entryName")]
        getter entry_name : String?

        def initialize(
          @destination : Types::DatasetContentDeliveryDestination,
          @entry_name : String? = nil
        )
        end
      end

      # The state of the dataset contents and the reason they are in this state.
      struct DatasetContentStatus
        include JSON::Serializable

        # The reason the dataset contents are in this state.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The state of the dataset contents. Can be one of READY, CREATING, SUCCEEDED, or FAILED.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @reason : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Summary information about dataset contents.
      struct DatasetContentSummary
        include JSON::Serializable

        # The time the dataset content status was updated to SUCCEEDED or FAILED.
        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # The actual time the creation of the dataset contents was started.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time the creation of the dataset contents was scheduled to start.
        @[JSON::Field(key: "scheduleTime")]
        getter schedule_time : Time?

        # The status of the dataset contents.
        @[JSON::Field(key: "status")]
        getter status : Types::DatasetContentStatus?

        # The version of the dataset contents.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @completion_time : Time? = nil,
          @creation_time : Time? = nil,
          @schedule_time : Time? = nil,
          @status : Types::DatasetContentStatus? = nil,
          @version : String? = nil
        )
        end
      end

      # The dataset whose latest contents are used as input to the notebook or application.
      struct DatasetContentVersionValue
        include JSON::Serializable

        # The name of the dataset whose latest contents are used as input to the notebook or application.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        def initialize(
          @dataset_name : String
        )
        end
      end

      # The reference to a dataset entry.
      struct DatasetEntry
        include JSON::Serializable

        # The presigned URI of the dataset item.
        @[JSON::Field(key: "dataURI")]
        getter data_uri : String?

        # The name of the dataset item.
        @[JSON::Field(key: "entryName")]
        getter entry_name : String?

        def initialize(
          @data_uri : String? = nil,
          @entry_name : String? = nil
        )
        end
      end

      # A summary of information about a dataset.
      struct DatasetSummary
        include JSON::Serializable

        # A list of DataActionSummary objects.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::DatasetActionSummary)?

        # The time the dataset was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The name of the dataset.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String?

        # The last time the dataset was updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The status of the dataset.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of triggers. A trigger causes dataset content to be populated at a specified time interval or
        # when another dataset is populated. The list of triggers can be empty or contain up to five
        # DataSetTrigger objects
        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::DatasetTrigger)?

        def initialize(
          @actions : Array(Types::DatasetActionSummary)? = nil,
          @creation_time : Time? = nil,
          @dataset_name : String? = nil,
          @last_update_time : Time? = nil,
          @status : String? = nil,
          @triggers : Array(Types::DatasetTrigger)? = nil
        )
        end
      end

      # The DatasetTrigger that specifies when the dataset is automatically updated.
      struct DatasetTrigger
        include JSON::Serializable

        # The dataset whose content creation triggers the creation of this dataset's contents.
        @[JSON::Field(key: "dataset")]
        getter dataset : Types::TriggeringDataset?

        # The Schedule when the trigger is initiated.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        def initialize(
          @dataset : Types::TriggeringDataset? = nil,
          @schedule : Types::Schedule? = nil
        )
        end
      end

      # Information about a data store.
      struct Datastore
        include JSON::Serializable

        # The ARN of the data store.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # When the data store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Contains information about the partition dimensions in a data store.
        @[JSON::Field(key: "datastorePartitions")]
        getter datastore_partitions : Types::DatastorePartitions?

        # Contains the configuration information of file formats. IoT Analytics data stores support JSON and
        # Parquet . The default file format is JSON. You can specify only one format. You can't change the
        # file format after you create the data store.
        @[JSON::Field(key: "fileFormatConfiguration")]
        getter file_format_configuration : Types::FileFormatConfiguration?

        # The last time when a new message arrived in the data store. IoT Analytics updates this value at most
        # once per minute for Amazon Simple Storage Service one data store. Hence, the lastMessageArrivalTime
        # value is an approximation. This feature only applies to messages that arrived in the data store
        # after October 23, 2020.
        @[JSON::Field(key: "lastMessageArrivalTime")]
        getter last_message_arrival_time : Time?

        # The last time the data store was updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the data store.
        @[JSON::Field(key: "name")]
        getter name : String?

        # How long, in days, message data is kept for the data store. When customerManagedS3 storage is
        # selected, this parameter is ignored.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # The status of a data store: CREATING The data store is being created. ACTIVE The data store has been
        # created and can be used. DELETING The data store is being deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Where data in a data store is stored.. You can choose serviceManagedS3 storage, customerManagedS3
        # storage, or iotSiteWiseMultiLayerStorage storage. The default is serviceManagedS3 . You can't change
        # the choice of Amazon S3 storage after your data store is created.
        @[JSON::Field(key: "storage")]
        getter storage : Types::DatastoreStorage?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @datastore_partitions : Types::DatastorePartitions? = nil,
          @file_format_configuration : Types::FileFormatConfiguration? = nil,
          @last_message_arrival_time : Time? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @status : String? = nil,
          @storage : Types::DatastoreStorage? = nil
        )
        end
      end

      # The datastore activity that specifies where to store the processed data.
      struct DatastoreActivity
        include JSON::Serializable

        # The name of the data store where processed messages are stored.
        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String

        # The name of the datastore activity.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @datastore_name : String,
          @name : String
        )
        end
      end

      # Used to store data used by IoT SiteWise in an Amazon S3 bucket that you manage. You can't change the
      # choice of Amazon S3 storage after your data store is created.
      struct DatastoreIotSiteWiseMultiLayerStorage
        include JSON::Serializable

        # Used to store data used by IoT SiteWise in an Amazon S3 bucket that you manage.
        @[JSON::Field(key: "customerManagedS3Storage")]
        getter customer_managed_s3_storage : Types::IotSiteWiseCustomerManagedDatastoreS3Storage

        def initialize(
          @customer_managed_s3_storage : Types::IotSiteWiseCustomerManagedDatastoreS3Storage
        )
        end
      end

      # Contains information about the data store that you manage, which stores data used by IoT SiteWise.
      struct DatastoreIotSiteWiseMultiLayerStorageSummary
        include JSON::Serializable

        # Used to store data used by IoT SiteWise in an Amazon S3 bucket that you manage.
        @[JSON::Field(key: "customerManagedS3Storage")]
        getter customer_managed_s3_storage : Types::IotSiteWiseCustomerManagedDatastoreS3StorageSummary?

        def initialize(
          @customer_managed_s3_storage : Types::IotSiteWiseCustomerManagedDatastoreS3StorageSummary? = nil
        )
        end
      end

      # A single dimension to partition a data store. The dimension must be an AttributePartition or a
      # TimestampPartition .
      struct DatastorePartition
        include JSON::Serializable

        # A partition dimension defined by an attributeName .
        @[JSON::Field(key: "attributePartition")]
        getter attribute_partition : Types::Partition?

        # A partition dimension defined by a timestamp attribute.
        @[JSON::Field(key: "timestampPartition")]
        getter timestamp_partition : Types::TimestampPartition?

        def initialize(
          @attribute_partition : Types::Partition? = nil,
          @timestamp_partition : Types::TimestampPartition? = nil
        )
        end
      end

      # Contains information about the partition dimensions in a data store.
      struct DatastorePartitions
        include JSON::Serializable

        # A list of partition dimensions in a data store.
        @[JSON::Field(key: "partitions")]
        getter partitions : Array(Types::DatastorePartition)?

        def initialize(
          @partitions : Array(Types::DatastorePartition)? = nil
        )
        end
      end

      # Statistical information about the data store.
      struct DatastoreStatistics
        include JSON::Serializable

        # The estimated size of the data store.
        @[JSON::Field(key: "size")]
        getter size : Types::EstimatedResourceSize?

        def initialize(
          @size : Types::EstimatedResourceSize? = nil
        )
        end
      end

      # Where data in a data store is stored.. You can choose serviceManagedS3 storage, customerManagedS3
      # storage, or iotSiteWiseMultiLayerStorage storage. The default is serviceManagedS3 . You can't change
      # the choice of Amazon S3 storage after your data store is created.
      struct DatastoreStorage
        include JSON::Serializable

        # S3-customer-managed; When you choose customer-managed storage, the retentionPeriod parameter is
        # ignored. You can't change the choice of Amazon S3 storage after your data store is created.
        @[JSON::Field(key: "customerManagedS3")]
        getter customer_managed_s3 : Types::CustomerManagedDatastoreS3Storage?

        # Used to store data used by IoT SiteWise in an Amazon S3 bucket that you manage. You can't change the
        # choice of Amazon S3 storage after your data store is created.
        @[JSON::Field(key: "iotSiteWiseMultiLayerStorage")]
        getter iot_site_wise_multi_layer_storage : Types::DatastoreIotSiteWiseMultiLayerStorage?

        # Used to store data in an Amazon S3 bucket managed by IoT Analytics. You can't change the choice of
        # Amazon S3 storage after your data store is created.
        @[JSON::Field(key: "serviceManagedS3")]
        getter service_managed_s3 : Types::ServiceManagedDatastoreS3Storage?

        def initialize(
          @customer_managed_s3 : Types::CustomerManagedDatastoreS3Storage? = nil,
          @iot_site_wise_multi_layer_storage : Types::DatastoreIotSiteWiseMultiLayerStorage? = nil,
          @service_managed_s3 : Types::ServiceManagedDatastoreS3Storage? = nil
        )
        end
      end

      # Contains information about your data store.
      struct DatastoreStorageSummary
        include JSON::Serializable

        # Used to store data in an Amazon S3 bucket managed by IoT Analytics.
        @[JSON::Field(key: "customerManagedS3")]
        getter customer_managed_s3 : Types::CustomerManagedDatastoreS3StorageSummary?

        # Used to store data used by IoT SiteWise in an Amazon S3 bucket that you manage.
        @[JSON::Field(key: "iotSiteWiseMultiLayerStorage")]
        getter iot_site_wise_multi_layer_storage : Types::DatastoreIotSiteWiseMultiLayerStorageSummary?

        # Used to store data in an Amazon S3 bucket managed by IoT Analytics.
        @[JSON::Field(key: "serviceManagedS3")]
        getter service_managed_s3 : Types::ServiceManagedDatastoreS3StorageSummary?

        def initialize(
          @customer_managed_s3 : Types::CustomerManagedDatastoreS3StorageSummary? = nil,
          @iot_site_wise_multi_layer_storage : Types::DatastoreIotSiteWiseMultiLayerStorageSummary? = nil,
          @service_managed_s3 : Types::ServiceManagedDatastoreS3StorageSummary? = nil
        )
        end
      end

      # A summary of information about a data store.
      struct DatastoreSummary
        include JSON::Serializable

        # When the data store was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The name of the data store.
        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String?

        # Contains information about the partition dimensions in a data store.
        @[JSON::Field(key: "datastorePartitions")]
        getter datastore_partitions : Types::DatastorePartitions?

        # Where data in a data store is stored.
        @[JSON::Field(key: "datastoreStorage")]
        getter datastore_storage : Types::DatastoreStorageSummary?

        # The file format of the data in the data store.
        @[JSON::Field(key: "fileFormatType")]
        getter file_format_type : String?

        # The last time when a new message arrived in the data store. IoT Analytics updates this value at most
        # once per minute for Amazon Simple Storage Service one data store. Hence, the lastMessageArrivalTime
        # value is an approximation. This feature only applies to messages that arrived in the data store
        # after October 23, 2020.
        @[JSON::Field(key: "lastMessageArrivalTime")]
        getter last_message_arrival_time : Time?

        # The last time the data store was updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The status of the data store.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @datastore_name : String? = nil,
          @datastore_partitions : Types::DatastorePartitions? = nil,
          @datastore_storage : Types::DatastoreStorageSummary? = nil,
          @file_format_type : String? = nil,
          @last_message_arrival_time : Time? = nil,
          @last_update_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteChannelRequest
        include JSON::Serializable

        # The name of the channel to delete.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        def initialize(
          @channel_name : String
        )
        end
      end

      struct DeleteDatasetContentRequest
        include JSON::Serializable

        # The name of the dataset whose content is deleted.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # The version of the dataset whose content is deleted. You can also use the strings "$LATEST" or
        # "$LATEST_SUCCEEDED" to delete the latest or latest successfully completed data set. If not
        # specified, "$LATEST_SUCCEEDED" is the default.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @dataset_name : String,
          @version_id : String? = nil
        )
        end
      end

      struct DeleteDatasetRequest
        include JSON::Serializable

        # The name of the dataset to delete.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        def initialize(
          @dataset_name : String
        )
        end
      end

      struct DeleteDatastoreRequest
        include JSON::Serializable

        # The name of the data store to delete.
        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String

        def initialize(
          @datastore_name : String
        )
        end
      end

      struct DeletePipelineRequest
        include JSON::Serializable

        # The name of the pipeline to delete.
        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        def initialize(
          @pipeline_name : String
        )
        end
      end

      # Used to limit data to that which has arrived since the last execution of the action.
      struct DeltaTime
        include JSON::Serializable

        # The number of seconds of estimated in-flight lag time of message data. When you create dataset
        # contents using message data from a specified timeframe, some message data might still be in flight
        # when processing begins, and so do not arrive in time to be processed. Use this field to make
        # allowances for the in flight time of your message data, so that data not processed from a previous
        # timeframe is included with the next timeframe. Otherwise, missed message data would be excluded from
        # processing during the next timeframe too, because its timestamp places it within the previous
        # timeframe.
        @[JSON::Field(key: "offsetSeconds")]
        getter offset_seconds : Int32

        # An expression by which the time of the message data might be determined. This can be the name of a
        # timestamp field or a SQL expression that is used to derive the time the message data was generated.
        @[JSON::Field(key: "timeExpression")]
        getter time_expression : String

        def initialize(
          @offset_seconds : Int32,
          @time_expression : String
        )
        end
      end

      # A structure that contains the configuration information of a delta time session window. DeltaTime
      # specifies a time interval. You can use DeltaTime to create dataset contents with data that has
      # arrived in the data store since the last execution. For an example of DeltaTime , see Creating a SQL
      # dataset with a delta window (CLI) in the IoT Analytics User Guide .
      struct DeltaTimeSessionWindowConfiguration
        include JSON::Serializable

        # A time interval. You can use timeoutInMinutes so that IoT Analytics can batch up late data
        # notifications that have been generated since the last execution. IoT Analytics sends one batch of
        # notifications to Amazon CloudWatch Events at one time. For more information about how to write a
        # timestamp expression, see Date and Time Functions and Operators , in the Presto 0.172 Documentation
        # .
        @[JSON::Field(key: "timeoutInMinutes")]
        getter timeout_in_minutes : Int32

        def initialize(
          @timeout_in_minutes : Int32
        )
        end
      end

      struct DescribeChannelRequest
        include JSON::Serializable

        # The name of the channel whose information is retrieved.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # If true, additional statistical information about the channel is included in the response. This
        # feature can't be used with a channel whose S3 storage is customer-managed.
        @[JSON::Field(key: "includeStatistics")]
        getter include_statistics : Bool?

        def initialize(
          @channel_name : String,
          @include_statistics : Bool? = nil
        )
        end
      end

      struct DescribeChannelResponse
        include JSON::Serializable

        # An object that contains information about the channel.
        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        # Statistics about the channel. Included if the includeStatistics parameter is set to true in the
        # request.
        @[JSON::Field(key: "statistics")]
        getter statistics : Types::ChannelStatistics?

        def initialize(
          @channel : Types::Channel? = nil,
          @statistics : Types::ChannelStatistics? = nil
        )
        end
      end

      struct DescribeDatasetRequest
        include JSON::Serializable

        # The name of the dataset whose information is retrieved.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        def initialize(
          @dataset_name : String
        )
        end
      end

      struct DescribeDatasetResponse
        include JSON::Serializable

        # An object that contains information about the dataset.
        @[JSON::Field(key: "dataset")]
        getter dataset : Types::Dataset?

        def initialize(
          @dataset : Types::Dataset? = nil
        )
        end
      end

      struct DescribeDatastoreRequest
        include JSON::Serializable

        # The name of the data store
        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String

        # If true, additional statistical information about the data store is included in the response. This
        # feature can't be used with a data store whose S3 storage is customer-managed.
        @[JSON::Field(key: "includeStatistics")]
        getter include_statistics : Bool?

        def initialize(
          @datastore_name : String,
          @include_statistics : Bool? = nil
        )
        end
      end

      struct DescribeDatastoreResponse
        include JSON::Serializable

        # Information about the data store.
        @[JSON::Field(key: "datastore")]
        getter datastore : Types::Datastore?

        # Additional statistical information about the data store. Included if the includeStatistics parameter
        # is set to true in the request.
        @[JSON::Field(key: "statistics")]
        getter statistics : Types::DatastoreStatistics?

        def initialize(
          @datastore : Types::Datastore? = nil,
          @statistics : Types::DatastoreStatistics? = nil
        )
        end
      end

      struct DescribeLoggingOptionsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeLoggingOptionsResponse
        include JSON::Serializable

        # The current settings of the IoT Analytics logging options.
        @[JSON::Field(key: "loggingOptions")]
        getter logging_options : Types::LoggingOptions?

        def initialize(
          @logging_options : Types::LoggingOptions? = nil
        )
        end
      end

      struct DescribePipelineRequest
        include JSON::Serializable

        # The name of the pipeline whose information is retrieved.
        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        def initialize(
          @pipeline_name : String
        )
        end
      end

      struct DescribePipelineResponse
        include JSON::Serializable

        # A Pipeline object that contains information about the pipeline.
        @[JSON::Field(key: "pipeline")]
        getter pipeline : Types::Pipeline?

        def initialize(
          @pipeline : Types::Pipeline? = nil
        )
        end
      end

      # An activity that adds data from the IoT device registry to your message.
      struct DeviceRegistryEnrichActivity
        include JSON::Serializable

        # The name of the attribute that is added to the message.
        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The name of the deviceRegistryEnrich activity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the role that allows access to the device's registry information.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the IoT device whose registry information is added to the message.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The next activity in the pipeline.
        @[JSON::Field(key: "next")]
        getter next : String?

        def initialize(
          @attribute : String,
          @name : String,
          @role_arn : String,
          @thing_name : String,
          @next : String? = nil
        )
        end
      end

      # An activity that adds information from the IoT Device Shadow service to a message.
      struct DeviceShadowEnrichActivity
        include JSON::Serializable

        # The name of the attribute that is added to the message.
        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The name of the deviceShadowEnrich activity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the role that allows access to the device's shadow.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the IoT device whose shadow information is added to the message.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The next activity in the pipeline.
        @[JSON::Field(key: "next")]
        getter next : String?

        def initialize(
          @attribute : String,
          @name : String,
          @role_arn : String,
          @thing_name : String,
          @next : String? = nil
        )
        end
      end

      # The estimated size of the resource.
      struct EstimatedResourceSize
        include JSON::Serializable

        # The time when the estimate of the size of the resource was made.
        @[JSON::Field(key: "estimatedOn")]
        getter estimated_on : Time?

        # The estimated size of the resource, in bytes.
        @[JSON::Field(key: "estimatedSizeInBytes")]
        getter estimated_size_in_bytes : Float64?

        def initialize(
          @estimated_on : Time? = nil,
          @estimated_size_in_bytes : Float64? = nil
        )
        end
      end

      # Contains the configuration information of file formats. IoT Analytics data stores support JSON and
      # Parquet . The default file format is JSON. You can specify only one format. You can't change the
      # file format after you create the data store.
      struct FileFormatConfiguration
        include JSON::Serializable

        # Contains the configuration information of the JSON format.
        @[JSON::Field(key: "jsonConfiguration")]
        getter json_configuration : Types::JsonConfiguration?

        # Contains the configuration information of the Parquet format.
        @[JSON::Field(key: "parquetConfiguration")]
        getter parquet_configuration : Types::ParquetConfiguration?

        def initialize(
          @json_configuration : Types::JsonConfiguration? = nil,
          @parquet_configuration : Types::ParquetConfiguration? = nil
        )
        end
      end

      # An activity that filters a message based on its attributes.
      struct FilterActivity
        include JSON::Serializable

        # An expression that looks like a SQL WHERE clause that must return a Boolean value. Messages that
        # satisfy the condition are passed to the next activity.
        @[JSON::Field(key: "filter")]
        getter filter : String

        # The name of the filter activity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The next activity in the pipeline.
        @[JSON::Field(key: "next")]
        getter next : String?

        def initialize(
          @filter : String,
          @name : String,
          @next : String? = nil
        )
        end
      end

      struct GetDatasetContentRequest
        include JSON::Serializable

        # The name of the dataset whose contents are retrieved.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # The version of the dataset whose contents are retrieved. You can also use the strings "$LATEST" or
        # "$LATEST_SUCCEEDED" to retrieve the contents of the latest or latest successfully completed dataset.
        # If not specified, "$LATEST_SUCCEEDED" is the default.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @dataset_name : String,
          @version_id : String? = nil
        )
        end
      end

      struct GetDatasetContentResponse
        include JSON::Serializable

        # A list of DatasetEntry objects.
        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::DatasetEntry)?

        # The status of the dataset content.
        @[JSON::Field(key: "status")]
        getter status : Types::DatasetContentStatus?

        # The time when the request was made.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        def initialize(
          @entries : Array(Types::DatasetEntry)? = nil,
          @status : Types::DatasetContentStatus? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Configuration information for coordination with Glue, a fully managed extract, transform and load
      # (ETL) service.
      struct GlueConfiguration
        include JSON::Serializable

        # The name of the database in your Glue Data Catalog in which the table is located. An Glue Data
        # Catalog database contains metadata tables.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The name of the table in your Glue Data Catalog that is used to perform the ETL operations. An Glue
        # Data Catalog table contains partitioned data and descriptions of data sources and targets.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        def initialize(
          @database_name : String,
          @table_name : String
        )
        end
      end

      # There was an internal failure.
      struct InternalFailureException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was not valid.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration information for delivery of dataset contents to IoT Events.
      struct IotEventsDestinationConfiguration
        include JSON::Serializable

        # The name of the IoT Events input to which dataset contents are delivered.
        @[JSON::Field(key: "inputName")]
        getter input_name : String

        # The ARN of the role that grants IoT Analytics permission to deliver dataset contents to an IoT
        # Events input.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @input_name : String,
          @role_arn : String
        )
        end
      end

      # Used to store data used by IoT SiteWise in an Amazon S3 bucket that you manage. You can't change the
      # choice of Amazon S3 storage after your data store is created.
      struct IotSiteWiseCustomerManagedDatastoreS3Storage
        include JSON::Serializable

        # The name of the Amazon S3 bucket where your data is stored.
        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # (Optional) The prefix used to create the keys of the data store data objects. Each object in an
        # Amazon S3 bucket has a key that is its unique identifier in the bucket. Each object in a bucket has
        # exactly one key. The prefix must end with a forward slash (/).
        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String,
          @key_prefix : String? = nil
        )
        end
      end

      # Contains information about the data store that you manage, which stores data used by IoT SiteWise.
      struct IotSiteWiseCustomerManagedDatastoreS3StorageSummary
        include JSON::Serializable

        # The name of the Amazon S3 bucket where your data is stored.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # (Optional) The prefix used to create the keys of the data store data objects. Each object in an
        # Amazon S3 bucket has a key that is its unique identifier in the bucket. Each object in a bucket has
        # exactly one key. The prefix must end with a forward slash (/).
        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String? = nil,
          @key_prefix : String? = nil
        )
        end
      end

      # Contains the configuration information of the JSON format.
      struct JsonConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # An activity that runs a Lambda function to modify the message.
      struct LambdaActivity
        include JSON::Serializable

        # The number of messages passed to the Lambda function for processing. The Lambda function must be
        # able to process all of these messages within five minutes, which is the maximum timeout duration for
        # Lambda functions.
        @[JSON::Field(key: "batchSize")]
        getter batch_size : Int32

        # The name of the Lambda function that is run on the message.
        @[JSON::Field(key: "lambdaName")]
        getter lambda_name : String

        # The name of the lambda activity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The next activity in the pipeline.
        @[JSON::Field(key: "next")]
        getter next : String?

        def initialize(
          @batch_size : Int32,
          @lambda_name : String,
          @name : String,
          @next : String? = nil
        )
        end
      end

      # A structure that contains the name and configuration information of a late data rule.
      struct LateDataRule
        include JSON::Serializable

        # The information needed to configure the late data rule.
        @[JSON::Field(key: "ruleConfiguration")]
        getter rule_configuration : Types::LateDataRuleConfiguration

        # The name of the late data rule.
        @[JSON::Field(key: "ruleName")]
        getter rule_name : String?

        def initialize(
          @rule_configuration : Types::LateDataRuleConfiguration,
          @rule_name : String? = nil
        )
        end
      end

      # The information needed to configure a delta time session window.
      struct LateDataRuleConfiguration
        include JSON::Serializable

        # The information needed to configure a delta time session window.
        @[JSON::Field(key: "deltaTimeSessionWindowConfiguration")]
        getter delta_time_session_window_configuration : Types::DeltaTimeSessionWindowConfiguration?

        def initialize(
          @delta_time_session_window_configuration : Types::DeltaTimeSessionWindowConfiguration? = nil
        )
        end
      end

      # The command caused an internal limit to be exceeded.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListChannelsRequest
        include JSON::Serializable

        # The maximum number of results to return in this request. The default value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelsResponse
        include JSON::Serializable

        # A list of ChannelSummary objects.
        @[JSON::Field(key: "channelSummaries")]
        getter channel_summaries : Array(Types::ChannelSummary)?

        # The token to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_summaries : Array(Types::ChannelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetContentsRequest
        include JSON::Serializable

        # The name of the dataset whose contents information you want to list.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter to limit results to those dataset contents whose creation is scheduled before the given
        # time. See the field triggers.schedule in the CreateDataset request. (timestamp)
        @[JSON::Field(key: "scheduledBefore")]
        getter scheduled_before : Time?

        # A filter to limit results to those dataset contents whose creation is scheduled on or after the
        # given time. See the field triggers.schedule in the CreateDataset request. (timestamp)
        @[JSON::Field(key: "scheduledOnOrAfter")]
        getter scheduled_on_or_after : Time?

        def initialize(
          @dataset_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @scheduled_before : Time? = nil,
          @scheduled_on_or_after : Time? = nil
        )
        end
      end

      struct ListDatasetContentsResponse
        include JSON::Serializable

        # Summary information about dataset contents that have been created.
        @[JSON::Field(key: "datasetContentSummaries")]
        getter dataset_content_summaries : Array(Types::DatasetContentSummary)?

        # The token to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_content_summaries : Array(Types::DatasetContentSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetsRequest
        include JSON::Serializable

        # The maximum number of results to return in this request. The default value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetsResponse
        include JSON::Serializable

        # A list of DatasetSummary objects.
        @[JSON::Field(key: "datasetSummaries")]
        getter dataset_summaries : Array(Types::DatasetSummary)?

        # The token to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_summaries : Array(Types::DatasetSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatastoresRequest
        include JSON::Serializable

        # The maximum number of results to return in this request. The default value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatastoresResponse
        include JSON::Serializable

        # A list of DatastoreSummary objects.
        @[JSON::Field(key: "datastoreSummaries")]
        getter datastore_summaries : Array(Types::DatastoreSummary)?

        # The token to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @datastore_summaries : Array(Types::DatastoreSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPipelinesRequest
        include JSON::Serializable

        # The maximum number of results to return in this request. The default value is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPipelinesResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of PipelineSummary objects.
        @[JSON::Field(key: "pipelineSummaries")]
        getter pipeline_summaries : Array(Types::PipelineSummary)?

        def initialize(
          @next_token : String? = nil,
          @pipeline_summaries : Array(Types::PipelineSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource whose tags you want to list.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags (metadata) that you have assigned to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about logging options.
      struct LoggingOptions
        include JSON::Serializable

        # If true, logging is enabled for IoT Analytics.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The logging level. Currently, only ERROR is supported.
        @[JSON::Field(key: "level")]
        getter level : String

        # The ARN of the role that grants permission to IoT Analytics to perform logging.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @enabled : Bool,
          @level : String,
          @role_arn : String
        )
        end
      end

      # An activity that computes an arithmetic expression using the message's attributes.
      struct MathActivity
        include JSON::Serializable

        # The name of the attribute that contains the result of the math operation.
        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # An expression that uses one or more existing attributes and must return an integer value.
        @[JSON::Field(key: "math")]
        getter math : String

        # The name of the math activity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The next activity in the pipeline.
        @[JSON::Field(key: "next")]
        getter next : String?

        def initialize(
          @attribute : String,
          @math : String,
          @name : String,
          @next : String? = nil
        )
        end
      end

      # Information about a message.
      struct Message
        include JSON::Serializable

        # The ID you want to assign to the message. Each messageId must be unique within each batch sent.
        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The payload of the message. This can be a JSON string or a base64-encoded string representing binary
        # data, in which case you must decode it by means of a pipeline activity.
        @[JSON::Field(key: "payload")]
        getter payload : Bytes

        def initialize(
          @message_id : String,
          @payload : Bytes
        )
        end
      end

      # The value of the variable as a structure that specifies an output file URI.
      struct OutputFileUriValue
        include JSON::Serializable

        # The URI of the location where dataset contents are stored, usually the URI of a file in an S3
        # bucket.
        @[JSON::Field(key: "fileName")]
        getter file_name : String

        def initialize(
          @file_name : String
        )
        end
      end

      # Contains the configuration information of the Parquet format.
      struct ParquetConfiguration
        include JSON::Serializable

        # Information needed to define a schema.
        @[JSON::Field(key: "schemaDefinition")]
        getter schema_definition : Types::SchemaDefinition?

        def initialize(
          @schema_definition : Types::SchemaDefinition? = nil
        )
        end
      end

      # A partition dimension defined by an attribute.
      struct Partition
        include JSON::Serializable

        # The name of the attribute that defines a partition dimension.
        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String

        def initialize(
          @attribute_name : String
        )
        end
      end

      # Contains information about a pipeline.
      struct Pipeline
        include JSON::Serializable

        # The activities that perform transformations on the messages.
        @[JSON::Field(key: "activities")]
        getter activities : Array(Types::PipelineActivity)?

        # The ARN of the pipeline.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # When the pipeline was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The last time the pipeline was updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the pipeline.
        @[JSON::Field(key: "name")]
        getter name : String?

        # A summary of information about the pipeline reprocessing.
        @[JSON::Field(key: "reprocessingSummaries")]
        getter reprocessing_summaries : Array(Types::ReprocessingSummary)?

        def initialize(
          @activities : Array(Types::PipelineActivity)? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil,
          @reprocessing_summaries : Array(Types::ReprocessingSummary)? = nil
        )
        end
      end

      # An activity that performs a transformation on a message.
      struct PipelineActivity
        include JSON::Serializable

        # Adds other attributes based on existing attributes in the message.
        @[JSON::Field(key: "addAttributes")]
        getter add_attributes : Types::AddAttributesActivity?

        # Determines the source of the messages to be processed.
        @[JSON::Field(key: "channel")]
        getter channel : Types::ChannelActivity?

        # Specifies where to store the processed message data.
        @[JSON::Field(key: "datastore")]
        getter datastore : Types::DatastoreActivity?

        # Adds data from the IoT device registry to your message.
        @[JSON::Field(key: "deviceRegistryEnrich")]
        getter device_registry_enrich : Types::DeviceRegistryEnrichActivity?

        # Adds information from the IoT Device Shadow service to a message.
        @[JSON::Field(key: "deviceShadowEnrich")]
        getter device_shadow_enrich : Types::DeviceShadowEnrichActivity?

        # Filters a message based on its attributes.
        @[JSON::Field(key: "filter")]
        getter filter : Types::FilterActivity?

        # Runs a Lambda function to modify the message.
        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaActivity?

        # Computes an arithmetic expression using the message's attributes and adds it to the message.
        @[JSON::Field(key: "math")]
        getter math : Types::MathActivity?

        # Removes attributes from a message.
        @[JSON::Field(key: "removeAttributes")]
        getter remove_attributes : Types::RemoveAttributesActivity?

        # Used to create a new message using only the specified attributes from the original message.
        @[JSON::Field(key: "selectAttributes")]
        getter select_attributes : Types::SelectAttributesActivity?

        def initialize(
          @add_attributes : Types::AddAttributesActivity? = nil,
          @channel : Types::ChannelActivity? = nil,
          @datastore : Types::DatastoreActivity? = nil,
          @device_registry_enrich : Types::DeviceRegistryEnrichActivity? = nil,
          @device_shadow_enrich : Types::DeviceShadowEnrichActivity? = nil,
          @filter : Types::FilterActivity? = nil,
          @lambda : Types::LambdaActivity? = nil,
          @math : Types::MathActivity? = nil,
          @remove_attributes : Types::RemoveAttributesActivity? = nil,
          @select_attributes : Types::SelectAttributesActivity? = nil
        )
        end
      end

      # A summary of information about a pipeline.
      struct PipelineSummary
        include JSON::Serializable

        # When the pipeline was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # When the pipeline was last updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the pipeline.
        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String?

        # A summary of information about the pipeline reprocessing.
        @[JSON::Field(key: "reprocessingSummaries")]
        getter reprocessing_summaries : Array(Types::ReprocessingSummary)?

        def initialize(
          @creation_time : Time? = nil,
          @last_update_time : Time? = nil,
          @pipeline_name : String? = nil,
          @reprocessing_summaries : Array(Types::ReprocessingSummary)? = nil
        )
        end
      end

      struct PutLoggingOptionsRequest
        include JSON::Serializable

        # The new values of the IoT Analytics logging options.
        @[JSON::Field(key: "loggingOptions")]
        getter logging_options : Types::LoggingOptions

        def initialize(
          @logging_options : Types::LoggingOptions
        )
        end
      end

      # Information that is used to filter message data, to segregate it according to the timeframe in which
      # it arrives.
      struct QueryFilter
        include JSON::Serializable

        # Used to limit data to that which has arrived since the last execution of the action.
        @[JSON::Field(key: "deltaTime")]
        getter delta_time : Types::DeltaTime?

        def initialize(
          @delta_time : Types::DeltaTime? = nil
        )
        end
      end

      # An activity that removes attributes from a message.
      struct RemoveAttributesActivity
        include JSON::Serializable

        # A list of 1-50 attributes to remove from the message.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(String)

        # The name of the removeAttributes activity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The next activity in the pipeline.
        @[JSON::Field(key: "next")]
        getter next : String?

        def initialize(
          @attributes : Array(String),
          @name : String,
          @next : String? = nil
        )
        end
      end

      # Information about pipeline reprocessing.
      struct ReprocessingSummary
        include JSON::Serializable

        # The time the pipeline reprocessing was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The reprocessingId returned by StartPipelineReprocessing .
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the pipeline reprocessing.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A resource with the same name already exists.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The ID of the resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @message : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # The configuration of the resource used to execute the containerAction .
      struct ResourceConfiguration
        include JSON::Serializable

        # The type of the compute resource used to execute the containerAction . Possible values are: ACU_1
        # (vCPU=4, memory=16 GiB) or ACU_2 (vCPU=8, memory=32 GiB).
        @[JSON::Field(key: "computeType")]
        getter compute_type : String

        # The size, in GB, of the persistent storage available to the resource instance used to execute the
        # containerAction (min: 1, max: 50).
        @[JSON::Field(key: "volumeSizeInGB")]
        getter volume_size_in_gb : Int32

        def initialize(
          @compute_type : String,
          @volume_size_in_gb : Int32
        )
        end
      end

      # A resource with the specified name could not be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # How long, in days, message data is kept.
      struct RetentionPeriod
        include JSON::Serializable

        # The number of days that message data is kept. The unlimited parameter must be false.
        @[JSON::Field(key: "numberOfDays")]
        getter number_of_days : Int32?

        # If true, message data is kept indefinitely.
        @[JSON::Field(key: "unlimited")]
        getter unlimited : Bool?

        def initialize(
          @number_of_days : Int32? = nil,
          @unlimited : Bool? = nil
        )
        end
      end

      struct RunPipelineActivityRequest
        include JSON::Serializable

        # The sample message payloads on which the pipeline activity is run.
        @[JSON::Field(key: "payloads")]
        getter payloads : Array(Bytes)

        # The pipeline activity that is run. This must not be a channel activity or a data store activity
        # because these activities are used in a pipeline only to load the original message and to store the
        # (possibly) transformed message. If a Lambda activity is specified, only short-running Lambda
        # functions (those with a timeout of less than 30 seconds or less) can be used.
        @[JSON::Field(key: "pipelineActivity")]
        getter pipeline_activity : Types::PipelineActivity

        def initialize(
          @payloads : Array(Bytes),
          @pipeline_activity : Types::PipelineActivity
        )
        end
      end

      struct RunPipelineActivityResponse
        include JSON::Serializable

        # In case the pipeline activity fails, the log message that is generated.
        @[JSON::Field(key: "logResult")]
        getter log_result : String?

        # The enriched or transformed sample message payloads as base64-encoded strings. (The results of
        # running the pipeline activity on each input sample message payload, encoded in base64.)
        @[JSON::Field(key: "payloads")]
        getter payloads : Array(Bytes)?

        def initialize(
          @log_result : String? = nil,
          @payloads : Array(Bytes)? = nil
        )
        end
      end

      # Configuration information for delivery of dataset contents to Amazon Simple Storage Service (Amazon
      # S3).
      struct S3DestinationConfiguration
        include JSON::Serializable

        # The name of the S3 bucket to which dataset contents are delivered.
        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The key of the dataset contents object in an S3 bucket. Each object has a key that is a unique
        # identifier. Each object has exactly one key. You can create a unique key with the following options:
        # Use !{iotanalytics:scheduleTime} to insert the time of a scheduled SQL query run. Use
        # !{iotanalytics:versionId} to insert a unique hash that identifies a dataset content. Use
        # !{iotanalytics:creationTime} to insert the creation time of a dataset content. The following example
        # creates a unique key for a CSV file:
        # dataset/mydataset/!{iotanalytics:scheduleTime}/!{iotanalytics:versionId}.csv If you don't use
        # !{iotanalytics:versionId} to specify the key, you might get duplicate keys. For example, you might
        # have two dataset contents with the same scheduleTime but different versionId s. This means that one
        # dataset content overwrites the other.
        @[JSON::Field(key: "key")]
        getter key : String

        # The ARN of the role that grants IoT Analytics permission to interact with your Amazon S3 and Glue
        # resources.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Configuration information for coordination with Glue, a fully managed extract, transform and load
        # (ETL) service.
        @[JSON::Field(key: "glueConfiguration")]
        getter glue_configuration : Types::GlueConfiguration?

        def initialize(
          @bucket : String,
          @key : String,
          @role_arn : String,
          @glue_configuration : Types::GlueConfiguration? = nil
        )
        end
      end

      struct SampleChannelDataRequest
        include JSON::Serializable

        # The name of the channel whose message samples are retrieved.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The end of the time window from which sample messages are retrieved.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The number of sample messages to be retrieved. The limit is 10. The default is also 10.
        @[JSON::Field(key: "maxMessages")]
        getter max_messages : Int32?

        # The start of the time window from which sample messages are retrieved.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @channel_name : String,
          @end_time : Time? = nil,
          @max_messages : Int32? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct SampleChannelDataResponse
        include JSON::Serializable

        # The list of message samples. Each sample message is returned as a base64-encoded string.
        @[JSON::Field(key: "payloads")]
        getter payloads : Array(Bytes)?

        def initialize(
          @payloads : Array(Bytes)? = nil
        )
        end
      end

      # The schedule for when to trigger an update.
      struct Schedule
        include JSON::Serializable

        # The expression that defines when to trigger an update. For more information, see Schedule
        # Expressions for Rules in the Amazon CloudWatch Events User Guide .
        @[JSON::Field(key: "expression")]
        getter expression : String?

        def initialize(
          @expression : String? = nil
        )
        end
      end

      # Information needed to define a schema.
      struct SchemaDefinition
        include JSON::Serializable

        # Specifies one or more columns that store your data. Each schema can have up to 100 columns. Each
        # column can have up to 100 nested types.
        @[JSON::Field(key: "columns")]
        getter columns : Array(Types::Column)?

        def initialize(
          @columns : Array(Types::Column)? = nil
        )
        end
      end

      # Used to create a new message using only the specified attributes from the original message.
      struct SelectAttributesActivity
        include JSON::Serializable

        # A list of the attributes to select from the message.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(String)

        # The name of the selectAttributes activity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The next activity in the pipeline.
        @[JSON::Field(key: "next")]
        getter next : String?

        def initialize(
          @attributes : Array(String),
          @name : String,
          @next : String? = nil
        )
        end
      end

      # Used to store channel data in an S3 bucket managed by IoT Analytics. You can't change the choice of
      # S3 storage after the data store is created.
      struct ServiceManagedChannelS3Storage
        include JSON::Serializable

        def initialize
        end
      end

      # Used to store channel data in an S3 bucket managed by IoT Analytics.
      struct ServiceManagedChannelS3StorageSummary
        include JSON::Serializable

        def initialize
        end
      end

      # Used to store data in an Amazon S3 bucket managed by IoT Analytics. You can't change the choice of
      # Amazon S3 storage after your data store is created.
      struct ServiceManagedDatastoreS3Storage
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the data store that is managed by IoT Analytics.
      struct ServiceManagedDatastoreS3StorageSummary
        include JSON::Serializable

        def initialize
        end
      end

      # The service is temporarily unavailable.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The SQL query to modify the message.
      struct SqlQueryDatasetAction
        include JSON::Serializable

        # A SQL query string.
        @[JSON::Field(key: "sqlQuery")]
        getter sql_query : String

        # Prefilters applied to message data.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::QueryFilter)?

        def initialize(
          @sql_query : String,
          @filters : Array(Types::QueryFilter)? = nil
        )
        end
      end

      struct StartPipelineReprocessingRequest
        include JSON::Serializable

        # The name of the pipeline on which to start reprocessing.
        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # Specifies one or more sets of channel messages that you want to reprocess. If you use the
        # channelMessages object, you must not specify a value for startTime and endTime .
        @[JSON::Field(key: "channelMessages")]
        getter channel_messages : Types::ChannelMessages?

        # The end time (exclusive) of raw message data that is reprocessed. If you specify a value for the
        # endTime parameter, you must not use the channelMessages object.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The start time (inclusive) of raw message data that is reprocessed. If you specify a value for the
        # startTime parameter, you must not use the channelMessages object.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @pipeline_name : String,
          @channel_messages : Types::ChannelMessages? = nil,
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct StartPipelineReprocessingResponse
        include JSON::Serializable

        # The ID of the pipeline reprocessing activity that was started.
        @[JSON::Field(key: "reprocessingId")]
        getter reprocessing_id : String?

        def initialize(
          @reprocessing_id : String? = nil
        )
        end
      end

      # A set of key-value pairs that are used to manage the resource.
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

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource whose tags you want to modify.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The new or modified tags for the resource.
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

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A partition dimension defined by a timestamp attribute.
      struct TimestampPartition
        include JSON::Serializable

        # The attribute name of the partition defined by a timestamp.
        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String

        # The timestamp format of a partition defined by a timestamp. The default format is seconds since
        # epoch (January 1, 1970 at midnight UTC time).
        @[JSON::Field(key: "timestampFormat")]
        getter timestamp_format : String?

        def initialize(
          @attribute_name : String,
          @timestamp_format : String? = nil
        )
        end
      end

      # Information about the dataset whose content generation triggers the new dataset content generation.
      struct TriggeringDataset
        include JSON::Serializable

        # The name of the dataset whose content generation triggers the new dataset content generation.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource whose tags you want to remove.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of those tags which you want to remove.
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

      struct UpdateChannelRequest
        include JSON::Serializable

        # The name of the channel to be updated.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # Where channel data is stored. You can choose one of serviceManagedS3 or customerManagedS3 storage.
        # If not specified, the default is serviceManagedS3 . You can't change this storage option after the
        # channel is created.
        @[JSON::Field(key: "channelStorage")]
        getter channel_storage : Types::ChannelStorage?

        # How long, in days, message data is kept for the channel. The retention period can't be updated if
        # the channel's Amazon S3 storage is customer-managed.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        def initialize(
          @channel_name : String,
          @channel_storage : Types::ChannelStorage? = nil,
          @retention_period : Types::RetentionPeriod? = nil
        )
        end
      end

      struct UpdateDatasetRequest
        include JSON::Serializable

        # A list of DatasetAction objects.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::DatasetAction)

        # The name of the dataset to update.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # When dataset contents are created, they are delivered to destinations specified here.
        @[JSON::Field(key: "contentDeliveryRules")]
        getter content_delivery_rules : Array(Types::DatasetContentDeliveryRule)?

        # A list of data rules that send notifications to CloudWatch, when data arrives late. To specify
        # lateDataRules , the dataset must use a DeltaTimer filter.
        @[JSON::Field(key: "lateDataRules")]
        getter late_data_rules : Array(Types::LateDataRule)?

        # How long, in days, dataset contents are kept for the dataset.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # A list of DatasetTrigger objects. The list can be empty or can contain up to five DatasetTrigger
        # objects.
        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::DatasetTrigger)?

        # Optional. How many versions of dataset contents are kept. If not specified or set to null, only the
        # latest version plus the latest succeeded version (if they are different) are kept for the time
        # period specified by the retentionPeriod parameter. For more information, see Keeping Multiple
        # Versions of IoT Analytics datasets in the IoT Analytics User Guide .
        @[JSON::Field(key: "versioningConfiguration")]
        getter versioning_configuration : Types::VersioningConfiguration?

        def initialize(
          @actions : Array(Types::DatasetAction),
          @dataset_name : String,
          @content_delivery_rules : Array(Types::DatasetContentDeliveryRule)? = nil,
          @late_data_rules : Array(Types::LateDataRule)? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @triggers : Array(Types::DatasetTrigger)? = nil,
          @versioning_configuration : Types::VersioningConfiguration? = nil
        )
        end
      end

      struct UpdateDatastoreRequest
        include JSON::Serializable

        # The name of the data store to be updated.
        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String

        # Where data in a data store is stored.. You can choose serviceManagedS3 storage, customerManagedS3
        # storage, or iotSiteWiseMultiLayerStorage storage. The default is serviceManagedS3 . You can't change
        # the choice of Amazon S3 storage after your data store is created.
        @[JSON::Field(key: "datastoreStorage")]
        getter datastore_storage : Types::DatastoreStorage?

        # Contains the configuration information of file formats. IoT Analytics data stores support JSON and
        # Parquet . The default file format is JSON. You can specify only one format. You can't change the
        # file format after you create the data store.
        @[JSON::Field(key: "fileFormatConfiguration")]
        getter file_format_configuration : Types::FileFormatConfiguration?

        # How long, in days, message data is kept for the data store. The retention period can't be updated if
        # the data store's Amazon S3 storage is customer-managed.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        def initialize(
          @datastore_name : String,
          @datastore_storage : Types::DatastoreStorage? = nil,
          @file_format_configuration : Types::FileFormatConfiguration? = nil,
          @retention_period : Types::RetentionPeriod? = nil
        )
        end
      end

      struct UpdatePipelineRequest
        include JSON::Serializable

        # A list of PipelineActivity objects. Activities perform transformations on your messages, such as
        # removing, renaming or adding message attributes; filtering messages based on attribute values;
        # invoking your Lambda functions on messages for advanced processing; or performing mathematical
        # transformations to normalize device data. The list can be 2-25 PipelineActivity objects and must
        # contain both a channel and a datastore activity. Each entry in the list must contain only one
        # activity. For example: pipelineActivities = [ { "channel": { ... } }, { "lambda": { ... } }, ... ]
        @[JSON::Field(key: "pipelineActivities")]
        getter pipeline_activities : Array(Types::PipelineActivity)

        # The name of the pipeline to update.
        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        def initialize(
          @pipeline_activities : Array(Types::PipelineActivity),
          @pipeline_name : String
        )
        end
      end

      # An instance of a variable to be passed to the containerAction execution. Each variable must have a
      # name and a value given by one of stringValue , datasetContentVersionValue , or outputFileUriValue .
      struct Variable
        include JSON::Serializable

        # The name of the variable.
        @[JSON::Field(key: "name")]
        getter name : String

        # The value of the variable as a structure that specifies a dataset content version.
        @[JSON::Field(key: "datasetContentVersionValue")]
        getter dataset_content_version_value : Types::DatasetContentVersionValue?

        # The value of the variable as a double (numeric).
        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # The value of the variable as a structure that specifies an output file URI.
        @[JSON::Field(key: "outputFileUriValue")]
        getter output_file_uri_value : Types::OutputFileUriValue?

        # The value of the variable as a string.
        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @name : String,
          @dataset_content_version_value : Types::DatasetContentVersionValue? = nil,
          @double_value : Float64? = nil,
          @output_file_uri_value : Types::OutputFileUriValue? = nil,
          @string_value : String? = nil
        )
        end
      end

      # Information about the versioning of dataset contents.
      struct VersioningConfiguration
        include JSON::Serializable

        # How many versions of dataset contents are kept. The unlimited parameter must be false .
        @[JSON::Field(key: "maxVersions")]
        getter max_versions : Int32?

        # If true, unlimited versions of dataset contents are kept.
        @[JSON::Field(key: "unlimited")]
        getter unlimited : Bool?

        def initialize(
          @max_versions : Int32? = nil,
          @unlimited : Bool? = nil
        )
        end
      end
    end
  end
end
