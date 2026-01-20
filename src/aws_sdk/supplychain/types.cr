require "json"
require "time"

module AwsSdk
  module SupplyChain
    module Types

      # You do not have the required privileges to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The BillOfMaterialsImportJob details.

      struct BillOfMaterialsImportJob
        include JSON::Serializable

        # The BillOfMaterialsImportJob instanceId.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The BillOfMaterialsImportJob jobId.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The S3 URI from which the CSV is read.

        @[JSON::Field(key: "s3uri")]
        getter s3uri : String

        # The BillOfMaterialsImportJob ConfigurationJobStatus.

        @[JSON::Field(key: "status")]
        getter status : String

        # When the BillOfMaterialsImportJob has reached a terminal state, there will be a message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @instance_id : String,
          @job_id : String,
          @s3uri : String,
          @status : String,
          @message : String? = nil
        )
        end
      end

      # Updating or deleting a resource can cause an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request parameters for CreateBillOfMaterialsImportJob.

      struct CreateBillOfMaterialsImportJobRequest
        include JSON::Serializable

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The S3 URI of the CSV file to be imported. The bucket must grant permissions for AWS Supply Chain to
        # read the file.

        @[JSON::Field(key: "s3uri")]
        getter s3uri : String

        # An idempotency token ensures the API request is only completed no more than once. This way, retrying
        # the request will not trigger the operation multiple times. A client token is a unique,
        # case-sensitive string of 33 to 128 ASCII characters. To make an idempotent API request, specify a
        # client token in the request. You should not reuse the same client token for other requests. If you
        # retry a successful request with the same client token, the request will succeed with no further
        # actions being taken, and you will receive the same API response as the original successful request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @instance_id : String,
          @s3uri : String,
          @client_token : String? = nil
        )
        end
      end

      # The response parameters of CreateBillOfMaterialsImportJob.

      struct CreateBillOfMaterialsImportJobResponse
        include JSON::Serializable

        # The new BillOfMaterialsImportJob identifier.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # The request parameters for CreateDataIntegrationFlow.

      struct CreateDataIntegrationFlowRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # Name of the DataIntegrationFlow.

        @[JSON::Field(key: "name")]
        getter name : String

        # The source configurations for DataIntegrationFlow.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::DataIntegrationFlowSource)

        # The target configurations for DataIntegrationFlow.

        @[JSON::Field(key: "target")]
        getter target : Types::DataIntegrationFlowTarget

        # The transformation configurations for DataIntegrationFlow.

        @[JSON::Field(key: "transformation")]
        getter transformation : Types::DataIntegrationFlowTransformation

        # The tags of the DataIntegrationFlow to be created

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @instance_id : String,
          @name : String,
          @sources : Array(Types::DataIntegrationFlowSource),
          @target : Types::DataIntegrationFlowTarget,
          @transformation : Types::DataIntegrationFlowTransformation,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The response parameters for CreateDataIntegrationFlow.

      struct CreateDataIntegrationFlowResponse
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the DataIntegrationFlow created.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @instance_id : String,
          @name : String
        )
        end
      end

      # The request parameters for CreateDataLakeDataset.

      struct CreateDataLakeDatasetRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the dataset. For asc name space, the name must be one of the supported data entities
        # under https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of the dataset, besides the custom defined namespace, every instance comes with below
        # pre-defined namespaces: asc - For information on the Amazon Web Services Supply Chain supported
        # datasets see https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .
        # default - For datasets with custom user-defined schemas.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The description of the dataset.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The partition specification of the dataset. Partitioning can effectively improve the dataset query
        # performance by reducing the amount of data scanned during query execution. But partitioning or not
        # will affect how data get ingested by data ingestion methods, such as SendDataIntegrationEvent's
        # dataset UPSERT will upsert records within partition (instead of within whole dataset). For more
        # details, refer to those data ingestion documentations.

        @[JSON::Field(key: "partitionSpec")]
        getter partition_spec : Types::DataLakeDatasetPartitionSpec?

        # The custom schema of the data lake dataset and required for dataset in default and custom
        # namespaces.

        @[JSON::Field(key: "schema")]
        getter schema : Types::DataLakeDatasetSchema?

        # The tags of the dataset.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @instance_id : String,
          @name : String,
          @namespace : String,
          @description : String? = nil,
          @partition_spec : Types::DataLakeDatasetPartitionSpec? = nil,
          @schema : Types::DataLakeDatasetSchema? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The response parameters of CreateDataLakeDataset.

      struct CreateDataLakeDatasetResponse
        include JSON::Serializable

        # The detail of created dataset.

        @[JSON::Field(key: "dataset")]
        getter dataset : Types::DataLakeDataset

        def initialize(
          @dataset : Types::DataLakeDataset
        )
        end
      end

      # The request parameters for CreateDataLakeNamespace.

      struct CreateDataLakeNamespaceRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the namespace. Noted you cannot create namespace with name starting with asc , default ,
        # scn , aws , amazon , amzn

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags of the namespace.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @instance_id : String,
          @name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The response parameters of CreateDataLakeNamespace.

      struct CreateDataLakeNamespaceResponse
        include JSON::Serializable

        # The detail of created namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : Types::DataLakeNamespace

        def initialize(
          @namespace : Types::DataLakeNamespace
        )
        end
      end

      # The request parameters for CreateInstance.

      struct CreateInstanceRequest
        include JSON::Serializable

        # The client token for idempotency.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The AWS Supply Chain instance description.

        @[JSON::Field(key: "instanceDescription")]
        getter instance_description : String?

        # The AWS Supply Chain instance name.

        @[JSON::Field(key: "instanceName")]
        getter instance_name : String?

        # The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you provide for encryption.
        # This is required if you do not want to use the Amazon Web Services owned KMS key. If you don't
        # provide anything here, AWS Supply Chain uses the Amazon Web Services owned KMS key.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The Amazon Web Services tags of an instance to be created.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The DNS subdomain of the web app. This would be "example" in the URL "example.scn.global.on.aws".
        # You can set this to a custom value, as long as the domain isn't already being used by someone else.
        # The name may only include alphanumeric characters and hyphens.

        @[JSON::Field(key: "webAppDnsDomain")]
        getter web_app_dns_domain : String?

        def initialize(
          @client_token : String? = nil,
          @instance_description : String? = nil,
          @instance_name : String? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @web_app_dns_domain : String? = nil
        )
        end
      end

      # The response parameters for CreateInstance.

      struct CreateInstanceResponse
        include JSON::Serializable

        # The AWS Supply Chain instance resource data details.

        @[JSON::Field(key: "instance")]
        getter instance : Types::Instance

        def initialize(
          @instance : Types::Instance
        )
        end
      end

      # The data integration event details.

      struct DataIntegrationEvent
        include JSON::Serializable

        # Event identifier (for example, orderId for InboundOrder) used for data sharding or partitioning.

        @[JSON::Field(key: "eventGroupId")]
        getter event_group_id : String

        # The unique event identifier.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The event timestamp (in epoch seconds).

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : Time

        # The data event type.

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The target dataset details for a DATASET event type.

        @[JSON::Field(key: "datasetTargetDetails")]
        getter dataset_target_details : Types::DataIntegrationEventDatasetTargetDetails?

        def initialize(
          @event_group_id : String,
          @event_id : String,
          @event_timestamp : Time,
          @event_type : String,
          @instance_id : String,
          @dataset_target_details : Types::DataIntegrationEventDatasetTargetDetails? = nil
        )
        end
      end

      # The target dataset load execution details.

      struct DataIntegrationEventDatasetLoadExecutionDetails
        include JSON::Serializable

        # The event load execution status to target dataset.

        @[JSON::Field(key: "status")]
        getter status : String

        # The failure message (if any) of failed event load execution to dataset.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @status : String,
          @message : String? = nil
        )
        end
      end

      # The target dataset configuration for a DATASET event type.

      struct DataIntegrationEventDatasetTargetConfiguration
        include JSON::Serializable

        # The datalake dataset ARN identifier.

        @[JSON::Field(key: "datasetIdentifier")]
        getter dataset_identifier : String

        # The target dataset load operation type.

        @[JSON::Field(key: "operationType")]
        getter operation_type : String

        def initialize(
          @dataset_identifier : String,
          @operation_type : String
        )
        end
      end

      # The target dataset details for a DATASET event type.

      struct DataIntegrationEventDatasetTargetDetails
        include JSON::Serializable

        # The datalake dataset ARN identifier.

        @[JSON::Field(key: "datasetIdentifier")]
        getter dataset_identifier : String

        # The target dataset load execution.

        @[JSON::Field(key: "datasetLoadExecution")]
        getter dataset_load_execution : Types::DataIntegrationEventDatasetLoadExecutionDetails

        # The target dataset load operation type. The available options are: APPEND - Add new records to the
        # dataset. Noted that this operation type will just try to append records as-is without any primary
        # key or partition constraints. UPSERT - Modify existing records in the dataset with primary key
        # configured, events for datasets without primary keys are not allowed. If event data contains primary
        # keys that match records in the dataset within same partition, then those existing records (in that
        # partition) will be updated. If primary keys do not match, new records will be added. Note that if
        # dataset contain records with duplicate primary key values in the same partition, those duplicate
        # records will be deduped into one updated record. DELETE - Remove existing records in the dataset
        # with primary key configured, events for datasets without primary keys are not allowed. If event data
        # contains primary keys that match records in the dataset within same partition, then those existing
        # records (in that partition) will be deleted. If primary keys do not match, no actions will be done.
        # Note that if dataset contain records with duplicate primary key values in the same partition, all
        # those duplicates will be removed.

        @[JSON::Field(key: "operationType")]
        getter operation_type : String

        def initialize(
          @dataset_identifier : String,
          @dataset_load_execution : Types::DataIntegrationEventDatasetLoadExecutionDetails,
          @operation_type : String
        )
        end
      end

      # The DataIntegrationFlow details.

      struct DataIntegrationFlow
        include JSON::Serializable

        # The DataIntegrationFlow creation timestamp.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The DataIntegrationFlow instance ID.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The DataIntegrationFlow last modified timestamp.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The DataIntegrationFlow name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The DataIntegrationFlow source configurations.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::DataIntegrationFlowSource)

        # The DataIntegrationFlow target configuration.

        @[JSON::Field(key: "target")]
        getter target : Types::DataIntegrationFlowTarget

        # The DataIntegrationFlow transformation configurations.

        @[JSON::Field(key: "transformation")]
        getter transformation : Types::DataIntegrationFlowTransformation

        def initialize(
          @created_time : Time,
          @instance_id : String,
          @last_modified_time : Time,
          @name : String,
          @sources : Array(Types::DataIntegrationFlowSource),
          @target : Types::DataIntegrationFlowTarget,
          @transformation : Types::DataIntegrationFlowTransformation
        )
        end
      end

      # The dataset options used in dataset source and target configurations.

      struct DataIntegrationFlowDatasetOptions
        include JSON::Serializable

        # The option to perform deduplication on data records sharing same primary key values. If disabled,
        # transformed data with duplicate primary key values will ingest into dataset, for datasets within asc
        # namespace, such duplicates will cause ingestion fail. If enabled without dedupeStrategy,
        # deduplication is done by retaining a random data record among those sharing the same primary key
        # values. If enabled with dedupeStragtegy, the deduplication is done following the strategy. Note that
        # target dataset may have partition configured, when dedupe is enabled, it only dedupe against primary
        # keys and retain only one record out of those duplicates regardless of its partition status.

        @[JSON::Field(key: "dedupeRecords")]
        getter dedupe_records : Bool?

        # The deduplication strategy to dedupe the data records sharing same primary key values of the target
        # dataset. This strategy only applies to target dataset with primary keys and with dedupeRecords
        # option enabled. If transformed data still got duplicates after the dedupeStrategy evaluation, a
        # random data record is chosen to be retained.

        @[JSON::Field(key: "dedupeStrategy")]
        getter dedupe_strategy : Types::DataIntegrationFlowDedupeStrategy?

        # The target dataset's data load type. This only affects how source S3 files are selected in the
        # S3-to-dataset flow. REPLACE - Target dataset will get replaced with the new file added under the
        # source s3 prefix. INCREMENTAL - Target dataset will get updated with the up-to-date content under S3
        # prefix incorporating any file additions or removals there.

        @[JSON::Field(key: "loadType")]
        getter load_type : String?

        def initialize(
          @dedupe_records : Bool? = nil,
          @dedupe_strategy : Types::DataIntegrationFlowDedupeStrategy? = nil,
          @load_type : String? = nil
        )
        end
      end

      # The details of a flow execution with dataset source.

      struct DataIntegrationFlowDatasetSource
        include JSON::Serializable

        # The ARN of the dataset source.

        @[JSON::Field(key: "datasetIdentifier")]
        getter dataset_identifier : String

        def initialize(
          @dataset_identifier : String
        )
        end
      end

      # The dataset DataIntegrationFlow source configuration parameters.

      struct DataIntegrationFlowDatasetSourceConfiguration
        include JSON::Serializable

        # The ARN of the dataset.

        @[JSON::Field(key: "datasetIdentifier")]
        getter dataset_identifier : String

        # The dataset DataIntegrationFlow source options.

        @[JSON::Field(key: "options")]
        getter options : Types::DataIntegrationFlowDatasetOptions?

        def initialize(
          @dataset_identifier : String,
          @options : Types::DataIntegrationFlowDatasetOptions? = nil
        )
        end
      end

      # The dataset DataIntegrationFlow target configuration parameters.

      struct DataIntegrationFlowDatasetTargetConfiguration
        include JSON::Serializable

        # The dataset ARN.

        @[JSON::Field(key: "datasetIdentifier")]
        getter dataset_identifier : String

        # The dataset DataIntegrationFlow target options.

        @[JSON::Field(key: "options")]
        getter options : Types::DataIntegrationFlowDatasetOptions?

        def initialize(
          @dataset_identifier : String,
          @options : Types::DataIntegrationFlowDatasetOptions? = nil
        )
        end
      end

      # The deduplication strategy details.

      struct DataIntegrationFlowDedupeStrategy
        include JSON::Serializable

        # The type of the deduplication strategy. FIELD_PRIORITY - Field priority configuration for the
        # deduplication strategy specifies an ordered list of fields used to tie-break the data records
        # sharing the same primary key values. Fields earlier in the list have higher priority for evaluation.
        # For each field, the sort order determines whether to retain data record with larger or smaller field
        # value.

        @[JSON::Field(key: "type")]
        getter type : String

        # The field priority deduplication strategy.

        @[JSON::Field(key: "fieldPriority")]
        getter field_priority : Types::DataIntegrationFlowFieldPriorityDedupeStrategyConfiguration?

        def initialize(
          @type : String,
          @field_priority : Types::DataIntegrationFlowFieldPriorityDedupeStrategyConfiguration? = nil
        )
        end
      end

      # The flow execution details.

      struct DataIntegrationFlowExecution
        include JSON::Serializable

        # The flow executionId.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The flow execution's flowName.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        # The flow execution's instanceId.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The flow execution end timestamp.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The failure message (if any) of failed flow execution.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The flow execution output metadata.

        @[JSON::Field(key: "outputMetadata")]
        getter output_metadata : Types::DataIntegrationFlowExecutionOutputMetadata?

        # The source information for a flow execution.

        @[JSON::Field(key: "sourceInfo")]
        getter source_info : Types::DataIntegrationFlowExecutionSourceInfo?

        # The flow execution start timestamp.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The status of flow execution.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @execution_id : String,
          @flow_name : String,
          @instance_id : String,
          @end_time : Time? = nil,
          @message : String? = nil,
          @output_metadata : Types::DataIntegrationFlowExecutionOutputMetadata? = nil,
          @source_info : Types::DataIntegrationFlowExecutionSourceInfo? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The output metadata of the flow execution.

      struct DataIntegrationFlowExecutionOutputMetadata
        include JSON::Serializable

        # The S3 URI under which all diagnostic files (such as deduped records if any) are stored.

        @[JSON::Field(key: "diagnosticReportsRootS3URI")]
        getter diagnostic_reports_root_s3_uri : String?

        def initialize(
          @diagnostic_reports_root_s3_uri : String? = nil
        )
        end
      end

      # The source information of a flow execution.

      struct DataIntegrationFlowExecutionSourceInfo
        include JSON::Serializable

        # The data integration flow execution source type.

        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # The source details of a flow execution with dataset source.

        @[JSON::Field(key: "datasetSource")]
        getter dataset_source : Types::DataIntegrationFlowDatasetSource?

        # The source details of a flow execution with S3 source.

        @[JSON::Field(key: "s3Source")]
        getter s3_source : Types::DataIntegrationFlowS3Source?

        def initialize(
          @source_type : String,
          @dataset_source : Types::DataIntegrationFlowDatasetSource? = nil,
          @s3_source : Types::DataIntegrationFlowS3Source? = nil
        )
        end
      end

      # The field used in the field priority deduplication strategy.

      struct DataIntegrationFlowFieldPriorityDedupeField
        include JSON::Serializable

        # The name of the deduplication field. Must exist in the dataset and not be a primary key.

        @[JSON::Field(key: "name")]
        getter name : String

        # The sort order for the deduplication field.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @name : String,
          @sort_order : String
        )
        end
      end

      # The field priority deduplication strategy details.

      struct DataIntegrationFlowFieldPriorityDedupeStrategyConfiguration
        include JSON::Serializable

        # The list of field names and their sort order for deduplication, arranged in descending priority from
        # highest to lowest.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::DataIntegrationFlowFieldPriorityDedupeField)

        def initialize(
          @fields : Array(Types::DataIntegrationFlowFieldPriorityDedupeField)
        )
        end
      end

      # The Amazon S3 options used in S3 source and target configurations.

      struct DataIntegrationFlowS3Options
        include JSON::Serializable

        # The Amazon S3 file type in S3 options.

        @[JSON::Field(key: "fileType")]
        getter file_type : String?

        def initialize(
          @file_type : String? = nil
        )
        end
      end

      # The details of a flow execution with S3 source.

      struct DataIntegrationFlowS3Source
        include JSON::Serializable

        # The S3 bucket name of the S3 source.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The S3 object key of the S3 source.

        @[JSON::Field(key: "key")]
        getter key : String

        def initialize(
          @bucket_name : String,
          @key : String
        )
        end
      end

      # The S3 DataIntegrationFlow source configuration parameters.

      struct DataIntegrationFlowS3SourceConfiguration
        include JSON::Serializable

        # The bucketName of the S3 source objects.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The prefix of the S3 source objects. To trigger data ingestion, S3 files need to be put under s3://
        # bucketName / prefix / .

        @[JSON::Field(key: "prefix")]
        getter prefix : String

        # The other options of the S3 DataIntegrationFlow source.

        @[JSON::Field(key: "options")]
        getter options : Types::DataIntegrationFlowS3Options?

        def initialize(
          @bucket_name : String,
          @prefix : String,
          @options : Types::DataIntegrationFlowS3Options? = nil
        )
        end
      end

      # The S3 DataIntegrationFlow target configuration parameters.

      struct DataIntegrationFlowS3TargetConfiguration
        include JSON::Serializable

        # The bucketName of the S3 target objects.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The prefix of the S3 target objects.

        @[JSON::Field(key: "prefix")]
        getter prefix : String

        # The S3 DataIntegrationFlow target options.

        @[JSON::Field(key: "options")]
        getter options : Types::DataIntegrationFlowS3Options?

        def initialize(
          @bucket_name : String,
          @prefix : String,
          @options : Types::DataIntegrationFlowS3Options? = nil
        )
        end
      end

      # The SQL DataIntegrationFlow transformation configuration parameters.

      struct DataIntegrationFlowSQLTransformationConfiguration
        include JSON::Serializable

        # The transformation SQL query body based on SparkSQL.

        @[JSON::Field(key: "query")]
        getter query : String

        def initialize(
          @query : String
        )
        end
      end

      # The DataIntegrationFlow source parameters.

      struct DataIntegrationFlowSource
        include JSON::Serializable

        # The DataIntegrationFlow source name that can be used as table alias in SQL transformation query.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String

        # The DataIntegrationFlow source type.

        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # The dataset DataIntegrationFlow source.

        @[JSON::Field(key: "datasetSource")]
        getter dataset_source : Types::DataIntegrationFlowDatasetSourceConfiguration?

        # The S3 DataIntegrationFlow source.

        @[JSON::Field(key: "s3Source")]
        getter s3_source : Types::DataIntegrationFlowS3SourceConfiguration?

        def initialize(
          @source_name : String,
          @source_type : String,
          @dataset_source : Types::DataIntegrationFlowDatasetSourceConfiguration? = nil,
          @s3_source : Types::DataIntegrationFlowS3SourceConfiguration? = nil
        )
        end
      end

      # The DataIntegrationFlow target parameters.

      struct DataIntegrationFlowTarget
        include JSON::Serializable

        # The DataIntegrationFlow target type.

        @[JSON::Field(key: "targetType")]
        getter target_type : String

        # The dataset DataIntegrationFlow target. Note that for AWS Supply Chain dataset under asc namespace,
        # it has a connection_id internal field that is not allowed to be provided by client directly, they
        # will be auto populated.

        @[JSON::Field(key: "datasetTarget")]
        getter dataset_target : Types::DataIntegrationFlowDatasetTargetConfiguration?

        # The S3 DataIntegrationFlow target.

        @[JSON::Field(key: "s3Target")]
        getter s3_target : Types::DataIntegrationFlowS3TargetConfiguration?

        def initialize(
          @target_type : String,
          @dataset_target : Types::DataIntegrationFlowDatasetTargetConfiguration? = nil,
          @s3_target : Types::DataIntegrationFlowS3TargetConfiguration? = nil
        )
        end
      end

      # The DataIntegrationFlow transformation parameters.

      struct DataIntegrationFlowTransformation
        include JSON::Serializable

        # The DataIntegrationFlow transformation type.

        @[JSON::Field(key: "transformationType")]
        getter transformation_type : String

        # The SQL DataIntegrationFlow transformation configuration.

        @[JSON::Field(key: "sqlTransformation")]
        getter sql_transformation : Types::DataIntegrationFlowSQLTransformationConfiguration?

        def initialize(
          @transformation_type : String,
          @sql_transformation : Types::DataIntegrationFlowSQLTransformationConfiguration? = nil
        )
        end
      end

      # The data lake dataset details.

      struct DataLakeDataset
        include JSON::Serializable

        # The arn of the dataset.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The creation time of the dataset.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The last modified time of the dataset.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The name of the dataset. For asc namespace, the name must be one of the supported data entities
        # under https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of the dataset, besides the custom defined namespace, every instance comes with below
        # pre-defined namespaces: asc - For information on the Amazon Web Services Supply Chain supported
        # datasets see https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .
        # default - For datasets with custom user-defined schemas.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The schema of the dataset.

        @[JSON::Field(key: "schema")]
        getter schema : Types::DataLakeDatasetSchema

        # The description of the dataset.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "partitionSpec")]
        getter partition_spec : Types::DataLakeDatasetPartitionSpec?

        def initialize(
          @arn : String,
          @created_time : Time,
          @instance_id : String,
          @last_modified_time : Time,
          @name : String,
          @namespace : String,
          @schema : Types::DataLakeDatasetSchema,
          @description : String? = nil,
          @partition_spec : Types::DataLakeDatasetPartitionSpec? = nil
        )
        end
      end

      # The detail of the partition field.

      struct DataLakeDatasetPartitionField
        include JSON::Serializable

        # The name of the partition field.

        @[JSON::Field(key: "name")]
        getter name : String

        # The transformation of the partition field. A transformation specifies how to partition on a given
        # field. For example, with timestamp you can specify that you'd like to partition fields by day, e.g.
        # data record with value 2025-01-03T00:00:00Z in partition field is in 2025-01-03 partition. Also
        # noted that data record without any value in optional partition field is in NULL partition.

        @[JSON::Field(key: "transform")]
        getter transform : Types::DataLakeDatasetPartitionFieldTransform

        def initialize(
          @name : String,
          @transform : Types::DataLakeDatasetPartitionFieldTransform
        )
        end
      end

      # The detail of the partition field transformation.

      struct DataLakeDatasetPartitionFieldTransform
        include JSON::Serializable

        # The type of partitioning transformation for this field. The available options are: IDENTITY -
        # Partitions data on a given field by its exact values. YEAR - Partitions data on a timestamp field
        # using year granularity. MONTH - Partitions data on a timestamp field using month granularity. DAY -
        # Partitions data on a timestamp field using day granularity. HOUR - Partitions data on a timestamp
        # field using hour granularity.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # The partition specification for a dataset.

      struct DataLakeDatasetPartitionSpec
        include JSON::Serializable

        # The fields on which to partition a dataset. The partitions will be applied hierarchically based on
        # the order of this list.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::DataLakeDatasetPartitionField)

        def initialize(
          @fields : Array(Types::DataLakeDatasetPartitionField)
        )
        end
      end

      # The detail of the primary key field.

      struct DataLakeDatasetPrimaryKeyField
        include JSON::Serializable

        # The name of the primary key field.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # The schema details of the dataset. Note that for AWS Supply Chain dataset under asc namespace, it
      # may have internal fields like connection_id that will be auto populated by data ingestion methods.

      struct DataLakeDatasetSchema
        include JSON::Serializable

        # The list of field details of the dataset schema.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::DataLakeDatasetSchemaField)

        # The name of the dataset schema.

        @[JSON::Field(key: "name")]
        getter name : String

        # The list of primary key fields for the dataset. Primary keys defined can help data ingestion methods
        # to ensure data uniqueness: CreateDataIntegrationFlow's dedupe strategy will leverage primary keys to
        # perform records deduplication before write to dataset; SendDataIntegrationEvent's UPSERT and DELETE
        # can only work with dataset with primary keys. For more details, refer to those data ingestion
        # documentations. Note that defining primary keys does not necessarily mean the dataset cannot have
        # duplicate records, duplicate records can still be ingested if CreateDataIntegrationFlow's dedupe
        # disabled or through SendDataIntegrationEvent's APPEND operation.

        @[JSON::Field(key: "primaryKeys")]
        getter primary_keys : Array(Types::DataLakeDatasetPrimaryKeyField)?

        def initialize(
          @fields : Array(Types::DataLakeDatasetSchemaField),
          @name : String,
          @primary_keys : Array(Types::DataLakeDatasetPrimaryKeyField)? = nil
        )
        end
      end

      # The dataset field details.

      struct DataLakeDatasetSchemaField
        include JSON::Serializable

        # Indicate if the field is required or not.

        @[JSON::Field(key: "isRequired")]
        getter is_required : Bool

        # The dataset field name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The dataset field type.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @is_required : Bool,
          @name : String,
          @type : String
        )
        end
      end

      # The data lake namespace details.

      struct DataLakeNamespace
        include JSON::Serializable

        # The arn of the namespace.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The creation time of the namespace.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The last modified time of the namespace.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The name of the namespace.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_time : Time,
          @instance_id : String,
          @last_modified_time : Time,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # The request parameters for DeleteDataIntegrationFlow.

      struct DeleteDataIntegrationFlowRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the DataIntegrationFlow to be deleted.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @instance_id : String,
          @name : String
        )
        end
      end

      # The response parameters for DeleteDataIntegrationFlow.

      struct DeleteDataIntegrationFlowResponse
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the DataIntegrationFlow deleted.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @instance_id : String,
          @name : String
        )
        end
      end

      # The request parameters of DeleteDataLakeDataset.

      struct DeleteDataLakeDatasetRequest
        include JSON::Serializable

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the dataset. For asc namespace, the name must be one of the supported data entities
        # under https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of the dataset, besides the custom defined namespace, every instance comes with below
        # pre-defined namespaces: asc - For information on the Amazon Web Services Supply Chain supported
        # datasets see https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .
        # default - For datasets with custom user-defined schemas.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        def initialize(
          @instance_id : String,
          @name : String,
          @namespace : String
        )
        end
      end

      # The response parameters of DeleteDataLakeDataset.

      struct DeleteDataLakeDatasetResponse
        include JSON::Serializable

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of deleted dataset.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of deleted dataset.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        def initialize(
          @instance_id : String,
          @name : String,
          @namespace : String
        )
        end
      end

      # The request parameters of DeleteDataLakeNamespace.

      struct DeleteDataLakeNamespaceRequest
        include JSON::Serializable

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the namespace. Noted you cannot delete pre-defined namespace like asc , default which
        # are only deleted through instance deletion.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @instance_id : String,
          @name : String
        )
        end
      end

      # The response parameters of DeleteDataLakeNamespace.

      struct DeleteDataLakeNamespaceResponse
        include JSON::Serializable

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of deleted namespace.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @instance_id : String,
          @name : String
        )
        end
      end

      # The request parameters for DeleteInstance.

      struct DeleteInstanceRequest
        include JSON::Serializable

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        def initialize(
          @instance_id : String
        )
        end
      end

      # The response parameters for DeleteInstance.

      struct DeleteInstanceResponse
        include JSON::Serializable

        # The AWS Supply Chain instance resource data details.

        @[JSON::Field(key: "instance")]
        getter instance : Types::Instance

        def initialize(
          @instance : Types::Instance
        )
        end
      end

      # The request parameters for GetBillOfMaterialsImportJob.

      struct GetBillOfMaterialsImportJobRequest
        include JSON::Serializable

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The BillOfMaterialsImportJob identifier.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @instance_id : String,
          @job_id : String
        )
        end
      end

      # The response parameters for GetBillOfMaterialsImportJob.

      struct GetBillOfMaterialsImportJobResponse
        include JSON::Serializable

        # The BillOfMaterialsImportJob.

        @[JSON::Field(key: "job")]
        getter job : Types::BillOfMaterialsImportJob

        def initialize(
          @job : Types::BillOfMaterialsImportJob
        )
        end
      end

      # The request parameters for GetDataIntegrationEvent.

      struct GetDataIntegrationEventRequest
        include JSON::Serializable

        # The unique event identifier.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        def initialize(
          @event_id : String,
          @instance_id : String
        )
        end
      end

      # The response parameters for GetDataIntegrationEvent.

      struct GetDataIntegrationEventResponse
        include JSON::Serializable

        # The details of the DataIntegrationEvent returned.

        @[JSON::Field(key: "event")]
        getter event : Types::DataIntegrationEvent

        def initialize(
          @event : Types::DataIntegrationEvent
        )
        end
      end

      # The request parameters of GetFlowExecution.

      struct GetDataIntegrationFlowExecutionRequest
        include JSON::Serializable

        # The flow execution identifier.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The flow name.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        def initialize(
          @execution_id : String,
          @flow_name : String,
          @instance_id : String
        )
        end
      end

      # The response parameters of GetFlowExecution.

      struct GetDataIntegrationFlowExecutionResponse
        include JSON::Serializable

        # The flow execution details.

        @[JSON::Field(key: "flowExecution")]
        getter flow_execution : Types::DataIntegrationFlowExecution

        def initialize(
          @flow_execution : Types::DataIntegrationFlowExecution
        )
        end
      end

      # The request parameters for GetDataIntegrationFlow.

      struct GetDataIntegrationFlowRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the DataIntegrationFlow created.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @instance_id : String,
          @name : String
        )
        end
      end

      # The response parameters for GetDataIntegrationFlow.

      struct GetDataIntegrationFlowResponse
        include JSON::Serializable

        # The details of the DataIntegrationFlow returned.

        @[JSON::Field(key: "flow")]
        getter flow : Types::DataIntegrationFlow

        def initialize(
          @flow : Types::DataIntegrationFlow
        )
        end
      end

      # The request parameters for GetDataLakeDataset.

      struct GetDataLakeDatasetRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the dataset. For asc namespace, the name must be one of the supported data entities
        # under https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of the dataset, besides the custom defined namespace, every instance comes with below
        # pre-defined namespaces: asc - For information on the Amazon Web Services Supply Chain supported
        # datasets see https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .
        # default - For datasets with custom user-defined schemas.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        def initialize(
          @instance_id : String,
          @name : String,
          @namespace : String
        )
        end
      end

      # The response parameters for GetDataLakeDataset.

      struct GetDataLakeDatasetResponse
        include JSON::Serializable

        # The fetched dataset details.

        @[JSON::Field(key: "dataset")]
        getter dataset : Types::DataLakeDataset

        def initialize(
          @dataset : Types::DataLakeDataset
        )
        end
      end

      # The request parameters for GetDataLakeNamespace.

      struct GetDataLakeNamespaceRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the namespace. Besides the namespaces user created, you can also specify the pre-defined
        # namespaces: asc - Pre-defined namespace containing Amazon Web Services Supply Chain supported
        # datasets, see https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .
        # default - Pre-defined namespace containing datasets with custom user-defined schemas.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @instance_id : String,
          @name : String
        )
        end
      end

      # The response parameters for GetDataLakeNamespace.

      struct GetDataLakeNamespaceResponse
        include JSON::Serializable

        # The fetched namespace details.

        @[JSON::Field(key: "namespace")]
        getter namespace : Types::DataLakeNamespace

        def initialize(
          @namespace : Types::DataLakeNamespace
        )
        end
      end

      # The request parameters for GetInstance.

      struct GetInstanceRequest
        include JSON::Serializable

        # The AWS Supply Chain instance identifier

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        def initialize(
          @instance_id : String
        )
        end
      end

      # The response parameters for GetInstance.

      struct GetInstanceResponse
        include JSON::Serializable

        # The instance resource data details.

        @[JSON::Field(key: "instance")]
        getter instance : Types::Instance

        def initialize(
          @instance : Types::Instance
        )
        end
      end

      # The details of the instance.

      struct Instance
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the instance.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The state of the instance.

        @[JSON::Field(key: "state")]
        getter state : String

        # The instance creation timestamp.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # The Amazon Web Services Supply Chain instance error message. If the instance results in an unhealthy
        # state, customers need to check the error message, delete the current instance, and recreate a new
        # one based on the mitigation from the error message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The Amazon Web Services Supply Chain instance description.

        @[JSON::Field(key: "instanceDescription")]
        getter instance_description : String?

        # The Amazon Web Services Supply Chain instance name.

        @[JSON::Field(key: "instanceName")]
        getter instance_name : String?

        # The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you optionally provided for
        # encryption. If you did not provide anything here, AWS Supply Chain uses the Amazon Web Services
        # owned KMS key and nothing is returned.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The instance last modified timestamp.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The version number of the instance.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Float64?

        # The WebApp DNS domain name of the instance.

        @[JSON::Field(key: "webAppDnsDomain")]
        getter web_app_dns_domain : String?

        def initialize(
          @aws_account_id : String,
          @instance_id : String,
          @state : String,
          @created_time : Time? = nil,
          @error_message : String? = nil,
          @instance_description : String? = nil,
          @instance_name : String? = nil,
          @kms_key_arn : String? = nil,
          @last_modified_time : Time? = nil,
          @version_number : Float64? = nil,
          @web_app_dns_domain : String? = nil
        )
        end
      end

      # Unexpected error during processing of request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request parameters for ListDataIntegrationEvents.

      struct ListDataIntegrationEventsRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # List data integration events for the specified eventType.

        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # Specify the maximum number of data integration events to fetch in one paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token to fetch the next page of the data integration events.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @event_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response parameters for ListDataIntegrationEvents.

      struct ListDataIntegrationEventsResponse
        include JSON::Serializable

        # The list of data integration events.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::DataIntegrationEvent)

        # The pagination token to fetch the next page of the ListDataIntegrationEvents.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::DataIntegrationEvent),
          @next_token : String? = nil
        )
        end
      end

      # The request parameters of ListFlowExecutions.

      struct ListDataIntegrationFlowExecutionsRequest
        include JSON::Serializable

        # The flow name.

        @[JSON::Field(key: "flowName")]
        getter flow_name : String

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The number to specify the max number of flow executions to fetch in this paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token to fetch next page of flow executions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_name : String,
          @instance_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response parameters of ListFlowExecutions.

      struct ListDataIntegrationFlowExecutionsResponse
        include JSON::Serializable

        # The list of flow executions.

        @[JSON::Field(key: "flowExecutions")]
        getter flow_executions : Array(Types::DataIntegrationFlowExecution)

        # The pagination token to fetch next page of flow executions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_executions : Array(Types::DataIntegrationFlowExecution),
          @next_token : String? = nil
        )
        end
      end

      # The request parameters for ListDataIntegrationFlows.

      struct ListDataIntegrationFlowsRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # Specify the maximum number of DataIntegrationFlows to fetch in one paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token to fetch the next page of the DataIntegrationFlows.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response parameters for ListDataIntegrationFlows.

      struct ListDataIntegrationFlowsResponse
        include JSON::Serializable

        # The response parameters for ListDataIntegrationFlows.

        @[JSON::Field(key: "flows")]
        getter flows : Array(Types::DataIntegrationFlow)

        # The pagination token to fetch the next page of the DataIntegrationFlows.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flows : Array(Types::DataIntegrationFlow),
          @next_token : String? = nil
        )
        end
      end

      # The request parameters of ListDataLakeDatasets.

      struct ListDataLakeDatasetsRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The namespace of the dataset, besides the custom defined namespace, every instance comes with below
        # pre-defined namespaces: asc - For information on the Amazon Web Services Supply Chain supported
        # datasets see https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .
        # default - For datasets with custom user-defined schemas.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The max number of datasets to fetch in this paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token to fetch next page of datasets.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @namespace : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response parameters of ListDataLakeDatasets.

      struct ListDataLakeDatasetsResponse
        include JSON::Serializable

        # The list of fetched dataset details.

        @[JSON::Field(key: "datasets")]
        getter datasets : Array(Types::DataLakeDataset)

        # The pagination token to fetch next page of datasets.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @datasets : Array(Types::DataLakeDataset),
          @next_token : String? = nil
        )
        end
      end

      # The request parameters of ListDataLakeNamespaces.

      struct ListDataLakeNamespacesRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The max number of namespaces to fetch in this paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token to fetch next page of namespaces.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response parameters of ListDataLakeNamespaces.

      struct ListDataLakeNamespacesResponse
        include JSON::Serializable

        # The list of fetched namespace details. Noted it only contains custom namespaces, pre-defined
        # namespaces are not included.

        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(Types::DataLakeNamespace)

        # The pagination token to fetch next page of namespaces.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @namespaces : Array(Types::DataLakeNamespace),
          @next_token : String? = nil
        )
        end
      end

      # The request parameters for ListInstances.

      struct ListInstancesRequest
        include JSON::Serializable

        # The filter to ListInstances based on their names.

        @[JSON::Field(key: "instanceNameFilter")]
        getter instance_name_filter : Array(String)?

        # The filter to ListInstances based on their state.

        @[JSON::Field(key: "instanceStateFilter")]
        getter instance_state_filter : Array(String)?

        # Specify the maximum number of instances to fetch in this paginated request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token to fetch the next page of instances.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instance_name_filter : Array(String)? = nil,
          @instance_state_filter : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response parameters for ListInstances.

      struct ListInstancesResponse
        include JSON::Serializable

        # The list of instances resource data details.

        @[JSON::Field(key: "instances")]
        getter instances : Array(Types::Instance)

        # The pagination token to fetch the next page of instances.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instances : Array(Types::Instance),
          @next_token : String? = nil
        )
        end
      end

      # The request parameters of ListTagsForResource.

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Web Services Supply chain resource ARN that needs tags to be listed.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # The response parameters of ListTagsForResource.

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags added to an Amazon Web Services Supply Chain resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # Request references a resource which does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request parameters for SendDataIntegrationEvent.

      struct SendDataIntegrationEventRequest
        include JSON::Serializable

        # The data payload of the event, should follow the data schema of the target dataset, or see Data
        # entities supported in AWS Supply Chain . To send single data record, use JsonObject format; to send
        # multiple data records, use JsonArray format. Note that for AWS Supply Chain dataset under asc
        # namespace, it has a connection_id internal field that is not allowed to be provided by client
        # directly, they will be auto populated.

        @[JSON::Field(key: "data")]
        getter data : String

        # Event identifier (for example, orderId for InboundOrder) used for data sharding or partitioning.
        # Noted under one eventGroupId of same eventType and instanceId, events are processed sequentially in
        # the order they are received by the server.

        @[JSON::Field(key: "eventGroupId")]
        getter event_group_id : String

        # The data event type. scn.data.dataset - Send data directly to any specified dataset.
        # scn.data.supplyplan - Send data to supply_plan dataset. scn.data.shipmentstoporder - Send data to
        # shipment_stop_order dataset. scn.data.shipmentstop - Send data to shipment_stop dataset.
        # scn.data.shipment - Send data to shipment dataset. scn.data.reservation - Send data to reservation
        # dataset. scn.data.processproduct - Send data to process_product dataset. scn.data.processoperation -
        # Send data to process_operation dataset. scn.data.processheader - Send data to process_header
        # dataset. scn.data.forecast - Send data to forecast dataset. scn.data.inventorylevel - Send data to
        # inv_level dataset. scn.data.inboundorder - Send data to inbound_order dataset.
        # scn.data.inboundorderline - Send data to inbound_order_line dataset.
        # scn.data.inboundorderlineschedule - Send data to inbound_order_line_schedule dataset.
        # scn.data.outboundorderline - Send data to outbound_order_line dataset. scn.data.outboundshipment -
        # Send data to outbound_shipment dataset.

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The idempotent client token. The token is active for 8 hours, and within its lifetime, it ensures
        # the request completes only once upon retry with same client token. If omitted, the AWS SDK generates
        # a unique value so that AWS SDK can safely retry the request upon network errors.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The target dataset configuration for scn.data.dataset event type.

        @[JSON::Field(key: "datasetTarget")]
        getter dataset_target : Types::DataIntegrationEventDatasetTargetConfiguration?

        # The timestamp (in epoch seconds) associated with the event. If not provided, it will be assigned
        # with current timestamp.

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : Time?

        def initialize(
          @data : String,
          @event_group_id : String,
          @event_type : String,
          @instance_id : String,
          @client_token : String? = nil,
          @dataset_target : Types::DataIntegrationEventDatasetTargetConfiguration? = nil,
          @event_timestamp : Time? = nil
        )
        end
      end

      # The response parameters for SendDataIntegrationEvent.

      struct SendDataIntegrationEventResponse
        include JSON::Serializable

        # The unique event identifier.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        def initialize(
          @event_id : String
        )
        end
      end

      # Request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request parameters of TagResource.

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Web Services Supply chain resource ARN that needs to be tagged.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags of the Amazon Web Services Supply chain resource to be created.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The response parameters for TagResource.

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request parameters of UntagResource.

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Web Services Supply chain resource ARN that needs to be untagged.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys to be deleted for an Amazon Web Services Supply Chain resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # The response parameters of UntagResource.

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request parameters for UpdateDataIntegrationFlow.

      struct UpdateDataIntegrationFlowRequest
        include JSON::Serializable

        # The Amazon Web Services Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the DataIntegrationFlow to be updated.

        @[JSON::Field(key: "name")]
        getter name : String

        # The new source configurations for the DataIntegrationFlow.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::DataIntegrationFlowSource)?

        # The new target configurations for the DataIntegrationFlow.

        @[JSON::Field(key: "target")]
        getter target : Types::DataIntegrationFlowTarget?

        # The new transformation configurations for the DataIntegrationFlow.

        @[JSON::Field(key: "transformation")]
        getter transformation : Types::DataIntegrationFlowTransformation?

        def initialize(
          @instance_id : String,
          @name : String,
          @sources : Array(Types::DataIntegrationFlowSource)? = nil,
          @target : Types::DataIntegrationFlowTarget? = nil,
          @transformation : Types::DataIntegrationFlowTransformation? = nil
        )
        end
      end

      # The response parameters for UpdateDataIntegrationFlow.

      struct UpdateDataIntegrationFlowResponse
        include JSON::Serializable

        # The details of the updated DataIntegrationFlow.

        @[JSON::Field(key: "flow")]
        getter flow : Types::DataIntegrationFlow

        def initialize(
          @flow : Types::DataIntegrationFlow
        )
        end
      end

      # The request parameters of UpdateDataLakeDataset.

      struct UpdateDataLakeDatasetRequest
        include JSON::Serializable

        # The Amazon Web Services Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the dataset. For asc namespace, the name must be one of the supported data entities
        # under https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of the dataset, besides the custom defined namespace, every instance comes with below
        # pre-defined namespaces: asc - For information on the Amazon Web Services Supply Chain supported
        # datasets see https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html .
        # default - For datasets with custom user-defined schemas.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The updated description of the data lake dataset.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @instance_id : String,
          @name : String,
          @namespace : String,
          @description : String? = nil
        )
        end
      end

      # The response parameters of UpdateDataLakeDataset.

      struct UpdateDataLakeDatasetResponse
        include JSON::Serializable

        # The updated dataset details.

        @[JSON::Field(key: "dataset")]
        getter dataset : Types::DataLakeDataset

        def initialize(
          @dataset : Types::DataLakeDataset
        )
        end
      end

      # The request parameters of UpdateDataLakeNamespace.

      struct UpdateDataLakeNamespaceRequest
        include JSON::Serializable

        # The Amazon Web Services Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The name of the namespace. Noted you cannot update namespace with name starting with asc , default ,
        # scn , aws , amazon , amzn

        @[JSON::Field(key: "name")]
        getter name : String

        # The updated description of the data lake namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @instance_id : String,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # The response parameters of UpdateDataLakeNamespace.

      struct UpdateDataLakeNamespaceResponse
        include JSON::Serializable

        # The updated namespace details.

        @[JSON::Field(key: "namespace")]
        getter namespace : Types::DataLakeNamespace

        def initialize(
          @namespace : Types::DataLakeNamespace
        )
        end
      end

      # The request parameters for UpdateInstance.

      struct UpdateInstanceRequest
        include JSON::Serializable

        # The AWS Supply Chain instance identifier.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The AWS Supply Chain instance description.

        @[JSON::Field(key: "instanceDescription")]
        getter instance_description : String?

        # The AWS Supply Chain instance name.

        @[JSON::Field(key: "instanceName")]
        getter instance_name : String?

        def initialize(
          @instance_id : String,
          @instance_description : String? = nil,
          @instance_name : String? = nil
        )
        end
      end

      # The response parameters for UpdateInstance.

      struct UpdateInstanceResponse
        include JSON::Serializable

        # The instance resource data details.

        @[JSON::Field(key: "instance")]
        getter instance : Types::Instance

        def initialize(
          @instance : Types::Instance
        )
        end
      end

      # The input does not satisfy the constraints specified by an AWS service.

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
