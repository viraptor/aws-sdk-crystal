require "json"
require "time"

module AwsSdk
  module Macie2
    module Types

      # Specifies an Amazon Macie membership invitation to accept. In the request, you have to specify the
      # ID for the Amazon Web Services account that sent the invitation. Otherwise, a validation error
      # occurs. To specify this ID, we recommend that you use the administratorAccountId property instead of
      # the masterAccount property. The masterAccount property has been deprecated and is retained only for
      # backward compatibility.

      struct AcceptInvitationRequest
        include JSON::Serializable


        @[JSON::Field(key: "invitationId")]
        getter invitation_id : String


        @[JSON::Field(key: "administratorAccountId")]
        getter administrator_account_id : String?


        @[JSON::Field(key: "masterAccount")]
        getter master_account : String?

        def initialize(
          @invitation_id : String,
          @administrator_account_id : String? = nil,
          @master_account : String? = nil
        )
        end
      end


      struct AcceptInvitationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about the permissions settings of the bucket-level access control list (ACL)
      # for an S3 bucket.

      struct AccessControlList
        include JSON::Serializable


        @[JSON::Field(key: "allowsPublicReadAccess")]
        getter allows_public_read_access : Bool?


        @[JSON::Field(key: "allowsPublicWriteAccess")]
        getter allows_public_write_access : Bool?

        def initialize(
          @allows_public_read_access : Bool? = nil,
          @allows_public_write_access : Bool? = nil
        )
        end
      end

      # Provides information about an error that occurred due to insufficient access to a specified
      # resource.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies the details of an account to associate with an Amazon Macie administrator account.

      struct AccountDetail
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String


        @[JSON::Field(key: "email")]
        getter email : String

        def initialize(
          @account_id : String,
          @email : String
        )
        end
      end

      # Provides information about the account-level permissions settings that apply to an S3 bucket.

      struct AccountLevelPermissions
        include JSON::Serializable


        @[JSON::Field(key: "blockPublicAccess")]
        getter block_public_access : Types::BlockPublicAccess?

        def initialize(
          @block_public_access : Types::BlockPublicAccess? = nil
        )
        end
      end

      # Provides information about the delegated Amazon Macie administrator account for an organization in
      # Organizations.

      struct AdminAccount
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies the criteria for an allow list. The criteria must specify a regular expression (regex) or
      # an S3 object (s3WordsList). It can't specify both.

      struct AllowListCriteria
        include JSON::Serializable


        @[JSON::Field(key: "regex")]
        getter regex : String?


        @[JSON::Field(key: "s3WordsList")]
        getter s3_words_list : Types::S3WordsList?

        def initialize(
          @regex : String? = nil,
          @s3_words_list : Types::S3WordsList? = nil
        )
        end
      end

      # Provides information about the current status of an allow list, which indicates whether Amazon Macie
      # can access and use the list's criteria.

      struct AllowListStatus
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @code : String,
          @description : String? = nil
        )
        end
      end

      # Provides a subset of information about an allow list.

      struct AllowListSummary
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Provides information about an API operation that an entity invoked for an affected resource.

      struct ApiCallDetails
        include JSON::Serializable


        @[JSON::Field(key: "api")]
        getter api : String?


        @[JSON::Field(key: "apiServiceName")]
        getter api_service_name : String?


        @[JSON::Field(key: "firstSeen")]
        getter first_seen : Time?


        @[JSON::Field(key: "lastSeen")]
        getter last_seen : Time?

        def initialize(
          @api : String? = nil,
          @api_service_name : String? = nil,
          @first_seen : Time? = nil,
          @last_seen : Time? = nil
        )
        end
      end

      # Provides information about an identity that performed an action on an affected resource by using
      # temporary security credentials. The credentials were obtained using the AssumeRole operation of the
      # Security Token Service (STS) API.

      struct AssumedRole
        include JSON::Serializable


        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String?


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "principalId")]
        getter principal_id : String?


        @[JSON::Field(key: "sessionContext")]
        getter session_context : Types::SessionContext?

        def initialize(
          @access_key_id : String? = nil,
          @account_id : String? = nil,
          @arn : String? = nil,
          @principal_id : String? = nil,
          @session_context : Types::SessionContext? = nil
        )
        end
      end

      # Provides information about the status of automated sensitive data discovery for an Amazon Macie
      # account.

      struct AutomatedDiscoveryAccount
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Changes the status of automated sensitive data discovery for an Amazon Macie account.

      struct AutomatedDiscoveryAccountUpdate
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides information about a request that failed to change the status of automated sensitive data
      # discovery for an Amazon Macie account.

      struct AutomatedDiscoveryAccountUpdateError
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        def initialize(
          @account_id : String? = nil,
          @error_code : String? = nil
        )
        end
      end

      # Provides information about an Amazon Web Services account and entity that performed an action on an
      # affected resource. The action was performed using the credentials for an Amazon Web Services account
      # other than your own account.

      struct AwsAccount
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        def initialize(
          @account_id : String? = nil,
          @principal_id : String? = nil
        )
        end
      end

      # Provides information about an Amazon Web Services service that performed an action on an affected
      # resource.

      struct AwsService
        include JSON::Serializable


        @[JSON::Field(key: "invokedBy")]
        getter invoked_by : String?

        def initialize(
          @invoked_by : String? = nil
        )
        end
      end

      # Provides information about a custom data identifier.

      struct BatchGetCustomDataIdentifierSummary
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "deleted")]
        getter deleted : Bool?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @deleted : Bool? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Specifies one or more custom data identifiers to retrieve information about.

      struct BatchGetCustomDataIdentifiersRequest
        include JSON::Serializable


        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        def initialize(
          @ids : Array(String)? = nil
        )
        end
      end

      # Provides information about one or more custom data identifiers.

      struct BatchGetCustomDataIdentifiersResponse
        include JSON::Serializable


        @[JSON::Field(key: "customDataIdentifiers")]
        getter custom_data_identifiers : Array(Types::BatchGetCustomDataIdentifierSummary)?


        @[JSON::Field(key: "notFoundIdentifierIds")]
        getter not_found_identifier_ids : Array(String)?

        def initialize(
          @custom_data_identifiers : Array(Types::BatchGetCustomDataIdentifierSummary)? = nil,
          @not_found_identifier_ids : Array(String)? = nil
        )
        end
      end

      # Changes the status of automated sensitive data discovery for one or more Amazon Macie accounts.

      struct BatchUpdateAutomatedDiscoveryAccountsRequest
        include JSON::Serializable


        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::AutomatedDiscoveryAccountUpdate)?

        def initialize(
          @accounts : Array(Types::AutomatedDiscoveryAccountUpdate)? = nil
        )
        end
      end

      # Provides the results of a request to change the status of automated sensitive data discovery for one
      # or more Amazon Macie accounts.

      struct BatchUpdateAutomatedDiscoveryAccountsResponse
        include JSON::Serializable


        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::AutomatedDiscoveryAccountUpdateError)?

        def initialize(
          @errors : Array(Types::AutomatedDiscoveryAccountUpdateError)? = nil
        )
        end
      end

      # Provides information about the block public access settings for an S3 bucket. These settings can
      # apply to a bucket at the account or bucket level. For detailed information about each setting, see
      # Blocking public access to your Amazon S3 storage in the Amazon Simple Storage Service User Guide .

      struct BlockPublicAccess
        include JSON::Serializable


        @[JSON::Field(key: "blockPublicAcls")]
        getter block_public_acls : Bool?


        @[JSON::Field(key: "blockPublicPolicy")]
        getter block_public_policy : Bool?


        @[JSON::Field(key: "ignorePublicAcls")]
        getter ignore_public_acls : Bool?


        @[JSON::Field(key: "restrictPublicBuckets")]
        getter restrict_public_buckets : Bool?

        def initialize(
          @block_public_acls : Bool? = nil,
          @block_public_policy : Bool? = nil,
          @ignore_public_acls : Bool? = nil,
          @restrict_public_buckets : Bool? = nil
        )
        end
      end

      # Provides information about the number of S3 buckets that are publicly accessible due to a
      # combination of permissions settings for each bucket.

      struct BucketCountByEffectivePermission
        include JSON::Serializable


        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Int64?


        @[JSON::Field(key: "publiclyReadable")]
        getter publicly_readable : Int64?


        @[JSON::Field(key: "publiclyWritable")]
        getter publicly_writable : Int64?


        @[JSON::Field(key: "unknown")]
        getter unknown : Int64?

        def initialize(
          @publicly_accessible : Int64? = nil,
          @publicly_readable : Int64? = nil,
          @publicly_writable : Int64? = nil,
          @unknown : Int64? = nil
        )
        end
      end

      # Provides information about the number of S3 buckets whose settings do or don't specify default
      # server-side encryption behavior for objects that are added to the buckets. For detailed information
      # about these settings, see Setting default server-side encryption behavior for Amazon S3 buckets in
      # the Amazon Simple Storage Service User Guide .

      struct BucketCountByEncryptionType
        include JSON::Serializable


        @[JSON::Field(key: "kmsManaged")]
        getter kms_managed : Int64?


        @[JSON::Field(key: "s3Managed")]
        getter s3_managed : Int64?


        @[JSON::Field(key: "unencrypted")]
        getter unencrypted : Int64?


        @[JSON::Field(key: "unknown")]
        getter unknown : Int64?

        def initialize(
          @kms_managed : Int64? = nil,
          @s3_managed : Int64? = nil,
          @unencrypted : Int64? = nil,
          @unknown : Int64? = nil
        )
        end
      end

      # Provides information about the number of S3 buckets that are or aren't shared with other Amazon Web
      # Services accounts, Amazon CloudFront origin access identities (OAIs), or CloudFront origin access
      # controls (OACs). In this data, an Amazon Macie organization is defined as a set of Macie accounts
      # that are centrally managed as a group of related accounts through Organizations or by Macie
      # invitation.

      struct BucketCountBySharedAccessType
        include JSON::Serializable


        @[JSON::Field(key: "external")]
        getter external : Int64?


        @[JSON::Field(key: "internal")]
        getter internal : Int64?


        @[JSON::Field(key: "notShared")]
        getter not_shared : Int64?


        @[JSON::Field(key: "unknown")]
        getter unknown : Int64?

        def initialize(
          @external : Int64? = nil,
          @internal : Int64? = nil,
          @not_shared : Int64? = nil,
          @unknown : Int64? = nil
        )
        end
      end

      # Provides information about the number of S3 buckets whose bucket policies do or don't require
      # server-side encryption of objects when objects are added to the buckets.

      struct BucketCountPolicyAllowsUnencryptedObjectUploads
        include JSON::Serializable


        @[JSON::Field(key: "allowsUnencryptedObjectUploads")]
        getter allows_unencrypted_object_uploads : Int64?


        @[JSON::Field(key: "deniesUnencryptedObjectUploads")]
        getter denies_unencrypted_object_uploads : Int64?


        @[JSON::Field(key: "unknown")]
        getter unknown : Int64?

        def initialize(
          @allows_unencrypted_object_uploads : Int64? = nil,
          @denies_unencrypted_object_uploads : Int64? = nil,
          @unknown : Int64? = nil
        )
        end
      end

      # Specifies the operator to use in a property-based condition that filters the results of a query for
      # information about S3 buckets.

      struct BucketCriteriaAdditionalProperties
        include JSON::Serializable


        @[JSON::Field(key: "eq")]
        getter eq : Array(String)?


        @[JSON::Field(key: "gt")]
        getter gt : Int64?


        @[JSON::Field(key: "gte")]
        getter gte : Int64?


        @[JSON::Field(key: "lt")]
        getter lt : Int64?


        @[JSON::Field(key: "lte")]
        getter lte : Int64?


        @[JSON::Field(key: "neq")]
        getter neq : Array(String)?


        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @eq : Array(String)? = nil,
          @gt : Int64? = nil,
          @gte : Int64? = nil,
          @lt : Int64? = nil,
          @lte : Int64? = nil,
          @neq : Array(String)? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Provides information about the bucket-level permissions settings for an S3 bucket.

      struct BucketLevelPermissions
        include JSON::Serializable


        @[JSON::Field(key: "accessControlList")]
        getter access_control_list : Types::AccessControlList?


        @[JSON::Field(key: "blockPublicAccess")]
        getter block_public_access : Types::BlockPublicAccess?


        @[JSON::Field(key: "bucketPolicy")]
        getter bucket_policy : Types::BucketPolicy?

        def initialize(
          @access_control_list : Types::AccessControlList? = nil,
          @block_public_access : Types::BlockPublicAccess? = nil,
          @bucket_policy : Types::BucketPolicy? = nil
        )
        end
      end

      # Provides statistical data and other information about an S3 bucket that Amazon Macie monitors and
      # analyzes for your account. By default, object count and storage size values include data for object
      # parts that are the result of incomplete multipart uploads. For more information, see How Macie
      # monitors Amazon S3 data security in the Amazon Macie User Guide . If an error or issue prevents
      # Macie from retrieving and processing metadata from Amazon S3 for the bucket or the bucket's objects,
      # the value for the versioning property is false and the value for most other properties is null or
      # UNKNOWN. Key exceptions are accountId, bucketArn, bucketCreatedAt, bucketName, lastUpdated, and
      # region. To identify the cause, refer to the errorCode and errorMessage values.

      struct BucketMetadata
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "allowsUnencryptedObjectUploads")]
        getter allows_unencrypted_object_uploads : String?


        @[JSON::Field(key: "automatedDiscoveryMonitoringStatus")]
        getter automated_discovery_monitoring_status : String?


        @[JSON::Field(key: "bucketArn")]
        getter bucket_arn : String?


        @[JSON::Field(key: "bucketCreatedAt")]
        getter bucket_created_at : Time?


        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?


        @[JSON::Field(key: "classifiableObjectCount")]
        getter classifiable_object_count : Int64?


        @[JSON::Field(key: "classifiableSizeInBytes")]
        getter classifiable_size_in_bytes : Int64?


        @[JSON::Field(key: "errorCode")]
        getter error_code : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "jobDetails")]
        getter job_details : Types::JobDetails?


        @[JSON::Field(key: "lastAutomatedDiscoveryTime")]
        getter last_automated_discovery_time : Time?


        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?


        @[JSON::Field(key: "objectCount")]
        getter object_count : Int64?


        @[JSON::Field(key: "objectCountByEncryptionType")]
        getter object_count_by_encryption_type : Types::ObjectCountByEncryptionType?


        @[JSON::Field(key: "publicAccess")]
        getter public_access : Types::BucketPublicAccess?


        @[JSON::Field(key: "region")]
        getter region : String?


        @[JSON::Field(key: "replicationDetails")]
        getter replication_details : Types::ReplicationDetails?


        @[JSON::Field(key: "sensitivityScore")]
        getter sensitivity_score : Int32?


        @[JSON::Field(key: "serverSideEncryption")]
        getter server_side_encryption : Types::BucketServerSideEncryption?


        @[JSON::Field(key: "sharedAccess")]
        getter shared_access : String?


        @[JSON::Field(key: "sizeInBytes")]
        getter size_in_bytes : Int64?


        @[JSON::Field(key: "sizeInBytesCompressed")]
        getter size_in_bytes_compressed : Int64?


        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::KeyValuePair)?


        @[JSON::Field(key: "unclassifiableObjectCount")]
        getter unclassifiable_object_count : Types::ObjectLevelStatistics?


        @[JSON::Field(key: "unclassifiableObjectSizeInBytes")]
        getter unclassifiable_object_size_in_bytes : Types::ObjectLevelStatistics?


        @[JSON::Field(key: "versioning")]
        getter versioning : Bool?

        def initialize(
          @account_id : String? = nil,
          @allows_unencrypted_object_uploads : String? = nil,
          @automated_discovery_monitoring_status : String? = nil,
          @bucket_arn : String? = nil,
          @bucket_created_at : Time? = nil,
          @bucket_name : String? = nil,
          @classifiable_object_count : Int64? = nil,
          @classifiable_size_in_bytes : Int64? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @job_details : Types::JobDetails? = nil,
          @last_automated_discovery_time : Time? = nil,
          @last_updated : Time? = nil,
          @object_count : Int64? = nil,
          @object_count_by_encryption_type : Types::ObjectCountByEncryptionType? = nil,
          @public_access : Types::BucketPublicAccess? = nil,
          @region : String? = nil,
          @replication_details : Types::ReplicationDetails? = nil,
          @sensitivity_score : Int32? = nil,
          @server_side_encryption : Types::BucketServerSideEncryption? = nil,
          @shared_access : String? = nil,
          @size_in_bytes : Int64? = nil,
          @size_in_bytes_compressed : Int64? = nil,
          @tags : Array(Types::KeyValuePair)? = nil,
          @unclassifiable_object_count : Types::ObjectLevelStatistics? = nil,
          @unclassifiable_object_size_in_bytes : Types::ObjectLevelStatistics? = nil,
          @versioning : Bool? = nil
        )
        end
      end

      # Provides information about the account-level and bucket-level permissions settings for an S3 bucket.

      struct BucketPermissionConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "accountLevelPermissions")]
        getter account_level_permissions : Types::AccountLevelPermissions?


        @[JSON::Field(key: "bucketLevelPermissions")]
        getter bucket_level_permissions : Types::BucketLevelPermissions?

        def initialize(
          @account_level_permissions : Types::AccountLevelPermissions? = nil,
          @bucket_level_permissions : Types::BucketLevelPermissions? = nil
        )
        end
      end

      # Provides information about the permissions settings of the bucket policy for an S3 bucket.

      struct BucketPolicy
        include JSON::Serializable


        @[JSON::Field(key: "allowsPublicReadAccess")]
        getter allows_public_read_access : Bool?


        @[JSON::Field(key: "allowsPublicWriteAccess")]
        getter allows_public_write_access : Bool?

        def initialize(
          @allows_public_read_access : Bool? = nil,
          @allows_public_write_access : Bool? = nil
        )
        end
      end

      # Provides information about the permissions settings that determine whether an S3 bucket is publicly
      # accessible.

      struct BucketPublicAccess
        include JSON::Serializable


        @[JSON::Field(key: "effectivePermission")]
        getter effective_permission : String?


        @[JSON::Field(key: "permissionConfiguration")]
        getter permission_configuration : Types::BucketPermissionConfiguration?

        def initialize(
          @effective_permission : String? = nil,
          @permission_configuration : Types::BucketPermissionConfiguration? = nil
        )
        end
      end

      # Provides information about the default server-side encryption settings for an S3 bucket. For
      # detailed information about these settings, see Setting default server-side encryption behavior for
      # Amazon S3 buckets in the Amazon Simple Storage Service User Guide .

      struct BucketServerSideEncryption
        include JSON::Serializable


        @[JSON::Field(key: "kmsMasterKeyId")]
        getter kms_master_key_id : String?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @kms_master_key_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Specifies criteria for sorting the results of a query for information about S3 buckets.

      struct BucketSortCriteria
        include JSON::Serializable


        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?


        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @attribute_name : String? = nil,
          @order_by : String? = nil
        )
        end
      end

      # Provides aggregated statistical data for sensitive data discovery metrics that apply to S3 buckets,
      # grouped by bucket sensitivity score (sensitivityScore). If automated sensitive data discovery is
      # currently disabled for your account, the value for most of these metrics is 0.

      struct BucketStatisticsBySensitivity
        include JSON::Serializable


        @[JSON::Field(key: "classificationError")]
        getter classification_error : Types::SensitivityAggregations?


        @[JSON::Field(key: "notClassified")]
        getter not_classified : Types::SensitivityAggregations?


        @[JSON::Field(key: "notSensitive")]
        getter not_sensitive : Types::SensitivityAggregations?


        @[JSON::Field(key: "sensitive")]
        getter sensitive : Types::SensitivityAggregations?

        def initialize(
          @classification_error : Types::SensitivityAggregations? = nil,
          @not_classified : Types::SensitivityAggregations? = nil,
          @not_sensitive : Types::SensitivityAggregations? = nil,
          @sensitive : Types::SensitivityAggregations? = nil
        )
        end
      end

      # Specifies the location of an occurrence of sensitive data in a Microsoft Excel workbook, CSV file,
      # or TSV file.

      struct Cell
        include JSON::Serializable


        @[JSON::Field(key: "cellReference")]
        getter cell_reference : String?


        @[JSON::Field(key: "column")]
        getter column : Int64?


        @[JSON::Field(key: "columnName")]
        getter column_name : String?


        @[JSON::Field(key: "row")]
        getter row : Int64?

        def initialize(
          @cell_reference : String? = nil,
          @column : Int64? = nil,
          @column_name : String? = nil,
          @row : Int64? = nil
        )
        end
      end

      # Provides information about a sensitive data finding and the details of the finding.

      struct ClassificationDetails
        include JSON::Serializable


        @[JSON::Field(key: "detailedResultsLocation")]
        getter detailed_results_location : String?


        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?


        @[JSON::Field(key: "jobId")]
        getter job_id : String?


        @[JSON::Field(key: "originType")]
        getter origin_type : String?


        @[JSON::Field(key: "result")]
        getter result : Types::ClassificationResult?

        def initialize(
          @detailed_results_location : String? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @origin_type : String? = nil,
          @result : Types::ClassificationResult? = nil
        )
        end
      end

      # Specifies where to store data classification results, and the encryption settings to use when
      # storing results in that location. The location must be an S3 general purpose bucket.

      struct ClassificationExportConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      # Provides the details of a sensitive data finding, including the types, number of occurrences, and
      # locations of the sensitive data that was detected.

      struct ClassificationResult
        include JSON::Serializable


        @[JSON::Field(key: "additionalOccurrences")]
        getter additional_occurrences : Bool?


        @[JSON::Field(key: "customDataIdentifiers")]
        getter custom_data_identifiers : Types::CustomDataIdentifiers?


        @[JSON::Field(key: "mimeType")]
        getter mime_type : String?


        @[JSON::Field(key: "sensitiveData")]
        getter sensitive_data : Array(Types::SensitiveDataItem)?


        @[JSON::Field(key: "sizeClassified")]
        getter size_classified : Int64?


        @[JSON::Field(key: "status")]
        getter status : Types::ClassificationResultStatus?

        def initialize(
          @additional_occurrences : Bool? = nil,
          @custom_data_identifiers : Types::CustomDataIdentifiers? = nil,
          @mime_type : String? = nil,
          @sensitive_data : Array(Types::SensitiveDataItem)? = nil,
          @size_classified : Int64? = nil,
          @status : Types::ClassificationResultStatus? = nil
        )
        end
      end

      # Provides information about the status of a sensitive data finding.

      struct ClassificationResultStatus
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @code : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Provides information about the classification scope for an Amazon Macie account. Macie uses the
      # scope's settings when it performs automated sensitive data discovery for the account.

      struct ClassificationScopeSummary
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Provides information about an error that occurred due to a versioning conflict for a specified
      # resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies the settings for an allow list. When Amazon Macie processes the request, Macie tests the
      # list's criteria. If the criteria specify a regular expression that Macie can't compile or an S3
      # object that Macie can't retrieve or parse, an error occurs.

      struct CreateAllowListRequest
        include JSON::Serializable


        @[JSON::Field(key: "clientToken")]
        getter client_token : String


        @[JSON::Field(key: "criteria")]
        getter criteria : Types::AllowListCriteria


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @criteria : Types::AllowListCriteria,
          @name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about an allow list that was created in response to a request.

      struct CreateAllowListResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Specifies the scope, schedule, and other settings for a classification job. You can't change any
      # settings for a classification job after you create it. This helps to ensure that you have an
      # immutable history of sensitive data findings and discovery results for data privacy and protection
      # audits or investigations.

      struct CreateClassificationJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "clientToken")]
        getter client_token : String


        @[JSON::Field(key: "jobType")]
        getter job_type : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "s3JobDefinition")]
        getter s3_job_definition : Types::S3JobDefinition


        @[JSON::Field(key: "allowListIds")]
        getter allow_list_ids : Array(String)?


        @[JSON::Field(key: "customDataIdentifierIds")]
        getter custom_data_identifier_ids : Array(String)?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "initialRun")]
        getter initial_run : Bool?


        @[JSON::Field(key: "managedDataIdentifierIds")]
        getter managed_data_identifier_ids : Array(String)?


        @[JSON::Field(key: "managedDataIdentifierSelector")]
        getter managed_data_identifier_selector : String?


        @[JSON::Field(key: "samplingPercentage")]
        getter sampling_percentage : Int32?


        @[JSON::Field(key: "scheduleFrequency")]
        getter schedule_frequency : Types::JobScheduleFrequency?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @job_type : String,
          @name : String,
          @s3_job_definition : Types::S3JobDefinition,
          @allow_list_ids : Array(String)? = nil,
          @custom_data_identifier_ids : Array(String)? = nil,
          @description : String? = nil,
          @initial_run : Bool? = nil,
          @managed_data_identifier_ids : Array(String)? = nil,
          @managed_data_identifier_selector : String? = nil,
          @sampling_percentage : Int32? = nil,
          @schedule_frequency : Types::JobScheduleFrequency? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about a classification job that was created in response to a request.

      struct CreateClassificationJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?


        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        def initialize(
          @job_arn : String? = nil,
          @job_id : String? = nil
        )
        end
      end

      # Specifies the detection criteria and other settings for a custom data identifier. You can't change a
      # custom data identifier after you create it. This helps to ensure that you have an immutable history
      # of sensitive data findings and discovery results for data privacy and protection audits or
      # investigations.

      struct CreateCustomDataIdentifierRequest
        include JSON::Serializable


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "regex")]
        getter regex : String


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "ignoreWords")]
        getter ignore_words : Array(String)?


        @[JSON::Field(key: "keywords")]
        getter keywords : Array(String)?


        @[JSON::Field(key: "maximumMatchDistance")]
        getter maximum_match_distance : Int32?


        @[JSON::Field(key: "severityLevels")]
        getter severity_levels : Array(Types::SeverityLevel)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @regex : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @ignore_words : Array(String)? = nil,
          @keywords : Array(String)? = nil,
          @maximum_match_distance : Int32? = nil,
          @severity_levels : Array(Types::SeverityLevel)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about a custom data identifier that was created in response to a request.

      struct CreateCustomDataIdentifierResponse
        include JSON::Serializable


        @[JSON::Field(key: "customDataIdentifierId")]
        getter custom_data_identifier_id : String?

        def initialize(
          @custom_data_identifier_id : String? = nil
        )
        end
      end

      # Specifies the criteria and other settings for a new findings filter.

      struct CreateFindingsFilterRequest
        include JSON::Serializable


        @[JSON::Field(key: "action")]
        getter action : String


        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "position")]
        getter position : Int32?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @action : String,
          @finding_criteria : Types::FindingCriteria,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @position : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about a findings filter that was created in response to a request.

      struct CreateFindingsFilterResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Specifies the settings for an Amazon Macie membership invitation. When you send an invitation, Macie
      # notifies the recipient by creating an Health event for the recipient's account and, if Macie is
      # already enabled for the account, displaying an Accounts badge and notification on the recipient's
      # console. You can optionally notify the recipient by also sending the invitation as an email message.

      struct CreateInvitationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)


        @[JSON::Field(key: "disableEmailNotification")]
        getter disable_email_notification : Bool?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @account_ids : Array(String),
          @disable_email_notification : Bool? = nil,
          @message : String? = nil
        )
        end
      end

      # Provides information about an unprocessed request to send an Amazon Macie membership invitation to a
      # specific account.

      struct CreateInvitationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)?

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)? = nil
        )
        end
      end

      # Specifies an Amazon Web Services account to associate with an Amazon Macie administrator account.

      struct CreateMemberRequest
        include JSON::Serializable


        @[JSON::Field(key: "account")]
        getter account : Types::AccountDetail


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @account : Types::AccountDetail,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about a request to associate an account with an Amazon Macie administrator
      # account.

      struct CreateMemberResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # Specifies the types of sample findings to create.

      struct CreateSampleFindingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "findingTypes")]
        getter finding_types : Array(String)?

        def initialize(
          @finding_types : Array(String)? = nil
        )
        end
      end


      struct CreateSampleFindingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies one or more property- and tag-based conditions that define criteria for including or
      # excluding S3 buckets from a classification job.

      struct CriteriaBlockForJob
        include JSON::Serializable


        @[JSON::Field(key: "and")]
        getter and : Array(Types::CriteriaForJob)?

        def initialize(
          @and : Array(Types::CriteriaForJob)? = nil
        )
        end
      end

      # Specifies a property- or tag-based condition that defines criteria for including or excluding S3
      # buckets from a classification job.

      struct CriteriaForJob
        include JSON::Serializable


        @[JSON::Field(key: "simpleCriterion")]
        getter simple_criterion : Types::SimpleCriterionForJob?


        @[JSON::Field(key: "tagCriterion")]
        getter tag_criterion : Types::TagCriterionForJob?

        def initialize(
          @simple_criterion : Types::SimpleCriterionForJob? = nil,
          @tag_criterion : Types::TagCriterionForJob? = nil
        )
        end
      end

      # Specifies the operator to use in a property-based condition that filters the results of a query for
      # findings. For detailed information and examples of each operator, see Fundamentals of filtering
      # findings in the Amazon Macie User Guide .

      struct CriterionAdditionalProperties
        include JSON::Serializable


        @[JSON::Field(key: "eq")]
        getter eq : Array(String)?


        @[JSON::Field(key: "eqExactMatch")]
        getter eq_exact_match : Array(String)?


        @[JSON::Field(key: "gt")]
        getter gt : Int64?


        @[JSON::Field(key: "gte")]
        getter gte : Int64?


        @[JSON::Field(key: "lt")]
        getter lt : Int64?


        @[JSON::Field(key: "lte")]
        getter lte : Int64?


        @[JSON::Field(key: "neq")]
        getter neq : Array(String)?

        def initialize(
          @eq : Array(String)? = nil,
          @eq_exact_match : Array(String)? = nil,
          @gt : Int64? = nil,
          @gte : Int64? = nil,
          @lt : Int64? = nil,
          @lte : Int64? = nil,
          @neq : Array(String)? = nil
        )
        end
      end

      # Provides information about a custom data identifier.

      struct CustomDataIdentifierSummary
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Provides information about custom data identifiers that produced a sensitive data finding, and the
      # number of occurrences of the data that they detected for the finding.

      struct CustomDataIdentifiers
        include JSON::Serializable


        @[JSON::Field(key: "detections")]
        getter detections : Array(Types::CustomDetection)?


        @[JSON::Field(key: "totalCount")]
        getter total_count : Int64?

        def initialize(
          @detections : Array(Types::CustomDetection)? = nil,
          @total_count : Int64? = nil
        )
        end
      end

      # Provides information about a custom data identifier that produced a sensitive data finding, and the
      # sensitive data that it detected for the finding.

      struct CustomDetection
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "count")]
        getter count : Int64?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "occurrences")]
        getter occurrences : Types::Occurrences?

        def initialize(
          @arn : String? = nil,
          @count : Int64? = nil,
          @name : String? = nil,
          @occurrences : Types::Occurrences? = nil
        )
        end
      end

      # Specifies that a classification job runs once a day, every day. This is an empty object.

      struct DailySchedule
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies one or more accounts that sent Amazon Macie membership invitations to decline.

      struct DeclineInvitationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        def initialize(
          @account_ids : Array(String)
        )
        end
      end

      # Provides information about unprocessed requests to decline Amazon Macie membership invitations that
      # were received from specific accounts.

      struct DeclineInvitationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)?

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)? = nil
        )
        end
      end

      # Provides information about a type of sensitive data that was detected by a managed data identifier
      # and produced a sensitive data finding.

      struct DefaultDetection
        include JSON::Serializable


        @[JSON::Field(key: "count")]
        getter count : Int64?


        @[JSON::Field(key: "occurrences")]
        getter occurrences : Types::Occurrences?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @count : Int64? = nil,
          @occurrences : Types::Occurrences? = nil,
          @type : String? = nil
        )
        end
      end


      struct DeleteAllowListRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "ignoreJobChecks")]
        getter ignore_job_checks : String?

        def initialize(
          @id : String,
          @ignore_job_checks : String? = nil
        )
        end
      end


      struct DeleteAllowListResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCustomDataIdentifierRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteCustomDataIdentifierResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFindingsFilterRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteFindingsFilterResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies one or more accounts that sent Amazon Macie membership invitations to delete.

      struct DeleteInvitationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        def initialize(
          @account_ids : Array(String)
        )
        end
      end

      # Provides information about unprocessed requests to delete Amazon Macie membership invitations that
      # were received from specific accounts.

      struct DeleteInvitationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)?

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)? = nil
        )
        end
      end


      struct DeleteMemberRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteMemberResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies criteria for filtering, sorting, and paginating the results of a query for statistical
      # data and other information about S3 buckets.

      struct DescribeBucketsRequest
        include JSON::Serializable


        @[JSON::Field(key: "criteria")]
        getter criteria : Hash(String, Types::BucketCriteriaAdditionalProperties)?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::BucketSortCriteria?

        def initialize(
          @criteria : Hash(String, Types::BucketCriteriaAdditionalProperties)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::BucketSortCriteria? = nil
        )
        end
      end

      # Provides the results of a query that retrieved statistical data and other information about one or
      # more S3 buckets that Amazon Macie monitors and analyzes for your account.

      struct DescribeBucketsResponse
        include JSON::Serializable


        @[JSON::Field(key: "buckets")]
        getter buckets : Array(Types::BucketMetadata)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @buckets : Array(Types::BucketMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeClassificationJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # Provides information about a classification job, including the current configuration settings and
      # status of the job.

      struct DescribeClassificationJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "allowListIds")]
        getter allow_list_ids : Array(String)?


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "customDataIdentifierIds")]
        getter custom_data_identifier_ids : Array(String)?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "initialRun")]
        getter initial_run : Bool?


        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?


        @[JSON::Field(key: "jobId")]
        getter job_id : String?


        @[JSON::Field(key: "jobStatus")]
        getter job_status : String?


        @[JSON::Field(key: "jobType")]
        getter job_type : String?


        @[JSON::Field(key: "lastRunErrorStatus")]
        getter last_run_error_status : Types::LastRunErrorStatus?


        @[JSON::Field(key: "lastRunTime")]
        getter last_run_time : Time?


        @[JSON::Field(key: "managedDataIdentifierIds")]
        getter managed_data_identifier_ids : Array(String)?


        @[JSON::Field(key: "managedDataIdentifierSelector")]
        getter managed_data_identifier_selector : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "s3JobDefinition")]
        getter s3_job_definition : Types::S3JobDefinition?


        @[JSON::Field(key: "samplingPercentage")]
        getter sampling_percentage : Int32?


        @[JSON::Field(key: "scheduleFrequency")]
        getter schedule_frequency : Types::JobScheduleFrequency?


        @[JSON::Field(key: "statistics")]
        getter statistics : Types::Statistics?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "userPausedDetails")]
        getter user_paused_details : Types::UserPausedDetails?

        def initialize(
          @allow_list_ids : Array(String)? = nil,
          @client_token : String? = nil,
          @created_at : Time? = nil,
          @custom_data_identifier_ids : Array(String)? = nil,
          @description : String? = nil,
          @initial_run : Bool? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_type : String? = nil,
          @last_run_error_status : Types::LastRunErrorStatus? = nil,
          @last_run_time : Time? = nil,
          @managed_data_identifier_ids : Array(String)? = nil,
          @managed_data_identifier_selector : String? = nil,
          @name : String? = nil,
          @s3_job_definition : Types::S3JobDefinition? = nil,
          @sampling_percentage : Int32? = nil,
          @schedule_frequency : Types::JobScheduleFrequency? = nil,
          @statistics : Types::Statistics? = nil,
          @tags : Hash(String, String)? = nil,
          @user_paused_details : Types::UserPausedDetails? = nil
        )
        end
      end


      struct DescribeOrganizationConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about the Amazon Macie configuration for an organization in Organizations.

      struct DescribeOrganizationConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool?


        @[JSON::Field(key: "maxAccountLimitReached")]
        getter max_account_limit_reached : Bool?

        def initialize(
          @auto_enable : Bool? = nil,
          @max_account_limit_reached : Bool? = nil
        )
        end
      end

      # Specifies 1-10 occurrences of a specific type of sensitive data reported by a finding.

      struct DetectedDataDetails
        include JSON::Serializable


        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end

      # Provides information about a type of sensitive data that Amazon Macie found in an S3 bucket while
      # performing automated sensitive data discovery for an account. The information also specifies the
      # custom or managed data identifier that detected the data. This information is available only if
      # automated sensitive data discovery has been enabled for the account.

      struct Detection
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "count")]
        getter count : Int64?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "suppressed")]
        getter suppressed : Bool?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @count : Int64? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @suppressed : Bool? = nil,
          @type : String? = nil
        )
        end
      end


      struct DisableMacieRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DisableMacieResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisableOrganizationAdminAccountRequest
        include JSON::Serializable


        @[JSON::Field(key: "adminAccountId")]
        getter admin_account_id : String

        def initialize(
          @admin_account_id : String
        )
        end
      end


      struct DisableOrganizationAdminAccountResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateFromAdministratorAccountRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateFromAdministratorAccountResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateFromMasterAccountRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateFromMasterAccountResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateMemberRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DisassociateMemberResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about the domain name of the device that an entity used to perform an action on
      # an affected resource.

      struct DomainDetails
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        def initialize(
          @domain_name : String? = nil
        )
        end
      end

      # The request succeeded and there isn't any content to include in the body of the response (No
      # Content).

      struct Empty
        include JSON::Serializable

        def initialize
        end
      end

      # Enables Amazon Macie and specifies the configuration settings for a Macie account.

      struct EnableMacieRequest
        include JSON::Serializable


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "findingPublishingFrequency")]
        getter finding_publishing_frequency : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @client_token : String? = nil,
          @finding_publishing_frequency : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct EnableMacieResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies an account to designate as the delegated Amazon Macie administrator account for an
      # organization in Organizations. To submit this request, you must be a user of the Organizations
      # management account.

      struct EnableOrganizationAdminAccountRequest
        include JSON::Serializable


        @[JSON::Field(key: "adminAccountId")]
        getter admin_account_id : String


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @admin_account_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct EnableOrganizationAdminAccountResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about an identity that performed an action on an affected resource by using
      # temporary security credentials. The credentials were obtained using the GetFederationToken operation
      # of the Security Token Service (STS) API.

      struct FederatedUser
        include JSON::Serializable


        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String?


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "principalId")]
        getter principal_id : String?


        @[JSON::Field(key: "sessionContext")]
        getter session_context : Types::SessionContext?

        def initialize(
          @access_key_id : String? = nil,
          @account_id : String? = nil,
          @arn : String? = nil,
          @principal_id : String? = nil,
          @session_context : Types::SessionContext? = nil
        )
        end
      end

      # Provides the details of a finding.

      struct Finding
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "archived")]
        getter archived : Bool?


        @[JSON::Field(key: "category")]
        getter category : String?


        @[JSON::Field(key: "classificationDetails")]
        getter classification_details : Types::ClassificationDetails?


        @[JSON::Field(key: "count")]
        getter count : Int64?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "partition")]
        getter partition : String?


        @[JSON::Field(key: "policyDetails")]
        getter policy_details : Types::PolicyDetails?


        @[JSON::Field(key: "region")]
        getter region : String?


        @[JSON::Field(key: "resourcesAffected")]
        getter resources_affected : Types::ResourcesAffected?


        @[JSON::Field(key: "sample")]
        getter sample : Bool?


        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "severity")]
        getter severity : Types::Severity?


        @[JSON::Field(key: "title")]
        getter title : String?


        @[JSON::Field(key: "type")]
        getter type : String?


        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @account_id : String? = nil,
          @archived : Bool? = nil,
          @category : String? = nil,
          @classification_details : Types::ClassificationDetails? = nil,
          @count : Int64? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @partition : String? = nil,
          @policy_details : Types::PolicyDetails? = nil,
          @region : String? = nil,
          @resources_affected : Types::ResourcesAffected? = nil,
          @sample : Bool? = nil,
          @schema_version : String? = nil,
          @severity : Types::Severity? = nil,
          @title : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Provides information about an action that occurred for a resource and produced a policy finding.

      struct FindingAction
        include JSON::Serializable


        @[JSON::Field(key: "actionType")]
        getter action_type : String?


        @[JSON::Field(key: "apiCallDetails")]
        getter api_call_details : Types::ApiCallDetails?

        def initialize(
          @action_type : String? = nil,
          @api_call_details : Types::ApiCallDetails? = nil
        )
        end
      end

      # Provides information about an entity that performed an action that produced a policy finding for a
      # resource.

      struct FindingActor
        include JSON::Serializable


        @[JSON::Field(key: "domainDetails")]
        getter domain_details : Types::DomainDetails?


        @[JSON::Field(key: "ipAddressDetails")]
        getter ip_address_details : Types::IpAddressDetails?


        @[JSON::Field(key: "userIdentity")]
        getter user_identity : Types::UserIdentity?

        def initialize(
          @domain_details : Types::DomainDetails? = nil,
          @ip_address_details : Types::IpAddressDetails? = nil,
          @user_identity : Types::UserIdentity? = nil
        )
        end
      end

      # Specifies, as a map, one or more property-based conditions that filter the results of a query for
      # findings.

      struct FindingCriteria
        include JSON::Serializable


        @[JSON::Field(key: "criterion")]
        getter criterion : Hash(String, Types::CriterionAdditionalProperties)?

        def initialize(
          @criterion : Hash(String, Types::CriterionAdditionalProperties)? = nil
        )
        end
      end

      # Specifies criteria for sorting the results of a query that retrieves aggregated statistical data
      # about findings.

      struct FindingStatisticsSortCriteria
        include JSON::Serializable


        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?


        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @attribute_name : String? = nil,
          @order_by : String? = nil
        )
        end
      end

      # Provides information about a findings filter.

      struct FindingsFilterListItem
        include JSON::Serializable


        @[JSON::Field(key: "action")]
        getter action : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @action : String? = nil,
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetAdministratorAccountRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about the Amazon Macie administrator account for an account. If the accounts
      # are associated by a Macie membership invitation, the response also provides information about that
      # invitation.

      struct GetAdministratorAccountResponse
        include JSON::Serializable


        @[JSON::Field(key: "administrator")]
        getter administrator : Types::Invitation?

        def initialize(
          @administrator : Types::Invitation? = nil
        )
        end
      end


      struct GetAllowListRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Provides information about the settings and status of an allow list.

      struct GetAllowListResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "criteria")]
        getter criteria : Types::AllowListCriteria?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "status")]
        getter status : Types::AllowListStatus?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @criteria : Types::AllowListCriteria? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : Types::AllowListStatus? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetAutomatedDiscoveryConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about the configuration settings and status of automated sensitive data
      # discovery for an organization in Amazon Macie or a standalone Macie account.

      struct GetAutomatedDiscoveryConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "autoEnableOrganizationMembers")]
        getter auto_enable_organization_members : String?


        @[JSON::Field(key: "classificationScopeId")]
        getter classification_scope_id : String?


        @[JSON::Field(key: "disabledAt")]
        getter disabled_at : Time?


        @[JSON::Field(key: "firstEnabledAt")]
        getter first_enabled_at : Time?


        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?


        @[JSON::Field(key: "sensitivityInspectionTemplateId")]
        getter sensitivity_inspection_template_id : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @auto_enable_organization_members : String? = nil,
          @classification_scope_id : String? = nil,
          @disabled_at : Time? = nil,
          @first_enabled_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @sensitivity_inspection_template_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies the account that owns the S3 buckets to retrieve aggregated statistical data for.

      struct GetBucketStatisticsRequest
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end

      # Provides the results of a query that retrieved aggregated statistical data for all the S3 buckets
      # that Amazon Macie monitors and analyzes for your account. By default, object count and storage size
      # values include data for object parts that are the result of incomplete multipart uploads. For more
      # information, see How Macie monitors Amazon S3 data security in the Amazon Macie User Guide .

      struct GetBucketStatisticsResponse
        include JSON::Serializable


        @[JSON::Field(key: "bucketCount")]
        getter bucket_count : Int64?


        @[JSON::Field(key: "bucketCountByEffectivePermission")]
        getter bucket_count_by_effective_permission : Types::BucketCountByEffectivePermission?


        @[JSON::Field(key: "bucketCountByEncryptionType")]
        getter bucket_count_by_encryption_type : Types::BucketCountByEncryptionType?


        @[JSON::Field(key: "bucketCountByObjectEncryptionRequirement")]
        getter bucket_count_by_object_encryption_requirement : Types::BucketCountPolicyAllowsUnencryptedObjectUploads?


        @[JSON::Field(key: "bucketCountBySharedAccessType")]
        getter bucket_count_by_shared_access_type : Types::BucketCountBySharedAccessType?


        @[JSON::Field(key: "bucketStatisticsBySensitivity")]
        getter bucket_statistics_by_sensitivity : Types::BucketStatisticsBySensitivity?


        @[JSON::Field(key: "classifiableObjectCount")]
        getter classifiable_object_count : Int64?


        @[JSON::Field(key: "classifiableSizeInBytes")]
        getter classifiable_size_in_bytes : Int64?


        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?


        @[JSON::Field(key: "objectCount")]
        getter object_count : Int64?


        @[JSON::Field(key: "sizeInBytes")]
        getter size_in_bytes : Int64?


        @[JSON::Field(key: "sizeInBytesCompressed")]
        getter size_in_bytes_compressed : Int64?


        @[JSON::Field(key: "unclassifiableObjectCount")]
        getter unclassifiable_object_count : Types::ObjectLevelStatistics?


        @[JSON::Field(key: "unclassifiableObjectSizeInBytes")]
        getter unclassifiable_object_size_in_bytes : Types::ObjectLevelStatistics?

        def initialize(
          @bucket_count : Int64? = nil,
          @bucket_count_by_effective_permission : Types::BucketCountByEffectivePermission? = nil,
          @bucket_count_by_encryption_type : Types::BucketCountByEncryptionType? = nil,
          @bucket_count_by_object_encryption_requirement : Types::BucketCountPolicyAllowsUnencryptedObjectUploads? = nil,
          @bucket_count_by_shared_access_type : Types::BucketCountBySharedAccessType? = nil,
          @bucket_statistics_by_sensitivity : Types::BucketStatisticsBySensitivity? = nil,
          @classifiable_object_count : Int64? = nil,
          @classifiable_size_in_bytes : Int64? = nil,
          @last_updated : Time? = nil,
          @object_count : Int64? = nil,
          @size_in_bytes : Int64? = nil,
          @size_in_bytes_compressed : Int64? = nil,
          @unclassifiable_object_count : Types::ObjectLevelStatistics? = nil,
          @unclassifiable_object_size_in_bytes : Types::ObjectLevelStatistics? = nil
        )
        end
      end


      struct GetClassificationExportConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about the current configuration settings for storing data classification
      # results.

      struct GetClassificationExportConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ClassificationExportConfiguration?

        def initialize(
          @configuration : Types::ClassificationExportConfiguration? = nil
        )
        end
      end


      struct GetClassificationScopeRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Provides information about the classification scope settings for an Amazon Macie account. Macie uses
      # these settings when it performs automated sensitive data discovery for the account.

      struct GetClassificationScopeResponse
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3ClassificationScope?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @s3 : Types::S3ClassificationScope? = nil
        )
        end
      end


      struct GetCustomDataIdentifierRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Provides information about the detection criteria and other settings for a custom data identifier.

      struct GetCustomDataIdentifierResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "deleted")]
        getter deleted : Bool?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ignoreWords")]
        getter ignore_words : Array(String)?


        @[JSON::Field(key: "keywords")]
        getter keywords : Array(String)?


        @[JSON::Field(key: "maximumMatchDistance")]
        getter maximum_match_distance : Int32?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "regex")]
        getter regex : String?


        @[JSON::Field(key: "severityLevels")]
        getter severity_levels : Array(Types::SeverityLevel)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @deleted : Bool? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @ignore_words : Array(String)? = nil,
          @keywords : Array(String)? = nil,
          @maximum_match_distance : Int32? = nil,
          @name : String? = nil,
          @regex : String? = nil,
          @severity_levels : Array(Types::SeverityLevel)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies criteria for filtering, grouping, sorting, and paginating the results of a query that
      # retrieves aggregated statistical data about findings.

      struct GetFindingStatisticsRequest
        include JSON::Serializable


        @[JSON::Field(key: "groupBy")]
        getter group_by : String


        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria?


        @[JSON::Field(key: "size")]
        getter size : Int32?


        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::FindingStatisticsSortCriteria?

        def initialize(
          @group_by : String,
          @finding_criteria : Types::FindingCriteria? = nil,
          @size : Int32? = nil,
          @sort_criteria : Types::FindingStatisticsSortCriteria? = nil
        )
        end
      end

      # Provides the results of a query that retrieved aggregated statistical data about findings.

      struct GetFindingStatisticsResponse
        include JSON::Serializable


        @[JSON::Field(key: "countsByGroup")]
        getter counts_by_group : Array(Types::GroupCount)?

        def initialize(
          @counts_by_group : Array(Types::GroupCount)? = nil
        )
        end
      end


      struct GetFindingsFilterRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Provides information about the criteria and other settings for a findings filter.

      struct GetFindingsFilterResponse
        include JSON::Serializable


        @[JSON::Field(key: "action")]
        getter action : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "position")]
        getter position : Int32?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @action : String? = nil,
          @arn : String? = nil,
          @description : String? = nil,
          @finding_criteria : Types::FindingCriteria? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @position : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetFindingsPublicationConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about the current configuration settings for publishing findings to Security
      # Hub automatically.

      struct GetFindingsPublicationConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "securityHubConfiguration")]
        getter security_hub_configuration : Types::SecurityHubConfiguration?

        def initialize(
          @security_hub_configuration : Types::SecurityHubConfiguration? = nil
        )
        end
      end

      # Specifies one or more findings to retrieve.

      struct GetFindingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "findingIds")]
        getter finding_ids : Array(String)


        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::SortCriteria?

        def initialize(
          @finding_ids : Array(String),
          @sort_criteria : Types::SortCriteria? = nil
        )
        end
      end

      # Provides the results of a request for one or more findings.

      struct GetFindingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::Finding)?

        def initialize(
          @findings : Array(Types::Finding)? = nil
        )
        end
      end


      struct GetInvitationsCountRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Provides the count of all the Amazon Macie membership invitations that were received by an account,
      # not including the currently accepted invitation.

      struct GetInvitationsCountResponse
        include JSON::Serializable


        @[JSON::Field(key: "invitationsCount")]
        getter invitations_count : Int64?

        def initialize(
          @invitations_count : Int64? = nil
        )
        end
      end


      struct GetMacieSessionRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about the status and configuration settings for an Amazon Macie account.

      struct GetMacieSessionResponse
        include JSON::Serializable


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "findingPublishingFrequency")]
        getter finding_publishing_frequency : String?


        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @finding_publishing_frequency : String? = nil,
          @service_role : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetMasterAccountRequest
        include JSON::Serializable

        def initialize
        end
      end

      # (Deprecated) Provides information about the Amazon Macie administrator account for an account. If
      # the accounts are associated by a Macie membership invitation, the response also provides information
      # about that invitation.

      struct GetMasterAccountResponse
        include JSON::Serializable


        @[JSON::Field(key: "master")]
        getter master : Types::Invitation?

        def initialize(
          @master : Types::Invitation? = nil
        )
        end
      end


      struct GetMemberRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Provides information about an account that's associated with an Amazon Macie administrator account.

      struct GetMemberResponse
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "administratorAccountId")]
        getter administrator_account_id : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "email")]
        getter email : String?


        @[JSON::Field(key: "invitedAt")]
        getter invited_at : Time?


        @[JSON::Field(key: "masterAccountId")]
        getter master_account_id : String?


        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @account_id : String? = nil,
          @administrator_account_id : String? = nil,
          @arn : String? = nil,
          @email : String? = nil,
          @invited_at : Time? = nil,
          @master_account_id : String? = nil,
          @relationship_status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetResourceProfileRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # Provides sensitive data discovery statistics and the sensitivity score for an S3 bucket that Amazon
      # Macie monitors and analyzes for an account. This data is available only if automated sensitive data
      # discovery has been enabled for the account.

      struct GetResourceProfileResponse
        include JSON::Serializable


        @[JSON::Field(key: "profileUpdatedAt")]
        getter profile_updated_at : Time?


        @[JSON::Field(key: "sensitivityScore")]
        getter sensitivity_score : Int32?


        @[JSON::Field(key: "sensitivityScoreOverridden")]
        getter sensitivity_score_overridden : Bool?


        @[JSON::Field(key: "statistics")]
        getter statistics : Types::ResourceStatistics?

        def initialize(
          @profile_updated_at : Time? = nil,
          @sensitivity_score : Int32? = nil,
          @sensitivity_score_overridden : Bool? = nil,
          @statistics : Types::ResourceStatistics? = nil
        )
        end
      end


      struct GetRevealConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about the configuration settings for retrieving occurrences of sensitive data
      # reported by findings, and the status of the configuration for an Amazon Macie account.

      struct GetRevealConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RevealConfiguration?


        @[JSON::Field(key: "retrievalConfiguration")]
        getter retrieval_configuration : Types::RetrievalConfiguration?

        def initialize(
          @configuration : Types::RevealConfiguration? = nil,
          @retrieval_configuration : Types::RetrievalConfiguration? = nil
        )
        end
      end


      struct GetSensitiveDataOccurrencesAvailabilityRequest
        include JSON::Serializable


        @[JSON::Field(key: "findingId")]
        getter finding_id : String

        def initialize(
          @finding_id : String
        )
        end
      end

      # Provides information about whether occurrences of sensitive data can be retrieved for a finding and,
      # if not, why the data can't be retrieved.

      struct GetSensitiveDataOccurrencesAvailabilityResponse
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "reasons")]
        getter reasons : Array(String)?

        def initialize(
          @code : String? = nil,
          @reasons : Array(String)? = nil
        )
        end
      end


      struct GetSensitiveDataOccurrencesRequest
        include JSON::Serializable


        @[JSON::Field(key: "findingId")]
        getter finding_id : String

        def initialize(
          @finding_id : String
        )
        end
      end

      # Provides the results of a request to retrieve occurrences of sensitive data reported by a finding.

      struct GetSensitiveDataOccurrencesResponse
        include JSON::Serializable


        @[JSON::Field(key: "error")]
        getter error : String?


        @[JSON::Field(key: "sensitiveDataOccurrences")]
        getter sensitive_data_occurrences : Hash(String, Array(Types::DetectedDataDetails))?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error : String? = nil,
          @sensitive_data_occurrences : Hash(String, Array(Types::DetectedDataDetails))? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetSensitivityInspectionTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Provides information about the settings for the sensitivity inspection template for an Amazon Macie
      # account.

      struct GetSensitivityInspectionTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "excludes")]
        getter excludes : Types::SensitivityInspectionTemplateExcludes?


        @[JSON::Field(key: "includes")]
        getter includes : Types::SensitivityInspectionTemplateIncludes?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "sensitivityInspectionTemplateId")]
        getter sensitivity_inspection_template_id : String?

        def initialize(
          @description : String? = nil,
          @excludes : Types::SensitivityInspectionTemplateExcludes? = nil,
          @includes : Types::SensitivityInspectionTemplateIncludes? = nil,
          @name : String? = nil,
          @sensitivity_inspection_template_id : String? = nil
        )
        end
      end

      # Specifies criteria for filtering, sorting, and paginating the results of a query for quotas and
      # aggregated usage data for one or more Amazon Macie accounts.

      struct GetUsageStatisticsRequest
        include JSON::Serializable


        @[JSON::Field(key: "filterBy")]
        getter filter_by : Array(Types::UsageStatisticsFilter)?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::UsageStatisticsSortBy?


        @[JSON::Field(key: "timeRange")]
        getter time_range : String?

        def initialize(
          @filter_by : Array(Types::UsageStatisticsFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::UsageStatisticsSortBy? = nil,
          @time_range : String? = nil
        )
        end
      end

      # Provides the results of a query that retrieved quotas and aggregated usage data for one or more
      # Amazon Macie accounts.

      struct GetUsageStatisticsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "records")]
        getter records : Array(Types::UsageRecord)?


        @[JSON::Field(key: "timeRange")]
        getter time_range : String?

        def initialize(
          @next_token : String? = nil,
          @records : Array(Types::UsageRecord)? = nil,
          @time_range : String? = nil
        )
        end
      end


      struct GetUsageTotalsRequest
        include JSON::Serializable


        @[JSON::Field(key: "timeRange")]
        getter time_range : String?

        def initialize(
          @time_range : String? = nil
        )
        end
      end

      # Provides the results of a query that retrieved aggregated usage data for an Amazon Macie account.

      struct GetUsageTotalsResponse
        include JSON::Serializable


        @[JSON::Field(key: "timeRange")]
        getter time_range : String?


        @[JSON::Field(key: "usageTotals")]
        getter usage_totals : Array(Types::UsageTotal)?

        def initialize(
          @time_range : String? = nil,
          @usage_totals : Array(Types::UsageTotal)? = nil
        )
        end
      end

      # Provides a group of results for a query that retrieved aggregated statistical data about findings.

      struct GroupCount
        include JSON::Serializable


        @[JSON::Field(key: "count")]
        getter count : Int64?


        @[JSON::Field(key: "groupKey")]
        getter group_key : String?

        def initialize(
          @count : Int64? = nil,
          @group_key : String? = nil
        )
        end
      end

      # Provides information about an Identity and Access Management (IAM) user who performed an action on
      # an affected resource.

      struct IamUser
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "principalId")]
        getter principal_id : String?


        @[JSON::Field(key: "userName")]
        getter user_name : String?

        def initialize(
          @account_id : String? = nil,
          @arn : String? = nil,
          @principal_id : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Provides information about an error that occurred due to an unknown internal server error,
      # exception, or failure.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about an Amazon Macie membership invitation.

      struct Invitation
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "invitationId")]
        getter invitation_id : String?


        @[JSON::Field(key: "invitedAt")]
        getter invited_at : Time?


        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String?

        def initialize(
          @account_id : String? = nil,
          @invitation_id : String? = nil,
          @invited_at : Time? = nil,
          @relationship_status : String? = nil
        )
        end
      end

      # Provides information about the IP address of the device that an entity used to perform an action on
      # an affected resource.

      struct IpAddressDetails
        include JSON::Serializable


        @[JSON::Field(key: "ipAddressV4")]
        getter ip_address_v4 : String?


        @[JSON::Field(key: "ipCity")]
        getter ip_city : Types::IpCity?


        @[JSON::Field(key: "ipCountry")]
        getter ip_country : Types::IpCountry?


        @[JSON::Field(key: "ipGeoLocation")]
        getter ip_geo_location : Types::IpGeoLocation?


        @[JSON::Field(key: "ipOwner")]
        getter ip_owner : Types::IpOwner?

        def initialize(
          @ip_address_v4 : String? = nil,
          @ip_city : Types::IpCity? = nil,
          @ip_country : Types::IpCountry? = nil,
          @ip_geo_location : Types::IpGeoLocation? = nil,
          @ip_owner : Types::IpOwner? = nil
        )
        end
      end

      # Provides information about the city that an IP address originated from.

      struct IpCity
        include JSON::Serializable


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Provides information about the country that an IP address originated from.

      struct IpCountry
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @code : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Provides geographic coordinates that indicate where a specified IP address originated from.

      struct IpGeoLocation
        include JSON::Serializable


        @[JSON::Field(key: "lat")]
        getter lat : Float64?


        @[JSON::Field(key: "lon")]
        getter lon : Float64?

        def initialize(
          @lat : Float64? = nil,
          @lon : Float64? = nil
        )
        end
      end

      # Provides information about the registered owner of an IP address.

      struct IpOwner
        include JSON::Serializable


        @[JSON::Field(key: "asn")]
        getter asn : String?


        @[JSON::Field(key: "asnOrg")]
        getter asn_org : String?


        @[JSON::Field(key: "isp")]
        getter isp : String?


        @[JSON::Field(key: "org")]
        getter org : String?

        def initialize(
          @asn : String? = nil,
          @asn_org : String? = nil,
          @isp : String? = nil,
          @org : String? = nil
        )
        end
      end

      # Specifies whether any one-time or recurring classification jobs are configured to analyze objects in
      # an S3 bucket, and, if so, the details of the job that ran most recently.

      struct JobDetails
        include JSON::Serializable


        @[JSON::Field(key: "isDefinedInJob")]
        getter is_defined_in_job : String?


        @[JSON::Field(key: "isMonitoredByJob")]
        getter is_monitored_by_job : String?


        @[JSON::Field(key: "lastJobId")]
        getter last_job_id : String?


        @[JSON::Field(key: "lastJobRunTime")]
        getter last_job_run_time : Time?

        def initialize(
          @is_defined_in_job : String? = nil,
          @is_monitored_by_job : String? = nil,
          @last_job_id : String? = nil,
          @last_job_run_time : Time? = nil
        )
        end
      end

      # Specifies the recurrence pattern for running a classification job.

      struct JobScheduleFrequency
        include JSON::Serializable


        @[JSON::Field(key: "dailySchedule")]
        getter daily_schedule : Types::DailySchedule?


        @[JSON::Field(key: "monthlySchedule")]
        getter monthly_schedule : Types::MonthlySchedule?


        @[JSON::Field(key: "weeklySchedule")]
        getter weekly_schedule : Types::WeeklySchedule?

        def initialize(
          @daily_schedule : Types::DailySchedule? = nil,
          @monthly_schedule : Types::MonthlySchedule? = nil,
          @weekly_schedule : Types::WeeklySchedule? = nil
        )
        end
      end

      # Specifies a property- or tag-based condition that defines criteria for including or excluding S3
      # objects from a classification job. A JobScopeTerm object can contain only one simpleScopeTerm object
      # or one tagScopeTerm object.

      struct JobScopeTerm
        include JSON::Serializable


        @[JSON::Field(key: "simpleScopeTerm")]
        getter simple_scope_term : Types::SimpleScopeTerm?


        @[JSON::Field(key: "tagScopeTerm")]
        getter tag_scope_term : Types::TagScopeTerm?

        def initialize(
          @simple_scope_term : Types::SimpleScopeTerm? = nil,
          @tag_scope_term : Types::TagScopeTerm? = nil
        )
        end
      end

      # Specifies one or more property- and tag-based conditions that define criteria for including or
      # excluding S3 objects from a classification job.

      struct JobScopingBlock
        include JSON::Serializable


        @[JSON::Field(key: "and")]
        getter and : Array(Types::JobScopeTerm)?

        def initialize(
          @and : Array(Types::JobScopeTerm)? = nil
        )
        end
      end

      # Provides information about a classification job, including the current status of the job.

      struct JobSummary
        include JSON::Serializable


        @[JSON::Field(key: "bucketCriteria")]
        getter bucket_criteria : Types::S3BucketCriteriaForJob?


        @[JSON::Field(key: "bucketDefinitions")]
        getter bucket_definitions : Array(Types::S3BucketDefinitionForJob)?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "jobId")]
        getter job_id : String?


        @[JSON::Field(key: "jobStatus")]
        getter job_status : String?


        @[JSON::Field(key: "jobType")]
        getter job_type : String?


        @[JSON::Field(key: "lastRunErrorStatus")]
        getter last_run_error_status : Types::LastRunErrorStatus?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "userPausedDetails")]
        getter user_paused_details : Types::UserPausedDetails?

        def initialize(
          @bucket_criteria : Types::S3BucketCriteriaForJob? = nil,
          @bucket_definitions : Array(Types::S3BucketDefinitionForJob)? = nil,
          @created_at : Time? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_type : String? = nil,
          @last_run_error_status : Types::LastRunErrorStatus? = nil,
          @name : String? = nil,
          @user_paused_details : Types::UserPausedDetails? = nil
        )
        end
      end

      # Provides information about the tags that are associated with an S3 bucket or object. Each tag
      # consists of a required tag key and an associated tag value.

      struct KeyValuePair
        include JSON::Serializable


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Specifies whether any account- or bucket-level access errors occurred when a classification job ran.
      # For information about using logging data to investigate these errors, see Monitoring sensitive data
      # discovery jobs in the Amazon Macie User Guide .

      struct LastRunErrorStatus
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?

        def initialize(
          @code : String? = nil
        )
        end
      end


      struct ListAllowListsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Provides the results of a request for information about allow lists.

      struct ListAllowListsResponse
        include JSON::Serializable


        @[JSON::Field(key: "allowLists")]
        getter allow_lists : Array(Types::AllowListSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @allow_lists : Array(Types::AllowListSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomatedDiscoveryAccountsRequest
        include JSON::Serializable


        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Provides information about the status of automated sensitive data discovery for one or more Amazon
      # Macie accounts.

      struct ListAutomatedDiscoveryAccountsResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::AutomatedDiscoveryAccount)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::AutomatedDiscoveryAccount)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Specifies criteria for filtering, sorting, and paginating the results of a request for information
      # about classification jobs.

      struct ListClassificationJobsRequest
        include JSON::Serializable


        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::ListJobsFilterCriteria?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::ListJobsSortCriteria?

        def initialize(
          @filter_criteria : Types::ListJobsFilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::ListJobsSortCriteria? = nil
        )
        end
      end

      # Provides the results of a request for information about one or more classification jobs.

      struct ListClassificationJobsResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::JobSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::JobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClassificationScopesRequest
        include JSON::Serializable


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Provides the results of a request for information about the classification scope for an Amazon Macie
      # account. Macie uses the scope's settings when it performs automated sensitive data discovery for the
      # account.

      struct ListClassificationScopesResponse
        include JSON::Serializable


        @[JSON::Field(key: "classificationScopes")]
        getter classification_scopes : Array(Types::ClassificationScopeSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @classification_scopes : Array(Types::ClassificationScopeSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Specifies criteria for paginating the results of a request for information about custom data
      # identifiers.

      struct ListCustomDataIdentifiersRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Provides the results of a request for information about custom data identifiers.

      struct ListCustomDataIdentifiersResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::CustomDataIdentifierSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::CustomDataIdentifierSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFindingsFiltersRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Provides information about all the findings filters for an account.

      struct ListFindingsFiltersResponse
        include JSON::Serializable


        @[JSON::Field(key: "findingsFilterListItems")]
        getter findings_filter_list_items : Array(Types::FindingsFilterListItem)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @findings_filter_list_items : Array(Types::FindingsFilterListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Specifies criteria for filtering, sorting, and paginating the results of a request for information
      # about findings.

      struct ListFindingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::SortCriteria?

        def initialize(
          @finding_criteria : Types::FindingCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::SortCriteria? = nil
        )
        end
      end

      # Provides the results of a request for information about one or more findings.

      struct ListFindingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "findingIds")]
        getter finding_ids : Array(String)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @finding_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInvitationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Provides information about the Amazon Macie membership invitations that were received by an account.

      struct ListInvitationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "invitations")]
        getter invitations : Array(Types::Invitation)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @invitations : Array(Types::Invitation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Specifies criteria for filtering the results of a request for information about classification jobs.

      struct ListJobsFilterCriteria
        include JSON::Serializable


        @[JSON::Field(key: "excludes")]
        getter excludes : Array(Types::ListJobsFilterTerm)?


        @[JSON::Field(key: "includes")]
        getter includes : Array(Types::ListJobsFilterTerm)?

        def initialize(
          @excludes : Array(Types::ListJobsFilterTerm)? = nil,
          @includes : Array(Types::ListJobsFilterTerm)? = nil
        )
        end
      end

      # Specifies a condition that filters the results of a request for information about classification
      # jobs. Each condition consists of a property, an operator, and one or more values.

      struct ListJobsFilterTerm
        include JSON::Serializable


        @[JSON::Field(key: "comparator")]
        getter comparator : String?


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @comparator : String? = nil,
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Specifies criteria for sorting the results of a request for information about classification jobs.

      struct ListJobsSortCriteria
        include JSON::Serializable


        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?


        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @attribute_name : String? = nil,
          @order_by : String? = nil
        )
        end
      end

      # Specifies criteria for paginating the results of a request for information about managed data
      # identifiers.

      struct ListManagedDataIdentifiersRequest
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # Provides information about the managed data identifiers that Amazon Macie currently provides.

      struct ListManagedDataIdentifiersResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::ManagedDataIdentifierSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ManagedDataIdentifierSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMembersRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "onlyAssociated")]
        getter only_associated : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @only_associated : String? = nil
        )
        end
      end

      # Provides information about the accounts that are associated with an Amazon Macie administrator
      # account.

      struct ListMembersResponse
        include JSON::Serializable


        @[JSON::Field(key: "members")]
        getter members : Array(Types::Member)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::Member)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOrganizationAdminAccountsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Provides information about the delegated Amazon Macie administrator accounts for an organization in
      # Organizations.

      struct ListOrganizationAdminAccountsResponse
        include JSON::Serializable


        @[JSON::Field(key: "adminAccounts")]
        getter admin_accounts : Array(Types::AdminAccount)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @admin_accounts : Array(Types::AdminAccount)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceProfileArtifactsRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @next_token : String? = nil
        )
        end
      end

      # Provides information about objects that Amazon Macie selected from an S3 bucket while performing
      # automated sensitive data discovery for an account. This information is available only if automated
      # sensitive data discovery has been enabled for the account.

      struct ListResourceProfileArtifactsResponse
        include JSON::Serializable


        @[JSON::Field(key: "artifacts")]
        getter artifacts : Array(Types::ResourceProfileArtifact)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @artifacts : Array(Types::ResourceProfileArtifact)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceProfileDetectionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Provides information about the types and amount of sensitive data that Amazon Macie found in an S3
      # bucket while performing automated sensitive data discovery for an account. This information is
      # available only if automated sensitive data discovery has been enabled for the account.

      struct ListResourceProfileDetectionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "detections")]
        getter detections : Array(Types::Detection)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detections : Array(Types::Detection)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSensitivityInspectionTemplatesRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Provides the results of a request for information about the sensitivity inspection template for an
      # Amazon Macie account.

      struct ListSensitivityInspectionTemplatesResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "sensitivityInspectionTemplates")]
        getter sensitivity_inspection_templates : Array(Types::SensitivityInspectionTemplatesEntry)?

        def initialize(
          @next_token : String? = nil,
          @sensitivity_inspection_templates : Array(Types::SensitivityInspectionTemplatesEntry)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # Provides information about the tags (keys and values) that are associated with an Amazon Macie
      # resource.

      struct ListTagsForResourceResponse
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about a managed data identifier. For additional information, see Using managed
      # data identifiers in the Amazon Macie User Guide .

      struct ManagedDataIdentifierSummary
        include JSON::Serializable


        @[JSON::Field(key: "category")]
        getter category : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @category : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Provides statistical data and other information about an S3 bucket that Amazon Macie monitors and
      # analyzes for your account. By default, object count and storage size values include data for object
      # parts that are the result of incomplete multipart uploads. For more information, see How Macie
      # monitors Amazon S3 data security in the Amazon Macie User Guide . If an error or issue prevents
      # Macie from retrieving and processing information about the bucket or the bucket's objects, the value
      # for many of these properties is null. Key exceptions are accountId and bucketName. To identify the
      # cause, refer to the errorCode and errorMessage values.

      struct MatchingBucket
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "automatedDiscoveryMonitoringStatus")]
        getter automated_discovery_monitoring_status : String?


        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?


        @[JSON::Field(key: "classifiableObjectCount")]
        getter classifiable_object_count : Int64?


        @[JSON::Field(key: "classifiableSizeInBytes")]
        getter classifiable_size_in_bytes : Int64?


        @[JSON::Field(key: "errorCode")]
        getter error_code : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "jobDetails")]
        getter job_details : Types::JobDetails?


        @[JSON::Field(key: "lastAutomatedDiscoveryTime")]
        getter last_automated_discovery_time : Time?


        @[JSON::Field(key: "objectCount")]
        getter object_count : Int64?


        @[JSON::Field(key: "objectCountByEncryptionType")]
        getter object_count_by_encryption_type : Types::ObjectCountByEncryptionType?


        @[JSON::Field(key: "sensitivityScore")]
        getter sensitivity_score : Int32?


        @[JSON::Field(key: "sizeInBytes")]
        getter size_in_bytes : Int64?


        @[JSON::Field(key: "sizeInBytesCompressed")]
        getter size_in_bytes_compressed : Int64?


        @[JSON::Field(key: "unclassifiableObjectCount")]
        getter unclassifiable_object_count : Types::ObjectLevelStatistics?


        @[JSON::Field(key: "unclassifiableObjectSizeInBytes")]
        getter unclassifiable_object_size_in_bytes : Types::ObjectLevelStatistics?

        def initialize(
          @account_id : String? = nil,
          @automated_discovery_monitoring_status : String? = nil,
          @bucket_name : String? = nil,
          @classifiable_object_count : Int64? = nil,
          @classifiable_size_in_bytes : Int64? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @job_details : Types::JobDetails? = nil,
          @last_automated_discovery_time : Time? = nil,
          @object_count : Int64? = nil,
          @object_count_by_encryption_type : Types::ObjectCountByEncryptionType? = nil,
          @sensitivity_score : Int32? = nil,
          @size_in_bytes : Int64? = nil,
          @size_in_bytes_compressed : Int64? = nil,
          @unclassifiable_object_count : Types::ObjectLevelStatistics? = nil,
          @unclassifiable_object_size_in_bytes : Types::ObjectLevelStatistics? = nil
        )
        end
      end

      # Provides statistical data and other information about an Amazon Web Services resource that Amazon
      # Macie monitors and analyzes for your account.

      struct MatchingResource
        include JSON::Serializable


        @[JSON::Field(key: "matchingBucket")]
        getter matching_bucket : Types::MatchingBucket?

        def initialize(
          @matching_bucket : Types::MatchingBucket? = nil
        )
        end
      end

      # Provides information about an account that's associated with an Amazon Macie administrator account.

      struct Member
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "administratorAccountId")]
        getter administrator_account_id : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "email")]
        getter email : String?


        @[JSON::Field(key: "invitedAt")]
        getter invited_at : Time?


        @[JSON::Field(key: "masterAccountId")]
        getter master_account_id : String?


        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @account_id : String? = nil,
          @administrator_account_id : String? = nil,
          @arn : String? = nil,
          @email : String? = nil,
          @invited_at : Time? = nil,
          @master_account_id : String? = nil,
          @relationship_status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Specifies a monthly recurrence pattern for running a classification job.

      struct MonthlySchedule
        include JSON::Serializable


        @[JSON::Field(key: "dayOfMonth")]
        getter day_of_month : Int32?

        def initialize(
          @day_of_month : Int32? = nil
        )
        end
      end

      # Provides information about the number of objects that are in an S3 bucket and use certain types of
      # server-side encryption, use client-side encryption, or aren't encrypted.

      struct ObjectCountByEncryptionType
        include JSON::Serializable


        @[JSON::Field(key: "customerManaged")]
        getter customer_managed : Int64?


        @[JSON::Field(key: "kmsManaged")]
        getter kms_managed : Int64?


        @[JSON::Field(key: "s3Managed")]
        getter s3_managed : Int64?


        @[JSON::Field(key: "unencrypted")]
        getter unencrypted : Int64?


        @[JSON::Field(key: "unknown")]
        getter unknown : Int64?

        def initialize(
          @customer_managed : Int64? = nil,
          @kms_managed : Int64? = nil,
          @s3_managed : Int64? = nil,
          @unencrypted : Int64? = nil,
          @unknown : Int64? = nil
        )
        end
      end

      # Provides information about the total storage size (in bytes) or number of objects that Amazon Macie
      # can't analyze in one or more S3 buckets. In a BucketMetadata or MatchingBucket object, this data is
      # for a specific bucket. In a GetBucketStatisticsResponse object, this data is aggregated for all the
      # buckets in the query results. If versioning is enabled for a bucket, storage size values are based
      # on the size of the latest version of each applicable object in the bucket.

      struct ObjectLevelStatistics
        include JSON::Serializable


        @[JSON::Field(key: "fileType")]
        getter file_type : Int64?


        @[JSON::Field(key: "storageClass")]
        getter storage_class : Int64?


        @[JSON::Field(key: "total")]
        getter total : Int64?

        def initialize(
          @file_type : Int64? = nil,
          @storage_class : Int64? = nil,
          @total : Int64? = nil
        )
        end
      end

      # Specifies the location of 1-15 occurrences of sensitive data that was detected by a managed data
      # identifier or a custom data identifier and produced a sensitive data finding.

      struct Occurrences
        include JSON::Serializable


        @[JSON::Field(key: "cells")]
        getter cells : Array(Types::Cell)?


        @[JSON::Field(key: "lineRanges")]
        getter line_ranges : Array(Types::Range)?


        @[JSON::Field(key: "offsetRanges")]
        getter offset_ranges : Array(Types::Range)?


        @[JSON::Field(key: "pages")]
        getter pages : Array(Types::Page)?


        @[JSON::Field(key: "records")]
        getter records : Array(Types::Record)?

        def initialize(
          @cells : Array(Types::Cell)? = nil,
          @line_ranges : Array(Types::Range)? = nil,
          @offset_ranges : Array(Types::Range)? = nil,
          @pages : Array(Types::Page)? = nil,
          @records : Array(Types::Record)? = nil
        )
        end
      end

      # Specifies the location of an occurrence of sensitive data in an Adobe Portable Document Format file.

      struct Page
        include JSON::Serializable


        @[JSON::Field(key: "lineRange")]
        getter line_range : Types::Range?


        @[JSON::Field(key: "offsetRange")]
        getter offset_range : Types::Range?


        @[JSON::Field(key: "pageNumber")]
        getter page_number : Int64?

        def initialize(
          @line_range : Types::Range? = nil,
          @offset_range : Types::Range? = nil,
          @page_number : Int64? = nil
        )
        end
      end

      # Provides the details of a policy finding.

      struct PolicyDetails
        include JSON::Serializable


        @[JSON::Field(key: "action")]
        getter action : Types::FindingAction?


        @[JSON::Field(key: "actor")]
        getter actor : Types::FindingActor?

        def initialize(
          @action : Types::FindingAction? = nil,
          @actor : Types::FindingActor? = nil
        )
        end
      end

      # Specifies where to store data classification results, and the encryption settings to use when
      # storing results in that location.

      struct PutClassificationExportConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ClassificationExportConfiguration

        def initialize(
          @configuration : Types::ClassificationExportConfiguration
        )
        end
      end

      # Provides information about updated settings for storing data classification results.

      struct PutClassificationExportConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ClassificationExportConfiguration?

        def initialize(
          @configuration : Types::ClassificationExportConfiguration? = nil
        )
        end
      end

      # Specifies configuration settings for publishing findings to Security Hub automatically.

      struct PutFindingsPublicationConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "securityHubConfiguration")]
        getter security_hub_configuration : Types::SecurityHubConfiguration?

        def initialize(
          @client_token : String? = nil,
          @security_hub_configuration : Types::SecurityHubConfiguration? = nil
        )
        end
      end


      struct PutFindingsPublicationConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the location of an occurrence of sensitive data in an email message or a non-binary text
      # file such as an HTML, TXT, or XML file.

      struct Range
        include JSON::Serializable


        @[JSON::Field(key: "end")]
        getter end : Int64?


        @[JSON::Field(key: "start")]
        getter start : Int64?


        @[JSON::Field(key: "startColumn")]
        getter start_column : Int64?

        def initialize(
          @end : Int64? = nil,
          @start : Int64? = nil,
          @start_column : Int64? = nil
        )
        end
      end

      # Specifies the location of an occurrence of sensitive data in an Apache Avro object container, Apache
      # Parquet file, JSON file, or JSON Lines file.

      struct Record
        include JSON::Serializable


        @[JSON::Field(key: "jsonPath")]
        getter json_path : String?


        @[JSON::Field(key: "recordIndex")]
        getter record_index : Int64?

        def initialize(
          @json_path : String? = nil,
          @record_index : Int64? = nil
        )
        end
      end

      # Provides information about settings that define whether one or more objects in an S3 bucket are
      # replicated to S3 buckets for other Amazon Web Services accounts and, if so, which accounts.

      struct ReplicationDetails
        include JSON::Serializable


        @[JSON::Field(key: "replicated")]
        getter replicated : Bool?


        @[JSON::Field(key: "replicatedExternally")]
        getter replicated_externally : Bool?


        @[JSON::Field(key: "replicationAccounts")]
        getter replication_accounts : Array(String)?

        def initialize(
          @replicated : Bool? = nil,
          @replicated_externally : Bool? = nil,
          @replication_accounts : Array(String)? = nil
        )
        end
      end

      # Provides information about an error that occurred because a specified resource wasn't found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about an S3 object that Amazon Macie selected for analysis while performing
      # automated sensitive data discovery for an account, and the status and results of the analysis. This
      # information is available only if automated sensitive data discovery has been enabled for the
      # account.

      struct ResourceProfileArtifact
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "classificationResultStatus")]
        getter classification_result_status : String


        @[JSON::Field(key: "sensitive")]
        getter sensitive : Bool?

        def initialize(
          @arn : String,
          @classification_result_status : String,
          @sensitive : Bool? = nil
        )
        end
      end

      # Provides statistical data for sensitive data discovery metrics that apply to an S3 bucket that
      # Amazon Macie monitors and analyzes for an account, if automated sensitive data discovery has been
      # enabled for the account. The data captures the results of automated sensitive data discovery
      # activities that Macie has performed for the bucket.

      struct ResourceStatistics
        include JSON::Serializable


        @[JSON::Field(key: "totalBytesClassified")]
        getter total_bytes_classified : Int64?


        @[JSON::Field(key: "totalDetections")]
        getter total_detections : Int64?


        @[JSON::Field(key: "totalDetectionsSuppressed")]
        getter total_detections_suppressed : Int64?


        @[JSON::Field(key: "totalItemsClassified")]
        getter total_items_classified : Int64?


        @[JSON::Field(key: "totalItemsSensitive")]
        getter total_items_sensitive : Int64?


        @[JSON::Field(key: "totalItemsSkipped")]
        getter total_items_skipped : Int64?


        @[JSON::Field(key: "totalItemsSkippedInvalidEncryption")]
        getter total_items_skipped_invalid_encryption : Int64?


        @[JSON::Field(key: "totalItemsSkippedInvalidKms")]
        getter total_items_skipped_invalid_kms : Int64?


        @[JSON::Field(key: "totalItemsSkippedPermissionDenied")]
        getter total_items_skipped_permission_denied : Int64?

        def initialize(
          @total_bytes_classified : Int64? = nil,
          @total_detections : Int64? = nil,
          @total_detections_suppressed : Int64? = nil,
          @total_items_classified : Int64? = nil,
          @total_items_sensitive : Int64? = nil,
          @total_items_skipped : Int64? = nil,
          @total_items_skipped_invalid_encryption : Int64? = nil,
          @total_items_skipped_invalid_kms : Int64? = nil,
          @total_items_skipped_permission_denied : Int64? = nil
        )
        end
      end

      # Provides information about the resources that a finding applies to.

      struct ResourcesAffected
        include JSON::Serializable


        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : Types::S3Bucket?


        @[JSON::Field(key: "s3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @s3_bucket : Types::S3Bucket? = nil,
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Provides information about the access method and settings that are used to retrieve occurrences of
      # sensitive data reported by findings.

      struct RetrievalConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "retrievalMode")]
        getter retrieval_mode : String


        @[JSON::Field(key: "externalId")]
        getter external_id : String?


        @[JSON::Field(key: "roleName")]
        getter role_name : String?

        def initialize(
          @retrieval_mode : String,
          @external_id : String? = nil,
          @role_name : String? = nil
        )
        end
      end

      # Specifies the status of the Amazon Macie configuration for retrieving occurrences of sensitive data
      # reported by findings, and the Key Management Service (KMS) key to use to encrypt sensitive data
      # that's retrieved. When you enable the configuration for the first time, your request must specify an
      # KMS key. Otherwise, an error occurs.

      struct RevealConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @status : String,
          @kms_key_id : String? = nil
        )
        end
      end

      # Provides information about the S3 bucket that a finding applies to. If a quota prevented Amazon
      # Macie from retrieving and processing all the bucket's information prior to generating the finding,
      # the following values are UNKNOWN or null: allowsUnencryptedObjectUploads,
      # defaultServerSideEncryption, publicAccess, and tags.

      struct S3Bucket
        include JSON::Serializable


        @[JSON::Field(key: "allowsUnencryptedObjectUploads")]
        getter allows_unencrypted_object_uploads : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "defaultServerSideEncryption")]
        getter default_server_side_encryption : Types::ServerSideEncryption?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "owner")]
        getter owner : Types::S3BucketOwner?


        @[JSON::Field(key: "publicAccess")]
        getter public_access : Types::BucketPublicAccess?


        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::KeyValuePair)?

        def initialize(
          @allows_unencrypted_object_uploads : String? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @default_server_side_encryption : Types::ServerSideEncryption? = nil,
          @name : String? = nil,
          @owner : Types::S3BucketOwner? = nil,
          @public_access : Types::BucketPublicAccess? = nil,
          @tags : Array(Types::KeyValuePair)? = nil
        )
        end
      end

      # Specifies property- and tag-based conditions that define criteria for including or excluding S3
      # buckets from a classification job. Exclude conditions take precedence over include conditions.

      struct S3BucketCriteriaForJob
        include JSON::Serializable


        @[JSON::Field(key: "excludes")]
        getter excludes : Types::CriteriaBlockForJob?


        @[JSON::Field(key: "includes")]
        getter includes : Types::CriteriaBlockForJob?

        def initialize(
          @excludes : Types::CriteriaBlockForJob? = nil,
          @includes : Types::CriteriaBlockForJob? = nil
        )
        end
      end

      # Specifies an Amazon Web Services account that owns S3 buckets for a classification job to analyze,
      # and one or more specific buckets to analyze for that account.

      struct S3BucketDefinitionForJob
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String


        @[JSON::Field(key: "buckets")]
        getter buckets : Array(String)

        def initialize(
          @account_id : String,
          @buckets : Array(String)
        )
        end
      end

      # Provides information about the Amazon Web Services account that owns an S3 bucket.

      struct S3BucketOwner
        include JSON::Serializable


        @[JSON::Field(key: "displayName")]
        getter display_name : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @display_name : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Specifies the S3 buckets that are excluded from automated sensitive data discovery for an Amazon
      # Macie account.

      struct S3ClassificationScope
        include JSON::Serializable


        @[JSON::Field(key: "excludes")]
        getter excludes : Types::S3ClassificationScopeExclusion

        def initialize(
          @excludes : Types::S3ClassificationScopeExclusion
        )
        end
      end

      # Specifies the names of the S3 buckets that are excluded from automated sensitive data discovery.

      struct S3ClassificationScopeExclusion
        include JSON::Serializable


        @[JSON::Field(key: "bucketNames")]
        getter bucket_names : Array(String)

        def initialize(
          @bucket_names : Array(String)
        )
        end
      end

      # Specifies S3 buckets to add or remove from the exclusion list defined by the classification scope
      # for an Amazon Macie account.

      struct S3ClassificationScopeExclusionUpdate
        include JSON::Serializable


        @[JSON::Field(key: "bucketNames")]
        getter bucket_names : Array(String)


        @[JSON::Field(key: "operation")]
        getter operation : String

        def initialize(
          @bucket_names : Array(String),
          @operation : String
        )
        end
      end

      # Specifies changes to the list of S3 buckets that are excluded from automated sensitive data
      # discovery for an Amazon Macie account.

      struct S3ClassificationScopeUpdate
        include JSON::Serializable


        @[JSON::Field(key: "excludes")]
        getter excludes : Types::S3ClassificationScopeExclusionUpdate

        def initialize(
          @excludes : Types::S3ClassificationScopeExclusionUpdate
        )
        end
      end

      # Specifies an S3 bucket to store data classification results in, and the encryption settings to use
      # when storing results in that bucket.

      struct S3Destination
        include JSON::Serializable


        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String


        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String


        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket_name : String,
          @kms_key_arn : String,
          @key_prefix : String? = nil
        )
        end
      end

      # Specifies which S3 buckets contain the objects that a classification job analyzes, and the scope of
      # that analysis. The bucket specification can be static (bucketDefinitions) or dynamic
      # (bucketCriteria). If it's static, the job analyzes objects in the same predefined set of buckets
      # each time the job runs. If it's dynamic, the job analyzes objects in any buckets that match the
      # specified criteria each time the job starts to run.

      struct S3JobDefinition
        include JSON::Serializable


        @[JSON::Field(key: "bucketCriteria")]
        getter bucket_criteria : Types::S3BucketCriteriaForJob?


        @[JSON::Field(key: "bucketDefinitions")]
        getter bucket_definitions : Array(Types::S3BucketDefinitionForJob)?


        @[JSON::Field(key: "scoping")]
        getter scoping : Types::Scoping?

        def initialize(
          @bucket_criteria : Types::S3BucketCriteriaForJob? = nil,
          @bucket_definitions : Array(Types::S3BucketDefinitionForJob)? = nil,
          @scoping : Types::Scoping? = nil
        )
        end
      end

      # Provides information about the S3 object that a finding applies to.

      struct S3Object
        include JSON::Serializable


        @[JSON::Field(key: "bucketArn")]
        getter bucket_arn : String?


        @[JSON::Field(key: "eTag")]
        getter e_tag : String?


        @[JSON::Field(key: "extension")]
        getter extension : String?


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "path")]
        getter path : String?


        @[JSON::Field(key: "publicAccess")]
        getter public_access : Bool?


        @[JSON::Field(key: "serverSideEncryption")]
        getter server_side_encryption : Types::ServerSideEncryption?


        @[JSON::Field(key: "size")]
        getter size : Int64?


        @[JSON::Field(key: "storageClass")]
        getter storage_class : String?


        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::KeyValuePair)?


        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket_arn : String? = nil,
          @e_tag : String? = nil,
          @extension : String? = nil,
          @key : String? = nil,
          @last_modified : Time? = nil,
          @path : String? = nil,
          @public_access : Bool? = nil,
          @server_side_encryption : Types::ServerSideEncryption? = nil,
          @size : Int64? = nil,
          @storage_class : String? = nil,
          @tags : Array(Types::KeyValuePair)? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Provides information about an S3 object that lists specific text to ignore.

      struct S3WordsList
        include JSON::Serializable


        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String


        @[JSON::Field(key: "objectKey")]
        getter object_key : String

        def initialize(
          @bucket_name : String,
          @object_key : String
        )
        end
      end

      # Specifies one or more property- and tag-based conditions that define criteria for including or
      # excluding S3 objects from a classification job. Exclude conditions take precedence over include
      # conditions.

      struct Scoping
        include JSON::Serializable


        @[JSON::Field(key: "excludes")]
        getter excludes : Types::JobScopingBlock?


        @[JSON::Field(key: "includes")]
        getter includes : Types::JobScopingBlock?

        def initialize(
          @excludes : Types::JobScopingBlock? = nil,
          @includes : Types::JobScopingBlock? = nil
        )
        end
      end

      # Specifies property- and tag-based conditions that define filter criteria for including or excluding
      # S3 buckets from the query results. Exclude conditions take precedence over include conditions.

      struct SearchResourcesBucketCriteria
        include JSON::Serializable


        @[JSON::Field(key: "excludes")]
        getter excludes : Types::SearchResourcesCriteriaBlock?


        @[JSON::Field(key: "includes")]
        getter includes : Types::SearchResourcesCriteriaBlock?

        def initialize(
          @excludes : Types::SearchResourcesCriteriaBlock? = nil,
          @includes : Types::SearchResourcesCriteriaBlock? = nil
        )
        end
      end

      # Specifies a property- or tag-based filter condition for including or excluding Amazon Web Services
      # resources from the query results.

      struct SearchResourcesCriteria
        include JSON::Serializable


        @[JSON::Field(key: "simpleCriterion")]
        getter simple_criterion : Types::SearchResourcesSimpleCriterion?


        @[JSON::Field(key: "tagCriterion")]
        getter tag_criterion : Types::SearchResourcesTagCriterion?

        def initialize(
          @simple_criterion : Types::SearchResourcesSimpleCriterion? = nil,
          @tag_criterion : Types::SearchResourcesTagCriterion? = nil
        )
        end
      end

      # Specifies property- and tag-based conditions that define filter criteria for including or excluding
      # Amazon Web Services resources from the query results.

      struct SearchResourcesCriteriaBlock
        include JSON::Serializable


        @[JSON::Field(key: "and")]
        getter and : Array(Types::SearchResourcesCriteria)?

        def initialize(
          @and : Array(Types::SearchResourcesCriteria)? = nil
        )
        end
      end

      # Specifies criteria for filtering, sorting, and paginating the results of a query for statistical
      # data and other information about Amazon Web Services resources that Amazon Macie monitors and
      # analyzes for your account.

      struct SearchResourcesRequest
        include JSON::Serializable


        @[JSON::Field(key: "bucketCriteria")]
        getter bucket_criteria : Types::SearchResourcesBucketCriteria?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::SearchResourcesSortCriteria?

        def initialize(
          @bucket_criteria : Types::SearchResourcesBucketCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::SearchResourcesSortCriteria? = nil
        )
        end
      end

      # Provides the results of a query that retrieved statistical data and other information about Amazon
      # Web Services resources that Amazon Macie monitors and analyzes for your account.

      struct SearchResourcesResponse
        include JSON::Serializable


        @[JSON::Field(key: "matchingResources")]
        getter matching_resources : Array(Types::MatchingResource)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @matching_resources : Array(Types::MatchingResource)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Specifies a property-based filter condition that determines which Amazon Web Services resources are
      # included or excluded from the query results.

      struct SearchResourcesSimpleCriterion
        include JSON::Serializable


        @[JSON::Field(key: "comparator")]
        getter comparator : String?


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @comparator : String? = nil,
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Specifies criteria for sorting the results of a query for information about Amazon Web Services
      # resources that Amazon Macie monitors and analyzes.

      struct SearchResourcesSortCriteria
        include JSON::Serializable


        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?


        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @attribute_name : String? = nil,
          @order_by : String? = nil
        )
        end
      end

      # Specifies a tag-based filter condition that determines which Amazon Web Services resources are
      # included or excluded from the query results.

      struct SearchResourcesTagCriterion
        include JSON::Serializable


        @[JSON::Field(key: "comparator")]
        getter comparator : String?


        @[JSON::Field(key: "tagValues")]
        getter tag_values : Array(Types::SearchResourcesTagCriterionPair)?

        def initialize(
          @comparator : String? = nil,
          @tag_values : Array(Types::SearchResourcesTagCriterionPair)? = nil
        )
        end
      end

      # Specifies a tag key, a tag value, or a tag key and value (as a pair) to use in a tag-based filter
      # condition for a query. Tag keys and values are case sensitive. Also, Amazon Macie doesn't support
      # use of partial values or wildcard characters in tag-based filter conditions.

      struct SearchResourcesTagCriterionPair
        include JSON::Serializable


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Specifies configuration settings that determine which findings are published to Security Hub
      # automatically. For information about how Macie publishes findings to Security Hub, see Evaluating
      # findings with Security Hub in the Amazon Macie User Guide .

      struct SecurityHubConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "publishClassificationFindings")]
        getter publish_classification_findings : Bool


        @[JSON::Field(key: "publishPolicyFindings")]
        getter publish_policy_findings : Bool

        def initialize(
          @publish_classification_findings : Bool,
          @publish_policy_findings : Bool
        )
        end
      end

      # Provides information about the category, types, and occurrences of sensitive data that produced a
      # sensitive data finding.

      struct SensitiveDataItem
        include JSON::Serializable


        @[JSON::Field(key: "category")]
        getter category : String?


        @[JSON::Field(key: "detections")]
        getter detections : Array(Types::DefaultDetection)?


        @[JSON::Field(key: "totalCount")]
        getter total_count : Int64?

        def initialize(
          @category : String? = nil,
          @detections : Array(Types::DefaultDetection)? = nil,
          @total_count : Int64? = nil
        )
        end
      end

      # Provides aggregated statistical data for sensitive data discovery metrics that apply to S3 buckets.
      # Each field contains aggregated data for all the buckets that have a sensitivity score
      # (sensitivityScore) of a specified value or within a specified range (BucketStatisticsBySensitivity).
      # If automated sensitive data discovery is currently disabled for your account, the value for most
      # fields is 0.

      struct SensitivityAggregations
        include JSON::Serializable


        @[JSON::Field(key: "classifiableSizeInBytes")]
        getter classifiable_size_in_bytes : Int64?


        @[JSON::Field(key: "publiclyAccessibleCount")]
        getter publicly_accessible_count : Int64?


        @[JSON::Field(key: "totalCount")]
        getter total_count : Int64?


        @[JSON::Field(key: "totalSizeInBytes")]
        getter total_size_in_bytes : Int64?

        def initialize(
          @classifiable_size_in_bytes : Int64? = nil,
          @publicly_accessible_count : Int64? = nil,
          @total_count : Int64? = nil,
          @total_size_in_bytes : Int64? = nil
        )
        end
      end

      # Specifies managed data identifiers to exclude (not use) when performing automated sensitive data
      # discovery. For information about the managed data identifiers that Amazon Macie currently provides,
      # see Using managed data identifiers in the Amazon Macie User Guide .

      struct SensitivityInspectionTemplateExcludes
        include JSON::Serializable


        @[JSON::Field(key: "managedDataIdentifierIds")]
        getter managed_data_identifier_ids : Array(String)?

        def initialize(
          @managed_data_identifier_ids : Array(String)? = nil
        )
        end
      end

      # Specifies the allow lists, custom data identifiers, and managed data identifiers to include (use)
      # when performing automated sensitive data discovery. The configuration must specify at least one
      # custom data identifier or managed data identifier. For information about the managed data
      # identifiers that Amazon Macie currently provides, see Using managed data identifiers in the Amazon
      # Macie User Guide .

      struct SensitivityInspectionTemplateIncludes
        include JSON::Serializable


        @[JSON::Field(key: "allowListIds")]
        getter allow_list_ids : Array(String)?


        @[JSON::Field(key: "customDataIdentifierIds")]
        getter custom_data_identifier_ids : Array(String)?


        @[JSON::Field(key: "managedDataIdentifierIds")]
        getter managed_data_identifier_ids : Array(String)?

        def initialize(
          @allow_list_ids : Array(String)? = nil,
          @custom_data_identifier_ids : Array(String)? = nil,
          @managed_data_identifier_ids : Array(String)? = nil
        )
        end
      end

      # Provides information about the sensitivity inspection template for an Amazon Macie account.

      struct SensitivityInspectionTemplatesEntry
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Provides information about the default server-side encryption settings for an S3 bucket or the
      # encryption settings for an S3 object.

      struct ServerSideEncryption
        include JSON::Serializable


        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?


        @[JSON::Field(key: "kmsMasterKeyId")]
        getter kms_master_key_id : String?

        def initialize(
          @encryption_type : String? = nil,
          @kms_master_key_id : String? = nil
        )
        end
      end

      # Specifies a current quota for an Amazon Macie account.

      struct ServiceLimit
        include JSON::Serializable


        @[JSON::Field(key: "isServiceLimited")]
        getter is_service_limited : Bool?


        @[JSON::Field(key: "unit")]
        getter unit : String?


        @[JSON::Field(key: "value")]
        getter value : Int64?

        def initialize(
          @is_service_limited : Bool? = nil,
          @unit : String? = nil,
          @value : Int64? = nil
        )
        end
      end

      # Provides information about an error that occurred due to one or more service quotas for an account.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about a session that was created for an entity that performed an action by
      # using temporary security credentials.

      struct SessionContext
        include JSON::Serializable


        @[JSON::Field(key: "attributes")]
        getter attributes : Types::SessionContextAttributes?


        @[JSON::Field(key: "sessionIssuer")]
        getter session_issuer : Types::SessionIssuer?

        def initialize(
          @attributes : Types::SessionContextAttributes? = nil,
          @session_issuer : Types::SessionIssuer? = nil
        )
        end
      end

      # Provides information about the context in which temporary security credentials were issued to an
      # entity.

      struct SessionContextAttributes
        include JSON::Serializable


        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?


        @[JSON::Field(key: "mfaAuthenticated")]
        getter mfa_authenticated : Bool?

        def initialize(
          @creation_date : Time? = nil,
          @mfa_authenticated : Bool? = nil
        )
        end
      end

      # Provides information about the source and type of temporary security credentials that were issued to
      # an entity.

      struct SessionIssuer
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "principalId")]
        getter principal_id : String?


        @[JSON::Field(key: "type")]
        getter type : String?


        @[JSON::Field(key: "userName")]
        getter user_name : String?

        def initialize(
          @account_id : String? = nil,
          @arn : String? = nil,
          @principal_id : String? = nil,
          @type : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Provides the numerical and qualitative representations of a finding's severity.

      struct Severity
        include JSON::Serializable


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "score")]
        getter score : Int64?

        def initialize(
          @description : String? = nil,
          @score : Int64? = nil
        )
        end
      end

      # Specifies a severity level for findings that a custom data identifier produces. A severity level
      # determines which severity is assigned to the findings, based on the number of occurrences of text
      # that match the custom data identifier's detection criteria.

      struct SeverityLevel
        include JSON::Serializable


        @[JSON::Field(key: "occurrencesThreshold")]
        getter occurrences_threshold : Int64


        @[JSON::Field(key: "severity")]
        getter severity : String

        def initialize(
          @occurrences_threshold : Int64,
          @severity : String
        )
        end
      end

      # Specifies a property-based condition that determines whether an S3 bucket is included or excluded
      # from a classification job.

      struct SimpleCriterionForJob
        include JSON::Serializable


        @[JSON::Field(key: "comparator")]
        getter comparator : String?


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @comparator : String? = nil,
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Specifies a property-based condition that determines whether an S3 object is included or excluded
      # from a classification job.

      struct SimpleScopeTerm
        include JSON::Serializable


        @[JSON::Field(key: "comparator")]
        getter comparator : String?


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @comparator : String? = nil,
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Specifies criteria for sorting the results of a request for findings.

      struct SortCriteria
        include JSON::Serializable


        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?


        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @attribute_name : String? = nil,
          @order_by : String? = nil
        )
        end
      end

      # Provides processing statistics for a classification job.

      struct Statistics
        include JSON::Serializable


        @[JSON::Field(key: "approximateNumberOfObjectsToProcess")]
        getter approximate_number_of_objects_to_process : Float64?


        @[JSON::Field(key: "numberOfRuns")]
        getter number_of_runs : Float64?

        def initialize(
          @approximate_number_of_objects_to_process : Float64? = nil,
          @number_of_runs : Float64? = nil
        )
        end
      end

      # Specifies a custom data identifier or managed data identifier that detected a type of sensitive data
      # to exclude from an S3 bucket's sensitivity score.

      struct SuppressDataIdentifier
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Specifies a tag-based condition that determines whether an S3 bucket is included or excluded from a
      # classification job.

      struct TagCriterionForJob
        include JSON::Serializable


        @[JSON::Field(key: "comparator")]
        getter comparator : String?


        @[JSON::Field(key: "tagValues")]
        getter tag_values : Array(Types::TagCriterionPairForJob)?

        def initialize(
          @comparator : String? = nil,
          @tag_values : Array(Types::TagCriterionPairForJob)? = nil
        )
        end
      end

      # Specifies a tag key, a tag value, or a tag key and value (as a pair) to use in a tag-based condition
      # that determines whether an S3 bucket is included or excluded from a classification job. Tag keys and
      # values are case sensitive. Also, Amazon Macie doesn't support use of partial values or wildcard
      # characters in tag-based conditions.

      struct TagCriterionPairForJob
        include JSON::Serializable


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Specifies the tags (keys and values) to associate with an Amazon Macie resource.

      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The request succeeded. The specified tags were added or updated for the resource.

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies a tag-based condition that determines whether an S3 object is included or excluded from a
      # classification job.

      struct TagScopeTerm
        include JSON::Serializable


        @[JSON::Field(key: "comparator")]
        getter comparator : String?


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "tagValues")]
        getter tag_values : Array(Types::TagValuePair)?


        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @comparator : String? = nil,
          @key : String? = nil,
          @tag_values : Array(Types::TagValuePair)? = nil,
          @target : String? = nil
        )
        end
      end

      # Specifies a tag key or tag key and value pair to use in a tag-based condition that determines
      # whether an S3 object is included or excluded from a classification job. Tag keys and values are case
      # sensitive. Also, Amazon Macie doesn't support use of partial values or wildcard characters in
      # tag-based conditions.

      struct TagValuePair
        include JSON::Serializable


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Specifies the detection criteria of a custom data identifier to test.

      struct TestCustomDataIdentifierRequest
        include JSON::Serializable


        @[JSON::Field(key: "regex")]
        getter regex : String


        @[JSON::Field(key: "sampleText")]
        getter sample_text : String


        @[JSON::Field(key: "ignoreWords")]
        getter ignore_words : Array(String)?


        @[JSON::Field(key: "keywords")]
        getter keywords : Array(String)?


        @[JSON::Field(key: "maximumMatchDistance")]
        getter maximum_match_distance : Int32?

        def initialize(
          @regex : String,
          @sample_text : String,
          @ignore_words : Array(String)? = nil,
          @keywords : Array(String)? = nil,
          @maximum_match_distance : Int32? = nil
        )
        end
      end

      # Provides test results for a custom data identifier.

      struct TestCustomDataIdentifierResponse
        include JSON::Serializable


        @[JSON::Field(key: "matchCount")]
        getter match_count : Int32?

        def initialize(
          @match_count : Int32? = nil
        )
        end
      end

      # Provides information about an error that occurred because too many requests were sent during a
      # certain amount of time.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about an error that occurred due to an unprocessable entity.

      struct UnprocessableEntityException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Provides information about an account-related request that hasn't been processed.

      struct UnprocessedAccount
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "errorCode")]
        getter error_code : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @account_id : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # The request succeeded. The specified tags were removed from the resource.

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Changes the settings for an allow list. If you change the list's criteria, Amazon Macie tests the
      # new criteria when it processes your request. If the criteria specify a regular expression that Macie
      # can't compile or an S3 object that Macie can't retrieve or parse, an error occurs.

      struct UpdateAllowListRequest
        include JSON::Serializable


        @[JSON::Field(key: "criteria")]
        getter criteria : Types::AllowListCriteria


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @criteria : Types::AllowListCriteria,
          @id : String,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # Provides information about an allow list whose settings were changed in response to a request.

      struct UpdateAllowListResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Changes the configuration settings and status of automated sensitive data discovery for an
      # organization in Amazon Macie or a standalone Macie account. To change additional settings, such as
      # the managed data identifiers to use when analyzing data, update the sensitivity inspection template
      # and classification scope for the organization's Macie administrator account or the standalone
      # account.

      struct UpdateAutomatedDiscoveryConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "autoEnableOrganizationMembers")]
        getter auto_enable_organization_members : String?

        def initialize(
          @status : String,
          @auto_enable_organization_members : String? = nil
        )
        end
      end


      struct UpdateAutomatedDiscoveryConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Changes the status of a classification job. For more information about pausing, resuming, or
      # cancelling jobs, see Changing the status of a job in the Amazon Macie User Guide .

      struct UpdateClassificationJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "jobId")]
        getter job_id : String


        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        def initialize(
          @job_id : String,
          @job_status : String
        )
        end
      end


      struct UpdateClassificationJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies new classification scope settings for an Amazon Macie account. Macie uses these settings
      # when it performs automated sensitive data discovery for the account. To update the settings,
      # automated sensitive data discovery must be enabled for the account.

      struct UpdateClassificationScopeRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3ClassificationScopeUpdate?

        def initialize(
          @id : String,
          @s3 : Types::S3ClassificationScopeUpdate? = nil
        )
        end
      end


      struct UpdateClassificationScopeResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the criteria and other settings for a findings filter.

      struct UpdateFindingsFilterRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "action")]
        getter action : String?


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "position")]
        getter position : Int32?

        def initialize(
          @id : String,
          @action : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @finding_criteria : Types::FindingCriteria? = nil,
          @name : String? = nil,
          @position : Int32? = nil
        )
        end
      end

      # Provides information about a findings filter that was updated in response to a request.

      struct UpdateFindingsFilterResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Changes the status or configuration settings for an Amazon Macie account.

      struct UpdateMacieSessionRequest
        include JSON::Serializable


        @[JSON::Field(key: "findingPublishingFrequency")]
        getter finding_publishing_frequency : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @finding_publishing_frequency : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateMacieSessionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Suspends (pauses) or re-enables Amazon Macie for a member account.

      struct UpdateMemberSessionRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @id : String,
          @status : String
        )
        end
      end


      struct UpdateMemberSessionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies whether to enable Amazon Macie automatically for accounts that are added to an
      # organization in Organizations, when the accounts are added to the organization.

      struct UpdateOrganizationConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool

        def initialize(
          @auto_enable : Bool
        )
        end
      end


      struct UpdateOrganizationConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Updates the sensitivity scoring settings for an S3 bucket that Amazon Macie monitors and analyzes
      # for an account. The settings specify types of sensitive data to exclude from the sensitivity score
      # that Macie calculates for the bucket. To update the settings, automated sensitive data discovery
      # must be enabled for the account.

      struct UpdateResourceProfileDetectionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "suppressDataIdentifiers")]
        getter suppress_data_identifiers : Array(Types::SuppressDataIdentifier)?

        def initialize(
          @resource_arn : String,
          @suppress_data_identifiers : Array(Types::SuppressDataIdentifier)? = nil
        )
        end
      end


      struct UpdateResourceProfileDetectionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies a new sensitivity score for an S3 bucket that Amazon Macie monitors and analyzes for an
      # account. To update the score, automated sensitive data discovery must be enabled for the account.

      struct UpdateResourceProfileRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "sensitivityScoreOverride")]
        getter sensitivity_score_override : Int32?

        def initialize(
          @resource_arn : String,
          @sensitivity_score_override : Int32? = nil
        )
        end
      end


      struct UpdateResourceProfileResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the access method and settings to use when retrieving occurrences of sensitive data
      # reported by findings. If your request specifies an Identity and Access Management (IAM) role to
      # assume, Amazon Macie verifies that the role exists and the attached policies are configured
      # correctly. If there's an issue, Macie returns an error. For information about addressing the issue,
      # see Configuration options for retrieving sensitive data samples in the Amazon Macie User Guide .

      struct UpdateRetrievalConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "retrievalMode")]
        getter retrieval_mode : String


        @[JSON::Field(key: "roleName")]
        getter role_name : String?

        def initialize(
          @retrieval_mode : String,
          @role_name : String? = nil
        )
        end
      end

      # Specifies configuration settings for retrieving occurrences of sensitive data reported by findings,
      # and the status of the configuration for an Amazon Macie account. If you don't specify
      # retrievalConfiguration settings for an existing configuration, Macie sets the access method to
      # CALLER_CREDENTIALS. If your current access method is ASSUME_ROLE, Macie also deletes the external ID
      # and role name currently specified for the configuration. To keep these settings for an existing
      # configuration, specify your current retrievalConfiguration settings in your request.

      struct UpdateRevealConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RevealConfiguration


        @[JSON::Field(key: "retrievalConfiguration")]
        getter retrieval_configuration : Types::UpdateRetrievalConfiguration?

        def initialize(
          @configuration : Types::RevealConfiguration,
          @retrieval_configuration : Types::UpdateRetrievalConfiguration? = nil
        )
        end
      end

      # Provides information about updated configuration settings for retrieving occurrences of sensitive
      # data reported by findings, and the status of the configuration for an Amazon Macie account.

      struct UpdateRevealConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RevealConfiguration?


        @[JSON::Field(key: "retrievalConfiguration")]
        getter retrieval_configuration : Types::RetrievalConfiguration?

        def initialize(
          @configuration : Types::RevealConfiguration? = nil,
          @retrieval_configuration : Types::RetrievalConfiguration? = nil
        )
        end
      end

      # Specifies settings for the sensitivity inspection template for an Amazon Macie account. To update
      # the settings, automated sensitive data discovery must be enabled for the account.

      struct UpdateSensitivityInspectionTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "excludes")]
        getter excludes : Types::SensitivityInspectionTemplateExcludes?


        @[JSON::Field(key: "includes")]
        getter includes : Types::SensitivityInspectionTemplateIncludes?

        def initialize(
          @id : String,
          @description : String? = nil,
          @excludes : Types::SensitivityInspectionTemplateExcludes? = nil,
          @includes : Types::SensitivityInspectionTemplateIncludes? = nil
        )
        end
      end


      struct UpdateSensitivityInspectionTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides data for a specific usage metric and the corresponding quota for an Amazon Macie account.

      struct UsageByAccount
        include JSON::Serializable


        @[JSON::Field(key: "currency")]
        getter currency : String?


        @[JSON::Field(key: "estimatedCost")]
        getter estimated_cost : String?


        @[JSON::Field(key: "serviceLimit")]
        getter service_limit : Types::ServiceLimit?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @currency : String? = nil,
          @estimated_cost : String? = nil,
          @service_limit : Types::ServiceLimit? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides quota and aggregated usage data for an Amazon Macie account.

      struct UsageRecord
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "automatedDiscoveryFreeTrialStartDate")]
        getter automated_discovery_free_trial_start_date : Time?


        @[JSON::Field(key: "freeTrialStartDate")]
        getter free_trial_start_date : Time?


        @[JSON::Field(key: "usage")]
        getter usage : Array(Types::UsageByAccount)?

        def initialize(
          @account_id : String? = nil,
          @automated_discovery_free_trial_start_date : Time? = nil,
          @free_trial_start_date : Time? = nil,
          @usage : Array(Types::UsageByAccount)? = nil
        )
        end
      end

      # Specifies a condition for filtering the results of a query for quota and usage data for one or more
      # Amazon Macie accounts.

      struct UsageStatisticsFilter
        include JSON::Serializable


        @[JSON::Field(key: "comparator")]
        getter comparator : String?


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @comparator : String? = nil,
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Specifies criteria for sorting the results of a query for Amazon Macie account quotas and usage
      # data.

      struct UsageStatisticsSortBy
        include JSON::Serializable


        @[JSON::Field(key: "key")]
        getter key : String?


        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @key : String? = nil,
          @order_by : String? = nil
        )
        end
      end

      # Provides aggregated data for an Amazon Macie usage metric. The value for the metric reports
      # estimated usage data for an account for the preceding 30 days or the current calendar month to date,
      # depending on the time period (timeRange) specified in the request.

      struct UsageTotal
        include JSON::Serializable


        @[JSON::Field(key: "currency")]
        getter currency : String?


        @[JSON::Field(key: "estimatedCost")]
        getter estimated_cost : String?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @currency : String? = nil,
          @estimated_cost : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides information about the type and other characteristics of an entity that performed an action
      # on an affected resource.

      struct UserIdentity
        include JSON::Serializable


        @[JSON::Field(key: "assumedRole")]
        getter assumed_role : Types::AssumedRole?


        @[JSON::Field(key: "awsAccount")]
        getter aws_account : Types::AwsAccount?


        @[JSON::Field(key: "awsService")]
        getter aws_service : Types::AwsService?


        @[JSON::Field(key: "federatedUser")]
        getter federated_user : Types::FederatedUser?


        @[JSON::Field(key: "iamUser")]
        getter iam_user : Types::IamUser?


        @[JSON::Field(key: "root")]
        getter root : Types::UserIdentityRoot?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @assumed_role : Types::AssumedRole? = nil,
          @aws_account : Types::AwsAccount? = nil,
          @aws_service : Types::AwsService? = nil,
          @federated_user : Types::FederatedUser? = nil,
          @iam_user : Types::IamUser? = nil,
          @root : Types::UserIdentityRoot? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides information about an Amazon Web Services account and entity that performed an action on an
      # affected resource. The action was performed using the credentials for your Amazon Web Services
      # account.

      struct UserIdentityRoot
        include JSON::Serializable


        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        def initialize(
          @account_id : String? = nil,
          @arn : String? = nil,
          @principal_id : String? = nil
        )
        end
      end

      # Provides information about when a classification job was paused. For a one-time job, this object
      # also specifies when the job will expire and be cancelled if it isn't resumed. For a recurring job,
      # this object also specifies when the paused job run will expire and be cancelled if it isn't resumed.
      # This object is present only if a job's current status (jobStatus) is USER_PAUSED. The information in
      # this object applies only to a job that was paused while it had a status of RUNNING.

      struct UserPausedDetails
        include JSON::Serializable


        @[JSON::Field(key: "jobExpiresAt")]
        getter job_expires_at : Time?


        @[JSON::Field(key: "jobImminentExpirationHealthEventArn")]
        getter job_imminent_expiration_health_event_arn : String?


        @[JSON::Field(key: "jobPausedAt")]
        getter job_paused_at : Time?

        def initialize(
          @job_expires_at : Time? = nil,
          @job_imminent_expiration_health_event_arn : String? = nil,
          @job_paused_at : Time? = nil
        )
        end
      end

      # Provides information about an error that occurred due to a syntax error in a request.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies a weekly recurrence pattern for running a classification job.

      struct WeeklySchedule
        include JSON::Serializable


        @[JSON::Field(key: "dayOfWeek")]
        getter day_of_week : String?

        def initialize(
          @day_of_week : String? = nil
        )
        end
      end
    end
  end
end
