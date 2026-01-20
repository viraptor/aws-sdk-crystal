require "json"
require "uri"
require "xml"
require "../../runtime"

module AwsSdk
  module S3
    module Protocol
      module RestXml
        CONTENT_TYPE = "application/xml"

        struct ShapeMember
          getter name : String
          getter shape : String
          getter location : String?
          getter location_name : String?
          getter flattened : Bool

          def initialize(
            @name : String,
            @shape : String,
            @location : String?,
            @location_name : String?,
            @flattened : Bool
          )
          end
        end

        struct Shape
          getter name : String
          getter type : String
          getter members : Array(ShapeMember)
          getter list_member : ShapeMember?
          getter flattened : Bool

          def initialize(
            @name : String,
            @type : String,
            @members : Array(ShapeMember),
            @list_member : ShapeMember?,
            @flattened : Bool
          )
          end
        end

        OPERATION_INPUT_SHAPES = {


          "AbortMultipartUpload" => "AbortMultipartUploadRequest",


          "CompleteMultipartUpload" => "CompleteMultipartUploadRequest",


          "CopyObject" => "CopyObjectRequest",


          "CreateBucket" => "CreateBucketRequest",


          "CreateBucketMetadataConfiguration" => "CreateBucketMetadataConfigurationRequest",


          "CreateBucketMetadataTableConfiguration" => "CreateBucketMetadataTableConfigurationRequest",


          "CreateMultipartUpload" => "CreateMultipartUploadRequest",


          "CreateSession" => "CreateSessionRequest",


          "DeleteBucket" => "DeleteBucketRequest",


          "DeleteBucketAnalyticsConfiguration" => "DeleteBucketAnalyticsConfigurationRequest",


          "DeleteBucketCors" => "DeleteBucketCorsRequest",


          "DeleteBucketEncryption" => "DeleteBucketEncryptionRequest",


          "DeleteBucketIntelligentTieringConfiguration" => "DeleteBucketIntelligentTieringConfigurationRequest",


          "DeleteBucketInventoryConfiguration" => "DeleteBucketInventoryConfigurationRequest",


          "DeleteBucketLifecycle" => "DeleteBucketLifecycleRequest",


          "DeleteBucketMetadataConfiguration" => "DeleteBucketMetadataConfigurationRequest",


          "DeleteBucketMetadataTableConfiguration" => "DeleteBucketMetadataTableConfigurationRequest",


          "DeleteBucketMetricsConfiguration" => "DeleteBucketMetricsConfigurationRequest",


          "DeleteBucketOwnershipControls" => "DeleteBucketOwnershipControlsRequest",


          "DeleteBucketPolicy" => "DeleteBucketPolicyRequest",


          "DeleteBucketReplication" => "DeleteBucketReplicationRequest",


          "DeleteBucketTagging" => "DeleteBucketTaggingRequest",


          "DeleteBucketWebsite" => "DeleteBucketWebsiteRequest",


          "DeleteObject" => "DeleteObjectRequest",


          "DeleteObjectTagging" => "DeleteObjectTaggingRequest",


          "DeleteObjects" => "DeleteObjectsRequest",


          "DeletePublicAccessBlock" => "DeletePublicAccessBlockRequest",


          "GetBucketAbac" => "GetBucketAbacRequest",


          "GetBucketAccelerateConfiguration" => "GetBucketAccelerateConfigurationRequest",


          "GetBucketAcl" => "GetBucketAclRequest",


          "GetBucketAnalyticsConfiguration" => "GetBucketAnalyticsConfigurationRequest",


          "GetBucketCors" => "GetBucketCorsRequest",


          "GetBucketEncryption" => "GetBucketEncryptionRequest",


          "GetBucketIntelligentTieringConfiguration" => "GetBucketIntelligentTieringConfigurationRequest",


          "GetBucketInventoryConfiguration" => "GetBucketInventoryConfigurationRequest",


          "GetBucketLifecycle" => "GetBucketLifecycleRequest",


          "GetBucketLifecycleConfiguration" => "GetBucketLifecycleConfigurationRequest",


          "GetBucketLocation" => "GetBucketLocationRequest",


          "GetBucketLogging" => "GetBucketLoggingRequest",


          "GetBucketMetadataConfiguration" => "GetBucketMetadataConfigurationRequest",


          "GetBucketMetadataTableConfiguration" => "GetBucketMetadataTableConfigurationRequest",


          "GetBucketMetricsConfiguration" => "GetBucketMetricsConfigurationRequest",


          "GetBucketNotification" => "GetBucketNotificationConfigurationRequest",


          "GetBucketNotificationConfiguration" => "GetBucketNotificationConfigurationRequest",


          "GetBucketOwnershipControls" => "GetBucketOwnershipControlsRequest",


          "GetBucketPolicy" => "GetBucketPolicyRequest",


          "GetBucketPolicyStatus" => "GetBucketPolicyStatusRequest",


          "GetBucketReplication" => "GetBucketReplicationRequest",


          "GetBucketRequestPayment" => "GetBucketRequestPaymentRequest",


          "GetBucketTagging" => "GetBucketTaggingRequest",


          "GetBucketVersioning" => "GetBucketVersioningRequest",


          "GetBucketWebsite" => "GetBucketWebsiteRequest",


          "GetObject" => "GetObjectRequest",


          "GetObjectAcl" => "GetObjectAclRequest",


          "GetObjectAttributes" => "GetObjectAttributesRequest",


          "GetObjectLegalHold" => "GetObjectLegalHoldRequest",


          "GetObjectLockConfiguration" => "GetObjectLockConfigurationRequest",


          "GetObjectRetention" => "GetObjectRetentionRequest",


          "GetObjectTagging" => "GetObjectTaggingRequest",


          "GetObjectTorrent" => "GetObjectTorrentRequest",


          "GetPublicAccessBlock" => "GetPublicAccessBlockRequest",


          "HeadBucket" => "HeadBucketRequest",


          "HeadObject" => "HeadObjectRequest",


          "ListBucketAnalyticsConfigurations" => "ListBucketAnalyticsConfigurationsRequest",


          "ListBucketIntelligentTieringConfigurations" => "ListBucketIntelligentTieringConfigurationsRequest",


          "ListBucketInventoryConfigurations" => "ListBucketInventoryConfigurationsRequest",


          "ListBucketMetricsConfigurations" => "ListBucketMetricsConfigurationsRequest",


          "ListBuckets" => "ListBucketsRequest",


          "ListDirectoryBuckets" => "ListDirectoryBucketsRequest",


          "ListMultipartUploads" => "ListMultipartUploadsRequest",


          "ListObjectVersions" => "ListObjectVersionsRequest",


          "ListObjects" => "ListObjectsRequest",


          "ListObjectsV2" => "ListObjectsV2Request",


          "ListParts" => "ListPartsRequest",


          "PutBucketAbac" => "PutBucketAbacRequest",


          "PutBucketAccelerateConfiguration" => "PutBucketAccelerateConfigurationRequest",


          "PutBucketAcl" => "PutBucketAclRequest",


          "PutBucketAnalyticsConfiguration" => "PutBucketAnalyticsConfigurationRequest",


          "PutBucketCors" => "PutBucketCorsRequest",


          "PutBucketEncryption" => "PutBucketEncryptionRequest",


          "PutBucketIntelligentTieringConfiguration" => "PutBucketIntelligentTieringConfigurationRequest",


          "PutBucketInventoryConfiguration" => "PutBucketInventoryConfigurationRequest",


          "PutBucketLifecycle" => "PutBucketLifecycleRequest",


          "PutBucketLifecycleConfiguration" => "PutBucketLifecycleConfigurationRequest",


          "PutBucketLogging" => "PutBucketLoggingRequest",


          "PutBucketMetricsConfiguration" => "PutBucketMetricsConfigurationRequest",


          "PutBucketNotification" => "PutBucketNotificationRequest",


          "PutBucketNotificationConfiguration" => "PutBucketNotificationConfigurationRequest",


          "PutBucketOwnershipControls" => "PutBucketOwnershipControlsRequest",


          "PutBucketPolicy" => "PutBucketPolicyRequest",


          "PutBucketReplication" => "PutBucketReplicationRequest",


          "PutBucketRequestPayment" => "PutBucketRequestPaymentRequest",


          "PutBucketTagging" => "PutBucketTaggingRequest",


          "PutBucketVersioning" => "PutBucketVersioningRequest",


          "PutBucketWebsite" => "PutBucketWebsiteRequest",


          "PutObject" => "PutObjectRequest",


          "PutObjectAcl" => "PutObjectAclRequest",


          "PutObjectLegalHold" => "PutObjectLegalHoldRequest",


          "PutObjectLockConfiguration" => "PutObjectLockConfigurationRequest",


          "PutObjectRetention" => "PutObjectRetentionRequest",


          "PutObjectTagging" => "PutObjectTaggingRequest",


          "PutPublicAccessBlock" => "PutPublicAccessBlockRequest",


          "RenameObject" => "RenameObjectRequest",


          "RestoreObject" => "RestoreObjectRequest",


          "SelectObjectContent" => "SelectObjectContentRequest",


          "UpdateBucketMetadataInventoryTableConfiguration" => "UpdateBucketMetadataInventoryTableConfigurationRequest",


          "UpdateBucketMetadataJournalTableConfiguration" => "UpdateBucketMetadataJournalTableConfigurationRequest",


          "UploadPart" => "UploadPartRequest",


          "UploadPartCopy" => "UploadPartCopyRequest",


          "WriteGetObjectResponse" => "WriteGetObjectResponseRequest",

        }

        OPERATION_OUTPUT_SHAPES = {


          "AbortMultipartUpload" => "AbortMultipartUploadOutput",


          "CompleteMultipartUpload" => "CompleteMultipartUploadOutput",


          "CopyObject" => "CopyObjectOutput",


          "CreateBucket" => "CreateBucketOutput",




          "CreateMultipartUpload" => "CreateMultipartUploadOutput",


          "CreateSession" => "CreateSessionOutput",

















          "DeleteObject" => "DeleteObjectOutput",


          "DeleteObjectTagging" => "DeleteObjectTaggingOutput",


          "DeleteObjects" => "DeleteObjectsOutput",



          "GetBucketAbac" => "GetBucketAbacOutput",


          "GetBucketAccelerateConfiguration" => "GetBucketAccelerateConfigurationOutput",


          "GetBucketAcl" => "GetBucketAclOutput",


          "GetBucketAnalyticsConfiguration" => "GetBucketAnalyticsConfigurationOutput",


          "GetBucketCors" => "GetBucketCorsOutput",


          "GetBucketEncryption" => "GetBucketEncryptionOutput",


          "GetBucketIntelligentTieringConfiguration" => "GetBucketIntelligentTieringConfigurationOutput",


          "GetBucketInventoryConfiguration" => "GetBucketInventoryConfigurationOutput",


          "GetBucketLifecycle" => "GetBucketLifecycleOutput",


          "GetBucketLifecycleConfiguration" => "GetBucketLifecycleConfigurationOutput",


          "GetBucketLocation" => "GetBucketLocationOutput",


          "GetBucketLogging" => "GetBucketLoggingOutput",


          "GetBucketMetadataConfiguration" => "GetBucketMetadataConfigurationOutput",


          "GetBucketMetadataTableConfiguration" => "GetBucketMetadataTableConfigurationOutput",


          "GetBucketMetricsConfiguration" => "GetBucketMetricsConfigurationOutput",


          "GetBucketNotification" => "NotificationConfigurationDeprecated",


          "GetBucketNotificationConfiguration" => "NotificationConfiguration",


          "GetBucketOwnershipControls" => "GetBucketOwnershipControlsOutput",


          "GetBucketPolicy" => "GetBucketPolicyOutput",


          "GetBucketPolicyStatus" => "GetBucketPolicyStatusOutput",


          "GetBucketReplication" => "GetBucketReplicationOutput",


          "GetBucketRequestPayment" => "GetBucketRequestPaymentOutput",


          "GetBucketTagging" => "GetBucketTaggingOutput",


          "GetBucketVersioning" => "GetBucketVersioningOutput",


          "GetBucketWebsite" => "GetBucketWebsiteOutput",


          "GetObject" => "GetObjectOutput",


          "GetObjectAcl" => "GetObjectAclOutput",


          "GetObjectAttributes" => "GetObjectAttributesOutput",


          "GetObjectLegalHold" => "GetObjectLegalHoldOutput",


          "GetObjectLockConfiguration" => "GetObjectLockConfigurationOutput",


          "GetObjectRetention" => "GetObjectRetentionOutput",


          "GetObjectTagging" => "GetObjectTaggingOutput",


          "GetObjectTorrent" => "GetObjectTorrentOutput",


          "GetPublicAccessBlock" => "GetPublicAccessBlockOutput",


          "HeadBucket" => "HeadBucketOutput",


          "HeadObject" => "HeadObjectOutput",


          "ListBucketAnalyticsConfigurations" => "ListBucketAnalyticsConfigurationsOutput",


          "ListBucketIntelligentTieringConfigurations" => "ListBucketIntelligentTieringConfigurationsOutput",


          "ListBucketInventoryConfigurations" => "ListBucketInventoryConfigurationsOutput",


          "ListBucketMetricsConfigurations" => "ListBucketMetricsConfigurationsOutput",


          "ListBuckets" => "ListBucketsOutput",


          "ListDirectoryBuckets" => "ListDirectoryBucketsOutput",


          "ListMultipartUploads" => "ListMultipartUploadsOutput",


          "ListObjectVersions" => "ListObjectVersionsOutput",


          "ListObjects" => "ListObjectsOutput",


          "ListObjectsV2" => "ListObjectsV2Output",


          "ListParts" => "ListPartsOutput",











          "PutBucketLifecycleConfiguration" => "PutBucketLifecycleConfigurationOutput",













          "PutObject" => "PutObjectOutput",


          "PutObjectAcl" => "PutObjectAclOutput",


          "PutObjectLegalHold" => "PutObjectLegalHoldOutput",


          "PutObjectLockConfiguration" => "PutObjectLockConfigurationOutput",


          "PutObjectRetention" => "PutObjectRetentionOutput",


          "PutObjectTagging" => "PutObjectTaggingOutput",



          "RenameObject" => "RenameObjectOutput",


          "RestoreObject" => "RestoreObjectOutput",


          "SelectObjectContent" => "SelectObjectContentOutput",




          "UploadPart" => "UploadPartOutput",


          "UploadPartCopy" => "UploadPartCopyOutput",


        }

        OPERATION_INPUT_ROOTS = {



          "AbortMultipartUpload" => "AbortMultipartUploadRequest",



          "CompleteMultipartUpload" => "CompleteMultipartUploadRequest",



          "CopyObject" => "CopyObjectRequest",



          "CreateBucket" => "CreateBucketRequest",



          "CreateBucketMetadataConfiguration" => "CreateBucketMetadataConfigurationRequest",



          "CreateBucketMetadataTableConfiguration" => "CreateBucketMetadataTableConfigurationRequest",



          "CreateMultipartUpload" => "CreateMultipartUploadRequest",



          "CreateSession" => "CreateSessionRequest",



          "DeleteBucket" => "DeleteBucketRequest",



          "DeleteBucketAnalyticsConfiguration" => "DeleteBucketAnalyticsConfigurationRequest",



          "DeleteBucketCors" => "DeleteBucketCorsRequest",



          "DeleteBucketEncryption" => "DeleteBucketEncryptionRequest",



          "DeleteBucketIntelligentTieringConfiguration" => "DeleteBucketIntelligentTieringConfigurationRequest",



          "DeleteBucketInventoryConfiguration" => "DeleteBucketInventoryConfigurationRequest",



          "DeleteBucketLifecycle" => "DeleteBucketLifecycleRequest",



          "DeleteBucketMetadataConfiguration" => "DeleteBucketMetadataConfigurationRequest",



          "DeleteBucketMetadataTableConfiguration" => "DeleteBucketMetadataTableConfigurationRequest",



          "DeleteBucketMetricsConfiguration" => "DeleteBucketMetricsConfigurationRequest",



          "DeleteBucketOwnershipControls" => "DeleteBucketOwnershipControlsRequest",



          "DeleteBucketPolicy" => "DeleteBucketPolicyRequest",



          "DeleteBucketReplication" => "DeleteBucketReplicationRequest",



          "DeleteBucketTagging" => "DeleteBucketTaggingRequest",



          "DeleteBucketWebsite" => "DeleteBucketWebsiteRequest",



          "DeleteObject" => "DeleteObjectRequest",



          "DeleteObjectTagging" => "DeleteObjectTaggingRequest",



          "DeleteObjects" => "DeleteObjectsRequest",



          "DeletePublicAccessBlock" => "DeletePublicAccessBlockRequest",



          "GetBucketAbac" => "GetBucketAbacRequest",



          "GetBucketAccelerateConfiguration" => "GetBucketAccelerateConfigurationRequest",



          "GetBucketAcl" => "GetBucketAclRequest",



          "GetBucketAnalyticsConfiguration" => "GetBucketAnalyticsConfigurationRequest",



          "GetBucketCors" => "GetBucketCorsRequest",



          "GetBucketEncryption" => "GetBucketEncryptionRequest",



          "GetBucketIntelligentTieringConfiguration" => "GetBucketIntelligentTieringConfigurationRequest",



          "GetBucketInventoryConfiguration" => "GetBucketInventoryConfigurationRequest",



          "GetBucketLifecycle" => "GetBucketLifecycleRequest",



          "GetBucketLifecycleConfiguration" => "GetBucketLifecycleConfigurationRequest",



          "GetBucketLocation" => "GetBucketLocationRequest",



          "GetBucketLogging" => "GetBucketLoggingRequest",



          "GetBucketMetadataConfiguration" => "GetBucketMetadataConfigurationRequest",



          "GetBucketMetadataTableConfiguration" => "GetBucketMetadataTableConfigurationRequest",



          "GetBucketMetricsConfiguration" => "GetBucketMetricsConfigurationRequest",



          "GetBucketNotification" => "GetBucketNotificationConfigurationRequest",



          "GetBucketNotificationConfiguration" => "GetBucketNotificationConfigurationRequest",



          "GetBucketOwnershipControls" => "GetBucketOwnershipControlsRequest",



          "GetBucketPolicy" => "GetBucketPolicyRequest",



          "GetBucketPolicyStatus" => "GetBucketPolicyStatusRequest",



          "GetBucketReplication" => "GetBucketReplicationRequest",



          "GetBucketRequestPayment" => "GetBucketRequestPaymentRequest",



          "GetBucketTagging" => "GetBucketTaggingRequest",



          "GetBucketVersioning" => "GetBucketVersioningRequest",



          "GetBucketWebsite" => "GetBucketWebsiteRequest",



          "GetObject" => "GetObjectRequest",



          "GetObjectAcl" => "GetObjectAclRequest",



          "GetObjectAttributes" => "GetObjectAttributesRequest",



          "GetObjectLegalHold" => "GetObjectLegalHoldRequest",



          "GetObjectLockConfiguration" => "GetObjectLockConfigurationRequest",



          "GetObjectRetention" => "GetObjectRetentionRequest",



          "GetObjectTagging" => "GetObjectTaggingRequest",



          "GetObjectTorrent" => "GetObjectTorrentRequest",



          "GetPublicAccessBlock" => "GetPublicAccessBlockRequest",



          "HeadBucket" => "HeadBucketRequest",



          "HeadObject" => "HeadObjectRequest",



          "ListBucketAnalyticsConfigurations" => "ListBucketAnalyticsConfigurationsRequest",



          "ListBucketIntelligentTieringConfigurations" => "ListBucketIntelligentTieringConfigurationsRequest",



          "ListBucketInventoryConfigurations" => "ListBucketInventoryConfigurationsRequest",



          "ListBucketMetricsConfigurations" => "ListBucketMetricsConfigurationsRequest",



          "ListBuckets" => "ListBucketsRequest",



          "ListDirectoryBuckets" => "ListDirectoryBucketsRequest",



          "ListMultipartUploads" => "ListMultipartUploadsRequest",



          "ListObjectVersions" => "ListObjectVersionsRequest",



          "ListObjects" => "ListObjectsRequest",



          "ListObjectsV2" => "ListObjectsV2Request",



          "ListParts" => "ListPartsRequest",



          "PutBucketAbac" => "PutBucketAbacRequest",



          "PutBucketAccelerateConfiguration" => "PutBucketAccelerateConfigurationRequest",



          "PutBucketAcl" => "PutBucketAclRequest",



          "PutBucketAnalyticsConfiguration" => "PutBucketAnalyticsConfigurationRequest",



          "PutBucketCors" => "PutBucketCorsRequest",



          "PutBucketEncryption" => "PutBucketEncryptionRequest",



          "PutBucketIntelligentTieringConfiguration" => "PutBucketIntelligentTieringConfigurationRequest",



          "PutBucketInventoryConfiguration" => "PutBucketInventoryConfigurationRequest",



          "PutBucketLifecycle" => "PutBucketLifecycleRequest",



          "PutBucketLifecycleConfiguration" => "PutBucketLifecycleConfigurationRequest",



          "PutBucketLogging" => "PutBucketLoggingRequest",



          "PutBucketMetricsConfiguration" => "PutBucketMetricsConfigurationRequest",



          "PutBucketNotification" => "PutBucketNotificationRequest",



          "PutBucketNotificationConfiguration" => "PutBucketNotificationConfigurationRequest",



          "PutBucketOwnershipControls" => "PutBucketOwnershipControlsRequest",



          "PutBucketPolicy" => "PutBucketPolicyRequest",



          "PutBucketReplication" => "PutBucketReplicationRequest",



          "PutBucketRequestPayment" => "PutBucketRequestPaymentRequest",



          "PutBucketTagging" => "PutBucketTaggingRequest",



          "PutBucketVersioning" => "PutBucketVersioningRequest",



          "PutBucketWebsite" => "PutBucketWebsiteRequest",



          "PutObject" => "PutObjectRequest",



          "PutObjectAcl" => "PutObjectAclRequest",



          "PutObjectLegalHold" => "PutObjectLegalHoldRequest",



          "PutObjectLockConfiguration" => "PutObjectLockConfigurationRequest",



          "PutObjectRetention" => "PutObjectRetentionRequest",



          "PutObjectTagging" => "PutObjectTaggingRequest",



          "PutPublicAccessBlock" => "PutPublicAccessBlockRequest",



          "RenameObject" => "RenameObjectRequest",



          "RestoreObject" => "RestoreObjectRequest",



          "SelectObjectContent" => "SelectObjectContentRequest",



          "UpdateBucketMetadataInventoryTableConfiguration" => "UpdateBucketMetadataInventoryTableConfigurationRequest",



          "UpdateBucketMetadataJournalTableConfiguration" => "UpdateBucketMetadataJournalTableConfigurationRequest",



          "UploadPart" => "UploadPartRequest",



          "UploadPartCopy" => "UploadPartCopyRequest",



          "WriteGetObjectResponse" => "WriteGetObjectResponseRequest",

        }

        OPERATION_INPUT_NAMESPACES = {




























































































































































































































































































































          "SelectObjectContent" => "http://s3.amazonaws.com/doc/2006-03-01/",
















        }

        SHAPES = {



          "AbacStatus" => Shape.new(
            "AbacStatus",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "BucketAbacStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AbortDate" => Shape.new(
            "AbortDate",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "AbortIncompleteMultipartUpload" => Shape.new(
            "AbortIncompleteMultipartUpload",
            "structure",
            [





              ShapeMember.new(
                "DaysAfterInitiation",
                "DaysAfterInitiation",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AbortMultipartUploadOutput" => Shape.new(
            "AbortMultipartUploadOutput",
            "structure",
            [





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AbortMultipartUploadRequest" => Shape.new(
            "AbortMultipartUploadRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "IfMatchInitiatedTime",
                "IfMatchInitiatedTime",
                "header",
                "x-amz-if-match-initiated-time",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "UploadId",
                "MultipartUploadId",
                "querystring",
                "uploadId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AbortRuleId" => Shape.new(
            "AbortRuleId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccelerateConfiguration" => Shape.new(
            "AccelerateConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "BucketAccelerateStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AcceptRanges" => Shape.new(
            "AcceptRanges",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccessControlPolicy" => Shape.new(
            "AccessControlPolicy",
            "structure",
            [





              ShapeMember.new(
                "Grants",
                "Grants",
                nil,
                "AccessControlList",
                false
              ),





              ShapeMember.new(
                "Owner",
                "Owner",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AccessControlTranslation" => Shape.new(
            "AccessControlTranslation",
            "structure",
            [





              ShapeMember.new(
                "Owner",
                "OwnerOverride",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AccessKeyIdValue" => Shape.new(
            "AccessKeyIdValue",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccessPointAlias" => Shape.new(
            "AccessPointAlias",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccessPointArn" => Shape.new(
            "AccessPointArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccountId" => Shape.new(
            "AccountId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AllowQuotedRecordDelimiter" => Shape.new(
            "AllowQuotedRecordDelimiter",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "AllowedHeader" => Shape.new(
            "AllowedHeader",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "AllowedHeaders" => Shape.new(
            "AllowedHeaders",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "AllowedHeader",
              nil,
              nil,
              false
            ),
            true
          ),





          "AllowedMethod" => Shape.new(
            "AllowedMethod",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "AllowedMethods" => Shape.new(
            "AllowedMethods",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "AllowedMethod",
              nil,
              nil,
              false
            ),
            true
          ),





          "AllowedOrigin" => Shape.new(
            "AllowedOrigin",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "AllowedOrigins" => Shape.new(
            "AllowedOrigins",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "AllowedOrigin",
              nil,
              nil,
              false
            ),
            true
          ),





          "AnalyticsAndOperator" => Shape.new(
            "AnalyticsAndOperator",
            "structure",
            [





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagSet",
                nil,
                "Tag",
                true
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AnalyticsConfiguration" => Shape.new(
            "AnalyticsConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Filter",
                "AnalyticsFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "AnalyticsId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClassAnalysis",
                "StorageClassAnalysis",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "AnalyticsConfigurationList" => Shape.new(
            "AnalyticsConfigurationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "AnalyticsConfiguration",
              nil,
              nil,
              false
            ),
            true
          ),





          "AnalyticsExportDestination" => Shape.new(
            "AnalyticsExportDestination",
            "structure",
            [





              ShapeMember.new(
                "S3BucketDestination",
                "AnalyticsS3BucketDestination",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AnalyticsFilter" => Shape.new(
            "AnalyticsFilter",
            "structure",
            [





              ShapeMember.new(
                "And",
                "AnalyticsAndOperator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tag",
                "Tag",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AnalyticsId" => Shape.new(
            "AnalyticsId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AnalyticsS3BucketDestination" => Shape.new(
            "AnalyticsS3BucketDestination",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketAccountId",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Format",
                "AnalyticsS3ExportFileFormat",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AnalyticsS3ExportFileFormat" => Shape.new(
            "AnalyticsS3ExportFileFormat",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ArchiveStatus" => Shape.new(
            "ArchiveStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BlockedEncryptionTypes" => Shape.new(
            "BlockedEncryptionTypes",
            "structure",
            [





              ShapeMember.new(
                "EncryptionType",
                "EncryptionTypeList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Body" => Shape.new(
            "Body",
            "blob",
            [] of ShapeMember,
            nil,
            false
          ),




          "Bucket" => Shape.new(
            "Bucket",
            "structure",
            [





              ShapeMember.new(
                "BucketArn",
                "S3RegionalOrS3ExpressBucketArnString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketRegion",
                "BucketRegion",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreationDate",
                "CreationDate",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "BucketName",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "BucketAbacStatus" => Shape.new(
            "BucketAbacStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketAccelerateStatus" => Shape.new(
            "BucketAccelerateStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketAlreadyExists" => Shape.new(
            "BucketAlreadyExists",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "BucketAlreadyOwnedByYou" => Shape.new(
            "BucketAlreadyOwnedByYou",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "BucketCannedACL" => Shape.new(
            "BucketCannedACL",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketInfo" => Shape.new(
            "BucketInfo",
            "structure",
            [





              ShapeMember.new(
                "DataRedundancy",
                "DataRedundancy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Type",
                "BucketType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "BucketKeyEnabled" => Shape.new(
            "BucketKeyEnabled",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketLifecycleConfiguration" => Shape.new(
            "BucketLifecycleConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Rules",
                "LifecycleRules",
                nil,
                "Rule",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "BucketLocationConstraint" => Shape.new(
            "BucketLocationConstraint",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketLocationName" => Shape.new(
            "BucketLocationName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketLoggingStatus" => Shape.new(
            "BucketLoggingStatus",
            "structure",
            [





              ShapeMember.new(
                "LoggingEnabled",
                "LoggingEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "BucketLogsPermission" => Shape.new(
            "BucketLogsPermission",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketName" => Shape.new(
            "BucketName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketRegion" => Shape.new(
            "BucketRegion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketType" => Shape.new(
            "BucketType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketVersioningStatus" => Shape.new(
            "BucketVersioningStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "Buckets" => Shape.new(
            "Buckets",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Bucket",
              nil,
              "Bucket",
              false
            ),
            false
          ),





          "BypassGovernanceRetention" => Shape.new(
            "BypassGovernanceRetention",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "BytesProcessed" => Shape.new(
            "BytesProcessed",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "BytesReturned" => Shape.new(
            "BytesReturned",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "BytesScanned" => Shape.new(
            "BytesScanned",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "CORSConfiguration" => Shape.new(
            "CORSConfiguration",
            "structure",
            [





              ShapeMember.new(
                "CORSRules",
                "CORSRules",
                nil,
                "CORSRule",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CORSRule" => Shape.new(
            "CORSRule",
            "structure",
            [





              ShapeMember.new(
                "AllowedHeaders",
                "AllowedHeaders",
                nil,
                "AllowedHeader",
                false
              ),





              ShapeMember.new(
                "AllowedMethods",
                "AllowedMethods",
                nil,
                "AllowedMethod",
                false
              ),





              ShapeMember.new(
                "AllowedOrigins",
                "AllowedOrigins",
                nil,
                "AllowedOrigin",
                false
              ),





              ShapeMember.new(
                "ExposeHeaders",
                "ExposeHeaders",
                nil,
                "ExposeHeader",
                false
              ),





              ShapeMember.new(
                "ID",
                "ID",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxAgeSeconds",
                "MaxAgeSeconds",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "CORSRules" => Shape.new(
            "CORSRules",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CORSRule",
              nil,
              nil,
              false
            ),
            true
          ),





          "CSVInput" => Shape.new(
            "CSVInput",
            "structure",
            [





              ShapeMember.new(
                "AllowQuotedRecordDelimiter",
                "AllowQuotedRecordDelimiter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Comments",
                "Comments",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FieldDelimiter",
                "FieldDelimiter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FileHeaderInfo",
                "FileHeaderInfo",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QuoteCharacter",
                "QuoteCharacter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QuoteEscapeCharacter",
                "QuoteEscapeCharacter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RecordDelimiter",
                "RecordDelimiter",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CSVOutput" => Shape.new(
            "CSVOutput",
            "structure",
            [





              ShapeMember.new(
                "FieldDelimiter",
                "FieldDelimiter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QuoteCharacter",
                "QuoteCharacter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QuoteEscapeCharacter",
                "QuoteEscapeCharacter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QuoteFields",
                "QuoteFields",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RecordDelimiter",
                "RecordDelimiter",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CacheControl" => Shape.new(
            "CacheControl",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Checksum" => Shape.new(
            "Checksum",
            "structure",
            [





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ChecksumAlgorithm" => Shape.new(
            "ChecksumAlgorithm",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ChecksumAlgorithmList" => Shape.new(
            "ChecksumAlgorithmList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ChecksumAlgorithm",
              nil,
              nil,
              false
            ),
            true
          ),





          "ChecksumCRC32" => Shape.new(
            "ChecksumCRC32",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ChecksumCRC32C" => Shape.new(
            "ChecksumCRC32C",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ChecksumCRC64NVME" => Shape.new(
            "ChecksumCRC64NVME",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ChecksumMode" => Shape.new(
            "ChecksumMode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ChecksumSHA1" => Shape.new(
            "ChecksumSHA1",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ChecksumSHA256" => Shape.new(
            "ChecksumSHA256",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ChecksumType" => Shape.new(
            "ChecksumType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ClientToken" => Shape.new(
            "ClientToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CloudFunction" => Shape.new(
            "CloudFunction",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CloudFunctionConfiguration" => Shape.new(
            "CloudFunctionConfiguration",
            "structure",
            [





              ShapeMember.new(
                "CloudFunction",
                "CloudFunction",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Event",
                "Event",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Events",
                "EventList",
                nil,
                "Event",
                false
              ),





              ShapeMember.new(
                "Id",
                "NotificationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "InvocationRole",
                "CloudFunctionInvocationRole",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CloudFunctionInvocationRole" => Shape.new(
            "CloudFunctionInvocationRole",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Code" => Shape.new(
            "Code",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Comments" => Shape.new(
            "Comments",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CommonPrefix" => Shape.new(
            "CommonPrefix",
            "structure",
            [





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "CommonPrefixList" => Shape.new(
            "CommonPrefixList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CommonPrefix",
              nil,
              nil,
              false
            ),
            true
          ),





          "CompleteMultipartUploadOutput" => Shape.new(
            "CompleteMultipartUploadOutput",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Expiration",
                "Expiration",
                "header",
                "x-amz-expiration",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "Location",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CompleteMultipartUploadRequest" => Shape.new(
            "CompleteMultipartUploadRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                "header",
                "x-amz-checksum-crc32",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                "header",
                "x-amz-checksum-crc32c",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                "header",
                "x-amz-checksum-crc64nvme",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                "header",
                "x-amz-checksum-sha1",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                "header",
                "x-amz-checksum-sha256",
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                "header",
                "x-amz-checksum-type",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "IfMatch",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "IfNoneMatch",
                "IfNoneMatch",
                "header",
                "If-None-Match",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "MpuObjectSize",
                "MpuObjectSize",
                "header",
                "x-amz-mp-object-size",
                false
              ),





              ShapeMember.new(
                "MultipartUpload",
                "CompletedMultipartUpload",
                nil,
                "CompleteMultipartUpload",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "UploadId",
                "MultipartUploadId",
                "querystring",
                "uploadId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CompletedMultipartUpload" => Shape.new(
            "CompletedMultipartUpload",
            "structure",
            [





              ShapeMember.new(
                "Parts",
                "CompletedPartList",
                nil,
                "Part",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CompletedPart" => Shape.new(
            "CompletedPart",
            "structure",
            [





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PartNumber",
                "PartNumber",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "CompletedPartList" => Shape.new(
            "CompletedPartList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "CompletedPart",
              nil,
              nil,
              false
            ),
            true
          ),





          "CompressionType" => Shape.new(
            "CompressionType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Condition" => Shape.new(
            "Condition",
            "structure",
            [





              ShapeMember.new(
                "HttpErrorCodeReturnedEquals",
                "HttpErrorCodeReturnedEquals",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KeyPrefixEquals",
                "KeyPrefixEquals",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ConfirmRemoveSelfBucketAccess" => Shape.new(
            "ConfirmRemoveSelfBucketAccess",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContentDisposition" => Shape.new(
            "ContentDisposition",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContentEncoding" => Shape.new(
            "ContentEncoding",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContentLanguage" => Shape.new(
            "ContentLanguage",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContentLength" => Shape.new(
            "ContentLength",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContentMD5" => Shape.new(
            "ContentMD5",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContentRange" => Shape.new(
            "ContentRange",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContentType" => Shape.new(
            "ContentType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContinuationEvent" => Shape.new(
            "ContinuationEvent",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "CopyObjectOutput" => Shape.new(
            "CopyObjectOutput",
            "structure",
            [





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "CopyObjectResult",
                "CopyObjectResult",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CopySourceVersionId",
                "CopySourceVersionId",
                "header",
                "x-amz-copy-source-version-id",
                false
              ),





              ShapeMember.new(
                "Expiration",
                "Expiration",
                "header",
                "x-amz-expiration",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSEncryptionContext",
                "SSEKMSEncryptionContext",
                "header",
                "x-amz-server-side-encryption-context",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CopyObjectRequest" => Shape.new(
            "CopyObjectRequest",
            "structure",
            [





              ShapeMember.new(
                "ACL",
                "ObjectCannedACL",
                "header",
                "x-amz-acl",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "CacheControl",
                "CacheControl",
                "header",
                "Cache-Control",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentDisposition",
                "ContentDisposition",
                "header",
                "Content-Disposition",
                false
              ),





              ShapeMember.new(
                "ContentEncoding",
                "ContentEncoding",
                "header",
                "Content-Encoding",
                false
              ),





              ShapeMember.new(
                "ContentLanguage",
                "ContentLanguage",
                "header",
                "Content-Language",
                false
              ),





              ShapeMember.new(
                "ContentType",
                "ContentType",
                "header",
                "Content-Type",
                false
              ),





              ShapeMember.new(
                "CopySource",
                "CopySource",
                "header",
                "x-amz-copy-source",
                false
              ),





              ShapeMember.new(
                "CopySourceIfMatch",
                "CopySourceIfMatch",
                "header",
                "x-amz-copy-source-if-match",
                false
              ),





              ShapeMember.new(
                "CopySourceIfModifiedSince",
                "CopySourceIfModifiedSince",
                "header",
                "x-amz-copy-source-if-modified-since",
                false
              ),





              ShapeMember.new(
                "CopySourceIfNoneMatch",
                "CopySourceIfNoneMatch",
                "header",
                "x-amz-copy-source-if-none-match",
                false
              ),





              ShapeMember.new(
                "CopySourceIfUnmodifiedSince",
                "CopySourceIfUnmodifiedSince",
                "header",
                "x-amz-copy-source-if-unmodified-since",
                false
              ),





              ShapeMember.new(
                "CopySourceSSECustomerAlgorithm",
                "CopySourceSSECustomerAlgorithm",
                "header",
                "x-amz-copy-source-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "CopySourceSSECustomerKey",
                "CopySourceSSECustomerKey",
                "header",
                "x-amz-copy-source-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "CopySourceSSECustomerKeyMD5",
                "CopySourceSSECustomerKeyMD5",
                "header",
                "x-amz-copy-source-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "ExpectedSourceBucketOwner",
                "AccountId",
                "header",
                "x-amz-source-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Expires",
                "Expires",
                "header",
                "Expires",
                false
              ),





              ShapeMember.new(
                "GrantFullControl",
                "GrantFullControl",
                "header",
                "x-amz-grant-full-control",
                false
              ),





              ShapeMember.new(
                "GrantRead",
                "GrantRead",
                "header",
                "x-amz-grant-read",
                false
              ),





              ShapeMember.new(
                "GrantReadACP",
                "GrantReadACP",
                "header",
                "x-amz-grant-read-acp",
                false
              ),





              ShapeMember.new(
                "GrantWriteACP",
                "GrantWriteACP",
                "header",
                "x-amz-grant-write-acp",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "IfMatch",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "IfNoneMatch",
                "IfNoneMatch",
                "header",
                "If-None-Match",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "Metadata",
                "Metadata",
                "headers",
                "x-amz-meta-",
                false
              ),





              ShapeMember.new(
                "MetadataDirective",
                "MetadataDirective",
                "header",
                "x-amz-metadata-directive",
                false
              ),





              ShapeMember.new(
                "ObjectLockLegalHoldStatus",
                "ObjectLockLegalHoldStatus",
                "header",
                "x-amz-object-lock-legal-hold",
                false
              ),





              ShapeMember.new(
                "ObjectLockMode",
                "ObjectLockMode",
                "header",
                "x-amz-object-lock-mode",
                false
              ),





              ShapeMember.new(
                "ObjectLockRetainUntilDate",
                "ObjectLockRetainUntilDate",
                "header",
                "x-amz-object-lock-retain-until-date",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSEncryptionContext",
                "SSEKMSEncryptionContext",
                "header",
                "x-amz-server-side-encryption-context",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                "header",
                "x-amz-storage-class",
                false
              ),





              ShapeMember.new(
                "Tagging",
                "TaggingHeader",
                "header",
                "x-amz-tagging",
                false
              ),





              ShapeMember.new(
                "TaggingDirective",
                "TaggingDirective",
                "header",
                "x-amz-tagging-directive",
                false
              ),





              ShapeMember.new(
                "WebsiteRedirectLocation",
                "WebsiteRedirectLocation",
                "header",
                "x-amz-website-redirect-location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CopyObjectResult" => Shape.new(
            "CopyObjectResult",
            "structure",
            [





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CopyPartResult" => Shape.new(
            "CopyPartResult",
            "structure",
            [





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CopySource" => Shape.new(
            "CopySource",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CopySourceIfMatch" => Shape.new(
            "CopySourceIfMatch",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CopySourceIfModifiedSince" => Shape.new(
            "CopySourceIfModifiedSince",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "CopySourceIfNoneMatch" => Shape.new(
            "CopySourceIfNoneMatch",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CopySourceIfUnmodifiedSince" => Shape.new(
            "CopySourceIfUnmodifiedSince",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "CopySourceRange" => Shape.new(
            "CopySourceRange",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CopySourceSSECustomerAlgorithm" => Shape.new(
            "CopySourceSSECustomerAlgorithm",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CopySourceSSECustomerKey" => Shape.new(
            "CopySourceSSECustomerKey",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CopySourceSSECustomerKeyMD5" => Shape.new(
            "CopySourceSSECustomerKeyMD5",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CopySourceVersionId" => Shape.new(
            "CopySourceVersionId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CreateBucketConfiguration" => Shape.new(
            "CreateBucketConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketInfo",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "LocationInfo",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LocationConstraint",
                "BucketLocationConstraint",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateBucketMetadataConfigurationRequest" => Shape.new(
            "CreateBucketMetadataConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "MetadataConfiguration",
                "MetadataConfiguration",
                nil,
                "MetadataConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateBucketMetadataTableConfigurationRequest" => Shape.new(
            "CreateBucketMetadataTableConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "MetadataTableConfiguration",
                "MetadataTableConfiguration",
                nil,
                "MetadataTableConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateBucketOutput" => Shape.new(
            "CreateBucketOutput",
            "structure",
            [





              ShapeMember.new(
                "BucketArn",
                "S3RegionalOrS3ExpressBucketArnString",
                "header",
                "x-amz-bucket-arn",
                false
              ),





              ShapeMember.new(
                "Location",
                "Location",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateBucketRequest" => Shape.new(
            "CreateBucketRequest",
            "structure",
            [





              ShapeMember.new(
                "ACL",
                "BucketCannedACL",
                "header",
                "x-amz-acl",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "CreateBucketConfiguration",
                "CreateBucketConfiguration",
                nil,
                "CreateBucketConfiguration",
                false
              ),





              ShapeMember.new(
                "GrantFullControl",
                "GrantFullControl",
                "header",
                "x-amz-grant-full-control",
                false
              ),





              ShapeMember.new(
                "GrantRead",
                "GrantRead",
                "header",
                "x-amz-grant-read",
                false
              ),





              ShapeMember.new(
                "GrantReadACP",
                "GrantReadACP",
                "header",
                "x-amz-grant-read-acp",
                false
              ),





              ShapeMember.new(
                "GrantWrite",
                "GrantWrite",
                "header",
                "x-amz-grant-write",
                false
              ),





              ShapeMember.new(
                "GrantWriteACP",
                "GrantWriteACP",
                "header",
                "x-amz-grant-write-acp",
                false
              ),





              ShapeMember.new(
                "ObjectLockEnabledForBucket",
                "ObjectLockEnabledForBucket",
                "header",
                "x-amz-bucket-object-lock-enabled",
                false
              ),





              ShapeMember.new(
                "ObjectOwnership",
                "ObjectOwnership",
                "header",
                "x-amz-object-ownership",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateMultipartUploadOutput" => Shape.new(
            "CreateMultipartUploadOutput",
            "structure",
            [





              ShapeMember.new(
                "AbortDate",
                "AbortDate",
                "header",
                "x-amz-abort-date",
                false
              ),





              ShapeMember.new(
                "AbortRuleId",
                "AbortRuleId",
                "header",
                "x-amz-abort-rule-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                "Bucket",
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                "header",
                "x-amz-checksum-type",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSEncryptionContext",
                "SSEKMSEncryptionContext",
                "header",
                "x-amz-server-side-encryption-context",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "UploadId",
                "MultipartUploadId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateMultipartUploadRequest" => Shape.new(
            "CreateMultipartUploadRequest",
            "structure",
            [





              ShapeMember.new(
                "ACL",
                "ObjectCannedACL",
                "header",
                "x-amz-acl",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "CacheControl",
                "CacheControl",
                "header",
                "Cache-Control",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                "header",
                "x-amz-checksum-type",
                false
              ),





              ShapeMember.new(
                "ContentDisposition",
                "ContentDisposition",
                "header",
                "Content-Disposition",
                false
              ),





              ShapeMember.new(
                "ContentEncoding",
                "ContentEncoding",
                "header",
                "Content-Encoding",
                false
              ),





              ShapeMember.new(
                "ContentLanguage",
                "ContentLanguage",
                "header",
                "Content-Language",
                false
              ),





              ShapeMember.new(
                "ContentType",
                "ContentType",
                "header",
                "Content-Type",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Expires",
                "Expires",
                "header",
                "Expires",
                false
              ),





              ShapeMember.new(
                "GrantFullControl",
                "GrantFullControl",
                "header",
                "x-amz-grant-full-control",
                false
              ),





              ShapeMember.new(
                "GrantRead",
                "GrantRead",
                "header",
                "x-amz-grant-read",
                false
              ),





              ShapeMember.new(
                "GrantReadACP",
                "GrantReadACP",
                "header",
                "x-amz-grant-read-acp",
                false
              ),





              ShapeMember.new(
                "GrantWriteACP",
                "GrantWriteACP",
                "header",
                "x-amz-grant-write-acp",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "Metadata",
                "Metadata",
                "headers",
                "x-amz-meta-",
                false
              ),





              ShapeMember.new(
                "ObjectLockLegalHoldStatus",
                "ObjectLockLegalHoldStatus",
                "header",
                "x-amz-object-lock-legal-hold",
                false
              ),





              ShapeMember.new(
                "ObjectLockMode",
                "ObjectLockMode",
                "header",
                "x-amz-object-lock-mode",
                false
              ),





              ShapeMember.new(
                "ObjectLockRetainUntilDate",
                "ObjectLockRetainUntilDate",
                "header",
                "x-amz-object-lock-retain-until-date",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSEncryptionContext",
                "SSEKMSEncryptionContext",
                "header",
                "x-amz-server-side-encryption-context",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                "header",
                "x-amz-storage-class",
                false
              ),





              ShapeMember.new(
                "Tagging",
                "TaggingHeader",
                "header",
                "x-amz-tagging",
                false
              ),





              ShapeMember.new(
                "WebsiteRedirectLocation",
                "WebsiteRedirectLocation",
                "header",
                "x-amz-website-redirect-location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateSessionOutput" => Shape.new(
            "CreateSessionOutput",
            "structure",
            [





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "Credentials",
                "SessionCredentials",
                nil,
                "Credentials",
                false
              ),





              ShapeMember.new(
                "SSEKMSEncryptionContext",
                "SSEKMSEncryptionContext",
                "header",
                "x-amz-server-side-encryption-context",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateSessionRequest" => Shape.new(
            "CreateSessionRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "SSEKMSEncryptionContext",
                "SSEKMSEncryptionContext",
                "header",
                "x-amz-server-side-encryption-context",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "SessionMode",
                "SessionMode",
                "header",
                "x-amz-create-session-mode",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreationDate" => Shape.new(
            "CreationDate",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "DataRedundancy" => Shape.new(
            "DataRedundancy",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Date" => Shape.new(
            "Date",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "Days" => Shape.new(
            "Days",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "DaysAfterInitiation" => Shape.new(
            "DaysAfterInitiation",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "DefaultRetention" => Shape.new(
            "DefaultRetention",
            "structure",
            [





              ShapeMember.new(
                "Days",
                "Days",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Mode",
                "ObjectLockRetentionMode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Years",
                "Years",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Delete" => Shape.new(
            "Delete",
            "structure",
            [





              ShapeMember.new(
                "Objects",
                "ObjectIdentifierList",
                nil,
                "Object",
                false
              ),





              ShapeMember.new(
                "Quiet",
                "Quiet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketAnalyticsConfigurationRequest" => Shape.new(
            "DeleteBucketAnalyticsConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "AnalyticsId",
                "querystring",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketCorsRequest" => Shape.new(
            "DeleteBucketCorsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketEncryptionRequest" => Shape.new(
            "DeleteBucketEncryptionRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketIntelligentTieringConfigurationRequest" => Shape.new(
            "DeleteBucketIntelligentTieringConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "IntelligentTieringId",
                "querystring",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketInventoryConfigurationRequest" => Shape.new(
            "DeleteBucketInventoryConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "InventoryId",
                "querystring",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketLifecycleRequest" => Shape.new(
            "DeleteBucketLifecycleRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketMetadataConfigurationRequest" => Shape.new(
            "DeleteBucketMetadataConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketMetadataTableConfigurationRequest" => Shape.new(
            "DeleteBucketMetadataTableConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketMetricsConfigurationRequest" => Shape.new(
            "DeleteBucketMetricsConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "MetricsId",
                "querystring",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketOwnershipControlsRequest" => Shape.new(
            "DeleteBucketOwnershipControlsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketPolicyRequest" => Shape.new(
            "DeleteBucketPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketReplicationRequest" => Shape.new(
            "DeleteBucketReplicationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketRequest" => Shape.new(
            "DeleteBucketRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketTaggingRequest" => Shape.new(
            "DeleteBucketTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketWebsiteRequest" => Shape.new(
            "DeleteBucketWebsiteRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteMarker" => Shape.new(
            "DeleteMarker",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "DeleteMarkerEntry" => Shape.new(
            "DeleteMarkerEntry",
            "structure",
            [





              ShapeMember.new(
                "IsLatest",
                "IsLatest",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Owner",
                "Owner",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteMarkerReplication" => Shape.new(
            "DeleteMarkerReplication",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "DeleteMarkerReplicationStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteMarkerReplicationStatus" => Shape.new(
            "DeleteMarkerReplicationStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "DeleteMarkerVersionId" => Shape.new(
            "DeleteMarkerVersionId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "DeleteMarkers" => Shape.new(
            "DeleteMarkers",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DeleteMarkerEntry",
              nil,
              nil,
              false
            ),
            true
          ),





          "DeleteObjectOutput" => Shape.new(
            "DeleteObjectOutput",
            "structure",
            [





              ShapeMember.new(
                "DeleteMarker",
                "DeleteMarker",
                "header",
                "x-amz-delete-marker",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteObjectRequest" => Shape.new(
            "DeleteObjectRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "BypassGovernanceRetention",
                "BypassGovernanceRetention",
                "header",
                "x-amz-bypass-governance-retention",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "IfMatch",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "IfMatchLastModifiedTime",
                "IfMatchLastModifiedTime",
                "header",
                "x-amz-if-match-last-modified-time",
                false
              ),





              ShapeMember.new(
                "IfMatchSize",
                "IfMatchSize",
                "header",
                "x-amz-if-match-size",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "MFA",
                "MFA",
                "header",
                "x-amz-mfa",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteObjectTaggingOutput" => Shape.new(
            "DeleteObjectTaggingOutput",
            "structure",
            [





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteObjectTaggingRequest" => Shape.new(
            "DeleteObjectTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteObjectsOutput" => Shape.new(
            "DeleteObjectsOutput",
            "structure",
            [





              ShapeMember.new(
                "Deleted",
                "DeletedObjects",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Errors",
                "Errors",
                nil,
                "Error",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteObjectsRequest" => Shape.new(
            "DeleteObjectsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "BypassGovernanceRetention",
                "BypassGovernanceRetention",
                "header",
                "x-amz-bypass-governance-retention",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "Delete",
                "Delete",
                nil,
                "Delete",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "MFA",
                "MFA",
                "header",
                "x-amz-mfa",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeletePublicAccessBlockRequest" => Shape.new(
            "DeletePublicAccessBlockRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeletedObject" => Shape.new(
            "DeletedObject",
            "structure",
            [





              ShapeMember.new(
                "DeleteMarker",
                "DeleteMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DeleteMarkerVersionId",
                "DeleteMarkerVersionId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "DeletedObjects" => Shape.new(
            "DeletedObjects",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "DeletedObject",
              nil,
              nil,
              false
            ),
            true
          ),





          "Delimiter" => Shape.new(
            "Delimiter",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Description" => Shape.new(
            "Description",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Destination" => Shape.new(
            "Destination",
            "structure",
            [





              ShapeMember.new(
                "AccessControlTranslation",
                "AccessControlTranslation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Account",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncryptionConfiguration",
                "EncryptionConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Metrics",
                "Metrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ReplicationTime",
                "ReplicationTime",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DestinationResult" => Shape.new(
            "DestinationResult",
            "structure",
            [





              ShapeMember.new(
                "TableBucketArn",
                "S3TablesBucketArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableBucketType",
                "S3TablesBucketType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableNamespace",
                "S3TablesNamespace",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DirectoryBucketToken" => Shape.new(
            "DirectoryBucketToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "DisplayName" => Shape.new(
            "DisplayName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ETag" => Shape.new(
            "ETag",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "EmailAddress" => Shape.new(
            "EmailAddress",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "EnableRequestProgress" => Shape.new(
            "EnableRequestProgress",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "EncodingType" => Shape.new(
            "EncodingType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Encryption" => Shape.new(
            "Encryption",
            "structure",
            [





              ShapeMember.new(
                "EncryptionType",
                "ServerSideEncryption",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KMSContext",
                "KMSContext",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KMSKeyId",
                "SSEKMSKeyId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "EncryptionConfiguration" => Shape.new(
            "EncryptionConfiguration",
            "structure",
            [





              ShapeMember.new(
                "ReplicaKmsKeyID",
                "ReplicaKmsKeyID",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "EncryptionType" => Shape.new(
            "EncryptionType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "EncryptionTypeList" => Shape.new(
            "EncryptionTypeList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "EncryptionType",
              nil,
              "EncryptionType",
              false
            ),
            true
          ),





          "EncryptionTypeMismatch" => Shape.new(
            "EncryptionTypeMismatch",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "End" => Shape.new(
            "End",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "EndEvent" => Shape.new(
            "EndEvent",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "Error" => Shape.new(
            "Error",
            "structure",
            [





              ShapeMember.new(
                "Code",
                "Code",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Message",
                "Message",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ErrorCode" => Shape.new(
            "ErrorCode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ErrorDetails" => Shape.new(
            "ErrorDetails",
            "structure",
            [





              ShapeMember.new(
                "ErrorCode",
                "ErrorCode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ErrorMessage",
                "ErrorMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ErrorDocument" => Shape.new(
            "ErrorDocument",
            "structure",
            [





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ErrorMessage" => Shape.new(
            "ErrorMessage",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "Errors" => Shape.new(
            "Errors",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Error",
              nil,
              nil,
              false
            ),
            true
          ),





          "Event" => Shape.new(
            "Event",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "EventBridgeConfiguration" => Shape.new(
            "EventBridgeConfiguration",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),








          "EventList" => Shape.new(
            "EventList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Event",
              nil,
              nil,
              false
            ),
            true
          ),





          "ExistingObjectReplication" => Shape.new(
            "ExistingObjectReplication",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "ExistingObjectReplicationStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ExistingObjectReplicationStatus" => Shape.new(
            "ExistingObjectReplicationStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Expiration" => Shape.new(
            "Expiration",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ExpirationState" => Shape.new(
            "ExpirationState",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ExpirationStatus" => Shape.new(
            "ExpirationStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ExpiredObjectDeleteMarker" => Shape.new(
            "ExpiredObjectDeleteMarker",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "Expires" => Shape.new(
            "Expires",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ExposeHeader" => Shape.new(
            "ExposeHeader",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ExposeHeaders" => Shape.new(
            "ExposeHeaders",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ExposeHeader",
              nil,
              nil,
              false
            ),
            true
          ),





          "Expression" => Shape.new(
            "Expression",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ExpressionType" => Shape.new(
            "ExpressionType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FetchOwner" => Shape.new(
            "FetchOwner",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "FieldDelimiter" => Shape.new(
            "FieldDelimiter",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FileHeaderInfo" => Shape.new(
            "FileHeaderInfo",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FilterRule" => Shape.new(
            "FilterRule",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "FilterRuleName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "FilterRuleValue",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "FilterRuleList" => Shape.new(
            "FilterRuleList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "FilterRule",
              nil,
              nil,
              false
            ),
            true
          ),





          "FilterRuleName" => Shape.new(
            "FilterRuleName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FilterRuleValue" => Shape.new(
            "FilterRuleValue",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GetBucketAbacOutput" => Shape.new(
            "GetBucketAbacOutput",
            "structure",
            [





              ShapeMember.new(
                "AbacStatus",
                "AbacStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketAbacRequest" => Shape.new(
            "GetBucketAbacRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketAccelerateConfigurationOutput" => Shape.new(
            "GetBucketAccelerateConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "Status",
                "BucketAccelerateStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketAccelerateConfigurationRequest" => Shape.new(
            "GetBucketAccelerateConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketAclOutput" => Shape.new(
            "GetBucketAclOutput",
            "structure",
            [





              ShapeMember.new(
                "Grants",
                "Grants",
                nil,
                "AccessControlList",
                false
              ),





              ShapeMember.new(
                "Owner",
                "Owner",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketAclRequest" => Shape.new(
            "GetBucketAclRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketAnalyticsConfigurationOutput" => Shape.new(
            "GetBucketAnalyticsConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "AnalyticsConfiguration",
                "AnalyticsConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketAnalyticsConfigurationRequest" => Shape.new(
            "GetBucketAnalyticsConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "AnalyticsId",
                "querystring",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketCorsOutput" => Shape.new(
            "GetBucketCorsOutput",
            "structure",
            [





              ShapeMember.new(
                "CORSRules",
                "CORSRules",
                nil,
                "CORSRule",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketCorsRequest" => Shape.new(
            "GetBucketCorsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketEncryptionOutput" => Shape.new(
            "GetBucketEncryptionOutput",
            "structure",
            [





              ShapeMember.new(
                "ServerSideEncryptionConfiguration",
                "ServerSideEncryptionConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketEncryptionRequest" => Shape.new(
            "GetBucketEncryptionRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketIntelligentTieringConfigurationOutput" => Shape.new(
            "GetBucketIntelligentTieringConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "IntelligentTieringConfiguration",
                "IntelligentTieringConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketIntelligentTieringConfigurationRequest" => Shape.new(
            "GetBucketIntelligentTieringConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "IntelligentTieringId",
                "querystring",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketInventoryConfigurationOutput" => Shape.new(
            "GetBucketInventoryConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "InventoryConfiguration",
                "InventoryConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketInventoryConfigurationRequest" => Shape.new(
            "GetBucketInventoryConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "InventoryId",
                "querystring",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLifecycleConfigurationOutput" => Shape.new(
            "GetBucketLifecycleConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "Rules",
                "LifecycleRules",
                nil,
                "Rule",
                false
              ),





              ShapeMember.new(
                "TransitionDefaultMinimumObjectSize",
                "TransitionDefaultMinimumObjectSize",
                "header",
                "x-amz-transition-default-minimum-object-size",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLifecycleConfigurationRequest" => Shape.new(
            "GetBucketLifecycleConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLifecycleOutput" => Shape.new(
            "GetBucketLifecycleOutput",
            "structure",
            [





              ShapeMember.new(
                "Rules",
                "Rules",
                nil,
                "Rule",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLifecycleRequest" => Shape.new(
            "GetBucketLifecycleRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLocationOutput" => Shape.new(
            "GetBucketLocationOutput",
            "structure",
            [





              ShapeMember.new(
                "LocationConstraint",
                "BucketLocationConstraint",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLocationRequest" => Shape.new(
            "GetBucketLocationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLoggingOutput" => Shape.new(
            "GetBucketLoggingOutput",
            "structure",
            [





              ShapeMember.new(
                "LoggingEnabled",
                "LoggingEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLoggingRequest" => Shape.new(
            "GetBucketLoggingRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketMetadataConfigurationOutput" => Shape.new(
            "GetBucketMetadataConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "GetBucketMetadataConfigurationResult",
                "GetBucketMetadataConfigurationResult",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketMetadataConfigurationRequest" => Shape.new(
            "GetBucketMetadataConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketMetadataConfigurationResult" => Shape.new(
            "GetBucketMetadataConfigurationResult",
            "structure",
            [





              ShapeMember.new(
                "MetadataConfigurationResult",
                "MetadataConfigurationResult",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketMetadataTableConfigurationOutput" => Shape.new(
            "GetBucketMetadataTableConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "GetBucketMetadataTableConfigurationResult",
                "GetBucketMetadataTableConfigurationResult",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketMetadataTableConfigurationRequest" => Shape.new(
            "GetBucketMetadataTableConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketMetadataTableConfigurationResult" => Shape.new(
            "GetBucketMetadataTableConfigurationResult",
            "structure",
            [





              ShapeMember.new(
                "Error",
                "ErrorDetails",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MetadataTableConfigurationResult",
                "MetadataTableConfigurationResult",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "MetadataTableStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketMetricsConfigurationOutput" => Shape.new(
            "GetBucketMetricsConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "MetricsConfiguration",
                "MetricsConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketMetricsConfigurationRequest" => Shape.new(
            "GetBucketMetricsConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "MetricsId",
                "querystring",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketNotificationConfigurationRequest" => Shape.new(
            "GetBucketNotificationConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketOwnershipControlsOutput" => Shape.new(
            "GetBucketOwnershipControlsOutput",
            "structure",
            [





              ShapeMember.new(
                "OwnershipControls",
                "OwnershipControls",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketOwnershipControlsRequest" => Shape.new(
            "GetBucketOwnershipControlsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketPolicyOutput" => Shape.new(
            "GetBucketPolicyOutput",
            "structure",
            [





              ShapeMember.new(
                "Policy",
                "Policy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketPolicyRequest" => Shape.new(
            "GetBucketPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketPolicyStatusOutput" => Shape.new(
            "GetBucketPolicyStatusOutput",
            "structure",
            [





              ShapeMember.new(
                "PolicyStatus",
                "PolicyStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketPolicyStatusRequest" => Shape.new(
            "GetBucketPolicyStatusRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketReplicationOutput" => Shape.new(
            "GetBucketReplicationOutput",
            "structure",
            [





              ShapeMember.new(
                "ReplicationConfiguration",
                "ReplicationConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketReplicationRequest" => Shape.new(
            "GetBucketReplicationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketRequestPaymentOutput" => Shape.new(
            "GetBucketRequestPaymentOutput",
            "structure",
            [





              ShapeMember.new(
                "Payer",
                "Payer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketRequestPaymentRequest" => Shape.new(
            "GetBucketRequestPaymentRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketTaggingOutput" => Shape.new(
            "GetBucketTaggingOutput",
            "structure",
            [





              ShapeMember.new(
                "TagSet",
                "TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketTaggingRequest" => Shape.new(
            "GetBucketTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketVersioningOutput" => Shape.new(
            "GetBucketVersioningOutput",
            "structure",
            [





              ShapeMember.new(
                "MFADelete",
                "MFADeleteStatus",
                nil,
                "MfaDelete",
                false
              ),





              ShapeMember.new(
                "Status",
                "BucketVersioningStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketVersioningRequest" => Shape.new(
            "GetBucketVersioningRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketWebsiteOutput" => Shape.new(
            "GetBucketWebsiteOutput",
            "structure",
            [





              ShapeMember.new(
                "ErrorDocument",
                "ErrorDocument",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IndexDocument",
                "IndexDocument",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RedirectAllRequestsTo",
                "RedirectAllRequestsTo",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RoutingRules",
                "RoutingRules",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketWebsiteRequest" => Shape.new(
            "GetBucketWebsiteRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectAclOutput" => Shape.new(
            "GetObjectAclOutput",
            "structure",
            [





              ShapeMember.new(
                "Grants",
                "Grants",
                nil,
                "AccessControlList",
                false
              ),





              ShapeMember.new(
                "Owner",
                "Owner",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectAclRequest" => Shape.new(
            "GetObjectAclRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectAttributesOutput" => Shape.new(
            "GetObjectAttributesOutput",
            "structure",
            [





              ShapeMember.new(
                "Checksum",
                "Checksum",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DeleteMarker",
                "DeleteMarker",
                "header",
                "x-amz-delete-marker",
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                "header",
                "Last-Modified",
                false
              ),





              ShapeMember.new(
                "ObjectParts",
                "GetObjectAttributesParts",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectSize",
                "ObjectSize",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectAttributesParts" => Shape.new(
            "GetObjectAttributesParts",
            "structure",
            [





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxParts",
                "MaxParts",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextPartNumberMarker",
                "NextPartNumberMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PartNumberMarker",
                "PartNumberMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Parts",
                "PartsList",
                nil,
                "Part",
                false
              ),





              ShapeMember.new(
                "TotalPartsCount",
                "PartsCount",
                nil,
                "PartsCount",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectAttributesRequest" => Shape.new(
            "GetObjectAttributesRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "MaxParts",
                "MaxParts",
                "header",
                "x-amz-max-parts",
                false
              ),





              ShapeMember.new(
                "ObjectAttributes",
                "ObjectAttributesList",
                "header",
                "x-amz-object-attributes",
                false
              ),





              ShapeMember.new(
                "PartNumberMarker",
                "PartNumberMarker",
                "header",
                "x-amz-part-number-marker",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectLegalHoldOutput" => Shape.new(
            "GetObjectLegalHoldOutput",
            "structure",
            [





              ShapeMember.new(
                "LegalHold",
                "ObjectLockLegalHold",
                nil,
                "LegalHold",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectLegalHoldRequest" => Shape.new(
            "GetObjectLegalHoldRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectLockConfigurationOutput" => Shape.new(
            "GetObjectLockConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "ObjectLockConfiguration",
                "ObjectLockConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectLockConfigurationRequest" => Shape.new(
            "GetObjectLockConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectOutput" => Shape.new(
            "GetObjectOutput",
            "structure",
            [





              ShapeMember.new(
                "AcceptRanges",
                "AcceptRanges",
                "header",
                "accept-ranges",
                false
              ),





              ShapeMember.new(
                "Body",
                "Body",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "CacheControl",
                "CacheControl",
                "header",
                "Cache-Control",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                "header",
                "x-amz-checksum-crc32",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                "header",
                "x-amz-checksum-crc32c",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                "header",
                "x-amz-checksum-crc64nvme",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                "header",
                "x-amz-checksum-sha1",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                "header",
                "x-amz-checksum-sha256",
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                "header",
                "x-amz-checksum-type",
                false
              ),





              ShapeMember.new(
                "ContentDisposition",
                "ContentDisposition",
                "header",
                "Content-Disposition",
                false
              ),





              ShapeMember.new(
                "ContentEncoding",
                "ContentEncoding",
                "header",
                "Content-Encoding",
                false
              ),





              ShapeMember.new(
                "ContentLanguage",
                "ContentLanguage",
                "header",
                "Content-Language",
                false
              ),





              ShapeMember.new(
                "ContentLength",
                "ContentLength",
                "header",
                "Content-Length",
                false
              ),





              ShapeMember.new(
                "ContentRange",
                "ContentRange",
                "header",
                "Content-Range",
                false
              ),





              ShapeMember.new(
                "ContentType",
                "ContentType",
                "header",
                "Content-Type",
                false
              ),





              ShapeMember.new(
                "DeleteMarker",
                "DeleteMarker",
                "header",
                "x-amz-delete-marker",
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Expiration",
                "Expiration",
                "header",
                "x-amz-expiration",
                false
              ),





              ShapeMember.new(
                "Expires",
                "Expires",
                "header",
                "Expires",
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                "header",
                "Last-Modified",
                false
              ),





              ShapeMember.new(
                "Metadata",
                "Metadata",
                "headers",
                "x-amz-meta-",
                false
              ),





              ShapeMember.new(
                "MissingMeta",
                "MissingMeta",
                "header",
                "x-amz-missing-meta",
                false
              ),





              ShapeMember.new(
                "ObjectLockLegalHoldStatus",
                "ObjectLockLegalHoldStatus",
                "header",
                "x-amz-object-lock-legal-hold",
                false
              ),





              ShapeMember.new(
                "ObjectLockMode",
                "ObjectLockMode",
                "header",
                "x-amz-object-lock-mode",
                false
              ),





              ShapeMember.new(
                "ObjectLockRetainUntilDate",
                "ObjectLockRetainUntilDate",
                "header",
                "x-amz-object-lock-retain-until-date",
                false
              ),





              ShapeMember.new(
                "PartsCount",
                "PartsCount",
                "header",
                "x-amz-mp-parts-count",
                false
              ),





              ShapeMember.new(
                "ReplicationStatus",
                "ReplicationStatus",
                "header",
                "x-amz-replication-status",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "Restore",
                "Restore",
                "header",
                "x-amz-restore",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                "header",
                "x-amz-storage-class",
                false
              ),





              ShapeMember.new(
                "TagCount",
                "TagCount",
                "header",
                "x-amz-tagging-count",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),





              ShapeMember.new(
                "WebsiteRedirectLocation",
                "WebsiteRedirectLocation",
                "header",
                "x-amz-website-redirect-location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectRequest" => Shape.new(
            "GetObjectRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumMode",
                "ChecksumMode",
                "header",
                "x-amz-checksum-mode",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "IfMatch",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "IfModifiedSince",
                "IfModifiedSince",
                "header",
                "If-Modified-Since",
                false
              ),





              ShapeMember.new(
                "IfNoneMatch",
                "IfNoneMatch",
                "header",
                "If-None-Match",
                false
              ),





              ShapeMember.new(
                "IfUnmodifiedSince",
                "IfUnmodifiedSince",
                "header",
                "If-Unmodified-Since",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "PartNumber",
                "PartNumber",
                "querystring",
                "partNumber",
                false
              ),





              ShapeMember.new(
                "Range",
                "Range",
                "header",
                "Range",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "ResponseCacheControl",
                "ResponseCacheControl",
                "querystring",
                "response-cache-control",
                false
              ),





              ShapeMember.new(
                "ResponseContentDisposition",
                "ResponseContentDisposition",
                "querystring",
                "response-content-disposition",
                false
              ),





              ShapeMember.new(
                "ResponseContentEncoding",
                "ResponseContentEncoding",
                "querystring",
                "response-content-encoding",
                false
              ),





              ShapeMember.new(
                "ResponseContentLanguage",
                "ResponseContentLanguage",
                "querystring",
                "response-content-language",
                false
              ),





              ShapeMember.new(
                "ResponseContentType",
                "ResponseContentType",
                "querystring",
                "response-content-type",
                false
              ),





              ShapeMember.new(
                "ResponseExpires",
                "ResponseExpires",
                "querystring",
                "response-expires",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectResponseStatusCode" => Shape.new(
            "GetObjectResponseStatusCode",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "GetObjectRetentionOutput" => Shape.new(
            "GetObjectRetentionOutput",
            "structure",
            [





              ShapeMember.new(
                "Retention",
                "ObjectLockRetention",
                nil,
                "Retention",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectRetentionRequest" => Shape.new(
            "GetObjectRetentionRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectTaggingOutput" => Shape.new(
            "GetObjectTaggingOutput",
            "structure",
            [





              ShapeMember.new(
                "TagSet",
                "TagSet",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectTaggingRequest" => Shape.new(
            "GetObjectTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectTorrentOutput" => Shape.new(
            "GetObjectTorrentOutput",
            "structure",
            [





              ShapeMember.new(
                "Body",
                "Body",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetObjectTorrentRequest" => Shape.new(
            "GetObjectTorrentRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetPublicAccessBlockOutput" => Shape.new(
            "GetPublicAccessBlockOutput",
            "structure",
            [





              ShapeMember.new(
                "PublicAccessBlockConfiguration",
                "PublicAccessBlockConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetPublicAccessBlockRequest" => Shape.new(
            "GetPublicAccessBlockRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GlacierJobParameters" => Shape.new(
            "GlacierJobParameters",
            "structure",
            [





              ShapeMember.new(
                "Tier",
                "Tier",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Grant" => Shape.new(
            "Grant",
            "structure",
            [





              ShapeMember.new(
                "Grantee",
                "Grantee",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Permission",
                "Permission",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GrantFullControl" => Shape.new(
            "GrantFullControl",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GrantRead" => Shape.new(
            "GrantRead",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GrantReadACP" => Shape.new(
            "GrantReadACP",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GrantWrite" => Shape.new(
            "GrantWrite",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GrantWriteACP" => Shape.new(
            "GrantWriteACP",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Grantee" => Shape.new(
            "Grantee",
            "structure",
            [





              ShapeMember.new(
                "DisplayName",
                "DisplayName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EmailAddress",
                "EmailAddress",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ID",
                "ID",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Type",
                "Type",
                nil,
                "xsi:type",
                false
              ),





              ShapeMember.new(
                "URI",
                "URI",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "Grants" => Shape.new(
            "Grants",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Grant",
              nil,
              "Grant",
              false
            ),
            false
          ),





          "HeadBucketOutput" => Shape.new(
            "HeadBucketOutput",
            "structure",
            [





              ShapeMember.new(
                "AccessPointAlias",
                "AccessPointAlias",
                "header",
                "x-amz-access-point-alias",
                false
              ),





              ShapeMember.new(
                "BucketArn",
                "S3RegionalOrS3ExpressBucketArnString",
                "header",
                "x-amz-bucket-arn",
                false
              ),





              ShapeMember.new(
                "BucketLocationName",
                "BucketLocationName",
                "header",
                "x-amz-bucket-location-name",
                false
              ),





              ShapeMember.new(
                "BucketLocationType",
                "LocationType",
                "header",
                "x-amz-bucket-location-type",
                false
              ),





              ShapeMember.new(
                "BucketRegion",
                "Region",
                "header",
                "x-amz-bucket-region",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "HeadBucketRequest" => Shape.new(
            "HeadBucketRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "HeadObjectOutput" => Shape.new(
            "HeadObjectOutput",
            "structure",
            [





              ShapeMember.new(
                "AcceptRanges",
                "AcceptRanges",
                "header",
                "accept-ranges",
                false
              ),





              ShapeMember.new(
                "ArchiveStatus",
                "ArchiveStatus",
                "header",
                "x-amz-archive-status",
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "CacheControl",
                "CacheControl",
                "header",
                "Cache-Control",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                "header",
                "x-amz-checksum-crc32",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                "header",
                "x-amz-checksum-crc32c",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                "header",
                "x-amz-checksum-crc64nvme",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                "header",
                "x-amz-checksum-sha1",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                "header",
                "x-amz-checksum-sha256",
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                "header",
                "x-amz-checksum-type",
                false
              ),





              ShapeMember.new(
                "ContentDisposition",
                "ContentDisposition",
                "header",
                "Content-Disposition",
                false
              ),





              ShapeMember.new(
                "ContentEncoding",
                "ContentEncoding",
                "header",
                "Content-Encoding",
                false
              ),





              ShapeMember.new(
                "ContentLanguage",
                "ContentLanguage",
                "header",
                "Content-Language",
                false
              ),





              ShapeMember.new(
                "ContentLength",
                "ContentLength",
                "header",
                "Content-Length",
                false
              ),





              ShapeMember.new(
                "ContentRange",
                "ContentRange",
                "header",
                "Content-Range",
                false
              ),





              ShapeMember.new(
                "ContentType",
                "ContentType",
                "header",
                "Content-Type",
                false
              ),





              ShapeMember.new(
                "DeleteMarker",
                "DeleteMarker",
                "header",
                "x-amz-delete-marker",
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Expiration",
                "Expiration",
                "header",
                "x-amz-expiration",
                false
              ),





              ShapeMember.new(
                "Expires",
                "Expires",
                "header",
                "Expires",
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                "header",
                "Last-Modified",
                false
              ),





              ShapeMember.new(
                "Metadata",
                "Metadata",
                "headers",
                "x-amz-meta-",
                false
              ),





              ShapeMember.new(
                "MissingMeta",
                "MissingMeta",
                "header",
                "x-amz-missing-meta",
                false
              ),





              ShapeMember.new(
                "ObjectLockLegalHoldStatus",
                "ObjectLockLegalHoldStatus",
                "header",
                "x-amz-object-lock-legal-hold",
                false
              ),





              ShapeMember.new(
                "ObjectLockMode",
                "ObjectLockMode",
                "header",
                "x-amz-object-lock-mode",
                false
              ),





              ShapeMember.new(
                "ObjectLockRetainUntilDate",
                "ObjectLockRetainUntilDate",
                "header",
                "x-amz-object-lock-retain-until-date",
                false
              ),





              ShapeMember.new(
                "PartsCount",
                "PartsCount",
                "header",
                "x-amz-mp-parts-count",
                false
              ),





              ShapeMember.new(
                "ReplicationStatus",
                "ReplicationStatus",
                "header",
                "x-amz-replication-status",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "Restore",
                "Restore",
                "header",
                "x-amz-restore",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                "header",
                "x-amz-storage-class",
                false
              ),





              ShapeMember.new(
                "TagCount",
                "TagCount",
                "header",
                "x-amz-tagging-count",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),





              ShapeMember.new(
                "WebsiteRedirectLocation",
                "WebsiteRedirectLocation",
                "header",
                "x-amz-website-redirect-location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "HeadObjectRequest" => Shape.new(
            "HeadObjectRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumMode",
                "ChecksumMode",
                "header",
                "x-amz-checksum-mode",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "IfMatch",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "IfModifiedSince",
                "IfModifiedSince",
                "header",
                "If-Modified-Since",
                false
              ),





              ShapeMember.new(
                "IfNoneMatch",
                "IfNoneMatch",
                "header",
                "If-None-Match",
                false
              ),





              ShapeMember.new(
                "IfUnmodifiedSince",
                "IfUnmodifiedSince",
                "header",
                "If-Unmodified-Since",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "PartNumber",
                "PartNumber",
                "querystring",
                "partNumber",
                false
              ),





              ShapeMember.new(
                "Range",
                "Range",
                "header",
                "Range",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "ResponseCacheControl",
                "ResponseCacheControl",
                "querystring",
                "response-cache-control",
                false
              ),





              ShapeMember.new(
                "ResponseContentDisposition",
                "ResponseContentDisposition",
                "querystring",
                "response-content-disposition",
                false
              ),





              ShapeMember.new(
                "ResponseContentEncoding",
                "ResponseContentEncoding",
                "querystring",
                "response-content-encoding",
                false
              ),





              ShapeMember.new(
                "ResponseContentLanguage",
                "ResponseContentLanguage",
                "querystring",
                "response-content-language",
                false
              ),





              ShapeMember.new(
                "ResponseContentType",
                "ResponseContentType",
                "querystring",
                "response-content-type",
                false
              ),





              ShapeMember.new(
                "ResponseExpires",
                "ResponseExpires",
                "querystring",
                "response-expires",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "HostName" => Shape.new(
            "HostName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "HttpErrorCodeReturnedEquals" => Shape.new(
            "HttpErrorCodeReturnedEquals",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "HttpRedirectCode" => Shape.new(
            "HttpRedirectCode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ID" => Shape.new(
            "ID",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IdempotencyParameterMismatch" => Shape.new(
            "IdempotencyParameterMismatch",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "IfMatch" => Shape.new(
            "IfMatch",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IfMatchInitiatedTime" => Shape.new(
            "IfMatchInitiatedTime",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "IfMatchLastModifiedTime" => Shape.new(
            "IfMatchLastModifiedTime",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "IfMatchSize" => Shape.new(
            "IfMatchSize",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "IfModifiedSince" => Shape.new(
            "IfModifiedSince",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "IfNoneMatch" => Shape.new(
            "IfNoneMatch",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IfUnmodifiedSince" => Shape.new(
            "IfUnmodifiedSince",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "IndexDocument" => Shape.new(
            "IndexDocument",
            "structure",
            [





              ShapeMember.new(
                "Suffix",
                "Suffix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Initiated" => Shape.new(
            "Initiated",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "Initiator" => Shape.new(
            "Initiator",
            "structure",
            [





              ShapeMember.new(
                "DisplayName",
                "DisplayName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ID",
                "ID",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InputSerialization" => Shape.new(
            "InputSerialization",
            "structure",
            [





              ShapeMember.new(
                "CSV",
                "CSVInput",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CompressionType",
                "CompressionType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "JSON",
                "JSONInput",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Parquet",
                "ParquetInput",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "IntelligentTieringAccessTier" => Shape.new(
            "IntelligentTieringAccessTier",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IntelligentTieringAndOperator" => Shape.new(
            "IntelligentTieringAndOperator",
            "structure",
            [





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagSet",
                nil,
                "Tag",
                true
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "IntelligentTieringConfiguration" => Shape.new(
            "IntelligentTieringConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Filter",
                "IntelligentTieringFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "IntelligentTieringId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "IntelligentTieringStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tierings",
                "TieringList",
                nil,
                "Tiering",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "IntelligentTieringConfigurationList" => Shape.new(
            "IntelligentTieringConfigurationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "IntelligentTieringConfiguration",
              nil,
              nil,
              false
            ),
            true
          ),





          "IntelligentTieringDays" => Shape.new(
            "IntelligentTieringDays",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "IntelligentTieringFilter" => Shape.new(
            "IntelligentTieringFilter",
            "structure",
            [





              ShapeMember.new(
                "And",
                "IntelligentTieringAndOperator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tag",
                "Tag",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "IntelligentTieringId" => Shape.new(
            "IntelligentTieringId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IntelligentTieringStatus" => Shape.new(
            "IntelligentTieringStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "InvalidObjectState" => Shape.new(
            "InvalidObjectState",
            "structure",
            [





              ShapeMember.new(
                "AccessTier",
                "IntelligentTieringAccessTier",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidRequest" => Shape.new(
            "InvalidRequest",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidWriteOffset" => Shape.new(
            "InvalidWriteOffset",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "InventoryConfiguration" => Shape.new(
            "InventoryConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Destination",
                "InventoryDestination",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Filter",
                "InventoryFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "InventoryId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IncludedObjectVersions",
                "InventoryIncludedObjectVersions",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OptionalFields",
                "InventoryOptionalFields",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Schedule",
                "InventorySchedule",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "InventoryConfigurationList" => Shape.new(
            "InventoryConfigurationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "InventoryConfiguration",
              nil,
              nil,
              false
            ),
            true
          ),





          "InventoryConfigurationState" => Shape.new(
            "InventoryConfigurationState",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "InventoryDestination" => Shape.new(
            "InventoryDestination",
            "structure",
            [





              ShapeMember.new(
                "S3BucketDestination",
                "InventoryS3BucketDestination",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InventoryEncryption" => Shape.new(
            "InventoryEncryption",
            "structure",
            [





              ShapeMember.new(
                "SSEKMS",
                "SSEKMS",
                nil,
                "SSE-KMS",
                false
              ),





              ShapeMember.new(
                "SSES3",
                "SSES3",
                nil,
                "SSE-S3",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InventoryFilter" => Shape.new(
            "InventoryFilter",
            "structure",
            [





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InventoryFormat" => Shape.new(
            "InventoryFormat",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "InventoryFrequency" => Shape.new(
            "InventoryFrequency",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "InventoryId" => Shape.new(
            "InventoryId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "InventoryIncludedObjectVersions" => Shape.new(
            "InventoryIncludedObjectVersions",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "InventoryOptionalField" => Shape.new(
            "InventoryOptionalField",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "InventoryOptionalFields" => Shape.new(
            "InventoryOptionalFields",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "InventoryOptionalField",
              nil,
              "Field",
              false
            ),
            false
          ),





          "InventoryS3BucketDestination" => Shape.new(
            "InventoryS3BucketDestination",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Encryption",
                "InventoryEncryption",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Format",
                "InventoryFormat",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InventorySchedule" => Shape.new(
            "InventorySchedule",
            "structure",
            [





              ShapeMember.new(
                "Frequency",
                "InventoryFrequency",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InventoryTableConfiguration" => Shape.new(
            "InventoryTableConfiguration",
            "structure",
            [





              ShapeMember.new(
                "ConfigurationState",
                "InventoryConfigurationState",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncryptionConfiguration",
                "MetadataTableEncryptionConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InventoryTableConfigurationResult" => Shape.new(
            "InventoryTableConfigurationResult",
            "structure",
            [





              ShapeMember.new(
                "ConfigurationState",
                "InventoryConfigurationState",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Error",
                "ErrorDetails",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableArn",
                "S3TablesArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableName",
                "S3TablesName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableStatus",
                "MetadataTableStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InventoryTableConfigurationUpdates" => Shape.new(
            "InventoryTableConfigurationUpdates",
            "structure",
            [





              ShapeMember.new(
                "ConfigurationState",
                "InventoryConfigurationState",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncryptionConfiguration",
                "MetadataTableEncryptionConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "IsEnabled" => Shape.new(
            "IsEnabled",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "IsLatest" => Shape.new(
            "IsLatest",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "IsPublic" => Shape.new(
            "IsPublic",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "IsRestoreInProgress" => Shape.new(
            "IsRestoreInProgress",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "IsTruncated" => Shape.new(
            "IsTruncated",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "JSONInput" => Shape.new(
            "JSONInput",
            "structure",
            [





              ShapeMember.new(
                "Type",
                "JSONType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JSONOutput" => Shape.new(
            "JSONOutput",
            "structure",
            [





              ShapeMember.new(
                "RecordDelimiter",
                "RecordDelimiter",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JSONType" => Shape.new(
            "JSONType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JournalTableConfiguration" => Shape.new(
            "JournalTableConfiguration",
            "structure",
            [





              ShapeMember.new(
                "EncryptionConfiguration",
                "MetadataTableEncryptionConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RecordExpiration",
                "RecordExpiration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JournalTableConfigurationResult" => Shape.new(
            "JournalTableConfigurationResult",
            "structure",
            [





              ShapeMember.new(
                "Error",
                "ErrorDetails",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RecordExpiration",
                "RecordExpiration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableArn",
                "S3TablesArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableName",
                "S3TablesName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableStatus",
                "MetadataTableStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JournalTableConfigurationUpdates" => Shape.new(
            "JournalTableConfigurationUpdates",
            "structure",
            [





              ShapeMember.new(
                "RecordExpiration",
                "RecordExpiration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KMSContext" => Shape.new(
            "KMSContext",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "KeyCount" => Shape.new(
            "KeyCount",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "KeyMarker" => Shape.new(
            "KeyMarker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "KeyPrefixEquals" => Shape.new(
            "KeyPrefixEquals",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "KmsKeyArn" => Shape.new(
            "KmsKeyArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "LambdaFunctionArn" => Shape.new(
            "LambdaFunctionArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "LambdaFunctionConfiguration" => Shape.new(
            "LambdaFunctionConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Events",
                "EventList",
                nil,
                "Event",
                false
              ),





              ShapeMember.new(
                "Filter",
                "NotificationConfigurationFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "NotificationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LambdaFunctionArn",
                "LambdaFunctionArn",
                nil,
                "CloudFunction",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "LambdaFunctionConfigurationList" => Shape.new(
            "LambdaFunctionConfigurationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "LambdaFunctionConfiguration",
              nil,
              nil,
              false
            ),
            true
          ),





          "LastModified" => Shape.new(
            "LastModified",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "LastModifiedTime" => Shape.new(
            "LastModifiedTime",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "LifecycleConfiguration" => Shape.new(
            "LifecycleConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Rules",
                "Rules",
                nil,
                "Rule",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LifecycleExpiration" => Shape.new(
            "LifecycleExpiration",
            "structure",
            [





              ShapeMember.new(
                "Date",
                "Date",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Days",
                "Days",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExpiredObjectDeleteMarker",
                "ExpiredObjectDeleteMarker",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LifecycleRule" => Shape.new(
            "LifecycleRule",
            "structure",
            [





              ShapeMember.new(
                "AbortIncompleteMultipartUpload",
                "AbortIncompleteMultipartUpload",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Expiration",
                "LifecycleExpiration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Filter",
                "LifecycleRuleFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ID",
                "ID",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NoncurrentVersionExpiration",
                "NoncurrentVersionExpiration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NoncurrentVersionTransitions",
                "NoncurrentVersionTransitionList",
                nil,
                "NoncurrentVersionTransition",
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "ExpirationStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Transitions",
                "TransitionList",
                nil,
                "Transition",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LifecycleRuleAndOperator" => Shape.new(
            "LifecycleRuleAndOperator",
            "structure",
            [





              ShapeMember.new(
                "ObjectSizeGreaterThan",
                "ObjectSizeGreaterThanBytes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectSizeLessThan",
                "ObjectSizeLessThanBytes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagSet",
                nil,
                "Tag",
                true
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LifecycleRuleFilter" => Shape.new(
            "LifecycleRuleFilter",
            "structure",
            [





              ShapeMember.new(
                "And",
                "LifecycleRuleAndOperator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectSizeGreaterThan",
                "ObjectSizeGreaterThanBytes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectSizeLessThan",
                "ObjectSizeLessThanBytes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tag",
                "Tag",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "LifecycleRules" => Shape.new(
            "LifecycleRules",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "LifecycleRule",
              nil,
              nil,
              false
            ),
            true
          ),





          "ListBucketAnalyticsConfigurationsOutput" => Shape.new(
            "ListBucketAnalyticsConfigurationsOutput",
            "structure",
            [





              ShapeMember.new(
                "AnalyticsConfigurationList",
                "AnalyticsConfigurationList",
                nil,
                "AnalyticsConfiguration",
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextContinuationToken",
                "NextToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListBucketAnalyticsConfigurationsRequest" => Shape.new(
            "ListBucketAnalyticsConfigurationsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                "querystring",
                "continuation-token",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListBucketIntelligentTieringConfigurationsOutput" => Shape.new(
            "ListBucketIntelligentTieringConfigurationsOutput",
            "structure",
            [





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IntelligentTieringConfigurationList",
                "IntelligentTieringConfigurationList",
                nil,
                "IntelligentTieringConfiguration",
                false
              ),





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextContinuationToken",
                "NextToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListBucketIntelligentTieringConfigurationsRequest" => Shape.new(
            "ListBucketIntelligentTieringConfigurationsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                "querystring",
                "continuation-token",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListBucketInventoryConfigurationsOutput" => Shape.new(
            "ListBucketInventoryConfigurationsOutput",
            "structure",
            [





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "InventoryConfigurationList",
                "InventoryConfigurationList",
                nil,
                "InventoryConfiguration",
                false
              ),





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextContinuationToken",
                "NextToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListBucketInventoryConfigurationsRequest" => Shape.new(
            "ListBucketInventoryConfigurationsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                "querystring",
                "continuation-token",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListBucketMetricsConfigurationsOutput" => Shape.new(
            "ListBucketMetricsConfigurationsOutput",
            "structure",
            [





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MetricsConfigurationList",
                "MetricsConfigurationList",
                nil,
                "MetricsConfiguration",
                false
              ),





              ShapeMember.new(
                "NextContinuationToken",
                "NextToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListBucketMetricsConfigurationsRequest" => Shape.new(
            "ListBucketMetricsConfigurationsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                "querystring",
                "continuation-token",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListBucketsOutput" => Shape.new(
            "ListBucketsOutput",
            "structure",
            [





              ShapeMember.new(
                "Buckets",
                "Buckets",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "NextToken",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Owner",
                "Owner",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListBucketsRequest" => Shape.new(
            "ListBucketsRequest",
            "structure",
            [





              ShapeMember.new(
                "BucketRegion",
                "BucketRegion",
                "querystring",
                "bucket-region",
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                "querystring",
                "continuation-token",
                false
              ),





              ShapeMember.new(
                "MaxBuckets",
                "MaxBuckets",
                "querystring",
                "max-buckets",
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                "querystring",
                "prefix",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDirectoryBucketsOutput" => Shape.new(
            "ListDirectoryBucketsOutput",
            "structure",
            [





              ShapeMember.new(
                "Buckets",
                "Buckets",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "DirectoryBucketToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListDirectoryBucketsRequest" => Shape.new(
            "ListDirectoryBucketsRequest",
            "structure",
            [





              ShapeMember.new(
                "ContinuationToken",
                "DirectoryBucketToken",
                "querystring",
                "continuation-token",
                false
              ),





              ShapeMember.new(
                "MaxDirectoryBuckets",
                "MaxDirectoryBuckets",
                "querystring",
                "max-directory-buckets",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListMultipartUploadsOutput" => Shape.new(
            "ListMultipartUploadsOutput",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CommonPrefixes",
                "CommonPrefixList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Delimiter",
                "Delimiter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncodingType",
                "EncodingType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KeyMarker",
                "KeyMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxUploads",
                "MaxUploads",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextKeyMarker",
                "NextKeyMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextUploadIdMarker",
                "NextUploadIdMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "UploadIdMarker",
                "UploadIdMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Uploads",
                "MultipartUploadList",
                nil,
                "Upload",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListMultipartUploadsRequest" => Shape.new(
            "ListMultipartUploadsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "Delimiter",
                "Delimiter",
                "querystring",
                "delimiter",
                false
              ),





              ShapeMember.new(
                "EncodingType",
                "EncodingType",
                "querystring",
                "encoding-type",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "KeyMarker",
                "KeyMarker",
                "querystring",
                "key-marker",
                false
              ),





              ShapeMember.new(
                "MaxUploads",
                "MaxUploads",
                "querystring",
                "max-uploads",
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                "querystring",
                "prefix",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "UploadIdMarker",
                "UploadIdMarker",
                "querystring",
                "upload-id-marker",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListObjectVersionsOutput" => Shape.new(
            "ListObjectVersionsOutput",
            "structure",
            [





              ShapeMember.new(
                "CommonPrefixes",
                "CommonPrefixList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DeleteMarkers",
                "DeleteMarkers",
                nil,
                "DeleteMarker",
                false
              ),





              ShapeMember.new(
                "Delimiter",
                "Delimiter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncodingType",
                "EncodingType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KeyMarker",
                "KeyMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxKeys",
                "MaxKeys",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextKeyMarker",
                "NextKeyMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextVersionIdMarker",
                "NextVersionIdMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "VersionIdMarker",
                "VersionIdMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Versions",
                "ObjectVersionList",
                nil,
                "Version",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListObjectVersionsRequest" => Shape.new(
            "ListObjectVersionsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "Delimiter",
                "Delimiter",
                "querystring",
                "delimiter",
                false
              ),





              ShapeMember.new(
                "EncodingType",
                "EncodingType",
                "querystring",
                "encoding-type",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "KeyMarker",
                "KeyMarker",
                "querystring",
                "key-marker",
                false
              ),





              ShapeMember.new(
                "MaxKeys",
                "MaxKeys",
                "querystring",
                "max-keys",
                false
              ),





              ShapeMember.new(
                "OptionalObjectAttributes",
                "OptionalObjectAttributesList",
                "header",
                "x-amz-optional-object-attributes",
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                "querystring",
                "prefix",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "VersionIdMarker",
                "VersionIdMarker",
                "querystring",
                "version-id-marker",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListObjectsOutput" => Shape.new(
            "ListObjectsOutput",
            "structure",
            [





              ShapeMember.new(
                "CommonPrefixes",
                "CommonPrefixList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Contents",
                "ObjectList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Delimiter",
                "Delimiter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncodingType",
                "EncodingType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Marker",
                "Marker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxKeys",
                "MaxKeys",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextMarker",
                "NextMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListObjectsRequest" => Shape.new(
            "ListObjectsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "Delimiter",
                "Delimiter",
                "querystring",
                "delimiter",
                false
              ),





              ShapeMember.new(
                "EncodingType",
                "EncodingType",
                "querystring",
                "encoding-type",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Marker",
                "Marker",
                "querystring",
                "marker",
                false
              ),





              ShapeMember.new(
                "MaxKeys",
                "MaxKeys",
                "querystring",
                "max-keys",
                false
              ),





              ShapeMember.new(
                "OptionalObjectAttributes",
                "OptionalObjectAttributesList",
                "header",
                "x-amz-optional-object-attributes",
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                "querystring",
                "prefix",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListObjectsV2Output" => Shape.new(
            "ListObjectsV2Output",
            "structure",
            [





              ShapeMember.new(
                "CommonPrefixes",
                "CommonPrefixList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Contents",
                "ObjectList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Delimiter",
                "Delimiter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncodingType",
                "EncodingType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KeyCount",
                "KeyCount",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxKeys",
                "MaxKeys",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextContinuationToken",
                "NextToken",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "StartAfter",
                "StartAfter",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListObjectsV2Request" => Shape.new(
            "ListObjectsV2Request",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ContinuationToken",
                "Token",
                "querystring",
                "continuation-token",
                false
              ),





              ShapeMember.new(
                "Delimiter",
                "Delimiter",
                "querystring",
                "delimiter",
                false
              ),





              ShapeMember.new(
                "EncodingType",
                "EncodingType",
                "querystring",
                "encoding-type",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "FetchOwner",
                "FetchOwner",
                "querystring",
                "fetch-owner",
                false
              ),





              ShapeMember.new(
                "MaxKeys",
                "MaxKeys",
                "querystring",
                "max-keys",
                false
              ),





              ShapeMember.new(
                "OptionalObjectAttributes",
                "OptionalObjectAttributesList",
                "header",
                "x-amz-optional-object-attributes",
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                "querystring",
                "prefix",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "StartAfter",
                "StartAfter",
                "querystring",
                "start-after",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListPartsOutput" => Shape.new(
            "ListPartsOutput",
            "structure",
            [





              ShapeMember.new(
                "AbortDate",
                "AbortDate",
                "header",
                "x-amz-abort-date",
                false
              ),





              ShapeMember.new(
                "AbortRuleId",
                "AbortRuleId",
                "header",
                "x-amz-abort-rule-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Initiator",
                "Initiator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsTruncated",
                "IsTruncated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxParts",
                "MaxParts",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextPartNumberMarker",
                "NextPartNumberMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Owner",
                "Owner",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PartNumberMarker",
                "PartNumberMarker",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Parts",
                "Parts",
                nil,
                "Part",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "UploadId",
                "MultipartUploadId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListPartsRequest" => Shape.new(
            "ListPartsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "MaxParts",
                "MaxParts",
                "querystring",
                "max-parts",
                false
              ),





              ShapeMember.new(
                "PartNumberMarker",
                "PartNumberMarker",
                "querystring",
                "part-number-marker",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "UploadId",
                "MultipartUploadId",
                "querystring",
                "uploadId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Location" => Shape.new(
            "Location",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "LocationInfo" => Shape.new(
            "LocationInfo",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "LocationNameAsString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Type",
                "LocationType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LocationNameAsString" => Shape.new(
            "LocationNameAsString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "LocationPrefix" => Shape.new(
            "LocationPrefix",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "LocationType" => Shape.new(
            "LocationType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "LoggingEnabled" => Shape.new(
            "LoggingEnabled",
            "structure",
            [





              ShapeMember.new(
                "TargetBucket",
                "TargetBucket",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TargetGrants",
                "TargetGrants",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TargetObjectKeyFormat",
                "TargetObjectKeyFormat",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TargetPrefix",
                "TargetPrefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MFA" => Shape.new(
            "MFA",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MFADelete" => Shape.new(
            "MFADelete",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MFADeleteStatus" => Shape.new(
            "MFADeleteStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Marker" => Shape.new(
            "Marker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MaxAgeSeconds" => Shape.new(
            "MaxAgeSeconds",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "MaxBuckets" => Shape.new(
            "MaxBuckets",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "MaxDirectoryBuckets" => Shape.new(
            "MaxDirectoryBuckets",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "MaxKeys" => Shape.new(
            "MaxKeys",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "MaxParts" => Shape.new(
            "MaxParts",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "MaxUploads" => Shape.new(
            "MaxUploads",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "Message" => Shape.new(
            "Message",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Metadata" => Shape.new(
            "Metadata",
            "map",
            [] of ShapeMember,
            nil,
            false
          ),




          "MetadataConfiguration" => Shape.new(
            "MetadataConfiguration",
            "structure",
            [





              ShapeMember.new(
                "InventoryTableConfiguration",
                "InventoryTableConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "JournalTableConfiguration",
                "JournalTableConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetadataConfigurationResult" => Shape.new(
            "MetadataConfigurationResult",
            "structure",
            [





              ShapeMember.new(
                "DestinationResult",
                "DestinationResult",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "InventoryTableConfigurationResult",
                "InventoryTableConfigurationResult",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "JournalTableConfigurationResult",
                "JournalTableConfigurationResult",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetadataDirective" => Shape.new(
            "MetadataDirective",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MetadataEntry" => Shape.new(
            "MetadataEntry",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "MetadataKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "MetadataValue",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetadataKey" => Shape.new(
            "MetadataKey",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MetadataTableConfiguration" => Shape.new(
            "MetadataTableConfiguration",
            "structure",
            [





              ShapeMember.new(
                "S3TablesDestination",
                "S3TablesDestination",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetadataTableConfigurationResult" => Shape.new(
            "MetadataTableConfigurationResult",
            "structure",
            [





              ShapeMember.new(
                "S3TablesDestinationResult",
                "S3TablesDestinationResult",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetadataTableEncryptionConfiguration" => Shape.new(
            "MetadataTableEncryptionConfiguration",
            "structure",
            [





              ShapeMember.new(
                "KmsKeyArn",
                "KmsKeyArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SseAlgorithm",
                "TableSseAlgorithm",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetadataTableStatus" => Shape.new(
            "MetadataTableStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MetadataValue" => Shape.new(
            "MetadataValue",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Metrics" => Shape.new(
            "Metrics",
            "structure",
            [





              ShapeMember.new(
                "EventThreshold",
                "ReplicationTimeValue",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "MetricsStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetricsAndOperator" => Shape.new(
            "MetricsAndOperator",
            "structure",
            [





              ShapeMember.new(
                "AccessPointArn",
                "AccessPointArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagSet",
                nil,
                "Tag",
                true
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetricsConfiguration" => Shape.new(
            "MetricsConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Filter",
                "MetricsFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "MetricsId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "MetricsConfigurationList" => Shape.new(
            "MetricsConfigurationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "MetricsConfiguration",
              nil,
              nil,
              false
            ),
            true
          ),





          "MetricsFilter" => Shape.new(
            "MetricsFilter",
            "structure",
            [





              ShapeMember.new(
                "AccessPointArn",
                "AccessPointArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "And",
                "MetricsAndOperator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tag",
                "Tag",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetricsId" => Shape.new(
            "MetricsId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MetricsStatus" => Shape.new(
            "MetricsStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Minutes" => Shape.new(
            "Minutes",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "MissingMeta" => Shape.new(
            "MissingMeta",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "MpuObjectSize" => Shape.new(
            "MpuObjectSize",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "MultipartUpload" => Shape.new(
            "MultipartUpload",
            "structure",
            [





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Initiated",
                "Initiated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Initiator",
                "Initiator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Owner",
                "Owner",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "UploadId",
                "MultipartUploadId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MultipartUploadId" => Shape.new(
            "MultipartUploadId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "MultipartUploadList" => Shape.new(
            "MultipartUploadList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "MultipartUpload",
              nil,
              nil,
              false
            ),
            true
          ),





          "NextKeyMarker" => Shape.new(
            "NextKeyMarker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NextMarker" => Shape.new(
            "NextMarker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NextPartNumberMarker" => Shape.new(
            "NextPartNumberMarker",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "NextToken" => Shape.new(
            "NextToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NextUploadIdMarker" => Shape.new(
            "NextUploadIdMarker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NextVersionIdMarker" => Shape.new(
            "NextVersionIdMarker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NoSuchBucket" => Shape.new(
            "NoSuchBucket",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchKey" => Shape.new(
            "NoSuchKey",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchUpload" => Shape.new(
            "NoSuchUpload",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "NoncurrentVersionExpiration" => Shape.new(
            "NoncurrentVersionExpiration",
            "structure",
            [





              ShapeMember.new(
                "NewerNoncurrentVersions",
                "VersionCount",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NoncurrentDays",
                "Days",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoncurrentVersionTransition" => Shape.new(
            "NoncurrentVersionTransition",
            "structure",
            [





              ShapeMember.new(
                "NewerNoncurrentVersions",
                "VersionCount",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NoncurrentDays",
                "Days",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "TransitionStorageClass",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "NoncurrentVersionTransitionList" => Shape.new(
            "NoncurrentVersionTransitionList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "NoncurrentVersionTransition",
              nil,
              nil,
              false
            ),
            true
          ),





          "NotificationConfiguration" => Shape.new(
            "NotificationConfiguration",
            "structure",
            [





              ShapeMember.new(
                "EventBridgeConfiguration",
                "EventBridgeConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LambdaFunctionConfigurations",
                "LambdaFunctionConfigurationList",
                nil,
                "CloudFunctionConfiguration",
                false
              ),





              ShapeMember.new(
                "QueueConfigurations",
                "QueueConfigurationList",
                nil,
                "QueueConfiguration",
                false
              ),





              ShapeMember.new(
                "TopicConfigurations",
                "TopicConfigurationList",
                nil,
                "TopicConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NotificationConfigurationDeprecated" => Shape.new(
            "NotificationConfigurationDeprecated",
            "structure",
            [





              ShapeMember.new(
                "CloudFunctionConfiguration",
                "CloudFunctionConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueueConfiguration",
                "QueueConfigurationDeprecated",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TopicConfiguration",
                "TopicConfigurationDeprecated",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NotificationConfigurationFilter" => Shape.new(
            "NotificationConfigurationFilter",
            "structure",
            [





              ShapeMember.new(
                "Key",
                "S3KeyFilter",
                nil,
                "S3Key",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NotificationId" => Shape.new(
            "NotificationId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Object" => Shape.new(
            "Object",
            "structure",
            [





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithmList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Owner",
                "Owner",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RestoreStatus",
                "RestoreStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Size",
                "Size",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "ObjectStorageClass",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectAlreadyInActiveTierError" => Shape.new(
            "ObjectAlreadyInActiveTierError",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectAttributes" => Shape.new(
            "ObjectAttributes",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ObjectAttributesList" => Shape.new(
            "ObjectAttributesList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ObjectAttributes",
              nil,
              nil,
              false
            ),
            false
          ),





          "ObjectCannedACL" => Shape.new(
            "ObjectCannedACL",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectIdentifier" => Shape.new(
            "ObjectIdentifier",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "ETag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModifiedTime",
                "LastModifiedTime",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Size",
                "Size",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ObjectIdentifierList" => Shape.new(
            "ObjectIdentifierList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ObjectIdentifier",
              nil,
              nil,
              false
            ),
            true
          ),





          "ObjectKey" => Shape.new(
            "ObjectKey",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ObjectList" => Shape.new(
            "ObjectList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Object",
              nil,
              nil,
              false
            ),
            true
          ),





          "ObjectLockConfiguration" => Shape.new(
            "ObjectLockConfiguration",
            "structure",
            [





              ShapeMember.new(
                "ObjectLockEnabled",
                "ObjectLockEnabled",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Rule",
                "ObjectLockRule",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockEnabled" => Shape.new(
            "ObjectLockEnabled",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockEnabledForBucket" => Shape.new(
            "ObjectLockEnabledForBucket",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockLegalHold" => Shape.new(
            "ObjectLockLegalHold",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "ObjectLockLegalHoldStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockLegalHoldStatus" => Shape.new(
            "ObjectLockLegalHoldStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockMode" => Shape.new(
            "ObjectLockMode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockRetainUntilDate" => Shape.new(
            "ObjectLockRetainUntilDate",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockRetention" => Shape.new(
            "ObjectLockRetention",
            "structure",
            [





              ShapeMember.new(
                "Mode",
                "ObjectLockRetentionMode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RetainUntilDate",
                "Date",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockRetentionMode" => Shape.new(
            "ObjectLockRetentionMode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockRule" => Shape.new(
            "ObjectLockRule",
            "structure",
            [





              ShapeMember.new(
                "DefaultRetention",
                "DefaultRetention",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectLockToken" => Shape.new(
            "ObjectLockToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectNotInActiveTierError" => Shape.new(
            "ObjectNotInActiveTierError",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectOwnership" => Shape.new(
            "ObjectOwnership",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectPart" => Shape.new(
            "ObjectPart",
            "structure",
            [





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PartNumber",
                "PartNumber",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Size",
                "Size",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectSize" => Shape.new(
            "ObjectSize",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectSizeGreaterThanBytes" => Shape.new(
            "ObjectSizeGreaterThanBytes",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectSizeLessThanBytes" => Shape.new(
            "ObjectSizeLessThanBytes",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectStorageClass" => Shape.new(
            "ObjectStorageClass",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectVersion" => Shape.new(
            "ObjectVersion",
            "structure",
            [





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithmList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsLatest",
                "IsLatest",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Owner",
                "Owner",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RestoreStatus",
                "RestoreStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Size",
                "Size",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "ObjectVersionStorageClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectVersionId" => Shape.new(
            "ObjectVersionId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ObjectVersionList" => Shape.new(
            "ObjectVersionList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ObjectVersion",
              nil,
              nil,
              false
            ),
            true
          ),





          "ObjectVersionStorageClass" => Shape.new(
            "ObjectVersionStorageClass",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OptionalObjectAttributes" => Shape.new(
            "OptionalObjectAttributes",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "OptionalObjectAttributesList" => Shape.new(
            "OptionalObjectAttributesList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "OptionalObjectAttributes",
              nil,
              nil,
              false
            ),
            false
          ),





          "OutputLocation" => Shape.new(
            "OutputLocation",
            "structure",
            [





              ShapeMember.new(
                "S3",
                "S3Location",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OutputSerialization" => Shape.new(
            "OutputSerialization",
            "structure",
            [





              ShapeMember.new(
                "CSV",
                "CSVOutput",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "JSON",
                "JSONOutput",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Owner" => Shape.new(
            "Owner",
            "structure",
            [





              ShapeMember.new(
                "DisplayName",
                "DisplayName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ID",
                "ID",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OwnerOverride" => Shape.new(
            "OwnerOverride",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OwnershipControls" => Shape.new(
            "OwnershipControls",
            "structure",
            [





              ShapeMember.new(
                "Rules",
                "OwnershipControlsRules",
                nil,
                "Rule",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "OwnershipControlsRule" => Shape.new(
            "OwnershipControlsRule",
            "structure",
            [





              ShapeMember.new(
                "ObjectOwnership",
                "ObjectOwnership",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "OwnershipControlsRules" => Shape.new(
            "OwnershipControlsRules",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "OwnershipControlsRule",
              nil,
              nil,
              false
            ),
            true
          ),





          "ParquetInput" => Shape.new(
            "ParquetInput",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "Part" => Shape.new(
            "Part",
            "structure",
            [





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PartNumber",
                "PartNumber",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Size",
                "Size",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PartNumber" => Shape.new(
            "PartNumber",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "PartNumberMarker" => Shape.new(
            "PartNumberMarker",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "PartitionDateSource" => Shape.new(
            "PartitionDateSource",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "PartitionedPrefix" => Shape.new(
            "PartitionedPrefix",
            "structure",
            [





              ShapeMember.new(
                "PartitionDateSource",
                "PartitionDateSource",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "Parts" => Shape.new(
            "Parts",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Part",
              nil,
              nil,
              false
            ),
            true
          ),





          "PartsCount" => Shape.new(
            "PartsCount",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),








          "PartsList" => Shape.new(
            "PartsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ObjectPart",
              nil,
              nil,
              false
            ),
            true
          ),





          "Payer" => Shape.new(
            "Payer",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Permission" => Shape.new(
            "Permission",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Policy" => Shape.new(
            "Policy",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "PolicyStatus" => Shape.new(
            "PolicyStatus",
            "structure",
            [





              ShapeMember.new(
                "IsPublic",
                "IsPublic",
                nil,
                "IsPublic",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Prefix" => Shape.new(
            "Prefix",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Priority" => Shape.new(
            "Priority",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "Progress" => Shape.new(
            "Progress",
            "structure",
            [





              ShapeMember.new(
                "BytesProcessed",
                "BytesProcessed",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BytesReturned",
                "BytesReturned",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BytesScanned",
                "BytesScanned",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ProgressEvent" => Shape.new(
            "ProgressEvent",
            "structure",
            [





              ShapeMember.new(
                "Details",
                "Progress",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Protocol" => Shape.new(
            "Protocol",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "PublicAccessBlockConfiguration" => Shape.new(
            "PublicAccessBlockConfiguration",
            "structure",
            [





              ShapeMember.new(
                "BlockPublicAcls",
                "Setting",
                nil,
                "BlockPublicAcls",
                false
              ),





              ShapeMember.new(
                "BlockPublicPolicy",
                "Setting",
                nil,
                "BlockPublicPolicy",
                false
              ),





              ShapeMember.new(
                "IgnorePublicAcls",
                "Setting",
                nil,
                "IgnorePublicAcls",
                false
              ),





              ShapeMember.new(
                "RestrictPublicBuckets",
                "Setting",
                nil,
                "RestrictPublicBuckets",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketAbacRequest" => Shape.new(
            "PutBucketAbacRequest",
            "structure",
            [





              ShapeMember.new(
                "AbacStatus",
                "AbacStatus",
                nil,
                "AbacStatus",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketAccelerateConfigurationRequest" => Shape.new(
            "PutBucketAccelerateConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccelerateConfiguration",
                "AccelerateConfiguration",
                nil,
                "AccelerateConfiguration",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketAclRequest" => Shape.new(
            "PutBucketAclRequest",
            "structure",
            [





              ShapeMember.new(
                "ACL",
                "BucketCannedACL",
                "header",
                "x-amz-acl",
                false
              ),





              ShapeMember.new(
                "AccessControlPolicy",
                "AccessControlPolicy",
                nil,
                "AccessControlPolicy",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "GrantFullControl",
                "GrantFullControl",
                "header",
                "x-amz-grant-full-control",
                false
              ),





              ShapeMember.new(
                "GrantRead",
                "GrantRead",
                "header",
                "x-amz-grant-read",
                false
              ),





              ShapeMember.new(
                "GrantReadACP",
                "GrantReadACP",
                "header",
                "x-amz-grant-read-acp",
                false
              ),





              ShapeMember.new(
                "GrantWrite",
                "GrantWrite",
                "header",
                "x-amz-grant-write",
                false
              ),





              ShapeMember.new(
                "GrantWriteACP",
                "GrantWriteACP",
                "header",
                "x-amz-grant-write-acp",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketAnalyticsConfigurationRequest" => Shape.new(
            "PutBucketAnalyticsConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "AnalyticsConfiguration",
                "AnalyticsConfiguration",
                nil,
                "AnalyticsConfiguration",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "AnalyticsId",
                "querystring",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketCorsRequest" => Shape.new(
            "PutBucketCorsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "CORSConfiguration",
                "CORSConfiguration",
                nil,
                "CORSConfiguration",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketEncryptionRequest" => Shape.new(
            "PutBucketEncryptionRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryptionConfiguration",
                "ServerSideEncryptionConfiguration",
                nil,
                "ServerSideEncryptionConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketIntelligentTieringConfigurationRequest" => Shape.new(
            "PutBucketIntelligentTieringConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "IntelligentTieringId",
                "querystring",
                "id",
                false
              ),





              ShapeMember.new(
                "IntelligentTieringConfiguration",
                "IntelligentTieringConfiguration",
                nil,
                "IntelligentTieringConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketInventoryConfigurationRequest" => Shape.new(
            "PutBucketInventoryConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "InventoryId",
                "querystring",
                "id",
                false
              ),





              ShapeMember.new(
                "InventoryConfiguration",
                "InventoryConfiguration",
                nil,
                "InventoryConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketLifecycleConfigurationOutput" => Shape.new(
            "PutBucketLifecycleConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "TransitionDefaultMinimumObjectSize",
                "TransitionDefaultMinimumObjectSize",
                "header",
                "x-amz-transition-default-minimum-object-size",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketLifecycleConfigurationRequest" => Shape.new(
            "PutBucketLifecycleConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "LifecycleConfiguration",
                "BucketLifecycleConfiguration",
                nil,
                "LifecycleConfiguration",
                false
              ),





              ShapeMember.new(
                "TransitionDefaultMinimumObjectSize",
                "TransitionDefaultMinimumObjectSize",
                "header",
                "x-amz-transition-default-minimum-object-size",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketLifecycleRequest" => Shape.new(
            "PutBucketLifecycleRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "LifecycleConfiguration",
                "LifecycleConfiguration",
                nil,
                "LifecycleConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketLoggingRequest" => Shape.new(
            "PutBucketLoggingRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "BucketLoggingStatus",
                "BucketLoggingStatus",
                nil,
                "BucketLoggingStatus",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketMetricsConfigurationRequest" => Shape.new(
            "PutBucketMetricsConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Id",
                "MetricsId",
                "querystring",
                "id",
                false
              ),





              ShapeMember.new(
                "MetricsConfiguration",
                "MetricsConfiguration",
                nil,
                "MetricsConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketNotificationConfigurationRequest" => Shape.new(
            "PutBucketNotificationConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "NotificationConfiguration",
                "NotificationConfiguration",
                nil,
                "NotificationConfiguration",
                false
              ),





              ShapeMember.new(
                "SkipDestinationValidation",
                "SkipValidation",
                "header",
                "x-amz-skip-destination-validation",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketNotificationRequest" => Shape.new(
            "PutBucketNotificationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "NotificationConfiguration",
                "NotificationConfigurationDeprecated",
                nil,
                "NotificationConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketOwnershipControlsRequest" => Shape.new(
            "PutBucketOwnershipControlsRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "OwnershipControls",
                "OwnershipControls",
                nil,
                "OwnershipControls",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketPolicyRequest" => Shape.new(
            "PutBucketPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ConfirmRemoveSelfBucketAccess",
                "ConfirmRemoveSelfBucketAccess",
                "header",
                "x-amz-confirm-remove-self-bucket-access",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Policy",
                "Policy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketReplicationRequest" => Shape.new(
            "PutBucketReplicationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "ReplicationConfiguration",
                "ReplicationConfiguration",
                nil,
                "ReplicationConfiguration",
                false
              ),





              ShapeMember.new(
                "Token",
                "ObjectLockToken",
                "header",
                "x-amz-bucket-object-lock-token",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketRequestPaymentRequest" => Shape.new(
            "PutBucketRequestPaymentRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "RequestPaymentConfiguration",
                "RequestPaymentConfiguration",
                nil,
                "RequestPaymentConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketTaggingRequest" => Shape.new(
            "PutBucketTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Tagging",
                "Tagging",
                nil,
                "Tagging",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketVersioningRequest" => Shape.new(
            "PutBucketVersioningRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "MFA",
                "MFA",
                "header",
                "x-amz-mfa",
                false
              ),





              ShapeMember.new(
                "VersioningConfiguration",
                "VersioningConfiguration",
                nil,
                "VersioningConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketWebsiteRequest" => Shape.new(
            "PutBucketWebsiteRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "WebsiteConfiguration",
                "WebsiteConfiguration",
                nil,
                "WebsiteConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectAclOutput" => Shape.new(
            "PutObjectAclOutput",
            "structure",
            [





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectAclRequest" => Shape.new(
            "PutObjectAclRequest",
            "structure",
            [





              ShapeMember.new(
                "ACL",
                "ObjectCannedACL",
                "header",
                "x-amz-acl",
                false
              ),





              ShapeMember.new(
                "AccessControlPolicy",
                "AccessControlPolicy",
                nil,
                "AccessControlPolicy",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "GrantFullControl",
                "GrantFullControl",
                "header",
                "x-amz-grant-full-control",
                false
              ),





              ShapeMember.new(
                "GrantRead",
                "GrantRead",
                "header",
                "x-amz-grant-read",
                false
              ),





              ShapeMember.new(
                "GrantReadACP",
                "GrantReadACP",
                "header",
                "x-amz-grant-read-acp",
                false
              ),





              ShapeMember.new(
                "GrantWrite",
                "GrantWrite",
                "header",
                "x-amz-grant-write",
                false
              ),





              ShapeMember.new(
                "GrantWriteACP",
                "GrantWriteACP",
                "header",
                "x-amz-grant-write-acp",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectLegalHoldOutput" => Shape.new(
            "PutObjectLegalHoldOutput",
            "structure",
            [





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectLegalHoldRequest" => Shape.new(
            "PutObjectLegalHoldRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "LegalHold",
                "ObjectLockLegalHold",
                nil,
                "LegalHold",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectLockConfigurationOutput" => Shape.new(
            "PutObjectLockConfigurationOutput",
            "structure",
            [





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectLockConfigurationRequest" => Shape.new(
            "PutObjectLockConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "ObjectLockConfiguration",
                "ObjectLockConfiguration",
                nil,
                "ObjectLockConfiguration",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "Token",
                "ObjectLockToken",
                "header",
                "x-amz-bucket-object-lock-token",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectOutput" => Shape.new(
            "PutObjectOutput",
            "structure",
            [





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                "header",
                "x-amz-checksum-crc32",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                "header",
                "x-amz-checksum-crc32c",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                "header",
                "x-amz-checksum-crc64nvme",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                "header",
                "x-amz-checksum-sha1",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                "header",
                "x-amz-checksum-sha256",
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ChecksumType",
                "header",
                "x-amz-checksum-type",
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "Expiration",
                "Expiration",
                "header",
                "x-amz-expiration",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSEncryptionContext",
                "SSEKMSEncryptionContext",
                "header",
                "x-amz-server-side-encryption-context",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "Size",
                "Size",
                "header",
                "x-amz-object-size",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectRequest" => Shape.new(
            "PutObjectRequest",
            "structure",
            [





              ShapeMember.new(
                "ACL",
                "ObjectCannedACL",
                "header",
                "x-amz-acl",
                false
              ),





              ShapeMember.new(
                "Body",
                "Body",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "CacheControl",
                "CacheControl",
                "header",
                "Cache-Control",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                "header",
                "x-amz-checksum-crc32",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                "header",
                "x-amz-checksum-crc32c",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                "header",
                "x-amz-checksum-crc64nvme",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                "header",
                "x-amz-checksum-sha1",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                "header",
                "x-amz-checksum-sha256",
                false
              ),





              ShapeMember.new(
                "ContentDisposition",
                "ContentDisposition",
                "header",
                "Content-Disposition",
                false
              ),





              ShapeMember.new(
                "ContentEncoding",
                "ContentEncoding",
                "header",
                "Content-Encoding",
                false
              ),





              ShapeMember.new(
                "ContentLanguage",
                "ContentLanguage",
                "header",
                "Content-Language",
                false
              ),





              ShapeMember.new(
                "ContentLength",
                "ContentLength",
                "header",
                "Content-Length",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ContentType",
                "ContentType",
                "header",
                "Content-Type",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Expires",
                "Expires",
                "header",
                "Expires",
                false
              ),





              ShapeMember.new(
                "GrantFullControl",
                "GrantFullControl",
                "header",
                "x-amz-grant-full-control",
                false
              ),





              ShapeMember.new(
                "GrantRead",
                "GrantRead",
                "header",
                "x-amz-grant-read",
                false
              ),





              ShapeMember.new(
                "GrantReadACP",
                "GrantReadACP",
                "header",
                "x-amz-grant-read-acp",
                false
              ),





              ShapeMember.new(
                "GrantWriteACP",
                "GrantWriteACP",
                "header",
                "x-amz-grant-write-acp",
                false
              ),





              ShapeMember.new(
                "IfMatch",
                "IfMatch",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "IfNoneMatch",
                "IfNoneMatch",
                "header",
                "If-None-Match",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "Metadata",
                "Metadata",
                "headers",
                "x-amz-meta-",
                false
              ),





              ShapeMember.new(
                "ObjectLockLegalHoldStatus",
                "ObjectLockLegalHoldStatus",
                "header",
                "x-amz-object-lock-legal-hold",
                false
              ),





              ShapeMember.new(
                "ObjectLockMode",
                "ObjectLockMode",
                "header",
                "x-amz-object-lock-mode",
                false
              ),





              ShapeMember.new(
                "ObjectLockRetainUntilDate",
                "ObjectLockRetainUntilDate",
                "header",
                "x-amz-object-lock-retain-until-date",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSEncryptionContext",
                "SSEKMSEncryptionContext",
                "header",
                "x-amz-server-side-encryption-context",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                "header",
                "x-amz-storage-class",
                false
              ),





              ShapeMember.new(
                "Tagging",
                "TaggingHeader",
                "header",
                "x-amz-tagging",
                false
              ),





              ShapeMember.new(
                "WebsiteRedirectLocation",
                "WebsiteRedirectLocation",
                "header",
                "x-amz-website-redirect-location",
                false
              ),





              ShapeMember.new(
                "WriteOffsetBytes",
                "WriteOffsetBytes",
                "header",
                "x-amz-write-offset-bytes",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectRetentionOutput" => Shape.new(
            "PutObjectRetentionOutput",
            "structure",
            [





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectRetentionRequest" => Shape.new(
            "PutObjectRetentionRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "BypassGovernanceRetention",
                "BypassGovernanceRetention",
                "header",
                "x-amz-bypass-governance-retention",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "Retention",
                "ObjectLockRetention",
                nil,
                "Retention",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectTaggingOutput" => Shape.new(
            "PutObjectTaggingOutput",
            "structure",
            [





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-version-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutObjectTaggingRequest" => Shape.new(
            "PutObjectTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "Tagging",
                "Tagging",
                nil,
                "Tagging",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutPublicAccessBlockRequest" => Shape.new(
            "PutPublicAccessBlockRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "PublicAccessBlockConfiguration",
                "PublicAccessBlockConfiguration",
                nil,
                "PublicAccessBlockConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "QueueArn" => Shape.new(
            "QueueArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "QueueConfiguration" => Shape.new(
            "QueueConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Events",
                "EventList",
                nil,
                "Event",
                false
              ),





              ShapeMember.new(
                "Filter",
                "NotificationConfigurationFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "NotificationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "QueueArn",
                "QueueArn",
                nil,
                "Queue",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "QueueConfigurationDeprecated" => Shape.new(
            "QueueConfigurationDeprecated",
            "structure",
            [





              ShapeMember.new(
                "Event",
                "Event",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Events",
                "EventList",
                nil,
                "Event",
                false
              ),





              ShapeMember.new(
                "Id",
                "NotificationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Queue",
                "QueueArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "QueueConfigurationList" => Shape.new(
            "QueueConfigurationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "QueueConfiguration",
              nil,
              nil,
              false
            ),
            true
          ),





          "Quiet" => Shape.new(
            "Quiet",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "QuoteCharacter" => Shape.new(
            "QuoteCharacter",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "QuoteEscapeCharacter" => Shape.new(
            "QuoteEscapeCharacter",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "QuoteFields" => Shape.new(
            "QuoteFields",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Range" => Shape.new(
            "Range",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RecordDelimiter" => Shape.new(
            "RecordDelimiter",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RecordExpiration" => Shape.new(
            "RecordExpiration",
            "structure",
            [





              ShapeMember.new(
                "Days",
                "RecordExpirationDays",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Expiration",
                "ExpirationState",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RecordExpirationDays" => Shape.new(
            "RecordExpirationDays",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "RecordsEvent" => Shape.new(
            "RecordsEvent",
            "structure",
            [





              ShapeMember.new(
                "Payload",
                "Body",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Redirect" => Shape.new(
            "Redirect",
            "structure",
            [





              ShapeMember.new(
                "HostName",
                "HostName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HttpRedirectCode",
                "HttpRedirectCode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Protocol",
                "Protocol",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ReplaceKeyPrefixWith",
                "ReplaceKeyPrefixWith",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ReplaceKeyWith",
                "ReplaceKeyWith",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RedirectAllRequestsTo" => Shape.new(
            "RedirectAllRequestsTo",
            "structure",
            [





              ShapeMember.new(
                "HostName",
                "HostName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Protocol",
                "Protocol",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Region" => Shape.new(
            "Region",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RenameObjectOutput" => Shape.new(
            "RenameObjectOutput",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "RenameObjectRequest" => Shape.new(
            "RenameObjectRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ClientToken",
                "ClientToken",
                "header",
                "x-amz-client-token",
                false
              ),





              ShapeMember.new(
                "DestinationIfMatch",
                "IfMatch",
                "header",
                "If-Match",
                false
              ),





              ShapeMember.new(
                "DestinationIfModifiedSince",
                "IfModifiedSince",
                "header",
                "If-Modified-Since",
                false
              ),





              ShapeMember.new(
                "DestinationIfNoneMatch",
                "IfNoneMatch",
                "header",
                "If-None-Match",
                false
              ),





              ShapeMember.new(
                "DestinationIfUnmodifiedSince",
                "IfUnmodifiedSince",
                "header",
                "If-Unmodified-Since",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RenameSource",
                "RenameSource",
                "header",
                "x-amz-rename-source",
                false
              ),





              ShapeMember.new(
                "SourceIfMatch",
                "RenameSourceIfMatch",
                "header",
                "x-amz-rename-source-if-match",
                false
              ),





              ShapeMember.new(
                "SourceIfModifiedSince",
                "RenameSourceIfModifiedSince",
                "header",
                "x-amz-rename-source-if-modified-since",
                false
              ),





              ShapeMember.new(
                "SourceIfNoneMatch",
                "RenameSourceIfNoneMatch",
                "header",
                "x-amz-rename-source-if-none-match",
                false
              ),





              ShapeMember.new(
                "SourceIfUnmodifiedSince",
                "RenameSourceIfUnmodifiedSince",
                "header",
                "x-amz-rename-source-if-unmodified-since",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RenameSource" => Shape.new(
            "RenameSource",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RenameSourceIfMatch" => Shape.new(
            "RenameSourceIfMatch",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RenameSourceIfModifiedSince" => Shape.new(
            "RenameSourceIfModifiedSince",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "RenameSourceIfNoneMatch" => Shape.new(
            "RenameSourceIfNoneMatch",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RenameSourceIfUnmodifiedSince" => Shape.new(
            "RenameSourceIfUnmodifiedSince",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplaceKeyPrefixWith" => Shape.new(
            "ReplaceKeyPrefixWith",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplaceKeyWith" => Shape.new(
            "ReplaceKeyWith",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplicaKmsKeyID" => Shape.new(
            "ReplicaKmsKeyID",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplicaModifications" => Shape.new(
            "ReplicaModifications",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "ReplicaModificationsStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicaModificationsStatus" => Shape.new(
            "ReplicaModificationsStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplicationConfiguration" => Shape.new(
            "ReplicationConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Role",
                "Role",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Rules",
                "ReplicationRules",
                nil,
                "Rule",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationRule" => Shape.new(
            "ReplicationRule",
            "structure",
            [





              ShapeMember.new(
                "DeleteMarkerReplication",
                "DeleteMarkerReplication",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Destination",
                "Destination",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExistingObjectReplication",
                "ExistingObjectReplication",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Filter",
                "ReplicationRuleFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ID",
                "ID",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Priority",
                "Priority",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SourceSelectionCriteria",
                "SourceSelectionCriteria",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "ReplicationRuleStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationRuleAndOperator" => Shape.new(
            "ReplicationRuleAndOperator",
            "structure",
            [





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagSet",
                nil,
                "Tag",
                true
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationRuleFilter" => Shape.new(
            "ReplicationRuleFilter",
            "structure",
            [





              ShapeMember.new(
                "And",
                "ReplicationRuleAndOperator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tag",
                "Tag",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationRuleStatus" => Shape.new(
            "ReplicationRuleStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ReplicationRules" => Shape.new(
            "ReplicationRules",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ReplicationRule",
              nil,
              nil,
              false
            ),
            true
          ),





          "ReplicationStatus" => Shape.new(
            "ReplicationStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplicationTime" => Shape.new(
            "ReplicationTime",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "ReplicationTimeStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Time",
                "ReplicationTimeValue",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationTimeStatus" => Shape.new(
            "ReplicationTimeStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplicationTimeValue" => Shape.new(
            "ReplicationTimeValue",
            "structure",
            [





              ShapeMember.new(
                "Minutes",
                "Minutes",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RequestCharged" => Shape.new(
            "RequestCharged",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RequestPayer" => Shape.new(
            "RequestPayer",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RequestPaymentConfiguration" => Shape.new(
            "RequestPaymentConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Payer",
                "Payer",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RequestProgress" => Shape.new(
            "RequestProgress",
            "structure",
            [





              ShapeMember.new(
                "Enabled",
                "EnableRequestProgress",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RequestRoute" => Shape.new(
            "RequestRoute",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RequestToken" => Shape.new(
            "RequestToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ResponseCacheControl" => Shape.new(
            "ResponseCacheControl",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ResponseContentDisposition" => Shape.new(
            "ResponseContentDisposition",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ResponseContentEncoding" => Shape.new(
            "ResponseContentEncoding",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ResponseContentLanguage" => Shape.new(
            "ResponseContentLanguage",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ResponseContentType" => Shape.new(
            "ResponseContentType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ResponseExpires" => Shape.new(
            "ResponseExpires",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "Restore" => Shape.new(
            "Restore",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RestoreExpiryDate" => Shape.new(
            "RestoreExpiryDate",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "RestoreObjectOutput" => Shape.new(
            "RestoreObjectOutput",
            "structure",
            [





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "RestoreOutputPath",
                "RestoreOutputPath",
                "header",
                "x-amz-restore-output-path",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RestoreObjectRequest" => Shape.new(
            "RestoreObjectRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "RestoreRequest",
                "RestoreRequest",
                nil,
                "RestoreRequest",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "querystring",
                "versionId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RestoreOutputPath" => Shape.new(
            "RestoreOutputPath",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RestoreRequest" => Shape.new(
            "RestoreRequest",
            "structure",
            [





              ShapeMember.new(
                "Days",
                "Days",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Description",
                "Description",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GlacierJobParameters",
                "GlacierJobParameters",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OutputLocation",
                "OutputLocation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SelectParameters",
                "SelectParameters",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tier",
                "Tier",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Type",
                "RestoreRequestType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "RestoreRequestType" => Shape.new(
            "RestoreRequestType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RestoreStatus" => Shape.new(
            "RestoreStatus",
            "structure",
            [





              ShapeMember.new(
                "IsRestoreInProgress",
                "IsRestoreInProgress",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RestoreExpiryDate",
                "RestoreExpiryDate",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Role" => Shape.new(
            "Role",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RoutingRule" => Shape.new(
            "RoutingRule",
            "structure",
            [





              ShapeMember.new(
                "Condition",
                "Condition",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Redirect",
                "Redirect",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "RoutingRules" => Shape.new(
            "RoutingRules",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "RoutingRule",
              nil,
              "RoutingRule",
              false
            ),
            false
          ),





          "Rule" => Shape.new(
            "Rule",
            "structure",
            [





              ShapeMember.new(
                "AbortIncompleteMultipartUpload",
                "AbortIncompleteMultipartUpload",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Expiration",
                "LifecycleExpiration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ID",
                "ID",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NoncurrentVersionExpiration",
                "NoncurrentVersionExpiration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NoncurrentVersionTransition",
                "NoncurrentVersionTransition",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "ExpirationStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Transition",
                "Transition",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "Rules" => Shape.new(
            "Rules",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Rule",
              nil,
              nil,
              false
            ),
            true
          ),





          "S3KeyFilter" => Shape.new(
            "S3KeyFilter",
            "structure",
            [





              ShapeMember.new(
                "FilterRules",
                "FilterRuleList",
                nil,
                "FilterRule",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3Location" => Shape.new(
            "S3Location",
            "structure",
            [





              ShapeMember.new(
                "AccessControlList",
                "Grants",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketName",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CannedACL",
                "ObjectCannedACL",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Encryption",
                "Encryption",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "LocationPrefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tagging",
                "Tagging",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "UserMetadata",
                "UserMetadata",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3RegionalOrS3ExpressBucketArnString" => Shape.new(
            "S3RegionalOrS3ExpressBucketArnString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3TablesArn" => Shape.new(
            "S3TablesArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3TablesBucketArn" => Shape.new(
            "S3TablesBucketArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3TablesBucketType" => Shape.new(
            "S3TablesBucketType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3TablesDestination" => Shape.new(
            "S3TablesDestination",
            "structure",
            [





              ShapeMember.new(
                "TableBucketArn",
                "S3TablesBucketArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableName",
                "S3TablesName",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3TablesDestinationResult" => Shape.new(
            "S3TablesDestinationResult",
            "structure",
            [





              ShapeMember.new(
                "TableArn",
                "S3TablesArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableBucketArn",
                "S3TablesBucketArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableName",
                "S3TablesName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TableNamespace",
                "S3TablesNamespace",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3TablesName" => Shape.new(
            "S3TablesName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3TablesNamespace" => Shape.new(
            "S3TablesNamespace",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SSECustomerAlgorithm" => Shape.new(
            "SSECustomerAlgorithm",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SSECustomerKey" => Shape.new(
            "SSECustomerKey",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SSECustomerKeyMD5" => Shape.new(
            "SSECustomerKeyMD5",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SSEKMS" => Shape.new(
            "SSEKMS",
            "structure",
            [





              ShapeMember.new(
                "KeyId",
                "SSEKMSKeyId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SSEKMSEncryptionContext" => Shape.new(
            "SSEKMSEncryptionContext",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SSEKMSKeyId" => Shape.new(
            "SSEKMSKeyId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SSES3" => Shape.new(
            "SSES3",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "ScanRange" => Shape.new(
            "ScanRange",
            "structure",
            [





              ShapeMember.new(
                "End",
                "End",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Start",
                "Start",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SelectObjectContentEventStream" => Shape.new(
            "SelectObjectContentEventStream",
            "structure",
            [





              ShapeMember.new(
                "Cont",
                "ContinuationEvent",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "End",
                "EndEvent",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Progress",
                "ProgressEvent",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Records",
                "RecordsEvent",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Stats",
                "StatsEvent",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SelectObjectContentOutput" => Shape.new(
            "SelectObjectContentOutput",
            "structure",
            [





              ShapeMember.new(
                "Payload",
                "SelectObjectContentEventStream",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SelectObjectContentRequest" => Shape.new(
            "SelectObjectContentRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Expression",
                "Expression",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExpressionType",
                "ExpressionType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "InputSerialization",
                "InputSerialization",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "OutputSerialization",
                "OutputSerialization",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestProgress",
                "RequestProgress",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "ScanRange",
                "ScanRange",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SelectParameters" => Shape.new(
            "SelectParameters",
            "structure",
            [





              ShapeMember.new(
                "Expression",
                "Expression",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExpressionType",
                "ExpressionType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "InputSerialization",
                "InputSerialization",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OutputSerialization",
                "OutputSerialization",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ServerSideEncryption" => Shape.new(
            "ServerSideEncryption",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ServerSideEncryptionByDefault" => Shape.new(
            "ServerSideEncryptionByDefault",
            "structure",
            [





              ShapeMember.new(
                "KMSMasterKeyID",
                "SSEKMSKeyId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SSEAlgorithm",
                "ServerSideEncryption",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ServerSideEncryptionConfiguration" => Shape.new(
            "ServerSideEncryptionConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Rules",
                "ServerSideEncryptionRules",
                nil,
                "Rule",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ServerSideEncryptionRule" => Shape.new(
            "ServerSideEncryptionRule",
            "structure",
            [





              ShapeMember.new(
                "ApplyServerSideEncryptionByDefault",
                "ServerSideEncryptionByDefault",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BlockedEncryptionTypes",
                "BlockedEncryptionTypes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ServerSideEncryptionRules" => Shape.new(
            "ServerSideEncryptionRules",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ServerSideEncryptionRule",
              nil,
              nil,
              false
            ),
            true
          ),





          "SessionCredentialValue" => Shape.new(
            "SessionCredentialValue",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SessionCredentials" => Shape.new(
            "SessionCredentials",
            "structure",
            [





              ShapeMember.new(
                "AccessKeyId",
                "AccessKeyIdValue",
                nil,
                "AccessKeyId",
                false
              ),





              ShapeMember.new(
                "Expiration",
                "SessionExpiration",
                nil,
                "Expiration",
                false
              ),





              ShapeMember.new(
                "SecretAccessKey",
                "SessionCredentialValue",
                nil,
                "SecretAccessKey",
                false
              ),





              ShapeMember.new(
                "SessionToken",
                "SessionCredentialValue",
                nil,
                "SessionToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SessionExpiration" => Shape.new(
            "SessionExpiration",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "SessionMode" => Shape.new(
            "SessionMode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Setting" => Shape.new(
            "Setting",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "SimplePrefix" => Shape.new(
            "SimplePrefix",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "Size" => Shape.new(
            "Size",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "SkipValidation" => Shape.new(
            "SkipValidation",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "SourceSelectionCriteria" => Shape.new(
            "SourceSelectionCriteria",
            "structure",
            [





              ShapeMember.new(
                "ReplicaModifications",
                "ReplicaModifications",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SseKmsEncryptedObjects",
                "SseKmsEncryptedObjects",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SseKmsEncryptedObjects" => Shape.new(
            "SseKmsEncryptedObjects",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "SseKmsEncryptedObjectsStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SseKmsEncryptedObjectsStatus" => Shape.new(
            "SseKmsEncryptedObjectsStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Start" => Shape.new(
            "Start",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "StartAfter" => Shape.new(
            "StartAfter",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Stats" => Shape.new(
            "Stats",
            "structure",
            [





              ShapeMember.new(
                "BytesProcessed",
                "BytesProcessed",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BytesReturned",
                "BytesReturned",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BytesScanned",
                "BytesScanned",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StatsEvent" => Shape.new(
            "StatsEvent",
            "structure",
            [





              ShapeMember.new(
                "Details",
                "Stats",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageClass" => Shape.new(
            "StorageClass",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "StorageClassAnalysis" => Shape.new(
            "StorageClassAnalysis",
            "structure",
            [





              ShapeMember.new(
                "DataExport",
                "StorageClassAnalysisDataExport",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageClassAnalysisDataExport" => Shape.new(
            "StorageClassAnalysisDataExport",
            "structure",
            [





              ShapeMember.new(
                "Destination",
                "AnalyticsExportDestination",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OutputSchemaVersion",
                "StorageClassAnalysisSchemaVersion",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageClassAnalysisSchemaVersion" => Shape.new(
            "StorageClassAnalysisSchemaVersion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Suffix" => Shape.new(
            "Suffix",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "TableSseAlgorithm" => Shape.new(
            "TableSseAlgorithm",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Tag" => Shape.new(
            "Tag",
            "structure",
            [





              ShapeMember.new(
                "Key",
                "ObjectKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "Value",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TagCount" => Shape.new(
            "TagCount",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),








          "TagSet" => Shape.new(
            "TagSet",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Tag",
              nil,
              "Tag",
              false
            ),
            false
          ),





          "Tagging" => Shape.new(
            "Tagging",
            "structure",
            [





              ShapeMember.new(
                "TagSet",
                "TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TaggingDirective" => Shape.new(
            "TaggingDirective",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "TaggingHeader" => Shape.new(
            "TaggingHeader",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "TargetBucket" => Shape.new(
            "TargetBucket",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "TargetGrant" => Shape.new(
            "TargetGrant",
            "structure",
            [





              ShapeMember.new(
                "Grantee",
                "Grantee",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Permission",
                "BucketLogsPermission",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "TargetGrants" => Shape.new(
            "TargetGrants",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "TargetGrant",
              nil,
              "Grant",
              false
            ),
            false
          ),





          "TargetObjectKeyFormat" => Shape.new(
            "TargetObjectKeyFormat",
            "structure",
            [





              ShapeMember.new(
                "PartitionedPrefix",
                "PartitionedPrefix",
                nil,
                "PartitionedPrefix",
                false
              ),





              ShapeMember.new(
                "SimplePrefix",
                "SimplePrefix",
                nil,
                "SimplePrefix",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TargetPrefix" => Shape.new(
            "TargetPrefix",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Tier" => Shape.new(
            "Tier",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Tiering" => Shape.new(
            "Tiering",
            "structure",
            [





              ShapeMember.new(
                "AccessTier",
                "IntelligentTieringAccessTier",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Days",
                "IntelligentTieringDays",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "TieringList" => Shape.new(
            "TieringList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Tiering",
              nil,
              nil,
              false
            ),
            true
          ),





          "Token" => Shape.new(
            "Token",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "TooManyParts" => Shape.new(
            "TooManyParts",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "TopicArn" => Shape.new(
            "TopicArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "TopicConfiguration" => Shape.new(
            "TopicConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Events",
                "EventList",
                nil,
                "Event",
                false
              ),





              ShapeMember.new(
                "Filter",
                "NotificationConfigurationFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "NotificationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TopicArn",
                "TopicArn",
                nil,
                "Topic",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TopicConfigurationDeprecated" => Shape.new(
            "TopicConfigurationDeprecated",
            "structure",
            [





              ShapeMember.new(
                "Event",
                "Event",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Events",
                "EventList",
                nil,
                "Event",
                false
              ),





              ShapeMember.new(
                "Id",
                "NotificationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Topic",
                "TopicArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "TopicConfigurationList" => Shape.new(
            "TopicConfigurationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "TopicConfiguration",
              nil,
              nil,
              false
            ),
            true
          ),





          "Transition" => Shape.new(
            "Transition",
            "structure",
            [





              ShapeMember.new(
                "Date",
                "Date",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Days",
                "Days",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "TransitionStorageClass",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TransitionDefaultMinimumObjectSize" => Shape.new(
            "TransitionDefaultMinimumObjectSize",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "TransitionList" => Shape.new(
            "TransitionList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Transition",
              nil,
              nil,
              false
            ),
            true
          ),





          "TransitionStorageClass" => Shape.new(
            "TransitionStorageClass",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Type" => Shape.new(
            "Type",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "URI" => Shape.new(
            "URI",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "UpdateBucketMetadataInventoryTableConfigurationRequest" => Shape.new(
            "UpdateBucketMetadataInventoryTableConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "InventoryTableConfiguration",
                "InventoryTableConfigurationUpdates",
                nil,
                "InventoryTableConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateBucketMetadataJournalTableConfigurationRequest" => Shape.new(
            "UpdateBucketMetadataJournalTableConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "JournalTableConfiguration",
                "JournalTableConfigurationUpdates",
                nil,
                "JournalTableConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UploadIdMarker" => Shape.new(
            "UploadIdMarker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "UploadPartCopyOutput" => Shape.new(
            "UploadPartCopyOutput",
            "structure",
            [





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "CopyPartResult",
                "CopyPartResult",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CopySourceVersionId",
                "CopySourceVersionId",
                "header",
                "x-amz-copy-source-version-id",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UploadPartCopyRequest" => Shape.new(
            "UploadPartCopyRequest",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "CopySource",
                "CopySource",
                "header",
                "x-amz-copy-source",
                false
              ),





              ShapeMember.new(
                "CopySourceIfMatch",
                "CopySourceIfMatch",
                "header",
                "x-amz-copy-source-if-match",
                false
              ),





              ShapeMember.new(
                "CopySourceIfModifiedSince",
                "CopySourceIfModifiedSince",
                "header",
                "x-amz-copy-source-if-modified-since",
                false
              ),





              ShapeMember.new(
                "CopySourceIfNoneMatch",
                "CopySourceIfNoneMatch",
                "header",
                "x-amz-copy-source-if-none-match",
                false
              ),





              ShapeMember.new(
                "CopySourceIfUnmodifiedSince",
                "CopySourceIfUnmodifiedSince",
                "header",
                "x-amz-copy-source-if-unmodified-since",
                false
              ),





              ShapeMember.new(
                "CopySourceRange",
                "CopySourceRange",
                "header",
                "x-amz-copy-source-range",
                false
              ),





              ShapeMember.new(
                "CopySourceSSECustomerAlgorithm",
                "CopySourceSSECustomerAlgorithm",
                "header",
                "x-amz-copy-source-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "CopySourceSSECustomerKey",
                "CopySourceSSECustomerKey",
                "header",
                "x-amz-copy-source-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "CopySourceSSECustomerKeyMD5",
                "CopySourceSSECustomerKeyMD5",
                "header",
                "x-amz-copy-source-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "ExpectedSourceBucketOwner",
                "AccountId",
                "header",
                "x-amz-source-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "PartNumber",
                "PartNumber",
                "querystring",
                "partNumber",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "UploadId",
                "MultipartUploadId",
                "querystring",
                "uploadId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UploadPartOutput" => Shape.new(
            "UploadPartOutput",
            "structure",
            [





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                "header",
                "x-amz-checksum-crc32",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                "header",
                "x-amz-checksum-crc32c",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                "header",
                "x-amz-checksum-crc64nvme",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                "header",
                "x-amz-checksum-sha1",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                "header",
                "x-amz-checksum-sha256",
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                "header",
                "ETag",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-server-side-encryption",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UploadPartRequest" => Shape.new(
            "UploadPartRequest",
            "structure",
            [





              ShapeMember.new(
                "Body",
                "Body",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "Bucket",
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ChecksumAlgorithm",
                "header",
                "x-amz-sdk-checksum-algorithm",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                "header",
                "x-amz-checksum-crc32",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                "header",
                "x-amz-checksum-crc32c",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                "header",
                "x-amz-checksum-crc64nvme",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                "header",
                "x-amz-checksum-sha1",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                "header",
                "x-amz-checksum-sha256",
                false
              ),





              ShapeMember.new(
                "ContentLength",
                "ContentLength",
                "header",
                "Content-Length",
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "ContentMD5",
                "header",
                "Content-MD5",
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                "header",
                "x-amz-expected-bucket-owner",
                false
              ),





              ShapeMember.new(
                "Key",
                "ObjectKey",
                "uri",
                "Key",
                false
              ),





              ShapeMember.new(
                "PartNumber",
                "PartNumber",
                "querystring",
                "partNumber",
                false
              ),





              ShapeMember.new(
                "RequestPayer",
                "RequestPayer",
                "header",
                "x-amz-request-payer",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKey",
                "SSECustomerKey",
                "header",
                "x-amz-server-side-encryption-customer-key",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "UploadId",
                "MultipartUploadId",
                "querystring",
                "uploadId",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "UserMetadata" => Shape.new(
            "UserMetadata",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "MetadataEntry",
              nil,
              "MetadataEntry",
              false
            ),
            false
          ),





          "Value" => Shape.new(
            "Value",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "VersionCount" => Shape.new(
            "VersionCount",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "VersionIdMarker" => Shape.new(
            "VersionIdMarker",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "VersioningConfiguration" => Shape.new(
            "VersioningConfiguration",
            "structure",
            [





              ShapeMember.new(
                "MFADelete",
                "MFADelete",
                nil,
                "MfaDelete",
                false
              ),





              ShapeMember.new(
                "Status",
                "BucketVersioningStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "WebsiteConfiguration" => Shape.new(
            "WebsiteConfiguration",
            "structure",
            [





              ShapeMember.new(
                "ErrorDocument",
                "ErrorDocument",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IndexDocument",
                "IndexDocument",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RedirectAllRequestsTo",
                "RedirectAllRequestsTo",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RoutingRules",
                "RoutingRules",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "WebsiteRedirectLocation" => Shape.new(
            "WebsiteRedirectLocation",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "WriteGetObjectResponseRequest" => Shape.new(
            "WriteGetObjectResponseRequest",
            "structure",
            [





              ShapeMember.new(
                "AcceptRanges",
                "AcceptRanges",
                "header",
                "x-amz-fwd-header-accept-ranges",
                false
              ),





              ShapeMember.new(
                "Body",
                "Body",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "BucketKeyEnabled",
                "header",
                "x-amz-fwd-header-x-amz-server-side-encryption-bucket-key-enabled",
                false
              ),





              ShapeMember.new(
                "CacheControl",
                "CacheControl",
                "header",
                "x-amz-fwd-header-Cache-Control",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32",
                "ChecksumCRC32",
                "header",
                "x-amz-fwd-header-x-amz-checksum-crc32",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC32C",
                "ChecksumCRC32C",
                "header",
                "x-amz-fwd-header-x-amz-checksum-crc32c",
                false
              ),





              ShapeMember.new(
                "ChecksumCRC64NVME",
                "ChecksumCRC64NVME",
                "header",
                "x-amz-fwd-header-x-amz-checksum-crc64nvme",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA1",
                "ChecksumSHA1",
                "header",
                "x-amz-fwd-header-x-amz-checksum-sha1",
                false
              ),





              ShapeMember.new(
                "ChecksumSHA256",
                "ChecksumSHA256",
                "header",
                "x-amz-fwd-header-x-amz-checksum-sha256",
                false
              ),





              ShapeMember.new(
                "ContentDisposition",
                "ContentDisposition",
                "header",
                "x-amz-fwd-header-Content-Disposition",
                false
              ),





              ShapeMember.new(
                "ContentEncoding",
                "ContentEncoding",
                "header",
                "x-amz-fwd-header-Content-Encoding",
                false
              ),





              ShapeMember.new(
                "ContentLanguage",
                "ContentLanguage",
                "header",
                "x-amz-fwd-header-Content-Language",
                false
              ),





              ShapeMember.new(
                "ContentLength",
                "ContentLength",
                "header",
                "Content-Length",
                false
              ),





              ShapeMember.new(
                "ContentRange",
                "ContentRange",
                "header",
                "x-amz-fwd-header-Content-Range",
                false
              ),





              ShapeMember.new(
                "ContentType",
                "ContentType",
                "header",
                "x-amz-fwd-header-Content-Type",
                false
              ),





              ShapeMember.new(
                "DeleteMarker",
                "DeleteMarker",
                "header",
                "x-amz-fwd-header-x-amz-delete-marker",
                false
              ),





              ShapeMember.new(
                "ETag",
                "ETag",
                "header",
                "x-amz-fwd-header-ETag",
                false
              ),





              ShapeMember.new(
                "ErrorCode",
                "ErrorCode",
                "header",
                "x-amz-fwd-error-code",
                false
              ),





              ShapeMember.new(
                "ErrorMessage",
                "ErrorMessage",
                "header",
                "x-amz-fwd-error-message",
                false
              ),





              ShapeMember.new(
                "Expiration",
                "Expiration",
                "header",
                "x-amz-fwd-header-x-amz-expiration",
                false
              ),





              ShapeMember.new(
                "Expires",
                "Expires",
                "header",
                "x-amz-fwd-header-Expires",
                false
              ),





              ShapeMember.new(
                "LastModified",
                "LastModified",
                "header",
                "x-amz-fwd-header-Last-Modified",
                false
              ),





              ShapeMember.new(
                "Metadata",
                "Metadata",
                "headers",
                "x-amz-meta-",
                false
              ),





              ShapeMember.new(
                "MissingMeta",
                "MissingMeta",
                "header",
                "x-amz-fwd-header-x-amz-missing-meta",
                false
              ),





              ShapeMember.new(
                "ObjectLockLegalHoldStatus",
                "ObjectLockLegalHoldStatus",
                "header",
                "x-amz-fwd-header-x-amz-object-lock-legal-hold",
                false
              ),





              ShapeMember.new(
                "ObjectLockMode",
                "ObjectLockMode",
                "header",
                "x-amz-fwd-header-x-amz-object-lock-mode",
                false
              ),





              ShapeMember.new(
                "ObjectLockRetainUntilDate",
                "ObjectLockRetainUntilDate",
                "header",
                "x-amz-fwd-header-x-amz-object-lock-retain-until-date",
                false
              ),





              ShapeMember.new(
                "PartsCount",
                "PartsCount",
                "header",
                "x-amz-fwd-header-x-amz-mp-parts-count",
                false
              ),





              ShapeMember.new(
                "ReplicationStatus",
                "ReplicationStatus",
                "header",
                "x-amz-fwd-header-x-amz-replication-status",
                false
              ),





              ShapeMember.new(
                "RequestCharged",
                "RequestCharged",
                "header",
                "x-amz-fwd-header-x-amz-request-charged",
                false
              ),





              ShapeMember.new(
                "RequestRoute",
                "RequestRoute",
                "header",
                "x-amz-request-route",
                false
              ),





              ShapeMember.new(
                "RequestToken",
                "RequestToken",
                "header",
                "x-amz-request-token",
                false
              ),





              ShapeMember.new(
                "Restore",
                "Restore",
                "header",
                "x-amz-fwd-header-x-amz-restore",
                false
              ),





              ShapeMember.new(
                "SSECustomerAlgorithm",
                "SSECustomerAlgorithm",
                "header",
                "x-amz-fwd-header-x-amz-server-side-encryption-customer-algorithm",
                false
              ),





              ShapeMember.new(
                "SSECustomerKeyMD5",
                "SSECustomerKeyMD5",
                "header",
                "x-amz-fwd-header-x-amz-server-side-encryption-customer-key-MD5",
                false
              ),





              ShapeMember.new(
                "SSEKMSKeyId",
                "SSEKMSKeyId",
                "header",
                "x-amz-fwd-header-x-amz-server-side-encryption-aws-kms-key-id",
                false
              ),





              ShapeMember.new(
                "ServerSideEncryption",
                "ServerSideEncryption",
                "header",
                "x-amz-fwd-header-x-amz-server-side-encryption",
                false
              ),





              ShapeMember.new(
                "StatusCode",
                "GetObjectResponseStatusCode",
                "header",
                "x-amz-fwd-status",
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "StorageClass",
                "header",
                "x-amz-fwd-header-x-amz-storage-class",
                false
              ),





              ShapeMember.new(
                "TagCount",
                "TagCount",
                "header",
                "x-amz-fwd-header-x-amz-tagging-count",
                false
              ),





              ShapeMember.new(
                "VersionId",
                "ObjectVersionId",
                "header",
                "x-amz-fwd-header-x-amz-version-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "WriteOffsetBytes" => Shape.new(
            "WriteOffsetBytes",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "Years" => Shape.new(
            "Years",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),


        }

        def self.build_request(operation : Model::OperationModel, input, endpoint : String) : AwsSdk::Runtime::Http::Request
          raise ArgumentError.new("endpoint must not be empty") if endpoint.empty?
          payload = input ? JSON.parse(input.to_json).as_h : {} of String => JSON::Any
          input_shape = OPERATION_INPUT_SHAPES[operation.name]?
          raise ArgumentError.new("input shape missing for #{operation.name}") if input && input_shape.nil?
          uri = endpoint.rstrip("/") + operation.request_uri
          uri = apply_uri_labels(uri, input_shape, payload) if input_shape
          params = URI::Params.new
          headers = {"content-type" => CONTENT_TYPE}
          apply_query_params(params, input_shape, payload) if input_shape
          apply_header_params(headers, input_shape, payload) if input_shape
          query = params.to_s
          uri = "#{uri}?#{query}" unless query.empty?
          body = if input_shape
            body_payload = body_payload(input_shape, payload)
            if body_payload.empty?
              nil
            else
              root_name = OPERATION_INPUT_ROOTS[operation.name]? || input_shape
              namespace = OPERATION_INPUT_NAMESPACES[operation.name]?
              build_xml(root_name, input_shape, body_payload, namespace)
            end
          else
            nil
          end
          AwsSdk::Runtime::Http::Request.new(operation.http_method, uri, headers, body)
        end

        def self.parse_error(response : AwsSdk::Runtime::Http::Response) : Exception
          error_type = error_type_from_body(response.body)
          message = error_message_from_body(response.body)
          Errors.build(error_type, message)
        end

        def self.parse_response(response : AwsSdk::Runtime::Http::Response, output_type : T.class, operation_name : String) : T forall T
          payload = {} of String => JSON::Any
          output_shape = OPERATION_OUTPUT_SHAPES[operation_name]?
          if (body = response.body)
            document = XML.parse(body)
            node = result_node(document, operation_name) || document.root
            if node && output_shape
              parsed = parse_node(node, output_shape)
              payload = parsed.as_h? || payload
            end
          end
          apply_header_values(payload, output_shape, response.headers) if output_shape
          output_type.from_json(JSON::Any.new(payload).to_json)
        rescue XML::Error
          output_type.from_json("{}")
        end

        private def self.shape(name : String) : Shape
          SHAPES[name]? || raise ArgumentError.new("shape not found: #{name}")
        end

        private def self.member_key(member : ShapeMember) : String
          member.location_name || member.name
        end

        private def self.apply_uri_labels(uri : String, input_shape : String, payload : Hash(String, JSON::Any)) : String
          result = uri
          labels = uri.scan(/\{([^\}]+)\}/).map { |match| match[1] }
          return result if labels.empty?
          shape = shape(input_shape)
          labels.each do |label|
            member = shape.members.find { |item| item.location == "uri" && member_key(item) == label }
            raise ArgumentError.new("missing uri label #{label}") unless member
            value = payload[member_key(member)]?
            raise ArgumentError.new("missing value for uri label #{label}") unless value
            member_shape = shape(member.shape)
            result = result.gsub("{#{label}}", scalar_text(member_shape.type, value))
          end
          result
        end

        private def self.apply_query_params(params : URI::Params, input_shape : String, payload : Hash(String, JSON::Any)) : Nil
          shape = shape(input_shape)
          shape.members.each do |member|
            next unless member.location == "querystring"
            key = member_key(member)
            value = payload[key]?
            next unless value
            add_param(params, key, value)
          end
        end

        private def self.apply_header_params(headers : Hash(String, String), input_shape : String, payload : Hash(String, JSON::Any)) : Nil
          shape = shape(input_shape)
          shape.members.each do |member|
            next unless member.location == "header"
            key = member_key(member)
            value = payload[key]?
            next unless value
            headers[key] = scalar_text(shape(member.shape).type, value)
          end
        end

        private def self.body_payload(input_shape : String, payload : Hash(String, JSON::Any)) : Hash(String, JSON::Any)
          shape = shape(input_shape)
          return {} of String => JSON::Any unless shape.type == "structure"
          body = {} of String => JSON::Any
          shape.members.each do |member|
            next unless member.location.nil?
            key = member_key(member)
            value = payload[key]?
            next unless value
            next if value.raw.nil?
            body[key] = value
          end
          body
        end

        private def self.build_xml(root_name : String, root_shape : String, payload : Hash(String, JSON::Any), xml_namespace : String?) : String
          XML.build do |xml|
            shape = shape(root_shape)
            if xml_namespace
              xml.element(root_name, {"xmlns" => xml_namespace}) do
                serialize_structure(xml, shape, payload)
              end
            else
              xml.element(root_name) do
                serialize_structure(xml, shape, payload)
              end
            end
          end
        end

        private def self.serialize_structure(xml : XML::Builder, shape : Shape, payload : Hash(String, JSON::Any)) : Nil
          shape.members.each do |member|
            next unless member.location.nil?
            key = member_key(member)
            value = payload[key]?
            next unless value
            serialize_member(xml, member, value)
          end
        end

        private def self.serialize_member(xml : XML::Builder, member : ShapeMember, value : JSON::Any) : Nil
          shape = shape(member.shape)
          element_name = member_key(member)
          case shape.type
          when "structure"
            xml.element(element_name) do
              serialize_structure(xml, shape, value.as_h? || {} of String => JSON::Any)
            end
          when "list"
            serialize_list(xml, element_name, shape, value, member.flattened)
          else
            xml.element(element_name) { xml.text(scalar_text(shape.type, value)) }
          end
        end

        private def self.serialize_list(xml : XML::Builder, element_name : String, shape : Shape, value : JSON::Any, member_flattened : Bool) : Nil
          items = value.as_a? || [] of JSON::Any
          list_member = shape.list_member
          return unless list_member
          member_name = list_member.location_name || "member"
          flattened = shape.flattened || member_flattened
          if flattened
            items.each do |item|
              serialize_value(xml, member_name, list_member.shape, item)
            end
          else
            xml.element(element_name) do
              items.each do |item|
                serialize_value(xml, member_name, list_member.shape, item)
              end
            end
          end
        end

        private def self.serialize_value(xml : XML::Builder, element_name : String, shape_name : String, value : JSON::Any) : Nil
          shape = shape(shape_name)
          case shape.type
          when "structure"
            xml.element(element_name) do
              serialize_structure(xml, shape, value.as_h? || {} of String => JSON::Any)
            end
          when "list"
            serialize_list(xml, element_name, shape, value, false)
          else
            xml.element(element_name) { xml.text(scalar_text(shape.type, value)) }
          end
        end

        private def self.scalar_text(shape_type : String, value : JSON::Any) : String
          case value.raw
          when Nil
            ""
          when String
            value.as_s
          when Int64
            value.as_i.to_s
          when Float64
            value.as_f.to_s
          when Bool
            value.as_bool ? "true" : "false"
          else
            value.to_json
          end
        end

        private def self.parse_node(node : XML::Node, shape_name : String) : JSON::Any
          shape = shape(shape_name)
          case shape.type
          when "structure"
            JSON::Any.new(parse_structure(node, shape))
          when "list"
            JSON::Any.new(parse_list(node, shape))
          else
            parse_scalar(shape.type, node.content)
          end
        end

        private def self.parse_structure(node : XML::Node, shape : Shape) : Hash(String, JSON::Any)
          result = {} of String => JSON::Any
          shape.members.each do |member|
            next unless member.location.nil?
            shape_ref = shape(member.shape)
            key = member_key(member)
            if shape_ref.type == "list" && (shape_ref.flattened || member.flattened)
              list_member = shape_ref.list_member
              next unless list_member
              member_name = list_member.location_name || "member"
              items = node.children.select(&.element?).select { |child| child.name == member_name }
              values = items.map { |child| parse_node(child, list_member.shape) }
              result[key] = JSON::Any.new(values)
            else
              child = node.children.find { |item| item.element? && item.name == key }
              next unless child
              result[key] = parse_node(child, member.shape)
            end
          end
          result
        end

        private def self.parse_list(node : XML::Node, shape : Shape) : Array(JSON::Any)
          member = shape.list_member
          return [] of JSON::Any unless member
          member_name = member.location_name || "member"
          items = node.children.select(&.element?).select { |child| child.name == member_name }
          items.map { |child| parse_node(child, member.shape) }
        end

        private def self.parse_scalar(shape_type : String, value : String) : JSON::Any
          case shape_type
          when "integer", "short", "byte"
            JSON::Any.new(value.to_i)
          when "long", "bigInteger"
            JSON::Any.new(value.to_i64)
          when "float", "double", "bigDecimal"
            JSON::Any.new(value.to_f)
          when "boolean"
            JSON::Any.new(value.downcase == "true")
          else
            JSON::Any.new(value)
          end
        end

        private def self.apply_header_values(payload : Hash(String, JSON::Any), output_shape : String, headers : Hash(String, String)) : Nil
          shape = shape(output_shape)
          shape.members.each do |member|
            next unless member.location == "header"
            header_name = member_key(member)
            value = header_value(headers, header_name)
            next unless value
            payload[header_name] = parse_scalar(shape(member.shape).type, value)
          end
        end

        private def self.header_value(headers : Hash(String, String), name : String) : String?
          headers[name]? || headers[name.downcase]? || headers[name.upcase]? || headers.find { |key, _| key.downcase == name.downcase }.try(&.[1])
        end

        private def self.result_node(document : XML::Node, operation_name : String) : XML::Node?
          document.xpath_node("//*[local-name()=\"#{operation_name}Result\"]") ||
            document.xpath_node("//*[local-name()=\"#{operation_name}Response\"]")
        end

        private def self.add_param(params : URI::Params, key : String, value : JSON::Any) : Nil
          case value.raw
          when Nil
          when Array
            value.as_a.each do |item|
              add_param(params, key, item)
            end
          when Hash
            params.add(key, value.to_json)
          when String
            params.add(key, value.as_s)
          when Int64
            params.add(key, value.as_i.to_s)
          when Float64
            params.add(key, value.as_f.to_s)
          when Bool
            params.add(key, value.as_bool ? "true" : "false")
          else
            params.add(key, value.to_json)
          end
        end

        private def self.error_type_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Code")
          node.try(&.content)
        rescue XML::Error
          nil
        end

        private def self.error_message_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Message")
          node.try(&.content)
        rescue XML::Error
          nil
        end
      end
    end
  end
end
