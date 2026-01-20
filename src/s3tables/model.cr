module Aws
  module S3Tables
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "s3tables"
      ENDPOINT_PREFIX = "s3tables"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://s3tables-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://s3tables-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://s3tables.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://s3tables.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_NAMESPACE = OperationModel.new(
        name: "CreateNamespace",
        http_method: "PUT",
        request_uri: "/namespaces/{tableBucketARN}"
      )

      CREATE_TABLE = OperationModel.new(
        name: "CreateTable",
        http_method: "PUT",
        request_uri: "/tables/{tableBucketARN}/{namespace}"
      )

      CREATE_TABLE_BUCKET = OperationModel.new(
        name: "CreateTableBucket",
        http_method: "PUT",
        request_uri: "/buckets"
      )

      DELETE_NAMESPACE = OperationModel.new(
        name: "DeleteNamespace",
        http_method: "DELETE",
        request_uri: "/namespaces/{tableBucketARN}/{namespace}"
      )

      DELETE_TABLE = OperationModel.new(
        name: "DeleteTable",
        http_method: "DELETE",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}"
      )

      DELETE_TABLE_BUCKET = OperationModel.new(
        name: "DeleteTableBucket",
        http_method: "DELETE",
        request_uri: "/buckets/{tableBucketARN}"
      )

      DELETE_TABLE_BUCKET_ENCRYPTION = OperationModel.new(
        name: "DeleteTableBucketEncryption",
        http_method: "DELETE",
        request_uri: "/buckets/{tableBucketARN}/encryption"
      )

      DELETE_TABLE_BUCKET_METRICS_CONFIGURATION = OperationModel.new(
        name: "DeleteTableBucketMetricsConfiguration",
        http_method: "DELETE",
        request_uri: "/buckets/{tableBucketARN}/metrics"
      )

      DELETE_TABLE_BUCKET_POLICY = OperationModel.new(
        name: "DeleteTableBucketPolicy",
        http_method: "DELETE",
        request_uri: "/buckets/{tableBucketARN}/policy"
      )

      DELETE_TABLE_BUCKET_REPLICATION = OperationModel.new(
        name: "DeleteTableBucketReplication",
        http_method: "DELETE",
        request_uri: "/table-bucket-replication"
      )

      DELETE_TABLE_POLICY = OperationModel.new(
        name: "DeleteTablePolicy",
        http_method: "DELETE",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/policy"
      )

      DELETE_TABLE_REPLICATION = OperationModel.new(
        name: "DeleteTableReplication",
        http_method: "DELETE",
        request_uri: "/table-replication"
      )

      GET_NAMESPACE = OperationModel.new(
        name: "GetNamespace",
        http_method: "GET",
        request_uri: "/namespaces/{tableBucketARN}/{namespace}"
      )

      GET_TABLE = OperationModel.new(
        name: "GetTable",
        http_method: "GET",
        request_uri: "/get-table"
      )

      GET_TABLE_BUCKET = OperationModel.new(
        name: "GetTableBucket",
        http_method: "GET",
        request_uri: "/buckets/{tableBucketARN}"
      )

      GET_TABLE_BUCKET_ENCRYPTION = OperationModel.new(
        name: "GetTableBucketEncryption",
        http_method: "GET",
        request_uri: "/buckets/{tableBucketARN}/encryption"
      )

      GET_TABLE_BUCKET_MAINTENANCE_CONFIGURATION = OperationModel.new(
        name: "GetTableBucketMaintenanceConfiguration",
        http_method: "GET",
        request_uri: "/buckets/{tableBucketARN}/maintenance"
      )

      GET_TABLE_BUCKET_METRICS_CONFIGURATION = OperationModel.new(
        name: "GetTableBucketMetricsConfiguration",
        http_method: "GET",
        request_uri: "/buckets/{tableBucketARN}/metrics"
      )

      GET_TABLE_BUCKET_POLICY = OperationModel.new(
        name: "GetTableBucketPolicy",
        http_method: "GET",
        request_uri: "/buckets/{tableBucketARN}/policy"
      )

      GET_TABLE_BUCKET_REPLICATION = OperationModel.new(
        name: "GetTableBucketReplication",
        http_method: "GET",
        request_uri: "/table-bucket-replication"
      )

      GET_TABLE_BUCKET_STORAGE_CLASS = OperationModel.new(
        name: "GetTableBucketStorageClass",
        http_method: "GET",
        request_uri: "/buckets/{tableBucketARN}/storage-class"
      )

      GET_TABLE_ENCRYPTION = OperationModel.new(
        name: "GetTableEncryption",
        http_method: "GET",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/encryption"
      )

      GET_TABLE_MAINTENANCE_CONFIGURATION = OperationModel.new(
        name: "GetTableMaintenanceConfiguration",
        http_method: "GET",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/maintenance"
      )

      GET_TABLE_MAINTENANCE_JOB_STATUS = OperationModel.new(
        name: "GetTableMaintenanceJobStatus",
        http_method: "GET",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/maintenance-job-status"
      )

      GET_TABLE_METADATA_LOCATION = OperationModel.new(
        name: "GetTableMetadataLocation",
        http_method: "GET",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/metadata-location"
      )

      GET_TABLE_POLICY = OperationModel.new(
        name: "GetTablePolicy",
        http_method: "GET",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/policy"
      )

      GET_TABLE_RECORD_EXPIRATION_CONFIGURATION = OperationModel.new(
        name: "GetTableRecordExpirationConfiguration",
        http_method: "GET",
        request_uri: "/table-record-expiration"
      )

      GET_TABLE_RECORD_EXPIRATION_JOB_STATUS = OperationModel.new(
        name: "GetTableRecordExpirationJobStatus",
        http_method: "GET",
        request_uri: "/table-record-expiration-job-status"
      )

      GET_TABLE_REPLICATION = OperationModel.new(
        name: "GetTableReplication",
        http_method: "GET",
        request_uri: "/table-replication"
      )

      GET_TABLE_REPLICATION_STATUS = OperationModel.new(
        name: "GetTableReplicationStatus",
        http_method: "GET",
        request_uri: "/replication-status"
      )

      GET_TABLE_STORAGE_CLASS = OperationModel.new(
        name: "GetTableStorageClass",
        http_method: "GET",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/storage-class"
      )

      LIST_NAMESPACES = OperationModel.new(
        name: "ListNamespaces",
        http_method: "GET",
        request_uri: "/namespaces/{tableBucketARN}"
      )

      LIST_TABLE_BUCKETS = OperationModel.new(
        name: "ListTableBuckets",
        http_method: "GET",
        request_uri: "/buckets"
      )

      LIST_TABLES = OperationModel.new(
        name: "ListTables",
        http_method: "GET",
        request_uri: "/tables/{tableBucketARN}"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tag/{resourceArn}"
      )

      PUT_TABLE_BUCKET_ENCRYPTION = OperationModel.new(
        name: "PutTableBucketEncryption",
        http_method: "PUT",
        request_uri: "/buckets/{tableBucketARN}/encryption"
      )

      PUT_TABLE_BUCKET_MAINTENANCE_CONFIGURATION = OperationModel.new(
        name: "PutTableBucketMaintenanceConfiguration",
        http_method: "PUT",
        request_uri: "/buckets/{tableBucketARN}/maintenance/{type}"
      )

      PUT_TABLE_BUCKET_METRICS_CONFIGURATION = OperationModel.new(
        name: "PutTableBucketMetricsConfiguration",
        http_method: "PUT",
        request_uri: "/buckets/{tableBucketARN}/metrics"
      )

      PUT_TABLE_BUCKET_POLICY = OperationModel.new(
        name: "PutTableBucketPolicy",
        http_method: "PUT",
        request_uri: "/buckets/{tableBucketARN}/policy"
      )

      PUT_TABLE_BUCKET_REPLICATION = OperationModel.new(
        name: "PutTableBucketReplication",
        http_method: "PUT",
        request_uri: "/table-bucket-replication"
      )

      PUT_TABLE_BUCKET_STORAGE_CLASS = OperationModel.new(
        name: "PutTableBucketStorageClass",
        http_method: "PUT",
        request_uri: "/buckets/{tableBucketARN}/storage-class"
      )

      PUT_TABLE_MAINTENANCE_CONFIGURATION = OperationModel.new(
        name: "PutTableMaintenanceConfiguration",
        http_method: "PUT",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/maintenance/{type}"
      )

      PUT_TABLE_POLICY = OperationModel.new(
        name: "PutTablePolicy",
        http_method: "PUT",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/policy"
      )

      PUT_TABLE_RECORD_EXPIRATION_CONFIGURATION = OperationModel.new(
        name: "PutTableRecordExpirationConfiguration",
        http_method: "PUT",
        request_uri: "/table-record-expiration"
      )

      PUT_TABLE_REPLICATION = OperationModel.new(
        name: "PutTableReplication",
        http_method: "PUT",
        request_uri: "/table-replication"
      )

      RENAME_TABLE = OperationModel.new(
        name: "RenameTable",
        http_method: "PUT",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/rename"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tag/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tag/{resourceArn}"
      )

      UPDATE_TABLE_METADATA_LOCATION = OperationModel.new(
        name: "UpdateTableMetadataLocation",
        http_method: "PUT",
        request_uri: "/tables/{tableBucketARN}/{namespace}/{name}/metadata-location"
      )
    end
  end
end
