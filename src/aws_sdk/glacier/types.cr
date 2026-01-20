require "json"

module AwsSdk
  module Glacier
    module Types

      # Provides options to abort a multipart upload identified by the upload ID. For information about the
      # underlying REST API, see Abort Multipart Upload . For conceptual information, see Working with
      # Archives in Amazon Glacier .

      struct AbortMultipartUploadInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The upload ID of the multipart upload to delete.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @upload_id : String,
          @vault_name : String
        )
        end
      end

      # The input values for AbortVaultLock .

      struct AbortVaultLockInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID. This value must match the AWS account ID associated with
        # the credentials used to sign the request. You can either specify an AWS account ID or optionally a
        # single ' - ' (hyphen), in which case Amazon Glacier uses the AWS account ID associated with the
        # credentials used to sign the request. If you specify your account ID, do not include any hyphens
        # ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # The input values for AddTagsToVault .

      struct AddTagsToVaultInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The tags to add to the vault. Each tag is composed of a key and a value. The value can be an empty
        # string.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains the Amazon Glacier response to your request. For information about the underlying REST API,
      # see Upload Archive . For conceptual information, see Working with Archives in Amazon Glacier .

      struct ArchiveCreationOutput
        include JSON::Serializable

        # The ID of the archive. This value is also included as part of the location.

        @[JSON::Field(key: "x-amz-archive-id")]
        getter archive_id : String?

        # The checksum of the archive computed by Amazon Glacier.

        @[JSON::Field(key: "x-amz-sha256-tree-hash")]
        getter checksum : String?

        # The relative URI path of the newly added archive resource.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @archive_id : String? = nil,
          @checksum : String? = nil,
          @location : String? = nil
        )
        end
      end

      # Contains information about the comma-separated value (CSV) file to select from.

      struct CSVInput
        include JSON::Serializable

        # A single character used to indicate that a row should be ignored when the character is present at
        # the start of that row.

        @[JSON::Field(key: "Comments")]
        getter comments : String?

        # A value used to separate individual fields from each other within a record.

        @[JSON::Field(key: "FieldDelimiter")]
        getter field_delimiter : String?

        # Describes the first line of input. Valid values are None , Ignore , and Use .

        @[JSON::Field(key: "FileHeaderInfo")]
        getter file_header_info : String?

        # A value used as an escape character where the field delimiter is part of the value.

        @[JSON::Field(key: "QuoteCharacter")]
        getter quote_character : String?

        # A single character used for escaping the quotation-mark character inside an already escaped value.

        @[JSON::Field(key: "QuoteEscapeCharacter")]
        getter quote_escape_character : String?

        # A value used to separate individual records from each other.

        @[JSON::Field(key: "RecordDelimiter")]
        getter record_delimiter : String?

        def initialize(
          @comments : String? = nil,
          @field_delimiter : String? = nil,
          @file_header_info : String? = nil,
          @quote_character : String? = nil,
          @quote_escape_character : String? = nil,
          @record_delimiter : String? = nil
        )
        end
      end

      # Contains information about the comma-separated value (CSV) file that the job results are stored in.

      struct CSVOutput
        include JSON::Serializable

        # A value used to separate individual fields from each other within a record.

        @[JSON::Field(key: "FieldDelimiter")]
        getter field_delimiter : String?

        # A value used as an escape character where the field delimiter is part of the value.

        @[JSON::Field(key: "QuoteCharacter")]
        getter quote_character : String?

        # A single character used for escaping the quotation-mark character inside an already escaped value.

        @[JSON::Field(key: "QuoteEscapeCharacter")]
        getter quote_escape_character : String?

        # A value that indicates whether all output fields should be contained within quotation marks.

        @[JSON::Field(key: "QuoteFields")]
        getter quote_fields : String?

        # A value used to separate individual records from each other.

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

      # Provides options to complete a multipart upload operation. This informs Amazon Glacier that all the
      # archive parts have been uploaded and Amazon Glacier (Glacier) can now assemble the archive from the
      # uploaded parts. After assembling and saving the archive to the vault, Glacier returns the URI path
      # of the newly created archive resource.

      struct CompleteMultipartUploadInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The upload ID of the multipart upload.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The total size, in bytes, of the entire archive. This value should be the sum of all the sizes of
        # the individual parts that you uploaded.

        @[JSON::Field(key: "x-amz-archive-size")]
        getter archive_size : String?

        # The SHA256 tree hash of the entire archive. It is the tree hash of SHA256 tree hash of the
        # individual parts. If the value you specify in the request does not match the SHA256 tree hash of the
        # final assembled archive as computed by Amazon Glacier (Glacier), Glacier returns an error and the
        # request fails.

        @[JSON::Field(key: "x-amz-sha256-tree-hash")]
        getter checksum : String?

        def initialize(
          @account_id : String,
          @upload_id : String,
          @vault_name : String,
          @archive_size : String? = nil,
          @checksum : String? = nil
        )
        end
      end

      # The input values for CompleteVaultLock .

      struct CompleteVaultLockInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID. This value must match the AWS account ID associated with
        # the credentials used to sign the request. You can either specify an AWS account ID or optionally a
        # single ' - ' (hyphen), in which case Amazon Glacier uses the AWS account ID associated with the
        # credentials used to sign the request. If you specify your account ID, do not include any hyphens
        # ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The lockId value is the lock ID obtained from a InitiateVaultLock request.

        @[JSON::Field(key: "lockId")]
        getter lock_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @lock_id : String,
          @vault_name : String
        )
        end
      end

      # Provides options to create a vault.

      struct CreateVaultInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID. This value must match the AWS account ID associated with
        # the credentials used to sign the request. You can either specify an AWS account ID or optionally a
        # single ' - ' (hyphen), in which case Amazon S3 Glacier uses the AWS account ID associated with the
        # credentials used to sign the request. If you specify your account ID, do not include any hyphens
        # ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct CreateVaultOutput
        include JSON::Serializable

        # The URI of the vault that was created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @location : String? = nil
        )
        end
      end

      # Data retrieval policy.

      struct DataRetrievalPolicy
        include JSON::Serializable

        # The policy rule. Although this is a list type, currently there must be only one rule, which contains
        # a Strategy field and optionally a BytesPerHour field.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::DataRetrievalRule)?

        def initialize(
          @rules : Array(Types::DataRetrievalRule)? = nil
        )
        end
      end

      # Data retrieval policy rule.

      struct DataRetrievalRule
        include JSON::Serializable

        # The maximum number of bytes that can be retrieved in an hour. This field is required only if the
        # value of the Strategy field is BytesPerHour . Your PUT operation will be rejected if the Strategy
        # field is not set to BytesPerHour and you set this field.

        @[JSON::Field(key: "BytesPerHour")]
        getter bytes_per_hour : Int64?

        # The type of data retrieval policy to set. Valid values: BytesPerHour|FreeTier|None

        @[JSON::Field(key: "Strategy")]
        getter strategy : String?

        def initialize(
          @bytes_per_hour : Int64? = nil,
          @strategy : String? = nil
        )
        end
      end

      # Provides options for deleting an archive from an Amazon Glacier vault.

      struct DeleteArchiveInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The ID of the archive to delete.

        @[JSON::Field(key: "archiveId")]
        getter archive_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @archive_id : String,
          @vault_name : String
        )
        end
      end

      # DeleteVaultAccessPolicy input.

      struct DeleteVaultAccessPolicyInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # Provides options for deleting a vault from Amazon Glacier.

      struct DeleteVaultInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # Provides options for deleting a vault notification configuration from an Amazon Glacier vault.

      struct DeleteVaultNotificationsInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # Provides options for retrieving a job description.

      struct DescribeJobInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The ID of the job to describe.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @job_id : String,
          @vault_name : String
        )
        end
      end

      # Provides options for retrieving metadata for a specific vault in Amazon Glacier.

      struct DescribeVaultInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct DescribeVaultOutput
        include JSON::Serializable

        # The Universal Coordinated Time (UTC) date when the vault was created. This value should be a string
        # in the ISO 8601 date format, for example 2012-03-20T17:03:43.221Z .

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The Universal Coordinated Time (UTC) date when Amazon Glacier completed the last vault inventory.
        # This value should be a string in the ISO 8601 date format, for example 2012-03-20T17:03:43.221Z .

        @[JSON::Field(key: "LastInventoryDate")]
        getter last_inventory_date : String?

        # The number of archives in the vault as of the last inventory date. This field will return null if an
        # inventory has not yet run on the vault, for example if you just created the vault.

        @[JSON::Field(key: "NumberOfArchives")]
        getter number_of_archives : Int64?

        # Total size, in bytes, of the archives in the vault as of the last inventory date. This field will
        # return null if an inventory has not yet run on the vault, for example if you just created the vault.

        @[JSON::Field(key: "SizeInBytes")]
        getter size_in_bytes : Int64?

        # The Amazon Resource Name (ARN) of the vault.

        @[JSON::Field(key: "VaultARN")]
        getter vault_arn : String?

        # The name of the vault.

        @[JSON::Field(key: "VaultName")]
        getter vault_name : String?

        def initialize(
          @creation_date : String? = nil,
          @last_inventory_date : String? = nil,
          @number_of_archives : Int64? = nil,
          @size_in_bytes : Int64? = nil,
          @vault_arn : String? = nil,
          @vault_name : String? = nil
        )
        end
      end

      # Contains information about the encryption used to store the job results in Amazon S3.

      struct Encryption
        include JSON::Serializable

        # The server-side encryption algorithm used when storing job results in Amazon S3, for example AES256
        # or aws:kms .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        # Optional. If the encryption type is aws:kms , you can use this value to specify the encryption
        # context for the job results.

        @[JSON::Field(key: "KMSContext")]
        getter kms_context : String?

        # The AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by
        # AWS KMS fail if not made by using Secure Sockets Layer (SSL) or Signature Version 4.

        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        def initialize(
          @encryption_type : String? = nil,
          @kms_context : String? = nil,
          @kms_key_id : String? = nil
        )
        end
      end

      # Input for GetDataRetrievalPolicy.

      struct GetDataRetrievalPolicyInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID. This value must match the AWS account ID associated with
        # the credentials used to sign the request. You can either specify an AWS account ID or optionally a
        # single ' - ' (hyphen), in which case Amazon Glacier uses the AWS account ID associated with the
        # credentials used to sign the request. If you specify your account ID, do not include any hyphens
        # ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Contains the Amazon Glacier response to the GetDataRetrievalPolicy request.

      struct GetDataRetrievalPolicyOutput
        include JSON::Serializable

        # Contains the returned data retrieval policy in JSON format.

        @[JSON::Field(key: "Policy")]
        getter policy : Types::DataRetrievalPolicy?

        def initialize(
          @policy : Types::DataRetrievalPolicy? = nil
        )
        end
      end

      # Provides options for downloading output of an Amazon Glacier job.

      struct GetJobOutputInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The job ID whose data is downloaded.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The range of bytes to retrieve from the output. For example, if you want to download the first
        # 1,048,576 bytes, specify the range as bytes=0-1048575 . By default, this operation downloads the
        # entire output. If the job output is large, then you can use a range to retrieve a portion of the
        # output. This allows you to download the entire output in smaller chunks of bytes. For example,
        # suppose you have 1 GB of job output you want to download and you decide to download 128 MB chunks of
        # data at a time, which is a total of eight Get Job Output requests. You use the following process to
        # download the job output: Download a 128 MB chunk of output by specifying the appropriate byte range.
        # Verify that all 128 MB of data was received. Along with the data, the response includes a SHA256
        # tree hash of the payload. You compute the checksum of the payload on the client and compare it with
        # the checksum you received in the response to ensure you received all the expected data. Repeat steps
        # 1 and 2 for all the eight 128 MB chunks of output data, each time specifying the appropriate byte
        # range. After downloading all the parts of the job output, you have a list of eight checksum values.
        # Compute the tree hash of these values to find the checksum of the entire output. Using the
        # DescribeJob API, obtain job information of the job that provided you the output. The response
        # includes the checksum of the entire archive stored in Amazon Glacier. You compare this value with
        # the checksum you computed to ensure you have downloaded the entire archive content with no errors.

        @[JSON::Field(key: "Range")]
        getter range : String?

        def initialize(
          @account_id : String,
          @job_id : String,
          @vault_name : String,
          @range : String? = nil
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct GetJobOutputOutput
        include JSON::Serializable

        # Indicates the range units accepted. For more information, see RFC2616 .

        @[JSON::Field(key: "Accept-Ranges")]
        getter accept_ranges : String?

        # The description of an archive.

        @[JSON::Field(key: "x-amz-archive-description")]
        getter archive_description : String?

        # The job data, either archive data or inventory data.

        @[JSON::Field(key: "body")]
        getter body : Bytes?

        # The checksum of the data in the response. This header is returned only when retrieving the output
        # for an archive retrieval job. Furthermore, this header appears only under the following conditions:
        # You get the entire range of the archive. You request a range to return of the archive that starts
        # and ends on a multiple of 1 MB. For example, if you have an 3.1 MB archive and you specify a range
        # to return that starts at 1 MB and ends at 2 MB, then the x-amz-sha256-tree-hash is returned as a
        # response header. You request a range of the archive to return that starts on a multiple of 1 MB and
        # goes to the end of the archive. For example, if you have a 3.1 MB archive and you specify a range
        # that starts at 2 MB and ends at 3.1 MB (the end of the archive), then the x-amz-sha256-tree-hash is
        # returned as a response header.

        @[JSON::Field(key: "x-amz-sha256-tree-hash")]
        getter checksum : String?

        # The range of bytes returned by Amazon Glacier. If only partial output is downloaded, the response
        # provides the range of bytes Amazon Glacier returned. For example, bytes 0-1048575/8388608 returns
        # the first 1 MB from 8 MB.

        @[JSON::Field(key: "Content-Range")]
        getter content_range : String?

        # The Content-Type depends on whether the job output is an archive or a vault inventory. For archive
        # data, the Content-Type is application/octet-stream. For vault inventory, if you requested CSV format
        # when you initiated the job, the Content-Type is text/csv. Otherwise, by default, vault inventory is
        # returned as JSON, and the Content-Type is application/json.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The HTTP response code for a job output request. The value depends on whether a range was specified
        # in the request.

        @[JSON::Field(key: "status")]
        getter status : Int32?

        def initialize(
          @accept_ranges : String? = nil,
          @archive_description : String? = nil,
          @body : Bytes? = nil,
          @checksum : String? = nil,
          @content_range : String? = nil,
          @content_type : String? = nil,
          @status : Int32? = nil
        )
        end
      end

      # Input for GetVaultAccessPolicy.

      struct GetVaultAccessPolicyInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # Output for GetVaultAccessPolicy.

      struct GetVaultAccessPolicyOutput
        include JSON::Serializable

        # Contains the returned vault access policy as a JSON string.

        @[JSON::Field(key: "policy")]
        getter policy : Types::VaultAccessPolicy?

        def initialize(
          @policy : Types::VaultAccessPolicy? = nil
        )
        end
      end

      # The input values for GetVaultLock .

      struct GetVaultLockInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct GetVaultLockOutput
        include JSON::Serializable

        # The UTC date and time at which the vault lock was put into the InProgress state.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The UTC date and time at which the lock ID expires. This value can be null if the vault lock is in a
        # Locked state.

        @[JSON::Field(key: "ExpirationDate")]
        getter expiration_date : String?

        # The vault lock policy as a JSON string, which uses "\" as an escape character.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The state of the vault lock. InProgress or Locked .

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @creation_date : String? = nil,
          @expiration_date : String? = nil,
          @policy : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Provides options for retrieving the notification configuration set on an Amazon Glacier vault.

      struct GetVaultNotificationsInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct GetVaultNotificationsOutput
        include JSON::Serializable

        # Returns the notification configuration set on the vault.

        @[JSON::Field(key: "vaultNotificationConfig")]
        getter vault_notification_config : Types::VaultNotificationConfig?

        def initialize(
          @vault_notification_config : Types::VaultNotificationConfig? = nil
        )
        end
      end

      # Contains the description of an Amazon S3 Glacier job.

      struct GlacierJobDescription
        include JSON::Serializable

        # The job type. This value is either ArchiveRetrieval , InventoryRetrieval , or Select .

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The archive ID requested for a select job or archive retrieval. Otherwise, this field is null.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String?

        # The SHA256 tree hash of the entire archive for an archive retrieval. For inventory retrieval or
        # select jobs, this field is null.

        @[JSON::Field(key: "ArchiveSHA256TreeHash")]
        getter archive_sha256_tree_hash : String?

        # For an archive retrieval job, this value is the size in bytes of the archive being requested for
        # download. For an inventory retrieval or select job, this value is null.

        @[JSON::Field(key: "ArchiveSizeInBytes")]
        getter archive_size_in_bytes : Int64?

        # The job status. When a job is completed, you get the job's output using Get Job Output (GET output).

        @[JSON::Field(key: "Completed")]
        getter completed : Bool?

        # The UTC time that the job request completed. While the job is in progress, the value is null.

        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : String?

        # The UTC date when the job was created. This value is a string representation of ISO 8601 date
        # format, for example "2012-03-20T17:03:43.221Z" .

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # Parameters used for range inventory retrieval.

        @[JSON::Field(key: "InventoryRetrievalParameters")]
        getter inventory_retrieval_parameters : Types::InventoryRetrievalJobDescription?

        # For an inventory retrieval job, this value is the size in bytes of the inventory requested for
        # download. For an archive retrieval or select job, this value is null.

        @[JSON::Field(key: "InventorySizeInBytes")]
        getter inventory_size_in_bytes : Int64?

        # The job description provided when initiating the job.

        @[JSON::Field(key: "JobDescription")]
        getter job_description : String?

        # An opaque string that identifies an Amazon S3 Glacier job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Contains the job output location.

        @[JSON::Field(key: "JobOutputPath")]
        getter job_output_path : String?

        # Contains the location where the data from the select job is stored.

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::OutputLocation?

        # The retrieved byte range for archive retrieval jobs in the form StartByteValue - EndByteValue . If
        # no range was specified in the archive retrieval, then the whole archive is retrieved. In this case,
        # StartByteValue equals 0 and EndByteValue equals the size of the archive minus 1. For inventory
        # retrieval or select jobs, this field is null.

        @[JSON::Field(key: "RetrievalByteRange")]
        getter retrieval_byte_range : String?

        # For an archive retrieval job, this value is the checksum of the archive. Otherwise, this value is
        # null. The SHA256 tree hash value for the requested range of an archive. If the InitiateJob request
        # for an archive specified a tree-hash aligned range, then this field returns a value. If the whole
        # archive is retrieved, this value is the same as the ArchiveSHA256TreeHash value. This field is null
        # for the following: Archive retrieval jobs that specify a range that is not tree-hash aligned
        # Archival jobs that specify a range that is equal to the whole archive, when the job status is
        # InProgress Inventory jobs Select jobs

        @[JSON::Field(key: "SHA256TreeHash")]
        getter sha256_tree_hash : String?

        # An Amazon SNS topic that receives notification.

        @[JSON::Field(key: "SNSTopic")]
        getter sns_topic : String?

        # Contains the parameters used for a select.

        @[JSON::Field(key: "SelectParameters")]
        getter select_parameters : Types::SelectParameters?

        # The status code can be InProgress , Succeeded , or Failed , and indicates the status of the job.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # A friendly message that describes the job status.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The tier to use for a select or an archive retrieval. Valid values are Expedited , Standard , or
        # Bulk . Standard is the default.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The Amazon Resource Name (ARN) of the vault from which an archive retrieval was requested.

        @[JSON::Field(key: "VaultARN")]
        getter vault_arn : String?

        def initialize(
          @action : String? = nil,
          @archive_id : String? = nil,
          @archive_sha256_tree_hash : String? = nil,
          @archive_size_in_bytes : Int64? = nil,
          @completed : Bool? = nil,
          @completion_date : String? = nil,
          @creation_date : String? = nil,
          @inventory_retrieval_parameters : Types::InventoryRetrievalJobDescription? = nil,
          @inventory_size_in_bytes : Int64? = nil,
          @job_description : String? = nil,
          @job_id : String? = nil,
          @job_output_path : String? = nil,
          @output_location : Types::OutputLocation? = nil,
          @retrieval_byte_range : String? = nil,
          @sha256_tree_hash : String? = nil,
          @sns_topic : String? = nil,
          @select_parameters : Types::SelectParameters? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil,
          @tier : String? = nil,
          @vault_arn : String? = nil
        )
        end
      end

      # Contains information about a grant.

      struct Grant
        include JSON::Serializable

        # The grantee.

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

      # Contains information about the grantee.

      struct Grantee
        include JSON::Serializable

        # Type of grantee

        @[JSON::Field(key: "Type")]
        getter type : String

        # Screen name of the grantee.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Email address of the grantee.

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

      # Provides options for initiating an Amazon Glacier job.

      struct InitiateJobInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # Provides options for specifying job information.

        @[JSON::Field(key: "jobParameters")]
        getter job_parameters : Types::JobParameters?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @job_parameters : Types::JobParameters? = nil
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct InitiateJobOutput
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "x-amz-job-id")]
        getter job_id : String?

        # The path to the location of where the select results are stored.

        @[JSON::Field(key: "x-amz-job-output-path")]
        getter job_output_path : String?

        # The relative URI path of the job.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @job_id : String? = nil,
          @job_output_path : String? = nil,
          @location : String? = nil
        )
        end
      end

      # Provides options for initiating a multipart upload to an Amazon Glacier vault.

      struct InitiateMultipartUploadInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The archive description that you are uploading in parts. The part size must be a megabyte (1024 KB)
        # multiplied by a power of 2, for example 1048576 (1 MB), 2097152 (2 MB), 4194304 (4 MB), 8388608 (8
        # MB), and so on. The minimum allowable part size is 1 MB, and the maximum is 4 GB (4096 MB).

        @[JSON::Field(key: "x-amz-archive-description")]
        getter archive_description : String?

        # The size of each part except the last, in bytes. The last part can be smaller than this part size.

        @[JSON::Field(key: "x-amz-part-size")]
        getter part_size : String?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @archive_description : String? = nil,
          @part_size : String? = nil
        )
        end
      end

      # The Amazon Glacier response to your request.

      struct InitiateMultipartUploadOutput
        include JSON::Serializable

        # The relative URI path of the multipart upload ID Amazon Glacier created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The ID of the multipart upload. This value is also included as part of the location.

        @[JSON::Field(key: "x-amz-multipart-upload-id")]
        getter upload_id : String?

        def initialize(
          @location : String? = nil,
          @upload_id : String? = nil
        )
        end
      end

      # The input values for InitiateVaultLock .

      struct InitiateVaultLockInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID. This value must match the AWS account ID associated with
        # the credentials used to sign the request. You can either specify an AWS account ID or optionally a
        # single ' - ' (hyphen), in which case Amazon Glacier uses the AWS account ID associated with the
        # credentials used to sign the request. If you specify your account ID, do not include any hyphens
        # ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The vault lock policy as a JSON string, which uses "\" as an escape character.

        @[JSON::Field(key: "policy")]
        getter policy : Types::VaultLockPolicy?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @policy : Types::VaultLockPolicy? = nil
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct InitiateVaultLockOutput
        include JSON::Serializable

        # The lock ID, which is used to complete the vault locking process.

        @[JSON::Field(key: "x-amz-lock-id")]
        getter lock_id : String?

        def initialize(
          @lock_id : String? = nil
        )
        end
      end

      # Describes how the archive is serialized.

      struct InputSerialization
        include JSON::Serializable

        # Describes the serialization of a CSV-encoded object.

        @[JSON::Field(key: "csv")]
        getter csv : Types::CSVInput?

        def initialize(
          @csv : Types::CSVInput? = nil
        )
        end
      end

      # Returned if there is insufficient capacity to process this expedited request. This error only
      # applies to expedited retrievals and not to standard or bulk retrievals.

      struct InsufficientCapacityException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Returned if a parameter of the request is incorrectly specified.

      struct InvalidParameterValueException
        include JSON::Serializable

        # 400 Bad Request

        @[JSON::Field(key: "code")]
        getter code : String?

        # Returned if a parameter of the request is incorrectly specified.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Client

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes the options for a range inventory retrieval job.

      struct InventoryRetrievalJobDescription
        include JSON::Serializable

        # The end of the date range in UTC for vault inventory retrieval that includes archives created before
        # this date. This value should be a string in the ISO 8601 date format, for example
        # 2013-03-20T17:03:43Z .

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # The output format for the vault inventory list, which is set by the InitiateJob request when
        # initiating a job to retrieve a vault inventory. Valid values are CSV and JSON .

        @[JSON::Field(key: "Format")]
        getter format : String?

        # The maximum number of inventory items returned per vault inventory retrieval request. This limit is
        # set when initiating the job with the a InitiateJob request.

        @[JSON::Field(key: "Limit")]
        getter limit : String?

        # An opaque string that represents where to continue pagination of the vault inventory retrieval
        # results. You use the marker in a new InitiateJob request to obtain additional inventory items. If
        # there are no more inventory items, this value is null . For more information, see Range Inventory
        # Retrieval .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The start of the date range in Universal Coordinated Time (UTC) for vault inventory retrieval that
        # includes archives created on or after this date. This value should be a string in the ISO 8601 date
        # format, for example 2013-03-20T17:03:43Z .

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        def initialize(
          @end_date : String? = nil,
          @format : String? = nil,
          @limit : String? = nil,
          @marker : String? = nil,
          @start_date : String? = nil
        )
        end
      end

      # Provides options for specifying a range inventory retrieval job.

      struct InventoryRetrievalJobInput
        include JSON::Serializable

        # The end of the date range in UTC for vault inventory retrieval that includes archives created before
        # this date. This value should be a string in the ISO 8601 date format, for example
        # 2013-03-20T17:03:43Z .

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # Specifies the maximum number of inventory items returned per vault inventory retrieval request.
        # Valid values are greater than or equal to 1.

        @[JSON::Field(key: "Limit")]
        getter limit : String?

        # An opaque string that represents where to continue pagination of the vault inventory retrieval
        # results. You use the marker in a new InitiateJob request to obtain additional inventory items. If
        # there are no more inventory items, this value is null .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The start of the date range in UTC for vault inventory retrieval that includes archives created on
        # or after this date. This value should be a string in the ISO 8601 date format, for example
        # 2013-03-20T17:03:43Z .

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        def initialize(
          @end_date : String? = nil,
          @limit : String? = nil,
          @marker : String? = nil,
          @start_date : String? = nil
        )
        end
      end

      # Provides options for defining a job.

      struct JobParameters
        include JSON::Serializable

        # The ID of the archive that you want to retrieve. This field is required only if Type is set to
        # select or archive-retrieval code&gt;. An error occurs if you specify this request parameter for an
        # inventory retrieval job request.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String?

        # The optional description for the job. The description must be less than or equal to 1,024 bytes. The
        # allowable characters are 7-bit ASCII without control codes-specifically, ASCII values 32-126 decimal
        # or 0x20-0x7E hexadecimal.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # When initiating a job to retrieve a vault inventory, you can optionally add this parameter to your
        # request to specify the output format. If you are initiating an inventory job and do not specify a
        # Format field, JSON is the default format. Valid values are "CSV" and "JSON".

        @[JSON::Field(key: "Format")]
        getter format : String?

        # Input parameters used for range inventory retrieval.

        @[JSON::Field(key: "InventoryRetrievalParameters")]
        getter inventory_retrieval_parameters : Types::InventoryRetrievalJobInput?

        # Contains information about the location where the select job results are stored.

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::OutputLocation?

        # The byte range to retrieve for an archive retrieval. in the form " StartByteValue - EndByteValue "
        # If not specified, the whole archive is retrieved. If specified, the byte range must be megabyte
        # (1024*1024) aligned which means that StartByteValue must be divisible by 1 MB and EndByteValue plus
        # 1 must be divisible by 1 MB or be the end of the archive specified as the archive byte size value
        # minus 1. If RetrievalByteRange is not megabyte aligned, this operation returns a 400 response. An
        # error occurs if you specify this field for an inventory retrieval job request.

        @[JSON::Field(key: "RetrievalByteRange")]
        getter retrieval_byte_range : String?

        # The Amazon SNS topic ARN to which Amazon Glacier sends a notification when the job is completed and
        # the output is ready for you to download. The specified topic publishes the notification to its
        # subscribers. The SNS topic must exist.

        @[JSON::Field(key: "SNSTopic")]
        getter sns_topic : String?

        # Contains the parameters that define a job.

        @[JSON::Field(key: "SelectParameters")]
        getter select_parameters : Types::SelectParameters?

        # The tier to use for a select or an archive retrieval job. Valid values are Expedited , Standard , or
        # Bulk . Standard is the default.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The job type. You can initiate a job to perform a select query on an archive, retrieve an archive,
        # or get an inventory of a vault. Valid values are "select", "archive-retrieval" and
        # "inventory-retrieval".

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @archive_id : String? = nil,
          @description : String? = nil,
          @format : String? = nil,
          @inventory_retrieval_parameters : Types::InventoryRetrievalJobInput? = nil,
          @output_location : Types::OutputLocation? = nil,
          @retrieval_byte_range : String? = nil,
          @sns_topic : String? = nil,
          @select_parameters : Types::SelectParameters? = nil,
          @tier : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Returned if the request results in a vault or account limit being exceeded.

      struct LimitExceededException
        include JSON::Serializable

        # 400 Bad Request

        @[JSON::Field(key: "code")]
        getter code : String?

        # Returned if the request results in a vault limit or tags limit being exceeded.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Client

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides options for retrieving a job list for an Amazon Glacier vault.

      struct ListJobsInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The state of the jobs to return. You can specify true or false .

        @[JSON::Field(key: "completed")]
        getter completed : String?

        # The maximum number of jobs to be returned. The default limit is 50. The number of jobs returned
        # might be fewer than the specified limit, but the number of returned jobs never exceeds the limit.

        @[JSON::Field(key: "limit")]
        getter limit : String?

        # An opaque string used for pagination. This value specifies the job at which the listing of jobs
        # should begin. Get the marker value from a previous List Jobs response. You only need to include the
        # marker if you are continuing the pagination of results started in a previous List Jobs request.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The type of job status to return. You can specify the following values: InProgress , Succeeded , or
        # Failed .

        @[JSON::Field(key: "statuscode")]
        getter statuscode : String?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @completed : String? = nil,
          @limit : String? = nil,
          @marker : String? = nil,
          @statuscode : String? = nil
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct ListJobsOutput
        include JSON::Serializable

        # A list of job objects. Each job object contains metadata describing the job.

        @[JSON::Field(key: "JobList")]
        getter job_list : Array(Types::GlacierJobDescription)?

        # An opaque string used for pagination that specifies the job at which the listing of jobs should
        # begin. You get the marker value from a previous List Jobs response. You only need to include the
        # marker if you are continuing the pagination of the results started in a previous List Jobs request.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @job_list : Array(Types::GlacierJobDescription)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Provides options for retrieving list of in-progress multipart uploads for an Amazon Glacier vault.

      struct ListMultipartUploadsInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # Specifies the maximum number of uploads returned in the response body. If this value is not
        # specified, the List Uploads operation returns up to 50 uploads.

        @[JSON::Field(key: "limit")]
        getter limit : String?

        # An opaque string used for pagination. This value specifies the upload at which the listing of
        # uploads should begin. Get the marker value from a previous List Uploads response. You need only
        # include the marker if you are continuing the pagination of results started in a previous List
        # Uploads request.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @limit : String? = nil,
          @marker : String? = nil
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct ListMultipartUploadsOutput
        include JSON::Serializable

        # An opaque string that represents where to continue pagination of the results. You use the marker in
        # a new List Multipart Uploads request to obtain more uploads in the list. If there are no more
        # uploads, this value is null .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of in-progress multipart uploads.

        @[JSON::Field(key: "UploadsList")]
        getter uploads_list : Array(Types::UploadListElement)?

        def initialize(
          @marker : String? = nil,
          @uploads_list : Array(Types::UploadListElement)? = nil
        )
        end
      end

      # Provides options for retrieving a list of parts of an archive that have been uploaded in a specific
      # multipart upload.

      struct ListPartsInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The upload ID of the multipart upload.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The maximum number of parts to be returned. The default limit is 50. The number of parts returned
        # might be fewer than the specified limit, but the number of returned parts never exceeds the limit.

        @[JSON::Field(key: "limit")]
        getter limit : String?

        # An opaque string used for pagination. This value specifies the part at which the listing of parts
        # should begin. Get the marker value from the response of a previous List Parts response. You need
        # only include the marker if you are continuing the pagination of results started in a previous List
        # Parts request.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @account_id : String,
          @upload_id : String,
          @vault_name : String,
          @limit : String? = nil,
          @marker : String? = nil
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct ListPartsOutput
        include JSON::Serializable

        # The description of the archive that was specified in the Initiate Multipart Upload request.

        @[JSON::Field(key: "ArchiveDescription")]
        getter archive_description : String?

        # The UTC time at which the multipart upload was initiated.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # An opaque string that represents where to continue pagination of the results. You use the marker in
        # a new List Parts request to obtain more jobs in the list. If there are no more parts, this value is
        # null .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The ID of the upload to which the parts are associated.

        @[JSON::Field(key: "MultipartUploadId")]
        getter multipart_upload_id : String?

        # The part size in bytes. This is the same value that you specified in the Initiate Multipart Upload
        # request.

        @[JSON::Field(key: "PartSizeInBytes")]
        getter part_size_in_bytes : Int64?

        # A list of the part sizes of the multipart upload. Each object in the array contains a RangeBytes and
        # sha256-tree-hash name/value pair.

        @[JSON::Field(key: "Parts")]
        getter parts : Array(Types::PartListElement)?

        # The Amazon Resource Name (ARN) of the vault to which the multipart upload was initiated.

        @[JSON::Field(key: "VaultARN")]
        getter vault_arn : String?

        def initialize(
          @archive_description : String? = nil,
          @creation_date : String? = nil,
          @marker : String? = nil,
          @multipart_upload_id : String? = nil,
          @part_size_in_bytes : Int64? = nil,
          @parts : Array(Types::PartListElement)? = nil,
          @vault_arn : String? = nil
        )
        end
      end


      struct ListProvisionedCapacityInput
        include JSON::Serializable

        # The AWS account ID of the account that owns the vault. You can either specify an AWS account ID or
        # optionally a single '-' (hyphen), in which case Amazon Glacier uses the AWS account ID associated
        # with the credentials used to sign the request. If you use an account ID, don't include any hyphens
        # ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct ListProvisionedCapacityOutput
        include JSON::Serializable

        # The response body contains the following JSON fields.

        @[JSON::Field(key: "ProvisionedCapacityList")]
        getter provisioned_capacity_list : Array(Types::ProvisionedCapacityDescription)?

        def initialize(
          @provisioned_capacity_list : Array(Types::ProvisionedCapacityDescription)? = nil
        )
        end
      end

      # The input value for ListTagsForVaultInput .

      struct ListTagsForVaultInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        def initialize(
          @account_id : String,
          @vault_name : String
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct ListTagsForVaultOutput
        include JSON::Serializable

        # The tags attached to the vault. Each tag is composed of a key and a value.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides options to retrieve the vault list owned by the calling user's account. The list provides
      # metadata information for each vault.

      struct ListVaultsInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID. This value must match the AWS account ID associated with
        # the credentials used to sign the request. You can either specify an AWS account ID or optionally a
        # single ' - ' (hyphen), in which case Amazon Glacier uses the AWS account ID associated with the
        # credentials used to sign the request. If you specify your account ID, do not include any hyphens
        # ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The maximum number of vaults to be returned. The default limit is 10. The number of vaults returned
        # might be fewer than the specified limit, but the number of returned vaults never exceeds the limit.

        @[JSON::Field(key: "limit")]
        getter limit : String?

        # A string used for pagination. The marker specifies the vault ARN after which the listing of vaults
        # should begin.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @account_id : String,
          @limit : String? = nil,
          @marker : String? = nil
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct ListVaultsOutput
        include JSON::Serializable

        # The vault ARN at which to continue pagination of the results. You use the marker in another List
        # Vaults request to obtain more vaults in the list.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # List of vaults.

        @[JSON::Field(key: "VaultList")]
        getter vault_list : Array(Types::DescribeVaultOutput)?

        def initialize(
          @marker : String? = nil,
          @vault_list : Array(Types::DescribeVaultOutput)? = nil
        )
        end
      end

      # Returned if a required header or parameter is missing from the request.

      struct MissingParameterValueException
        include JSON::Serializable

        # 400 Bad Request

        @[JSON::Field(key: "code")]
        getter code : String?

        # Returned if no authentication data is found for the request.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Client.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Returned if the request was made by a customer with no Amazon Glacier storage. The request is denied
      # as the API is no longer supported for new customers. Please use Amazon S3 Glacier storage classes
      # instead.

      struct NoLongerSupportedException
        include JSON::Serializable

        # 400 Bad Request

        @[JSON::Field(key: "code")]
        getter code : String?

        # This API is no longer supported for new accounts. Please use Amazon S3 Glacier storage classes
        # instead.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Client

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information about the location where the select job results are stored.

      struct OutputLocation
        include JSON::Serializable

        # Describes an S3 location that will receive the results of the job request.

        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3Location?

        def initialize(
          @s3 : Types::S3Location? = nil
        )
        end
      end

      # Describes how the select output is serialized.

      struct OutputSerialization
        include JSON::Serializable

        # Describes the serialization of CSV-encoded query results.

        @[JSON::Field(key: "csv")]
        getter csv : Types::CSVOutput?

        def initialize(
          @csv : Types::CSVOutput? = nil
        )
        end
      end

      # A list of the part sizes of the multipart upload.

      struct PartListElement
        include JSON::Serializable

        # The byte range of a part, inclusive of the upper value of the range.

        @[JSON::Field(key: "RangeInBytes")]
        getter range_in_bytes : String?

        # The SHA256 tree hash value that Amazon Glacier calculated for the part. This field is never null .

        @[JSON::Field(key: "SHA256TreeHash")]
        getter sha256_tree_hash : String?

        def initialize(
          @range_in_bytes : String? = nil,
          @sha256_tree_hash : String? = nil
        )
        end
      end

      # Returned if a retrieval job would exceed the current data policy's retrieval rate limit. For more
      # information about data retrieval policies,

      struct PolicyEnforcedException
        include JSON::Serializable

        # PolicyEnforcedException

        @[JSON::Field(key: "code")]
        getter code : String?

        # InitiateJob request denied by current data retrieval policy.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Client

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The definition for a provisioned capacity unit.

      struct ProvisionedCapacityDescription
        include JSON::Serializable

        # The ID that identifies the provisioned capacity unit.

        @[JSON::Field(key: "CapacityId")]
        getter capacity_id : String?

        # The date that the provisioned capacity unit expires, in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "ExpirationDate")]
        getter expiration_date : String?

        # The date that the provisioned capacity unit was purchased, in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        def initialize(
          @capacity_id : String? = nil,
          @expiration_date : String? = nil,
          @start_date : String? = nil
        )
        end
      end


      struct PurchaseProvisionedCapacityInput
        include JSON::Serializable

        # The AWS account ID of the account that owns the vault. You can either specify an AWS account ID or
        # optionally a single '-' (hyphen), in which case Amazon Glacier uses the AWS account ID associated
        # with the credentials used to sign the request. If you use an account ID, don't include any hyphens
        # ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct PurchaseProvisionedCapacityOutput
        include JSON::Serializable

        # The ID that identifies the provisioned capacity unit.

        @[JSON::Field(key: "x-amz-capacity-id")]
        getter capacity_id : String?

        def initialize(
          @capacity_id : String? = nil
        )
        end
      end

      # The input value for RemoveTagsFromVaultInput .

      struct RemoveTagsFromVaultInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # A list of tag keys. Each corresponding tag is removed from the vault.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @tag_keys : Array(String)? = nil
        )
        end
      end

      # Returned if, when uploading an archive, Amazon Glacier times out while receiving the upload.

      struct RequestTimeoutException
        include JSON::Serializable

        # 408 Request Timeout

        @[JSON::Field(key: "code")]
        getter code : String?

        # Returned if, when uploading an archive, Amazon Glacier times out while receiving the upload.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Client

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Returned if the specified resource (such as a vault, upload ID, or job ID) doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        # 404 Not Found

        @[JSON::Field(key: "code")]
        getter code : String?

        # Returned if the specified resource (such as a vault, upload ID, or job ID) doesn't exist.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Client

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information about the location in Amazon S3 where the select job results are stored.

      struct S3Location
        include JSON::Serializable

        # A list of grants that control access to the staged results.

        @[JSON::Field(key: "AccessControlList")]
        getter access_control_list : Array(Types::Grant)?

        # The name of the Amazon S3 bucket where the job results are stored.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # The canned access control list (ACL) to apply to the job results.

        @[JSON::Field(key: "CannedACL")]
        getter canned_acl : String?

        # Contains information about the encryption used to store the job results in Amazon S3.

        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::Encryption?

        # The prefix that is prepended to the results for this request.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The storage class used to store the job results.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        # The tag-set that is applied to the job results.

        @[JSON::Field(key: "Tagging")]
        getter tagging : Hash(String, String)?

        # A map of metadata to store with the job results in Amazon S3.

        @[JSON::Field(key: "UserMetadata")]
        getter user_metadata : Hash(String, String)?

        def initialize(
          @access_control_list : Array(Types::Grant)? = nil,
          @bucket_name : String? = nil,
          @canned_acl : String? = nil,
          @encryption : Types::Encryption? = nil,
          @prefix : String? = nil,
          @storage_class : String? = nil,
          @tagging : Hash(String, String)? = nil,
          @user_metadata : Hash(String, String)? = nil
        )
        end
      end

      # Contains information about the parameters used for a select.

      struct SelectParameters
        include JSON::Serializable

        # The expression that is used to select the object.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # The type of the provided expression, for example SQL .

        @[JSON::Field(key: "ExpressionType")]
        getter expression_type : String?

        # Describes the serialization format of the object.

        @[JSON::Field(key: "InputSerialization")]
        getter input_serialization : Types::InputSerialization?

        # Describes how the results of the select job are serialized.

        @[JSON::Field(key: "OutputSerialization")]
        getter output_serialization : Types::OutputSerialization?

        def initialize(
          @expression : String? = nil,
          @expression_type : String? = nil,
          @input_serialization : Types::InputSerialization? = nil,
          @output_serialization : Types::OutputSerialization? = nil
        )
        end
      end

      # Returned if the service cannot complete the request.

      struct ServiceUnavailableException
        include JSON::Serializable

        # 500 Internal Server Error

        @[JSON::Field(key: "code")]
        getter code : String?

        # Returned if the service cannot complete the request.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Server

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # SetDataRetrievalPolicy input.

      struct SetDataRetrievalPolicyInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID. This value must match the AWS account ID associated with
        # the credentials used to sign the request. You can either specify an AWS account ID or optionally a
        # single ' - ' (hyphen), in which case Amazon Glacier uses the AWS account ID associated with the
        # credentials used to sign the request. If you specify your account ID, do not include any hyphens
        # ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The data retrieval policy in JSON format.

        @[JSON::Field(key: "Policy")]
        getter policy : Types::DataRetrievalPolicy?

        def initialize(
          @account_id : String,
          @policy : Types::DataRetrievalPolicy? = nil
        )
        end
      end

      # SetVaultAccessPolicy input.

      struct SetVaultAccessPolicyInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The vault access policy as a JSON string.

        @[JSON::Field(key: "policy")]
        getter policy : Types::VaultAccessPolicy?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @policy : Types::VaultAccessPolicy? = nil
        )
        end
      end

      # Provides options to configure notifications that will be sent when specific events happen to a
      # vault.

      struct SetVaultNotificationsInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # Provides options for specifying notification configuration.

        @[JSON::Field(key: "vaultNotificationConfig")]
        getter vault_notification_config : Types::VaultNotificationConfig?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @vault_notification_config : Types::VaultNotificationConfig? = nil
        )
        end
      end

      # Provides options to add an archive to a vault.

      struct UploadArchiveInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The optional description of the archive you are uploading.

        @[JSON::Field(key: "x-amz-archive-description")]
        getter archive_description : String?

        # The data to upload.

        @[JSON::Field(key: "body")]
        getter body : Bytes?

        # The SHA256 tree hash of the data being uploaded.

        @[JSON::Field(key: "x-amz-sha256-tree-hash")]
        getter checksum : String?

        def initialize(
          @account_id : String,
          @vault_name : String,
          @archive_description : String? = nil,
          @body : Bytes? = nil,
          @checksum : String? = nil
        )
        end
      end

      # A list of in-progress multipart uploads for a vault.

      struct UploadListElement
        include JSON::Serializable

        # The description of the archive that was specified in the Initiate Multipart Upload request.

        @[JSON::Field(key: "ArchiveDescription")]
        getter archive_description : String?

        # The UTC time at which the multipart upload was initiated.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The ID of a multipart upload.

        @[JSON::Field(key: "MultipartUploadId")]
        getter multipart_upload_id : String?

        # The part size, in bytes, specified in the Initiate Multipart Upload request. This is the size of all
        # the parts in the upload except the last part, which may be smaller than this size.

        @[JSON::Field(key: "PartSizeInBytes")]
        getter part_size_in_bytes : Int64?

        # The Amazon Resource Name (ARN) of the vault that contains the archive.

        @[JSON::Field(key: "VaultARN")]
        getter vault_arn : String?

        def initialize(
          @archive_description : String? = nil,
          @creation_date : String? = nil,
          @multipart_upload_id : String? = nil,
          @part_size_in_bytes : Int64? = nil,
          @vault_arn : String? = nil
        )
        end
      end

      # Provides options to upload a part of an archive in a multipart upload operation.

      struct UploadMultipartPartInput
        include JSON::Serializable

        # The AccountId value is the AWS account ID of the account that owns the vault. You can either specify
        # an AWS account ID or optionally a single ' - ' (hyphen), in which case Amazon Glacier uses the AWS
        # account ID associated with the credentials used to sign the request. If you use an account ID, do
        # not include any hyphens ('-') in the ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The upload ID of the multipart upload.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The name of the vault.

        @[JSON::Field(key: "vaultName")]
        getter vault_name : String

        # The data to upload.

        @[JSON::Field(key: "body")]
        getter body : Bytes?

        # The SHA256 tree hash of the data being uploaded.

        @[JSON::Field(key: "x-amz-sha256-tree-hash")]
        getter checksum : String?

        # Identifies the range of bytes in the assembled archive that will be uploaded in this part. Amazon
        # Glacier uses this information to assemble the archive in the proper sequence. The format of this
        # header follows RFC 2616. An example header is Content-Range:bytes 0-4194303/*.

        @[JSON::Field(key: "Content-Range")]
        getter range : String?

        def initialize(
          @account_id : String,
          @upload_id : String,
          @vault_name : String,
          @body : Bytes? = nil,
          @checksum : String? = nil,
          @range : String? = nil
        )
        end
      end

      # Contains the Amazon Glacier response to your request.

      struct UploadMultipartPartOutput
        include JSON::Serializable

        # The SHA256 tree hash that Amazon Glacier computed for the uploaded part.

        @[JSON::Field(key: "x-amz-sha256-tree-hash")]
        getter checksum : String?

        def initialize(
          @checksum : String? = nil
        )
        end
      end

      # Contains the vault access policy.

      struct VaultAccessPolicy
        include JSON::Serializable

        # The vault access policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      # Contains the vault lock policy.

      struct VaultLockPolicy
        include JSON::Serializable

        # The vault lock policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      # Represents a vault's notification configuration.

      struct VaultNotificationConfig
        include JSON::Serializable

        # A list of one or more events for which Amazon Glacier will send a notification to the specified
        # Amazon SNS topic.

        @[JSON::Field(key: "Events")]
        getter events : Array(String)?

        # The Amazon Simple Notification Service (Amazon SNS) topic Amazon Resource Name (ARN).

        @[JSON::Field(key: "SNSTopic")]
        getter sns_topic : String?

        def initialize(
          @events : Array(String)? = nil,
          @sns_topic : String? = nil
        )
        end
      end
    end
  end
end
