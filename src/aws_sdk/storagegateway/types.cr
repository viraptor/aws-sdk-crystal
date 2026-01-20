require "json"
require "time"

module AwsSdk
  module StorageGateway
    module Types

      # A JSON object containing one or more of the following fields: ActivateGatewayInput$ActivationKey
      # ActivateGatewayInput$GatewayName ActivateGatewayInput$GatewayRegion
      # ActivateGatewayInput$GatewayTimezone ActivateGatewayInput$GatewayType
      # ActivateGatewayInput$MediumChangerType ActivateGatewayInput$TapeDriveType

      struct ActivateGatewayInput
        include JSON::Serializable

        # Your gateway activation key. You can obtain the activation key by sending an HTTP GET request with
        # redirects enabled to the gateway IP address (port 80). The redirect URL returned in the response
        # provides you the activation key for your gateway in the query string parameter activationKey . It
        # may also include other activation-related parameters, however, these are merely defaults -- the
        # arguments you pass to the ActivateGateway API call determine the actual configuration of your
        # gateway. For more information, see Getting activation key in the Storage Gateway User Guide .

        @[JSON::Field(key: "ActivationKey")]
        getter activation_key : String

        # The name you configured for your gateway.

        @[JSON::Field(key: "GatewayName")]
        getter gateway_name : String

        # A value that indicates the Amazon Web Services Region where you want to store your data. The gateway
        # Amazon Web Services Region specified must be the same Amazon Web Services Region as the Amazon Web
        # Services Region in your Host header in the request. For more information about available Amazon Web
        # Services Regions and endpoints for Storage Gateway, see Storage Gateway endpoints and quotas in the
        # Amazon Web Services General Reference . Valid Values: See Storage Gateway endpoints and quotas in
        # the Amazon Web Services General Reference .

        @[JSON::Field(key: "GatewayRegion")]
        getter gateway_region : String

        # A value that indicates the time zone you want to set for the gateway. The time zone is of the format
        # "GMT", "GMT-hr:mm", or "GMT+hr:mm". For example, GMT indicates Greenwich Mean Time without any
        # offset. GMT-4:00 indicates the time is 4 hours behind GMT. GMT+2:00 indicates the time is 2 hours
        # ahead of GMT. The time zone is used, for example, for scheduling snapshots and your gateway's
        # maintenance schedule.

        @[JSON::Field(key: "GatewayTimezone")]
        getter gateway_timezone : String

        # A value that defines the type of gateway to activate. The type specified is critical to all later
        # functions of the gateway and cannot be changed after activation. The default value is CACHED .
        # Amazon FSx File Gateway is no longer available to new customers. Existing customers of FSx File
        # Gateway can continue to use the service normally. For capabilities similar to FSx File Gateway,
        # visit this blog post . Valid Values: STORED | CACHED | VTL | FILE_S3 | FILE_FSX_SMB

        @[JSON::Field(key: "GatewayType")]
        getter gateway_type : String?

        # The value that indicates the type of medium changer to use for tape gateway. This field is optional.
        # Valid Values: STK-L700 | AWS-Gateway-VTL | IBM-03584L32-0402

        @[JSON::Field(key: "MediumChangerType")]
        getter medium_changer_type : String?

        # A list of up to 50 tags that you can assign to the gateway. Each tag is a key-value pair. Valid
        # characters for key and value are letters, spaces, and numbers that can be represented in UTF-8
        # format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is
        # 128 characters, and the maximum length for a tag's value is 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The value that indicates the type of tape drive to use for tape gateway. This field is optional.
        # Valid Values: IBM-ULT3580-TD5

        @[JSON::Field(key: "TapeDriveType")]
        getter tape_drive_type : String?

        def initialize(
          @activation_key : String,
          @gateway_name : String,
          @gateway_region : String,
          @gateway_timezone : String,
          @gateway_type : String? = nil,
          @medium_changer_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tape_drive_type : String? = nil
        )
        end
      end

      # Storage Gateway returns the Amazon Resource Name (ARN) of the activated gateway. It is a string made
      # of information such as your account, gateway name, and Amazon Web Services Region. This ARN is used
      # to reference the gateway in other API operations as well as resource-based authorization. For
      # gateways activated prior to September 02, 2015, the gateway ARN contains the gateway name rather
      # than the gateway ID. Changing the name of the gateway has no effect on the gateway ARN.

      struct ActivateGatewayOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct AddCacheInput
        include JSON::Serializable

        # An array of strings that identify disks that are to be configured as working storage. Each string
        # has a minimum length of 1 and maximum length of 300. You can get the disk IDs from the
        # ListLocalDisks API.

        @[JSON::Field(key: "DiskIds")]
        getter disk_ids : Array(String)


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @disk_ids : Array(String),
          @gateway_arn : String
        )
        end
      end


      struct AddCacheOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # AddTagsToResourceInput

      struct AddTagsToResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource you want to add tags to.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The key-value pair that represents the tag you want to add to the resource. The value can be an
        # empty string. Valid characters for key and value are letters, spaces, and numbers representable in
        # UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's
        # key is 128 characters, and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # AddTagsToResourceOutput

      struct AddTagsToResourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource you want to add tags to.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end


      struct AddUploadBufferInput
        include JSON::Serializable

        # An array of strings that identify disks that are to be configured as working storage. Each string
        # has a minimum length of 1 and maximum length of 300. You can get the disk IDs from the
        # ListLocalDisks API.

        @[JSON::Field(key: "DiskIds")]
        getter disk_ids : Array(String)


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @disk_ids : Array(String),
          @gateway_arn : String
        )
        end
      end


      struct AddUploadBufferOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A JSON object containing one or more of the following fields: AddWorkingStorageInput$DiskIds

      struct AddWorkingStorageInput
        include JSON::Serializable

        # An array of strings that identify disks that are to be configured as working storage. Each string
        # has a minimum length of 1 and maximum length of 300. You can get the disk IDs from the
        # ListLocalDisks API.

        @[JSON::Field(key: "DiskIds")]
        getter disk_ids : Array(String)


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @disk_ids : Array(String),
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway for which working storage was
      # configured.

      struct AddWorkingStorageOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct AssignTapePoolInput
        include JSON::Serializable

        # The ID of the pool that you want to add your tape to for archiving. The tape in this pool is
        # archived in the S3 storage class that is associated with the pool. When you use your backup
        # application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or
        # S3 Glacier Deep Archive) that corresponds to the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # The unique Amazon Resource Name (ARN) of the virtual tape that you want to add to the tape pool.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String

        # Set permissions to bypass governance retention. If the lock type of the archived tape is Governance
        # , the tape's archived age is not older than RetentionLockInDays , and the user does not already have
        # BypassGovernanceRetention , setting this to TRUE enables the user to bypass the retention lock. This
        # parameter is set to true by default for calls from the console. Valid values: TRUE | FALSE

        @[JSON::Field(key: "BypassGovernanceRetention")]
        getter bypass_governance_retention : Bool?

        def initialize(
          @pool_id : String,
          @tape_arn : String,
          @bypass_governance_retention : Bool? = nil
        )
        end
      end


      struct AssignTapePoolOutput
        include JSON::Serializable

        # The unique Amazon Resource Names (ARN) of the virtual tape that was added to the tape pool.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        def initialize(
          @tape_arn : String? = nil
        )
        end
      end


      struct AssociateFileSystemInput
        include JSON::Serializable

        # A unique string value that you supply that is used by the FSx File Gateway to ensure idempotent file
        # system association creation.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The Amazon Resource Name (ARN) of the Amazon FSx file system to associate with the FSx File Gateway.

        @[JSON::Field(key: "LocationARN")]
        getter location_arn : String

        # The password of the user credential.

        @[JSON::Field(key: "Password")]
        getter password : String

        # The user name of the user credential that has permission to access the root share D$ of the Amazon
        # FSx file system. The user account must belong to the Amazon FSx delegated admin user group.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The Amazon Resource Name (ARN) of the storage used for the audit logs.

        @[JSON::Field(key: "AuditDestinationARN")]
        getter audit_destination_arn : String?


        @[JSON::Field(key: "CacheAttributes")]
        getter cache_attributes : Types::CacheAttributes?

        # Specifies the network configuration information for the gateway associated with the Amazon FSx file
        # system. If multiple file systems are associated with this gateway, this parameter's IpAddresses
        # field is required.

        @[JSON::Field(key: "EndpointNetworkConfiguration")]
        getter endpoint_network_configuration : Types::EndpointNetworkConfiguration?

        # A list of up to 50 tags that can be assigned to the file system association. Each tag is a key-value
        # pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @gateway_arn : String,
          @location_arn : String,
          @password : String,
          @user_name : String,
          @audit_destination_arn : String? = nil,
          @cache_attributes : Types::CacheAttributes? = nil,
          @endpoint_network_configuration : Types::EndpointNetworkConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct AssociateFileSystemOutput
        include JSON::Serializable

        # The ARN of the newly created file system association.

        @[JSON::Field(key: "FileSystemAssociationARN")]
        getter file_system_association_arn : String?

        def initialize(
          @file_system_association_arn : String? = nil
        )
        end
      end

      # AttachVolumeInput

      struct AttachVolumeInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway that you want to attach the volume to.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The network interface of the gateway on which to expose the iSCSI target. Accepts IPv4 and IPv6
        # addresses. Use DescribeGatewayInformation to get a list of the network interfaces available on a
        # gateway. Valid Values: A valid IP address.

        @[JSON::Field(key: "NetworkInterfaceId")]
        getter network_interface_id : String

        # The Amazon Resource Name (ARN) of the volume to attach to the specified gateway.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String

        # The unique device ID or other distinguishing data that identifies the local disk used to create the
        # volume. This value is only required when you are attaching a stored volume.

        @[JSON::Field(key: "DiskId")]
        getter disk_id : String?

        # The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for
        # the target ARN. For example, specifying TargetName as myvolume results in the target ARN of
        # arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume
        # . The target name must be unique across all volumes on a gateway. If you don't specify a value,
        # Storage Gateway uses the value that was previously used for this volume as the new target name.

        @[JSON::Field(key: "TargetName")]
        getter target_name : String?

        def initialize(
          @gateway_arn : String,
          @network_interface_id : String,
          @volume_arn : String,
          @disk_id : String? = nil,
          @target_name : String? = nil
        )
        end
      end

      # AttachVolumeOutput

      struct AttachVolumeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume target, which includes the iSCSI name for the initiator
        # that was used to connect to the target.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String?

        # The Amazon Resource Name (ARN) of the volume that was attached to the gateway.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        def initialize(
          @target_arn : String? = nil,
          @volume_arn : String? = nil
        )
        end
      end

      # Information about the gateway's automatic tape creation policies, including the automatic tape
      # creation rules and the gateway that is using the policies.

      struct AutomaticTapeCreationPolicyInfo
        include JSON::Serializable

        # An automatic tape creation policy consists of a list of automatic tape creation rules. This returns
        # the rules that determine when and how to automatically create new tapes.

        @[JSON::Field(key: "AutomaticTapeCreationRules")]
        getter automatic_tape_creation_rules : Array(Types::AutomaticTapeCreationRule)?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @automatic_tape_creation_rules : Array(Types::AutomaticTapeCreationRule)? = nil,
          @gateway_arn : String? = nil
        )
        end
      end

      # An automatic tape creation policy consists of automatic tape creation rules where each rule defines
      # when and how to create new tapes. For more information about automatic tape creation, see Creating
      # Tapes Automatically .

      struct AutomaticTapeCreationRule
        include JSON::Serializable

        # The minimum number of available virtual tapes that the gateway maintains at all times. If the number
        # of tapes on the gateway goes below this value, the gateway creates as many new tapes as are needed
        # to have MinimumNumTapes on the gateway. For more information about automatic tape creation, see
        # Creating Tapes Automatically .

        @[JSON::Field(key: "MinimumNumTapes")]
        getter minimum_num_tapes : Int32

        # The ID of the pool that you want to add your tape to for archiving. The tape in this pool is
        # archived in the Amazon S3 storage class that is associated with the pool. When you use your backup
        # application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or
        # S3 Glacier Deep Archive) that corresponds to the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # A prefix that you append to the barcode of the virtual tape that you are creating. This prefix makes
        # the barcode unique. The prefix must be 1-4 characters in length and must be one of the uppercase
        # letters from A to Z.

        @[JSON::Field(key: "TapeBarcodePrefix")]
        getter tape_barcode_prefix : String

        # The size, in bytes, of the virtual tape capacity.

        @[JSON::Field(key: "TapeSizeInBytes")]
        getter tape_size_in_bytes : Int64

        # Set to true to indicate that tapes are to be archived as write-once-read-many (WORM). Set to false
        # when WORM is not enabled for tapes.

        @[JSON::Field(key: "Worm")]
        getter worm : Bool?

        def initialize(
          @minimum_num_tapes : Int32,
          @pool_id : String,
          @tape_barcode_prefix : String,
          @tape_size_in_bytes : Int64,
          @worm : Bool? = nil
        )
        end
      end

      # Describes a bandwidth rate limit interval for a gateway. A bandwidth rate limit schedule consists of
      # one or more bandwidth rate limit intervals. A bandwidth rate limit interval defines a period of time
      # on one or more days of the week, during which bandwidth rate limits are specified for uploading,
      # downloading, or both. FSx File Gateway does not support this feature.

      struct BandwidthRateLimitInterval
        include JSON::Serializable

        # The days of the week component of the bandwidth rate limit interval, represented as ordinal numbers
        # from 0 to 6, where 0 represents Sunday and 6 represents Saturday.

        @[JSON::Field(key: "DaysOfWeek")]
        getter days_of_week : Array(Int32)

        # The hour of the day to end the bandwidth rate limit interval.

        @[JSON::Field(key: "EndHourOfDay")]
        getter end_hour_of_day : Int32

        # The minute of the hour to end the bandwidth rate limit interval. The bandwidth rate limit interval
        # ends at the end of the minute. To end an interval at the end of an hour, use the value 59 .

        @[JSON::Field(key: "EndMinuteOfHour")]
        getter end_minute_of_hour : Int32

        # The hour of the day to start the bandwidth rate limit interval.

        @[JSON::Field(key: "StartHourOfDay")]
        getter start_hour_of_day : Int32

        # The minute of the hour to start the bandwidth rate limit interval. The interval begins at the start
        # of that minute. To begin an interval exactly at the start of the hour, use the value 0 .

        @[JSON::Field(key: "StartMinuteOfHour")]
        getter start_minute_of_hour : Int32

        # The average download rate limit component of the bandwidth rate limit interval, in bits per second.
        # This field does not appear in the response if the download rate limit is not set. S3 File Gateway
        # does not support this feature.

        @[JSON::Field(key: "AverageDownloadRateLimitInBitsPerSec")]
        getter average_download_rate_limit_in_bits_per_sec : Int64?

        # The average upload rate limit component of the bandwidth rate limit interval, in bits per second.
        # This field does not appear in the response if the upload rate limit is not set. For Tape Gateway and
        # Volume Gateway, the minimum value is 51200 . This field is required for S3 File Gateway, and the
        # minimum value is 104857600 .

        @[JSON::Field(key: "AverageUploadRateLimitInBitsPerSec")]
        getter average_upload_rate_limit_in_bits_per_sec : Int64?

        def initialize(
          @days_of_week : Array(Int32),
          @end_hour_of_day : Int32,
          @end_minute_of_hour : Int32,
          @start_hour_of_day : Int32,
          @start_minute_of_hour : Int32,
          @average_download_rate_limit_in_bits_per_sec : Int64? = nil,
          @average_upload_rate_limit_in_bits_per_sec : Int64? = nil
        )
        end
      end

      # The refresh cache information for the file share or FSx file systems.

      struct CacheAttributes
        include JSON::Serializable

        # Refreshes a file share's cache by using Time To Live (TTL). TTL is the length of time since the last
        # refresh after which access to the directory would cause the file gateway to first refresh that
        # directory's contents from the Amazon S3 bucket or Amazon FSx file system. The TTL duration is in
        # seconds. Valid Values:0, 300 to 2,592,000 seconds (5 minutes to 30 days)

        @[JSON::Field(key: "CacheStaleTimeoutInSeconds")]
        getter cache_stale_timeout_in_seconds : Int32?

        def initialize(
          @cache_stale_timeout_in_seconds : Int32? = nil
        )
        end
      end

      # A list of filter parameters and associated values that determine which files are included or
      # excluded from a cache report created by a StartCacheReport request. Multiple instances of the same
      # filter parameter are combined with an OR operation, while different parameters are combined with an
      # AND operation.

      struct CacheReportFilter
        include JSON::Serializable

        # The parameter name for a filter that determines which files are included or excluded from a cache
        # report. Valid Names: UploadFailureReason | UploadState

        @[JSON::Field(key: "Name")]
        getter name : String

        # The parameter value for a filter that determines which files are included or excluded from a cache
        # report. Valid UploadFailureReason Values: InaccessibleStorageClass | InvalidObjectState |
        # ObjectMissing | S3AccessDenied Valid UploadState Values: FailingUpload

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Contains all informational fields associated with a cache report. Includes name, ARN, tags, status,
      # progress, filters, start time, and end time.

      struct CacheReportInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cache report you want to describe.

        @[JSON::Field(key: "CacheReportARN")]
        getter cache_report_arn : String?

        # The status of the specified cache report.

        @[JSON::Field(key: "CacheReportStatus")]
        getter cache_report_status : String?

        # The time at which the gateway stopped generating the cache report.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The list of filters and parameters that determine which files are excluded from the report.

        @[JSON::Field(key: "ExclusionFilters")]
        getter exclusion_filters : Array(Types::CacheReportFilter)?


        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?

        # The list of filters and parameters that determine which files are included in the report.

        @[JSON::Field(key: "InclusionFilters")]
        getter inclusion_filters : Array(Types::CacheReportFilter)?

        # The ARN of the Amazon S3 bucket location where the cache report is saved.

        @[JSON::Field(key: "LocationARN")]
        getter location_arn : String?

        # The percentage of the report generation process that has been completed at time of inquiry.

        @[JSON::Field(key: "ReportCompletionPercent")]
        getter report_completion_percent : Int32?

        # The file name of the completed cache report object stored in Amazon S3.

        @[JSON::Field(key: "ReportName")]
        getter report_name : String?


        @[JSON::Field(key: "Role")]
        getter role : String?

        # The time at which the gateway started generating the cache report.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The list of key/value tags associated with the report.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cache_report_arn : String? = nil,
          @cache_report_status : String? = nil,
          @end_time : Time? = nil,
          @exclusion_filters : Array(Types::CacheReportFilter)? = nil,
          @file_share_arn : String? = nil,
          @inclusion_filters : Array(Types::CacheReportFilter)? = nil,
          @location_arn : String? = nil,
          @report_completion_percent : Int32? = nil,
          @report_name : String? = nil,
          @role : String? = nil,
          @start_time : Time? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes an iSCSI cached volume.

      struct CachediSCSIVolume
        include JSON::Serializable

        # The date the volume was created. Volumes created prior to March 28, 2017 don’t have this timestamp.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?


        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # If the cached volume was created from a snapshot, this field contains the snapshot ID used, e.g.,
        # snap-78e22663. Otherwise, this field is not included.

        @[JSON::Field(key: "SourceSnapshotId")]
        getter source_snapshot_id : String?

        # The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for
        # the target ARN. For example, specifying TargetName as myvolume results in the target ARN of
        # arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume
        # . The target name must be unique across all volumes on a gateway. If you don't specify a value,
        # Storage Gateway uses the value that was previously used for this volume as the new target name.

        @[JSON::Field(key: "TargetName")]
        getter target_name : String?

        # The Amazon Resource Name (ARN) of the storage volume.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        # A value that indicates whether a storage volume is attached to or detached from a gateway. For more
        # information, see Moving your volumes to a different gateway .

        @[JSON::Field(key: "VolumeAttachmentStatus")]
        getter volume_attachment_status : String?

        # The unique identifier of the volume, e.g., vol-AE4B946D.

        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        # Represents the percentage complete if the volume is restoring or bootstrapping that represents the
        # percent of data transferred. This field does not appear in the response if the cached volume is not
        # restoring or bootstrapping.

        @[JSON::Field(key: "VolumeProgress")]
        getter volume_progress : Float64?

        # The size, in bytes, of the volume capacity.

        @[JSON::Field(key: "VolumeSizeInBytes")]
        getter volume_size_in_bytes : Int64?

        # One of the VolumeStatus values that indicates the state of the storage volume.

        @[JSON::Field(key: "VolumeStatus")]
        getter volume_status : String?

        # One of the VolumeType enumeration values that describes the type of the volume.

        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String?

        # The size of the data stored on the volume in bytes. This value is calculated based on the number of
        # blocks that are touched, instead of the actual amount of data written. This value can be useful for
        # sequential write patterns but less accurate for random write patterns. VolumeUsedInBytes is
        # different from the compressed size of the volume, which is the value that is used to calculate your
        # bill. This value is not available for volumes created prior to May 13, 2015, until you store data on
        # the volume. If you use a delete tool that overwrites the data on your volume with random data, your
        # usage will not be reduced. This is because the random data is not compressible. If you want to
        # reduce the amount of billed storage on your volume, we recommend overwriting your files with zeros
        # to compress the data to a negligible amount of actual storage.

        @[JSON::Field(key: "VolumeUsedInBytes")]
        getter volume_used_in_bytes : Int64?

        # An VolumeiSCSIAttributes object that represents a collection of iSCSI attributes for one stored
        # volume.

        @[JSON::Field(key: "VolumeiSCSIAttributes")]
        getter volumei_scsi_attributes : Types::VolumeiSCSIAttributes?

        def initialize(
          @created_date : Time? = nil,
          @kms_key : String? = nil,
          @source_snapshot_id : String? = nil,
          @target_name : String? = nil,
          @volume_arn : String? = nil,
          @volume_attachment_status : String? = nil,
          @volume_id : String? = nil,
          @volume_progress : Float64? = nil,
          @volume_size_in_bytes : Int64? = nil,
          @volume_status : String? = nil,
          @volume_type : String? = nil,
          @volume_used_in_bytes : Int64? = nil,
          @volumei_scsi_attributes : Types::VolumeiSCSIAttributes? = nil
        )
        end
      end

      # CancelArchivalInput

      struct CancelArchivalInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The Amazon Resource Name (ARN) of the virtual tape you want to cancel archiving for.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String

        def initialize(
          @gateway_arn : String,
          @tape_arn : String
        )
        end
      end

      # CancelArchivalOutput

      struct CancelArchivalOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the virtual tape for which archiving was canceled.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        def initialize(
          @tape_arn : String? = nil
        )
        end
      end


      struct CancelCacheReportInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cache report you want to cancel.

        @[JSON::Field(key: "CacheReportARN")]
        getter cache_report_arn : String

        def initialize(
          @cache_report_arn : String
        )
        end
      end


      struct CancelCacheReportOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cache report you want to cancel.

        @[JSON::Field(key: "CacheReportARN")]
        getter cache_report_arn : String?

        def initialize(
          @cache_report_arn : String? = nil
        )
        end
      end

      # CancelRetrievalInput

      struct CancelRetrievalInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The Amazon Resource Name (ARN) of the virtual tape you want to cancel retrieval for.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String

        def initialize(
          @gateway_arn : String,
          @tape_arn : String
        )
        end
      end

      # CancelRetrievalOutput

      struct CancelRetrievalOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the virtual tape for which retrieval was canceled.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        def initialize(
          @tape_arn : String? = nil
        )
        end
      end

      # Describes Challenge-Handshake Authentication Protocol (CHAP) information that supports
      # authentication between your gateway and iSCSI initiators.

      struct ChapInfo
        include JSON::Serializable

        # The iSCSI initiator that connects to the target.

        @[JSON::Field(key: "InitiatorName")]
        getter initiator_name : String?

        # The secret key that the initiator (for example, the Windows client) must provide to participate in
        # mutual CHAP with the target.

        @[JSON::Field(key: "SecretToAuthenticateInitiator")]
        getter secret_to_authenticate_initiator : String?

        # The secret key that the target must provide to participate in mutual CHAP with the initiator (e.g.,
        # Windows client).

        @[JSON::Field(key: "SecretToAuthenticateTarget")]
        getter secret_to_authenticate_target : String?

        # The Amazon Resource Name (ARN) of the volume. Valid Values: 50 to 500 lowercase letters, numbers,
        # periods (.), and hyphens (-).

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String?

        def initialize(
          @initiator_name : String? = nil,
          @secret_to_authenticate_initiator : String? = nil,
          @secret_to_authenticate_target : String? = nil,
          @target_arn : String? = nil
        )
        end
      end


      struct CreateCachediSCSIVolumeInput
        include JSON::Serializable

        # A unique identifier that you use to retry a request. If you retry a request, use the same
        # ClientToken you specified in the initial request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The network interface of the gateway on which to expose the iSCSI target. Accepts IPv4 and IPv6
        # addresses. Use DescribeGatewayInformation to get a list of the network interfaces available on a
        # gateway. Valid Values: A valid IP address.

        @[JSON::Field(key: "NetworkInterfaceId")]
        getter network_interface_id : String

        # The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for
        # the target ARN. For example, specifying TargetName as myvolume results in the target ARN of
        # arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume
        # . The target name must be unique across all volumes on a gateway. If you don't specify a value,
        # Storage Gateway uses the value that was previously used for this volume as the new target name.

        @[JSON::Field(key: "TargetName")]
        getter target_name : String

        # The size of the volume in bytes.

        @[JSON::Field(key: "VolumeSizeInBytes")]
        getter volume_size_in_bytes : Int64

        # Set to true to use Amazon S3 server-side encryption with your own KMS key, or false to use a key
        # managed by Amazon S3. Optional. Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?

        # The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3
        # server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set
        # when KMSEncrypted is true . Optional.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The snapshot ID (e.g. "snap-1122aabb") of the snapshot to restore as the new cached volume. Specify
        # this field if you want to create the iSCSI storage volume from a snapshot; otherwise, do not include
        # this field. To list snapshots for your account use DescribeSnapshots in the Amazon Elastic Compute
        # Cloud API Reference .

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        # The ARN for an existing volume. Specifying this ARN makes the new volume into an exact copy of the
        # specified existing volume's latest recovery point. The VolumeSizeInBytes value for this new volume
        # must be equal to or larger than the size of the existing volume, in bytes.

        @[JSON::Field(key: "SourceVolumeARN")]
        getter source_volume_arn : String?

        # A list of up to 50 tags that you can assign to a cached volume. Each tag is a key-value pair. Valid
        # characters for key and value are letters, spaces, and numbers that you can represent in UTF-8
        # format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is
        # 128 characters, and the maximum length for a tag's value is 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @gateway_arn : String,
          @network_interface_id : String,
          @target_name : String,
          @volume_size_in_bytes : Int64,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @snapshot_id : String? = nil,
          @source_volume_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCachediSCSIVolumeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume target, which includes the iSCSI name that initiators
        # can use to connect to the target.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String?

        # The Amazon Resource Name (ARN) of the configured volume.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        def initialize(
          @target_arn : String? = nil,
          @volume_arn : String? = nil
        )
        end
      end

      # CreateNFSFileShareInput

      struct CreateNFSFileShareInput
        include JSON::Serializable

        # A unique string value that you supply that is used by S3 File Gateway to ensure idempotent file
        # share creation.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the S3 File Gateway on which you want to create a file share.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # A custom ARN for the backend storage used for storing data for file shares. It includes a resource
        # ARN with an optional prefix concatenation. The prefix must end with a forward slash (/). You can
        # specify LocationARN as a bucket ARN, access point ARN or access point alias, as shown in the
        # following examples. Bucket ARN: arn:aws:s3:::amzn-s3-demo-bucket/prefix/ Access point ARN:
        # arn:aws:s3:region:account-id:accesspoint/access-point-name/prefix/ If you specify an access point,
        # the bucket policy must be configured to delegate access control to the access point. For
        # information, see Delegating access control to access points in the Amazon S3 User Guide . Access
        # point alias: test-ap-ab123cdef4gehijklmn5opqrstuvuse1a-s3alias

        @[JSON::Field(key: "LocationARN")]
        getter location_arn : String

        # The ARN of the Identity and Access Management (IAM) role that an S3 File Gateway assumes when it
        # accesses the underlying storage.

        @[JSON::Field(key: "Role")]
        getter role : String

        # The Amazon Resource Name (ARN) of the storage used for audit logs.

        @[JSON::Field(key: "AuditDestinationARN")]
        getter audit_destination_arn : String?

        # Specifies the Region of the S3 bucket where the NFS file share stores files. This parameter is
        # required for NFS file shares that connect to Amazon S3 through a VPC endpoint, a VPC access point,
        # or an access point alias that points to a VPC access point.

        @[JSON::Field(key: "BucketRegion")]
        getter bucket_region : String?

        # Specifies refresh cache information for the file share.

        @[JSON::Field(key: "CacheAttributes")]
        getter cache_attributes : Types::CacheAttributes?

        # The list of clients that are allowed to access the S3 File Gateway. The list must contain either
        # valid IPv4/IPv6 addresses or valid CIDR blocks.

        @[JSON::Field(key: "ClientList")]
        getter client_list : Array(String)?

        # The default storage class for objects put into an Amazon S3 bucket by the S3 File Gateway. The
        # default value is S3_STANDARD . Optional. Valid Values: S3_STANDARD | S3_INTELLIGENT_TIERING |
        # S3_STANDARD_IA | S3_ONEZONE_IA

        @[JSON::Field(key: "DefaultStorageClass")]
        getter default_storage_class : String?

        # A value that specifies the type of server-side encryption that the file share will use for the data
        # that it stores in Amazon S3. We recommend using EncryptionType instead of KMSEncrypted to set the
        # file share encryption method. You do not need to provide values for both parameters. If values for
        # both parameters exist in the same request, then the specified encryption methods must not conflict.
        # For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If EncryptionType is
        # SseKms or DsseKms , then KMSEncrypted must be true .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        # The name of the file share. Optional. FileShareName must be set if an S3 prefix name is set in
        # LocationARN , or if an access point or access point alias is used. A valid NFS file share name can
        # only contain the following characters: a - z , A - Z , 0 - 9 , - , . , and _ .

        @[JSON::Field(key: "FileShareName")]
        getter file_share_name : String?

        # A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set
        # this value to true to enable MIME type guessing, otherwise set to false . The default value is true
        # . Valid Values: true | false

        @[JSON::Field(key: "GuessMIMETypeEnabled")]
        getter guess_mime_type_enabled : Bool?

        # Optional. Set to true to use Amazon S3 server-side encryption with your own KMS key (SSE-KMS), or
        # false to use a key managed by Amazon S3 (SSE-S3). To use dual-layer encryption (DSSE-KMS), set the
        # EncryptionType parameter instead. We recommend using EncryptionType instead of KMSEncrypted to set
        # the file share encryption method. You do not need to provide values for both parameters. If values
        # for both parameters exist in the same request, then the specified encryption methods must not
        # conflict. For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If
        # EncryptionType is SseKms or DsseKms , then KMSEncrypted must be true . Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?

        # Optional. The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3
        # server-side encryption. Storage Gateway does not support asymmetric CMKs. This value must be set if
        # KMSEncrypted is true , or if EncryptionType is SseKms or DsseKms .

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # File share default values. Optional.

        @[JSON::Field(key: "NFSFileShareDefaults")]
        getter nfs_file_share_defaults : Types::NFSFileShareDefaults?

        # The notification policy of the file share. SettlingTimeInSeconds controls the number of seconds to
        # wait after the last point in time a client wrote to a file before generating an ObjectUploaded
        # notification. Because clients can make many small writes to files, it's best to set this parameter
        # for as long as possible to avoid generating multiple notifications for the same file in a small time
        # period. SettlingTimeInSeconds has no effect on the timing of the object uploading to Amazon S3, only
        # the timing of the notification. This setting is not meant to specify an exact time at which the
        # notification will be sent. In some cases, the gateway might require more than the specified delay
        # time to generate and send notifications. The following example sets NotificationPolicy on with
        # SettlingTimeInSeconds set to 60. {\"Upload\": {\"SettlingTimeInSeconds\": 60}} The following example
        # sets NotificationPolicy off. {}

        @[JSON::Field(key: "NotificationPolicy")]
        getter notification_policy : String?

        # A value that sets the access control list (ACL) permission for objects in the S3 bucket that a S3
        # File Gateway puts objects into. The default value is private .

        @[JSON::Field(key: "ObjectACL")]
        getter object_acl : String?

        # A value that sets the write status of a file share. Set this value to true to set the write status
        # to read-only, otherwise set to false . Valid Values: true | false

        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # A value that sets who pays the cost of the request and the cost associated with data download from
        # the S3 bucket. If this value is set to true , the requester pays the costs; otherwise, the S3 bucket
        # owner pays. However, the S3 bucket owner always pays the cost of storing data. RequesterPays is a
        # configuration for the S3 bucket that backs the file share, so make sure that the configuration on
        # the file share is the same as the S3 bucket configuration. Valid Values: true | false

        @[JSON::Field(key: "RequesterPays")]
        getter requester_pays : Bool?

        # A value that maps a user to anonymous user. Valid values are the following: RootSquash : Only root
        # is mapped to anonymous user. NoSquash : No one is mapped to anonymous user. AllSquash : Everyone is
        # mapped to anonymous user.

        @[JSON::Field(key: "Squash")]
        getter squash : String?

        # A list of up to 50 tags that can be assigned to the NFS file share. Each tag is a key-value pair.
        # Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format,
        # and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128
        # characters, and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the DNS name for the VPC endpoint that the NFS file share uses to connect to Amazon S3.
        # This parameter is required for NFS file shares that connect to Amazon S3 through a VPC endpoint, a
        # VPC access point, or an access point alias that points to a VPC access point.

        @[JSON::Field(key: "VPCEndpointDNSName")]
        getter vpc_endpoint_dns_name : String?

        def initialize(
          @client_token : String,
          @gateway_arn : String,
          @location_arn : String,
          @role : String,
          @audit_destination_arn : String? = nil,
          @bucket_region : String? = nil,
          @cache_attributes : Types::CacheAttributes? = nil,
          @client_list : Array(String)? = nil,
          @default_storage_class : String? = nil,
          @encryption_type : String? = nil,
          @file_share_name : String? = nil,
          @guess_mime_type_enabled : Bool? = nil,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @nfs_file_share_defaults : Types::NFSFileShareDefaults? = nil,
          @notification_policy : String? = nil,
          @object_acl : String? = nil,
          @read_only : Bool? = nil,
          @requester_pays : Bool? = nil,
          @squash : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_endpoint_dns_name : String? = nil
        )
        end
      end

      # CreateNFSFileShareOutput

      struct CreateNFSFileShareOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created file share.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?

        def initialize(
          @file_share_arn : String? = nil
        )
        end
      end

      # CreateSMBFileShareInput

      struct CreateSMBFileShareInput
        include JSON::Serializable

        # A unique string value that you supply that is used by S3 File Gateway to ensure idempotent file
        # share creation.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The ARN of the S3 File Gateway on which you want to create a file share.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # A custom ARN for the backend storage used for storing data for file shares. It includes a resource
        # ARN with an optional prefix concatenation. The prefix must end with a forward slash (/). You can
        # specify LocationARN as a bucket ARN, access point ARN or access point alias, as shown in the
        # following examples. Bucket ARN: arn:aws:s3:::amzn-s3-demo-bucket/prefix/ Access point ARN:
        # arn:aws:s3:region:account-id:accesspoint/access-point-name/prefix/ If you specify an access point,
        # the bucket policy must be configured to delegate access control to the access point. For
        # information, see Delegating access control to access points in the Amazon S3 User Guide . Access
        # point alias: test-ap-ab123cdef4gehijklmn5opqrstuvuse1a-s3alias

        @[JSON::Field(key: "LocationARN")]
        getter location_arn : String

        # The ARN of the Identity and Access Management (IAM) role that an S3 File Gateway assumes when it
        # accesses the underlying storage.

        @[JSON::Field(key: "Role")]
        getter role : String

        # The files and folders on this share will only be visible to users with read access.

        @[JSON::Field(key: "AccessBasedEnumeration")]
        getter access_based_enumeration : Bool?

        # A list of users or groups in the Active Directory that will be granted administrator privileges on
        # the file share. These users can do all file operations as the super-user. Acceptable formats
        # include: DOMAIN\User1 , user1 , @group1 , and @DOMAIN\group1 . Use this option very carefully,
        # because any user in this list can do anything they like on the file share, regardless of file
        # permissions.

        @[JSON::Field(key: "AdminUserList")]
        getter admin_user_list : Array(String)?

        # The Amazon Resource Name (ARN) of the storage used for audit logs.

        @[JSON::Field(key: "AuditDestinationARN")]
        getter audit_destination_arn : String?

        # The authentication method that users use to access the file share. The default is ActiveDirectory .
        # Valid Values: ActiveDirectory | GuestAccess

        @[JSON::Field(key: "Authentication")]
        getter authentication : String?

        # Specifies the Region of the S3 bucket where the SMB file share stores files. This parameter is
        # required for SMB file shares that connect to Amazon S3 through a VPC endpoint, a VPC access point,
        # or an access point alias that points to a VPC access point.

        @[JSON::Field(key: "BucketRegion")]
        getter bucket_region : String?

        # Specifies refresh cache information for the file share.

        @[JSON::Field(key: "CacheAttributes")]
        getter cache_attributes : Types::CacheAttributes?

        # The case of an object name in an Amazon S3 bucket. For ClientSpecified , the client determines the
        # case sensitivity. For CaseSensitive , the gateway determines the case sensitivity. The default value
        # is ClientSpecified .

        @[JSON::Field(key: "CaseSensitivity")]
        getter case_sensitivity : String?

        # The default storage class for objects put into an Amazon S3 bucket by the S3 File Gateway. The
        # default value is S3_STANDARD . Optional. Valid Values: S3_STANDARD | S3_INTELLIGENT_TIERING |
        # S3_STANDARD_IA | S3_ONEZONE_IA

        @[JSON::Field(key: "DefaultStorageClass")]
        getter default_storage_class : String?

        # A value that specifies the type of server-side encryption that the file share will use for the data
        # that it stores in Amazon S3. We recommend using EncryptionType instead of KMSEncrypted to set the
        # file share encryption method. You do not need to provide values for both parameters. If values for
        # both parameters exist in the same request, then the specified encryption methods must not conflict.
        # For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If EncryptionType is
        # SseKms or DsseKms , then KMSEncrypted must be true .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        # The name of the file share. Optional. FileShareName must be set if an S3 prefix name is set in
        # LocationARN , or if an access point or access point alias is used. A valid SMB file share name
        # cannot contain the following characters: [ , ] , # , ; , &lt; , &gt; , : , " , \ , / , | , ? , * , +
        # , or ASCII control characters 1-31 .

        @[JSON::Field(key: "FileShareName")]
        getter file_share_name : String?

        # A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set
        # this value to true to enable MIME type guessing, otherwise set to false . The default value is true
        # . Valid Values: true | false

        @[JSON::Field(key: "GuessMIMETypeEnabled")]
        getter guess_mime_type_enabled : Bool?

        # A list of users or groups in the Active Directory that are not allowed to access the file share. A
        # group must be prefixed with the @ character. Acceptable formats include: DOMAIN\User1 , user1 ,
        # @group1 , and @DOMAIN\group1 . Can only be set if Authentication is set to ActiveDirectory .

        @[JSON::Field(key: "InvalidUserList")]
        getter invalid_user_list : Array(String)?

        # Optional. Set to true to use Amazon S3 server-side encryption with your own KMS key (SSE-KMS), or
        # false to use a key managed by Amazon S3 (SSE-S3). To use dual-layer encryption (DSSE-KMS), set the
        # EncryptionType parameter instead. We recommend using EncryptionType instead of KMSEncrypted to set
        # the file share encryption method. You do not need to provide values for both parameters. If values
        # for both parameters exist in the same request, then the specified encryption methods must not
        # conflict. For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If
        # EncryptionType is SseKms or DsseKms , then KMSEncrypted must be true . Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?

        # Optional. The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3
        # server-side encryption. Storage Gateway does not support asymmetric CMKs. This value must be set if
        # KMSEncrypted is true , or if EncryptionType is SseKms or DsseKms .

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The notification policy of the file share. SettlingTimeInSeconds controls the number of seconds to
        # wait after the last point in time a client wrote to a file before generating an ObjectUploaded
        # notification. Because clients can make many small writes to files, it's best to set this parameter
        # for as long as possible to avoid generating multiple notifications for the same file in a small time
        # period. SettlingTimeInSeconds has no effect on the timing of the object uploading to Amazon S3, only
        # the timing of the notification. This setting is not meant to specify an exact time at which the
        # notification will be sent. In some cases, the gateway might require more than the specified delay
        # time to generate and send notifications. The following example sets NotificationPolicy on with
        # SettlingTimeInSeconds set to 60. {\"Upload\": {\"SettlingTimeInSeconds\": 60}} The following example
        # sets NotificationPolicy off. {}

        @[JSON::Field(key: "NotificationPolicy")]
        getter notification_policy : String?

        # A value that sets the access control list (ACL) permission for objects in the S3 bucket that a S3
        # File Gateway puts objects into. The default value is private .

        @[JSON::Field(key: "ObjectACL")]
        getter object_acl : String?

        # Specifies whether opportunistic locking is enabled for the SMB file share. Enabling opportunistic
        # locking on case-sensitive shares is not recommended for workloads that involve access to files with
        # the same name in different case. Valid Values: true | false

        @[JSON::Field(key: "OplocksEnabled")]
        getter oplocks_enabled : Bool?

        # A value that sets the write status of a file share. Set this value to true to set the write status
        # to read-only, otherwise set to false . Valid Values: true | false

        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # A value that sets who pays the cost of the request and the cost associated with data download from
        # the S3 bucket. If this value is set to true , the requester pays the costs; otherwise, the S3 bucket
        # owner pays. However, the S3 bucket owner always pays the cost of storing data. RequesterPays is a
        # configuration for the S3 bucket that backs the file share, so make sure that the configuration on
        # the file share is the same as the S3 bucket configuration. Valid Values: true | false

        @[JSON::Field(key: "RequesterPays")]
        getter requester_pays : Bool?

        # Set this value to true to enable access control list (ACL) on the SMB file share. Set it to false to
        # map file and directory permissions to the POSIX permissions. For more information, see Using Windows
        # ACLs to limit SMB file share access in the Amazon S3 File Gateway User Guide . Valid Values: true |
        # false

        @[JSON::Field(key: "SMBACLEnabled")]
        getter smbacl_enabled : Bool?

        # A list of up to 50 tags that can be assigned to the NFS file share. Each tag is a key-value pair.
        # Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format,
        # and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128
        # characters, and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the DNS name for the VPC endpoint that the SMB file share uses to connect to Amazon S3.
        # This parameter is required for SMB file shares that connect to Amazon S3 through a VPC endpoint, a
        # VPC access point, or an access point alias that points to a VPC access point.

        @[JSON::Field(key: "VPCEndpointDNSName")]
        getter vpc_endpoint_dns_name : String?

        # A list of users or groups in the Active Directory that are allowed to access the file share. A group
        # must be prefixed with the @ character. Acceptable formats include: DOMAIN\User1 , user1 , @group1 ,
        # and @DOMAIN\group1 . Can only be set if Authentication is set to ActiveDirectory .

        @[JSON::Field(key: "ValidUserList")]
        getter valid_user_list : Array(String)?

        def initialize(
          @client_token : String,
          @gateway_arn : String,
          @location_arn : String,
          @role : String,
          @access_based_enumeration : Bool? = nil,
          @admin_user_list : Array(String)? = nil,
          @audit_destination_arn : String? = nil,
          @authentication : String? = nil,
          @bucket_region : String? = nil,
          @cache_attributes : Types::CacheAttributes? = nil,
          @case_sensitivity : String? = nil,
          @default_storage_class : String? = nil,
          @encryption_type : String? = nil,
          @file_share_name : String? = nil,
          @guess_mime_type_enabled : Bool? = nil,
          @invalid_user_list : Array(String)? = nil,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @notification_policy : String? = nil,
          @object_acl : String? = nil,
          @oplocks_enabled : Bool? = nil,
          @read_only : Bool? = nil,
          @requester_pays : Bool? = nil,
          @smbacl_enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_endpoint_dns_name : String? = nil,
          @valid_user_list : Array(String)? = nil
        )
        end
      end

      # CreateSMBFileShareOutput

      struct CreateSMBFileShareOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created file share.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?

        def initialize(
          @file_share_arn : String? = nil
        )
        end
      end


      struct CreateSnapshotFromVolumeRecoveryPointInput
        include JSON::Serializable

        # Textual description of the snapshot that appears in the Amazon EC2 console, Elastic Block Store
        # snapshots panel in the Description field, and in the Storage Gateway snapshot Details pane,
        # Description field.

        @[JSON::Field(key: "SnapshotDescription")]
        getter snapshot_description : String

        # The Amazon Resource Name (ARN) of the iSCSI volume target. Use the DescribeStorediSCSIVolumes
        # operation to return to retrieve the TargetARN for specified VolumeARN.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String

        # A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair. Valid
        # characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the
        # following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters,
        # and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @snapshot_description : String,
          @volume_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateSnapshotFromVolumeRecoveryPointOutput
        include JSON::Serializable

        # The ID of the snapshot.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        # The Amazon Resource Name (ARN) of the iSCSI volume target. Use the DescribeStorediSCSIVolumes
        # operation to return to retrieve the TargetARN for specified VolumeARN.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        # The time the volume was created from the recovery point.

        @[JSON::Field(key: "VolumeRecoveryPointTime")]
        getter volume_recovery_point_time : String?

        def initialize(
          @snapshot_id : String? = nil,
          @volume_arn : String? = nil,
          @volume_recovery_point_time : String? = nil
        )
        end
      end

      # A JSON object containing one or more of the following fields:
      # CreateSnapshotInput$SnapshotDescription CreateSnapshotInput$VolumeARN

      struct CreateSnapshotInput
        include JSON::Serializable

        # Textual description of the snapshot that appears in the Amazon EC2 console, Elastic Block Store
        # snapshots panel in the Description field, and in the Storage Gateway snapshot Details pane,
        # Description field.

        @[JSON::Field(key: "SnapshotDescription")]
        getter snapshot_description : String

        # The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of
        # gateway volumes.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String

        # A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair. Valid
        # characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the
        # following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters,
        # and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @snapshot_description : String,
          @volume_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A JSON object containing the following fields:

      struct CreateSnapshotOutput
        include JSON::Serializable

        # The snapshot ID that is used to refer to the snapshot in future operations such as describing
        # snapshots (Amazon Elastic Compute Cloud API DescribeSnapshots ) or creating a volume from a snapshot
        # ( CreateStorediSCSIVolume ).

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        # The Amazon Resource Name (ARN) of the volume of which the snapshot was taken.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        def initialize(
          @snapshot_id : String? = nil,
          @volume_arn : String? = nil
        )
        end
      end

      # A JSON object containing one or more of the following fields: CreateStorediSCSIVolumeInput$DiskId
      # CreateStorediSCSIVolumeInput$NetworkInterfaceId CreateStorediSCSIVolumeInput$PreserveExistingData
      # CreateStorediSCSIVolumeInput$SnapshotId CreateStorediSCSIVolumeInput$TargetName

      struct CreateStorediSCSIVolumeInput
        include JSON::Serializable

        # The unique identifier for the gateway local disk that is configured as a stored volume. Use
        # ListLocalDisks to list disk IDs for a gateway.

        @[JSON::Field(key: "DiskId")]
        getter disk_id : String


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The network interface of the gateway on which to expose the iSCSI target. Accepts IPv4 and IPv6
        # addresses. Use DescribeGatewayInformation to get a list of the network interfaces available on a
        # gateway. Valid Values: A valid IP address.

        @[JSON::Field(key: "NetworkInterfaceId")]
        getter network_interface_id : String

        # Set to true if you want to preserve the data on the local disk. Otherwise, set to false to create an
        # empty volume. Valid Values: true | false

        @[JSON::Field(key: "PreserveExistingData")]
        getter preserve_existing_data : Bool

        # The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for
        # the target ARN. For example, specifying TargetName as myvolume results in the target ARN of
        # arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume
        # . The target name must be unique across all volumes on a gateway. If you don't specify a value,
        # Storage Gateway uses the value that was previously used for this volume as the new target name.

        @[JSON::Field(key: "TargetName")]
        getter target_name : String

        # Set to true to use Amazon S3 server-side encryption with your own KMS key, or false to use a key
        # managed by Amazon S3. Optional. Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?

        # The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3
        # server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set
        # when KMSEncrypted is true . Optional.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The snapshot ID (e.g., "snap-1122aabb") of the snapshot to restore as the new stored volume. Specify
        # this field if you want to create the iSCSI storage volume from a snapshot; otherwise, do not include
        # this field. To list snapshots for your account use DescribeSnapshots in the Amazon Elastic Compute
        # Cloud API Reference .

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        # A list of up to 50 tags that can be assigned to a stored volume. Each tag is a key-value pair. Valid
        # characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the
        # following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters,
        # and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @disk_id : String,
          @gateway_arn : String,
          @network_interface_id : String,
          @preserve_existing_data : Bool,
          @target_name : String,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @snapshot_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A JSON object containing the following fields:

      struct CreateStorediSCSIVolumeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume target, which includes the iSCSI name that initiators
        # can use to connect to the target.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String?

        # The Amazon Resource Name (ARN) of the configured volume.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        # The size of the volume in bytes.

        @[JSON::Field(key: "VolumeSizeInBytes")]
        getter volume_size_in_bytes : Int64?

        def initialize(
          @target_arn : String? = nil,
          @volume_arn : String? = nil,
          @volume_size_in_bytes : Int64? = nil
        )
        end
      end


      struct CreateTapePoolInput
        include JSON::Serializable

        # The name of the new custom tape pool.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        # The storage class that is associated with the new custom pool. When you use your backup application
        # to eject the tape, the tape is archived directly into the storage class (S3 Glacier or S3 Glacier
        # Deep Archive) that corresponds to the pool.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String

        # Tape retention lock time is set in days. Tape retention lock can be enabled for up to 100 years
        # (36,500 days).

        @[JSON::Field(key: "RetentionLockTimeInDays")]
        getter retention_lock_time_in_days : Int32?

        # Tape retention lock can be configured in two modes. When configured in governance mode, Amazon Web
        # Services accounts with specific IAM permissions are authorized to remove the tape retention lock
        # from archived virtual tapes. When configured in compliance mode, the tape retention lock cannot be
        # removed by any user, including the root Amazon Web Services account.

        @[JSON::Field(key: "RetentionLockType")]
        getter retention_lock_type : String?

        # A list of up to 50 tags that can be assigned to tape pool. Each tag is a key-value pair. Valid
        # characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the
        # following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters,
        # and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @pool_name : String,
          @storage_class : String,
          @retention_lock_time_in_days : Int32? = nil,
          @retention_lock_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateTapePoolOutput
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) that represents the custom tape pool. Use the ListTapePools
        # operation to return a list of tape pools for your account and Amazon Web Services Region.

        @[JSON::Field(key: "PoolARN")]
        getter pool_arn : String?

        def initialize(
          @pool_arn : String? = nil
        )
        end
      end

      # CreateTapeWithBarcodeInput

      struct CreateTapeWithBarcodeInput
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) that represents the gateway to associate the virtual tape
        # with. Use the ListGateways operation to return a list of gateways for your account and Amazon Web
        # Services Region.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The barcode that you want to assign to the tape. Barcodes cannot be reused. This includes barcodes
        # used for tapes that have been deleted.

        @[JSON::Field(key: "TapeBarcode")]
        getter tape_barcode : String

        # The size, in bytes, of the virtual tape that you want to create. The size must be aligned by
        # gigabyte (1024*1024*1024 bytes).

        @[JSON::Field(key: "TapeSizeInBytes")]
        getter tape_size_in_bytes : Int64

        # Set to true to use Amazon S3 server-side encryption with your own KMS key, or false to use a key
        # managed by Amazon S3. Optional. Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?

        # The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3
        # server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set
        # when KMSEncrypted is true . Optional.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The ID of the pool that you want to add your tape to for archiving. The tape in this pool is
        # archived in the S3 storage class that is associated with the pool. When you use your backup
        # application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or
        # S3 Deep Archive) that corresponds to the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # A list of up to 50 tags that can be assigned to a virtual tape that has a barcode. Each tag is a
        # key-value pair. Valid characters for key and value are letters, spaces, and numbers representable in
        # UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's
        # key is 128 characters, and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Set to TRUE if the tape you are creating is to be configured as a write-once-read-many (WORM) tape.

        @[JSON::Field(key: "Worm")]
        getter worm : Bool?

        def initialize(
          @gateway_arn : String,
          @tape_barcode : String,
          @tape_size_in_bytes : Int64,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @pool_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @worm : Bool? = nil
        )
        end
      end

      # CreateTapeOutput

      struct CreateTapeWithBarcodeOutput
        include JSON::Serializable

        # A unique Amazon Resource Name (ARN) that represents the virtual tape that was created.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        def initialize(
          @tape_arn : String? = nil
        )
        end
      end

      # CreateTapesInput

      struct CreateTapesInput
        include JSON::Serializable

        # A unique identifier that you use to retry a request. If you retry a request, use the same
        # ClientToken you specified in the initial request. Using the same ClientToken prevents creating the
        # tape multiple times.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique Amazon Resource Name (ARN) that represents the gateway to associate the virtual tapes
        # with. Use the ListGateways operation to return a list of gateways for your account and Amazon Web
        # Services Region.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The number of virtual tapes that you want to create.

        @[JSON::Field(key: "NumTapesToCreate")]
        getter num_tapes_to_create : Int32

        # A prefix that you append to the barcode of the virtual tape you are creating. This prefix makes the
        # barcode unique. The prefix must be 1-4 characters in length and must be one of the uppercase letters
        # from A to Z.

        @[JSON::Field(key: "TapeBarcodePrefix")]
        getter tape_barcode_prefix : String

        # The size, in bytes, of the virtual tapes that you want to create. The size must be aligned by
        # gigabyte (1024*1024*1024 bytes).

        @[JSON::Field(key: "TapeSizeInBytes")]
        getter tape_size_in_bytes : Int64

        # Set to true to use Amazon S3 server-side encryption with your own KMS key, or false to use a key
        # managed by Amazon S3. Optional. Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?

        # The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3
        # server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set
        # when KMSEncrypted is true . Optional.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The ID of the pool that you want to add your tape to for archiving. The tape in this pool is
        # archived in the S3 storage class that is associated with the pool. When you use your backup
        # application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or
        # S3 Glacier Deep Archive) that corresponds to the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # A list of up to 50 tags that can be assigned to a virtual tape. Each tag is a key-value pair. Valid
        # characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the
        # following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters,
        # and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Set to TRUE if the tape you are creating is to be configured as a write-once-read-many (WORM) tape.

        @[JSON::Field(key: "Worm")]
        getter worm : Bool?

        def initialize(
          @client_token : String,
          @gateway_arn : String,
          @num_tapes_to_create : Int32,
          @tape_barcode_prefix : String,
          @tape_size_in_bytes : Int64,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @pool_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @worm : Bool? = nil
        )
        end
      end

      # CreateTapeOutput

      struct CreateTapesOutput
        include JSON::Serializable

        # A list of unique Amazon Resource Names (ARNs) that represents the virtual tapes that were created.

        @[JSON::Field(key: "TapeARNs")]
        getter tape_ar_ns : Array(String)?

        def initialize(
          @tape_ar_ns : Array(String)? = nil
        )
        end
      end


      struct DeleteAutomaticTapeCreationPolicyInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct DeleteAutomaticTapeCreationPolicyOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A JSON object containing the following fields: DeleteBandwidthRateLimitInput$BandwidthType

      struct DeleteBandwidthRateLimitInput
        include JSON::Serializable

        # One of the BandwidthType values that indicates the gateway bandwidth rate limit to delete. Valid
        # Values: UPLOAD | DOWNLOAD | ALL

        @[JSON::Field(key: "BandwidthType")]
        getter bandwidth_type : String


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @bandwidth_type : String,
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway whose bandwidth rate
      # information was deleted.

      struct DeleteBandwidthRateLimitOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct DeleteCacheReportInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cache report you want to delete.

        @[JSON::Field(key: "CacheReportARN")]
        getter cache_report_arn : String

        def initialize(
          @cache_report_arn : String
        )
        end
      end


      struct DeleteCacheReportOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cache report you want to delete.

        @[JSON::Field(key: "CacheReportARN")]
        getter cache_report_arn : String?

        def initialize(
          @cache_report_arn : String? = nil
        )
        end
      end

      # A JSON object containing one or more of the following fields:
      # DeleteChapCredentialsInput$InitiatorName DeleteChapCredentialsInput$TargetARN

      struct DeleteChapCredentialsInput
        include JSON::Serializable

        # The iSCSI initiator that connects to the target.

        @[JSON::Field(key: "InitiatorName")]
        getter initiator_name : String

        # The Amazon Resource Name (ARN) of the iSCSI volume target. Use the DescribeStorediSCSIVolumes
        # operation to return to retrieve the TargetARN for specified VolumeARN.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String

        def initialize(
          @initiator_name : String,
          @target_arn : String
        )
        end
      end

      # A JSON object containing the following fields:

      struct DeleteChapCredentialsOutput
        include JSON::Serializable

        # The iSCSI initiator that connects to the target.

        @[JSON::Field(key: "InitiatorName")]
        getter initiator_name : String?

        # The Amazon Resource Name (ARN) of the target.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String?

        def initialize(
          @initiator_name : String? = nil,
          @target_arn : String? = nil
        )
        end
      end

      # DeleteFileShareInput

      struct DeleteFileShareInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the file share to be deleted.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String

        # If this value is set to true , the operation deletes a file share immediately and aborts all data
        # uploads to Amazon Web Services. Otherwise, the file share is not deleted until all data is uploaded
        # to Amazon Web Services. This process aborts the data upload process, and the file share enters the
        # FORCE_DELETING status. Valid Values: true | false

        @[JSON::Field(key: "ForceDelete")]
        getter force_delete : Bool?

        def initialize(
          @file_share_arn : String,
          @force_delete : Bool? = nil
        )
        end
      end

      # DeleteFileShareOutput

      struct DeleteFileShareOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted file share.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?

        def initialize(
          @file_share_arn : String? = nil
        )
        end
      end

      # A JSON object containing the ID of the gateway to delete.

      struct DeleteGatewayInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the ID of the deleted gateway.

      struct DeleteGatewayOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct DeleteSnapshotScheduleInput
        include JSON::Serializable

        # The volume which snapshot schedule to delete.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String

        def initialize(
          @volume_arn : String
        )
        end
      end


      struct DeleteSnapshotScheduleOutput
        include JSON::Serializable

        # The volume which snapshot schedule was deleted.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        def initialize(
          @volume_arn : String? = nil
        )
        end
      end

      # DeleteTapeArchiveInput

      struct DeleteTapeArchiveInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the virtual tape to delete from the virtual tape shelf (VTS).

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String

        # Set to TRUE to delete an archived tape that belongs to a custom pool with tape retention lock. Only
        # archived tapes with tape retention lock set to governance can be deleted. Archived tapes with tape
        # retention lock set to compliance can't be deleted.

        @[JSON::Field(key: "BypassGovernanceRetention")]
        getter bypass_governance_retention : Bool?

        def initialize(
          @tape_arn : String,
          @bypass_governance_retention : Bool? = nil
        )
        end
      end

      # DeleteTapeArchiveOutput

      struct DeleteTapeArchiveOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the virtual tape that was deleted from the virtual tape shelf
        # (VTS).

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        def initialize(
          @tape_arn : String? = nil
        )
        end
      end

      # DeleteTapeInput

      struct DeleteTapeInput
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the gateway that the virtual tape to delete is associated
        # with. Use the ListGateways operation to return a list of gateways for your account and Amazon Web
        # Services Region.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The Amazon Resource Name (ARN) of the virtual tape to delete.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String

        # Set to TRUE to delete an archived tape that belongs to a custom pool with tape retention lock. Only
        # archived tapes with tape retention lock set to governance can be deleted. Archived tapes with tape
        # retention lock set to compliance can't be deleted.

        @[JSON::Field(key: "BypassGovernanceRetention")]
        getter bypass_governance_retention : Bool?

        def initialize(
          @gateway_arn : String,
          @tape_arn : String,
          @bypass_governance_retention : Bool? = nil
        )
        end
      end

      # DeleteTapeOutput

      struct DeleteTapeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted virtual tape.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        def initialize(
          @tape_arn : String? = nil
        )
        end
      end


      struct DeleteTapePoolInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom tape pool to delete.

        @[JSON::Field(key: "PoolARN")]
        getter pool_arn : String

        def initialize(
          @pool_arn : String
        )
        end
      end


      struct DeleteTapePoolOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom tape pool being deleted.

        @[JSON::Field(key: "PoolARN")]
        getter pool_arn : String?

        def initialize(
          @pool_arn : String? = nil
        )
        end
      end

      # A JSON object containing the DeleteVolumeInput$VolumeARN to delete.

      struct DeleteVolumeInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of
        # gateway volumes.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String

        def initialize(
          @volume_arn : String
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the storage volume that was deleted.

      struct DeleteVolumeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the storage volume that was deleted. It is the same ARN you
        # provided in the request.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        def initialize(
          @volume_arn : String? = nil
        )
        end
      end


      struct DescribeAvailabilityMonitorTestInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct DescribeAvailabilityMonitorTestOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The time the high availability monitoring test was started. If a test hasn't been performed, the
        # value of this field is null.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the high availability monitoring test. If a test hasn't been performed, the value of
        # this field is null.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @gateway_arn : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway.

      struct DescribeBandwidthRateLimitInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the following fields:

      struct DescribeBandwidthRateLimitOutput
        include JSON::Serializable

        # The average download bandwidth rate limit in bits per second. This field does not appear in the
        # response if the download rate limit is not set.

        @[JSON::Field(key: "AverageDownloadRateLimitInBitsPerSec")]
        getter average_download_rate_limit_in_bits_per_sec : Int64?

        # The average upload bandwidth rate limit in bits per second. This field does not appear in the
        # response if the upload rate limit is not set.

        @[JSON::Field(key: "AverageUploadRateLimitInBitsPerSec")]
        getter average_upload_rate_limit_in_bits_per_sec : Int64?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @average_download_rate_limit_in_bits_per_sec : Int64? = nil,
          @average_upload_rate_limit_in_bits_per_sec : Int64? = nil,
          @gateway_arn : String? = nil
        )
        end
      end


      struct DescribeBandwidthRateLimitScheduleInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct DescribeBandwidthRateLimitScheduleOutput
        include JSON::Serializable

        # An array that contains the bandwidth rate limit intervals for a tape or volume gateway.

        @[JSON::Field(key: "BandwidthRateLimitIntervals")]
        getter bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval)?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval)? = nil,
          @gateway_arn : String? = nil
        )
        end
      end


      struct DescribeCacheInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct DescribeCacheOutput
        include JSON::Serializable

        # The amount of cache in bytes allocated to a gateway.

        @[JSON::Field(key: "CacheAllocatedInBytes")]
        getter cache_allocated_in_bytes : Int64?

        # The file share's contribution to the overall percentage of the gateway's cache that has not been
        # persisted to Amazon Web Services. The sample is taken at the end of the reporting period.

        @[JSON::Field(key: "CacheDirtyPercentage")]
        getter cache_dirty_percentage : Float64?

        # Percent of application read operations from the file shares that are served from cache. The sample
        # is taken at the end of the reporting period.

        @[JSON::Field(key: "CacheHitPercentage")]
        getter cache_hit_percentage : Float64?

        # Percent of application read operations from the file shares that are not served from cache. The
        # sample is taken at the end of the reporting period.

        @[JSON::Field(key: "CacheMissPercentage")]
        getter cache_miss_percentage : Float64?

        # Percent use of the gateway's cache storage. This metric applies only to the gateway-cached volume
        # setup. The sample is taken at the end of the reporting period.

        @[JSON::Field(key: "CacheUsedPercentage")]
        getter cache_used_percentage : Float64?

        # An array of strings that identify disks that are to be configured as working storage. Each string
        # has a minimum length of 1 and maximum length of 300. You can get the disk IDs from the
        # ListLocalDisks API.

        @[JSON::Field(key: "DiskIds")]
        getter disk_ids : Array(String)?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @cache_allocated_in_bytes : Int64? = nil,
          @cache_dirty_percentage : Float64? = nil,
          @cache_hit_percentage : Float64? = nil,
          @cache_miss_percentage : Float64? = nil,
          @cache_used_percentage : Float64? = nil,
          @disk_ids : Array(String)? = nil,
          @gateway_arn : String? = nil
        )
        end
      end


      struct DescribeCacheReportInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cache report you want to describe.

        @[JSON::Field(key: "CacheReportARN")]
        getter cache_report_arn : String

        def initialize(
          @cache_report_arn : String
        )
        end
      end


      struct DescribeCacheReportOutput
        include JSON::Serializable

        # Contains all informational fields associated with a cache report. Includes name, ARN, tags, status,
        # progress, filters, start time, and end time.

        @[JSON::Field(key: "CacheReportInfo")]
        getter cache_report_info : Types::CacheReportInfo?

        def initialize(
          @cache_report_info : Types::CacheReportInfo? = nil
        )
        end
      end


      struct DescribeCachediSCSIVolumesInput
        include JSON::Serializable

        # An array of strings where each string represents the Amazon Resource Name (ARN) of a cached volume.
        # All of the specified cached volumes must be from the same gateway. Use ListVolumes to get volume
        # ARNs for a gateway.

        @[JSON::Field(key: "VolumeARNs")]
        getter volume_ar_ns : Array(String)

        def initialize(
          @volume_ar_ns : Array(String)
        )
        end
      end

      # A JSON object containing the following fields:

      struct DescribeCachediSCSIVolumesOutput
        include JSON::Serializable

        # An array of objects where each object contains metadata about one cached volume.

        @[JSON::Field(key: "CachediSCSIVolumes")]
        getter cachedi_scsi_volumes : Array(Types::CachediSCSIVolume)?

        def initialize(
          @cachedi_scsi_volumes : Array(Types::CachediSCSIVolume)? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the iSCSI volume target.

      struct DescribeChapCredentialsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the iSCSI volume target. Use the DescribeStorediSCSIVolumes
        # operation to return to retrieve the TargetARN for specified VolumeARN.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String

        def initialize(
          @target_arn : String
        )
        end
      end

      # A JSON object containing the following fields:

      struct DescribeChapCredentialsOutput
        include JSON::Serializable

        # An array of ChapInfo objects that represent CHAP credentials. Each object in the array contains CHAP
        # credential information for one target-initiator pair. If no CHAP credentials are set, an empty array
        # is returned. CHAP credential information is provided in a JSON object with the following fields:
        # InitiatorName : The iSCSI initiator that connects to the target. SecretToAuthenticateInitiator : The
        # secret key that the initiator (for example, the Windows client) must provide to participate in
        # mutual CHAP with the target. SecretToAuthenticateTarget : The secret key that the target must
        # provide to participate in mutual CHAP with the initiator (e.g. Windows client). TargetARN : The
        # Amazon Resource Name (ARN) of the storage volume.

        @[JSON::Field(key: "ChapCredentials")]
        getter chap_credentials : Array(Types::ChapInfo)?

        def initialize(
          @chap_credentials : Array(Types::ChapInfo)? = nil
        )
        end
      end


      struct DescribeFileSystemAssociationsInput
        include JSON::Serializable

        # An array containing the Amazon Resource Name (ARN) of each file system association to be described.

        @[JSON::Field(key: "FileSystemAssociationARNList")]
        getter file_system_association_arn_list : Array(String)

        def initialize(
          @file_system_association_arn_list : Array(String)
        )
        end
      end


      struct DescribeFileSystemAssociationsOutput
        include JSON::Serializable

        # An array containing the FileSystemAssociationInfo data type of each file system association to be
        # described.

        @[JSON::Field(key: "FileSystemAssociationInfoList")]
        getter file_system_association_info_list : Array(Types::FileSystemAssociationInfo)?

        def initialize(
          @file_system_association_info_list : Array(Types::FileSystemAssociationInfo)? = nil
        )
        end
      end

      # A JSON object containing the ID of the gateway.

      struct DescribeGatewayInformationInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the following fields:

      struct DescribeGatewayInformationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that is used to monitor events in
        # the gateway. This field only only exist and returns once it have been chosen and set by the SGW
        # service, based on the OS version of the gateway VM

        @[JSON::Field(key: "CloudWatchLogGroupARN")]
        getter cloud_watch_log_group_arn : String?

        # Date after which this gateway will not receive software updates for new features and bug fixes.

        @[JSON::Field(key: "DeprecationDate")]
        getter deprecation_date : String?

        # The ID of the Amazon EC2 instance that was used to launch the gateway.

        @[JSON::Field(key: "Ec2InstanceId")]
        getter ec2_instance_id : String?

        # The Amazon Web Services Region where the Amazon EC2 instance is located.

        @[JSON::Field(key: "Ec2InstanceRegion")]
        getter ec2_instance_region : String?

        # The type of endpoint for your gateway. Valid Values: STANDARD | FIPS

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # Specifies the size of the gateway's metadata cache.

        @[JSON::Field(key: "GatewayCapacity")]
        getter gateway_capacity : String?

        # The unique identifier assigned to your gateway during activation. This ID becomes part of the
        # gateway Amazon Resource Name (ARN), which you use as input for other operations.

        @[JSON::Field(key: "GatewayId")]
        getter gateway_id : String?

        # The name you configured for your gateway.

        @[JSON::Field(key: "GatewayName")]
        getter gateway_name : String?

        # A NetworkInterface array that contains descriptions of the gateway network interfaces.

        @[JSON::Field(key: "GatewayNetworkInterfaces")]
        getter gateway_network_interfaces : Array(Types::NetworkInterface)?

        # A value that indicates the operating state of the gateway.

        @[JSON::Field(key: "GatewayState")]
        getter gateway_state : String?

        # A value that indicates the time zone configured for the gateway.

        @[JSON::Field(key: "GatewayTimezone")]
        getter gateway_timezone : String?

        # The type of the gateway. Amazon FSx File Gateway is no longer available to new customers. Existing
        # customers of FSx File Gateway can continue to use the service normally. For capabilities similar to
        # FSx File Gateway, visit this blog post .

        @[JSON::Field(key: "GatewayType")]
        getter gateway_type : String?

        # The type of hardware or software platform on which the gateway is running. Tape Gateway is no longer
        # available on Snow Family devices.

        @[JSON::Field(key: "HostEnvironment")]
        getter host_environment : String?

        # A unique identifier for the specific instance of the host platform running the gateway. This value
        # is only available for certain host environments, and its format depends on the host environment
        # type.

        @[JSON::Field(key: "HostEnvironmentId")]
        getter host_environment_id : String?

        # The date on which the last software update was applied to the gateway. If the gateway has never been
        # updated, this field does not return a value in the response. This only only exist and returns once
        # it have been chosen and set by the SGW service, based on the OS version of the gateway VM

        @[JSON::Field(key: "LastSoftwareUpdate")]
        getter last_software_update : String?

        # The date on which an update to the gateway is available. This date is in the time zone of the
        # gateway. If the gateway is not available for an update this field is not returned in the response.

        @[JSON::Field(key: "NextUpdateAvailabilityDate")]
        getter next_update_availability_date : String?

        # Date after which this gateway will not receive software updates for new features.

        @[JSON::Field(key: "SoftwareUpdatesEndDate")]
        getter software_updates_end_date : String?

        # The version number of the software running on the gateway appliance.

        @[JSON::Field(key: "SoftwareVersion")]
        getter software_version : String?

        # A list of the metadata cache sizes that the gateway can support based on its current hardware
        # specifications.

        @[JSON::Field(key: "SupportedGatewayCapacities")]
        getter supported_gateway_capacities : Array(String)?

        # A list of up to 50 tags assigned to the gateway, sorted alphabetically by key name. Each tag is a
        # key-value pair. For a gateway with more than 10 tags assigned, you can view all tags using the
        # ListTagsForResource API operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The configuration settings for the virtual private cloud (VPC) endpoint for your gateway.

        @[JSON::Field(key: "VPCEndpoint")]
        getter vpc_endpoint : String?

        def initialize(
          @cloud_watch_log_group_arn : String? = nil,
          @deprecation_date : String? = nil,
          @ec2_instance_id : String? = nil,
          @ec2_instance_region : String? = nil,
          @endpoint_type : String? = nil,
          @gateway_arn : String? = nil,
          @gateway_capacity : String? = nil,
          @gateway_id : String? = nil,
          @gateway_name : String? = nil,
          @gateway_network_interfaces : Array(Types::NetworkInterface)? = nil,
          @gateway_state : String? = nil,
          @gateway_timezone : String? = nil,
          @gateway_type : String? = nil,
          @host_environment : String? = nil,
          @host_environment_id : String? = nil,
          @last_software_update : String? = nil,
          @next_update_availability_date : String? = nil,
          @software_updates_end_date : String? = nil,
          @software_version : String? = nil,
          @supported_gateway_capacities : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_endpoint : String? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway.

      struct DescribeMaintenanceStartTimeInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the following fields:
      # DescribeMaintenanceStartTimeOutput$SoftwareUpdatePreferences
      # DescribeMaintenanceStartTimeOutput$DayOfMonth DescribeMaintenanceStartTimeOutput$DayOfWeek
      # DescribeMaintenanceStartTimeOutput$HourOfDay DescribeMaintenanceStartTimeOutput$MinuteOfHour
      # DescribeMaintenanceStartTimeOutput$Timezone

      struct DescribeMaintenanceStartTimeOutput
        include JSON::Serializable

        # The day of the month component of the maintenance start time represented as an ordinal number from 1
        # to 28, where 1 represents the first day of the month. It is not possible to set the maintenance
        # schedule to start on days 29 through 31.

        @[JSON::Field(key: "DayOfMonth")]
        getter day_of_month : Int32?

        # An ordinal number between 0 and 6 that represents the day of the week, where 0 represents Sunday and
        # 6 represents Saturday. The day of week is in the time zone of the gateway.

        @[JSON::Field(key: "DayOfWeek")]
        getter day_of_week : Int32?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The hour component of the maintenance start time represented as hh , where hh is the hour (0 to 23).
        # The hour of the day is in the time zone of the gateway.

        @[JSON::Field(key: "HourOfDay")]
        getter hour_of_day : Int32?

        # The minute component of the maintenance start time represented as mm , where mm is the minute (0 to
        # 59). The minute of the hour is in the time zone of the gateway.

        @[JSON::Field(key: "MinuteOfHour")]
        getter minute_of_hour : Int32?

        # A set of variables indicating the software update preferences for the gateway. Includes
        # AutomaticUpdatePolicy parameter with the following inputs: ALL_VERSIONS - Enables regular gateway
        # maintenance updates. EMERGENCY_VERSIONS_ONLY - Disables regular gateway maintenance updates. The
        # gateway will still receive emergency version updates on rare occasions if necessary to remedy highly
        # critical security or durability issues. You will be notified before an emergency version update is
        # applied. These updates are applied during your gateway's scheduled maintenance window.

        @[JSON::Field(key: "SoftwareUpdatePreferences")]
        getter software_update_preferences : Types::SoftwareUpdatePreferences?

        # A value that indicates the time zone that is set for the gateway. The start time and day of week
        # specified should be in the time zone of the gateway.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        def initialize(
          @day_of_month : Int32? = nil,
          @day_of_week : Int32? = nil,
          @gateway_arn : String? = nil,
          @hour_of_day : Int32? = nil,
          @minute_of_hour : Int32? = nil,
          @software_update_preferences : Types::SoftwareUpdatePreferences? = nil,
          @timezone : String? = nil
        )
        end
      end

      # DescribeNFSFileSharesInput

      struct DescribeNFSFileSharesInput
        include JSON::Serializable

        # An array containing the Amazon Resource Name (ARN) of each file share to be described.

        @[JSON::Field(key: "FileShareARNList")]
        getter file_share_arn_list : Array(String)

        def initialize(
          @file_share_arn_list : Array(String)
        )
        end
      end

      # DescribeNFSFileSharesOutput

      struct DescribeNFSFileSharesOutput
        include JSON::Serializable

        # An array containing a description for each requested file share.

        @[JSON::Field(key: "NFSFileShareInfoList")]
        getter nfs_file_share_info_list : Array(Types::NFSFileShareInfo)?

        def initialize(
          @nfs_file_share_info_list : Array(Types::NFSFileShareInfo)? = nil
        )
        end
      end

      # DescribeSMBFileSharesInput

      struct DescribeSMBFileSharesInput
        include JSON::Serializable

        # An array containing the Amazon Resource Name (ARN) of each file share to be described.

        @[JSON::Field(key: "FileShareARNList")]
        getter file_share_arn_list : Array(String)

        def initialize(
          @file_share_arn_list : Array(String)
        )
        end
      end

      # DescribeSMBFileSharesOutput

      struct DescribeSMBFileSharesOutput
        include JSON::Serializable

        # An array containing a description for each requested file share.

        @[JSON::Field(key: "SMBFileShareInfoList")]
        getter smb_file_share_info_list : Array(Types::SMBFileShareInfo)?

        def initialize(
          @smb_file_share_info_list : Array(Types::SMBFileShareInfo)? = nil
        )
        end
      end


      struct DescribeSMBSettingsInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct DescribeSMBSettingsOutput
        include JSON::Serializable

        # Indicates the status of a gateway that is a member of the Active Directory domain. This field is
        # only used as part of a JoinDomain request. It is not affected by Active Directory connectivity
        # changes that occur after the JoinDomain request succeeds. ACCESS_DENIED : Indicates that the
        # JoinDomain operation failed due to an authentication error. DETACHED : Indicates that gateway is not
        # joined to a domain. JOINED : Indicates that the gateway has successfully joined a domain. JOINING :
        # Indicates that a JoinDomain operation is in progress. NETWORK_ERROR : Indicates that JoinDomain
        # operation failed due to a network or connectivity error. TIMEOUT : Indicates that the JoinDomain
        # operation failed because the operation didn't complete within the allotted time. UNKNOWN_ERROR :
        # Indicates that the JoinDomain operation failed due to another type of error.

        @[JSON::Field(key: "ActiveDirectoryStatus")]
        getter active_directory_status : String?

        # The name of the domain that the gateway is joined to.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The shares on this gateway appear when listing shares. Only supported for S3 File Gateways.

        @[JSON::Field(key: "FileSharesVisible")]
        getter file_shares_visible : Bool?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # This value is true if a password for the guest user smbguest is set, otherwise false . Only
        # supported for S3 File Gateways. Valid Values: true | false

        @[JSON::Field(key: "SMBGuestPasswordSet")]
        getter smb_guest_password_set : Bool?

        # A list of Active Directory users and groups that have special permissions for SMB file shares on the
        # gateway.

        @[JSON::Field(key: "SMBLocalGroups")]
        getter smb_local_groups : Types::SMBLocalGroups?

        # The type of security strategy that was specified for file gateway. ClientSpecified : If you choose
        # this option, requests are established based on what is negotiated by the client. This option is
        # recommended when you want to maximize compatibility across different clients in your environment.
        # Supported only for S3 File Gateway. MandatorySigning : If you choose this option, File Gateway only
        # allows connections from SMBv2 or SMBv3 clients that have signing turned on. This option works with
        # SMB clients on Microsoft Windows Vista, Windows Server 2008, or later. MandatoryEncryption : If you
        # choose this option, File Gateway only allows connections from SMBv3 clients that have encryption
        # turned on. Both 256-bit and 128-bit algorithms are allowed. This option is recommended for
        # environments that handle sensitive data. It works with SMB clients on Microsoft Windows 8, Windows
        # Server 2012, or later. MandatoryEncryptionNoAes128 : If you choose this option, File Gateway only
        # allows connections from SMBv3 clients that use 256-bit AES encryption algorithms. 128-bit algorithms
        # are not allowed. This option is recommended for environments that handle sensitive data. It works
        # with SMB clients on Microsoft Windows 8, Windows Server 2012, or later.

        @[JSON::Field(key: "SMBSecurityStrategy")]
        getter smb_security_strategy : String?

        def initialize(
          @active_directory_status : String? = nil,
          @domain_name : String? = nil,
          @file_shares_visible : Bool? = nil,
          @gateway_arn : String? = nil,
          @smb_guest_password_set : Bool? = nil,
          @smb_local_groups : Types::SMBLocalGroups? = nil,
          @smb_security_strategy : String? = nil
        )
        end
      end

      # A JSON object containing the DescribeSnapshotScheduleInput$VolumeARN of the volume.

      struct DescribeSnapshotScheduleInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of
        # gateway volumes.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String

        def initialize(
          @volume_arn : String
        )
        end
      end


      struct DescribeSnapshotScheduleOutput
        include JSON::Serializable

        # The snapshot description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The number of hours between snapshots.

        @[JSON::Field(key: "RecurrenceInHours")]
        getter recurrence_in_hours : Int32?

        # The hour of the day at which the snapshot schedule begins represented as hh , where hh is the hour
        # (0 to 23). The hour of the day is in the time zone of the gateway.

        @[JSON::Field(key: "StartAt")]
        getter start_at : Int32?

        # A list of up to 50 tags assigned to the snapshot schedule, sorted alphabetically by key name. Each
        # tag is a key-value pair. For a gateway with more than 10 tags assigned, you can view all tags using
        # the ListTagsForResource API operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A value that indicates the time zone of the gateway.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        # The Amazon Resource Name (ARN) of the volume that was specified in the request.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        def initialize(
          @description : String? = nil,
          @recurrence_in_hours : Int32? = nil,
          @start_at : Int32? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timezone : String? = nil,
          @volume_arn : String? = nil
        )
        end
      end

      # A JSON object containing a list of DescribeStorediSCSIVolumesInput$VolumeARNs .

      struct DescribeStorediSCSIVolumesInput
        include JSON::Serializable

        # An array of strings where each string represents the Amazon Resource Name (ARN) of a stored volume.
        # All of the specified stored volumes must be from the same gateway. Use ListVolumes to get volume
        # ARNs for a gateway.

        @[JSON::Field(key: "VolumeARNs")]
        getter volume_ar_ns : Array(String)

        def initialize(
          @volume_ar_ns : Array(String)
        )
        end
      end


      struct DescribeStorediSCSIVolumesOutput
        include JSON::Serializable

        # Describes a single unit of output from DescribeStorediSCSIVolumes . The following fields are
        # returned: ChapEnabled : Indicates whether mutual CHAP is enabled for the iSCSI target. LunNumber :
        # The logical disk number. NetworkInterfaceId : The network interface ID of the stored volume that
        # initiator use to map the stored volume as an iSCSI target. NetworkInterfacePort : The port used to
        # communicate with iSCSI targets. PreservedExistingData : Indicates when the stored volume was
        # created, existing data on the underlying local disk was preserved. SourceSnapshotId : If the stored
        # volume was created from a snapshot, this field contains the snapshot ID used, e.g. snap-1122aabb .
        # Otherwise, this field is not included. StorediSCSIVolumes : An array of StorediSCSIVolume objects
        # where each object contains metadata about one stored volume. TargetARN : The Amazon Resource Name
        # (ARN) of the volume target. VolumeARN : The Amazon Resource Name (ARN) of the stored volume.
        # VolumeDiskId : The disk ID of the local disk that was specified in the CreateStorediSCSIVolume
        # operation. VolumeId : The unique identifier of the storage volume, e.g. vol-1122AABB .
        # VolumeiSCSIAttributes : An VolumeiSCSIAttributes object that represents a collection of iSCSI
        # attributes for one stored volume. VolumeProgress : Represents the percentage complete if the volume
        # is restoring or bootstrapping that represents the percent of data transferred. This field does not
        # appear in the response if the stored volume is not restoring or bootstrapping. VolumeSizeInBytes :
        # The size of the volume in bytes. VolumeStatus : One of the VolumeStatus values that indicates the
        # state of the volume. VolumeType : One of the enumeration values describing the type of the volume.
        # Currently, only STORED volumes are supported.

        @[JSON::Field(key: "StorediSCSIVolumes")]
        getter storedi_scsi_volumes : Array(Types::StorediSCSIVolume)?

        def initialize(
          @storedi_scsi_volumes : Array(Types::StorediSCSIVolume)? = nil
        )
        end
      end

      # DescribeTapeArchivesInput

      struct DescribeTapeArchivesInput
        include JSON::Serializable

        # Specifies that the number of virtual tapes described be limited to the specified number.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # An opaque string that indicates the position at which to begin describing virtual tapes.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Specifies one or more unique Amazon Resource Names (ARNs) that represent the virtual tapes you want
        # to describe.

        @[JSON::Field(key: "TapeARNs")]
        getter tape_ar_ns : Array(String)?

        def initialize(
          @limit : Int32? = nil,
          @marker : String? = nil,
          @tape_ar_ns : Array(String)? = nil
        )
        end
      end

      # DescribeTapeArchivesOutput

      struct DescribeTapeArchivesOutput
        include JSON::Serializable

        # An opaque string that indicates the position at which the virtual tapes that were fetched for
        # description ended. Use this marker in your next request to fetch the next set of virtual tapes in
        # the virtual tape shelf (VTS). If there are no more virtual tapes to describe, this field does not
        # appear in the response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An array of virtual tape objects in the virtual tape shelf (VTS). The description includes of the
        # Amazon Resource Name (ARN) of the virtual tapes. The information returned includes the Amazon
        # Resource Names (ARNs) of the tapes, size of the tapes, status of the tapes, progress of the
        # description, and tape barcode.

        @[JSON::Field(key: "TapeArchives")]
        getter tape_archives : Array(Types::TapeArchive)?

        def initialize(
          @marker : String? = nil,
          @tape_archives : Array(Types::TapeArchive)? = nil
        )
        end
      end

      # DescribeTapeRecoveryPointsInput

      struct DescribeTapeRecoveryPointsInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # Specifies that the number of virtual tape recovery points that are described be limited to the
        # specified number.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # An opaque string that indicates the position at which to begin describing the virtual tape recovery
        # points.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @gateway_arn : String,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      # DescribeTapeRecoveryPointsOutput

      struct DescribeTapeRecoveryPointsOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # An opaque string that indicates the position at which the virtual tape recovery points that were
        # listed for description ended. Use this marker in your next request to list the next set of virtual
        # tape recovery points in the list. If there are no more recovery points to describe, this field does
        # not appear in the response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An array of TapeRecoveryPointInfos that are available for the specified gateway.

        @[JSON::Field(key: "TapeRecoveryPointInfos")]
        getter tape_recovery_point_infos : Array(Types::TapeRecoveryPointInfo)?

        def initialize(
          @gateway_arn : String? = nil,
          @marker : String? = nil,
          @tape_recovery_point_infos : Array(Types::TapeRecoveryPointInfo)? = nil
        )
        end
      end

      # DescribeTapesInput

      struct DescribeTapesInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # Specifies that the number of virtual tapes described be limited to the specified number. Amazon Web
        # Services may impose its own limit, if this field is not set.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A marker value, obtained in a previous call to DescribeTapes . This marker indicates which page of
        # results to retrieve. If not specified, the first page of results is retrieved.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Specifies one or more unique Amazon Resource Names (ARNs) that represent the virtual tapes you want
        # to describe. If this parameter is not specified, Tape gateway returns a description of all virtual
        # tapes associated with the specified gateway.

        @[JSON::Field(key: "TapeARNs")]
        getter tape_ar_ns : Array(String)?

        def initialize(
          @gateway_arn : String,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @tape_ar_ns : Array(String)? = nil
        )
        end
      end

      # DescribeTapesOutput

      struct DescribeTapesOutput
        include JSON::Serializable

        # An opaque string that can be used as part of a subsequent DescribeTapes call to retrieve the next
        # page of results. If a response does not contain a marker, then there are no more results to be
        # retrieved.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An array of virtual tape descriptions.

        @[JSON::Field(key: "Tapes")]
        getter tapes : Array(Types::Tape)?

        def initialize(
          @marker : String? = nil,
          @tapes : Array(Types::Tape)? = nil
        )
        end
      end


      struct DescribeUploadBufferInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct DescribeUploadBufferOutput
        include JSON::Serializable

        # An array of the gateway's local disk IDs that are configured as working storage. Each local disk ID
        # is specified as a string (minimum length of 1 and maximum length of 300). If no local disks are
        # configured as working storage, then the DiskIds array is empty.

        @[JSON::Field(key: "DiskIds")]
        getter disk_ids : Array(String)?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The total number of bytes allocated in the gateway's as upload buffer.

        @[JSON::Field(key: "UploadBufferAllocatedInBytes")]
        getter upload_buffer_allocated_in_bytes : Int64?

        # The total number of bytes being used in the gateway's upload buffer.

        @[JSON::Field(key: "UploadBufferUsedInBytes")]
        getter upload_buffer_used_in_bytes : Int64?

        def initialize(
          @disk_ids : Array(String)? = nil,
          @gateway_arn : String? = nil,
          @upload_buffer_allocated_in_bytes : Int64? = nil,
          @upload_buffer_used_in_bytes : Int64? = nil
        )
        end
      end

      # DescribeVTLDevicesInput

      struct DescribeVTLDevicesInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # Specifies that the number of VTL devices described be limited to the specified number.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # An opaque string that indicates the position at which to begin describing the VTL devices.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An array of strings, where each string represents the Amazon Resource Name (ARN) of a VTL device.
        # All of the specified VTL devices must be from the same gateway. If no VTL devices are specified, the
        # result will contain all devices on the specified gateway.

        @[JSON::Field(key: "VTLDeviceARNs")]
        getter vtl_device_ar_ns : Array(String)?

        def initialize(
          @gateway_arn : String,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @vtl_device_ar_ns : Array(String)? = nil
        )
        end
      end

      # DescribeVTLDevicesOutput

      struct DescribeVTLDevicesOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # An opaque string that indicates the position at which the VTL devices that were fetched for
        # description ended. Use the marker in your next request to fetch the next set of VTL devices in the
        # list. If there are no more VTL devices to describe, this field does not appear in the response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An array of VTL device objects composed of the Amazon Resource Name (ARN) of the VTL devices.

        @[JSON::Field(key: "VTLDevices")]
        getter vtl_devices : Array(Types::VTLDevice)?

        def initialize(
          @gateway_arn : String? = nil,
          @marker : String? = nil,
          @vtl_devices : Array(Types::VTLDevice)? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway.

      struct DescribeWorkingStorageInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the following fields:

      struct DescribeWorkingStorageOutput
        include JSON::Serializable

        # An array of the gateway's local disk IDs that are configured as working storage. Each local disk ID
        # is specified as a string (minimum length of 1 and maximum length of 300). If no local disks are
        # configured as working storage, then the DiskIds array is empty.

        @[JSON::Field(key: "DiskIds")]
        getter disk_ids : Array(String)?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The total working storage in bytes allocated for the gateway. If no working storage is configured
        # for the gateway, this field returns 0.

        @[JSON::Field(key: "WorkingStorageAllocatedInBytes")]
        getter working_storage_allocated_in_bytes : Int64?

        # The total working storage in bytes in use by the gateway. If no working storage is configured for
        # the gateway, this field returns 0.

        @[JSON::Field(key: "WorkingStorageUsedInBytes")]
        getter working_storage_used_in_bytes : Int64?

        def initialize(
          @disk_ids : Array(String)? = nil,
          @gateway_arn : String? = nil,
          @working_storage_allocated_in_bytes : Int64? = nil,
          @working_storage_used_in_bytes : Int64? = nil
        )
        end
      end

      # AttachVolumeInput

      struct DetachVolumeInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume to detach from the gateway.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String

        # Set to true to forcibly remove the iSCSI connection of the target volume and detach the volume. The
        # default is false . If this value is set to false , you must manually disconnect the iSCSI connection
        # from the target volume. Valid Values: true | false

        @[JSON::Field(key: "ForceDetach")]
        getter force_detach : Bool?

        def initialize(
          @volume_arn : String,
          @force_detach : Bool? = nil
        )
        end
      end

      # AttachVolumeOutput

      struct DetachVolumeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume that was detached.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        def initialize(
          @volume_arn : String? = nil
        )
        end
      end

      # Lists iSCSI information about a VTL device.

      struct DeviceiSCSIAttributes
        include JSON::Serializable

        # Indicates whether mutual CHAP is enabled for the iSCSI target.

        @[JSON::Field(key: "ChapEnabled")]
        getter chap_enabled : Bool?

        # The network interface identifier of the VTL device.

        @[JSON::Field(key: "NetworkInterfaceId")]
        getter network_interface_id : String?

        # The port used to communicate with iSCSI VTL device targets.

        @[JSON::Field(key: "NetworkInterfacePort")]
        getter network_interface_port : Int32?

        # Specifies the unique Amazon Resource Name (ARN) that encodes the iSCSI qualified name(iqn) of a tape
        # drive or media changer target.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String?

        def initialize(
          @chap_enabled : Bool? = nil,
          @network_interface_id : String? = nil,
          @network_interface_port : Int32? = nil,
          @target_arn : String? = nil
        )
        end
      end

      # DisableGatewayInput

      struct DisableGatewayInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      # DisableGatewayOutput

      struct DisableGatewayOutput
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the disabled gateway.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct DisassociateFileSystemInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the file system association to be deleted.

        @[JSON::Field(key: "FileSystemAssociationARN")]
        getter file_system_association_arn : String

        # If this value is set to true, the operation disassociates an Amazon FSx file system immediately. It
        # ends all data uploads to the file system, and the file system association enters the FORCE_DELETING
        # status. If this value is set to false, the Amazon FSx file system does not disassociate until all
        # data is uploaded.

        @[JSON::Field(key: "ForceDelete")]
        getter force_delete : Bool?

        def initialize(
          @file_system_association_arn : String,
          @force_delete : Bool? = nil
        )
        end
      end


      struct DisassociateFileSystemOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted file system association.

        @[JSON::Field(key: "FileSystemAssociationARN")]
        getter file_system_association_arn : String?

        def initialize(
          @file_system_association_arn : String? = nil
        )
        end
      end

      # Represents a gateway's local disk.

      struct Disk
        include JSON::Serializable

        # The iSCSI qualified name (IQN) that is defined for a disk. This field is not included in the
        # response if the local disk is not defined as an iSCSI target. The format of this field is
        # targetIqn::LUNNumber::region-volumeId .

        @[JSON::Field(key: "DiskAllocationResource")]
        getter disk_allocation_resource : String?


        @[JSON::Field(key: "DiskAllocationType")]
        getter disk_allocation_type : String?


        @[JSON::Field(key: "DiskAttributeList")]
        getter disk_attribute_list : Array(String)?

        # The unique device ID or other distinguishing data that identifies a local disk.

        @[JSON::Field(key: "DiskId")]
        getter disk_id : String?

        # The device node of a local disk as assigned by the virtualization environment.

        @[JSON::Field(key: "DiskNode")]
        getter disk_node : String?

        # The path of a local disk in the gateway virtual machine (VM).

        @[JSON::Field(key: "DiskPath")]
        getter disk_path : String?

        # The local disk size in bytes.

        @[JSON::Field(key: "DiskSizeInBytes")]
        getter disk_size_in_bytes : Int64?

        # A value that represents the status of a local disk.

        @[JSON::Field(key: "DiskStatus")]
        getter disk_status : String?

        def initialize(
          @disk_allocation_resource : String? = nil,
          @disk_allocation_type : String? = nil,
          @disk_attribute_list : Array(String)? = nil,
          @disk_id : String? = nil,
          @disk_node : String? = nil,
          @disk_path : String? = nil,
          @disk_size_in_bytes : Int64? = nil,
          @disk_status : String? = nil
        )
        end
      end

      # Specifies network configuration information for the gateway associated with the Amazon FSx file
      # system.

      struct EndpointNetworkConfiguration
        include JSON::Serializable

        # A list of gateway IP addresses on which the associated Amazon FSx file system is available. If
        # multiple file systems are associated with this gateway, this field is required.

        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(String)?

        def initialize(
          @ip_addresses : Array(String)? = nil
        )
        end
      end


      struct EvictFilesFailingUploadInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the file share for which you want to start the cache clean
        # operation.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String

        # Specifies whether cache entries with full or partial file data currently stored on the gateway will
        # be forcibly removed by the cache clean operation. Valid arguments: False - The cache clean operation
        # skips cache entries failing upload if they are associated with data currently stored on the gateway.
        # This preserves the cached data. True - The cache clean operation removes cache entries failing
        # upload even if they are associated with data currently stored on the gateway. This deletes the
        # cached data. If ForceRemove is set to True , the cache clean operation will delete file data from
        # the gateway which might otherwise be recoverable.

        @[JSON::Field(key: "ForceRemove")]
        getter force_remove : Bool?

        def initialize(
          @file_share_arn : String,
          @force_remove : Bool? = nil
        )
        end
      end


      struct EvictFilesFailingUploadOutput
        include JSON::Serializable

        # The randomly generated ID of the CloudWatch notification associated with the cache clean operation.
        # This ID is in UUID format.

        @[JSON::Field(key: "NotificationId")]
        getter notification_id : String?

        def initialize(
          @notification_id : String? = nil
        )
        end
      end

      # Describes a file share. Only supported S3 File Gateway.

      struct FileShareInfo
        include JSON::Serializable


        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?


        @[JSON::Field(key: "FileShareId")]
        getter file_share_id : String?


        @[JSON::Field(key: "FileShareStatus")]
        getter file_share_status : String?


        @[JSON::Field(key: "FileShareType")]
        getter file_share_type : String?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @file_share_arn : String? = nil,
          @file_share_id : String? = nil,
          @file_share_status : String? = nil,
          @file_share_type : String? = nil,
          @gateway_arn : String? = nil
        )
        end
      end

      # Describes the object returned by DescribeFileSystemAssociations that describes a created file system
      # association.

      struct FileSystemAssociationInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the storage used for the audit logs.

        @[JSON::Field(key: "AuditDestinationARN")]
        getter audit_destination_arn : String?


        @[JSON::Field(key: "CacheAttributes")]
        getter cache_attributes : Types::CacheAttributes?

        # Specifies network configuration information for the gateway associated with the Amazon FSx file
        # system. If multiple file systems are associated with this gateway, this parameter's IpAddresses
        # field is required.

        @[JSON::Field(key: "EndpointNetworkConfiguration")]
        getter endpoint_network_configuration : Types::EndpointNetworkConfiguration?

        # The Amazon Resource Name (ARN) of the file system association.

        @[JSON::Field(key: "FileSystemAssociationARN")]
        getter file_system_association_arn : String?

        # The status of the file system association. Valid Values: AVAILABLE | CREATING | DELETING |
        # FORCE_DELETING | UPDATING | ERROR

        @[JSON::Field(key: "FileSystemAssociationStatus")]
        getter file_system_association_status : String?

        # An array containing the FileSystemAssociationStatusDetail data type, which provides detailed
        # information on file system association status.

        @[JSON::Field(key: "FileSystemAssociationStatusDetails")]
        getter file_system_association_status_details : Array(Types::FileSystemAssociationStatusDetail)?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The ARN of the backend Amazon FSx file system used for storing file data. For information, see
        # FileSystem in the Amazon FSx API Reference .

        @[JSON::Field(key: "LocationARN")]
        getter location_arn : String?

        # A list of up to 50 tags assigned to the SMB file share, sorted alphabetically by key name. Each tag
        # is a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @audit_destination_arn : String? = nil,
          @cache_attributes : Types::CacheAttributes? = nil,
          @endpoint_network_configuration : Types::EndpointNetworkConfiguration? = nil,
          @file_system_association_arn : String? = nil,
          @file_system_association_status : String? = nil,
          @file_system_association_status_details : Array(Types::FileSystemAssociationStatusDetail)? = nil,
          @gateway_arn : String? = nil,
          @location_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Detailed information on file system association status.

      struct FileSystemAssociationStatusDetail
        include JSON::Serializable

        # The error code for a given file system association status.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        def initialize(
          @error_code : String? = nil
        )
        end
      end

      # Gets the summary returned by ListFileSystemAssociation , which is a summary of a created file system
      # association.

      struct FileSystemAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the file system association.

        @[JSON::Field(key: "FileSystemAssociationARN")]
        getter file_system_association_arn : String?

        # The ID of the file system association.

        @[JSON::Field(key: "FileSystemAssociationId")]
        getter file_system_association_id : String?

        # The status of the file share. Valid Values: AVAILABLE | CREATING | DELETING | FORCE_DELETING |
        # UPDATING | ERROR

        @[JSON::Field(key: "FileSystemAssociationStatus")]
        getter file_system_association_status : String?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @file_system_association_arn : String? = nil,
          @file_system_association_id : String? = nil,
          @file_system_association_status : String? = nil,
          @gateway_arn : String? = nil
        )
        end
      end

      # Describes a gateway object.

      struct GatewayInfo
        include JSON::Serializable

        # Date after which this gateway will not receive software updates for new features and bug fixes.

        @[JSON::Field(key: "DeprecationDate")]
        getter deprecation_date : String?

        # The ID of the Amazon EC2 instance that was used to launch the gateway.

        @[JSON::Field(key: "Ec2InstanceId")]
        getter ec2_instance_id : String?

        # The Amazon Web Services Region where the Amazon EC2 instance is located.

        @[JSON::Field(key: "Ec2InstanceRegion")]
        getter ec2_instance_region : String?

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The unique identifier assigned to your gateway during activation. This ID becomes part of the
        # gateway Amazon Resource Name (ARN), which you use as input for other operations.

        @[JSON::Field(key: "GatewayId")]
        getter gateway_id : String?

        # The name of the gateway.

        @[JSON::Field(key: "GatewayName")]
        getter gateway_name : String?

        # The state of the gateway. Valid Values: DISABLED | ACTIVE

        @[JSON::Field(key: "GatewayOperationalState")]
        getter gateway_operational_state : String?

        # The type of the gateway. Amazon FSx File Gateway is no longer available to new customers. Existing
        # customers of FSx File Gateway can continue to use the service normally. For capabilities similar to
        # FSx File Gateway, visit this blog post .

        @[JSON::Field(key: "GatewayType")]
        getter gateway_type : String?

        # The type of hardware or software platform on which the gateway is running. Tape Gateway is no longer
        # available on Snow Family devices.

        @[JSON::Field(key: "HostEnvironment")]
        getter host_environment : String?

        # A unique identifier for the specific instance of the host platform running the gateway. This value
        # is only available for certain host environments, and its format depends on the host environment
        # type.

        @[JSON::Field(key: "HostEnvironmentId")]
        getter host_environment_id : String?

        # The version number of the software running on the gateway appliance.

        @[JSON::Field(key: "SoftwareVersion")]
        getter software_version : String?

        def initialize(
          @deprecation_date : String? = nil,
          @ec2_instance_id : String? = nil,
          @ec2_instance_region : String? = nil,
          @gateway_arn : String? = nil,
          @gateway_id : String? = nil,
          @gateway_name : String? = nil,
          @gateway_operational_state : String? = nil,
          @gateway_type : String? = nil,
          @host_environment : String? = nil,
          @host_environment_id : String? = nil,
          @software_version : String? = nil
        )
        end
      end

      # An internal server error has occurred during the request. For more information, see the error and
      # message fields.

      struct InternalServerError
        include JSON::Serializable

        # A StorageGatewayError that provides more information about the cause of the error.

        @[JSON::Field(key: "error")]
        getter error : Types::StorageGatewayError?

        # A human-readable message describing the error that occurred.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error : Types::StorageGatewayError? = nil,
          @message : String? = nil
        )
        end
      end

      # An exception occurred because an invalid gateway request was issued to the service. For more
      # information, see the error and message fields.

      struct InvalidGatewayRequestException
        include JSON::Serializable

        # A StorageGatewayError that provides more detail about the cause of the error.

        @[JSON::Field(key: "error")]
        getter error : Types::StorageGatewayError?

        # A human-readable message describing the error that occurred.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error : Types::StorageGatewayError? = nil,
          @message : String? = nil
        )
        end
      end

      # JoinDomainInput

      struct JoinDomainInput
        include JSON::Serializable

        # The name of the domain that you want the gateway to join.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # Sets the password of the user who has permission to add the gateway to the Active Directory domain.

        @[JSON::Field(key: "Password")]
        getter password : String

        # Sets the user name of user who has permission to add the gateway to the Active Directory domain. The
        # domain user account should be enabled to join computers to the domain. For example, you can use the
        # domain administrator account or an account with delegated permissions to join computers to the
        # domain.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # List of IP addresses, NetBIOS names, or host names of your domain server. If you need to specify the
        # port number include it after the colon (“:”). For example, mydc.mydomain.com:389 . S3 File Gateway
        # supports IPv6 addresses in addition to IPv4 and other existing formats. FSx File Gateway does not
        # support IPv6.

        @[JSON::Field(key: "DomainControllers")]
        getter domain_controllers : Array(String)?

        # The organizational unit (OU) is a container in an Active Directory that can hold users, groups,
        # computers, and other OUs and this parameter specifies the OU that the gateway will join within the
        # AD domain.

        @[JSON::Field(key: "OrganizationalUnit")]
        getter organizational_unit : String?

        # Specifies the time in seconds, in which the JoinDomain operation must complete. The default is 20
        # seconds.

        @[JSON::Field(key: "TimeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        def initialize(
          @domain_name : String,
          @gateway_arn : String,
          @password : String,
          @user_name : String,
          @domain_controllers : Array(String)? = nil,
          @organizational_unit : String? = nil,
          @timeout_in_seconds : Int32? = nil
        )
        end
      end

      # JoinDomainOutput

      struct JoinDomainOutput
        include JSON::Serializable

        # Indicates the status of the gateway as a member of the Active Directory domain. This field is only
        # used as part of a JoinDomain request. It is not affected by Active Directory connectivity changes
        # that occur after the JoinDomain request succeeds. ACCESS_DENIED : Indicates that the JoinDomain
        # operation failed due to an authentication error. DETACHED : Indicates that gateway is not joined to
        # a domain. JOINED : Indicates that the gateway has successfully joined a domain. JOINING : Indicates
        # that a JoinDomain operation is in progress. INSUFFICIENT_PERMISSIONS : Indicates that the JoinDomain
        # operation failed because the specified user lacks the necessary permissions to join the domain.
        # NETWORK_ERROR : Indicates that JoinDomain operation failed due to a network or connectivity error.
        # TIMEOUT : Indicates that the JoinDomain operation failed because the operation didn't complete
        # within the allotted time. UNKNOWN_ERROR : Indicates that the JoinDomain operation failed due to
        # another type of error.

        @[JSON::Field(key: "ActiveDirectoryStatus")]
        getter active_directory_status : String?

        # The unique Amazon Resource Name (ARN) of the gateway that joined the domain.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @active_directory_status : String? = nil,
          @gateway_arn : String? = nil
        )
        end
      end


      struct ListAutomaticTapeCreationPoliciesInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct ListAutomaticTapeCreationPoliciesOutput
        include JSON::Serializable

        # Gets a listing of information about the gateway's automatic tape creation policies, including the
        # automatic tape creation rules and the gateway that is using the policies.

        @[JSON::Field(key: "AutomaticTapeCreationPolicyInfos")]
        getter automatic_tape_creation_policy_infos : Array(Types::AutomaticTapeCreationPolicyInfo)?

        def initialize(
          @automatic_tape_creation_policy_infos : Array(Types::AutomaticTapeCreationPolicyInfo)? = nil
        )
        end
      end


      struct ListCacheReportsInput
        include JSON::Serializable

        # Opaque pagination token returned from a previous ListCacheReports operation. If present, Marker
        # specifies where to continue the list from after a previous call to ListCacheReports . Optional.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @marker : String? = nil
        )
        end
      end


      struct ListCacheReportsOutput
        include JSON::Serializable

        # A list of existing cache reports for all file shares associated with your Amazon Web Services
        # account. This list includes all information provided by the DescribeCacheReport action, such as
        # report status, completion progress, start time, end time, filters, and tags.

        @[JSON::Field(key: "CacheReportList")]
        getter cache_report_list : Array(Types::CacheReportInfo)?

        # If the request includes Marker , the response returns that value in this field.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cache_report_list : Array(Types::CacheReportInfo)? = nil,
          @marker : String? = nil
        )
        end
      end

      # ListFileShareInput

      struct ListFileSharesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway whose file shares you want to list. If this field is
        # not present, all file shares under your account are listed.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The maximum number of file shares to return in the response. The value must be an integer with a
        # value greater than zero. Optional.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Opaque pagination token returned from a previous ListFileShares operation. If present, Marker
        # specifies where to continue the list from after a previous call to ListFileShares. Optional.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @gateway_arn : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      # ListFileShareOutput

      struct ListFileSharesOutput
        include JSON::Serializable

        # An array of information about the S3 File Gateway's file shares.

        @[JSON::Field(key: "FileShareInfoList")]
        getter file_share_info_list : Array(Types::FileShareInfo)?

        # If the request includes Marker , the response returns that value in this field.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # If a value is present, there are more file shares to return. In a subsequent request, use NextMarker
        # as the value for Marker to retrieve the next set of file shares.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @file_share_info_list : Array(Types::FileShareInfo)? = nil,
          @marker : String? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListFileSystemAssociationsInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The maximum number of file system associations to return in the response. If present, Limit must be
        # an integer with a value greater than zero. Optional.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Opaque pagination token returned from a previous ListFileSystemAssociations operation. If present,
        # Marker specifies where to continue the list from after a previous call to ListFileSystemAssociations
        # . Optional.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @gateway_arn : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end


      struct ListFileSystemAssociationsOutput
        include JSON::Serializable

        # An array of information about the Amazon FSx gateway's file system associations.

        @[JSON::Field(key: "FileSystemAssociationSummaryList")]
        getter file_system_association_summary_list : Array(Types::FileSystemAssociationSummary)?

        # If the request includes Marker , the response returns that value in this field.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # If a value is present, there are more file system associations to return. In a subsequent request,
        # use NextMarker as the value for Marker to retrieve the next set of file system associations.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @file_system_association_summary_list : Array(Types::FileSystemAssociationSummary)? = nil,
          @marker : String? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A JSON object containing zero or more of the following fields: ListGatewaysInput$Limit
      # ListGatewaysInput$Marker

      struct ListGatewaysInput
        include JSON::Serializable

        # Specifies that the list of gateways returned be limited to the specified number of items.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # An opaque string that indicates the position at which to begin the returned list of gateways.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end


      struct ListGatewaysOutput
        include JSON::Serializable

        # An array of GatewayInfo objects.

        @[JSON::Field(key: "Gateways")]
        getter gateways : Array(Types::GatewayInfo)?

        # Use the marker in your next request to fetch the next set of gateways in the list. If there are no
        # more gateways to list, this field does not appear in the response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @gateways : Array(Types::GatewayInfo)? = nil,
          @marker : String? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway.

      struct ListLocalDisksInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct ListLocalDisksOutput
        include JSON::Serializable

        # A JSON object containing the following fields: ListLocalDisksOutput$Disks

        @[JSON::Field(key: "Disks")]
        getter disks : Array(Types::Disk)?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @disks : Array(Types::Disk)? = nil,
          @gateway_arn : String? = nil
        )
        end
      end

      # ListTagsForResourceInput

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to list tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # Specifies that the list of tags returned be limited to the specified number of items.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # An opaque string that indicates the position at which to begin returning the list of tags.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @resource_arn : String,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      # ListTagsForResourceOutput

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # An opaque string that indicates the position at which to stop returning the list of tags.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The Amazon Resource Name (ARN) of the resource for which you want to list tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # An array that contains the tags for the specified resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @marker : String? = nil,
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListTapePoolsInput
        include JSON::Serializable

        # An optional number limit for the tape pools in the list returned by this call.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A string that indicates the position at which to begin the returned list of tape pools.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The Amazon Resource Name (ARN) of each of the custom tape pools you want to list. If you don't
        # specify a custom tape pool ARN, the response lists all custom tape pools.

        @[JSON::Field(key: "PoolARNs")]
        getter pool_ar_ns : Array(String)?

        def initialize(
          @limit : Int32? = nil,
          @marker : String? = nil,
          @pool_ar_ns : Array(String)? = nil
        )
        end
      end


      struct ListTapePoolsOutput
        include JSON::Serializable

        # A string that indicates the position at which to begin the returned list of tape pools. Use the
        # marker in your next request to continue pagination of tape pools. If there are no more tape pools to
        # list, this element does not appear in the response body.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An array of PoolInfo objects, where each object describes a single custom tape pool. If there are no
        # custom tape pools, the PoolInfos is an empty array.

        @[JSON::Field(key: "PoolInfos")]
        getter pool_infos : Array(Types::PoolInfo)?

        def initialize(
          @marker : String? = nil,
          @pool_infos : Array(Types::PoolInfo)? = nil
        )
        end
      end

      # A JSON object that contains one or more of the following fields: ListTapesInput$Limit
      # ListTapesInput$Marker ListTapesInput$TapeARNs

      struct ListTapesInput
        include JSON::Serializable

        # An optional number limit for the tapes in the list returned by this call.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A string that indicates the position at which to begin the returned list of tapes.

        @[JSON::Field(key: "Marker")]
        getter marker : String?


        @[JSON::Field(key: "TapeARNs")]
        getter tape_ar_ns : Array(String)?

        def initialize(
          @limit : Int32? = nil,
          @marker : String? = nil,
          @tape_ar_ns : Array(String)? = nil
        )
        end
      end

      # A JSON object containing the following fields: ListTapesOutput$Marker ListTapesOutput$VolumeInfos

      struct ListTapesOutput
        include JSON::Serializable

        # A string that indicates the position at which to begin returning the next list of tapes. Use the
        # marker in your next request to continue pagination of tapes. If there are no more tapes to list,
        # this element does not appear in the response body.

        @[JSON::Field(key: "Marker")]
        getter marker : String?


        @[JSON::Field(key: "TapeInfos")]
        getter tape_infos : Array(Types::TapeInfo)?

        def initialize(
          @marker : String? = nil,
          @tape_infos : Array(Types::TapeInfo)? = nil
        )
        end
      end

      # ListVolumeInitiatorsInput

      struct ListVolumeInitiatorsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of
        # gateway volumes for the gateway.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String

        def initialize(
          @volume_arn : String
        )
        end
      end

      # ListVolumeInitiatorsOutput

      struct ListVolumeInitiatorsOutput
        include JSON::Serializable

        # The host names and port numbers of all iSCSI initiators that are connected to the gateway.

        @[JSON::Field(key: "Initiators")]
        getter initiators : Array(String)?

        def initialize(
          @initiators : Array(String)? = nil
        )
        end
      end


      struct ListVolumeRecoveryPointsInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct ListVolumeRecoveryPointsOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # An array of VolumeRecoveryPointInfo objects.

        @[JSON::Field(key: "VolumeRecoveryPointInfos")]
        getter volume_recovery_point_infos : Array(Types::VolumeRecoveryPointInfo)?

        def initialize(
          @gateway_arn : String? = nil,
          @volume_recovery_point_infos : Array(Types::VolumeRecoveryPointInfo)? = nil
        )
        end
      end

      # A JSON object that contains one or more of the following fields: ListVolumesInput$Limit
      # ListVolumesInput$Marker

      struct ListVolumesInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # Specifies that the list of volumes returned be limited to the specified number of items.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A string that indicates the position at which to begin the returned list of volumes. Obtain the
        # marker from the response of a previous List iSCSI Volumes request.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @gateway_arn : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      # A JSON object containing the following fields: ListVolumesOutput$Marker
      # ListVolumesOutput$VolumeInfos

      struct ListVolumesOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # Use the marker in your next request to continue pagination of iSCSI volumes. If there are no more
        # volumes to list, this field does not appear in the response body.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An array of VolumeInfo objects, where each object describes an iSCSI volume. If no volumes are
        # defined for the gateway, then VolumeInfos is an empty array "[]".

        @[JSON::Field(key: "VolumeInfos")]
        getter volume_infos : Array(Types::VolumeInfo)?

        def initialize(
          @gateway_arn : String? = nil,
          @marker : String? = nil,
          @volume_infos : Array(Types::VolumeInfo)? = nil
        )
        end
      end

      # Describes Network File System (NFS) file share default values. Files and folders stored as Amazon S3
      # objects in S3 buckets don't, by default, have Unix file permissions assigned to them. Upon discovery
      # in an S3 bucket by Storage Gateway, the S3 objects that represent files and folders are assigned
      # these default Unix permissions. This operation is only supported for S3 File Gateways.

      struct NFSFileShareDefaults
        include JSON::Serializable

        # The Unix directory mode in the form "nnnn". For example, 0666 represents the default access mode for
        # all directories inside the file share. The default value is 0777 .

        @[JSON::Field(key: "DirectoryMode")]
        getter directory_mode : String?

        # The Unix file mode in the form "nnnn". For example, 0666 represents the default file mode inside the
        # file share. The default value is 0666 .

        @[JSON::Field(key: "FileMode")]
        getter file_mode : String?

        # The default group ID for the file share (unless the files have another group ID specified). The
        # default value is nfsnobody .

        @[JSON::Field(key: "GroupId")]
        getter group_id : Int64?

        # The default owner ID for files in the file share (unless the files have another owner ID specified).
        # The default value is nfsnobody .

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : Int64?

        def initialize(
          @directory_mode : String? = nil,
          @file_mode : String? = nil,
          @group_id : Int64? = nil,
          @owner_id : Int64? = nil
        )
        end
      end

      # The Unix file permissions and ownership information assigned, by default, to native S3 objects when
      # an S3 File Gateway discovers them in S3 buckets. This operation is only supported in S3 File
      # Gateways.

      struct NFSFileShareInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the storage used for audit logs.

        @[JSON::Field(key: "AuditDestinationARN")]
        getter audit_destination_arn : String?

        # Specifies the Region of the S3 bucket where the NFS file share stores files. This parameter is
        # required for NFS file shares that connect to Amazon S3 through a VPC endpoint, a VPC access point,
        # or an access point alias that points to a VPC access point.

        @[JSON::Field(key: "BucketRegion")]
        getter bucket_region : String?

        # Refresh cache information for the file share.

        @[JSON::Field(key: "CacheAttributes")]
        getter cache_attributes : Types::CacheAttributes?


        @[JSON::Field(key: "ClientList")]
        getter client_list : Array(String)?

        # The default storage class for objects put into an Amazon S3 bucket by the S3 File Gateway. The
        # default value is S3_STANDARD . Optional. Valid Values: S3_STANDARD | S3_INTELLIGENT_TIERING |
        # S3_STANDARD_IA | S3_ONEZONE_IA

        @[JSON::Field(key: "DefaultStorageClass")]
        getter default_storage_class : String?

        # A value that specifies the type of server-side encryption that the file share will use for the data
        # that it stores in Amazon S3. We recommend using EncryptionType instead of KMSEncrypted to set the
        # file share encryption method. You do not need to provide values for both parameters. If values for
        # both parameters exist in the same request, then the specified encryption methods must not conflict.
        # For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If EncryptionType is
        # SseKms or DsseKms , then KMSEncrypted must be true .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?


        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?


        @[JSON::Field(key: "FileShareId")]
        getter file_share_id : String?

        # The name of the file share. Optional. FileShareName must be set if an S3 prefix name is set in
        # LocationARN , or if an access point or access point alias is used.

        @[JSON::Field(key: "FileShareName")]
        getter file_share_name : String?


        @[JSON::Field(key: "FileShareStatus")]
        getter file_share_status : String?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set
        # this value to true to enable MIME type guessing, otherwise set to false . The default value is true
        # . Valid Values: true | false

        @[JSON::Field(key: "GuessMIMETypeEnabled")]
        getter guess_mime_type_enabled : Bool?

        # Optional. Set to true to use Amazon S3 server-side encryption with your own KMS key (SSE-KMS), or
        # false to use a key managed by Amazon S3 (SSE-S3). To use dual-layer encryption (DSSE-KMS), set the
        # EncryptionType parameter instead. We recommend using EncryptionType instead of KMSEncrypted to set
        # the file share encryption method. You do not need to provide values for both parameters. If values
        # for both parameters exist in the same request, then the specified encryption methods must not
        # conflict. For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If
        # EncryptionType is SseKms or DsseKms , then KMSEncrypted must be true . Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?


        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?


        @[JSON::Field(key: "LocationARN")]
        getter location_arn : String?


        @[JSON::Field(key: "NFSFileShareDefaults")]
        getter nfs_file_share_defaults : Types::NFSFileShareDefaults?

        # The notification policy of the file share. SettlingTimeInSeconds controls the number of seconds to
        # wait after the last point in time a client wrote to a file before generating an ObjectUploaded
        # notification. Because clients can make many small writes to files, it's best to set this parameter
        # for as long as possible to avoid generating multiple notifications for the same file in a small time
        # period. SettlingTimeInSeconds has no effect on the timing of the object uploading to Amazon S3, only
        # the timing of the notification. This setting is not meant to specify an exact time at which the
        # notification will be sent. In some cases, the gateway might require more than the specified delay
        # time to generate and send notifications. The following example sets NotificationPolicy on with
        # SettlingTimeInSeconds set to 60. {\"Upload\": {\"SettlingTimeInSeconds\": 60}} The following example
        # sets NotificationPolicy off. {}

        @[JSON::Field(key: "NotificationPolicy")]
        getter notification_policy : String?


        @[JSON::Field(key: "ObjectACL")]
        getter object_acl : String?


        @[JSON::Field(key: "Path")]
        getter path : String?

        # A value that sets the write status of a file share. Set this value to true to set the write status
        # to read-only, otherwise set to false . Valid Values: true | false

        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # A value that sets who pays the cost of the request and the cost associated with data download from
        # the S3 bucket. If this value is set to true , the requester pays the costs; otherwise, the S3 bucket
        # owner pays. However, the S3 bucket owner always pays the cost of storing data. RequesterPays is a
        # configuration for the S3 bucket that backs the file share, so make sure that the configuration on
        # the file share is the same as the S3 bucket configuration. Valid Values: true | false

        @[JSON::Field(key: "RequesterPays")]
        getter requester_pays : Bool?


        @[JSON::Field(key: "Role")]
        getter role : String?


        @[JSON::Field(key: "Squash")]
        getter squash : String?

        # A list of up to 50 tags assigned to the NFS file share, sorted alphabetically by key name. Each tag
        # is a key-value pair. For a gateway with more than 10 tags assigned, you can view all tags using the
        # ListTagsForResource API operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the DNS name for the VPC endpoint that the NFS file share uses to connect to Amazon S3.
        # This parameter is required for NFS file shares that connect to Amazon S3 through a VPC endpoint, a
        # VPC access point, or an access point alias that points to a VPC access point.

        @[JSON::Field(key: "VPCEndpointDNSName")]
        getter vpc_endpoint_dns_name : String?

        def initialize(
          @audit_destination_arn : String? = nil,
          @bucket_region : String? = nil,
          @cache_attributes : Types::CacheAttributes? = nil,
          @client_list : Array(String)? = nil,
          @default_storage_class : String? = nil,
          @encryption_type : String? = nil,
          @file_share_arn : String? = nil,
          @file_share_id : String? = nil,
          @file_share_name : String? = nil,
          @file_share_status : String? = nil,
          @gateway_arn : String? = nil,
          @guess_mime_type_enabled : Bool? = nil,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @location_arn : String? = nil,
          @nfs_file_share_defaults : Types::NFSFileShareDefaults? = nil,
          @notification_policy : String? = nil,
          @object_acl : String? = nil,
          @path : String? = nil,
          @read_only : Bool? = nil,
          @requester_pays : Bool? = nil,
          @role : String? = nil,
          @squash : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_endpoint_dns_name : String? = nil
        )
        end
      end

      # Describes a gateway's network interface.

      struct NetworkInterface
        include JSON::Serializable

        # The Internet Protocol version 4 (IPv4) address of the interface.

        @[JSON::Field(key: "Ipv4Address")]
        getter ipv4_address : String?

        # The Internet Protocol version 6 (IPv6) address of the interface. This element returns IPv6 addresses
        # for all gateway types except FSx File Gateway.

        @[JSON::Field(key: "Ipv6Address")]
        getter ipv6_address : String?

        # The Media Access Control (MAC) address of the interface. This is currently unsupported and will not
        # be returned in output.

        @[JSON::Field(key: "MacAddress")]
        getter mac_address : String?

        def initialize(
          @ipv4_address : String? = nil,
          @ipv6_address : String? = nil,
          @mac_address : String? = nil
        )
        end
      end


      struct NotifyWhenUploadedInput
        include JSON::Serializable


        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String

        def initialize(
          @file_share_arn : String
        )
        end
      end


      struct NotifyWhenUploadedOutput
        include JSON::Serializable


        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?


        @[JSON::Field(key: "NotificationId")]
        getter notification_id : String?

        def initialize(
          @file_share_arn : String? = nil,
          @notification_id : String? = nil
        )
        end
      end

      # Describes a custom tape pool.

      struct PoolInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom tape pool. Use the ListTapePools operation to return a
        # list of custom tape pools for your account and Amazon Web Services Region.

        @[JSON::Field(key: "PoolARN")]
        getter pool_arn : String?

        # The name of the custom tape pool. PoolName can use all ASCII characters, except '/' and '\'.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String?

        # Status of the custom tape pool. Pool can be ACTIVE or DELETED .

        @[JSON::Field(key: "PoolStatus")]
        getter pool_status : String?

        # Tape retention lock time is set in days. Tape retention lock can be enabled for up to 100 years
        # (36,500 days).

        @[JSON::Field(key: "RetentionLockTimeInDays")]
        getter retention_lock_time_in_days : Int32?

        # Tape retention lock type, which can be configured in two modes. When configured in governance mode,
        # Amazon Web Services accounts with specific IAM permissions are authorized to remove the tape
        # retention lock from archived virtual tapes. When configured in compliance mode, the tape retention
        # lock cannot be removed by any user, including the root Amazon Web Services account.

        @[JSON::Field(key: "RetentionLockType")]
        getter retention_lock_type : String?

        # The storage class that is associated with the custom pool. When you use your backup application to
        # eject the tape, the tape is archived directly into the storage class (S3 Glacier or S3 Glacier Deep
        # Archive) that corresponds to the pool.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @pool_arn : String? = nil,
          @pool_name : String? = nil,
          @pool_status : String? = nil,
          @retention_lock_time_in_days : Int32? = nil,
          @retention_lock_type : String? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # RefreshCacheInput

      struct RefreshCacheInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the file share you want to refresh.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String

        # A comma-separated list of the paths of folders to refresh in the cache. The default is [ "/" ]. The
        # default refreshes objects and folders at the root of the Amazon S3 bucket. If Recursive is set to
        # true , the entire S3 bucket that the file share has access to is refreshed. Do not include / when
        # specifying folder names. For example, you would specify samplefolder rather than samplefolder/ .

        @[JSON::Field(key: "FolderList")]
        getter folder_list : Array(String)?

        # A value that specifies whether to recursively refresh folders in the cache. The refresh includes
        # folders that were in the cache the last time the gateway listed the folder's contents. If this value
        # set to true , each folder that is listed in FolderList is recursively updated. Otherwise, subfolders
        # listed in FolderList are not refreshed. Only objects that are in folders listed directly under
        # FolderList are found and used for the update. The default is true . Valid Values: true | false

        @[JSON::Field(key: "Recursive")]
        getter recursive : Bool?

        def initialize(
          @file_share_arn : String,
          @folder_list : Array(String)? = nil,
          @recursive : Bool? = nil
        )
        end
      end

      # RefreshCacheOutput

      struct RefreshCacheOutput
        include JSON::Serializable


        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?


        @[JSON::Field(key: "NotificationId")]
        getter notification_id : String?

        def initialize(
          @file_share_arn : String? = nil,
          @notification_id : String? = nil
        )
        end
      end

      # RemoveTagsFromResourceInput

      struct RemoveTagsFromResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource you want to remove the tags from.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The keys of the tags you want to remove from the specified resource. A tag is composed of a
        # key-value pair.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # RemoveTagsFromResourceOutput

      struct RemoveTagsFromResourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that the tags were removed from.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end


      struct ResetCacheInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct ResetCacheOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # RetrieveTapeArchiveInput

      struct RetrieveTapeArchiveInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway you want to retrieve the virtual tape to. Use the
        # ListGateways operation to return a list of gateways for your account and Amazon Web Services Region.
        # You retrieve archived virtual tapes to only one gateway and the gateway must be a tape gateway.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The Amazon Resource Name (ARN) of the virtual tape you want to retrieve from the virtual tape shelf
        # (VTS).

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String

        def initialize(
          @gateway_arn : String,
          @tape_arn : String
        )
        end
      end

      # RetrieveTapeArchiveOutput

      struct RetrieveTapeArchiveOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the retrieved virtual tape.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        def initialize(
          @tape_arn : String? = nil
        )
        end
      end

      # RetrieveTapeRecoveryPointInput

      struct RetrieveTapeRecoveryPointInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The Amazon Resource Name (ARN) of the virtual tape for which you want to retrieve the recovery
        # point.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String

        def initialize(
          @gateway_arn : String,
          @tape_arn : String
        )
        end
      end

      # RetrieveTapeRecoveryPointOutput

      struct RetrieveTapeRecoveryPointOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the virtual tape for which the recovery point was retrieved.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        def initialize(
          @tape_arn : String? = nil
        )
        end
      end

      # The Windows file permissions and ownership information assigned, by default, to native S3 objects
      # when S3 File Gateway discovers them in S3 buckets. This operation is only supported for S3 File
      # Gateways.

      struct SMBFileShareInfo
        include JSON::Serializable

        # Indicates whether AccessBasedEnumeration is enabled.

        @[JSON::Field(key: "AccessBasedEnumeration")]
        getter access_based_enumeration : Bool?

        # A list of users or groups in the Active Directory that have administrator rights to the file share.
        # A group must be prefixed with the @ character. Acceptable formats include: DOMAIN\User1 , user1 ,
        # @group1 , and @DOMAIN\group1 . Can only be set if Authentication is set to ActiveDirectory .

        @[JSON::Field(key: "AdminUserList")]
        getter admin_user_list : Array(String)?

        # The Amazon Resource Name (ARN) of the storage used for audit logs.

        @[JSON::Field(key: "AuditDestinationARN")]
        getter audit_destination_arn : String?


        @[JSON::Field(key: "Authentication")]
        getter authentication : String?

        # Specifies the Region of the S3 bucket where the SMB file share stores files. This parameter is
        # required for SMB file shares that connect to Amazon S3 through a VPC endpoint, a VPC access point,
        # or an access point alias that points to a VPC access point.

        @[JSON::Field(key: "BucketRegion")]
        getter bucket_region : String?

        # Refresh cache information for the file share.

        @[JSON::Field(key: "CacheAttributes")]
        getter cache_attributes : Types::CacheAttributes?

        # The case of an object name in an Amazon S3 bucket. For ClientSpecified , the client determines the
        # case sensitivity. For CaseSensitive , the gateway determines the case sensitivity. The default value
        # is ClientSpecified .

        @[JSON::Field(key: "CaseSensitivity")]
        getter case_sensitivity : String?

        # The default storage class for objects put into an Amazon S3 bucket by the S3 File Gateway. The
        # default value is S3_STANDARD . Optional. Valid Values: S3_STANDARD | S3_INTELLIGENT_TIERING |
        # S3_STANDARD_IA | S3_ONEZONE_IA

        @[JSON::Field(key: "DefaultStorageClass")]
        getter default_storage_class : String?

        # A value that specifies the type of server-side encryption that the file share will use for the data
        # that it stores in Amazon S3. We recommend using EncryptionType instead of KMSEncrypted to set the
        # file share encryption method. You do not need to provide values for both parameters. If values for
        # both parameters exist in the same request, then the specified encryption methods must not conflict.
        # For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If EncryptionType is
        # SseKms or DsseKms , then KMSEncrypted must be true .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?


        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?


        @[JSON::Field(key: "FileShareId")]
        getter file_share_id : String?

        # The name of the file share. Optional. FileShareName must be set if an S3 prefix name is set in
        # LocationARN , or if an access point or access point alias is used.

        @[JSON::Field(key: "FileShareName")]
        getter file_share_name : String?


        @[JSON::Field(key: "FileShareStatus")]
        getter file_share_status : String?


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set
        # this value to true to enable MIME type guessing, otherwise set to false . The default value is true
        # . Valid Values: true | false

        @[JSON::Field(key: "GuessMIMETypeEnabled")]
        getter guess_mime_type_enabled : Bool?

        # A list of users or groups in the Active Directory that are not allowed to access the file share. A
        # group must be prefixed with the @ character. Acceptable formats include: DOMAIN\User1 , user1 ,
        # @group1 , and @DOMAIN\group1 . Can only be set if Authentication is set to ActiveDirectory .

        @[JSON::Field(key: "InvalidUserList")]
        getter invalid_user_list : Array(String)?

        # Optional. Set to true to use Amazon S3 server-side encryption with your own KMS key (SSE-KMS), or
        # false to use a key managed by Amazon S3 (SSE-S3). To use dual-layer encryption (DSSE-KMS), set the
        # EncryptionType parameter instead. We recommend using EncryptionType instead of KMSEncrypted to set
        # the file share encryption method. You do not need to provide values for both parameters. If values
        # for both parameters exist in the same request, then the specified encryption methods must not
        # conflict. For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If
        # EncryptionType is SseKms or DsseKms , then KMSEncrypted must be true . Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?


        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?


        @[JSON::Field(key: "LocationARN")]
        getter location_arn : String?

        # The notification policy of the file share. SettlingTimeInSeconds controls the number of seconds to
        # wait after the last point in time a client wrote to a file before generating an ObjectUploaded
        # notification. Because clients can make many small writes to files, it's best to set this parameter
        # for as long as possible to avoid generating multiple notifications for the same file in a small time
        # period. SettlingTimeInSeconds has no effect on the timing of the object uploading to Amazon S3, only
        # the timing of the notification. This setting is not meant to specify an exact time at which the
        # notification will be sent. In some cases, the gateway might require more than the specified delay
        # time to generate and send notifications. The following example sets NotificationPolicy on with
        # SettlingTimeInSeconds set to 60. {\"Upload\": {\"SettlingTimeInSeconds\": 60}} The following example
        # sets NotificationPolicy off. {}

        @[JSON::Field(key: "NotificationPolicy")]
        getter notification_policy : String?


        @[JSON::Field(key: "ObjectACL")]
        getter object_acl : String?

        # Specifies whether opportunistic locking is enabled for the SMB file share. Enabling opportunistic
        # locking on case-sensitive shares is not recommended for workloads that involve access to files with
        # the same name in different case. Valid Values: true | false

        @[JSON::Field(key: "OplocksEnabled")]
        getter oplocks_enabled : Bool?

        # The file share path used by the SMB client to identify the mount point.

        @[JSON::Field(key: "Path")]
        getter path : String?

        # A value that sets the write status of a file share. Set this value to true to set the write status
        # to read-only, otherwise set to false . Valid Values: true | false

        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # A value that sets who pays the cost of the request and the cost associated with data download from
        # the S3 bucket. If this value is set to true , the requester pays the costs; otherwise, the S3 bucket
        # owner pays. However, the S3 bucket owner always pays the cost of storing data. RequesterPays is a
        # configuration for the S3 bucket that backs the file share, so make sure that the configuration on
        # the file share is the same as the S3 bucket configuration. Valid Values: true | false

        @[JSON::Field(key: "RequesterPays")]
        getter requester_pays : Bool?


        @[JSON::Field(key: "Role")]
        getter role : String?

        # If this value is set to true , it indicates that access control list (ACL) is enabled on the SMB
        # file share. If it is set to false , it indicates that file and directory permissions are mapped to
        # the POSIX permission. For more information, see Using Windows ACLs to limit SMB file share access in
        # the Amazon S3 File Gateway User Guide .

        @[JSON::Field(key: "SMBACLEnabled")]
        getter smbacl_enabled : Bool?

        # A list of up to 50 tags assigned to the SMB file share, sorted alphabetically by key name. Each tag
        # is a key-value pair. For a gateway with more than 10 tags assigned, you can view all tags using the
        # ListTagsForResource API operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the DNS name for the VPC endpoint that the SMB file share uses to connect to Amazon S3.
        # This parameter is required for SMB file shares that connect to Amazon S3 through a VPC endpoint, a
        # VPC access point, or an access point alias that points to a VPC access point.

        @[JSON::Field(key: "VPCEndpointDNSName")]
        getter vpc_endpoint_dns_name : String?

        # A list of users or groups in the Active Directory that are allowed to access the file share. A group
        # must be prefixed with the @ character. Acceptable formats include: DOMAIN\User1 , user1 , @group1 ,
        # and @DOMAIN\group1 . Can only be set if Authentication is set to ActiveDirectory .

        @[JSON::Field(key: "ValidUserList")]
        getter valid_user_list : Array(String)?

        def initialize(
          @access_based_enumeration : Bool? = nil,
          @admin_user_list : Array(String)? = nil,
          @audit_destination_arn : String? = nil,
          @authentication : String? = nil,
          @bucket_region : String? = nil,
          @cache_attributes : Types::CacheAttributes? = nil,
          @case_sensitivity : String? = nil,
          @default_storage_class : String? = nil,
          @encryption_type : String? = nil,
          @file_share_arn : String? = nil,
          @file_share_id : String? = nil,
          @file_share_name : String? = nil,
          @file_share_status : String? = nil,
          @gateway_arn : String? = nil,
          @guess_mime_type_enabled : Bool? = nil,
          @invalid_user_list : Array(String)? = nil,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @location_arn : String? = nil,
          @notification_policy : String? = nil,
          @object_acl : String? = nil,
          @oplocks_enabled : Bool? = nil,
          @path : String? = nil,
          @read_only : Bool? = nil,
          @requester_pays : Bool? = nil,
          @role : String? = nil,
          @smbacl_enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_endpoint_dns_name : String? = nil,
          @valid_user_list : Array(String)? = nil
        )
        end
      end

      # A list of Active Directory users and groups that have special permissions for SMB file shares on the
      # gateway.

      struct SMBLocalGroups
        include JSON::Serializable

        # A list of Active Directory users and groups that have local Gateway Admin permissions. Acceptable
        # formats include: DOMAIN\User1 , user1 , DOMAIN\group1 , and group1 . Gateway Admins can use the
        # Shared Folders Microsoft Management Console snap-in to force-close files that are open and locked.

        @[JSON::Field(key: "GatewayAdmins")]
        getter gateway_admins : Array(String)?

        def initialize(
          @gateway_admins : Array(String)? = nil
        )
        end
      end

      # An internal server error has occurred because the service is unavailable. For more information, see
      # the error and message fields.

      struct ServiceUnavailableError
        include JSON::Serializable

        # A StorageGatewayError that provides more information about the cause of the error.

        @[JSON::Field(key: "error")]
        getter error : Types::StorageGatewayError?

        # A human-readable message describing the error that occurred.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error : Types::StorageGatewayError? = nil,
          @message : String? = nil
        )
        end
      end

      # SetLocalConsolePasswordInput

      struct SetLocalConsolePasswordInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The password you want to set for your VM local console.

        @[JSON::Field(key: "LocalConsolePassword")]
        getter local_console_password : String

        def initialize(
          @gateway_arn : String,
          @local_console_password : String
        )
        end
      end


      struct SetLocalConsolePasswordOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # SetSMBGuestPasswordInput

      struct SetSMBGuestPasswordInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 File Gateway the SMB file share is associated with.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The password that you want to set for your SMB server.

        @[JSON::Field(key: "Password")]
        getter password : String

        def initialize(
          @gateway_arn : String,
          @password : String
        )
        end
      end


      struct SetSMBGuestPasswordOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway to shut down.

      struct ShutdownGatewayInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway that was shut down.

      struct ShutdownGatewayOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A set of variables indicating the software update preferences for the gateway.

      struct SoftwareUpdatePreferences
        include JSON::Serializable

        # Indicates the automatic update policy for a gateway. ALL_VERSIONS - Enables regular gateway
        # maintenance updates. EMERGENCY_VERSIONS_ONLY - Disables regular gateway maintenance updates. The
        # gateway will still receive emergency version updates on rare occasions if necessary to remedy highly
        # critical security or durability issues. You will be notified before an emergency version update is
        # applied. These updates are applied during your gateway's scheduled maintenance window.

        @[JSON::Field(key: "AutomaticUpdatePolicy")]
        getter automatic_update_policy : String?

        def initialize(
          @automatic_update_policy : String? = nil
        )
        end
      end


      struct StartAvailabilityMonitorTestInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end


      struct StartAvailabilityMonitorTestOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct StartCacheReportInput
        include JSON::Serializable

        # The Amazon Web Services Region of the Amazon S3 bucket where you want to save the cache report.

        @[JSON::Field(key: "BucketRegion")]
        getter bucket_region : String

        # A unique identifier that you use to ensure idempotent report generation if you need to retry an
        # unsuccessful StartCacheReport request. If you retry a request, use the same ClientToken you
        # specified in the initial request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String


        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String

        # The ARN of the Amazon S3 bucket where you want to save the cache report. We do not recommend saving
        # the cache report to the same Amazon S3 bucket for which you are generating the report. This field
        # does not accept access point ARNs.

        @[JSON::Field(key: "LocationARN")]
        getter location_arn : String

        # The ARN of the IAM role used when saving the cache report to Amazon S3.

        @[JSON::Field(key: "Role")]
        getter role : String

        # The list of filters and parameters that determine which files are excluded from the report. You must
        # specify at least one value for InclusionFilters or ExclusionFilters in a StartCacheReport request.

        @[JSON::Field(key: "ExclusionFilters")]
        getter exclusion_filters : Array(Types::CacheReportFilter)?

        # The list of filters and parameters that determine which files are included in the report. You must
        # specify at least one value for InclusionFilters or ExclusionFilters in a StartCacheReport request.

        @[JSON::Field(key: "InclusionFilters")]
        getter inclusion_filters : Array(Types::CacheReportFilter)?

        # A list of up to 50 key/value tags that you can assign to the cache report. Using tags can help you
        # categorize your reports and more easily locate them in search results.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The DNS name of the VPC endpoint associated with the Amazon S3 where you want to save the cache
        # report. Optional.

        @[JSON::Field(key: "VPCEndpointDNSName")]
        getter vpc_endpoint_dns_name : String?

        def initialize(
          @bucket_region : String,
          @client_token : String,
          @file_share_arn : String,
          @location_arn : String,
          @role : String,
          @exclusion_filters : Array(Types::CacheReportFilter)? = nil,
          @inclusion_filters : Array(Types::CacheReportFilter)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_endpoint_dns_name : String? = nil
        )
        end
      end


      struct StartCacheReportOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cache report generated by the StartCacheReport request.

        @[JSON::Field(key: "CacheReportARN")]
        getter cache_report_arn : String?

        def initialize(
          @cache_report_arn : String? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway to start.

      struct StartGatewayInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway that was restarted.

      struct StartGatewayOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # Provides additional information about an error that was returned by the service. See the errorCode
      # and errorDetails members for more information about the error.

      struct StorageGatewayError
        include JSON::Serializable

        # Additional information about the error.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # Human-readable text that provides detail about the error that occurred.

        @[JSON::Field(key: "errorDetails")]
        getter error_details : Hash(String, String)?

        def initialize(
          @error_code : String? = nil,
          @error_details : Hash(String, String)? = nil
        )
        end
      end

      # Describes an iSCSI stored volume.

      struct StorediSCSIVolume
        include JSON::Serializable

        # The date the volume was created. Volumes created prior to March 28, 2017 don’t have this timestamp.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?


        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # Indicates if when the stored volume was created, existing data on the underlying local disk was
        # preserved. Valid Values: true | false

        @[JSON::Field(key: "PreservedExistingData")]
        getter preserved_existing_data : Bool?

        # If the stored volume was created from a snapshot, this field contains the snapshot ID used, e.g.
        # snap-78e22663. Otherwise, this field is not included.

        @[JSON::Field(key: "SourceSnapshotId")]
        getter source_snapshot_id : String?

        # The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for
        # the target ARN. For example, specifying TargetName as myvolume results in the target ARN of
        # arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume
        # . The target name must be unique across all volumes on a gateway. If you don't specify a value,
        # Storage Gateway uses the value that was previously used for this volume as the new target name.

        @[JSON::Field(key: "TargetName")]
        getter target_name : String?

        # The Amazon Resource Name (ARN) of the storage volume.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        # A value that indicates whether a storage volume is attached to, detached from, or is in the process
        # of detaching from a gateway. For more information, see Moving your volumes to a different gateway .

        @[JSON::Field(key: "VolumeAttachmentStatus")]
        getter volume_attachment_status : String?

        # The ID of the local disk that was specified in the CreateStorediSCSIVolume operation.

        @[JSON::Field(key: "VolumeDiskId")]
        getter volume_disk_id : String?

        # The unique identifier of the volume, e.g., vol-AE4B946D.

        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        # Represents the percentage complete if the volume is restoring or bootstrapping that represents the
        # percent of data transferred. This field does not appear in the response if the stored volume is not
        # restoring or bootstrapping.

        @[JSON::Field(key: "VolumeProgress")]
        getter volume_progress : Float64?

        # The size of the volume in bytes.

        @[JSON::Field(key: "VolumeSizeInBytes")]
        getter volume_size_in_bytes : Int64?

        # One of the VolumeStatus values that indicates the state of the storage volume.

        @[JSON::Field(key: "VolumeStatus")]
        getter volume_status : String?

        # One of the VolumeType enumeration values describing the type of the volume.

        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String?

        # The size of the data stored on the volume in bytes. This value is calculated based on the number of
        # blocks that are touched, instead of the actual amount of data written. This value can be useful for
        # sequential write patterns but less accurate for random write patterns. VolumeUsedInBytes is
        # different from the compressed size of the volume, which is the value that is used to calculate your
        # bill. This value is not available for volumes created prior to May 13, 2015, until you store data on
        # the volume.

        @[JSON::Field(key: "VolumeUsedInBytes")]
        getter volume_used_in_bytes : Int64?

        # An VolumeiSCSIAttributes object that represents a collection of iSCSI attributes for one stored
        # volume.

        @[JSON::Field(key: "VolumeiSCSIAttributes")]
        getter volumei_scsi_attributes : Types::VolumeiSCSIAttributes?

        def initialize(
          @created_date : Time? = nil,
          @kms_key : String? = nil,
          @preserved_existing_data : Bool? = nil,
          @source_snapshot_id : String? = nil,
          @target_name : String? = nil,
          @volume_arn : String? = nil,
          @volume_attachment_status : String? = nil,
          @volume_disk_id : String? = nil,
          @volume_id : String? = nil,
          @volume_progress : Float64? = nil,
          @volume_size_in_bytes : Int64? = nil,
          @volume_status : String? = nil,
          @volume_type : String? = nil,
          @volume_used_in_bytes : Int64? = nil,
          @volumei_scsi_attributes : Types::VolumeiSCSIAttributes? = nil
        )
        end
      end

      # A key-value pair that helps you manage, filter, and search for your resource. Allowed characters:
      # letters, white space, and numbers, representable in UTF-8, and the following characters: + - = . _ :
      # /.

      struct Tag
        include JSON::Serializable

        # Tag key. The key can't start with aws:.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Value of the tag key.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Describes a virtual tape object.

      struct Tape
        include JSON::Serializable


        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The date that the tape enters a custom tape pool.

        @[JSON::Field(key: "PoolEntryDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter pool_entry_date : Time?

        # The ID of the pool that contains tapes that will be archived. The tapes in this pool are archived in
        # the S3 storage class that is associated with the pool. When you use your backup application to eject
        # the tape, the tape is archived directly into the storage class (S3 Glacier or S3 Glacier Deep
        # Archive) that corresponds to the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # For archiving virtual tapes, indicates how much data remains to be uploaded before archiving is
        # complete. Range: 0 (not started) to 100 (complete).

        @[JSON::Field(key: "Progress")]
        getter progress : Float64?

        # The date that the tape is first archived with tape retention lock enabled.

        @[JSON::Field(key: "RetentionStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter retention_start_date : Time?

        # The Amazon Resource Name (ARN) of the virtual tape.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        # The barcode that identifies a specific virtual tape.

        @[JSON::Field(key: "TapeBarcode")]
        getter tape_barcode : String?

        # The date the virtual tape was created.

        @[JSON::Field(key: "TapeCreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter tape_created_date : Time?

        # The size, in bytes, of the virtual tape capacity.

        @[JSON::Field(key: "TapeSizeInBytes")]
        getter tape_size_in_bytes : Int64?

        # The current state of the virtual tape.

        @[JSON::Field(key: "TapeStatus")]
        getter tape_status : String?

        # The size, in bytes, of data stored on the virtual tape. This value is not available for tapes
        # created prior to May 13, 2015.

        @[JSON::Field(key: "TapeUsedInBytes")]
        getter tape_used_in_bytes : Int64?

        # The virtual tape library (VTL) device that the virtual tape is associated with.

        @[JSON::Field(key: "VTLDevice")]
        getter vtl_device : String?

        # If the tape is archived as write-once-read-many (WORM), this value is true .

        @[JSON::Field(key: "Worm")]
        getter worm : Bool?

        def initialize(
          @kms_key : String? = nil,
          @pool_entry_date : Time? = nil,
          @pool_id : String? = nil,
          @progress : Float64? = nil,
          @retention_start_date : Time? = nil,
          @tape_arn : String? = nil,
          @tape_barcode : String? = nil,
          @tape_created_date : Time? = nil,
          @tape_size_in_bytes : Int64? = nil,
          @tape_status : String? = nil,
          @tape_used_in_bytes : Int64? = nil,
          @vtl_device : String? = nil,
          @worm : Bool? = nil
        )
        end
      end

      # Represents a virtual tape that is archived in the virtual tape shelf (VTS).

      struct TapeArchive
        include JSON::Serializable

        # The time that the archiving of the virtual tape was completed. The default timestamp format is in
        # the ISO8601 extended YYYY-MM-DD'T'HH:MM:SS'Z' format.

        @[JSON::Field(key: "CompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_time : Time?


        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The time that the tape entered the custom tape pool. The default timestamp format is in the ISO8601
        # extended YYYY-MM-DD'T'HH:MM:SS'Z' format.

        @[JSON::Field(key: "PoolEntryDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter pool_entry_date : Time?

        # The ID of the pool that was used to archive the tape. The tapes in this pool are archived in the S3
        # storage class that is associated with the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # If the archived tape is subject to tape retention lock, the date that the archived tape started
        # being retained.

        @[JSON::Field(key: "RetentionStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter retention_start_date : Time?

        # The Amazon Resource Name (ARN) of the tape gateway that the virtual tape is being retrieved to. The
        # virtual tape is retrieved from the virtual tape shelf (VTS).

        @[JSON::Field(key: "RetrievedTo")]
        getter retrieved_to : String?

        # The Amazon Resource Name (ARN) of an archived virtual tape.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        # The barcode that identifies the archived virtual tape.

        @[JSON::Field(key: "TapeBarcode")]
        getter tape_barcode : String?

        # The date the virtual tape was created.

        @[JSON::Field(key: "TapeCreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter tape_created_date : Time?

        # The size, in bytes, of the archived virtual tape.

        @[JSON::Field(key: "TapeSizeInBytes")]
        getter tape_size_in_bytes : Int64?

        # The current state of the archived virtual tape.

        @[JSON::Field(key: "TapeStatus")]
        getter tape_status : String?

        # The size, in bytes, of data stored on the virtual tape. This value is not available for tapes
        # created prior to May 13, 2015.

        @[JSON::Field(key: "TapeUsedInBytes")]
        getter tape_used_in_bytes : Int64?

        # Set to true if the archived tape is stored as write-once-read-many (WORM).

        @[JSON::Field(key: "Worm")]
        getter worm : Bool?

        def initialize(
          @completion_time : Time? = nil,
          @kms_key : String? = nil,
          @pool_entry_date : Time? = nil,
          @pool_id : String? = nil,
          @retention_start_date : Time? = nil,
          @retrieved_to : String? = nil,
          @tape_arn : String? = nil,
          @tape_barcode : String? = nil,
          @tape_created_date : Time? = nil,
          @tape_size_in_bytes : Int64? = nil,
          @tape_status : String? = nil,
          @tape_used_in_bytes : Int64? = nil,
          @worm : Bool? = nil
        )
        end
      end

      # Describes a virtual tape.

      struct TapeInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.

        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The date that the tape entered the custom tape pool with tape retention lock enabled.

        @[JSON::Field(key: "PoolEntryDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter pool_entry_date : Time?

        # The ID of the pool that you want to add your tape to for archiving. The tape in this pool is
        # archived in the S3 storage class that is associated with the pool. When you use your backup
        # application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or
        # S3 Glacier Deep Archive) that corresponds to the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # The date that the tape became subject to tape retention lock.

        @[JSON::Field(key: "RetentionStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter retention_start_date : Time?

        # The Amazon Resource Name (ARN) of a virtual tape.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        # The barcode that identifies a specific virtual tape.

        @[JSON::Field(key: "TapeBarcode")]
        getter tape_barcode : String?

        # The size, in bytes, of a virtual tape.

        @[JSON::Field(key: "TapeSizeInBytes")]
        getter tape_size_in_bytes : Int64?

        # The status of the tape.

        @[JSON::Field(key: "TapeStatus")]
        getter tape_status : String?

        def initialize(
          @gateway_arn : String? = nil,
          @pool_entry_date : Time? = nil,
          @pool_id : String? = nil,
          @retention_start_date : Time? = nil,
          @tape_arn : String? = nil,
          @tape_barcode : String? = nil,
          @tape_size_in_bytes : Int64? = nil,
          @tape_status : String? = nil
        )
        end
      end

      # Describes a recovery point.

      struct TapeRecoveryPointInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the virtual tape.

        @[JSON::Field(key: "TapeARN")]
        getter tape_arn : String?

        # The time when the point-in-time view of the virtual tape was replicated for later recovery. The
        # default timestamp format of the tape recovery point time is in the ISO8601 extended
        # YYYY-MM-DD'T'HH:MM:SS'Z' format.

        @[JSON::Field(key: "TapeRecoveryPointTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter tape_recovery_point_time : Time?

        # The size, in bytes, of the virtual tapes to recover.

        @[JSON::Field(key: "TapeSizeInBytes")]
        getter tape_size_in_bytes : Int64?

        # The status of the virtual tapes.

        @[JSON::Field(key: "TapeStatus")]
        getter tape_status : String?

        def initialize(
          @tape_arn : String? = nil,
          @tape_recovery_point_time : Time? = nil,
          @tape_size_in_bytes : Int64? = nil,
          @tape_status : String? = nil
        )
        end
      end


      struct UpdateAutomaticTapeCreationPolicyInput
        include JSON::Serializable

        # An automatic tape creation policy consists of a list of automatic tape creation rules. The rules
        # determine when and how to automatically create new tapes.

        @[JSON::Field(key: "AutomaticTapeCreationRules")]
        getter automatic_tape_creation_rules : Array(Types::AutomaticTapeCreationRule)


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @automatic_tape_creation_rules : Array(Types::AutomaticTapeCreationRule),
          @gateway_arn : String
        )
        end
      end


      struct UpdateAutomaticTapeCreationPolicyOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A JSON object containing one or more of the following fields:
      # UpdateBandwidthRateLimitInput$AverageDownloadRateLimitInBitsPerSec
      # UpdateBandwidthRateLimitInput$AverageUploadRateLimitInBitsPerSec

      struct UpdateBandwidthRateLimitInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The average download bandwidth rate limit in bits per second.

        @[JSON::Field(key: "AverageDownloadRateLimitInBitsPerSec")]
        getter average_download_rate_limit_in_bits_per_sec : Int64?

        # The average upload bandwidth rate limit in bits per second.

        @[JSON::Field(key: "AverageUploadRateLimitInBitsPerSec")]
        getter average_upload_rate_limit_in_bits_per_sec : Int64?

        def initialize(
          @gateway_arn : String,
          @average_download_rate_limit_in_bits_per_sec : Int64? = nil,
          @average_upload_rate_limit_in_bits_per_sec : Int64? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway whose throttle information
      # was updated.

      struct UpdateBandwidthRateLimitOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct UpdateBandwidthRateLimitScheduleInput
        include JSON::Serializable

        # An array containing bandwidth rate limit schedule intervals for a gateway. When no bandwidth rate
        # limit intervals have been scheduled, the array is empty.

        @[JSON::Field(key: "BandwidthRateLimitIntervals")]
        getter bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval)


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval),
          @gateway_arn : String
        )
        end
      end


      struct UpdateBandwidthRateLimitScheduleOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A JSON object containing one or more of the following fields:
      # UpdateChapCredentialsInput$InitiatorName UpdateChapCredentialsInput$SecretToAuthenticateInitiator
      # UpdateChapCredentialsInput$SecretToAuthenticateTarget UpdateChapCredentialsInput$TargetARN

      struct UpdateChapCredentialsInput
        include JSON::Serializable

        # The iSCSI initiator that connects to the target.

        @[JSON::Field(key: "InitiatorName")]
        getter initiator_name : String

        # The secret key that the initiator (for example, the Windows client) must provide to participate in
        # mutual CHAP with the target. The secret key must be between 12 and 16 bytes when encoded in UTF-8.

        @[JSON::Field(key: "SecretToAuthenticateInitiator")]
        getter secret_to_authenticate_initiator : String

        # The Amazon Resource Name (ARN) of the iSCSI volume target. Use the DescribeStorediSCSIVolumes
        # operation to return the TargetARN for specified VolumeARN.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String

        # The secret key that the target must provide to participate in mutual CHAP with the initiator (e.g.
        # Windows client). Byte constraints: Minimum bytes of 12. Maximum bytes of 16. The secret key must be
        # between 12 and 16 bytes when encoded in UTF-8.

        @[JSON::Field(key: "SecretToAuthenticateTarget")]
        getter secret_to_authenticate_target : String?

        def initialize(
          @initiator_name : String,
          @secret_to_authenticate_initiator : String,
          @target_arn : String,
          @secret_to_authenticate_target : String? = nil
        )
        end
      end

      # A JSON object containing the following fields:

      struct UpdateChapCredentialsOutput
        include JSON::Serializable

        # The iSCSI initiator that connects to the target. This is the same initiator name specified in the
        # request.

        @[JSON::Field(key: "InitiatorName")]
        getter initiator_name : String?

        # The Amazon Resource Name (ARN) of the target. This is the same target specified in the request.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String?

        def initialize(
          @initiator_name : String? = nil,
          @target_arn : String? = nil
        )
        end
      end


      struct UpdateFileSystemAssociationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the file system association that you want to update.

        @[JSON::Field(key: "FileSystemAssociationARN")]
        getter file_system_association_arn : String

        # The Amazon Resource Name (ARN) of the storage used for the audit logs.

        @[JSON::Field(key: "AuditDestinationARN")]
        getter audit_destination_arn : String?


        @[JSON::Field(key: "CacheAttributes")]
        getter cache_attributes : Types::CacheAttributes?

        # The password of the user credential.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The user name of the user credential that has permission to access the root share D$ of the Amazon
        # FSx file system. The user account must belong to the Amazon FSx delegated admin user group.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @file_system_association_arn : String,
          @audit_destination_arn : String? = nil,
          @cache_attributes : Types::CacheAttributes? = nil,
          @password : String? = nil,
          @user_name : String? = nil
        )
        end
      end


      struct UpdateFileSystemAssociationOutput
        include JSON::Serializable

        # The ARN of the updated file system association.

        @[JSON::Field(key: "FileSystemAssociationARN")]
        getter file_system_association_arn : String?

        def initialize(
          @file_system_association_arn : String? = nil
        )
        end
      end


      struct UpdateGatewayInformationInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that you want to use to monitor
        # and log events in the gateway. For more information, see What is Amazon CloudWatch Logs?

        @[JSON::Field(key: "CloudWatchLogGroupARN")]
        getter cloud_watch_log_group_arn : String?

        # Specifies the size of the gateway's metadata cache. This setting impacts gateway performance and
        # hardware recommendations. For more information, see Performance guidance for gateways with multiple
        # file shares in the Amazon S3 File Gateway User Guide .

        @[JSON::Field(key: "GatewayCapacity")]
        getter gateway_capacity : String?


        @[JSON::Field(key: "GatewayName")]
        getter gateway_name : String?

        # A value that indicates the time zone of the gateway.

        @[JSON::Field(key: "GatewayTimezone")]
        getter gateway_timezone : String?

        def initialize(
          @gateway_arn : String,
          @cloud_watch_log_group_arn : String? = nil,
          @gateway_capacity : String? = nil,
          @gateway_name : String? = nil,
          @gateway_timezone : String? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway that was updated.

      struct UpdateGatewayInformationOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The name you configured for your gateway.

        @[JSON::Field(key: "GatewayName")]
        getter gateway_name : String?

        def initialize(
          @gateway_arn : String? = nil,
          @gateway_name : String? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway to update.

      struct UpdateGatewaySoftwareNowInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway that was updated.

      struct UpdateGatewaySoftwareNowOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A JSON object containing the following fields:
      # UpdateMaintenanceStartTimeInput$SoftwareUpdatePreferences UpdateMaintenanceStartTimeInput$DayOfMonth
      # UpdateMaintenanceStartTimeInput$DayOfWeek UpdateMaintenanceStartTimeInput$HourOfDay
      # UpdateMaintenanceStartTimeInput$MinuteOfHour

      struct UpdateMaintenanceStartTimeInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # The day of the month component of the maintenance start time represented as an ordinal number from 1
        # to 28, where 1 represents the first day of the month. It is not possible to set the maintenance
        # schedule to start on days 29 through 31.

        @[JSON::Field(key: "DayOfMonth")]
        getter day_of_month : Int32?

        # The day of the week component of the maintenance start time week represented as an ordinal number
        # from 0 to 6, where 0 represents Sunday and 6 represents Saturday.

        @[JSON::Field(key: "DayOfWeek")]
        getter day_of_week : Int32?

        # The hour component of the maintenance start time represented as hh , where hh is the hour (00 to
        # 23). The hour of the day is in the time zone of the gateway.

        @[JSON::Field(key: "HourOfDay")]
        getter hour_of_day : Int32?

        # The minute component of the maintenance start time represented as mm , where mm is the minute (00 to
        # 59). The minute of the hour is in the time zone of the gateway.

        @[JSON::Field(key: "MinuteOfHour")]
        getter minute_of_hour : Int32?

        # A set of variables indicating the software update preferences for the gateway. Includes
        # AutomaticUpdatePolicy field with the following inputs: ALL_VERSIONS - Enables regular gateway
        # maintenance updates. EMERGENCY_VERSIONS_ONLY - Disables regular gateway maintenance updates. The
        # gateway will still receive emergency version updates on rare occasions if necessary to remedy highly
        # critical security or durability issues. You will be notified before an emergency version update is
        # applied. These updates are applied during your gateway's scheduled maintenance window.

        @[JSON::Field(key: "SoftwareUpdatePreferences")]
        getter software_update_preferences : Types::SoftwareUpdatePreferences?

        def initialize(
          @gateway_arn : String,
          @day_of_month : Int32? = nil,
          @day_of_week : Int32? = nil,
          @hour_of_day : Int32? = nil,
          @minute_of_hour : Int32? = nil,
          @software_update_preferences : Types::SoftwareUpdatePreferences? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the gateway whose maintenance start time
      # is updated.

      struct UpdateMaintenanceStartTimeOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # UpdateNFSFileShareInput

      struct UpdateNFSFileShareInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the file share to be updated.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String

        # The Amazon Resource Name (ARN) of the storage used for audit logs.

        @[JSON::Field(key: "AuditDestinationARN")]
        getter audit_destination_arn : String?

        # Specifies refresh cache information for the file share.

        @[JSON::Field(key: "CacheAttributes")]
        getter cache_attributes : Types::CacheAttributes?

        # The list of clients that are allowed to access the S3 File Gateway. The list must contain either
        # valid IPv4/IPv6 addresses or valid CIDR blocks.

        @[JSON::Field(key: "ClientList")]
        getter client_list : Array(String)?

        # The default storage class for objects put into an Amazon S3 bucket by the S3 File Gateway. The
        # default value is S3_STANDARD . Optional. Valid Values: S3_STANDARD | S3_INTELLIGENT_TIERING |
        # S3_STANDARD_IA | S3_ONEZONE_IA

        @[JSON::Field(key: "DefaultStorageClass")]
        getter default_storage_class : String?

        # A value that specifies the type of server-side encryption that the file share will use for the data
        # that it stores in Amazon S3. We recommend using EncryptionType instead of KMSEncrypted to set the
        # file share encryption method. You do not need to provide values for both parameters. If values for
        # both parameters exist in the same request, then the specified encryption methods must not conflict.
        # For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If EncryptionType is
        # SseKms or DsseKms , then KMSEncrypted must be true .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        # The name of the file share. Optional. FileShareName must be set if an S3 prefix name is set in
        # LocationARN , or if an access point or access point alias is used. A valid NFS file share name can
        # only contain the following characters: a - z , A - Z , 0 - 9 , - , . , and _ .

        @[JSON::Field(key: "FileShareName")]
        getter file_share_name : String?

        # A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set
        # this value to true to enable MIME type guessing, otherwise set to false . The default value is true
        # . Valid Values: true | false

        @[JSON::Field(key: "GuessMIMETypeEnabled")]
        getter guess_mime_type_enabled : Bool?

        # Optional. Set to true to use Amazon S3 server-side encryption with your own KMS key (SSE-KMS), or
        # false to use a key managed by Amazon S3 (SSE-S3). To use dual-layer encryption (DSSE-KMS), set the
        # EncryptionType parameter instead. We recommend using EncryptionType instead of KMSEncrypted to set
        # the file share encryption method. You do not need to provide values for both parameters. If values
        # for both parameters exist in the same request, then the specified encryption methods must not
        # conflict. For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If
        # EncryptionType is SseKms or DsseKms , then KMSEncrypted must be true . Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?

        # Optional. The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3
        # server-side encryption. Storage Gateway does not support asymmetric CMKs. This value must be set if
        # KMSEncrypted is true , or if EncryptionType is SseKms or DsseKms .

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The default values for the file share. Optional.

        @[JSON::Field(key: "NFSFileShareDefaults")]
        getter nfs_file_share_defaults : Types::NFSFileShareDefaults?

        # The notification policy of the file share. SettlingTimeInSeconds controls the number of seconds to
        # wait after the last point in time a client wrote to a file before generating an ObjectUploaded
        # notification. Because clients can make many small writes to files, it's best to set this parameter
        # for as long as possible to avoid generating multiple notifications for the same file in a small time
        # period. SettlingTimeInSeconds has no effect on the timing of the object uploading to Amazon S3, only
        # the timing of the notification. This setting is not meant to specify an exact time at which the
        # notification will be sent. In some cases, the gateway might require more than the specified delay
        # time to generate and send notifications. The following example sets NotificationPolicy on with
        # SettlingTimeInSeconds set to 60. {\"Upload\": {\"SettlingTimeInSeconds\": 60}} The following example
        # sets NotificationPolicy off. {}

        @[JSON::Field(key: "NotificationPolicy")]
        getter notification_policy : String?

        # A value that sets the access control list (ACL) permission for objects in the S3 bucket that a S3
        # File Gateway puts objects into. The default value is private .

        @[JSON::Field(key: "ObjectACL")]
        getter object_acl : String?

        # A value that sets the write status of a file share. Set this value to true to set the write status
        # to read-only, otherwise set to false . Valid Values: true | false

        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # A value that sets who pays the cost of the request and the cost associated with data download from
        # the S3 bucket. If this value is set to true , the requester pays the costs; otherwise, the S3 bucket
        # owner pays. However, the S3 bucket owner always pays the cost of storing data. RequesterPays is a
        # configuration for the S3 bucket that backs the file share, so make sure that the configuration on
        # the file share is the same as the S3 bucket configuration. Valid Values: true | false

        @[JSON::Field(key: "RequesterPays")]
        getter requester_pays : Bool?

        # The user mapped to anonymous user. Valid values are the following: RootSquash : Only root is mapped
        # to anonymous user. NoSquash : No one is mapped to anonymous user. AllSquash : Everyone is mapped to
        # anonymous user.

        @[JSON::Field(key: "Squash")]
        getter squash : String?

        def initialize(
          @file_share_arn : String,
          @audit_destination_arn : String? = nil,
          @cache_attributes : Types::CacheAttributes? = nil,
          @client_list : Array(String)? = nil,
          @default_storage_class : String? = nil,
          @encryption_type : String? = nil,
          @file_share_name : String? = nil,
          @guess_mime_type_enabled : Bool? = nil,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @nfs_file_share_defaults : Types::NFSFileShareDefaults? = nil,
          @notification_policy : String? = nil,
          @object_acl : String? = nil,
          @read_only : Bool? = nil,
          @requester_pays : Bool? = nil,
          @squash : String? = nil
        )
        end
      end

      # UpdateNFSFileShareOutput

      struct UpdateNFSFileShareOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated file share.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?

        def initialize(
          @file_share_arn : String? = nil
        )
        end
      end

      # UpdateSMBFileShareInput

      struct UpdateSMBFileShareInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SMB file share that you want to update.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String

        # The files and folders on this share will only be visible to users with read access.

        @[JSON::Field(key: "AccessBasedEnumeration")]
        getter access_based_enumeration : Bool?

        # A list of users or groups in the Active Directory that have administrator rights to the file share.
        # A group must be prefixed with the @ character. Acceptable formats include: DOMAIN\User1 , user1 ,
        # @group1 , and @DOMAIN\group1 . Can only be set if Authentication is set to ActiveDirectory .

        @[JSON::Field(key: "AdminUserList")]
        getter admin_user_list : Array(String)?

        # The Amazon Resource Name (ARN) of the storage used for audit logs.

        @[JSON::Field(key: "AuditDestinationARN")]
        getter audit_destination_arn : String?

        # Specifies refresh cache information for the file share.

        @[JSON::Field(key: "CacheAttributes")]
        getter cache_attributes : Types::CacheAttributes?

        # The case of an object name in an Amazon S3 bucket. For ClientSpecified , the client determines the
        # case sensitivity. For CaseSensitive , the gateway determines the case sensitivity. The default value
        # is ClientSpecified .

        @[JSON::Field(key: "CaseSensitivity")]
        getter case_sensitivity : String?

        # The default storage class for objects put into an Amazon S3 bucket by the S3 File Gateway. The
        # default value is S3_STANDARD . Optional. Valid Values: S3_STANDARD | S3_INTELLIGENT_TIERING |
        # S3_STANDARD_IA | S3_ONEZONE_IA

        @[JSON::Field(key: "DefaultStorageClass")]
        getter default_storage_class : String?

        # A value that specifies the type of server-side encryption that the file share will use for the data
        # that it stores in Amazon S3. We recommend using EncryptionType instead of KMSEncrypted to set the
        # file share encryption method. You do not need to provide values for both parameters. If values for
        # both parameters exist in the same request, then the specified encryption methods must not conflict.
        # For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If EncryptionType is
        # SseKms or DsseKms , then KMSEncrypted must be true .

        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        # The name of the file share. Optional. FileShareName must be set if an S3 prefix name is set in
        # LocationARN , or if an access point or access point alias is used. A valid SMB file share name
        # cannot contain the following characters: [ , ] , # , ; , &lt; , &gt; , : , " , \ , / , | , ? , * , +
        # , or ASCII control characters 1-31 .

        @[JSON::Field(key: "FileShareName")]
        getter file_share_name : String?

        # A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set
        # this value to true to enable MIME type guessing, otherwise set to false . The default value is true
        # . Valid Values: true | false

        @[JSON::Field(key: "GuessMIMETypeEnabled")]
        getter guess_mime_type_enabled : Bool?

        # A list of users or groups in the Active Directory that are not allowed to access the file share. A
        # group must be prefixed with the @ character. Acceptable formats include: DOMAIN\User1 , user1 ,
        # @group1 , and @DOMAIN\group1 . Can only be set if Authentication is set to ActiveDirectory .

        @[JSON::Field(key: "InvalidUserList")]
        getter invalid_user_list : Array(String)?

        # Optional. Set to true to use Amazon S3 server-side encryption with your own KMS key (SSE-KMS), or
        # false to use a key managed by Amazon S3 (SSE-S3). To use dual-layer encryption (DSSE-KMS), set the
        # EncryptionType parameter instead. We recommend using EncryptionType instead of KMSEncrypted to set
        # the file share encryption method. You do not need to provide values for both parameters. If values
        # for both parameters exist in the same request, then the specified encryption methods must not
        # conflict. For example, if EncryptionType is SseS3 , then KMSEncrypted must be false . If
        # EncryptionType is SseKms or DsseKms , then KMSEncrypted must be true . Valid Values: true | false

        @[JSON::Field(key: "KMSEncrypted")]
        getter kms_encrypted : Bool?

        # Optional. The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3
        # server-side encryption. Storage Gateway does not support asymmetric CMKs. This value must be set if
        # KMSEncrypted is true , or if EncryptionType is SseKms or DsseKms .

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The notification policy of the file share. SettlingTimeInSeconds controls the number of seconds to
        # wait after the last point in time a client wrote to a file before generating an ObjectUploaded
        # notification. Because clients can make many small writes to files, it's best to set this parameter
        # for as long as possible to avoid generating multiple notifications for the same file in a small time
        # period. SettlingTimeInSeconds has no effect on the timing of the object uploading to Amazon S3, only
        # the timing of the notification. This setting is not meant to specify an exact time at which the
        # notification will be sent. In some cases, the gateway might require more than the specified delay
        # time to generate and send notifications. The following example sets NotificationPolicy on with
        # SettlingTimeInSeconds set to 60. {\"Upload\": {\"SettlingTimeInSeconds\": 60}} The following example
        # sets NotificationPolicy off. {}

        @[JSON::Field(key: "NotificationPolicy")]
        getter notification_policy : String?

        # A value that sets the access control list (ACL) permission for objects in the S3 bucket that a S3
        # File Gateway puts objects into. The default value is private .

        @[JSON::Field(key: "ObjectACL")]
        getter object_acl : String?

        # Specifies whether opportunistic locking is enabled for the SMB file share. Enabling opportunistic
        # locking on case-sensitive shares is not recommended for workloads that involve access to files with
        # the same name in different case. Valid Values: true | false

        @[JSON::Field(key: "OplocksEnabled")]
        getter oplocks_enabled : Bool?

        # A value that sets the write status of a file share. Set this value to true to set write status to
        # read-only, otherwise set to false . Valid Values: true | false

        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # A value that sets who pays the cost of the request and the cost associated with data download from
        # the S3 bucket. If this value is set to true , the requester pays the costs; otherwise, the S3 bucket
        # owner pays. However, the S3 bucket owner always pays the cost of storing data. RequesterPays is a
        # configuration for the S3 bucket that backs the file share, so make sure that the configuration on
        # the file share is the same as the S3 bucket configuration. Valid Values: true | false

        @[JSON::Field(key: "RequesterPays")]
        getter requester_pays : Bool?

        # Set this value to true to enable access control list (ACL) on the SMB file share. Set it to false to
        # map file and directory permissions to the POSIX permissions. For more information, see Using Windows
        # ACLs to limit SMB file share access in the Amazon S3 File Gateway User Guide . Valid Values: true |
        # false

        @[JSON::Field(key: "SMBACLEnabled")]
        getter smbacl_enabled : Bool?

        # A list of users or groups in the Active Directory that are allowed to access the file share. A group
        # must be prefixed with the @ character. Acceptable formats include: DOMAIN\User1 , user1 , @group1 ,
        # and @DOMAIN\group1 . Can only be set if Authentication is set to ActiveDirectory .

        @[JSON::Field(key: "ValidUserList")]
        getter valid_user_list : Array(String)?

        def initialize(
          @file_share_arn : String,
          @access_based_enumeration : Bool? = nil,
          @admin_user_list : Array(String)? = nil,
          @audit_destination_arn : String? = nil,
          @cache_attributes : Types::CacheAttributes? = nil,
          @case_sensitivity : String? = nil,
          @default_storage_class : String? = nil,
          @encryption_type : String? = nil,
          @file_share_name : String? = nil,
          @guess_mime_type_enabled : Bool? = nil,
          @invalid_user_list : Array(String)? = nil,
          @kms_encrypted : Bool? = nil,
          @kms_key : String? = nil,
          @notification_policy : String? = nil,
          @object_acl : String? = nil,
          @oplocks_enabled : Bool? = nil,
          @read_only : Bool? = nil,
          @requester_pays : Bool? = nil,
          @smbacl_enabled : Bool? = nil,
          @valid_user_list : Array(String)? = nil
        )
        end
      end

      # UpdateSMBFileShareOutput

      struct UpdateSMBFileShareOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated SMB file share.

        @[JSON::Field(key: "FileShareARN")]
        getter file_share_arn : String?

        def initialize(
          @file_share_arn : String? = nil
        )
        end
      end


      struct UpdateSMBFileShareVisibilityInput
        include JSON::Serializable

        # The shares on this gateway appear when listing shares.

        @[JSON::Field(key: "FileSharesVisible")]
        getter file_shares_visible : Bool


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        def initialize(
          @file_shares_visible : Bool,
          @gateway_arn : String
        )
        end
      end


      struct UpdateSMBFileShareVisibilityOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct UpdateSMBLocalGroupsInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # A list of Active Directory users and groups that you want to grant special permissions for SMB file
        # shares on the gateway.

        @[JSON::Field(key: "SMBLocalGroups")]
        getter smb_local_groups : Types::SMBLocalGroups

        def initialize(
          @gateway_arn : String,
          @smb_local_groups : Types::SMBLocalGroups
        )
        end
      end


      struct UpdateSMBLocalGroupsOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end


      struct UpdateSMBSecurityStrategyInput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String

        # Specifies the type of security strategy. ClientSpecified : If you choose this option, requests are
        # established based on what is negotiated by the client. This option is recommended when you want to
        # maximize compatibility across different clients in your environment. Supported only for S3 File
        # Gateway. MandatorySigning : If you choose this option, File Gateway only allows connections from
        # SMBv2 or SMBv3 clients that have signing enabled. This option works with SMB clients on Microsoft
        # Windows Vista, Windows Server 2008 or newer. MandatoryEncryption : If you choose this option, File
        # Gateway only allows connections from SMBv3 clients that have encryption enabled. This option is
        # recommended for environments that handle sensitive data. This option works with SMB clients on
        # Microsoft Windows 8, Windows Server 2012 or newer. MandatoryEncryptionNoAes128 : If you choose this
        # option, File Gateway only allows connections from SMBv3 clients that use 256-bit AES encryption
        # algorithms. 128-bit algorithms are not allowed. This option is recommended for environments that
        # handle sensitive data. It works with SMB clients on Microsoft Windows 8, Windows Server 2012, or
        # later.

        @[JSON::Field(key: "SMBSecurityStrategy")]
        getter smb_security_strategy : String

        def initialize(
          @gateway_arn : String,
          @smb_security_strategy : String
        )
        end
      end


      struct UpdateSMBSecurityStrategyOutput
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A JSON object containing one or more of the following fields:
      # UpdateSnapshotScheduleInput$Description UpdateSnapshotScheduleInput$RecurrenceInHours
      # UpdateSnapshotScheduleInput$StartAt UpdateSnapshotScheduleInput$VolumeARN

      struct UpdateSnapshotScheduleInput
        include JSON::Serializable

        # Frequency of snapshots. Specify the number of hours between snapshots.

        @[JSON::Field(key: "RecurrenceInHours")]
        getter recurrence_in_hours : Int32

        # The hour of the day at which the snapshot schedule begins represented as hh , where hh is the hour
        # (0 to 23). The hour of the day is in the time zone of the gateway.

        @[JSON::Field(key: "StartAt")]
        getter start_at : Int32

        # The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of
        # gateway volumes.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String

        # Optional description of the snapshot that overwrites the existing description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair. Valid
        # characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the
        # following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters,
        # and the maximum length for a tag's value is 256.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @recurrence_in_hours : Int32,
          @start_at : Int32,
          @volume_arn : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A JSON object containing the Amazon Resource Name (ARN) of the updated storage volume.

      struct UpdateSnapshotScheduleOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of
        # gateway volumes.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        def initialize(
          @volume_arn : String? = nil
        )
        end
      end


      struct UpdateVTLDeviceTypeInput
        include JSON::Serializable

        # The type of medium changer you want to select. Valid Values: STK-L700 | AWS-Gateway-VTL |
        # IBM-03584L32-0402

        @[JSON::Field(key: "DeviceType")]
        getter device_type : String

        # The Amazon Resource Name (ARN) of the medium changer you want to select.

        @[JSON::Field(key: "VTLDeviceARN")]
        getter vtl_device_arn : String

        def initialize(
          @device_type : String,
          @vtl_device_arn : String
        )
        end
      end

      # UpdateVTLDeviceTypeOutput

      struct UpdateVTLDeviceTypeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the medium changer you have selected.

        @[JSON::Field(key: "VTLDeviceARN")]
        getter vtl_device_arn : String?

        def initialize(
          @vtl_device_arn : String? = nil
        )
        end
      end

      # Represents a device object associated with a tape gateway.

      struct VTLDevice
        include JSON::Serializable

        # A list of iSCSI information about a VTL device.

        @[JSON::Field(key: "DeviceiSCSIAttributes")]
        getter devicei_scsi_attributes : Types::DeviceiSCSIAttributes?

        # Specifies the unique Amazon Resource Name (ARN) of the device (tape drive or media changer).

        @[JSON::Field(key: "VTLDeviceARN")]
        getter vtl_device_arn : String?

        # Specifies the model number of device that the VTL device emulates.

        @[JSON::Field(key: "VTLDeviceProductIdentifier")]
        getter vtl_device_product_identifier : String?

        # Specifies the type of device that the VTL device emulates.

        @[JSON::Field(key: "VTLDeviceType")]
        getter vtl_device_type : String?

        # Specifies the vendor of the device that the VTL device object emulates.

        @[JSON::Field(key: "VTLDeviceVendor")]
        getter vtl_device_vendor : String?

        def initialize(
          @devicei_scsi_attributes : Types::DeviceiSCSIAttributes? = nil,
          @vtl_device_arn : String? = nil,
          @vtl_device_product_identifier : String? = nil,
          @vtl_device_type : String? = nil,
          @vtl_device_vendor : String? = nil
        )
        end
      end

      # Describes a storage volume object.

      struct VolumeInfo
        include JSON::Serializable


        @[JSON::Field(key: "GatewayARN")]
        getter gateway_arn : String?

        # The unique identifier assigned to your gateway during activation. This ID becomes part of the
        # gateway Amazon Resource Name (ARN), which you use as input for other operations. Valid Values: 50 to
        # 500 lowercase letters, numbers, periods (.), and hyphens (-).

        @[JSON::Field(key: "GatewayId")]
        getter gateway_id : String?

        # The Amazon Resource Name (ARN) for the storage volume. For example, the following is a valid ARN:
        # arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABB Valid Values:
        # 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        # One of the VolumeStatus values that indicates the state of the storage volume.

        @[JSON::Field(key: "VolumeAttachmentStatus")]
        getter volume_attachment_status : String?

        # The unique identifier assigned to the volume. This ID becomes part of the volume Amazon Resource
        # Name (ARN), which you use as input for other operations. Valid Values: 50 to 500 lowercase letters,
        # numbers, periods (.), and hyphens (-).

        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        # The size of the volume in bytes. Valid Values: 50 to 500 lowercase letters, numbers, periods (.),
        # and hyphens (-).

        @[JSON::Field(key: "VolumeSizeInBytes")]
        getter volume_size_in_bytes : Int64?

        # One of the VolumeType enumeration values describing the type of the volume.

        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String?

        def initialize(
          @gateway_arn : String? = nil,
          @gateway_id : String? = nil,
          @volume_arn : String? = nil,
          @volume_attachment_status : String? = nil,
          @volume_id : String? = nil,
          @volume_size_in_bytes : Int64? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # Describes a storage volume recovery point object.

      struct VolumeRecoveryPointInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the volume target.

        @[JSON::Field(key: "VolumeARN")]
        getter volume_arn : String?

        # The time the recovery point was taken.

        @[JSON::Field(key: "VolumeRecoveryPointTime")]
        getter volume_recovery_point_time : String?

        # The size of the volume in bytes.

        @[JSON::Field(key: "VolumeSizeInBytes")]
        getter volume_size_in_bytes : Int64?

        # The size of the data stored on the volume in bytes. This value is not available for volumes created
        # prior to May 13, 2015, until you store data on the volume.

        @[JSON::Field(key: "VolumeUsageInBytes")]
        getter volume_usage_in_bytes : Int64?

        def initialize(
          @volume_arn : String? = nil,
          @volume_recovery_point_time : String? = nil,
          @volume_size_in_bytes : Int64? = nil,
          @volume_usage_in_bytes : Int64? = nil
        )
        end
      end

      # Lists iSCSI information about a volume.

      struct VolumeiSCSIAttributes
        include JSON::Serializable

        # Indicates whether mutual CHAP is enabled for the iSCSI target.

        @[JSON::Field(key: "ChapEnabled")]
        getter chap_enabled : Bool?

        # The logical disk number.

        @[JSON::Field(key: "LunNumber")]
        getter lun_number : Int32?

        # The network interface identifier.

        @[JSON::Field(key: "NetworkInterfaceId")]
        getter network_interface_id : String?

        # The port used to communicate with iSCSI targets.

        @[JSON::Field(key: "NetworkInterfacePort")]
        getter network_interface_port : Int32?

        # The Amazon Resource Name (ARN) of the volume target.

        @[JSON::Field(key: "TargetARN")]
        getter target_arn : String?

        def initialize(
          @chap_enabled : Bool? = nil,
          @lun_number : Int32? = nil,
          @network_interface_id : String? = nil,
          @network_interface_port : Int32? = nil,
          @target_arn : String? = nil
        )
        end
      end
    end
  end
end
