require "json"
require "time"

module AwsSdk
  module FSx
    module Types

      # An access point with that name already exists in the Amazon Web Services Region in your Amazon Web
      # Services account.
      struct AccessPointAlreadyOwnedByYou
        include JSON::Serializable

        # An error code indicating that an access point with that name already exists in the Amazon Web
        # Services Region in your Amazon Web Services account.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The Microsoft Active Directory attributes of the Amazon FSx for Windows File Server file system.
      struct ActiveDirectoryBackupAttributes
        include JSON::Serializable

        # The ID of the Amazon Web Services Managed Microsoft Active Directory instance to which the file
        # system is joined.
        @[JSON::Field(key: "ActiveDirectoryId")]
        getter active_directory_id : String?

        # The fully qualified domain name of the self-managed Active Directory directory.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        def initialize(
          @active_directory_id : String? = nil,
          @domain_name : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # An Active Directory error.
      struct ActiveDirectoryError
        include JSON::Serializable

        # The directory ID of the directory that an error pertains to.
        @[JSON::Field(key: "ActiveDirectoryId")]
        getter active_directory_id : String

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The type of Active Directory error.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @active_directory_id : String,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes a specific Amazon FSx administrative action for the current Windows, Lustre, OpenZFS, or
      # ONTAP file system or volume.
      struct AdministrativeAction
        include JSON::Serializable

        @[JSON::Field(key: "AdministrativeActionType")]
        getter administrative_action_type : String?

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::AdministrativeActionFailureDetails?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The percentage-complete status of a STORAGE_OPTIMIZATION or DOWNLOAD_DATA_FROM_BACKUP administrative
        # action. Does not apply to any other administrative action type.
        @[JSON::Field(key: "ProgressPercent")]
        getter progress_percent : Int32?

        # The remaining bytes to transfer for the FSx for OpenZFS snapshot that you're copying.
        @[JSON::Field(key: "RemainingTransferBytes")]
        getter remaining_transfer_bytes : Int64?

        # The time that the administrative action request was received.
        @[JSON::Field(key: "RequestTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter request_time : Time?

        # The status of the administrative action, as follows: FAILED - Amazon FSx failed to process the
        # administrative action successfully. IN_PROGRESS - Amazon FSx is processing the administrative
        # action. PENDING - Amazon FSx is waiting to process the administrative action. COMPLETED - Amazon FSx
        # has finished processing the administrative task. For a backup restore to a second-generation FSx for
        # ONTAP file system, indicates that all data has been downloaded to the volume, and clients now have
        # read-write access to volume. UPDATED_OPTIMIZING - For a storage-capacity increase update, Amazon FSx
        # has updated the file system with the new storage capacity, and is now performing the
        # storage-optimization process. PENDING - For a backup restore to a second-generation FSx for ONTAP
        # file system, indicates that the file metadata is being downloaded onto the volume. The volume's
        # Lifecycle state is CREATING. IN_PROGRESS - For a backup restore to a second-generation FSx for ONTAP
        # file system, indicates that all metadata has been downloaded to the new volume and client can access
        # data with read-only access while Amazon FSx downloads the file data to the volume. Track the
        # progress of this process with the ProgressPercent element.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The target value for the administration action, provided in the UpdateFileSystem operation. Returned
        # for FILE_SYSTEM_UPDATE administrative actions.
        @[JSON::Field(key: "TargetFileSystemValues")]
        getter target_file_system_values : Types::FileSystem?

        @[JSON::Field(key: "TargetSnapshotValues")]
        getter target_snapshot_values : Types::Snapshot?

        @[JSON::Field(key: "TargetVolumeValues")]
        getter target_volume_values : Types::Volume?

        # The number of bytes that have transferred for the FSx for OpenZFS snapshot that you're copying.
        @[JSON::Field(key: "TotalTransferBytes")]
        getter total_transfer_bytes : Int64?

        def initialize(
          @administrative_action_type : String? = nil,
          @failure_details : Types::AdministrativeActionFailureDetails? = nil,
          @message : String? = nil,
          @progress_percent : Int32? = nil,
          @remaining_transfer_bytes : Int64? = nil,
          @request_time : Time? = nil,
          @status : String? = nil,
          @target_file_system_values : Types::FileSystem? = nil,
          @target_snapshot_values : Types::Snapshot? = nil,
          @target_volume_values : Types::Volume? = nil,
          @total_transfer_bytes : Int64? = nil
        )
        end
      end

      # Provides information about a failed administrative action.
      struct AdministrativeActionFailureDetails
        include JSON::Serializable

        # Error message providing details about the failed administrative action.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Used to specify configuration options for a volume’s storage aggregate or aggregates.
      struct AggregateConfiguration
        include JSON::Serializable

        # The list of aggregates that this volume resides on. Aggregates are storage pools which make up your
        # primary storage tier. Each high-availability (HA) pair has one aggregate. The names of the
        # aggregates map to the names of the aggregates in the ONTAP CLI and REST API. For FlexVols, there
        # will always be a single entry. Amazon FSx responds with an HTTP status code 400 (Bad Request) for
        # the following conditions: The strings in the value of Aggregates are not are not formatted as aggrX
        # , where X is a number between 1 and 12. The value of Aggregates contains aggregates that are not
        # present. One or more of the aggregates supplied are too close to the volume limit to support adding
        # more volumes.
        @[JSON::Field(key: "Aggregates")]
        getter aggregates : Array(String)?

        # The total number of constituents this FlexGroup volume has. Not applicable for FlexVols.
        @[JSON::Field(key: "TotalConstituents")]
        getter total_constituents : Int32?

        def initialize(
          @aggregates : Array(String)? = nil,
          @total_constituents : Int32? = nil
        )
        end
      end

      # A DNS alias that is associated with the file system. You can use a DNS alias to access a file system
      # using user-defined DNS names, in addition to the default DNS name that Amazon FSx assigns to the
      # file system. For more information, see DNS aliases in the FSx for Windows File Server User Guide .
      struct Alias
        include JSON::Serializable

        # Describes the state of the DNS alias. AVAILABLE - The DNS alias is associated with an Amazon FSx
        # file system. CREATING - Amazon FSx is creating the DNS alias and associating it with the file
        # system. CREATE_FAILED - Amazon FSx was unable to associate the DNS alias with the file system.
        # DELETING - Amazon FSx is disassociating the DNS alias from the file system and deleting it.
        # DELETE_FAILED - Amazon FSx was unable to disassociate the DNS alias from the file system.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The name of the DNS alias. The alias name has to meet the following requirements: Formatted as a
        # fully-qualified domain name (FQDN), hostname.domain , for example, accounting.example.com . Can
        # contain alphanumeric characters, the underscore (_), and the hyphen (-). Cannot start or end with a
        # hyphen. Can start with a numeric. For DNS names, Amazon FSx stores alphabetic characters as
        # lowercase letters (a-z), regardless of how you specify them: as uppercase letters, lowercase
        # letters, or the corresponding letters in escape codes.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @lifecycle : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The request object specifying one or more DNS alias names to associate with an Amazon FSx for
      # Windows File Server file system.
      struct AssociateFileSystemAliasesRequest
        include JSON::Serializable

        # An array of one or more DNS alias names to associate with the file system. The alias name has to
        # comply with the following formatting requirements: Formatted as a fully-qualified domain name
        # (FQDN), hostname.domain , for example, accounting.corp.example.com . Can contain alphanumeric
        # characters and the hyphen (-). Cannot start or end with a hyphen. Can start with a numeric. For DNS
        # alias names, Amazon FSx stores alphabetic characters as lowercase letters (a-z), regardless of how
        # you specify them: as uppercase letters, lowercase letters, or the corresponding letters in escape
        # codes.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(String)

        # Specifies the file system with which you want to associate one or more DNS aliases.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @aliases : Array(String),
          @file_system_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      # The system generated response showing the DNS aliases that Amazon FSx is attempting to associate
      # with the file system. Use the API operation to monitor the status of the aliases Amazon FSx is
      # associating with the file system. It can take up to 2.5 minutes for the alias status to change from
      # CREATING to AVAILABLE .
      struct AssociateFileSystemAliasesResponse
        include JSON::Serializable

        # An array of the DNS aliases that Amazon FSx is associating with the file system.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(Types::Alias)?

        def initialize(
          @aliases : Array(Types::Alias)? = nil
        )
        end
      end

      # Describes a data repository association's automatic export policy. The AutoExportPolicy defines the
      # types of updated objects on the file system that will be automatically exported to the data
      # repository. As you create, modify, or delete files, Amazon FSx for Lustre automatically exports the
      # defined changes asynchronously once your application finishes modifying the file. The
      # AutoExportPolicy is only supported on Amazon FSx for Lustre file systems with a data repository
      # association.
      struct AutoExportPolicy
        include JSON::Serializable

        # The AutoExportPolicy can have the following event values: NEW - New files and directories are
        # automatically exported to the data repository as they are added to the file system. CHANGED -
        # Changes to files and directories on the file system are automatically exported to the data
        # repository. DELETED - Files and directories are automatically deleted on the data repository when
        # they are deleted on the file system. You can define any combination of event types for your
        # AutoExportPolicy .
        @[JSON::Field(key: "Events")]
        getter events : Array(String)?

        def initialize(
          @events : Array(String)? = nil
        )
        end
      end

      # Describes the data repository association's automatic import policy. The AutoImportPolicy defines
      # how Amazon FSx keeps your file metadata and directory listings up to date by importing changes to
      # your Amazon FSx for Lustre file system as you modify objects in a linked S3 bucket. The
      # AutoImportPolicy is only supported on Amazon FSx for Lustre file systems with a data repository
      # association.
      struct AutoImportPolicy
        include JSON::Serializable

        # The AutoImportPolicy can have the following event values: NEW - Amazon FSx automatically imports
        # metadata of files added to the linked S3 bucket that do not currently exist in the FSx file system.
        # CHANGED - Amazon FSx automatically updates file metadata and invalidates existing file content on
        # the file system as files change in the data repository. DELETED - Amazon FSx automatically deletes
        # files on the file system as corresponding files are deleted in the data repository. You can define
        # any combination of event types for your AutoImportPolicy .
        @[JSON::Field(key: "Events")]
        getter events : Array(String)?

        def initialize(
          @events : Array(String)? = nil
        )
        end
      end

      # Sets the autocommit period of files in an FSx for ONTAP SnapLock volume, which determines how long
      # the files must remain unmodified before they're automatically transitioned to the write once, read
      # many (WORM) state. For more information, see Autocommit .
      struct AutocommitPeriod
        include JSON::Serializable

        # Defines the type of time for the autocommit period of a file in an FSx for ONTAP SnapLock volume.
        # Setting this value to NONE disables autocommit. The default value is NONE .
        @[JSON::Field(key: "Type")]
        getter type : String

        # Defines the amount of time for the autocommit period of a file in an FSx for ONTAP SnapLock volume.
        # The following ranges are valid: Minutes : 5 - 65,535 Hours : 1 - 65,535 Days : 1 - 3,650 Months : 1
        # - 120 Years : 1 - 10
        @[JSON::Field(key: "Value")]
        getter value : Int32?

        def initialize(
          @type : String,
          @value : Int32? = nil
        )
        end
      end

      # A backup of an Amazon FSx for Windows File Server, Amazon FSx for Lustre file system, Amazon FSx for
      # NetApp ONTAP volume, or Amazon FSx for OpenZFS file system.
      struct Backup
        include JSON::Serializable

        # The ID of the backup.
        @[JSON::Field(key: "BackupId")]
        getter backup_id : String

        # The time when a particular backup was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The metadata of the file system associated with the backup. This metadata is persisted even if the
        # file system is deleted.
        @[JSON::Field(key: "FileSystem")]
        getter file_system : Types::FileSystem

        # The lifecycle status of the backup. AVAILABLE - The backup is fully available. PENDING - For
        # user-initiated backups on Lustre file systems only; Amazon FSx hasn't started creating the backup.
        # CREATING - Amazon FSx is creating the backup. TRANSFERRING - For user-initiated backups on Lustre
        # file systems only; Amazon FSx is transferring the backup to Amazon S3. COPYING - Amazon FSx is
        # copying the backup. DELETED - Amazon FSx deleted the backup and it's no longer available. FAILED -
        # Amazon FSx couldn't finish the backup.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String

        # The type of the file-system backup.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The configuration of the self-managed Microsoft Active Directory directory to which the Windows File
        # Server instance is joined.
        @[JSON::Field(key: "DirectoryInformation")]
        getter directory_information : Types::ActiveDirectoryBackupAttributes?

        # Details explaining any failures that occurred when creating a backup.
        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::BackupFailureDetails?

        # The ID of the Key Management Service (KMS) key used to encrypt the backup of the Amazon FSx file
        # system's data at rest.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        @[JSON::Field(key: "ProgressPercent")]
        getter progress_percent : Int32?

        # The Amazon Resource Name (ARN) for the backup resource.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # Specifies the resource type that's backed up.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The size of the backup in bytes. This represents the amount of data that the file system would
        # contain if you restore this backup.
        @[JSON::Field(key: "SizeInBytes")]
        getter size_in_bytes : Int64?

        @[JSON::Field(key: "SourceBackupId")]
        getter source_backup_id : String?

        # The source Region of the backup. Specifies the Region from where this backup is copied.
        @[JSON::Field(key: "SourceBackupRegion")]
        getter source_backup_region : String?

        # The tags associated with a particular file system.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        @[JSON::Field(key: "Volume")]
        getter volume : Types::Volume?

        def initialize(
          @backup_id : String,
          @creation_time : Time,
          @file_system : Types::FileSystem,
          @lifecycle : String,
          @type : String,
          @directory_information : Types::ActiveDirectoryBackupAttributes? = nil,
          @failure_details : Types::BackupFailureDetails? = nil,
          @kms_key_id : String? = nil,
          @owner_id : String? = nil,
          @progress_percent : Int32? = nil,
          @resource_arn : String? = nil,
          @resource_type : String? = nil,
          @size_in_bytes : Int64? = nil,
          @source_backup_id : String? = nil,
          @source_backup_region : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume : Types::Volume? = nil
        )
        end
      end

      # You can't delete a backup while it's being copied.
      struct BackupBeingCopied
        include JSON::Serializable

        @[JSON::Field(key: "BackupId")]
        getter backup_id : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @backup_id : String? = nil,
          @message : String? = nil
        )
        end
      end

      # If backup creation fails, this structure contains the details of that failure.
      struct BackupFailureDetails
        include JSON::Serializable

        # A message describing the backup-creation failure.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Another backup is already under way. Wait for completion before initiating additional backups of
      # this file system.
      struct BackupInProgress
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # No Amazon FSx backups were found based upon the supplied parameters.
      struct BackupNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You can't delete a backup while it's being used to restore a file system.
      struct BackupRestoring
        include JSON::Serializable

        # The ID of a file system being restored from the backup.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @file_system_id : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A generic error indicating a failure with a client request.
      struct BadRequest
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Cancels a data repository task.
      struct CancelDataRepositoryTaskRequest
        include JSON::Serializable

        # Specifies the data repository task to cancel.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct CancelDataRepositoryTaskResponse
        include JSON::Serializable

        # The lifecycle status of the data repository task, as follows: PENDING - Amazon FSx has not started
        # the task. EXECUTING - Amazon FSx is processing the task. FAILED - Amazon FSx was not able to
        # complete the task. For example, there may be files the task failed to process. The
        # DataRepositoryTaskFailureDetails property provides more information about task failures. SUCCEEDED -
        # FSx completed the task successfully. CANCELED - Amazon FSx canceled the task and it did not
        # complete. CANCELING - FSx is in process of canceling the task.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The ID of the task being canceled.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        def initialize(
          @lifecycle : String? = nil,
          @task_id : String? = nil
        )
        end
      end

      # Provides a report detailing the data repository task results of the files processed that match the
      # criteria specified in the report Scope parameter. FSx delivers the report to the file system's
      # linked data repository in Amazon S3, using the path specified in the report Path parameter. You can
      # specify whether or not a report gets generated for a task using the Enabled parameter.
      struct CompletionReport
        include JSON::Serializable

        # Set Enabled to True to generate a CompletionReport when the task completes. If set to true , then
        # you need to provide a report Scope , Path , and Format . Set Enabled to False if you do not want a
        # CompletionReport generated when the task completes.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Required if Enabled is set to true . Specifies the format of the CompletionReport .
        # REPORT_CSV_20191124 is the only format currently supported. When Format is set to
        # REPORT_CSV_20191124 , the CompletionReport is provided in CSV format, and is delivered to
        # {path}/task-{id}/failures.csv .
        @[JSON::Field(key: "Format")]
        getter format : String?

        # Required if Enabled is set to true . Specifies the location of the report on the file system's
        # linked S3 data repository. An absolute path that defines where the completion report will be stored
        # in the destination location. The Path you provide must be located within the file system’s
        # ExportPath. An example Path value is "s3://amzn-s3-demo-bucket/myExportPath/optionalPrefix". The
        # report provides the following information for each file in the report: FilePath, FileStatus, and
        # ErrorCode.
        @[JSON::Field(key: "Path")]
        getter path : String?

        # Required if Enabled is set to true . Specifies the scope of the CompletionReport ; FAILED_FILES_ONLY
        # is the only scope currently supported. When Scope is set to FAILED_FILES_ONLY , the CompletionReport
        # only contains information about files that the data repository task failed to process.
        @[JSON::Field(key: "Scope")]
        getter scope : String?

        def initialize(
          @enabled : Bool,
          @format : String? = nil,
          @path : String? = nil,
          @scope : String? = nil
        )
        end
      end

      struct CopyBackupRequest
        include JSON::Serializable

        # The ID of the source backup. Specifies the ID of the backup that's being copied.
        @[JSON::Field(key: "SourceBackupId")]
        getter source_backup_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A Boolean flag indicating whether tags from the source backup should be copied to the backup copy.
        # This value defaults to false . If you set CopyTags to true and the source backup has existing tags,
        # you can use the Tags parameter to create new tags, provided that the sum of the source backup tags
        # and the new tags doesn't exceed 50. Both sets of tags are merged. If there are tag conflicts (for
        # example, two tags with the same key but different values), the tags created with the Tags parameter
        # take precedence.
        @[JSON::Field(key: "CopyTags")]
        getter copy_tags : Bool?

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The source Amazon Web Services Region of the backup. Specifies the Amazon Web Services Region from
        # which the backup is being copied. The source and destination Regions must be in the same Amazon Web
        # Services partition. If you don't specify a Region, SourceRegion defaults to the Region where the
        # request is sent from (in-Region copy).
        @[JSON::Field(key: "SourceRegion")]
        getter source_region : String?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @source_backup_id : String,
          @client_request_token : String? = nil,
          @copy_tags : Bool? = nil,
          @kms_key_id : String? = nil,
          @source_region : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CopyBackupResponse
        include JSON::Serializable

        @[JSON::Field(key: "Backup")]
        getter backup : Types::Backup?

        def initialize(
          @backup : Types::Backup? = nil
        )
        end
      end

      struct CopySnapshotAndUpdateVolumeRequest
        include JSON::Serializable

        @[JSON::Field(key: "SourceSnapshotARN")]
        getter source_snapshot_arn : String

        # Specifies the ID of the volume that you are copying the snapshot to.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Specifies the strategy to use when copying data from a snapshot to the volume. FULL_COPY - Copies
        # all data from the snapshot to the volume. INCREMENTAL_COPY - Copies only the snapshot data that's
        # changed since the previous replication. CLONE isn't a valid copy strategy option for the
        # CopySnapshotAndUpdateVolume operation.
        @[JSON::Field(key: "CopyStrategy")]
        getter copy_strategy : String?

        # Confirms that you want to delete data on the destination volume that wasn’t there during the
        # previous snapshot replication. Your replication will fail if you don’t include an option for a
        # specific type of data and that data is on your destination. For example, if you don’t include
        # DELETE_INTERMEDIATE_SNAPSHOTS and there are intermediate snapshots on the destination, you can’t
        # copy the snapshot. DELETE_INTERMEDIATE_SNAPSHOTS - Deletes snapshots on the destination volume that
        # aren’t on the source volume. DELETE_CLONED_VOLUMES - Deletes snapshot clones on the destination
        # volume that aren't on the source volume. DELETE_INTERMEDIATE_DATA - Overwrites snapshots on the
        # destination volume that don’t match the source snapshot that you’re copying.
        @[JSON::Field(key: "Options")]
        getter options : Array(String)?

        def initialize(
          @source_snapshot_arn : String,
          @volume_id : String,
          @client_request_token : String? = nil,
          @copy_strategy : String? = nil,
          @options : Array(String)? = nil
        )
        end
      end

      struct CopySnapshotAndUpdateVolumeResponse
        include JSON::Serializable

        # A list of administrative actions for the file system that are in process or waiting to be processed.
        # Administrative actions describe changes to the Amazon FSx system.
        @[JSON::Field(key: "AdministrativeActions")]
        getter administrative_actions : Array(Types::AdministrativeAction)?

        # The lifecycle state of the destination volume.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The ID of the volume that you copied the snapshot to.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        def initialize(
          @administrative_actions : Array(Types::AdministrativeAction)? = nil,
          @lifecycle : String? = nil,
          @volume_id : String? = nil
        )
        end
      end

      # Used to specify the configuration options for an FSx for ONTAP volume's storage aggregate or
      # aggregates.
      struct CreateAggregateConfiguration
        include JSON::Serializable

        # Used to specify the names of aggregates on which the volume will be created.
        @[JSON::Field(key: "Aggregates")]
        getter aggregates : Array(String)?

        # Used to explicitly set the number of constituents within the FlexGroup per storage aggregate. This
        # field is optional when creating a FlexGroup volume. If unspecified, the default value will be 8.
        # This field cannot be provided when creating a FlexVol volume.
        @[JSON::Field(key: "ConstituentsPerAggregate")]
        getter constituents_per_aggregate : Int32?

        def initialize(
          @aggregates : Array(String)? = nil,
          @constituents_per_aggregate : Int32? = nil
        )
        end
      end

      # Specifies the FSx for ONTAP volume that the S3 access point will be attached to, and the file system
      # user identity.
      struct CreateAndAttachS3AccessPointOntapConfiguration
        include JSON::Serializable

        # Specifies the file system user identity to use for authorizing file read and write requests that are
        # made using this S3 access point.
        @[JSON::Field(key: "FileSystemIdentity")]
        getter file_system_identity : Types::OntapFileSystemIdentity

        # The ID of the FSx for ONTAP volume to which you want the S3 access point attached.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        def initialize(
          @file_system_identity : Types::OntapFileSystemIdentity,
          @volume_id : String
        )
        end
      end

      # Specifies the FSx for OpenZFS volume that the S3 access point will be attached to, and the file
      # system user identity.
      struct CreateAndAttachS3AccessPointOpenZFSConfiguration
        include JSON::Serializable

        # Specifies the file system user identity to use for authorizing file read and write requests that are
        # made using this S3 access point.
        @[JSON::Field(key: "FileSystemIdentity")]
        getter file_system_identity : Types::OpenZFSFileSystemIdentity

        # The ID of the FSx for OpenZFS volume to which you want the S3 access point attached.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        def initialize(
          @file_system_identity : Types::OpenZFSFileSystemIdentity,
          @volume_id : String
        )
        end
      end

      struct CreateAndAttachS3AccessPointRequest
        include JSON::Serializable

        # The name you want to assign to this S3 access point.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of S3 access point you want to create. Only OpenZFS is supported.
        @[JSON::Field(key: "Type")]
        getter type : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::CreateAndAttachS3AccessPointOntapConfiguration?

        # Specifies the configuration to use when creating and attaching an S3 access point to an FSx for
        # OpenZFS volume.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::CreateAndAttachS3AccessPointOpenZFSConfiguration?

        # Specifies the virtual private cloud (VPC) configuration if you're creating an access point that is
        # restricted to a VPC. For more information, see Creating access points restricted to a virtual
        # private cloud .
        @[JSON::Field(key: "S3AccessPoint")]
        getter s3_access_point : Types::CreateAndAttachS3AccessPointS3Configuration?

        def initialize(
          @name : String,
          @type : String,
          @client_request_token : String? = nil,
          @ontap_configuration : Types::CreateAndAttachS3AccessPointOntapConfiguration? = nil,
          @open_zfs_configuration : Types::CreateAndAttachS3AccessPointOpenZFSConfiguration? = nil,
          @s3_access_point : Types::CreateAndAttachS3AccessPointS3Configuration? = nil
        )
        end
      end

      struct CreateAndAttachS3AccessPointResponse
        include JSON::Serializable

        # Describes the configuration of the S3 access point created.
        @[JSON::Field(key: "S3AccessPointAttachment")]
        getter s3_access_point_attachment : Types::S3AccessPointAttachment?

        def initialize(
          @s3_access_point_attachment : Types::S3AccessPointAttachment? = nil
        )
        end
      end

      # Used to create an S3 access point that accepts requests only from a virtual private cloud (VPC) to
      # restrict data access to a private network.
      struct CreateAndAttachS3AccessPointS3Configuration
        include JSON::Serializable

        # Specifies an access policy to associate with the S3 access point configuration. For more
        # information, see Configuring IAM policies for using access points in the Amazon Simple Storage
        # Service User Guide.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # If included, Amazon S3 restricts access to this S3 access point to requests made from the specified
        # virtual private cloud (VPC).
        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::S3AccessPointVpcConfiguration?

        def initialize(
          @policy : String? = nil,
          @vpc_configuration : Types::S3AccessPointVpcConfiguration? = nil
        )
        end
      end

      # The request object for the CreateBackup operation.
      struct CreateBackupRequest
        include JSON::Serializable

        # (Optional) A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent creation.
        # This string is automatically filled on your behalf when you use the Command Line Interface (CLI) or
        # an Amazon Web Services SDK.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The ID of the file system to back up.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # (Optional) The tags to apply to the backup at backup creation. The key value of the Name tag appears
        # in the console as the backup name. If you have set CopyTagsToBackups to true , and you specify one
        # or more tags using the CreateBackup operation, no existing file system tags are copied from the file
        # system to the backup.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # (Optional) The ID of the FSx for ONTAP volume to back up.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        def initialize(
          @client_request_token : String? = nil,
          @file_system_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_id : String? = nil
        )
        end
      end

      # The response object for the CreateBackup operation.
      struct CreateBackupResponse
        include JSON::Serializable

        # A description of the backup.
        @[JSON::Field(key: "Backup")]
        getter backup : Types::Backup?

        def initialize(
          @backup : Types::Backup? = nil
        )
        end
      end

      struct CreateDataRepositoryAssociationRequest
        include JSON::Serializable

        # The path to the Amazon S3 data repository that will be linked to the file system. The path can be an
        # S3 bucket or prefix in the format s3://bucket-name/prefix/ (where prefix is optional). This path
        # specifies where in the S3 data repository files will be imported from or exported to.
        @[JSON::Field(key: "DataRepositoryPath")]
        getter data_repository_path : String

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # Set to true to run an import data repository task to import metadata from the data repository to the
        # file system after the data repository association is created. Default is false .
        @[JSON::Field(key: "BatchImportMetaDataOnCreate")]
        getter batch_import_meta_data_on_create : Bool?

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A path on the file system that points to a high-level directory (such as /ns1/ ) or subdirectory
        # (such as /ns1/subdir/ ) that will be mapped 1-1 with DataRepositoryPath . The leading forward slash
        # in the name is required. Two data repository associations cannot have overlapping file system paths.
        # For example, if a data repository is associated with file system path /ns1/ , then you cannot link
        # another data repository with file system path /ns1/ns2 . This path specifies where in your file
        # system files will be exported from or imported to. This file system directory can be linked to only
        # one Amazon S3 bucket, and no other S3 bucket can be linked to the directory. If you specify only a
        # forward slash ( / ) as the file system path, you can link only one data repository to the file
        # system. You can only specify "/" as the file system path for the first data repository associated
        # with a file system.
        @[JSON::Field(key: "FileSystemPath")]
        getter file_system_path : String?

        # For files imported from a data repository, this value determines the stripe count and maximum amount
        # of data per file (in MiB) stored on a single physical disk. The maximum number of disks that a
        # single file can be striped across is limited by the total number of disks that make up the file
        # system. The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB).
        # Amazon S3 objects have a maximum size of 5 TB.
        @[JSON::Field(key: "ImportedFileChunkSize")]
        getter imported_file_chunk_size : Int32?

        # The configuration for an Amazon S3 data repository linked to an Amazon FSx Lustre file system with a
        # data repository association. The configuration defines which file events (new, changed, or deleted
        # files or directories) are automatically imported from the linked data repository to the file system
        # or automatically exported from the file system to the data repository.
        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3DataRepositoryConfiguration?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @data_repository_path : String,
          @file_system_id : String,
          @batch_import_meta_data_on_create : Bool? = nil,
          @client_request_token : String? = nil,
          @file_system_path : String? = nil,
          @imported_file_chunk_size : Int32? = nil,
          @s3 : Types::S3DataRepositoryConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDataRepositoryAssociationResponse
        include JSON::Serializable

        # The response object returned after the data repository association is created.
        @[JSON::Field(key: "Association")]
        getter association : Types::DataRepositoryAssociation?

        def initialize(
          @association : Types::DataRepositoryAssociation? = nil
        )
        end
      end

      struct CreateDataRepositoryTaskRequest
        include JSON::Serializable

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # Defines whether or not Amazon FSx provides a CompletionReport once the task has completed. A
        # CompletionReport provides a detailed report on the files that Amazon FSx processed that meet the
        # criteria specified by the Scope parameter. For more information, see Working with Task Completion
        # Reports .
        @[JSON::Field(key: "Report")]
        getter report : Types::CompletionReport

        # Specifies the type of data repository task to create. EXPORT_TO_REPOSITORY tasks export from your
        # Amazon FSx for Lustre file system to a linked data repository. IMPORT_METADATA_FROM_REPOSITORY tasks
        # import metadata changes from a linked S3 bucket to your Amazon FSx for Lustre file system.
        # RELEASE_DATA_FROM_FILESYSTEM tasks release files in your Amazon FSx for Lustre file system that have
        # been exported to a linked S3 bucket and that meet your specified release criteria. AUTO_RELEASE_DATA
        # tasks automatically release files from an Amazon File Cache resource.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Specifies the amount of data to release, in GiB, by an Amazon File Cache AUTO_RELEASE_DATA task that
        # automatically releases files from the cache.
        @[JSON::Field(key: "CapacityToRelease")]
        getter capacity_to_release : Int64?

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A list of paths for the data repository task to use when the task is processed. If a path that you
        # provide isn't valid, the task fails. If you don't provide paths, the default behavior is to export
        # all files to S3 (for export tasks), import all files from S3 (for import tasks), or release all
        # exported files that meet the last accessed time criteria (for release tasks). For export tasks, the
        # list contains paths on the FSx for Lustre file system from which the files are exported to the
        # Amazon S3 bucket. The default path is the file system root directory. The paths you provide need to
        # be relative to the mount point of the file system. If the mount point is /mnt/fsx and /mnt/fsx/path1
        # is a directory or file on the file system you want to export, then the path to provide is path1 .
        # For import tasks, the list contains paths in the Amazon S3 bucket from which POSIX metadata changes
        # are imported to the FSx for Lustre file system. The path can be an S3 bucket or prefix in the format
        # s3://bucket-name/prefix (where prefix is optional). For release tasks, the list contains directory
        # or file paths on the FSx for Lustre file system from which to release exported files. If a directory
        # is specified, files within the directory are released. If a file path is specified, only that file
        # is released. To release all exported files in the file system, specify a forward slash (/) as the
        # path. A file must also meet the last accessed time criteria specified in for the file to be
        # released.
        @[JSON::Field(key: "Paths")]
        getter paths : Array(String)?

        # The configuration that specifies the last accessed time criteria for files that will be released
        # from an Amazon FSx for Lustre file system.
        @[JSON::Field(key: "ReleaseConfiguration")]
        getter release_configuration : Types::ReleaseConfiguration?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @file_system_id : String,
          @report : Types::CompletionReport,
          @type : String,
          @capacity_to_release : Int64? = nil,
          @client_request_token : String? = nil,
          @paths : Array(String)? = nil,
          @release_configuration : Types::ReleaseConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDataRepositoryTaskResponse
        include JSON::Serializable

        # The description of the data repository task that you just created.
        @[JSON::Field(key: "DataRepositoryTask")]
        getter data_repository_task : Types::DataRepositoryTask?

        def initialize(
          @data_repository_task : Types::DataRepositoryTask? = nil
        )
        end
      end

      # The Amazon File Cache configuration for the cache that you are creating.
      struct CreateFileCacheLustreConfiguration
        include JSON::Serializable

        # Specifies the cache deployment type, which must be CACHE_1 .
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String

        # The configuration for a Lustre MDT (Metadata Target) storage volume.
        @[JSON::Field(key: "MetadataConfiguration")]
        getter metadata_configuration : Types::FileCacheLustreMetadataConfiguration

        # Provisions the amount of read and write throughput for each 1 tebibyte (TiB) of cache storage
        # capacity, in MB/s/TiB. The only supported value is 1000 .
        @[JSON::Field(key: "PerUnitStorageThroughput")]
        getter per_unit_storage_throughput : Int32

        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @deployment_type : String,
          @metadata_configuration : Types::FileCacheLustreMetadataConfiguration,
          @per_unit_storage_throughput : Int32,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      struct CreateFileCacheRequest
        include JSON::Serializable

        # The type of cache that you're creating, which must be LUSTRE .
        @[JSON::Field(key: "FileCacheType")]
        getter file_cache_type : String

        # Sets the Lustre version for the cache that you're creating, which must be 2.12 .
        @[JSON::Field(key: "FileCacheTypeVersion")]
        getter file_cache_type_version : String

        # The storage capacity of the cache in gibibytes (GiB). Valid values are 1200 GiB, 2400 GiB, and
        # increments of 2400 GiB.
        @[JSON::Field(key: "StorageCapacity")]
        getter storage_capacity : Int32

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # An idempotency token for resource creation, in a string of up to 63 ASCII characters. This token is
        # automatically filled on your behalf when you use the Command Line Interface (CLI) or an Amazon Web
        # Services SDK. By using the idempotent operation, you can retry a CreateFileCache operation without
        # the risk of creating an extra cache. This approach can be useful when an initial call fails in a way
        # that makes it unclear whether a cache was created. Examples are if a transport level timeout
        # occurred, or your connection was reset. If you use the same client request token and the initial
        # call created a cache, the client receives success as long as the parameters are the same.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A boolean flag indicating whether tags for the cache should be copied to data repository
        # associations. This value defaults to false.
        @[JSON::Field(key: "CopyTagsToDataRepositoryAssociations")]
        getter copy_tags_to_data_repository_associations : Bool?

        # A list of up to 8 configurations for data repository associations (DRAs) to be created during the
        # cache creation. The DRAs link the cache to either an Amazon S3 data repository or a Network File
        # System (NFS) data repository that supports the NFSv3 protocol. The DRA configurations must meet the
        # following requirements: All configurations on the list must be of the same data repository type,
        # either all S3 or all NFS. A cache can't link to different data repository types at the same time. An
        # NFS DRA must link to an NFS file system that supports the NFSv3 protocol. DRA automatic import and
        # automatic export is not supported.
        @[JSON::Field(key: "DataRepositoryAssociations")]
        getter data_repository_associations : Array(Types::FileCacheDataRepositoryAssociation)?

        # Specifies the ID of the Key Management Service (KMS) key to use for encrypting data on an Amazon
        # File Cache. If a KmsKeyId isn't specified, the Amazon FSx-managed KMS key for your account is used.
        # For more information, see Encrypt in the Key Management Service API Reference .
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The configuration for the Amazon File Cache resource being created.
        @[JSON::Field(key: "LustreConfiguration")]
        getter lustre_configuration : Types::CreateFileCacheLustreConfiguration?

        # A list of IDs specifying the security groups to apply to all network interfaces created for Amazon
        # File Cache access. This list isn't returned in later requests to describe the cache.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @file_cache_type : String,
          @file_cache_type_version : String,
          @storage_capacity : Int32,
          @subnet_ids : Array(String),
          @client_request_token : String? = nil,
          @copy_tags_to_data_repository_associations : Bool? = nil,
          @data_repository_associations : Array(Types::FileCacheDataRepositoryAssociation)? = nil,
          @kms_key_id : String? = nil,
          @lustre_configuration : Types::CreateFileCacheLustreConfiguration? = nil,
          @security_group_ids : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateFileCacheResponse
        include JSON::Serializable

        # A description of the cache that was created.
        @[JSON::Field(key: "FileCache")]
        getter file_cache : Types::FileCacheCreating?

        def initialize(
          @file_cache : Types::FileCacheCreating? = nil
        )
        end
      end

      # The request object for the CreateFileSystemFromBackup operation.
      struct CreateFileSystemFromBackupRequest
        include JSON::Serializable

        @[JSON::Field(key: "BackupId")]
        getter backup_id : String

        # Specifies the IDs of the subnets that the file system will be accessible from. For Windows
        # MULTI_AZ_1 file system deployment types, provide exactly two subnet IDs, one for the preferred file
        # server and one for the standby file server. You specify one of these subnets as the preferred subnet
        # using the WindowsConfiguration &gt; PreferredSubnetID property. Windows SINGLE_AZ_1 and SINGLE_AZ_2
        # file system deployment types, Lustre file systems, and OpenZFS file systems provide exactly one
        # subnet ID. The file server is launched in that subnet's Availability Zone.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent creation. This
        # string is automatically filled on your behalf when you use the Command Line Interface (CLI) or an
        # Amazon Web Services SDK.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Sets the version for the Amazon FSx for Lustre file system that you're creating from a backup. Valid
        # values are 2.10 , 2.12 , and 2.15 . You can enter a Lustre version that is newer than the backup's
        # FileSystemTypeVersion setting. If you don't enter a newer Lustre version, it defaults to the
        # backup's setting.
        @[JSON::Field(key: "FileSystemTypeVersion")]
        getter file_system_type_version : String?

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        @[JSON::Field(key: "LustreConfiguration")]
        getter lustre_configuration : Types::CreateFileSystemLustreConfiguration?

        # Sets the network type for the Amazon FSx for OpenZFS file system that you're creating from a backup.
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The OpenZFS configuration for the file system that's being created.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::CreateFileSystemOpenZFSConfiguration?

        # A list of IDs for the security groups that apply to the specified network interfaces created for
        # file system access. These security groups apply to all network interfaces. This value isn't returned
        # in later DescribeFileSystem requests.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # Sets the storage capacity of the OpenZFS file system that you're creating from a backup, in
        # gibibytes (GiB). Valid values are from 64 GiB up to 524,288 GiB (512 TiB). However, the value that
        # you specify must be equal to or greater than the backup's storage capacity value. If you don't use
        # the StorageCapacity parameter, the default is the backup's StorageCapacity value. If used to create
        # a file system other than OpenZFS, you must provide a value that matches the backup's StorageCapacity
        # value. If you provide any other value, Amazon FSx responds with an HTTP status code 400 Bad Request.
        @[JSON::Field(key: "StorageCapacity")]
        getter storage_capacity : Int32?

        # Sets the storage type for the Windows, OpenZFS, or Lustre file system that you're creating from a
        # backup. Valid values are SSD , HDD , and INTELLIGENT_TIERING . Set to SSD to use solid state drive
        # storage. SSD is supported on all Windows and OpenZFS deployment types. Set to HDD to use hard disk
        # drive storage. HDD is supported on SINGLE_AZ_2 and MULTI_AZ_1 FSx for Windows File Server file
        # system deployment types. Set to INTELLIGENT_TIERING to use fully elastic, intelligently-tiered
        # storage. Intelligent-Tiering is only available for OpenZFS file systems with the Multi-AZ deployment
        # type and for Lustre file systems with the Persistent_2 deployment type. The default value is SSD .
        # HDD and SSD storage types have different minimum storage capacity requirements. A restored file
        # system's storage capacity is tied to the file system that was backed up. You can create a file
        # system that uses HDD storage from a backup of a file system that used SSD storage if the original
        # SSD file system had a storage capacity of at least 2000 GiB.
        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The tags to be applied to the file system at file system creation. The key value of the Name tag
        # appears in the console as the file system name.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The configuration for this Microsoft Windows file system.
        @[JSON::Field(key: "WindowsConfiguration")]
        getter windows_configuration : Types::CreateFileSystemWindowsConfiguration?

        def initialize(
          @backup_id : String,
          @subnet_ids : Array(String),
          @client_request_token : String? = nil,
          @file_system_type_version : String? = nil,
          @kms_key_id : String? = nil,
          @lustre_configuration : Types::CreateFileSystemLustreConfiguration? = nil,
          @network_type : String? = nil,
          @open_zfs_configuration : Types::CreateFileSystemOpenZFSConfiguration? = nil,
          @security_group_ids : Array(String)? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @windows_configuration : Types::CreateFileSystemWindowsConfiguration? = nil
        )
        end
      end

      # The response object for the CreateFileSystemFromBackup operation.
      struct CreateFileSystemFromBackupResponse
        include JSON::Serializable

        # A description of the file system.
        @[JSON::Field(key: "FileSystem")]
        getter file_system : Types::FileSystem?

        def initialize(
          @file_system : Types::FileSystem? = nil
        )
        end
      end

      # The Lustre configuration for the file system being created. The following parameters are not
      # supported for file systems with a data repository association created with . AutoImportPolicy
      # ExportPath ImportedFileChunkSize ImportPath
      struct CreateFileSystemLustreConfiguration
        include JSON::Serializable

        # (Optional) When you create your file system, your existing S3 objects appear as file and directory
        # listings. Use this parameter to choose how Amazon FSx keeps your file and directory listings up to
        # date as you add or modify objects in your linked S3 bucket. AutoImportPolicy can have the following
        # values: NONE - (Default) AutoImport is off. Amazon FSx only updates file and directory listings from
        # the linked S3 bucket when the file system is created. FSx does not update file and directory
        # listings for any new or changed objects after choosing this option. NEW - AutoImport is on. Amazon
        # FSx automatically imports directory listings of any new objects added to the linked S3 bucket that
        # do not currently exist in the FSx file system. NEW_CHANGED - AutoImport is on. Amazon FSx
        # automatically imports file and directory listings of any new objects added to the S3 bucket and any
        # existing objects that are changed in the S3 bucket after you choose this option. NEW_CHANGED_DELETED
        # - AutoImport is on. Amazon FSx automatically imports file and directory listings of any new objects
        # added to the S3 bucket, any existing objects that are changed in the S3 bucket, and any objects that
        # were deleted in the S3 bucket. For more information, see Automatically import updates from your S3
        # bucket . This parameter is not supported for file systems with a data repository association.
        @[JSON::Field(key: "AutoImportPolicy")]
        getter auto_import_policy : String?

        # The number of days to retain automatic backups. Setting this property to 0 disables automatic
        # backups. You can retain automatic backups for a maximum of 90 days. The default is 0 .
        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        # (Optional) Not available for use with file systems that are linked to a data repository. A boolean
        # flag indicating whether tags for the file system should be copied to backups. The default value is
        # false. If CopyTagsToBackups is set to true, all file system tags are copied to all automatic and
        # user-initiated backups when the user doesn't specify any backup-specific tags. If CopyTagsToBackups
        # is set to true and you specify one or more backup tags, only the specified tags are copied to
        # backups. If you specify one or more tags when creating a user-initiated backup, no tags are copied
        # from the file system, regardless of this value. (Default = false ) For more information, see Working
        # with backups in the Amazon FSx for Lustre User Guide .
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # Sets the data compression configuration for the file system. DataCompressionType can have the
        # following values: NONE - (Default) Data compression is turned off when the file system is created.
        # LZ4 - Data compression is turned on with the LZ4 algorithm. For more information, see Lustre data
        # compression in the Amazon FSx for Lustre User Guide .
        @[JSON::Field(key: "DataCompressionType")]
        getter data_compression_type : String?

        # Specifies the optional provisioned SSD read cache on FSx for Lustre file systems that use the
        # Intelligent-Tiering storage class. Required when StorageType is set to INTELLIGENT_TIERING .
        @[JSON::Field(key: "DataReadCacheConfiguration")]
        getter data_read_cache_configuration : Types::LustreReadCacheConfiguration?

        # (Optional) Choose SCRATCH_1 and SCRATCH_2 deployment types when you need temporary storage and
        # shorter-term processing of data. The SCRATCH_2 deployment type provides in-transit encryption of
        # data and higher burst throughput capacity than SCRATCH_1 . Choose PERSISTENT_1 for longer-term
        # storage and for throughput-focused workloads that aren’t latency-sensitive. PERSISTENT_1 supports
        # encryption of data in transit, and is available in all Amazon Web Services Regions in which FSx for
        # Lustre is available. Choose PERSISTENT_2 for longer-term storage and for latency-sensitive workloads
        # that require the highest levels of IOPS/throughput. PERSISTENT_2 supports the SSD and
        # Intelligent-Tiering storage classes. You can optionally specify a metadata configuration mode for
        # PERSISTENT_2 which supports increasing metadata performance. PERSISTENT_2 is available in a limited
        # number of Amazon Web Services Regions. For more information, and an up-to-date list of Amazon Web
        # Services Regions in which PERSISTENT_2 is available, see Deployment and storage class options for
        # FSx for Lustre file systems in the Amazon FSx for Lustre User Guide . If you choose PERSISTENT_2 ,
        # and you set FileSystemTypeVersion to 2.10 , the CreateFileSystem operation fails. Encryption of data
        # in transit is automatically turned on when you access SCRATCH_2 , PERSISTENT_1 , and PERSISTENT_2
        # file systems from Amazon EC2 instances that support automatic encryption in the Amazon Web Services
        # Regions where they are available. For more information about encryption in transit for FSx for
        # Lustre file systems, see Encrypting data in transit in the Amazon FSx for Lustre User Guide .
        # (Default = SCRATCH_1 )
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # The type of drive cache used by PERSISTENT_1 file systems that are provisioned with HDD storage
        # devices. This parameter is required when storage type is HDD. Set this property to READ to improve
        # the performance for frequently accessed files by caching up to 20% of the total storage capacity of
        # the file system. This parameter is required when StorageType is set to HDD .
        @[JSON::Field(key: "DriveCacheType")]
        getter drive_cache_type : String?

        # (Optional) Specifies whether Elastic Fabric Adapter (EFA) and GPUDirect Storage (GDS) support is
        # enabled for the Amazon FSx for Lustre file system. (Default = false )
        @[JSON::Field(key: "EfaEnabled")]
        getter efa_enabled : Bool?

        # (Optional) Specifies the path in the Amazon S3 bucket where the root of your Amazon FSx file system
        # is exported. The path must use the same Amazon S3 bucket as specified in ImportPath. You can provide
        # an optional prefix to which new and changed data is to be exported from your Amazon FSx for Lustre
        # file system. If an ExportPath value is not provided, Amazon FSx sets a default export path,
        # s3://import-bucket/FSxLustre[creation-timestamp] . The timestamp is in UTC format, for example
        # s3://import-bucket/FSxLustre20181105T222312Z . The Amazon S3 export bucket must be the same as the
        # import bucket specified by ImportPath . If you specify only a bucket name, such as
        # s3://import-bucket , you get a 1:1 mapping of file system objects to S3 bucket objects. This mapping
        # means that the input data in S3 is overwritten on export. If you provide a custom prefix in the
        # export path, such as s3://import-bucket/[custom-optional-prefix] , Amazon FSx exports the contents
        # of your file system to that export prefix in the Amazon S3 bucket. This parameter is not supported
        # for file systems with a data repository association.
        @[JSON::Field(key: "ExportPath")]
        getter export_path : String?

        # (Optional) The path to the Amazon S3 bucket (including the optional prefix) that you're using as the
        # data repository for your Amazon FSx for Lustre file system. The root of your FSx for Lustre file
        # system will be mapped to the root of the Amazon S3 bucket you select. An example is
        # s3://import-bucket/optional-prefix . If you specify a prefix after the Amazon S3 bucket name, only
        # object keys with that prefix are loaded into the file system. This parameter is not supported for
        # file systems with a data repository association.
        @[JSON::Field(key: "ImportPath")]
        getter import_path : String?

        # (Optional) For files imported from a data repository, this value determines the stripe count and
        # maximum amount of data per file (in MiB) stored on a single physical disk. The maximum number of
        # disks that a single file can be striped across is limited by the total number of disks that make up
        # the file system. The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500
        # GiB). Amazon S3 objects have a maximum size of 5 TB. This parameter is not supported for file
        # systems with a data repository association.
        @[JSON::Field(key: "ImportedFileChunkSize")]
        getter imported_file_chunk_size : Int32?

        # The Lustre logging configuration used when creating an Amazon FSx for Lustre file system. When
        # logging is enabled, Lustre logs error and warning events for data repositories associated with your
        # file system to Amazon CloudWatch Logs.
        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LustreLogCreateConfiguration?

        # The Lustre metadata performance configuration for the creation of an FSx for Lustre file system
        # using a PERSISTENT_2 deployment type.
        @[JSON::Field(key: "MetadataConfiguration")]
        getter metadata_configuration : Types::CreateFileSystemLustreMetadataConfiguration?

        # Required with PERSISTENT_1 and PERSISTENT_2 deployment types using an SSD or HDD storage class,
        # provisions the amount of read and write throughput for each 1 tebibyte (TiB) of file system storage
        # capacity, in MB/s/TiB. File system throughput capacity is calculated by multiplying ﬁle system
        # storage capacity (TiB) by the PerUnitStorageThroughput (MB/s/TiB). For a 2.4-TiB ﬁle system,
        # provisioning 50 MB/s/TiB of PerUnitStorageThroughput yields 120 MB/s of ﬁle system throughput. You
        # pay for the amount of throughput that you provision. Valid values: For PERSISTENT_1 SSD storage: 50,
        # 100, 200 MB/s/TiB. For PERSISTENT_1 HDD storage: 12, 40 MB/s/TiB. For PERSISTENT_2 SSD storage: 125,
        # 250, 500, 1000 MB/s/TiB.
        @[JSON::Field(key: "PerUnitStorageThroughput")]
        getter per_unit_storage_throughput : Int32?

        # The Lustre root squash configuration used when creating an Amazon FSx for Lustre file system. When
        # enabled, root squash restricts root-level access from clients that try to access your file system as
        # a root user.
        @[JSON::Field(key: "RootSquashConfiguration")]
        getter root_squash_configuration : Types::LustreRootSquashConfiguration?

        # Specifies the throughput of an FSx for Lustre file system using the Intelligent-Tiering storage
        # class, measured in megabytes per second (MBps). Valid values are 4000 MBps or multiples of 4000
        # MBps. You pay for the amount of throughput that you provision.
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        # (Optional) The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time
        # zone, where d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.
        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @auto_import_policy : String? = nil,
          @automatic_backup_retention_days : Int32? = nil,
          @copy_tags_to_backups : Bool? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @data_compression_type : String? = nil,
          @data_read_cache_configuration : Types::LustreReadCacheConfiguration? = nil,
          @deployment_type : String? = nil,
          @drive_cache_type : String? = nil,
          @efa_enabled : Bool? = nil,
          @export_path : String? = nil,
          @import_path : String? = nil,
          @imported_file_chunk_size : Int32? = nil,
          @log_configuration : Types::LustreLogCreateConfiguration? = nil,
          @metadata_configuration : Types::CreateFileSystemLustreMetadataConfiguration? = nil,
          @per_unit_storage_throughput : Int32? = nil,
          @root_squash_configuration : Types::LustreRootSquashConfiguration? = nil,
          @throughput_capacity : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # The Lustre metadata performance configuration for the creation of an Amazon FSx for Lustre file
      # system using a PERSISTENT_2 deployment type. The configuration uses a Metadata IOPS value to set the
      # maximum rate of metadata disk IOPS supported by the file system. After creation, the file system
      # supports increasing metadata performance. For more information on Metadata IOPS, see Lustre metadata
      # performance configuration in the Amazon FSx for Lustre User Guide .
      struct CreateFileSystemLustreMetadataConfiguration
        include JSON::Serializable

        # The metadata configuration mode for provisioning Metadata IOPS for an FSx for Lustre file system
        # using a PERSISTENT_2 deployment type. In AUTOMATIC mode (supported only on SSD file systems), FSx
        # for Lustre automatically provisions and scales the number of Metadata IOPS for your file system
        # based on your file system storage capacity. In USER_PROVISIONED mode, you specify the number of
        # Metadata IOPS to provision for your file system.
        @[JSON::Field(key: "Mode")]
        getter mode : String

        # (USER_PROVISIONED mode only) Specifies the number of Metadata IOPS to provision for the file system.
        # This parameter sets the maximum rate of metadata disk IOPS supported by the file system. For SSD
        # file systems, valid values are 1500 , 3000 , 6000 , 12000 , and multiples of 12000 up to a maximum
        # of 192000 . For Intelligent-Tiering file systems, valid values are 6000 and 12000 . Iops doesn’t
        # have a default value. If you're using USER_PROVISIONED mode, you can choose to specify a valid
        # value. If you're using AUTOMATIC mode, you cannot specify a value because FSx for Lustre
        # automatically sets the value based on your file system storage capacity.
        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        def initialize(
          @mode : String,
          @iops : Int32? = nil
        )
        end
      end

      # The ONTAP configuration properties of the FSx for ONTAP file system that you are creating.
      struct CreateFileSystemOntapConfiguration
        include JSON::Serializable

        # Specifies the FSx for ONTAP file system deployment type to use in creating the file system.
        # MULTI_AZ_1 - A high availability file system configured for Multi-AZ redundancy to tolerate
        # temporary Availability Zone (AZ) unavailability. This is a first-generation FSx for ONTAP file
        # system. MULTI_AZ_2 - A high availability file system configured for Multi-AZ redundancy to tolerate
        # temporary AZ unavailability. This is a second-generation FSx for ONTAP file system. SINGLE_AZ_1 - A
        # file system configured for Single-AZ redundancy. This is a first-generation FSx for ONTAP file
        # system. SINGLE_AZ_2 - A file system configured with multiple high-availability (HA) pairs for
        # Single-AZ redundancy. This is a second-generation FSx for ONTAP file system. For information about
        # the use cases for Multi-AZ and Single-AZ deployments, refer to Choosing a file system deployment
        # type .
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String

        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # The SSD IOPS configuration for the FSx for ONTAP file system.
        @[JSON::Field(key: "DiskIopsConfiguration")]
        getter disk_iops_configuration : Types::DiskIopsConfiguration?

        # (Multi-AZ only) Specifies the IPv4 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API, Amazon FSx selects an unused IP address range for
        # you from the 198.19.* range. By default in the Amazon FSx console, Amazon FSx chooses the last 64 IP
        # addresses from the VPC’s primary CIDR range to use as the endpoint IP address range for the file
        # system. You can have overlapping endpoint IP addresses for file systems deployed in the same
        # VPC/route tables, as long as they don't overlap with any subnet.
        @[JSON::Field(key: "EndpointIpAddressRange")]
        getter endpoint_ip_address_range : String?

        # (Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API and Amazon FSx console, Amazon FSx selects an
        # available /118 IP address range for you from one of the VPC's CIDR ranges. You can have overlapping
        # endpoint IP addresses for file systems deployed in the same VPC/route tables, as long as they don't
        # overlap with any subnet.
        @[JSON::Field(key: "EndpointIpv6AddressRange")]
        getter endpoint_ipv6_address_range : String?

        # The ONTAP administrative password for the fsxadmin user with which you administer your file system
        # using the NetApp ONTAP CLI and REST API.
        @[JSON::Field(key: "FsxAdminPassword")]
        getter fsx_admin_password : String?

        # Specifies how many high-availability (HA) pairs of file servers will power your file system.
        # First-generation file systems are powered by 1 HA pair. Second-generation multi-AZ file systems are
        # powered by 1 HA pair. Second generation single-AZ file systems are powered by up to 12 HA pairs. The
        # default value is 1. The value of this property affects the values of StorageCapacity , Iops , and
        # ThroughputCapacity . For more information, see High-availability (HA) pairs in the FSx for ONTAP
        # user guide. Block storage protocol support (iSCSI and NVMe over TCP) is disabled on file systems
        # with more than 6 HA pairs. For more information, see Using block storage protocols . Amazon FSx
        # responds with an HTTP status code 400 (Bad Request) for the following conditions: The value of
        # HAPairs is less than 1 or greater than 12. The value of HAPairs is greater than 1 and the value of
        # DeploymentType is SINGLE_AZ_1 , MULTI_AZ_1 , or MULTI_AZ_2 .
        @[JSON::Field(key: "HAPairs")]
        getter ha_pairs : Int32?

        # Required when DeploymentType is set to MULTI_AZ_1 or MULTI_AZ_2 . This specifies the subnet in which
        # you want the preferred file server to be located.
        @[JSON::Field(key: "PreferredSubnetId")]
        getter preferred_subnet_id : String?

        # (Multi-AZ only) Specifies the route tables in which Amazon FSx creates the rules for routing traffic
        # to the correct file server. You should specify all virtual private cloud (VPC) route tables
        # associated with the subnets in which your clients are located. By default, Amazon FSx selects your
        # VPC's default route table. Amazon FSx manages these route tables for Multi-AZ file systems using
        # tag-based authentication. These route tables are tagged with Key: AmazonFSx; Value:
        # ManagedByAmazonFSx . When creating FSx for ONTAP Multi-AZ file systems using CloudFormation we
        # recommend that you add the Key: AmazonFSx; Value: ManagedByAmazonFSx tag manually.
        @[JSON::Field(key: "RouteTableIds")]
        getter route_table_ids : Array(String)?

        # Sets the throughput capacity for the file system that you're creating in megabytes per second
        # (MBps). For more information, see Managing throughput capacity in the FSx for ONTAP User Guide.
        # Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following conditions: The
        # value of ThroughputCapacity and ThroughputCapacityPerHAPair are not the same value. The value of
        # ThroughputCapacity when divided by the value of HAPairs is outside of the valid range for
        # ThroughputCapacity .
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        # Use to choose the throughput capacity per HA pair, rather than the total throughput for the file
        # system. You can define either the ThroughputCapacityPerHAPair or the ThroughputCapacity when
        # creating a file system, but not both. This field and ThroughputCapacity are the same for file
        # systems powered by one HA pair. For SINGLE_AZ_1 and MULTI_AZ_1 file systems, valid values are 128,
        # 256, 512, 1024, 2048, or 4096 MBps. For SINGLE_AZ_2 , valid values are 1536, 3072, or 6144 MBps. For
        # MULTI_AZ_2 , valid values are 384, 768, 1536, 3072, or 6144 MBps. Amazon FSx responds with an HTTP
        # status code 400 (Bad Request) for the following conditions: The value of ThroughputCapacity and
        # ThroughputCapacityPerHAPair are not the same value for file systems with one HA pair. The value of
        # deployment type is SINGLE_AZ_2 and ThroughputCapacity / ThroughputCapacityPerHAPair is not a valid
        # HA pair (a value between 1 and 12). The value of ThroughputCapacityPerHAPair is not a valid value.
        @[JSON::Field(key: "ThroughputCapacityPerHAPair")]
        getter throughput_capacity_per_ha_pair : Int32?

        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @deployment_type : String,
          @automatic_backup_retention_days : Int32? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @disk_iops_configuration : Types::DiskIopsConfiguration? = nil,
          @endpoint_ip_address_range : String? = nil,
          @endpoint_ipv6_address_range : String? = nil,
          @fsx_admin_password : String? = nil,
          @ha_pairs : Int32? = nil,
          @preferred_subnet_id : String? = nil,
          @route_table_ids : Array(String)? = nil,
          @throughput_capacity : Int32? = nil,
          @throughput_capacity_per_ha_pair : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # The Amazon FSx for OpenZFS configuration properties for the file system that you are creating.
      struct CreateFileSystemOpenZFSConfiguration
        include JSON::Serializable

        # Specifies the file system deployment type. Valid values are the following: MULTI_AZ_1 - Creates file
        # systems with high availability and durability by replicating your data and supporting failover
        # across multiple Availability Zones in the same Amazon Web Services Region. SINGLE_AZ_HA_2 - Creates
        # file systems with high availability and throughput capacities of 160 - 10,240 MB/s using an NVMe
        # L2ARC cache by deploying a primary and standby file system within the same Availability Zone.
        # SINGLE_AZ_HA_1 - Creates file systems with high availability and throughput capacities of 64 - 4,096
        # MB/s by deploying a primary and standby file system within the same Availability Zone. SINGLE_AZ_2 -
        # Creates file systems with throughput capacities of 160 - 10,240 MB/s using an NVMe L2ARC cache that
        # automatically recover within a single Availability Zone. SINGLE_AZ_1 - Creates file systems with
        # throughput capacities of 64 - 4,096 MBs that automatically recover within a single Availability
        # Zone. For a list of which Amazon Web Services Regions each deployment type is available in, see
        # Deployment type availability . For more information on the differences in performance between
        # deployment types, see File system performance in the Amazon FSx for OpenZFS User Guide .
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String

        # Specifies the throughput of an Amazon FSx for OpenZFS file system, measured in megabytes per second
        # (MBps). Valid values depend on the DeploymentType that you choose, as follows: For MULTI_AZ_1 and
        # SINGLE_AZ_2 , valid values are 160, 320, 640, 1280, 2560, 3840, 5120, 7680, or 10240 MBps. For
        # SINGLE_AZ_1 , valid values are 64, 128, 256, 512, 1024, 2048, 3072, or 4096 MBps. You pay for
        # additional throughput capacity that you provision.
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32

        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        # A Boolean value indicating whether tags for the file system should be copied to backups. This value
        # defaults to false . If it's set to true , all tags for the file system are copied to all automatic
        # and user-initiated backups where the user doesn't specify tags. If this value is true , and you
        # specify one or more tags, only the specified tags are copied to backups. If you specify one or more
        # tags when creating a user-initiated backup, no tags are copied from the file system, regardless of
        # this value.
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        # A Boolean value indicating whether tags for the file system should be copied to volumes. This value
        # defaults to false . If it's set to true , all tags for the file system are copied to volumes where
        # the user doesn't specify tags. If this value is true , and you specify one or more tags, only the
        # specified tags are copied to volumes. If you specify one or more tags when creating the volume, no
        # tags are copied from the file system, regardless of this value.
        @[JSON::Field(key: "CopyTagsToVolumes")]
        getter copy_tags_to_volumes : Bool?

        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        @[JSON::Field(key: "DiskIopsConfiguration")]
        getter disk_iops_configuration : Types::DiskIopsConfiguration?

        # (Multi-AZ only) Specifies the IPv4 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API and Amazon FSx console, Amazon FSx selects an
        # available /28 IP address range for you from one of the VPC's CIDR ranges. You can have overlapping
        # endpoint IP addresses for file systems deployed in the same VPC/route tables, as long as they don't
        # overlap with any subnet.
        @[JSON::Field(key: "EndpointIpAddressRange")]
        getter endpoint_ip_address_range : String?

        # (Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API and Amazon FSx console, Amazon FSx selects an
        # available /118 IP address range for you from one of the VPC's CIDR ranges. You can have overlapping
        # endpoint IP addresses for file systems deployed in the same VPC/route tables, as long as they don't
        # overlap with any subnet.
        @[JSON::Field(key: "EndpointIpv6AddressRange")]
        getter endpoint_ipv6_address_range : String?

        # Required when DeploymentType is set to MULTI_AZ_1 . This specifies the subnet in which you want the
        # preferred file server to be located.
        @[JSON::Field(key: "PreferredSubnetId")]
        getter preferred_subnet_id : String?

        # Specifies the optional provisioned SSD read cache on file systems that use the Intelligent-Tiering
        # storage class.
        @[JSON::Field(key: "ReadCacheConfiguration")]
        getter read_cache_configuration : Types::OpenZFSReadCacheConfiguration?

        # The configuration Amazon FSx uses when creating the root value of the Amazon FSx for OpenZFS file
        # system. All volumes are children of the root volume.
        @[JSON::Field(key: "RootVolumeConfiguration")]
        getter root_volume_configuration : Types::OpenZFSCreateRootVolumeConfiguration?

        # (Multi-AZ only) Specifies the route tables in which Amazon FSx creates the rules for routing traffic
        # to the correct file server. You should specify all virtual private cloud (VPC) route tables
        # associated with the subnets in which your clients are located. By default, Amazon FSx selects your
        # VPC's default route table.
        @[JSON::Field(key: "RouteTableIds")]
        getter route_table_ids : Array(String)?

        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @deployment_type : String,
          @throughput_capacity : Int32,
          @automatic_backup_retention_days : Int32? = nil,
          @copy_tags_to_backups : Bool? = nil,
          @copy_tags_to_volumes : Bool? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @disk_iops_configuration : Types::DiskIopsConfiguration? = nil,
          @endpoint_ip_address_range : String? = nil,
          @endpoint_ipv6_address_range : String? = nil,
          @preferred_subnet_id : String? = nil,
          @read_cache_configuration : Types::OpenZFSReadCacheConfiguration? = nil,
          @root_volume_configuration : Types::OpenZFSCreateRootVolumeConfiguration? = nil,
          @route_table_ids : Array(String)? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # The request object used to create a new Amazon FSx file system.
      struct CreateFileSystemRequest
        include JSON::Serializable

        # The type of Amazon FSx file system to create. Valid values are WINDOWS , LUSTRE , ONTAP , and
        # OPENZFS .
        @[JSON::Field(key: "FileSystemType")]
        getter file_system_type : String

        # Specifies the IDs of the subnets that the file system will be accessible from. For Windows and ONTAP
        # MULTI_AZ_1 deployment types,provide exactly two subnet IDs, one for the preferred file server and
        # one for the standby file server. You specify one of these subnets as the preferred subnet using the
        # WindowsConfiguration &gt; PreferredSubnetID or OntapConfiguration &gt; PreferredSubnetID properties.
        # For more information about Multi-AZ file system configuration, see Availability and durability:
        # Single-AZ and Multi-AZ file systems in the Amazon FSx for Windows User Guide and Availability and
        # durability in the Amazon FSx for ONTAP User Guide . For Windows SINGLE_AZ_1 and SINGLE_AZ_2 and all
        # Lustre deployment types, provide exactly one subnet ID. The file server is launched in that subnet's
        # Availability Zone.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent creation. This
        # string is automatically filled on your behalf when you use the Command Line Interface (CLI) or an
        # Amazon Web Services SDK.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # For FSx for Lustre file systems, sets the Lustre version for the file system that you're creating.
        # Valid values are 2.10 , 2.12 , and 2.15 : 2.10 is supported by the Scratch and Persistent_1 Lustre
        # deployment types. 2.12 is supported by all Lustre deployment types, except for PERSISTENT_2 with a
        # metadata configuration mode. 2.15 is supported by all Lustre deployment types and is recommended for
        # all new file systems. Default value is 2.10 , except for the following deployments: Default value is
        # 2.12 when DeploymentType is set to PERSISTENT_2 without a metadata configuration mode. Default value
        # is 2.15 when DeploymentType is set to PERSISTENT_2 with a metadata configuration mode.
        @[JSON::Field(key: "FileSystemTypeVersion")]
        getter file_system_type_version : String?

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        @[JSON::Field(key: "LustreConfiguration")]
        getter lustre_configuration : Types::CreateFileSystemLustreConfiguration?

        # The network type of the Amazon FSx file system that you are creating. Valid values are IPV4 (which
        # supports IPv4 only) and DUAL (for dual-stack mode, which supports both IPv4 and IPv6). The default
        # is IPV4 . Supported for FSx for OpenZFS, FSx for ONTAP, and FSx for Windows File Server file
        # systems.
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::CreateFileSystemOntapConfiguration?

        # The OpenZFS configuration for the file system that's being created.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::CreateFileSystemOpenZFSConfiguration?

        # A list of IDs specifying the security groups to apply to all network interfaces created for file
        # system access. This list isn't returned in later requests to describe the file system. You must
        # specify a security group if you are creating a Multi-AZ FSx for ONTAP file system in a VPC subnet
        # that has been shared with you.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # Sets the storage capacity of the file system that you're creating, in gibibytes (GiB). FSx for
        # Lustre file systems - The amount of storage capacity that you can configure depends on the value
        # that you set for StorageType and the Lustre DeploymentType , as follows: For SCRATCH_2 ,
        # PERSISTENT_2 , and PERSISTENT_1 deployment types using SSD storage type, the valid values are 1200
        # GiB, 2400 GiB, and increments of 2400 GiB. For PERSISTENT_1 HDD file systems, valid values are
        # increments of 6000 GiB for 12 MB/s/TiB file systems and increments of 1800 GiB for 40 MB/s/TiB file
        # systems. For SCRATCH_1 deployment type, valid values are 1200 GiB, 2400 GiB, and increments of 3600
        # GiB. FSx for ONTAP file systems - The amount of storage capacity that you can configure depends on
        # the value of the HAPairs property. The minimum value is calculated as 1,024 * HAPairs and the
        # maximum is calculated as 524,288 * HAPairs . FSx for OpenZFS file systems - The amount of storage
        # capacity that you can configure is from 64 GiB up to 524,288 GiB (512 TiB). FSx for Windows File
        # Server file systems - The amount of storage capacity that you can configure depends on the value
        # that you set for StorageType as follows: For SSD storage, valid values are 32 GiB-65,536 GiB (64
        # TiB). For HDD storage, valid values are 2000 GiB-65,536 GiB (64 TiB).
        @[JSON::Field(key: "StorageCapacity")]
        getter storage_capacity : Int32?

        # Sets the storage class for the file system that you're creating. Valid values are SSD , HDD , and
        # INTELLIGENT_TIERING . Set to SSD to use solid state drive storage. SSD is supported on all Windows,
        # Lustre, ONTAP, and OpenZFS deployment types. Set to HDD to use hard disk drive storage, which is
        # supported on SINGLE_AZ_2 and MULTI_AZ_1 Windows file system deployment types, and on PERSISTENT_1
        # Lustre file system deployment types. Set to INTELLIGENT_TIERING to use fully elastic,
        # intelligently-tiered storage. Intelligent-Tiering is only available for OpenZFS file systems with
        # the Multi-AZ deployment type and for Lustre file systems with the Persistent_2 deployment type.
        # Default value is SSD . For more information, see Storage type options in the FSx for Windows File
        # Server User Guide , FSx for Lustre storage classes in the FSx for Lustre User Guide , and Working
        # with Intelligent-Tiering in the Amazon FSx for OpenZFS User Guide .
        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The tags to apply to the file system that's being created. The key value of the Name tag appears in
        # the console as the file system name.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The Microsoft Windows configuration for the file system that's being created.
        @[JSON::Field(key: "WindowsConfiguration")]
        getter windows_configuration : Types::CreateFileSystemWindowsConfiguration?

        def initialize(
          @file_system_type : String,
          @subnet_ids : Array(String),
          @client_request_token : String? = nil,
          @file_system_type_version : String? = nil,
          @kms_key_id : String? = nil,
          @lustre_configuration : Types::CreateFileSystemLustreConfiguration? = nil,
          @network_type : String? = nil,
          @ontap_configuration : Types::CreateFileSystemOntapConfiguration? = nil,
          @open_zfs_configuration : Types::CreateFileSystemOpenZFSConfiguration? = nil,
          @security_group_ids : Array(String)? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @windows_configuration : Types::CreateFileSystemWindowsConfiguration? = nil
        )
        end
      end

      # The response object returned after the file system is created.
      struct CreateFileSystemResponse
        include JSON::Serializable

        # The configuration of the file system that was created.
        @[JSON::Field(key: "FileSystem")]
        getter file_system : Types::FileSystem?

        def initialize(
          @file_system : Types::FileSystem? = nil
        )
        end
      end

      # The configuration object for the Microsoft Windows file system used in CreateFileSystem and
      # CreateFileSystemFromBackup operations.
      struct CreateFileSystemWindowsConfiguration
        include JSON::Serializable

        # Sets the throughput capacity of an Amazon FSx file system, measured in megabytes per second (MB/s),
        # in 2 to the n th increments, between 2^3 (8) and 2^11 (2048).
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32

        # The ID for an existing Amazon Web Services Managed Microsoft Active Directory (AD) instance that the
        # file system should join when it's created.
        @[JSON::Field(key: "ActiveDirectoryId")]
        getter active_directory_id : String?

        # An array of one or more DNS alias names that you want to associate with the Amazon FSx file system.
        # Aliases allow you to use existing DNS names to access the data in your Amazon FSx file system. You
        # can associate up to 50 aliases with a file system at any time. You can associate additional DNS
        # aliases after you create the file system using the AssociateFileSystemAliases operation. You can
        # remove DNS aliases from the file system after it is created using the DisassociateFileSystemAliases
        # operation. You only need to specify the alias name in the request payload. For more information, see
        # Managing DNS aliases and Accessing data using DNS aliases . An alias name has to meet the following
        # requirements: Formatted as a fully-qualified domain name (FQDN), hostname.domain , for example,
        # accounting.example.com . Can contain alphanumeric characters, the underscore (_), and the hyphen
        # (-). Cannot start or end with a hyphen. Can start with a numeric. For DNS alias names, Amazon FSx
        # stores alphabetic characters as lowercase letters (a-z), regardless of how you specify them: as
        # uppercase letters, lowercase letters, or the corresponding letters in escape codes.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(String)?

        # The configuration that Amazon FSx for Windows File Server uses to audit and log user accesses of
        # files, folders, and file shares on the Amazon FSx for Windows File Server file system.
        @[JSON::Field(key: "AuditLogConfiguration")]
        getter audit_log_configuration : Types::WindowsAuditLogCreateConfiguration?

        # The number of days to retain automatic backups. Setting this property to 0 disables automatic
        # backups. You can retain automatic backups for a maximum of 90 days. The default is 30 .
        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        # A boolean flag indicating whether tags for the file system should be copied to backups. This value
        # defaults to false. If it's set to true, all tags for the file system are copied to all automatic and
        # user-initiated backups where the user doesn't specify tags. If this value is true, and you specify
        # one or more tags, only the specified tags are copied to backups. If you specify one or more tags
        # when creating a user-initiated backup, no tags are copied from the file system, regardless of this
        # value.
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        # The preferred time to take daily automatic backups, formatted HH:MM in the UTC time zone.
        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # Specifies the file system deployment type, valid values are the following: MULTI_AZ_1 - Deploys a
        # high availability file system that is configured for Multi-AZ redundancy to tolerate temporary
        # Availability Zone (AZ) unavailability. You can only deploy a Multi-AZ file system in Amazon Web
        # Services Regions that have a minimum of three Availability Zones. Also supports HDD storage type
        # SINGLE_AZ_1 - (Default) Choose to deploy a file system that is configured for single AZ redundancy.
        # SINGLE_AZ_2 - The latest generation Single AZ file system. Specifies a file system that is
        # configured for single AZ redundancy and supports HDD storage type. For more information, see
        # Availability and Durability: Single-AZ and Multi-AZ File Systems .
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # The SSD IOPS (input/output operations per second) configuration for an Amazon FSx for Windows file
        # system. By default, Amazon FSx automatically provisions 3 IOPS per GiB of storage capacity. You can
        # provision additional IOPS per GiB of storage, up to the maximum limit associated with your chosen
        # throughput capacity.
        @[JSON::Field(key: "DiskIopsConfiguration")]
        getter disk_iops_configuration : Types::DiskIopsConfiguration?

        # The File Server Resource Manager (FSRM) configuration that Amazon FSx for Windows File Server uses
        # for the file system. FSRM is disabled by default.
        @[JSON::Field(key: "FsrmConfiguration")]
        getter fsrm_configuration : Types::WindowsFsrmConfiguration?

        # Required when DeploymentType is set to MULTI_AZ_1 . This specifies the subnet in which you want the
        # preferred file server to be located. For in-Amazon Web Services applications, we recommend that you
        # launch your clients in the same Availability Zone (AZ) as your preferred file server to reduce
        # cross-AZ data transfer costs and minimize latency.
        @[JSON::Field(key: "PreferredSubnetId")]
        getter preferred_subnet_id : String?

        @[JSON::Field(key: "SelfManagedActiveDirectoryConfiguration")]
        getter self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryConfiguration?

        # The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone,
        # where d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.
        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @throughput_capacity : Int32,
          @active_directory_id : String? = nil,
          @aliases : Array(String)? = nil,
          @audit_log_configuration : Types::WindowsAuditLogCreateConfiguration? = nil,
          @automatic_backup_retention_days : Int32? = nil,
          @copy_tags_to_backups : Bool? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @deployment_type : String? = nil,
          @disk_iops_configuration : Types::DiskIopsConfiguration? = nil,
          @fsrm_configuration : Types::WindowsFsrmConfiguration? = nil,
          @preferred_subnet_id : String? = nil,
          @self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryConfiguration? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # Specifies the configuration of the ONTAP volume that you are creating.
      struct CreateOntapVolumeConfiguration
        include JSON::Serializable

        # Specifies the ONTAP SVM in which to create the volume.
        @[JSON::Field(key: "StorageVirtualMachineId")]
        getter storage_virtual_machine_id : String

        # Use to specify configuration options for a volume’s storage aggregate or aggregates.
        @[JSON::Field(key: "AggregateConfiguration")]
        getter aggregate_configuration : Types::CreateAggregateConfiguration?

        # A boolean flag indicating whether tags for the volume should be copied to backups. This value
        # defaults to false. If it's set to true, all tags for the volume are copied to all automatic and
        # user-initiated backups where the user doesn't specify tags. If this value is true, and you specify
        # one or more tags, only the specified tags are copied to backups. If you specify one or more tags
        # when creating a user-initiated backup, no tags are copied from the volume, regardless of this value.
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        # Specifies the location in the SVM's namespace where the volume is mounted. This parameter is
        # required. The JunctionPath must have a leading forward slash, such as /vol3 .
        @[JSON::Field(key: "JunctionPath")]
        getter junction_path : String?

        # Specifies the type of volume you are creating. Valid values are the following: RW specifies a
        # read/write volume. RW is the default. DP specifies a data-protection volume. A DP volume is
        # read-only and can be used as the destination of a NetApp SnapMirror relationship. For more
        # information, see Volume types in the Amazon FSx for NetApp ONTAP User Guide.
        @[JSON::Field(key: "OntapVolumeType")]
        getter ontap_volume_type : String?

        # Specifies the security style for the volume. If a volume's security style is not specified, it is
        # automatically set to the root volume's security style. The security style determines the type of
        # permissions that FSx for ONTAP uses to control data access. Specify one of the following values:
        # UNIX if the file system is managed by a UNIX administrator, the majority of users are NFS clients,
        # and an application accessing the data uses a UNIX user as the service account. NTFS if the file
        # system is managed by a Windows administrator, the majority of users are SMB clients, and an
        # application accessing the data uses a Windows user as the service account. MIXED This is an advanced
        # setting. For more information, see the topic What the security styles and their effects are in the
        # NetApp Documentation Center. For more information, see Volume security style in the FSx for ONTAP
        # User Guide.
        @[JSON::Field(key: "SecurityStyle")]
        getter security_style : String?

        # Specifies the configured size of the volume, in bytes.
        @[JSON::Field(key: "SizeInBytes")]
        getter size_in_bytes : Int64?

        # Use SizeInBytes instead. Specifies the size of the volume, in megabytes (MB), that you are creating.
        @[JSON::Field(key: "SizeInMegabytes")]
        getter size_in_megabytes : Int32?

        # Specifies the SnapLock configuration for an FSx for ONTAP volume.
        @[JSON::Field(key: "SnaplockConfiguration")]
        getter snaplock_configuration : Types::CreateSnaplockConfiguration?

        # Specifies the snapshot policy for the volume. There are three built-in snapshot policies: default :
        # This is the default policy. A maximum of six hourly snapshots taken five minutes past the hour. A
        # maximum of two daily snapshots taken Monday through Saturday at 10 minutes after midnight. A maximum
        # of two weekly snapshots taken every Sunday at 15 minutes after midnight. default-1weekly : This
        # policy is the same as the default policy except that it only retains one snapshot from the weekly
        # schedule. none : This policy does not take any snapshots. This policy can be assigned to volumes to
        # prevent automatic snapshots from being taken. You can also provide the name of a custom policy that
        # you created with the ONTAP CLI or REST API. For more information, see Snapshot policies in the
        # Amazon FSx for NetApp ONTAP User Guide.
        @[JSON::Field(key: "SnapshotPolicy")]
        getter snapshot_policy : String?

        # Set to true to enable deduplication, compression, and compaction storage efficiency features on the
        # volume, or set to false to disable them. StorageEfficiencyEnabled is required when creating a RW
        # volume ( OntapVolumeType set to RW ).
        @[JSON::Field(key: "StorageEfficiencyEnabled")]
        getter storage_efficiency_enabled : Bool?

        @[JSON::Field(key: "TieringPolicy")]
        getter tiering_policy : Types::TieringPolicy?

        # Use to specify the style of an ONTAP volume. FSx for ONTAP offers two styles of volumes that you can
        # use for different purposes, FlexVol and FlexGroup volumes. For more information, see Volume styles
        # in the Amazon FSx for NetApp ONTAP User Guide.
        @[JSON::Field(key: "VolumeStyle")]
        getter volume_style : String?

        def initialize(
          @storage_virtual_machine_id : String,
          @aggregate_configuration : Types::CreateAggregateConfiguration? = nil,
          @copy_tags_to_backups : Bool? = nil,
          @junction_path : String? = nil,
          @ontap_volume_type : String? = nil,
          @security_style : String? = nil,
          @size_in_bytes : Int64? = nil,
          @size_in_megabytes : Int32? = nil,
          @snaplock_configuration : Types::CreateSnaplockConfiguration? = nil,
          @snapshot_policy : String? = nil,
          @storage_efficiency_enabled : Bool? = nil,
          @tiering_policy : Types::TieringPolicy? = nil,
          @volume_style : String? = nil
        )
        end
      end

      # The snapshot configuration to use when creating an Amazon FSx for OpenZFS volume from a snapshot.
      struct CreateOpenZFSOriginSnapshotConfiguration
        include JSON::Serializable

        # Specifies the strategy used when copying data from the snapshot to the new volume. CLONE - The new
        # volume references the data in the origin snapshot. Cloning a snapshot is faster than copying data
        # from the snapshot to a new volume and doesn't consume disk throughput. However, the origin snapshot
        # can't be deleted if there is a volume using its copied data. FULL_COPY - Copies all data from the
        # snapshot to the new volume. Specify this option to create the volume from a snapshot on another FSx
        # for OpenZFS file system. The INCREMENTAL_COPY option is only for updating an existing volume by
        # using a snapshot from another FSx for OpenZFS file system. For more information, see
        # CopySnapshotAndUpdateVolume .
        @[JSON::Field(key: "CopyStrategy")]
        getter copy_strategy : String

        @[JSON::Field(key: "SnapshotARN")]
        getter snapshot_arn : String

        def initialize(
          @copy_strategy : String,
          @snapshot_arn : String
        )
        end
      end

      # Specifies the configuration of the Amazon FSx for OpenZFS volume that you are creating.
      struct CreateOpenZFSVolumeConfiguration
        include JSON::Serializable

        # The ID of the volume to use as the parent volume of the volume that you are creating.
        @[JSON::Field(key: "ParentVolumeId")]
        getter parent_volume_id : String

        # A Boolean value indicating whether tags for the volume should be copied to snapshots. This value
        # defaults to false . If this value is set to true , and you do not specify any tags, all tags for the
        # original volume are copied over to snapshots. If this value is set to true , and you do specify one
        # or more tags, only the specified tags for the original volume are copied over to snapshots. If you
        # specify one or more tags when creating a new snapshot, no tags are copied over from the original
        # volume, regardless of this value.
        @[JSON::Field(key: "CopyTagsToSnapshots")]
        getter copy_tags_to_snapshots : Bool?

        # Specifies the method used to compress the data on the volume. The compression type is NONE by
        # default. NONE - Doesn't compress the data on the volume. NONE is the default. ZSTD - Compresses the
        # data in the volume using the Zstandard (ZSTD) compression algorithm. ZSTD compression provides a
        # higher level of data compression and higher read throughput performance than LZ4 compression. LZ4 -
        # Compresses the data in the volume using the LZ4 compression algorithm. LZ4 compression provides a
        # lower level of compression and higher write throughput performance than ZSTD compression. For more
        # information about volume compression types and the performance of your Amazon FSx for OpenZFS file
        # system, see Tips for maximizing performance File system and volume settings in the Amazon FSx for
        # OpenZFS User Guide .
        @[JSON::Field(key: "DataCompressionType")]
        getter data_compression_type : String?

        # The configuration object for mounting a Network File System (NFS) file system.
        @[JSON::Field(key: "NfsExports")]
        getter nfs_exports : Array(Types::OpenZFSNfsExport)?

        # The configuration object that specifies the snapshot to use as the origin of the data for the
        # volume.
        @[JSON::Field(key: "OriginSnapshot")]
        getter origin_snapshot : Types::CreateOpenZFSOriginSnapshotConfiguration?

        # A Boolean value indicating whether the volume is read-only.
        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # Specifies the suggested block size for a volume in a ZFS dataset, in kibibytes (KiB). For file
        # systems using the Intelligent-Tiering storage class, valid values are 128, 256, 512, 1024, 2048, or
        # 4096 KiB, with a default of 1024 KiB. For all other file systems, valid values are 4, 8, 16, 32, 64,
        # 128, 256, 512, or 1024 KiB, with a default of 128 KiB. We recommend using the default setting for
        # the majority of use cases. Generally, workloads that write in fixed small or large record sizes may
        # benefit from setting a custom record size, like database workloads (small record size) or media
        # streaming workloads (large record size). For additional guidance on when to set a custom record
        # size, see ZFS Record size in the Amazon FSx for OpenZFS User Guide .
        @[JSON::Field(key: "RecordSizeKiB")]
        getter record_size_ki_b : Int32?

        # Sets the maximum storage size in gibibytes (GiB) for the volume. You can specify a quota that is
        # larger than the storage on the parent volume. A volume quota limits the amount of storage that the
        # volume can consume to the configured amount, but does not guarantee the space will be available on
        # the parent volume. To guarantee quota space, you must also set StorageCapacityReservationGiB . To
        # not specify a storage capacity quota, set this to -1 . For more information, see Volume properties
        # in the Amazon FSx for OpenZFS User Guide .
        @[JSON::Field(key: "StorageCapacityQuotaGiB")]
        getter storage_capacity_quota_gi_b : Int32?

        # Specifies the amount of storage in gibibytes (GiB) to reserve from the parent volume. Setting
        # StorageCapacityReservationGiB guarantees that the specified amount of storage space on the parent
        # volume will always be available for the volume. You can't reserve more storage than the parent
        # volume has. To not specify a storage capacity reservation, set this to 0 or -1 . For more
        # information, see Volume properties in the Amazon FSx for OpenZFS User Guide .
        @[JSON::Field(key: "StorageCapacityReservationGiB")]
        getter storage_capacity_reservation_gi_b : Int32?

        # Configures how much storage users and groups can use on the volume.
        @[JSON::Field(key: "UserAndGroupQuotas")]
        getter user_and_group_quotas : Array(Types::OpenZFSUserOrGroupQuota)?

        def initialize(
          @parent_volume_id : String,
          @copy_tags_to_snapshots : Bool? = nil,
          @data_compression_type : String? = nil,
          @nfs_exports : Array(Types::OpenZFSNfsExport)? = nil,
          @origin_snapshot : Types::CreateOpenZFSOriginSnapshotConfiguration? = nil,
          @read_only : Bool? = nil,
          @record_size_ki_b : Int32? = nil,
          @storage_capacity_quota_gi_b : Int32? = nil,
          @storage_capacity_reservation_gi_b : Int32? = nil,
          @user_and_group_quotas : Array(Types::OpenZFSUserOrGroupQuota)? = nil
        )
        end
      end

      # Defines the SnapLock configuration when creating an FSx for ONTAP SnapLock volume.
      struct CreateSnaplockConfiguration
        include JSON::Serializable

        # Specifies the retention mode of an FSx for ONTAP SnapLock volume. After it is set, it can't be
        # changed. You can choose one of the following retention modes: COMPLIANCE : Files transitioned to
        # write once, read many (WORM) on a Compliance volume can't be deleted until their retention periods
        # expire. This retention mode is used to address government or industry-specific mandates or to
        # protect against ransomware attacks. For more information, see SnapLock Compliance . ENTERPRISE :
        # Files transitioned to WORM on an Enterprise volume can be deleted by authorized users before their
        # retention periods expire using privileged delete. This retention mode is used to advance an
        # organization's data integrity and internal compliance or to test retention settings before using
        # SnapLock Compliance. For more information, see SnapLock Enterprise .
        @[JSON::Field(key: "SnaplockType")]
        getter snaplock_type : String

        # Enables or disables the audit log volume for an FSx for ONTAP SnapLock volume. The default value is
        # false . If you set AuditLogVolume to true , the SnapLock volume is created as an audit log volume.
        # The minimum retention period for an audit log volume is six months. For more information, see
        # SnapLock audit log volumes .
        @[JSON::Field(key: "AuditLogVolume")]
        getter audit_log_volume : Bool?

        # The configuration object for setting the autocommit period of files in an FSx for ONTAP SnapLock
        # volume.
        @[JSON::Field(key: "AutocommitPeriod")]
        getter autocommit_period : Types::AutocommitPeriod?

        # Enables, disables, or permanently disables privileged delete on an FSx for ONTAP SnapLock Enterprise
        # volume. Enabling privileged delete allows SnapLock administrators to delete WORM files even if they
        # have active retention periods. PERMANENTLY_DISABLED is a terminal state. If privileged delete is
        # permanently disabled on a SnapLock volume, you can't re-enable it. The default value is DISABLED .
        # For more information, see Privileged delete .
        @[JSON::Field(key: "PrivilegedDelete")]
        getter privileged_delete : String?

        # Specifies the retention period of an FSx for ONTAP SnapLock volume.
        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::SnaplockRetentionPeriod?

        # Enables or disables volume-append mode on an FSx for ONTAP SnapLock volume. Volume-append mode
        # allows you to create WORM-appendable files and write data to them incrementally. The default value
        # is false . For more information, see Volume-append mode .
        @[JSON::Field(key: "VolumeAppendModeEnabled")]
        getter volume_append_mode_enabled : Bool?

        def initialize(
          @snaplock_type : String,
          @audit_log_volume : Bool? = nil,
          @autocommit_period : Types::AutocommitPeriod? = nil,
          @privileged_delete : String? = nil,
          @retention_period : Types::SnaplockRetentionPeriod? = nil,
          @volume_append_mode_enabled : Bool? = nil
        )
        end
      end

      struct CreateSnapshotRequest
        include JSON::Serializable

        # The name of the snapshot.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the volume that you are taking a snapshot of.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @volume_id : String,
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSnapshotResponse
        include JSON::Serializable

        # A description of the snapshot.
        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct CreateStorageVirtualMachineRequest
        include JSON::Serializable

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # The name of the SVM.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Describes the self-managed Microsoft Active Directory to which you want to join the SVM. Joining an
        # Active Directory provides user authentication and access control for SMB clients, including
        # Microsoft Windows and macOS clients accessing the file system.
        @[JSON::Field(key: "ActiveDirectoryConfiguration")]
        getter active_directory_configuration : Types::CreateSvmActiveDirectoryConfiguration?

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The security style of the root volume of the SVM. Specify one of the following values: UNIX if the
        # file system is managed by a UNIX administrator, the majority of users are NFS clients, and an
        # application accessing the data uses a UNIX user as the service account. NTFS if the file system is
        # managed by a Microsoft Windows administrator, the majority of users are SMB clients, and an
        # application accessing the data uses a Microsoft Windows user as the service account. MIXED This is
        # an advanced setting. For more information, see Volume security style in the Amazon FSx for NetApp
        # ONTAP User Guide.
        @[JSON::Field(key: "RootVolumeSecurityStyle")]
        getter root_volume_security_style : String?

        # The password to use when managing the SVM using the NetApp ONTAP CLI or REST API. If you do not
        # specify a password, you can still use the file system's fsxadmin user to manage the SVM.
        @[JSON::Field(key: "SvmAdminPassword")]
        getter svm_admin_password : String?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @file_system_id : String,
          @name : String,
          @active_directory_configuration : Types::CreateSvmActiveDirectoryConfiguration? = nil,
          @client_request_token : String? = nil,
          @root_volume_security_style : String? = nil,
          @svm_admin_password : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateStorageVirtualMachineResponse
        include JSON::Serializable

        # Returned after a successful CreateStorageVirtualMachine operation; describes the SVM just created.
        @[JSON::Field(key: "StorageVirtualMachine")]
        getter storage_virtual_machine : Types::StorageVirtualMachine?

        def initialize(
          @storage_virtual_machine : Types::StorageVirtualMachine? = nil
        )
        end
      end

      # The configuration that Amazon FSx uses to join the ONTAP storage virtual machine (SVM) to your
      # self-managed (including on-premises) Microsoft Active Directory directory.
      struct CreateSvmActiveDirectoryConfiguration
        include JSON::Serializable

        # The NetBIOS name of the Active Directory computer object that will be created for your SVM.
        @[JSON::Field(key: "NetBiosName")]
        getter net_bios_name : String

        @[JSON::Field(key: "SelfManagedActiveDirectoryConfiguration")]
        getter self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryConfiguration?

        def initialize(
          @net_bios_name : String,
          @self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryConfiguration? = nil
        )
        end
      end

      struct CreateVolumeFromBackupRequest
        include JSON::Serializable

        @[JSON::Field(key: "BackupId")]
        getter backup_id : String

        # The name of the new volume you're creating.
        @[JSON::Field(key: "Name")]
        getter name : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Specifies the configuration of the ONTAP volume that you are creating.
        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::CreateOntapVolumeConfiguration?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @backup_id : String,
          @name : String,
          @client_request_token : String? = nil,
          @ontap_configuration : Types::CreateOntapVolumeConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateVolumeFromBackupResponse
        include JSON::Serializable

        # Returned after a successful CreateVolumeFromBackup API operation, describing the volume just
        # created.
        @[JSON::Field(key: "Volume")]
        getter volume : Types::Volume?

        def initialize(
          @volume : Types::Volume? = nil
        )
        end
      end

      struct CreateVolumeRequest
        include JSON::Serializable

        # Specifies the name of the volume that you're creating.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies the type of volume to create; ONTAP and OPENZFS are the only valid volume types.
        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Specifies the configuration to use when creating the ONTAP volume.
        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::CreateOntapVolumeConfiguration?

        # Specifies the configuration to use when creating the OpenZFS volume.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::CreateOpenZFSVolumeConfiguration?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @volume_type : String,
          @client_request_token : String? = nil,
          @ontap_configuration : Types::CreateOntapVolumeConfiguration? = nil,
          @open_zfs_configuration : Types::CreateOpenZFSVolumeConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateVolumeResponse
        include JSON::Serializable

        # Returned after a successful CreateVolume API operation, describing the volume just created.
        @[JSON::Field(key: "Volume")]
        getter volume : Types::Volume?

        def initialize(
          @volume : Types::Volume? = nil
        )
        end
      end

      # The configuration of a data repository association that links an Amazon FSx for Lustre file system
      # to an Amazon S3 bucket or an Amazon File Cache resource to an Amazon S3 bucket or an NFS file
      # system. The data repository association configuration object is returned in the response of the
      # following operations: CreateDataRepositoryAssociation UpdateDataRepositoryAssociation
      # DescribeDataRepositoryAssociations Data repository associations are supported on Amazon File Cache
      # resources and all FSx for Lustre 2.12 and 2.15 file systems, excluding Intelligent-Tiering and
      # scratch_1 file systems.
      struct DataRepositoryAssociation
        include JSON::Serializable

        # The system-generated, unique ID of the data repository association.
        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # A boolean flag indicating whether an import data repository task to import metadata should run after
        # the data repository association is created. The task runs if this flag is set to true .
        # BatchImportMetaDataOnCreate is not supported for data repositories linked to an Amazon File Cache
        # resource.
        @[JSON::Field(key: "BatchImportMetaDataOnCreate")]
        getter batch_import_meta_data_on_create : Bool?

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The path to the data repository that will be linked to the cache or file system. For Amazon File
        # Cache, the path can be an NFS data repository that will be linked to the cache. The path can be in
        # one of two formats: If you are not using the DataRepositorySubdirectories parameter, the path is to
        # an NFS Export directory (or one of its subdirectories) in the format
        # nsf://nfs-domain-name/exportpath . You can therefore link a single NFS Export to a single data
        # repository association. If you are using the DataRepositorySubdirectories parameter, the path is the
        # domain name of the NFS file system in the format nfs://filer-domain-name , which indicates the root
        # of the subdirectories specified with the DataRepositorySubdirectories parameter. For Amazon File
        # Cache, the path can be an S3 bucket or prefix in the format s3://bucket-name/prefix/ (where prefix
        # is optional). For Amazon FSx for Lustre, the path can be an S3 bucket or prefix in the format
        # s3://bucket-name/prefix/ (where prefix is optional).
        @[JSON::Field(key: "DataRepositoryPath")]
        getter data_repository_path : String?

        # For Amazon File Cache, a list of NFS Exports that will be linked with an NFS data repository
        # association. All the subdirectories must be on a single NFS file system. The Export paths are in the
        # format /exportpath1 . To use this parameter, you must configure DataRepositoryPath as the domain
        # name of the NFS file system. The NFS file system domain name in effect is the root of the
        # subdirectories. Note that DataRepositorySubdirectories is not supported for S3 data repositories.
        @[JSON::Field(key: "DataRepositorySubdirectories")]
        getter data_repository_subdirectories : Array(String)?

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::DataRepositoryFailureDetails?

        # The globally unique ID of the Amazon File Cache resource.
        @[JSON::Field(key: "FileCacheId")]
        getter file_cache_id : String?

        # A path on the Amazon File Cache that points to a high-level directory (such as /ns1/ ) or
        # subdirectory (such as /ns1/subdir/ ) that will be mapped 1-1 with DataRepositoryPath . The leading
        # forward slash in the path is required. Two data repository associations cannot have overlapping
        # cache paths. For example, if a data repository is associated with cache path /ns1/ , then you cannot
        # link another data repository with cache path /ns1/ns2 . This path specifies the directory in your
        # cache where files will be exported from. This cache directory can be linked to only one data
        # repository (S3 or NFS) and no other data repository can be linked to the directory. The cache path
        # can only be set to root (/) on an NFS DRA when DataRepositorySubdirectories is specified. If you
        # specify root (/) as the cache path, you can create only one DRA on the cache. The cache path cannot
        # be set to root (/) for an S3 DRA.
        @[JSON::Field(key: "FileCachePath")]
        getter file_cache_path : String?

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # A path on the Amazon FSx for Lustre file system that points to a high-level directory (such as /ns1/
        # ) or subdirectory (such as /ns1/subdir/ ) that will be mapped 1-1 with DataRepositoryPath . The
        # leading forward slash in the name is required. Two data repository associations cannot have
        # overlapping file system paths. For example, if a data repository is associated with file system path
        # /ns1/ , then you cannot link another data repository with file system path /ns1/ns2 . This path
        # specifies where in your file system files will be exported from or imported to. This file system
        # directory can be linked to only one Amazon S3 bucket, and no other S3 bucket can be linked to the
        # directory. If you specify only a forward slash ( / ) as the file system path, you can link only one
        # data repository to the file system. You can only specify "/" as the file system path for the first
        # data repository associated with a file system.
        @[JSON::Field(key: "FileSystemPath")]
        getter file_system_path : String?

        # For files imported from a data repository, this value determines the stripe count and maximum amount
        # of data per file (in MiB) stored on a single physical disk. The maximum number of disks that a
        # single file can be striped across is limited by the total number of disks that make up the file
        # system or cache. The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500
        # GiB). Amazon S3 objects have a maximum size of 5 TB.
        @[JSON::Field(key: "ImportedFileChunkSize")]
        getter imported_file_chunk_size : Int32?

        # Describes the state of a data repository association. The lifecycle can have the following values:
        # CREATING - The data repository association between the file system or cache and the data repository
        # is being created. The data repository is unavailable. AVAILABLE - The data repository association is
        # available for use. MISCONFIGURED - The data repository association is misconfigured. Until the
        # configuration is corrected, automatic import and automatic export will not work (only for Amazon FSx
        # for Lustre). UPDATING - The data repository association is undergoing a customer initiated update
        # that might affect its availability. DELETING - The data repository association is undergoing a
        # customer initiated deletion. FAILED - The data repository association is in a terminal state that
        # cannot be recovered.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The configuration for an NFS data repository linked to an Amazon File Cache resource with a data
        # repository association.
        @[JSON::Field(key: "NFS")]
        getter nfs : Types::NFSDataRepositoryConfiguration?

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The configuration for an Amazon S3 data repository linked to an Amazon FSx for Lustre file system
        # with a data repository association.
        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3DataRepositoryConfiguration?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @association_id : String? = nil,
          @batch_import_meta_data_on_create : Bool? = nil,
          @creation_time : Time? = nil,
          @data_repository_path : String? = nil,
          @data_repository_subdirectories : Array(String)? = nil,
          @failure_details : Types::DataRepositoryFailureDetails? = nil,
          @file_cache_id : String? = nil,
          @file_cache_path : String? = nil,
          @file_system_id : String? = nil,
          @file_system_path : String? = nil,
          @imported_file_chunk_size : Int32? = nil,
          @lifecycle : String? = nil,
          @nfs : Types::NFSDataRepositoryConfiguration? = nil,
          @resource_arn : String? = nil,
          @s3 : Types::S3DataRepositoryConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # No data repository associations were found based upon the supplied parameters.
      struct DataRepositoryAssociationNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The data repository configuration object for Lustre file systems returned in the response of the
      # CreateFileSystem operation. This data type is not supported on file systems with a data repository
      # association. For file systems with a data repository association, see .
      struct DataRepositoryConfiguration
        include JSON::Serializable

        # Describes the file system's linked S3 data repository's AutoImportPolicy . The AutoImportPolicy
        # configures how Amazon FSx keeps your file and directory listings up to date as you add or modify
        # objects in your linked S3 bucket. AutoImportPolicy can have the following values: NONE - (Default)
        # AutoImport is off. Amazon FSx only updates file and directory listings from the linked S3 bucket
        # when the file system is created. FSx does not update file and directory listings for any new or
        # changed objects after choosing this option. NEW - AutoImport is on. Amazon FSx automatically imports
        # directory listings of any new objects added to the linked S3 bucket that do not currently exist in
        # the FSx file system. NEW_CHANGED - AutoImport is on. Amazon FSx automatically imports file and
        # directory listings of any new objects added to the S3 bucket and any existing objects that are
        # changed in the S3 bucket after you choose this option. NEW_CHANGED_DELETED - AutoImport is on.
        # Amazon FSx automatically imports file and directory listings of any new objects added to the S3
        # bucket, any existing objects that are changed in the S3 bucket, and any objects that were deleted in
        # the S3 bucket.
        @[JSON::Field(key: "AutoImportPolicy")]
        getter auto_import_policy : String?

        # The export path to the Amazon S3 bucket (and prefix) that you are using to store new and changed
        # Lustre file system files in S3.
        @[JSON::Field(key: "ExportPath")]
        getter export_path : String?

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::DataRepositoryFailureDetails?

        # The import path to the Amazon S3 bucket (and optional prefix) that you're using as the data
        # repository for your FSx for Lustre file system, for example s3://import-bucket/optional-prefix . If
        # a prefix is specified after the Amazon S3 bucket name, only object keys with that prefix are loaded
        # into the file system.
        @[JSON::Field(key: "ImportPath")]
        getter import_path : String?

        # For files imported from a data repository, this value determines the stripe count and maximum amount
        # of data per file (in MiB) stored on a single physical disk. The maximum number of disks that a
        # single file can be striped across is limited by the total number of disks that make up the file
        # system. The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB).
        # Amazon S3 objects have a maximum size of 5 TB.
        @[JSON::Field(key: "ImportedFileChunkSize")]
        getter imported_file_chunk_size : Int32?

        # Describes the state of the file system's S3 durable data repository, if it is configured with an S3
        # repository. The lifecycle can have the following values: CREATING - The data repository
        # configuration between the FSx file system and the linked S3 data repository is being created. The
        # data repository is unavailable. AVAILABLE - The data repository is available for use. MISCONFIGURED
        # - Amazon FSx cannot automatically import updates from the S3 bucket until the data repository
        # configuration is corrected. For more information, see Troubleshooting a Misconfigured linked S3
        # bucket . UPDATING - The data repository is undergoing a customer initiated update and availability
        # may be impacted. FAILED - The data repository is in a terminal state that cannot be recovered.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        def initialize(
          @auto_import_policy : String? = nil,
          @export_path : String? = nil,
          @failure_details : Types::DataRepositoryFailureDetails? = nil,
          @import_path : String? = nil,
          @imported_file_chunk_size : Int32? = nil,
          @lifecycle : String? = nil
        )
        end
      end

      # Provides detailed information about the data repository if its Lifecycle is set to MISCONFIGURED or
      # FAILED .
      struct DataRepositoryFailureDetails
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A description of the data repository task. You use import and export data repository tasks to
      # perform bulk transfer operations between an Amazon FSx for Lustre file system and a linked data
      # repository. You use release data repository tasks to release files that have been exported to a
      # linked S3 bucket from your Amazon FSx for Lustre file system. An Amazon File Cache resource uses a
      # task to automatically release files from the cache. To learn more about data repository tasks, see
      # Data Repository Tasks .
      struct DataRepositoryTask
        include JSON::Serializable

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The lifecycle status of the data repository task, as follows: PENDING - The task has not started.
        # EXECUTING - The task is in process. FAILED - The task was not able to be completed. For example,
        # there may be files the task failed to process. The DataRepositoryTaskFailureDetails property
        # provides more information about task failures. SUCCEEDED - The task has completed successfully.
        # CANCELED - The task was canceled and it did not complete. CANCELING - The task is in process of
        # being canceled. You cannot delete an FSx for Lustre file system if there are data repository tasks
        # for the file system in the PENDING or EXECUTING states. Please retry when the data repository task
        # is finished (with a status of CANCELED , SUCCEEDED , or FAILED ). You can use the
        # DescribeDataRepositoryTask action to monitor the task status. Contact the FSx team if you need to
        # delete your file system immediately.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String

        # The system-generated, unique 17-digit ID of the data repository task.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # The type of data repository task. EXPORT_TO_REPOSITORY tasks export from your Amazon FSx for Lustre
        # file system to a linked data repository. IMPORT_METADATA_FROM_REPOSITORY tasks import metadata
        # changes from a linked S3 bucket to your Amazon FSx for Lustre file system.
        # RELEASE_DATA_FROM_FILESYSTEM tasks release files in your Amazon FSx for Lustre file system that have
        # been exported to a linked S3 bucket and that meet your specified release criteria. AUTO_RELEASE_DATA
        # tasks automatically release files from an Amazon File Cache resource.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Specifies the amount of data to release, in GiB, by an Amazon File Cache AUTO_RELEASE_DATA task that
        # automatically releases files from the cache.
        @[JSON::Field(key: "CapacityToRelease")]
        getter capacity_to_release : Int64?

        # The time the system completed processing the task, populated after the task is complete.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Failure message describing why the task failed, it is populated only when Lifecycle is set to FAILED
        # .
        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::DataRepositoryTaskFailureDetails?

        # The system-generated, unique ID of the cache.
        @[JSON::Field(key: "FileCacheId")]
        getter file_cache_id : String?

        # The globally unique ID of the file system.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # An array of paths that specify the data for the data repository task to process. For example, in an
        # EXPORT_TO_REPOSITORY task, the paths specify which data to export to the linked data repository.
        # (Default) If Paths is not specified, Amazon FSx uses the file system root directory.
        @[JSON::Field(key: "Paths")]
        getter paths : Array(String)?

        # The configuration that specifies the last accessed time criteria for files that will be released
        # from an Amazon FSx for Lustre file system.
        @[JSON::Field(key: "ReleaseConfiguration")]
        getter release_configuration : Types::ReleaseConfiguration?

        @[JSON::Field(key: "Report")]
        getter report : Types::CompletionReport?

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The time the system began processing the task.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Provides the status of the number of files that the task has processed successfully and failed to
        # process.
        @[JSON::Field(key: "Status")]
        getter status : Types::DataRepositoryTaskStatus?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @creation_time : Time,
          @lifecycle : String,
          @task_id : String,
          @type : String,
          @capacity_to_release : Int64? = nil,
          @end_time : Time? = nil,
          @failure_details : Types::DataRepositoryTaskFailureDetails? = nil,
          @file_cache_id : String? = nil,
          @file_system_id : String? = nil,
          @paths : Array(String)? = nil,
          @release_configuration : Types::ReleaseConfiguration? = nil,
          @report : Types::CompletionReport? = nil,
          @resource_arn : String? = nil,
          @start_time : Time? = nil,
          @status : Types::DataRepositoryTaskStatus? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The data repository task could not be canceled because the task has already ended.
      struct DataRepositoryTaskEnded
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An existing data repository task is currently executing on the file system. Wait until the existing
      # task has completed, then create the new task.
      struct DataRepositoryTaskExecuting
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about why a data repository task failed. Only populated when the task Lifecycle
      # is set to FAILED .
      struct DataRepositoryTaskFailureDetails
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # (Optional) An array of filter objects you can use to filter the response of data repository tasks
      # you will see in the response. You can filter the tasks returned in the response by one or more file
      # system IDs, task lifecycles, and by task type. A filter object consists of a filter Name , and one
      # or more Values for the filter.
      struct DataRepositoryTaskFilter
        include JSON::Serializable

        # Name of the task property to use in filtering the tasks returned in the response. Use file-system-id
        # to retrieve data repository tasks for specific file systems. Use task-lifecycle to retrieve data
        # repository tasks with one or more specific lifecycle states, as follows: CANCELED, EXECUTING,
        # FAILED, PENDING, and SUCCEEDED.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Use Values to include the specific file system IDs and task lifecycle states for the filters you are
        # using.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The data repository task or tasks you specified could not be found.
      struct DataRepositoryTaskNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides the task status showing a running total of the total number of files to be processed, the
      # number successfully processed, and the number of files the task failed to process.
      struct DataRepositoryTaskStatus
        include JSON::Serializable

        # A running total of the number of files that the task failed to process.
        @[JSON::Field(key: "FailedCount")]
        getter failed_count : Int64?

        # The time at which the task status was last updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The total amount of data, in GiB, released by an Amazon File Cache AUTO_RELEASE_DATA task that
        # automatically releases files from the cache.
        @[JSON::Field(key: "ReleasedCapacity")]
        getter released_capacity : Int64?

        # A running total of the number of files that the task has successfully processed.
        @[JSON::Field(key: "SucceededCount")]
        getter succeeded_count : Int64?

        # The total number of files that the task will process. While a task is executing, the sum of
        # SucceededCount plus FailedCount may not equal TotalCount . When the task is complete, TotalCount
        # equals the sum of SucceededCount plus FailedCount .
        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int64?

        def initialize(
          @failed_count : Int64? = nil,
          @last_updated_time : Time? = nil,
          @released_capacity : Int64? = nil,
          @succeeded_count : Int64? = nil,
          @total_count : Int64? = nil
        )
        end
      end

      # The request object for the DeleteBackup operation.
      struct DeleteBackupRequest
        include JSON::Serializable

        # The ID of the backup that you want to delete.
        @[JSON::Field(key: "BackupId")]
        getter backup_id : String

        # A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent deletion. This
        # parameter is automatically filled on your behalf when using the CLI or SDK.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @backup_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      # The response object for the DeleteBackup operation.
      struct DeleteBackupResponse
        include JSON::Serializable

        # The ID of the backup that was deleted.
        @[JSON::Field(key: "BackupId")]
        getter backup_id : String?

        # The lifecycle status of the backup. If the DeleteBackup operation is successful, the status is
        # DELETED .
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        def initialize(
          @backup_id : String? = nil,
          @lifecycle : String? = nil
        )
        end
      end

      struct DeleteDataRepositoryAssociationRequest
        include JSON::Serializable

        # The ID of the data repository association that you want to delete.
        @[JSON::Field(key: "AssociationId")]
        getter association_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Set to true to delete the data in the file system that corresponds to the data repository
        # association.
        @[JSON::Field(key: "DeleteDataInFileSystem")]
        getter delete_data_in_file_system : Bool?

        def initialize(
          @association_id : String,
          @client_request_token : String? = nil,
          @delete_data_in_file_system : Bool? = nil
        )
        end
      end

      struct DeleteDataRepositoryAssociationResponse
        include JSON::Serializable

        # The ID of the data repository association being deleted.
        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # Indicates whether data in the file system that corresponds to the data repository association is
        # being deleted. Default is false .
        @[JSON::Field(key: "DeleteDataInFileSystem")]
        getter delete_data_in_file_system : Bool?

        # Describes the lifecycle state of the data repository association being deleted.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        def initialize(
          @association_id : String? = nil,
          @delete_data_in_file_system : Bool? = nil,
          @lifecycle : String? = nil
        )
        end
      end

      struct DeleteFileCacheRequest
        include JSON::Serializable

        # The ID of the cache that's being deleted.
        @[JSON::Field(key: "FileCacheId")]
        getter file_cache_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @file_cache_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct DeleteFileCacheResponse
        include JSON::Serializable

        # The ID of the cache that's being deleted.
        @[JSON::Field(key: "FileCacheId")]
        getter file_cache_id : String?

        # The cache lifecycle for the deletion request. If the DeleteFileCache operation is successful, this
        # status is DELETING .
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        def initialize(
          @file_cache_id : String? = nil,
          @lifecycle : String? = nil
        )
        end
      end

      # The configuration object for the Amazon FSx for Lustre file system being deleted in the
      # DeleteFileSystem operation.
      struct DeleteFileSystemLustreConfiguration
        include JSON::Serializable

        # Use if SkipFinalBackup is set to false , and you want to apply an array of tags to the final backup.
        # If you have set the file system property CopyTagsToBackups to true, and you specify one or more
        # FinalBackupTags when deleting a file system, Amazon FSx will not copy any existing file system tags
        # to the backup.
        @[JSON::Field(key: "FinalBackupTags")]
        getter final_backup_tags : Array(Types::Tag)?

        # Set SkipFinalBackup to false if you want to take a final backup of the file system you are deleting.
        # By default, Amazon FSx will not take a final backup on your behalf when the DeleteFileSystem
        # operation is invoked. (Default = true) The fsx:CreateBackup permission is required if you set
        # SkipFinalBackup to false in order to delete the file system and take a final backup.
        @[JSON::Field(key: "SkipFinalBackup")]
        getter skip_final_backup : Bool?

        def initialize(
          @final_backup_tags : Array(Types::Tag)? = nil,
          @skip_final_backup : Bool? = nil
        )
        end
      end

      # The response object for the Amazon FSx for Lustre file system being deleted in the DeleteFileSystem
      # operation.
      struct DeleteFileSystemLustreResponse
        include JSON::Serializable

        # The ID of the final backup for this file system.
        @[JSON::Field(key: "FinalBackupId")]
        getter final_backup_id : String?

        # The set of tags applied to the final backup.
        @[JSON::Field(key: "FinalBackupTags")]
        getter final_backup_tags : Array(Types::Tag)?

        def initialize(
          @final_backup_id : String? = nil,
          @final_backup_tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The configuration object for the Amazon FSx for OpenZFS file system used in the DeleteFileSystem
      # operation.
      struct DeleteFileSystemOpenZFSConfiguration
        include JSON::Serializable

        # A list of tags to apply to the file system's final backup.
        @[JSON::Field(key: "FinalBackupTags")]
        getter final_backup_tags : Array(Types::Tag)?

        # To delete a file system if there are child volumes present below the root volume, use the string
        # DELETE_CHILD_VOLUMES_AND_SNAPSHOTS . If your file system has child volumes and you don't use this
        # option, the delete request will fail.
        @[JSON::Field(key: "Options")]
        getter options : Array(String)?

        # By default, Amazon FSx for OpenZFS takes a final backup on your behalf when the DeleteFileSystem
        # operation is invoked. Doing this helps protect you from data loss, and we highly recommend taking
        # the final backup. If you want to skip taking a final backup, set this value to true .
        @[JSON::Field(key: "SkipFinalBackup")]
        getter skip_final_backup : Bool?

        def initialize(
          @final_backup_tags : Array(Types::Tag)? = nil,
          @options : Array(String)? = nil,
          @skip_final_backup : Bool? = nil
        )
        end
      end

      # The response object for the Amazon FSx for OpenZFS file system that's being deleted in the
      # DeleteFileSystem operation.
      struct DeleteFileSystemOpenZFSResponse
        include JSON::Serializable

        @[JSON::Field(key: "FinalBackupId")]
        getter final_backup_id : String?

        @[JSON::Field(key: "FinalBackupTags")]
        getter final_backup_tags : Array(Types::Tag)?

        def initialize(
          @final_backup_id : String? = nil,
          @final_backup_tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The request object for DeleteFileSystem operation.
      struct DeleteFileSystemRequest
        include JSON::Serializable

        # The ID of the file system that you want to delete.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent deletion. This token
        # is automatically filled on your behalf when using the Command Line Interface (CLI) or an Amazon Web
        # Services SDK.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        @[JSON::Field(key: "LustreConfiguration")]
        getter lustre_configuration : Types::DeleteFileSystemLustreConfiguration?

        # The configuration object for the OpenZFS file system used in the DeleteFileSystem operation.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::DeleteFileSystemOpenZFSConfiguration?

        @[JSON::Field(key: "WindowsConfiguration")]
        getter windows_configuration : Types::DeleteFileSystemWindowsConfiguration?

        def initialize(
          @file_system_id : String,
          @client_request_token : String? = nil,
          @lustre_configuration : Types::DeleteFileSystemLustreConfiguration? = nil,
          @open_zfs_configuration : Types::DeleteFileSystemOpenZFSConfiguration? = nil,
          @windows_configuration : Types::DeleteFileSystemWindowsConfiguration? = nil
        )
        end
      end

      # The response object for the DeleteFileSystem operation.
      struct DeleteFileSystemResponse
        include JSON::Serializable

        # The ID of the file system that's being deleted.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # The file system lifecycle for the deletion request. If the DeleteFileSystem operation is successful,
        # this status is DELETING .
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        @[JSON::Field(key: "LustreResponse")]
        getter lustre_response : Types::DeleteFileSystemLustreResponse?

        # The response object for the OpenZFS file system that's being deleted in the DeleteFileSystem
        # operation.
        @[JSON::Field(key: "OpenZFSResponse")]
        getter open_zfs_response : Types::DeleteFileSystemOpenZFSResponse?

        @[JSON::Field(key: "WindowsResponse")]
        getter windows_response : Types::DeleteFileSystemWindowsResponse?

        def initialize(
          @file_system_id : String? = nil,
          @lifecycle : String? = nil,
          @lustre_response : Types::DeleteFileSystemLustreResponse? = nil,
          @open_zfs_response : Types::DeleteFileSystemOpenZFSResponse? = nil,
          @windows_response : Types::DeleteFileSystemWindowsResponse? = nil
        )
        end
      end

      # The configuration object for the Microsoft Windows file system used in the DeleteFileSystem
      # operation.
      struct DeleteFileSystemWindowsConfiguration
        include JSON::Serializable

        # A set of tags for your final backup.
        @[JSON::Field(key: "FinalBackupTags")]
        getter final_backup_tags : Array(Types::Tag)?

        # By default, Amazon FSx for Windows takes a final backup on your behalf when the DeleteFileSystem
        # operation is invoked. Doing this helps protect you from data loss, and we highly recommend taking
        # the final backup. If you want to skip this backup, use this flag to do so.
        @[JSON::Field(key: "SkipFinalBackup")]
        getter skip_final_backup : Bool?

        def initialize(
          @final_backup_tags : Array(Types::Tag)? = nil,
          @skip_final_backup : Bool? = nil
        )
        end
      end

      # The response object for the Microsoft Windows file system used in the DeleteFileSystem operation.
      struct DeleteFileSystemWindowsResponse
        include JSON::Serializable

        # The ID of the final backup for this file system.
        @[JSON::Field(key: "FinalBackupId")]
        getter final_backup_id : String?

        # The set of tags applied to the final backup.
        @[JSON::Field(key: "FinalBackupTags")]
        getter final_backup_tags : Array(Types::Tag)?

        def initialize(
          @final_backup_id : String? = nil,
          @final_backup_tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct DeleteSnapshotRequest
        include JSON::Serializable

        # The ID of the snapshot that you want to delete.
        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @snapshot_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct DeleteSnapshotResponse
        include JSON::Serializable

        # The lifecycle status of the snapshot. If the DeleteSnapshot operation is successful, this status is
        # DELETING .
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The ID of the deleted snapshot.
        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        def initialize(
          @lifecycle : String? = nil,
          @snapshot_id : String? = nil
        )
        end
      end

      struct DeleteStorageVirtualMachineRequest
        include JSON::Serializable

        # The ID of the SVM that you want to delete.
        @[JSON::Field(key: "StorageVirtualMachineId")]
        getter storage_virtual_machine_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @storage_virtual_machine_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct DeleteStorageVirtualMachineResponse
        include JSON::Serializable

        # Describes the lifecycle state of the SVM being deleted.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The ID of the SVM Amazon FSx is deleting.
        @[JSON::Field(key: "StorageVirtualMachineId")]
        getter storage_virtual_machine_id : String?

        def initialize(
          @lifecycle : String? = nil,
          @storage_virtual_machine_id : String? = nil
        )
        end
      end

      # Use to specify skipping a final backup, adding tags to a final backup, or bypassing the retention
      # period of an FSx for ONTAP SnapLock Enterprise volume when deleting an FSx for ONTAP volume.
      struct DeleteVolumeOntapConfiguration
        include JSON::Serializable

        # Setting this to true allows a SnapLock administrator to delete an FSx for ONTAP SnapLock Enterprise
        # volume with unexpired write once, read many (WORM) files. The IAM permission
        # fsx:BypassSnaplockEnterpriseRetention is also required to delete SnapLock Enterprise volumes with
        # unexpired WORM files. The default value is false . For more information, see Deleting a SnapLock
        # volume .
        @[JSON::Field(key: "BypassSnaplockEnterpriseRetention")]
        getter bypass_snaplock_enterprise_retention : Bool?

        @[JSON::Field(key: "FinalBackupTags")]
        getter final_backup_tags : Array(Types::Tag)?

        # Set to true if you want to skip taking a final backup of the volume you are deleting.
        @[JSON::Field(key: "SkipFinalBackup")]
        getter skip_final_backup : Bool?

        def initialize(
          @bypass_snaplock_enterprise_retention : Bool? = nil,
          @final_backup_tags : Array(Types::Tag)? = nil,
          @skip_final_backup : Bool? = nil
        )
        end
      end

      # The response object for the Amazon FSx for NetApp ONTAP volume being deleted in the DeleteVolume
      # operation.
      struct DeleteVolumeOntapResponse
        include JSON::Serializable

        @[JSON::Field(key: "FinalBackupId")]
        getter final_backup_id : String?

        @[JSON::Field(key: "FinalBackupTags")]
        getter final_backup_tags : Array(Types::Tag)?

        def initialize(
          @final_backup_id : String? = nil,
          @final_backup_tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A value that specifies whether to delete all child volumes and snapshots.
      struct DeleteVolumeOpenZFSConfiguration
        include JSON::Serializable

        # To delete the volume's child volumes, snapshots, and clones, use the string
        # DELETE_CHILD_VOLUMES_AND_SNAPSHOTS .
        @[JSON::Field(key: "Options")]
        getter options : Array(String)?

        def initialize(
          @options : Array(String)? = nil
        )
        end
      end

      struct DeleteVolumeRequest
        include JSON::Serializable

        # The ID of the volume that you are deleting.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # For Amazon FSx for ONTAP volumes, specify whether to take a final backup of the volume and apply
        # tags to the backup. To apply tags to the backup, you must have the fsx:TagResource permission.
        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::DeleteVolumeOntapConfiguration?

        # For Amazon FSx for OpenZFS volumes, specify whether to delete all child volumes and snapshots.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::DeleteVolumeOpenZFSConfiguration?

        def initialize(
          @volume_id : String,
          @client_request_token : String? = nil,
          @ontap_configuration : Types::DeleteVolumeOntapConfiguration? = nil,
          @open_zfs_configuration : Types::DeleteVolumeOpenZFSConfiguration? = nil
        )
        end
      end

      struct DeleteVolumeResponse
        include JSON::Serializable

        # The lifecycle state of the volume being deleted. If the DeleteVolume operation is successful, this
        # value is DELETING .
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # Returned after a DeleteVolume request, showing the status of the delete request.
        @[JSON::Field(key: "OntapResponse")]
        getter ontap_response : Types::DeleteVolumeOntapResponse?

        # The ID of the volume that's being deleted.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        def initialize(
          @lifecycle : String? = nil,
          @ontap_response : Types::DeleteVolumeOntapResponse? = nil,
          @volume_id : String? = nil
        )
        end
      end

      # The request object for the DescribeBackups operation.
      struct DescribeBackupsRequest
        include JSON::Serializable

        # The IDs of the backups that you want to retrieve. This parameter value overrides any filters. If any
        # IDs aren't found, a BackupNotFound error occurs.
        @[JSON::Field(key: "BackupIds")]
        getter backup_ids : Array(String)?

        # The filters structure. The supported names are file-system-id , backup-type , file-system-type , and
        # volume-id .
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Maximum number of backups to return in the response. This parameter value must be greater than 0.
        # The number of items that Amazon FSx returns is the minimum of the MaxResults parameter specified in
        # the request and the service's internal maximum number of items per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An opaque pagination token returned from a previous DescribeBackups operation. If a token is
        # present, the operation continues the list from where the returning call left off.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backup_ids : Array(String)? = nil,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Response object for the DescribeBackups operation.
      struct DescribeBackupsResponse
        include JSON::Serializable

        # An array of backups.
        @[JSON::Field(key: "Backups")]
        getter backups : Array(Types::Backup)?

        # A NextToken value is present if there are more backups than returned in the response. You can use
        # the NextToken value in the subsequent request to fetch the backups.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backups : Array(Types::Backup)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeDataRepositoryAssociationsRequest
        include JSON::Serializable

        # IDs of the data repository associations whose descriptions you want to retrieve (String).
        @[JSON::Field(key: "AssociationIds")]
        getter association_ids : Array(String)?

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of resources to return in the response. This value must be an integer greater
        # than zero.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @association_ids : Array(String)? = nil,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeDataRepositoryAssociationsResponse
        include JSON::Serializable

        # An array of one or more data repository association descriptions.
        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::DataRepositoryAssociation)?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @associations : Array(Types::DataRepositoryAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeDataRepositoryTasksRequest
        include JSON::Serializable

        # (Optional) You can use filters to narrow the DescribeDataRepositoryTasks response to include just
        # tasks for specific file systems, or tasks in a specific lifecycle state.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::DataRepositoryTaskFilter)?

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # (Optional) IDs of the tasks whose descriptions you want to retrieve (String).
        @[JSON::Field(key: "TaskIds")]
        getter task_ids : Array(String)?

        def initialize(
          @filters : Array(Types::DataRepositoryTaskFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @task_ids : Array(String)? = nil
        )
        end
      end

      struct DescribeDataRepositoryTasksResponse
        include JSON::Serializable

        # The collection of data repository task descriptions returned.
        @[JSON::Field(key: "DataRepositoryTasks")]
        getter data_repository_tasks : Array(Types::DataRepositoryTask)?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data_repository_tasks : Array(Types::DataRepositoryTask)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeFileCachesRequest
        include JSON::Serializable

        # IDs of the caches whose descriptions you want to retrieve (String).
        @[JSON::Field(key: "FileCacheIds")]
        getter file_cache_ids : Array(String)?

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @file_cache_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeFileCachesResponse
        include JSON::Serializable

        # The response object for the DescribeFileCaches operation.
        @[JSON::Field(key: "FileCaches")]
        getter file_caches : Array(Types::FileCache)?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @file_caches : Array(Types::FileCache)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request object for DescribeFileSystemAliases operation.
      struct DescribeFileSystemAliasesRequest
        include JSON::Serializable

        # The ID of the file system to return the associated DNS aliases for (String).
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Maximum number of DNS aliases to return in the response (integer). This parameter value must be
        # greater than 0. The number of items that Amazon FSx returns is the minimum of the MaxResults
        # parameter specified in the request and the service's internal maximum number of items per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Opaque pagination token returned from a previous DescribeFileSystemAliases operation (String). If a
        # token is included in the request, the action continues the list from where the previous returning
        # call left off.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @file_system_id : String,
          @client_request_token : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response object for DescribeFileSystemAliases operation.
      struct DescribeFileSystemAliasesResponse
        include JSON::Serializable

        # An array of one or more DNS aliases currently associated with the specified file system.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(Types::Alias)?

        # Present if there are more DNS aliases than returned in the response (String). You can use the
        # NextToken value in a later request to fetch additional descriptions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aliases : Array(Types::Alias)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request object for DescribeFileSystems operation.
      struct DescribeFileSystemsRequest
        include JSON::Serializable

        # IDs of the file systems whose descriptions you want to retrieve (String).
        @[JSON::Field(key: "FileSystemIds")]
        getter file_system_ids : Array(String)?

        # Maximum number of file systems to return in the response (integer). This parameter value must be
        # greater than 0. The number of items that Amazon FSx returns is the minimum of the MaxResults
        # parameter specified in the request and the service's internal maximum number of items per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Opaque pagination token returned from a previous DescribeFileSystems operation (String). If a token
        # present, the operation continues the list from where the returning call left off.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @file_system_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response object for DescribeFileSystems operation.
      struct DescribeFileSystemsResponse
        include JSON::Serializable

        # An array of file system descriptions.
        @[JSON::Field(key: "FileSystems")]
        getter file_systems : Array(Types::FileSystem)?

        # Present if there are more file systems than returned in the response (String). You can use the
        # NextToken value in the later request to fetch the descriptions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @file_systems : Array(Types::FileSystem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeS3AccessPointAttachmentsRequest
        include JSON::Serializable

        # Enter a filter Name and Values pair to view a select set of S3 access point attachments.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::S3AccessPointAttachmentsFilter)?

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The names of the S3 access point attachments whose descriptions you want to retrieve.
        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::S3AccessPointAttachmentsFilter)? = nil,
          @max_results : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeS3AccessPointAttachmentsResponse
        include JSON::Serializable

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Array of S3 access point attachments returned after a successful DescribeS3AccessPointAttachments
        # operation.
        @[JSON::Field(key: "S3AccessPointAttachments")]
        getter s3_access_point_attachments : Array(Types::S3AccessPointAttachment)?

        def initialize(
          @next_token : String? = nil,
          @s3_access_point_attachments : Array(Types::S3AccessPointAttachment)? = nil
        )
        end
      end

      struct DescribeSharedVpcConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeSharedVpcConfigurationResponse
        include JSON::Serializable

        # Indicates whether participant accounts can create FSx for ONTAP Multi-AZ file systems in shared
        # subnets.
        @[JSON::Field(key: "EnableFsxRouteTableUpdatesFromParticipantAccounts")]
        getter enable_fsx_route_table_updates_from_participant_accounts : String?

        def initialize(
          @enable_fsx_route_table_updates_from_participant_accounts : String? = nil
        )
        end
      end

      struct DescribeSnapshotsRequest
        include JSON::Serializable

        # The filters structure. The supported names are file-system-id or volume-id .
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::SnapshotFilter)?

        # Set to false (default) if you want to only see the snapshots owned by your Amazon Web Services
        # account. Set to true if you want to see the snapshots in your account and the ones shared with you
        # from another account.
        @[JSON::Field(key: "IncludeShared")]
        getter include_shared : Bool?

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The IDs of the snapshots that you want to retrieve. This parameter value overrides any filters. If
        # any IDs aren't found, a SnapshotNotFound error occurs.
        @[JSON::Field(key: "SnapshotIds")]
        getter snapshot_ids : Array(String)?

        def initialize(
          @filters : Array(Types::SnapshotFilter)? = nil,
          @include_shared : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @snapshot_ids : Array(String)? = nil
        )
        end
      end

      struct DescribeSnapshotsResponse
        include JSON::Serializable

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of snapshots.
        @[JSON::Field(key: "Snapshots")]
        getter snapshots : Array(Types::Snapshot)?

        def initialize(
          @next_token : String? = nil,
          @snapshots : Array(Types::Snapshot)? = nil
        )
        end
      end

      struct DescribeStorageVirtualMachinesRequest
        include JSON::Serializable

        # Enter a filter name:value pair to view a select set of SVMs.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::StorageVirtualMachineFilter)?

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Enter the ID of one or more SVMs that you want to view.
        @[JSON::Field(key: "StorageVirtualMachineIds")]
        getter storage_virtual_machine_ids : Array(String)?

        def initialize(
          @filters : Array(Types::StorageVirtualMachineFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @storage_virtual_machine_ids : Array(String)? = nil
        )
        end
      end

      struct DescribeStorageVirtualMachinesResponse
        include JSON::Serializable

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returned after a successful DescribeStorageVirtualMachines operation, describing each SVM.
        @[JSON::Field(key: "StorageVirtualMachines")]
        getter storage_virtual_machines : Array(Types::StorageVirtualMachine)?

        def initialize(
          @next_token : String? = nil,
          @storage_virtual_machines : Array(Types::StorageVirtualMachine)? = nil
        )
        end
      end

      struct DescribeVolumesRequest
        include JSON::Serializable

        # Enter a filter Name and Values pair to view a select set of volumes.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::VolumeFilter)?

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The IDs of the volumes whose descriptions you want to retrieve.
        @[JSON::Field(key: "VolumeIds")]
        getter volume_ids : Array(String)?

        def initialize(
          @filters : Array(Types::VolumeFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @volume_ids : Array(String)? = nil
        )
        end
      end

      struct DescribeVolumesResponse
        include JSON::Serializable

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returned after a successful DescribeVolumes operation, describing each volume.
        @[JSON::Field(key: "Volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @next_token : String? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      struct DetachAndDeleteS3AccessPointRequest
        include JSON::Serializable

        # The name of the S3 access point attachment that you want to delete.
        @[JSON::Field(key: "Name")]
        getter name : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @name : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct DetachAndDeleteS3AccessPointResponse
        include JSON::Serializable

        # The lifecycle status of the S3 access point attachment.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The name of the S3 access point attachment being deleted.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @lifecycle : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The request object of DNS aliases to disassociate from an Amazon FSx for Windows File Server file
      # system.
      struct DisassociateFileSystemAliasesRequest
        include JSON::Serializable

        # An array of one or more DNS alias names to disassociate, or remove, from the file system.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(String)

        # Specifies the file system from which to disassociate the DNS aliases.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @aliases : Array(String),
          @file_system_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      # The system generated response showing the DNS aliases that Amazon FSx is attempting to disassociate
      # from the file system. Use the API operation to monitor the status of the aliases Amazon FSx is
      # removing from the file system.
      struct DisassociateFileSystemAliasesResponse
        include JSON::Serializable

        # An array of one or more DNS aliases that Amazon FSx is attempting to disassociate from the file
        # system.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(Types::Alias)?

        def initialize(
          @aliases : Array(Types::Alias)? = nil
        )
        end
      end

      # The SSD IOPS (input/output operations per second) configuration for an Amazon FSx for NetApp ONTAP,
      # Amazon FSx for Windows File Server, or FSx for OpenZFS file system. By default, Amazon FSx
      # automatically provisions 3 IOPS per GB of storage capacity. You can provision additional IOPS per GB
      # of storage. The configuration consists of the total number of provisioned SSD IOPS and how it is was
      # provisioned, or the mode (by the customer or by Amazon FSx).
      struct DiskIopsConfiguration
        include JSON::Serializable

        # The total number of SSD IOPS provisioned for the file system. The minimum and maximum values for
        # this property depend on the value of HAPairs and StorageCapacity . The minimum value is calculated
        # as StorageCapacity * 3 * HAPairs (3 IOPS per GB of StorageCapacity ). The maximum value is
        # calculated as 200,000 * HAPairs . Amazon FSx responds with an HTTP status code 400 (Bad Request) if
        # the value of Iops is outside of the minimum or maximum values.
        @[JSON::Field(key: "Iops")]
        getter iops : Int64?

        # Specifies whether the file system is using the AUTOMATIC setting of SSD IOPS of 3 IOPS per GB of
        # storage capacity, or if it using a USER_PROVISIONED value.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        def initialize(
          @iops : Int64? = nil,
          @mode : String? = nil
        )
        end
      end

      # Defines the minimum amount of time since last access for a file to be eligible for release. Only
      # files that have been exported to S3 and that were last accessed or modified before this
      # point-in-time are eligible to be released from the Amazon FSx for Lustre file system.
      struct DurationSinceLastAccess
        include JSON::Serializable

        # The unit of time used by the Value parameter to determine if a file can be released, based on when
        # it was last accessed. DAYS is the only supported value. This is a required parameter.
        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # An integer that represents the minimum amount of time (in days) since a file was last accessed in
        # the file system. Only exported files with a MAX(atime, ctime, mtime) timestamp that is more than
        # this amount of time in the past (relative to the task create time) will be released. The default of
        # Value is 0 . This is a required parameter. If an exported file meets the last accessed time
        # criteria, its file or directory path must also be specified in the Paths parameter of the operation
        # in order for the file to be released.
        @[JSON::Field(key: "Value")]
        getter value : Int64?

        def initialize(
          @unit : String? = nil,
          @value : Int64? = nil
        )
        end
      end

      # A description of a specific Amazon File Cache resource, which is a response object from the
      # DescribeFileCaches operation.
      struct FileCache
        include JSON::Serializable

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Domain Name System (DNS) name for the cache.
        @[JSON::Field(key: "DNSName")]
        getter dns_name : String?

        # A list of IDs of data repository associations that are associated with this cache.
        @[JSON::Field(key: "DataRepositoryAssociationIds")]
        getter data_repository_association_ids : Array(String)?

        # A structure providing details of any failures that occurred.
        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::FileCacheFailureDetails?

        # The system-generated, unique ID of the cache.
        @[JSON::Field(key: "FileCacheId")]
        getter file_cache_id : String?

        # The type of cache, which must be LUSTRE .
        @[JSON::Field(key: "FileCacheType")]
        getter file_cache_type : String?

        # The Lustre version of the cache, which must be 2.12 .
        @[JSON::Field(key: "FileCacheTypeVersion")]
        getter file_cache_type_version : String?

        # Specifies the ID of the Key Management Service (KMS) key to use for encrypting data on an Amazon
        # File Cache. If a KmsKeyId isn't specified, the Amazon FSx-managed KMS key for your account is used.
        # For more information, see Encrypt in the Key Management Service API Reference .
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The lifecycle status of the cache. The following are the possible values and what they mean:
        # AVAILABLE - The cache is in a healthy state, and is reachable and available for use. CREATING - The
        # new cache is being created. DELETING - An existing cache is being deleted. UPDATING - The cache is
        # undergoing a customer-initiated update. FAILED - An existing cache has experienced an unrecoverable
        # failure. When creating a new cache, the cache was unable to be created.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The configuration for the Amazon File Cache resource.
        @[JSON::Field(key: "LustreConfiguration")]
        getter lustre_configuration : Types::FileCacheLustreConfiguration?

        @[JSON::Field(key: "NetworkInterfaceIds")]
        getter network_interface_ids : Array(String)?

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The storage capacity of the cache in gibibytes (GiB).
        @[JSON::Field(key: "StorageCapacity")]
        getter storage_capacity : Int32?

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @creation_time : Time? = nil,
          @dns_name : String? = nil,
          @data_repository_association_ids : Array(String)? = nil,
          @failure_details : Types::FileCacheFailureDetails? = nil,
          @file_cache_id : String? = nil,
          @file_cache_type : String? = nil,
          @file_cache_type_version : String? = nil,
          @kms_key_id : String? = nil,
          @lifecycle : String? = nil,
          @lustre_configuration : Types::FileCacheLustreConfiguration? = nil,
          @network_interface_ids : Array(String)? = nil,
          @owner_id : String? = nil,
          @resource_arn : String? = nil,
          @storage_capacity : Int32? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The response object for the Amazon File Cache resource being created in the CreateFileCache
      # operation.
      struct FileCacheCreating
        include JSON::Serializable

        # A boolean flag indicating whether tags for the cache should be copied to data repository
        # associations.
        @[JSON::Field(key: "CopyTagsToDataRepositoryAssociations")]
        getter copy_tags_to_data_repository_associations : Bool?

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Domain Name System (DNS) name for the cache.
        @[JSON::Field(key: "DNSName")]
        getter dns_name : String?

        # A list of IDs of data repository associations that are associated with this cache.
        @[JSON::Field(key: "DataRepositoryAssociationIds")]
        getter data_repository_association_ids : Array(String)?

        # A structure providing details of any failures that occurred in creating a cache.
        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::FileCacheFailureDetails?

        # The system-generated, unique ID of the cache.
        @[JSON::Field(key: "FileCacheId")]
        getter file_cache_id : String?

        # The type of cache, which must be LUSTRE .
        @[JSON::Field(key: "FileCacheType")]
        getter file_cache_type : String?

        # The Lustre version of the cache, which must be 2.12 .
        @[JSON::Field(key: "FileCacheTypeVersion")]
        getter file_cache_type_version : String?

        # Specifies the ID of the Key Management Service (KMS) key to use for encrypting data on an Amazon
        # File Cache. If a KmsKeyId isn't specified, the Amazon FSx-managed KMS key for your account is used.
        # For more information, see Encrypt in the Key Management Service API Reference .
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The lifecycle status of the cache. The following are the possible values and what they mean:
        # AVAILABLE - The cache is in a healthy state, and is reachable and available for use. CREATING - The
        # new cache is being created. DELETING - An existing cache is being deleted. UPDATING - The cache is
        # undergoing a customer-initiated update. FAILED - An existing cache has experienced an unrecoverable
        # failure. When creating a new cache, the cache was unable to be created.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The configuration for the Amazon File Cache resource.
        @[JSON::Field(key: "LustreConfiguration")]
        getter lustre_configuration : Types::FileCacheLustreConfiguration?

        @[JSON::Field(key: "NetworkInterfaceIds")]
        getter network_interface_ids : Array(String)?

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The storage capacity of the cache in gibibytes (GiB).
        @[JSON::Field(key: "StorageCapacity")]
        getter storage_capacity : Int32?

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @copy_tags_to_data_repository_associations : Bool? = nil,
          @creation_time : Time? = nil,
          @dns_name : String? = nil,
          @data_repository_association_ids : Array(String)? = nil,
          @failure_details : Types::FileCacheFailureDetails? = nil,
          @file_cache_id : String? = nil,
          @file_cache_type : String? = nil,
          @file_cache_type_version : String? = nil,
          @kms_key_id : String? = nil,
          @lifecycle : String? = nil,
          @lustre_configuration : Types::FileCacheLustreConfiguration? = nil,
          @network_interface_ids : Array(String)? = nil,
          @owner_id : String? = nil,
          @resource_arn : String? = nil,
          @storage_capacity : Int32? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The configuration for a data repository association (DRA) to be created during the Amazon File Cache
      # resource creation. The DRA links the cache to either an Amazon S3 bucket or prefix, or a Network
      # File System (NFS) data repository that supports the NFSv3 protocol. The DRA does not support
      # automatic import or automatic export.
      struct FileCacheDataRepositoryAssociation
        include JSON::Serializable

        # The path to the S3 or NFS data repository that links to the cache. You must provide one of the
        # following paths: The path can be an NFS data repository that links to the cache. The path can be in
        # one of two formats: If you are not using the DataRepositorySubdirectories parameter, the path is to
        # an NFS Export directory (or one of its subdirectories) in the format
        # nfs://nfs-domain-name/exportpath . You can therefore link a single NFS Export to a single data
        # repository association. If you are using the DataRepositorySubdirectories parameter, the path is the
        # domain name of the NFS file system in the format nfs://filer-domain-name , which indicates the root
        # of the subdirectories specified with the DataRepositorySubdirectories parameter. The path can be an
        # S3 bucket or prefix in the format s3://bucket-name/prefix/ (where prefix is optional).
        @[JSON::Field(key: "DataRepositoryPath")]
        getter data_repository_path : String

        # A path on the cache that points to a high-level directory (such as /ns1/ ) or subdirectory (such as
        # /ns1/subdir/ ) that will be mapped 1-1 with DataRepositoryPath . The leading forward slash in the
        # name is required. Two data repository associations cannot have overlapping cache paths. For example,
        # if a data repository is associated with cache path /ns1/ , then you cannot link another data
        # repository with cache path /ns1/ns2 . This path specifies where in your cache files will be exported
        # from. This cache directory can be linked to only one data repository, and no data repository other
        # can be linked to the directory. The cache path can only be set to root (/) on an NFS DRA when
        # DataRepositorySubdirectories is specified. If you specify root (/) as the cache path, you can create
        # only one DRA on the cache. The cache path cannot be set to root (/) for an S3 DRA.
        @[JSON::Field(key: "FileCachePath")]
        getter file_cache_path : String

        # A list of NFS Exports that will be linked with this data repository association. The Export paths
        # are in the format /exportpath1 . To use this parameter, you must configure DataRepositoryPath as the
        # domain name of the NFS file system. The NFS file system domain name in effect is the root of the
        # subdirectories. Note that DataRepositorySubdirectories is not supported for S3 data repositories.
        @[JSON::Field(key: "DataRepositorySubdirectories")]
        getter data_repository_subdirectories : Array(String)?

        # The configuration for a data repository association that links an Amazon File Cache resource to an
        # NFS data repository.
        @[JSON::Field(key: "NFS")]
        getter nfs : Types::FileCacheNFSConfiguration?

        def initialize(
          @data_repository_path : String,
          @file_cache_path : String,
          @data_repository_subdirectories : Array(String)? = nil,
          @nfs : Types::FileCacheNFSConfiguration? = nil
        )
        end
      end

      # A structure providing details of any failures that occurred.
      struct FileCacheFailureDetails
        include JSON::Serializable

        # A message describing any failures that occurred.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration for the Amazon File Cache resource.
      struct FileCacheLustreConfiguration
        include JSON::Serializable

        # The deployment type of the Amazon File Cache resource, which must be CACHE_1 .
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # The configuration for Lustre logging used to write the enabled logging events for your Amazon File
        # Cache resource to Amazon CloudWatch Logs.
        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LustreLogConfiguration?

        # The configuration for a Lustre MDT (Metadata Target) storage volume.
        @[JSON::Field(key: "MetadataConfiguration")]
        getter metadata_configuration : Types::FileCacheLustreMetadataConfiguration?

        # You use the MountName value when mounting the cache. If you pass a cache ID to the
        # DescribeFileCaches operation, it returns the the MountName value as part of the cache's description.
        @[JSON::Field(key: "MountName")]
        getter mount_name : String?

        # Per unit storage throughput represents the megabytes per second of read or write throughput per 1
        # tebibyte of storage provisioned. Cache throughput capacity is equal to Storage capacity (TiB) *
        # PerUnitStorageThroughput (MB/s/TiB). The only supported value is 1000 .
        @[JSON::Field(key: "PerUnitStorageThroughput")]
        getter per_unit_storage_throughput : Int32?

        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @deployment_type : String? = nil,
          @log_configuration : Types::LustreLogConfiguration? = nil,
          @metadata_configuration : Types::FileCacheLustreMetadataConfiguration? = nil,
          @mount_name : String? = nil,
          @per_unit_storage_throughput : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # The configuration for a Lustre MDT (Metadata Target) storage volume. The metadata on Amazon File
      # Cache is managed by a Lustre Metadata Server (MDS) while the actual metadata is persisted on an MDT.
      struct FileCacheLustreMetadataConfiguration
        include JSON::Serializable

        # The storage capacity of the Lustre MDT (Metadata Target) storage volume in gibibytes (GiB). The only
        # supported value is 2400 GiB.
        @[JSON::Field(key: "StorageCapacity")]
        getter storage_capacity : Int32

        def initialize(
          @storage_capacity : Int32
        )
        end
      end

      # The configuration for an NFS data repository association (DRA) created during the creation of the
      # Amazon File Cache resource.
      struct FileCacheNFSConfiguration
        include JSON::Serializable

        # The version of the NFS (Network File System) protocol of the NFS data repository. The only supported
        # value is NFS3 , which indicates that the data repository must support the NFSv3 protocol.
        @[JSON::Field(key: "Version")]
        getter version : String

        # A list of up to 2 IP addresses of DNS servers used to resolve the NFS file system domain name. The
        # provided IP addresses can either be the IP addresses of a DNS forwarder or resolver that the
        # customer manages and runs inside the customer VPC, or the IP addresses of the on-premises DNS
        # servers.
        @[JSON::Field(key: "DnsIps")]
        getter dns_ips : Array(String)?

        def initialize(
          @version : String,
          @dns_ips : Array(String)? = nil
        )
        end
      end

      # No caches were found based upon supplied parameters.
      struct FileCacheNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A description of a specific Amazon FSx file system.
      struct FileSystem
        include JSON::Serializable

        # A list of administrative actions for the file system that are in process or waiting to be processed.
        # Administrative actions describe changes to the Amazon FSx system that you have initiated using the
        # UpdateFileSystem operation.
        @[JSON::Field(key: "AdministrativeActions")]
        getter administrative_actions : Array(Types::AdministrativeAction)?

        # The time that the file system was created, in seconds (since 1970-01-01T00:00:00Z), also known as
        # Unix time.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Domain Name System (DNS) name for the file system.
        @[JSON::Field(key: "DNSName")]
        getter dns_name : String?

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::FileSystemFailureDetails?

        # The system-generated, unique 17-digit ID of the file system.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # The type of Amazon FSx file system, which can be LUSTRE , WINDOWS , ONTAP , or OPENZFS .
        @[JSON::Field(key: "FileSystemType")]
        getter file_system_type : String?

        # The Lustre version of the Amazon FSx for Lustre file system, which can be 2.10 , 2.12 , or 2.15 .
        @[JSON::Field(key: "FileSystemTypeVersion")]
        getter file_system_type_version : String?

        # The ID of the Key Management Service (KMS) key used to encrypt Amazon FSx file system data. Used as
        # follows with Amazon FSx file system types: Amazon FSx for Lustre PERSISTENT_1 and PERSISTENT_2
        # deployment types only. SCRATCH_1 and SCRATCH_2 types are encrypted using the Amazon FSx service KMS
        # key for your account. Amazon FSx for NetApp ONTAP Amazon FSx for OpenZFS Amazon FSx for Windows File
        # Server
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The lifecycle status of the file system. The following are the possible values and what they mean:
        # AVAILABLE - The file system is in a healthy state, and is reachable and available for use. CREATING
        # - Amazon FSx is creating the new file system. DELETING - Amazon FSx is deleting an existing file
        # system. FAILED - An existing file system has experienced an unrecoverable failure. When creating a
        # new file system, Amazon FSx was unable to create the file system. MISCONFIGURED - The file system is
        # in a failed but recoverable state. MISCONFIGURED_UNAVAILABLE - (Amazon FSx for Windows File Server
        # only) The file system is currently unavailable due to a change in your Active Directory
        # configuration. UPDATING - The file system is undergoing a customer-initiated update.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        @[JSON::Field(key: "LustreConfiguration")]
        getter lustre_configuration : Types::LustreFileSystemConfiguration?

        # The IDs of the elastic network interfaces from which a specific file system is accessible. The
        # elastic network interface is automatically created in the same virtual private cloud (VPC) that the
        # Amazon FSx file system was created in. For more information, see Elastic Network Interfaces in the
        # Amazon EC2 User Guide. For an Amazon FSx for Windows File Server file system, you can have one
        # network interface ID. For an Amazon FSx for Lustre file system, you can have more than one.
        @[JSON::Field(key: "NetworkInterfaceIds")]
        getter network_interface_ids : Array(String)?

        # The network type of the file system.
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The configuration for this Amazon FSx for NetApp ONTAP file system.
        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::OntapFileSystemConfiguration?

        # The configuration for this Amazon FSx for OpenZFS file system.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::OpenZFSFileSystemConfiguration?

        # The Amazon Web Services account that created the file system. If the file system was created by a
        # user in IAM Identity Center, the Amazon Web Services account to which the IAM user belongs is the
        # owner.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The Amazon Resource Name (ARN) of the file system resource.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The storage capacity of the file system in gibibytes (GiB). Amazon FSx responds with an HTTP status
        # code 400 (Bad Request) if the value of StorageCapacity is outside of the minimum or maximum values.
        @[JSON::Field(key: "StorageCapacity")]
        getter storage_capacity : Int32?

        # The type of storage the file system is using. If set to SSD , the file system uses solid state drive
        # storage. If set to HDD , the file system uses hard disk drive storage. If set to INTELLIGENT_TIERING
        # , the file system uses fully elastic, intelligently-tiered storage.
        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # Specifies the IDs of the subnets that the file system is accessible from. For the Amazon FSx Windows
        # and ONTAP MULTI_AZ_1 file system deployment type, there are two subnet IDs, one for the preferred
        # file server and one for the standby file server. The preferred file server subnet identified in the
        # PreferredSubnetID property. All other file systems have only one subnet ID. For FSx for Lustre file
        # systems, and Single-AZ Windows file systems, this is the ID of the subnet that contains the file
        # system's endpoint. For MULTI_AZ_1 Windows and ONTAP file systems, the file system endpoint is
        # available in the PreferredSubnetID .
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The tags to associate with the file system. For more information, see Tagging your Amazon FSx
        # resources in the Amazon FSx for Lustre User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The ID of the primary virtual private cloud (VPC) for the file system.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        # The configuration for this Amazon FSx for Windows File Server file system.
        @[JSON::Field(key: "WindowsConfiguration")]
        getter windows_configuration : Types::WindowsFileSystemConfiguration?

        def initialize(
          @administrative_actions : Array(Types::AdministrativeAction)? = nil,
          @creation_time : Time? = nil,
          @dns_name : String? = nil,
          @failure_details : Types::FileSystemFailureDetails? = nil,
          @file_system_id : String? = nil,
          @file_system_type : String? = nil,
          @file_system_type_version : String? = nil,
          @kms_key_id : String? = nil,
          @lifecycle : String? = nil,
          @lustre_configuration : Types::LustreFileSystemConfiguration? = nil,
          @network_interface_ids : Array(String)? = nil,
          @network_type : String? = nil,
          @ontap_configuration : Types::OntapFileSystemConfiguration? = nil,
          @open_zfs_configuration : Types::OpenZFSFileSystemConfiguration? = nil,
          @owner_id : String? = nil,
          @resource_arn : String? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_id : String? = nil,
          @windows_configuration : Types::WindowsFileSystemConfiguration? = nil
        )
        end
      end

      # An Amazon FSx for NetApp ONTAP file system has two endpoints that are used to access data or to
      # manage the file system using the NetApp ONTAP CLI, REST API, or NetApp SnapMirror. They are the
      # Management and Intercluster endpoints.
      struct FileSystemEndpoint
        include JSON::Serializable

        @[JSON::Field(key: "DNSName")]
        getter dns_name : String?

        # The IPv4 addresses of the file system endpoint.
        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(String)?

        # The IPv6 addresses of the file system endpoint.
        @[JSON::Field(key: "Ipv6Addresses")]
        getter ipv6_addresses : Array(String)?

        def initialize(
          @dns_name : String? = nil,
          @ip_addresses : Array(String)? = nil,
          @ipv6_addresses : Array(String)? = nil
        )
        end
      end

      # An Amazon FSx for NetApp ONTAP file system has the following endpoints that are used to access data
      # or to manage the file system using the NetApp ONTAP CLI, REST API, or NetApp SnapMirror.
      struct FileSystemEndpoints
        include JSON::Serializable

        # An endpoint for managing your file system by setting up NetApp SnapMirror with other ONTAP systems.
        @[JSON::Field(key: "Intercluster")]
        getter intercluster : Types::FileSystemEndpoint?

        # An endpoint for managing your file system using the NetApp ONTAP CLI and NetApp ONTAP API.
        @[JSON::Field(key: "Management")]
        getter management : Types::FileSystemEndpoint?

        def initialize(
          @intercluster : Types::FileSystemEndpoint? = nil,
          @management : Types::FileSystemEndpoint? = nil
        )
        end
      end

      # A structure providing details of any failures that occurred.
      struct FileSystemFailureDetails
        include JSON::Serializable

        # A message describing any failures that occurred.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Lustre metadata performance configuration of an Amazon FSx for Lustre file system using a
      # PERSISTENT_2 deployment type. The configuration enables the file system to support increasing
      # metadata performance.
      struct FileSystemLustreMetadataConfiguration
        include JSON::Serializable

        # The metadata configuration mode for provisioning Metadata IOPS for the file system. In AUTOMATIC
        # mode (supported only on SSD file systems), FSx for Lustre automatically provisions and scales the
        # number of Metadata IOPS on your file system based on your file system storage capacity. In
        # USER_PROVISIONED mode, you can choose to specify the number of Metadata IOPS to provision for your
        # file system.
        @[JSON::Field(key: "Mode")]
        getter mode : String

        # The number of Metadata IOPS provisioned for the file system. For SSD file systems, valid values are
        # 1500 , 3000 , 6000 , 12000 , and multiples of 12000 up to a maximum of 192000 . For
        # Intelligent-Tiering file systems, valid values are 6000 and 12000 .
        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        def initialize(
          @mode : String,
          @iops : Int32? = nil
        )
        end
      end

      # No Amazon FSx file systems were found based upon supplied parameters.
      struct FileSystemNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A filter used to restrict the results of describe calls. You can use multiple filters to return
      # results that meet all applied filter requirements.
      struct Filter
        include JSON::Serializable

        # The name for this filter.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The values of the filter. These are all the values for any of the applied filters.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The error returned when a second request is received with the same client request token but
      # different parameters settings. A client request token should always uniquely identify a single
      # request.
      struct IncompatibleParameterError
        include JSON::Serializable

        # A parameter that is incompatible with the earlier request.
        @[JSON::Field(key: "Parameter")]
        getter parameter : String

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @parameter : String,
          @message : String? = nil
        )
        end
      end

      # Amazon FSx doesn't support Multi-AZ Windows File Server copy backup in the destination Region, so
      # the copied backup can't be restored.
      struct IncompatibleRegionForMultiAZ
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A generic error indicating a server-side failure.
      struct InternalServerError
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The access point specified doesn't exist.
      struct InvalidAccessPoint
        include JSON::Serializable

        # An error code indicating that the access point specified doesn't exist.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # You have filtered the response to a data repository type that is not supported.
      struct InvalidDataRepositoryType
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Key Management Service (KMS) key of the destination backup is not valid.
      struct InvalidDestinationKmsKey
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The path provided for data repository export isn't valid.
      struct InvalidExportPath
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The path provided for data repository import isn't valid.
      struct InvalidImportPath
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more network settings specified in the request are invalid.
      struct InvalidNetworkSettings
        include JSON::Serializable

        # The route table ID is either invalid or not part of the VPC specified.
        @[JSON::Field(key: "InvalidRouteTableId")]
        getter invalid_route_table_id : String?

        # The security group ID is either invalid or not part of the VPC specified.
        @[JSON::Field(key: "InvalidSecurityGroupId")]
        getter invalid_security_group_id : String?

        # The subnet ID that is either invalid or not part of the VPC specified.
        @[JSON::Field(key: "InvalidSubnetId")]
        getter invalid_subnet_id : String?

        # Error message explaining what's wrong with network settings.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @invalid_route_table_id : String? = nil,
          @invalid_security_group_id : String? = nil,
          @invalid_subnet_id : String? = nil,
          @message : String? = nil
        )
        end
      end

      # An invalid value for PerUnitStorageThroughput was provided. Please create your file system again,
      # using a valid value.
      struct InvalidPerUnitStorageThroughput
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Region provided for SourceRegion is not valid or is in a different Amazon Web Services
      # partition.
      struct InvalidRegion
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The action or operation requested is invalid. Verify that the action is typed correctly.
      struct InvalidRequest
        include JSON::Serializable

        # An error code indicating that the action or operation requested is invalid.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The Key Management Service (KMS) key of the source backup is not valid.
      struct InvalidSourceKmsKey
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes why a resource lifecycle state changed.
      struct LifecycleTransitionReason
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request object for ListTagsForResource operation.
      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the Amazon FSx resource that will have its tags listed.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # Maximum number of tags to return in the response (integer). This parameter value must be greater
        # than 0. The number of items that Amazon FSx returns is the minimum of the MaxResults parameter
        # specified in the request and the service's internal maximum number of items per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Opaque pagination token returned from a previous ListTagsForResource operation (String). If a token
        # present, the action continues the list from where the returning call left off.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response object for ListTagsForResource operation.
      struct ListTagsForResourceResponse
        include JSON::Serializable

        # This is present if there are more tags than returned in the response (String). You can use the
        # NextToken value in the later request to fetch the tags.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of tags on the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The configuration for the Amazon FSx for Lustre file system.
      struct LustreFileSystemConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        # A boolean flag indicating whether tags on the file system are copied to backups. If it's set to
        # true, all tags on the file system are copied to all automatic backups and any user-initiated backups
        # where the user doesn't specify any tags. If this value is true, and you specify one or more tags,
        # only the specified tags are copied to backups. If you specify one or more tags when creating a
        # user-initiated backup, no tags are copied from the file system, regardless of this value. (Default =
        # false)
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # The data compression configuration for the file system. DataCompressionType can have the following
        # values: NONE - Data compression is turned off for the file system. LZ4 - Data compression is turned
        # on with the LZ4 algorithm. For more information, see Lustre data compression .
        @[JSON::Field(key: "DataCompressionType")]
        getter data_compression_type : String?

        # Required when StorageType is set to INTELLIGENT_TIERING . Specifies the optional provisioned SSD
        # read cache.
        @[JSON::Field(key: "DataReadCacheConfiguration")]
        getter data_read_cache_configuration : Types::LustreReadCacheConfiguration?

        @[JSON::Field(key: "DataRepositoryConfiguration")]
        getter data_repository_configuration : Types::DataRepositoryConfiguration?

        # The deployment type of the FSx for Lustre file system. Scratch deployment type is designed for
        # temporary storage and shorter-term processing of data. SCRATCH_1 and SCRATCH_2 deployment types are
        # best suited for when you need temporary storage and shorter-term processing of data. The SCRATCH_2
        # deployment type provides in-transit encryption of data and higher burst throughput capacity than
        # SCRATCH_1 . The PERSISTENT_1 and PERSISTENT_2 deployment type is used for longer-term storage and
        # workloads and encryption of data in transit. PERSISTENT_2 offers higher PerUnitStorageThroughput (up
        # to 1000 MB/s/TiB) along with a lower minimum storage capacity requirement (600 GiB). To learn more
        # about FSx for Lustre deployment types, see Deployment and storage class options for FSx for Lustre
        # file systems . The default is SCRATCH_1 .
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # The type of drive cache used by PERSISTENT_1 file systems that are provisioned with HDD storage
        # devices. This parameter is required when StorageType is HDD. When set to READ the file system has an
        # SSD storage cache that is sized to 20% of the file system's storage capacity. This improves the
        # performance for frequently accessed files by caching up to 20% of the total storage capacity. This
        # parameter is required when StorageType is set to HDD.
        @[JSON::Field(key: "DriveCacheType")]
        getter drive_cache_type : String?

        # Specifies whether Elastic Fabric Adapter (EFA) and GPUDirect Storage (GDS) support is enabled for
        # the Amazon FSx for Lustre file system.
        @[JSON::Field(key: "EfaEnabled")]
        getter efa_enabled : Bool?

        # The Lustre logging configuration. Lustre logging writes the enabled log events for your file system
        # to Amazon CloudWatch Logs.
        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LustreLogConfiguration?

        # The Lustre metadata performance configuration for an Amazon FSx for Lustre file system using a
        # PERSISTENT_2 deployment type.
        @[JSON::Field(key: "MetadataConfiguration")]
        getter metadata_configuration : Types::FileSystemLustreMetadataConfiguration?

        # You use the MountName value when mounting the file system. For the SCRATCH_1 deployment type, this
        # value is always " fsx ". For SCRATCH_2 , PERSISTENT_1 , and PERSISTENT_2 deployment types, this
        # value is a string that is unique within an Amazon Web Services Region.
        @[JSON::Field(key: "MountName")]
        getter mount_name : String?

        # Per unit storage throughput represents the megabytes per second of read or write throughput per 1
        # tebibyte of storage provisioned. File system throughput capacity is equal to Storage capacity (TiB)
        # * PerUnitStorageThroughput (MB/s/TiB). This option is only valid for PERSISTENT_1 and PERSISTENT_2
        # deployment types. Valid values: For PERSISTENT_1 SSD storage: 50, 100, 200. For PERSISTENT_1 HDD
        # storage: 12, 40. For PERSISTENT_2 SSD storage: 125, 250, 500, 1000.
        @[JSON::Field(key: "PerUnitStorageThroughput")]
        getter per_unit_storage_throughput : Int32?

        # The Lustre root squash configuration for an Amazon FSx for Lustre file system. When enabled, root
        # squash restricts root-level access from clients that try to access your file system as a root user.
        @[JSON::Field(key: "RootSquashConfiguration")]
        getter root_squash_configuration : Types::LustreRootSquashConfiguration?

        # The throughput of an Amazon FSx for Lustre file system using the Intelligent-Tiering storage class,
        # measured in megabytes per second (MBps).
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        # The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone.
        # Here, d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.
        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @automatic_backup_retention_days : Int32? = nil,
          @copy_tags_to_backups : Bool? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @data_compression_type : String? = nil,
          @data_read_cache_configuration : Types::LustreReadCacheConfiguration? = nil,
          @data_repository_configuration : Types::DataRepositoryConfiguration? = nil,
          @deployment_type : String? = nil,
          @drive_cache_type : String? = nil,
          @efa_enabled : Bool? = nil,
          @log_configuration : Types::LustreLogConfiguration? = nil,
          @metadata_configuration : Types::FileSystemLustreMetadataConfiguration? = nil,
          @mount_name : String? = nil,
          @per_unit_storage_throughput : Int32? = nil,
          @root_squash_configuration : Types::LustreRootSquashConfiguration? = nil,
          @throughput_capacity : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # The configuration for Lustre logging used to write the enabled logging events for your Amazon FSx
      # for Lustre file system or Amazon File Cache resource to Amazon CloudWatch Logs.
      struct LustreLogConfiguration
        include JSON::Serializable

        # The data repository events that are logged by Amazon FSx. WARN_ONLY - only warning events are
        # logged. ERROR_ONLY - only error events are logged. WARN_ERROR - both warning events and error events
        # are logged. DISABLED - logging of data repository events is turned off. Note that Amazon File Cache
        # uses a default setting of WARN_ERROR , which can't be changed.
        @[JSON::Field(key: "Level")]
        getter level : String

        # The Amazon Resource Name (ARN) that specifies the destination of the logs. The destination can be
        # any Amazon CloudWatch Logs log group ARN. The destination ARN must be in the same Amazon Web
        # Services partition, Amazon Web Services Region, and Amazon Web Services account as your Amazon FSx
        # file system.
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        def initialize(
          @level : String,
          @destination : String? = nil
        )
        end
      end

      # The Lustre logging configuration used when creating or updating an Amazon FSx for Lustre file
      # system. An Amazon File Cache is created with Lustre logging enabled by default, with a setting of
      # WARN_ERROR for the logging events. which can't be changed. Lustre logging writes the enabled logging
      # events for your file system or cache to Amazon CloudWatch Logs.
      struct LustreLogCreateConfiguration
        include JSON::Serializable

        # Sets which data repository events are logged by Amazon FSx. WARN_ONLY - only warning events are
        # logged. ERROR_ONLY - only error events are logged. WARN_ERROR - both warning events and error events
        # are logged. DISABLED - logging of data repository events is turned off.
        @[JSON::Field(key: "Level")]
        getter level : String

        # The Amazon Resource Name (ARN) that specifies the destination of the logs. The destination can be
        # any Amazon CloudWatch Logs log group ARN, with the following requirements: The destination ARN that
        # you provide must be in the same Amazon Web Services partition, Amazon Web Services Region, and
        # Amazon Web Services account as your Amazon FSx file system. The name of the Amazon CloudWatch Logs
        # log group must begin with the /aws/fsx prefix. If you do not provide a destination, Amazon FSx will
        # create and use a log stream in the CloudWatch Logs /aws/fsx/lustre log group (for Amazon FSx for
        # Lustre) or /aws/fsx/filecache (for Amazon File Cache). If Destination is provided and the resource
        # does not exist, the request will fail with a BadRequest error. If Level is set to DISABLED , you
        # cannot specify a destination in Destination .
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        def initialize(
          @level : String,
          @destination : String? = nil
        )
        end
      end

      # The configuration for the optional provisioned SSD read cache on Amazon FSx for Lustre file systems
      # that use the Intelligent-Tiering storage class.
      struct LustreReadCacheConfiguration
        include JSON::Serializable

        # Required if SizingMode is set to USER_PROVISIONED . Specifies the size of the file system's SSD read
        # cache, in gibibytes (GiB). The SSD read cache size is distributed across provisioned file servers in
        # your file system. Intelligent-Tiering file systems support a minimum of 32 GiB and maximum of 131072
        # GiB for SSD read cache size for every 4,000 MB/s of throughput capacity provisioned.
        @[JSON::Field(key: "SizeGiB")]
        getter size_gi_b : Int32?

        # Specifies how the provisioned SSD read cache is sized, as follows: Set to NO_CACHE if you do not
        # want to use an SSD read cache with your Intelligent-Tiering file system. Set to USER_PROVISIONED to
        # specify the exact size of your SSD read cache. Set to PROPORTIONAL_TO_THROUGHPUT_CAPACITY to have
        # your SSD read cache automatically sized based on your throughput capacity.
        @[JSON::Field(key: "SizingMode")]
        getter sizing_mode : String?

        def initialize(
          @size_gi_b : Int32? = nil,
          @sizing_mode : String? = nil
        )
        end
      end

      # The configuration for Lustre root squash used to restrict root-level access from clients that try to
      # access your FSx for Lustre file system as root. Use the RootSquash parameter to enable root squash.
      # To learn more about Lustre root squash, see Lustre root squash . You can also use the NoSquashNids
      # parameter to provide an array of clients who are not affected by the root squash setting. These
      # clients will access the file system as root, with unrestricted privileges.
      struct LustreRootSquashConfiguration
        include JSON::Serializable

        # When root squash is enabled, you can optionally specify an array of NIDs of clients for which root
        # squash does not apply. A client NID is a Lustre Network Identifier used to uniquely identify a
        # client. You can specify the NID as either a single address or a range of addresses: A single address
        # is described in standard Lustre NID format by specifying the client’s IP address followed by the
        # Lustre network ID (for example, 10.0.1.6@tcp ). An address range is described using a dash to
        # separate the range (for example, 10.0.[2-10].[1-255]@tcp ).
        @[JSON::Field(key: "NoSquashNids")]
        getter no_squash_nids : Array(String)?

        # You enable root squash by setting a user ID (UID) and group ID (GID) for the file system in the
        # format UID:GID (for example, 365534:65534 ). The UID and GID values can range from 0 to 4294967294 :
        # A non-zero value for UID and GID enables root squash. The UID and GID values can be different, but
        # each must be a non-zero value. A value of 0 (zero) for UID and GID indicates root, and therefore
        # disables root squash. When root squash is enabled, the user ID and group ID of a root user accessing
        # the file system are re-mapped to the UID and GID you provide.
        @[JSON::Field(key: "RootSquash")]
        getter root_squash : String?

        def initialize(
          @no_squash_nids : Array(String)? = nil,
          @root_squash : String? = nil
        )
        end
      end

      # A cache configuration is required for this operation.
      struct MissingFileCacheConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A file system configuration is required for this operation.
      struct MissingFileSystemConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A volume configuration is required for this operation.
      struct MissingVolumeConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration for a data repository association that links an Amazon File Cache resource to an
      # NFS data repository.
      struct NFSDataRepositoryConfiguration
        include JSON::Serializable

        # The version of the NFS (Network File System) protocol of the NFS data repository. Currently, the
        # only supported value is NFS3 , which indicates that the data repository must support the NFSv3
        # protocol.
        @[JSON::Field(key: "Version")]
        getter version : String

        # This parameter is not supported for Amazon File Cache.
        @[JSON::Field(key: "AutoExportPolicy")]
        getter auto_export_policy : Types::AutoExportPolicy?

        # A list of up to 2 IP addresses of DNS servers used to resolve the NFS file system domain name. The
        # provided IP addresses can either be the IP addresses of a DNS forwarder or resolver that the
        # customer manages and runs inside the customer VPC, or the IP addresses of the on-premises DNS
        # servers.
        @[JSON::Field(key: "DnsIps")]
        getter dns_ips : Array(String)?

        def initialize(
          @version : String,
          @auto_export_policy : Types::AutoExportPolicy? = nil,
          @dns_ips : Array(String)? = nil
        )
        end
      end

      # The resource specified for the tagging operation is not a resource type owned by Amazon FSx. Use the
      # API of the relevant service to perform the operation.
      struct NotServiceResourceError
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the non-Amazon FSx resource.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @resource_arn : String,
          @message : String? = nil
        )
        end
      end

      # Configuration for the FSx for NetApp ONTAP file system.
      struct OntapFileSystemConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # Specifies the FSx for ONTAP file system deployment type in use in the file system. MULTI_AZ_1 - A
        # high availability file system configured for Multi-AZ redundancy to tolerate temporary Availability
        # Zone (AZ) unavailability. This is a first-generation FSx for ONTAP file system. MULTI_AZ_2 - A high
        # availability file system configured for Multi-AZ redundancy to tolerate temporary AZ unavailability.
        # This is a second-generation FSx for ONTAP file system. SINGLE_AZ_1 - A file system configured for
        # Single-AZ redundancy. This is a first-generation FSx for ONTAP file system. SINGLE_AZ_2 - A file
        # system configured with multiple high-availability (HA) pairs for Single-AZ redundancy. This is a
        # second-generation FSx for ONTAP file system. For information about the use cases for Multi-AZ and
        # Single-AZ deployments, refer to Choosing Multi-AZ or Single-AZ file system deployment .
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # The SSD IOPS configuration for the ONTAP file system, specifying the number of provisioned IOPS and
        # the provision mode.
        @[JSON::Field(key: "DiskIopsConfiguration")]
        getter disk_iops_configuration : Types::DiskIopsConfiguration?

        # (Multi-AZ only) Specifies the IPv4 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API, Amazon FSx selects an unused IP address range for
        # you from the 198.19.* range. By default in the Amazon FSx console, Amazon FSx chooses the last 64 IP
        # addresses from the VPC’s primary CIDR range to use as the endpoint IP address range for the file
        # system. You can have overlapping endpoint IP addresses for file systems deployed in the same
        # VPC/route tables.
        @[JSON::Field(key: "EndpointIpAddressRange")]
        getter endpoint_ip_address_range : String?

        # (Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API and Amazon FSx console, Amazon FSx selects an
        # available /118 IP address range for you from one of the VPC's CIDR ranges. You can have overlapping
        # endpoint IP addresses for file systems deployed in the same VPC/route tables, as long as they don't
        # overlap with any subnet.
        @[JSON::Field(key: "EndpointIpv6AddressRange")]
        getter endpoint_ipv6_address_range : String?

        # The Management and Intercluster endpoints that are used to access data or to manage the file system
        # using the NetApp ONTAP CLI, REST API, or NetApp SnapMirror.
        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Types::FileSystemEndpoints?

        # You can use the fsxadmin user account to access the NetApp ONTAP CLI and REST API. The password
        # value is always redacted in the response.
        @[JSON::Field(key: "FsxAdminPassword")]
        getter fsx_admin_password : String?

        # Specifies how many high-availability (HA) file server pairs the file system will have. The default
        # value is 1. The value of this property affects the values of StorageCapacity , Iops , and
        # ThroughputCapacity . For more information, see High-availability (HA) pairs in the FSx for ONTAP
        # user guide. Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following
        # conditions: The value of HAPairs is less than 1 or greater than 12. The value of HAPairs is greater
        # than 1 and the value of DeploymentType is SINGLE_AZ_1 , MULTI_AZ_1 , or MULTI_AZ_2 .
        @[JSON::Field(key: "HAPairs")]
        getter ha_pairs : Int32?

        @[JSON::Field(key: "PreferredSubnetId")]
        getter preferred_subnet_id : String?

        # (Multi-AZ only) The VPC route tables in which your file system's endpoints are created.
        @[JSON::Field(key: "RouteTableIds")]
        getter route_table_ids : Array(String)?

        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        # Use to choose the throughput capacity per HA pair. When the value of HAPairs is equal to 1, the
        # value of ThroughputCapacityPerHAPair is the total throughput for the file system. This field and
        # ThroughputCapacity cannot be defined in the same API call, but one is required. This field and
        # ThroughputCapacity are the same for file systems with one HA pair. For SINGLE_AZ_1 and MULTI_AZ_1
        # file systems, valid values are 128, 256, 512, 1024, 2048, or 4096 MBps. For SINGLE_AZ_2 , valid
        # values are 1536, 3072, or 6144 MBps. For MULTI_AZ_2 , valid values are 384, 768, 1536, 3072, or 6144
        # MBps. Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following conditions:
        # The value of ThroughputCapacity and ThroughputCapacityPerHAPair are not the same value. The value of
        # deployment type is SINGLE_AZ_2 and ThroughputCapacity / ThroughputCapacityPerHAPair is not a valid
        # HA pair (a value between 1 and 12). The value of ThroughputCapacityPerHAPair is not a valid value.
        @[JSON::Field(key: "ThroughputCapacityPerHAPair")]
        getter throughput_capacity_per_ha_pair : Int32?

        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @automatic_backup_retention_days : Int32? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @deployment_type : String? = nil,
          @disk_iops_configuration : Types::DiskIopsConfiguration? = nil,
          @endpoint_ip_address_range : String? = nil,
          @endpoint_ipv6_address_range : String? = nil,
          @endpoints : Types::FileSystemEndpoints? = nil,
          @fsx_admin_password : String? = nil,
          @ha_pairs : Int32? = nil,
          @preferred_subnet_id : String? = nil,
          @route_table_ids : Array(String)? = nil,
          @throughput_capacity : Int32? = nil,
          @throughput_capacity_per_ha_pair : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # Specifies the file system user identity that will be used for authorizing all file access requests
      # that are made using the S3 access point. The identity can be either a UNIX user or a Windows user.
      struct OntapFileSystemIdentity
        include JSON::Serializable

        # Specifies the FSx for ONTAP user identity type. Valid values are UNIX and WINDOWS .
        @[JSON::Field(key: "Type")]
        getter type : String

        # Specifies the UNIX user identity for file system operations.
        @[JSON::Field(key: "UnixUser")]
        getter unix_user : Types::OntapUnixFileSystemUser?

        # Specifies the Windows user identity for file system operations.
        @[JSON::Field(key: "WindowsUser")]
        getter windows_user : Types::OntapWindowsFileSystemUser?

        def initialize(
          @type : String,
          @unix_user : Types::OntapUnixFileSystemUser? = nil,
          @windows_user : Types::OntapWindowsFileSystemUser? = nil
        )
        end
      end

      # The FSx for ONTAP UNIX file system user that is used for authorizing all file access requests that
      # are made using the S3 access point.
      struct OntapUnixFileSystemUser
        include JSON::Serializable

        # The name of the UNIX user. The name can be up to 256 characters long.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # The configuration of an Amazon FSx for NetApp ONTAP volume.
      struct OntapVolumeConfiguration
        include JSON::Serializable

        # This structure specifies configuration options for a volume’s storage aggregate or aggregates.
        @[JSON::Field(key: "AggregateConfiguration")]
        getter aggregate_configuration : Types::AggregateConfiguration?

        # A boolean flag indicating whether tags for the volume should be copied to backups. This value
        # defaults to false. If it's set to true, all tags for the volume are copied to all automatic and
        # user-initiated backups where the user doesn't specify tags. If this value is true, and you specify
        # one or more tags, only the specified tags are copied to backups. If you specify one or more tags
        # when creating a user-initiated backup, no tags are copied from the volume, regardless of this value.
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        # Specifies the FlexCache endpoint type of the volume. Valid values are the following: NONE specifies
        # that the volume doesn't have a FlexCache configuration. NONE is the default. ORIGIN specifies that
        # the volume is the origin volume for a FlexCache volume. CACHE specifies that the volume is a
        # FlexCache volume.
        @[JSON::Field(key: "FlexCacheEndpointType")]
        getter flex_cache_endpoint_type : String?

        # Specifies the directory that network-attached storage (NAS) clients use to mount the volume, along
        # with the storage virtual machine (SVM) Domain Name System (DNS) name or IP address. You can create a
        # JunctionPath directly below a parent volume junction or on a directory within a volume. A
        # JunctionPath for a volume named vol3 might be /vol1/vol2/vol3 , or /vol1/dir2/vol3 , or even
        # /dir1/dir2/vol3 .
        @[JSON::Field(key: "JunctionPath")]
        getter junction_path : String?

        # Specifies the type of volume. Valid values are the following: RW specifies a read/write volume. RW
        # is the default. DP specifies a data-protection volume. You can protect data by replicating it to
        # data-protection mirror copies. If a disaster occurs, you can use these data-protection mirror copies
        # to recover data. LS specifies a load-sharing mirror volume. A load-sharing mirror reduces the
        # network traffic to a FlexVol volume by providing additional read-only access to clients.
        @[JSON::Field(key: "OntapVolumeType")]
        getter ontap_volume_type : String?

        # The security style for the volume, which can be UNIX , NTFS , or MIXED .
        @[JSON::Field(key: "SecurityStyle")]
        getter security_style : String?

        # The configured size of the volume, in bytes.
        @[JSON::Field(key: "SizeInBytes")]
        getter size_in_bytes : Int64?

        # The configured size of the volume, in megabytes (MBs).
        @[JSON::Field(key: "SizeInMegabytes")]
        getter size_in_megabytes : Int32?

        # The SnapLock configuration object for an FSx for ONTAP SnapLock volume.
        @[JSON::Field(key: "SnaplockConfiguration")]
        getter snaplock_configuration : Types::SnaplockConfiguration?

        # Specifies the snapshot policy for the volume. There are three built-in snapshot policies: default :
        # This is the default policy. A maximum of six hourly snapshots taken five minutes past the hour. A
        # maximum of two daily snapshots taken Monday through Saturday at 10 minutes after midnight. A maximum
        # of two weekly snapshots taken every Sunday at 15 minutes after midnight. default-1weekly : This
        # policy is the same as the default policy except that it only retains one snapshot from the weekly
        # schedule. none : This policy does not take any snapshots. This policy can be assigned to volumes to
        # prevent automatic snapshots from being taken. You can also provide the name of a custom policy that
        # you created with the ONTAP CLI or REST API. For more information, see Snapshot policies in the
        # Amazon FSx for NetApp ONTAP User Guide.
        @[JSON::Field(key: "SnapshotPolicy")]
        getter snapshot_policy : String?

        # The volume's storage efficiency setting.
        @[JSON::Field(key: "StorageEfficiencyEnabled")]
        getter storage_efficiency_enabled : Bool?

        # The ID of the volume's storage virtual machine.
        @[JSON::Field(key: "StorageVirtualMachineId")]
        getter storage_virtual_machine_id : String?

        # A Boolean flag indicating whether this volume is the root volume for its storage virtual machine
        # (SVM). Only one volume on an SVM can be the root volume. This value defaults to false . If this
        # value is true , then this is the SVM root volume. This flag is useful when you're deleting an SVM,
        # because you must first delete all non-root volumes. This flag, when set to false , helps you
        # identify which volumes to delete before you can delete the SVM.
        @[JSON::Field(key: "StorageVirtualMachineRoot")]
        getter storage_virtual_machine_root : Bool?

        # The volume's TieringPolicy setting.
        @[JSON::Field(key: "TieringPolicy")]
        getter tiering_policy : Types::TieringPolicy?

        # The volume's universally unique identifier (UUID).
        @[JSON::Field(key: "UUID")]
        getter uuid : String?

        # Use to specify the style of an ONTAP volume. For more information about FlexVols and FlexGroups, see
        # Volume types in Amazon FSx for NetApp ONTAP User Guide.
        @[JSON::Field(key: "VolumeStyle")]
        getter volume_style : String?

        def initialize(
          @aggregate_configuration : Types::AggregateConfiguration? = nil,
          @copy_tags_to_backups : Bool? = nil,
          @flex_cache_endpoint_type : String? = nil,
          @junction_path : String? = nil,
          @ontap_volume_type : String? = nil,
          @security_style : String? = nil,
          @size_in_bytes : Int64? = nil,
          @size_in_megabytes : Int32? = nil,
          @snaplock_configuration : Types::SnaplockConfiguration? = nil,
          @snapshot_policy : String? = nil,
          @storage_efficiency_enabled : Bool? = nil,
          @storage_virtual_machine_id : String? = nil,
          @storage_virtual_machine_root : Bool? = nil,
          @tiering_policy : Types::TieringPolicy? = nil,
          @uuid : String? = nil,
          @volume_style : String? = nil
        )
        end
      end

      # The FSx for ONTAP Windows file system user that is used for authorizing all file access requests
      # that are made using the S3 access point.
      struct OntapWindowsFileSystemUser
        include JSON::Serializable

        # The name of the Windows user. The name can be up to 256 characters long and supports Active
        # Directory users.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Specifies who can mount an OpenZFS file system and the options available while mounting the file
      # system.
      struct OpenZFSClientConfiguration
        include JSON::Serializable

        # A value that specifies who can mount the file system. You can provide a wildcard character ( * ), an
        # IP address ( 0.0.0.0 ), or a CIDR address ( 192.0.2.0/24 ). By default, Amazon FSx uses the wildcard
        # character when specifying the client.
        @[JSON::Field(key: "Clients")]
        getter clients : String

        # The options to use when mounting the file system. For a list of options that you can use with
        # Network File System (NFS), see the exports(5) - Linux man page . When choosing your options,
        # consider the following: crossmnt is used by default. If you don't specify crossmnt when changing the
        # client configuration, you won't be able to see or access snapshots in your file system's snapshot
        # directory. sync is used by default. If you instead specify async , the system acknowledges writes
        # before writing to disk. If the system crashes before the writes are finished, you lose the unwritten
        # data.
        @[JSON::Field(key: "Options")]
        getter options : Array(String)

        def initialize(
          @clients : String,
          @options : Array(String)
        )
        end
      end

      # The configuration of an Amazon FSx for OpenZFS root volume.
      struct OpenZFSCreateRootVolumeConfiguration
        include JSON::Serializable

        # A Boolean value indicating whether tags for the volume should be copied to snapshots of the volume.
        # This value defaults to false . If it's set to true , all tags for the volume are copied to snapshots
        # where the user doesn't specify tags. If this value is true and you specify one or more tags, only
        # the specified tags are copied to snapshots. If you specify one or more tags when creating the
        # snapshot, no tags are copied from the volume, regardless of this value.
        @[JSON::Field(key: "CopyTagsToSnapshots")]
        getter copy_tags_to_snapshots : Bool?

        # Specifies the method used to compress the data on the volume. The compression type is NONE by
        # default. NONE - Doesn't compress the data on the volume. NONE is the default. ZSTD - Compresses the
        # data in the volume using the Zstandard (ZSTD) compression algorithm. Compared to LZ4, Z-Standard
        # provides a better compression ratio to minimize on-disk storage utilization. LZ4 - Compresses the
        # data in the volume using the LZ4 compression algorithm. Compared to Z-Standard, LZ4 is less
        # compute-intensive and delivers higher write throughput speeds.
        @[JSON::Field(key: "DataCompressionType")]
        getter data_compression_type : String?

        # The configuration object for mounting a file system.
        @[JSON::Field(key: "NfsExports")]
        getter nfs_exports : Array(Types::OpenZFSNfsExport)?

        # A Boolean value indicating whether the volume is read-only. Setting this value to true can be useful
        # after you have completed changes to a volume and no longer want changes to occur.
        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # Specifies the record size of an OpenZFS root volume, in kibibytes (KiB). Valid values are 4, 8, 16,
        # 32, 64, 128, 256, 512, or 1024 KiB. The default is 128 KiB. Most workloads should use the default
        # record size. Database workflows can benefit from a smaller record size, while streaming workflows
        # can benefit from a larger record size. For additional guidance on setting a custom record size, see
        # Tips for maximizing performance in the Amazon FSx for OpenZFS User Guide .
        @[JSON::Field(key: "RecordSizeKiB")]
        getter record_size_ki_b : Int32?

        # An object specifying how much storage users or groups can use on the volume.
        @[JSON::Field(key: "UserAndGroupQuotas")]
        getter user_and_group_quotas : Array(Types::OpenZFSUserOrGroupQuota)?

        def initialize(
          @copy_tags_to_snapshots : Bool? = nil,
          @data_compression_type : String? = nil,
          @nfs_exports : Array(Types::OpenZFSNfsExport)? = nil,
          @read_only : Bool? = nil,
          @record_size_ki_b : Int32? = nil,
          @user_and_group_quotas : Array(Types::OpenZFSUserOrGroupQuota)? = nil
        )
        end
      end

      # The configuration for the Amazon FSx for OpenZFS file system.
      struct OpenZFSFileSystemConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        # A Boolean value indicating whether tags on the file system should be copied to backups. If it's set
        # to true , all tags on the file system are copied to all automatic backups and any user-initiated
        # backups where the user doesn't specify any tags. If this value is true and you specify one or more
        # tags, only the specified tags are copied to backups. If you specify one or more tags when creating a
        # user-initiated backup, no tags are copied from the file system, regardless of this value.
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        # A Boolean value indicating whether tags for the volume should be copied to snapshots. This value
        # defaults to false . If it's set to true , all tags for the volume are copied to snapshots where the
        # user doesn't specify tags. If this value is true and you specify one or more tags, only the
        # specified tags are copied to snapshots. If you specify one or more tags when creating the snapshot,
        # no tags are copied from the volume, regardless of this value.
        @[JSON::Field(key: "CopyTagsToVolumes")]
        getter copy_tags_to_volumes : Bool?

        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # Specifies the file-system deployment type. Amazon FSx for OpenZFS supports&#x2028; MULTI_AZ_1 ,
        # SINGLE_AZ_HA_2 , SINGLE_AZ_HA_1 , SINGLE_AZ_2 , and SINGLE_AZ_1 .
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        @[JSON::Field(key: "DiskIopsConfiguration")]
        getter disk_iops_configuration : Types::DiskIopsConfiguration?

        # The IPv4 address of the endpoint that is used to access data or to manage the file system.
        @[JSON::Field(key: "EndpointIpAddress")]
        getter endpoint_ip_address : String?

        # (Multi-AZ only) Specifies the IPv4 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API and Amazon FSx console, Amazon FSx selects an
        # available /28 IP address range for you from one of the VPC's CIDR ranges. You can have overlapping
        # endpoint IP addresses for file systems deployed in the same VPC/route tables.
        @[JSON::Field(key: "EndpointIpAddressRange")]
        getter endpoint_ip_address_range : String?

        # The IPv6 address of the endpoint that is used to access data or to manage the file system.
        @[JSON::Field(key: "EndpointIpv6Address")]
        getter endpoint_ipv6_address : String?

        # (Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API and Amazon FSx console, Amazon FSx selects an
        # available /118 IP address range for you from one of the VPC's CIDR ranges. You can have overlapping
        # endpoint IP addresses for file systems deployed in the same VPC/route tables, as long as they don't
        # overlap with any subnet.
        @[JSON::Field(key: "EndpointIpv6AddressRange")]
        getter endpoint_ipv6_address_range : String?

        # Required when DeploymentType is set to MULTI_AZ_1 . This specifies the subnet in which you want the
        # preferred file server to be located.
        @[JSON::Field(key: "PreferredSubnetId")]
        getter preferred_subnet_id : String?

        # Required when StorageType is set to INTELLIGENT_TIERING . Specifies the optional provisioned SSD
        # read cache.
        @[JSON::Field(key: "ReadCacheConfiguration")]
        getter read_cache_configuration : Types::OpenZFSReadCacheConfiguration?

        # The ID of the root volume of the OpenZFS file system.
        @[JSON::Field(key: "RootVolumeId")]
        getter root_volume_id : String?

        # (Multi-AZ only) The VPC route tables in which your file system's endpoints are created.
        @[JSON::Field(key: "RouteTableIds")]
        getter route_table_ids : Array(String)?

        # The throughput of an Amazon FSx file system, measured in megabytes per second (MBps).
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @automatic_backup_retention_days : Int32? = nil,
          @copy_tags_to_backups : Bool? = nil,
          @copy_tags_to_volumes : Bool? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @deployment_type : String? = nil,
          @disk_iops_configuration : Types::DiskIopsConfiguration? = nil,
          @endpoint_ip_address : String? = nil,
          @endpoint_ip_address_range : String? = nil,
          @endpoint_ipv6_address : String? = nil,
          @endpoint_ipv6_address_range : String? = nil,
          @preferred_subnet_id : String? = nil,
          @read_cache_configuration : Types::OpenZFSReadCacheConfiguration? = nil,
          @root_volume_id : String? = nil,
          @route_table_ids : Array(String)? = nil,
          @throughput_capacity : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # Specifies the file system user identity that will be used for authorizing all file access requests
      # that are made using the S3 access point.
      struct OpenZFSFileSystemIdentity
        include JSON::Serializable

        # Specifies the FSx for OpenZFS user identity type, accepts only POSIX .
        @[JSON::Field(key: "Type")]
        getter type : String

        # Specifies the UID and GIDs of the file system POSIX user.
        @[JSON::Field(key: "PosixUser")]
        getter posix_user : Types::OpenZFSPosixFileSystemUser?

        def initialize(
          @type : String,
          @posix_user : Types::OpenZFSPosixFileSystemUser? = nil
        )
        end
      end

      # The Network File System (NFS) configurations for mounting an Amazon FSx for OpenZFS file system.
      struct OpenZFSNfsExport
        include JSON::Serializable

        # A list of configuration objects that contain the client and options for mounting the OpenZFS file
        # system.
        @[JSON::Field(key: "ClientConfigurations")]
        getter client_configurations : Array(Types::OpenZFSClientConfiguration)

        def initialize(
          @client_configurations : Array(Types::OpenZFSClientConfiguration)
        )
        end
      end

      # The snapshot configuration used when creating an Amazon FSx for OpenZFS volume from a snapshot.
      struct OpenZFSOriginSnapshotConfiguration
        include JSON::Serializable

        # The strategy used when copying data from the snapshot to the new volume. CLONE - The new volume
        # references the data in the origin snapshot. Cloning a snapshot is faster than copying the data from
        # a snapshot to a new volume and doesn't consume disk throughput. However, the origin snapshot can't
        # be deleted if there is a volume using its copied data. FULL_COPY - Copies all data from the snapshot
        # to the new volume. The INCREMENTAL_COPY option is only for updating an existing volume by using a
        # snapshot from another FSx for OpenZFS file system. For more information, see
        # CopySnapshotAndUpdateVolume .
        @[JSON::Field(key: "CopyStrategy")]
        getter copy_strategy : String?

        @[JSON::Field(key: "SnapshotARN")]
        getter snapshot_arn : String?

        def initialize(
          @copy_strategy : String? = nil,
          @snapshot_arn : String? = nil
        )
        end
      end

      # The FSx for OpenZFS file system user that is used for authorizing all file access requests that are
      # made using the S3 access point.
      struct OpenZFSPosixFileSystemUser
        include JSON::Serializable

        # The GID of the file system user.
        @[JSON::Field(key: "Gid")]
        getter gid : Int64

        # The UID of the file system user.
        @[JSON::Field(key: "Uid")]
        getter uid : Int64

        # The list of secondary GIDs for the file system user.
        @[JSON::Field(key: "SecondaryGids")]
        getter secondary_gids : Array(Int64)?

        def initialize(
          @gid : Int64,
          @uid : Int64,
          @secondary_gids : Array(Int64)? = nil
        )
        end
      end

      # The configuration for the optional provisioned SSD read cache on Amazon FSx for OpenZFS file systems
      # that use the Intelligent-Tiering storage class.
      struct OpenZFSReadCacheConfiguration
        include JSON::Serializable

        # Required if SizingMode is set to USER_PROVISIONED . Specifies the size of the file system's SSD read
        # cache, in gibibytes (GiB).
        @[JSON::Field(key: "SizeGiB")]
        getter size_gi_b : Int32?

        # Specifies how the provisioned SSD read cache is sized, as follows: Set to NO_CACHE if you do not
        # want to use an SSD read cache with your Intelligent-Tiering file system. Set to USER_PROVISIONED to
        # specify the exact size of your SSD read cache. Set to PROPORTIONAL_TO_THROUGHPUT_CAPACITY to have
        # your SSD read cache automatically sized based on your throughput capacity.
        @[JSON::Field(key: "SizingMode")]
        getter sizing_mode : String?

        def initialize(
          @size_gi_b : Int32? = nil,
          @sizing_mode : String? = nil
        )
        end
      end

      # Used to configure quotas that define how much storage a user or group can use on an FSx for OpenZFS
      # volume. For more information, see Volume properties in the FSx for OpenZFS User Guide.
      struct OpenZFSUserOrGroupQuota
        include JSON::Serializable

        # The ID of the user or group that the quota applies to.
        @[JSON::Field(key: "Id")]
        getter id : Int32

        # The user or group's storage quota, in gibibytes (GiB).
        @[JSON::Field(key: "StorageCapacityQuotaGiB")]
        getter storage_capacity_quota_gi_b : Int32

        # Specifies whether the quota applies to a user or group.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @id : Int32,
          @storage_capacity_quota_gi_b : Int32,
          @type : String
        )
        end
      end

      # The configuration of an Amazon FSx for OpenZFS volume.
      struct OpenZFSVolumeConfiguration
        include JSON::Serializable

        # Specifies the strategy used when copying data from the snapshot to the new volume. CLONE - The new
        # volume references the data in the origin snapshot. Cloning a snapshot is faster than copying data
        # from the snapshot to a new volume and doesn't consume disk throughput. However, the origin snapshot
        # can't be deleted if there is a volume using its copied data. FULL_COPY - Copies all data from the
        # snapshot to the new volume. Specify this option to create the volume from a snapshot on another FSx
        # for OpenZFS file system. The INCREMENTAL_COPY option is only for updating an existing volume by
        # using a snapshot from another FSx for OpenZFS file system. For more information, see
        # CopySnapshotAndUpdateVolume .
        @[JSON::Field(key: "CopyStrategy")]
        getter copy_strategy : String?

        # A Boolean value indicating whether tags for the volume should be copied to snapshots. This value
        # defaults to false . If it's set to true , all tags for the volume are copied to snapshots where the
        # user doesn't specify tags. If this value is true and you specify one or more tags, only the
        # specified tags are copied to snapshots. If you specify one or more tags when creating the snapshot,
        # no tags are copied from the volume, regardless of this value.
        @[JSON::Field(key: "CopyTagsToSnapshots")]
        getter copy_tags_to_snapshots : Bool?

        # Specifies the method used to compress the data on the volume. The compression type is NONE by
        # default. NONE - Doesn't compress the data on the volume. NONE is the default. ZSTD - Compresses the
        # data in the volume using the Zstandard (ZSTD) compression algorithm. Compared to LZ4, Z-Standard
        # provides a better compression ratio to minimize on-disk storage utilization. LZ4 - Compresses the
        # data in the volume using the LZ4 compression algorithm. Compared to Z-Standard, LZ4 is less
        # compute-intensive and delivers higher write throughput speeds.
        @[JSON::Field(key: "DataCompressionType")]
        getter data_compression_type : String?

        # A Boolean value indicating whether dependent clone volumes created from intermediate snapshots
        # should be deleted when a volume is restored from snapshot.
        @[JSON::Field(key: "DeleteClonedVolumes")]
        getter delete_cloned_volumes : Bool?

        # A Boolean value indicating whether snapshot data that differs between the current state and the
        # specified snapshot should be overwritten when a volume is restored from a snapshot.
        @[JSON::Field(key: "DeleteIntermediateData")]
        getter delete_intermediate_data : Bool?

        # A Boolean value indicating whether snapshots between the current state and the specified snapshot
        # should be deleted when a volume is restored from snapshot.
        @[JSON::Field(key: "DeleteIntermediateSnaphots")]
        getter delete_intermediate_snaphots : Bool?

        # The ID of the snapshot that's being copied or was most recently copied to the destination volume.
        @[JSON::Field(key: "DestinationSnapshot")]
        getter destination_snapshot : String?

        # The configuration object for mounting a Network File System (NFS) file system.
        @[JSON::Field(key: "NfsExports")]
        getter nfs_exports : Array(Types::OpenZFSNfsExport)?

        # The configuration object that specifies the snapshot to use as the origin of the data for the
        # volume.
        @[JSON::Field(key: "OriginSnapshot")]
        getter origin_snapshot : Types::OpenZFSOriginSnapshotConfiguration?

        # The ID of the parent volume.
        @[JSON::Field(key: "ParentVolumeId")]
        getter parent_volume_id : String?

        # A Boolean value indicating whether the volume is read-only.
        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # The record size of an OpenZFS volume, in kibibytes (KiB). Valid values are 4, 8, 16, 32, 64, 128,
        # 256, 512, or 1024 KiB. The default is 128 KiB. Most workloads should use the default record size.
        # For guidance on when to set a custom record size, see the Amazon FSx for OpenZFS User Guide .
        @[JSON::Field(key: "RecordSizeKiB")]
        getter record_size_ki_b : Int32?

        # Specifies the ID of the snapshot to which the volume was restored.
        @[JSON::Field(key: "RestoreToSnapshot")]
        getter restore_to_snapshot : String?

        @[JSON::Field(key: "SourceSnapshotARN")]
        getter source_snapshot_arn : String?

        # The maximum amount of storage in gibibytes (GiB) that the volume can use from its parent. You can
        # specify a quota larger than the storage on the parent volume.
        @[JSON::Field(key: "StorageCapacityQuotaGiB")]
        getter storage_capacity_quota_gi_b : Int32?

        # The amount of storage in gibibytes (GiB) to reserve from the parent volume. You can't reserve more
        # storage than the parent volume has reserved.
        @[JSON::Field(key: "StorageCapacityReservationGiB")]
        getter storage_capacity_reservation_gi_b : Int32?

        # An object specifying how much storage users or groups can use on the volume.
        @[JSON::Field(key: "UserAndGroupQuotas")]
        getter user_and_group_quotas : Array(Types::OpenZFSUserOrGroupQuota)?

        # The path to the volume from the root volume. For example, fsx/parentVolume/volume1 .
        @[JSON::Field(key: "VolumePath")]
        getter volume_path : String?

        def initialize(
          @copy_strategy : String? = nil,
          @copy_tags_to_snapshots : Bool? = nil,
          @data_compression_type : String? = nil,
          @delete_cloned_volumes : Bool? = nil,
          @delete_intermediate_data : Bool? = nil,
          @delete_intermediate_snaphots : Bool? = nil,
          @destination_snapshot : String? = nil,
          @nfs_exports : Array(Types::OpenZFSNfsExport)? = nil,
          @origin_snapshot : Types::OpenZFSOriginSnapshotConfiguration? = nil,
          @parent_volume_id : String? = nil,
          @read_only : Bool? = nil,
          @record_size_ki_b : Int32? = nil,
          @restore_to_snapshot : String? = nil,
          @source_snapshot_arn : String? = nil,
          @storage_capacity_quota_gi_b : Int32? = nil,
          @storage_capacity_reservation_gi_b : Int32? = nil,
          @user_and_group_quotas : Array(Types::OpenZFSUserOrGroupQuota)? = nil,
          @volume_path : String? = nil
        )
        end
      end

      # The configuration that specifies a minimum amount of time since last access for an exported file to
      # be eligible for release from an Amazon FSx for Lustre file system. Only files that were last
      # accessed before this point-in-time can be released. For example, if you specify a last accessed time
      # criteria of 9 days, only files that were last accessed 9.00001 or more days ago can be released.
      # Only file data that has been exported to S3 can be released. Files that have not yet been exported
      # to S3, such as new or changed files that have not been exported, are not eligible for release. When
      # files are released, their metadata stays on the file system, so they can still be accessed later.
      # Users and applications can access a released file by reading the file again, which restores data
      # from Amazon S3 to the FSx for Lustre file system. If a file meets the last accessed time criteria,
      # its file or directory path must also be specified with the Paths parameter of the operation in order
      # for the file to be released.
      struct ReleaseConfiguration
        include JSON::Serializable

        # Defines the point-in-time since an exported file was last accessed, in order for that file to be
        # eligible for release. Only files that were last accessed before this point-in-time are eligible to
        # be released from the file system.
        @[JSON::Field(key: "DurationSinceLastAccess")]
        getter duration_since_last_access : Types::DurationSinceLastAccess?

        def initialize(
          @duration_since_last_access : Types::DurationSinceLastAccess? = nil
        )
        end
      end

      struct ReleaseFileSystemNfsV3LocksRequest
        include JSON::Serializable

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @file_system_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct ReleaseFileSystemNfsV3LocksResponse
        include JSON::Serializable

        @[JSON::Field(key: "FileSystem")]
        getter file_system : Types::FileSystem?

        def initialize(
          @file_system : Types::FileSystem? = nil
        )
        end
      end

      # The resource specified does not support tagging.
      struct ResourceDoesNotSupportTagging
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that doesn't support tagging.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @resource_arn : String,
          @message : String? = nil
        )
        end
      end

      # The resource specified by the Amazon Resource Name (ARN) can't be found.
      struct ResourceNotFound
        include JSON::Serializable

        # The resource ARN of the resource that can't be found.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @resource_arn : String,
          @message : String? = nil
        )
        end
      end

      struct RestoreVolumeFromSnapshotRequest
        include JSON::Serializable

        # The ID of the source snapshot. Specifies the snapshot that you are restoring from.
        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String

        # The ID of the volume that you are restoring.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The settings used when restoring the specified volume from snapshot. DELETE_INTERMEDIATE_SNAPSHOTS -
        # Deletes snapshots between the current state and the specified snapshot. If there are intermediate
        # snapshots and this option isn't used, RestoreVolumeFromSnapshot fails. DELETE_CLONED_VOLUMES -
        # Deletes any dependent clone volumes created from intermediate snapshots. If there are any dependent
        # clone volumes and this option isn't used, RestoreVolumeFromSnapshot fails.
        @[JSON::Field(key: "Options")]
        getter options : Array(String)?

        def initialize(
          @snapshot_id : String,
          @volume_id : String,
          @client_request_token : String? = nil,
          @options : Array(String)? = nil
        )
        end
      end

      struct RestoreVolumeFromSnapshotResponse
        include JSON::Serializable

        # A list of administrative actions for the file system that are in process or waiting to be processed.
        # Administrative actions describe changes to the Amazon FSx system.
        @[JSON::Field(key: "AdministrativeActions")]
        getter administrative_actions : Array(Types::AdministrativeAction)?

        # The lifecycle state of the volume being restored.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The ID of the volume that you restored.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        def initialize(
          @administrative_actions : Array(Types::AdministrativeAction)? = nil,
          @lifecycle : String? = nil,
          @volume_id : String? = nil
        )
        end
      end

      # Specifies the retention period of an FSx for ONTAP SnapLock volume. After it is set, it can't be
      # changed. Files can't be deleted or modified during the retention period. For more information, see
      # Working with the retention period in SnapLock .
      struct RetentionPeriod
        include JSON::Serializable

        # Defines the type of time for the retention period of an FSx for ONTAP SnapLock volume. Set it to one
        # of the valid types. If you set it to INFINITE , the files are retained forever. If you set it to
        # UNSPECIFIED , the files are retained until you set an explicit retention period.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Defines the amount of time for the retention period of an FSx for ONTAP SnapLock volume. You can't
        # set a value for INFINITE or UNSPECIFIED . For all other options, the following ranges are valid:
        # Seconds : 0 - 65,535 Minutes : 0 - 65,535 Hours : 0 - 24 Days : 0 - 365 Months : 0 - 12 Years : 0 -
        # 100
        @[JSON::Field(key: "Value")]
        getter value : Int32?

        def initialize(
          @type : String,
          @value : Int32? = nil
        )
        end
      end

      # Describes the S3 access point configuration of the S3 access point attachment.
      struct S3AccessPoint
        include JSON::Serializable

        # The S3 access point's alias.
        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # he S3 access point's ARN.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The S3 access point's virtual private cloud (VPC) configuration.
        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::S3AccessPointVpcConfiguration?

        def initialize(
          @alias : String? = nil,
          @resource_arn : String? = nil,
          @vpc_configuration : Types::S3AccessPointVpcConfiguration? = nil
        )
        end
      end

      # An S3 access point attached to an Amazon FSx volume.
      struct S3AccessPointAttachment
        include JSON::Serializable

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The lifecycle status of the S3 access point attachment. The lifecycle can have the following values:
        # AVAILABLE - the S3 access point attachment is available for use CREATING - Amazon FSx is creating
        # the S3 access point and attachment DELETING - Amazon FSx is deleting the S3 access point and
        # attachment FAILED - The S3 access point attachment is in a failed state. Delete and detach the S3
        # access point attachment, and create a new one. UPDATING - Amazon FSx is updating the S3 access point
        # attachment
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        @[JSON::Field(key: "LifecycleTransitionReason")]
        getter lifecycle_transition_reason : Types::LifecycleTransitionReason?

        # The name of the S3 access point attachment; also used for the name of the S3 access point.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ONTAP configuration of the S3 access point attachment.
        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::S3AccessPointOntapConfiguration?

        # The OpenZFSConfiguration of the S3 access point attachment.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::S3AccessPointOpenZFSConfiguration?

        # The S3 access point configuration of the S3 access point attachment.
        @[JSON::Field(key: "S3AccessPoint")]
        getter s3_access_point : Types::S3AccessPoint?

        # The type of Amazon FSx volume that the S3 access point is attached to.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @creation_time : Time? = nil,
          @lifecycle : String? = nil,
          @lifecycle_transition_reason : Types::LifecycleTransitionReason? = nil,
          @name : String? = nil,
          @ontap_configuration : Types::S3AccessPointOntapConfiguration? = nil,
          @open_zfs_configuration : Types::S3AccessPointOpenZFSConfiguration? = nil,
          @s3_access_point : Types::S3AccessPoint? = nil,
          @type : String? = nil
        )
        end
      end

      # The access point specified was not found.
      struct S3AccessPointAttachmentNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A set of Name and Values pairs used to view a select set of S3 access point attachments.
      struct S3AccessPointAttachmentsFilter
        include JSON::Serializable

        # The name of the filter.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The values of the filter.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes the FSx for ONTAP attachment configuration of an S3 access point attachment.
      struct S3AccessPointOntapConfiguration
        include JSON::Serializable

        # The file system identity used to authorize file access requests made using the S3 access point.
        @[JSON::Field(key: "FileSystemIdentity")]
        getter file_system_identity : Types::OntapFileSystemIdentity?

        # The ID of the FSx for ONTAP volume that the S3 access point is attached to.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        def initialize(
          @file_system_identity : Types::OntapFileSystemIdentity? = nil,
          @volume_id : String? = nil
        )
        end
      end

      # Describes the FSx for OpenZFS attachment configuration of an S3 access point attachment.
      struct S3AccessPointOpenZFSConfiguration
        include JSON::Serializable

        # The file system identity used to authorize file access requests made using the S3 access point.
        @[JSON::Field(key: "FileSystemIdentity")]
        getter file_system_identity : Types::OpenZFSFileSystemIdentity?

        # The ID of the FSx for OpenZFS volume that the S3 access point is attached to.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        def initialize(
          @file_system_identity : Types::OpenZFSFileSystemIdentity? = nil,
          @volume_id : String? = nil
        )
        end
      end

      # If included, Amazon S3 restricts access to this access point to requests from the specified virtual
      # private cloud (VPC).
      struct S3AccessPointVpcConfiguration
        include JSON::Serializable

        # Specifies the virtual private cloud (VPC) for the S3 access point VPC configuration, if one exists.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @vpc_id : String? = nil
        )
        end
      end

      # The configuration for an Amazon S3 data repository linked to an Amazon FSx for Lustre file system
      # with a data repository association. The configuration consists of an AutoImportPolicy that defines
      # which file events on the data repository are automatically imported to the file system and an
      # AutoExportPolicy that defines which file events on the file system are automatically exported to the
      # data repository. File events are when files or directories are added, changed, or deleted on the
      # file system or the data repository. Data repository associations on Amazon File Cache don't use
      # S3DataRepositoryConfiguration because they don't support automatic import or automatic export.
      struct S3DataRepositoryConfiguration
        include JSON::Serializable

        # Specifies the type of updated objects (new, changed, deleted) that will be automatically exported
        # from your file system to the linked S3 bucket.
        @[JSON::Field(key: "AutoExportPolicy")]
        getter auto_export_policy : Types::AutoExportPolicy?

        # Specifies the type of updated objects (new, changed, deleted) that will be automatically imported
        # from the linked S3 bucket to your file system.
        @[JSON::Field(key: "AutoImportPolicy")]
        getter auto_import_policy : Types::AutoImportPolicy?

        def initialize(
          @auto_export_policy : Types::AutoExportPolicy? = nil,
          @auto_import_policy : Types::AutoImportPolicy? = nil
        )
        end
      end

      # The configuration of the self-managed Microsoft Active Directory (AD) directory to which the Windows
      # File Server or ONTAP storage virtual machine (SVM) instance is joined.
      struct SelfManagedActiveDirectoryAttributes
        include JSON::Serializable

        # A list of up to three IP addresses of DNS servers or domain controllers in the self-managed AD
        # directory.
        @[JSON::Field(key: "DnsIps")]
        getter dns_ips : Array(String)?

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret containing the
        # service account credentials used to join the file system to your self-managed Active Directory
        # domain.
        @[JSON::Field(key: "DomainJoinServiceAccountSecret")]
        getter domain_join_service_account_secret : String?

        # The fully qualified domain name of the self-managed AD directory.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The name of the domain group whose members have administrative privileges for the FSx file system.
        @[JSON::Field(key: "FileSystemAdministratorsGroup")]
        getter file_system_administrators_group : String?

        # The fully qualified distinguished name of the organizational unit within the self-managed AD
        # directory to which the Windows File Server or ONTAP storage virtual machine (SVM) instance is
        # joined.
        @[JSON::Field(key: "OrganizationalUnitDistinguishedName")]
        getter organizational_unit_distinguished_name : String?

        # The user name for the service account on your self-managed AD domain that FSx uses to join to your
        # AD domain.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @dns_ips : Array(String)? = nil,
          @domain_join_service_account_secret : String? = nil,
          @domain_name : String? = nil,
          @file_system_administrators_group : String? = nil,
          @organizational_unit_distinguished_name : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # The configuration that Amazon FSx uses to join a FSx for Windows File Server file system or an FSx
      # for ONTAP storage virtual machine (SVM) to a self-managed (including on-premises) Microsoft Active
      # Directory (AD) directory. For more information, see Using Amazon FSx for Windows with your
      # self-managed Microsoft Active Directory or Managing FSx for ONTAP SVMs .
      struct SelfManagedActiveDirectoryConfiguration
        include JSON::Serializable

        # A list of up to three IP addresses of DNS servers or domain controllers in the self-managed AD
        # directory.
        @[JSON::Field(key: "DnsIps")]
        getter dns_ips : Array(String)

        # The fully qualified domain name of the self-managed AD directory, such as corp.example.com .
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret containing the
        # self-managed Active Directory domain join service account credentials. When provided, Amazon FSx
        # uses the credentials stored in this secret to join the file system to your self-managed Active
        # Directory domain. The secret must contain two key-value pairs:
        # CUSTOMER_MANAGED_ACTIVE_DIRECTORY_USERNAME - The username for the service account
        # CUSTOMER_MANAGED_ACTIVE_DIRECTORY_PASSWORD - The password for the service account For more
        # information, see Using Amazon FSx for Windows with your self-managed Microsoft Active Directory or
        # Using Amazon FSx for ONTAP with your self-managed Microsoft Active Directory .
        @[JSON::Field(key: "DomainJoinServiceAccountSecret")]
        getter domain_join_service_account_secret : String?

        # (Optional) The name of the domain group whose members are granted administrative privileges for the
        # file system. Administrative privileges include taking ownership of files and folders, setting audit
        # controls (audit ACLs) on files and folders, and administering the file system remotely by using the
        # FSx Remote PowerShell. The group that you specify must already exist in your domain. If you don't
        # provide one, your AD domain's Domain Admins group is used.
        @[JSON::Field(key: "FileSystemAdministratorsGroup")]
        getter file_system_administrators_group : String?

        # (Optional) The fully qualified distinguished name of the organizational unit within your
        # self-managed AD directory. Amazon FSx only accepts OU as the direct parent of the file system. An
        # example is OU=FSx,DC=yourdomain,DC=corp,DC=com . To learn more, see RFC 2253 . If none is provided,
        # the FSx file system is created in the default location of your self-managed AD directory. Only
        # Organizational Unit (OU) objects can be the direct parent of the file system that you're creating.
        @[JSON::Field(key: "OrganizationalUnitDistinguishedName")]
        getter organizational_unit_distinguished_name : String?

        # The password for the service account on your self-managed AD domain that Amazon FSx will use to join
        # to your AD domain.
        @[JSON::Field(key: "Password")]
        getter password : String?

        # The user name for the service account on your self-managed AD domain that Amazon FSx will use to
        # join to your AD domain. This account must have the permission to join computers to the domain in the
        # organizational unit provided in OrganizationalUnitDistinguishedName , or in the default location of
        # your AD domain.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @dns_ips : Array(String),
          @domain_name : String,
          @domain_join_service_account_secret : String? = nil,
          @file_system_administrators_group : String? = nil,
          @organizational_unit_distinguished_name : String? = nil,
          @password : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Specifies changes you are making to the self-managed Microsoft Active Directory configuration to
      # which an FSx for Windows File Server file system or an FSx for ONTAP SVM is joined.
      struct SelfManagedActiveDirectoryConfigurationUpdates
        include JSON::Serializable

        # A list of up to three DNS server or domain controller IP addresses in your self-managed Active
        # Directory domain.
        @[JSON::Field(key: "DnsIps")]
        getter dns_ips : Array(String)?

        # Specifies the updated Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret
        # containing the self-managed Active Directory domain join service account credentials. Amazon FSx
        # uses this account to join to your self-managed Active Directory domain.
        @[JSON::Field(key: "DomainJoinServiceAccountSecret")]
        getter domain_join_service_account_secret : String?

        # Specifies an updated fully qualified domain name of your self-managed Active Directory
        # configuration.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # For FSx for ONTAP file systems only - Specifies the updated name of the self-managed Active
        # Directory domain group whose members are granted administrative privileges for the Amazon FSx
        # resource.
        @[JSON::Field(key: "FileSystemAdministratorsGroup")]
        getter file_system_administrators_group : String?

        # Specifies an updated fully qualified distinguished name of the organization unit within your
        # self-managed Active Directory.
        @[JSON::Field(key: "OrganizationalUnitDistinguishedName")]
        getter organizational_unit_distinguished_name : String?

        # Specifies the updated password for the service account on your self-managed Active Directory domain.
        # Amazon FSx uses this account to join to your self-managed Active Directory domain.
        @[JSON::Field(key: "Password")]
        getter password : String?

        # Specifies the updated user name for the service account on your self-managed Active Directory
        # domain. Amazon FSx uses this account to join to your self-managed Active Directory domain. This
        # account must have the permissions required to join computers to the domain in the organizational
        # unit provided in OrganizationalUnitDistinguishedName .
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @dns_ips : Array(String)? = nil,
          @domain_join_service_account_secret : String? = nil,
          @domain_name : String? = nil,
          @file_system_administrators_group : String? = nil,
          @organizational_unit_distinguished_name : String? = nil,
          @password : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # An error indicating that a particular service limit was exceeded. You can increase some service
      # limits by contacting Amazon Web Services Support.
      struct ServiceLimitExceeded
        include JSON::Serializable

        # Enumeration of the service limit that was exceeded.
        @[JSON::Field(key: "Limit")]
        getter limit : String

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @limit : String,
          @message : String? = nil
        )
        end
      end

      # Specifies the SnapLock configuration for an FSx for ONTAP SnapLock volume.
      struct SnaplockConfiguration
        include JSON::Serializable

        # Enables or disables the audit log volume for an FSx for ONTAP SnapLock volume. The default value is
        # false . If you set AuditLogVolume to true , the SnapLock volume is created as an audit log volume.
        # The minimum retention period for an audit log volume is six months. For more information, see
        # SnapLock audit log volumes .
        @[JSON::Field(key: "AuditLogVolume")]
        getter audit_log_volume : Bool?

        # The configuration object for setting the autocommit period of files in an FSx for ONTAP SnapLock
        # volume.
        @[JSON::Field(key: "AutocommitPeriod")]
        getter autocommit_period : Types::AutocommitPeriod?

        # Enables, disables, or permanently disables privileged delete on an FSx for ONTAP SnapLock Enterprise
        # volume. Enabling privileged delete allows SnapLock administrators to delete write once, read many
        # (WORM) files even if they have active retention periods. PERMANENTLY_DISABLED is a terminal state.
        # If privileged delete is permanently disabled on a SnapLock volume, you can't re-enable it. The
        # default value is DISABLED . For more information, see Privileged delete .
        @[JSON::Field(key: "PrivilegedDelete")]
        getter privileged_delete : String?

        # Specifies the retention period of an FSx for ONTAP SnapLock volume.
        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::SnaplockRetentionPeriod?

        # Specifies the retention mode of an FSx for ONTAP SnapLock volume. After it is set, it can't be
        # changed. You can choose one of the following retention modes: COMPLIANCE : Files transitioned to
        # write once, read many (WORM) on a Compliance volume can't be deleted until their retention periods
        # expire. This retention mode is used to address government or industry-specific mandates or to
        # protect against ransomware attacks. For more information, see SnapLock Compliance . ENTERPRISE :
        # Files transitioned to WORM on an Enterprise volume can be deleted by authorized users before their
        # retention periods expire using privileged delete. This retention mode is used to advance an
        # organization's data integrity and internal compliance or to test retention settings before using
        # SnapLock Compliance. For more information, see SnapLock Enterprise .
        @[JSON::Field(key: "SnaplockType")]
        getter snaplock_type : String?

        # Enables or disables volume-append mode on an FSx for ONTAP SnapLock volume. Volume-append mode
        # allows you to create WORM-appendable files and write data to them incrementally. The default value
        # is false . For more information, see Volume-append mode .
        @[JSON::Field(key: "VolumeAppendModeEnabled")]
        getter volume_append_mode_enabled : Bool?

        def initialize(
          @audit_log_volume : Bool? = nil,
          @autocommit_period : Types::AutocommitPeriod? = nil,
          @privileged_delete : String? = nil,
          @retention_period : Types::SnaplockRetentionPeriod? = nil,
          @snaplock_type : String? = nil,
          @volume_append_mode_enabled : Bool? = nil
        )
        end
      end

      # The configuration to set the retention period of an FSx for ONTAP SnapLock volume. The retention
      # period includes default, maximum, and minimum settings. For more information, see Working with the
      # retention period in SnapLock .
      struct SnaplockRetentionPeriod
        include JSON::Serializable

        # The retention period assigned to a write once, read many (WORM) file by default if an explicit
        # retention period is not set for an FSx for ONTAP SnapLock volume. The default retention period must
        # be greater than or equal to the minimum retention period and less than or equal to the maximum
        # retention period.
        @[JSON::Field(key: "DefaultRetention")]
        getter default_retention : Types::RetentionPeriod

        # The longest retention period that can be assigned to a WORM file on an FSx for ONTAP SnapLock
        # volume.
        @[JSON::Field(key: "MaximumRetention")]
        getter maximum_retention : Types::RetentionPeriod

        # The shortest retention period that can be assigned to a WORM file on an FSx for ONTAP SnapLock
        # volume.
        @[JSON::Field(key: "MinimumRetention")]
        getter minimum_retention : Types::RetentionPeriod

        def initialize(
          @default_retention : Types::RetentionPeriod,
          @maximum_retention : Types::RetentionPeriod,
          @minimum_retention : Types::RetentionPeriod
        )
        end
      end

      # A snapshot of an Amazon FSx for OpenZFS volume.
      struct Snapshot
        include JSON::Serializable

        # A list of administrative actions for the file system that are in process or waiting to be processed.
        # Administrative actions describe changes to the Amazon FSx system.
        @[JSON::Field(key: "AdministrativeActions")]
        getter administrative_actions : Array(Types::AdministrativeAction)?

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The lifecycle status of the snapshot. PENDING - Amazon FSx hasn't started creating the snapshot.
        # CREATING - Amazon FSx is creating the snapshot. DELETING - Amazon FSx is deleting the snapshot.
        # AVAILABLE - The snapshot is fully available.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        @[JSON::Field(key: "LifecycleTransitionReason")]
        getter lifecycle_transition_reason : Types::LifecycleTransitionReason?

        # The name of the snapshot.
        @[JSON::Field(key: "Name")]
        getter name : String?

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The ID of the snapshot.
        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The ID of the volume that the snapshot is of.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        def initialize(
          @administrative_actions : Array(Types::AdministrativeAction)? = nil,
          @creation_time : Time? = nil,
          @lifecycle : String? = nil,
          @lifecycle_transition_reason : Types::LifecycleTransitionReason? = nil,
          @name : String? = nil,
          @resource_arn : String? = nil,
          @snapshot_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_id : String? = nil
        )
        end
      end

      # A filter used to restrict the results of DescribeSnapshots calls. You can use multiple filters to
      # return results that meet all applied filter requirements.
      struct SnapshotFilter
        include JSON::Serializable

        # The name of the filter to use. You can filter by the file-system-id or by volume-id .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The file-system-id or volume-id that you are filtering for.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # No Amazon FSx snapshots were found based on the supplied parameters.
      struct SnapshotNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the lifecycle status of the source backup isn't AVAILABLE .
      struct SourceBackupUnavailable
        include JSON::Serializable

        @[JSON::Field(key: "BackupId")]
        getter backup_id : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @backup_id : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct StartMisconfiguredStateRecoveryRequest
        include JSON::Serializable

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @file_system_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct StartMisconfiguredStateRecoveryResponse
        include JSON::Serializable

        @[JSON::Field(key: "FileSystem")]
        getter file_system : Types::FileSystem?

        def initialize(
          @file_system : Types::FileSystem? = nil
        )
        end
      end

      # Describes the Amazon FSx for NetApp ONTAP storage virtual machine (SVM) configuration.
      struct StorageVirtualMachine
        include JSON::Serializable

        # Describes the Microsoft Active Directory configuration to which the SVM is joined, if applicable.
        @[JSON::Field(key: "ActiveDirectoryConfiguration")]
        getter active_directory_configuration : Types::SvmActiveDirectoryConfiguration?

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The endpoints that are used to access data or to manage the SVM using the NetApp ONTAP CLI, REST
        # API, or NetApp CloudManager. They are the Iscsi , Management , Nfs , and Smb endpoints.
        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Types::SvmEndpoints?

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # Describes the SVM's lifecycle status. CREATED - The SVM is fully available for use. CREATING -
        # Amazon FSx is creating the new SVM. DELETING - Amazon FSx is deleting an existing SVM. FAILED -
        # Amazon FSx was unable to create the SVM. MISCONFIGURED - The SVM is in a failed but recoverable
        # state. PENDING - Amazon FSx has not started creating the SVM.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # Describes why the SVM lifecycle state changed.
        @[JSON::Field(key: "LifecycleTransitionReason")]
        getter lifecycle_transition_reason : Types::LifecycleTransitionReason?

        # The name of the SVM, if provisioned.
        @[JSON::Field(key: "Name")]
        getter name : String?

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The security style of the root volume of the SVM.
        @[JSON::Field(key: "RootVolumeSecurityStyle")]
        getter root_volume_security_style : String?

        # The SVM's system generated unique ID.
        @[JSON::Field(key: "StorageVirtualMachineId")]
        getter storage_virtual_machine_id : String?

        # Describes the SVM's subtype.
        @[JSON::Field(key: "Subtype")]
        getter subtype : String?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The SVM's UUID (universally unique identifier).
        @[JSON::Field(key: "UUID")]
        getter uuid : String?

        def initialize(
          @active_directory_configuration : Types::SvmActiveDirectoryConfiguration? = nil,
          @creation_time : Time? = nil,
          @endpoints : Types::SvmEndpoints? = nil,
          @file_system_id : String? = nil,
          @lifecycle : String? = nil,
          @lifecycle_transition_reason : Types::LifecycleTransitionReason? = nil,
          @name : String? = nil,
          @resource_arn : String? = nil,
          @root_volume_security_style : String? = nil,
          @storage_virtual_machine_id : String? = nil,
          @subtype : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @uuid : String? = nil
        )
        end
      end

      # A filter used to restrict the results of describe calls for Amazon FSx for NetApp ONTAP storage
      # virtual machines (SVMs). You can use multiple filters to return results that meet all applied filter
      # requirements.
      struct StorageVirtualMachineFilter
        include JSON::Serializable

        # The name for this filter.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The values of the filter. These are all the values for any of the applied filters.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # No FSx for ONTAP SVMs were found based upon the supplied parameters.
      struct StorageVirtualMachineNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the Microsoft Active Directory (AD) directory configuration to which the FSx for ONTAP
      # storage virtual machine (SVM) is joined. Note that account credentials are not returned in the
      # response payload.
      struct SvmActiveDirectoryConfiguration
        include JSON::Serializable

        # The NetBIOS name of the AD computer object to which the SVM is joined.
        @[JSON::Field(key: "NetBiosName")]
        getter net_bios_name : String?

        @[JSON::Field(key: "SelfManagedActiveDirectoryConfiguration")]
        getter self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryAttributes?

        def initialize(
          @net_bios_name : String? = nil,
          @self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryAttributes? = nil
        )
        end
      end

      # An Amazon FSx for NetApp ONTAP storage virtual machine (SVM) has four endpoints that are used to
      # access data or to manage the SVM using the NetApp ONTAP CLI, REST API, or NetApp CloudManager. They
      # are the Iscsi , Management , Nfs , and Smb endpoints.
      struct SvmEndpoint
        include JSON::Serializable

        @[JSON::Field(key: "DNSName")]
        getter dns_name : String?

        # The SVM endpoint's IPv4 addresses.
        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(String)?

        # The SVM endpoint's IPv6 addresses.
        @[JSON::Field(key: "Ipv6Addresses")]
        getter ipv6_addresses : Array(String)?

        def initialize(
          @dns_name : String? = nil,
          @ip_addresses : Array(String)? = nil,
          @ipv6_addresses : Array(String)? = nil
        )
        end
      end

      # An Amazon FSx for NetApp ONTAP storage virtual machine (SVM) has the following endpoints that are
      # used to access data or to manage the SVM using the NetApp ONTAP CLI, REST API, or NetApp
      # CloudManager.
      struct SvmEndpoints
        include JSON::Serializable

        # An endpoint for connecting using the Internet Small Computer Systems Interface (iSCSI) protocol.
        @[JSON::Field(key: "Iscsi")]
        getter iscsi : Types::SvmEndpoint?

        # An endpoint for managing SVMs using the NetApp ONTAP CLI, NetApp ONTAP API, or NetApp CloudManager.
        @[JSON::Field(key: "Management")]
        getter management : Types::SvmEndpoint?

        # An endpoint for connecting using the Network File System (NFS) protocol.
        @[JSON::Field(key: "Nfs")]
        getter nfs : Types::SvmEndpoint?

        # An endpoint for connecting using the Server Message Block (SMB) protocol.
        @[JSON::Field(key: "Smb")]
        getter smb : Types::SvmEndpoint?

        def initialize(
          @iscsi : Types::SvmEndpoint? = nil,
          @management : Types::SvmEndpoint? = nil,
          @nfs : Types::SvmEndpoint? = nil,
          @smb : Types::SvmEndpoint? = nil
        )
        end
      end

      # Specifies a key-value pair for a resource tag.
      struct Tag
        include JSON::Serializable

        # A value that specifies the TagKey , the name of the tag. Tag keys must be unique for the resource to
        # which they are attached.
        @[JSON::Field(key: "Key")]
        getter key : String

        # A value that specifies the TagValue , the value assigned to the corresponding tag key. Tag values
        # can be null and don't have to be unique in a tag set. For example, you can have a key-value pair in
        # a tag set of finances : April and also of payroll : April .
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The request object for the TagResource operation.
      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon FSx resource that you want to tag.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tags for the resource. If a tag with a given key already exists, the value is replaced by
        # the one specified in this parameter.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # The response object for the TagResource operation.
      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the data tiering policy for an ONTAP volume. When enabled, Amazon FSx for ONTAP's
      # intelligent tiering automatically transitions a volume's data between the file system's primary
      # storage and capacity pool storage based on your access patterns. Valid tiering policies are the
      # following: SNAPSHOT_ONLY - (Default value) moves cold snapshots to the capacity pool storage tier.
      # AUTO - moves cold user data and snapshots to the capacity pool storage tier based on your access
      # patterns. ALL - moves all user data blocks in both the active file system and Snapshot copies to the
      # storage pool tier. NONE - keeps a volume's data in the primary storage tier, preventing it from
      # being moved to the capacity pool tier.
      struct TieringPolicy
        include JSON::Serializable

        # Specifies the number of days that user data in a volume must remain inactive before it is considered
        # "cold" and moved to the capacity pool. Used with the AUTO and SNAPSHOT_ONLY tiering policies. Enter
        # a whole number between 2 and 183. Default values are 31 days for AUTO and 2 days for SNAPSHOT_ONLY .
        @[JSON::Field(key: "CoolingPeriod")]
        getter cooling_period : Int32?

        # Specifies the tiering policy used to transition data. Default value is SNAPSHOT_ONLY . SNAPSHOT_ONLY
        # - moves cold snapshots to the capacity pool storage tier. AUTO - moves cold user data and snapshots
        # to the capacity pool storage tier based on your access patterns. ALL - moves all user data blocks in
        # both the active file system and Snapshot copies to the storage pool tier. NONE - keeps a volume's
        # data in the primary storage tier, preventing it from being moved to the capacity pool tier.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @cooling_period : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      # You have reached the maximum number of S3 access points attachments allowed for your account in this
      # Amazon Web Services Region, or for the file system. For more information, or to request an increase,
      # see Service quotas on FSx resources in the FSx for OpenZFS User Guide.
      struct TooManyAccessPoints
        include JSON::Serializable

        # An error code indicating that you have reached the maximum number of S3 access points attachments
        # allowed for your account in this Amazon Web Services Region, or for the file system.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The requested operation is not supported for this resource or API.
      struct UnsupportedOperation
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request object for UntagResource action.
      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the Amazon FSx resource to untag.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of keys of tags on the resource to untag. In case the tag key doesn't exist, the call will
        # still succeed to be idempotent.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # The response object for UntagResource action.
      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateDataRepositoryAssociationRequest
        include JSON::Serializable

        # The ID of the data repository association that you are updating.
        @[JSON::Field(key: "AssociationId")]
        getter association_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # For files imported from a data repository, this value determines the stripe count and maximum amount
        # of data per file (in MiB) stored on a single physical disk. The maximum number of disks that a
        # single file can be striped across is limited by the total number of disks that make up the file
        # system. The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB).
        # Amazon S3 objects have a maximum size of 5 TB.
        @[JSON::Field(key: "ImportedFileChunkSize")]
        getter imported_file_chunk_size : Int32?

        # The configuration for an Amazon S3 data repository linked to an Amazon FSx Lustre file system with a
        # data repository association. The configuration defines which file events (new, changed, or deleted
        # files or directories) are automatically imported from the linked data repository to the file system
        # or automatically exported from the file system to the data repository.
        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3DataRepositoryConfiguration?

        def initialize(
          @association_id : String,
          @client_request_token : String? = nil,
          @imported_file_chunk_size : Int32? = nil,
          @s3 : Types::S3DataRepositoryConfiguration? = nil
        )
        end
      end

      struct UpdateDataRepositoryAssociationResponse
        include JSON::Serializable

        # The response object returned after the data repository association is updated.
        @[JSON::Field(key: "Association")]
        getter association : Types::DataRepositoryAssociation?

        def initialize(
          @association : Types::DataRepositoryAssociation? = nil
        )
        end
      end

      # The configuration update for an Amazon File Cache resource.
      struct UpdateFileCacheLustreConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      struct UpdateFileCacheRequest
        include JSON::Serializable

        # The ID of the cache that you are updating.
        @[JSON::Field(key: "FileCacheId")]
        getter file_cache_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The configuration updates for an Amazon File Cache resource.
        @[JSON::Field(key: "LustreConfiguration")]
        getter lustre_configuration : Types::UpdateFileCacheLustreConfiguration?

        def initialize(
          @file_cache_id : String,
          @client_request_token : String? = nil,
          @lustre_configuration : Types::UpdateFileCacheLustreConfiguration? = nil
        )
        end
      end

      struct UpdateFileCacheResponse
        include JSON::Serializable

        # A description of the cache that was updated.
        @[JSON::Field(key: "FileCache")]
        getter file_cache : Types::FileCache?

        def initialize(
          @file_cache : Types::FileCache? = nil
        )
        end
      end

      # The configuration object for Amazon FSx for Lustre file systems used in the UpdateFileSystem
      # operation.
      struct UpdateFileSystemLustreConfiguration
        include JSON::Serializable

        # (Optional) When you create your file system, your existing S3 objects appear as file and directory
        # listings. Use this property to choose how Amazon FSx keeps your file and directory listing up to
        # date as you add or modify objects in your linked S3 bucket. AutoImportPolicy can have the following
        # values: NONE - (Default) AutoImport is off. Amazon FSx only updates file and directory listings from
        # the linked S3 bucket when the file system is created. FSx does not update the file and directory
        # listing for any new or changed objects after choosing this option. NEW - AutoImport is on. Amazon
        # FSx automatically imports directory listings of any new objects added to the linked S3 bucket that
        # do not currently exist in the FSx file system. NEW_CHANGED - AutoImport is on. Amazon FSx
        # automatically imports file and directory listings of any new objects added to the S3 bucket and any
        # existing objects that are changed in the S3 bucket after you choose this option. NEW_CHANGED_DELETED
        # - AutoImport is on. Amazon FSx automatically imports file and directory listings of any new objects
        # added to the S3 bucket, any existing objects that are changed in the S3 bucket, and any objects that
        # were deleted in the S3 bucket. This parameter is not supported for file systems with a data
        # repository association.
        @[JSON::Field(key: "AutoImportPolicy")]
        getter auto_import_policy : String?

        # The number of days to retain automatic backups. Setting this property to 0 disables automatic
        # backups. You can retain automatic backups for a maximum of 90 days. The default is 0 .
        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # Sets the data compression configuration for the file system. DataCompressionType can have the
        # following values: NONE - Data compression is turned off for the file system. LZ4 - Data compression
        # is turned on with the LZ4 algorithm. If you don't use DataCompressionType , the file system retains
        # its current data compression configuration. For more information, see Lustre data compression .
        @[JSON::Field(key: "DataCompressionType")]
        getter data_compression_type : String?

        # Specifies the optional provisioned SSD read cache on Amazon FSx for Lustre file systems that use the
        # Intelligent-Tiering storage class.
        @[JSON::Field(key: "DataReadCacheConfiguration")]
        getter data_read_cache_configuration : Types::LustreReadCacheConfiguration?

        # The Lustre logging configuration used when updating an Amazon FSx for Lustre file system. When
        # logging is enabled, Lustre logs error and warning events for data repositories associated with your
        # file system to Amazon CloudWatch Logs.
        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LustreLogCreateConfiguration?

        # The Lustre metadata performance configuration for an Amazon FSx for Lustre file system using a
        # PERSISTENT_2 deployment type. When this configuration is enabled, the file system supports
        # increasing metadata performance.
        @[JSON::Field(key: "MetadataConfiguration")]
        getter metadata_configuration : Types::UpdateFileSystemLustreMetadataConfiguration?

        # The throughput of an Amazon FSx for Lustre Persistent SSD-based file system, measured in megabytes
        # per second per tebibyte (MB/s/TiB). You can increase or decrease your file system's throughput.
        # Valid values depend on the deployment type of the file system, as follows: For PERSISTENT_1
        # SSD-based deployment types, valid values are 50, 100, and 200 MB/s/TiB. For PERSISTENT_2 SSD-based
        # deployment types, valid values are 125, 250, 500, and 1000 MB/s/TiB. For more information, see
        # Managing throughput capacity .
        @[JSON::Field(key: "PerUnitStorageThroughput")]
        getter per_unit_storage_throughput : Int32?

        # The Lustre root squash configuration used when updating an Amazon FSx for Lustre file system. When
        # enabled, root squash restricts root-level access from clients that try to access your file system as
        # a root user.
        @[JSON::Field(key: "RootSquashConfiguration")]
        getter root_squash_configuration : Types::LustreRootSquashConfiguration?

        # The throughput of an Amazon FSx for Lustre file system using an Intelligent-Tiering storage class,
        # measured in megabytes per second (MBps). You can only increase your file system's throughput. Valid
        # values are 4000 MBps or multiples of 4000 MBps.
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        # (Optional) The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time
        # zone. d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.
        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @auto_import_policy : String? = nil,
          @automatic_backup_retention_days : Int32? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @data_compression_type : String? = nil,
          @data_read_cache_configuration : Types::LustreReadCacheConfiguration? = nil,
          @log_configuration : Types::LustreLogCreateConfiguration? = nil,
          @metadata_configuration : Types::UpdateFileSystemLustreMetadataConfiguration? = nil,
          @per_unit_storage_throughput : Int32? = nil,
          @root_squash_configuration : Types::LustreRootSquashConfiguration? = nil,
          @throughput_capacity : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # The Lustre metadata performance configuration update for an Amazon FSx for Lustre file system using
      # a PERSISTENT_2 deployment type. You can request an increase in your file system's Metadata IOPS
      # and/or switch your file system's metadata configuration mode. For more information, see Managing
      # metadata performance in the Amazon FSx for Lustre User Guide .
      struct UpdateFileSystemLustreMetadataConfiguration
        include JSON::Serializable

        # (USER_PROVISIONED mode only) Specifies the number of Metadata IOPS to provision for your file
        # system. For SSD file systems, valid values are 1500 , 3000 , 6000 , 12000 , and multiples of 12000
        # up to a maximum of 192000 . For Intelligent-Tiering file systems, valid values are 6000 and 12000 .
        # The value you provide must be greater than or equal to the current number of Metadata IOPS
        # provisioned for the file system.
        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # The metadata configuration mode for provisioning Metadata IOPS for an FSx for Lustre file system
        # using a PERSISTENT_2 deployment type. To increase the Metadata IOPS or to switch an SSD file system
        # from AUTOMATIC, specify USER_PROVISIONED as the value for this parameter. Then use the Iops
        # parameter to provide a Metadata IOPS value that is greater than or equal to the current number of
        # Metadata IOPS provisioned for the file system. To switch from USER_PROVISIONED mode on an SSD file
        # system, specify AUTOMATIC as the value for this parameter, but do not input a value for Iops. If you
        # request to switch from USER_PROVISIONED to AUTOMATIC mode and the current Metadata IOPS value is
        # greater than the automated default, FSx for Lustre rejects the request because downscaling Metadata
        # IOPS is not supported. AUTOMATIC mode is not supported on Intelligent-Tiering file systems. For
        # Intelligent-Tiering file systems, use USER_PROVISIONED mode.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        def initialize(
          @iops : Int32? = nil,
          @mode : String? = nil
        )
        end
      end

      # The configuration updates for an Amazon FSx for NetApp ONTAP file system.
      struct UpdateFileSystemOntapConfiguration
        include JSON::Serializable

        # (Multi-AZ only) A list of IDs of new virtual private cloud (VPC) route tables to associate (add)
        # with your Amazon FSx for NetApp ONTAP file system.
        @[JSON::Field(key: "AddRouteTableIds")]
        getter add_route_table_ids : Array(String)?

        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # The SSD IOPS (input output operations per second) configuration for an Amazon FSx for NetApp ONTAP
        # file system. The default is 3 IOPS per GB of storage capacity, but you can provision additional IOPS
        # per GB of storage. The configuration consists of an IOPS mode ( AUTOMATIC or USER_PROVISIONED ), and
        # in the case of USER_PROVISIONED IOPS, the total number of SSD IOPS provisioned. For more
        # information, see File system storage capacity and IOPS .
        @[JSON::Field(key: "DiskIopsConfiguration")]
        getter disk_iops_configuration : Types::DiskIopsConfiguration?

        # (Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API and Amazon FSx console, Amazon FSx selects an
        # available /118 IP address range for you from one of the VPC's CIDR ranges. You can have overlapping
        # endpoint IP addresses for file systems deployed in the same VPC/route tables, as long as they don't
        # overlap with any subnet.
        @[JSON::Field(key: "EndpointIpv6AddressRange")]
        getter endpoint_ipv6_address_range : String?

        # Update the password for the fsxadmin user by entering a new password. You use the fsxadmin user to
        # access the NetApp ONTAP CLI and REST API to manage your file system resources. For more information,
        # see Managing resources using NetApp Application .
        @[JSON::Field(key: "FsxAdminPassword")]
        getter fsx_admin_password : String?

        # Use to update the number of high-availability (HA) pairs for a second-generation single-AZ file
        # system. If you increase the number of HA pairs for your file system, you must specify proportional
        # increases for StorageCapacity , Iops , and ThroughputCapacity . For more information, see
        # High-availability (HA) pairs in the FSx for ONTAP user guide. Block storage protocol support (iSCSI
        # and NVMe over TCP) is disabled on file systems with more than 6 HA pairs. For more information, see
        # Using block storage protocols .
        @[JSON::Field(key: "HAPairs")]
        getter ha_pairs : Int32?

        # (Multi-AZ only) A list of IDs of existing virtual private cloud (VPC) route tables to disassociate
        # (remove) from your Amazon FSx for NetApp ONTAP file system. You can use the API operation to
        # retrieve the list of VPC route table IDs for a file system.
        @[JSON::Field(key: "RemoveRouteTableIds")]
        getter remove_route_table_ids : Array(String)?

        # Enter a new value to change the amount of throughput capacity for the file system in megabytes per
        # second (MBps). For more information, see Managing throughput capacity in the FSx for ONTAP User
        # Guide. Amazon FSx responds with an HTTP status code 400 (Bad Request) for the following conditions:
        # The value of ThroughputCapacity and ThroughputCapacityPerHAPair are not the same value. The value of
        # ThroughputCapacity when divided by the value of HAPairs is outside of the valid range for
        # ThroughputCapacity .
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        # Use to choose the throughput capacity per HA pair, rather than the total throughput for the file
        # system. This field and ThroughputCapacity cannot be defined in the same API call, but one is
        # required. This field and ThroughputCapacity are the same for file systems with one HA pair. For
        # SINGLE_AZ_1 and MULTI_AZ_1 file systems, valid values are 128, 256, 512, 1024, 2048, or 4096 MBps.
        # For SINGLE_AZ_2 , valid values are 1536, 3072, or 6144 MBps. For MULTI_AZ_2 , valid values are 384,
        # 768, 1536, 3072, or 6144 MBps. Amazon FSx responds with an HTTP status code 400 (Bad Request) for
        # the following conditions: The value of ThroughputCapacity and ThroughputCapacityPerHAPair are not
        # the same value for file systems with one HA pair. The value of deployment type is SINGLE_AZ_2 and
        # ThroughputCapacity / ThroughputCapacityPerHAPair is not a valid HA pair (a value between 1 and 12).
        # The value of ThroughputCapacityPerHAPair is not a valid value.
        @[JSON::Field(key: "ThroughputCapacityPerHAPair")]
        getter throughput_capacity_per_ha_pair : Int32?

        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @add_route_table_ids : Array(String)? = nil,
          @automatic_backup_retention_days : Int32? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @disk_iops_configuration : Types::DiskIopsConfiguration? = nil,
          @endpoint_ipv6_address_range : String? = nil,
          @fsx_admin_password : String? = nil,
          @ha_pairs : Int32? = nil,
          @remove_route_table_ids : Array(String)? = nil,
          @throughput_capacity : Int32? = nil,
          @throughput_capacity_per_ha_pair : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # The configuration updates for an Amazon FSx for OpenZFS file system.
      struct UpdateFileSystemOpenZFSConfiguration
        include JSON::Serializable

        # (Multi-AZ only) A list of IDs of new virtual private cloud (VPC) route tables to associate (add)
        # with your Amazon FSx for OpenZFS file system.
        @[JSON::Field(key: "AddRouteTableIds")]
        getter add_route_table_ids : Array(String)?

        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        # A Boolean value indicating whether tags for the file system should be copied to backups. This value
        # defaults to false . If it's set to true , all tags for the file system are copied to all automatic
        # and user-initiated backups where the user doesn't specify tags. If this value is true and you
        # specify one or more tags, only the specified tags are copied to backups. If you specify one or more
        # tags when creating a user-initiated backup, no tags are copied from the file system, regardless of
        # this value.
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        # A Boolean value indicating whether tags for the volume should be copied to snapshots. This value
        # defaults to false . If it's set to true , all tags for the volume are copied to snapshots where the
        # user doesn't specify tags. If this value is true and you specify one or more tags, only the
        # specified tags are copied to snapshots. If you specify one or more tags when creating the snapshot,
        # no tags are copied from the volume, regardless of this value.
        @[JSON::Field(key: "CopyTagsToVolumes")]
        getter copy_tags_to_volumes : Bool?

        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        @[JSON::Field(key: "DiskIopsConfiguration")]
        getter disk_iops_configuration : Types::DiskIopsConfiguration?

        # (Multi-AZ only) Specifies the IPv6 address range in which the endpoints to access your file system
        # will be created. By default in the Amazon FSx API and Amazon FSx console, Amazon FSx selects an
        # available /118 IP address range for you from one of the VPC's CIDR ranges. You can have overlapping
        # endpoint IP addresses for file systems deployed in the same VPC/route tables, as long as they don't
        # overlap with any subnet.
        @[JSON::Field(key: "EndpointIpv6AddressRange")]
        getter endpoint_ipv6_address_range : String?

        # The configuration for the optional provisioned SSD read cache on file systems that use the
        # Intelligent-Tiering storage class.
        @[JSON::Field(key: "ReadCacheConfiguration")]
        getter read_cache_configuration : Types::OpenZFSReadCacheConfiguration?

        # (Multi-AZ only) A list of IDs of existing virtual private cloud (VPC) route tables to disassociate
        # (remove) from your Amazon FSx for OpenZFS file system. You can use the API operation to retrieve the
        # list of VPC route table IDs for a file system.
        @[JSON::Field(key: "RemoveRouteTableIds")]
        getter remove_route_table_ids : Array(String)?

        # The throughput of an Amazon FSx for OpenZFS file system, measured in megabytes per second&#x2028;
        # (MB/s). Valid values depend on the DeploymentType you choose, as follows: For MULTI_AZ_1 and
        # SINGLE_AZ_2 , valid values are 160, 320, 640, 1280, 2560, 3840, 5120, 7680, or 10240 MB/s. For
        # SINGLE_AZ_1 , valid values are 64, 128, 256, 512, 1024, 2048, 3072, or 4096 MB/s.
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @add_route_table_ids : Array(String)? = nil,
          @automatic_backup_retention_days : Int32? = nil,
          @copy_tags_to_backups : Bool? = nil,
          @copy_tags_to_volumes : Bool? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @disk_iops_configuration : Types::DiskIopsConfiguration? = nil,
          @endpoint_ipv6_address_range : String? = nil,
          @read_cache_configuration : Types::OpenZFSReadCacheConfiguration? = nil,
          @remove_route_table_ids : Array(String)? = nil,
          @throughput_capacity : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # The request object for the UpdateFileSystem operation.
      struct UpdateFileSystemRequest
        include JSON::Serializable

        # The ID of the file system that you are updating.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # A string of up to 63 ASCII characters that Amazon FSx uses to ensure idempotent updates. This string
        # is automatically filled on your behalf when you use the Command Line Interface (CLI) or an Amazon
        # Web Services SDK.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The Lustre version you are updating an FSx for Lustre file system to. Valid values are 2.12 and 2.15
        # . The value you choose must be newer than the file system's current Lustre version.
        @[JSON::Field(key: "FileSystemTypeVersion")]
        getter file_system_type_version : String?

        @[JSON::Field(key: "LustreConfiguration")]
        getter lustre_configuration : Types::UpdateFileSystemLustreConfiguration?

        # Changes the network type of an FSx for OpenZFS file system.
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::UpdateFileSystemOntapConfiguration?

        # The configuration updates for an FSx for OpenZFS file system.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::UpdateFileSystemOpenZFSConfiguration?

        # Use this parameter to increase the storage capacity of an FSx for Windows File Server, FSx for
        # Lustre, FSx for OpenZFS, or FSx for ONTAP file system. For second-generation FSx for ONTAP file
        # systems, you can also decrease the storage capacity. Specifies the storage capacity target value, in
        # GiB, for the file system that you're updating. You can't make a storage capacity increase request if
        # there is an existing storage capacity increase request in progress. For Lustre file systems, the
        # storage capacity target value can be the following: For SCRATCH_2 , PERSISTENT_1 , and PERSISTENT_2
        # SSD deployment types, valid values are in multiples of 2400 GiB. The value must be greater than the
        # current storage capacity. For PERSISTENT HDD file systems, valid values are multiples of 6000 GiB
        # for 12-MBps throughput per TiB file systems and multiples of 1800 GiB for 40-MBps throughput per TiB
        # file systems. The values must be greater than the current storage capacity. For SCRATCH_1 file
        # systems, you can't increase the storage capacity. For more information, see Managing storage and
        # throughput capacity in the FSx for Lustre User Guide . For FSx for OpenZFS file systems, the storage
        # capacity target value must be at least 10 percent greater than the current storage capacity value.
        # For more information, see Managing storage capacity in the FSx for OpenZFS User Guide . For Windows
        # file systems, the storage capacity target value must be at least 10 percent greater than the current
        # storage capacity value. To increase storage capacity, the file system must have at least 16 MBps of
        # throughput capacity. For more information, see Managing storage capacity in the Amazon FSxfor
        # Windows File Server User Guide . For ONTAP file systems, when increasing storage capacity, the
        # storage capacity target value must be at least 10 percent greater than the current storage capacity
        # value. When decreasing storage capacity on second-generation file systems, the target value must be
        # at least 9 percent smaller than the current SSD storage capacity. For more information, see File
        # system storage capacity and IOPS in the Amazon FSx for NetApp ONTAP User Guide.
        @[JSON::Field(key: "StorageCapacity")]
        getter storage_capacity : Int32?

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The configuration updates for an Amazon FSx for Windows File Server file system.
        @[JSON::Field(key: "WindowsConfiguration")]
        getter windows_configuration : Types::UpdateFileSystemWindowsConfiguration?

        def initialize(
          @file_system_id : String,
          @client_request_token : String? = nil,
          @file_system_type_version : String? = nil,
          @lustre_configuration : Types::UpdateFileSystemLustreConfiguration? = nil,
          @network_type : String? = nil,
          @ontap_configuration : Types::UpdateFileSystemOntapConfiguration? = nil,
          @open_zfs_configuration : Types::UpdateFileSystemOpenZFSConfiguration? = nil,
          @storage_capacity : Int32? = nil,
          @storage_type : String? = nil,
          @windows_configuration : Types::UpdateFileSystemWindowsConfiguration? = nil
        )
        end
      end

      # The response object for the UpdateFileSystem operation.
      struct UpdateFileSystemResponse
        include JSON::Serializable

        # A description of the file system that was updated.
        @[JSON::Field(key: "FileSystem")]
        getter file_system : Types::FileSystem?

        def initialize(
          @file_system : Types::FileSystem? = nil
        )
        end
      end

      # Updates the configuration for an existing Amazon FSx for Windows File Server file system. Amazon FSx
      # only overwrites existing properties with non-null values provided in the request.
      struct UpdateFileSystemWindowsConfiguration
        include JSON::Serializable

        # The configuration that Amazon FSx for Windows File Server uses to audit and log user accesses of
        # files, folders, and file shares on the Amazon FSx for Windows File Server file system..
        @[JSON::Field(key: "AuditLogConfiguration")]
        getter audit_log_configuration : Types::WindowsAuditLogCreateConfiguration?

        # The number of days to retain automatic backups. Setting this property to 0 disables automatic
        # backups. You can retain automatic backups for a maximum of 90 days. The default is 30 . For more
        # information, see Working with Automatic Daily Backups .
        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        # The preferred time to start the daily automatic backup, in the UTC time zone, for example, 02:00
        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # The SSD IOPS (input/output operations per second) configuration for an Amazon FSx for Windows file
        # system. By default, Amazon FSx automatically provisions 3 IOPS per GiB of storage capacity. You can
        # provision additional IOPS per GiB of storage, up to the maximum limit associated with your chosen
        # throughput capacity.
        @[JSON::Field(key: "DiskIopsConfiguration")]
        getter disk_iops_configuration : Types::DiskIopsConfiguration?

        # The File Server Resource Manager (FSRM) configuration that Amazon FSx for Windows File Server uses
        # for the file system. FSRM is disabled by default.
        @[JSON::Field(key: "FsrmConfiguration")]
        getter fsrm_configuration : Types::WindowsFsrmConfiguration?

        # The configuration Amazon FSx uses to join the Windows File Server instance to the self-managed
        # Microsoft AD directory. You cannot make a self-managed Microsoft AD update request if there is an
        # existing self-managed Microsoft AD update request in progress.
        @[JSON::Field(key: "SelfManagedActiveDirectoryConfiguration")]
        getter self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryConfigurationUpdates?

        # Sets the target value for a file system's throughput capacity, in MB/s, that you are updating the
        # file system to. Valid values are 8, 16, 32, 64, 128, 256, 512, 1024, 2048. You cannot make a
        # throughput capacity update request if there is an existing throughput capacity update request in
        # progress. For more information, see Managing Throughput Capacity .
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        # The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone.
        # Where d is the weekday number, from 1 through 7, with 1 = Monday and 7 = Sunday.
        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @audit_log_configuration : Types::WindowsAuditLogCreateConfiguration? = nil,
          @automatic_backup_retention_days : Int32? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @disk_iops_configuration : Types::DiskIopsConfiguration? = nil,
          @fsrm_configuration : Types::WindowsFsrmConfiguration? = nil,
          @self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryConfigurationUpdates? = nil,
          @throughput_capacity : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # Used to specify changes to the ONTAP configuration for the volume you are updating.
      struct UpdateOntapVolumeConfiguration
        include JSON::Serializable

        # A boolean flag indicating whether tags for the volume should be copied to backups. This value
        # defaults to false. If it's set to true, all tags for the volume are copied to all automatic and
        # user-initiated backups where the user doesn't specify tags. If this value is true, and you specify
        # one or more tags, only the specified tags are copied to backups. If you specify one or more tags
        # when creating a user-initiated backup, no tags are copied from the volume, regardless of this value.
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        # Specifies the location in the SVM's namespace where the volume is mounted. The JunctionPath must
        # have a leading forward slash, such as /vol3 .
        @[JSON::Field(key: "JunctionPath")]
        getter junction_path : String?

        # The security style for the volume, which can be UNIX , NTFS , or MIXED .
        @[JSON::Field(key: "SecurityStyle")]
        getter security_style : String?

        # The configured size of the volume, in bytes.
        @[JSON::Field(key: "SizeInBytes")]
        getter size_in_bytes : Int64?

        # Specifies the size of the volume in megabytes.
        @[JSON::Field(key: "SizeInMegabytes")]
        getter size_in_megabytes : Int32?

        # The configuration object for updating the SnapLock configuration of an FSx for ONTAP SnapLock
        # volume.
        @[JSON::Field(key: "SnaplockConfiguration")]
        getter snaplock_configuration : Types::UpdateSnaplockConfiguration?

        # Specifies the snapshot policy for the volume. There are three built-in snapshot policies: default :
        # This is the default policy. A maximum of six hourly snapshots taken five minutes past the hour. A
        # maximum of two daily snapshots taken Monday through Saturday at 10 minutes after midnight. A maximum
        # of two weekly snapshots taken every Sunday at 15 minutes after midnight. default-1weekly : This
        # policy is the same as the default policy except that it only retains one snapshot from the weekly
        # schedule. none : This policy does not take any snapshots. This policy can be assigned to volumes to
        # prevent automatic snapshots from being taken. You can also provide the name of a custom policy that
        # you created with the ONTAP CLI or REST API. For more information, see Snapshot policies in the
        # Amazon FSx for NetApp ONTAP User Guide .
        @[JSON::Field(key: "SnapshotPolicy")]
        getter snapshot_policy : String?

        # Default is false . Set to true to enable the deduplication, compression, and compaction storage
        # efficiency features on the volume.
        @[JSON::Field(key: "StorageEfficiencyEnabled")]
        getter storage_efficiency_enabled : Bool?

        # Update the volume's data tiering policy.
        @[JSON::Field(key: "TieringPolicy")]
        getter tiering_policy : Types::TieringPolicy?

        def initialize(
          @copy_tags_to_backups : Bool? = nil,
          @junction_path : String? = nil,
          @security_style : String? = nil,
          @size_in_bytes : Int64? = nil,
          @size_in_megabytes : Int32? = nil,
          @snaplock_configuration : Types::UpdateSnaplockConfiguration? = nil,
          @snapshot_policy : String? = nil,
          @storage_efficiency_enabled : Bool? = nil,
          @tiering_policy : Types::TieringPolicy? = nil
        )
        end
      end

      # Used to specify changes to the OpenZFS configuration for the volume that you are updating.
      struct UpdateOpenZFSVolumeConfiguration
        include JSON::Serializable

        # Specifies the method used to compress the data on the volume. The compression type is NONE by
        # default. NONE - Doesn't compress the data on the volume. NONE is the default. ZSTD - Compresses the
        # data in the volume using the Zstandard (ZSTD) compression algorithm. Compared to LZ4, Z-Standard
        # provides a better compression ratio to minimize on-disk storage utilization. LZ4 - Compresses the
        # data in the volume using the LZ4 compression algorithm. Compared to Z-Standard, LZ4 is less
        # compute-intensive and delivers higher write throughput speeds.
        @[JSON::Field(key: "DataCompressionType")]
        getter data_compression_type : String?

        # The configuration object for mounting a Network File System (NFS) file system.
        @[JSON::Field(key: "NfsExports")]
        getter nfs_exports : Array(Types::OpenZFSNfsExport)?

        # A Boolean value indicating whether the volume is read-only.
        @[JSON::Field(key: "ReadOnly")]
        getter read_only : Bool?

        # Specifies the record size of an OpenZFS volume, in kibibytes (KiB). Valid values are 4, 8, 16, 32,
        # 64, 128, 256, 512, or 1024 KiB. The default is 128 KiB. Most workloads should use the default record
        # size. Database workflows can benefit from a smaller record size, while streaming workflows can
        # benefit from a larger record size. For additional guidance on when to set a custom record size, see
        # Tips for maximizing performance in the Amazon FSx for OpenZFS User Guide .
        @[JSON::Field(key: "RecordSizeKiB")]
        getter record_size_ki_b : Int32?

        # The maximum amount of storage in gibibytes (GiB) that the volume can use from its parent. You can
        # specify a quota larger than the storage on the parent volume. You can specify a value of -1 to unset
        # a volume's storage capacity quota.
        @[JSON::Field(key: "StorageCapacityQuotaGiB")]
        getter storage_capacity_quota_gi_b : Int32?

        # The amount of storage in gibibytes (GiB) to reserve from the parent volume. You can't reserve more
        # storage than the parent volume has reserved. You can specify a value of -1 to unset a volume's
        # storage capacity reservation.
        @[JSON::Field(key: "StorageCapacityReservationGiB")]
        getter storage_capacity_reservation_gi_b : Int32?

        # An object specifying how much storage users or groups can use on the volume.
        @[JSON::Field(key: "UserAndGroupQuotas")]
        getter user_and_group_quotas : Array(Types::OpenZFSUserOrGroupQuota)?

        def initialize(
          @data_compression_type : String? = nil,
          @nfs_exports : Array(Types::OpenZFSNfsExport)? = nil,
          @read_only : Bool? = nil,
          @record_size_ki_b : Int32? = nil,
          @storage_capacity_quota_gi_b : Int32? = nil,
          @storage_capacity_reservation_gi_b : Int32? = nil,
          @user_and_group_quotas : Array(Types::OpenZFSUserOrGroupQuota)? = nil
        )
        end
      end

      struct UpdateSharedVpcConfigurationRequest
        include JSON::Serializable

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Specifies whether participant accounts can create FSx for ONTAP Multi-AZ file systems in shared
        # subnets. Set to true to enable or false to disable.
        @[JSON::Field(key: "EnableFsxRouteTableUpdatesFromParticipantAccounts")]
        getter enable_fsx_route_table_updates_from_participant_accounts : String?

        def initialize(
          @client_request_token : String? = nil,
          @enable_fsx_route_table_updates_from_participant_accounts : String? = nil
        )
        end
      end

      struct UpdateSharedVpcConfigurationResponse
        include JSON::Serializable

        # Indicates whether participant accounts can create FSx for ONTAP Multi-AZ file systems in shared
        # subnets.
        @[JSON::Field(key: "EnableFsxRouteTableUpdatesFromParticipantAccounts")]
        getter enable_fsx_route_table_updates_from_participant_accounts : String?

        def initialize(
          @enable_fsx_route_table_updates_from_participant_accounts : String? = nil
        )
        end
      end

      # Updates the SnapLock configuration for an existing FSx for ONTAP volume.
      struct UpdateSnaplockConfiguration
        include JSON::Serializable

        # Enables or disables the audit log volume for an FSx for ONTAP SnapLock volume. The default value is
        # false . If you set AuditLogVolume to true , the SnapLock volume is created as an audit log volume.
        # The minimum retention period for an audit log volume is six months. For more information, see
        # SnapLock audit log volumes .
        @[JSON::Field(key: "AuditLogVolume")]
        getter audit_log_volume : Bool?

        # The configuration object for setting the autocommit period of files in an FSx for ONTAP SnapLock
        # volume.
        @[JSON::Field(key: "AutocommitPeriod")]
        getter autocommit_period : Types::AutocommitPeriod?

        # Enables, disables, or permanently disables privileged delete on an FSx for ONTAP SnapLock Enterprise
        # volume. Enabling privileged delete allows SnapLock administrators to delete write once, read many
        # (WORM) files even if they have active retention periods. PERMANENTLY_DISABLED is a terminal state.
        # If privileged delete is permanently disabled on a SnapLock volume, you can't re-enable it. The
        # default value is DISABLED . For more information, see Privileged delete .
        @[JSON::Field(key: "PrivilegedDelete")]
        getter privileged_delete : String?

        # Specifies the retention period of an FSx for ONTAP SnapLock volume.
        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::SnaplockRetentionPeriod?

        # Enables or disables volume-append mode on an FSx for ONTAP SnapLock volume. Volume-append mode
        # allows you to create WORM-appendable files and write data to them incrementally. The default value
        # is false . For more information, see Volume-append mode .
        @[JSON::Field(key: "VolumeAppendModeEnabled")]
        getter volume_append_mode_enabled : Bool?

        def initialize(
          @audit_log_volume : Bool? = nil,
          @autocommit_period : Types::AutocommitPeriod? = nil,
          @privileged_delete : String? = nil,
          @retention_period : Types::SnaplockRetentionPeriod? = nil,
          @volume_append_mode_enabled : Bool? = nil
        )
        end
      end

      struct UpdateSnapshotRequest
        include JSON::Serializable

        # The name of the snapshot to update.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the snapshot that you want to update, in the format fsvolsnap-0123456789abcdef0 .
        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @name : String,
          @snapshot_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct UpdateSnapshotResponse
        include JSON::Serializable

        # Returned after a successful UpdateSnapshot operation, describing the snapshot that you updated.
        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct UpdateStorageVirtualMachineRequest
        include JSON::Serializable

        # The ID of the SVM that you want to update, in the format svm-0123456789abcdef0 .
        @[JSON::Field(key: "StorageVirtualMachineId")]
        getter storage_virtual_machine_id : String

        # Specifies updates to an SVM's Microsoft Active Directory (AD) configuration.
        @[JSON::Field(key: "ActiveDirectoryConfiguration")]
        getter active_directory_configuration : Types::UpdateSvmActiveDirectoryConfiguration?

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Specifies a new SvmAdminPassword.
        @[JSON::Field(key: "SvmAdminPassword")]
        getter svm_admin_password : String?

        def initialize(
          @storage_virtual_machine_id : String,
          @active_directory_configuration : Types::UpdateSvmActiveDirectoryConfiguration? = nil,
          @client_request_token : String? = nil,
          @svm_admin_password : String? = nil
        )
        end
      end

      struct UpdateStorageVirtualMachineResponse
        include JSON::Serializable

        @[JSON::Field(key: "StorageVirtualMachine")]
        getter storage_virtual_machine : Types::StorageVirtualMachine?

        def initialize(
          @storage_virtual_machine : Types::StorageVirtualMachine? = nil
        )
        end
      end

      # Specifies updates to an FSx for ONTAP storage virtual machine's (SVM) Microsoft Active Directory
      # (AD) configuration. Note that account credentials are not returned in the response payload.
      struct UpdateSvmActiveDirectoryConfiguration
        include JSON::Serializable

        # Specifies an updated NetBIOS name of the AD computer object NetBiosName to which an SVM is joined.
        @[JSON::Field(key: "NetBiosName")]
        getter net_bios_name : String?

        @[JSON::Field(key: "SelfManagedActiveDirectoryConfiguration")]
        getter self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryConfigurationUpdates?

        def initialize(
          @net_bios_name : String? = nil,
          @self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryConfigurationUpdates? = nil
        )
        end
      end

      struct UpdateVolumeRequest
        include JSON::Serializable

        # The ID of the volume that you want to update, in the format fsvol-0123456789abcdef0 .
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The name of the OpenZFS volume. OpenZFS root volumes are automatically named FSX . Child volume
        # names must be unique among their parent volume's children. The name of the volume is part of the
        # mount string for the OpenZFS volume.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The configuration of the ONTAP volume that you are updating.
        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::UpdateOntapVolumeConfiguration?

        # The configuration of the OpenZFS volume that you are updating.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::UpdateOpenZFSVolumeConfiguration?

        def initialize(
          @volume_id : String,
          @client_request_token : String? = nil,
          @name : String? = nil,
          @ontap_configuration : Types::UpdateOntapVolumeConfiguration? = nil,
          @open_zfs_configuration : Types::UpdateOpenZFSVolumeConfiguration? = nil
        )
        end
      end

      struct UpdateVolumeResponse
        include JSON::Serializable

        # A description of the volume just updated. Returned after a successful UpdateVolume API operation.
        @[JSON::Field(key: "Volume")]
        getter volume : Types::Volume?

        def initialize(
          @volume : Types::Volume? = nil
        )
        end
      end

      # Describes an Amazon FSx volume.
      struct Volume
        include JSON::Serializable

        # A list of administrative actions for the volume that are in process or waiting to be processed.
        # Administrative actions describe changes to the volume that you have initiated using the UpdateVolume
        # action.
        @[JSON::Field(key: "AdministrativeActions")]
        getter administrative_actions : Array(Types::AdministrativeAction)?

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # The lifecycle status of the volume. AVAILABLE - The volume is fully available for use. CREATED - The
        # volume has been created. CREATING - Amazon FSx is creating the new volume. DELETING - Amazon FSx is
        # deleting an existing volume. FAILED - Amazon FSx was unable to create the volume. MISCONFIGURED -
        # The volume is in a failed but recoverable state. PENDING - Amazon FSx hasn't started creating the
        # volume.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The reason why the volume lifecycle status changed.
        @[JSON::Field(key: "LifecycleTransitionReason")]
        getter lifecycle_transition_reason : Types::LifecycleTransitionReason?

        # The name of the volume.
        @[JSON::Field(key: "Name")]
        getter name : String?

        @[JSON::Field(key: "OntapConfiguration")]
        getter ontap_configuration : Types::OntapVolumeConfiguration?

        # The configuration of an Amazon FSx for OpenZFS volume.
        @[JSON::Field(key: "OpenZFSConfiguration")]
        getter open_zfs_configuration : Types::OpenZFSVolumeConfiguration?

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The system-generated, unique ID of the volume.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        # The type of the volume.
        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String?

        def initialize(
          @administrative_actions : Array(Types::AdministrativeAction)? = nil,
          @creation_time : Time? = nil,
          @file_system_id : String? = nil,
          @lifecycle : String? = nil,
          @lifecycle_transition_reason : Types::LifecycleTransitionReason? = nil,
          @name : String? = nil,
          @ontap_configuration : Types::OntapVolumeConfiguration? = nil,
          @open_zfs_configuration : Types::OpenZFSVolumeConfiguration? = nil,
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_id : String? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # A filter used to restrict the results of describe calls for Amazon FSx for NetApp ONTAP or Amazon
      # FSx for OpenZFS volumes. You can use multiple filters to return results that meet all applied filter
      # requirements.
      struct VolumeFilter
        include JSON::Serializable

        # The name for this filter.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The values of the filter. These are all the values for any of the applied filters.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # No Amazon FSx volumes were found based upon the supplied parameters.
      struct VolumeNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration that Amazon FSx for Windows File Server uses to audit and log user accesses of
      # files, folders, and file shares on the Amazon FSx for Windows File Server file system. For more
      # information, see File access auditing .
      struct WindowsAuditLogConfiguration
        include JSON::Serializable

        # Sets which attempt type is logged by Amazon FSx for file and folder accesses. SUCCESS_ONLY - only
        # successful attempts to access files or folders are logged. FAILURE_ONLY - only failed attempts to
        # access files or folders are logged. SUCCESS_AND_FAILURE - both successful attempts and failed
        # attempts to access files or folders are logged. DISABLED - access auditing of files and folders is
        # turned off.
        @[JSON::Field(key: "FileAccessAuditLogLevel")]
        getter file_access_audit_log_level : String

        # Sets which attempt type is logged by Amazon FSx for file share accesses. SUCCESS_ONLY - only
        # successful attempts to access file shares are logged. FAILURE_ONLY - only failed attempts to access
        # file shares are logged. SUCCESS_AND_FAILURE - both successful attempts and failed attempts to access
        # file shares are logged. DISABLED - access auditing of file shares is turned off.
        @[JSON::Field(key: "FileShareAccessAuditLogLevel")]
        getter file_share_access_audit_log_level : String

        # The Amazon Resource Name (ARN) for the destination of the audit logs. The destination can be any
        # Amazon CloudWatch Logs log group ARN or Amazon Kinesis Data Firehose delivery stream ARN. The name
        # of the Amazon CloudWatch Logs log group must begin with the /aws/fsx prefix. The name of the Amazon
        # Kinesis Data Firehose delivery stream must begin with the aws-fsx prefix. The destination ARN
        # (either CloudWatch Logs log group or Kinesis Data Firehose delivery stream) must be in the same
        # Amazon Web Services partition, Amazon Web Services Region, and Amazon Web Services account as your
        # Amazon FSx file system.
        @[JSON::Field(key: "AuditLogDestination")]
        getter audit_log_destination : String?

        def initialize(
          @file_access_audit_log_level : String,
          @file_share_access_audit_log_level : String,
          @audit_log_destination : String? = nil
        )
        end
      end

      # The Windows file access auditing configuration used when creating or updating an Amazon FSx for
      # Windows File Server file system.
      struct WindowsAuditLogCreateConfiguration
        include JSON::Serializable

        # Sets which attempt type is logged by Amazon FSx for file and folder accesses. SUCCESS_ONLY - only
        # successful attempts to access files or folders are logged. FAILURE_ONLY - only failed attempts to
        # access files or folders are logged. SUCCESS_AND_FAILURE - both successful attempts and failed
        # attempts to access files or folders are logged. DISABLED - access auditing of files and folders is
        # turned off.
        @[JSON::Field(key: "FileAccessAuditLogLevel")]
        getter file_access_audit_log_level : String

        # Sets which attempt type is logged by Amazon FSx for file share accesses. SUCCESS_ONLY - only
        # successful attempts to access file shares are logged. FAILURE_ONLY - only failed attempts to access
        # file shares are logged. SUCCESS_AND_FAILURE - both successful attempts and failed attempts to access
        # file shares are logged. DISABLED - access auditing of file shares is turned off.
        @[JSON::Field(key: "FileShareAccessAuditLogLevel")]
        getter file_share_access_audit_log_level : String

        # The Amazon Resource Name (ARN) that specifies the destination of the audit logs. The destination can
        # be any Amazon CloudWatch Logs log group ARN or Amazon Kinesis Data Firehose delivery stream ARN,
        # with the following requirements: The destination ARN that you provide (either CloudWatch Logs log
        # group or Kinesis Data Firehose delivery stream) must be in the same Amazon Web Services partition,
        # Amazon Web Services Region, and Amazon Web Services account as your Amazon FSx file system. The name
        # of the Amazon CloudWatch Logs log group must begin with the /aws/fsx prefix. The name of the Amazon
        # Kinesis Data Firehose delivery stream must begin with the aws-fsx prefix. If you do not provide a
        # destination in AuditLogDestination , Amazon FSx will create and use a log stream in the CloudWatch
        # Logs /aws/fsx/windows log group. If AuditLogDestination is provided and the resource does not exist,
        # the request will fail with a BadRequest error. If FileAccessAuditLogLevel and
        # FileShareAccessAuditLogLevel are both set to DISABLED , you cannot specify a destination in
        # AuditLogDestination .
        @[JSON::Field(key: "AuditLogDestination")]
        getter audit_log_destination : String?

        def initialize(
          @file_access_audit_log_level : String,
          @file_share_access_audit_log_level : String,
          @audit_log_destination : String? = nil
        )
        end
      end

      # The configuration for this Microsoft Windows file system.
      struct WindowsFileSystemConfiguration
        include JSON::Serializable

        # The ID for an existing Amazon Web Services Managed Microsoft Active Directory instance that the file
        # system is joined to.
        @[JSON::Field(key: "ActiveDirectoryId")]
        getter active_directory_id : String?

        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(Types::Alias)?

        # The configuration that Amazon FSx for Windows File Server uses to audit and log user accesses of
        # files, folders, and file shares on the Amazon FSx for Windows File Server file system.
        @[JSON::Field(key: "AuditLogConfiguration")]
        getter audit_log_configuration : Types::WindowsAuditLogConfiguration?

        # The number of days to retain automatic backups. Setting this to 0 disables automatic backups. You
        # can retain automatic backups for a maximum of 90 days.
        @[JSON::Field(key: "AutomaticBackupRetentionDays")]
        getter automatic_backup_retention_days : Int32?

        # A boolean flag indicating whether tags on the file system should be copied to backups. This value
        # defaults to false. If it's set to true, all tags on the file system are copied to all automatic
        # backups and any user-initiated backups where the user doesn't specify any tags. If this value is
        # true, and you specify one or more tags, only the specified tags are copied to backups. If you
        # specify one or more tags when creating a user-initiated backup, no tags are copied from the file
        # system, regardless of this value.
        @[JSON::Field(key: "CopyTagsToBackups")]
        getter copy_tags_to_backups : Bool?

        # The preferred time to take daily automatic backups, in the UTC time zone.
        @[JSON::Field(key: "DailyAutomaticBackupStartTime")]
        getter daily_automatic_backup_start_time : String?

        # Specifies the file system deployment type, valid values are the following: MULTI_AZ_1 - Specifies a
        # high availability file system that is configured for Multi-AZ redundancy to tolerate temporary
        # Availability Zone (AZ) unavailability, and supports SSD and HDD storage. SINGLE_AZ_1 - (Default)
        # Specifies a file system that is configured for single AZ redundancy, only supports SSD storage.
        # SINGLE_AZ_2 - Latest generation Single AZ file system. Specifies a file system that is configured
        # for single AZ redundancy and supports SSD and HDD storage. For more information, see Single-AZ and
        # Multi-AZ File Systems .
        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # The SSD IOPS (input/output operations per second) configuration for an Amazon FSx for Windows file
        # system. By default, Amazon FSx automatically provisions 3 IOPS per GiB of storage capacity. You can
        # provision additional IOPS per GiB of storage, up to the maximum limit associated with your chosen
        # throughput capacity.
        @[JSON::Field(key: "DiskIopsConfiguration")]
        getter disk_iops_configuration : Types::DiskIopsConfiguration?

        # The File Server Resource Manager (FSRM) configuration that Amazon FSx for Windows File Server uses
        # for the file system. FSRM is disabled by default.
        @[JSON::Field(key: "FsrmConfiguration")]
        getter fsrm_configuration : Types::WindowsFsrmConfiguration?

        # The list of maintenance operations in progress for this file system.
        @[JSON::Field(key: "MaintenanceOperationsInProgress")]
        getter maintenance_operations_in_progress : Array(String)?

        # For MULTI_AZ_1 deployment types, the IPv4 address of the primary, or preferred, file server. Use
        # this IP address when mounting the file system on Linux SMB clients or Windows SMB clients that are
        # not joined to a Microsoft Active Directory. Applicable for all Windows file system deployment types.
        # This IPv4 address is temporarily unavailable when the file system is undergoing maintenance. For
        # Linux and Windows SMB clients that are joined to an Active Directory, use the file system's DNSName
        # instead. For more information on mapping and mounting file shares, see Accessing data using file
        # shares .
        @[JSON::Field(key: "PreferredFileServerIp")]
        getter preferred_file_server_ip : String?

        # For MULTI_AZ_1 deployment types, the IPv6 address of the primary, or preferred, file server. Use
        # this IP address when mounting the file system on Linux SMB clients or Windows SMB clients that are
        # not joined to a Microsoft Active Directory. Applicable for all Windows file system deployment types.
        # This IPv6 address is temporarily unavailable when the file system is undergoing maintenance. For
        # Linux and Windows SMB clients that are joined to an Active Directory, use the file system's DNSName
        # instead.
        @[JSON::Field(key: "PreferredFileServerIpv6")]
        getter preferred_file_server_ipv6 : String?

        # For MULTI_AZ_1 deployment types, it specifies the ID of the subnet where the preferred file server
        # is located. Must be one of the two subnet IDs specified in SubnetIds property. Amazon FSx serves
        # traffic from this subnet except in the event of a failover to the secondary file server. For
        # SINGLE_AZ_1 and SINGLE_AZ_2 deployment types, this value is the same as that for SubnetIDs . For
        # more information, see Availability and durability: Single-AZ and Multi-AZ file systems .
        @[JSON::Field(key: "PreferredSubnetId")]
        getter preferred_subnet_id : String?

        # For MULTI_AZ_1 deployment types, use this endpoint when performing administrative tasks on the file
        # system using Amazon FSx Remote PowerShell. For SINGLE_AZ_1 and SINGLE_AZ_2 deployment types, this is
        # the DNS name of the file system. This endpoint is temporarily unavailable when the file system is
        # undergoing maintenance.
        @[JSON::Field(key: "RemoteAdministrationEndpoint")]
        getter remote_administration_endpoint : String?

        @[JSON::Field(key: "SelfManagedActiveDirectoryConfiguration")]
        getter self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryAttributes?

        # The throughput of the Amazon FSx file system, measured in megabytes per second.
        @[JSON::Field(key: "ThroughputCapacity")]
        getter throughput_capacity : Int32?

        # The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone. d is
        # the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.
        @[JSON::Field(key: "WeeklyMaintenanceStartTime")]
        getter weekly_maintenance_start_time : String?

        def initialize(
          @active_directory_id : String? = nil,
          @aliases : Array(Types::Alias)? = nil,
          @audit_log_configuration : Types::WindowsAuditLogConfiguration? = nil,
          @automatic_backup_retention_days : Int32? = nil,
          @copy_tags_to_backups : Bool? = nil,
          @daily_automatic_backup_start_time : String? = nil,
          @deployment_type : String? = nil,
          @disk_iops_configuration : Types::DiskIopsConfiguration? = nil,
          @fsrm_configuration : Types::WindowsFsrmConfiguration? = nil,
          @maintenance_operations_in_progress : Array(String)? = nil,
          @preferred_file_server_ip : String? = nil,
          @preferred_file_server_ipv6 : String? = nil,
          @preferred_subnet_id : String? = nil,
          @remote_administration_endpoint : String? = nil,
          @self_managed_active_directory_configuration : Types::SelfManagedActiveDirectoryAttributes? = nil,
          @throughput_capacity : Int32? = nil,
          @weekly_maintenance_start_time : String? = nil
        )
        end
      end

      # The File Server Resource Manager (FSRM) configuration that Amazon FSx for Windows File Server uses
      # for the file system. When FSRM is enabled, you can manage and monitor storage quotas, file
      # screening, storage reports, and file classification.
      struct WindowsFsrmConfiguration
        include JSON::Serializable

        # Specifies whether FSRM is enabled or disabled on the file system. When TRUE , the FSRM service is
        # enabled and monitor file operations according to configured policies. When FALSE or omitted, FSRM is
        # disabled. The default value is FALSE .
        @[JSON::Field(key: "FsrmServiceEnabled")]
        getter fsrm_service_enabled : Bool

        # The Amazon Resource Name (ARN) for the destination of the FSRM event logs. The destination can be
        # any Amazon CloudWatch Logs log group ARN or Amazon Kinesis Data Firehose delivery stream ARN. The
        # name of the Amazon CloudWatch Logs log group must begin with the /aws/fsx prefix. The name of the
        # Amazon Kinesis Data Firehose delivery stream must begin with the aws-fsx prefix. The destination ARN
        # (either CloudWatch Logs log group or Kinesis Data Firehose delivery stream) must be in the same
        # Amazon Web Services partition, Amazon Web Services Region, and Amazon Web Services account as your
        # Amazon FSx file system.
        @[JSON::Field(key: "EventLogDestination")]
        getter event_log_destination : String?

        def initialize(
          @fsrm_service_enabled : Bool,
          @event_log_destination : String? = nil
        )
        end
      end
    end
  end
end
