require "json"
require "time"

module Aws
  module EFS
    module Types

      # Returned if the access point that you are trying to create already exists, with the creation token
      # you provided in the request.

      struct AccessPointAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "AccessPointId")]
        getter access_point_id : String


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @access_point_id : String,
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Provides a description of an EFS file system access point.

      struct AccessPointDescription
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) associated with the access point.

        @[JSON::Field(key: "AccessPointArn")]
        getter access_point_arn : String?

        # The ID of the access point, assigned by Amazon EFS.

        @[JSON::Field(key: "AccessPointId")]
        getter access_point_id : String?

        # The opaque string specified in the request to ensure idempotent creation.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The ID of the EFS file system that the access point applies to.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # Identifies the lifecycle phase of the access point.

        @[JSON::Field(key: "LifeCycleState")]
        getter life_cycle_state : String?

        # The name of the access point. This is the value of the Name tag.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Identifies the Amazon Web Services account that owns the access point resource.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The full POSIX identity, including the user ID, group ID, and secondary group IDs on the access
        # point that is used for all file operations by NFS clients using the access point.

        @[JSON::Field(key: "PosixUser")]
        getter posix_user : Types::PosixUser?

        # The directory on the EFS file system that the access point exposes as the root directory to NFS
        # clients using the access point.

        @[JSON::Field(key: "RootDirectory")]
        getter root_directory : Types::RootDirectory?

        # The tags associated with the access point, presented as an array of Tag objects.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @access_point_arn : String? = nil,
          @access_point_id : String? = nil,
          @client_token : String? = nil,
          @file_system_id : String? = nil,
          @life_cycle_state : String? = nil,
          @name : String? = nil,
          @owner_id : String? = nil,
          @posix_user : Types::PosixUser? = nil,
          @root_directory : Types::RootDirectory? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Returned if the Amazon Web Services account has already created the maximum number of access points
      # allowed per file system. For more informaton, see
      # https://docs.aws.amazon.com/efs/latest/ug/limits.html#limits-efs-resources-per-account-per-region .

      struct AccessPointLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if the specified AccessPointId value doesn't exist in the requester's Amazon Web Services
      # account.

      struct AccessPointNotFound
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if the Availability Zone that was specified for a mount target is different from the
      # Availability Zone that was specified for One Zone storage. For more information, see Regional and
      # One Zone storage redundancy .

      struct AvailabilityZonesMismatch
        include JSON::Serializable


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

      # The backup policy for the file system used to create automatic daily backups. If status has a value
      # of ENABLED , the file system is being automatically backed up. For more information, see Automatic
      # backups .

      struct BackupPolicy
        include JSON::Serializable

        # Describes the status of the file system's backup policy. ENABLED – EFS is automatically backing up
        # the file system. ENABLING – EFS is turning on automatic backups for the file system. DISABLED –
        # Automatic back ups are turned off for the file system. DISABLING – EFS is turning off automatic
        # backups for the file system.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end


      struct BackupPolicyDescription
        include JSON::Serializable

        # Describes the file system's backup policy, indicating whether automatic backups are turned on or
        # off.

        @[JSON::Field(key: "BackupPolicy")]
        getter backup_policy : Types::BackupPolicy?

        def initialize(
          @backup_policy : Types::BackupPolicy? = nil
        )
        end
      end

      # Returned if the request is malformed or contains an error such as an invalid parameter value or a
      # missing required parameter.

      struct BadRequest
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if the source file system in a replication is encrypted but the destination file system is
      # unencrypted.

      struct ConflictException
        include JSON::Serializable


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


      struct CreateAccessPointRequest
        include JSON::Serializable

        # A string of up to 64 ASCII characters that Amazon EFS uses to ensure idempotent creation.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The ID of the EFS file system that the access point provides access to.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # The operating system user and group applied to all file system requests made using the access point.

        @[JSON::Field(key: "PosixUser")]
        getter posix_user : Types::PosixUser?

        # Specifies the directory on the EFS file system that the access point exposes as the root directory
        # of your file system to NFS clients using the access point. The clients using the access point can
        # only access the root directory and below. If the RootDirectory &gt; Path specified does not exist,
        # Amazon EFS creates it and applies the CreationInfo settings when a client connects to an access
        # point. When specifying a RootDirectory , you must provide the Path , and the CreationInfo . Amazon
        # EFS creates a root directory only if you have provided the CreationInfo: OwnUid, OwnGID, and
        # permissions for the directory. If you do not provide this information, Amazon EFS does not create
        # the root directory. If the root directory does not exist, attempts to mount using the access point
        # will fail.

        @[JSON::Field(key: "RootDirectory")]
        getter root_directory : Types::RootDirectory?

        # Creates tags associated with the access point. Each tag is a key-value pair, each key must be
        # unique. For more information, see Tagging Amazon Web Services resources in the Amazon Web Services
        # General Reference Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @file_system_id : String,
          @posix_user : Types::PosixUser? = nil,
          @root_directory : Types::RootDirectory? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateFileSystemRequest
        include JSON::Serializable

        # A string of up to 64 ASCII characters. Amazon EFS uses this to ensure idempotent creation.

        @[JSON::Field(key: "CreationToken")]
        getter creation_token : String

        # For One Zone file systems, specify the Amazon Web Services Availability Zone in which to create the
        # file system. Use the format us-east-1a to specify the Availability Zone. For more information about
        # One Zone file systems, see EFS file system types in the Amazon EFS User Guide . One Zone file
        # systems are not available in all Availability Zones in Amazon Web Services Regions where Amazon EFS
        # is available.

        @[JSON::Field(key: "AvailabilityZoneName")]
        getter availability_zone_name : String?

        # Specifies whether automatic backups are enabled on the file system that you are creating. Set the
        # value to true to enable automatic backups. If you are creating a One Zone file system, automatic
        # backups are enabled by default. For more information, see Automatic backups in the Amazon EFS User
        # Guide . Default is false . However, if you specify an AvailabilityZoneName , the default is true .
        # Backup is not available in all Amazon Web Services Regions where Amazon EFS is available.

        @[JSON::Field(key: "Backup")]
        getter backup : Bool?

        # A Boolean value that, if true, creates an encrypted file system. When creating an encrypted file
        # system, you have the option of specifying an existing Key Management Service key (KMS key). If you
        # don't specify a KMS key, then the default KMS key for Amazon EFS, /aws/elasticfilesystem , is used
        # to protect the encrypted file system.

        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # The ID of the KMS key that you want to use to protect the encrypted file system. This parameter is
        # required only if you want to use a non-default KMS key. If this parameter is not specified, the
        # default KMS key for Amazon EFS is used. You can specify a KMS key ID using the following formats:
        # Key ID - A unique identifier of the key, for example 1234abcd-12ab-34cd-56ef-1234567890ab . ARN - An
        # Amazon Resource Name (ARN) for the key, for example
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab . Key alias - A
        # previously created display name for a key, for example alias/projectKey1 . Key alias ARN - An ARN
        # for a key alias, for example arn:aws:kms:us-west-2:444455556666:alias/projectKey1 . If you use
        # KmsKeyId , you must set the CreateFileSystemRequest$Encrypted parameter to true. EFS accepts only
        # symmetric KMS keys. You cannot use asymmetric KMS keys with Amazon EFS file systems.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The performance mode of the file system. We recommend generalPurpose performance mode for all file
        # systems. File systems using the maxIO performance mode can scale to higher levels of aggregate
        # throughput and operations per second with a tradeoff of slightly higher latencies for most file
        # operations. The performance mode can't be changed after the file system has been created. The maxIO
        # mode is not supported on One Zone file systems. Due to the higher per-operation latencies with Max
        # I/O, we recommend using General Purpose performance mode for all file systems. Default is
        # generalPurpose .

        @[JSON::Field(key: "PerformanceMode")]
        getter performance_mode : String?

        # The throughput, measured in mebibytes per second (MiBps), that you want to provision for a file
        # system that you're creating. Required if ThroughputMode is set to provisioned . Valid values are
        # 1-3414 MiBps, with the upper limit depending on Region. To increase this limit, contact Amazon Web
        # ServicesSupport. For more information, see Amazon EFS quotas that you can increase in the Amazon EFS
        # User Guide .

        @[JSON::Field(key: "ProvisionedThroughputInMibps")]
        getter provisioned_throughput_in_mibps : Float64?

        # Use to create one or more tags associated with the file system. Each tag is a user-defined key-value
        # pair. Name your file system on creation by including a "Key":"Name","Value":"{value}" key-value
        # pair. Each key must be unique. For more information, see Tagging Amazon Web Services resources in
        # the Amazon Web Services General Reference Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the throughput mode for the file system. The mode can be bursting , provisioned , or
        # elastic . If you set ThroughputMode to provisioned , you must also set a value for
        # ProvisionedThroughputInMibps . After you create the file system, you can decrease your file system's
        # Provisioned throughput or change between the throughput modes, with certain time restrictions. For
        # more information, see Specifying throughput with provisioned mode in the Amazon EFS User Guide .
        # Default is bursting .

        @[JSON::Field(key: "ThroughputMode")]
        getter throughput_mode : String?

        def initialize(
          @creation_token : String,
          @availability_zone_name : String? = nil,
          @backup : Bool? = nil,
          @encrypted : Bool? = nil,
          @kms_key_id : String? = nil,
          @performance_mode : String? = nil,
          @provisioned_throughput_in_mibps : Float64? = nil,
          @tags : Array(Types::Tag)? = nil,
          @throughput_mode : String? = nil
        )
        end
      end


      struct CreateMountTargetRequest
        include JSON::Serializable

        # The ID of the file system for which to create the mount target.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # The ID of the subnet to add the mount target in. For One Zone file systems, use the subnet that is
        # associated with the file system's Availability Zone.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String

        # If the IP address type for the mount target is IPv4, then specify the IPv4 address within the
        # address range of the specified subnet.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # Specify the type of IP address of the mount target you are creating. Options are IPv4, dual stack,
        # or IPv6. If you don’t specify an IpAddressType, then IPv4 is used. IPV4_ONLY – Create mount target
        # with IPv4 only subnet or dual-stack subnet. DUAL_STACK – Create mount target with dual-stack subnet.
        # IPV6_ONLY – Create mount target with IPv6 only subnet. Creating IPv6 mount target only ENI in
        # dual-stack subnet is not supported.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # If the IP address type for the mount target is IPv6, then specify the IPv6 address within the
        # address range of the specified subnet.

        @[JSON::Field(key: "Ipv6Address")]
        getter ipv6_address : String?

        # VPC security group IDs, of the form sg-xxxxxxxx . These must be for the same VPC as the subnet
        # specified. The maximum number of security groups depends on account quota. For more information, see
        # Amazon VPC Quotas in the Amazon VPC User Guide (see the Security Groups table).

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @file_system_id : String,
          @subnet_id : String,
          @ip_address : String? = nil,
          @ip_address_type : String? = nil,
          @ipv6_address : String? = nil,
          @security_groups : Array(String)? = nil
        )
        end
      end


      struct CreateReplicationConfigurationRequest
        include JSON::Serializable

        # An array of destination configuration objects. Only one destination configuration object is
        # supported.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::DestinationToCreate)

        # Specifies the Amazon EFS file system that you want to replicate. This file system cannot already be
        # a source or destination file system in another replication configuration.

        @[JSON::Field(key: "SourceFileSystemId")]
        getter source_file_system_id : String

        def initialize(
          @destinations : Array(Types::DestinationToCreate),
          @source_file_system_id : String
        )
        end
      end


      struct CreateTagsRequest
        include JSON::Serializable

        # The ID of the file system whose tags you want to modify (String). This operation modifies the tags
        # only, not the file system.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # An array of Tag objects to add. Each Tag object is a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @file_system_id : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Required if the RootDirectory &gt; Path specified does not exist. Specifies the POSIX IDs and
      # permissions to apply to the access point's RootDirectory &gt; Path . If the access point root
      # directory does not exist, EFS creates it with these settings when a client connects to the access
      # point. When specifying CreationInfo , you must include values for all properties. Amazon EFS creates
      # a root directory only if you have provided the CreationInfo: OwnUid, OwnGID, and permissions for the
      # directory. If you do not provide this information, Amazon EFS does not create the root directory. If
      # the root directory does not exist, attempts to mount using the access point will fail. If you do not
      # provide CreationInfo and the specified RootDirectory does not exist, attempts to mount the file
      # system using the access point will fail.

      struct CreationInfo
        include JSON::Serializable

        # Specifies the POSIX group ID to apply to the RootDirectory . Accepts values from 0 to 2^32
        # (4294967295).

        @[JSON::Field(key: "OwnerGid")]
        getter owner_gid : Int64

        # Specifies the POSIX user ID to apply to the RootDirectory . Accepts values from 0 to 2^32
        # (4294967295).

        @[JSON::Field(key: "OwnerUid")]
        getter owner_uid : Int64

        # Specifies the POSIX permissions to apply to the RootDirectory , in the format of an octal number
        # representing the file's mode bits.

        @[JSON::Field(key: "Permissions")]
        getter permissions : String

        def initialize(
          @owner_gid : Int64,
          @owner_uid : Int64,
          @permissions : String
        )
        end
      end


      struct DeleteAccessPointRequest
        include JSON::Serializable

        # The ID of the access point that you want to delete.

        @[JSON::Field(key: "AccessPointId")]
        getter access_point_id : String

        def initialize(
          @access_point_id : String
        )
        end
      end


      struct DeleteFileSystemPolicyRequest
        include JSON::Serializable

        # Specifies the EFS file system for which to delete the FileSystemPolicy .

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        def initialize(
          @file_system_id : String
        )
        end
      end


      struct DeleteFileSystemRequest
        include JSON::Serializable

        # The ID of the file system you want to delete.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        def initialize(
          @file_system_id : String
        )
        end
      end


      struct DeleteMountTargetRequest
        include JSON::Serializable

        # The ID of the mount target to delete (String).

        @[JSON::Field(key: "MountTargetId")]
        getter mount_target_id : String

        def initialize(
          @mount_target_id : String
        )
        end
      end


      struct DeleteReplicationConfigurationRequest
        include JSON::Serializable

        # The ID of the source file system in the replication configuration.

        @[JSON::Field(key: "SourceFileSystemId")]
        getter source_file_system_id : String

        # When replicating across Amazon Web Services accounts or across Amazon Web Services Regions, Amazon
        # EFS deletes the replication configuration from both the source and destination account or Region (
        # ALL_CONFIGURATIONS ) by default. If there's a configuration or permissions issue that prevents
        # Amazon EFS from deleting the replication configuration from both sides, you can use the
        # LOCAL_CONFIGURATION_ONLY mode to delete the replication configuration from only the local side (the
        # account or Region from which the delete is performed). Only use the LOCAL_CONFIGURATION_ONLY mode in
        # the case that Amazon EFS is unable to delete the replication configuration in both the source and
        # destination account or Region. Deleting the local configuration leaves the configuration in the
        # other account or Region unrecoverable. Additionally, do not use this mode for same-account,
        # same-region replication as doing so results in a BadRequest exception error.

        @[JSON::Field(key: "deletionMode")]
        getter deletion_mode : String?

        def initialize(
          @source_file_system_id : String,
          @deletion_mode : String? = nil
        )
        end
      end


      struct DeleteTagsRequest
        include JSON::Serializable

        # The ID of the file system whose tags you want to delete (String).

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # A list of tag keys to delete.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @file_system_id : String,
          @tag_keys : Array(String)
        )
        end
      end

      # The service timed out trying to fulfill the request, and the client should try the call again.

      struct DependencyTimeout
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end


      struct DescribeAccessPointsRequest
        include JSON::Serializable

        # (Optional) Specifies an EFS access point to describe in the response; mutually exclusive with
        # FileSystemId .

        @[JSON::Field(key: "AccessPointId")]
        getter access_point_id : String?

        # (Optional) If you provide a FileSystemId , EFS returns all access points for that file system;
        # mutually exclusive with AccessPointId .

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # (Optional) When retrieving all access points for a file system, you can optionally specify the
        # MaxItems parameter to limit the number of objects returned in a response. The default value is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # NextToken is present if the response is paginated. You can use NextMarker in the subsequent request
        # to fetch the next page of access point descriptions.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_point_id : String? = nil,
          @file_system_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAccessPointsResponse
        include JSON::Serializable

        # An array of access point descriptions.

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::AccessPointDescription)?

        # Present if there are more access points than returned in the response. You can use the NextMarker in
        # the subsequent request to fetch the additional descriptions.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_points : Array(Types::AccessPointDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAccountPreferencesRequest
        include JSON::Serializable

        # (Optional) When retrieving account preferences, you can optionally specify the MaxItems parameter to
        # limit the number of objects returned in a response. The default value is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # (Optional) You can use NextToken in a subsequent request to fetch the next page of Amazon Web
        # Services account preferences if the response payload was paginated.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAccountPreferencesResponse
        include JSON::Serializable

        # Present if there are more records than returned in the response. You can use the NextToken in the
        # subsequent request to fetch the additional descriptions.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Describes the resource ID preference setting for the Amazon Web Services account associated with the
        # user making the request, in the current Amazon Web Services Region.

        @[JSON::Field(key: "ResourceIdPreference")]
        getter resource_id_preference : Types::ResourceIdPreference?

        def initialize(
          @next_token : String? = nil,
          @resource_id_preference : Types::ResourceIdPreference? = nil
        )
        end
      end


      struct DescribeBackupPolicyRequest
        include JSON::Serializable

        # Specifies which EFS file system for which to retrieve the BackupPolicy .

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        def initialize(
          @file_system_id : String
        )
        end
      end


      struct DescribeFileSystemPolicyRequest
        include JSON::Serializable

        # Specifies which EFS file system to retrieve the FileSystemPolicy for.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        def initialize(
          @file_system_id : String
        )
        end
      end


      struct DescribeFileSystemsRequest
        include JSON::Serializable

        # (Optional) Restricts the list to the file system with this creation token (String). You specify a
        # creation token when you create an Amazon EFS file system.

        @[JSON::Field(key: "CreationToken")]
        getter creation_token : String?

        # (Optional) ID of the file system whose description you want to retrieve (String).

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # (Optional) Opaque pagination token returned from a previous DescribeFileSystems operation (String).
        # If present, specifies to continue the list from where the returning call had left off.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # (Optional) Specifies the maximum number of file systems to return in the response (integer). This
        # number is automatically set to 100. The response is paginated at 100 per page if you have more than
        # 100 file systems.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @creation_token : String? = nil,
          @file_system_id : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct DescribeFileSystemsResponse
        include JSON::Serializable

        # An array of file system descriptions.

        @[JSON::Field(key: "FileSystems")]
        getter file_systems : Array(Types::FileSystemDescription)?

        # Present if provided by caller in the request (String).

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Present if there are more file systems than returned in the response (String). You can use the
        # NextMarker in the subsequent request to fetch the descriptions.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @file_systems : Array(Types::FileSystemDescription)? = nil,
          @marker : String? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct DescribeLifecycleConfigurationRequest
        include JSON::Serializable

        # The ID of the file system whose LifecycleConfiguration object you want to retrieve (String).

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        def initialize(
          @file_system_id : String
        )
        end
      end


      struct DescribeMountTargetSecurityGroupsRequest
        include JSON::Serializable

        # The ID of the mount target whose security groups you want to retrieve.

        @[JSON::Field(key: "MountTargetId")]
        getter mount_target_id : String

        def initialize(
          @mount_target_id : String
        )
        end
      end


      struct DescribeMountTargetSecurityGroupsResponse
        include JSON::Serializable

        # An array of security groups.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)

        def initialize(
          @security_groups : Array(String)
        )
        end
      end


      struct DescribeMountTargetsRequest
        include JSON::Serializable

        # (Optional) The ID of the access point whose mount targets that you want to list. It must be included
        # in your request if a FileSystemId or MountTargetId is not included in your request. Accepts either
        # an access point ID or ARN as input.

        @[JSON::Field(key: "AccessPointId")]
        getter access_point_id : String?

        # (Optional) ID of the file system whose mount targets you want to list (String). It must be included
        # in your request if an AccessPointId or MountTargetId is not included. Accepts either a file system
        # ID or ARN as input.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # (Optional) Opaque pagination token returned from a previous DescribeMountTargets operation (String).
        # If present, it specifies to continue the list from where the previous returning call left off.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # (Optional) Maximum number of mount targets to return in the response. Currently, this number is
        # automatically set to 10, and other values are ignored. The response is paginated at 100 per page if
        # you have more than 100 mount targets.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # (Optional) ID of the mount target that you want to have described (String). It must be included in
        # your request if FileSystemId is not included. Accepts either a mount target ID or ARN as input.

        @[JSON::Field(key: "MountTargetId")]
        getter mount_target_id : String?

        def initialize(
          @access_point_id : String? = nil,
          @file_system_id : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @mount_target_id : String? = nil
        )
        end
      end


      struct DescribeMountTargetsResponse
        include JSON::Serializable

        # If the request included the Marker , the response returns that value in this field.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Returns the file system's mount targets as an array of MountTargetDescription objects.

        @[JSON::Field(key: "MountTargets")]
        getter mount_targets : Array(Types::MountTargetDescription)?

        # If a value is present, there are more mount targets to return. In a subsequent request, you can
        # provide Marker in your request with this value to retrieve the next set of mount targets.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @marker : String? = nil,
          @mount_targets : Array(Types::MountTargetDescription)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct DescribeReplicationConfigurationsRequest
        include JSON::Serializable

        # You can retrieve the replication configuration for a specific file system by providing its file
        # system ID. For cross-account,cross-region replication, an account can only describe the replication
        # configuration for a file system in its own Region.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # (Optional) To limit the number of objects returned in a response, you can specify the MaxItems
        # parameter. The default value is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # NextToken is present if the response is paginated. You can use NextToken in a subsequent request to
        # fetch the next page of output.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @file_system_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeReplicationConfigurationsResponse
        include JSON::Serializable

        # You can use the NextToken from the previous response in a subsequent request to fetch the additional
        # descriptions.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The collection of replication configurations that is returned.

        @[JSON::Field(key: "Replications")]
        getter replications : Array(Types::ReplicationConfigurationDescription)?

        def initialize(
          @next_token : String? = nil,
          @replications : Array(Types::ReplicationConfigurationDescription)? = nil
        )
        end
      end


      struct DescribeTagsRequest
        include JSON::Serializable

        # The ID of the file system whose tag set you want to retrieve.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # (Optional) An opaque pagination token returned from a previous DescribeTags operation (String). If
        # present, it specifies to continue the list from where the previous call left off.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # (Optional) The maximum number of file system tags to return in the response. Currently, this number
        # is automatically set to 100, and other values are ignored. The response is paginated at 100 per page
        # if you have more than 100 tags.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @file_system_id : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct DescribeTagsResponse
        include JSON::Serializable

        # Returns tags associated with the file system as an array of Tag objects.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # If the request included a Marker , the response returns that value in this field.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # If a value is present, there are more tags to return. In a subsequent request, you can provide the
        # value of NextMarker as the value of the Marker parameter in your next request to retrieve the next
        # set of tags.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @tags : Array(Types::Tag),
          @marker : String? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # Describes the destination file system in the replication configuration.

      struct Destination
        include JSON::Serializable

        # The ID of the destination Amazon EFS file system.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # The Amazon Web Services Region in which the destination file system is located.

        @[JSON::Field(key: "Region")]
        getter region : String

        # Describes the status of the replication configuration. For more information about replication
        # status, see Viewing replication details in the Amazon EFS User Guide .

        @[JSON::Field(key: "Status")]
        getter status : String

        # The time when the most recent sync was successfully completed on the destination file system. Any
        # changes to data on the source file system that occurred before this time have been successfully
        # replicated to the destination file system. Any changes that occurred after this time might not be
        # fully replicated.

        @[JSON::Field(key: "LastReplicatedTimestamp")]
        getter last_replicated_timestamp : Time?

        # ID of the Amazon Web Services account in which the destination file system resides.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # Amazon Resource Name (ARN) of the IAM role in the source account that allows Amazon EFS to perform
        # replication on its behalf. This is optional for same-account replication and required for
        # cross-account replication.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Message that provides details about the PAUSED or ERRROR state of the replication destination
        # configuration. For more information about replication status messages, see Viewing replication
        # details in the Amazon EFS User Guide .

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @file_system_id : String,
          @region : String,
          @status : String,
          @last_replicated_timestamp : Time? = nil,
          @owner_id : String? = nil,
          @role_arn : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Describes the new or existing destination file system for the replication configuration. If you want
      # to replicate to a new file system, do not specify the File System ID for the destination file
      # system. Amazon EFS creates a new, empty file system. For One Zone storage, specify the Availability
      # Zone to create the file system in. To use an Key Management Service key other than the default KMS
      # key, then specify it. For more information, see Configuring replication to new Amazon EFS file
      # system in the Amazon EFS User Guide . After the file system is created, you cannot change the KMS
      # key or the performance mode. If you want to replicate to an existing file system that's in the same
      # account as the source file system, then you need to provide the ID or Amazon Resource Name (ARN) of
      # the file system to which to replicate. The file system's replication overwrite protection must be
      # disabled. For more information, see Replicating to an existing file system in the Amazon EFS User
      # Guide . If you are replicating the file system to a file system that's in a different account than
      # the source file system (cross-account replication), you need to provide the ARN for the file system
      # and the IAM role that allows Amazon EFS to perform replication on the destination account. The file
      # system's replication overwrite protection must be disabled. For more information, see Replicating
      # across Amazon Web Services accounts in the Amazon EFS User Guide .

      struct DestinationToCreate
        include JSON::Serializable

        # To create a file system that uses One Zone storage, specify the name of the Availability Zone in
        # which to create the destination file system.

        @[JSON::Field(key: "AvailabilityZoneName")]
        getter availability_zone_name : String?

        # The ID or ARN of the file system to use for the destination. For cross-account replication, this
        # must be an ARN. The file system's replication overwrite replication must be disabled. If no ID or
        # ARN is specified, then a new file system is created. When you initially configure replication to an
        # existing file system, Amazon EFS writes data to or removes existing data from the destination file
        # system to match data in the source file system. If you don't want to change data in the destination
        # file system, then you should replicate to a new file system instead. For more information, see
        # https://docs.aws.amazon.com/efs/latest/ug/create-replication.html .

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # Specify the Key Management Service (KMS) key that you want to use to encrypt the destination file
        # system. If you do not specify a KMS key, Amazon EFS uses your default KMS key for Amazon EFS,
        # /aws/elasticfilesystem . This ID can be in one of the following formats: Key ID - The unique
        # identifier of the key, for example 1234abcd-12ab-34cd-56ef-1234567890ab . ARN - The ARN for the key,
        # for example arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab . Key alias
        # - A previously created display name for a key, for example alias/projectKey1 . Key alias ARN - The
        # ARN for a key alias, for example arn:aws:kms:us-west-2:444455556666:alias/projectKey1 .

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # To create a file system that uses Regional storage, specify the Amazon Web Services Region in which
        # to create the destination file system. The Region must be enabled for the Amazon Web Services
        # account that owns the source file system. For more information, see Managing Amazon Web Services
        # Regions in the Amazon Web Services General Reference Reference Guide .

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Amazon Resource Name (ARN) of the IAM role in the source account that allows Amazon EFS to perform
        # replication on its behalf. This is optional for same-account replication and required for
        # cross-account replication.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @availability_zone_name : String? = nil,
          @file_system_id : String? = nil,
          @kms_key_id : String? = nil,
          @region : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Returned if the file system you are trying to create already exists, with the creation token you
      # provided.

      struct FileSystemAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @file_system_id : String,
          @message : String? = nil
        )
        end
      end

      # A description of the file system.

      struct FileSystemDescription
        include JSON::Serializable

        # The time that the file system was created, in seconds (since 1970-01-01T00:00:00Z).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The opaque string specified in the request.

        @[JSON::Field(key: "CreationToken")]
        getter creation_token : String

        # The ID of the file system, assigned by Amazon EFS.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # The lifecycle phase of the file system.

        @[JSON::Field(key: "LifeCycleState")]
        getter life_cycle_state : String

        # The current number of mount targets that the file system has. For more information, see
        # CreateMountTarget .

        @[JSON::Field(key: "NumberOfMountTargets")]
        getter number_of_mount_targets : Int32

        # The Amazon Web Services account that created the file system.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String

        # The performance mode of the file system.

        @[JSON::Field(key: "PerformanceMode")]
        getter performance_mode : String

        # The latest known metered size (in bytes) of data stored in the file system, in its Value field, and
        # the time at which that size was determined in its Timestamp field. The Timestamp value is the
        # integer number of seconds since 1970-01-01T00:00:00Z. The SizeInBytes value doesn't represent the
        # size of a consistent snapshot of the file system, but it is eventually consistent when there are no
        # writes to the file system. That is, SizeInBytes represents actual size only if the file system is
        # not modified for a period longer than a couple of hours. Otherwise, the value is not the exact size
        # that the file system was at any point in time.

        @[JSON::Field(key: "SizeInBytes")]
        getter size_in_bytes : Types::FileSystemSize

        # The tags associated with the file system, presented as an array of Tag objects.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # The unique and consistent identifier of the Availability Zone in which the file system is located,
        # and is valid only for One Zone file systems. For example, use1-az1 is an Availability Zone ID for
        # the us-east-1 Amazon Web Services Region, and it has the same location in every Amazon Web Services
        # account.

        @[JSON::Field(key: "AvailabilityZoneId")]
        getter availability_zone_id : String?

        # Describes the Amazon Web Services Availability Zone in which the file system is located, and is
        # valid only for One Zone file systems. For more information, see Using EFS storage classes in the
        # Amazon EFS User Guide .

        @[JSON::Field(key: "AvailabilityZoneName")]
        getter availability_zone_name : String?

        # A Boolean value that, if true, indicates that the file system is encrypted.

        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # The Amazon Resource Name (ARN) for the EFS file system, in the format arn:aws:elasticfilesystem:
        # region : account-id :file-system/ file-system-id . Example with sample data:
        # arn:aws:elasticfilesystem:us-west-2:1111333322228888:file-system/fs-01234567

        @[JSON::Field(key: "FileSystemArn")]
        getter file_system_arn : String?

        # Describes the protection on the file system.

        @[JSON::Field(key: "FileSystemProtection")]
        getter file_system_protection : Types::FileSystemProtectionDescription?

        # The ID of an KMS key used to protect the encrypted file system.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # You can add tags to a file system, including a Name tag. For more information, see CreateFileSystem
        # . If the file system has a Name tag, Amazon EFS returns the value in this field.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The amount of provisioned throughput, measured in MiBps, for the file system. Valid for file systems
        # using ThroughputMode set to provisioned .

        @[JSON::Field(key: "ProvisionedThroughputInMibps")]
        getter provisioned_throughput_in_mibps : Float64?

        # Displays the file system's throughput mode. For more information, see Throughput modes in the Amazon
        # EFS User Guide .

        @[JSON::Field(key: "ThroughputMode")]
        getter throughput_mode : String?

        def initialize(
          @creation_time : Time,
          @creation_token : String,
          @file_system_id : String,
          @life_cycle_state : String,
          @number_of_mount_targets : Int32,
          @owner_id : String,
          @performance_mode : String,
          @size_in_bytes : Types::FileSystemSize,
          @tags : Array(Types::Tag),
          @availability_zone_id : String? = nil,
          @availability_zone_name : String? = nil,
          @encrypted : Bool? = nil,
          @file_system_arn : String? = nil,
          @file_system_protection : Types::FileSystemProtectionDescription? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @provisioned_throughput_in_mibps : Float64? = nil,
          @throughput_mode : String? = nil
        )
        end
      end

      # Returned if a file system has mount targets.

      struct FileSystemInUse
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if the Amazon Web Services account has already created the maximum number of file systems
      # allowed per account.

      struct FileSystemLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if the specified FileSystemId value doesn't exist in the requester's Amazon Web Services
      # account.

      struct FileSystemNotFound
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end


      struct FileSystemPolicyDescription
        include JSON::Serializable

        # Specifies the EFS file system to which the FileSystemPolicy applies.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # The JSON formatted FileSystemPolicy for the EFS file system.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @file_system_id : String? = nil,
          @policy : String? = nil
        )
        end
      end

      # Describes the protection on a file system.

      struct FileSystemProtectionDescription
        include JSON::Serializable

        # The status of the file system's replication overwrite protection. ENABLED – The file system cannot
        # be used as the destination file system in a replication configuration. The file system is writeable.
        # Replication overwrite protection is ENABLED by default. DISABLED – The file system can be used as
        # the destination file system in a replication configuration. The file system is read-only and can
        # only be modified by EFS replication. REPLICATING – The file system is being used as the destination
        # file system in a replication configuration. The file system is read-only and is modified only by EFS
        # replication. If the replication configuration is deleted, the file system's replication overwrite
        # protection is re-enabled, the file system becomes writeable.

        @[JSON::Field(key: "ReplicationOverwriteProtection")]
        getter replication_overwrite_protection : String?

        def initialize(
          @replication_overwrite_protection : String? = nil
        )
        end
      end

      # The latest known metered size (in bytes) of data stored in the file system, in its Value field, and
      # the time at which that size was determined in its Timestamp field. The value doesn't represent the
      # size of a consistent snapshot of the file system, but it is eventually consistent when there are no
      # writes to the file system. That is, the value represents the actual size only if the file system is
      # not modified for a period longer than a couple of hours. Otherwise, the value is not necessarily the
      # exact size the file system was at any instant in time.

      struct FileSystemSize
        include JSON::Serializable

        # The latest known metered size (in bytes) of data stored in the file system.

        @[JSON::Field(key: "Value")]
        getter value : Int64

        # The time at which the size of data, returned in the Value field, was determined. The value is the
        # integer number of seconds since 1970-01-01T00:00:00Z.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        # The latest known metered size (in bytes) of data stored in the Archive storage class.

        @[JSON::Field(key: "ValueInArchive")]
        getter value_in_archive : Int64?

        # The latest known metered size (in bytes) of data stored in the Infrequent Access storage class.

        @[JSON::Field(key: "ValueInIA")]
        getter value_in_ia : Int64?

        # The latest known metered size (in bytes) of data stored in the Standard storage class.

        @[JSON::Field(key: "ValueInStandard")]
        getter value_in_standard : Int64?

        def initialize(
          @value : Int64,
          @timestamp : Time? = nil,
          @value_in_archive : Int64? = nil,
          @value_in_ia : Int64? = nil,
          @value_in_standard : Int64? = nil
        )
        end
      end

      # Returned if the file system's lifecycle state is not "available".

      struct IncorrectFileSystemLifeCycleState
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if the mount target is not in the correct state for the operation.

      struct IncorrectMountTargetState
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if there's not enough capacity to provision additional throughput. This value might be
      # returned when you try to create a file system in provisioned throughput mode, when you attempt to
      # increase the provisioned throughput of an existing file system, or when you attempt to change an
      # existing file system from Bursting Throughput to Provisioned Throughput mode. Try again later.

      struct InsufficientThroughputCapacity
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if an error occurred on the server side.

      struct InternalServerError
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if the FileSystemPolicy is malformed or contains an error such as a parameter value that is
      # not valid or a missing required parameter. Returned in the case of a policy lockout safety check
      # error.

      struct InvalidPolicyException
        include JSON::Serializable


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

      # Returned if the request specified an IpAddress that is already in use in the subnet.

      struct IpAddressInUse
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end


      struct LifecycleConfigurationDescription
        include JSON::Serializable

        # An array of lifecycle management policies. EFS supports a maximum of one policy per file system.

        @[JSON::Field(key: "LifecyclePolicies")]
        getter lifecycle_policies : Array(Types::LifecyclePolicy)?

        def initialize(
          @lifecycle_policies : Array(Types::LifecyclePolicy)? = nil
        )
        end
      end

      # Describes a policy used by lifecycle management that specifies when to transition files into and out
      # of storage classes. For more information, see Managing file system storage . When using the
      # put-lifecycle-configuration CLI command or the PutLifecycleConfiguration API action, Amazon EFS
      # requires that each LifecyclePolicy object have only a single transition. This means that in a
      # request body, LifecyclePolicies must be structured as an array of LifecyclePolicy objects, one
      # object for each transition. For more information, see the request examples in
      # PutLifecycleConfiguration .

      struct LifecyclePolicy
        include JSON::Serializable

        # The number of days after files were last accessed in primary storage (the Standard storage class) at
        # which to move them to Archive storage. Metadata operations such as listing the contents of a
        # directory don't count as file access events.

        @[JSON::Field(key: "TransitionToArchive")]
        getter transition_to_archive : String?

        # The number of days after files were last accessed in primary storage (the Standard storage class) at
        # which to move them to Infrequent Access (IA) storage. Metadata operations such as listing the
        # contents of a directory don't count as file access events.

        @[JSON::Field(key: "TransitionToIA")]
        getter transition_to_ia : String?

        # Whether to move files back to primary (Standard) storage after they are accessed in IA or Archive
        # storage. Metadata operations such as listing the contents of a directory don't count as file access
        # events.

        @[JSON::Field(key: "TransitionToPrimaryStorageClass")]
        getter transition_to_primary_storage_class : String?

        def initialize(
          @transition_to_archive : String? = nil,
          @transition_to_ia : String? = nil,
          @transition_to_primary_storage_class : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Specifies the EFS resource you want to retrieve tags for. You can retrieve tags for EFS file systems
        # and access points using this API endpoint.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # (Optional) Specifies the maximum number of tag objects to return in the response. The default value
        # is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # (Optional) You can use NextToken in a subsequent request to fetch the next page of access point
        # descriptions if the response payload was paginated.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # NextToken is present if the response payload is paginated. You can use NextToken in a subsequent
        # request to fetch the next page of access point descriptions.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of the tags for the specified EFS resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ModifyMountTargetSecurityGroupsRequest
        include JSON::Serializable

        # The ID of the mount target whose security groups you want to modify.

        @[JSON::Field(key: "MountTargetId")]
        getter mount_target_id : String

        # An array of VPC security group IDs.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @mount_target_id : String,
          @security_groups : Array(String)? = nil
        )
        end
      end

      # Returned if the mount target would violate one of the specified restrictions based on the file
      # system's existing mount targets.

      struct MountTargetConflict
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Provides a description of a mount target.

      struct MountTargetDescription
        include JSON::Serializable

        # The ID of the file system for which the mount target is intended.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # Lifecycle state of the mount target.

        @[JSON::Field(key: "LifeCycleState")]
        getter life_cycle_state : String

        # System-assigned mount target ID.

        @[JSON::Field(key: "MountTargetId")]
        getter mount_target_id : String

        # The ID of the mount target's subnet.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String

        # The unique and consistent identifier of the Availability Zone that the mount target resides in. For
        # example, use1-az1 is an AZ ID for the us-east-1 Region and it has the same location in every Amazon
        # Web Services account.

        @[JSON::Field(key: "AvailabilityZoneId")]
        getter availability_zone_id : String?

        # The name of the Availability Zone in which the mount target is located. Availability Zones are
        # independently mapped to names for each Amazon Web Services account. For example, the Availability
        # Zone us-east-1a for your Amazon Web Services account might not be the same location as us-east-1a
        # for another Amazon Web Services account.

        @[JSON::Field(key: "AvailabilityZoneName")]
        getter availability_zone_name : String?

        # Address at which the file system can be mounted by using the mount target.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The IPv6 address for the mount target.

        @[JSON::Field(key: "Ipv6Address")]
        getter ipv6_address : String?

        # The ID of the network interface that Amazon EFS created when it created the mount target.

        @[JSON::Field(key: "NetworkInterfaceId")]
        getter network_interface_id : String?

        # Amazon Web Services account ID that owns the resource.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The virtual private cloud (VPC) ID that the mount target is configured in.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @file_system_id : String,
          @life_cycle_state : String,
          @mount_target_id : String,
          @subnet_id : String,
          @availability_zone_id : String? = nil,
          @availability_zone_name : String? = nil,
          @ip_address : String? = nil,
          @ipv6_address : String? = nil,
          @network_interface_id : String? = nil,
          @owner_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Returned if there is no mount target with the specified ID found in the caller's Amazon Web Services
      # account.

      struct MountTargetNotFound
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # The calling account has reached the limit for elastic network interfaces for the specific Amazon Web
      # Services Region. Either delete some network interfaces or request that the account quota be raised.
      # For more information, see Amazon VPC Quotas in the Amazon VPC User Guide (see the Network interfaces
      # per Region entry in the Network interfaces table).

      struct NetworkInterfaceLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if IpAddress was not specified in the request and there are no free IP addresses in the
      # subnet.

      struct NoFreeAddressesInSubnet
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if no backup is specified for a One Zone EFS file system.

      struct PolicyNotFound
        include JSON::Serializable


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

      # The full POSIX identity, including the user ID, group ID, and any secondary group IDs, on the access
      # point that is used for all file system operations performed by NFS clients using the access point.

      struct PosixUser
        include JSON::Serializable

        # The POSIX group ID used for all file system operations using this access point.

        @[JSON::Field(key: "Gid")]
        getter gid : Int64

        # The POSIX user ID used for all file system operations using this access point.

        @[JSON::Field(key: "Uid")]
        getter uid : Int64

        # Secondary POSIX group IDs used for all file system operations using this access point.

        @[JSON::Field(key: "SecondaryGids")]
        getter secondary_gids : Array(Int64)?

        def initialize(
          @gid : Int64,
          @uid : Int64,
          @secondary_gids : Array(Int64)? = nil
        )
        end
      end


      struct PutAccountPreferencesRequest
        include JSON::Serializable

        # Specifies the EFS resource ID preference to set for the user's Amazon Web Services account, in the
        # current Amazon Web Services Region, either LONG_ID (17 characters), or SHORT_ID (8 characters).
        # Starting in October, 2021, you will receive an error when setting the account preference to SHORT_ID
        # . Contact Amazon Web Services support if you receive an error and must use short IDs for file system
        # and mount target resources.

        @[JSON::Field(key: "ResourceIdType")]
        getter resource_id_type : String

        def initialize(
          @resource_id_type : String
        )
        end
      end


      struct PutAccountPreferencesResponse
        include JSON::Serializable


        @[JSON::Field(key: "ResourceIdPreference")]
        getter resource_id_preference : Types::ResourceIdPreference?

        def initialize(
          @resource_id_preference : Types::ResourceIdPreference? = nil
        )
        end
      end


      struct PutBackupPolicyRequest
        include JSON::Serializable

        # The backup policy included in the PutBackupPolicy request.

        @[JSON::Field(key: "BackupPolicy")]
        getter backup_policy : Types::BackupPolicy

        # Specifies which EFS file system to update the backup policy for.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        def initialize(
          @backup_policy : Types::BackupPolicy,
          @file_system_id : String
        )
        end
      end


      struct PutFileSystemPolicyRequest
        include JSON::Serializable

        # The ID of the EFS file system that you want to create or update the FileSystemPolicy for.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # The FileSystemPolicy that you're creating. Accepts a JSON formatted policy definition. EFS file
        # system policies have a 20,000 character limit. To find out more about the elements that make up a
        # file system policy, see Resource-based policies within Amazon EFS .

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # (Optional) A boolean that specifies whether or not to bypass the FileSystemPolicy lockout safety
        # check. The lockout safety check determines whether the policy in the request will lock out, or
        # prevent, the IAM principal that is making the request from making future PutFileSystemPolicy
        # requests on this file system. Set BypassPolicyLockoutSafetyCheck to True only when you intend to
        # prevent the IAM principal that is making the request from making subsequent PutFileSystemPolicy
        # requests on this file system. The default value is False .

        @[JSON::Field(key: "BypassPolicyLockoutSafetyCheck")]
        getter bypass_policy_lockout_safety_check : Bool?

        def initialize(
          @file_system_id : String,
          @policy : String,
          @bypass_policy_lockout_safety_check : Bool? = nil
        )
        end
      end


      struct PutLifecycleConfigurationRequest
        include JSON::Serializable

        # The ID of the file system for which you are creating the LifecycleConfiguration object (String).

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # An array of LifecyclePolicy objects that define the file system's LifecycleConfiguration object. A
        # LifecycleConfiguration object informs lifecycle management of the following: TransitionToIA – When
        # to move files in the file system from primary storage (Standard storage class) into the Infrequent
        # Access (IA) storage. TransitionToArchive – When to move files in the file system from their current
        # storage class (either IA or Standard storage) into the Archive storage. File systems cannot
        # transition into Archive storage before transitioning into IA storage. Therefore, TransitionToArchive
        # must either not be set or must be later than TransitionToIA. The Archive storage class is available
        # only for file systems that use the Elastic throughput mode and the General Purpose performance mode.
        # TransitionToPrimaryStorageClass – Whether to move files in the file system back to primary storage
        # (Standard storage class) after they are accessed in IA or Archive storage. When using the
        # put-lifecycle-configuration CLI command or the PutLifecycleConfiguration API action, Amazon EFS
        # requires that each LifecyclePolicy object have only a single transition. This means that in a
        # request body, LifecyclePolicies must be structured as an array of LifecyclePolicy objects, one
        # object for each storage transition. See the example requests in the following section for more
        # information.

        @[JSON::Field(key: "LifecyclePolicies")]
        getter lifecycle_policies : Array(Types::LifecyclePolicy)

        def initialize(
          @file_system_id : String,
          @lifecycle_policies : Array(Types::LifecyclePolicy)
        )
        end
      end

      # Returned if the file system is already included in a replication configuration.&gt;

      struct ReplicationAlreadyExists
        include JSON::Serializable


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

      # Describes the replication configuration for a specific file system.

      struct ReplicationConfigurationDescription
        include JSON::Serializable

        # Describes when the replication configuration was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # An array of destination objects. Only one destination object is supported.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::Destination)

        # The Amazon Resource Name (ARN) of the original source EFS file system in the replication
        # configuration.

        @[JSON::Field(key: "OriginalSourceFileSystemArn")]
        getter original_source_file_system_arn : String

        # The Amazon Resource Name (ARN) of the current source file system in the replication configuration.

        @[JSON::Field(key: "SourceFileSystemArn")]
        getter source_file_system_arn : String

        # The ID of the source Amazon EFS file system that is being replicated.

        @[JSON::Field(key: "SourceFileSystemId")]
        getter source_file_system_id : String

        # The Amazon Web Services Region in which the source EFS file system is located.

        @[JSON::Field(key: "SourceFileSystemRegion")]
        getter source_file_system_region : String

        # ID of the Amazon Web Services account in which the source file system resides.

        @[JSON::Field(key: "SourceFileSystemOwnerId")]
        getter source_file_system_owner_id : String?

        def initialize(
          @creation_time : Time,
          @destinations : Array(Types::Destination),
          @original_source_file_system_arn : String,
          @source_file_system_arn : String,
          @source_file_system_id : String,
          @source_file_system_region : String,
          @source_file_system_owner_id : String? = nil
        )
        end
      end

      # Returned if the specified file system does not have a replication configuration.

      struct ReplicationNotFound
        include JSON::Serializable

        # ReplicationNotFound

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

      # Describes the resource type and its ID preference for the user's Amazon Web Services account, in the
      # current Amazon Web Services Region.

      struct ResourceIdPreference
        include JSON::Serializable

        # Identifies the EFS resource ID preference, either LONG_ID (17 characters) or SHORT_ID (8
        # characters).

        @[JSON::Field(key: "ResourceIdType")]
        getter resource_id_type : String?

        # Identifies the Amazon EFS resources to which the ID preference setting applies, FILE_SYSTEM and
        # MOUNT_TARGET .

        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        def initialize(
          @resource_id_type : String? = nil,
          @resources : Array(String)? = nil
        )
        end
      end

      # Specifies the directory on the Amazon EFS file system that the access point provides access to. The
      # access point exposes the specified file system path as the root directory of your file system to
      # applications using the access point. NFS clients using the access point can only access data in the
      # access point's RootDirectory and its subdirectories.

      struct RootDirectory
        include JSON::Serializable

        # (Optional) Specifies the POSIX IDs and permissions to apply to the access point's RootDirectory . If
        # the RootDirectory &gt; Path specified does not exist, EFS creates the root directory using the
        # CreationInfo settings when a client connects to an access point. When specifying the CreationInfo ,
        # you must provide values for all properties. If you do not provide CreationInfo and the specified
        # RootDirectory &gt; Path does not exist, attempts to mount the file system using the access point
        # will fail.

        @[JSON::Field(key: "CreationInfo")]
        getter creation_info : Types::CreationInfo?

        # Specifies the path on the EFS file system to expose as the root directory to NFS clients using the
        # access point to access the EFS file system. A path can have up to four subdirectories. If the
        # specified path does not exist, you are required to provide the CreationInfo .

        @[JSON::Field(key: "Path")]
        getter path : String?

        def initialize(
          @creation_info : Types::CreationInfo? = nil,
          @path : String? = nil
        )
        end
      end

      # Returned if the number of SecurityGroups specified in the request is greater than the limit, which
      # is based on account quota. Either delete some security groups or request that the account quota be
      # raised. For more information, see Amazon VPC Quotas in the Amazon VPC User Guide (see the Security
      # Groups table).

      struct SecurityGroupLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if one of the specified security groups doesn't exist in the subnet's virtual private cloud
      # (VPC).

      struct SecurityGroupNotFound
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if there is no subnet with ID SubnetId provided in the request.

      struct SubnetNotFound
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # A tag is a key-value pair. Allowed characters are letters, white space, and numbers that can be
      # represented in UTF-8, and the following characters: + - = . _ : / .

      struct Tag
        include JSON::Serializable

        # The tag key (String). The key can't start with aws: .

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag key.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ID specifying the EFS resource that you want to create a tag for.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # An array of Tag objects to add. Each Tag object is a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Returned when the CreateAccessPoint API action is called too quickly and the number of Access Points
      # on the file system is nearing the limit of 120 .

      struct ThrottlingException
        include JSON::Serializable


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

      # Returned if the throughput mode or amount of provisioned throughput can't be changed because the
      # throughput limit of 1024 MiB/s has been reached.

      struct ThroughputLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if you don’t wait at least 24 hours before either changing the throughput mode, or
      # decreasing the Provisioned Throughput value.

      struct TooManyRequests
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      # Returned if the requested Amazon EFS functionality is not available in the specified Availability
      # Zone.

      struct UnsupportedAvailabilityZone
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # Specifies the EFS resource that you want to remove tags from.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The keys of the key-value tag pairs that you want to remove from the specified EFS resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_id : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateFileSystemProtectionRequest
        include JSON::Serializable

        # The ID of the file system to update.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # The status of the file system's replication overwrite protection. ENABLED – The file system cannot
        # be used as the destination file system in a replication configuration. The file system is writeable.
        # Replication overwrite protection is ENABLED by default. DISABLED – The file system can be used as
        # the destination file system in a replication configuration. The file system is read-only and can
        # only be modified by EFS replication. REPLICATING – The file system is being used as the destination
        # file system in a replication configuration. The file system is read-only and is only modified only
        # by EFS replication. If the replication configuration is deleted, the file system's replication
        # overwrite protection is re-enabled and the file system becomes writeable.

        @[JSON::Field(key: "ReplicationOverwriteProtection")]
        getter replication_overwrite_protection : String?

        def initialize(
          @file_system_id : String,
          @replication_overwrite_protection : String? = nil
        )
        end
      end


      struct UpdateFileSystemRequest
        include JSON::Serializable

        # The ID of the file system that you want to update.

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # (Optional) The throughput, measured in mebibytes per second (MiBps), that you want to provision for
        # a file system that you're creating. Required if ThroughputMode is set to provisioned . Valid values
        # are 1-3414 MiBps, with the upper limit depending on Region. To increase this limit, contact Amazon
        # Web ServicesSupport. For more information, see Amazon EFS quotas that you can increase in the Amazon
        # EFS User Guide .

        @[JSON::Field(key: "ProvisionedThroughputInMibps")]
        getter provisioned_throughput_in_mibps : Float64?

        # (Optional) Updates the file system's throughput mode. If you're not updating your throughput mode,
        # you don't need to provide this value in your request. If you are changing the ThroughputMode to
        # provisioned , you must also set a value for ProvisionedThroughputInMibps .

        @[JSON::Field(key: "ThroughputMode")]
        getter throughput_mode : String?

        def initialize(
          @file_system_id : String,
          @provisioned_throughput_in_mibps : Float64? = nil,
          @throughput_mode : String? = nil
        )
        end
      end

      # Returned if the Backup service is not available in the Amazon Web Services Region in which the
      # request was made.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end
    end
  end
end
