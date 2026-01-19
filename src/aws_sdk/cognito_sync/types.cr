require "json"
require "time"

module AwsSdk
  module CognitoSync
    module Types

      # An exception thrown when a bulk publish operation is requested less than 24 hours after a previous
      # bulk publish operation completed successfully.
      struct AlreadyStreamedException
        include JSON::Serializable

        # The message associated with the AlreadyStreamedException exception.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The input for the BulkPublish operation.
      struct BulkPublishRequest
        include JSON::Serializable

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @identity_pool_id : String
        )
        end
      end

      # The output for the BulkPublish operation.
      struct BulkPublishResponse
        include JSON::Serializable

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        def initialize(
          @identity_pool_id : String? = nil
        )
        end
      end

      # Configuration options for configure Cognito streams.
      struct CognitoStreams
        include JSON::Serializable

        # The ARN of the role Amazon Cognito can assume in order to publish to the stream. This role must
        # grant access to Amazon Cognito (cognito-sync) to invoke PutRecord on your Cognito stream.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The name of the Cognito stream to receive updates. This stream must be in the developers account and
        # in the same region as the identity pool.
        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        # Status of the Cognito streams. Valid values are: ENABLED - Streaming of updates to identity pool is
        # enabled. DISABLED - Streaming of updates to identity pool is disabled. Bulk publish will also fail
        # if StreamingStatus is DISABLED.
        @[JSON::Field(key: "StreamingStatus")]
        getter streaming_status : String?

        def initialize(
          @role_arn : String? = nil,
          @stream_name : String? = nil,
          @streaming_status : String? = nil
        )
        end
      end

      # Thrown if there are parallel requests to modify a resource.
      struct ConcurrentModificationException
        include JSON::Serializable

        # The message returned by a ConcurrentModicationException.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A collection of data for an identity pool. An identity pool can have multiple datasets. A dataset is
      # per identity and can be general or associated with a particular entity in an application (like a
      # saved game). Datasets are automatically created if they don't exist. Data is synced by dataset, and
      # a dataset can hold up to 1MB of key-value pairs.
      struct Dataset
        include JSON::Serializable

        # Date on which the dataset was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # Total size in bytes of the records in this dataset.
        @[JSON::Field(key: "DataStorage")]
        getter data_storage : Int64?

        # A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-'
        # (dash), and '.' (dot).
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # The device that made the last change to this dataset.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # Date when the dataset was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # Number of records in this dataset.
        @[JSON::Field(key: "NumRecords")]
        getter num_records : Int64?

        def initialize(
          @creation_date : Time? = nil,
          @data_storage : Int64? = nil,
          @dataset_name : String? = nil,
          @identity_id : String? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @num_records : Int64? = nil
        )
        end
      end

      # A request to delete the specific dataset.
      struct DeleteDatasetRequest
        include JSON::Serializable

        # A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-'
        # (dash), and '.' (dot).
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @dataset_name : String,
          @identity_id : String,
          @identity_pool_id : String
        )
        end
      end

      # Response to a successful DeleteDataset request.
      struct DeleteDatasetResponse
        include JSON::Serializable

        # A collection of data for an identity pool. An identity pool can have multiple datasets. A dataset is
        # per identity and can be general or associated with a particular entity in an application (like a
        # saved game). Datasets are automatically created if they don't exist. Data is synced by dataset, and
        # a dataset can hold up to 1MB of key-value pairs.
        @[JSON::Field(key: "Dataset")]
        getter dataset : Types::Dataset?

        def initialize(
          @dataset : Types::Dataset? = nil
        )
        end
      end

      # A request for meta data about a dataset (creation date, number of records, size) by owner and
      # dataset name.
      struct DescribeDatasetRequest
        include JSON::Serializable

        # A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-'
        # (dash), and '.' (dot).
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @dataset_name : String,
          @identity_id : String,
          @identity_pool_id : String
        )
        end
      end

      # Response to a successful DescribeDataset request.
      struct DescribeDatasetResponse
        include JSON::Serializable

        # Meta data for a collection of data for an identity. An identity can have multiple datasets. A
        # dataset can be general or associated with a particular entity in an application (like a saved game).
        # Datasets are automatically created if they don't exist. Data is synced by dataset, and a dataset can
        # hold up to 1MB of key-value pairs.
        @[JSON::Field(key: "Dataset")]
        getter dataset : Types::Dataset?

        def initialize(
          @dataset : Types::Dataset? = nil
        )
        end
      end

      # A request for usage information about the identity pool.
      struct DescribeIdentityPoolUsageRequest
        include JSON::Serializable

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @identity_pool_id : String
        )
        end
      end

      # Response to a successful DescribeIdentityPoolUsage request.
      struct DescribeIdentityPoolUsageResponse
        include JSON::Serializable

        # Information about the usage of the identity pool.
        @[JSON::Field(key: "IdentityPoolUsage")]
        getter identity_pool_usage : Types::IdentityPoolUsage?

        def initialize(
          @identity_pool_usage : Types::IdentityPoolUsage? = nil
        )
        end
      end

      # A request for information about the usage of an identity pool.
      struct DescribeIdentityUsageRequest
        include JSON::Serializable

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @identity_id : String,
          @identity_pool_id : String
        )
        end
      end

      # The response to a successful DescribeIdentityUsage request.
      struct DescribeIdentityUsageResponse
        include JSON::Serializable

        # Usage information for the identity.
        @[JSON::Field(key: "IdentityUsage")]
        getter identity_usage : Types::IdentityUsage?

        def initialize(
          @identity_usage : Types::IdentityUsage? = nil
        )
        end
      end

      # An exception thrown when there is an IN_PROGRESS bulk publish operation for the given identity pool.
      struct DuplicateRequestException
        include JSON::Serializable

        # The message associated with the DuplicateRequestException exception.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The input for the GetBulkPublishDetails operation.
      struct GetBulkPublishDetailsRequest
        include JSON::Serializable

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @identity_pool_id : String
        )
        end
      end

      # The output for the GetBulkPublishDetails operation.
      struct GetBulkPublishDetailsResponse
        include JSON::Serializable

        # If BulkPublishStatus is SUCCEEDED, the time the last bulk publish operation completed.
        @[JSON::Field(key: "BulkPublishCompleteTime")]
        getter bulk_publish_complete_time : Time?

        # The date/time at which the last bulk publish was initiated.
        @[JSON::Field(key: "BulkPublishStartTime")]
        getter bulk_publish_start_time : Time?

        # Status of the last bulk publish operation, valid values are: NOT_STARTED - No bulk publish has been
        # requested for this identity pool IN_PROGRESS - Data is being published to the configured stream
        # SUCCEEDED - All data for the identity pool has been published to the configured stream FAILED - Some
        # portion of the data has failed to publish, check FailureMessage for the cause.
        @[JSON::Field(key: "BulkPublishStatus")]
        getter bulk_publish_status : String?

        # If BulkPublishStatus is FAILED this field will contain the error message that caused the bulk
        # publish to fail.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        def initialize(
          @bulk_publish_complete_time : Time? = nil,
          @bulk_publish_start_time : Time? = nil,
          @bulk_publish_status : String? = nil,
          @failure_message : String? = nil,
          @identity_pool_id : String? = nil
        )
        end
      end

      # A request for a list of the configured Cognito Events
      struct GetCognitoEventsRequest
        include JSON::Serializable

        # The Cognito Identity Pool ID for the request
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @identity_pool_id : String
        )
        end
      end

      # The response from the GetCognitoEvents request
      struct GetCognitoEventsResponse
        include JSON::Serializable

        # The Cognito Events returned from the GetCognitoEvents request
        @[JSON::Field(key: "Events")]
        getter events : Hash(String, String)?

        def initialize(
          @events : Hash(String, String)? = nil
        )
        end
      end

      # The input for the GetIdentityPoolConfiguration operation.
      struct GetIdentityPoolConfigurationRequest
        include JSON::Serializable

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. This is the ID of the pool for which to return a configuration.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @identity_pool_id : String
        )
        end
      end

      # The output for the GetIdentityPoolConfiguration operation.
      struct GetIdentityPoolConfigurationResponse
        include JSON::Serializable

        # Options to apply to this identity pool for Amazon Cognito streams.
        @[JSON::Field(key: "CognitoStreams")]
        getter cognito_streams : Types::CognitoStreams?

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # Options to apply to this identity pool for push synchronization.
        @[JSON::Field(key: "PushSync")]
        getter push_sync : Types::PushSync?

        def initialize(
          @cognito_streams : Types::CognitoStreams? = nil,
          @identity_pool_id : String? = nil,
          @push_sync : Types::PushSync? = nil
        )
        end
      end

      # Usage information for the identity pool.
      struct IdentityPoolUsage
        include JSON::Serializable

        # Data storage information for the identity pool.
        @[JSON::Field(key: "DataStorage")]
        getter data_storage : Int64?

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # Date on which the identity pool was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # Number of sync sessions for the identity pool.
        @[JSON::Field(key: "SyncSessionsCount")]
        getter sync_sessions_count : Int64?

        def initialize(
          @data_storage : Int64? = nil,
          @identity_pool_id : String? = nil,
          @last_modified_date : Time? = nil,
          @sync_sessions_count : Int64? = nil
        )
        end
      end

      # Usage information for the identity.
      struct IdentityUsage
        include JSON::Serializable

        # Total data storage for this identity.
        @[JSON::Field(key: "DataStorage")]
        getter data_storage : Int64?

        # Number of datasets for the identity.
        @[JSON::Field(key: "DatasetCount")]
        getter dataset_count : Int32?

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # Date on which the identity was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        def initialize(
          @data_storage : Int64? = nil,
          @dataset_count : Int32? = nil,
          @identity_id : String? = nil,
          @identity_pool_id : String? = nil,
          @last_modified_date : Time? = nil
        )
        end
      end

      # Indicates an internal service error.
      struct InternalErrorException
        include JSON::Serializable

        # Message returned by InternalErrorException.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct InvalidConfigurationException
        include JSON::Serializable

        # Message returned by InvalidConfigurationException.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The AWS Lambda function returned invalid output or an exception.
      struct InvalidLambdaFunctionOutputException
        include JSON::Serializable

        # A message returned when an InvalidLambdaFunctionOutputException occurs
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Thrown when a request parameter does not comply with the associated constraints.
      struct InvalidParameterException
        include JSON::Serializable

        # Message returned by InvalidParameterException.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # AWS Lambda throttled your account, please contact AWS Support
      struct LambdaThrottledException
        include JSON::Serializable

        # A message returned when an LambdaThrottledException is thrown
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Thrown when the limit on the number of objects or operations has been exceeded.
      struct LimitExceededException
        include JSON::Serializable

        # Message returned by LimitExceededException.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Request for a list of datasets for an identity.
      struct ListDatasetsRequest
        include JSON::Serializable

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # The maximum number of results to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for obtaining the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @identity_id : String,
          @identity_pool_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returned for a successful ListDatasets request.
      struct ListDatasetsResponse
        include JSON::Serializable

        # Number of datasets returned.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # A set of datasets.
        @[JSON::Field(key: "Datasets")]
        getter datasets : Array(Types::Dataset)?

        # A pagination token for obtaining the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @count : Int32? = nil,
          @datasets : Array(Types::Dataset)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A request for usage information on an identity pool.
      struct ListIdentityPoolUsageRequest
        include JSON::Serializable

        # The maximum number of results to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for obtaining the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returned for a successful ListIdentityPoolUsage request.
      struct ListIdentityPoolUsageResponse
        include JSON::Serializable

        # Total number of identities for the identity pool.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # Usage information for the identity pools.
        @[JSON::Field(key: "IdentityPoolUsages")]
        getter identity_pool_usages : Array(Types::IdentityPoolUsage)?

        # The maximum number of results to be returned.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token for obtaining the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @count : Int32? = nil,
          @identity_pool_usages : Array(Types::IdentityPoolUsage)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A request for a list of records.
      struct ListRecordsRequest
        include JSON::Serializable

        # A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-'
        # (dash), and '.' (dot).
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # The last server sync count for this record.
        @[JSON::Field(key: "lastSyncCount")]
        getter last_sync_count : Int64?

        # The maximum number of results to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for obtaining the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A token containing a session ID, identity ID, and expiration.
        @[JSON::Field(key: "syncSessionToken")]
        getter sync_session_token : String?

        def initialize(
          @dataset_name : String,
          @identity_id : String,
          @identity_pool_id : String,
          @last_sync_count : Int64? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sync_session_token : String? = nil
        )
        end
      end

      # Returned for a successful ListRecordsRequest.
      struct ListRecordsResponse
        include JSON::Serializable

        # Total number of records.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # A boolean value specifying whether to delete the dataset locally.
        @[JSON::Field(key: "DatasetDeletedAfterRequestedSyncCount")]
        getter dataset_deleted_after_requested_sync_count : Bool?

        # Indicates whether the dataset exists.
        @[JSON::Field(key: "DatasetExists")]
        getter dataset_exists : Bool?

        # Server sync count for this dataset.
        @[JSON::Field(key: "DatasetSyncCount")]
        getter dataset_sync_count : Int64?

        # The user/device that made the last change to this record.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # Names of merged datasets.
        @[JSON::Field(key: "MergedDatasetNames")]
        getter merged_dataset_names : Array(String)?

        # A pagination token for obtaining the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of all records.
        @[JSON::Field(key: "Records")]
        getter records : Array(Types::Record)?

        # A token containing a session ID, identity ID, and expiration.
        @[JSON::Field(key: "SyncSessionToken")]
        getter sync_session_token : String?

        def initialize(
          @count : Int32? = nil,
          @dataset_deleted_after_requested_sync_count : Bool? = nil,
          @dataset_exists : Bool? = nil,
          @dataset_sync_count : Int64? = nil,
          @last_modified_by : String? = nil,
          @merged_dataset_names : Array(String)? = nil,
          @next_token : String? = nil,
          @records : Array(Types::Record)? = nil,
          @sync_session_token : String? = nil
        )
        end
      end

      # Thrown when a user is not authorized to access the requested resource.
      struct NotAuthorizedException
        include JSON::Serializable

        # The message returned by a NotAuthorizedException.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Configuration options to be applied to the identity pool.
      struct PushSync
        include JSON::Serializable

        # List of SNS platform application ARNs that could be used by clients.
        @[JSON::Field(key: "ApplicationArns")]
        getter application_arns : Array(String)?

        # A role configured to allow Cognito to call SNS on behalf of the developer.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @application_arns : Array(String)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # The basic data structure of a dataset.
      struct Record
        include JSON::Serializable

        # The last modified date of the client device.
        @[JSON::Field(key: "DeviceLastModifiedDate")]
        getter device_last_modified_date : Time?

        # The key for the record.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The user/device that made the last change to this record.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date on which the record was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The server sync count for this record.
        @[JSON::Field(key: "SyncCount")]
        getter sync_count : Int64?

        # The value for the record.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @device_last_modified_date : Time? = nil,
          @key : String? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @sync_count : Int64? = nil,
          @value : String? = nil
        )
        end
      end

      # An update operation for a record.
      struct RecordPatch
        include JSON::Serializable

        # The key associated with the record patch.
        @[JSON::Field(key: "Key")]
        getter key : String

        # An operation, either replace or remove.
        @[JSON::Field(key: "Op")]
        getter op : String

        # Last known server sync count for this record. Set to 0 if unknown.
        @[JSON::Field(key: "SyncCount")]
        getter sync_count : Int64

        # The last modified date of the client device.
        @[JSON::Field(key: "DeviceLastModifiedDate")]
        getter device_last_modified_date : Time?

        # The value associated with the record patch.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @op : String,
          @sync_count : Int64,
          @device_last_modified_date : Time? = nil,
          @value : String? = nil
        )
        end
      end

      # A request to RegisterDevice.
      struct RegisterDeviceRequest
        include JSON::Serializable

        # The unique ID for this identity.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. Here, the ID of the pool that the identity belongs to.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # The SNS platform type (e.g. GCM, SDM, APNS, APNS_SANDBOX).
        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The push token.
        @[JSON::Field(key: "Token")]
        getter token : String

        def initialize(
          @identity_id : String,
          @identity_pool_id : String,
          @platform : String,
          @token : String
        )
        end
      end

      # Response to a RegisterDevice request.
      struct RegisterDeviceResponse
        include JSON::Serializable

        # The unique ID generated for this device by Cognito.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        def initialize(
          @device_id : String? = nil
        )
        end
      end

      # Thrown if an update can't be applied because the resource was changed by another call and this would
      # result in a conflict.
      struct ResourceConflictException
        include JSON::Serializable

        # The message returned by a ResourceConflictException.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Thrown if the resource doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        # Message returned by a ResourceNotFoundException.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A request to configure Cognito Events" "
      struct SetCognitoEventsRequest
        include JSON::Serializable

        # The events to configure
        @[JSON::Field(key: "Events")]
        getter events : Hash(String, String)

        # The Cognito Identity Pool to use when configuring Cognito Events
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @events : Hash(String, String),
          @identity_pool_id : String
        )
        end
      end

      # The input for the SetIdentityPoolConfiguration operation.
      struct SetIdentityPoolConfigurationRequest
        include JSON::Serializable

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. This is the ID of the pool to modify.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # Options to apply to this identity pool for Amazon Cognito streams.
        @[JSON::Field(key: "CognitoStreams")]
        getter cognito_streams : Types::CognitoStreams?

        # Options to apply to this identity pool for push synchronization.
        @[JSON::Field(key: "PushSync")]
        getter push_sync : Types::PushSync?

        def initialize(
          @identity_pool_id : String,
          @cognito_streams : Types::CognitoStreams? = nil,
          @push_sync : Types::PushSync? = nil
        )
        end
      end

      # The output for the SetIdentityPoolConfiguration operation
      struct SetIdentityPoolConfigurationResponse
        include JSON::Serializable

        # Options to apply to this identity pool for Amazon Cognito streams.
        @[JSON::Field(key: "CognitoStreams")]
        getter cognito_streams : Types::CognitoStreams?

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # Options to apply to this identity pool for push synchronization.
        @[JSON::Field(key: "PushSync")]
        getter push_sync : Types::PushSync?

        def initialize(
          @cognito_streams : Types::CognitoStreams? = nil,
          @identity_pool_id : String? = nil,
          @push_sync : Types::PushSync? = nil
        )
        end
      end

      # A request to SubscribeToDatasetRequest.
      struct SubscribeToDatasetRequest
        include JSON::Serializable

        # The name of the dataset to subcribe to.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # The unique ID generated for this device by Cognito.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # Unique ID for this identity.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. The ID of the pool to which the identity belongs.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @dataset_name : String,
          @device_id : String,
          @identity_id : String,
          @identity_pool_id : String
        )
        end
      end

      # Response to a SubscribeToDataset request.
      struct SubscribeToDatasetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Thrown if the request is throttled.
      struct TooManyRequestsException
        include JSON::Serializable

        # Message returned by a TooManyRequestsException.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A request to UnsubscribeFromDataset.
      struct UnsubscribeFromDatasetRequest
        include JSON::Serializable

        # The name of the dataset from which to unsubcribe.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # The unique ID generated for this device by Cognito.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # Unique ID for this identity.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. The ID of the pool to which this identity belongs.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @dataset_name : String,
          @device_id : String,
          @identity_id : String,
          @identity_pool_id : String
        )
        end
      end

      # Response to an UnsubscribeFromDataset request.
      struct UnsubscribeFromDatasetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to post updates to records or add and delete records for a dataset and user.
      struct UpdateRecordsRequest
        include JSON::Serializable

        # A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-'
        # (dash), and '.' (dot).
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
        # Cognito. GUID generation is unique within a region.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # The SyncSessionToken returned by a previous call to ListRecords for this dataset and identity.
        @[JSON::Field(key: "SyncSessionToken")]
        getter sync_session_token : String

        # Intended to supply a device ID that will populate the lastModifiedBy field referenced in other
        # methods. The ClientContext field is not yet implemented.
        @[JSON::Field(key: "x-amz-Client-Context")]
        getter client_context : String?

        # The unique ID generated for this device by Cognito.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # A list of patch operations.
        @[JSON::Field(key: "RecordPatches")]
        getter record_patches : Array(Types::RecordPatch)?

        def initialize(
          @dataset_name : String,
          @identity_id : String,
          @identity_pool_id : String,
          @sync_session_token : String,
          @client_context : String? = nil,
          @device_id : String? = nil,
          @record_patches : Array(Types::RecordPatch)? = nil
        )
        end
      end

      # Returned for a successful UpdateRecordsRequest.
      struct UpdateRecordsResponse
        include JSON::Serializable

        # A list of records that have been updated.
        @[JSON::Field(key: "Records")]
        getter records : Array(Types::Record)?

        def initialize(
          @records : Array(Types::Record)? = nil
        )
        end
      end
    end
  end
end
