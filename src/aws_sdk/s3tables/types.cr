require "json"
require "time"

module AwsSdk
  module S3Tables
    module Types

      # The action cannot be performed because you do not have the required permission.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is invalid or malformed.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request failed because there is a conflict with a previous write. You can retry the request.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateNamespaceRequest
        include JSON::Serializable

        # A name for the namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : Array(String)

        # The Amazon Resource Name (ARN) of the table bucket to create the namespace in.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @namespace : Array(String),
          @table_bucket_arn : String
        )
        end
      end


      struct CreateNamespaceResponse
        include JSON::Serializable

        # The name of the namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : Array(String)

        # The Amazon Resource Name (ARN) of the table bucket the namespace was created in.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @namespace : Array(String),
          @table_bucket_arn : String
        )
        end
      end


      struct CreateTableBucketRequest
        include JSON::Serializable

        # The name for the table bucket.

        @[JSON::Field(key: "name")]
        getter name : String

        # The encryption configuration to use for the table bucket. This configuration specifies the default
        # encryption settings that will be applied to all tables created in this bucket unless overridden at
        # the table level. The configuration includes the encryption algorithm and, if using SSE-KMS, the KMS
        # key to use.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The default storage class configuration for the table bucket. This configuration will be applied to
        # all new tables created in this bucket unless overridden at the table level. If not specified, the
        # service default storage class will be used.

        @[JSON::Field(key: "storageClassConfiguration")]
        getter storage_class_configuration : Types::StorageClassConfiguration?

        # A map of user-defined tags that you would like to apply to the table bucket that you are creating. A
        # tag is a key-value pair that you apply to your resources. Tags can help you organize and control
        # access to resources. For more information, see Tagging for cost allocation or attribute-based access
        # control (ABAC) . You must have the s3tables:TagResource permission in addition to
        # s3tables:CreateTableBucket permisson to create a table bucket with tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @storage_class_configuration : Types::StorageClassConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateTableBucketResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct CreateTableRequest
        include JSON::Serializable

        # The format for the table.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name for the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace to associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket to create the table in.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # The encryption configuration to use for the table. This configuration specifies the encryption
        # algorithm and, if using SSE-KMS, the KMS key to use for encrypting the table. If you choose SSE-KMS
        # encryption you must grant the S3 Tables maintenance principal access to your KMS key. For more
        # information, see Permissions requirements for S3 Tables SSE-KMS encryption .

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The metadata for the table.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::TableMetadata?

        # The storage class configuration for the table. If not specified, the table inherits the storage
        # class configuration from its table bucket. Specify this parameter to override the bucket's default
        # storage class for this table.

        @[JSON::Field(key: "storageClassConfiguration")]
        getter storage_class_configuration : Types::StorageClassConfiguration?

        # A map of user-defined tags that you would like to apply to the table that you are creating. A tag is
        # a key-value pair that you apply to your resources. Tags can help you organize, track costs for, and
        # control access to resources. For more information, see Tagging for cost allocation or
        # attribute-based access control (ABAC) . You must have the s3tables:TagResource permission in
        # addition to s3tables:CreateTable permission to create a table with tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @format : String,
          @name : String,
          @namespace : String,
          @table_bucket_arn : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @metadata : Types::TableMetadata? = nil,
          @storage_class_configuration : Types::StorageClassConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateTableResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableARN")]
        getter table_arn : String

        # The version token of the table.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        def initialize(
          @table_arn : String,
          @version_token : String
        )
        end
      end


      struct DeleteNamespaceRequest
        include JSON::Serializable

        # The name of the namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket associated with the namespace.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @namespace : String,
          @table_bucket_arn : String
        )
        end
      end


      struct DeleteTableBucketEncryptionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct DeleteTableBucketMetricsConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct DeleteTableBucketPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct DeleteTableBucketReplicationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # A version token from a previous GetTableBucketReplication call. Use this token to ensure you're
        # deleting the expected version of the configuration.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String?

        def initialize(
          @table_bucket_arn : String,
          @version_token : String? = nil
        )
        end
      end


      struct DeleteTableBucketRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct DeleteTablePolicyRequest
        include JSON::Serializable

        # The table name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket that contains the table.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String
        )
        end
      end


      struct DeleteTableReplicationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableArn")]
        getter table_arn : String

        # A version token from a previous GetTableReplication call. Use this token to ensure you're deleting
        # the expected version of the configuration.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        def initialize(
          @table_arn : String,
          @version_token : String
        )
        end
      end


      struct DeleteTableRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket that contains the table.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # The version token of the table.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String?

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String,
          @version_token : String? = nil
        )
        end
      end

      # Configuration specifying how data should be encrypted. This structure defines the encryption
      # algorithm and optional KMS key to be used for server-side encryption.

      struct EncryptionConfiguration
        include JSON::Serializable

        # The server-side encryption algorithm to use. Valid values are AES256 for S3-managed encryption keys,
        # or aws:kms for Amazon Web Services KMS-managed encryption keys. If you choose SSE-KMS encryption you
        # must grant the S3 Tables maintenance principal access to your KMS key. For more information, see
        # Permissions requirements for S3 Tables SSE-KMS encryption .

        @[JSON::Field(key: "sseAlgorithm")]
        getter sse_algorithm : String

        # The Amazon Resource Name (ARN) of the KMS key to use for encryption. This field is required only
        # when sseAlgorithm is set to aws:kms .

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @sse_algorithm : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # The caller isn't authorized to make the request.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetNamespaceRequest
        include JSON::Serializable

        # The name of the namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @namespace : String,
          @table_bucket_arn : String
        )
        end
      end


      struct GetNamespaceResponse
        include JSON::Serializable

        # The date and time the namespace was created at.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the account that created the namespace.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The name of the namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : Array(String)

        # The ID of the account that owns the namespcace.

        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String

        # The unique identifier of the namespace.

        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # The unique identifier of the table bucket containing this namespace.

        @[JSON::Field(key: "tableBucketId")]
        getter table_bucket_id : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @namespace : Array(String),
          @owner_account_id : String,
          @namespace_id : String? = nil,
          @table_bucket_id : String? = nil
        )
        end
      end


      struct GetTableBucketEncryptionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableBucketEncryptionResponse
        include JSON::Serializable

        # The encryption configuration for the table bucket.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration

        def initialize(
          @encryption_configuration : Types::EncryptionConfiguration
        )
        end
      end


      struct GetTableBucketMaintenanceConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket associated with the maintenance configuration.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableBucketMaintenanceConfigurationResponse
        include JSON::Serializable

        # Details about the maintenance configuration for the table bucket.

        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, Types::TableBucketMaintenanceConfigurationValue)

        # The Amazon Resource Name (ARN) of the table bucket associated with the maintenance configuration.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @configuration : Hash(String, Types::TableBucketMaintenanceConfigurationValue),
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableBucketMetricsConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableBucketMetricsConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # The unique identifier of the metrics configuration.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @table_bucket_arn : String,
          @id : String? = nil
        )
        end
      end


      struct GetTableBucketPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableBucketPolicyResponse
        include JSON::Serializable

        # The JSON that defines the policy.

        @[JSON::Field(key: "resourcePolicy")]
        getter resource_policy : String

        def initialize(
          @resource_policy : String
        )
        end
      end


      struct GetTableBucketReplicationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableBucketReplicationResponse
        include JSON::Serializable

        # The replication configuration for the table bucket, including the IAM role and replication rules.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::TableBucketReplicationConfiguration

        # A version token that represents the current state of the replication configuration. Use this token
        # when updating the configuration to ensure consistency.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        def initialize(
          @configuration : Types::TableBucketReplicationConfiguration,
          @version_token : String
        )
        end
      end


      struct GetTableBucketRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableBucketResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time the table bucket was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the table bucket

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the account that owns the table bucket.

        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String

        # The unique identifier of the table bucket.

        @[JSON::Field(key: "tableBucketId")]
        getter table_bucket_id : String?

        # The type of the table bucket.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @name : String,
          @owner_account_id : String,
          @table_bucket_id : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetTableBucketStorageClassRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableBucketStorageClassResponse
        include JSON::Serializable

        # The storage class configuration for the table bucket.

        @[JSON::Field(key: "storageClassConfiguration")]
        getter storage_class_configuration : Types::StorageClassConfiguration

        def initialize(
          @storage_class_configuration : Types::StorageClassConfiguration
        )
        end
      end


      struct GetTableEncryptionRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket containing the table.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableEncryptionResponse
        include JSON::Serializable

        # The encryption configuration for the table.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration

        def initialize(
          @encryption_configuration : Types::EncryptionConfiguration
        )
        end
      end


      struct GetTableMaintenanceConfigurationRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableMaintenanceConfigurationResponse
        include JSON::Serializable

        # Details about the maintenance configuration for the table bucket.

        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, Types::TableMaintenanceConfigurationValue)

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableARN")]
        getter table_arn : String

        def initialize(
          @configuration : Hash(String, Types::TableMaintenanceConfigurationValue),
          @table_arn : String
        )
        end
      end


      struct GetTableMaintenanceJobStatusRequest
        include JSON::Serializable

        # The name of the table containing the maintenance job status you want to check.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the namespace the table is associated with.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableMaintenanceJobStatusResponse
        include JSON::Serializable

        # The status of the maintenance job.

        @[JSON::Field(key: "status")]
        getter status : Hash(String, Types::TableMaintenanceJobStatusValue)

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableARN")]
        getter table_arn : String

        def initialize(
          @status : Hash(String, Types::TableMaintenanceJobStatusValue),
          @table_arn : String
        )
        end
      end


      struct GetTableMetadataLocationRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableMetadataLocationResponse
        include JSON::Serializable

        # The version token.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        # The warehouse location.

        @[JSON::Field(key: "warehouseLocation")]
        getter warehouse_location : String

        # The metadata location.

        @[JSON::Field(key: "metadataLocation")]
        getter metadata_location : String?

        def initialize(
          @version_token : String,
          @warehouse_location : String,
          @metadata_location : String? = nil
        )
        end
      end


      struct GetTablePolicyRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket that contains the table.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String
        )
        end
      end


      struct GetTablePolicyResponse
        include JSON::Serializable

        # The JSON that defines the policy.

        @[JSON::Field(key: "resourcePolicy")]
        getter resource_policy : String

        def initialize(
          @resource_policy : String
        )
        end
      end


      struct GetTableRecordExpirationConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableArn")]
        getter table_arn : String

        def initialize(
          @table_arn : String
        )
        end
      end


      struct GetTableRecordExpirationConfigurationResponse
        include JSON::Serializable

        # The record expiration configuration for the table, including the status and retention settings.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::TableRecordExpirationConfigurationValue

        def initialize(
          @configuration : Types::TableRecordExpirationConfigurationValue
        )
        end
      end


      struct GetTableRecordExpirationJobStatusRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableArn")]
        getter table_arn : String

        def initialize(
          @table_arn : String
        )
        end
      end


      struct GetTableRecordExpirationJobStatusResponse
        include JSON::Serializable

        # The current status of the most recent expiration job.

        @[JSON::Field(key: "status")]
        getter status : String

        # If the job failed, this field contains an error message describing the failure reason.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The timestamp when the expiration job was last executed.

        @[JSON::Field(key: "lastRunTimestamp")]
        getter last_run_timestamp : Time?

        # Metrics about the most recent expiration job execution, including the number of records and files
        # deleted.

        @[JSON::Field(key: "metrics")]
        getter metrics : Types::TableRecordExpirationJobMetrics?

        def initialize(
          @status : String,
          @failure_message : String? = nil,
          @last_run_timestamp : Time? = nil,
          @metrics : Types::TableRecordExpirationJobMetrics? = nil
        )
        end
      end


      struct GetTableReplicationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableArn")]
        getter table_arn : String

        def initialize(
          @table_arn : String
        )
        end
      end


      struct GetTableReplicationResponse
        include JSON::Serializable

        # The replication configuration for the table, including the IAM role and replication rules.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::TableReplicationConfiguration

        # A version token that represents the current state of the table's replication configuration. Use this
        # token when updating the configuration to ensure consistency.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        def initialize(
          @configuration : Types::TableReplicationConfiguration,
          @version_token : String
        )
        end
      end


      struct GetTableReplicationStatusRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableArn")]
        getter table_arn : String

        def initialize(
          @table_arn : String
        )
        end
      end


      struct GetTableReplicationStatusResponse
        include JSON::Serializable

        # An array of status information for each replication destination, including the current state, last
        # successful update, and any error messages.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::ReplicationDestinationStatusModel)

        # The Amazon Resource Name (ARN) of the source table being replicated.

        @[JSON::Field(key: "sourceTableArn")]
        getter source_table_arn : String

        def initialize(
          @destinations : Array(Types::ReplicationDestinationStatusModel),
          @source_table_arn : String
        )
        end
      end


      struct GetTableRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The name of the namespace the table is associated with.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableArn")]
        getter table_arn : String?

        # The Amazon Resource Name (ARN) of the table bucket associated with the table.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String?

        def initialize(
          @name : String? = nil,
          @namespace : String? = nil,
          @table_arn : String? = nil,
          @table_bucket_arn : String? = nil
        )
        end
      end


      struct GetTableResponse
        include JSON::Serializable

        # The date and time the table bucket was created at.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the account that created the table.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The format of the table.

        @[JSON::Field(key: "format")]
        getter format : String

        # The date and time the table was last modified on.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The ID of the account that last modified the table.

        @[JSON::Field(key: "modifiedBy")]
        getter modified_by : String

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : Array(String)

        # The ID of the account that owns the table.

        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableARN")]
        getter table_arn : String

        # The type of the table.

        @[JSON::Field(key: "type")]
        getter type : String

        # The version token of the table.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        # The warehouse location of the table.

        @[JSON::Field(key: "warehouseLocation")]
        getter warehouse_location : String

        # The service that manages the table.

        @[JSON::Field(key: "managedByService")]
        getter managed_by_service : String?

        # If this table is managed by S3 Tables, contains additional information such as replication details.

        @[JSON::Field(key: "managedTableInformation")]
        getter managed_table_information : Types::ManagedTableInformation?

        # The metadata location of the table.

        @[JSON::Field(key: "metadataLocation")]
        getter metadata_location : String?

        # The unique identifier of the namespace containing this table.

        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # The unique identifier of the table bucket containing this table.

        @[JSON::Field(key: "tableBucketId")]
        getter table_bucket_id : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @format : String,
          @modified_at : Time,
          @modified_by : String,
          @name : String,
          @namespace : Array(String),
          @owner_account_id : String,
          @table_arn : String,
          @type : String,
          @version_token : String,
          @warehouse_location : String,
          @managed_by_service : String? = nil,
          @managed_table_information : Types::ManagedTableInformation? = nil,
          @metadata_location : String? = nil,
          @namespace_id : String? = nil,
          @table_bucket_id : String? = nil
        )
        end
      end


      struct GetTableStorageClassRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket that contains the table.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String
        )
        end
      end


      struct GetTableStorageClassResponse
        include JSON::Serializable

        # The storage class configuration for the table.

        @[JSON::Field(key: "storageClassConfiguration")]
        getter storage_class_configuration : Types::StorageClassConfiguration

        def initialize(
          @storage_class_configuration : Types::StorageClassConfiguration
        )
        end
      end

      # Contains details about the compaction settings for an Iceberg table.

      struct IcebergCompactionSettings
        include JSON::Serializable

        # The compaction strategy to use for the table. This determines how files are selected and combined
        # during compaction operations.

        @[JSON::Field(key: "strategy")]
        getter strategy : String?

        # The target file size for the table in MB.

        @[JSON::Field(key: "targetFileSizeMB")]
        getter target_file_size_mb : Int32?

        def initialize(
          @strategy : String? = nil,
          @target_file_size_mb : Int32? = nil
        )
        end
      end

      # Contains details about the metadata for an Iceberg table.

      struct IcebergMetadata
        include JSON::Serializable

        # The schema for an Iceberg table.

        @[JSON::Field(key: "schema")]
        getter schema : Types::IcebergSchema

        # Contains configuration properties for an Iceberg table.

        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, String)?

        def initialize(
          @schema : Types::IcebergSchema,
          @properties : Hash(String, String)? = nil
        )
        end
      end

      # Contains details about the schema for an Iceberg table.

      struct IcebergSchema
        include JSON::Serializable

        # The schema fields for the table

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::SchemaField)

        def initialize(
          @fields : Array(Types::SchemaField)
        )
        end
      end

      # Contains details about the snapshot management settings for an Iceberg table. The oldest snapshot
      # expires when its age exceeds the maxSnapshotAgeHours and the total number of snapshots exceeds the
      # value for the minimum number of snapshots to keep minSnapshotsToKeep .

      struct IcebergSnapshotManagementSettings
        include JSON::Serializable

        # The maximum age of a snapshot before it can be expired.

        @[JSON::Field(key: "maxSnapshotAgeHours")]
        getter max_snapshot_age_hours : Int32?

        # The minimum number of snapshots to keep.

        @[JSON::Field(key: "minSnapshotsToKeep")]
        getter min_snapshots_to_keep : Int32?

        def initialize(
          @max_snapshot_age_hours : Int32? = nil,
          @min_snapshots_to_keep : Int32? = nil
        )
        end
      end

      # Contains details about the unreferenced file removal settings for an Iceberg table bucket.

      struct IcebergUnreferencedFileRemovalSettings
        include JSON::Serializable

        # The number of days an object has to be non-current before it is deleted.

        @[JSON::Field(key: "nonCurrentDays")]
        getter non_current_days : Int32?

        # The number of days an object has to be unreferenced before it is marked as non-current.

        @[JSON::Field(key: "unreferencedDays")]
        getter unreferenced_days : Int32?

        def initialize(
          @non_current_days : Int32? = nil,
          @unreferenced_days : Int32? = nil
        )
        end
      end

      # The request failed due to an internal server error.

      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about the most recent successful replication update to a destination.

      struct LastSuccessfulReplicatedUpdate
        include JSON::Serializable

        # The S3 location of the metadata that was successfully replicated.

        @[JSON::Field(key: "metadataLocation")]
        getter metadata_location : String

        # The timestamp when the replication update completed successfully.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @metadata_location : String,
          @timestamp : Time
        )
        end
      end


      struct ListNamespacesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # ContinuationToken indicates to Amazon S3 that the list is being continued on this bucket with a
        # token. ContinuationToken is obfuscated and is not a real key. You can use this ContinuationToken for
        # pagination of the list results.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        # The maximum number of namespaces to return in the list.

        @[JSON::Field(key: "maxNamespaces")]
        getter max_namespaces : Int32?

        # The prefix of the namespaces.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @table_bucket_arn : String,
          @continuation_token : String? = nil,
          @max_namespaces : Int32? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct ListNamespacesResponse
        include JSON::Serializable

        # A list of namespaces.

        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(Types::NamespaceSummary)

        # The ContinuationToken for pagination of the list results.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        def initialize(
          @namespaces : Array(Types::NamespaceSummary),
          @continuation_token : String? = nil
        )
        end
      end


      struct ListTableBucketsRequest
        include JSON::Serializable

        # ContinuationToken indicates to Amazon S3 that the list is being continued on this bucket with a
        # token. ContinuationToken is obfuscated and is not a real key. You can use this ContinuationToken for
        # pagination of the list results.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        # The maximum number of table buckets to return in the list.

        @[JSON::Field(key: "maxBuckets")]
        getter max_buckets : Int32?

        # The prefix of the table buckets.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # The type of table buckets to filter by in the list.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @continuation_token : String? = nil,
          @max_buckets : Int32? = nil,
          @prefix : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListTableBucketsResponse
        include JSON::Serializable

        # A list of table buckets.

        @[JSON::Field(key: "tableBuckets")]
        getter table_buckets : Array(Types::TableBucketSummary)

        # You can use this ContinuationToken for pagination of the list results.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        def initialize(
          @table_buckets : Array(Types::TableBucketSummary),
          @continuation_token : String? = nil
        )
        end
      end


      struct ListTablesRequest
        include JSON::Serializable

        # The Amazon resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # ContinuationToken indicates to Amazon S3 that the list is being continued on this bucket with a
        # token. ContinuationToken is obfuscated and is not a real key. You can use this ContinuationToken for
        # pagination of the list results.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        # The maximum number of tables to return.

        @[JSON::Field(key: "maxTables")]
        getter max_tables : Int32?

        # The namespace of the tables.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The prefix of the tables.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @table_bucket_arn : String,
          @continuation_token : String? = nil,
          @max_tables : Int32? = nil,
          @namespace : String? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct ListTablesResponse
        include JSON::Serializable

        # A list of tables.

        @[JSON::Field(key: "tables")]
        getter tables : Array(Types::TableSummary)

        # You can use this ContinuationToken for pagination of the list results.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        def initialize(
          @tables : Array(Types::TableSummary),
          @continuation_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon S3 Tables resource that you want to list tags for. The
        # tagged resource can be a table bucket or a table. For a list of all S3 resources that support
        # tagging, see Managing tags for Amazon S3 resources .

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The user-defined tags that are applied to the resource. For more information, see Tagging for cost
        # allocation or attribute-based access control (ABAC) .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains information about tables that are managed by S3 Tables, including replication information
      # for replica tables.

      struct ManagedTableInformation
        include JSON::Serializable

        # If this table is a replica, contains information about the source table from which it is replicated.

        @[JSON::Field(key: "replicationInformation")]
        getter replication_information : Types::ReplicationInformation?

        def initialize(
          @replication_information : Types::ReplicationInformation? = nil
        )
        end
      end

      # The requested operation is not allowed on this resource. This may occur when attempting to modify a
      # resource that is managed by a service or has restrictions that prevent the operation.

      struct MethodNotAllowedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about a namespace.

      struct NamespaceSummary
        include JSON::Serializable

        # The date and time the namespace was created at.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the account that created the namespace.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The name of the namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : Array(String)

        # The ID of the account that owns the namespace.

        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String

        # The system-assigned unique identifier for the namespace.

        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # The system-assigned unique identifier for the table bucket that contains this namespace.

        @[JSON::Field(key: "tableBucketId")]
        getter table_bucket_id : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @namespace : Array(String),
          @owner_account_id : String,
          @namespace_id : String? = nil,
          @table_bucket_id : String? = nil
        )
        end
      end

      # The request was rejected because the specified resource could not be found.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PutTableBucketEncryptionRequest
        include JSON::Serializable

        # The encryption configuration to apply to the table bucket.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @encryption_configuration : Types::EncryptionConfiguration,
          @table_bucket_arn : String
        )
        end
      end


      struct PutTableBucketMaintenanceConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket associated with the maintenance configuration.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # The type of the maintenance configuration.

        @[JSON::Field(key: "type")]
        getter type : String

        # Defines the values of the maintenance configuration for the table bucket.

        @[JSON::Field(key: "value")]
        getter value : Types::TableBucketMaintenanceConfigurationValue

        def initialize(
          @table_bucket_arn : String,
          @type : String,
          @value : Types::TableBucketMaintenanceConfigurationValue
        )
        end
      end


      struct PutTableBucketMetricsConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @table_bucket_arn : String
        )
        end
      end


      struct PutTableBucketPolicyRequest
        include JSON::Serializable

        # The JSON that defines the policy.

        @[JSON::Field(key: "resourcePolicy")]
        getter resource_policy : String

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @resource_policy : String,
          @table_bucket_arn : String
        )
        end
      end


      struct PutTableBucketReplicationRequest
        include JSON::Serializable

        # The replication configuration to apply, including the IAM role and replication rules.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::TableBucketReplicationConfiguration

        # The Amazon Resource Name (ARN) of the source table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # A version token from a previous GetTableBucketReplication call. Use this token to ensure you're
        # updating the expected version of the configuration.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String?

        def initialize(
          @configuration : Types::TableBucketReplicationConfiguration,
          @table_bucket_arn : String,
          @version_token : String? = nil
        )
        end
      end


      struct PutTableBucketReplicationResponse
        include JSON::Serializable

        # The status of the replication configuration operation.

        @[JSON::Field(key: "status")]
        getter status : String

        # A new version token representing the updated replication configuration.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        def initialize(
          @status : String,
          @version_token : String
        )
        end
      end


      struct PutTableBucketStorageClassRequest
        include JSON::Serializable

        # The storage class configuration to apply to the table bucket. This configuration will serve as the
        # default for new tables created in this bucket.

        @[JSON::Field(key: "storageClassConfiguration")]
        getter storage_class_configuration : Types::StorageClassConfiguration

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @storage_class_configuration : Types::StorageClassConfiguration,
          @table_bucket_arn : String
        )
        end
      end


      struct PutTableMaintenanceConfigurationRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table associated with the maintenance configuration.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # The type of the maintenance configuration.

        @[JSON::Field(key: "type")]
        getter type : String

        # Defines the values of the maintenance configuration for the table.

        @[JSON::Field(key: "value")]
        getter value : Types::TableMaintenanceConfigurationValue

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String,
          @type : String,
          @value : Types::TableMaintenanceConfigurationValue
        )
        end
      end


      struct PutTablePolicyRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The JSON that defines the policy.

        @[JSON::Field(key: "resourcePolicy")]
        getter resource_policy : String

        # The Amazon Resource Name (ARN) of the table bucket that contains the table.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        def initialize(
          @name : String,
          @namespace : String,
          @resource_policy : String,
          @table_bucket_arn : String
        )
        end
      end


      struct PutTableRecordExpirationConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableArn")]
        getter table_arn : String

        # The record expiration configuration to apply to the table, including the status ( enabled or
        # disabled ) and retention period in days.

        @[JSON::Field(key: "value")]
        getter value : Types::TableRecordExpirationConfigurationValue

        def initialize(
          @table_arn : String,
          @value : Types::TableRecordExpirationConfigurationValue
        )
        end
      end


      struct PutTableReplicationRequest
        include JSON::Serializable

        # The replication configuration to apply to the table, including the IAM role and replication rules.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::TableReplicationConfiguration

        # The Amazon Resource Name (ARN) of the source table.

        @[JSON::Field(key: "tableArn")]
        getter table_arn : String

        # A version token from a previous GetTableReplication call. Use this token to ensure you're updating
        # the expected version of the configuration.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String?

        def initialize(
          @configuration : Types::TableReplicationConfiguration,
          @table_arn : String,
          @version_token : String? = nil
        )
        end
      end


      struct PutTableReplicationResponse
        include JSON::Serializable

        # The status of the replication configuration operation.

        @[JSON::Field(key: "status")]
        getter status : String

        # A new version token representing the updated replication configuration.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        def initialize(
          @status : String,
          @version_token : String
        )
        end
      end


      struct RenameTableRequest
        include JSON::Serializable

        # The current name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace associated with the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # The new name for the table.

        @[JSON::Field(key: "newName")]
        getter new_name : String?

        # The new name for the namespace.

        @[JSON::Field(key: "newNamespaceName")]
        getter new_namespace_name : String?

        # The version token of the table.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String?

        def initialize(
          @name : String,
          @namespace : String,
          @table_bucket_arn : String,
          @new_name : String? = nil,
          @new_namespace_name : String? = nil,
          @version_token : String? = nil
        )
        end
      end

      # Specifies a destination table bucket for replication.

      struct ReplicationDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination table bucket where tables will be replicated.

        @[JSON::Field(key: "destinationTableBucketARN")]
        getter destination_table_bucket_arn : String

        def initialize(
          @destination_table_bucket_arn : String
        )
        end
      end

      # Contains status information for a replication destination, including the current replication state,
      # last successful update, and any error messages.

      struct ReplicationDestinationStatusModel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination table bucket.

        @[JSON::Field(key: "destinationTableBucketArn")]
        getter destination_table_bucket_arn : String

        # The current status of replication to this destination.

        @[JSON::Field(key: "replicationStatus")]
        getter replication_status : String

        # The Amazon Resource Name (ARN) of the destination table.

        @[JSON::Field(key: "destinationTableArn")]
        getter destination_table_arn : String?

        # If replication has failed, this field contains an error message describing the failure reason.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # Information about the most recent successful replication update to this destination.

        @[JSON::Field(key: "lastSuccessfulReplicatedUpdate")]
        getter last_successful_replicated_update : Types::LastSuccessfulReplicatedUpdate?

        def initialize(
          @destination_table_bucket_arn : String,
          @replication_status : String,
          @destination_table_arn : String? = nil,
          @failure_message : String? = nil,
          @last_successful_replicated_update : Types::LastSuccessfulReplicatedUpdate? = nil
        )
        end
      end

      # Contains information about the source of a replicated table.

      struct ReplicationInformation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the source table from which this table is replicated.

        @[JSON::Field(key: "sourceTableARN")]
        getter source_table_arn : String

        def initialize(
          @source_table_arn : String
        )
        end
      end

      # Contains details about a schema field.

      struct SchemaField
        include JSON::Serializable

        # The name of the field.

        @[JSON::Field(key: "name")]
        getter name : String

        # The field type. S3 Tables supports all Apache Iceberg primitive types. For more information, see the
        # Apache Iceberg documentation .

        @[JSON::Field(key: "type")]
        getter type : String

        # A Boolean value that specifies whether values are required for each row in this field. By default,
        # this is false and null values are allowed in the field. If this is true the field does not allow
        # null values.

        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @name : String,
          @type : String,
          @required : Bool? = nil
        )
        end
      end

      # The configuration details for the storage class of tables or table buckets. This allows you to
      # optimize storage costs by selecting the appropriate storage class based on your access patterns and
      # performance requirements.

      struct StorageClassConfiguration
        include JSON::Serializable

        # The storage class for the table or table bucket. Valid values include storage classes optimized for
        # different access patterns and cost profiles.

        @[JSON::Field(key: "storageClass")]
        getter storage_class : String

        def initialize(
          @storage_class : String
        )
        end
      end

      # Details about the values that define the maintenance configuration for a table bucket.

      struct TableBucketMaintenanceConfigurationValue
        include JSON::Serializable

        # Contains details about the settings of the maintenance configuration.

        @[JSON::Field(key: "settings")]
        getter settings : Types::TableBucketMaintenanceSettings?

        # The status of the maintenance configuration.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @settings : Types::TableBucketMaintenanceSettings? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains details about the maintenance settings for the table bucket.

      struct TableBucketMaintenanceSettings
        include JSON::Serializable

        # The unreferenced file removal settings for the table bucket.

        @[JSON::Field(key: "icebergUnreferencedFileRemoval")]
        getter iceberg_unreferenced_file_removal : Types::IcebergUnreferencedFileRemovalSettings?

        def initialize(
          @iceberg_unreferenced_file_removal : Types::IcebergUnreferencedFileRemovalSettings? = nil
        )
        end
      end

      # The replication configuration for a table bucket. This configuration defines how tables in the
      # source bucket are replicated to destination table buckets, including the IAM role used for
      # replication.

      struct TableBucketReplicationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that S3 Tables assumes to replicate tables on your
        # behalf.

        @[JSON::Field(key: "role")]
        getter role : String

        # An array of replication rules that define which tables to replicate and where to replicate them.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::TableBucketReplicationRule)

        def initialize(
          @role : String,
          @rules : Array(Types::TableBucketReplicationRule)
        )
        end
      end

      # Defines a rule for replicating tables from a source table bucket to one or more destination table
      # buckets.

      struct TableBucketReplicationRule
        include JSON::Serializable

        # An array of destination table buckets where tables should be replicated.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::ReplicationDestination)

        def initialize(
          @destinations : Array(Types::ReplicationDestination)
        )
        end
      end

      # Contains details about a table bucket.

      struct TableBucketSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time the table bucket was created at.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the table bucket.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the account that owns the table bucket.

        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String

        # The system-assigned unique identifier for the table bucket.

        @[JSON::Field(key: "tableBucketId")]
        getter table_bucket_id : String?

        # The type of the table bucket.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @name : String,
          @owner_account_id : String,
          @table_bucket_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The values that define a maintenance configuration for a table.

      struct TableMaintenanceConfigurationValue
        include JSON::Serializable

        # Contains details about the settings for the maintenance configuration.

        @[JSON::Field(key: "settings")]
        getter settings : Types::TableMaintenanceSettings?

        # The status of the maintenance configuration.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @settings : Types::TableMaintenanceSettings? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about the status of a maintenance job.

      struct TableMaintenanceJobStatusValue
        include JSON::Serializable

        # The status of the job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The failure message of a failed job.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The date and time that the maintenance job was last run.

        @[JSON::Field(key: "lastRunTimestamp")]
        getter last_run_timestamp : Time?

        def initialize(
          @status : String,
          @failure_message : String? = nil,
          @last_run_timestamp : Time? = nil
        )
        end
      end

      # Contains details about maintenance settings for the table.

      struct TableMaintenanceSettings
        include JSON::Serializable

        # Contains details about the Iceberg compaction settings for the table.

        @[JSON::Field(key: "icebergCompaction")]
        getter iceberg_compaction : Types::IcebergCompactionSettings?

        # Contains details about the Iceberg snapshot management settings for the table.

        @[JSON::Field(key: "icebergSnapshotManagement")]
        getter iceberg_snapshot_management : Types::IcebergSnapshotManagementSettings?

        def initialize(
          @iceberg_compaction : Types::IcebergCompactionSettings? = nil,
          @iceberg_snapshot_management : Types::IcebergSnapshotManagementSettings? = nil
        )
        end
      end

      # Contains details about the table metadata.

      struct TableMetadata
        include JSON::Serializable

        # Contains details about the metadata of an Iceberg table.

        @[JSON::Field(key: "iceberg")]
        getter iceberg : Types::IcebergMetadata?

        def initialize(
          @iceberg : Types::IcebergMetadata? = nil
        )
        end
      end

      # The expiration configuration settings for records in a table, and the status of the configuration.
      # If the status of the configuration is enabled, records expire and are automatically removed after
      # the number of days specified in the record expiration settings for the table.

      struct TableRecordExpirationConfigurationValue
        include JSON::Serializable

        # The expiration settings for records in the table.

        @[JSON::Field(key: "settings")]
        getter settings : Types::TableRecordExpirationSettings?

        # The status of the expiration settings for records in the table.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @settings : Types::TableRecordExpirationSettings? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides metrics for the record expiration job that most recently ran for a table. The metrics
      # provide insight into the amount of data that was removed when the job ran.

      struct TableRecordExpirationJobMetrics
        include JSON::Serializable

        # The total number of data files that were removed when the job ran.

        @[JSON::Field(key: "deletedDataFiles")]
        getter deleted_data_files : Int64?

        # The total number of records that were removed when the job ran.

        @[JSON::Field(key: "deletedRecords")]
        getter deleted_records : Int64?

        # The total size (in bytes) of the data files that were removed when the job ran.

        @[JSON::Field(key: "removedFilesSize")]
        getter removed_files_size : Int64?

        def initialize(
          @deleted_data_files : Int64? = nil,
          @deleted_records : Int64? = nil,
          @removed_files_size : Int64? = nil
        )
        end
      end

      # The record expiration setting that specifies when records expire and are automatically removed from
      # a table.

      struct TableRecordExpirationSettings
        include JSON::Serializable

        # If you enable record expiration for a table, you can specify the number of days to retain your table
        # records. For example, to retain your table records for one year, set this value to 365 .

        @[JSON::Field(key: "days")]
        getter days : Int32?

        def initialize(
          @days : Int32? = nil
        )
        end
      end

      # The replication configuration for an individual table. This configuration defines how the table is
      # replicated to destination tables.

      struct TableReplicationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that S3 Tables assumes to replicate the table on your
        # behalf.

        @[JSON::Field(key: "role")]
        getter role : String

        # An array of replication rules that define where this table should be replicated.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::TableReplicationRule)

        def initialize(
          @role : String,
          @rules : Array(Types::TableReplicationRule)
        )
        end
      end

      # Defines a rule for replicating a table to one or more destination tables.

      struct TableReplicationRule
        include JSON::Serializable

        # An array of destination table buckets where this table should be replicated.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::ReplicationDestination)

        def initialize(
          @destinations : Array(Types::ReplicationDestination)
        )
        end
      end

      # Contains details about a table.

      struct TableSummary
        include JSON::Serializable

        # The date and time the table was created at.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date and time the table was last modified at.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : Array(String)

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableARN")]
        getter table_arn : String

        # The type of the table.

        @[JSON::Field(key: "type")]
        getter type : String

        # The Amazon Web Services service managing this table, if applicable. For example, a replicated table
        # is managed by the S3 Tables replication service.

        @[JSON::Field(key: "managedByService")]
        getter managed_by_service : String?

        # The unique identifier for the namespace that contains this table.

        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # The unique identifier for the table bucket that contains this table.

        @[JSON::Field(key: "tableBucketId")]
        getter table_bucket_id : String?

        def initialize(
          @created_at : Time,
          @modified_at : Time,
          @name : String,
          @namespace : Array(String),
          @table_arn : String,
          @type : String,
          @managed_by_service : String? = nil,
          @namespace_id : String? = nil,
          @table_bucket_id : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon S3 Tables resource that you're applying tags to. The
        # tagged resource can be a table bucket or a table. For a list of all S3 resources that support
        # tagging, see Managing tags for Amazon S3 resources .

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The user-defined tag that you want to add to the specified S3 Tables resource. For more information,
        # see Tagging for cost allocation or attribute-based access control (ABAC) .

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

      # The limit on the number of requests per second was exceeded.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon S3 Tables resource that you're removing tags from. The
        # tagged resource can be a table bucket or a table. For a list of all S3 resources that support
        # tagging, see Managing tags for Amazon S3 resources .

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The array of tag keys that you're removing from the S3 Tables resource. For more information, see
        # Tagging for cost allocation or attribute-based access control (ABAC) .

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


      struct UpdateTableMetadataLocationRequest
        include JSON::Serializable

        # The new metadata location for the table.

        @[JSON::Field(key: "metadataLocation")]
        getter metadata_location : String

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of the table.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the table bucket.

        @[JSON::Field(key: "tableBucketARN")]
        getter table_bucket_arn : String

        # The version token of the table.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        def initialize(
          @metadata_location : String,
          @name : String,
          @namespace : String,
          @table_bucket_arn : String,
          @version_token : String
        )
        end
      end


      struct UpdateTableMetadataLocationResponse
        include JSON::Serializable

        # The metadata location of the table.

        @[JSON::Field(key: "metadataLocation")]
        getter metadata_location : String

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace the table is associated with.

        @[JSON::Field(key: "namespace")]
        getter namespace : Array(String)

        # The Amazon Resource Name (ARN) of the table.

        @[JSON::Field(key: "tableARN")]
        getter table_arn : String

        # The version token of the table.

        @[JSON::Field(key: "versionToken")]
        getter version_token : String

        def initialize(
          @metadata_location : String,
          @name : String,
          @namespace : Array(String),
          @table_arn : String,
          @version_token : String
        )
        end
      end
    end
  end
end
