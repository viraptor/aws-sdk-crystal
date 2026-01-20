module AwsSdk
  module S3Tables
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates a namespace. A namespace is a logical grouping of tables within your table bucket, which you
      # can use to organize tables. For more information, see Create a namespace in the Amazon Simple
      # Storage Service User Guide . Permissions You must have the s3tables:CreateNamespace permission to
      # use this operation.

      def create_namespace(
        namespace : Array(String),
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::CreateNamespaceRequest.new(namespace: namespace, table_bucket_arn: table_bucket_arn)
        create_namespace(input)
      end

      def create_namespace(input : Types::CreateNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new table associated with the given namespace in a table bucket. For more information, see
      # Creating an Amazon S3 table in the Amazon Simple Storage Service User Guide . Permissions You must
      # have the s3tables:CreateTable permission to use this operation. If you use this operation with the
      # optional metadata request parameter you must have the s3tables:PutTableData permission. If you use
      # this operation with the optional encryptionConfiguration request parameter you must have the
      # s3tables:PutTableEncryption permission. If you use this operation with the storageClassConfiguration
      # request parameter, you must have the s3tables:PutTableStorageClass permission. To create a table
      # with tags, you must have the s3tables:TagResource permission in addition to s3tables:CreateTable
      # permission. Additionally, If you choose SSE-KMS encryption you must grant the S3 Tables maintenance
      # principal access to your KMS key. For more information, see Permissions requirements for S3 Tables
      # SSE-KMS encryption .

      def create_table(
        format : String,
        name : String,
        namespace : String,
        table_bucket_arn : String,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        metadata : Types::TableMetadata? = nil,
        storage_class_configuration : Types::StorageClassConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTableRequest.new(format: format, name: name, namespace: namespace, table_bucket_arn: table_bucket_arn, encryption_configuration: encryption_configuration, metadata: metadata, storage_class_configuration: storage_class_configuration, tags: tags)
        create_table(input)
      end

      def create_table(input : Types::CreateTableRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a table bucket. For more information, see Creating a table bucket in the Amazon Simple
      # Storage Service User Guide . Permissions You must have the s3tables:CreateTableBucket permission to
      # use this operation. If you use this operation with the optional encryptionConfiguration parameter
      # you must have the s3tables:PutTableBucketEncryption permission. If you use this operation with the
      # storageClassConfiguration request parameter, you must have the s3tables:PutTableBucketStorageClass
      # permission. To create a table bucket with tags, you must have the s3tables:TagResource permission in
      # addition to s3tables:CreateTableBucket permission.

      def create_table_bucket(
        name : String,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        storage_class_configuration : Types::StorageClassConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTableBucketRequest.new(name: name, encryption_configuration: encryption_configuration, storage_class_configuration: storage_class_configuration, tags: tags)
        create_table_bucket(input)
      end

      def create_table_bucket(input : Types::CreateTableBucketRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TABLE_BUCKET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a namespace. For more information, see Delete a namespace in the Amazon Simple Storage
      # Service User Guide . Permissions You must have the s3tables:DeleteNamespace permission to use this
      # operation.

      def delete_namespace(
        namespace : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::DeleteNamespaceRequest.new(namespace: namespace, table_bucket_arn: table_bucket_arn)
        delete_namespace(input)
      end

      def delete_namespace(input : Types::DeleteNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a table. For more information, see Deleting an Amazon S3 table in the Amazon Simple Storage
      # Service User Guide . Permissions You must have the s3tables:DeleteTable permission to use this
      # operation.

      def delete_table(
        name : String,
        namespace : String,
        table_bucket_arn : String,
        version_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteTableRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn, version_token: version_token)
        delete_table(input)
      end

      def delete_table(input : Types::DeleteTableRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a table bucket. For more information, see Deleting a table bucket in the Amazon Simple
      # Storage Service User Guide . Permissions You must have the s3tables:DeleteTableBucket permission to
      # use this operation.

      def delete_table_bucket(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::DeleteTableBucketRequest.new(table_bucket_arn: table_bucket_arn)
        delete_table_bucket(input)
      end

      def delete_table_bucket(input : Types::DeleteTableBucketRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TABLE_BUCKET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the encryption configuration for a table bucket. Permissions You must have the
      # s3tables:DeleteTableBucketEncryption permission to use this operation.

      def delete_table_bucket_encryption(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::DeleteTableBucketEncryptionRequest.new(table_bucket_arn: table_bucket_arn)
        delete_table_bucket_encryption(input)
      end

      def delete_table_bucket_encryption(input : Types::DeleteTableBucketEncryptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TABLE_BUCKET_ENCRYPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the metrics configuration for a table bucket. Permissions You must have the
      # s3tables:DeleteTableBucketMetricsConfiguration permission to use this operation.

      def delete_table_bucket_metrics_configuration(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::DeleteTableBucketMetricsConfigurationRequest.new(table_bucket_arn: table_bucket_arn)
        delete_table_bucket_metrics_configuration(input)
      end

      def delete_table_bucket_metrics_configuration(input : Types::DeleteTableBucketMetricsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TABLE_BUCKET_METRICS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a table bucket policy. For more information, see Deleting a table bucket policy in the
      # Amazon Simple Storage Service User Guide . Permissions You must have the
      # s3tables:DeleteTableBucketPolicy permission to use this operation.

      def delete_table_bucket_policy(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::DeleteTableBucketPolicyRequest.new(table_bucket_arn: table_bucket_arn)
        delete_table_bucket_policy(input)
      end

      def delete_table_bucket_policy(input : Types::DeleteTableBucketPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TABLE_BUCKET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the replication configuration for a table bucket. After deletion, new table updates will no
      # longer be replicated to destination buckets, though existing replicated tables will remain in
      # destination buckets. Permissions You must have the s3tables:DeleteTableBucketReplication permission
      # to use this operation.

      def delete_table_bucket_replication(
        table_bucket_arn : String,
        version_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteTableBucketReplicationRequest.new(table_bucket_arn: table_bucket_arn, version_token: version_token)
        delete_table_bucket_replication(input)
      end

      def delete_table_bucket_replication(input : Types::DeleteTableBucketReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TABLE_BUCKET_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a table policy. For more information, see Deleting a table policy in the Amazon Simple
      # Storage Service User Guide . Permissions You must have the s3tables:DeleteTablePolicy permission to
      # use this operation.

      def delete_table_policy(
        name : String,
        namespace : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::DeleteTablePolicyRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn)
        delete_table_policy(input)
      end

      def delete_table_policy(input : Types::DeleteTablePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TABLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the replication configuration for a specific table. After deletion, new updates to this
      # table will no longer be replicated to destination tables, though existing replicated copies will
      # remain in destination buckets. Permissions You must have the s3tables:DeleteTableReplication
      # permission to use this operation.

      def delete_table_replication(
        table_arn : String,
        version_token : String
      ) : Protocol::Request
        input = Types::DeleteTableReplicationRequest.new(table_arn: table_arn, version_token: version_token)
        delete_table_replication(input)
      end

      def delete_table_replication(input : Types::DeleteTableReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TABLE_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a namespace. For more information, see Table namespaces in the Amazon Simple
      # Storage Service User Guide . Permissions You must have the s3tables:GetNamespace permission to use
      # this operation.

      def get_namespace(
        namespace : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetNamespaceRequest.new(namespace: namespace, table_bucket_arn: table_bucket_arn)
        get_namespace(input)
      end

      def get_namespace(input : Types::GetNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a table. For more information, see S3 Tables in the Amazon Simple Storage Service
      # User Guide . Permissions You must have the s3tables:GetTable permission to use this operation.

      def get_table(
        name : String? = nil,
        namespace : String? = nil,
        table_arn : String? = nil,
        table_bucket_arn : String? = nil
      ) : Protocol::Request
        input = Types::GetTableRequest.new(name: name, namespace: namespace, table_arn: table_arn, table_bucket_arn: table_bucket_arn)
        get_table(input)
      end

      def get_table(input : Types::GetTableRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details on a table bucket. For more information, see Viewing details about an Amazon S3 table
      # bucket in the Amazon Simple Storage Service User Guide . Permissions You must have the
      # s3tables:GetTableBucket permission to use this operation.

      def get_table_bucket(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableBucketRequest.new(table_bucket_arn: table_bucket_arn)
        get_table_bucket(input)
      end

      def get_table_bucket(input : Types::GetTableBucketRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_BUCKET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the encryption configuration for a table bucket. Permissions You must have the
      # s3tables:GetTableBucketEncryption permission to use this operation.

      def get_table_bucket_encryption(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableBucketEncryptionRequest.new(table_bucket_arn: table_bucket_arn)
        get_table_bucket_encryption(input)
      end

      def get_table_bucket_encryption(input : Types::GetTableBucketEncryptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_BUCKET_ENCRYPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a maintenance configuration for a given table bucket. For more information, see
      # Amazon S3 table bucket maintenance in the Amazon Simple Storage Service User Guide . Permissions You
      # must have the s3tables:GetTableBucketMaintenanceConfiguration permission to use this operation.

      def get_table_bucket_maintenance_configuration(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableBucketMaintenanceConfigurationRequest.new(table_bucket_arn: table_bucket_arn)
        get_table_bucket_maintenance_configuration(input)
      end

      def get_table_bucket_maintenance_configuration(input : Types::GetTableBucketMaintenanceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_BUCKET_MAINTENANCE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the metrics configuration for a table bucket. Permissions You must have the
      # s3tables:GetTableBucketMetricsConfiguration permission to use this operation.

      def get_table_bucket_metrics_configuration(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableBucketMetricsConfigurationRequest.new(table_bucket_arn: table_bucket_arn)
        get_table_bucket_metrics_configuration(input)
      end

      def get_table_bucket_metrics_configuration(input : Types::GetTableBucketMetricsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_BUCKET_METRICS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a table bucket policy. For more information, see Viewing a table bucket policy in
      # the Amazon Simple Storage Service User Guide . Permissions You must have the
      # s3tables:GetTableBucketPolicy permission to use this operation.

      def get_table_bucket_policy(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableBucketPolicyRequest.new(table_bucket_arn: table_bucket_arn)
        get_table_bucket_policy(input)
      end

      def get_table_bucket_policy(input : Types::GetTableBucketPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_BUCKET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the replication configuration for a table bucket.This operation returns the IAM role,
      # versionToken , and replication rules that define how tables in this bucket are replicated to other
      # buckets. Permissions You must have the s3tables:GetTableBucketReplication permission to use this
      # operation.

      def get_table_bucket_replication(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableBucketReplicationRequest.new(table_bucket_arn: table_bucket_arn)
        get_table_bucket_replication(input)
      end

      def get_table_bucket_replication(input : Types::GetTableBucketReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_BUCKET_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the storage class configuration for a specific table. This allows you to view the storage
      # class settings that apply to an individual table, which may differ from the table bucket's default
      # configuration. Permissions You must have the s3tables:GetTableBucketStorageClass permission to use
      # this operation.

      def get_table_bucket_storage_class(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableBucketStorageClassRequest.new(table_bucket_arn: table_bucket_arn)
        get_table_bucket_storage_class(input)
      end

      def get_table_bucket_storage_class(input : Types::GetTableBucketStorageClassRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_BUCKET_STORAGE_CLASS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the encryption configuration for a table. Permissions You must have the
      # s3tables:GetTableEncryption permission to use this operation.

      def get_table_encryption(
        name : String,
        namespace : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableEncryptionRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn)
        get_table_encryption(input)
      end

      def get_table_encryption(input : Types::GetTableEncryptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_ENCRYPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about the maintenance configuration of a table. For more information, see S3 Tables
      # maintenance in the Amazon Simple Storage Service User Guide . Permissions You must have the
      # s3tables:GetTableMaintenanceConfiguration permission to use this operation. You must have the
      # s3tables:GetTableData permission to use set the compaction strategy to sort or zorder .

      def get_table_maintenance_configuration(
        name : String,
        namespace : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableMaintenanceConfigurationRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn)
        get_table_maintenance_configuration(input)
      end

      def get_table_maintenance_configuration(input : Types::GetTableMaintenanceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_MAINTENANCE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the status of a maintenance job for a table. For more information, see S3 Tables maintenance in
      # the Amazon Simple Storage Service User Guide . Permissions You must have the
      # s3tables:GetTableMaintenanceJobStatus permission to use this operation.

      def get_table_maintenance_job_status(
        name : String,
        namespace : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableMaintenanceJobStatusRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn)
        get_table_maintenance_job_status(input)
      end

      def get_table_maintenance_job_status(input : Types::GetTableMaintenanceJobStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_MAINTENANCE_JOB_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the location of the table metadata. Permissions You must have the
      # s3tables:GetTableMetadataLocation permission to use this operation.

      def get_table_metadata_location(
        name : String,
        namespace : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableMetadataLocationRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn)
        get_table_metadata_location(input)
      end

      def get_table_metadata_location(input : Types::GetTableMetadataLocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_METADATA_LOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a table policy. For more information, see Viewing a table policy in the Amazon
      # Simple Storage Service User Guide . Permissions You must have the s3tables:GetTablePolicy permission
      # to use this operation.

      def get_table_policy(
        name : String,
        namespace : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTablePolicyRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn)
        get_table_policy(input)
      end

      def get_table_policy(input : Types::GetTablePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the expiration configuration settings for records in a table, and the status of the
      # configuration. If the status of the configuration is enabled , records expire and are automatically
      # removed from the table after the specified number of days. Permissions You must have the
      # s3tables:GetTableRecordExpirationConfiguration permission to use this operation.

      def get_table_record_expiration_configuration(
        table_arn : String
      ) : Protocol::Request
        input = Types::GetTableRecordExpirationConfigurationRequest.new(table_arn: table_arn)
        get_table_record_expiration_configuration(input)
      end

      def get_table_record_expiration_configuration(input : Types::GetTableRecordExpirationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_RECORD_EXPIRATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status, metrics, and details of the latest record expiration job for a table. This
      # includes when the job ran, and whether it succeeded or failed. If the job ran successfully, this
      # also includes statistics about the records that were removed. Permissions You must have the
      # s3tables:GetTableRecordExpirationJobStatus permission to use this operation.

      def get_table_record_expiration_job_status(
        table_arn : String
      ) : Protocol::Request
        input = Types::GetTableRecordExpirationJobStatusRequest.new(table_arn: table_arn)
        get_table_record_expiration_job_status(input)
      end

      def get_table_record_expiration_job_status(input : Types::GetTableRecordExpirationJobStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_RECORD_EXPIRATION_JOB_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the replication configuration for a specific table. Permissions You must have the
      # s3tables:GetTableReplication permission to use this operation.

      def get_table_replication(
        table_arn : String
      ) : Protocol::Request
        input = Types::GetTableReplicationRequest.new(table_arn: table_arn)
        get_table_replication(input)
      end

      def get_table_replication(input : Types::GetTableReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the replication status for a table, including the status of replication to each
      # destination. This operation provides visibility into replication health and progress. Permissions
      # You must have the s3tables:GetTableReplicationStatus permission to use this operation.

      def get_table_replication_status(
        table_arn : String
      ) : Protocol::Request
        input = Types::GetTableReplicationStatusRequest.new(table_arn: table_arn)
        get_table_replication_status(input)
      end

      def get_table_replication_status(input : Types::GetTableReplicationStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_REPLICATION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the storage class configuration for a specific table. This allows you to view the storage
      # class settings that apply to an individual table, which may differ from the table bucket's default
      # configuration. Permissions You must have the s3tables:GetTableStorageClass permission to use this
      # operation.

      def get_table_storage_class(
        name : String,
        namespace : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::GetTableStorageClassRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn)
        get_table_storage_class(input)
      end

      def get_table_storage_class(input : Types::GetTableStorageClassRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_STORAGE_CLASS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the namespaces within a table bucket. For more information, see Table namespaces in the Amazon
      # Simple Storage Service User Guide . Permissions You must have the s3tables:ListNamespaces permission
      # to use this operation.

      def list_namespaces(
        table_bucket_arn : String,
        continuation_token : String? = nil,
        max_namespaces : Int32? = nil,
        prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListNamespacesRequest.new(table_bucket_arn: table_bucket_arn, continuation_token: continuation_token, max_namespaces: max_namespaces, prefix: prefix)
        list_namespaces(input)
      end

      def list_namespaces(input : Types::ListNamespacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NAMESPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists table buckets for your account. For more information, see S3 Table buckets in the Amazon
      # Simple Storage Service User Guide . Permissions You must have the s3tables:ListTableBuckets
      # permission to use this operation.

      def list_table_buckets(
        continuation_token : String? = nil,
        max_buckets : Int32? = nil,
        prefix : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListTableBucketsRequest.new(continuation_token: continuation_token, max_buckets: max_buckets, prefix: prefix, type: type)
        list_table_buckets(input)
      end

      def list_table_buckets(input : Types::ListTableBucketsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TABLE_BUCKETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List tables in the given table bucket. For more information, see S3 Tables in the Amazon Simple
      # Storage Service User Guide . Permissions You must have the s3tables:ListTables permission to use
      # this operation.

      def list_tables(
        table_bucket_arn : String,
        continuation_token : String? = nil,
        max_tables : Int32? = nil,
        namespace : String? = nil,
        prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListTablesRequest.new(table_bucket_arn: table_bucket_arn, continuation_token: continuation_token, max_tables: max_tables, namespace: namespace, prefix: prefix)
        list_tables(input)
      end

      def list_tables(input : Types::ListTablesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TABLES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the tags applied to a specified Amazon S3 Tables resource. Each tag is a label
      # consisting of a key and value pair. Tags can help you organize, track costs for, and control access
      # to resources. For a list of S3 resources that support tagging, see Managing tags for Amazon S3
      # resources . Permissions For tables and table buckets, you must have the s3tables:ListTagsForResource
      # permission to use this operation.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the encryption configuration for a table bucket. Permissions You must have the
      # s3tables:PutTableBucketEncryption permission to use this operation. If you choose SSE-KMS encryption
      # you must grant the S3 Tables maintenance principal access to your KMS key. For more information, see
      # Permissions requirements for S3 Tables SSE-KMS encryption in the Amazon Simple Storage Service User
      # Guide .

      def put_table_bucket_encryption(
        encryption_configuration : Types::EncryptionConfiguration,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::PutTableBucketEncryptionRequest.new(encryption_configuration: encryption_configuration, table_bucket_arn: table_bucket_arn)
        put_table_bucket_encryption(input)
      end

      def put_table_bucket_encryption(input : Types::PutTableBucketEncryptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_BUCKET_ENCRYPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new maintenance configuration or replaces an existing maintenance configuration for a
      # table bucket. For more information, see Amazon S3 table bucket maintenance in the Amazon Simple
      # Storage Service User Guide . Permissions You must have the
      # s3tables:PutTableBucketMaintenanceConfiguration permission to use this operation.

      def put_table_bucket_maintenance_configuration(
        table_bucket_arn : String,
        type : String,
        value : Types::TableBucketMaintenanceConfigurationValue
      ) : Protocol::Request
        input = Types::PutTableBucketMaintenanceConfigurationRequest.new(table_bucket_arn: table_bucket_arn, type: type, value: value)
        put_table_bucket_maintenance_configuration(input)
      end

      def put_table_bucket_maintenance_configuration(input : Types::PutTableBucketMaintenanceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_BUCKET_MAINTENANCE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the metrics configuration for a table bucket. Permissions You must have the
      # s3tables:PutTableBucketMetricsConfiguration permission to use this operation.

      def put_table_bucket_metrics_configuration(
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::PutTableBucketMetricsConfigurationRequest.new(table_bucket_arn: table_bucket_arn)
        put_table_bucket_metrics_configuration(input)
      end

      def put_table_bucket_metrics_configuration(input : Types::PutTableBucketMetricsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_BUCKET_METRICS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new table bucket policy or replaces an existing table bucket policy for a table bucket.
      # For more information, see Adding a table bucket policy in the Amazon Simple Storage Service User
      # Guide . Permissions You must have the s3tables:PutTableBucketPolicy permission to use this
      # operation.

      def put_table_bucket_policy(
        resource_policy : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::PutTableBucketPolicyRequest.new(resource_policy: resource_policy, table_bucket_arn: table_bucket_arn)
        put_table_bucket_policy(input)
      end

      def put_table_bucket_policy(input : Types::PutTableBucketPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_BUCKET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates the replication configuration for a table bucket. This operation defines how
      # tables in the source bucket are replicated to destination buckets. Replication helps ensure data
      # availability and disaster recovery across regions or accounts. Permissions You must have the
      # s3tables:PutTableBucketReplication permission to use this operation. The IAM role specified in the
      # configuration must have permissions to read from the source bucket and write permissions to all
      # destination buckets. You must also have the following permissions: s3tables:GetTable permission on
      # the source table. s3tables:ListTables permission on the bucket containing the table.
      # s3tables:CreateTable permission for the destination. s3tables:CreateNamespace permission for the
      # destination. s3tables:GetTableMaintenanceConfig permission for the source bucket.
      # s3tables:PutTableMaintenanceConfig permission for the destination bucket. You must have iam:PassRole
      # permission with condition allowing roles to be passed to replication.s3tables.amazonaws.com .

      def put_table_bucket_replication(
        configuration : Types::TableBucketReplicationConfiguration,
        table_bucket_arn : String,
        version_token : String? = nil
      ) : Protocol::Request
        input = Types::PutTableBucketReplicationRequest.new(configuration: configuration, table_bucket_arn: table_bucket_arn, version_token: version_token)
        put_table_bucket_replication(input)
      end

      def put_table_bucket_replication(input : Types::PutTableBucketReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_BUCKET_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets or updates the storage class configuration for a table bucket. This configuration serves as the
      # default storage class for all new tables created in the bucket, allowing you to optimize storage
      # costs at the bucket level. Permissions You must have the s3tables:PutTableBucketStorageClass
      # permission to use this operation.

      def put_table_bucket_storage_class(
        storage_class_configuration : Types::StorageClassConfiguration,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::PutTableBucketStorageClassRequest.new(storage_class_configuration: storage_class_configuration, table_bucket_arn: table_bucket_arn)
        put_table_bucket_storage_class(input)
      end

      def put_table_bucket_storage_class(input : Types::PutTableBucketStorageClassRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_BUCKET_STORAGE_CLASS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new maintenance configuration or replaces an existing maintenance configuration for a
      # table. For more information, see S3 Tables maintenance in the Amazon Simple Storage Service User
      # Guide . Permissions You must have the s3tables:PutTableMaintenanceConfiguration permission to use
      # this operation.

      def put_table_maintenance_configuration(
        name : String,
        namespace : String,
        table_bucket_arn : String,
        type : String,
        value : Types::TableMaintenanceConfigurationValue
      ) : Protocol::Request
        input = Types::PutTableMaintenanceConfigurationRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn, type: type, value: value)
        put_table_maintenance_configuration(input)
      end

      def put_table_maintenance_configuration(input : Types::PutTableMaintenanceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_MAINTENANCE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new table policy or replaces an existing table policy for a table. For more information,
      # see Adding a table policy in the Amazon Simple Storage Service User Guide . Permissions You must
      # have the s3tables:PutTablePolicy permission to use this operation.

      def put_table_policy(
        name : String,
        namespace : String,
        resource_policy : String,
        table_bucket_arn : String
      ) : Protocol::Request
        input = Types::PutTablePolicyRequest.new(name: name, namespace: namespace, resource_policy: resource_policy, table_bucket_arn: table_bucket_arn)
        put_table_policy(input)
      end

      def put_table_policy(input : Types::PutTablePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates the expiration configuration settings for records in a table, including the
      # status of the configuration. If you enable record expiration for a table, records expire and are
      # automatically removed from the table after the number of days that you specify. Permissions You must
      # have the s3tables:PutTableRecordExpirationConfiguration permission to use this operation.

      def put_table_record_expiration_configuration(
        table_arn : String,
        value : Types::TableRecordExpirationConfigurationValue
      ) : Protocol::Request
        input = Types::PutTableRecordExpirationConfigurationRequest.new(table_arn: table_arn, value: value)
        put_table_record_expiration_configuration(input)
      end

      def put_table_record_expiration_configuration(input : Types::PutTableRecordExpirationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_RECORD_EXPIRATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates the replication configuration for a specific table. This operation allows you to
      # define table-level replication independently of bucket-level replication, providing granular control
      # over which tables are replicated and where. Permissions You must have the
      # s3tables:PutTableReplication permission to use this operation. The IAM role specified in the
      # configuration must have permissions to read from the source table and write to all destination
      # tables. You must also have the following permissions: s3tables:GetTable permission on the source
      # table being replicated. s3tables:CreateTable permission for the destination.
      # s3tables:CreateNamespace permission for the destination. s3tables:GetTableMaintenanceConfig
      # permission for the source table. s3tables:PutTableMaintenanceConfig permission for the destination
      # table. You must have iam:PassRole permission with condition allowing roles to be passed to
      # replication.s3tables.amazonaws.com .

      def put_table_replication(
        configuration : Types::TableReplicationConfiguration,
        table_arn : String,
        version_token : String? = nil
      ) : Protocol::Request
        input = Types::PutTableReplicationRequest.new(configuration: configuration, table_arn: table_arn, version_token: version_token)
        put_table_replication(input)
      end

      def put_table_replication(input : Types::PutTableReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TABLE_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Renames a table or a namespace. For more information, see S3 Tables in the Amazon Simple Storage
      # Service User Guide . Permissions You must have the s3tables:RenameTable permission to use this
      # operation.

      def rename_table(
        name : String,
        namespace : String,
        table_bucket_arn : String,
        new_name : String? = nil,
        new_namespace_name : String? = nil,
        version_token : String? = nil
      ) : Protocol::Request
        input = Types::RenameTableRequest.new(name: name, namespace: namespace, table_bucket_arn: table_bucket_arn, new_name: new_name, new_namespace_name: new_namespace_name, version_token: version_token)
        rename_table(input)
      end

      def rename_table(input : Types::RenameTableRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RENAME_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies one or more user-defined tags to an Amazon S3 Tables resource or updates existing tags. Each
      # tag is a label consisting of a key and value pair. Tags can help you organize, track costs for, and
      # control access to your resources. You can add up to 50 tags for each S3 resource. For a list of S3
      # resources that support tagging, see Managing tags for Amazon S3 resources . Permissions For tables
      # and table buckets, you must have the s3tables:TagResource permission to use this operation.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified user-defined tags from an Amazon S3 Tables resource. You can pass one or more
      # tag keys. For a list of S3 resources that support tagging, see Managing tags for Amazon S3 resources
      # . Permissions For tables and table buckets, you must have the s3tables:UntagResource permission to
      # use this operation.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the metadata location for a table. The metadata location of a table must be an S3 URI that
      # begins with the table's warehouse location. The metadata location for an Apache Iceberg table must
      # end with .metadata.json , or if the metadata file is Gzip-compressed, .metadata.json.gz .
      # Permissions You must have the s3tables:UpdateTableMetadataLocation permission to use this operation.

      def update_table_metadata_location(
        metadata_location : String,
        name : String,
        namespace : String,
        table_bucket_arn : String,
        version_token : String
      ) : Protocol::Request
        input = Types::UpdateTableMetadataLocationRequest.new(metadata_location: metadata_location, name: name, namespace: namespace, table_bucket_arn: table_bucket_arn, version_token: version_token)
        update_table_metadata_location(input)
      end

      def update_table_metadata_location(input : Types::UpdateTableMetadataLocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TABLE_METADATA_LOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
