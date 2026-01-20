require "json"
require "time"

module AwsSdk
  module S3
    module Types

      # The ABAC status of the general purpose bucket. When ABAC is enabled for the general purpose bucket,
      # you can use tags to manage access to the general purpose buckets as well as for cost tracking
      # purposes. When ABAC is disabled for the general purpose buckets, you can only use tags for cost
      # tracking purposes. For more information, see Using tags with S3 general purpose buckets .

      struct AbacStatus
        include JSON::Serializable

        # The ABAC status of the general purpose bucket.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait
      # before permanently removing all parts of the upload. For more information, see Aborting Incomplete
      # Multipart Uploads Using a Bucket Lifecycle Configuration in the Amazon S3 User Guide .

      struct AbortIncompleteMultipartUpload
        include JSON::Serializable

        # Specifies the number of days after which Amazon S3 aborts an incomplete multipart upload.

        @[JSON::Field(key: "DaysAfterInitiation")]
        getter days_after_initiation : Int32?

        def initialize(
          @days_after_initiation : Int32? = nil
        )
        end
      end


      struct AbortMultipartUploadOutput
        include JSON::Serializable


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        def initialize(
          @request_charged : String? = nil
        )
        end
      end


      struct AbortMultipartUploadRequest
        include JSON::Serializable

        # The bucket name to which the upload was taking place. Directory buckets - When you use this
        # operation with a directory bucket, you must use virtual-hosted-style requests in the format
        # Bucket-name .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not
        # supported. Directory bucket names must be unique in the chosen Zone (Availability Zone or Local
        # Zone). Bucket names must follow the format bucket-base-name -- zone-id --x-s3 (for example,
        # amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about bucket naming restrictions, see
        # Directory bucket naming rules in the Amazon S3 User Guide . Access points - When you use this action
        # with an access point for general purpose buckets, you must provide the alias of the access point in
        # place of the bucket name or specify the access point ARN. When you use this action with an access
        # point for directory buckets, you must provide the access point name in place of the bucket name.
        # When using the access point ARN, you must direct requests to the access point hostname. The access
        # point hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com.
        # When using this action with an access point through the Amazon Web Services SDKs, you provide the
        # access point ARN in place of the bucket name. For more information about access point ARNs, see
        # Using access points in the Amazon S3 User Guide . Object Lambda access points are not supported by
        # directory buckets. S3 on Outposts - When you use this action with S3 on Outposts, you must direct
        # requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form AccessPointName
        # - AccountId . outpostID .s3-outposts. Region .amazonaws.com . When you use this action with S3 on
        # Outposts, the destination bucket must be the Outposts access point ARN or the access point alias.
        # For more information about S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Key of the object for which the multipart upload was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Upload ID that identifies the multipart upload.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # If present, this header aborts an in progress multipart upload only if it was initiated on the
        # provided timestamp. If the initiated timestamp of the multipart upload does not match the provided
        # value, the operation returns a 412 Precondition Failed error. If the initiated timestamp matches or
        # if the multipart upload doesn’t exist, the operation returns a 204 Success (No Content) response.
        # This functionality is only supported for directory buckets.

        @[JSON::Field(key: "x-amz-if-match-initiated-time")]
        getter if_match_initiated_time : Time?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        def initialize(
          @bucket : String,
          @key : String,
          @upload_id : String,
          @expected_bucket_owner : String? = nil,
          @if_match_initiated_time : Time? = nil,
          @request_payer : String? = nil
        )
        end
      end

      # Configures the transfer acceleration state for an Amazon S3 bucket. For more information, see Amazon
      # S3 Transfer Acceleration in the Amazon S3 User Guide .

      struct AccelerateConfiguration
        include JSON::Serializable

        # Specifies the transfer acceleration status of the bucket.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Contains the elements that set the ACL permissions for an object per grantee.

      struct AccessControlPolicy
        include JSON::Serializable

        # A list of grants.

        @[JSON::Field(key: "AccessControlList")]
        getter grants : Array(Types::Grant)?

        # Container for the bucket owner's display name and ID.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::Owner?

        def initialize(
          @grants : Array(Types::Grant)? = nil,
          @owner : Types::Owner? = nil
        )
        end
      end

      # A container for information about access control for replicas.

      struct AccessControlTranslation
        include JSON::Serializable

        # Specifies the replica ownership. For default and valid values, see PUT bucket replication in the
        # Amazon S3 API Reference .

        @[JSON::Field(key: "Owner")]
        getter owner : String

        def initialize(
          @owner : String
        )
        end
      end

      # A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The
      # operator must have at least two predicates in any combination, and an object must match all of the
      # predicates for the filter to apply.

      struct AnalyticsAndOperator
        include JSON::Serializable

        # The prefix to use when evaluating an AND predicate: The prefix that an object must have to be
        # included in the metrics results.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The list of tags to use when evaluating an AND predicate.

        @[JSON::Field(key: "Tag")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @prefix : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Specifies the configuration and any analyses for the analytics filter of an Amazon S3 bucket.

      struct AnalyticsConfiguration
        include JSON::Serializable

        # The ID that identifies the analytics configuration.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Contains data related to access patterns to be collected and made available to analyze the tradeoffs
        # between different storage classes.

        @[JSON::Field(key: "StorageClassAnalysis")]
        getter storage_class_analysis : Types::StorageClassAnalysis

        # The filter used to describe a set of objects for analyses. A filter must have exactly one prefix,
        # one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all objects will be
        # considered in any analysis.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::AnalyticsFilter?

        def initialize(
          @id : String,
          @storage_class_analysis : Types::StorageClassAnalysis,
          @filter : Types::AnalyticsFilter? = nil
        )
        end
      end

      # Where to publish the analytics results.

      struct AnalyticsExportDestination
        include JSON::Serializable

        # A destination signifying output to an S3 bucket.

        @[JSON::Field(key: "S3BucketDestination")]
        getter s3_bucket_destination : Types::AnalyticsS3BucketDestination

        def initialize(
          @s3_bucket_destination : Types::AnalyticsS3BucketDestination
        )
        end
      end

      # The filter used to describe a set of objects for analyses. A filter must have exactly one prefix,
      # one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all objects will be
      # considered in any analysis.

      struct AnalyticsFilter
        include JSON::Serializable

        # A conjunction (logical AND) of predicates, which is used in evaluating an analytics filter. The
        # operator must have at least two predicates.

        @[JSON::Field(key: "And")]
        getter and : Types::AnalyticsAndOperator?

        # The prefix to use when evaluating an analytics filter.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The tag to use when evaluating an analytics filter.

        @[JSON::Field(key: "Tag")]
        getter tag : Types::Tag?

        def initialize(
          @and : Types::AnalyticsAndOperator? = nil,
          @prefix : String? = nil,
          @tag : Types::Tag? = nil
        )
        end
      end

      # Contains information about where to publish the analytics results.

      struct AnalyticsS3BucketDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bucket to which data is exported.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Specifies the file format used when exporting data to Amazon S3.

        @[JSON::Field(key: "Format")]
        getter format : String

        # The account ID that owns the destination S3 bucket. If no account ID is provided, the owner is not
        # validated before exporting data. Although this value is optional, we strongly recommend that you set
        # it to help prevent problems if the destination bucket ownership changes.

        @[JSON::Field(key: "BucketAccountId")]
        getter bucket_account_id : String?

        # The prefix to use when exporting data. The prefix is prepended to all results.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String,
          @format : String,
          @bucket_account_id : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # A bucket-level setting for Amazon S3 general purpose buckets used to prevent the upload of new
      # objects encrypted with the specified server-side encryption type. For example, blocking an
      # encryption type will block PutObject , CopyObject , PostObject , multipart upload, and replication
      # requests to the bucket for objects with the specified encryption type. However, you can continue to
      # read and list any pre-existing objects already encrypted with the specified encryption type. For
      # more information, see Blocking or unblocking SSE-C for a general purpose bucket . This data type is
      # used with the following actions: PutBucketEncryption GetBucketEncryption DeleteBucketEncryption
      # Permissions You must have the s3:PutEncryptionConfiguration permission to block or unblock an
      # encryption type for a bucket. You must have the s3:GetEncryptionConfiguration permission to view a
      # bucket's encryption type.

      struct BlockedEncryptionTypes
        include JSON::Serializable

        # The object encryption type that you want to block or unblock for an Amazon S3 general purpose
        # bucket. Currently, this parameter only supports blocking or unblocking server side encryption with
        # customer-provided keys (SSE-C). For more information about SSE-C, see Using server-side encryption
        # with customer-provided keys (SSE-C) .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : Array(String)?

        def initialize(
          @encryption_type : Array(String)? = nil
        )
        end
      end

      # In terms of implementation, a Bucket is a resource.

      struct Bucket
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 bucket. ARNs uniquely identify Amazon Web Services
        # resources across all of Amazon Web Services. This parameter is only supported for S3 directory
        # buckets. For more information, see Using tags with directory buckets .

        @[JSON::Field(key: "BucketArn")]
        getter bucket_arn : String?

        # BucketRegion indicates the Amazon Web Services region where the bucket is located. If the request
        # contains at least one valid parameter, it is included in the response.

        @[JSON::Field(key: "BucketRegion")]
        getter bucket_region : String?

        # Date the bucket was created. This date can change when making changes to your bucket, such as
        # editing its bucket policy.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The name of the bucket.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @bucket_arn : String? = nil,
          @bucket_region : String? = nil,
          @creation_date : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # The requested bucket name is not available. The bucket namespace is shared by all users of the
      # system. Select a different name and try again.

      struct BucketAlreadyExists
        include JSON::Serializable

        def initialize
        end
      end

      # The bucket you tried to create already exists, and you own it. Amazon S3 returns this error in all
      # Amazon Web Services Regions except in the North Virginia Region. For legacy compatibility, if you
      # re-create an existing bucket that you already own in the North Virginia Region, Amazon S3 returns
      # 200 OK and resets the bucket access control lists (ACLs).

      struct BucketAlreadyOwnedByYou
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the information about the bucket that will be created. For more information about
      # directory buckets, see Directory buckets in the Amazon S3 User Guide . This functionality is only
      # supported by directory buckets.

      struct BucketInfo
        include JSON::Serializable

        # The number of Zone (Availability Zone or Local Zone) that's used for redundancy for the bucket.

        @[JSON::Field(key: "DataRedundancy")]
        getter data_redundancy : String?

        # The type of bucket.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @data_redundancy : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Specifies the lifecycle configuration for objects in an Amazon S3 bucket. For more information, see
      # Object Lifecycle Management in the Amazon S3 User Guide .

      struct BucketLifecycleConfiguration
        include JSON::Serializable

        # A lifecycle rule for individual objects in an Amazon S3 bucket.

        @[JSON::Field(key: "Rule")]
        getter rules : Array(Types::LifecycleRule)

        def initialize(
          @rules : Array(Types::LifecycleRule)
        )
        end
      end

      # Container for logging status information.

      struct BucketLoggingStatus
        include JSON::Serializable


        @[JSON::Field(key: "LoggingEnabled")]
        getter logging_enabled : Types::LoggingEnabled?

        def initialize(
          @logging_enabled : Types::LoggingEnabled? = nil
        )
        end
      end

      # Describes the cross-origin access configuration for objects in an Amazon S3 bucket. For more
      # information, see Enabling Cross-Origin Resource Sharing in the Amazon S3 User Guide .

      struct CORSConfiguration
        include JSON::Serializable

        # A set of origins and methods (cross-origin access that you want to allow). You can add up to 100
        # rules to the configuration.

        @[JSON::Field(key: "CORSRule")]
        getter cors_rules : Array(Types::CORSRule)

        def initialize(
          @cors_rules : Array(Types::CORSRule)
        )
        end
      end

      # Specifies a cross-origin access rule for an Amazon S3 bucket.

      struct CORSRule
        include JSON::Serializable

        # An HTTP method that you allow the origin to execute. Valid values are GET , PUT , HEAD , POST , and
        # DELETE .

        @[JSON::Field(key: "AllowedMethod")]
        getter allowed_methods : Array(String)

        # One or more origins you want customers to be able to access the bucket from.

        @[JSON::Field(key: "AllowedOrigin")]
        getter allowed_origins : Array(String)

        # Headers that are specified in the Access-Control-Request-Headers header. These headers are allowed
        # in a preflight OPTIONS request. In response to any preflight OPTIONS request, Amazon S3 returns any
        # requested headers that are allowed.

        @[JSON::Field(key: "AllowedHeader")]
        getter allowed_headers : Array(String)?

        # One or more headers in the response that you want customers to be able to access from their
        # applications (for example, from a JavaScript XMLHttpRequest object).

        @[JSON::Field(key: "ExposeHeader")]
        getter expose_headers : Array(String)?

        # Unique identifier for the rule. The value cannot be longer than 255 characters.

        @[JSON::Field(key: "ID")]
        getter id : String?

        # The time in seconds that your browser is to cache the preflight response for the specified resource.

        @[JSON::Field(key: "MaxAgeSeconds")]
        getter max_age_seconds : Int32?

        def initialize(
          @allowed_methods : Array(String),
          @allowed_origins : Array(String),
          @allowed_headers : Array(String)? = nil,
          @expose_headers : Array(String)? = nil,
          @id : String? = nil,
          @max_age_seconds : Int32? = nil
        )
        end
      end

      # Describes how an uncompressed comma-separated values (CSV)-formatted input object is formatted.

      struct CSVInput
        include JSON::Serializable

        # Specifies that CSV field values may contain quoted record delimiters and such records should be
        # allowed. Default value is FALSE. Setting this value to TRUE may lower performance.

        @[JSON::Field(key: "AllowQuotedRecordDelimiter")]
        getter allow_quoted_record_delimiter : Bool?

        # A single character used to indicate that a row should be ignored when the character is present at
        # the start of that row. You can specify any character to indicate a comment line. The default
        # character is # . Default: #

        @[JSON::Field(key: "Comments")]
        getter comments : String?

        # A single character used to separate individual fields in a record. You can specify an arbitrary
        # delimiter.

        @[JSON::Field(key: "FieldDelimiter")]
        getter field_delimiter : String?

        # Describes the first line of input. Valid values are: NONE : First line is not a header. IGNORE :
        # First line is a header, but you can't use the header values to indicate the column in an expression.
        # You can use column position (such as _1, _2, …) to indicate the column ( SELECT s._1 FROM OBJECT s
        # ). Use : First line is a header, and you can use the header value to identify a column in an
        # expression ( SELECT "name" FROM OBJECT ).

        @[JSON::Field(key: "FileHeaderInfo")]
        getter file_header_info : String?

        # A single character used for escaping when the field delimiter is part of the value. For example, if
        # the value is a, b , Amazon S3 wraps this field value in quotation marks, as follows: " a , b " .
        # Type: String Default: " Ancestors: CSV

        @[JSON::Field(key: "QuoteCharacter")]
        getter quote_character : String?

        # A single character used for escaping the quotation mark character inside an already escaped value.
        # For example, the value """ a , b """ is parsed as " a , b " .

        @[JSON::Field(key: "QuoteEscapeCharacter")]
        getter quote_escape_character : String?

        # A single character used to separate individual records in the input. Instead of the default value,
        # you can specify an arbitrary delimiter.

        @[JSON::Field(key: "RecordDelimiter")]
        getter record_delimiter : String?

        def initialize(
          @allow_quoted_record_delimiter : Bool? = nil,
          @comments : String? = nil,
          @field_delimiter : String? = nil,
          @file_header_info : String? = nil,
          @quote_character : String? = nil,
          @quote_escape_character : String? = nil,
          @record_delimiter : String? = nil
        )
        end
      end

      # Describes how uncompressed comma-separated values (CSV)-formatted results are formatted.

      struct CSVOutput
        include JSON::Serializable

        # The value used to separate individual fields in a record. You can specify an arbitrary delimiter.

        @[JSON::Field(key: "FieldDelimiter")]
        getter field_delimiter : String?

        # A single character used for escaping when the field delimiter is part of the value. For example, if
        # the value is a, b , Amazon S3 wraps this field value in quotation marks, as follows: " a , b " .

        @[JSON::Field(key: "QuoteCharacter")]
        getter quote_character : String?

        # The single character used for escaping the quote character inside an already escaped value.

        @[JSON::Field(key: "QuoteEscapeCharacter")]
        getter quote_escape_character : String?

        # Indicates whether to use quotation marks around output fields. ALWAYS : Always use quotation marks
        # for output fields. ASNEEDED : Use quotation marks for output fields when needed.

        @[JSON::Field(key: "QuoteFields")]
        getter quote_fields : String?

        # A single character used to separate individual records in the output. Instead of the default value,
        # you can specify an arbitrary delimiter.

        @[JSON::Field(key: "RecordDelimiter")]
        getter record_delimiter : String?

        def initialize(
          @field_delimiter : String? = nil,
          @quote_character : String? = nil,
          @quote_escape_character : String? = nil,
          @quote_fields : String? = nil,
          @record_delimiter : String? = nil
        )
        end
      end

      # Contains all the possible checksum or digest values for an object.

      struct Checksum
        include JSON::Serializable

        # The Base64 encoded, 32-bit CRC32 checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "ChecksumCRC32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "ChecksumCRC32C")]
        getter checksum_crc32_c : String?

        # The Base64 encoded, 64-bit CRC64NVME checksum of the object. This checksum is present if the object
        # was uploaded with the CRC64NVME checksum algorithm, or if the object was uploaded without a checksum
        # (and Amazon S3 added the default checksum, CRC64NVME , to the uploaded object). For more
        # information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC64NVME")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 digest of the object. This checksum is only present if the checksum
        # was uploaded with the object. When you use the API operation on an object that was uploaded using
        # multipart uploads, this value may not be a direct checksum value of the full object. Instead, it's a
        # calculation based on the checksum values of each individual part. For more information about how
        # checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3 User
        # Guide .

        @[JSON::Field(key: "ChecksumSHA1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 digest of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "ChecksumSHA256")]
        getter checksum_sha256 : String?

        # The checksum type that is used to calculate the object’s checksum value. For more information, see
        # Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumType")]
        getter checksum_type : String?

        def initialize(
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @checksum_type : String? = nil
        )
        end
      end

      # Container for specifying the Lambda notification configuration.

      struct CloudFunctionConfiguration
        include JSON::Serializable

        # Lambda cloud function ARN that Amazon S3 can invoke when it detects events of the specified type.

        @[JSON::Field(key: "CloudFunction")]
        getter cloud_function : String?


        @[JSON::Field(key: "Event")]
        getter event : String?

        # Bucket events for which to send notifications.

        @[JSON::Field(key: "Event")]
        getter events : Array(String)?


        @[JSON::Field(key: "Id")]
        getter id : String?

        # The role supporting the invocation of the Lambda function

        @[JSON::Field(key: "InvocationRole")]
        getter invocation_role : String?

        def initialize(
          @cloud_function : String? = nil,
          @event : String? = nil,
          @events : Array(String)? = nil,
          @id : String? = nil,
          @invocation_role : String? = nil
        )
        end
      end

      # Container for all (if there are any) keys between Prefix and the next occurrence of the string
      # specified by a delimiter. CommonPrefixes lists keys that act like subdirectories in the directory
      # specified by Prefix. For example, if the prefix is notes/ and the delimiter is a slash (/) as in
      # notes/summer/july, the common prefix is notes/summer/.

      struct CommonPrefix
        include JSON::Serializable

        # Container for the specified common prefix.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @prefix : String? = nil
        )
        end
      end


      struct CompleteMultipartUploadOutput
        include JSON::Serializable

        # The name of the bucket that contains the newly created object. Does not return the access point ARN
        # or access point alias if used. Access points are not supported by directory buckets.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with Key
        # Management Service (KMS) keys (SSE-KMS).

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # The Base64 encoded, 32-bit CRC32 checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "ChecksumCRC32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "ChecksumCRC32C")]
        getter checksum_crc32_c : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 64-bit CRC64NVME checksum of the
        # object. The CRC64NVME checksum is always a full object checksum. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC64NVME")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 digest of the object. This checksum is only present if the checksum
        # was uploaded with the object. When you use the API operation on an object that was uploaded using
        # multipart uploads, this value may not be a direct checksum value of the full object. Instead, it's a
        # calculation based on the checksum values of each individual part. For more information about how
        # checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3 User
        # Guide .

        @[JSON::Field(key: "ChecksumSHA1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 digest of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "ChecksumSHA256")]
        getter checksum_sha256 : String?

        # The checksum type, which determines how part-level checksums are combined to create an object-level
        # checksum for multipart objects. You can use this header as a data integrity check to verify that the
        # checksum type that is received is the same checksum type that was specified during the
        # CreateMultipartUpload request. For more information, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "ChecksumType")]
        getter checksum_type : String?

        # Entity tag that identifies the newly created object's data. Objects with different object data will
        # have different entity tags. The entity tag is an opaque string. The entity tag may or may not be an
        # MD5 digest of the object data. If the entity tag is not an MD5 digest of the object data, it will
        # contain one or more nonhexadecimal characters and/or will consist of less than 32 or more than 32
        # hexadecimal digits. For more information about how the entity tag is calculated, see Checking object
        # integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # If the object expiration is configured, this will contain the expiration date ( expiry-date ) and
        # rule ID ( rule-id ). The value of rule-id is URL-encoded. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-expiration")]
        getter expiration : String?

        # The object key of the newly created object.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The URI that identifies the newly created object.

        @[JSON::Field(key: "Location")]
        getter location : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # If present, indicates the ID of the KMS key that was used for object encryption.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when storing this object in Amazon S3. When accessing data
        # stored in Amazon FSx file systems using S3 access points, the only valid server side encryption
        # option is aws:fsx .

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # Version ID of the newly created object, in case the bucket has versioning turned on. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        def initialize(
          @bucket : String? = nil,
          @bucket_key_enabled : Bool? = nil,
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @checksum_type : String? = nil,
          @e_tag : String? = nil,
          @expiration : String? = nil,
          @key : String? = nil,
          @location : String? = nil,
          @request_charged : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct CompleteMultipartUploadRequest
        include JSON::Serializable

        # Name of the bucket to which the multipart upload was initiated. Directory buckets - When you use
        # this operation with a directory bucket, you must use virtual-hosted-style requests in the format
        # Bucket-name .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not
        # supported. Directory bucket names must be unique in the chosen Zone (Availability Zone or Local
        # Zone). Bucket names must follow the format bucket-base-name -- zone-id --x-s3 (for example,
        # amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about bucket naming restrictions, see
        # Directory bucket naming rules in the Amazon S3 User Guide . Access points - When you use this action
        # with an access point for general purpose buckets, you must provide the alias of the access point in
        # place of the bucket name or specify the access point ARN. When you use this action with an access
        # point for directory buckets, you must provide the access point name in place of the bucket name.
        # When using the access point ARN, you must direct requests to the access point hostname. The access
        # point hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com.
        # When using this action with an access point through the Amazon Web Services SDKs, you provide the
        # access point ARN in place of the bucket name. For more information about access point ARNs, see
        # Using access points in the Amazon S3 User Guide . Object Lambda access points are not supported by
        # directory buckets. S3 on Outposts - When you use this action with S3 on Outposts, you must direct
        # requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form AccessPointName
        # - AccountId . outpostID .s3-outposts. Region .amazonaws.com . When you use this action with S3 on
        # Outposts, the destination bucket must be the Outposts access point ARN or the access point alias.
        # For more information about S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Object key for which the multipart upload was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String

        # ID for the initiated multipart upload.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 32-bit CRC32 checksum of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32")]
        getter checksum_crc32 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 32-bit CRC32C checksum of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32c")]
        getter checksum_crc32_c : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 64-bit CRC64NVME checksum of the
        # object. The CRC64NVME checksum is always a full object checksum. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc64nvme")]
        getter checksum_crc64_nvme : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 160-bit SHA1 digest of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha1")]
        getter checksum_sha1 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 256-bit SHA256 digest of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha256")]
        getter checksum_sha256 : String?

        # This header specifies the checksum type of the object, which determines how part-level checksums are
        # combined to create an object-level checksum for multipart objects. You can use this header as a data
        # integrity check to verify that the checksum type that is received is the same checksum that was
        # specified. If the checksum type doesn’t match the checksum type that was specified for the object
        # during the CreateMultipartUpload request, it’ll result in a BadDigest error. For more information,
        # see Checking object integrity in the Amazon S3 User Guide.

        @[JSON::Field(key: "x-amz-checksum-type")]
        getter checksum_type : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Uploads the object only if the ETag (entity tag) value provided during the WRITE operation matches
        # the ETag of the object in S3. If the ETag values do not match, the operation returns a 412
        # Precondition Failed error. If a conflicting operation occurs during the upload S3 returns a 409
        # ConditionalRequestConflict response. On a 409 failure you should fetch the object's ETag,
        # re-initiate the multipart upload with CreateMultipartUpload , and re-upload each part. Expects the
        # ETag value as a string. For more information about conditional requests, see RFC 7232 , or
        # Conditional requests in the Amazon S3 User Guide .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Uploads the object only if the object key name does not already exist in the bucket specified.
        # Otherwise, Amazon S3 returns a 412 Precondition Failed error. If a conflicting operation occurs
        # during the upload S3 returns a 409 ConditionalRequestConflict response. On a 409 failure you should
        # re-initiate the multipart upload with CreateMultipartUpload and re-upload each part. Expects the '*'
        # (asterisk) character. For more information about conditional requests, see RFC 7232 , or Conditional
        # requests in the Amazon S3 User Guide .

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # The expected total object size of the multipart upload request. If there’s a mismatch between the
        # specified object size value and the actual object size value, it results in an HTTP 400
        # InvalidRequest error.

        @[JSON::Field(key: "x-amz-mp-object-size")]
        getter mpu_object_size : Int64?

        # The container for the multipart upload request information.

        @[JSON::Field(key: "CompleteMultipartUpload")]
        getter multipart_upload : Types::CompletedMultipartUpload?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # The server-side encryption (SSE) algorithm used to encrypt the object. This parameter is required
        # only when the object was created using a checksum algorithm or if your bucket policy requires the
        # use of SSE-C. For more information, see Protecting data using SSE-C keys in the Amazon S3 User Guide
        # . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # The server-side encryption (SSE) customer managed key. This parameter is needed only when the object
        # was created using a checksum algorithm. For more information, see Protecting data using SSE-C keys
        # in the Amazon S3 User Guide . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # The MD5 server-side encryption (SSE) customer managed key. This parameter is needed only when the
        # object was created using a checksum algorithm. For more information, see Protecting data using SSE-C
        # keys in the Amazon S3 User Guide . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        def initialize(
          @bucket : String,
          @key : String,
          @upload_id : String,
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @checksum_type : String? = nil,
          @expected_bucket_owner : String? = nil,
          @if_match : String? = nil,
          @if_none_match : String? = nil,
          @mpu_object_size : Int64? = nil,
          @multipart_upload : Types::CompletedMultipartUpload? = nil,
          @request_payer : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil
        )
        end
      end

      # The container for the completed multipart upload details.

      struct CompletedMultipartUpload
        include JSON::Serializable

        # Array of CompletedPart data types. If you do not supply a valid Part with your request, the service
        # sends back an HTTP 400 response.

        @[JSON::Field(key: "Part")]
        getter parts : Array(Types::CompletedPart)?

        def initialize(
          @parts : Array(Types::CompletedPart)? = nil
        )
        end
      end

      # Details of the parts that were uploaded.

      struct CompletedPart
        include JSON::Serializable

        # The Base64 encoded, 32-bit CRC32 checksum of the part. This checksum is present if the multipart
        # upload request was created with the CRC32 checksum algorithm. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the part. This checksum is present if the multipart
        # upload request was created with the CRC32C checksum algorithm. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC32C")]
        getter checksum_crc32_c : String?

        # The Base64 encoded, 64-bit CRC64NVME checksum of the part. This checksum is present if the multipart
        # upload request was created with the CRC64NVME checksum algorithm to the uploaded object). For more
        # information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC64NVME")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 checksum of the part. This checksum is present if the multipart
        # upload request was created with the SHA1 checksum algorithm. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumSHA1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 checksum of the part. This checksum is present if the multipart
        # upload request was created with the SHA256 checksum algorithm. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumSHA256")]
        getter checksum_sha256 : String?

        # Entity tag returned when the part was uploaded.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Part number that identifies the part. This is a positive integer between 1 and 10,000. General
        # purpose buckets - In CompleteMultipartUpload , when a additional checksum (including
        # x-amz-checksum-crc32 , x-amz-checksum-crc32c , x-amz-checksum-sha1 , or x-amz-checksum-sha256 ) is
        # applied to each part, the PartNumber must start at 1 and the part numbers must be consecutive.
        # Otherwise, Amazon S3 generates an HTTP 400 Bad Request status code and an InvalidPartOrder error
        # code. Directory buckets - In CompleteMultipartUpload , the PartNumber must start at 1 and the part
        # numbers must be consecutive.

        @[JSON::Field(key: "PartNumber")]
        getter part_number : Int32?

        def initialize(
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @e_tag : String? = nil,
          @part_number : Int32? = nil
        )
        end
      end

      # A container for describing a condition that must be met for the specified redirect to apply. For
      # example, 1. If request is for pages in the /docs folder, redirect to the /documents folder. 2. If
      # request results in HTTP error 4xx, redirect request to another host where you might process the
      # error.

      struct Condition
        include JSON::Serializable

        # The HTTP error code when the redirect is applied. In the event of an error, if the error code equals
        # this value, then the specified redirect is applied. Required when parent element Condition is
        # specified and sibling KeyPrefixEquals is not specified. If both are specified, then both must be
        # true for the redirect to be applied.

        @[JSON::Field(key: "HttpErrorCodeReturnedEquals")]
        getter http_error_code_returned_equals : String?

        # The object key name prefix when the redirect is applied. For example, to redirect requests for
        # ExamplePage.html , the key prefix will be ExamplePage.html . To redirect request for all pages with
        # the prefix docs/ , the key prefix will be /docs , which identifies all objects in the docs/ folder.
        # Required when the parent element Condition is specified and sibling HttpErrorCodeReturnedEquals is
        # not specified. If both conditions are specified, both must be true for the redirect to be applied.
        # Replacement must be made for object keys containing special characters (such as carriage returns)
        # when using XML requests. For more information, see XML related object key constraints .

        @[JSON::Field(key: "KeyPrefixEquals")]
        getter key_prefix_equals : String?

        def initialize(
          @http_error_code_returned_equals : String? = nil,
          @key_prefix_equals : String? = nil
        )
        end
      end


      struct ContinuationEvent
        include JSON::Serializable

        def initialize
        end
      end


      struct CopyObjectOutput
        include JSON::Serializable

        # Indicates whether the copied object uses an S3 Bucket Key for server-side encryption with Key
        # Management Service (KMS) keys (SSE-KMS).

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # Container for all response elements.

        @[JSON::Field(key: "CopyObjectResult")]
        getter copy_object_result : Types::CopyObjectResult?

        # Version ID of the source object that was copied. This functionality is not supported when the source
        # object is in a directory bucket.

        @[JSON::Field(key: "x-amz-copy-source-version-id")]
        getter copy_source_version_id : String?

        # If the object expiration is configured, the response includes this header. Object expiration
        # information is not returned in directory buckets and this header returns the value " NotImplemented
        # " in all responses for directory buckets.

        @[JSON::Field(key: "x-amz-expiration")]
        getter expiration : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to confirm the encryption algorithm that's used. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to provide the round-trip message integrity verification of the
        # customer-provided encryption key. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # If present, indicates the Amazon Web Services KMS Encryption Context to use for object encryption.
        # The value of this header is a Base64 encoded UTF-8 string holding JSON with the encryption context
        # key-value pairs.

        @[JSON::Field(key: "x-amz-server-side-encryption-context")]
        getter ssekms_encryption_context : String?

        # If present, indicates the ID of the KMS key that was used for object encryption.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
        # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid server
        # side encryption option is aws:fsx .

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # Version ID of the newly created copy. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        def initialize(
          @bucket_key_enabled : Bool? = nil,
          @copy_object_result : Types::CopyObjectResult? = nil,
          @copy_source_version_id : String? = nil,
          @expiration : String? = nil,
          @request_charged : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_encryption_context : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct CopyObjectRequest
        include JSON::Serializable

        # The name of the destination bucket. Directory buckets - When you use this operation with a directory
        # bucket, you must use virtual-hosted-style requests in the format Bucket-name .s3express- zone-id .
        # region-code .amazonaws.com . Path-style requests are not supported. Directory bucket names must be
        # unique in the chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format
        # bucket-base-name -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For
        # information about bucket naming restrictions, see Directory bucket naming rules in the Amazon S3
        # User Guide . Copying objects across different Amazon Web Services Regions isn't supported when the
        # source or destination bucket is in Amazon Web Services Local Zones. The source and destination
        # buckets must have the same parent Amazon Web Services Region. Otherwise, you get an HTTP 400 Bad
        # Request error with the error code InvalidRequest . Access points - When you use this action with an
        # access point for general purpose buckets, you must provide the alias of the access point in place of
        # the bucket name or specify the access point ARN. When you use this action with an access point for
        # directory buckets, you must provide the access point name in place of the bucket name. When using
        # the access point ARN, you must direct requests to the access point hostname. The access point
        # hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When
        # using this action with an access point through the Amazon Web Services SDKs, you provide the access
        # point ARN in place of the bucket name. For more information about access point ARNs, see Using
        # access points in the Amazon S3 User Guide . Object Lambda access points are not supported by
        # directory buckets. S3 on Outposts - When you use this action with S3 on Outposts, you must use the
        # Outpost bucket access point ARN or the access point alias for the destination bucket. You can only
        # copy objects within the same Outpost bucket. It's not supported to copy objects across different
        # Amazon Web Services Outposts, between buckets on the same Outposts, or between Outposts buckets and
        # any other bucket types. For more information about S3 on Outposts, see What is S3 on Outposts? in
        # the S3 on Outposts guide . When you use this action with S3 on Outposts through the REST API, you
        # must direct requests to the S3 on Outposts hostname, in the format AccessPointName - AccountId .
        # outpostID .s3-outposts. Region .amazonaws.com . The hostname isn't required when you use the Amazon
        # Web Services CLI or SDKs.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Specifies the source object for the copy operation. The source object can be up to 5 GB. If the
        # source object is an object that was uploaded by using a multipart upload, the object copy will be a
        # single part object after the source object is copied to the destination bucket. You specify the
        # value of the copy source in one of two formats, depending on whether you want to access the source
        # object through an access point : For objects not accessed through an access point, specify the name
        # of the source bucket and the key of the source object, separated by a slash (/). For example, to
        # copy the object reports/january.pdf from the general purpose bucket awsexamplebucket , use
        # awsexamplebucket/reports/january.pdf . The value must be URL-encoded. To copy the object
        # reports/january.pdf from the directory bucket awsexamplebucket--use1-az5--x-s3 , use
        # awsexamplebucket--use1-az5--x-s3/reports/january.pdf . The value must be URL-encoded. For objects
        # accessed through access points, specify the Amazon Resource Name (ARN) of the object as accessed
        # through the access point, in the format
        # arn:aws:s3:&lt;Region&gt;:&lt;account-id&gt;:accesspoint/&lt;access-point-name&gt;/object/&lt;key&gt;
        # . For example, to copy the object reports/january.pdf through access point my-access-point owned by
        # account 123456789012 in Region us-west-2 , use the URL encoding of
        # arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf . The value
        # must be URL encoded. Amazon S3 supports copy operations using Access points only when the source and
        # destination buckets are in the same Amazon Web Services Region. Access points are not supported by
        # directory buckets. Alternatively, for objects accessed through Amazon S3 on Outposts, specify the
        # ARN of the object as accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/object/&lt;key&gt;
        # . For example, to copy the object reports/january.pdf through outpost my-outpost owned by account
        # 123456789012 in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf . The value
        # must be URL-encoded. If your source bucket versioning is enabled, the x-amz-copy-source header by
        # default identifies the current version of an object to copy. If the current version is a delete
        # marker, Amazon S3 behaves as if the object was deleted. To copy a different version, use the
        # versionId query parameter. Specifically, append ?versionId=&lt;version-id&gt; to the value (for
        # example, awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893 ). If
        # you don't specify a version ID, Amazon S3 copies the latest version of the source object. If you
        # enable versioning on the destination bucket, Amazon S3 generates a unique version ID for the copied
        # object. This version ID is different from the version ID of the source object. Amazon S3 returns the
        # version ID of the copied object in the x-amz-version-id response header in the response. If you do
        # not enable versioning or suspend it on the destination bucket, the version ID that Amazon S3
        # generates in the x-amz-version-id response header is always null. Directory buckets - S3 Versioning
        # isn't enabled and supported for directory buckets.

        @[JSON::Field(key: "x-amz-copy-source")]
        getter copy_source : String

        # The key of the destination object.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The canned access control list (ACL) to apply to the object. When you copy an object, the ACL
        # metadata is not preserved and is set to private by default. Only the owner has full access control.
        # To override the default ACL setting, specify a new ACL when you generate a copy request. For more
        # information, see Using ACLs . If the destination bucket that you're copying objects to uses the
        # bucket owner enforced setting for S3 Object Ownership, ACLs are disabled and no longer affect
        # permissions. Buckets that use this setting only accept PUT requests that don't specify an ACL or PUT
        # requests that specify bucket owner full control ACLs, such as the bucket-owner-full-control canned
        # ACL or an equivalent form of this ACL expressed in the XML format. For more information, see
        # Controlling ownership of objects and disabling ACLs in the Amazon S3 User Guide . If your
        # destination bucket uses the bucket owner enforced setting for Object Ownership, all objects written
        # to the bucket by any account will be owned by the bucket owner. This functionality is not supported
        # for directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-acl")]
        getter acl : String?

        # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
        # encryption using Key Management Service (KMS) keys (SSE-KMS). If a target object uses SSE-KMS, you
        # can enable an S3 Bucket Key for the object. Setting this header to true causes Amazon S3 to use an
        # S3 Bucket Key for object encryption with SSE-KMS. Specifying this header with a COPY action doesn’t
        # affect bucket-level settings for S3 Bucket Key. For more information, see Amazon S3 Bucket Keys in
        # the Amazon S3 User Guide . Directory buckets - S3 Bucket Keys aren't supported, when you copy
        # SSE-KMS encrypted objects from general purpose buckets to directory buckets, from directory buckets
        # to general purpose buckets, or between directory buckets, through CopyObject . In this case, Amazon
        # S3 makes a call to KMS every time a copy request is made for a KMS-encrypted object.

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # Specifies the caching behavior along the request/reply chain.

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # Indicates the algorithm that you want Amazon S3 to use to create the checksum for the object. For
        # more information, see Checking object integrity in the Amazon S3 User Guide . When you copy an
        # object, if the source object has a checksum, that checksum value will be copied to the new object by
        # default. If the CopyObject request does not include this x-amz-checksum-algorithm header, the
        # checksum algorithm will be copied from the source object to the destination object (if it's present
        # on the source object). You can optionally specify a different checksum algorithm to use with the
        # x-amz-checksum-algorithm header. Unrecognized or unsupported values will respond with the HTTP
        # status code 400 Bad Request . For directory buckets, when you use Amazon Web Services SDKs, CRC32 is
        # the default checksum algorithm that's used for performance.

        @[JSON::Field(key: "x-amz-checksum-algorithm")]
        getter checksum_algorithm : String?

        # Specifies presentational information for the object. Indicates whether an object should be displayed
        # in a web browser or downloaded as a file. It allows specifying the desired filename for the
        # downloaded file.

        @[JSON::Field(key: "Content-Disposition")]
        getter content_disposition : String?

        # Specifies what content encodings have been applied to the object and thus what decoding mechanisms
        # must be applied to obtain the media-type referenced by the Content-Type header field. For directory
        # buckets, only the aws-chunked value is supported in this header field.

        @[JSON::Field(key: "Content-Encoding")]
        getter content_encoding : String?

        # The language the content is in.

        @[JSON::Field(key: "Content-Language")]
        getter content_language : String?

        # A standard MIME type that describes the format of the object data.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Copies the object if its entity tag (ETag) matches the specified tag. If both the
        # x-amz-copy-source-if-match and x-amz-copy-source-if-unmodified-since headers are present in the
        # request and evaluate as follows, Amazon S3 returns 200 OK and copies the data:
        # x-amz-copy-source-if-match condition evaluates to true x-amz-copy-source-if-unmodified-since
        # condition evaluates to false

        @[JSON::Field(key: "x-amz-copy-source-if-match")]
        getter copy_source_if_match : String?

        # Copies the object if it has been modified since the specified time. If both the
        # x-amz-copy-source-if-none-match and x-amz-copy-source-if-modified-since headers are present in the
        # request and evaluate as follows, Amazon S3 returns the 412 Precondition Failed response code:
        # x-amz-copy-source-if-none-match condition evaluates to false x-amz-copy-source-if-modified-since
        # condition evaluates to true

        @[JSON::Field(key: "x-amz-copy-source-if-modified-since")]
        getter copy_source_if_modified_since : Time?

        # Copies the object if its entity tag (ETag) is different than the specified ETag. If both the
        # x-amz-copy-source-if-none-match and x-amz-copy-source-if-modified-since headers are present in the
        # request and evaluate as follows, Amazon S3 returns the 412 Precondition Failed response code:
        # x-amz-copy-source-if-none-match condition evaluates to false x-amz-copy-source-if-modified-since
        # condition evaluates to true

        @[JSON::Field(key: "x-amz-copy-source-if-none-match")]
        getter copy_source_if_none_match : String?

        # Copies the object if it hasn't been modified since the specified time. If both the
        # x-amz-copy-source-if-match and x-amz-copy-source-if-unmodified-since headers are present in the
        # request and evaluate as follows, Amazon S3 returns 200 OK and copies the data:
        # x-amz-copy-source-if-match condition evaluates to true x-amz-copy-source-if-unmodified-since
        # condition evaluates to false

        @[JSON::Field(key: "x-amz-copy-source-if-unmodified-since")]
        getter copy_source_if_unmodified_since : Time?

        # Specifies the algorithm to use when decrypting the source object (for example, AES256 ). If the
        # source object for the copy is stored in Amazon S3 using SSE-C, you must provide the necessary
        # encryption information in your request so that Amazon S3 can decrypt the object for copying. This
        # functionality is not supported when the source object is in a directory bucket.

        @[JSON::Field(key: "x-amz-copy-source-server-side-encryption-customer-algorithm")]
        getter copy_source_sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object.
        # The encryption key provided in this header must be the same one that was used when the source object
        # was created. If the source object for the copy is stored in Amazon S3 using SSE-C, you must provide
        # the necessary encryption information in your request so that Amazon S3 can decrypt the object for
        # copying. This functionality is not supported when the source object is in a directory bucket.

        @[JSON::Field(key: "x-amz-copy-source-server-side-encryption-customer-key")]
        getter copy_source_sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this
        # header for a message integrity check to ensure that the encryption key was transmitted without
        # error. If the source object for the copy is stored in Amazon S3 using SSE-C, you must provide the
        # necessary encryption information in your request so that Amazon S3 can decrypt the object for
        # copying. This functionality is not supported when the source object is in a directory bucket.

        @[JSON::Field(key: "x-amz-copy-source-server-side-encryption-customer-key-MD5")]
        getter copy_source_sse_customer_key_md5 : String?

        # The account ID of the expected destination bucket owner. If the account ID that you provide does not
        # match the actual owner of the destination bucket, the request fails with the HTTP status code 403
        # Forbidden (access denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # The account ID of the expected source bucket owner. If the account ID that you provide does not
        # match the actual owner of the source bucket, the request fails with the HTTP status code 403
        # Forbidden (access denied).

        @[JSON::Field(key: "x-amz-source-expected-bucket-owner")]
        getter expected_source_bucket_owner : String?

        # The date and time at which the object is no longer cacheable.

        @[JSON::Field(key: "Expires")]
        getter expires : String?

        # Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object. This functionality is not
        # supported for directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-full-control")]
        getter grant_full_control : String?

        # Allows grantee to read the object data and its metadata. This functionality is not supported for
        # directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-read")]
        getter grant_read : String?

        # Allows grantee to read the object ACL. This functionality is not supported for directory buckets.
        # This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-read-acp")]
        getter grant_read_acp : String?

        # Allows grantee to write the ACL for the applicable object. This functionality is not supported for
        # directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-write-acp")]
        getter grant_write_acp : String?

        # Copies the object if the entity tag (ETag) of the destination object matches the specified tag. If
        # the ETag values do not match, the operation returns a 412 Precondition Failed error. If a concurrent
        # operation occurs during the upload S3 returns a 409 ConditionalRequestConflict response. On a 409
        # failure you should fetch the object's ETag and retry the upload. Expects the ETag value as a string.
        # For more information about conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Copies the object only if the object key name at the destination does not already exist in the
        # bucket specified. Otherwise, Amazon S3 returns a 412 Precondition Failed error. If a concurrent
        # operation occurs during the upload S3 returns a 409 ConditionalRequestConflict response. On a 409
        # failure you should retry the upload. Expects the '*' (asterisk) character. For more information
        # about conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # A map of metadata to store with the object in S3.

        @[JSON::Field(key: "x-amz-meta-")]
        getter metadata : Hash(String, String)?

        # Specifies whether the metadata is copied from the source object or replaced with metadata that's
        # provided in the request. When copying an object, you can preserve all metadata (the default) or
        # specify new metadata. If this header isn’t specified, COPY is the default behavior. General purpose
        # bucket - For general purpose buckets, when you grant permissions, you can use the
        # s3:x-amz-metadata-directive condition key to enforce certain metadata behavior when objects are
        # uploaded. For more information, see Amazon S3 condition key examples in the Amazon S3 User Guide .
        # x-amz-website-redirect-location is unique to each object and is not copied when using the
        # x-amz-metadata-directive header. To copy the value, you must specify x-amz-website-redirect-location
        # in the request header.

        @[JSON::Field(key: "x-amz-metadata-directive")]
        getter metadata_directive : String?

        # Specifies whether you want to apply a legal hold to the object copy. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-legal-hold")]
        getter object_lock_legal_hold_status : String?

        # The Object Lock mode that you want to apply to the object copy. This functionality is not supported
        # for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-mode")]
        getter object_lock_mode : String?

        # The date and time when you want the Object Lock of the object copy to expire. This functionality is
        # not supported for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-retain-until-date")]
        getter object_lock_retain_until_date : Time?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Specifies the algorithm to use when encrypting the object (for example, AES256 ). When you perform a
        # CopyObject operation, if you want to use a different type of encryption setting for the target
        # object, you can specify appropriate encryption-related headers to encrypt the target object with an
        # Amazon S3 managed key, a KMS key, or a customer-provided key. If the encryption setting in your
        # request is different from the default encryption configuration of the destination bucket, the
        # encryption setting in your request takes precedence. This functionality is not supported when the
        # destination bucket is a directory bucket.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value
        # is used to store the object and then it is discarded. Amazon S3 does not store the encryption key.
        # The key must be appropriate for use with the algorithm specified in the
        # x-amz-server-side-encryption-customer-algorithm header. This functionality is not supported when the
        # destination bucket is a directory bucket.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this
        # header for a message integrity check to ensure that the encryption key was transmitted without
        # error. This functionality is not supported when the destination bucket is a directory bucket.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # Specifies the Amazon Web Services KMS Encryption Context as an additional encryption context to use
        # for the destination object encryption. The value of this header is a base64-encoded UTF-8 string
        # holding JSON with the encryption context key-value pairs. General purpose buckets - This value must
        # be explicitly added to specify encryption context for CopyObject requests if you want an additional
        # encryption context for your destination object. The additional encryption context of the source
        # object won't be copied to the destination object. For more information, see Encryption context in
        # the Amazon S3 User Guide . Directory buckets - You can optionally provide an explicit encryption
        # context value. The value must match the default encryption context - the bucket Amazon Resource Name
        # (ARN). An additional encryption context value is not supported.

        @[JSON::Field(key: "x-amz-server-side-encryption-context")]
        getter ssekms_encryption_context : String?

        # Specifies the KMS key ID (Key ID, Key ARN, or Key Alias) to use for object encryption. All GET and
        # PUT requests for an object protected by KMS will fail if they're not made via SSL or using SigV4.
        # For information about configuring any of the officially supported Amazon Web Services SDKs and
        # Amazon Web Services CLI, see Specifying the Signature Version in Request Authentication in the
        # Amazon S3 User Guide . Directory buckets - To encrypt data using SSE-KMS, it's recommended to
        # specify the x-amz-server-side-encryption header to aws:kms . Then, the
        # x-amz-server-side-encryption-aws-kms-key-id header implicitly uses the bucket's default KMS customer
        # managed key ID. If you want to explicitly set the x-amz-server-side-encryption-aws-kms-key-id
        # header, it must match the bucket's default customer managed key (using key ID or ARN, not alias).
        # Your SSE-KMS configuration can only support 1 customer managed key per directory bucket's lifetime.
        # The Amazon Web Services managed key ( aws/s3 ) isn't supported. Incorrect key specification results
        # in an HTTP 400 Bad Request error.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when storing this object in Amazon S3. Unrecognized or
        # unsupported values won’t write a destination object and will receive a 400 Bad Request response.
        # Amazon S3 automatically encrypts all new objects that are copied to an S3 bucket. When copying an
        # object, if you don't specify encryption information in your copy request, the encryption setting of
        # the target object is set to the default encryption configuration of the destination bucket. By
        # default, all buckets have a base level of encryption configuration that uses server-side encryption
        # with Amazon S3 managed keys (SSE-S3). If the destination bucket has a different default encryption
        # configuration, Amazon S3 uses the corresponding encryption key to encrypt the target object copy.
        # With server-side encryption, Amazon S3 encrypts your data as it writes your data to disks in its
        # data centers and decrypts the data when you access it. For more information about server-side
        # encryption, see Using Server-Side Encryption in the Amazon S3 User Guide . General purpose buckets
        # For general purpose buckets, there are the following supported options for server-side encryption:
        # server-side encryption with Key Management Service (KMS) keys (SSE-KMS), dual-layer server-side
        # encryption with Amazon Web Services KMS keys (DSSE-KMS), and server-side encryption with
        # customer-provided encryption keys (SSE-C). Amazon S3 uses the corresponding KMS key, or a
        # customer-provided key to encrypt the target object copy. When you perform a CopyObject operation, if
        # you want to use a different type of encryption setting for the target object, you can specify
        # appropriate encryption-related headers to encrypt the target object with an Amazon S3 managed key, a
        # KMS key, or a customer-provided key. If the encryption setting in your request is different from the
        # default encryption configuration of the destination bucket, the encryption setting in your request
        # takes precedence. Directory buckets For directory buckets, there are only two supported options for
        # server-side encryption: server-side encryption with Amazon S3 managed keys (SSE-S3) ( AES256 ) and
        # server-side encryption with KMS keys (SSE-KMS) ( aws:kms ). We recommend that the bucket's default
        # encryption uses the desired encryption configuration and you don't override the bucket default
        # encryption in your CreateSession requests or PUT object requests. Then, new objects are
        # automatically encrypted with the desired encryption settings. For more information, see Protecting
        # data with server-side encryption in the Amazon S3 User Guide . For more information about the
        # encryption overriding behaviors in directory buckets, see Specifying server-side encryption with KMS
        # for new object uploads . To encrypt new object copies to a directory bucket with SSE-KMS, we
        # recommend you specify SSE-KMS as the directory bucket's default encryption configuration with a KMS
        # key (specifically, a customer managed key ). The Amazon Web Services managed key ( aws/s3 ) isn't
        # supported. Your SSE-KMS configuration can only support 1 customer managed key per directory bucket
        # for the lifetime of the bucket. After you specify a customer managed key for SSE-KMS, you can't
        # override the customer managed key for the bucket's SSE-KMS configuration. Then, when you perform a
        # CopyObject operation and want to specify server-side encryption settings for new object copies with
        # SSE-KMS in the encryption-related request headers, you must ensure the encryption key is the same
        # customer managed key that you specified for the directory bucket's default encryption configuration.
        # S3 access points for Amazon FSx - When accessing data stored in Amazon FSx file systems using S3
        # access points, the only valid server side encryption option is aws:fsx . All Amazon FSx file systems
        # have encryption configured by default and are encrypted at rest. Data is automatically encrypted
        # before being written to the file system, and automatically decrypted as it is read. These processes
        # are handled transparently by Amazon FSx.

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # If the x-amz-storage-class header is not used, the copied object will be stored in the STANDARD
        # Storage Class by default. The STANDARD storage class provides high durability and high availability.
        # Depending on performance needs, you can specify a different Storage Class. Directory buckets -
        # Directory buckets only support EXPRESS_ONEZONE (the S3 Express One Zone storage class) in
        # Availability Zones and ONEZONE_IA (the S3 One Zone-Infrequent Access storage class) in Dedicated
        # Local Zones. Unsupported storage class values won't write a destination object and will respond with
        # the HTTP status code 400 Bad Request . Amazon S3 on Outposts - S3 on Outposts only uses the OUTPOSTS
        # Storage Class. You can use the CopyObject action to change the storage class of an object that is
        # already stored in Amazon S3 by using the x-amz-storage-class header. For more information, see
        # Storage Classes in the Amazon S3 User Guide . Before using an object as a source object for the copy
        # operation, you must restore a copy of it if it meets any of the following conditions: The storage
        # class of the source object is GLACIER or DEEP_ARCHIVE . The storage class of the source object is
        # INTELLIGENT_TIERING and it's S3 Intelligent-Tiering access tier is Archive Access or Deep Archive
        # Access . For more information, see RestoreObject and Copying Objects in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-storage-class")]
        getter storage_class : String?

        # The tag-set for the object copy in the destination bucket. This value must be used in conjunction
        # with the x-amz-tagging-directive if you choose REPLACE for the x-amz-tagging-directive . If you
        # choose COPY for the x-amz-tagging-directive , you don't need to set the x-amz-tagging header,
        # because the tag-set will be copied from the source object directly. The tag-set must be encoded as
        # URL Query parameters. The default value is the empty value. Directory buckets - For directory
        # buckets in a CopyObject operation, only the empty tag-set is supported. Any requests that attempt to
        # write non-empty tags into directory buckets will receive a 501 Not Implemented status code. When the
        # destination bucket is a directory bucket, you will receive a 501 Not Implemented response in any of
        # the following situations: When you attempt to COPY the tag-set from an S3 source object that has
        # non-empty tags. When you attempt to REPLACE the tag-set of a source object and set a non-empty value
        # to x-amz-tagging . When you don't set the x-amz-tagging-directive header and the source object has
        # non-empty tags. This is because the default value of x-amz-tagging-directive is COPY . Because only
        # the empty tag-set is supported for directory buckets in a CopyObject operation, the following
        # situations are allowed: When you attempt to COPY the tag-set from a directory bucket source object
        # that has no tags to a general purpose bucket. It copies an empty tag-set to the destination object.
        # When you attempt to REPLACE the tag-set of a directory bucket source object and set the
        # x-amz-tagging value of the directory bucket destination object to empty. When you attempt to REPLACE
        # the tag-set of a general purpose bucket source object that has non-empty tags and set the
        # x-amz-tagging value of the directory bucket destination object to empty. When you attempt to REPLACE
        # the tag-set of a directory bucket source object and don't set the x-amz-tagging value of the
        # directory bucket destination object. This is because the default value of x-amz-tagging is the empty
        # value.

        @[JSON::Field(key: "x-amz-tagging")]
        getter tagging : String?

        # Specifies whether the object tag-set is copied from the source object or replaced with the tag-set
        # that's provided in the request. The default value is COPY . Directory buckets - For directory
        # buckets in a CopyObject operation, only the empty tag-set is supported. Any requests that attempt to
        # write non-empty tags into directory buckets will receive a 501 Not Implemented status code. When the
        # destination bucket is a directory bucket, you will receive a 501 Not Implemented response in any of
        # the following situations: When you attempt to COPY the tag-set from an S3 source object that has
        # non-empty tags. When you attempt to REPLACE the tag-set of a source object and set a non-empty value
        # to x-amz-tagging . When you don't set the x-amz-tagging-directive header and the source object has
        # non-empty tags. This is because the default value of x-amz-tagging-directive is COPY . Because only
        # the empty tag-set is supported for directory buckets in a CopyObject operation, the following
        # situations are allowed: When you attempt to COPY the tag-set from a directory bucket source object
        # that has no tags to a general purpose bucket. It copies an empty tag-set to the destination object.
        # When you attempt to REPLACE the tag-set of a directory bucket source object and set the
        # x-amz-tagging value of the directory bucket destination object to empty. When you attempt to REPLACE
        # the tag-set of a general purpose bucket source object that has non-empty tags and set the
        # x-amz-tagging value of the directory bucket destination object to empty. When you attempt to REPLACE
        # the tag-set of a directory bucket source object and don't set the x-amz-tagging value of the
        # directory bucket destination object. This is because the default value of x-amz-tagging is the empty
        # value.

        @[JSON::Field(key: "x-amz-tagging-directive")]
        getter tagging_directive : String?

        # If the destination bucket is configured as a website, redirects requests for this object copy to
        # another object in the same bucket or to an external URL. Amazon S3 stores the value of this header
        # in the object metadata. This value is unique to each object and is not copied when using the
        # x-amz-metadata-directive header. Instead, you may opt to provide this header in combination with the
        # x-amz-metadata-directive header. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-website-redirect-location")]
        getter website_redirect_location : String?

        def initialize(
          @bucket : String,
          @copy_source : String,
          @key : String,
          @acl : String? = nil,
          @bucket_key_enabled : Bool? = nil,
          @cache_control : String? = nil,
          @checksum_algorithm : String? = nil,
          @content_disposition : String? = nil,
          @content_encoding : String? = nil,
          @content_language : String? = nil,
          @content_type : String? = nil,
          @copy_source_if_match : String? = nil,
          @copy_source_if_modified_since : Time? = nil,
          @copy_source_if_none_match : String? = nil,
          @copy_source_if_unmodified_since : Time? = nil,
          @copy_source_sse_customer_algorithm : String? = nil,
          @copy_source_sse_customer_key : String? = nil,
          @copy_source_sse_customer_key_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @expected_source_bucket_owner : String? = nil,
          @expires : String? = nil,
          @grant_full_control : String? = nil,
          @grant_read : String? = nil,
          @grant_read_acp : String? = nil,
          @grant_write_acp : String? = nil,
          @if_match : String? = nil,
          @if_none_match : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @metadata_directive : String? = nil,
          @object_lock_legal_hold_status : String? = nil,
          @object_lock_mode : String? = nil,
          @object_lock_retain_until_date : Time? = nil,
          @request_payer : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_encryption_context : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @storage_class : String? = nil,
          @tagging : String? = nil,
          @tagging_directive : String? = nil,
          @website_redirect_location : String? = nil
        )
        end
      end

      # Container for all response elements.

      struct CopyObjectResult
        include JSON::Serializable

        # The Base64 encoded, 32-bit CRC32 checksum of the object. This checksum is only present if the object
        # was uploaded with the object. For more information, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "ChecksumCRC32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. For more information, see Checking object integrity in the
        # Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC32C")]
        getter checksum_crc32_c : String?

        # The Base64 encoded, 64-bit CRC64NVME checksum of the object. This checksum is present if the object
        # being copied was uploaded with the CRC64NVME checksum algorithm, or if the object was uploaded
        # without a checksum (and Amazon S3 added the default checksum, CRC64NVME , to the uploaded object).
        # For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC64NVME")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 digest of the object. This checksum is only present if the checksum
        # was uploaded with the object. For more information, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "ChecksumSHA1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 digest of the object. This checksum is only present if the
        # checksum was uploaded with the object. For more information, see Checking object integrity in the
        # Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumSHA256")]
        getter checksum_sha256 : String?

        # The checksum type that is used to calculate the object’s checksum value. For more information, see
        # Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumType")]
        getter checksum_type : String?

        # Returns the ETag of the new object. The ETag reflects only changes to the contents of an object, not
        # its metadata.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Creation date of the object.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        def initialize(
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @checksum_type : String? = nil,
          @e_tag : String? = nil,
          @last_modified : Time? = nil
        )
        end
      end

      # Container for all response elements.

      struct CopyPartResult
        include JSON::Serializable

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 32-bit CRC32 checksum of the
        # part. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC32")]
        getter checksum_crc32 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 32-bit CRC32C checksum of the
        # part. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC32C")]
        getter checksum_crc32_c : String?

        # The Base64 encoded, 64-bit CRC64NVME checksum of the part. This checksum is present if the multipart
        # upload request was created with the CRC64NVME checksum algorithm to the uploaded object). For more
        # information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC64NVME")]
        getter checksum_crc64_nvme : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 160-bit SHA1 checksum of the
        # part. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumSHA1")]
        getter checksum_sha1 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 256-bit SHA256 checksum of the
        # part. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumSHA256")]
        getter checksum_sha256 : String?

        # Entity tag of the object.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Date and time at which the object was uploaded.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        def initialize(
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @e_tag : String? = nil,
          @last_modified : Time? = nil
        )
        end
      end

      # The configuration information for the bucket.

      struct CreateBucketConfiguration
        include JSON::Serializable

        # Specifies the information about the bucket that will be created. This functionality is only
        # supported by directory buckets.

        @[JSON::Field(key: "Bucket")]
        getter bucket : Types::BucketInfo?

        # Specifies the location where the bucket will be created. Directory buckets - The location type is
        # Availability Zone or Local Zone. To use the Local Zone location type, your account must be enabled
        # for Local Zones. Otherwise, you get an HTTP 403 Forbidden error with the error code AccessDenied .
        # To learn more, see Enable accounts for Local Zones in the Amazon S3 User Guide . This functionality
        # is only supported by directory buckets.

        @[JSON::Field(key: "Location")]
        getter location : Types::LocationInfo?

        # Specifies the Region where the bucket will be created. You might choose a Region to optimize
        # latency, minimize costs, or address regulatory requirements. For example, if you reside in Europe,
        # you will probably find it advantageous to create buckets in the Europe (Ireland) Region. If you
        # don't specify a Region, the bucket is created in the US East (N. Virginia) Region (us-east-1) by
        # default. Configurations using the value EU will create a bucket in eu-west-1 . For a list of the
        # valid values for all of the Amazon Web Services Regions, see Regions and Endpoints . This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "LocationConstraint")]
        getter location_constraint : String?

        # An array of tags that you can apply to the bucket that you're creating. Tags are key-value pairs of
        # metadata used to categorize and organize your buckets, track costs, and control access. You must
        # have the s3:TagResource permission to create a general purpose bucket with tags or the
        # s3express:TagResource permission to create a directory bucket with tags. When creating buckets with
        # tags, note that tag-based conditions using aws:ResourceTag and s3:BucketTag condition keys are
        # applicable only after ABAC is enabled on the bucket. To learn more, see Enabling ABAC in general
        # purpose buckets .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @bucket : Types::BucketInfo? = nil,
          @location : Types::LocationInfo? = nil,
          @location_constraint : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateBucketMetadataConfigurationRequest
        include JSON::Serializable

        # The general purpose bucket that you want to create the metadata configuration for.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The contents of your metadata configuration.

        @[JSON::Field(key: "MetadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfiguration

        # The checksum algorithm to use with your metadata configuration.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Content-MD5 header for the metadata configuration.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The expected owner of the general purpose bucket that corresponds to your metadata configuration.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @metadata_configuration : Types::MetadataConfiguration,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct CreateBucketMetadataTableConfigurationRequest
        include JSON::Serializable

        # The general purpose bucket that you want to create the metadata table configuration for.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The contents of your metadata table configuration.

        @[JSON::Field(key: "MetadataTableConfiguration")]
        getter metadata_table_configuration : Types::MetadataTableConfiguration

        # The checksum algorithm to use with your metadata table configuration.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Content-MD5 header for the metadata table configuration.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The expected owner of the general purpose bucket that corresponds to your metadata table
        # configuration.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @metadata_table_configuration : Types::MetadataTableConfiguration,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct CreateBucketOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 bucket. ARNs uniquely identify Amazon Web Services
        # resources across all of Amazon Web Services. This parameter is only supported for S3 directory
        # buckets. For more information, see Using tags with directory buckets .

        @[JSON::Field(key: "x-amz-bucket-arn")]
        getter bucket_arn : String?

        # A forward slash followed by the name of the bucket.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @bucket_arn : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateBucketRequest
        include JSON::Serializable

        # The name of the bucket to create. General purpose buckets - For information about bucket naming
        # restrictions, see Bucket naming rules in the Amazon S3 User Guide . Directory buckets - When you use
        # this operation with a directory bucket, you must use path-style requests in the format
        # https://s3express-control. region-code .amazonaws.com/ bucket-name . Virtual-hosted-style requests
        # aren't supported. Directory bucket names must be unique in the chosen Zone (Availability Zone or
        # Local Zone). Bucket names must also follow the format bucket-base-name -- zone-id --x-s3 (for
        # example, DOC-EXAMPLE-BUCKET -- usw2-az1 --x-s3 ). For information about bucket naming restrictions,
        # see Directory bucket naming rules in the Amazon S3 User Guide

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The canned ACL to apply to the bucket. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-acl")]
        getter acl : String?

        # The configuration information for the bucket.

        @[JSON::Field(key: "CreateBucketConfiguration")]
        getter create_bucket_configuration : Types::CreateBucketConfiguration?

        # Allows grantee the read, write, read ACP, and write ACP permissions on the bucket. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-grant-full-control")]
        getter grant_full_control : String?

        # Allows grantee to list the objects in the bucket. This functionality is not supported for directory
        # buckets.

        @[JSON::Field(key: "x-amz-grant-read")]
        getter grant_read : String?

        # Allows grantee to read the bucket ACL. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-grant-read-acp")]
        getter grant_read_acp : String?

        # Allows grantee to create new objects in the bucket. For the bucket and object owners of existing
        # objects, also allows deletions and overwrites of those objects. This functionality is not supported
        # for directory buckets.

        @[JSON::Field(key: "x-amz-grant-write")]
        getter grant_write : String?

        # Allows grantee to write the ACL for the applicable bucket. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-grant-write-acp")]
        getter grant_write_acp : String?

        # Specifies whether you want S3 Object Lock to be enabled for the new bucket. This functionality is
        # not supported for directory buckets.

        @[JSON::Field(key: "x-amz-bucket-object-lock-enabled")]
        getter object_lock_enabled_for_bucket : Bool?


        @[JSON::Field(key: "x-amz-object-ownership")]
        getter object_ownership : String?

        def initialize(
          @bucket : String,
          @acl : String? = nil,
          @create_bucket_configuration : Types::CreateBucketConfiguration? = nil,
          @grant_full_control : String? = nil,
          @grant_read : String? = nil,
          @grant_read_acp : String? = nil,
          @grant_write : String? = nil,
          @grant_write_acp : String? = nil,
          @object_lock_enabled_for_bucket : Bool? = nil,
          @object_ownership : String? = nil
        )
        end
      end


      struct CreateMultipartUploadOutput
        include JSON::Serializable

        # If the bucket has a lifecycle rule configured with an action to abort incomplete multipart uploads
        # and the prefix in the lifecycle rule matches the object name in the request, the response includes
        # this header. The header indicates when the initiated multipart upload becomes eligible for an abort
        # operation. For more information, see Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle
        # Configuration in the Amazon S3 User Guide . The response also includes the x-amz-abort-rule-id
        # header that provides the ID of the lifecycle configuration rule that defines the abort action. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-abort-date")]
        getter abort_date : Time?

        # This header is returned along with the x-amz-abort-date header. It identifies the applicable
        # lifecycle configuration rule that defines the action to abort incomplete multipart uploads. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-abort-rule-id")]
        getter abort_rule_id : String?

        # The name of the bucket to which the multipart upload was initiated. Does not return the access point
        # ARN or access point alias if used. Access points are not supported by directory buckets.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with Key
        # Management Service (KMS) keys (SSE-KMS).

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # The algorithm that was used to create a checksum of the object.

        @[JSON::Field(key: "x-amz-checksum-algorithm")]
        getter checksum_algorithm : String?

        # Indicates the checksum type that you want Amazon S3 to use to calculate the object’s checksum value.
        # For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-type")]
        getter checksum_type : String?

        # Object key for which the multipart upload was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to confirm the encryption algorithm that's used. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to provide the round-trip message integrity verification of the
        # customer-provided encryption key. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # If present, indicates the Amazon Web Services KMS Encryption Context to use for object encryption.
        # The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, which contains the
        # encryption context as key-value pairs.

        @[JSON::Field(key: "x-amz-server-side-encryption-context")]
        getter ssekms_encryption_context : String?

        # If present, indicates the ID of the KMS key that was used for object encryption.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
        # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid server
        # side encryption option is aws:fsx .

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # ID for the initiated multipart upload.

        @[JSON::Field(key: "UploadId")]
        getter upload_id : String?

        def initialize(
          @abort_date : Time? = nil,
          @abort_rule_id : String? = nil,
          @bucket : String? = nil,
          @bucket_key_enabled : Bool? = nil,
          @checksum_algorithm : String? = nil,
          @checksum_type : String? = nil,
          @key : String? = nil,
          @request_charged : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_encryption_context : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @upload_id : String? = nil
        )
        end
      end


      struct CreateMultipartUploadRequest
        include JSON::Serializable

        # The name of the bucket where the multipart upload is initiated and where the object is uploaded.
        # Directory buckets - When you use this operation with a directory bucket, you must use
        # virtual-hosted-style requests in the format Bucket-name .s3express- zone-id . region-code
        # .amazonaws.com . Path-style requests are not supported. Directory bucket names must be unique in the
        # chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format bucket-base-name
        # -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about
        # bucket naming restrictions, see Directory bucket naming rules in the Amazon S3 User Guide . Access
        # points - When you use this action with an access point for general purpose buckets, you must provide
        # the alias of the access point in place of the bucket name or specify the access point ARN. When you
        # use this action with an access point for directory buckets, you must provide the access point name
        # in place of the bucket name. When using the access point ARN, you must direct requests to the access
        # point hostname. The access point hostname takes the form AccessPointName - AccountId
        # .s3-accesspoint. Region .amazonaws.com. When using this action with an access point through the
        # Amazon Web Services SDKs, you provide the access point ARN in place of the bucket name. For more
        # information about access point ARNs, see Using access points in the Amazon S3 User Guide . Object
        # Lambda access points are not supported by directory buckets. S3 on Outposts - When you use this
        # action with S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on
        # Outposts hostname takes the form AccessPointName - AccountId . outpostID .s3-outposts. Region
        # .amazonaws.com . When you use this action with S3 on Outposts, the destination bucket must be the
        # Outposts access point ARN or the access point alias. For more information about S3 on Outposts, see
        # What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Object key for which the multipart upload is to be initiated.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The canned ACL to apply to the object. Amazon S3 supports a set of predefined ACLs, known as canned
        # ACLs . Each canned ACL has a predefined set of grantees and permissions. For more information, see
        # Canned ACL in the Amazon S3 User Guide . By default, all objects are private. Only the owner has
        # full access control. When uploading an object, you can grant access permissions to individual Amazon
        # Web Services accounts or to predefined groups defined by Amazon S3. These permissions are then added
        # to the access control list (ACL) on the new object. For more information, see Using ACLs . One way
        # to grant the permissions using the request headers is to specify a canned ACL with the x-amz-acl
        # request header. This functionality is not supported for directory buckets. This functionality is not
        # supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-acl")]
        getter acl : String?

        # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
        # encryption using Key Management Service (KMS) keys (SSE-KMS). General purpose buckets - Setting this
        # header to true causes Amazon S3 to use an S3 Bucket Key for object encryption with SSE-KMS. Also,
        # specifying this header with a PUT action doesn't affect bucket-level settings for S3 Bucket Key.
        # Directory buckets - S3 Bucket Keys are always enabled for GET and PUT operations in a directory
        # bucket and can’t be disabled. S3 Bucket Keys aren't supported, when you copy SSE-KMS encrypted
        # objects from general purpose buckets to directory buckets, from directory buckets to general purpose
        # buckets, or between directory buckets, through CopyObject , UploadPartCopy , the Copy operation in
        # Batch Operations , or the import jobs . In this case, Amazon S3 makes a call to KMS every time a
        # copy request is made for a KMS-encrypted object.

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # Specifies caching behavior along the request/reply chain.

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # Indicates the algorithm that you want Amazon S3 to use to create the checksum for the object. For
        # more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-algorithm")]
        getter checksum_algorithm : String?

        # Indicates the checksum type that you want Amazon S3 to use to calculate the object’s checksum value.
        # For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-type")]
        getter checksum_type : String?

        # Specifies presentational information for the object.

        @[JSON::Field(key: "Content-Disposition")]
        getter content_disposition : String?

        # Specifies what content encodings have been applied to the object and thus what decoding mechanisms
        # must be applied to obtain the media-type referenced by the Content-Type header field. For directory
        # buckets, only the aws-chunked value is supported in this header field.

        @[JSON::Field(key: "Content-Encoding")]
        getter content_encoding : String?

        # The language that the content is in.

        @[JSON::Field(key: "Content-Language")]
        getter content_language : String?

        # A standard MIME type describing the format of the object data.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # The date and time at which the object is no longer cacheable.

        @[JSON::Field(key: "Expires")]
        getter expires : String?

        # Specify access permissions explicitly to give the grantee READ, READ_ACP, and WRITE_ACP permissions
        # on the object. By default, all objects are private. Only the owner has full access control. When
        # uploading an object, you can use this header to explicitly grant access permissions to specific
        # Amazon Web Services accounts or groups. This header maps to specific permissions that Amazon S3
        # supports in an ACL. For more information, see Access Control List (ACL) Overview in the Amazon S3
        # User Guide . You specify each grantee as a type=value pair, where the type is one of the following:
        # id – if the value specified is the canonical user ID of an Amazon Web Services account uri – if you
        # are granting permissions to a predefined group emailAddress – if the value specified is the email
        # address of an Amazon Web Services account Using email addresses to specify a grantee is only
        # supported in the following Amazon Web Services Regions: US East (N. Virginia) US West (N.
        # California) US West (Oregon) Asia Pacific (Singapore) Asia Pacific (Sydney) Asia Pacific (Tokyo)
        # Europe (Ireland) South America (São Paulo) For a list of all the Amazon S3 supported Regions and
        # endpoints, see Regions and Endpoints in the Amazon Web Services General Reference. For example, the
        # following x-amz-grant-read header grants the Amazon Web Services accounts identified by account IDs
        # permissions to read object data and its metadata: x-amz-grant-read: id="11112222333",
        # id="444455556666" This functionality is not supported for directory buckets. This functionality is
        # not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-full-control")]
        getter grant_full_control : String?

        # Specify access permissions explicitly to allow grantee to read the object data and its metadata. By
        # default, all objects are private. Only the owner has full access control. When uploading an object,
        # you can use this header to explicitly grant access permissions to specific Amazon Web Services
        # accounts or groups. This header maps to specific permissions that Amazon S3 supports in an ACL. For
        # more information, see Access Control List (ACL) Overview in the Amazon S3 User Guide . You specify
        # each grantee as a type=value pair, where the type is one of the following: id – if the value
        # specified is the canonical user ID of an Amazon Web Services account uri – if you are granting
        # permissions to a predefined group emailAddress – if the value specified is the email address of an
        # Amazon Web Services account Using email addresses to specify a grantee is only supported in the
        # following Amazon Web Services Regions: US East (N. Virginia) US West (N. California) US West
        # (Oregon) Asia Pacific (Singapore) Asia Pacific (Sydney) Asia Pacific (Tokyo) Europe (Ireland) South
        # America (São Paulo) For a list of all the Amazon S3 supported Regions and endpoints, see Regions and
        # Endpoints in the Amazon Web Services General Reference. For example, the following x-amz-grant-read
        # header grants the Amazon Web Services accounts identified by account IDs permissions to read object
        # data and its metadata: x-amz-grant-read: id="11112222333", id="444455556666" This functionality is
        # not supported for directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-read")]
        getter grant_read : String?

        # Specify access permissions explicitly to allows grantee to read the object ACL. By default, all
        # objects are private. Only the owner has full access control. When uploading an object, you can use
        # this header to explicitly grant access permissions to specific Amazon Web Services accounts or
        # groups. This header maps to specific permissions that Amazon S3 supports in an ACL. For more
        # information, see Access Control List (ACL) Overview in the Amazon S3 User Guide . You specify each
        # grantee as a type=value pair, where the type is one of the following: id – if the value specified is
        # the canonical user ID of an Amazon Web Services account uri – if you are granting permissions to a
        # predefined group emailAddress – if the value specified is the email address of an Amazon Web
        # Services account Using email addresses to specify a grantee is only supported in the following
        # Amazon Web Services Regions: US East (N. Virginia) US West (N. California) US West (Oregon) Asia
        # Pacific (Singapore) Asia Pacific (Sydney) Asia Pacific (Tokyo) Europe (Ireland) South America (São
        # Paulo) For a list of all the Amazon S3 supported Regions and endpoints, see Regions and Endpoints in
        # the Amazon Web Services General Reference. For example, the following x-amz-grant-read header grants
        # the Amazon Web Services accounts identified by account IDs permissions to read object data and its
        # metadata: x-amz-grant-read: id="11112222333", id="444455556666" This functionality is not supported
        # for directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-read-acp")]
        getter grant_read_acp : String?

        # Specify access permissions explicitly to allows grantee to allow grantee to write the ACL for the
        # applicable object. By default, all objects are private. Only the owner has full access control. When
        # uploading an object, you can use this header to explicitly grant access permissions to specific
        # Amazon Web Services accounts or groups. This header maps to specific permissions that Amazon S3
        # supports in an ACL. For more information, see Access Control List (ACL) Overview in the Amazon S3
        # User Guide . You specify each grantee as a type=value pair, where the type is one of the following:
        # id – if the value specified is the canonical user ID of an Amazon Web Services account uri – if you
        # are granting permissions to a predefined group emailAddress – if the value specified is the email
        # address of an Amazon Web Services account Using email addresses to specify a grantee is only
        # supported in the following Amazon Web Services Regions: US East (N. Virginia) US West (N.
        # California) US West (Oregon) Asia Pacific (Singapore) Asia Pacific (Sydney) Asia Pacific (Tokyo)
        # Europe (Ireland) South America (São Paulo) For a list of all the Amazon S3 supported Regions and
        # endpoints, see Regions and Endpoints in the Amazon Web Services General Reference. For example, the
        # following x-amz-grant-read header grants the Amazon Web Services accounts identified by account IDs
        # permissions to read object data and its metadata: x-amz-grant-read: id="11112222333",
        # id="444455556666" This functionality is not supported for directory buckets. This functionality is
        # not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-write-acp")]
        getter grant_write_acp : String?

        # A map of metadata to store with the object in S3.

        @[JSON::Field(key: "x-amz-meta-")]
        getter metadata : Hash(String, String)?

        # Specifies whether you want to apply a legal hold to the uploaded object. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-legal-hold")]
        getter object_lock_legal_hold_status : String?

        # Specifies the Object Lock mode that you want to apply to the uploaded object. This functionality is
        # not supported for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-mode")]
        getter object_lock_mode : String?

        # Specifies the date and time when you want the Object Lock to expire. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-retain-until-date")]
        getter object_lock_retain_until_date : Time?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Specifies the algorithm to use when encrypting the object (for example, AES256). This functionality
        # is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value
        # is used to store the object and then it is discarded; Amazon S3 does not store the encryption key.
        # The key must be appropriate for use with the algorithm specified in the
        # x-amz-server-side-encryption-customer-algorithm header. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the customer-provided encryption key according to RFC 1321.
        # Amazon S3 uses this header for a message integrity check to ensure that the encryption key was
        # transmitted without error. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # Specifies the Amazon Web Services KMS Encryption Context to use for object encryption. The value of
        # this header is a Base64 encoded string of a UTF-8 encoded JSON, which contains the encryption
        # context as key-value pairs. Directory buckets - You can optionally provide an explicit encryption
        # context value. The value must match the default encryption context - the bucket Amazon Resource Name
        # (ARN). An additional encryption context value is not supported.

        @[JSON::Field(key: "x-amz-server-side-encryption-context")]
        getter ssekms_encryption_context : String?

        # Specifies the KMS key ID (Key ID, Key ARN, or Key Alias) to use for object encryption. If the KMS
        # key doesn't exist in the same account that's issuing the command, you must use the full Key ARN not
        # the Key ID. General purpose buckets - If you specify x-amz-server-side-encryption with aws:kms or
        # aws:kms:dsse , this header specifies the ID (Key ID, Key ARN, or Key Alias) of the KMS key to use.
        # If you specify x-amz-server-side-encryption:aws:kms or x-amz-server-side-encryption:aws:kms:dsse ,
        # but do not provide x-amz-server-side-encryption-aws-kms-key-id , Amazon S3 uses the Amazon Web
        # Services managed key ( aws/s3 ) to protect the data. Directory buckets - To encrypt data using
        # SSE-KMS, it's recommended to specify the x-amz-server-side-encryption header to aws:kms . Then, the
        # x-amz-server-side-encryption-aws-kms-key-id header implicitly uses the bucket's default KMS customer
        # managed key ID. If you want to explicitly set the x-amz-server-side-encryption-aws-kms-key-id
        # header, it must match the bucket's default customer managed key (using key ID or ARN, not alias).
        # Your SSE-KMS configuration can only support 1 customer managed key per directory bucket's lifetime.
        # The Amazon Web Services managed key ( aws/s3 ) isn't supported. Incorrect key specification results
        # in an HTTP 400 Bad Request error.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
        # Directory buckets - For directory buckets, there are only two supported options for server-side
        # encryption: server-side encryption with Amazon S3 managed keys (SSE-S3) ( AES256 ) and server-side
        # encryption with KMS keys (SSE-KMS) ( aws:kms ). We recommend that the bucket's default encryption
        # uses the desired encryption configuration and you don't override the bucket default encryption in
        # your CreateSession requests or PUT object requests. Then, new objects are automatically encrypted
        # with the desired encryption settings. For more information, see Protecting data with server-side
        # encryption in the Amazon S3 User Guide . For more information about the encryption overriding
        # behaviors in directory buckets, see Specifying server-side encryption with KMS for new object
        # uploads . In the Zonal endpoint API calls (except CopyObject and UploadPartCopy ) using the REST
        # API, the encryption request headers must match the encryption settings that are specified in the
        # CreateSession request. You can't override the values of the encryption settings (
        # x-amz-server-side-encryption , x-amz-server-side-encryption-aws-kms-key-id ,
        # x-amz-server-side-encryption-context , and x-amz-server-side-encryption-bucket-key-enabled ) that
        # are specified in the CreateSession request. You don't need to explicitly specify these encryption
        # settings values in Zonal endpoint API calls, and Amazon S3 will use the encryption settings values
        # from the CreateSession request to protect new objects in the directory bucket. When you use the CLI
        # or the Amazon Web Services SDKs, for CreateSession , the session token refreshes automatically to
        # avoid service interruptions when a session expires. The CLI or the Amazon Web Services SDKs use the
        # bucket's default encryption configuration for the CreateSession request. It's not supported to
        # override the encryption settings values in the CreateSession request. So in the Zonal endpoint API
        # calls (except CopyObject and UploadPartCopy ), the encryption request headers must match the default
        # encryption configuration of the directory bucket. S3 access points for Amazon FSx - When accessing
        # data stored in Amazon FSx file systems using S3 access points, the only valid server side encryption
        # option is aws:fsx . All Amazon FSx file systems have encryption configured by default and are
        # encrypted at rest. Data is automatically encrypted before being written to the file system, and
        # automatically decrypted as it is read. These processes are handled transparently by Amazon FSx.

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The STANDARD
        # storage class provides high durability and high availability. Depending on performance needs, you
        # can specify a different Storage Class. For more information, see Storage Classes in the Amazon S3
        # User Guide . Directory buckets only support EXPRESS_ONEZONE (the S3 Express One Zone storage class)
        # in Availability Zones and ONEZONE_IA (the S3 One Zone-Infrequent Access storage class) in Dedicated
        # Local Zones. Amazon S3 on Outposts only uses the OUTPOSTS Storage Class.

        @[JSON::Field(key: "x-amz-storage-class")]
        getter storage_class : String?

        # The tag-set for the object. The tag-set must be encoded as URL Query parameters. This functionality
        # is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-tagging")]
        getter tagging : String?

        # If the bucket is configured as a website, redirects requests for this object to another object in
        # the same bucket or to an external URL. Amazon S3 stores the value of this header in the object
        # metadata. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-website-redirect-location")]
        getter website_redirect_location : String?

        def initialize(
          @bucket : String,
          @key : String,
          @acl : String? = nil,
          @bucket_key_enabled : Bool? = nil,
          @cache_control : String? = nil,
          @checksum_algorithm : String? = nil,
          @checksum_type : String? = nil,
          @content_disposition : String? = nil,
          @content_encoding : String? = nil,
          @content_language : String? = nil,
          @content_type : String? = nil,
          @expected_bucket_owner : String? = nil,
          @expires : String? = nil,
          @grant_full_control : String? = nil,
          @grant_read : String? = nil,
          @grant_read_acp : String? = nil,
          @grant_write_acp : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @object_lock_legal_hold_status : String? = nil,
          @object_lock_mode : String? = nil,
          @object_lock_retain_until_date : Time? = nil,
          @request_payer : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_encryption_context : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @storage_class : String? = nil,
          @tagging : String? = nil,
          @website_redirect_location : String? = nil
        )
        end
      end


      struct CreateSessionOutput
        include JSON::Serializable

        # The established temporary security credentials for the created session.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::SessionCredentials

        # Indicates whether to use an S3 Bucket Key for server-side encryption with KMS keys (SSE-KMS).

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # If present, indicates the Amazon Web Services KMS Encryption Context to use for object encryption.
        # The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, which contains the
        # encryption context as key-value pairs. This value is stored as object metadata and automatically
        # gets passed on to Amazon Web Services KMS for future GetObject operations on this object.

        @[JSON::Field(key: "x-amz-server-side-encryption-context")]
        getter ssekms_encryption_context : String?

        # If you specify x-amz-server-side-encryption with aws:kms , this header indicates the ID of the KMS
        # symmetric encryption customer managed key that was used for object encryption.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when you store objects in the directory bucket. When
        # accessing data stored in Amazon FSx file systems using S3 access points, the only valid server side
        # encryption option is aws:fsx .

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        def initialize(
          @credentials : Types::SessionCredentials,
          @bucket_key_enabled : Bool? = nil,
          @ssekms_encryption_context : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil
        )
        end
      end


      struct CreateSessionRequest
        include JSON::Serializable

        # The name of the bucket that you create a session for.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
        # encryption using KMS keys (SSE-KMS). S3 Bucket Keys are always enabled for GET and PUT operations in
        # a directory bucket and can’t be disabled. S3 Bucket Keys aren't supported, when you copy SSE-KMS
        # encrypted objects from general purpose buckets to directory buckets, from directory buckets to
        # general purpose buckets, or between directory buckets, through CopyObject , UploadPartCopy , the
        # Copy operation in Batch Operations , or the import jobs . In this case, Amazon S3 makes a call to
        # KMS every time a copy request is made for a KMS-encrypted object.

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # Specifies the Amazon Web Services KMS Encryption Context as an additional encryption context to use
        # for object encryption. The value of this header is a Base64 encoded string of a UTF-8 encoded JSON,
        # which contains the encryption context as key-value pairs. This value is stored as object metadata
        # and automatically gets passed on to Amazon Web Services KMS for future GetObject operations on this
        # object. General purpose buckets - This value must be explicitly added during CopyObject operations
        # if you want an additional encryption context for your object. For more information, see Encryption
        # context in the Amazon S3 User Guide . Directory buckets - You can optionally provide an explicit
        # encryption context value. The value must match the default encryption context - the bucket Amazon
        # Resource Name (ARN). An additional encryption context value is not supported.

        @[JSON::Field(key: "x-amz-server-side-encryption-context")]
        getter ssekms_encryption_context : String?

        # If you specify x-amz-server-side-encryption with aws:kms , you must specify the
        # x-amz-server-side-encryption-aws-kms-key-id header with the ID (Key ID or Key ARN) of the KMS
        # symmetric encryption customer managed key to use. Otherwise, you get an HTTP 400 Bad Request error.
        # Only use the key ID or key ARN. The key alias format of the KMS key isn't supported. Also, if the
        # KMS key doesn't exist in the same account that't issuing the command, you must use the full Key ARN
        # not the Key ID. Your SSE-KMS configuration can only support 1 customer managed key per directory
        # bucket's lifetime. The Amazon Web Services managed key ( aws/s3 ) isn't supported.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm to use when you store objects in the directory bucket. For
        # directory buckets, there are only two supported options for server-side encryption: server-side
        # encryption with Amazon S3 managed keys (SSE-S3) ( AES256 ) and server-side encryption with KMS keys
        # (SSE-KMS) ( aws:kms ). By default, Amazon S3 encrypts data with SSE-S3. For more information, see
        # Protecting data with server-side encryption in the Amazon S3 User Guide . S3 access points for
        # Amazon FSx - When accessing data stored in Amazon FSx file systems using S3 access points, the only
        # valid server side encryption option is aws:fsx . All Amazon FSx file systems have encryption
        # configured by default and are encrypted at rest. Data is automatically encrypted before being
        # written to the file system, and automatically decrypted as it is read. These processes are handled
        # transparently by Amazon FSx.

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # Specifies the mode of the session that will be created, either ReadWrite or ReadOnly . By default, a
        # ReadWrite session is created. A ReadWrite session is capable of executing all the Zonal endpoint API
        # operations on a directory bucket. A ReadOnly session is constrained to execute the following Zonal
        # endpoint API operations: GetObject , HeadObject , ListObjectsV2 , GetObjectAttributes , ListParts ,
        # and ListMultipartUploads .

        @[JSON::Field(key: "x-amz-create-session-mode")]
        getter session_mode : String?

        def initialize(
          @bucket : String,
          @bucket_key_enabled : Bool? = nil,
          @ssekms_encryption_context : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @session_mode : String? = nil
        )
        end
      end

      # The container element for optionally specifying the default Object Lock retention settings for new
      # objects placed in the specified bucket. The DefaultRetention settings require both a mode and a
      # period. The DefaultRetention period can be either Days or Years but you must select one. You cannot
      # specify Days and Years at the same time.

      struct DefaultRetention
        include JSON::Serializable

        # The number of days that you want to specify for the default retention period. Must be used with Mode
        # .

        @[JSON::Field(key: "Days")]
        getter days : Int32?

        # The default Object Lock retention mode you want to apply to new objects placed in the specified
        # bucket. Must be used with either Days or Years .

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The number of years that you want to specify for the default retention period. Must be used with
        # Mode .

        @[JSON::Field(key: "Years")]
        getter years : Int32?

        def initialize(
          @days : Int32? = nil,
          @mode : String? = nil,
          @years : Int32? = nil
        )
        end
      end

      # Container for the objects to delete.

      struct Delete
        include JSON::Serializable

        # The object to delete. Directory buckets - For directory buckets, an object that's composed entirely
        # of whitespace characters is not supported by the DeleteObjects API operation. The request will
        # receive a 400 Bad Request error and none of the objects in the request will be deleted.

        @[JSON::Field(key: "Object")]
        getter objects : Array(Types::ObjectIdentifier)

        # Element to enable quiet mode for the request. When you add this element, you must set its value to
        # true .

        @[JSON::Field(key: "Quiet")]
        getter quiet : Bool?

        def initialize(
          @objects : Array(Types::ObjectIdentifier),
          @quiet : Bool? = nil
        )
        end
      end


      struct DeleteBucketAnalyticsConfigurationRequest
        include JSON::Serializable

        # The name of the bucket from which an analytics configuration is deleted.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID that identifies the analytics configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketCorsRequest
        include JSON::Serializable

        # Specifies the bucket whose cors configuration is being deleted.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketEncryptionRequest
        include JSON::Serializable

        # The name of the bucket containing the server-side encryption configuration to delete. Directory
        # buckets - When you use this operation with a directory bucket, you must use path-style requests in
        # the format https://s3express-control. region-code .amazonaws.com/ bucket-name . Virtual-hosted-style
        # requests aren't supported. Directory bucket names must be unique in the chosen Zone (Availability
        # Zone or Local Zone). Bucket names must also follow the format bucket-base-name -- zone-id --x-s3
        # (for example, DOC-EXAMPLE-BUCKET -- usw2-az1 --x-s3 ). For information about bucket naming
        # restrictions, see Directory bucket naming rules in the Amazon S3 User Guide

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). For directory buckets, this header is not supported in this API operation. If you specify
        # this header, the request fails with the HTTP status code 501 Not Implemented .

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketIntelligentTieringConfigurationRequest
        include JSON::Serializable

        # The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID used to identify the S3 Intelligent-Tiering configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketInventoryConfigurationRequest
        include JSON::Serializable

        # The name of the bucket containing the inventory configuration to delete.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID used to identify the inventory configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketLifecycleRequest
        include JSON::Serializable

        # The bucket name of the lifecycle to delete.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). This parameter applies to general purpose buckets only. It is not supported for directory
        # bucket lifecycle configurations.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketMetadataConfigurationRequest
        include JSON::Serializable

        # The general purpose bucket that you want to remove the metadata configuration from.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The expected bucket owner of the general purpose bucket that you want to remove the metadata table
        # configuration from.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketMetadataTableConfigurationRequest
        include JSON::Serializable

        # The general purpose bucket that you want to remove the metadata table configuration from.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The expected bucket owner of the general purpose bucket that you want to remove the metadata table
        # configuration from.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketMetricsConfigurationRequest
        include JSON::Serializable

        # The name of the bucket containing the metrics configuration to delete.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID used to identify the metrics configuration. The ID has a 64 character limit and can only
        # contain letters, numbers, periods, dashes, and underscores.

        @[JSON::Field(key: "id")]
        getter id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketOwnershipControlsRequest
        include JSON::Serializable

        # The Amazon S3 bucket whose OwnershipControls you want to delete.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketPolicyRequest
        include JSON::Serializable

        # The bucket name. Directory buckets - When you use this operation with a directory bucket, you must
        # use path-style requests in the format https://s3express-control. region-code .amazonaws.com/
        # bucket-name . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique
        # in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the format
        # bucket-base-name -- zone-id --x-s3 (for example, DOC-EXAMPLE-BUCKET -- usw2-az1 --x-s3 ). For
        # information about bucket naming restrictions, see Directory bucket naming rules in the Amazon S3
        # User Guide

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). For directory buckets, this header is not supported in this API operation. If you specify
        # this header, the request fails with the HTTP status code 501 Not Implemented .

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketReplicationRequest
        include JSON::Serializable

        # The bucket name.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketRequest
        include JSON::Serializable

        # Specifies the bucket being deleted. Directory buckets - When you use this operation with a directory
        # bucket, you must use path-style requests in the format https://s3express-control. region-code
        # .amazonaws.com/ bucket-name . Virtual-hosted-style requests aren't supported. Directory bucket names
        # must be unique in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow
        # the format bucket-base-name -- zone-id --x-s3 (for example, DOC-EXAMPLE-BUCKET -- usw2-az1 --x-s3 ).
        # For information about bucket naming restrictions, see Directory bucket naming rules in the Amazon S3
        # User Guide

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). For directory buckets, this header is not supported in this API operation. If you specify
        # this header, the request fails with the HTTP status code 501 Not Implemented .

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketTaggingRequest
        include JSON::Serializable

        # The bucket that has the tag set to be removed.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct DeleteBucketWebsiteRequest
        include JSON::Serializable

        # The bucket name for which you want to remove the website configuration.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end

      # Information about the delete marker.

      struct DeleteMarkerEntry
        include JSON::Serializable

        # Specifies whether the object is (true) or is not (false) the latest version of an object.

        @[JSON::Field(key: "IsLatest")]
        getter is_latest : Bool?

        # The object key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # Date and time when the object was last modified.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The account that created the delete marker.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::Owner?

        # Version ID of an object.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @is_latest : Bool? = nil,
          @key : String? = nil,
          @last_modified : Time? = nil,
          @owner : Types::Owner? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Specifies whether Amazon S3 replicates delete markers. If you specify a Filter in your replication
      # configuration, you must also include a DeleteMarkerReplication element. If your Filter includes a
      # Tag element, the DeleteMarkerReplication Status must be set to Disabled, because Amazon S3 does not
      # support replicating delete markers for tag-based rules. For an example configuration, see Basic Rule
      # Configuration . For more information about delete marker replication, see Basic Rule Configuration .
      # If you are using an earlier version of the replication configuration, Amazon S3 handles replication
      # of delete markers differently. For more information, see Backward Compatibility .

      struct DeleteMarkerReplication
        include JSON::Serializable

        # Indicates whether to replicate delete markers. Indicates whether to replicate delete markers.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct DeleteObjectOutput
        include JSON::Serializable

        # Indicates whether the specified object version that was permanently deleted was (true) or was not
        # (false) a delete marker before deletion. In a simple DELETE, this header indicates whether (true) or
        # not (false) the current version of the object is a delete marker. To learn more about delete
        # markers, see Working with delete markers . This functionality is not supported for directory
        # buckets.

        @[JSON::Field(key: "x-amz-delete-marker")]
        getter delete_marker : Bool?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # Returns the version ID of the delete marker created as a result of the DELETE operation. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        def initialize(
          @delete_marker : Bool? = nil,
          @request_charged : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct DeleteObjectRequest
        include JSON::Serializable

        # The bucket name of the bucket containing the object. Directory buckets - When you use this operation
        # with a directory bucket, you must use virtual-hosted-style requests in the format Bucket-name
        # .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not supported. Directory
        # bucket names must be unique in the chosen Zone (Availability Zone or Local Zone). Bucket names must
        # follow the format bucket-base-name -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1
        # --x-s3 ). For information about bucket naming restrictions, see Directory bucket naming rules in the
        # Amazon S3 User Guide . Access points - When you use this action with an access point for general
        # purpose buckets, you must provide the alias of the access point in place of the bucket name or
        # specify the access point ARN. When you use this action with an access point for directory buckets,
        # you must provide the access point name in place of the bucket name. When using the access point ARN,
        # you must direct requests to the access point hostname. The access point hostname takes the form
        # AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When using this action with an
        # access point through the Amazon Web Services SDKs, you provide the access point ARN in place of the
        # bucket name. For more information about access point ARNs, see Using access points in the Amazon S3
        # User Guide . Object Lambda access points are not supported by directory buckets. S3 on Outposts -
        # When you use this action with S3 on Outposts, you must direct requests to the S3 on Outposts
        # hostname. The S3 on Outposts hostname takes the form AccessPointName - AccountId . outpostID
        # .s3-outposts. Region .amazonaws.com . When you use this action with S3 on Outposts, the destination
        # bucket must be the Outposts access point ARN or the access point alias. For more information about
        # S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Key name of the object to delete.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Indicates whether S3 Object Lock should bypass Governance-mode restrictions to process this
        # operation. To use this header, you must have the s3:BypassGovernanceRetention permission. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-bypass-governance-retention")]
        getter bypass_governance_retention : Bool?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Deletes the object if the ETag (entity tag) value provided during the delete operation matches the
        # ETag of the object in S3. If the ETag values do not match, the operation returns a 412 Precondition
        # Failed error. Expects the ETag value as a string. If-Match does accept a string value of an '*'
        # (asterisk) character to denote a match of any ETag. For more information about conditional requests,
        # see RFC 7232 .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # If present, the object is deleted only if its modification times matches the provided Timestamp . If
        # the Timestamp values do not match, the operation returns a 412 Precondition Failed error. If the
        # Timestamp matches or if the object doesn’t exist, the operation returns a 204 Success (No Content)
        # response. This functionality is only supported for directory buckets.

        @[JSON::Field(key: "x-amz-if-match-last-modified-time")]
        getter if_match_last_modified_time : Time?

        # If present, the object is deleted only if its size matches the provided size in bytes. If the Size
        # value does not match, the operation returns a 412 Precondition Failed error. If the Size matches or
        # if the object doesn’t exist, the operation returns a 204 Success (No Content) response. This
        # functionality is only supported for directory buckets. You can use the If-Match ,
        # x-amz-if-match-last-modified-time and x-amz-if-match-size conditional headers in conjunction with
        # each-other or individually.

        @[JSON::Field(key: "x-amz-if-match-size")]
        getter if_match_size : Int64?

        # The concatenation of the authentication device's serial number, a space, and the value that is
        # displayed on your authentication device. Required to permanently delete a versioned object if
        # versioning is configured with MFA delete enabled. This functionality is not supported for directory
        # buckets.

        @[JSON::Field(key: "x-amz-mfa")]
        getter mfa : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Version ID used to reference a specific version of the object. For directory buckets in this API
        # operation, only the null value of the version ID is supported.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @bypass_governance_retention : Bool? = nil,
          @expected_bucket_owner : String? = nil,
          @if_match : String? = nil,
          @if_match_last_modified_time : Time? = nil,
          @if_match_size : Int64? = nil,
          @mfa : String? = nil,
          @request_payer : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct DeleteObjectTaggingOutput
        include JSON::Serializable

        # The versionId of the object the tag-set was removed from.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        def initialize(
          @version_id : String? = nil
        )
        end
      end


      struct DeleteObjectTaggingRequest
        include JSON::Serializable

        # The bucket name containing the objects from which to remove the tags. Access points - When you use
        # this action with an access point for general purpose buckets, you must provide the alias of the
        # access point in place of the bucket name or specify the access point ARN. When you use this action
        # with an access point for directory buckets, you must provide the access point name in place of the
        # bucket name. When using the access point ARN, you must direct requests to the access point hostname.
        # The access point hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region
        # .amazonaws.com. When using this action with an access point through the Amazon Web Services SDKs,
        # you provide the access point ARN in place of the bucket name. For more information about access
        # point ARNs, see Using access points in the Amazon S3 User Guide . S3 on Outposts - When you use this
        # action with S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on
        # Outposts hostname takes the form AccessPointName - AccountId . outpostID .s3-outposts. Region
        # .amazonaws.com . When you use this action with S3 on Outposts, the destination bucket must be the
        # Outposts access point ARN or the access point alias. For more information about S3 on Outposts, see
        # What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The key that identifies the object in the bucket from which to remove all tags.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # The versionId of the object that the tag-set will be removed from.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @expected_bucket_owner : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct DeleteObjectsOutput
        include JSON::Serializable

        # Container element for a successful delete. It identifies the object that was successfully deleted.

        @[JSON::Field(key: "Deleted")]
        getter deleted : Array(Types::DeletedObject)?

        # Container for a failed delete action that describes the object that Amazon S3 attempted to delete
        # and the error it encountered.

        @[JSON::Field(key: "Error")]
        getter errors : Array(Types::Error)?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        def initialize(
          @deleted : Array(Types::DeletedObject)? = nil,
          @errors : Array(Types::Error)? = nil,
          @request_charged : String? = nil
        )
        end
      end


      struct DeleteObjectsRequest
        include JSON::Serializable

        # The bucket name containing the objects to delete. Directory buckets - When you use this operation
        # with a directory bucket, you must use virtual-hosted-style requests in the format Bucket-name
        # .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not supported. Directory
        # bucket names must be unique in the chosen Zone (Availability Zone or Local Zone). Bucket names must
        # follow the format bucket-base-name -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1
        # --x-s3 ). For information about bucket naming restrictions, see Directory bucket naming rules in the
        # Amazon S3 User Guide . Access points - When you use this action with an access point for general
        # purpose buckets, you must provide the alias of the access point in place of the bucket name or
        # specify the access point ARN. When you use this action with an access point for directory buckets,
        # you must provide the access point name in place of the bucket name. When using the access point ARN,
        # you must direct requests to the access point hostname. The access point hostname takes the form
        # AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When using this action with an
        # access point through the Amazon Web Services SDKs, you provide the access point ARN in place of the
        # bucket name. For more information about access point ARNs, see Using access points in the Amazon S3
        # User Guide . Object Lambda access points are not supported by directory buckets. S3 on Outposts -
        # When you use this action with S3 on Outposts, you must direct requests to the S3 on Outposts
        # hostname. The S3 on Outposts hostname takes the form AccessPointName - AccountId . outpostID
        # .s3-outposts. Region .amazonaws.com . When you use this action with S3 on Outposts, the destination
        # bucket must be the Outposts access point ARN or the access point alias. For more information about
        # S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Container for the request.

        @[JSON::Field(key: "Delete")]
        getter delete : Types::Delete

        # Specifies whether you want to delete this object even if it has a Governance-type Object Lock in
        # place. To use this header, you must have the s3:BypassGovernanceRetention permission. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-bypass-governance-retention")]
        getter bypass_governance_retention : Bool?

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum- algorithm or x-amz-trailer header sent. Otherwise,
        # Amazon S3 fails the request with the HTTP status code 400 Bad Request . For the x-amz-checksum-
        # algorithm header, replace algorithm with the supported algorithm from the following list: CRC32
        # CRC32C CRC64NVME SHA1 SHA256 For more information, see Checking object integrity in the Amazon S3
        # User Guide . If the individual checksum value you provide through x-amz-checksum- algorithm doesn't
        # match the checksum algorithm you set through x-amz-sdk-checksum-algorithm , Amazon S3 fails the
        # request with a BadDigest error. If you provide an individual checksum, Amazon S3 ignores any
        # provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # The concatenation of the authentication device's serial number, a space, and the value that is
        # displayed on your authentication device. Required to permanently delete a versioned object if
        # versioning is configured with MFA delete enabled. When performing the DeleteObjects operation on an
        # MFA delete enabled bucket, which attempts to delete the specified versioned objects, you must
        # include an MFA token. If you don't provide an MFA token, the entire request will fail, even if there
        # are non-versioned objects that you are trying to delete. If you provide an invalid token, whether
        # there are versioned object keys in the request or not, the entire Multi-Object Delete request will
        # fail. For information about MFA Delete, see MFA Delete in the Amazon S3 User Guide . This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-mfa")]
        getter mfa : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        def initialize(
          @bucket : String,
          @delete : Types::Delete,
          @bypass_governance_retention : Bool? = nil,
          @checksum_algorithm : String? = nil,
          @expected_bucket_owner : String? = nil,
          @mfa : String? = nil,
          @request_payer : String? = nil
        )
        end
      end


      struct DeletePublicAccessBlockRequest
        include JSON::Serializable

        # The Amazon S3 bucket whose PublicAccessBlock configuration you want to delete.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end

      # Information about the deleted object.

      struct DeletedObject
        include JSON::Serializable

        # Indicates whether the specified object version that was permanently deleted was (true) or was not
        # (false) a delete marker before deletion. In a simple DELETE, this header indicates whether (true) or
        # not (false) the current version of the object is a delete marker. To learn more about delete
        # markers, see Working with delete markers . This functionality is not supported for directory
        # buckets.

        @[JSON::Field(key: "DeleteMarker")]
        getter delete_marker : Bool?

        # The version ID of the delete marker created as a result of the DELETE operation. If you delete a
        # specific object version, the value returned by this header is the version ID of the object version
        # deleted. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "DeleteMarkerVersionId")]
        getter delete_marker_version_id : String?

        # The name of the deleted object.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The version ID of the deleted object. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @delete_marker : Bool? = nil,
          @delete_marker_version_id : String? = nil,
          @key : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Specifies information about where to publish analysis or configuration results for an Amazon S3
      # bucket and S3 Replication Time Control (S3 RTC).

      struct Destination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to store the results.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Specify this only in a cross-account scenario (where source and destination bucket owners are not
        # the same), and you want to change replica ownership to the Amazon Web Services account that owns the
        # destination bucket. If this is not specified in the replication configuration, the replicas are
        # owned by same Amazon Web Services account that owns the source object.

        @[JSON::Field(key: "AccessControlTranslation")]
        getter access_control_translation : Types::AccessControlTranslation?

        # Destination bucket owner account ID. In a cross-account scenario, if you direct Amazon S3 to change
        # replica ownership to the Amazon Web Services account that owns the destination bucket by specifying
        # the AccessControlTranslation property, this is the account ID of the destination bucket owner. For
        # more information, see Replication Additional Configuration: Changing the Replica Owner in the Amazon
        # S3 User Guide .

        @[JSON::Field(key: "Account")]
        getter account : String?

        # A container that provides information about encryption. If SourceSelectionCriteria is specified, you
        # must specify this element.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # A container specifying replication metrics-related settings enabling replication metrics and events.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Types::Metrics?

        # A container specifying S3 Replication Time Control (S3 RTC), including whether S3 RTC is enabled and
        # the time when all objects and operations on objects must be replicated. Must be specified together
        # with a Metrics block.

        @[JSON::Field(key: "ReplicationTime")]
        getter replication_time : Types::ReplicationTime?

        # The storage class to use when replicating objects, such as S3 Standard or reduced redundancy. By
        # default, Amazon S3 uses the storage class of the source object to create the object replica. For
        # valid values, see the StorageClass element of the PUT Bucket replication action in the Amazon S3 API
        # Reference . FSX_OPENZFS is not an accepted value when replicating objects.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @bucket : String,
          @access_control_translation : Types::AccessControlTranslation? = nil,
          @account : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @metrics : Types::Metrics? = nil,
          @replication_time : Types::ReplicationTime? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # The destination information for the S3 Metadata configuration.

      struct DestinationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table bucket where the metadata configuration is stored.

        @[JSON::Field(key: "TableBucketArn")]
        getter table_bucket_arn : String?

        # The type of the table bucket where the metadata configuration is stored. The aws value indicates an
        # Amazon Web Services managed table bucket, and the customer value indicates a customer-managed table
        # bucket. V2 metadata configurations are stored in Amazon Web Services managed table buckets, and V1
        # metadata configurations are stored in customer-managed table buckets.

        @[JSON::Field(key: "TableBucketType")]
        getter table_bucket_type : String?

        # The namespace in the table bucket where the metadata tables for a metadata configuration are stored.

        @[JSON::Field(key: "TableNamespace")]
        getter table_namespace : String?

        def initialize(
          @table_bucket_arn : String? = nil,
          @table_bucket_type : String? = nil,
          @table_namespace : String? = nil
        )
        end
      end

      # Contains the type of server-side encryption used.

      struct Encryption
        include JSON::Serializable

        # The server-side encryption algorithm used when storing job results in Amazon S3 (for example,
        # AES256, aws:kms ).

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String

        # If the encryption type is aws:kms , this optional value can be used to specify the encryption
        # context for the restore results.

        @[JSON::Field(key: "KMSContext")]
        getter kms_context : String?

        # If the encryption type is aws:kms , this optional value specifies the ID of the symmetric encryption
        # customer managed key to use for encryption of job results. Amazon S3 only supports symmetric
        # encryption KMS keys. For more information, see Asymmetric keys in KMS in the Amazon Web Services Key
        # Management Service Developer Guide .

        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        def initialize(
          @encryption_type : String,
          @kms_context : String? = nil,
          @kms_key_id : String? = nil
        )
        end
      end

      # Specifies encryption-related information for an Amazon S3 bucket that is a destination for
      # replicated objects. If you're specifying a customer managed KMS key, we recommend using a fully
      # qualified KMS key ARN. If you use a KMS key alias instead, then KMS resolves the key within the
      # requester’s account. This behavior can result in data that's encrypted with a KMS key that belongs
      # to the requester, and not the bucket owner.

      struct EncryptionConfiguration
        include JSON::Serializable

        # Specifies the ID (Key ARN or Alias ARN) of the customer managed Amazon Web Services KMS key stored
        # in Amazon Web Services Key Management Service (KMS) for the destination bucket. Amazon S3 uses this
        # key to encrypt replica objects. Amazon S3 only supports symmetric encryption KMS keys. For more
        # information, see Asymmetric keys in Amazon Web Services KMS in the Amazon Web Services Key
        # Management Service Developer Guide .

        @[JSON::Field(key: "ReplicaKmsKeyID")]
        getter replica_kms_key_id : String?

        def initialize(
          @replica_kms_key_id : String? = nil
        )
        end
      end

      # The existing object was created with a different encryption type. Subsequent write requests must
      # include the appropriate encryption parameters in the request or while creating the session.

      struct EncryptionTypeMismatch
        include JSON::Serializable

        def initialize
        end
      end

      # A message that indicates the request is complete and no more messages will be sent. You should not
      # assume that the request is complete until the client receives an EndEvent .

      struct EndEvent
        include JSON::Serializable

        def initialize
        end
      end

      # Container for all error elements.

      struct Error
        include JSON::Serializable

        # The error code is a string that uniquely identifies an error condition. It is meant to be read and
        # understood by programs that detect and handle errors by type. The following is a list of Amazon S3
        # error codes. For more information, see Error responses . Code: AccessDenied Description: Access
        # Denied HTTP Status Code: 403 Forbidden SOAP Fault Code Prefix: Client Code: AccountProblem
        # Description: There is a problem with your Amazon Web Services account that prevents the action from
        # completing successfully. Contact Amazon Web Services Support for further assistance. HTTP Status
        # Code: 403 Forbidden SOAP Fault Code Prefix: Client Code: AllAccessDisabled Description: All access
        # to this Amazon S3 resource has been disabled. Contact Amazon Web Services Support for further
        # assistance. HTTP Status Code: 403 Forbidden SOAP Fault Code Prefix: Client Code:
        # AmbiguousGrantByEmailAddress Description: The email address you provided is associated with more
        # than one account. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code:
        # AuthorizationHeaderMalformed Description: The authorization header you provided is invalid. HTTP
        # Status Code: 400 Bad Request HTTP Status Code: N/A Code: BadDigest Description: The Content-MD5 you
        # specified did not match what we received. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix:
        # Client Code: BucketAlreadyExists Description: The requested bucket name is not available. The bucket
        # namespace is shared by all users of the system. Please select a different name and try again. HTTP
        # Status Code: 409 Conflict SOAP Fault Code Prefix: Client Code: BucketAlreadyOwnedByYou Description:
        # The bucket you tried to create already exists, and you own it. Amazon S3 returns this error in all
        # Amazon Web Services Regions except in the North Virginia Region. For legacy compatibility, if you
        # re-create an existing bucket that you already own in the North Virginia Region, Amazon S3 returns
        # 200 OK and resets the bucket access control lists (ACLs). Code: 409 Conflict (in all Regions except
        # the North Virginia Region) SOAP Fault Code Prefix: Client Code: BucketNotEmpty Description: The
        # bucket you tried to delete is not empty. HTTP Status Code: 409 Conflict SOAP Fault Code Prefix:
        # Client Code: CredentialsNotSupported Description: This request does not support credentials. HTTP
        # Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: CrossLocationLoggingProhibited
        # Description: Cross-location logging not allowed. Buckets in one geographic location cannot log
        # information to a bucket in another location. HTTP Status Code: 403 Forbidden SOAP Fault Code Prefix:
        # Client Code: EntityTooSmall Description: Your proposed upload is smaller than the minimum allowed
        # object size. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: EntityTooLarge
        # Description: Your proposed upload exceeds the maximum allowed object size. HTTP Status Code: 400 Bad
        # Request SOAP Fault Code Prefix: Client Code: ExpiredToken Description: The provided token has
        # expired. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code:
        # IllegalVersioningConfigurationException Description: Indicates that the versioning configuration
        # specified in the request is invalid. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix:
        # Client Code: IncompleteBody Description: You did not provide the number of bytes specified by the
        # Content-Length HTTP header HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code:
        # IncorrectNumberOfFilesInPostRequest Description: POST requires exactly one file upload per request.
        # HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: InlineDataTooLarge
        # Description: Inline data exceeds the maximum allowed size. HTTP Status Code: 400 Bad Request SOAP
        # Fault Code Prefix: Client Code: InternalError Description: We encountered an internal error. Please
        # try again. HTTP Status Code: 500 Internal Server Error SOAP Fault Code Prefix: Server Code:
        # InvalidAccessKeyId Description: The Amazon Web Services access key ID you provided does not exist in
        # our records. HTTP Status Code: 403 Forbidden SOAP Fault Code Prefix: Client Code:
        # InvalidAddressingHeader Description: You must specify the Anonymous role. HTTP Status Code: N/A SOAP
        # Fault Code Prefix: Client Code: InvalidArgument Description: Invalid Argument HTTP Status Code: 400
        # Bad Request SOAP Fault Code Prefix: Client Code: InvalidBucketName Description: The specified bucket
        # is not valid. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code:
        # InvalidBucketState Description: The request is not valid with the current state of the bucket. HTTP
        # Status Code: 409 Conflict SOAP Fault Code Prefix: Client Code: InvalidDigest Description: The
        # Content-MD5 you specified is not valid. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix:
        # Client Code: InvalidEncryptionAlgorithmError Description: The encryption request you specified is
        # not valid. The valid value is AES256. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix:
        # Client Code: InvalidLocationConstraint Description: The specified location constraint is not valid.
        # For more information about Regions, see How to Select a Region for Your Buckets . HTTP Status Code:
        # 400 Bad Request SOAP Fault Code Prefix: Client Code: InvalidObjectState Description: The action is
        # not valid for the current state of the object. HTTP Status Code: 403 Forbidden SOAP Fault Code
        # Prefix: Client Code: InvalidPart Description: One or more of the specified parts could not be found.
        # The part might not have been uploaded, or the specified entity tag might not have matched the part's
        # entity tag. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: InvalidPartOrder
        # Description: The list of parts was not in ascending order. Parts list must be specified in order by
        # part number. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: InvalidPayer
        # Description: All access to this object has been disabled. Please contact Amazon Web Services Support
        # for further assistance. HTTP Status Code: 403 Forbidden SOAP Fault Code Prefix: Client Code:
        # InvalidPolicyDocument Description: The content of the form does not meet the conditions specified in
        # the policy document. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code:
        # InvalidRange Description: The requested range cannot be satisfied. HTTP Status Code: 416 Requested
        # Range Not Satisfiable SOAP Fault Code Prefix: Client Code: InvalidRequest Description: Please use
        # AWS4-HMAC-SHA256 . HTTP Status Code: 400 Bad Request Code: N/A Code: InvalidRequest Description:
        # SOAP requests must be made over an HTTPS connection. HTTP Status Code: 400 Bad Request SOAP Fault
        # Code Prefix: Client Code: InvalidRequest Description: Amazon S3 Transfer Acceleration is not
        # supported for buckets with non-DNS compliant names. HTTP Status Code: 400 Bad Request Code: N/A
        # Code: InvalidRequest Description: Amazon S3 Transfer Acceleration is not supported for buckets with
        # periods (.) in their names. HTTP Status Code: 400 Bad Request Code: N/A Code: InvalidRequest
        # Description: Amazon S3 Transfer Accelerate endpoint only supports virtual style requests. HTTP
        # Status Code: 400 Bad Request Code: N/A Code: InvalidRequest Description: Amazon S3 Transfer
        # Accelerate is not configured on this bucket. HTTP Status Code: 400 Bad Request Code: N/A Code:
        # InvalidRequest Description: Amazon S3 Transfer Accelerate is disabled on this bucket. HTTP Status
        # Code: 400 Bad Request Code: N/A Code: InvalidRequest Description: Amazon S3 Transfer Acceleration is
        # not supported on this bucket. Contact Amazon Web Services Support for more information. HTTP Status
        # Code: 400 Bad Request Code: N/A Code: InvalidRequest Description: Amazon S3 Transfer Acceleration
        # cannot be enabled on this bucket. Contact Amazon Web Services Support for more information. HTTP
        # Status Code: 400 Bad Request Code: N/A Code: InvalidSecurity Description: The provided security
        # credentials are not valid. HTTP Status Code: 403 Forbidden SOAP Fault Code Prefix: Client Code:
        # InvalidSOAPRequest Description: The SOAP request body is invalid. HTTP Status Code: 400 Bad Request
        # SOAP Fault Code Prefix: Client Code: InvalidStorageClass Description: The storage class you
        # specified is not valid. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code:
        # InvalidTargetBucketForLogging Description: The target bucket for logging does not exist, is not
        # owned by you, or does not have the appropriate grants for the log-delivery group. HTTP Status Code:
        # 400 Bad Request SOAP Fault Code Prefix: Client Code: InvalidToken Description: The provided token is
        # malformed or otherwise invalid. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client
        # Code: InvalidURI Description: Couldn't parse the specified URI. HTTP Status Code: 400 Bad Request
        # SOAP Fault Code Prefix: Client Code: KeyTooLongError Description: Your key is too long. HTTP Status
        # Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: MalformedACLError Description: The XML
        # you provided was not well-formed or did not validate against our published schema. HTTP Status Code:
        # 400 Bad Request SOAP Fault Code Prefix: Client Code: MalformedPOSTRequest Description: The body of
        # your POST request is not well-formed multipart/form-data. HTTP Status Code: 400 Bad Request SOAP
        # Fault Code Prefix: Client Code: MalformedXML Description: This happens when the user sends malformed
        # XML (XML that doesn't conform to the published XSD) for the configuration. The error message is,
        # "The XML you provided was not well-formed or did not validate against our published schema." HTTP
        # Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: MaxMessageLengthExceeded
        # Description: Your request was too big. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix:
        # Client Code: MaxPostPreDataLengthExceededError Description: Your POST request fields preceding the
        # upload file were too large. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code:
        # MetadataTooLarge Description: Your metadata headers exceed the maximum allowed metadata size. HTTP
        # Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: MethodNotAllowed Description: The
        # specified method is not allowed against this resource. HTTP Status Code: 405 Method Not Allowed SOAP
        # Fault Code Prefix: Client Code: MissingAttachment Description: A SOAP attachment was expected, but
        # none were found. HTTP Status Code: N/A SOAP Fault Code Prefix: Client Code: MissingContentLength
        # Description: You must provide the Content-Length HTTP header. HTTP Status Code: 411 Length Required
        # SOAP Fault Code Prefix: Client Code: MissingRequestBodyError Description: This happens when the user
        # sends an empty XML document as a request. The error message is, "Request body is empty." HTTP Status
        # Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: MissingSecurityElement Description: The
        # SOAP 1.1 request is missing a security element. HTTP Status Code: 400 Bad Request SOAP Fault Code
        # Prefix: Client Code: MissingSecurityHeader Description: Your request is missing a required header.
        # HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code: NoLoggingStatusForKey
        # Description: There is no such thing as a logging status subresource for a key. HTTP Status Code: 400
        # Bad Request SOAP Fault Code Prefix: Client Code: NoSuchBucket Description: The specified bucket does
        # not exist. HTTP Status Code: 404 Not Found SOAP Fault Code Prefix: Client Code: NoSuchBucketPolicy
        # Description: The specified bucket does not have a bucket policy. HTTP Status Code: 404 Not Found
        # SOAP Fault Code Prefix: Client Code: NoSuchKey Description: The specified key does not exist. HTTP
        # Status Code: 404 Not Found SOAP Fault Code Prefix: Client Code: NoSuchLifecycleConfiguration
        # Description: The lifecycle configuration does not exist. HTTP Status Code: 404 Not Found SOAP Fault
        # Code Prefix: Client Code: NoSuchUpload Description: The specified multipart upload does not exist.
        # The upload ID might be invalid, or the multipart upload might have been aborted or completed. HTTP
        # Status Code: 404 Not Found SOAP Fault Code Prefix: Client Code: NoSuchVersion Description: Indicates
        # that the version ID specified in the request does not match an existing version. HTTP Status Code:
        # 404 Not Found SOAP Fault Code Prefix: Client Code: NotImplemented Description: A header you provided
        # implies functionality that is not implemented. HTTP Status Code: 501 Not Implemented SOAP Fault Code
        # Prefix: Server Code: NotSignedUp Description: Your account is not signed up for the Amazon S3
        # service. You must sign up before you can use Amazon S3. You can sign up at the following URL: Amazon
        # S3 HTTP Status Code: 403 Forbidden SOAP Fault Code Prefix: Client Code: OperationAborted
        # Description: A conflicting conditional action is currently in progress against this resource. Try
        # again. HTTP Status Code: 409 Conflict SOAP Fault Code Prefix: Client Code: PermanentRedirect
        # Description: The bucket you are attempting to access must be addressed using the specified endpoint.
        # Send all future requests to this endpoint. HTTP Status Code: 301 Moved Permanently SOAP Fault Code
        # Prefix: Client Code: PreconditionFailed Description: At least one of the preconditions you specified
        # did not hold. HTTP Status Code: 412 Precondition Failed SOAP Fault Code Prefix: Client Code:
        # Redirect Description: Temporary redirect. HTTP Status Code: 307 Moved Temporarily SOAP Fault Code
        # Prefix: Client Code: RestoreAlreadyInProgress Description: Object restore is already in progress.
        # HTTP Status Code: 409 Conflict SOAP Fault Code Prefix: Client Code: RequestIsNotMultiPartContent
        # Description: Bucket POST must be of the enclosure-type multipart/form-data. HTTP Status Code: 400
        # Bad Request SOAP Fault Code Prefix: Client Code: RequestTimeout Description: Your socket connection
        # to the server was not read from or written to within the timeout period. HTTP Status Code: 400 Bad
        # Request SOAP Fault Code Prefix: Client Code: RequestTimeTooSkewed Description: The difference
        # between the request time and the server's time is too large. HTTP Status Code: 403 Forbidden SOAP
        # Fault Code Prefix: Client Code: RequestTorrentOfBucketError Description: Requesting the torrent file
        # of a bucket is not permitted. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client Code:
        # SignatureDoesNotMatch Description: The request signature we calculated does not match the signature
        # you provided. Check your Amazon Web Services secret access key and signing method. For more
        # information, see REST Authentication and SOAP Authentication for details. HTTP Status Code: 403
        # Forbidden SOAP Fault Code Prefix: Client Code: ServiceUnavailable Description: Service is unable to
        # handle request. HTTP Status Code: 503 Service Unavailable SOAP Fault Code Prefix: Server Code:
        # SlowDown Description: Reduce your request rate. HTTP Status Code: 503 Slow Down SOAP Fault Code
        # Prefix: Server Code: TemporaryRedirect Description: You are being redirected to the bucket while DNS
        # updates. HTTP Status Code: 307 Moved Temporarily SOAP Fault Code Prefix: Client Code:
        # TokenRefreshRequired Description: The provided token must be refreshed. HTTP Status Code: 400 Bad
        # Request SOAP Fault Code Prefix: Client Code: TooManyBuckets Description: You have attempted to
        # create more buckets than allowed. HTTP Status Code: 400 Bad Request SOAP Fault Code Prefix: Client
        # Code: UnexpectedContent Description: This request does not support content. HTTP Status Code: 400
        # Bad Request SOAP Fault Code Prefix: Client Code: UnresolvableGrantByEmailAddress Description: The
        # email address you provided does not match any account on record. HTTP Status Code: 400 Bad Request
        # SOAP Fault Code Prefix: Client Code: UserKeyMustBeSpecified Description: The bucket POST must
        # contain the specified field name. If it is specified, check the order of the fields. HTTP Status
        # Code: 400 Bad Request SOAP Fault Code Prefix: Client

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The error key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The error message contains a generic description of the error condition in English. It is intended
        # for a human audience. Simple programs display the message directly to the end user if they encounter
        # an error condition they don't know how or don't care to handle. Sophisticated programs with more
        # exhaustive error handling and proper internationalization are more likely to ignore the error
        # message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The version ID of the error. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @code : String? = nil,
          @key : String? = nil,
          @message : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # If an S3 Metadata V1 CreateBucketMetadataTableConfiguration or V2 CreateBucketMetadataConfiguration
      # request succeeds, but S3 Metadata was unable to create the table, this structure contains the error
      # code and error message. If you created your S3 Metadata configuration before July 15, 2025, we
      # recommend that you delete and re-create your configuration by using
      # CreateBucketMetadataConfiguration so that you can expire journal table records and create a live
      # inventory table.

      struct ErrorDetails
        include JSON::Serializable

        # If the V1 CreateBucketMetadataTableConfiguration request succeeds, but S3 Metadata was unable to
        # create the table, this structure contains the error code. The possible error codes and error
        # messages are as follows: AccessDeniedCreatingResources - You don't have sufficient permissions to
        # create the required resources. Make sure that you have s3tables:CreateNamespace ,
        # s3tables:CreateTable , s3tables:GetTable and s3tables:PutTablePolicy permissions, and then try
        # again. To create a new metadata table, you must delete the metadata configuration for this bucket,
        # and then create a new metadata configuration. AccessDeniedWritingToTable - Unable to write to the
        # metadata table because of missing resource permissions. To fix the resource policy, Amazon S3 needs
        # to create a new metadata table. To create a new metadata table, you must delete the metadata
        # configuration for this bucket, and then create a new metadata configuration.
        # DestinationTableNotFound - The destination table doesn't exist. To create a new metadata table, you
        # must delete the metadata configuration for this bucket, and then create a new metadata
        # configuration. ServerInternalError - An internal error has occurred. To create a new metadata table,
        # you must delete the metadata configuration for this bucket, and then create a new metadata
        # configuration. TableAlreadyExists - The table that you specified already exists in the table
        # bucket's namespace. Specify a different table name. To create a new metadata table, you must delete
        # the metadata configuration for this bucket, and then create a new metadata configuration.
        # TableBucketNotFound - The table bucket that you specified doesn't exist in this Amazon Web Services
        # Region and account. Create or choose a different table bucket. To create a new metadata table, you
        # must delete the metadata configuration for this bucket, and then create a new metadata
        # configuration. If the V2 CreateBucketMetadataConfiguration request succeeds, but S3 Metadata was
        # unable to create the table, this structure contains the error code. The possible error codes and
        # error messages are as follows: AccessDeniedCreatingResources - You don't have sufficient permissions
        # to create the required resources. Make sure that you have s3tables:CreateTableBucket ,
        # s3tables:CreateNamespace , s3tables:CreateTable , s3tables:GetTable , s3tables:PutTablePolicy ,
        # kms:DescribeKey , and s3tables:PutTableEncryption permissions. Additionally, ensure that the KMS key
        # used to encrypt the table still exists, is active and has a resource policy granting access to the
        # S3 service principals ' maintenance.s3tables.amazonaws.com ' and ' metadata.s3.amazonaws.com '. To
        # create a new metadata table, you must delete the metadata configuration for this bucket, and then
        # create a new metadata configuration. AccessDeniedWritingToTable - Unable to write to the metadata
        # table because of missing resource permissions. To fix the resource policy, Amazon S3 needs to create
        # a new metadata table. To create a new metadata table, you must delete the metadata configuration for
        # this bucket, and then create a new metadata configuration. DestinationTableNotFound - The
        # destination table doesn't exist. To create a new metadata table, you must delete the metadata
        # configuration for this bucket, and then create a new metadata configuration. ServerInternalError -
        # An internal error has occurred. To create a new metadata table, you must delete the metadata
        # configuration for this bucket, and then create a new metadata configuration.
        # JournalTableAlreadyExists - A journal table already exists in the Amazon Web Services managed table
        # bucket's namespace. Delete the journal table, and then try again. To create a new metadata table,
        # you must delete the metadata configuration for this bucket, and then create a new metadata
        # configuration. InventoryTableAlreadyExists - An inventory table already exists in the Amazon Web
        # Services managed table bucket's namespace. Delete the inventory table, and then try again. To create
        # a new metadata table, you must delete the metadata configuration for this bucket, and then create a
        # new metadata configuration. JournalTableNotAvailable - The journal table that the inventory table
        # relies on has a FAILED status. An inventory table requires a journal table with an ACTIVE status. To
        # create a new journal or inventory table, you must delete the metadata configuration for this bucket,
        # along with any journal or inventory tables, and then create a new metadata configuration.
        # NoSuchBucket - The specified general purpose bucket does not exist.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # If the V1 CreateBucketMetadataTableConfiguration request succeeds, but S3 Metadata was unable to
        # create the table, this structure contains the error message. The possible error codes and error
        # messages are as follows: AccessDeniedCreatingResources - You don't have sufficient permissions to
        # create the required resources. Make sure that you have s3tables:CreateNamespace ,
        # s3tables:CreateTable , s3tables:GetTable and s3tables:PutTablePolicy permissions, and then try
        # again. To create a new metadata table, you must delete the metadata configuration for this bucket,
        # and then create a new metadata configuration. AccessDeniedWritingToTable - Unable to write to the
        # metadata table because of missing resource permissions. To fix the resource policy, Amazon S3 needs
        # to create a new metadata table. To create a new metadata table, you must delete the metadata
        # configuration for this bucket, and then create a new metadata configuration.
        # DestinationTableNotFound - The destination table doesn't exist. To create a new metadata table, you
        # must delete the metadata configuration for this bucket, and then create a new metadata
        # configuration. ServerInternalError - An internal error has occurred. To create a new metadata table,
        # you must delete the metadata configuration for this bucket, and then create a new metadata
        # configuration. TableAlreadyExists - The table that you specified already exists in the table
        # bucket's namespace. Specify a different table name. To create a new metadata table, you must delete
        # the metadata configuration for this bucket, and then create a new metadata configuration.
        # TableBucketNotFound - The table bucket that you specified doesn't exist in this Amazon Web Services
        # Region and account. Create or choose a different table bucket. To create a new metadata table, you
        # must delete the metadata configuration for this bucket, and then create a new metadata
        # configuration. If the V2 CreateBucketMetadataConfiguration request succeeds, but S3 Metadata was
        # unable to create the table, this structure contains the error code. The possible error codes and
        # error messages are as follows: AccessDeniedCreatingResources - You don't have sufficient permissions
        # to create the required resources. Make sure that you have s3tables:CreateTableBucket ,
        # s3tables:CreateNamespace , s3tables:CreateTable , s3tables:GetTable , s3tables:PutTablePolicy ,
        # kms:DescribeKey , and s3tables:PutTableEncryption permissions. Additionally, ensure that the KMS key
        # used to encrypt the table still exists, is active and has a resource policy granting access to the
        # S3 service principals ' maintenance.s3tables.amazonaws.com ' and ' metadata.s3.amazonaws.com '. To
        # create a new metadata table, you must delete the metadata configuration for this bucket, and then
        # create a new metadata configuration. AccessDeniedWritingToTable - Unable to write to the metadata
        # table because of missing resource permissions. To fix the resource policy, Amazon S3 needs to create
        # a new metadata table. To create a new metadata table, you must delete the metadata configuration for
        # this bucket, and then create a new metadata configuration. DestinationTableNotFound - The
        # destination table doesn't exist. To create a new metadata table, you must delete the metadata
        # configuration for this bucket, and then create a new metadata configuration. ServerInternalError -
        # An internal error has occurred. To create a new metadata table, you must delete the metadata
        # configuration for this bucket, and then create a new metadata configuration.
        # JournalTableAlreadyExists - A journal table already exists in the Amazon Web Services managed table
        # bucket's namespace. Delete the journal table, and then try again. To create a new metadata table,
        # you must delete the metadata configuration for this bucket, and then create a new metadata
        # configuration. InventoryTableAlreadyExists - An inventory table already exists in the Amazon Web
        # Services managed table bucket's namespace. Delete the inventory table, and then try again. To create
        # a new metadata table, you must delete the metadata configuration for this bucket, and then create a
        # new metadata configuration. JournalTableNotAvailable - The journal table that the inventory table
        # relies on has a FAILED status. An inventory table requires a journal table with an ACTIVE status. To
        # create a new journal or inventory table, you must delete the metadata configuration for this bucket,
        # along with any journal or inventory tables, and then create a new metadata configuration.
        # NoSuchBucket - The specified general purpose bucket does not exist.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # The error information.

      struct ErrorDocument
        include JSON::Serializable

        # The object key name to use when a 4XX class error occurs. Replacement must be made for object keys
        # containing special characters (such as carriage returns) when using XML requests. For more
        # information, see XML related object key constraints .

        @[JSON::Field(key: "Key")]
        getter key : String

        def initialize(
          @key : String
        )
        end
      end

      # A container for specifying the configuration for Amazon EventBridge.

      struct EventBridgeConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # Optional configuration to replicate existing source bucket objects. This parameter is no longer
      # supported. To replicate existing objects, see Replicating existing objects with S3 Batch Replication
      # in the Amazon S3 User Guide .

      struct ExistingObjectReplication
        include JSON::Serializable

        # Specifies whether Amazon S3 replicates existing source bucket objects.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Specifies the Amazon S3 object key name to filter on. An object key name is the name assigned to an
      # object in your Amazon S3 bucket. You specify whether to filter on the suffix or prefix of the object
      # key name. A prefix is a specific string of characters at the beginning of an object key name, which
      # you can use to organize objects. For example, you can start the key names of related objects with a
      # prefix, such as 2023- or engineering/ . Then, you can use FilterRule to find objects in a bucket
      # with key names that have the same prefix. A suffix is similar to a prefix, but it is at the end of
      # the object key name instead of at the beginning.

      struct FilterRule
        include JSON::Serializable

        # The object key name prefix or suffix identifying one or more objects to which the filtering rule
        # applies. The maximum length is 1,024 characters. Overlapping prefixes and suffixes are not
        # supported. For more information, see Configuring Event Notifications in the Amazon S3 User Guide .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value that the filter searches for in object key names.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct GetBucketAbacOutput
        include JSON::Serializable

        # The ABAC status of the general purpose bucket.

        @[JSON::Field(key: "AbacStatus")]
        getter abac_status : Types::AbacStatus?

        def initialize(
          @abac_status : Types::AbacStatus? = nil
        )
        end
      end


      struct GetBucketAbacRequest
        include JSON::Serializable

        # The name of the general purpose bucket.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The Amazon Web Services account ID of the general purpose bucket's owner.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketAccelerateConfigurationOutput
        include JSON::Serializable


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # The accelerate configuration of the bucket.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @request_charged : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetBucketAccelerateConfigurationRequest
        include JSON::Serializable

        # The name of the bucket for which the accelerate configuration is retrieved.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil
        )
        end
      end


      struct GetBucketAclOutput
        include JSON::Serializable

        # A list of grants.

        @[JSON::Field(key: "AccessControlList")]
        getter grants : Array(Types::Grant)?

        # Container for the bucket owner's ID.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::Owner?

        def initialize(
          @grants : Array(Types::Grant)? = nil,
          @owner : Types::Owner? = nil
        )
        end
      end


      struct GetBucketAclRequest
        include JSON::Serializable

        # Specifies the S3 bucket whose ACL is being requested. When you use this API operation with an access
        # point, provide the alias of the access point in place of the bucket name. When you use this API
        # operation with an Object Lambda access point, provide the alias of the Object Lambda access point in
        # place of the bucket name. If the Object Lambda access point alias in a request is not valid, the
        # error code InvalidAccessPointAliasError is returned. For more information about
        # InvalidAccessPointAliasError , see List of Error Codes .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketAnalyticsConfigurationOutput
        include JSON::Serializable

        # The configuration and any analyses for the analytics filter.

        @[JSON::Field(key: "AnalyticsConfiguration")]
        getter analytics_configuration : Types::AnalyticsConfiguration?

        def initialize(
          @analytics_configuration : Types::AnalyticsConfiguration? = nil
        )
        end
      end


      struct GetBucketAnalyticsConfigurationRequest
        include JSON::Serializable

        # The name of the bucket from which an analytics configuration is retrieved.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID that identifies the analytics configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketCorsOutput
        include JSON::Serializable

        # A set of origins and methods (cross-origin access that you want to allow). You can add up to 100
        # rules to the configuration.

        @[JSON::Field(key: "CORSRule")]
        getter cors_rules : Array(Types::CORSRule)?

        def initialize(
          @cors_rules : Array(Types::CORSRule)? = nil
        )
        end
      end


      struct GetBucketCorsRequest
        include JSON::Serializable

        # The bucket name for which to get the cors configuration. When you use this API operation with an
        # access point, provide the alias of the access point in place of the bucket name. When you use this
        # API operation with an Object Lambda access point, provide the alias of the Object Lambda access
        # point in place of the bucket name. If the Object Lambda access point alias in a request is not
        # valid, the error code InvalidAccessPointAliasError is returned. For more information about
        # InvalidAccessPointAliasError , see List of Error Codes .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketEncryptionOutput
        include JSON::Serializable


        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        def initialize(
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil
        )
        end
      end


      struct GetBucketEncryptionRequest
        include JSON::Serializable

        # The name of the bucket from which the server-side encryption configuration is retrieved. Directory
        # buckets - When you use this operation with a directory bucket, you must use path-style requests in
        # the format https://s3express-control. region-code .amazonaws.com/ bucket-name . Virtual-hosted-style
        # requests aren't supported. Directory bucket names must be unique in the chosen Zone (Availability
        # Zone or Local Zone). Bucket names must also follow the format bucket-base-name -- zone-id --x-s3
        # (for example, DOC-EXAMPLE-BUCKET -- usw2-az1 --x-s3 ). For information about bucket naming
        # restrictions, see Directory bucket naming rules in the Amazon S3 User Guide

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). For directory buckets, this header is not supported in this API operation. If you specify
        # this header, the request fails with the HTTP status code 501 Not Implemented .

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketIntelligentTieringConfigurationOutput
        include JSON::Serializable

        # Container for S3 Intelligent-Tiering configuration.

        @[JSON::Field(key: "IntelligentTieringConfiguration")]
        getter intelligent_tiering_configuration : Types::IntelligentTieringConfiguration?

        def initialize(
          @intelligent_tiering_configuration : Types::IntelligentTieringConfiguration? = nil
        )
        end
      end


      struct GetBucketIntelligentTieringConfigurationRequest
        include JSON::Serializable

        # The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID used to identify the S3 Intelligent-Tiering configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketInventoryConfigurationOutput
        include JSON::Serializable

        # Specifies the inventory configuration.

        @[JSON::Field(key: "InventoryConfiguration")]
        getter inventory_configuration : Types::InventoryConfiguration?

        def initialize(
          @inventory_configuration : Types::InventoryConfiguration? = nil
        )
        end
      end


      struct GetBucketInventoryConfigurationRequest
        include JSON::Serializable

        # The name of the bucket containing the inventory configuration to retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID used to identify the inventory configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketLifecycleConfigurationOutput
        include JSON::Serializable

        # Container for a lifecycle rule.

        @[JSON::Field(key: "Rule")]
        getter rules : Array(Types::LifecycleRule)?

        # Indicates which default minimum object size behavior is applied to the lifecycle configuration. This
        # parameter applies to general purpose buckets only. It isn't supported for directory bucket lifecycle
        # configurations. all_storage_classes_128K - Objects smaller than 128 KB will not transition to any
        # storage class by default. varies_by_storage_class - Objects smaller than 128 KB will transition to
        # Glacier Flexible Retrieval or Glacier Deep Archive storage classes. By default, all other storage
        # classes will prevent transitions smaller than 128 KB. To customize the minimum object size for any
        # transition you can add a filter that specifies a custom ObjectSizeGreaterThan or ObjectSizeLessThan
        # in the body of your transition rule. Custom filters always take precedence over the default
        # transition behavior.

        @[JSON::Field(key: "x-amz-transition-default-minimum-object-size")]
        getter transition_default_minimum_object_size : String?

        def initialize(
          @rules : Array(Types::LifecycleRule)? = nil,
          @transition_default_minimum_object_size : String? = nil
        )
        end
      end


      struct GetBucketLifecycleConfigurationRequest
        include JSON::Serializable

        # The name of the bucket for which to get the lifecycle information.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). This parameter applies to general purpose buckets only. It is not supported for directory
        # bucket lifecycle configurations.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketLifecycleOutput
        include JSON::Serializable

        # Container for a lifecycle rule.

        @[JSON::Field(key: "Rule")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @rules : Array(Types::Rule)? = nil
        )
        end
      end


      struct GetBucketLifecycleRequest
        include JSON::Serializable

        # The name of the bucket for which to get the lifecycle information.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketLocationOutput
        include JSON::Serializable

        # Specifies the Region where the bucket resides. For a list of all the Amazon S3 supported location
        # constraints by Region, see Regions and Endpoints . Buckets in Region us-east-1 have a
        # LocationConstraint of null . Buckets with a LocationConstraint of EU reside in eu-west-1 .

        @[JSON::Field(key: "LocationConstraint")]
        getter location_constraint : String?

        def initialize(
          @location_constraint : String? = nil
        )
        end
      end


      struct GetBucketLocationRequest
        include JSON::Serializable

        # The name of the bucket for which to get the location. When you use this API operation with an access
        # point, provide the alias of the access point in place of the bucket name. When you use this API
        # operation with an Object Lambda access point, provide the alias of the Object Lambda access point in
        # place of the bucket name. If the Object Lambda access point alias in a request is not valid, the
        # error code InvalidAccessPointAliasError is returned. For more information about
        # InvalidAccessPointAliasError , see List of Error Codes .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketLoggingOutput
        include JSON::Serializable


        @[JSON::Field(key: "LoggingEnabled")]
        getter logging_enabled : Types::LoggingEnabled?

        def initialize(
          @logging_enabled : Types::LoggingEnabled? = nil
        )
        end
      end


      struct GetBucketLoggingRequest
        include JSON::Serializable

        # The bucket name for which to get the logging information.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketMetadataConfigurationOutput
        include JSON::Serializable

        # The metadata configuration for the general purpose bucket.

        @[JSON::Field(key: "GetBucketMetadataConfigurationResult")]
        getter get_bucket_metadata_configuration_result : Types::GetBucketMetadataConfigurationResult?

        def initialize(
          @get_bucket_metadata_configuration_result : Types::GetBucketMetadataConfigurationResult? = nil
        )
        end
      end


      struct GetBucketMetadataConfigurationRequest
        include JSON::Serializable

        # The general purpose bucket that corresponds to the metadata configuration that you want to retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The expected owner of the general purpose bucket that you want to retrieve the metadata table
        # configuration for.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end

      # The S3 Metadata configuration for a general purpose bucket.

      struct GetBucketMetadataConfigurationResult
        include JSON::Serializable

        # The metadata configuration for a general purpose bucket.

        @[JSON::Field(key: "MetadataConfigurationResult")]
        getter metadata_configuration_result : Types::MetadataConfigurationResult

        def initialize(
          @metadata_configuration_result : Types::MetadataConfigurationResult
        )
        end
      end


      struct GetBucketMetadataTableConfigurationOutput
        include JSON::Serializable

        # The metadata table configuration for the general purpose bucket.

        @[JSON::Field(key: "GetBucketMetadataTableConfigurationResult")]
        getter get_bucket_metadata_table_configuration_result : Types::GetBucketMetadataTableConfigurationResult?

        def initialize(
          @get_bucket_metadata_table_configuration_result : Types::GetBucketMetadataTableConfigurationResult? = nil
        )
        end
      end


      struct GetBucketMetadataTableConfigurationRequest
        include JSON::Serializable

        # The general purpose bucket that corresponds to the metadata table configuration that you want to
        # retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The expected owner of the general purpose bucket that you want to retrieve the metadata table
        # configuration for.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end

      # The V1 S3 Metadata configuration for a general purpose bucket. If you created your S3 Metadata
      # configuration before July 15, 2025, we recommend that you delete and re-create your configuration by
      # using CreateBucketMetadataConfiguration so that you can expire journal table records and create a
      # live inventory table.

      struct GetBucketMetadataTableConfigurationResult
        include JSON::Serializable

        # The V1 S3 Metadata configuration for a general purpose bucket.

        @[JSON::Field(key: "MetadataTableConfigurationResult")]
        getter metadata_table_configuration_result : Types::MetadataTableConfigurationResult

        # The status of the metadata table. The status values are: CREATING - The metadata table is in the
        # process of being created in the specified table bucket. ACTIVE - The metadata table has been created
        # successfully, and records are being delivered to the table. FAILED - Amazon S3 is unable to create
        # the metadata table, or Amazon S3 is unable to deliver records. See ErrorDetails for details.

        @[JSON::Field(key: "Status")]
        getter status : String

        # If the CreateBucketMetadataTableConfiguration request succeeds, but S3 Metadata was unable to create
        # the table, this structure contains the error code and error message.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorDetails?

        def initialize(
          @metadata_table_configuration_result : Types::MetadataTableConfigurationResult,
          @status : String,
          @error : Types::ErrorDetails? = nil
        )
        end
      end


      struct GetBucketMetricsConfigurationOutput
        include JSON::Serializable

        # Specifies the metrics configuration.

        @[JSON::Field(key: "MetricsConfiguration")]
        getter metrics_configuration : Types::MetricsConfiguration?

        def initialize(
          @metrics_configuration : Types::MetricsConfiguration? = nil
        )
        end
      end


      struct GetBucketMetricsConfigurationRequest
        include JSON::Serializable

        # The name of the bucket containing the metrics configuration to retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID used to identify the metrics configuration. The ID has a 64 character limit and can only
        # contain letters, numbers, periods, dashes, and underscores.

        @[JSON::Field(key: "id")]
        getter id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketNotificationConfigurationRequest
        include JSON::Serializable

        # The name of the bucket for which to get the notification configuration. When you use this API
        # operation with an access point, provide the alias of the access point in place of the bucket name.
        # When you use this API operation with an Object Lambda access point, provide the alias of the Object
        # Lambda access point in place of the bucket name. If the Object Lambda access point alias in a
        # request is not valid, the error code InvalidAccessPointAliasError is returned. For more information
        # about InvalidAccessPointAliasError , see List of Error Codes .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketOwnershipControlsOutput
        include JSON::Serializable

        # The OwnershipControls (BucketOwnerEnforced, BucketOwnerPreferred, or ObjectWriter) currently in
        # effect for this Amazon S3 bucket.

        @[JSON::Field(key: "OwnershipControls")]
        getter ownership_controls : Types::OwnershipControls?

        def initialize(
          @ownership_controls : Types::OwnershipControls? = nil
        )
        end
      end


      struct GetBucketOwnershipControlsRequest
        include JSON::Serializable

        # The name of the Amazon S3 bucket whose OwnershipControls you want to retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketPolicyOutput
        include JSON::Serializable

        # The bucket policy as a JSON document.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetBucketPolicyRequest
        include JSON::Serializable

        # The bucket name to get the bucket policy for. Directory buckets - When you use this operation with a
        # directory bucket, you must use path-style requests in the format https://s3express-control.
        # region-code .amazonaws.com/ bucket-name . Virtual-hosted-style requests aren't supported. Directory
        # bucket names must be unique in the chosen Zone (Availability Zone or Local Zone). Bucket names must
        # also follow the format bucket-base-name -- zone-id --x-s3 (for example, DOC-EXAMPLE-BUCKET --
        # usw2-az1 --x-s3 ). For information about bucket naming restrictions, see Directory bucket naming
        # rules in the Amazon S3 User Guide Access points - When you use this API operation with an access
        # point, provide the alias of the access point in place of the bucket name. Object Lambda access
        # points - When you use this API operation with an Object Lambda access point, provide the alias of
        # the Object Lambda access point in place of the bucket name. If the Object Lambda access point alias
        # in a request is not valid, the error code InvalidAccessPointAliasError is returned. For more
        # information about InvalidAccessPointAliasError , see List of Error Codes . Object Lambda access
        # points are not supported by directory buckets.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). For directory buckets, this header is not supported in this API operation. If you specify
        # this header, the request fails with the HTTP status code 501 Not Implemented .

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketPolicyStatusOutput
        include JSON::Serializable

        # The policy status for the specified bucket.

        @[JSON::Field(key: "PolicyStatus")]
        getter policy_status : Types::PolicyStatus?

        def initialize(
          @policy_status : Types::PolicyStatus? = nil
        )
        end
      end


      struct GetBucketPolicyStatusRequest
        include JSON::Serializable

        # The name of the Amazon S3 bucket whose policy status you want to retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketReplicationOutput
        include JSON::Serializable


        @[JSON::Field(key: "ReplicationConfiguration")]
        getter replication_configuration : Types::ReplicationConfiguration?

        def initialize(
          @replication_configuration : Types::ReplicationConfiguration? = nil
        )
        end
      end


      struct GetBucketReplicationRequest
        include JSON::Serializable

        # The bucket name for which to get the replication information.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketRequestPaymentOutput
        include JSON::Serializable

        # Specifies who pays for the download and request fees.

        @[JSON::Field(key: "Payer")]
        getter payer : String?

        def initialize(
          @payer : String? = nil
        )
        end
      end


      struct GetBucketRequestPaymentRequest
        include JSON::Serializable

        # The name of the bucket for which to get the payment request configuration

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketTaggingOutput
        include JSON::Serializable

        # Contains the tag set.

        @[JSON::Field(key: "TagSet")]
        getter tag_set : Array(Types::Tag)

        def initialize(
          @tag_set : Array(Types::Tag)
        )
        end
      end


      struct GetBucketTaggingRequest
        include JSON::Serializable

        # The name of the bucket for which to get the tagging information.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketVersioningOutput
        include JSON::Serializable

        # Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is only
        # returned if the bucket has been configured with MFA delete. If the bucket has never been so
        # configured, this element is not returned.

        @[JSON::Field(key: "MfaDelete")]
        getter mfa_delete : String?

        # The versioning state of the bucket.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @mfa_delete : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetBucketVersioningRequest
        include JSON::Serializable

        # The name of the bucket for which to get the versioning information.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetBucketWebsiteOutput
        include JSON::Serializable

        # The object key name of the website error document to use for 4XX class errors.

        @[JSON::Field(key: "ErrorDocument")]
        getter error_document : Types::ErrorDocument?

        # The name of the index document for the website (for example index.html ).

        @[JSON::Field(key: "IndexDocument")]
        getter index_document : Types::IndexDocument?

        # Specifies the redirect behavior of all requests to a website endpoint of an Amazon S3 bucket.

        @[JSON::Field(key: "RedirectAllRequestsTo")]
        getter redirect_all_requests_to : Types::RedirectAllRequestsTo?

        # Rules that define when a redirect is applied and the redirect behavior.

        @[JSON::Field(key: "RoutingRules")]
        getter routing_rules : Array(Types::RoutingRule)?

        def initialize(
          @error_document : Types::ErrorDocument? = nil,
          @index_document : Types::IndexDocument? = nil,
          @redirect_all_requests_to : Types::RedirectAllRequestsTo? = nil,
          @routing_rules : Array(Types::RoutingRule)? = nil
        )
        end
      end


      struct GetBucketWebsiteRequest
        include JSON::Serializable

        # The bucket name for which to get the website configuration.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetObjectAclOutput
        include JSON::Serializable

        # A list of grants.

        @[JSON::Field(key: "AccessControlList")]
        getter grants : Array(Types::Grant)?

        # Container for the bucket owner's ID.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::Owner?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        def initialize(
          @grants : Array(Types::Grant)? = nil,
          @owner : Types::Owner? = nil,
          @request_charged : String? = nil
        )
        end
      end


      struct GetObjectAclRequest
        include JSON::Serializable

        # The bucket name that contains the object for which to get the ACL information. Access points - When
        # you use this action with an access point for general purpose buckets, you must provide the alias of
        # the access point in place of the bucket name or specify the access point ARN. When you use this
        # action with an access point for directory buckets, you must provide the access point name in place
        # of the bucket name. When using the access point ARN, you must direct requests to the access point
        # hostname. The access point hostname takes the form AccessPointName - AccountId .s3-accesspoint.
        # Region .amazonaws.com. When using this action with an access point through the Amazon Web Services
        # SDKs, you provide the access point ARN in place of the bucket name. For more information about
        # access point ARNs, see Using access points in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The key of the object for which to get the ACL information.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Version ID used to reference a specific version of the object. This functionality is not supported
        # for directory buckets.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct GetObjectAttributesOutput
        include JSON::Serializable

        # The checksum or digest of the object.

        @[JSON::Field(key: "Checksum")]
        getter checksum : Types::Checksum?

        # Specifies whether the object retrieved was ( true ) or was not ( false ) a delete marker. If false ,
        # this response header does not appear in the response. To learn more about delete markers, see
        # Working with delete markers . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-delete-marker")]
        getter delete_marker : Bool?

        # An ETag is an opaque identifier assigned by a web server to a specific version of a resource found
        # at a URL.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Date and time when the object was last modified.

        @[JSON::Field(key: "Last-Modified")]
        getter last_modified : Time?

        # A collection of parts associated with a multipart upload.

        @[JSON::Field(key: "ObjectParts")]
        getter object_parts : Types::GetObjectAttributesParts?

        # The size of the object in bytes.

        @[JSON::Field(key: "ObjectSize")]
        getter object_size : Int64?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # Provides the storage class information of the object. Amazon S3 returns this header for all objects
        # except for S3 Standard storage class objects. For more information, see Storage Classes . Directory
        # buckets - Directory buckets only support EXPRESS_ONEZONE (the S3 Express One Zone storage class) in
        # Availability Zones and ONEZONE_IA (the S3 One Zone-Infrequent Access storage class) in Dedicated
        # Local Zones.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        # The version ID of the object. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        def initialize(
          @checksum : Types::Checksum? = nil,
          @delete_marker : Bool? = nil,
          @e_tag : String? = nil,
          @last_modified : Time? = nil,
          @object_parts : Types::GetObjectAttributesParts? = nil,
          @object_size : Int64? = nil,
          @request_charged : String? = nil,
          @storage_class : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # A collection of parts associated with a multipart upload.

      struct GetObjectAttributesParts
        include JSON::Serializable

        # Indicates whether the returned list of parts is truncated. A value of true indicates that the list
        # was truncated. A list can be truncated if the number of parts exceeds the limit returned in the
        # MaxParts element.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # The maximum number of parts allowed in the response.

        @[JSON::Field(key: "MaxParts")]
        getter max_parts : Int32?

        # When a list is truncated, this element specifies the last part in the list, as well as the value to
        # use for the PartNumberMarker request parameter in a subsequent request.

        @[JSON::Field(key: "NextPartNumberMarker")]
        getter next_part_number_marker : Int32?

        # The marker for the current part.

        @[JSON::Field(key: "PartNumberMarker")]
        getter part_number_marker : Int32?

        # A container for elements related to a particular part. A response can contain zero or more Parts
        # elements. General purpose buckets - For GetObjectAttributes , if an additional checksum (including
        # x-amz-checksum-crc32 , x-amz-checksum-crc32c , x-amz-checksum-sha1 , or x-amz-checksum-sha256 )
        # isn't applied to the object specified in the request, the response doesn't return the Part element.
        # Directory buckets - For GetObjectAttributes , regardless of whether an additional checksum is
        # applied to the object specified in the request, the response returns the Part element.

        @[JSON::Field(key: "Part")]
        getter parts : Array(Types::ObjectPart)?

        # The total number of parts.

        @[JSON::Field(key: "PartsCount")]
        getter total_parts_count : Int32?

        def initialize(
          @is_truncated : Bool? = nil,
          @max_parts : Int32? = nil,
          @next_part_number_marker : Int32? = nil,
          @part_number_marker : Int32? = nil,
          @parts : Array(Types::ObjectPart)? = nil,
          @total_parts_count : Int32? = nil
        )
        end
      end


      struct GetObjectAttributesRequest
        include JSON::Serializable

        # The name of the bucket that contains the object. Directory buckets - When you use this operation
        # with a directory bucket, you must use virtual-hosted-style requests in the format Bucket-name
        # .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not supported. Directory
        # bucket names must be unique in the chosen Zone (Availability Zone or Local Zone). Bucket names must
        # follow the format bucket-base-name -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1
        # --x-s3 ). For information about bucket naming restrictions, see Directory bucket naming rules in the
        # Amazon S3 User Guide . Access points - When you use this action with an access point for general
        # purpose buckets, you must provide the alias of the access point in place of the bucket name or
        # specify the access point ARN. When you use this action with an access point for directory buckets,
        # you must provide the access point name in place of the bucket name. When using the access point ARN,
        # you must direct requests to the access point hostname. The access point hostname takes the form
        # AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When using this action with an
        # access point through the Amazon Web Services SDKs, you provide the access point ARN in place of the
        # bucket name. For more information about access point ARNs, see Using access points in the Amazon S3
        # User Guide . Object Lambda access points are not supported by directory buckets. S3 on Outposts -
        # When you use this action with S3 on Outposts, you must direct requests to the S3 on Outposts
        # hostname. The S3 on Outposts hostname takes the form AccessPointName - AccountId . outpostID
        # .s3-outposts. Region .amazonaws.com . When you use this action with S3 on Outposts, the destination
        # bucket must be the Outposts access point ARN or the access point alias. For more information about
        # S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The object key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Specifies the fields at the root level that you want returned in the response. Fields that you do
        # not specify are not returned.

        @[JSON::Field(key: "x-amz-object-attributes")]
        getter object_attributes : Array(String)

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Sets the maximum number of parts to return. For more information, see Uploading and copying objects
        # using multipart upload in Amazon S3 in the Amazon Simple Storage Service user guide .

        @[JSON::Field(key: "x-amz-max-parts")]
        getter max_parts : Int32?

        # Specifies the part after which listing should begin. Only parts with higher part numbers will be
        # listed. For more information, see Uploading and copying objects using multipart upload in Amazon S3
        # in the Amazon Simple Storage Service user guide .

        @[JSON::Field(key: "x-amz-part-number-marker")]
        getter part_number_marker : Int32?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Specifies the algorithm to use when encrypting the object (for example, AES256). This functionality
        # is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value
        # is used to store the object and then it is discarded; Amazon S3 does not store the encryption key.
        # The key must be appropriate for use with the algorithm specified in the
        # x-amz-server-side-encryption-customer-algorithm header. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this
        # header for a message integrity check to ensure that the encryption key was transmitted without
        # error. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # The version ID used to reference a specific version of the object. S3 Versioning isn't enabled and
        # supported for directory buckets. For this API operation, only the null value of the version ID is
        # supported by directory buckets. You can only specify null to the versionId query parameter in the
        # request.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @object_attributes : Array(String),
          @expected_bucket_owner : String? = nil,
          @max_parts : Int32? = nil,
          @part_number_marker : Int32? = nil,
          @request_payer : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct GetObjectLegalHoldOutput
        include JSON::Serializable

        # The current legal hold status for the specified object.

        @[JSON::Field(key: "LegalHold")]
        getter legal_hold : Types::ObjectLockLegalHold?

        def initialize(
          @legal_hold : Types::ObjectLockLegalHold? = nil
        )
        end
      end


      struct GetObjectLegalHoldRequest
        include JSON::Serializable

        # The bucket name containing the object whose legal hold status you want to retrieve. Access points -
        # When you use this action with an access point for general purpose buckets, you must provide the
        # alias of the access point in place of the bucket name or specify the access point ARN. When you use
        # this action with an access point for directory buckets, you must provide the access point name in
        # place of the bucket name. When using the access point ARN, you must direct requests to the access
        # point hostname. The access point hostname takes the form AccessPointName - AccountId
        # .s3-accesspoint. Region .amazonaws.com. When using this action with an access point through the
        # Amazon Web Services SDKs, you provide the access point ARN in place of the bucket name. For more
        # information about access point ARNs, see Using access points in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The key name for the object whose legal hold status you want to retrieve.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # The version ID of the object whose legal hold status you want to retrieve.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct GetObjectLockConfigurationOutput
        include JSON::Serializable

        # The specified bucket's Object Lock configuration.

        @[JSON::Field(key: "ObjectLockConfiguration")]
        getter object_lock_configuration : Types::ObjectLockConfiguration?

        def initialize(
          @object_lock_configuration : Types::ObjectLockConfiguration? = nil
        )
        end
      end


      struct GetObjectLockConfigurationRequest
        include JSON::Serializable

        # The bucket whose Object Lock configuration you want to retrieve. Access points - When you use this
        # action with an access point for general purpose buckets, you must provide the alias of the access
        # point in place of the bucket name or specify the access point ARN. When you use this action with an
        # access point for directory buckets, you must provide the access point name in place of the bucket
        # name. When using the access point ARN, you must direct requests to the access point hostname. The
        # access point hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region
        # .amazonaws.com. When using this action with an access point through the Amazon Web Services SDKs,
        # you provide the access point ARN in place of the bucket name. For more information about access
        # point ARNs, see Using access points in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct GetObjectOutput
        include JSON::Serializable

        # Indicates that a range of bytes was specified in the request.

        @[JSON::Field(key: "accept-ranges")]
        getter accept_ranges : String?

        # Object data.

        @[JSON::Field(key: "Body")]
        getter body : Bytes?

        # Indicates whether the object uses an S3 Bucket Key for server-side encryption with Key Management
        # Service (KMS) keys (SSE-KMS).

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # Specifies caching behavior along the request/reply chain.

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # The Base64 encoded, 32-bit CRC32 checksum of the object. This checksum is only present if the object
        # was uploaded with the object. For more information, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. For more information, see Checking object integrity in the
        # Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32c")]
        getter checksum_crc32_c : String?

        # The Base64 encoded, 64-bit CRC64NVME checksum of the object. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc64nvme")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 digest of the object. This checksum is only present if the checksum
        # was uploaded with the object. For more information, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 digest of the object. This checksum is only present if the
        # checksum was uploaded with the object. For more information, see Checking object integrity in the
        # Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha256")]
        getter checksum_sha256 : String?

        # The checksum type, which determines how part-level checksums are combined to create an object-level
        # checksum for multipart objects. You can use this header response to verify that the checksum type
        # that is received is the same checksum type that was specified in the CreateMultipartUpload request.
        # For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-type")]
        getter checksum_type : String?

        # Specifies presentational information for the object.

        @[JSON::Field(key: "Content-Disposition")]
        getter content_disposition : String?

        # Indicates what content encodings have been applied to the object and thus what decoding mechanisms
        # must be applied to obtain the media-type referenced by the Content-Type header field.

        @[JSON::Field(key: "Content-Encoding")]
        getter content_encoding : String?

        # The language the content is in.

        @[JSON::Field(key: "Content-Language")]
        getter content_language : String?

        # Size of the body in bytes.

        @[JSON::Field(key: "Content-Length")]
        getter content_length : Int64?

        # The portion of the object returned in the response.

        @[JSON::Field(key: "Content-Range")]
        getter content_range : String?

        # A standard MIME type describing the format of the object data.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Indicates whether the object retrieved was (true) or was not (false) a Delete Marker. If false, this
        # response header does not appear in the response. If the current version of the object is a delete
        # marker, Amazon S3 behaves as if the object was deleted and includes x-amz-delete-marker: true in the
        # response. If the specified version in the request is a delete marker, the response returns a 405
        # Method Not Allowed error and the Last-Modified: timestamp response header.

        @[JSON::Field(key: "x-amz-delete-marker")]
        getter delete_marker : Bool?

        # An entity tag (ETag) is an opaque identifier assigned by a web server to a specific version of a
        # resource found at a URL.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # If the object expiration is configured (see PutBucketLifecycleConfiguration ), the response includes
        # this header. It includes the expiry-date and rule-id key-value pairs providing object expiration
        # information. The value of the rule-id is URL-encoded. Object expiration information is not returned
        # in directory buckets and this header returns the value " NotImplemented " in all responses for
        # directory buckets.

        @[JSON::Field(key: "x-amz-expiration")]
        getter expiration : String?

        # The date and time at which the object is no longer cacheable.

        @[JSON::Field(key: "Expires")]
        getter expires : String?

        # Date and time when the object was last modified. General purpose buckets - When you specify a
        # versionId of the object in your request, if the specified version in the request is a delete marker,
        # the response returns a 405 Method Not Allowed error and the Last-Modified: timestamp response
        # header.

        @[JSON::Field(key: "Last-Modified")]
        getter last_modified : Time?

        # A map of metadata to store with the object in S3.

        @[JSON::Field(key: "x-amz-meta-")]
        getter metadata : Hash(String, String)?

        # This is set to the number of metadata entries not returned in the headers that are prefixed with
        # x-amz-meta- . This can happen if you create metadata using an API like SOAP that supports more
        # flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values
        # are not legal HTTP headers. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-missing-meta")]
        getter missing_meta : Int32?

        # Indicates whether this object has an active legal hold. This field is only returned if you have
        # permission to view an object's legal hold status. This functionality is not supported for directory
        # buckets.

        @[JSON::Field(key: "x-amz-object-lock-legal-hold")]
        getter object_lock_legal_hold_status : String?

        # The Object Lock mode that's currently in place for this object. This functionality is not supported
        # for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-mode")]
        getter object_lock_mode : String?

        # The date and time when this object's Object Lock will expire. This functionality is not supported
        # for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-retain-until-date")]
        getter object_lock_retain_until_date : Time?

        # The count of parts this object has. This value is only returned if you specify partNumber in your
        # request and the object was uploaded as a multipart upload.

        @[JSON::Field(key: "x-amz-mp-parts-count")]
        getter parts_count : Int32?

        # Amazon S3 can return this if your request involves a bucket that is either a source or destination
        # in a replication rule. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-replication-status")]
        getter replication_status : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # Provides information about object restoration action and expiration time of the restored object
        # copy. This functionality is not supported for directory buckets. Directory buckets only support
        # EXPRESS_ONEZONE (the S3 Express One Zone storage class) in Availability Zones and ONEZONE_IA (the S3
        # One Zone-Infrequent Access storage class) in Dedicated Local Zones.

        @[JSON::Field(key: "x-amz-restore")]
        getter restore : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to confirm the encryption algorithm that's used. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to provide the round-trip message integrity verification of the
        # customer-provided encryption key. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # If present, indicates the ID of the KMS key that was used for object encryption.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
        # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid server
        # side encryption option is aws:fsx .

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # Provides storage class information of the object. Amazon S3 returns this header for all objects
        # except for S3 Standard storage class objects. Directory buckets - Directory buckets only support
        # EXPRESS_ONEZONE (the S3 Express One Zone storage class) in Availability Zones and ONEZONE_IA (the S3
        # One Zone-Infrequent Access storage class) in Dedicated Local Zones.

        @[JSON::Field(key: "x-amz-storage-class")]
        getter storage_class : String?

        # The number of tags, if any, on the object, when you have the relevant permission to read object
        # tags. You can use GetObjectTagging to retrieve the tag set associated with an object. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-tagging-count")]
        getter tag_count : Int32?

        # Version ID of the object. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        # If the bucket is configured as a website, redirects requests for this object to another object in
        # the same bucket or to an external URL. Amazon S3 stores the value of this header in the object
        # metadata. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-website-redirect-location")]
        getter website_redirect_location : String?

        def initialize(
          @accept_ranges : String? = nil,
          @body : Bytes? = nil,
          @bucket_key_enabled : Bool? = nil,
          @cache_control : String? = nil,
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @checksum_type : String? = nil,
          @content_disposition : String? = nil,
          @content_encoding : String? = nil,
          @content_language : String? = nil,
          @content_length : Int64? = nil,
          @content_range : String? = nil,
          @content_type : String? = nil,
          @delete_marker : Bool? = nil,
          @e_tag : String? = nil,
          @expiration : String? = nil,
          @expires : String? = nil,
          @last_modified : Time? = nil,
          @metadata : Hash(String, String)? = nil,
          @missing_meta : Int32? = nil,
          @object_lock_legal_hold_status : String? = nil,
          @object_lock_mode : String? = nil,
          @object_lock_retain_until_date : Time? = nil,
          @parts_count : Int32? = nil,
          @replication_status : String? = nil,
          @request_charged : String? = nil,
          @restore : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @storage_class : String? = nil,
          @tag_count : Int32? = nil,
          @version_id : String? = nil,
          @website_redirect_location : String? = nil
        )
        end
      end


      struct GetObjectRequest
        include JSON::Serializable

        # The bucket name containing the object. Directory buckets - When you use this operation with a
        # directory bucket, you must use virtual-hosted-style requests in the format Bucket-name .s3express-
        # zone-id . region-code .amazonaws.com . Path-style requests are not supported. Directory bucket names
        # must be unique in the chosen Zone (Availability Zone or Local Zone). Bucket names must follow the
        # format bucket-base-name -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1 --x-s3 ).
        # For information about bucket naming restrictions, see Directory bucket naming rules in the Amazon S3
        # User Guide . Access points - When you use this action with an access point for general purpose
        # buckets, you must provide the alias of the access point in place of the bucket name or specify the
        # access point ARN. When you use this action with an access point for directory buckets, you must
        # provide the access point name in place of the bucket name. When using the access point ARN, you must
        # direct requests to the access point hostname. The access point hostname takes the form
        # AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When using this action with an
        # access point through the Amazon Web Services SDKs, you provide the access point ARN in place of the
        # bucket name. For more information about access point ARNs, see Using access points in the Amazon S3
        # User Guide . Object Lambda access points - When you use this action with an Object Lambda access
        # point, you must direct requests to the Object Lambda access point hostname. The Object Lambda access
        # point hostname takes the form AccessPointName - AccountId .s3-object-lambda. Region .amazonaws.com.
        # Object Lambda access points are not supported by directory buckets. S3 on Outposts - When you use
        # this action with S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on
        # Outposts hostname takes the form AccessPointName - AccountId . outpostID .s3-outposts. Region
        # .amazonaws.com . When you use this action with S3 on Outposts, the destination bucket must be the
        # Outposts access point ARN or the access point alias. For more information about S3 on Outposts, see
        # What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Key of the object to get.

        @[JSON::Field(key: "Key")]
        getter key : String

        # To retrieve the checksum, this mode must be enabled.

        @[JSON::Field(key: "x-amz-checksum-mode")]
        getter checksum_mode : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Return the object only if its entity tag (ETag) is the same as the one specified in this header;
        # otherwise, return a 412 Precondition Failed error. If both of the If-Match and If-Unmodified-Since
        # headers are present in the request as follows: If-Match condition evaluates to true , and;
        # If-Unmodified-Since condition evaluates to false ; then, S3 returns 200 OK and the data requested.
        # For more information about conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Return the object only if it has been modified since the specified time; otherwise, return a 304 Not
        # Modified error. If both of the If-None-Match and If-Modified-Since headers are present in the
        # request as follows: If-None-Match condition evaluates to false , and; If-Modified-Since condition
        # evaluates to true ; then, S3 returns 304 Not Modified status code. For more information about
        # conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-Modified-Since")]
        getter if_modified_since : Time?

        # Return the object only if its entity tag (ETag) is different from the one specified in this header;
        # otherwise, return a 304 Not Modified error. If both of the If-None-Match and If-Modified-Since
        # headers are present in the request as follows: If-None-Match condition evaluates to false , and;
        # If-Modified-Since condition evaluates to true ; then, S3 returns 304 Not Modified HTTP status code.
        # For more information about conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # Return the object only if it has not been modified since the specified time; otherwise, return a 412
        # Precondition Failed error. If both of the If-Match and If-Unmodified-Since headers are present in
        # the request as follows: If-Match condition evaluates to true , and; If-Unmodified-Since condition
        # evaluates to false ; then, S3 returns 200 OK and the data requested. For more information about
        # conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-Unmodified-Since")]
        getter if_unmodified_since : Time?

        # Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively
        # performs a 'ranged' GET request for the part specified. Useful for downloading just a part of an
        # object.

        @[JSON::Field(key: "partNumber")]
        getter part_number : Int32?

        # Downloads the specified byte range of an object. For more information about the HTTP Range header,
        # see https://www.rfc-editor.org/rfc/rfc9110.html#name-range . Amazon S3 doesn't support retrieving
        # multiple ranges of data per GET request.

        @[JSON::Field(key: "Range")]
        getter range : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Sets the Cache-Control header of the response.

        @[JSON::Field(key: "response-cache-control")]
        getter response_cache_control : String?

        # Sets the Content-Disposition header of the response.

        @[JSON::Field(key: "response-content-disposition")]
        getter response_content_disposition : String?

        # Sets the Content-Encoding header of the response.

        @[JSON::Field(key: "response-content-encoding")]
        getter response_content_encoding : String?

        # Sets the Content-Language header of the response.

        @[JSON::Field(key: "response-content-language")]
        getter response_content_language : String?

        # Sets the Content-Type header of the response.

        @[JSON::Field(key: "response-content-type")]
        getter response_content_type : String?

        # Sets the Expires header of the response.

        @[JSON::Field(key: "response-expires")]
        getter response_expires : Time?

        # Specifies the algorithm to use when decrypting the object (for example, AES256 ). If you encrypt an
        # object by using server-side encryption with customer-provided encryption keys (SSE-C) when you store
        # the object in Amazon S3, then when you GET the object, you must use the following headers:
        # x-amz-server-side-encryption-customer-algorithm x-amz-server-side-encryption-customer-key
        # x-amz-server-side-encryption-customer-key-MD5 For more information about SSE-C, see Server-Side
        # Encryption (Using Customer-Provided Encryption Keys) in the Amazon S3 User Guide . This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key that you originally provided for Amazon S3 to encrypt
        # the data before storing it. This value is used to decrypt the object when recovering it and must
        # match the one used when storing the data. The key must be appropriate for use with the algorithm
        # specified in the x-amz-server-side-encryption-customer-algorithm header. If you encrypt an object by
        # using server-side encryption with customer-provided encryption keys (SSE-C) when you store the
        # object in Amazon S3, then when you GET the object, you must use the following headers:
        # x-amz-server-side-encryption-customer-algorithm x-amz-server-side-encryption-customer-key
        # x-amz-server-side-encryption-customer-key-MD5 For more information about SSE-C, see Server-Side
        # Encryption (Using Customer-Provided Encryption Keys) in the Amazon S3 User Guide . This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the customer-provided encryption key according to RFC 1321.
        # Amazon S3 uses this header for a message integrity check to ensure that the encryption key was
        # transmitted without error. If you encrypt an object by using server-side encryption with
        # customer-provided encryption keys (SSE-C) when you store the object in Amazon S3, then when you GET
        # the object, you must use the following headers: x-amz-server-side-encryption-customer-algorithm
        # x-amz-server-side-encryption-customer-key x-amz-server-side-encryption-customer-key-MD5 For more
        # information about SSE-C, see Server-Side Encryption (Using Customer-Provided Encryption Keys) in the
        # Amazon S3 User Guide . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # Version ID used to reference a specific version of the object. By default, the GetObject operation
        # returns the current version of an object. To return a different version, use the versionId
        # subresource. If you include a versionId in your request header, you must have the
        # s3:GetObjectVersion permission to access a specific version of an object. The s3:GetObject
        # permission is not required in this scenario. If you request the current version of an object without
        # a specific versionId in the request header, only the s3:GetObject permission is required. The
        # s3:GetObjectVersion permission is not required in this scenario. Directory buckets - S3 Versioning
        # isn't enabled and supported for directory buckets. For this API operation, only the null value of
        # the version ID is supported by directory buckets. You can only specify null to the versionId query
        # parameter in the request. For more information about versioning, see PutBucketVersioning .

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @checksum_mode : String? = nil,
          @expected_bucket_owner : String? = nil,
          @if_match : String? = nil,
          @if_modified_since : Time? = nil,
          @if_none_match : String? = nil,
          @if_unmodified_since : Time? = nil,
          @part_number : Int32? = nil,
          @range : String? = nil,
          @request_payer : String? = nil,
          @response_cache_control : String? = nil,
          @response_content_disposition : String? = nil,
          @response_content_encoding : String? = nil,
          @response_content_language : String? = nil,
          @response_content_type : String? = nil,
          @response_expires : Time? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct GetObjectRetentionOutput
        include JSON::Serializable

        # The container element for an object's retention settings.

        @[JSON::Field(key: "Retention")]
        getter retention : Types::ObjectLockRetention?

        def initialize(
          @retention : Types::ObjectLockRetention? = nil
        )
        end
      end


      struct GetObjectRetentionRequest
        include JSON::Serializable

        # The bucket name containing the object whose retention settings you want to retrieve. Access points -
        # When you use this action with an access point for general purpose buckets, you must provide the
        # alias of the access point in place of the bucket name or specify the access point ARN. When you use
        # this action with an access point for directory buckets, you must provide the access point name in
        # place of the bucket name. When using the access point ARN, you must direct requests to the access
        # point hostname. The access point hostname takes the form AccessPointName - AccountId
        # .s3-accesspoint. Region .amazonaws.com. When using this action with an access point through the
        # Amazon Web Services SDKs, you provide the access point ARN in place of the bucket name. For more
        # information about access point ARNs, see Using access points in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The key name for the object whose retention settings you want to retrieve.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # The version ID for the object whose retention settings you want to retrieve.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct GetObjectTaggingOutput
        include JSON::Serializable

        # Contains the tag set.

        @[JSON::Field(key: "TagSet")]
        getter tag_set : Array(Types::Tag)

        # The versionId of the object for which you got the tagging information.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        def initialize(
          @tag_set : Array(Types::Tag),
          @version_id : String? = nil
        )
        end
      end


      struct GetObjectTaggingRequest
        include JSON::Serializable

        # The bucket name containing the object for which to get the tagging information. Access points - When
        # you use this action with an access point for general purpose buckets, you must provide the alias of
        # the access point in place of the bucket name or specify the access point ARN. When you use this
        # action with an access point for directory buckets, you must provide the access point name in place
        # of the bucket name. When using the access point ARN, you must direct requests to the access point
        # hostname. The access point hostname takes the form AccessPointName - AccountId .s3-accesspoint.
        # Region .amazonaws.com. When using this action with an access point through the Amazon Web Services
        # SDKs, you provide the access point ARN in place of the bucket name. For more information about
        # access point ARNs, see Using access points in the Amazon S3 User Guide . S3 on Outposts - When you
        # use this action with S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3
        # on Outposts hostname takes the form AccessPointName - AccountId . outpostID .s3-outposts. Region
        # .amazonaws.com . When you use this action with S3 on Outposts, the destination bucket must be the
        # Outposts access point ARN or the access point alias. For more information about S3 on Outposts, see
        # What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Object key for which to get the tagging information.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # The versionId of the object for which to get the tagging information.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct GetObjectTorrentOutput
        include JSON::Serializable

        # A Bencoded dictionary as defined by the BitTorrent specification

        @[JSON::Field(key: "Body")]
        getter body : Bytes?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        def initialize(
          @body : Bytes? = nil,
          @request_charged : String? = nil
        )
        end
      end


      struct GetObjectTorrentRequest
        include JSON::Serializable

        # The name of the bucket containing the object for which to get the torrent files.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The object key for which to get the information.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        def initialize(
          @bucket : String,
          @key : String,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil
        )
        end
      end


      struct GetPublicAccessBlockOutput
        include JSON::Serializable

        # The PublicAccessBlock configuration currently in effect for this Amazon S3 bucket.

        @[JSON::Field(key: "PublicAccessBlockConfiguration")]
        getter public_access_block_configuration : Types::PublicAccessBlockConfiguration?

        def initialize(
          @public_access_block_configuration : Types::PublicAccessBlockConfiguration? = nil
        )
        end
      end


      struct GetPublicAccessBlockRequest
        include JSON::Serializable

        # The name of the Amazon S3 bucket whose PublicAccessBlock configuration you want to retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end

      # Container for S3 Glacier job parameters.

      struct GlacierJobParameters
        include JSON::Serializable

        # Retrieval tier at which the restore will be processed.

        @[JSON::Field(key: "Tier")]
        getter tier : String

        def initialize(
          @tier : String
        )
        end
      end

      # Container for grant information.

      struct Grant
        include JSON::Serializable

        # The person being granted permissions.

        @[JSON::Field(key: "Grantee")]
        getter grantee : Types::Grantee?

        # Specifies the permission given to the grantee.

        @[JSON::Field(key: "Permission")]
        getter permission : String?

        def initialize(
          @grantee : Types::Grantee? = nil,
          @permission : String? = nil
        )
        end
      end

      # Container for the person being granted permissions.

      struct Grantee
        include JSON::Serializable

        # Type of grantee

        @[JSON::Field(key: "xsi:type")]
        getter type : String


        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?


        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The canonical user ID of the grantee.

        @[JSON::Field(key: "ID")]
        getter id : String?

        # URI of the grantee group.

        @[JSON::Field(key: "URI")]
        getter uri : String?

        def initialize(
          @type : String,
          @display_name : String? = nil,
          @email_address : String? = nil,
          @id : String? = nil,
          @uri : String? = nil
        )
        end
      end


      struct HeadBucketOutput
        include JSON::Serializable

        # Indicates whether the bucket name used in the request is an access point alias. For directory
        # buckets, the value of this field is false .

        @[JSON::Field(key: "x-amz-access-point-alias")]
        getter access_point_alias : Bool?

        # The Amazon Resource Name (ARN) of the S3 bucket. ARNs uniquely identify Amazon Web Services
        # resources across all of Amazon Web Services. This parameter is only supported for S3 directory
        # buckets. For more information, see Using tags with directory buckets .

        @[JSON::Field(key: "x-amz-bucket-arn")]
        getter bucket_arn : String?

        # The name of the location where the bucket will be created. For directory buckets, the Zone ID of the
        # Availability Zone or the Local Zone where the bucket is created. An example Zone ID value for an
        # Availability Zone is usw2-az1 . This functionality is only supported by directory buckets.

        @[JSON::Field(key: "x-amz-bucket-location-name")]
        getter bucket_location_name : String?

        # The type of location where the bucket is created. This functionality is only supported by directory
        # buckets.

        @[JSON::Field(key: "x-amz-bucket-location-type")]
        getter bucket_location_type : String?

        # The Region that the bucket is located.

        @[JSON::Field(key: "x-amz-bucket-region")]
        getter bucket_region : String?

        def initialize(
          @access_point_alias : Bool? = nil,
          @bucket_arn : String? = nil,
          @bucket_location_name : String? = nil,
          @bucket_location_type : String? = nil,
          @bucket_region : String? = nil
        )
        end
      end


      struct HeadBucketRequest
        include JSON::Serializable

        # The bucket name. Directory buckets - When you use this operation with a directory bucket, you must
        # use virtual-hosted-style requests in the format Bucket-name .s3express- zone-id . region-code
        # .amazonaws.com . Path-style requests are not supported. Directory bucket names must be unique in the
        # chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format bucket-base-name
        # -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about
        # bucket naming restrictions, see Directory bucket naming rules in the Amazon S3 User Guide . Access
        # points - When you use this action with an access point for general purpose buckets, you must provide
        # the alias of the access point in place of the bucket name or specify the access point ARN. When you
        # use this action with an access point for directory buckets, you must provide the access point name
        # in place of the bucket name. When using the access point ARN, you must direct requests to the access
        # point hostname. The access point hostname takes the form AccessPointName - AccountId
        # .s3-accesspoint. Region .amazonaws.com. When using this action with an access point through the
        # Amazon Web Services SDKs, you provide the access point ARN in place of the bucket name. For more
        # information about access point ARNs, see Using access points in the Amazon S3 User Guide . Object
        # Lambda access points - When you use this API operation with an Object Lambda access point, provide
        # the alias of the Object Lambda access point in place of the bucket name. If the Object Lambda access
        # point alias in a request is not valid, the error code InvalidAccessPointAliasError is returned. For
        # more information about InvalidAccessPointAliasError , see List of Error Codes . Object Lambda access
        # points are not supported by directory buckets. S3 on Outposts - When you use this action with S3 on
        # Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes
        # the form AccessPointName - AccountId . outpostID .s3-outposts. Region .amazonaws.com . When you use
        # this action with S3 on Outposts, the destination bucket must be the Outposts access point ARN or the
        # access point alias. For more information about S3 on Outposts, see What is S3 on Outposts? in the
        # Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct HeadObjectOutput
        include JSON::Serializable

        # Indicates that a range of bytes was specified.

        @[JSON::Field(key: "accept-ranges")]
        getter accept_ranges : String?

        # The archive state of the head object. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-archive-status")]
        getter archive_status : String?

        # Indicates whether the object uses an S3 Bucket Key for server-side encryption with Key Management
        # Service (KMS) keys (SSE-KMS).

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # Specifies caching behavior along the request/reply chain.

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # The Base64 encoded, 32-bit CRC32 checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32c")]
        getter checksum_crc32_c : String?

        # The Base64 encoded, 64-bit CRC64NVME checksum of the object. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc64nvme")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 digest of the object. This checksum is only present if the checksum
        # was uploaded with the object. When you use the API operation on an object that was uploaded using
        # multipart uploads, this value may not be a direct checksum value of the full object. Instead, it's a
        # calculation based on the checksum values of each individual part. For more information about how
        # checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3 User
        # Guide .

        @[JSON::Field(key: "x-amz-checksum-sha1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 digest of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha256")]
        getter checksum_sha256 : String?

        # The checksum type, which determines how part-level checksums are combined to create an object-level
        # checksum for multipart objects. You can use this header response to verify that the checksum type
        # that is received is the same checksum type that was specified in CreateMultipartUpload request. For
        # more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-type")]
        getter checksum_type : String?

        # Specifies presentational information for the object.

        @[JSON::Field(key: "Content-Disposition")]
        getter content_disposition : String?

        # Indicates what content encodings have been applied to the object and thus what decoding mechanisms
        # must be applied to obtain the media-type referenced by the Content-Type header field.

        @[JSON::Field(key: "Content-Encoding")]
        getter content_encoding : String?

        # The language the content is in.

        @[JSON::Field(key: "Content-Language")]
        getter content_language : String?

        # Size of the body in bytes.

        @[JSON::Field(key: "Content-Length")]
        getter content_length : Int64?

        # The portion of the object returned in the response for a GET request.

        @[JSON::Field(key: "Content-Range")]
        getter content_range : String?

        # A standard MIME type describing the format of the object data.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If false, this
        # response header does not appear in the response. This functionality is not supported for directory
        # buckets.

        @[JSON::Field(key: "x-amz-delete-marker")]
        getter delete_marker : Bool?

        # An entity tag (ETag) is an opaque identifier assigned by a web server to a specific version of a
        # resource found at a URL.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # If the object expiration is configured (see PutBucketLifecycleConfiguration ), the response includes
        # this header. It includes the expiry-date and rule-id key-value pairs providing object expiration
        # information. The value of the rule-id is URL-encoded. Object expiration information is not returned
        # in directory buckets and this header returns the value " NotImplemented " in all responses for
        # directory buckets.

        @[JSON::Field(key: "x-amz-expiration")]
        getter expiration : String?

        # The date and time at which the object is no longer cacheable.

        @[JSON::Field(key: "Expires")]
        getter expires : String?

        # Date and time when the object was last modified.

        @[JSON::Field(key: "Last-Modified")]
        getter last_modified : Time?

        # A map of metadata to store with the object in S3.

        @[JSON::Field(key: "x-amz-meta-")]
        getter metadata : Hash(String, String)?

        # This is set to the number of metadata entries not returned in x-amz-meta headers. This can happen if
        # you create metadata using an API like SOAP that supports more flexible metadata than the REST API.
        # For example, using SOAP, you can create metadata whose values are not legal HTTP headers. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-missing-meta")]
        getter missing_meta : Int32?

        # Specifies whether a legal hold is in effect for this object. This header is only returned if the
        # requester has the s3:GetObjectLegalHold permission. This header is not returned if the specified
        # version of this object has never had a legal hold applied. For more information about S3 Object
        # Lock, see Object Lock . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-legal-hold")]
        getter object_lock_legal_hold_status : String?

        # The Object Lock mode, if any, that's in effect for this object. This header is only returned if the
        # requester has the s3:GetObjectRetention permission. For more information about S3 Object Lock, see
        # Object Lock . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-mode")]
        getter object_lock_mode : String?

        # The date and time when the Object Lock retention period expires. This header is only returned if the
        # requester has the s3:GetObjectRetention permission. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-retain-until-date")]
        getter object_lock_retain_until_date : Time?

        # The count of parts this object has. This value is only returned if you specify partNumber in your
        # request and the object was uploaded as a multipart upload.

        @[JSON::Field(key: "x-amz-mp-parts-count")]
        getter parts_count : Int32?

        # Amazon S3 can return this header if your request involves a bucket that is either a source or a
        # destination in a replication rule. In replication, you have a source bucket on which you configure
        # replication and destination bucket or buckets where Amazon S3 stores object replicas. When you
        # request an object ( GetObject ) or object metadata ( HeadObject ) from these buckets, Amazon S3 will
        # return the x-amz-replication-status header in the response as follows: If requesting an object from
        # the source bucket , Amazon S3 will return the x-amz-replication-status header if the object in your
        # request is eligible for replication. For example, suppose that in your replication configuration,
        # you specify object prefix TaxDocs requesting Amazon S3 to replicate objects with key prefix TaxDocs
        # . Any objects you upload with this key name prefix, for example TaxDocs/document1.pdf , are eligible
        # for replication. For any object request with this key name prefix, Amazon S3 will return the
        # x-amz-replication-status header with value PENDING, COMPLETED or FAILED indicating object
        # replication status. If requesting an object from a destination bucket , Amazon S3 will return the
        # x-amz-replication-status header with value REPLICA if the object in your request is a replica that
        # Amazon S3 created and there is no replica modification replication in progress. When replicating
        # objects to multiple destination buckets , the x-amz-replication-status header acts differently. The
        # header of the source object will only return a value of COMPLETED when replication is successful to
        # all destinations. The header will remain at value PENDING until replication has completed for all
        # destinations. If one or more destinations fails replication the header will return FAILED. For more
        # information, see Replication . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-replication-status")]
        getter replication_status : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # If the object is an archived object (an object whose storage class is GLACIER), the response
        # includes this header if either the archive restoration is in progress (see RestoreObject or an
        # archive copy is already restored. If an archive copy is already restored, the header value indicates
        # when Amazon S3 is scheduled to delete the object copy. For example: x-amz-restore:
        # ongoing-request="false", expiry-date="Fri, 21 Dec 2012 00:00:00 GMT" If the object restoration is in
        # progress, the header returns the value ongoing-request="true" . For more information about archiving
        # objects, see Transitioning Objects: General Considerations . This functionality is not supported for
        # directory buckets. Directory buckets only support EXPRESS_ONEZONE (the S3 Express One Zone storage
        # class) in Availability Zones and ONEZONE_IA (the S3 One Zone-Infrequent Access storage class) in
        # Dedicated Local Zones.

        @[JSON::Field(key: "x-amz-restore")]
        getter restore : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to confirm the encryption algorithm that's used. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to provide the round-trip message integrity verification of the
        # customer-provided encryption key. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # If present, indicates the ID of the KMS key that was used for object encryption.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
        # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid server
        # side encryption option is aws:fsx .

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # Provides storage class information of the object. Amazon S3 returns this header for all objects
        # except for S3 Standard storage class objects. For more information, see Storage Classes . Directory
        # buckets - Directory buckets only support EXPRESS_ONEZONE (the S3 Express One Zone storage class) in
        # Availability Zones and ONEZONE_IA (the S3 One Zone-Infrequent Access storage class) in Dedicated
        # Local Zones.

        @[JSON::Field(key: "x-amz-storage-class")]
        getter storage_class : String?

        # The number of tags, if any, on the object, when you have the relevant permission to read object
        # tags. You can use GetObjectTagging to retrieve the tag set associated with an object. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-tagging-count")]
        getter tag_count : Int32?

        # Version ID of the object. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        # If the bucket is configured as a website, redirects requests for this object to another object in
        # the same bucket or to an external URL. Amazon S3 stores the value of this header in the object
        # metadata. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-website-redirect-location")]
        getter website_redirect_location : String?

        def initialize(
          @accept_ranges : String? = nil,
          @archive_status : String? = nil,
          @bucket_key_enabled : Bool? = nil,
          @cache_control : String? = nil,
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @checksum_type : String? = nil,
          @content_disposition : String? = nil,
          @content_encoding : String? = nil,
          @content_language : String? = nil,
          @content_length : Int64? = nil,
          @content_range : String? = nil,
          @content_type : String? = nil,
          @delete_marker : Bool? = nil,
          @e_tag : String? = nil,
          @expiration : String? = nil,
          @expires : String? = nil,
          @last_modified : Time? = nil,
          @metadata : Hash(String, String)? = nil,
          @missing_meta : Int32? = nil,
          @object_lock_legal_hold_status : String? = nil,
          @object_lock_mode : String? = nil,
          @object_lock_retain_until_date : Time? = nil,
          @parts_count : Int32? = nil,
          @replication_status : String? = nil,
          @request_charged : String? = nil,
          @restore : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @storage_class : String? = nil,
          @tag_count : Int32? = nil,
          @version_id : String? = nil,
          @website_redirect_location : String? = nil
        )
        end
      end


      struct HeadObjectRequest
        include JSON::Serializable

        # The name of the bucket that contains the object. Directory buckets - When you use this operation
        # with a directory bucket, you must use virtual-hosted-style requests in the format Bucket-name
        # .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not supported. Directory
        # bucket names must be unique in the chosen Zone (Availability Zone or Local Zone). Bucket names must
        # follow the format bucket-base-name -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1
        # --x-s3 ). For information about bucket naming restrictions, see Directory bucket naming rules in the
        # Amazon S3 User Guide . Access points - When you use this action with an access point for general
        # purpose buckets, you must provide the alias of the access point in place of the bucket name or
        # specify the access point ARN. When you use this action with an access point for directory buckets,
        # you must provide the access point name in place of the bucket name. When using the access point ARN,
        # you must direct requests to the access point hostname. The access point hostname takes the form
        # AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When using this action with an
        # access point through the Amazon Web Services SDKs, you provide the access point ARN in place of the
        # bucket name. For more information about access point ARNs, see Using access points in the Amazon S3
        # User Guide . Object Lambda access points are not supported by directory buckets. S3 on Outposts -
        # When you use this action with S3 on Outposts, you must direct requests to the S3 on Outposts
        # hostname. The S3 on Outposts hostname takes the form AccessPointName - AccountId . outpostID
        # .s3-outposts. Region .amazonaws.com . When you use this action with S3 on Outposts, the destination
        # bucket must be the Outposts access point ARN or the access point alias. For more information about
        # S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The object key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # To retrieve the checksum, this parameter must be enabled. General purpose buckets - If you enable
        # checksum mode and the object is uploaded with a checksum and encrypted with an Key Management
        # Service (KMS) key, you must have permission to use the kms:Decrypt action to retrieve the checksum.
        # Directory buckets - If you enable ChecksumMode and the object is encrypted with Amazon Web Services
        # Key Management Service (Amazon Web Services KMS), you must also have the kms:GenerateDataKey and
        # kms:Decrypt permissions in IAM identity-based policies and KMS key policies for the KMS key to
        # retrieve the checksum of the object.

        @[JSON::Field(key: "x-amz-checksum-mode")]
        getter checksum_mode : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Return the object only if its entity tag (ETag) is the same as the one specified; otherwise, return
        # a 412 (precondition failed) error. If both of the If-Match and If-Unmodified-Since headers are
        # present in the request as follows: If-Match condition evaluates to true , and; If-Unmodified-Since
        # condition evaluates to false ; Then Amazon S3 returns 200 OK and the data requested. For more
        # information about conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Return the object only if it has been modified since the specified time; otherwise, return a 304
        # (not modified) error. If both of the If-None-Match and If-Modified-Since headers are present in the
        # request as follows: If-None-Match condition evaluates to false , and; If-Modified-Since condition
        # evaluates to true ; Then Amazon S3 returns the 304 Not Modified response code. For more information
        # about conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-Modified-Since")]
        getter if_modified_since : Time?

        # Return the object only if its entity tag (ETag) is different from the one specified; otherwise,
        # return a 304 (not modified) error. If both of the If-None-Match and If-Modified-Since headers are
        # present in the request as follows: If-None-Match condition evaluates to false , and;
        # If-Modified-Since condition evaluates to true ; Then Amazon S3 returns the 304 Not Modified response
        # code. For more information about conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # Return the object only if it has not been modified since the specified time; otherwise, return a 412
        # (precondition failed) error. If both of the If-Match and If-Unmodified-Since headers are present in
        # the request as follows: If-Match condition evaluates to true , and; If-Unmodified-Since condition
        # evaluates to false ; Then Amazon S3 returns 200 OK and the data requested. For more information
        # about conditional requests, see RFC 7232 .

        @[JSON::Field(key: "If-Unmodified-Since")]
        getter if_unmodified_since : Time?

        # Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively
        # performs a 'ranged' HEAD request for the part specified. Useful querying about the size of the part
        # and the number of parts in this object.

        @[JSON::Field(key: "partNumber")]
        getter part_number : Int32?

        # HeadObject returns only the metadata for an object. If the Range is satisfiable, only the
        # ContentLength is affected in the response. If the Range is not satisfiable, S3 returns a 416 -
        # Requested Range Not Satisfiable error.

        @[JSON::Field(key: "Range")]
        getter range : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Sets the Cache-Control header of the response.

        @[JSON::Field(key: "response-cache-control")]
        getter response_cache_control : String?

        # Sets the Content-Disposition header of the response.

        @[JSON::Field(key: "response-content-disposition")]
        getter response_content_disposition : String?

        # Sets the Content-Encoding header of the response.

        @[JSON::Field(key: "response-content-encoding")]
        getter response_content_encoding : String?

        # Sets the Content-Language header of the response.

        @[JSON::Field(key: "response-content-language")]
        getter response_content_language : String?

        # Sets the Content-Type header of the response.

        @[JSON::Field(key: "response-content-type")]
        getter response_content_type : String?

        # Sets the Expires header of the response.

        @[JSON::Field(key: "response-expires")]
        getter response_expires : Time?

        # Specifies the algorithm to use when encrypting the object (for example, AES256). This functionality
        # is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value
        # is used to store the object and then it is discarded; Amazon S3 does not store the encryption key.
        # The key must be appropriate for use with the algorithm specified in the
        # x-amz-server-side-encryption-customer-algorithm header. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this
        # header for a message integrity check to ensure that the encryption key was transmitted without
        # error. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # Version ID used to reference a specific version of the object. For directory buckets in this API
        # operation, only the null value of the version ID is supported.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @checksum_mode : String? = nil,
          @expected_bucket_owner : String? = nil,
          @if_match : String? = nil,
          @if_modified_since : Time? = nil,
          @if_none_match : String? = nil,
          @if_unmodified_since : Time? = nil,
          @part_number : Int32? = nil,
          @range : String? = nil,
          @request_payer : String? = nil,
          @response_cache_control : String? = nil,
          @response_content_disposition : String? = nil,
          @response_content_encoding : String? = nil,
          @response_content_language : String? = nil,
          @response_content_type : String? = nil,
          @response_expires : Time? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Parameters on this idempotent request are inconsistent with parameters used in previous request(s).
      # For a list of error codes and more information on Amazon S3 errors, see Error codes . Idempotency
      # ensures that an API request completes no more than one time. With an idempotent request, if the
      # original request completes successfully, any subsequent retries complete successfully without
      # performing any further actions.

      struct IdempotencyParameterMismatch
        include JSON::Serializable

        def initialize
        end
      end

      # Container for the Suffix element.

      struct IndexDocument
        include JSON::Serializable

        # A suffix that is appended to a request that is for a directory on the website endpoint. (For
        # example, if the suffix is index.html and you make a request to samplebucket/images/ , the data that
        # is returned will be for the object with the key name images/index.html .) The suffix must not be
        # empty and must not include a slash character. Replacement must be made for object keys containing
        # special characters (such as carriage returns) when using XML requests. For more information, see XML
        # related object key constraints .

        @[JSON::Field(key: "Suffix")]
        getter suffix : String

        def initialize(
          @suffix : String
        )
        end
      end

      # Container element that identifies who initiated the multipart upload.

      struct Initiator
        include JSON::Serializable

        # This functionality is not supported for directory buckets.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # If the principal is an Amazon Web Services account, it provides the Canonical User ID. If the
        # principal is an IAM User, it provides a user ARN value. Directory buckets - If the principal is an
        # Amazon Web Services account, it provides the Amazon Web Services account ID. If the principal is an
        # IAM User, it provides a user ARN value.

        @[JSON::Field(key: "ID")]
        getter id : String?

        def initialize(
          @display_name : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Describes the serialization format of the object.

      struct InputSerialization
        include JSON::Serializable

        # Describes the serialization of a CSV-encoded object.

        @[JSON::Field(key: "CSV")]
        getter csv : Types::CSVInput?

        # Specifies object's compression format. Valid values: NONE, GZIP, BZIP2. Default Value: NONE.

        @[JSON::Field(key: "CompressionType")]
        getter compression_type : String?

        # Specifies JSON as object's input serialization format.

        @[JSON::Field(key: "JSON")]
        getter json : Types::JSONInput?

        # Specifies Parquet as object's input serialization format.

        @[JSON::Field(key: "Parquet")]
        getter parquet : Types::ParquetInput?

        def initialize(
          @csv : Types::CSVInput? = nil,
          @compression_type : String? = nil,
          @json : Types::JSONInput? = nil,
          @parquet : Types::ParquetInput? = nil
        )
        end
      end

      # A container for specifying S3 Intelligent-Tiering filters. The filters determine the subset of
      # objects to which the rule applies.

      struct IntelligentTieringAndOperator
        include JSON::Serializable

        # An object key name prefix that identifies the subset of objects to which the configuration applies.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # All of these tags must exist in the object's tag set in order for the configuration to apply.

        @[JSON::Field(key: "Tag")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @prefix : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Specifies the S3 Intelligent-Tiering configuration for an Amazon S3 bucket. For information about
      # the S3 Intelligent-Tiering storage class, see Storage class for automatically optimizing frequently
      # and infrequently accessed objects .

      struct IntelligentTieringConfiguration
        include JSON::Serializable

        # The ID used to identify the S3 Intelligent-Tiering configuration.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Specifies the status of the configuration.

        @[JSON::Field(key: "Status")]
        getter status : String

        # Specifies the S3 Intelligent-Tiering storage class tier of the configuration.

        @[JSON::Field(key: "Tiering")]
        getter tierings : Array(Types::Tiering)

        # Specifies a bucket filter. The configuration only includes objects that meet the filter's criteria.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::IntelligentTieringFilter?

        def initialize(
          @id : String,
          @status : String,
          @tierings : Array(Types::Tiering),
          @filter : Types::IntelligentTieringFilter? = nil
        )
        end
      end

      # The Filter is used to identify objects that the S3 Intelligent-Tiering configuration applies to.

      struct IntelligentTieringFilter
        include JSON::Serializable

        # A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The
        # operator must have at least two predicates, and an object must match all of the predicates in order
        # for the filter to apply.

        @[JSON::Field(key: "And")]
        getter and : Types::IntelligentTieringAndOperator?

        # An object key name prefix that identifies the subset of objects to which the rule applies.
        # Replacement must be made for object keys containing special characters (such as carriage returns)
        # when using XML requests. For more information, see XML related object key constraints .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?


        @[JSON::Field(key: "Tag")]
        getter tag : Types::Tag?

        def initialize(
          @and : Types::IntelligentTieringAndOperator? = nil,
          @prefix : String? = nil,
          @tag : Types::Tag? = nil
        )
        end
      end

      # Object is archived and inaccessible until restored. If the object you are retrieving is stored in
      # the S3 Glacier Flexible Retrieval storage class, the S3 Glacier Deep Archive storage class, the S3
      # Intelligent-Tiering Archive Access tier, or the S3 Intelligent-Tiering Deep Archive Access tier,
      # before you can retrieve the object you must first restore a copy using RestoreObject . Otherwise,
      # this operation returns an InvalidObjectState error. For information about restoring archived
      # objects, see Restoring Archived Objects in the Amazon S3 User Guide .

      struct InvalidObjectState
        include JSON::Serializable


        @[JSON::Field(key: "AccessTier")]
        getter access_tier : String?


        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @access_tier : String? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # You may receive this error in multiple cases. Depending on the reason for the error, you may receive
      # one of the messages below: Cannot specify both a write offset value and user-defined object metadata
      # for existing objects. Checksum Type mismatch occurred, expected checksum Type: sha1, actual checksum
      # Type: crc32c. Request body cannot be empty when 'write offset' is specified.

      struct InvalidRequest
        include JSON::Serializable

        def initialize
        end
      end

      # The write offset value that you specified does not match the current object size.

      struct InvalidWriteOffset
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the S3 Inventory configuration for an Amazon S3 bucket. For more information, see GET
      # Bucket inventory in the Amazon S3 API Reference .

      struct InventoryConfiguration
        include JSON::Serializable

        # Contains information about where to publish the inventory results.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::InventoryDestination

        # The ID used to identify the inventory configuration.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Object versions to include in the inventory list. If set to All , the list includes all the object
        # versions, which adds the version-related fields VersionId , IsLatest , and DeleteMarker to the list.
        # If set to Current , the list does not contain these version-related fields.

        @[JSON::Field(key: "IncludedObjectVersions")]
        getter included_object_versions : String

        # Specifies whether the inventory is enabled or disabled. If set to True , an inventory list is
        # generated. If set to False , no inventory list is generated.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool

        # Specifies the schedule for generating inventory results.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::InventorySchedule

        # Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::InventoryFilter?

        # Contains the optional fields that are included in the inventory results.

        @[JSON::Field(key: "OptionalFields")]
        getter optional_fields : Array(String)?

        def initialize(
          @destination : Types::InventoryDestination,
          @id : String,
          @included_object_versions : String,
          @is_enabled : Bool,
          @schedule : Types::InventorySchedule,
          @filter : Types::InventoryFilter? = nil,
          @optional_fields : Array(String)? = nil
        )
        end
      end

      # Specifies the S3 Inventory configuration for an Amazon S3 bucket.

      struct InventoryDestination
        include JSON::Serializable

        # Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where
        # inventory results are published.

        @[JSON::Field(key: "S3BucketDestination")]
        getter s3_bucket_destination : Types::InventoryS3BucketDestination

        def initialize(
          @s3_bucket_destination : Types::InventoryS3BucketDestination
        )
        end
      end

      # Contains the type of server-side encryption used to encrypt the S3 Inventory results.

      struct InventoryEncryption
        include JSON::Serializable

        # Specifies the use of SSE-KMS to encrypt delivered inventory reports.

        @[JSON::Field(key: "SSE-KMS")]
        getter ssekms : Types::SSEKMS?

        # Specifies the use of SSE-S3 to encrypt delivered inventory reports.

        @[JSON::Field(key: "SSE-S3")]
        getter sses3 : Types::SSES3?

        def initialize(
          @ssekms : Types::SSEKMS? = nil,
          @sses3 : Types::SSES3? = nil
        )
        end
      end

      # Specifies an S3 Inventory filter. The inventory only includes objects that meet the filter's
      # criteria.

      struct InventoryFilter
        include JSON::Serializable

        # The prefix that an object must have to be included in the inventory results.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String

        def initialize(
          @prefix : String
        )
        end
      end

      # Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where S3
      # Inventory results are published.

      struct InventoryS3BucketDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bucket where inventory results will be published.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Specifies the output format of the inventory results.

        @[JSON::Field(key: "Format")]
        getter format : String

        # The account ID that owns the destination S3 bucket. If no account ID is provided, the owner is not
        # validated before exporting data. Although this value is optional, we strongly recommend that you set
        # it to help prevent problems if the destination bucket ownership changes.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Contains the type of server-side encryption used to encrypt the inventory results.

        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::InventoryEncryption?

        # The prefix that is prepended to all inventory results.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String,
          @format : String,
          @account_id : String? = nil,
          @encryption : Types::InventoryEncryption? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Specifies the schedule for generating S3 Inventory results.

      struct InventorySchedule
        include JSON::Serializable

        # Specifies how frequently inventory results are produced.

        @[JSON::Field(key: "Frequency")]
        getter frequency : String

        def initialize(
          @frequency : String
        )
        end
      end

      # The inventory table configuration for an S3 Metadata configuration.

      struct InventoryTableConfiguration
        include JSON::Serializable

        # The configuration state of the inventory table, indicating whether the inventory table is enabled or
        # disabled.

        @[JSON::Field(key: "ConfigurationState")]
        getter configuration_state : String

        # The encryption configuration for the inventory table.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::MetadataTableEncryptionConfiguration?

        def initialize(
          @configuration_state : String,
          @encryption_configuration : Types::MetadataTableEncryptionConfiguration? = nil
        )
        end
      end

      # The inventory table configuration for an S3 Metadata configuration.

      struct InventoryTableConfigurationResult
        include JSON::Serializable

        # The configuration state of the inventory table, indicating whether the inventory table is enabled or
        # disabled.

        @[JSON::Field(key: "ConfigurationState")]
        getter configuration_state : String


        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorDetails?

        # The Amazon Resource Name (ARN) for the inventory table.

        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        # The name of the inventory table.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # The status of the inventory table. The status values are: CREATING - The inventory table is in the
        # process of being created in the specified Amazon Web Services managed table bucket. BACKFILLING -
        # The inventory table is in the process of being backfilled. When you enable the inventory table for
        # your metadata configuration, the table goes through a process known as backfilling, during which
        # Amazon S3 scans your general purpose bucket to retrieve the initial metadata for all objects in the
        # bucket. Depending on the number of objects in your bucket, this process can take several hours. When
        # the backfilling process is finished, the status of your inventory table changes from BACKFILLING to
        # ACTIVE . After backfilling is completed, updates to your objects are reflected in the inventory
        # table within one hour. ACTIVE - The inventory table has been created successfully, and records are
        # being delivered to the table. FAILED - Amazon S3 is unable to create the inventory table, or Amazon
        # S3 is unable to deliver records.

        @[JSON::Field(key: "TableStatus")]
        getter table_status : String?

        def initialize(
          @configuration_state : String,
          @error : Types::ErrorDetails? = nil,
          @table_arn : String? = nil,
          @table_name : String? = nil,
          @table_status : String? = nil
        )
        end
      end

      # The specified updates to the S3 Metadata inventory table configuration.

      struct InventoryTableConfigurationUpdates
        include JSON::Serializable

        # The configuration state of the inventory table, indicating whether the inventory table is enabled or
        # disabled.

        @[JSON::Field(key: "ConfigurationState")]
        getter configuration_state : String

        # The encryption configuration for the inventory table.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::MetadataTableEncryptionConfiguration?

        def initialize(
          @configuration_state : String,
          @encryption_configuration : Types::MetadataTableEncryptionConfiguration? = nil
        )
        end
      end

      # Specifies JSON as object's input serialization format.

      struct JSONInput
        include JSON::Serializable

        # The type of JSON. Valid values: Document, Lines.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # Specifies JSON as request's output serialization format.

      struct JSONOutput
        include JSON::Serializable

        # The value used to separate individual records in the output. If no value is specified, Amazon S3
        # uses a newline character ('\n').

        @[JSON::Field(key: "RecordDelimiter")]
        getter record_delimiter : String?

        def initialize(
          @record_delimiter : String? = nil
        )
        end
      end

      # The journal table configuration for an S3 Metadata configuration.

      struct JournalTableConfiguration
        include JSON::Serializable

        # The journal table record expiration settings for the journal table.

        @[JSON::Field(key: "RecordExpiration")]
        getter record_expiration : Types::RecordExpiration

        # The encryption configuration for the journal table.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::MetadataTableEncryptionConfiguration?

        def initialize(
          @record_expiration : Types::RecordExpiration,
          @encryption_configuration : Types::MetadataTableEncryptionConfiguration? = nil
        )
        end
      end

      # The journal table configuration for the S3 Metadata configuration.

      struct JournalTableConfigurationResult
        include JSON::Serializable

        # The journal table record expiration settings for the journal table.

        @[JSON::Field(key: "RecordExpiration")]
        getter record_expiration : Types::RecordExpiration

        # The name of the journal table.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The status of the journal table. The status values are: CREATING - The journal table is in the
        # process of being created in the specified table bucket. ACTIVE - The journal table has been created
        # successfully, and records are being delivered to the table. FAILED - Amazon S3 is unable to create
        # the journal table, or Amazon S3 is unable to deliver records.

        @[JSON::Field(key: "TableStatus")]
        getter table_status : String


        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorDetails?

        # The Amazon Resource Name (ARN) for the journal table.

        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        def initialize(
          @record_expiration : Types::RecordExpiration,
          @table_name : String,
          @table_status : String,
          @error : Types::ErrorDetails? = nil,
          @table_arn : String? = nil
        )
        end
      end

      # The specified updates to the S3 Metadata journal table configuration.

      struct JournalTableConfigurationUpdates
        include JSON::Serializable

        # The journal table record expiration settings for the journal table.

        @[JSON::Field(key: "RecordExpiration")]
        getter record_expiration : Types::RecordExpiration

        def initialize(
          @record_expiration : Types::RecordExpiration
        )
        end
      end

      # A container for specifying the configuration for Lambda notifications.

      struct LambdaFunctionConfiguration
        include JSON::Serializable

        # The Amazon S3 bucket event for which to invoke the Lambda function. For more information, see
        # Supported Event Types in the Amazon S3 User Guide .

        @[JSON::Field(key: "Event")]
        getter events : Array(String)

        # The Amazon Resource Name (ARN) of the Lambda function that Amazon S3 invokes when the specified
        # event type occurs.

        @[JSON::Field(key: "CloudFunction")]
        getter lambda_function_arn : String


        @[JSON::Field(key: "Filter")]
        getter filter : Types::NotificationConfigurationFilter?


        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @events : Array(String),
          @lambda_function_arn : String,
          @filter : Types::NotificationConfigurationFilter? = nil,
          @id : String? = nil
        )
        end
      end

      # Container for lifecycle rules. You can add as many as 1000 rules. For more information see, Managing
      # your storage lifecycle in the Amazon S3 User Guide .

      struct LifecycleConfiguration
        include JSON::Serializable

        # Specifies lifecycle configuration rules for an Amazon S3 bucket.

        @[JSON::Field(key: "Rule")]
        getter rules : Array(Types::Rule)

        def initialize(
          @rules : Array(Types::Rule)
        )
        end
      end

      # Container for the expiration for the lifecycle of the object. For more information see, Managing
      # your storage lifecycle in the Amazon S3 User Guide .

      struct LifecycleExpiration
        include JSON::Serializable

        # Indicates at what date the object is to be moved or deleted. The date value must conform to the ISO
        # 8601 format. The time is always midnight UTC. This parameter applies to general purpose buckets
        # only. It is not supported for directory bucket lifecycle configurations.

        @[JSON::Field(key: "Date")]
        getter date : Time?

        # Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be a
        # non-zero positive integer.

        @[JSON::Field(key: "Days")]
        getter days : Int32?

        # Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true,
        # the delete marker will be expired; if set to false the policy takes no action. This cannot be
        # specified with Days or Date in a Lifecycle Expiration Policy. This parameter applies to general
        # purpose buckets only. It is not supported for directory bucket lifecycle configurations.

        @[JSON::Field(key: "ExpiredObjectDeleteMarker")]
        getter expired_object_delete_marker : Bool?

        def initialize(
          @date : Time? = nil,
          @days : Int32? = nil,
          @expired_object_delete_marker : Bool? = nil
        )
        end
      end

      # A lifecycle rule for individual objects in an Amazon S3 bucket. For more information see, Managing
      # your storage lifecycle in the Amazon S3 User Guide .

      struct LifecycleRule
        include JSON::Serializable

        # If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being
        # applied.

        @[JSON::Field(key: "Status")]
        getter status : String


        @[JSON::Field(key: "AbortIncompleteMultipartUpload")]
        getter abort_incomplete_multipart_upload : Types::AbortIncompleteMultipartUpload?

        # Specifies the expiration for the lifecycle of the object in the form of date, days and, whether the
        # object has a delete marker.

        @[JSON::Field(key: "Expiration")]
        getter expiration : Types::LifecycleExpiration?

        # The Filter is used to identify objects that a Lifecycle Rule applies to. A Filter must have exactly
        # one of Prefix , Tag , ObjectSizeGreaterThan , ObjectSizeLessThan , or And specified. Filter is
        # required if the LifecycleRule does not contain a Prefix element. For more information about Tag
        # filters, see Adding filters to Lifecycle rules in the Amazon S3 User Guide . Tag filters are not
        # supported for directory buckets.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::LifecycleRuleFilter?

        # Unique identifier for the rule. The value cannot be longer than 255 characters.

        @[JSON::Field(key: "ID")]
        getter id : String?


        @[JSON::Field(key: "NoncurrentVersionExpiration")]
        getter noncurrent_version_expiration : Types::NoncurrentVersionExpiration?

        # Specifies the transition rule for the lifecycle rule that describes when noncurrent objects
        # transition to a specific storage class. If your bucket is versioning-enabled (or versioning is
        # suspended), you can set this action to request that Amazon S3 transition noncurrent object versions
        # to a specific storage class at a set period in the object's lifetime. This parameter applies to
        # general purpose buckets only. It is not supported for directory bucket lifecycle configurations.

        @[JSON::Field(key: "NoncurrentVersionTransition")]
        getter noncurrent_version_transitions : Array(Types::NoncurrentVersionTransition)?

        # The general purpose bucket prefix that identifies one or more objects to which the rule applies. We
        # recommend using Filter instead of Prefix for new PUTs. Previous configurations where a prefix is
        # defined will continue to operate as before. Replacement must be made for object keys containing
        # special characters (such as carriage returns) when using XML requests. For more information, see XML
        # related object key constraints .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # Specifies when an Amazon S3 object transitions to a specified storage class. This parameter applies
        # to general purpose buckets only. It is not supported for directory bucket lifecycle configurations.

        @[JSON::Field(key: "Transition")]
        getter transitions : Array(Types::Transition)?

        def initialize(
          @status : String,
          @abort_incomplete_multipart_upload : Types::AbortIncompleteMultipartUpload? = nil,
          @expiration : Types::LifecycleExpiration? = nil,
          @filter : Types::LifecycleRuleFilter? = nil,
          @id : String? = nil,
          @noncurrent_version_expiration : Types::NoncurrentVersionExpiration? = nil,
          @noncurrent_version_transitions : Array(Types::NoncurrentVersionTransition)? = nil,
          @prefix : String? = nil,
          @transitions : Array(Types::Transition)? = nil
        )
        end
      end

      # This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The
      # Lifecycle Rule will apply to any object matching all of the predicates configured inside the And
      # operator.

      struct LifecycleRuleAndOperator
        include JSON::Serializable

        # Minimum object size to which the rule applies.

        @[JSON::Field(key: "ObjectSizeGreaterThan")]
        getter object_size_greater_than : Int64?

        # Maximum object size to which the rule applies.

        @[JSON::Field(key: "ObjectSizeLessThan")]
        getter object_size_less_than : Int64?

        # Prefix identifying one or more objects to which the rule applies.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # All of these tags must exist in the object's tag set in order for the rule to apply.

        @[JSON::Field(key: "Tag")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @object_size_greater_than : Int64? = nil,
          @object_size_less_than : Int64? = nil,
          @prefix : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The Filter is used to identify objects that a Lifecycle Rule applies to. A Filter can have exactly
      # one of Prefix , Tag , ObjectSizeGreaterThan , ObjectSizeLessThan , or And specified. If the Filter
      # element is left empty, the Lifecycle Rule applies to all objects in the bucket.

      struct LifecycleRuleFilter
        include JSON::Serializable


        @[JSON::Field(key: "And")]
        getter and : Types::LifecycleRuleAndOperator?

        # Minimum object size to which the rule applies.

        @[JSON::Field(key: "ObjectSizeGreaterThan")]
        getter object_size_greater_than : Int64?

        # Maximum object size to which the rule applies.

        @[JSON::Field(key: "ObjectSizeLessThan")]
        getter object_size_less_than : Int64?

        # Prefix identifying one or more objects to which the rule applies. Replacement must be made for
        # object keys containing special characters (such as carriage returns) when using XML requests. For
        # more information, see XML related object key constraints .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # This tag must exist in the object's tag set in order for the rule to apply. This parameter applies
        # to general purpose buckets only. It is not supported for directory bucket lifecycle configurations.

        @[JSON::Field(key: "Tag")]
        getter tag : Types::Tag?

        def initialize(
          @and : Types::LifecycleRuleAndOperator? = nil,
          @object_size_greater_than : Int64? = nil,
          @object_size_less_than : Int64? = nil,
          @prefix : String? = nil,
          @tag : Types::Tag? = nil
        )
        end
      end


      struct ListBucketAnalyticsConfigurationsOutput
        include JSON::Serializable

        # The list of analytics configurations for a bucket.

        @[JSON::Field(key: "AnalyticsConfiguration")]
        getter analytics_configuration_list : Array(Types::AnalyticsConfiguration)?

        # The marker that is used as a starting point for this analytics configuration list response. This
        # value is present if it was sent in the request.

        @[JSON::Field(key: "ContinuationToken")]
        getter continuation_token : String?

        # Indicates whether the returned list of analytics configurations is complete. A value of true
        # indicates that the list is not complete and the NextContinuationToken will be provided for a
        # subsequent request.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # NextContinuationToken is sent when isTruncated is true, which indicates that there are more
        # analytics configurations to list. The next request must include this NextContinuationToken . The
        # token is obfuscated and is not a usable value.

        @[JSON::Field(key: "NextContinuationToken")]
        getter next_continuation_token : String?

        def initialize(
          @analytics_configuration_list : Array(Types::AnalyticsConfiguration)? = nil,
          @continuation_token : String? = nil,
          @is_truncated : Bool? = nil,
          @next_continuation_token : String? = nil
        )
        end
      end


      struct ListBucketAnalyticsConfigurationsRequest
        include JSON::Serializable

        # The name of the bucket from which analytics configurations are retrieved.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ContinuationToken that represents a placeholder from where this request should begin.

        @[JSON::Field(key: "continuation-token")]
        getter continuation_token : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @continuation_token : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct ListBucketIntelligentTieringConfigurationsOutput
        include JSON::Serializable

        # The ContinuationToken that represents a placeholder from where this request should begin.

        @[JSON::Field(key: "ContinuationToken")]
        getter continuation_token : String?

        # The list of S3 Intelligent-Tiering configurations for a bucket.

        @[JSON::Field(key: "IntelligentTieringConfiguration")]
        getter intelligent_tiering_configuration_list : Array(Types::IntelligentTieringConfiguration)?

        # Indicates whether the returned list of analytics configurations is complete. A value of true
        # indicates that the list is not complete and the NextContinuationToken will be provided for a
        # subsequent request.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # The marker used to continue this inventory configuration listing. Use the NextContinuationToken from
        # this response to continue the listing in a subsequent request. The continuation token is an opaque
        # value that Amazon S3 understands.

        @[JSON::Field(key: "NextContinuationToken")]
        getter next_continuation_token : String?

        def initialize(
          @continuation_token : String? = nil,
          @intelligent_tiering_configuration_list : Array(Types::IntelligentTieringConfiguration)? = nil,
          @is_truncated : Bool? = nil,
          @next_continuation_token : String? = nil
        )
        end
      end


      struct ListBucketIntelligentTieringConfigurationsRequest
        include JSON::Serializable

        # The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ContinuationToken that represents a placeholder from where this request should begin.

        @[JSON::Field(key: "continuation-token")]
        getter continuation_token : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @continuation_token : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct ListBucketInventoryConfigurationsOutput
        include JSON::Serializable

        # If sent in the request, the marker that is used as a starting point for this inventory configuration
        # list response.

        @[JSON::Field(key: "ContinuationToken")]
        getter continuation_token : String?

        # The list of inventory configurations for a bucket.

        @[JSON::Field(key: "InventoryConfiguration")]
        getter inventory_configuration_list : Array(Types::InventoryConfiguration)?

        # Tells whether the returned list of inventory configurations is complete. A value of true indicates
        # that the list is not complete and the NextContinuationToken is provided for a subsequent request.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # The marker used to continue this inventory configuration listing. Use the NextContinuationToken from
        # this response to continue the listing in a subsequent request. The continuation token is an opaque
        # value that Amazon S3 understands.

        @[JSON::Field(key: "NextContinuationToken")]
        getter next_continuation_token : String?

        def initialize(
          @continuation_token : String? = nil,
          @inventory_configuration_list : Array(Types::InventoryConfiguration)? = nil,
          @is_truncated : Bool? = nil,
          @next_continuation_token : String? = nil
        )
        end
      end


      struct ListBucketInventoryConfigurationsRequest
        include JSON::Serializable

        # The name of the bucket containing the inventory configurations to retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The marker used to continue an inventory configuration listing that has been truncated. Use the
        # NextContinuationToken from a previously truncated list response to continue the listing. The
        # continuation token is an opaque value that Amazon S3 understands.

        @[JSON::Field(key: "continuation-token")]
        getter continuation_token : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @continuation_token : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct ListBucketMetricsConfigurationsOutput
        include JSON::Serializable

        # The marker that is used as a starting point for this metrics configuration list response. This value
        # is present if it was sent in the request.

        @[JSON::Field(key: "ContinuationToken")]
        getter continuation_token : String?

        # Indicates whether the returned list of metrics configurations is complete. A value of true indicates
        # that the list is not complete and the NextContinuationToken will be provided for a subsequent
        # request.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # The list of metrics configurations for a bucket.

        @[JSON::Field(key: "MetricsConfiguration")]
        getter metrics_configuration_list : Array(Types::MetricsConfiguration)?

        # The marker used to continue a metrics configuration listing that has been truncated. Use the
        # NextContinuationToken from a previously truncated list response to continue the listing. The
        # continuation token is an opaque value that Amazon S3 understands.

        @[JSON::Field(key: "NextContinuationToken")]
        getter next_continuation_token : String?

        def initialize(
          @continuation_token : String? = nil,
          @is_truncated : Bool? = nil,
          @metrics_configuration_list : Array(Types::MetricsConfiguration)? = nil,
          @next_continuation_token : String? = nil
        )
        end
      end


      struct ListBucketMetricsConfigurationsRequest
        include JSON::Serializable

        # The name of the bucket containing the metrics configurations to retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The marker that is used to continue a metrics configuration listing that has been truncated. Use the
        # NextContinuationToken from a previously truncated list response to continue the listing. The
        # continuation token is an opaque value that Amazon S3 understands.

        @[JSON::Field(key: "continuation-token")]
        getter continuation_token : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @continuation_token : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct ListBucketsOutput
        include JSON::Serializable

        # The list of buckets owned by the requester.

        @[JSON::Field(key: "Buckets")]
        getter buckets : Array(Types::Bucket)?

        # ContinuationToken is included in the response when there are more buckets that can be listed with
        # pagination. The next ListBuckets request to Amazon S3 can be continued with this ContinuationToken .
        # ContinuationToken is obfuscated and is not a real bucket.

        @[JSON::Field(key: "ContinuationToken")]
        getter continuation_token : String?

        # The owner of the buckets listed.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::Owner?

        # If Prefix was sent with the request, it is included in the response. All bucket names in the
        # response begin with the specified bucket name prefix.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @buckets : Array(Types::Bucket)? = nil,
          @continuation_token : String? = nil,
          @owner : Types::Owner? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct ListBucketsRequest
        include JSON::Serializable

        # Limits the response to buckets that are located in the specified Amazon Web Services Region. The
        # Amazon Web Services Region must be expressed according to the Amazon Web Services Region code, such
        # as us-west-2 for the US West (Oregon) Region. For a list of the valid values for all of the Amazon
        # Web Services Regions, see Regions and Endpoints . Requests made to a Regional endpoint that is
        # different from the bucket-region parameter are not supported. For example, if you want to limit the
        # response to your buckets in Region us-west-2 , the request must be made to an endpoint in Region
        # us-west-2 .

        @[JSON::Field(key: "bucket-region")]
        getter bucket_region : String?

        # ContinuationToken indicates to Amazon S3 that the list is being continued on this bucket with a
        # token. ContinuationToken is obfuscated and is not a real key. You can use this ContinuationToken for
        # pagination of the list results. Length Constraints: Minimum length of 0. Maximum length of 1024.
        # Required: No. If you specify the bucket-region , prefix , or continuation-token query parameters
        # without using max-buckets to set the maximum number of buckets returned in the response, Amazon S3
        # applies a default page size of 10,000 and provides a continuation token if there are more buckets.

        @[JSON::Field(key: "continuation-token")]
        getter continuation_token : String?

        # Maximum number of buckets to be returned in response. When the number is more than the count of
        # buckets that are owned by an Amazon Web Services account, return all the buckets in response.

        @[JSON::Field(key: "max-buckets")]
        getter max_buckets : Int32?

        # Limits the response to bucket names that begin with the specified bucket name prefix.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_region : String? = nil,
          @continuation_token : String? = nil,
          @max_buckets : Int32? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct ListDirectoryBucketsOutput
        include JSON::Serializable

        # The list of buckets owned by the requester.

        @[JSON::Field(key: "Buckets")]
        getter buckets : Array(Types::Bucket)?

        # If ContinuationToken was sent with the request, it is included in the response. You can use the
        # returned ContinuationToken for pagination of the list response.

        @[JSON::Field(key: "ContinuationToken")]
        getter continuation_token : String?

        def initialize(
          @buckets : Array(Types::Bucket)? = nil,
          @continuation_token : String? = nil
        )
        end
      end


      struct ListDirectoryBucketsRequest
        include JSON::Serializable

        # ContinuationToken indicates to Amazon S3 that the list is being continued on buckets in this account
        # with a token. ContinuationToken is obfuscated and is not a real bucket name. You can use this
        # ContinuationToken for the pagination of the list results.

        @[JSON::Field(key: "continuation-token")]
        getter continuation_token : String?

        # Maximum number of buckets to be returned in response. When the number is more than the count of
        # buckets that are owned by an Amazon Web Services account, return all the buckets in response.

        @[JSON::Field(key: "max-directory-buckets")]
        getter max_directory_buckets : Int32?

        def initialize(
          @continuation_token : String? = nil,
          @max_directory_buckets : Int32? = nil
        )
        end
      end


      struct ListMultipartUploadsOutput
        include JSON::Serializable

        # The name of the bucket to which the multipart upload was initiated. Does not return the access point
        # ARN or access point alias if used.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # If you specify a delimiter in the request, then the result returns each distinct key prefix
        # containing the delimiter in a CommonPrefixes element. The distinct key prefixes are returned in the
        # Prefix child element. Directory buckets - For directory buckets, only prefixes that end in a
        # delimiter ( / ) are supported.

        @[JSON::Field(key: "CommonPrefixes")]
        getter common_prefixes : Array(Types::CommonPrefix)?

        # Contains the delimiter you specified in the request. If you don't specify a delimiter in your
        # request, this element is absent from the response. Directory buckets - For directory buckets, / is
        # the only supported delimiter.

        @[JSON::Field(key: "Delimiter")]
        getter delimiter : String?

        # Encoding type used by Amazon S3 to encode object keys in the response. If you specify the
        # encoding-type request parameter, Amazon S3 includes this element in the response, and returns
        # encoded key name values in the following response elements: Delimiter , KeyMarker , Prefix ,
        # NextKeyMarker , Key .

        @[JSON::Field(key: "EncodingType")]
        getter encoding_type : String?

        # Indicates whether the returned list of multipart uploads is truncated. A value of true indicates
        # that the list was truncated. The list can be truncated if the number of multipart uploads exceeds
        # the limit allowed or specified by max uploads.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # The key at or after which the listing began.

        @[JSON::Field(key: "KeyMarker")]
        getter key_marker : String?

        # Maximum number of multipart uploads that could have been included in the response.

        @[JSON::Field(key: "MaxUploads")]
        getter max_uploads : Int32?

        # When a list is truncated, this element specifies the value that should be used for the key-marker
        # request parameter in a subsequent request.

        @[JSON::Field(key: "NextKeyMarker")]
        getter next_key_marker : String?

        # When a list is truncated, this element specifies the value that should be used for the
        # upload-id-marker request parameter in a subsequent request. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "NextUploadIdMarker")]
        getter next_upload_id_marker : String?

        # When a prefix is provided in the request, this field contains the specified prefix. The result
        # contains only keys starting with the specified prefix. Directory buckets - For directory buckets,
        # only prefixes that end in a delimiter ( / ) are supported.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # Together with key-marker, specifies the multipart upload after which listing should begin. If
        # key-marker is not specified, the upload-id-marker parameter is ignored. Otherwise, any multipart
        # uploads for a key equal to the key-marker might be included in the list only if they have an upload
        # ID lexicographically greater than the specified upload-id-marker . This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "UploadIdMarker")]
        getter upload_id_marker : String?

        # Container for elements related to a particular multipart upload. A response can contain zero or more
        # Upload elements.

        @[JSON::Field(key: "Upload")]
        getter uploads : Array(Types::MultipartUpload)?

        def initialize(
          @bucket : String? = nil,
          @common_prefixes : Array(Types::CommonPrefix)? = nil,
          @delimiter : String? = nil,
          @encoding_type : String? = nil,
          @is_truncated : Bool? = nil,
          @key_marker : String? = nil,
          @max_uploads : Int32? = nil,
          @next_key_marker : String? = nil,
          @next_upload_id_marker : String? = nil,
          @prefix : String? = nil,
          @request_charged : String? = nil,
          @upload_id_marker : String? = nil,
          @uploads : Array(Types::MultipartUpload)? = nil
        )
        end
      end


      struct ListMultipartUploadsRequest
        include JSON::Serializable

        # The name of the bucket to which the multipart upload was initiated. Directory buckets - When you use
        # this operation with a directory bucket, you must use virtual-hosted-style requests in the format
        # Bucket-name .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not
        # supported. Directory bucket names must be unique in the chosen Zone (Availability Zone or Local
        # Zone). Bucket names must follow the format bucket-base-name -- zone-id --x-s3 (for example,
        # amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about bucket naming restrictions, see
        # Directory bucket naming rules in the Amazon S3 User Guide . Access points - When you use this action
        # with an access point for general purpose buckets, you must provide the alias of the access point in
        # place of the bucket name or specify the access point ARN. When you use this action with an access
        # point for directory buckets, you must provide the access point name in place of the bucket name.
        # When using the access point ARN, you must direct requests to the access point hostname. The access
        # point hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com.
        # When using this action with an access point through the Amazon Web Services SDKs, you provide the
        # access point ARN in place of the bucket name. For more information about access point ARNs, see
        # Using access points in the Amazon S3 User Guide . Object Lambda access points are not supported by
        # directory buckets. S3 on Outposts - When you use this action with S3 on Outposts, you must direct
        # requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form AccessPointName
        # - AccountId . outpostID .s3-outposts. Region .amazonaws.com . When you use this action with S3 on
        # Outposts, the destination bucket must be the Outposts access point ARN or the access point alias.
        # For more information about S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Character you use to group keys. All keys that contain the same string between the prefix, if
        # specified, and the first occurrence of the delimiter after the prefix are grouped under a single
        # result element, CommonPrefixes . If you don't specify the prefix parameter, then the substring
        # starts at the beginning of the key. The keys that are grouped under CommonPrefixes result element
        # are not returned elsewhere in the response. CommonPrefixes is filtered out from results if it is not
        # lexicographically greater than the key-marker. Directory buckets - For directory buckets, / is the
        # only supported delimiter.

        @[JSON::Field(key: "delimiter")]
        getter delimiter : String?


        @[JSON::Field(key: "encoding-type")]
        getter encoding_type : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Specifies the multipart upload after which listing should begin. General purpose buckets - For
        # general purpose buckets, key-marker is an object key. Together with upload-id-marker , this
        # parameter specifies the multipart upload after which listing should begin. If upload-id-marker is
        # not specified, only the keys lexicographically greater than the specified key-marker will be
        # included in the list. If upload-id-marker is specified, any multipart uploads for a key equal to the
        # key-marker might also be included, provided those multipart uploads have upload IDs
        # lexicographically greater than the specified upload-id-marker . Directory buckets - For directory
        # buckets, key-marker is obfuscated and isn't a real object key. The upload-id-marker parameter isn't
        # supported by directory buckets. To list the additional multipart uploads, you only need to set the
        # value of key-marker to the NextKeyMarker value from the previous response. In the
        # ListMultipartUploads response, the multipart uploads aren't sorted lexicographically based on the
        # object keys.

        @[JSON::Field(key: "key-marker")]
        getter key_marker : String?

        # Sets the maximum number of multipart uploads, from 1 to 1,000, to return in the response body. 1,000
        # is the maximum number of uploads that can be returned in a response.

        @[JSON::Field(key: "max-uploads")]
        getter max_uploads : Int32?

        # Lists in-progress uploads only for those keys that begin with the specified prefix. You can use
        # prefixes to separate a bucket into different grouping of keys. (You can think of using prefix to
        # make groups in the same way that you'd use a folder in a file system.) Directory buckets - For
        # directory buckets, only prefixes that end in a delimiter ( / ) are supported.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Together with key-marker, specifies the multipart upload after which listing should begin. If
        # key-marker is not specified, the upload-id-marker parameter is ignored. Otherwise, any multipart
        # uploads for a key equal to the key-marker might be included in the list only if they have an upload
        # ID lexicographically greater than the specified upload-id-marker . This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "upload-id-marker")]
        getter upload_id_marker : String?

        def initialize(
          @bucket : String,
          @delimiter : String? = nil,
          @encoding_type : String? = nil,
          @expected_bucket_owner : String? = nil,
          @key_marker : String? = nil,
          @max_uploads : Int32? = nil,
          @prefix : String? = nil,
          @request_payer : String? = nil,
          @upload_id_marker : String? = nil
        )
        end
      end


      struct ListObjectVersionsOutput
        include JSON::Serializable

        # All of the keys rolled up into a common prefix count as a single return when calculating the number
        # of returns.

        @[JSON::Field(key: "CommonPrefixes")]
        getter common_prefixes : Array(Types::CommonPrefix)?

        # Container for an object that is a delete marker. To learn more about delete markers, see Working
        # with delete markers .

        @[JSON::Field(key: "DeleteMarker")]
        getter delete_markers : Array(Types::DeleteMarkerEntry)?

        # The delimiter grouping the included keys. A delimiter is a character that you specify to group keys.
        # All keys that contain the same string between the prefix and the first occurrence of the delimiter
        # are grouped under a single result element in CommonPrefixes . These groups are counted as one result
        # against the max-keys limitation. These keys are not returned elsewhere in the response.

        @[JSON::Field(key: "Delimiter")]
        getter delimiter : String?

        # Encoding type used by Amazon S3 to encode object key names in the XML response. If you specify the
        # encoding-type request parameter, Amazon S3 includes this element in the response, and returns
        # encoded key name values in the following response elements: KeyMarker, NextKeyMarker, Prefix, Key ,
        # and Delimiter .

        @[JSON::Field(key: "EncodingType")]
        getter encoding_type : String?

        # A flag that indicates whether Amazon S3 returned all of the results that satisfied the search
        # criteria. If your results were truncated, you can make a follow-up paginated request by using the
        # NextKeyMarker and NextVersionIdMarker response parameters as a starting place in another request to
        # return the rest of the results.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # Marks the last key returned in a truncated response.

        @[JSON::Field(key: "KeyMarker")]
        getter key_marker : String?

        # Specifies the maximum number of objects to return.

        @[JSON::Field(key: "MaxKeys")]
        getter max_keys : Int32?

        # The bucket name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # When the number of responses exceeds the value of MaxKeys , NextKeyMarker specifies the first key
        # not returned that satisfies the search criteria. Use this value for the key-marker request parameter
        # in a subsequent request.

        @[JSON::Field(key: "NextKeyMarker")]
        getter next_key_marker : String?

        # When the number of responses exceeds the value of MaxKeys , NextVersionIdMarker specifies the first
        # object version not returned that satisfies the search criteria. Use this value for the
        # version-id-marker request parameter in a subsequent request.

        @[JSON::Field(key: "NextVersionIdMarker")]
        getter next_version_id_marker : String?

        # Selects objects that start with the value supplied by this parameter.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # Marks the last version of the key returned in a truncated response.

        @[JSON::Field(key: "VersionIdMarker")]
        getter version_id_marker : String?

        # Container for version information.

        @[JSON::Field(key: "Version")]
        getter versions : Array(Types::ObjectVersion)?

        def initialize(
          @common_prefixes : Array(Types::CommonPrefix)? = nil,
          @delete_markers : Array(Types::DeleteMarkerEntry)? = nil,
          @delimiter : String? = nil,
          @encoding_type : String? = nil,
          @is_truncated : Bool? = nil,
          @key_marker : String? = nil,
          @max_keys : Int32? = nil,
          @name : String? = nil,
          @next_key_marker : String? = nil,
          @next_version_id_marker : String? = nil,
          @prefix : String? = nil,
          @request_charged : String? = nil,
          @version_id_marker : String? = nil,
          @versions : Array(Types::ObjectVersion)? = nil
        )
        end
      end


      struct ListObjectVersionsRequest
        include JSON::Serializable

        # The bucket name that contains the objects.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # A delimiter is a character that you specify to group keys. All keys that contain the same string
        # between the prefix and the first occurrence of the delimiter are grouped under a single result
        # element in CommonPrefixes . These groups are counted as one result against the max-keys limitation.
        # These keys are not returned elsewhere in the response. CommonPrefixes is filtered out from results
        # if it is not lexicographically greater than the key-marker.

        @[JSON::Field(key: "delimiter")]
        getter delimiter : String?


        @[JSON::Field(key: "encoding-type")]
        getter encoding_type : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Specifies the key to start with when listing objects in a bucket.

        @[JSON::Field(key: "key-marker")]
        getter key_marker : String?

        # Sets the maximum number of keys returned in the response. By default, the action returns up to 1,000
        # key names. The response might contain fewer keys but will never contain more. If additional keys
        # satisfy the search criteria, but were not returned because max-keys was exceeded, the response
        # contains &lt;isTruncated&gt;true&lt;/isTruncated&gt; . To return the additional keys, see key-marker
        # and version-id-marker .

        @[JSON::Field(key: "max-keys")]
        getter max_keys : Int32?

        # Specifies the optional fields that you want returned in the response. Fields that you do not specify
        # are not returned.

        @[JSON::Field(key: "x-amz-optional-object-attributes")]
        getter optional_object_attributes : Array(String)?

        # Use this parameter to select only those keys that begin with the specified prefix. You can use
        # prefixes to separate a bucket into different groupings of keys. (You can think of using prefix to
        # make groups in the same way that you'd use a folder in a file system.) You can use prefix with
        # delimiter to roll up numerous objects into a single result under CommonPrefixes .

        @[JSON::Field(key: "prefix")]
        getter prefix : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Specifies the object version you want to start listing from.

        @[JSON::Field(key: "version-id-marker")]
        getter version_id_marker : String?

        def initialize(
          @bucket : String,
          @delimiter : String? = nil,
          @encoding_type : String? = nil,
          @expected_bucket_owner : String? = nil,
          @key_marker : String? = nil,
          @max_keys : Int32? = nil,
          @optional_object_attributes : Array(String)? = nil,
          @prefix : String? = nil,
          @request_payer : String? = nil,
          @version_id_marker : String? = nil
        )
        end
      end


      struct ListObjectsOutput
        include JSON::Serializable

        # All of the keys (up to 1,000) rolled up in a common prefix count as a single return when calculating
        # the number of returns. A response can contain CommonPrefixes only if you specify a delimiter.
        # CommonPrefixes contains all (if there are any) keys between Prefix and the next occurrence of the
        # string specified by the delimiter. CommonPrefixes lists keys that act like subdirectories in the
        # directory specified by Prefix . For example, if the prefix is notes/ and the delimiter is a slash (
        # / ), as in notes/summer/july , the common prefix is notes/summer/ . All of the keys that roll up
        # into a common prefix count as a single return when calculating the number of returns.

        @[JSON::Field(key: "CommonPrefixes")]
        getter common_prefixes : Array(Types::CommonPrefix)?

        # Metadata about each object returned.

        @[JSON::Field(key: "Contents")]
        getter contents : Array(Types::Object)?

        # Causes keys that contain the same string between the prefix and the first occurrence of the
        # delimiter to be rolled up into a single result element in the CommonPrefixes collection. These
        # rolled-up keys are not returned elsewhere in the response. Each rolled-up result counts as only one
        # return against the MaxKeys value.

        @[JSON::Field(key: "Delimiter")]
        getter delimiter : String?

        # Encoding type used by Amazon S3 to encode the object keys in the response. Responses are encoded
        # only in UTF-8. An object key can contain any Unicode character. However, the XML 1.0 parser can't
        # parse certain characters, such as characters with an ASCII value from 0 to 10. For characters that
        # aren't supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in
        # the response. For more information about characters to avoid in object key names, see Object key
        # naming guidelines . When using the URL encoding type, non-ASCII characters that are used in an
        # object's key name will be percent-encoded according to UTF-8 code values. For example, the object
        # test_file(3).png will appear as test_file%283%29.png .

        @[JSON::Field(key: "EncodingType")]
        getter encoding_type : String?

        # A flag that indicates whether Amazon S3 returned all of the results that satisfied the search
        # criteria.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # Indicates where in the bucket listing begins. Marker is included in the response if it was sent with
        # the request.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of keys returned in the response body.

        @[JSON::Field(key: "MaxKeys")]
        getter max_keys : Int32?

        # The bucket name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # When the response is truncated (the IsTruncated element value in the response is true ), you can use
        # the key name in this field as the marker parameter in the subsequent request to get the next set of
        # objects. Amazon S3 lists objects in alphabetical order. This element is returned only if you have
        # the delimiter request parameter specified. If the response does not include the NextMarker element
        # and it is truncated, you can use the value of the last Key element in the response as the marker
        # parameter in the subsequent request to get the next set of object keys.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Keys that begin with the indicated prefix.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        def initialize(
          @common_prefixes : Array(Types::CommonPrefix)? = nil,
          @contents : Array(Types::Object)? = nil,
          @delimiter : String? = nil,
          @encoding_type : String? = nil,
          @is_truncated : Bool? = nil,
          @marker : String? = nil,
          @max_keys : Int32? = nil,
          @name : String? = nil,
          @next_marker : String? = nil,
          @prefix : String? = nil,
          @request_charged : String? = nil
        )
        end
      end


      struct ListObjectsRequest
        include JSON::Serializable

        # The name of the bucket containing the objects. Directory buckets - When you use this operation with
        # a directory bucket, you must use virtual-hosted-style requests in the format Bucket-name .s3express-
        # zone-id . region-code .amazonaws.com . Path-style requests are not supported. Directory bucket names
        # must be unique in the chosen Zone (Availability Zone or Local Zone). Bucket names must follow the
        # format bucket-base-name -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1 --x-s3 ).
        # For information about bucket naming restrictions, see Directory bucket naming rules in the Amazon S3
        # User Guide . Access points - When you use this action with an access point for general purpose
        # buckets, you must provide the alias of the access point in place of the bucket name or specify the
        # access point ARN. When you use this action with an access point for directory buckets, you must
        # provide the access point name in place of the bucket name. When using the access point ARN, you must
        # direct requests to the access point hostname. The access point hostname takes the form
        # AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When using this action with an
        # access point through the Amazon Web Services SDKs, you provide the access point ARN in place of the
        # bucket name. For more information about access point ARNs, see Using access points in the Amazon S3
        # User Guide . Object Lambda access points are not supported by directory buckets. S3 on Outposts -
        # When you use this action with S3 on Outposts, you must direct requests to the S3 on Outposts
        # hostname. The S3 on Outposts hostname takes the form AccessPointName - AccountId . outpostID
        # .s3-outposts. Region .amazonaws.com . When you use this action with S3 on Outposts, the destination
        # bucket must be the Outposts access point ARN or the access point alias. For more information about
        # S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # A delimiter is a character that you use to group keys. CommonPrefixes is filtered out from results
        # if it is not lexicographically greater than the key-marker.

        @[JSON::Field(key: "delimiter")]
        getter delimiter : String?


        @[JSON::Field(key: "encoding-type")]
        getter encoding_type : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Marker is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this
        # specified key. Marker can be any key in the bucket.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        # Sets the maximum number of keys returned in the response. By default, the action returns up to 1,000
        # key names. The response might contain fewer keys but will never contain more.

        @[JSON::Field(key: "max-keys")]
        getter max_keys : Int32?

        # Specifies the optional fields that you want returned in the response. Fields that you do not specify
        # are not returned.

        @[JSON::Field(key: "x-amz-optional-object-attributes")]
        getter optional_object_attributes : Array(String)?

        # Limits the response to keys that begin with the specified prefix.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # Confirms that the requester knows that she or he will be charged for the list objects request.
        # Bucket owners need not specify this parameter in their requests.

        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        def initialize(
          @bucket : String,
          @delimiter : String? = nil,
          @encoding_type : String? = nil,
          @expected_bucket_owner : String? = nil,
          @marker : String? = nil,
          @max_keys : Int32? = nil,
          @optional_object_attributes : Array(String)? = nil,
          @prefix : String? = nil,
          @request_payer : String? = nil
        )
        end
      end


      struct ListObjectsV2Output
        include JSON::Serializable

        # All of the keys (up to 1,000) that share the same prefix are grouped together. When counting the
        # total numbers of returns by this API operation, this group of keys is considered as one item. A
        # response can contain CommonPrefixes only if you specify a delimiter. CommonPrefixes contains all (if
        # there are any) keys between Prefix and the next occurrence of the string specified by a delimiter.
        # CommonPrefixes lists keys that act like subdirectories in the directory specified by Prefix . For
        # example, if the prefix is notes/ and the delimiter is a slash ( / ) as in notes/summer/july , the
        # common prefix is notes/summer/ . All of the keys that roll up into a common prefix count as a single
        # return when calculating the number of returns. Directory buckets - For directory buckets, only
        # prefixes that end in a delimiter ( / ) are supported. Directory buckets - When you query
        # ListObjectsV2 with a delimiter during in-progress multipart uploads, the CommonPrefixes response
        # parameter contains the prefixes that are associated with the in-progress multipart uploads. For more
        # information about multipart uploads, see Multipart Upload Overview in the Amazon S3 User Guide .

        @[JSON::Field(key: "CommonPrefixes")]
        getter common_prefixes : Array(Types::CommonPrefix)?

        # Metadata about each object returned.

        @[JSON::Field(key: "Contents")]
        getter contents : Array(Types::Object)?

        # If ContinuationToken was sent with the request, it is included in the response. You can use the
        # returned ContinuationToken for pagination of the list response.

        @[JSON::Field(key: "ContinuationToken")]
        getter continuation_token : String?

        # Causes keys that contain the same string between the prefix and the first occurrence of the
        # delimiter to be rolled up into a single result element in the CommonPrefixes collection. These
        # rolled-up keys are not returned elsewhere in the response. Each rolled-up result counts as only one
        # return against the MaxKeys value. Directory buckets - For directory buckets, / is the only supported
        # delimiter.

        @[JSON::Field(key: "Delimiter")]
        getter delimiter : String?

        # Encoding type used by Amazon S3 to encode object key names in the XML response. If you specify the
        # encoding-type request parameter, Amazon S3 includes this element in the response, and returns
        # encoded key name values in the following response elements: Delimiter, Prefix, Key, and StartAfter .

        @[JSON::Field(key: "EncodingType")]
        getter encoding_type : String?

        # Set to false if all of the results were returned. Set to true if more keys are available to return.
        # If the number of results exceeds that specified by MaxKeys , all of the results might not be
        # returned.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # KeyCount is the number of keys returned with this request. KeyCount will always be less than or
        # equal to the MaxKeys field. For example, if you ask for 50 keys, your result will include 50 keys or
        # fewer.

        @[JSON::Field(key: "KeyCount")]
        getter key_count : Int32?

        # Sets the maximum number of keys returned in the response. By default, the action returns up to 1,000
        # key names. The response might contain fewer keys but will never contain more.

        @[JSON::Field(key: "MaxKeys")]
        getter max_keys : Int32?

        # The bucket name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # NextContinuationToken is sent when isTruncated is true, which means there are more keys in the
        # bucket that can be listed. The next list requests to Amazon S3 can be continued with this
        # NextContinuationToken . NextContinuationToken is obfuscated and is not a real key

        @[JSON::Field(key: "NextContinuationToken")]
        getter next_continuation_token : String?

        # Keys that begin with the indicated prefix. Directory buckets - For directory buckets, only prefixes
        # that end in a delimiter ( / ) are supported.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # If StartAfter was sent with the request, it is included in the response. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "StartAfter")]
        getter start_after : String?

        def initialize(
          @common_prefixes : Array(Types::CommonPrefix)? = nil,
          @contents : Array(Types::Object)? = nil,
          @continuation_token : String? = nil,
          @delimiter : String? = nil,
          @encoding_type : String? = nil,
          @is_truncated : Bool? = nil,
          @key_count : Int32? = nil,
          @max_keys : Int32? = nil,
          @name : String? = nil,
          @next_continuation_token : String? = nil,
          @prefix : String? = nil,
          @request_charged : String? = nil,
          @start_after : String? = nil
        )
        end
      end


      struct ListObjectsV2Request
        include JSON::Serializable

        # Directory buckets - When you use this operation with a directory bucket, you must use
        # virtual-hosted-style requests in the format Bucket-name .s3express- zone-id . region-code
        # .amazonaws.com . Path-style requests are not supported. Directory bucket names must be unique in the
        # chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format bucket-base-name
        # -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about
        # bucket naming restrictions, see Directory bucket naming rules in the Amazon S3 User Guide . Access
        # points - When you use this action with an access point for general purpose buckets, you must provide
        # the alias of the access point in place of the bucket name or specify the access point ARN. When you
        # use this action with an access point for directory buckets, you must provide the access point name
        # in place of the bucket name. When using the access point ARN, you must direct requests to the access
        # point hostname. The access point hostname takes the form AccessPointName - AccountId
        # .s3-accesspoint. Region .amazonaws.com. When using this action with an access point through the
        # Amazon Web Services SDKs, you provide the access point ARN in place of the bucket name. For more
        # information about access point ARNs, see Using access points in the Amazon S3 User Guide . Object
        # Lambda access points are not supported by directory buckets. S3 on Outposts - When you use this
        # action with S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on
        # Outposts hostname takes the form AccessPointName - AccountId . outpostID .s3-outposts. Region
        # .amazonaws.com . When you use this action with S3 on Outposts, the destination bucket must be the
        # Outposts access point ARN or the access point alias. For more information about S3 on Outposts, see
        # What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # ContinuationToken indicates to Amazon S3 that the list is being continued on this bucket with a
        # token. ContinuationToken is obfuscated and is not a real key. You can use this ContinuationToken for
        # pagination of the list results.

        @[JSON::Field(key: "continuation-token")]
        getter continuation_token : String?

        # A delimiter is a character that you use to group keys. CommonPrefixes is filtered out from results
        # if it is not lexicographically greater than the StartAfter value. Directory buckets - For directory
        # buckets, / is the only supported delimiter. Directory buckets - When you query ListObjectsV2 with a
        # delimiter during in-progress multipart uploads, the CommonPrefixes response parameter contains the
        # prefixes that are associated with the in-progress multipart uploads. For more information about
        # multipart uploads, see Multipart Upload Overview in the Amazon S3 User Guide .

        @[JSON::Field(key: "delimiter")]
        getter delimiter : String?

        # Encoding type used by Amazon S3 to encode the object keys in the response. Responses are encoded
        # only in UTF-8. An object key can contain any Unicode character. However, the XML 1.0 parser can't
        # parse certain characters, such as characters with an ASCII value from 0 to 10. For characters that
        # aren't supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in
        # the response. For more information about characters to avoid in object key names, see Object key
        # naming guidelines . When using the URL encoding type, non-ASCII characters that are used in an
        # object's key name will be percent-encoded according to UTF-8 code values. For example, the object
        # test_file(3).png will appear as test_file%283%29.png .

        @[JSON::Field(key: "encoding-type")]
        getter encoding_type : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # The owner field is not present in ListObjectsV2 by default. If you want to return the owner field
        # with each key in the result, then set the FetchOwner field to true . Directory buckets - For
        # directory buckets, the bucket owner is returned as the object owner for all objects.

        @[JSON::Field(key: "fetch-owner")]
        getter fetch_owner : Bool?

        # Sets the maximum number of keys returned in the response. By default, the action returns up to 1,000
        # key names. The response might contain fewer keys but will never contain more.

        @[JSON::Field(key: "max-keys")]
        getter max_keys : Int32?

        # Specifies the optional fields that you want returned in the response. Fields that you do not specify
        # are not returned. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-optional-object-attributes")]
        getter optional_object_attributes : Array(String)?

        # Limits the response to keys that begin with the specified prefix. Directory buckets - For directory
        # buckets, only prefixes that end in a delimiter ( / ) are supported.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # Confirms that the requester knows that she or he will be charged for the list objects request in V2
        # style. Bucket owners need not specify this parameter in their requests. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this
        # specified key. StartAfter can be any key in the bucket. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "start-after")]
        getter start_after : String?

        def initialize(
          @bucket : String,
          @continuation_token : String? = nil,
          @delimiter : String? = nil,
          @encoding_type : String? = nil,
          @expected_bucket_owner : String? = nil,
          @fetch_owner : Bool? = nil,
          @max_keys : Int32? = nil,
          @optional_object_attributes : Array(String)? = nil,
          @prefix : String? = nil,
          @request_payer : String? = nil,
          @start_after : String? = nil
        )
        end
      end


      struct ListPartsOutput
        include JSON::Serializable

        # If the bucket has a lifecycle rule configured with an action to abort incomplete multipart uploads
        # and the prefix in the lifecycle rule matches the object name in the request, then the response
        # includes this header indicating when the initiated multipart upload will become eligible for abort
        # operation. For more information, see Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle
        # Configuration . The response will also include the x-amz-abort-rule-id header that will provide the
        # ID of the lifecycle configuration rule that defines this action. This functionality is not supported
        # for directory buckets.

        @[JSON::Field(key: "x-amz-abort-date")]
        getter abort_date : Time?

        # This header is returned along with the x-amz-abort-date header. It identifies applicable lifecycle
        # configuration rule that defines the action to abort incomplete multipart uploads. This functionality
        # is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-abort-rule-id")]
        getter abort_rule_id : String?

        # The name of the bucket to which the multipart upload was initiated. Does not return the access point
        # ARN or access point alias if used.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The algorithm that was used to create a checksum of the object.

        @[JSON::Field(key: "ChecksumAlgorithm")]
        getter checksum_algorithm : String?

        # The checksum type, which determines how part-level checksums are combined to create an object-level
        # checksum for multipart objects. You can use this header response to verify that the checksum type
        # that is received is the same checksum type that was specified in CreateMultipartUpload request. For
        # more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumType")]
        getter checksum_type : String?

        # Container element that identifies who initiated the multipart upload. If the initiator is an Amazon
        # Web Services account, this element provides the same information as the Owner element. If the
        # initiator is an IAM User, this element provides the user ARN.

        @[JSON::Field(key: "Initiator")]
        getter initiator : Types::Initiator?

        # Indicates whether the returned list of parts is truncated. A true value indicates that the list was
        # truncated. A list can be truncated if the number of parts exceeds the limit returned in the MaxParts
        # element.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # Object key for which the multipart upload was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # Maximum number of parts that were allowed in the response.

        @[JSON::Field(key: "MaxParts")]
        getter max_parts : Int32?

        # When a list is truncated, this element specifies the last part in the list, as well as the value to
        # use for the part-number-marker request parameter in a subsequent request.

        @[JSON::Field(key: "NextPartNumberMarker")]
        getter next_part_number_marker : Int32?

        # Container element that identifies the object owner, after the object is created. If multipart upload
        # is initiated by an IAM user, this element provides the parent account ID. Directory buckets - The
        # bucket owner is returned as the object owner for all the parts.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::Owner?

        # Specifies the part after which listing should begin. Only parts with higher part numbers will be
        # listed.

        @[JSON::Field(key: "PartNumberMarker")]
        getter part_number_marker : Int32?

        # Container for elements related to a particular part. A response can contain zero or more Part
        # elements.

        @[JSON::Field(key: "Part")]
        getter parts : Array(Types::Part)?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # The class of storage used to store the uploaded object. Directory buckets - Directory buckets only
        # support EXPRESS_ONEZONE (the S3 Express One Zone storage class) in Availability Zones and ONEZONE_IA
        # (the S3 One Zone-Infrequent Access storage class) in Dedicated Local Zones.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        # Upload ID identifying the multipart upload whose parts are being listed.

        @[JSON::Field(key: "UploadId")]
        getter upload_id : String?

        def initialize(
          @abort_date : Time? = nil,
          @abort_rule_id : String? = nil,
          @bucket : String? = nil,
          @checksum_algorithm : String? = nil,
          @checksum_type : String? = nil,
          @initiator : Types::Initiator? = nil,
          @is_truncated : Bool? = nil,
          @key : String? = nil,
          @max_parts : Int32? = nil,
          @next_part_number_marker : Int32? = nil,
          @owner : Types::Owner? = nil,
          @part_number_marker : Int32? = nil,
          @parts : Array(Types::Part)? = nil,
          @request_charged : String? = nil,
          @storage_class : String? = nil,
          @upload_id : String? = nil
        )
        end
      end


      struct ListPartsRequest
        include JSON::Serializable

        # The name of the bucket to which the parts are being uploaded. Directory buckets - When you use this
        # operation with a directory bucket, you must use virtual-hosted-style requests in the format
        # Bucket-name .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not
        # supported. Directory bucket names must be unique in the chosen Zone (Availability Zone or Local
        # Zone). Bucket names must follow the format bucket-base-name -- zone-id --x-s3 (for example,
        # amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about bucket naming restrictions, see
        # Directory bucket naming rules in the Amazon S3 User Guide . Access points - When you use this action
        # with an access point for general purpose buckets, you must provide the alias of the access point in
        # place of the bucket name or specify the access point ARN. When you use this action with an access
        # point for directory buckets, you must provide the access point name in place of the bucket name.
        # When using the access point ARN, you must direct requests to the access point hostname. The access
        # point hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com.
        # When using this action with an access point through the Amazon Web Services SDKs, you provide the
        # access point ARN in place of the bucket name. For more information about access point ARNs, see
        # Using access points in the Amazon S3 User Guide . Object Lambda access points are not supported by
        # directory buckets. S3 on Outposts - When you use this action with S3 on Outposts, you must direct
        # requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form AccessPointName
        # - AccountId . outpostID .s3-outposts. Region .amazonaws.com . When you use this action with S3 on
        # Outposts, the destination bucket must be the Outposts access point ARN or the access point alias.
        # For more information about S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Object key for which the multipart upload was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Upload ID identifying the multipart upload whose parts are being listed.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Sets the maximum number of parts to return.

        @[JSON::Field(key: "max-parts")]
        getter max_parts : Int32?

        # Specifies the part after which listing should begin. Only parts with higher part numbers will be
        # listed.

        @[JSON::Field(key: "part-number-marker")]
        getter part_number_marker : Int32?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # The server-side encryption (SSE) algorithm used to encrypt the object. This parameter is needed only
        # when the object was created using a checksum algorithm. For more information, see Protecting data
        # using SSE-C keys in the Amazon S3 User Guide . This functionality is not supported for directory
        # buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # The server-side encryption (SSE) customer managed key. This parameter is needed only when the object
        # was created using a checksum algorithm. For more information, see Protecting data using SSE-C keys
        # in the Amazon S3 User Guide . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # The MD5 server-side encryption (SSE) customer managed key. This parameter is needed only when the
        # object was created using a checksum algorithm. For more information, see Protecting data using SSE-C
        # keys in the Amazon S3 User Guide . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        def initialize(
          @bucket : String,
          @key : String,
          @upload_id : String,
          @expected_bucket_owner : String? = nil,
          @max_parts : Int32? = nil,
          @part_number_marker : Int32? = nil,
          @request_payer : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil
        )
        end
      end

      # Specifies the location where the bucket will be created. For directory buckets, the location type is
      # Availability Zone or Local Zone. For more information about directory buckets, see Working with
      # directory buckets in the Amazon S3 User Guide . This functionality is only supported by directory
      # buckets.

      struct LocationInfo
        include JSON::Serializable

        # The name of the location where the bucket will be created. For directory buckets, the name of the
        # location is the Zone ID of the Availability Zone (AZ) or Local Zone (LZ) where the bucket will be
        # created. An example AZ ID value is usw2-az1 .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of location where the bucket will be created.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes where logs are stored and the prefix that Amazon S3 assigns to all log object keys for a
      # bucket. For more information, see PUT Bucket logging in the Amazon S3 API Reference .

      struct LoggingEnabled
        include JSON::Serializable

        # Specifies the bucket where you want Amazon S3 to store server access logs. You can have your logs
        # delivered to any bucket that you own, including the same bucket that is being logged. You can also
        # configure multiple buckets to deliver their logs to the same target bucket. In this case, you should
        # choose a different TargetPrefix for each source bucket so that the delivered log files can be
        # distinguished by key.

        @[JSON::Field(key: "TargetBucket")]
        getter target_bucket : String

        # A prefix for all log object keys. If you store log files from multiple Amazon S3 buckets in a single
        # bucket, you can use a prefix to distinguish which log files came from which bucket.

        @[JSON::Field(key: "TargetPrefix")]
        getter target_prefix : String

        # Container for granting information. Buckets that use the bucket owner enforced setting for Object
        # Ownership don't support target grants. For more information, see Permissions for server access log
        # delivery in the Amazon S3 User Guide .

        @[JSON::Field(key: "TargetGrants")]
        getter target_grants : Array(Types::TargetGrant)?

        # Amazon S3 key format for log objects.

        @[JSON::Field(key: "TargetObjectKeyFormat")]
        getter target_object_key_format : Types::TargetObjectKeyFormat?

        def initialize(
          @target_bucket : String,
          @target_prefix : String,
          @target_grants : Array(Types::TargetGrant)? = nil,
          @target_object_key_format : Types::TargetObjectKeyFormat? = nil
        )
        end
      end

      # The S3 Metadata configuration for a general purpose bucket.

      struct MetadataConfiguration
        include JSON::Serializable

        # The journal table configuration for a metadata configuration.

        @[JSON::Field(key: "JournalTableConfiguration")]
        getter journal_table_configuration : Types::JournalTableConfiguration

        # The inventory table configuration for a metadata configuration.

        @[JSON::Field(key: "InventoryTableConfiguration")]
        getter inventory_table_configuration : Types::InventoryTableConfiguration?

        def initialize(
          @journal_table_configuration : Types::JournalTableConfiguration,
          @inventory_table_configuration : Types::InventoryTableConfiguration? = nil
        )
        end
      end

      # The S3 Metadata configuration for a general purpose bucket.

      struct MetadataConfigurationResult
        include JSON::Serializable

        # The destination settings for a metadata configuration.

        @[JSON::Field(key: "DestinationResult")]
        getter destination_result : Types::DestinationResult

        # The inventory table configuration for a metadata configuration.

        @[JSON::Field(key: "InventoryTableConfigurationResult")]
        getter inventory_table_configuration_result : Types::InventoryTableConfigurationResult?

        # The journal table configuration for a metadata configuration.

        @[JSON::Field(key: "JournalTableConfigurationResult")]
        getter journal_table_configuration_result : Types::JournalTableConfigurationResult?

        def initialize(
          @destination_result : Types::DestinationResult,
          @inventory_table_configuration_result : Types::InventoryTableConfigurationResult? = nil,
          @journal_table_configuration_result : Types::JournalTableConfigurationResult? = nil
        )
        end
      end

      # A metadata key-value pair to store with an object.

      struct MetadataEntry
        include JSON::Serializable

        # Name of the object.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Value of the object.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The V1 S3 Metadata configuration for a general purpose bucket. If you created your S3 Metadata
      # configuration before July 15, 2025, we recommend that you delete and re-create your configuration by
      # using CreateBucketMetadataConfiguration so that you can expire journal table records and create a
      # live inventory table.

      struct MetadataTableConfiguration
        include JSON::Serializable

        # The destination information for the metadata table configuration. The destination table bucket must
        # be in the same Region and Amazon Web Services account as the general purpose bucket. The specified
        # metadata table name must be unique within the aws_s3_metadata namespace in the destination table
        # bucket.

        @[JSON::Field(key: "S3TablesDestination")]
        getter s3_tables_destination : Types::S3TablesDestination

        def initialize(
          @s3_tables_destination : Types::S3TablesDestination
        )
        end
      end

      # The V1 S3 Metadata configuration for a general purpose bucket. The destination table bucket must be
      # in the same Region and Amazon Web Services account as the general purpose bucket. The specified
      # metadata table name must be unique within the aws_s3_metadata namespace in the destination table
      # bucket. If you created your S3 Metadata configuration before July 15, 2025, we recommend that you
      # delete and re-create your configuration by using CreateBucketMetadataConfiguration so that you can
      # expire journal table records and create a live inventory table.

      struct MetadataTableConfigurationResult
        include JSON::Serializable

        # The destination information for the metadata table configuration. The destination table bucket must
        # be in the same Region and Amazon Web Services account as the general purpose bucket. The specified
        # metadata table name must be unique within the aws_s3_metadata namespace in the destination table
        # bucket.

        @[JSON::Field(key: "S3TablesDestinationResult")]
        getter s3_tables_destination_result : Types::S3TablesDestinationResult

        def initialize(
          @s3_tables_destination_result : Types::S3TablesDestinationResult
        )
        end
      end

      # The encryption settings for an S3 Metadata journal table or inventory table configuration.

      struct MetadataTableEncryptionConfiguration
        include JSON::Serializable

        # The encryption type specified for a metadata table. To specify server-side encryption with Key
        # Management Service (KMS) keys (SSE-KMS), use the aws:kms value. To specify server-side encryption
        # with Amazon S3 managed keys (SSE-S3), use the AES256 value.

        @[JSON::Field(key: "SseAlgorithm")]
        getter sse_algorithm : String

        # If server-side encryption with Key Management Service (KMS) keys (SSE-KMS) is specified, you must
        # also specify the KMS key Amazon Resource Name (ARN). You must specify a customer-managed KMS key
        # that's located in the same Region as the general purpose bucket that corresponds to the metadata
        # table configuration.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @sse_algorithm : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # A container specifying replication metrics-related settings enabling replication metrics and events.

      struct Metrics
        include JSON::Serializable

        # Specifies whether the replication metrics are enabled.

        @[JSON::Field(key: "Status")]
        getter status : String

        # A container specifying the time threshold for emitting the s3:Replication:OperationMissedThreshold
        # event.

        @[JSON::Field(key: "EventThreshold")]
        getter event_threshold : Types::ReplicationTimeValue?

        def initialize(
          @status : String,
          @event_threshold : Types::ReplicationTimeValue? = nil
        )
        end
      end

      # A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The
      # operator must have at least two predicates, and an object must match all of the predicates in order
      # for the filter to apply.

      struct MetricsAndOperator
        include JSON::Serializable

        # The access point ARN used when evaluating an AND predicate.

        @[JSON::Field(key: "AccessPointArn")]
        getter access_point_arn : String?

        # The prefix used when evaluating an AND predicate.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The list of tags used when evaluating an AND predicate.

        @[JSON::Field(key: "Tag")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @access_point_arn : String? = nil,
          @prefix : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Specifies a metrics configuration for the CloudWatch request metrics (specified by the metrics
      # configuration ID) from an Amazon S3 bucket. If you're updating an existing metrics configuration,
      # note that this is a full replacement of the existing metrics configuration. If you don't include the
      # elements you want to keep, they are erased. For more information, see PutBucketMetricsConfiguration
      # .

      struct MetricsConfiguration
        include JSON::Serializable

        # The ID used to identify the metrics configuration. The ID has a 64 character limit and can only
        # contain letters, numbers, periods, dashes, and underscores.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Specifies a metrics configuration filter. The metrics configuration will only include objects that
        # meet the filter's criteria. A filter must be a prefix, an object tag, an access point ARN, or a
        # conjunction (MetricsAndOperator).

        @[JSON::Field(key: "Filter")]
        getter filter : Types::MetricsFilter?

        def initialize(
          @id : String,
          @filter : Types::MetricsFilter? = nil
        )
        end
      end

      # Specifies a metrics configuration filter. The metrics configuration only includes objects that meet
      # the filter's criteria. A filter must be a prefix, an object tag, an access point ARN, or a
      # conjunction (MetricsAndOperator). For more information, see PutBucketMetricsConfiguration .

      struct MetricsFilter
        include JSON::Serializable

        # The access point ARN used when evaluating a metrics filter.

        @[JSON::Field(key: "AccessPointArn")]
        getter access_point_arn : String?

        # A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The
        # operator must have at least two predicates, and an object must match all of the predicates in order
        # for the filter to apply.

        @[JSON::Field(key: "And")]
        getter and : Types::MetricsAndOperator?

        # The prefix used when evaluating a metrics filter.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The tag used when evaluating a metrics filter.

        @[JSON::Field(key: "Tag")]
        getter tag : Types::Tag?

        def initialize(
          @access_point_arn : String? = nil,
          @and : Types::MetricsAndOperator? = nil,
          @prefix : String? = nil,
          @tag : Types::Tag? = nil
        )
        end
      end

      # Container for the MultipartUpload for the Amazon S3 object.

      struct MultipartUpload
        include JSON::Serializable

        # The algorithm that was used to create a checksum of the object.

        @[JSON::Field(key: "ChecksumAlgorithm")]
        getter checksum_algorithm : String?

        # The checksum type that is used to calculate the object’s checksum value. For more information, see
        # Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumType")]
        getter checksum_type : String?

        # Date and time at which the multipart upload was initiated.

        @[JSON::Field(key: "Initiated")]
        getter initiated : Time?

        # Identifies who initiated the multipart upload.

        @[JSON::Field(key: "Initiator")]
        getter initiator : Types::Initiator?

        # Key of the object for which the multipart upload was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # Specifies the owner of the object that is part of the multipart upload. Directory buckets - The
        # bucket owner is returned as the object owner for all the objects.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::Owner?

        # The class of storage used to store the object. Directory buckets - Directory buckets only support
        # EXPRESS_ONEZONE (the S3 Express One Zone storage class) in Availability Zones and ONEZONE_IA (the S3
        # One Zone-Infrequent Access storage class) in Dedicated Local Zones.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        # Upload ID that identifies the multipart upload.

        @[JSON::Field(key: "UploadId")]
        getter upload_id : String?

        def initialize(
          @checksum_algorithm : String? = nil,
          @checksum_type : String? = nil,
          @initiated : Time? = nil,
          @initiator : Types::Initiator? = nil,
          @key : String? = nil,
          @owner : Types::Owner? = nil,
          @storage_class : String? = nil,
          @upload_id : String? = nil
        )
        end
      end

      # The specified bucket does not exist.

      struct NoSuchBucket
        include JSON::Serializable

        def initialize
        end
      end

      # The specified key does not exist.

      struct NoSuchKey
        include JSON::Serializable

        def initialize
        end
      end

      # The specified multipart upload does not exist.

      struct NoSuchUpload
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the
      # noncurrent object versions. You set this lifecycle configuration action on a bucket that has
      # versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a
      # specific period in the object's lifetime. This parameter applies to general purpose buckets only. It
      # is not supported for directory bucket lifecycle configurations.

      struct NoncurrentVersionExpiration
        include JSON::Serializable

        # Specifies how many noncurrent versions Amazon S3 will retain. You can specify up to 100 noncurrent
        # versions to retain. Amazon S3 will permanently delete any additional noncurrent versions beyond the
        # specified number to retain. For more information about noncurrent versions, see Lifecycle
        # configuration elements in the Amazon S3 User Guide . This parameter applies to general purpose
        # buckets only. It is not supported for directory bucket lifecycle configurations.

        @[JSON::Field(key: "NewerNoncurrentVersions")]
        getter newer_noncurrent_versions : Int32?

        # Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated
        # action. The value must be a non-zero positive integer. For information about the noncurrent days
        # calculations, see How Amazon S3 Calculates When an Object Became Noncurrent in the Amazon S3 User
        # Guide . This parameter applies to general purpose buckets only. It is not supported for directory
        # bucket lifecycle configurations.

        @[JSON::Field(key: "NoncurrentDays")]
        getter noncurrent_days : Int32?

        def initialize(
          @newer_noncurrent_versions : Int32? = nil,
          @noncurrent_days : Int32? = nil
        )
        end
      end

      # Container for the transition rule that describes when noncurrent objects transition to the
      # STANDARD_IA , ONEZONE_IA , INTELLIGENT_TIERING , GLACIER_IR , GLACIER , or DEEP_ARCHIVE storage
      # class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to
      # request that Amazon S3 transition noncurrent object versions to the STANDARD_IA , ONEZONE_IA ,
      # INTELLIGENT_TIERING , GLACIER_IR , GLACIER , or DEEP_ARCHIVE storage class at a specific period in
      # the object's lifetime.

      struct NoncurrentVersionTransition
        include JSON::Serializable

        # Specifies how many noncurrent versions Amazon S3 will retain in the same storage class before
        # transitioning objects. You can specify up to 100 noncurrent versions to retain. Amazon S3 will
        # transition any additional noncurrent versions beyond the specified number to retain. For more
        # information about noncurrent versions, see Lifecycle configuration elements in the Amazon S3 User
        # Guide .

        @[JSON::Field(key: "NewerNoncurrentVersions")]
        getter newer_noncurrent_versions : Int32?

        # Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated
        # action. For information about the noncurrent days calculations, see How Amazon S3 Calculates How
        # Long an Object Has Been Noncurrent in the Amazon S3 User Guide .

        @[JSON::Field(key: "NoncurrentDays")]
        getter noncurrent_days : Int32?

        # The class of storage used to store the object.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @newer_noncurrent_versions : Int32? = nil,
          @noncurrent_days : Int32? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # A container for specifying the notification configuration of the bucket. If this element is empty,
      # notifications are turned off for the bucket.

      struct NotificationConfiguration
        include JSON::Serializable

        # Enables delivery of events to Amazon EventBridge.

        @[JSON::Field(key: "EventBridgeConfiguration")]
        getter event_bridge_configuration : Types::EventBridgeConfiguration?

        # Describes the Lambda functions to invoke and the events for which to invoke them.

        @[JSON::Field(key: "CloudFunctionConfiguration")]
        getter lambda_function_configurations : Array(Types::LambdaFunctionConfiguration)?

        # The Amazon Simple Queue Service queues to publish messages to and the events for which to publish
        # messages.

        @[JSON::Field(key: "QueueConfiguration")]
        getter queue_configurations : Array(Types::QueueConfiguration)?

        # The topic to which notifications are sent and the events for which notifications are generated.

        @[JSON::Field(key: "TopicConfiguration")]
        getter topic_configurations : Array(Types::TopicConfiguration)?

        def initialize(
          @event_bridge_configuration : Types::EventBridgeConfiguration? = nil,
          @lambda_function_configurations : Array(Types::LambdaFunctionConfiguration)? = nil,
          @queue_configurations : Array(Types::QueueConfiguration)? = nil,
          @topic_configurations : Array(Types::TopicConfiguration)? = nil
        )
        end
      end


      struct NotificationConfigurationDeprecated
        include JSON::Serializable

        # Container for specifying the Lambda notification configuration.

        @[JSON::Field(key: "CloudFunctionConfiguration")]
        getter cloud_function_configuration : Types::CloudFunctionConfiguration?

        # This data type is deprecated. This data type specifies the configuration for publishing messages to
        # an Amazon Simple Queue Service (Amazon SQS) queue when Amazon S3 detects specified events.

        @[JSON::Field(key: "QueueConfiguration")]
        getter queue_configuration : Types::QueueConfigurationDeprecated?

        # This data type is deprecated. A container for specifying the configuration for publication of
        # messages to an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3 detects
        # specified events.

        @[JSON::Field(key: "TopicConfiguration")]
        getter topic_configuration : Types::TopicConfigurationDeprecated?

        def initialize(
          @cloud_function_configuration : Types::CloudFunctionConfiguration? = nil,
          @queue_configuration : Types::QueueConfigurationDeprecated? = nil,
          @topic_configuration : Types::TopicConfigurationDeprecated? = nil
        )
        end
      end

      # Specifies object key name filtering rules. For information about key name filtering, see Configuring
      # event notifications using object key name filtering in the Amazon S3 User Guide .

      struct NotificationConfigurationFilter
        include JSON::Serializable


        @[JSON::Field(key: "S3Key")]
        getter key : Types::S3KeyFilter?

        def initialize(
          @key : Types::S3KeyFilter? = nil
        )
        end
      end

      # An object consists of data and its descriptive metadata.

      struct Object
        include JSON::Serializable

        # The algorithm that was used to create a checksum of the object.

        @[JSON::Field(key: "ChecksumAlgorithm")]
        getter checksum_algorithm : Array(String)?

        # The checksum type that is used to calculate the object’s checksum value. For more information, see
        # Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumType")]
        getter checksum_type : String?

        # The entity tag is a hash of the object. The ETag reflects changes only to the contents of an object,
        # not its metadata. The ETag may or may not be an MD5 digest of the object data. Whether or not it is
        # depends on how the object was created and how it is encrypted as described below: Objects created by
        # the PUT Object, POST Object, or Copy operation, or through the Amazon Web Services Management
        # Console, and are encrypted by SSE-S3 or plaintext, have ETags that are an MD5 digest of their object
        # data. Objects created by the PUT Object, POST Object, or Copy operation, or through the Amazon Web
        # Services Management Console, and are encrypted by SSE-C or SSE-KMS, have ETags that are not an MD5
        # digest of their object data. If an object is created by either the Multipart Upload or Part Copy
        # operation, the ETag is not an MD5 digest, regardless of the method of encryption. If an object is
        # larger than 16 MB, the Amazon Web Services Management Console will upload or copy that object as a
        # Multipart Upload, and therefore the ETag will not be an MD5 digest. Directory buckets - MD5 is not
        # supported by directory buckets.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The name that you assign to an object. You use the object key to retrieve the object.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # Creation date of the object.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The owner of the object Directory buckets - The bucket owner is returned as the object owner.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::Owner?

        # Specifies the restoration status of an object. Objects in certain storage classes must be restored
        # before they can be retrieved. For more information about these storage classes and how to work with
        # archived objects, see Working with archived objects in the Amazon S3 User Guide . This functionality
        # is not supported for directory buckets. Directory buckets only support EXPRESS_ONEZONE (the S3
        # Express One Zone storage class) in Availability Zones and ONEZONE_IA (the S3 One Zone-Infrequent
        # Access storage class) in Dedicated Local Zones.

        @[JSON::Field(key: "RestoreStatus")]
        getter restore_status : Types::RestoreStatus?

        # Size in bytes of the object

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        # The class of storage used to store the object. Directory buckets - Directory buckets only support
        # EXPRESS_ONEZONE (the S3 Express One Zone storage class) in Availability Zones and ONEZONE_IA (the S3
        # One Zone-Infrequent Access storage class) in Dedicated Local Zones.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @checksum_algorithm : Array(String)? = nil,
          @checksum_type : String? = nil,
          @e_tag : String? = nil,
          @key : String? = nil,
          @last_modified : Time? = nil,
          @owner : Types::Owner? = nil,
          @restore_status : Types::RestoreStatus? = nil,
          @size : Int64? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # This action is not allowed against this storage tier.

      struct ObjectAlreadyInActiveTierError
        include JSON::Serializable

        def initialize
        end
      end

      # Object Identifier is unique value to identify objects.

      struct ObjectIdentifier
        include JSON::Serializable

        # Key name of the object. Replacement must be made for object keys containing special characters (such
        # as carriage returns) when using XML requests. For more information, see XML related object key
        # constraints .

        @[JSON::Field(key: "Key")]
        getter key : String

        # An entity tag (ETag) is an identifier assigned by a web server to a specific version of a resource
        # found at a URL. This header field makes the request method conditional on ETags . Entity tags
        # (ETags) for S3 Express One Zone are random alphanumeric strings unique to the object.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # If present, the objects are deleted only if its modification times matches the provided Timestamp .
        # This functionality is only supported for directory buckets.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # If present, the objects are deleted only if its size matches the provided size in bytes. This
        # functionality is only supported for directory buckets.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        # Version ID for the specific version of the object to delete. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @key : String,
          @e_tag : String? = nil,
          @last_modified_time : Time? = nil,
          @size : Int64? = nil,
          @version_id : String? = nil
        )
        end
      end

      # The container element for Object Lock configuration parameters.

      struct ObjectLockConfiguration
        include JSON::Serializable

        # Indicates whether this bucket has an Object Lock configuration enabled. Enable ObjectLockEnabled
        # when you apply ObjectLockConfiguration to a bucket.

        @[JSON::Field(key: "ObjectLockEnabled")]
        getter object_lock_enabled : String?

        # Specifies the Object Lock rule for the specified object. Enable the this rule when you apply
        # ObjectLockConfiguration to a bucket. Bucket settings require both a mode and a period. The period
        # can be either Days or Years but you must select one. You cannot specify Days and Years at the same
        # time.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::ObjectLockRule?

        def initialize(
          @object_lock_enabled : String? = nil,
          @rule : Types::ObjectLockRule? = nil
        )
        end
      end

      # A legal hold configuration for an object.

      struct ObjectLockLegalHold
        include JSON::Serializable

        # Indicates whether the specified object has a legal hold in place.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # A Retention configuration for an object.

      struct ObjectLockRetention
        include JSON::Serializable

        # Indicates the Retention mode for the specified object.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The date on which this Object Lock Retention will expire.

        @[JSON::Field(key: "RetainUntilDate")]
        getter retain_until_date : Time?

        def initialize(
          @mode : String? = nil,
          @retain_until_date : Time? = nil
        )
        end
      end

      # The container element for an Object Lock rule.

      struct ObjectLockRule
        include JSON::Serializable

        # The default Object Lock retention mode and period that you want to apply to new objects placed in
        # the specified bucket. Bucket settings require both a mode and a period. The period can be either
        # Days or Years but you must select one. You cannot specify Days and Years at the same time.

        @[JSON::Field(key: "DefaultRetention")]
        getter default_retention : Types::DefaultRetention?

        def initialize(
          @default_retention : Types::DefaultRetention? = nil
        )
        end
      end

      # The source object of the COPY action is not in the active tier and is only stored in Amazon S3
      # Glacier.

      struct ObjectNotInActiveTierError
        include JSON::Serializable

        def initialize
        end
      end

      # A container for elements related to an individual part.

      struct ObjectPart
        include JSON::Serializable

        # The Base64 encoded, 32-bit CRC32 checksum of the part. This checksum is present if the multipart
        # upload request was created with the CRC32 checksum algorithm. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the part. This checksum is present if the multipart
        # upload request was created with the CRC32C checksum algorithm. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC32C")]
        getter checksum_crc32_c : String?

        # The Base64 encoded, 64-bit CRC64NVME checksum of the part. This checksum is present if the multipart
        # upload request was created with the CRC64NVME checksum algorithm, or if the object was uploaded
        # without a checksum (and Amazon S3 added the default checksum, CRC64NVME , to the uploaded object).
        # For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC64NVME")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 checksum of the part. This checksum is present if the multipart
        # upload request was created with the SHA1 checksum algorithm. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumSHA1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 checksum of the part. This checksum is present if the multipart
        # upload request was created with the SHA256 checksum algorithm. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumSHA256")]
        getter checksum_sha256 : String?

        # The part number identifying the part. This value is a positive integer between 1 and 10,000.

        @[JSON::Field(key: "PartNumber")]
        getter part_number : Int32?

        # The size of the uploaded part in bytes.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        def initialize(
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @part_number : Int32? = nil,
          @size : Int64? = nil
        )
        end
      end

      # The version of an object.

      struct ObjectVersion
        include JSON::Serializable

        # The algorithm that was used to create a checksum of the object.

        @[JSON::Field(key: "ChecksumAlgorithm")]
        getter checksum_algorithm : Array(String)?

        # The checksum type that is used to calculate the object’s checksum value. For more information, see
        # Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumType")]
        getter checksum_type : String?

        # The entity tag is an MD5 hash of that version of the object.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Specifies whether the object is (true) or is not (false) the latest version of an object.

        @[JSON::Field(key: "IsLatest")]
        getter is_latest : Bool?

        # The object key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # Date and time when the object was last modified.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # Specifies the owner of the object.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::Owner?

        # Specifies the restoration status of an object. Objects in certain storage classes must be restored
        # before they can be retrieved. For more information about these storage classes and how to work with
        # archived objects, see Working with archived objects in the Amazon S3 User Guide .

        @[JSON::Field(key: "RestoreStatus")]
        getter restore_status : Types::RestoreStatus?

        # Size in bytes of the object.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        # The class of storage used to store the object.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        # Version ID of an object.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @checksum_algorithm : Array(String)? = nil,
          @checksum_type : String? = nil,
          @e_tag : String? = nil,
          @is_latest : Bool? = nil,
          @key : String? = nil,
          @last_modified : Time? = nil,
          @owner : Types::Owner? = nil,
          @restore_status : Types::RestoreStatus? = nil,
          @size : Int64? = nil,
          @storage_class : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Describes the location where the restore job's output is stored.

      struct OutputLocation
        include JSON::Serializable

        # Describes an S3 location that will receive the results of the restore request.

        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3Location?

        def initialize(
          @s3 : Types::S3Location? = nil
        )
        end
      end

      # Describes how results of the Select job are serialized.

      struct OutputSerialization
        include JSON::Serializable

        # Describes the serialization of CSV-encoded Select results.

        @[JSON::Field(key: "CSV")]
        getter csv : Types::CSVOutput?

        # Specifies JSON as request's output serialization format.

        @[JSON::Field(key: "JSON")]
        getter json : Types::JSONOutput?

        def initialize(
          @csv : Types::CSVOutput? = nil,
          @json : Types::JSONOutput? = nil
        )
        end
      end

      # Container for the owner's display name and ID.

      struct Owner
        include JSON::Serializable


        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Container for the ID of the owner.

        @[JSON::Field(key: "ID")]
        getter id : String?

        def initialize(
          @display_name : String? = nil,
          @id : String? = nil
        )
        end
      end

      # The container element for a bucket's ownership controls.

      struct OwnershipControls
        include JSON::Serializable

        # The container element for an ownership control rule.

        @[JSON::Field(key: "Rule")]
        getter rules : Array(Types::OwnershipControlsRule)

        def initialize(
          @rules : Array(Types::OwnershipControlsRule)
        )
        end
      end

      # The container element for an ownership control rule.

      struct OwnershipControlsRule
        include JSON::Serializable


        @[JSON::Field(key: "ObjectOwnership")]
        getter object_ownership : String

        def initialize(
          @object_ownership : String
        )
        end
      end

      # Container for Parquet.

      struct ParquetInput
        include JSON::Serializable

        def initialize
        end
      end

      # Container for elements related to a part.

      struct Part
        include JSON::Serializable

        # The Base64 encoded, 32-bit CRC32 checksum of the part. This checksum is present if the object was
        # uploaded with the CRC32 checksum algorithm. For more information, see Checking object integrity in
        # the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the part. This checksum is present if the object was
        # uploaded with the CRC32C checksum algorithm. For more information, see Checking object integrity in
        # the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC32C")]
        getter checksum_crc32_c : String?

        # The Base64 encoded, 64-bit CRC64NVME checksum of the part. This checksum is present if the multipart
        # upload request was created with the CRC64NVME checksum algorithm, or if the object was uploaded
        # without a checksum (and Amazon S3 added the default checksum, CRC64NVME , to the uploaded object).
        # For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumCRC64NVME")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 checksum of the part. This checksum is present if the object was
        # uploaded with the SHA1 checksum algorithm. For more information, see Checking object integrity in
        # the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumSHA1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 checksum of the part. This checksum is present if the object was
        # uploaded with the SHA256 checksum algorithm. For more information, see Checking object integrity in
        # the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumSHA256")]
        getter checksum_sha256 : String?

        # Entity tag returned when the part was uploaded.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Date and time at which the part was uploaded.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # Part number identifying the part. This is a positive integer between 1 and 10,000.

        @[JSON::Field(key: "PartNumber")]
        getter part_number : Int32?

        # Size in bytes of the uploaded part data.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        def initialize(
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @e_tag : String? = nil,
          @last_modified : Time? = nil,
          @part_number : Int32? = nil,
          @size : Int64? = nil
        )
        end
      end

      # Amazon S3 keys for log objects are partitioned in the following format:
      # [DestinationPrefix][SourceAccountId]/[SourceRegion]/[SourceBucket]/[YYYY]/[MM]/[DD]/[YYYY]-[MM]-[DD]-[hh]-[mm]-[ss]-[UniqueString]
      # PartitionedPrefix defaults to EventTime delivery when server access logs are delivered.

      struct PartitionedPrefix
        include JSON::Serializable

        # Specifies the partition date source for the partitioned prefix. PartitionDateSource can be EventTime
        # or DeliveryTime . For DeliveryTime , the time in the log file names corresponds to the delivery time
        # for the log files. For EventTime , The logs delivered are for a specific day only. The year, month,
        # and day correspond to the day on which the event occurred, and the hour, minutes and seconds are set
        # to 00 in the key.

        @[JSON::Field(key: "PartitionDateSource")]
        getter partition_date_source : String?

        def initialize(
          @partition_date_source : String? = nil
        )
        end
      end

      # The container element for a bucket's policy status.

      struct PolicyStatus
        include JSON::Serializable

        # The policy status for this bucket. TRUE indicates that this bucket is public. FALSE indicates that
        # the bucket is not public.

        @[JSON::Field(key: "IsPublic")]
        getter is_public : Bool?

        def initialize(
          @is_public : Bool? = nil
        )
        end
      end

      # This data type contains information about progress of an operation.

      struct Progress
        include JSON::Serializable

        # The current number of uncompressed object bytes processed.

        @[JSON::Field(key: "BytesProcessed")]
        getter bytes_processed : Int64?

        # The current number of bytes of records payload data returned.

        @[JSON::Field(key: "BytesReturned")]
        getter bytes_returned : Int64?

        # The current number of object bytes scanned.

        @[JSON::Field(key: "BytesScanned")]
        getter bytes_scanned : Int64?

        def initialize(
          @bytes_processed : Int64? = nil,
          @bytes_returned : Int64? = nil,
          @bytes_scanned : Int64? = nil
        )
        end
      end

      # This data type contains information about the progress event of an operation.

      struct ProgressEvent
        include JSON::Serializable

        # The Progress event details.

        @[JSON::Field(key: "Details")]
        getter details : Types::Progress?

        def initialize(
          @details : Types::Progress? = nil
        )
        end
      end

      # The PublicAccessBlock configuration that you want to apply to this Amazon S3 bucket. You can enable
      # the configuration options in any combination. Bucket-level settings work alongside account-level
      # settings (which may inherit from organization-level policies). For more information about when
      # Amazon S3 considers a bucket or object public, see The Meaning of "Public" in the Amazon S3 User
      # Guide .

      struct PublicAccessBlockConfiguration
        include JSON::Serializable

        # Specifies whether Amazon S3 should block public access control lists (ACLs) for this bucket and
        # objects in this bucket. Setting this element to TRUE causes the following behavior: PUT Bucket ACL
        # and PUT Object ACL calls fail if the specified ACL is public. PUT Object calls fail if the request
        # includes a public ACL. PUT Bucket calls fail if the request includes a public ACL. Enabling this
        # setting doesn't affect existing policies or ACLs.

        @[JSON::Field(key: "BlockPublicAcls")]
        getter block_public_acls : Bool?

        # Specifies whether Amazon S3 should block public bucket policies for this bucket. Setting this
        # element to TRUE causes Amazon S3 to reject calls to PUT Bucket policy if the specified bucket policy
        # allows public access. Enabling this setting doesn't affect existing bucket policies.

        @[JSON::Field(key: "BlockPublicPolicy")]
        getter block_public_policy : Bool?

        # Specifies whether Amazon S3 should ignore public ACLs for this bucket and objects in this bucket.
        # Setting this element to TRUE causes Amazon S3 to ignore all public ACLs on this bucket and objects
        # in this bucket. Enabling this setting doesn't affect the persistence of any existing ACLs and
        # doesn't prevent new public ACLs from being set.

        @[JSON::Field(key: "IgnorePublicAcls")]
        getter ignore_public_acls : Bool?

        # Specifies whether Amazon S3 should restrict public bucket policies for this bucket. Setting this
        # element to TRUE restricts access to this bucket to only Amazon Web Services service principals and
        # authorized users within this account if the bucket has a public policy. Enabling this setting
        # doesn't affect previously stored bucket policies, except that public and cross-account access within
        # any public bucket policy, including non-public delegation to specific accounts, is blocked.

        @[JSON::Field(key: "RestrictPublicBuckets")]
        getter restrict_public_buckets : Bool?

        def initialize(
          @block_public_acls : Bool? = nil,
          @block_public_policy : Bool? = nil,
          @ignore_public_acls : Bool? = nil,
          @restrict_public_buckets : Bool? = nil
        )
        end
      end


      struct PutBucketAbacRequest
        include JSON::Serializable

        # The ABAC status of the general purpose bucket. When ABAC is enabled for the general purpose bucket,
        # you can use tags to manage access to the general purpose buckets as well as for cost tracking
        # purposes. When ABAC is disabled for the general purpose buckets, you can only use tags for cost
        # tracking purposes. For more information, see Using tags with S3 general purpose buckets .

        @[JSON::Field(key: "AbacStatus")]
        getter abac_status : Types::AbacStatus

        # The name of the general purpose bucket.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Indicates the algorithm that you want Amazon S3 to use to create the checksum. For more information,
        # see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The MD5 hash of the PutBucketAbac request body. For requests made using the Amazon Web Services
        # Command Line Interface (CLI) or Amazon Web Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The Amazon Web Services account ID of the general purpose bucket's owner.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @abac_status : Types::AbacStatus,
          @bucket : String,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketAccelerateConfigurationRequest
        include JSON::Serializable

        # Container for setting the transfer acceleration state.

        @[JSON::Field(key: "AccelerateConfiguration")]
        getter accelerate_configuration : Types::AccelerateConfiguration

        # The name of the bucket for which the accelerate configuration is set.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @accelerate_configuration : Types::AccelerateConfiguration,
          @bucket : String,
          @checksum_algorithm : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketAclRequest
        include JSON::Serializable

        # The bucket to which to apply the ACL.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The canned ACL to apply to the bucket.

        @[JSON::Field(key: "x-amz-acl")]
        getter acl : String?

        # Contains the elements that set the ACL permissions for an object per grantee.

        @[JSON::Field(key: "AccessControlPolicy")]
        getter access_control_policy : Types::AccessControlPolicy?

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Base64 encoded 128-bit MD5 digest of the data. This header must be used as a message integrity
        # check to verify that the request body was not corrupted in transit. For more information, go to RFC
        # 1864. For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
        # Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.

        @[JSON::Field(key: "x-amz-grant-full-control")]
        getter grant_full_control : String?

        # Allows grantee to list the objects in the bucket.

        @[JSON::Field(key: "x-amz-grant-read")]
        getter grant_read : String?

        # Allows grantee to read the bucket ACL.

        @[JSON::Field(key: "x-amz-grant-read-acp")]
        getter grant_read_acp : String?

        # Allows grantee to create new objects in the bucket. For the bucket and object owners of existing
        # objects, also allows deletions and overwrites of those objects.

        @[JSON::Field(key: "x-amz-grant-write")]
        getter grant_write : String?

        # Allows grantee to write the ACL for the applicable bucket.

        @[JSON::Field(key: "x-amz-grant-write-acp")]
        getter grant_write_acp : String?

        def initialize(
          @bucket : String,
          @acl : String? = nil,
          @access_control_policy : Types::AccessControlPolicy? = nil,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @grant_full_control : String? = nil,
          @grant_read : String? = nil,
          @grant_read_acp : String? = nil,
          @grant_write : String? = nil,
          @grant_write_acp : String? = nil
        )
        end
      end


      struct PutBucketAnalyticsConfigurationRequest
        include JSON::Serializable

        # The configuration and any analyses for the analytics filter.

        @[JSON::Field(key: "AnalyticsConfiguration")]
        getter analytics_configuration : Types::AnalyticsConfiguration

        # The name of the bucket to which an analytics configuration is stored.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID that identifies the analytics configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @analytics_configuration : Types::AnalyticsConfiguration,
          @bucket : String,
          @id : String,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketCorsRequest
        include JSON::Serializable

        # Specifies the bucket impacted by the cors configuration.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Describes the cross-origin access configuration for objects in an Amazon S3 bucket. For more
        # information, see Enabling Cross-Origin Resource Sharing in the Amazon S3 User Guide .

        @[JSON::Field(key: "CORSConfiguration")]
        getter cors_configuration : Types::CORSConfiguration

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Base64 encoded 128-bit MD5 digest of the data. This header must be used as a message integrity
        # check to verify that the request body was not corrupted in transit. For more information, go to RFC
        # 1864. For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
        # Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @cors_configuration : Types::CORSConfiguration,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketEncryptionRequest
        include JSON::Serializable

        # Specifies default encryption for a bucket using server-side encryption with different key options.
        # Directory buckets - When you use this operation with a directory bucket, you must use path-style
        # requests in the format https://s3express-control. region-code .amazonaws.com/ bucket-name .
        # Virtual-hosted-style requests aren't supported. Directory bucket names must be unique in the chosen
        # Zone (Availability Zone or Local Zone). Bucket names must also follow the format bucket-base-name --
        # zone-id --x-s3 (for example, DOC-EXAMPLE-BUCKET -- usw2-az1 --x-s3 ). For information about bucket
        # naming restrictions, see Directory bucket naming rules in the Amazon S3 User Guide

        @[JSON::Field(key: "Bucket")]
        getter bucket : String


        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter. For directory buckets, when you use Amazon Web
        # Services SDKs, CRC32 is the default checksum algorithm that's used for performance.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Base64 encoded 128-bit MD5 digest of the server-side encryption configuration. For requests made
        # using the Amazon Web Services Command Line Interface (CLI) or Amazon Web Services SDKs, this field
        # is calculated automatically. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). For directory buckets, this header is not supported in this API operation. If you specify
        # this header, the request fails with the HTTP status code 501 Not Implemented .

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketIntelligentTieringConfigurationRequest
        include JSON::Serializable

        # The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID used to identify the S3 Intelligent-Tiering configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        # Container for S3 Intelligent-Tiering configuration.

        @[JSON::Field(key: "IntelligentTieringConfiguration")]
        getter intelligent_tiering_configuration : Types::IntelligentTieringConfiguration

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @intelligent_tiering_configuration : Types::IntelligentTieringConfiguration,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketInventoryConfigurationRequest
        include JSON::Serializable

        # The name of the bucket where the inventory configuration will be stored.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID used to identify the inventory configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        # Specifies the inventory configuration.

        @[JSON::Field(key: "InventoryConfiguration")]
        getter inventory_configuration : Types::InventoryConfiguration

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @inventory_configuration : Types::InventoryConfiguration,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketLifecycleConfigurationOutput
        include JSON::Serializable

        # Indicates which default minimum object size behavior is applied to the lifecycle configuration. This
        # parameter applies to general purpose buckets only. It is not supported for directory bucket
        # lifecycle configurations. all_storage_classes_128K - Objects smaller than 128 KB will not transition
        # to any storage class by default. varies_by_storage_class - Objects smaller than 128 KB will
        # transition to Glacier Flexible Retrieval or Glacier Deep Archive storage classes. By default, all
        # other storage classes will prevent transitions smaller than 128 KB. To customize the minimum object
        # size for any transition you can add a filter that specifies a custom ObjectSizeGreaterThan or
        # ObjectSizeLessThan in the body of your transition rule. Custom filters always take precedence over
        # the default transition behavior.

        @[JSON::Field(key: "x-amz-transition-default-minimum-object-size")]
        getter transition_default_minimum_object_size : String?

        def initialize(
          @transition_default_minimum_object_size : String? = nil
        )
        end
      end


      struct PutBucketLifecycleConfigurationRequest
        include JSON::Serializable

        # The name of the bucket for which to set the configuration.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). This parameter applies to general purpose buckets only. It is not supported for directory
        # bucket lifecycle configurations.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Container for lifecycle rules. You can add as many as 1,000 rules.

        @[JSON::Field(key: "LifecycleConfiguration")]
        getter lifecycle_configuration : Types::BucketLifecycleConfiguration?

        # Indicates which default minimum object size behavior is applied to the lifecycle configuration. This
        # parameter applies to general purpose buckets only. It is not supported for directory bucket
        # lifecycle configurations. all_storage_classes_128K - Objects smaller than 128 KB will not transition
        # to any storage class by default. varies_by_storage_class - Objects smaller than 128 KB will
        # transition to Glacier Flexible Retrieval or Glacier Deep Archive storage classes. By default, all
        # other storage classes will prevent transitions smaller than 128 KB. To customize the minimum object
        # size for any transition you can add a filter that specifies a custom ObjectSizeGreaterThan or
        # ObjectSizeLessThan in the body of your transition rule. Custom filters always take precedence over
        # the default transition behavior.

        @[JSON::Field(key: "x-amz-transition-default-minimum-object-size")]
        getter transition_default_minimum_object_size : String?

        def initialize(
          @bucket : String,
          @checksum_algorithm : String? = nil,
          @expected_bucket_owner : String? = nil,
          @lifecycle_configuration : Types::BucketLifecycleConfiguration? = nil,
          @transition_default_minimum_object_size : String? = nil
        )
        end
      end


      struct PutBucketLifecycleRequest
        include JSON::Serializable


        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web Services
        # SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "LifecycleConfiguration")]
        getter lifecycle_configuration : Types::LifecycleConfiguration?

        def initialize(
          @bucket : String,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @lifecycle_configuration : Types::LifecycleConfiguration? = nil
        )
        end
      end


      struct PutBucketLoggingRequest
        include JSON::Serializable

        # The name of the bucket for which to set the logging parameters.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Container for logging status information.

        @[JSON::Field(key: "BucketLoggingStatus")]
        getter bucket_logging_status : Types::BucketLoggingStatus

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The MD5 hash of the PutBucketLogging request body. For requests made using the Amazon Web Services
        # Command Line Interface (CLI) or Amazon Web Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @bucket_logging_status : Types::BucketLoggingStatus,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketMetricsConfigurationRequest
        include JSON::Serializable

        # The name of the bucket for which the metrics configuration is set.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The ID used to identify the metrics configuration. The ID has a 64 character limit and can only
        # contain letters, numbers, periods, dashes, and underscores.

        @[JSON::Field(key: "id")]
        getter id : String

        # Specifies the metrics configuration.

        @[JSON::Field(key: "MetricsConfiguration")]
        getter metrics_configuration : Types::MetricsConfiguration

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @id : String,
          @metrics_configuration : Types::MetricsConfiguration,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketNotificationConfigurationRequest
        include JSON::Serializable

        # The name of the bucket.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String


        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Skips validation of Amazon SQS, Amazon SNS, and Lambda destinations. True or false value.

        @[JSON::Field(key: "x-amz-skip-destination-validation")]
        getter skip_destination_validation : Bool?

        def initialize(
          @bucket : String,
          @notification_configuration : Types::NotificationConfiguration,
          @expected_bucket_owner : String? = nil,
          @skip_destination_validation : Bool? = nil
        )
        end
      end


      struct PutBucketNotificationRequest
        include JSON::Serializable

        # The name of the bucket.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The container for the configuration.

        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::NotificationConfigurationDeprecated

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The MD5 hash of the PutPublicAccessBlock request body. For requests made using the Amazon Web
        # Services Command Line Interface (CLI) or Amazon Web Services SDKs, this field is calculated
        # automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @notification_configuration : Types::NotificationConfigurationDeprecated,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketOwnershipControlsRequest
        include JSON::Serializable

        # The name of the Amazon S3 bucket whose OwnershipControls you want to set.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The OwnershipControls (BucketOwnerEnforced, BucketOwnerPreferred, or ObjectWriter) that you want to
        # apply to this Amazon S3 bucket.

        @[JSON::Field(key: "OwnershipControls")]
        getter ownership_controls : Types::OwnershipControls

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum- algorithm header sent. Otherwise, Amazon S3 fails the
        # request with the HTTP status code 400 Bad Request . For more information, see Checking object
        # integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3 ignores any
        # provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The MD5 hash of the OwnershipControls request body. For requests made using the Amazon Web Services
        # Command Line Interface (CLI) or Amazon Web Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @ownership_controls : Types::OwnershipControls,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketPolicyRequest
        include JSON::Serializable

        # The name of the bucket. Directory buckets - When you use this operation with a directory bucket, you
        # must use path-style requests in the format https://s3express-control. region-code .amazonaws.com/
        # bucket-name . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique
        # in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the format
        # bucket-base-name -- zone-id --x-s3 (for example, DOC-EXAMPLE-BUCKET -- usw2-az1 --x-s3 ). For
        # information about bucket naming restrictions, see Directory bucket naming rules in the Amazon S3
        # User Guide

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The bucket policy as a JSON document. For directory buckets, the only IAM action supported in the
        # bucket policy is s3express:CreateSession .

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum- algorithm or x-amz-trailer header sent.
        # Otherwise, Amazon S3 fails the request with the HTTP status code 400 Bad Request . For the
        # x-amz-checksum- algorithm header, replace algorithm with the supported algorithm from the following
        # list: CRC32 CRC32C CRC64NVME SHA1 SHA256 For more information, see Checking object integrity in the
        # Amazon S3 User Guide . If the individual checksum value you provide through x-amz-checksum-
        # algorithm doesn't match the checksum algorithm you set through x-amz-sdk-checksum-algorithm , Amazon
        # S3 fails the request with a BadDigest error. For directory buckets, when you use Amazon Web Services
        # SDKs, CRC32 is the default checksum algorithm that's used for performance.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # Set this parameter to true to confirm that you want to remove your permissions to change this bucket
        # policy in the future. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-confirm-remove-self-bucket-access")]
        getter confirm_remove_self_bucket_access : Bool?

        # The MD5 hash of the request body. For requests made using the Amazon Web Services Command Line
        # Interface (CLI) or Amazon Web Services SDKs, this field is calculated automatically. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied). For directory buckets, this header is not supported in this API operation. If you specify
        # this header, the request fails with the HTTP status code 501 Not Implemented .

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @policy : String,
          @checksum_algorithm : String? = nil,
          @confirm_remove_self_bucket_access : Bool? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketReplicationRequest
        include JSON::Serializable

        # The name of the bucket

        @[JSON::Field(key: "Bucket")]
        getter bucket : String


        @[JSON::Field(key: "ReplicationConfiguration")]
        getter replication_configuration : Types::ReplicationConfiguration

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Base64 encoded 128-bit MD5 digest of the data. You must use this header as a message integrity
        # check to verify that the request body was not corrupted in transit. For more information, see RFC
        # 1864 . For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
        # Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # A token to allow Object Lock to be enabled for an existing bucket.

        @[JSON::Field(key: "x-amz-bucket-object-lock-token")]
        getter token : String?

        def initialize(
          @bucket : String,
          @replication_configuration : Types::ReplicationConfiguration,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct PutBucketRequestPaymentRequest
        include JSON::Serializable

        # The bucket name.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Container for Payer.

        @[JSON::Field(key: "RequestPaymentConfiguration")]
        getter request_payment_configuration : Types::RequestPaymentConfiguration

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Base64 encoded 128-bit MD5 digest of the data. You must use this header as a message integrity
        # check to verify that the request body was not corrupted in transit. For more information, see RFC
        # 1864 . For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
        # Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @request_payment_configuration : Types::RequestPaymentConfiguration,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketTaggingRequest
        include JSON::Serializable

        # The bucket name.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Container for the TagSet and Tag elements.

        @[JSON::Field(key: "Tagging")]
        getter tagging : Types::Tagging

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Base64 encoded 128-bit MD5 digest of the data. You must use this header as a message integrity
        # check to verify that the request body was not corrupted in transit. For more information, see RFC
        # 1864 . For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
        # Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @tagging : Types::Tagging,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutBucketVersioningRequest
        include JSON::Serializable

        # The bucket name.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Container for setting the versioning state.

        @[JSON::Field(key: "VersioningConfiguration")]
        getter versioning_configuration : Types::VersioningConfiguration

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # &gt;The Base64 encoded 128-bit MD5 digest of the data. You must use this header as a message
        # integrity check to verify that the request body was not corrupted in transit. For more information,
        # see RFC 1864 . For requests made using the Amazon Web Services Command Line Interface (CLI) or
        # Amazon Web Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # The concatenation of the authentication device's serial number, a space, and the value that is
        # displayed on your authentication device. The serial number is the number that uniquely identifies
        # the MFA device. For physical MFA devices, this is the unique serial number that's provided with the
        # device. For virtual MFA devices, the serial number is the device ARN. For more information, see
        # Enabling versioning on buckets and Configuring MFA delete in the Amazon Simple Storage Service User
        # Guide .

        @[JSON::Field(key: "x-amz-mfa")]
        getter mfa : String?

        def initialize(
          @bucket : String,
          @versioning_configuration : Types::VersioningConfiguration,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @mfa : String? = nil
        )
        end
      end


      struct PutBucketWebsiteRequest
        include JSON::Serializable

        # The bucket name.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Container for the request.

        @[JSON::Field(key: "WebsiteConfiguration")]
        getter website_configuration : Types::WebsiteConfiguration

        # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
        # header will not provide any additional functionality if you don't use the SDK. When you send this
        # header, there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon
        # S3 fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Base64 encoded 128-bit MD5 digest of the data. You must use this header as a message integrity
        # check to verify that the request body was not corrupted in transit. For more information, see RFC
        # 1864 . For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
        # Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @website_configuration : Types::WebsiteConfiguration,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct PutObjectAclOutput
        include JSON::Serializable


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        def initialize(
          @request_charged : String? = nil
        )
        end
      end


      struct PutObjectAclRequest
        include JSON::Serializable

        # The bucket name that contains the object to which you want to attach the ACL. Access points - When
        # you use this action with an access point for general purpose buckets, you must provide the alias of
        # the access point in place of the bucket name or specify the access point ARN. When you use this
        # action with an access point for directory buckets, you must provide the access point name in place
        # of the bucket name. When using the access point ARN, you must direct requests to the access point
        # hostname. The access point hostname takes the form AccessPointName - AccountId .s3-accesspoint.
        # Region .amazonaws.com. When using this action with an access point through the Amazon Web Services
        # SDKs, you provide the access point ARN in place of the bucket name. For more information about
        # access point ARNs, see Using access points in the Amazon S3 User Guide . S3 on Outposts - When you
        # use this action with S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3
        # on Outposts hostname takes the form AccessPointName - AccountId . outpostID .s3-outposts. Region
        # .amazonaws.com . When you use this action with S3 on Outposts, the destination bucket must be the
        # Outposts access point ARN or the access point alias. For more information about S3 on Outposts, see
        # What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Key for which the PUT action was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The canned ACL to apply to the object. For more information, see Canned ACL .

        @[JSON::Field(key: "x-amz-acl")]
        getter acl : String?

        # Contains the elements that set the ACL permissions for an object per grantee.

        @[JSON::Field(key: "AccessControlPolicy")]
        getter access_control_policy : Types::AccessControlPolicy?

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon S3
        # fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Base64 encoded 128-bit MD5 digest of the data. This header must be used as a message integrity
        # check to verify that the request body was not corrupted in transit. For more information, go to RFC
        # 1864.&gt; For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
        # Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Allows grantee the read, write, read ACP, and write ACP permissions on the bucket. This
        # functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-full-control")]
        getter grant_full_control : String?

        # Allows grantee to list the objects in the bucket. This functionality is not supported for Amazon S3
        # on Outposts.

        @[JSON::Field(key: "x-amz-grant-read")]
        getter grant_read : String?

        # Allows grantee to read the bucket ACL. This functionality is not supported for Amazon S3 on
        # Outposts.

        @[JSON::Field(key: "x-amz-grant-read-acp")]
        getter grant_read_acp : String?

        # Allows grantee to create new objects in the bucket. For the bucket and object owners of existing
        # objects, also allows deletions and overwrites of those objects.

        @[JSON::Field(key: "x-amz-grant-write")]
        getter grant_write : String?

        # Allows grantee to write the ACL for the applicable bucket. This functionality is not supported for
        # Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-write-acp")]
        getter grant_write_acp : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Version ID used to reference a specific version of the object. This functionality is not supported
        # for directory buckets.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @acl : String? = nil,
          @access_control_policy : Types::AccessControlPolicy? = nil,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @grant_full_control : String? = nil,
          @grant_read : String? = nil,
          @grant_read_acp : String? = nil,
          @grant_write : String? = nil,
          @grant_write_acp : String? = nil,
          @request_payer : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct PutObjectLegalHoldOutput
        include JSON::Serializable


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        def initialize(
          @request_charged : String? = nil
        )
        end
      end


      struct PutObjectLegalHoldRequest
        include JSON::Serializable

        # The bucket name containing the object that you want to place a legal hold on. Access points - When
        # you use this action with an access point for general purpose buckets, you must provide the alias of
        # the access point in place of the bucket name or specify the access point ARN. When you use this
        # action with an access point for directory buckets, you must provide the access point name in place
        # of the bucket name. When using the access point ARN, you must direct requests to the access point
        # hostname. The access point hostname takes the form AccessPointName - AccountId .s3-accesspoint.
        # Region .amazonaws.com. When using this action with an access point through the Amazon Web Services
        # SDKs, you provide the access point ARN in place of the bucket name. For more information about
        # access point ARNs, see Using access points in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The key name for the object that you want to place a legal hold on.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon S3
        # fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The MD5 hash for the request body. For requests made using the Amazon Web Services Command Line
        # Interface (CLI) or Amazon Web Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Container element for the legal hold configuration you want to apply to the specified object.

        @[JSON::Field(key: "LegalHold")]
        getter legal_hold : Types::ObjectLockLegalHold?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # The version ID of the object that you want to place a legal hold on.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @legal_hold : Types::ObjectLockLegalHold? = nil,
          @request_payer : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct PutObjectLockConfigurationOutput
        include JSON::Serializable


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        def initialize(
          @request_charged : String? = nil
        )
        end
      end


      struct PutObjectLockConfigurationRequest
        include JSON::Serializable

        # The bucket whose Object Lock configuration you want to create or replace.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon S3
        # fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The MD5 hash for the request body. For requests made using the Amazon Web Services Command Line
        # Interface (CLI) or Amazon Web Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # The Object Lock configuration that you want to apply to the specified bucket.

        @[JSON::Field(key: "ObjectLockConfiguration")]
        getter object_lock_configuration : Types::ObjectLockConfiguration?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # A token to allow Object Lock to be enabled for an existing bucket.

        @[JSON::Field(key: "x-amz-bucket-object-lock-token")]
        getter token : String?

        def initialize(
          @bucket : String,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @object_lock_configuration : Types::ObjectLockConfiguration? = nil,
          @request_payer : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct PutObjectOutput
        include JSON::Serializable

        # Indicates whether the uploaded object uses an S3 Bucket Key for server-side encryption with Key
        # Management Service (KMS) keys (SSE-KMS).

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # The Base64 encoded, 32-bit CRC32 checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32c")]
        getter checksum_crc32_c : String?

        # The Base64 encoded, 64-bit CRC64NVME checksum of the object. This header is present if the object
        # was uploaded with the CRC64NVME checksum algorithm, or if it was uploaded without a checksum (and
        # Amazon S3 added the default checksum, CRC64NVME , to the uploaded object). For more information
        # about how checksums are calculated with multipart uploads, see Checking object integrity in the
        # Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc64nvme")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 digest of the object. This checksum is only present if the checksum
        # was uploaded with the object. When you use the API operation on an object that was uploaded using
        # multipart uploads, this value may not be a direct checksum value of the full object. Instead, it's a
        # calculation based on the checksum values of each individual part. For more information about how
        # checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3 User
        # Guide .

        @[JSON::Field(key: "x-amz-checksum-sha1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 digest of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha256")]
        getter checksum_sha256 : String?

        # This header specifies the checksum type of the object, which determines how part-level checksums are
        # combined to create an object-level checksum for multipart objects. For PutObject uploads, the
        # checksum type is always FULL_OBJECT . You can use this header as a data integrity check to verify
        # that the checksum type that is received is the same checksum that was specified. For more
        # information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-type")]
        getter checksum_type : String?

        # Entity tag for the uploaded object. General purpose buckets - To ensure that data is not corrupted
        # traversing the network, for objects where the ETag is the MD5 digest of the object, you can
        # calculate the MD5 while putting an object to Amazon S3 and compare the returned ETag to the
        # calculated MD5 value. Directory buckets - The ETag for the object in a directory bucket isn't the
        # MD5 digest of the object.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # If the expiration is configured for the object (see PutBucketLifecycleConfiguration ) in the Amazon
        # S3 User Guide , the response includes this header. It includes the expiry-date and rule-id key-value
        # pairs that provide information about object expiration. The value of the rule-id is URL-encoded.
        # Object expiration information is not returned in directory buckets and this header returns the value
        # " NotImplemented " in all responses for directory buckets.

        @[JSON::Field(key: "x-amz-expiration")]
        getter expiration : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to confirm the encryption algorithm that's used. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to provide the round-trip message integrity verification of the
        # customer-provided encryption key. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # If present, indicates the Amazon Web Services KMS Encryption Context to use for object encryption.
        # The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, which contains the
        # encryption context as key-value pairs. This value is stored as object metadata and automatically
        # gets passed on to Amazon Web Services KMS for future GetObject operations on this object.

        @[JSON::Field(key: "x-amz-server-side-encryption-context")]
        getter ssekms_encryption_context : String?

        # If present, indicates the ID of the KMS key that was used for object encryption.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
        # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid server
        # side encryption option is aws:fsx .

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # The size of the object in bytes. This value is only be present if you append to an object. This
        # functionality is only supported for objects in the Amazon S3 Express One Zone storage class in
        # directory buckets.

        @[JSON::Field(key: "x-amz-object-size")]
        getter size : Int64?

        # Version ID of the object. If you enable versioning for a bucket, Amazon S3 automatically generates a
        # unique version ID for the object being stored. Amazon S3 returns this ID in the response. When you
        # enable versioning for a bucket, if Amazon S3 receives multiple write requests for the same object
        # simultaneously, it stores all of the objects. For more information about versioning, see Adding
        # Objects to Versioning-Enabled Buckets in the Amazon S3 User Guide . For information about returning
        # the versioning state of a bucket, see GetBucketVersioning . This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        def initialize(
          @bucket_key_enabled : Bool? = nil,
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @checksum_type : String? = nil,
          @e_tag : String? = nil,
          @expiration : String? = nil,
          @request_charged : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_encryption_context : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @size : Int64? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct PutObjectRequest
        include JSON::Serializable

        # The bucket name to which the PUT action was initiated. Directory buckets - When you use this
        # operation with a directory bucket, you must use virtual-hosted-style requests in the format
        # Bucket-name .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not
        # supported. Directory bucket names must be unique in the chosen Zone (Availability Zone or Local
        # Zone). Bucket names must follow the format bucket-base-name -- zone-id --x-s3 (for example,
        # amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about bucket naming restrictions, see
        # Directory bucket naming rules in the Amazon S3 User Guide . Access points - When you use this action
        # with an access point for general purpose buckets, you must provide the alias of the access point in
        # place of the bucket name or specify the access point ARN. When you use this action with an access
        # point for directory buckets, you must provide the access point name in place of the bucket name.
        # When using the access point ARN, you must direct requests to the access point hostname. The access
        # point hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com.
        # When using this action with an access point through the Amazon Web Services SDKs, you provide the
        # access point ARN in place of the bucket name. For more information about access point ARNs, see
        # Using access points in the Amazon S3 User Guide . Object Lambda access points are not supported by
        # directory buckets. S3 on Outposts - When you use this action with S3 on Outposts, you must direct
        # requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form AccessPointName
        # - AccountId . outpostID .s3-outposts. Region .amazonaws.com . When you use this action with S3 on
        # Outposts, the destination bucket must be the Outposts access point ARN or the access point alias.
        # For more information about S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Object key for which the PUT action was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The canned ACL to apply to the object. For more information, see Canned ACL in the Amazon S3 User
        # Guide . When adding a new object, you can use headers to grant ACL-based permissions to individual
        # Amazon Web Services accounts or to predefined groups defined by Amazon S3. These permissions are
        # then added to the ACL on the object. By default, all objects are private. Only the owner has full
        # access control. For more information, see Access Control List (ACL) Overview and Managing ACLs Using
        # the REST API in the Amazon S3 User Guide . If the bucket that you're uploading objects to uses the
        # bucket owner enforced setting for S3 Object Ownership, ACLs are disabled and no longer affect
        # permissions. Buckets that use this setting only accept PUT requests that don't specify an ACL or PUT
        # requests that specify bucket owner full control ACLs, such as the bucket-owner-full-control canned
        # ACL or an equivalent form of this ACL expressed in the XML format. PUT requests that contain other
        # ACLs (for example, custom grants to certain Amazon Web Services accounts) fail and return a 400
        # error with the error code AccessControlListNotSupported . For more information, see Controlling
        # ownership of objects and disabling ACLs in the Amazon S3 User Guide . This functionality is not
        # supported for directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-acl")]
        getter acl : String?

        # Object data.

        @[JSON::Field(key: "Body")]
        getter body : Bytes?

        # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
        # encryption using Key Management Service (KMS) keys (SSE-KMS). General purpose buckets - Setting this
        # header to true causes Amazon S3 to use an S3 Bucket Key for object encryption with SSE-KMS. Also,
        # specifying this header with a PUT action doesn't affect bucket-level settings for S3 Bucket Key.
        # Directory buckets - S3 Bucket Keys are always enabled for GET and PUT operations in a directory
        # bucket and can’t be disabled. S3 Bucket Keys aren't supported, when you copy SSE-KMS encrypted
        # objects from general purpose buckets to directory buckets, from directory buckets to general purpose
        # buckets, or between directory buckets, through CopyObject , UploadPartCopy , the Copy operation in
        # Batch Operations , or the import jobs . In this case, Amazon S3 makes a call to KMS every time a
        # copy request is made for a KMS-encrypted object.

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # Can be used to specify caching behavior along the request/reply chain. For more information, see
        # http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9 .

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum- algorithm or x-amz-trailer header sent. Otherwise,
        # Amazon S3 fails the request with the HTTP status code 400 Bad Request . For the x-amz-checksum-
        # algorithm header, replace algorithm with the supported algorithm from the following list: CRC32
        # CRC32C CRC64NVME SHA1 SHA256 For more information, see Checking object integrity in the Amazon S3
        # User Guide . If the individual checksum value you provide through x-amz-checksum- algorithm doesn't
        # match the checksum algorithm you set through x-amz-sdk-checksum-algorithm , Amazon S3 fails the
        # request with a BadDigest error. The Content-MD5 or x-amz-sdk-checksum-algorithm header is required
        # for any request to upload an object with a retention period configured using Amazon S3 Object Lock.
        # For more information, see Uploading objects to an Object Lock enabled bucket in the Amazon S3 User
        # Guide . For directory buckets, when you use Amazon Web Services SDKs, CRC32 is the default checksum
        # algorithm that's used for performance.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 32-bit CRC32 checksum of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32")]
        getter checksum_crc32 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 32-bit CRC32C checksum of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32c")]
        getter checksum_crc32_c : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 64-bit CRC64NVME checksum of the
        # object. The CRC64NVME checksum is always a full object checksum. For more information, see Checking
        # object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc64nvme")]
        getter checksum_crc64_nvme : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 160-bit SHA1 digest of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha1")]
        getter checksum_sha1 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 256-bit SHA256 digest of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha256")]
        getter checksum_sha256 : String?

        # Specifies presentational information for the object. For more information, see
        # https://www.rfc-editor.org/rfc/rfc6266#section-4 .

        @[JSON::Field(key: "Content-Disposition")]
        getter content_disposition : String?

        # Specifies what content encodings have been applied to the object and thus what decoding mechanisms
        # must be applied to obtain the media-type referenced by the Content-Type header field. For more
        # information, see https://www.rfc-editor.org/rfc/rfc9110.html#field.content-encoding .

        @[JSON::Field(key: "Content-Encoding")]
        getter content_encoding : String?

        # The language the content is in.

        @[JSON::Field(key: "Content-Language")]
        getter content_language : String?

        # Size of the body in bytes. This parameter is useful when the size of the body cannot be determined
        # automatically. For more information, see
        # https://www.rfc-editor.org/rfc/rfc9110.html#name-content-length .

        @[JSON::Field(key: "Content-Length")]
        getter content_length : Int64?

        # The Base64 encoded 128-bit MD5 digest of the message (without the headers) according to RFC 1864.
        # This header can be used as a message integrity check to verify that the data is the same data that
        # was originally sent. Although it is optional, we recommend using the Content-MD5 mechanism as an
        # end-to-end integrity check. For more information about REST request authentication, see REST
        # Authentication . The Content-MD5 or x-amz-sdk-checksum-algorithm header is required for any request
        # to upload an object with a retention period configured using Amazon S3 Object Lock. For more
        # information, see Uploading objects to an Object Lock enabled bucket in the Amazon S3 User Guide .
        # This functionality is not supported for directory buckets.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # A standard MIME type describing the format of the contents. For more information, see
        # https://www.rfc-editor.org/rfc/rfc9110.html#name-content-type .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # The date and time at which the object is no longer cacheable. For more information, see
        # https://www.rfc-editor.org/rfc/rfc7234#section-5.3 .

        @[JSON::Field(key: "Expires")]
        getter expires : String?

        # Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object. This functionality is not
        # supported for directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-full-control")]
        getter grant_full_control : String?

        # Allows grantee to read the object data and its metadata. This functionality is not supported for
        # directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-read")]
        getter grant_read : String?

        # Allows grantee to read the object ACL. This functionality is not supported for directory buckets.
        # This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-read-acp")]
        getter grant_read_acp : String?

        # Allows grantee to write the ACL for the applicable object. This functionality is not supported for
        # directory buckets. This functionality is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "x-amz-grant-write-acp")]
        getter grant_write_acp : String?

        # Uploads the object only if the ETag (entity tag) value provided during the WRITE operation matches
        # the ETag of the object in S3. If the ETag values do not match, the operation returns a 412
        # Precondition Failed error. If a conflicting operation occurs during the upload S3 returns a 409
        # ConditionalRequestConflict response. On a 409 failure you should fetch the object's ETag and retry
        # the upload. Expects the ETag value as a string. For more information about conditional requests, see
        # RFC 7232 , or Conditional requests in the Amazon S3 User Guide .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # Uploads the object only if the object key name does not already exist in the bucket specified.
        # Otherwise, Amazon S3 returns a 412 Precondition Failed error. If a conflicting operation occurs
        # during the upload S3 returns a 409 ConditionalRequestConflict response. On a 409 failure you should
        # retry the upload. Expects the '*' (asterisk) character. For more information about conditional
        # requests, see RFC 7232 , or Conditional requests in the Amazon S3 User Guide .

        @[JSON::Field(key: "If-None-Match")]
        getter if_none_match : String?

        # A map of metadata to store with the object in S3.

        @[JSON::Field(key: "x-amz-meta-")]
        getter metadata : Hash(String, String)?

        # Specifies whether a legal hold will be applied to this object. For more information about S3 Object
        # Lock, see Object Lock in the Amazon S3 User Guide . This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-legal-hold")]
        getter object_lock_legal_hold_status : String?

        # The Object Lock mode that you want to apply to this object. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-mode")]
        getter object_lock_mode : String?

        # The date and time when you want this object's Object Lock to expire. Must be formatted as a
        # timestamp parameter. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-object-lock-retain-until-date")]
        getter object_lock_retain_until_date : Time?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Specifies the algorithm to use when encrypting the object (for example, AES256 ). This functionality
        # is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value
        # is used to store the object and then it is discarded; Amazon S3 does not store the encryption key.
        # The key must be appropriate for use with the algorithm specified in the
        # x-amz-server-side-encryption-customer-algorithm header. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this
        # header for a message integrity check to ensure that the encryption key was transmitted without
        # error. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # Specifies the Amazon Web Services KMS Encryption Context as an additional encryption context to use
        # for object encryption. The value of this header is a Base64 encoded string of a UTF-8 encoded JSON,
        # which contains the encryption context as key-value pairs. This value is stored as object metadata
        # and automatically gets passed on to Amazon Web Services KMS for future GetObject operations on this
        # object. General purpose buckets - This value must be explicitly added during CopyObject operations
        # if you want an additional encryption context for your object. For more information, see Encryption
        # context in the Amazon S3 User Guide . Directory buckets - You can optionally provide an explicit
        # encryption context value. The value must match the default encryption context - the bucket Amazon
        # Resource Name (ARN). An additional encryption context value is not supported.

        @[JSON::Field(key: "x-amz-server-side-encryption-context")]
        getter ssekms_encryption_context : String?

        # Specifies the KMS key ID (Key ID, Key ARN, or Key Alias) to use for object encryption. If the KMS
        # key doesn't exist in the same account that's issuing the command, you must use the full Key ARN not
        # the Key ID. General purpose buckets - If you specify x-amz-server-side-encryption with aws:kms or
        # aws:kms:dsse , this header specifies the ID (Key ID, Key ARN, or Key Alias) of the KMS key to use.
        # If you specify x-amz-server-side-encryption:aws:kms or x-amz-server-side-encryption:aws:kms:dsse ,
        # but do not provide x-amz-server-side-encryption-aws-kms-key-id , Amazon S3 uses the Amazon Web
        # Services managed key ( aws/s3 ) to protect the data. Directory buckets - To encrypt data using
        # SSE-KMS, it's recommended to specify the x-amz-server-side-encryption header to aws:kms . Then, the
        # x-amz-server-side-encryption-aws-kms-key-id header implicitly uses the bucket's default KMS customer
        # managed key ID. If you want to explicitly set the x-amz-server-side-encryption-aws-kms-key-id
        # header, it must match the bucket's default customer managed key (using key ID or ARN, not alias).
        # Your SSE-KMS configuration can only support 1 customer managed key per directory bucket's lifetime.
        # The Amazon Web Services managed key ( aws/s3 ) isn't supported. Incorrect key specification results
        # in an HTTP 400 Bad Request error.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm that was used when you store this object in Amazon S3 or Amazon
        # FSx. General purpose buckets - You have four mutually exclusive options to protect data using
        # server-side encryption in Amazon S3, depending on how you choose to manage the encryption keys.
        # Specifically, the encryption key options are Amazon S3 managed keys (SSE-S3), Amazon Web Services
        # KMS keys (SSE-KMS or DSSE-KMS), and customer-provided keys (SSE-C). Amazon S3 encrypts data with
        # server-side encryption by using Amazon S3 managed keys (SSE-S3) by default. You can optionally tell
        # Amazon S3 to encrypt data at rest by using server-side encryption with other key options. For more
        # information, see Using Server-Side Encryption in the Amazon S3 User Guide . Directory buckets - For
        # directory buckets, there are only two supported options for server-side encryption: server-side
        # encryption with Amazon S3 managed keys (SSE-S3) ( AES256 ) and server-side encryption with KMS keys
        # (SSE-KMS) ( aws:kms ). We recommend that the bucket's default encryption uses the desired encryption
        # configuration and you don't override the bucket default encryption in your CreateSession requests or
        # PUT object requests. Then, new objects are automatically encrypted with the desired encryption
        # settings. For more information, see Protecting data with server-side encryption in the Amazon S3
        # User Guide . For more information about the encryption overriding behaviors in directory buckets,
        # see Specifying server-side encryption with KMS for new object uploads . In the Zonal endpoint API
        # calls (except CopyObject and UploadPartCopy ) using the REST API, the encryption request headers
        # must match the encryption settings that are specified in the CreateSession request. You can't
        # override the values of the encryption settings ( x-amz-server-side-encryption ,
        # x-amz-server-side-encryption-aws-kms-key-id , x-amz-server-side-encryption-context , and
        # x-amz-server-side-encryption-bucket-key-enabled ) that are specified in the CreateSession request.
        # You don't need to explicitly specify these encryption settings values in Zonal endpoint API calls,
        # and Amazon S3 will use the encryption settings values from the CreateSession request to protect new
        # objects in the directory bucket. When you use the CLI or the Amazon Web Services SDKs, for
        # CreateSession , the session token refreshes automatically to avoid service interruptions when a
        # session expires. The CLI or the Amazon Web Services SDKs use the bucket's default encryption
        # configuration for the CreateSession request. It's not supported to override the encryption settings
        # values in the CreateSession request. So in the Zonal endpoint API calls (except CopyObject and
        # UploadPartCopy ), the encryption request headers must match the default encryption configuration of
        # the directory bucket. S3 access points for Amazon FSx - When accessing data stored in Amazon FSx
        # file systems using S3 access points, the only valid server side encryption option is aws:fsx . All
        # Amazon FSx file systems have encryption configured by default and are encrypted at rest. Data is
        # automatically encrypted before being written to the file system, and automatically decrypted as it
        # is read. These processes are handled transparently by Amazon FSx.

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The STANDARD
        # storage class provides high durability and high availability. Depending on performance needs, you
        # can specify a different Storage Class. For more information, see Storage Classes in the Amazon S3
        # User Guide . Directory buckets only support EXPRESS_ONEZONE (the S3 Express One Zone storage class)
        # in Availability Zones and ONEZONE_IA (the S3 One Zone-Infrequent Access storage class) in Dedicated
        # Local Zones. Amazon S3 on Outposts only uses the OUTPOSTS Storage Class.

        @[JSON::Field(key: "x-amz-storage-class")]
        getter storage_class : String?

        # The tag-set for the object. The tag-set must be encoded as URL Query parameters. (For example,
        # "Key1=Value1") This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-tagging")]
        getter tagging : String?

        # If the bucket is configured as a website, redirects requests for this object to another object in
        # the same bucket or to an external URL. Amazon S3 stores the value of this header in the object
        # metadata. For information about object metadata, see Object Key and Metadata in the Amazon S3 User
        # Guide . In the following example, the request header sets the redirect to an object
        # (anotherPage.html) in the same bucket: x-amz-website-redirect-location: /anotherPage.html In the
        # following example, the request header sets the object redirect to another website:
        # x-amz-website-redirect-location: http://www.example.com/ For more information about website hosting
        # in Amazon S3, see Hosting Websites on Amazon S3 and How to Configure Website Page Redirects in the
        # Amazon S3 User Guide . This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-website-redirect-location")]
        getter website_redirect_location : String?

        # Specifies the offset for appending data to existing objects in bytes. The offset must be equal to
        # the size of the existing object being appended to. If no object exists, setting this header to 0
        # will create a new object. This functionality is only supported for objects in the Amazon S3 Express
        # One Zone storage class in directory buckets.

        @[JSON::Field(key: "x-amz-write-offset-bytes")]
        getter write_offset_bytes : Int64?

        def initialize(
          @bucket : String,
          @key : String,
          @acl : String? = nil,
          @body : Bytes? = nil,
          @bucket_key_enabled : Bool? = nil,
          @cache_control : String? = nil,
          @checksum_algorithm : String? = nil,
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @content_disposition : String? = nil,
          @content_encoding : String? = nil,
          @content_language : String? = nil,
          @content_length : Int64? = nil,
          @content_md5 : String? = nil,
          @content_type : String? = nil,
          @expected_bucket_owner : String? = nil,
          @expires : String? = nil,
          @grant_full_control : String? = nil,
          @grant_read : String? = nil,
          @grant_read_acp : String? = nil,
          @grant_write_acp : String? = nil,
          @if_match : String? = nil,
          @if_none_match : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @object_lock_legal_hold_status : String? = nil,
          @object_lock_mode : String? = nil,
          @object_lock_retain_until_date : Time? = nil,
          @request_payer : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_encryption_context : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @storage_class : String? = nil,
          @tagging : String? = nil,
          @website_redirect_location : String? = nil,
          @write_offset_bytes : Int64? = nil
        )
        end
      end


      struct PutObjectRetentionOutput
        include JSON::Serializable


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        def initialize(
          @request_charged : String? = nil
        )
        end
      end


      struct PutObjectRetentionRequest
        include JSON::Serializable

        # The bucket name that contains the object you want to apply this Object Retention configuration to.
        # Access points - When you use this action with an access point for general purpose buckets, you must
        # provide the alias of the access point in place of the bucket name or specify the access point ARN.
        # When you use this action with an access point for directory buckets, you must provide the access
        # point name in place of the bucket name. When using the access point ARN, you must direct requests to
        # the access point hostname. The access point hostname takes the form AccessPointName - AccountId
        # .s3-accesspoint. Region .amazonaws.com. When using this action with an access point through the
        # Amazon Web Services SDKs, you provide the access point ARN in place of the bucket name. For more
        # information about access point ARNs, see Using access points in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The key name for the object that you want to apply this Object Retention configuration to.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Indicates whether this action should bypass Governance-mode restrictions.

        @[JSON::Field(key: "x-amz-bypass-governance-retention")]
        getter bypass_governance_retention : Bool?

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon S3
        # fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The MD5 hash for the request body. For requests made using the Amazon Web Services Command Line
        # Interface (CLI) or Amazon Web Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # The container element for the Object Retention configuration.

        @[JSON::Field(key: "Retention")]
        getter retention : Types::ObjectLockRetention?

        # The version ID for the object that you want to apply this Object Retention configuration to.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @bypass_governance_retention : Bool? = nil,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil,
          @retention : Types::ObjectLockRetention? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct PutObjectTaggingOutput
        include JSON::Serializable

        # The versionId of the object the tag-set was added to.

        @[JSON::Field(key: "x-amz-version-id")]
        getter version_id : String?

        def initialize(
          @version_id : String? = nil
        )
        end
      end


      struct PutObjectTaggingRequest
        include JSON::Serializable

        # The bucket name containing the object. Access points - When you use this action with an access point
        # for general purpose buckets, you must provide the alias of the access point in place of the bucket
        # name or specify the access point ARN. When you use this action with an access point for directory
        # buckets, you must provide the access point name in place of the bucket name. When using the access
        # point ARN, you must direct requests to the access point hostname. The access point hostname takes
        # the form AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When using this action
        # with an access point through the Amazon Web Services SDKs, you provide the access point ARN in place
        # of the bucket name. For more information about access point ARNs, see Using access points in the
        # Amazon S3 User Guide . S3 on Outposts - When you use this action with S3 on Outposts, you must
        # direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
        # AccessPointName - AccountId . outpostID .s3-outposts. Region .amazonaws.com . When you use this
        # action with S3 on Outposts, the destination bucket must be the Outposts access point ARN or the
        # access point alias. For more information about S3 on Outposts, see What is S3 on Outposts? in the
        # Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Name of the object key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Container for the TagSet and Tag elements

        @[JSON::Field(key: "Tagging")]
        getter tagging : Types::Tagging

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon S3
        # fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The MD5 hash for the request body. For requests made using the Amazon Web Services Command Line
        # Interface (CLI) or Amazon Web Services SDKs, this field is calculated automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Confirms that the requester knows that she or he will be charged for the tagging object request.
        # Bucket owners need not specify this parameter in their requests.

        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # The versionId of the object that the tag-set will be added to.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @tagging : Types::Tagging,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct PutPublicAccessBlockRequest
        include JSON::Serializable

        # The name of the Amazon S3 bucket whose PublicAccessBlock configuration you want to set.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The PublicAccessBlock configuration that you want to apply to this Amazon S3 bucket. You can enable
        # the configuration options in any combination. For more information about when Amazon S3 considers a
        # bucket or object public, see The Meaning of "Public" in the Amazon S3 User Guide .

        @[JSON::Field(key: "PublicAccessBlockConfiguration")]
        getter public_access_block_configuration : Types::PublicAccessBlockConfiguration

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon S3
        # fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The MD5 hash of the PutPublicAccessBlock request body. For requests made using the Amazon Web
        # Services Command Line Interface (CLI) or Amazon Web Services SDKs, this field is calculated
        # automatically.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @public_access_block_configuration : Types::PublicAccessBlockConfiguration,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end

      # Specifies the configuration for publishing messages to an Amazon Simple Queue Service (Amazon SQS)
      # queue when Amazon S3 detects specified events.

      struct QueueConfiguration
        include JSON::Serializable

        # A collection of bucket events for which to send notifications

        @[JSON::Field(key: "Event")]
        getter events : Array(String)

        # The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 publishes a message when
        # it detects events of the specified type.

        @[JSON::Field(key: "Queue")]
        getter queue_arn : String


        @[JSON::Field(key: "Filter")]
        getter filter : Types::NotificationConfigurationFilter?


        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @events : Array(String),
          @queue_arn : String,
          @filter : Types::NotificationConfigurationFilter? = nil,
          @id : String? = nil
        )
        end
      end

      # This data type is deprecated. Use QueueConfiguration for the same purposes. This data type specifies
      # the configuration for publishing messages to an Amazon Simple Queue Service (Amazon SQS) queue when
      # Amazon S3 detects specified events.

      struct QueueConfigurationDeprecated
        include JSON::Serializable


        @[JSON::Field(key: "Event")]
        getter event : String?

        # A collection of bucket events for which to send notifications.

        @[JSON::Field(key: "Event")]
        getter events : Array(String)?


        @[JSON::Field(key: "Id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 publishes a message when
        # it detects events of the specified type.

        @[JSON::Field(key: "Queue")]
        getter queue : String?

        def initialize(
          @event : String? = nil,
          @events : Array(String)? = nil,
          @id : String? = nil,
          @queue : String? = nil
        )
        end
      end

      # The journal table record expiration settings for a journal table in an S3 Metadata configuration.

      struct RecordExpiration
        include JSON::Serializable

        # Specifies whether journal table record expiration is enabled or disabled.

        @[JSON::Field(key: "Expiration")]
        getter expiration : String

        # If you enable journal table record expiration, you can set the number of days to retain your journal
        # table records. Journal table records must be retained for a minimum of 7 days. To set this value,
        # specify any whole number from 7 to 2147483647 . For example, to retain your journal table records
        # for one year, set this value to 365 .

        @[JSON::Field(key: "Days")]
        getter days : Int32?

        def initialize(
          @expiration : String,
          @days : Int32? = nil
        )
        end
      end

      # The container for the records event.

      struct RecordsEvent
        include JSON::Serializable

        # The byte array of partial, one or more result records. S3 Select doesn't guarantee that a record
        # will be self-contained in one record frame. To ensure continuous streaming of data, S3 Select might
        # split the same record across multiple record frames instead of aggregating the results in memory.
        # Some S3 clients (for example, the SDK for Java) handle this behavior by creating a ByteStream out of
        # the response by default. Other clients might not handle this behavior by default. In those cases,
        # you must aggregate the results on the client side and parse the response.

        @[JSON::Field(key: "Payload")]
        getter payload : Bytes?

        def initialize(
          @payload : Bytes? = nil
        )
        end
      end

      # Specifies how requests are redirected. In the event of an error, you can specify a different error
      # code to return.

      struct Redirect
        include JSON::Serializable

        # The host name to use in the redirect request.

        @[JSON::Field(key: "HostName")]
        getter host_name : String?

        # The HTTP redirect code to use on the response. Not required if one of the siblings is present.

        @[JSON::Field(key: "HttpRedirectCode")]
        getter http_redirect_code : String?

        # Protocol to use when redirecting requests. The default is the protocol that is used in the original
        # request.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The object key prefix to use in the redirect request. For example, to redirect requests for all
        # pages with prefix docs/ (objects in the docs/ folder) to documents/ , you can set a condition block
        # with KeyPrefixEquals set to docs/ and in the Redirect set ReplaceKeyPrefixWith to /documents . Not
        # required if one of the siblings is present. Can be present only if ReplaceKeyWith is not provided.
        # Replacement must be made for object keys containing special characters (such as carriage returns)
        # when using XML requests. For more information, see XML related object key constraints .

        @[JSON::Field(key: "ReplaceKeyPrefixWith")]
        getter replace_key_prefix_with : String?

        # The specific object key to use in the redirect request. For example, redirect request to error.html
        # . Not required if one of the siblings is present. Can be present only if ReplaceKeyPrefixWith is not
        # provided. Replacement must be made for object keys containing special characters (such as carriage
        # returns) when using XML requests. For more information, see XML related object key constraints .

        @[JSON::Field(key: "ReplaceKeyWith")]
        getter replace_key_with : String?

        def initialize(
          @host_name : String? = nil,
          @http_redirect_code : String? = nil,
          @protocol : String? = nil,
          @replace_key_prefix_with : String? = nil,
          @replace_key_with : String? = nil
        )
        end
      end

      # Specifies the redirect behavior of all requests to a website endpoint of an Amazon S3 bucket.

      struct RedirectAllRequestsTo
        include JSON::Serializable

        # Name of the host where requests are redirected.

        @[JSON::Field(key: "HostName")]
        getter host_name : String

        # Protocol to use when redirecting requests. The default is the protocol that is used in the original
        # request.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        def initialize(
          @host_name : String,
          @protocol : String? = nil
        )
        end
      end


      struct RenameObjectOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct RenameObjectRequest
        include JSON::Serializable

        # The bucket name of the directory bucket containing the object. You must use virtual-hosted-style
        # requests in the format Bucket-name.s3express-zone-id.region-code.amazonaws.com . Path-style requests
        # are not supported. Directory bucket names must be unique in the chosen Availability Zone. Bucket
        # names must follow the format bucket-base-name--zone-id--x-s3 (for example,
        # amzn-s3-demo-bucket--usw2-az1--x-s3 ). For information about bucket naming restrictions, see
        # Directory bucket naming rules in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Key name of the object to rename.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Specifies the source for the rename operation. The value must be URL encoded.

        @[JSON::Field(key: "x-amz-rename-source")]
        getter rename_source : String

        # A unique string with a max of 64 ASCII characters in the ASCII range of 33 - 126. RenameObject
        # supports idempotency using a client token. To make an idempotent API request using RenameObject ,
        # specify a client token in the request. You should not reuse the same client token for other API
        # requests. If you retry a request that completed successfully using the same client token and the
        # same parameters, the retry succeeds without performing any further actions. If you retry a
        # successful request using the same client token, but one or more of the parameters are different, the
        # retry fails and an IdempotentParameterMismatch error is returned.

        @[JSON::Field(key: "x-amz-client-token")]
        getter client_token : String?

        # Renames the object only if the ETag (entity tag) value provided during the operation matches the
        # ETag of the object in S3. The If-Match header field makes the request method conditional on ETags.
        # If the ETag values do not match, the operation returns a 412 Precondition Failed error. Expects the
        # ETag value as a string.

        @[JSON::Field(key: "If-Match")]
        getter destination_if_match : String?

        # Renames the object if the destination exists and if it has been modified since the specified time.

        @[JSON::Field(key: "If-Modified-Since")]
        getter destination_if_modified_since : Time?

        # Renames the object only if the destination does not already exist in the specified directory bucket.
        # If the object does exist when you send a request with If-None-Match:* , the S3 API will return a 412
        # Precondition Failed error, preventing an overwrite. The If-None-Match header prevents overwrites of
        # existing data by validating that there's not an object with the same key name already in your
        # directory bucket. Expects the * character (asterisk).

        @[JSON::Field(key: "If-None-Match")]
        getter destination_if_none_match : String?

        # Renames the object if it hasn't been modified since the specified time.

        @[JSON::Field(key: "If-Unmodified-Since")]
        getter destination_if_unmodified_since : Time?

        # Renames the object if the source exists and if its entity tag (ETag) matches the specified ETag.

        @[JSON::Field(key: "x-amz-rename-source-if-match")]
        getter source_if_match : String?

        # Renames the object if the source exists and if it has been modified since the specified time.

        @[JSON::Field(key: "x-amz-rename-source-if-modified-since")]
        getter source_if_modified_since : Time?

        # Renames the object if the source exists and if its entity tag (ETag) is different than the specified
        # ETag. If an asterisk ( * ) character is provided, the operation will fail and return a 412
        # Precondition Failed error.

        @[JSON::Field(key: "x-amz-rename-source-if-none-match")]
        getter source_if_none_match : String?

        # Renames the object if the source exists and hasn't been modified since the specified time.

        @[JSON::Field(key: "x-amz-rename-source-if-unmodified-since")]
        getter source_if_unmodified_since : Time?

        def initialize(
          @bucket : String,
          @key : String,
          @rename_source : String,
          @client_token : String? = nil,
          @destination_if_match : String? = nil,
          @destination_if_modified_since : Time? = nil,
          @destination_if_none_match : String? = nil,
          @destination_if_unmodified_since : Time? = nil,
          @source_if_match : String? = nil,
          @source_if_modified_since : Time? = nil,
          @source_if_none_match : String? = nil,
          @source_if_unmodified_since : Time? = nil
        )
        end
      end

      # A filter that you can specify for selection for modifications on replicas. Amazon S3 doesn't
      # replicate replica modifications by default. In the latest version of replication configuration (when
      # Filter is specified), you can specify this element and set the status to Enabled to replicate
      # modifications on replicas. If you don't specify the Filter element, Amazon S3 assumes that the
      # replication configuration is the earlier version, V1. In the earlier version, this element is not
      # allowed.

      struct ReplicaModifications
        include JSON::Serializable

        # Specifies whether Amazon S3 replicates modifications on replicas.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # A container for replication rules. You can add up to 1,000 rules. The maximum size of a replication
      # configuration is 2 MB.

      struct ReplicationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that Amazon S3
        # assumes when replicating objects. For more information, see How to Set Up Replication in the Amazon
        # S3 User Guide .

        @[JSON::Field(key: "Role")]
        getter role : String

        # A container for one or more replication rules. A replication configuration must have at least one
        # rule and can contain a maximum of 1,000 rules.

        @[JSON::Field(key: "Rule")]
        getter rules : Array(Types::ReplicationRule)

        def initialize(
          @role : String,
          @rules : Array(Types::ReplicationRule)
        )
        end
      end

      # Specifies which Amazon S3 objects to replicate and where to store the replicas.

      struct ReplicationRule
        include JSON::Serializable

        # A container for information about the replication destination and its configurations including
        # enabling the S3 Replication Time Control (S3 RTC).

        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # Specifies whether the rule is enabled.

        @[JSON::Field(key: "Status")]
        getter status : String


        @[JSON::Field(key: "DeleteMarkerReplication")]
        getter delete_marker_replication : Types::DeleteMarkerReplication?

        # Optional configuration to replicate existing source bucket objects. This parameter is no longer
        # supported. To replicate existing objects, see Replicating existing objects with S3 Batch Replication
        # in the Amazon S3 User Guide .

        @[JSON::Field(key: "ExistingObjectReplication")]
        getter existing_object_replication : Types::ExistingObjectReplication?


        @[JSON::Field(key: "Filter")]
        getter filter : Types::ReplicationRuleFilter?

        # A unique identifier for the rule. The maximum value is 255 characters.

        @[JSON::Field(key: "ID")]
        getter id : String?

        # An object key name prefix that identifies the object or objects to which the rule applies. The
        # maximum prefix length is 1,024 characters. To include all objects in a bucket, specify an empty
        # string. Replacement must be made for object keys containing special characters (such as carriage
        # returns) when using XML requests. For more information, see XML related object key constraints .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The priority indicates which rule has precedence whenever two or more replication rules conflict.
        # Amazon S3 will attempt to replicate objects according to all replication rules. However, if there
        # are two or more rules with the same destination bucket, then objects will be replicated according to
        # the rule with the highest priority. The higher the number, the higher the priority. For more
        # information, see Replication in the Amazon S3 User Guide .

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # A container that describes additional filters for identifying the source objects that you want to
        # replicate. You can choose to enable or disable the replication of these objects. Currently, Amazon
        # S3 supports only the filter that you can specify for objects created with server-side encryption
        # using a customer managed key stored in Amazon Web Services Key Management Service (SSE-KMS).

        @[JSON::Field(key: "SourceSelectionCriteria")]
        getter source_selection_criteria : Types::SourceSelectionCriteria?

        def initialize(
          @destination : Types::Destination,
          @status : String,
          @delete_marker_replication : Types::DeleteMarkerReplication? = nil,
          @existing_object_replication : Types::ExistingObjectReplication? = nil,
          @filter : Types::ReplicationRuleFilter? = nil,
          @id : String? = nil,
          @prefix : String? = nil,
          @priority : Int32? = nil,
          @source_selection_criteria : Types::SourceSelectionCriteria? = nil
        )
        end
      end

      # A container for specifying rule filters. The filters determine the subset of objects to which the
      # rule applies. This element is required only if you specify more than one filter. For example: If you
      # specify both a Prefix and a Tag filter, wrap these filters in an And tag. If you specify a filter
      # based on multiple tags, wrap the Tag elements in an And tag.

      struct ReplicationRuleAndOperator
        include JSON::Serializable

        # An object key name prefix that identifies the subset of objects to which the rule applies.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # An array of tags containing key and value pairs.

        @[JSON::Field(key: "Tag")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @prefix : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A filter that identifies the subset of objects to which the replication rule applies. A Filter must
      # specify exactly one Prefix , Tag , or an And child element.

      struct ReplicationRuleFilter
        include JSON::Serializable

        # A container for specifying rule filters. The filters determine the subset of objects to which the
        # rule applies. This element is required only if you specify more than one filter. For example: If you
        # specify both a Prefix and a Tag filter, wrap these filters in an And tag. If you specify a filter
        # based on multiple tags, wrap the Tag elements in an And tag.

        @[JSON::Field(key: "And")]
        getter and : Types::ReplicationRuleAndOperator?

        # An object key name prefix that identifies the subset of objects to which the rule applies.
        # Replacement must be made for object keys containing special characters (such as carriage returns)
        # when using XML requests. For more information, see XML related object key constraints .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # A container for specifying a tag key and value. The rule applies only to objects that have the tag
        # in their tag set.

        @[JSON::Field(key: "Tag")]
        getter tag : Types::Tag?

        def initialize(
          @and : Types::ReplicationRuleAndOperator? = nil,
          @prefix : String? = nil,
          @tag : Types::Tag? = nil
        )
        end
      end

      # A container specifying S3 Replication Time Control (S3 RTC) related information, including whether
      # S3 RTC is enabled and the time when all objects and operations on objects must be replicated. Must
      # be specified together with a Metrics block.

      struct ReplicationTime
        include JSON::Serializable

        # Specifies whether the replication time is enabled.

        @[JSON::Field(key: "Status")]
        getter status : String

        # A container specifying the time by which replication should be complete for all objects and
        # operations on objects.

        @[JSON::Field(key: "Time")]
        getter time : Types::ReplicationTimeValue

        def initialize(
          @status : String,
          @time : Types::ReplicationTimeValue
        )
        end
      end

      # A container specifying the time value for S3 Replication Time Control (S3 RTC) and replication
      # metrics EventThreshold .

      struct ReplicationTimeValue
        include JSON::Serializable

        # Contains an integer specifying time in minutes. Valid value: 15

        @[JSON::Field(key: "Minutes")]
        getter minutes : Int32?

        def initialize(
          @minutes : Int32? = nil
        )
        end
      end

      # Container for Payer.

      struct RequestPaymentConfiguration
        include JSON::Serializable

        # Specifies who pays for the download and request fees.

        @[JSON::Field(key: "Payer")]
        getter payer : String

        def initialize(
          @payer : String
        )
        end
      end

      # Container for specifying if periodic QueryProgress messages should be sent.

      struct RequestProgress
        include JSON::Serializable

        # Specifies whether periodic QueryProgress frames should be sent. Valid values: TRUE, FALSE. Default
        # value: FALSE.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end


      struct RestoreObjectOutput
        include JSON::Serializable


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # Indicates the path in the provided S3 output location where Select results will be restored to.

        @[JSON::Field(key: "x-amz-restore-output-path")]
        getter restore_output_path : String?

        def initialize(
          @request_charged : String? = nil,
          @restore_output_path : String? = nil
        )
        end
      end


      struct RestoreObjectRequest
        include JSON::Serializable

        # The bucket name containing the object to restore. Access points - When you use this action with an
        # access point for general purpose buckets, you must provide the alias of the access point in place of
        # the bucket name or specify the access point ARN. When you use this action with an access point for
        # directory buckets, you must provide the access point name in place of the bucket name. When using
        # the access point ARN, you must direct requests to the access point hostname. The access point
        # hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When
        # using this action with an access point through the Amazon Web Services SDKs, you provide the access
        # point ARN in place of the bucket name. For more information about access point ARNs, see Using
        # access points in the Amazon S3 User Guide . S3 on Outposts - When you use this action with S3 on
        # Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes
        # the form AccessPointName - AccountId . outpostID .s3-outposts. Region .amazonaws.com . When you use
        # this action with S3 on Outposts, the destination bucket must be the Outposts access point ARN or the
        # access point alias. For more information about S3 on Outposts, see What is S3 on Outposts? in the
        # Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Object key for which the action was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon S3
        # fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?


        @[JSON::Field(key: "RestoreRequest")]
        getter restore_request : Types::RestoreRequest?

        # VersionId used to reference a specific version of the object.

        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @key : String,
          @checksum_algorithm : String? = nil,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil,
          @restore_request : Types::RestoreRequest? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Container for restore job parameters.

      struct RestoreRequest
        include JSON::Serializable

        # Lifetime of the active copy in days. Do not use with restores that specify OutputLocation . The Days
        # element is required for regular restores, and must not be provided for select requests.

        @[JSON::Field(key: "Days")]
        getter days : Int32?

        # The optional description for the job.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # S3 Glacier related parameters pertaining to this job. Do not use with restores that specify
        # OutputLocation .

        @[JSON::Field(key: "GlacierJobParameters")]
        getter glacier_job_parameters : Types::GlacierJobParameters?

        # Describes the location where the restore job's output is stored.

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::OutputLocation?

        # Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3 Select can
        # continue to use the feature as usual. Learn more Describes the parameters for Select job types.

        @[JSON::Field(key: "SelectParameters")]
        getter select_parameters : Types::SelectParameters?

        # Retrieval tier at which the restore will be processed.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3 Select can
        # continue to use the feature as usual. Learn more Type of restore request.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @days : Int32? = nil,
          @description : String? = nil,
          @glacier_job_parameters : Types::GlacierJobParameters? = nil,
          @output_location : Types::OutputLocation? = nil,
          @select_parameters : Types::SelectParameters? = nil,
          @tier : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Specifies the restoration status of an object. Objects in certain storage classes must be restored
      # before they can be retrieved. For more information about these storage classes and how to work with
      # archived objects, see Working with archived objects in the Amazon S3 User Guide . This functionality
      # is not supported for directory buckets. Directory buckets only support EXPRESS_ONEZONE (the S3
      # Express One Zone storage class) in Availability Zones and ONEZONE_IA (the S3 One Zone-Infrequent
      # Access storage class) in Dedicated Local Zones.

      struct RestoreStatus
        include JSON::Serializable

        # Specifies whether the object is currently being restored. If the object restoration is in progress,
        # the header returns the value TRUE . For example: x-amz-optional-object-attributes:
        # IsRestoreInProgress="true" If the object restoration has completed, the header returns the value
        # FALSE . For example: x-amz-optional-object-attributes: IsRestoreInProgress="false",
        # RestoreExpiryDate="2012-12-21T00:00:00.000Z" If the object hasn't been restored, there is no header
        # response.

        @[JSON::Field(key: "IsRestoreInProgress")]
        getter is_restore_in_progress : Bool?

        # Indicates when the restored copy will expire. This value is populated only if the object has already
        # been restored. For example: x-amz-optional-object-attributes: IsRestoreInProgress="false",
        # RestoreExpiryDate="2012-12-21T00:00:00.000Z"

        @[JSON::Field(key: "RestoreExpiryDate")]
        getter restore_expiry_date : Time?

        def initialize(
          @is_restore_in_progress : Bool? = nil,
          @restore_expiry_date : Time? = nil
        )
        end
      end

      # Specifies the redirect behavior and when a redirect is applied. For more information about routing
      # rules, see Configuring advanced conditional redirects in the Amazon S3 User Guide .

      struct RoutingRule
        include JSON::Serializable

        # Container for redirect information. You can redirect requests to another host, to another page, or
        # with another protocol. In the event of an error, you can specify a different error code to return.

        @[JSON::Field(key: "Redirect")]
        getter redirect : Types::Redirect

        # A container for describing a condition that must be met for the specified redirect to apply. For
        # example, 1. If request is for pages in the /docs folder, redirect to the /documents folder. 2. If
        # request results in HTTP error 4xx, redirect request to another host where you might process the
        # error.

        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        def initialize(
          @redirect : Types::Redirect,
          @condition : Types::Condition? = nil
        )
        end
      end

      # Specifies lifecycle rules for an Amazon S3 bucket. For more information, see Put Bucket Lifecycle
      # Configuration in the Amazon S3 API Reference . For examples, see Put Bucket Lifecycle Configuration
      # Examples .

      struct Rule
        include JSON::Serializable

        # Object key prefix that identifies one or more objects to which this rule applies. Replacement must
        # be made for object keys containing special characters (such as carriage returns) when using XML
        # requests. For more information, see XML related object key constraints .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String

        # If Enabled , the rule is currently being applied. If Disabled , the rule is not currently being
        # applied.

        @[JSON::Field(key: "Status")]
        getter status : String


        @[JSON::Field(key: "AbortIncompleteMultipartUpload")]
        getter abort_incomplete_multipart_upload : Types::AbortIncompleteMultipartUpload?

        # Specifies the expiration for the lifecycle of the object.

        @[JSON::Field(key: "Expiration")]
        getter expiration : Types::LifecycleExpiration?

        # Unique identifier for the rule. The value can't be longer than 255 characters.

        @[JSON::Field(key: "ID")]
        getter id : String?


        @[JSON::Field(key: "NoncurrentVersionExpiration")]
        getter noncurrent_version_expiration : Types::NoncurrentVersionExpiration?


        @[JSON::Field(key: "NoncurrentVersionTransition")]
        getter noncurrent_version_transition : Types::NoncurrentVersionTransition?

        # Specifies when an object transitions to a specified storage class. For more information about Amazon
        # S3 lifecycle configuration rules, see Transitioning Objects Using Amazon S3 Lifecycle in the Amazon
        # S3 User Guide .

        @[JSON::Field(key: "Transition")]
        getter transition : Types::Transition?

        def initialize(
          @prefix : String,
          @status : String,
          @abort_incomplete_multipart_upload : Types::AbortIncompleteMultipartUpload? = nil,
          @expiration : Types::LifecycleExpiration? = nil,
          @id : String? = nil,
          @noncurrent_version_expiration : Types::NoncurrentVersionExpiration? = nil,
          @noncurrent_version_transition : Types::NoncurrentVersionTransition? = nil,
          @transition : Types::Transition? = nil
        )
        end
      end

      # A container for object key name prefix and suffix filtering rules.

      struct S3KeyFilter
        include JSON::Serializable


        @[JSON::Field(key: "FilterRule")]
        getter filter_rules : Array(Types::FilterRule)?

        def initialize(
          @filter_rules : Array(Types::FilterRule)? = nil
        )
        end
      end

      # Describes an Amazon S3 location that will receive the results of the restore request.

      struct S3Location
        include JSON::Serializable

        # The name of the bucket where the restore results will be placed.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # The prefix that is prepended to the restore results for this request.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String

        # A list of grants that control access to the staged results.

        @[JSON::Field(key: "AccessControlList")]
        getter access_control_list : Array(Types::Grant)?

        # The canned ACL to apply to the restore results.

        @[JSON::Field(key: "CannedACL")]
        getter canned_acl : String?


        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::Encryption?

        # The class of storage used to store the restore results.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        # The tag-set that is applied to the restore results.

        @[JSON::Field(key: "Tagging")]
        getter tagging : Types::Tagging?

        # A list of metadata to store with the restore results in S3.

        @[JSON::Field(key: "UserMetadata")]
        getter user_metadata : Array(Types::MetadataEntry)?

        def initialize(
          @bucket_name : String,
          @prefix : String,
          @access_control_list : Array(Types::Grant)? = nil,
          @canned_acl : String? = nil,
          @encryption : Types::Encryption? = nil,
          @storage_class : String? = nil,
          @tagging : Types::Tagging? = nil,
          @user_metadata : Array(Types::MetadataEntry)? = nil
        )
        end
      end

      # The destination information for a V1 S3 Metadata configuration. The destination table bucket must be
      # in the same Region and Amazon Web Services account as the general purpose bucket. The specified
      # metadata table name must be unique within the aws_s3_metadata namespace in the destination table
      # bucket. If you created your S3 Metadata configuration before July 15, 2025, we recommend that you
      # delete and re-create your configuration by using CreateBucketMetadataConfiguration so that you can
      # expire journal table records and create a live inventory table.

      struct S3TablesDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the table bucket that's specified as the destination in the
        # metadata table configuration. The destination table bucket must be in the same Region and Amazon Web
        # Services account as the general purpose bucket.

        @[JSON::Field(key: "TableBucketArn")]
        getter table_bucket_arn : String

        # The name for the metadata table in your metadata table configuration. The specified metadata table
        # name must be unique within the aws_s3_metadata namespace in the destination table bucket.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @table_bucket_arn : String,
          @table_name : String
        )
        end
      end

      # The destination information for a V1 S3 Metadata configuration. The destination table bucket must be
      # in the same Region and Amazon Web Services account as the general purpose bucket. The specified
      # metadata table name must be unique within the aws_s3_metadata namespace in the destination table
      # bucket. If you created your S3 Metadata configuration before July 15, 2025, we recommend that you
      # delete and re-create your configuration by using CreateBucketMetadataConfiguration so that you can
      # expire journal table records and create a live inventory table.

      struct S3TablesDestinationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the metadata table in the metadata table configuration. The
        # specified metadata table name must be unique within the aws_s3_metadata namespace in the destination
        # table bucket.

        @[JSON::Field(key: "TableArn")]
        getter table_arn : String

        # The Amazon Resource Name (ARN) for the table bucket that's specified as the destination in the
        # metadata table configuration. The destination table bucket must be in the same Region and Amazon Web
        # Services account as the general purpose bucket.

        @[JSON::Field(key: "TableBucketArn")]
        getter table_bucket_arn : String

        # The name for the metadata table in your metadata table configuration. The specified metadata table
        # name must be unique within the aws_s3_metadata namespace in the destination table bucket.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The table bucket namespace for the metadata table in your metadata table configuration. This value
        # is always aws_s3_metadata .

        @[JSON::Field(key: "TableNamespace")]
        getter table_namespace : String

        def initialize(
          @table_arn : String,
          @table_bucket_arn : String,
          @table_name : String,
          @table_namespace : String
        )
        end
      end

      # Specifies the use of SSE-KMS to encrypt delivered inventory reports.

      struct SSEKMS
        include JSON::Serializable

        # Specifies the ID of the Key Management Service (KMS) symmetric encryption customer managed key to
        # use for encrypting inventory reports.

        @[JSON::Field(key: "KeyId")]
        getter key_id : String

        def initialize(
          @key_id : String
        )
        end
      end

      # Specifies the use of SSE-S3 to encrypt delivered inventory reports.

      struct SSES3
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the byte range of the object to get the records from. A record is processed when its first
      # byte is contained by the range. This parameter is optional, but when specified, it must not be
      # empty. See RFC 2616, Section 14.35.1 about how to specify the start and end of the range.

      struct ScanRange
        include JSON::Serializable

        # Specifies the end of the byte range. This parameter is optional. Valid values: non-negative
        # integers. The default value is one less than the size of the object being queried. If only the End
        # parameter is supplied, it is interpreted to mean scan the last N bytes of the file. For example,
        # &lt;scanrange&gt;&lt;end&gt;50&lt;/end&gt;&lt;/scanrange&gt; means scan the last 50 bytes.

        @[JSON::Field(key: "End")]
        getter end : Int64?

        # Specifies the start of the byte range. This parameter is optional. Valid values: non-negative
        # integers. The default value is 0. If only start is supplied, it means scan from that point to the
        # end of the file. For example, &lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;/scanrange&gt; means
        # scan from byte 50 until the end of the file.

        @[JSON::Field(key: "Start")]
        getter start : Int64?

        def initialize(
          @end : Int64? = nil,
          @start : Int64? = nil
        )
        end
      end

      # The container for selecting objects from a content event stream.

      struct SelectObjectContentEventStream
        include JSON::Serializable

        # The Continuation Event.

        @[JSON::Field(key: "Cont")]
        getter cont : Types::ContinuationEvent?

        # The End Event.

        @[JSON::Field(key: "End")]
        getter end : Types::EndEvent?

        # The Progress Event.

        @[JSON::Field(key: "Progress")]
        getter progress : Types::ProgressEvent?

        # The Records Event.

        @[JSON::Field(key: "Records")]
        getter records : Types::RecordsEvent?

        # The Stats Event.

        @[JSON::Field(key: "Stats")]
        getter stats : Types::StatsEvent?

        def initialize(
          @cont : Types::ContinuationEvent? = nil,
          @end : Types::EndEvent? = nil,
          @progress : Types::ProgressEvent? = nil,
          @records : Types::RecordsEvent? = nil,
          @stats : Types::StatsEvent? = nil
        )
        end
      end


      struct SelectObjectContentOutput
        include JSON::Serializable

        # The array of results.

        @[JSON::Field(key: "Payload")]
        getter payload : Types::SelectObjectContentEventStream?

        def initialize(
          @payload : Types::SelectObjectContentEventStream? = nil
        )
        end
      end

      # Learn Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3
      # Select can continue to use the feature as usual. Learn more Request to filter the contents of an
      # Amazon S3 object based on a simple Structured Query Language (SQL) statement. In the request, along
      # with the SQL expression, you must specify a data serialization format (JSON or CSV) of the object.
      # Amazon S3 uses this to parse object data into records. It returns only records that match the
      # specified SQL expression. You must also specify the data serialization format for the response. For
      # more information, see S3Select API Documentation .

      struct SelectObjectContentRequest
        include JSON::Serializable

        # The S3 bucket.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The expression that is used to query the object.

        @[JSON::Field(key: "Expression")]
        getter expression : String

        # The type of the provided expression (for example, SQL).

        @[JSON::Field(key: "ExpressionType")]
        getter expression_type : String

        # Describes the format of the data in the object that is being queried.

        @[JSON::Field(key: "InputSerialization")]
        getter input_serialization : Types::InputSerialization

        # The object key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Describes the format of the data that you want Amazon S3 to return in response.

        @[JSON::Field(key: "OutputSerialization")]
        getter output_serialization : Types::OutputSerialization

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # Specifies if periodic request progress information should be enabled.

        @[JSON::Field(key: "RequestProgress")]
        getter request_progress : Types::RequestProgress?

        # The server-side encryption (SSE) algorithm used to encrypt the object. This parameter is needed only
        # when the object was created using a checksum algorithm. For more information, see Protecting data
        # using SSE-C keys in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # The server-side encryption (SSE) customer managed key. This parameter is needed only when the object
        # was created using a checksum algorithm. For more information, see Protecting data using SSE-C keys
        # in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # The MD5 server-side encryption (SSE) customer managed key. This parameter is needed only when the
        # object was created using a checksum algorithm. For more information, see Protecting data using SSE-C
        # keys in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # Specifies the byte range of the object to get the records from. A record is processed when its first
        # byte is contained by the range. This parameter is optional, but when specified, it must not be
        # empty. See RFC 2616, Section 14.35.1 about how to specify the start and end of the range. ScanRange
        # may be used in the following ways:
        # &lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;end&gt;100&lt;/end&gt;&lt;/scanrange&gt; - process
        # only the records starting between the bytes 50 and 100 (inclusive, counting from zero)
        # &lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;/scanrange&gt; - process only the records starting
        # after the byte 50 &lt;scanrange&gt;&lt;end&gt;50&lt;/end&gt;&lt;/scanrange&gt; - process only the
        # records within the last 50 bytes of the file.

        @[JSON::Field(key: "ScanRange")]
        getter scan_range : Types::ScanRange?

        def initialize(
          @bucket : String,
          @expression : String,
          @expression_type : String,
          @input_serialization : Types::InputSerialization,
          @key : String,
          @output_serialization : Types::OutputSerialization,
          @expected_bucket_owner : String? = nil,
          @request_progress : Types::RequestProgress? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @scan_range : Types::ScanRange? = nil
        )
        end
      end

      # Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3 Select can
      # continue to use the feature as usual. Learn more Describes the parameters for Select job types.
      # Learn How to optimize querying your data in Amazon S3 using Amazon Athena , S3 Object Lambda , or
      # client-side filtering.

      struct SelectParameters
        include JSON::Serializable

        # Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3 Select can
        # continue to use the feature as usual. Learn more The expression that is used to query the object.

        @[JSON::Field(key: "Expression")]
        getter expression : String

        # The type of the provided expression (for example, SQL).

        @[JSON::Field(key: "ExpressionType")]
        getter expression_type : String

        # Describes the serialization format of the object.

        @[JSON::Field(key: "InputSerialization")]
        getter input_serialization : Types::InputSerialization

        # Describes how the results of the Select job are serialized.

        @[JSON::Field(key: "OutputSerialization")]
        getter output_serialization : Types::OutputSerialization

        def initialize(
          @expression : String,
          @expression_type : String,
          @input_serialization : Types::InputSerialization,
          @output_serialization : Types::OutputSerialization
        )
        end
      end

      # Describes the default server-side encryption to apply to new objects in the bucket. If a PUT Object
      # request doesn't specify any server-side encryption, this default encryption will be applied. For
      # more information, see PutBucketEncryption . General purpose buckets - If you don't specify a
      # customer managed key at configuration, Amazon S3 automatically creates an Amazon Web Services KMS
      # key ( aws/s3 ) in your Amazon Web Services account the first time that you add an object encrypted
      # with SSE-KMS to a bucket. By default, Amazon S3 uses this KMS key for SSE-KMS. Directory buckets -
      # Your SSE-KMS configuration can only support 1 customer managed key per directory bucket's lifetime.
      # The Amazon Web Services managed key ( aws/s3 ) isn't supported. Directory buckets - For directory
      # buckets, there are only two supported options for server-side encryption: SSE-S3 and SSE-KMS.

      struct ServerSideEncryptionByDefault
        include JSON::Serializable

        # Server-side encryption algorithm to use for the default encryption. For directory buckets, there are
        # only two supported values for server-side encryption: AES256 and aws:kms .

        @[JSON::Field(key: "SSEAlgorithm")]
        getter sse_algorithm : String

        # Amazon Web Services Key Management Service (KMS) customer managed key ID to use for the default
        # encryption. General purpose buckets - This parameter is allowed if and only if SSEAlgorithm is set
        # to aws:kms or aws:kms:dsse . Directory buckets - This parameter is allowed if and only if
        # SSEAlgorithm is set to aws:kms . You can specify the key ID, key alias, or the Amazon Resource Name
        # (ARN) of the KMS key. Key ID: 1234abcd-12ab-34cd-56ef-1234567890ab Key ARN:
        # arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab Key Alias:
        # alias/alias-name If you are using encryption with cross-account or Amazon Web Services service
        # operations, you must use a fully qualified KMS key ARN. For more information, see Using encryption
        # for cross-account operations . General purpose buckets - If you're specifying a customer managed KMS
        # key, we recommend using a fully qualified KMS key ARN. If you use a KMS key alias instead, then KMS
        # resolves the key within the requester’s account. This behavior can result in data that's encrypted
        # with a KMS key that belongs to the requester, and not the bucket owner. Also, if you use a key ID,
        # you can run into a LogDestination undeliverable error when creating a VPC flow log. Directory
        # buckets - When you specify an KMS customer managed key for encryption in your directory bucket, only
        # use the key ID or key ARN. The key alias format of the KMS key isn't supported. Amazon S3 only
        # supports symmetric encryption KMS keys. For more information, see Asymmetric keys in Amazon Web
        # Services KMS in the Amazon Web Services Key Management Service Developer Guide .

        @[JSON::Field(key: "KMSMasterKeyID")]
        getter kms_master_key_id : String?

        def initialize(
          @sse_algorithm : String,
          @kms_master_key_id : String? = nil
        )
        end
      end

      # Specifies the default server-side-encryption configuration.

      struct ServerSideEncryptionConfiguration
        include JSON::Serializable

        # Container for information about a particular server-side encryption configuration rule.

        @[JSON::Field(key: "Rule")]
        getter rules : Array(Types::ServerSideEncryptionRule)

        def initialize(
          @rules : Array(Types::ServerSideEncryptionRule)
        )
        end
      end

      # Specifies the default server-side encryption configuration. General purpose buckets - If you're
      # specifying a customer managed KMS key, we recommend using a fully qualified KMS key ARN. If you use
      # a KMS key alias instead, then KMS resolves the key within the requester’s account. This behavior can
      # result in data that's encrypted with a KMS key that belongs to the requester, and not the bucket
      # owner. Directory buckets - When you specify an KMS customer managed key for encryption in your
      # directory bucket, only use the key ID or key ARN. The key alias format of the KMS key isn't
      # supported.

      struct ServerSideEncryptionRule
        include JSON::Serializable

        # Specifies the default server-side encryption to apply to new objects in the bucket. If a PUT Object
        # request doesn't specify any server-side encryption, this default encryption will be applied.

        @[JSON::Field(key: "ApplyServerSideEncryptionByDefault")]
        getter apply_server_side_encryption_by_default : Types::ServerSideEncryptionByDefault?

        # A bucket-level setting for Amazon S3 general purpose buckets used to prevent the upload of new
        # objects encrypted with the specified server-side encryption type. For example, blocking an
        # encryption type will block PutObject , CopyObject , PostObject , multipart upload, and replication
        # requests to the bucket for objects with the specified encryption type. However, you can continue to
        # read and list any pre-existing objects already encrypted with the specified encryption type. For
        # more information, see Blocking or unblocking SSE-C for a general purpose bucket . Currently, this
        # parameter only supports blocking or unblocking server-side encryption with customer-provided keys
        # (SSE-C). For more information about SSE-C, see Using server-side encryption with customer-provided
        # keys (SSE-C) .

        @[JSON::Field(key: "BlockedEncryptionTypes")]
        getter blocked_encryption_types : Types::BlockedEncryptionTypes?

        # Specifies whether Amazon S3 should use an S3 Bucket Key with server-side encryption using KMS
        # (SSE-KMS) for new objects in the bucket. Existing objects are not affected. Setting the
        # BucketKeyEnabled element to true causes Amazon S3 to use an S3 Bucket Key. General purpose buckets -
        # By default, S3 Bucket Key is not enabled. For more information, see Amazon S3 Bucket Keys in the
        # Amazon S3 User Guide . Directory buckets - S3 Bucket Keys are always enabled for GET and PUT
        # operations in a directory bucket and can’t be disabled. S3 Bucket Keys aren't supported, when you
        # copy SSE-KMS encrypted objects from general purpose buckets to directory buckets, from directory
        # buckets to general purpose buckets, or between directory buckets, through CopyObject ,
        # UploadPartCopy , the Copy operation in Batch Operations , or the import jobs . In this case, Amazon
        # S3 makes a call to KMS every time a copy request is made for a KMS-encrypted object.

        @[JSON::Field(key: "BucketKeyEnabled")]
        getter bucket_key_enabled : Bool?

        def initialize(
          @apply_server_side_encryption_by_default : Types::ServerSideEncryptionByDefault? = nil,
          @blocked_encryption_types : Types::BlockedEncryptionTypes? = nil,
          @bucket_key_enabled : Bool? = nil
        )
        end
      end

      # The established temporary security credentials of the session. Directory buckets - These session
      # credentials are only supported for the authentication and authorization of Zonal endpoint API
      # operations on directory buckets.

      struct SessionCredentials
        include JSON::Serializable

        # A unique identifier that's associated with a secret access key. The access key ID and the secret
        # access key are used together to sign programmatic Amazon Web Services requests cryptographically.

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String

        # Temporary security credentials expire after a specified interval. After temporary credentials
        # expire, any calls that you make with those credentials will fail. So you must generate a new set of
        # temporary credentials. Temporary credentials cannot be extended or refreshed beyond the original
        # specified interval.

        @[JSON::Field(key: "Expiration")]
        getter expiration : Time

        # A key that's used with the access key ID to cryptographically sign programmatic Amazon Web Services
        # requests. Signing a request identifies the sender and prevents the request from being altered.

        @[JSON::Field(key: "SecretAccessKey")]
        getter secret_access_key : String

        # A part of the temporary security credentials. The session token is used to validate the temporary
        # security credentials.

        @[JSON::Field(key: "SessionToken")]
        getter session_token : String

        def initialize(
          @access_key_id : String,
          @expiration : Time,
          @secret_access_key : String,
          @session_token : String
        )
        end
      end

      # To use simple format for S3 keys for log objects, set SimplePrefix to an empty object.
      # [DestinationPrefix][YYYY]-[MM]-[DD]-[hh]-[mm]-[ss]-[UniqueString]

      struct SimplePrefix
        include JSON::Serializable

        def initialize
        end
      end

      # A container that describes additional filters for identifying the source objects that you want to
      # replicate. You can choose to enable or disable the replication of these objects. Currently, Amazon
      # S3 supports only the filter that you can specify for objects created with server-side encryption
      # using a customer managed key stored in Amazon Web Services Key Management Service (SSE-KMS).

      struct SourceSelectionCriteria
        include JSON::Serializable

        # A filter that you can specify for selections for modifications on replicas. Amazon S3 doesn't
        # replicate replica modifications by default. In the latest version of replication configuration (when
        # Filter is specified), you can specify this element and set the status to Enabled to replicate
        # modifications on replicas. If you don't specify the Filter element, Amazon S3 assumes that the
        # replication configuration is the earlier version, V1. In the earlier version, this element is not
        # allowed

        @[JSON::Field(key: "ReplicaModifications")]
        getter replica_modifications : Types::ReplicaModifications?

        # A container for filter information for the selection of Amazon S3 objects encrypted with Amazon Web
        # Services KMS. If you include SourceSelectionCriteria in the replication configuration, this element
        # is required.

        @[JSON::Field(key: "SseKmsEncryptedObjects")]
        getter sse_kms_encrypted_objects : Types::SseKmsEncryptedObjects?

        def initialize(
          @replica_modifications : Types::ReplicaModifications? = nil,
          @sse_kms_encrypted_objects : Types::SseKmsEncryptedObjects? = nil
        )
        end
      end

      # A container for filter information for the selection of S3 objects encrypted with Amazon Web
      # Services KMS.

      struct SseKmsEncryptedObjects
        include JSON::Serializable

        # Specifies whether Amazon S3 replicates objects created with server-side encryption using an Amazon
        # Web Services KMS key stored in Amazon Web Services Key Management Service.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Container for the stats details.

      struct Stats
        include JSON::Serializable

        # The total number of uncompressed object bytes processed.

        @[JSON::Field(key: "BytesProcessed")]
        getter bytes_processed : Int64?

        # The total number of bytes of records payload data returned.

        @[JSON::Field(key: "BytesReturned")]
        getter bytes_returned : Int64?

        # The total number of object bytes scanned.

        @[JSON::Field(key: "BytesScanned")]
        getter bytes_scanned : Int64?

        def initialize(
          @bytes_processed : Int64? = nil,
          @bytes_returned : Int64? = nil,
          @bytes_scanned : Int64? = nil
        )
        end
      end

      # Container for the Stats Event.

      struct StatsEvent
        include JSON::Serializable

        # The Stats event details.

        @[JSON::Field(key: "Details")]
        getter details : Types::Stats?

        def initialize(
          @details : Types::Stats? = nil
        )
        end
      end

      # Specifies data related to access patterns to be collected and made available to analyze the
      # tradeoffs between different storage classes for an Amazon S3 bucket.

      struct StorageClassAnalysis
        include JSON::Serializable

        # Specifies how data related to the storage class analysis for an Amazon S3 bucket should be exported.

        @[JSON::Field(key: "DataExport")]
        getter data_export : Types::StorageClassAnalysisDataExport?

        def initialize(
          @data_export : Types::StorageClassAnalysisDataExport? = nil
        )
        end
      end

      # Container for data related to the storage class analysis for an Amazon S3 bucket for export.

      struct StorageClassAnalysisDataExport
        include JSON::Serializable

        # The place to store the data for an analysis.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::AnalyticsExportDestination

        # The version of the output schema to use when exporting data. Must be V_1 .

        @[JSON::Field(key: "OutputSchemaVersion")]
        getter output_schema_version : String

        def initialize(
          @destination : Types::AnalyticsExportDestination,
          @output_schema_version : String
        )
        end
      end

      # A container of a key value name pair.

      struct Tag
        include JSON::Serializable

        # Name of the object key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Value of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Container for TagSet elements.

      struct Tagging
        include JSON::Serializable

        # A collection for a set of tags

        @[JSON::Field(key: "TagSet")]
        getter tag_set : Array(Types::Tag)

        def initialize(
          @tag_set : Array(Types::Tag)
        )
        end
      end

      # Container for granting information. Buckets that use the bucket owner enforced setting for Object
      # Ownership don't support target grants. For more information, see Permissions server access log
      # delivery in the Amazon S3 User Guide .

      struct TargetGrant
        include JSON::Serializable

        # Container for the person being granted permissions.

        @[JSON::Field(key: "Grantee")]
        getter grantee : Types::Grantee?

        # Logging permissions assigned to the grantee for the bucket.

        @[JSON::Field(key: "Permission")]
        getter permission : String?

        def initialize(
          @grantee : Types::Grantee? = nil,
          @permission : String? = nil
        )
        end
      end

      # Amazon S3 key format for log objects. Only one format, PartitionedPrefix or SimplePrefix, is
      # allowed.

      struct TargetObjectKeyFormat
        include JSON::Serializable

        # Partitioned S3 key for log objects.

        @[JSON::Field(key: "PartitionedPrefix")]
        getter partitioned_prefix : Types::PartitionedPrefix?

        # To use the simple format for S3 keys for log objects. To specify SimplePrefix format, set
        # SimplePrefix to {}.

        @[JSON::Field(key: "SimplePrefix")]
        getter simple_prefix : Types::SimplePrefix?

        def initialize(
          @partitioned_prefix : Types::PartitionedPrefix? = nil,
          @simple_prefix : Types::SimplePrefix? = nil
        )
        end
      end

      # The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically
      # moving data to the most cost-effective storage access tier, without additional operational overhead.

      struct Tiering
        include JSON::Serializable

        # S3 Intelligent-Tiering access tier. See Storage class for automatically optimizing frequently and
        # infrequently accessed objects for a list of access tiers in the S3 Intelligent-Tiering storage
        # class.

        @[JSON::Field(key: "AccessTier")]
        getter access_tier : String

        # The number of consecutive days of no access after which an object will be eligible to be
        # transitioned to the corresponding tier. The minimum number of days specified for Archive Access tier
        # must be at least 90 days and Deep Archive Access tier must be at least 180 days. The maximum can be
        # up to 2 years (730 days).

        @[JSON::Field(key: "Days")]
        getter days : Int32

        def initialize(
          @access_tier : String,
          @days : Int32
        )
        end
      end

      # You have attempted to add more parts than the maximum of 10000 that are allowed for this object. You
      # can use the CopyObject operation to copy this object to another and then add more data to the newly
      # copied object.

      struct TooManyParts
        include JSON::Serializable

        def initialize
        end
      end

      # A container for specifying the configuration for publication of messages to an Amazon Simple
      # Notification Service (Amazon SNS) topic when Amazon S3 detects specified events.

      struct TopicConfiguration
        include JSON::Serializable

        # The Amazon S3 bucket event about which to send notifications. For more information, see Supported
        # Event Types in the Amazon S3 User Guide .

        @[JSON::Field(key: "Event")]
        getter events : Array(String)

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to which Amazon S3 publishes a message when
        # it detects events of the specified type.

        @[JSON::Field(key: "Topic")]
        getter topic_arn : String


        @[JSON::Field(key: "Filter")]
        getter filter : Types::NotificationConfigurationFilter?


        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @events : Array(String),
          @topic_arn : String,
          @filter : Types::NotificationConfigurationFilter? = nil,
          @id : String? = nil
        )
        end
      end

      # A container for specifying the configuration for publication of messages to an Amazon Simple
      # Notification Service (Amazon SNS) topic when Amazon S3 detects specified events. This data type is
      # deprecated. Use TopicConfiguration instead.

      struct TopicConfigurationDeprecated
        include JSON::Serializable

        # Bucket event for which to send notifications.

        @[JSON::Field(key: "Event")]
        getter event : String?

        # A collection of events related to objects

        @[JSON::Field(key: "Event")]
        getter events : Array(String)?


        @[JSON::Field(key: "Id")]
        getter id : String?

        # Amazon SNS topic to which Amazon S3 will publish a message to report the specified events for the
        # bucket.

        @[JSON::Field(key: "Topic")]
        getter topic : String?

        def initialize(
          @event : String? = nil,
          @events : Array(String)? = nil,
          @id : String? = nil,
          @topic : String? = nil
        )
        end
      end

      # Specifies when an object transitions to a specified storage class. For more information about Amazon
      # S3 lifecycle configuration rules, see Transitioning Objects Using Amazon S3 Lifecycle in the Amazon
      # S3 User Guide .

      struct Transition
        include JSON::Serializable

        # Indicates when objects are transitioned to the specified storage class. The date value must be in
        # ISO 8601 format. The time is always midnight UTC.

        @[JSON::Field(key: "Date")]
        getter date : Time?

        # Indicates the number of days after creation when objects are transitioned to the specified storage
        # class. If the specified storage class is INTELLIGENT_TIERING , GLACIER_IR , GLACIER , or
        # DEEP_ARCHIVE , valid values are 0 or positive integers. If the specified storage class is
        # STANDARD_IA or ONEZONE_IA , valid values are positive integers greater than 30 . Be aware that some
        # storage classes have a minimum storage duration and that you're charged for transitioning objects
        # before their minimum storage duration. For more information, see Constraints and considerations for
        # transitions in the Amazon S3 User Guide .

        @[JSON::Field(key: "Days")]
        getter days : Int32?

        # The storage class to which you want the object to transition.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @date : Time? = nil,
          @days : Int32? = nil,
          @storage_class : String? = nil
        )
        end
      end


      struct UpdateBucketMetadataInventoryTableConfigurationRequest
        include JSON::Serializable

        # The general purpose bucket that corresponds to the metadata configuration that you want to enable or
        # disable an inventory table for.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The contents of your inventory table configuration.

        @[JSON::Field(key: "InventoryTableConfiguration")]
        getter inventory_table_configuration : Types::InventoryTableConfigurationUpdates

        # The checksum algorithm to use with your inventory table configuration.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Content-MD5 header for the inventory table configuration.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The expected owner of the general purpose bucket that corresponds to the metadata table
        # configuration that you want to enable or disable an inventory table for.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @inventory_table_configuration : Types::InventoryTableConfigurationUpdates,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct UpdateBucketMetadataJournalTableConfigurationRequest
        include JSON::Serializable

        # The general purpose bucket that corresponds to the metadata configuration that you want to enable or
        # disable journal table record expiration for.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The contents of your journal table configuration.

        @[JSON::Field(key: "JournalTableConfiguration")]
        getter journal_table_configuration : Types::JournalTableConfigurationUpdates

        # The checksum algorithm to use with your journal table configuration.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # The Content-MD5 header for the journal table configuration.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The expected owner of the general purpose bucket that corresponds to the metadata table
        # configuration that you want to enable or disable journal table record expiration for.

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        def initialize(
          @bucket : String,
          @journal_table_configuration : Types::JournalTableConfigurationUpdates,
          @checksum_algorithm : String? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil
        )
        end
      end


      struct UploadPartCopyOutput
        include JSON::Serializable

        # Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with Key
        # Management Service (KMS) keys (SSE-KMS).

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # Container for all response elements.

        @[JSON::Field(key: "CopyPartResult")]
        getter copy_part_result : Types::CopyPartResult?

        # The version of the source object that was copied, if you have enabled versioning on the source
        # bucket. This functionality is not supported when the source object is in a directory bucket.

        @[JSON::Field(key: "x-amz-copy-source-version-id")]
        getter copy_source_version_id : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to confirm the encryption algorithm that's used. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to provide the round-trip message integrity verification of the
        # customer-provided encryption key. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # If present, indicates the ID of the KMS key that was used for object encryption.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
        # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid server
        # side encryption option is aws:fsx .

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        def initialize(
          @bucket_key_enabled : Bool? = nil,
          @copy_part_result : Types::CopyPartResult? = nil,
          @copy_source_version_id : String? = nil,
          @request_charged : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil
        )
        end
      end


      struct UploadPartCopyRequest
        include JSON::Serializable

        # The bucket name. Directory buckets - When you use this operation with a directory bucket, you must
        # use virtual-hosted-style requests in the format Bucket-name .s3express- zone-id . region-code
        # .amazonaws.com . Path-style requests are not supported. Directory bucket names must be unique in the
        # chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format bucket-base-name
        # -- zone-id --x-s3 (for example, amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about
        # bucket naming restrictions, see Directory bucket naming rules in the Amazon S3 User Guide . Copying
        # objects across different Amazon Web Services Regions isn't supported when the source or destination
        # bucket is in Amazon Web Services Local Zones. The source and destination buckets must have the same
        # parent Amazon Web Services Region. Otherwise, you get an HTTP 400 Bad Request error with the error
        # code InvalidRequest . Access points - When you use this action with an access point for general
        # purpose buckets, you must provide the alias of the access point in place of the bucket name or
        # specify the access point ARN. When you use this action with an access point for directory buckets,
        # you must provide the access point name in place of the bucket name. When using the access point ARN,
        # you must direct requests to the access point hostname. The access point hostname takes the form
        # AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com. When using this action with an
        # access point through the Amazon Web Services SDKs, you provide the access point ARN in place of the
        # bucket name. For more information about access point ARNs, see Using access points in the Amazon S3
        # User Guide . Object Lambda access points are not supported by directory buckets. S3 on Outposts -
        # When you use this action with S3 on Outposts, you must direct requests to the S3 on Outposts
        # hostname. The S3 on Outposts hostname takes the form AccessPointName - AccountId . outpostID
        # .s3-outposts. Region .amazonaws.com . When you use this action with S3 on Outposts, the destination
        # bucket must be the Outposts access point ARN or the access point alias. For more information about
        # S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Specifies the source object for the copy operation. You specify the value in one of two formats,
        # depending on whether you want to access the source object through an access point : For objects not
        # accessed through an access point, specify the name of the source bucket and key of the source
        # object, separated by a slash (/). For example, to copy the object reports/january.pdf from the
        # bucket awsexamplebucket , use awsexamplebucket/reports/january.pdf . The value must be URL-encoded.
        # For objects accessed through access points, specify the Amazon Resource Name (ARN) of the object as
        # accessed through the access point, in the format
        # arn:aws:s3:&lt;Region&gt;:&lt;account-id&gt;:accesspoint/&lt;access-point-name&gt;/object/&lt;key&gt;
        # . For example, to copy the object reports/january.pdf through access point my-access-point owned by
        # account 123456789012 in Region us-west-2 , use the URL encoding of
        # arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf . The value
        # must be URL encoded. Amazon S3 supports copy operations using Access points only when the source and
        # destination buckets are in the same Amazon Web Services Region. Access points are not supported by
        # directory buckets. Alternatively, for objects accessed through Amazon S3 on Outposts, specify the
        # ARN of the object as accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/object/&lt;key&gt;
        # . For example, to copy the object reports/january.pdf through outpost my-outpost owned by account
        # 123456789012 in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf . The value
        # must be URL-encoded. If your bucket has versioning enabled, you could have multiple versions of the
        # same object. By default, x-amz-copy-source identifies the current version of the source object to
        # copy. To copy a specific version of the source object to copy, append ?versionId=&lt;version-id&gt;
        # to the x-amz-copy-source request header (for example, x-amz-copy-source:
        # /awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893 ). If the
        # current version is a delete marker and you don't specify a versionId in the x-amz-copy-source
        # request header, Amazon S3 returns a 404 Not Found error, because the object does not exist. If you
        # specify versionId in the x-amz-copy-source and the versionId is a delete marker, Amazon S3 returns
        # an HTTP 400 Bad Request error, because you are not allowed to specify a delete marker as a version
        # for the x-amz-copy-source . Directory buckets - S3 Versioning isn't enabled and supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-copy-source")]
        getter copy_source : String

        # Object key for which the multipart upload was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Part number of part being copied. This is a positive integer between 1 and 10,000.

        @[JSON::Field(key: "partNumber")]
        getter part_number : Int32

        # Upload ID identifying the multipart upload whose part is being copied.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # Copies the object if its entity tag (ETag) matches the specified tag. If both of the
        # x-amz-copy-source-if-match and x-amz-copy-source-if-unmodified-since headers are present in the
        # request as follows: x-amz-copy-source-if-match condition evaluates to true , and;
        # x-amz-copy-source-if-unmodified-since condition evaluates to false ; Amazon S3 returns 200 OK and
        # copies the data.

        @[JSON::Field(key: "x-amz-copy-source-if-match")]
        getter copy_source_if_match : String?

        # Copies the object if it has been modified since the specified time. If both of the
        # x-amz-copy-source-if-none-match and x-amz-copy-source-if-modified-since headers are present in the
        # request as follows: x-amz-copy-source-if-none-match condition evaluates to false , and;
        # x-amz-copy-source-if-modified-since condition evaluates to true ; Amazon S3 returns 412 Precondition
        # Failed response code.

        @[JSON::Field(key: "x-amz-copy-source-if-modified-since")]
        getter copy_source_if_modified_since : Time?

        # Copies the object if its entity tag (ETag) is different than the specified ETag. If both of the
        # x-amz-copy-source-if-none-match and x-amz-copy-source-if-modified-since headers are present in the
        # request as follows: x-amz-copy-source-if-none-match condition evaluates to false , and;
        # x-amz-copy-source-if-modified-since condition evaluates to true ; Amazon S3 returns 412 Precondition
        # Failed response code.

        @[JSON::Field(key: "x-amz-copy-source-if-none-match")]
        getter copy_source_if_none_match : String?

        # Copies the object if it hasn't been modified since the specified time. If both of the
        # x-amz-copy-source-if-match and x-amz-copy-source-if-unmodified-since headers are present in the
        # request as follows: x-amz-copy-source-if-match condition evaluates to true , and;
        # x-amz-copy-source-if-unmodified-since condition evaluates to false ; Amazon S3 returns 200 OK and
        # copies the data.

        @[JSON::Field(key: "x-amz-copy-source-if-unmodified-since")]
        getter copy_source_if_unmodified_since : Time?

        # The range of bytes to copy from the source object. The range value must use the form
        # bytes=first-last, where the first and last are the zero-based byte offsets to copy. For example,
        # bytes=0-9 indicates that you want to copy the first 10 bytes of the source. You can copy a range
        # only if the source object is greater than 5 MB.

        @[JSON::Field(key: "x-amz-copy-source-range")]
        getter copy_source_range : String?

        # Specifies the algorithm to use when decrypting the source object (for example, AES256 ). This
        # functionality is not supported when the source object is in a directory bucket.

        @[JSON::Field(key: "x-amz-copy-source-server-side-encryption-customer-algorithm")]
        getter copy_source_sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object.
        # The encryption key provided in this header must be one that was used when the source object was
        # created. This functionality is not supported when the source object is in a directory bucket.

        @[JSON::Field(key: "x-amz-copy-source-server-side-encryption-customer-key")]
        getter copy_source_sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this
        # header for a message integrity check to ensure that the encryption key was transmitted without
        # error. This functionality is not supported when the source object is in a directory bucket.

        @[JSON::Field(key: "x-amz-copy-source-server-side-encryption-customer-key-MD5")]
        getter copy_source_sse_customer_key_md5 : String?

        # The account ID of the expected destination bucket owner. If the account ID that you provide does not
        # match the actual owner of the destination bucket, the request fails with the HTTP status code 403
        # Forbidden (access denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?

        # The account ID of the expected source bucket owner. If the account ID that you provide does not
        # match the actual owner of the source bucket, the request fails with the HTTP status code 403
        # Forbidden (access denied).

        @[JSON::Field(key: "x-amz-source-expected-bucket-owner")]
        getter expected_source_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Specifies the algorithm to use when encrypting the object (for example, AES256). This functionality
        # is not supported when the destination bucket is a directory bucket.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value
        # is used to store the object and then it is discarded; Amazon S3 does not store the encryption key.
        # The key must be appropriate for use with the algorithm specified in the
        # x-amz-server-side-encryption-customer-algorithm header. This must be the same encryption key
        # specified in the initiate multipart upload request. This functionality is not supported when the
        # destination bucket is a directory bucket.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this
        # header for a message integrity check to ensure that the encryption key was transmitted without
        # error. This functionality is not supported when the destination bucket is a directory bucket.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        def initialize(
          @bucket : String,
          @copy_source : String,
          @key : String,
          @part_number : Int32,
          @upload_id : String,
          @copy_source_if_match : String? = nil,
          @copy_source_if_modified_since : Time? = nil,
          @copy_source_if_none_match : String? = nil,
          @copy_source_if_unmodified_since : Time? = nil,
          @copy_source_range : String? = nil,
          @copy_source_sse_customer_algorithm : String? = nil,
          @copy_source_sse_customer_key : String? = nil,
          @copy_source_sse_customer_key_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @expected_source_bucket_owner : String? = nil,
          @request_payer : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil
        )
        end
      end


      struct UploadPartOutput
        include JSON::Serializable

        # Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with Key
        # Management Service (KMS) keys (SSE-KMS).

        @[JSON::Field(key: "x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # The Base64 encoded, 32-bit CRC32 checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32")]
        getter checksum_crc32 : String?

        # The Base64 encoded, 32-bit CRC32C checksum of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32c")]
        getter checksum_crc32_c : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 64-bit CRC64NVME checksum of the
        # part. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc64nvme")]
        getter checksum_crc64_nvme : String?

        # The Base64 encoded, 160-bit SHA1 digest of the object. This checksum is only present if the checksum
        # was uploaded with the object. When you use the API operation on an object that was uploaded using
        # multipart uploads, this value may not be a direct checksum value of the full object. Instead, it's a
        # calculation based on the checksum values of each individual part. For more information about how
        # checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3 User
        # Guide .

        @[JSON::Field(key: "x-amz-checksum-sha1")]
        getter checksum_sha1 : String?

        # The Base64 encoded, 256-bit SHA256 digest of the object. This checksum is only present if the
        # checksum was uploaded with the object. When you use an API operation on an object that was uploaded
        # using multipart uploads, this value may not be a direct checksum value of the full object. Instead,
        # it's a calculation based on the checksum values of each individual part. For more information about
        # how checksums are calculated with multipart uploads, see Checking object integrity in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha256")]
        getter checksum_sha256 : String?

        # Entity tag for the uploaded object.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?


        @[JSON::Field(key: "x-amz-request-charged")]
        getter request_charged : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to confirm the encryption algorithm that's used. This functionality is not
        # supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # If server-side encryption with a customer-provided encryption key was requested, the response will
        # include this header to provide the round-trip message integrity verification of the
        # customer-provided encryption key. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # If present, indicates the ID of the KMS key that was used for object encryption.

        @[JSON::Field(key: "x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
        # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid server
        # side encryption option is aws:fsx .

        @[JSON::Field(key: "x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        def initialize(
          @bucket_key_enabled : Bool? = nil,
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @e_tag : String? = nil,
          @request_charged : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil
        )
        end
      end


      struct UploadPartRequest
        include JSON::Serializable

        # The name of the bucket to which the multipart upload was initiated. Directory buckets - When you use
        # this operation with a directory bucket, you must use virtual-hosted-style requests in the format
        # Bucket-name .s3express- zone-id . region-code .amazonaws.com . Path-style requests are not
        # supported. Directory bucket names must be unique in the chosen Zone (Availability Zone or Local
        # Zone). Bucket names must follow the format bucket-base-name -- zone-id --x-s3 (for example,
        # amzn-s3-demo-bucket -- usw2-az1 --x-s3 ). For information about bucket naming restrictions, see
        # Directory bucket naming rules in the Amazon S3 User Guide . Access points - When you use this action
        # with an access point for general purpose buckets, you must provide the alias of the access point in
        # place of the bucket name or specify the access point ARN. When you use this action with an access
        # point for directory buckets, you must provide the access point name in place of the bucket name.
        # When using the access point ARN, you must direct requests to the access point hostname. The access
        # point hostname takes the form AccessPointName - AccountId .s3-accesspoint. Region .amazonaws.com.
        # When using this action with an access point through the Amazon Web Services SDKs, you provide the
        # access point ARN in place of the bucket name. For more information about access point ARNs, see
        # Using access points in the Amazon S3 User Guide . Object Lambda access points are not supported by
        # directory buckets. S3 on Outposts - When you use this action with S3 on Outposts, you must direct
        # requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form AccessPointName
        # - AccountId . outpostID .s3-outposts. Region .amazonaws.com . When you use this action with S3 on
        # Outposts, the destination bucket must be the Outposts access point ARN or the access point alias.
        # For more information about S3 on Outposts, see What is S3 on Outposts? in the Amazon S3 User Guide .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Object key for which the multipart upload was initiated.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Part number of part being uploaded. This is a positive integer between 1 and 10,000.

        @[JSON::Field(key: "partNumber")]
        getter part_number : Int32

        # Upload ID identifying the multipart upload whose part is being uploaded.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # Object data.

        @[JSON::Field(key: "Body")]
        getter body : Bytes?

        # Indicates the algorithm used to create the checksum for the object when you use the SDK. This header
        # will not provide any additional functionality if you don't use the SDK. When you send this header,
        # there must be a corresponding x-amz-checksum or x-amz-trailer header sent. Otherwise, Amazon S3
        # fails the request with the HTTP status code 400 Bad Request . For more information, see Checking
        # object integrity in the Amazon S3 User Guide . If you provide an individual checksum, Amazon S3
        # ignores any provided ChecksumAlgorithm parameter. This checksum algorithm must be the same for all
        # parts and it match the checksum value supplied in the CreateMultipartUpload request.

        @[JSON::Field(key: "x-amz-sdk-checksum-algorithm")]
        getter checksum_algorithm : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 32-bit CRC32 checksum of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32")]
        getter checksum_crc32 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 32-bit CRC32C checksum of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc32c")]
        getter checksum_crc32_c : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 64-bit CRC64NVME checksum of the
        # part. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-crc64nvme")]
        getter checksum_crc64_nvme : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 160-bit SHA1 digest of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha1")]
        getter checksum_sha1 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 256-bit SHA256 digest of the
        # object. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-checksum-sha256")]
        getter checksum_sha256 : String?

        # Size of the body in bytes. This parameter is useful when the size of the body cannot be determined
        # automatically.

        @[JSON::Field(key: "Content-Length")]
        getter content_length : Int64?

        # The Base64 encoded 128-bit MD5 digest of the part data. This parameter is auto-populated when using
        # the command from the CLI. This parameter is required if object lock parameters are specified. This
        # functionality is not supported for directory buckets.

        @[JSON::Field(key: "Content-MD5")]
        getter content_md5 : String?

        # The account ID of the expected bucket owner. If the account ID that you provide does not match the
        # actual owner of the bucket, the request fails with the HTTP status code 403 Forbidden (access
        # denied).

        @[JSON::Field(key: "x-amz-expected-bucket-owner")]
        getter expected_bucket_owner : String?


        @[JSON::Field(key: "x-amz-request-payer")]
        getter request_payer : String?

        # Specifies the algorithm to use when encrypting the object (for example, AES256). This functionality
        # is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value
        # is used to store the object and then it is discarded; Amazon S3 does not store the encryption key.
        # The key must be appropriate for use with the algorithm specified in the
        # x-amz-server-side-encryption-customer-algorithm header . This must be the same encryption key
        # specified in the initiate multipart upload request. This functionality is not supported for
        # directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key")]
        getter sse_customer_key : String?

        # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this
        # header for a message integrity check to ensure that the encryption key was transmitted without
        # error. This functionality is not supported for directory buckets.

        @[JSON::Field(key: "x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        def initialize(
          @bucket : String,
          @key : String,
          @part_number : Int32,
          @upload_id : String,
          @body : Bytes? = nil,
          @checksum_algorithm : String? = nil,
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @content_length : Int64? = nil,
          @content_md5 : String? = nil,
          @expected_bucket_owner : String? = nil,
          @request_payer : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key : String? = nil,
          @sse_customer_key_md5 : String? = nil
        )
        end
      end

      # Describes the versioning state of an Amazon S3 bucket. For more information, see PUT Bucket
      # versioning in the Amazon S3 API Reference .

      struct VersioningConfiguration
        include JSON::Serializable

        # Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is only
        # returned if the bucket has been configured with MFA delete. If the bucket has never been so
        # configured, this element is not returned.

        @[JSON::Field(key: "MfaDelete")]
        getter mfa_delete : String?

        # The versioning state of the bucket.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @mfa_delete : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies website configuration parameters for an Amazon S3 bucket.

      struct WebsiteConfiguration
        include JSON::Serializable

        # The name of the error document for the website.

        @[JSON::Field(key: "ErrorDocument")]
        getter error_document : Types::ErrorDocument?

        # The name of the index document for the website.

        @[JSON::Field(key: "IndexDocument")]
        getter index_document : Types::IndexDocument?

        # The redirect behavior for every request to this bucket's website endpoint. If you specify this
        # property, you can't specify any other property.

        @[JSON::Field(key: "RedirectAllRequestsTo")]
        getter redirect_all_requests_to : Types::RedirectAllRequestsTo?

        # Rules that define when a redirect is applied and the redirect behavior.

        @[JSON::Field(key: "RoutingRules")]
        getter routing_rules : Array(Types::RoutingRule)?

        def initialize(
          @error_document : Types::ErrorDocument? = nil,
          @index_document : Types::IndexDocument? = nil,
          @redirect_all_requests_to : Types::RedirectAllRequestsTo? = nil,
          @routing_rules : Array(Types::RoutingRule)? = nil
        )
        end
      end


      struct WriteGetObjectResponseRequest
        include JSON::Serializable

        # Route prefix to the HTTP URL generated.

        @[JSON::Field(key: "x-amz-request-route")]
        getter request_route : String

        # A single use encrypted token that maps WriteGetObjectResponse to the end user GetObject request.

        @[JSON::Field(key: "x-amz-request-token")]
        getter request_token : String

        # Indicates that a range of bytes was specified.

        @[JSON::Field(key: "x-amz-fwd-header-accept-ranges")]
        getter accept_ranges : String?

        # The object data.

        @[JSON::Field(key: "Body")]
        getter body : Bytes?

        # Indicates whether the object stored in Amazon S3 uses an S3 bucket key for server-side encryption
        # with Amazon Web Services KMS (SSE-KMS).

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-server-side-encryption-bucket-key-enabled")]
        getter bucket_key_enabled : Bool?

        # Specifies caching behavior along the request/reply chain.

        @[JSON::Field(key: "x-amz-fwd-header-Cache-Control")]
        getter cache_control : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This specifies the Base64 encoded, 32-bit CRC32 checksum of the object
        # returned by the Object Lambda function. This may not match the checksum for the object stored in
        # Amazon S3. Amazon S3 will perform validation of the checksum values only when the original GetObject
        # request required checksum validation. For more information about checksums, see Checking object
        # integrity in the Amazon S3 User Guide . Only one checksum header can be specified at a time. If you
        # supply multiple checksum headers, this request will fail.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-checksum-crc32")]
        getter checksum_crc32 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This specifies the Base64 encoded, 32-bit CRC32C checksum of the object
        # returned by the Object Lambda function. This may not match the checksum for the object stored in
        # Amazon S3. Amazon S3 will perform validation of the checksum values only when the original GetObject
        # request required checksum validation. For more information about checksums, see Checking object
        # integrity in the Amazon S3 User Guide . Only one checksum header can be specified at a time. If you
        # supply multiple checksum headers, this request will fail.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-checksum-crc32c")]
        getter checksum_crc32_c : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This header specifies the Base64 encoded, 64-bit CRC64NVME checksum of the
        # part. For more information, see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-checksum-crc64nvme")]
        getter checksum_crc64_nvme : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This specifies the Base64 encoded, 160-bit SHA1 digest of the object
        # returned by the Object Lambda function. This may not match the checksum for the object stored in
        # Amazon S3. Amazon S3 will perform validation of the checksum values only when the original GetObject
        # request required checksum validation. For more information about checksums, see Checking object
        # integrity in the Amazon S3 User Guide . Only one checksum header can be specified at a time. If you
        # supply multiple checksum headers, this request will fail.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-checksum-sha1")]
        getter checksum_sha1 : String?

        # This header can be used as a data integrity check to verify that the data received is the same data
        # that was originally sent. This specifies the Base64 encoded, 256-bit SHA256 digest of the object
        # returned by the Object Lambda function. This may not match the checksum for the object stored in
        # Amazon S3. Amazon S3 will perform validation of the checksum values only when the original GetObject
        # request required checksum validation. For more information about checksums, see Checking object
        # integrity in the Amazon S3 User Guide . Only one checksum header can be specified at a time. If you
        # supply multiple checksum headers, this request will fail.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-checksum-sha256")]
        getter checksum_sha256 : String?

        # Specifies presentational information for the object.

        @[JSON::Field(key: "x-amz-fwd-header-Content-Disposition")]
        getter content_disposition : String?

        # Specifies what content encodings have been applied to the object and thus what decoding mechanisms
        # must be applied to obtain the media-type referenced by the Content-Type header field.

        @[JSON::Field(key: "x-amz-fwd-header-Content-Encoding")]
        getter content_encoding : String?

        # The language the content is in.

        @[JSON::Field(key: "x-amz-fwd-header-Content-Language")]
        getter content_language : String?

        # The size of the content body in bytes.

        @[JSON::Field(key: "Content-Length")]
        getter content_length : Int64?

        # The portion of the object returned in the response.

        @[JSON::Field(key: "x-amz-fwd-header-Content-Range")]
        getter content_range : String?

        # A standard MIME type describing the format of the object data.

        @[JSON::Field(key: "x-amz-fwd-header-Content-Type")]
        getter content_type : String?

        # Specifies whether an object stored in Amazon S3 is ( true ) or is not ( false ) a delete marker. To
        # learn more about delete markers, see Working with delete markers .

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-delete-marker")]
        getter delete_marker : Bool?

        # An opaque identifier assigned by a web server to a specific version of a resource found at a URL.

        @[JSON::Field(key: "x-amz-fwd-header-ETag")]
        getter e_tag : String?

        # A string that uniquely identifies an error condition. Returned in the &lt;Code&gt; tag of the error
        # XML response for a corresponding GetObject call. Cannot be used with a successful StatusCode header
        # or when the transformed object is provided in the body. All error codes from S3 are sentence-cased.
        # The regular expression (regex) value is "^[A-Z][a-zA-Z]+$" .

        @[JSON::Field(key: "x-amz-fwd-error-code")]
        getter error_code : String?

        # Contains a generic description of the error condition. Returned in the &lt;Message&gt; tag of the
        # error XML response for a corresponding GetObject call. Cannot be used with a successful StatusCode
        # header or when the transformed object is provided in body.

        @[JSON::Field(key: "x-amz-fwd-error-message")]
        getter error_message : String?

        # If the object expiration is configured (see PUT Bucket lifecycle), the response includes this
        # header. It includes the expiry-date and rule-id key-value pairs that provide the object expiration
        # information. The value of the rule-id is URL-encoded.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-expiration")]
        getter expiration : String?

        # The date and time at which the object is no longer cacheable.

        @[JSON::Field(key: "x-amz-fwd-header-Expires")]
        getter expires : String?

        # The date and time that the object was last modified.

        @[JSON::Field(key: "x-amz-fwd-header-Last-Modified")]
        getter last_modified : Time?

        # A map of metadata to store with the object in S3.

        @[JSON::Field(key: "x-amz-meta-")]
        getter metadata : Hash(String, String)?

        # Set to the number of metadata entries not returned in x-amz-meta headers. This can happen if you
        # create metadata using an API like SOAP that supports more flexible metadata than the REST API. For
        # example, using SOAP, you can create metadata whose values are not legal HTTP headers.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-missing-meta")]
        getter missing_meta : Int32?

        # Indicates whether an object stored in Amazon S3 has an active legal hold.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-object-lock-legal-hold")]
        getter object_lock_legal_hold_status : String?

        # Indicates whether an object stored in Amazon S3 has Object Lock enabled. For more information about
        # S3 Object Lock, see Object Lock .

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-object-lock-mode")]
        getter object_lock_mode : String?

        # The date and time when Object Lock is configured to expire.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-object-lock-retain-until-date")]
        getter object_lock_retain_until_date : Time?

        # The count of parts this object has.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-mp-parts-count")]
        getter parts_count : Int32?

        # Indicates if request involves bucket that is either a source or destination in a Replication rule.
        # For more information about S3 Replication, see Replication .

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-replication-status")]
        getter replication_status : String?


        @[JSON::Field(key: "x-amz-fwd-header-x-amz-request-charged")]
        getter request_charged : String?

        # Provides information about object restoration operation and expiration time of the restored object
        # copy.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-restore")]
        getter restore : String?

        # Encryption algorithm used if server-side encryption with a customer-provided encryption key was
        # specified for object stored in Amazon S3.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-server-side-encryption-customer-algorithm")]
        getter sse_customer_algorithm : String?

        # 128-bit MD5 digest of customer-provided encryption key used in Amazon S3 to encrypt data stored in
        # S3. For more information, see Protecting data using server-side encryption with customer-provided
        # encryption keys (SSE-C) .

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-server-side-encryption-customer-key-MD5")]
        getter sse_customer_key_md5 : String?

        # If present, specifies the ID (Key ID, Key ARN, or Key Alias) of the Amazon Web Services Key
        # Management Service (Amazon Web Services KMS) symmetric encryption customer managed key that was used
        # for stored in Amazon S3 object.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-server-side-encryption-aws-kms-key-id")]
        getter ssekms_key_id : String?

        # The server-side encryption algorithm used when storing requested object in Amazon S3 or Amazon FSx.
        # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid server
        # side encryption option is aws:fsx .

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-server-side-encryption")]
        getter server_side_encryption : String?

        # The integer status code for an HTTP response of a corresponding GetObject request. The following is
        # a list of status codes. 200 - OK 206 - Partial Content 304 - Not Modified 400 - Bad Request 401 -
        # Unauthorized 403 - Forbidden 404 - Not Found 405 - Method Not Allowed 409 - Conflict 411 - Length
        # Required 412 - Precondition Failed 416 - Range Not Satisfiable 500 - Internal Server Error 503 -
        # Service Unavailable

        @[JSON::Field(key: "x-amz-fwd-status")]
        getter status_code : Int32?

        # Provides storage class information of the object. Amazon S3 returns this header for all objects
        # except for S3 Standard storage class objects. For more information, see Storage Classes .

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-storage-class")]
        getter storage_class : String?

        # The number of tags, if any, on the object.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-tagging-count")]
        getter tag_count : Int32?

        # An ID used to reference a specific version of the object.

        @[JSON::Field(key: "x-amz-fwd-header-x-amz-version-id")]
        getter version_id : String?

        def initialize(
          @request_route : String,
          @request_token : String,
          @accept_ranges : String? = nil,
          @body : Bytes? = nil,
          @bucket_key_enabled : Bool? = nil,
          @cache_control : String? = nil,
          @checksum_crc32 : String? = nil,
          @checksum_crc32_c : String? = nil,
          @checksum_crc64_nvme : String? = nil,
          @checksum_sha1 : String? = nil,
          @checksum_sha256 : String? = nil,
          @content_disposition : String? = nil,
          @content_encoding : String? = nil,
          @content_language : String? = nil,
          @content_length : Int64? = nil,
          @content_range : String? = nil,
          @content_type : String? = nil,
          @delete_marker : Bool? = nil,
          @e_tag : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @expiration : String? = nil,
          @expires : String? = nil,
          @last_modified : Time? = nil,
          @metadata : Hash(String, String)? = nil,
          @missing_meta : Int32? = nil,
          @object_lock_legal_hold_status : String? = nil,
          @object_lock_mode : String? = nil,
          @object_lock_retain_until_date : Time? = nil,
          @parts_count : Int32? = nil,
          @replication_status : String? = nil,
          @request_charged : String? = nil,
          @restore : String? = nil,
          @sse_customer_algorithm : String? = nil,
          @sse_customer_key_md5 : String? = nil,
          @ssekms_key_id : String? = nil,
          @server_side_encryption : String? = nil,
          @status_code : Int32? = nil,
          @storage_class : String? = nil,
          @tag_count : Int32? = nil,
          @version_id : String? = nil
        )
        end
      end
    end
  end
end
