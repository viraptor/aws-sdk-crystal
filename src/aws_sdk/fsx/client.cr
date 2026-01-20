module AwsSdk
  module FSx
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Use this action to associate one or more Domain Name Server (DNS) aliases with an existing Amazon
      # FSx for Windows File Server file system. A file system can have a maximum of 50 DNS aliases
      # associated with it at any one time. If you try to associate a DNS alias that is already associated
      # with the file system, FSx takes no action on that alias in the request. For more information, see
      # Working with DNS Aliases and Walkthrough 5: Using DNS aliases to access your file system , including
      # additional steps you must take to be able to access your file system using a DNS alias. The system
      # response shows the DNS aliases that Amazon FSx is attempting to associate with the file system. Use
      # the API operation to monitor the status of the aliases Amazon FSx is associating with the file
      # system.

      def associate_file_system_aliases(
        aliases : Array(String),
        file_system_id : String,
        client_request_token : String? = nil
      ) : Types::AssociateFileSystemAliasesResponse

        input = Types::AssociateFileSystemAliasesRequest.new(aliases: aliases, file_system_id: file_system_id, client_request_token: client_request_token)
        associate_file_system_aliases(input)
      end

      def associate_file_system_aliases(input : Types::AssociateFileSystemAliasesRequest) : Types::AssociateFileSystemAliasesResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_FILE_SYSTEM_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateFileSystemAliasesResponse, "AssociateFileSystemAliases")
      end

      # Cancels an existing Amazon FSx for Lustre data repository task if that task is in either the PENDING
      # or EXECUTING state. When you cancel an export task, Amazon FSx does the following. Any files that
      # FSx has already exported are not reverted. FSx continues to export any files that are in-flight when
      # the cancel operation is received. FSx does not export any files that have not yet been exported. For
      # a release task, Amazon FSx will stop releasing files upon cancellation. Any files that have already
      # been released will remain in the released state.

      def cancel_data_repository_task(
        task_id : String
      ) : Types::CancelDataRepositoryTaskResponse

        input = Types::CancelDataRepositoryTaskRequest.new(task_id: task_id)
        cancel_data_repository_task(input)
      end

      def cancel_data_repository_task(input : Types::CancelDataRepositoryTaskRequest) : Types::CancelDataRepositoryTaskResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_DATA_REPOSITORY_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelDataRepositoryTaskResponse, "CancelDataRepositoryTask")
      end

      # Copies an existing backup within the same Amazon Web Services account to another Amazon Web Services
      # Region (cross-Region copy) or within the same Amazon Web Services Region (in-Region copy). You can
      # have up to five backup copy requests in progress to a single destination Region per account. You can
      # use cross-Region backup copies for cross-Region disaster recovery. You can periodically take backups
      # and copy them to another Region so that in the event of a disaster in the primary Region, you can
      # restore from backup and recover availability quickly in the other Region. You can make cross-Region
      # copies only within your Amazon Web Services partition. A partition is a grouping of Regions. Amazon
      # Web Services currently has three partitions: aws (Standard Regions), aws-cn (China Regions), and
      # aws-us-gov (Amazon Web Services GovCloud [US] Regions). You can also use backup copies to clone your
      # file dataset to another Region or within the same Region. You can use the SourceRegion parameter to
      # specify the Amazon Web Services Region from which the backup will be copied. For example, if you
      # make the call from the us-west-1 Region and want to copy a backup from the us-east-2 Region, you
      # specify us-east-2 in the SourceRegion parameter to make a cross-Region copy. If you don't specify a
      # Region, the backup copy is created in the same Region where the request is sent from (in-Region
      # copy). For more information about creating backup copies, see Copying backups in the Amazon FSx for
      # Windows User Guide , Copying backups in the Amazon FSx for Lustre User Guide , and Copying backups
      # in the Amazon FSx for OpenZFS User Guide .

      def copy_backup(
        source_backup_id : String,
        client_request_token : String? = nil,
        copy_tags : Bool? = nil,
        kms_key_id : String? = nil,
        source_region : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CopyBackupResponse

        input = Types::CopyBackupRequest.new(source_backup_id: source_backup_id, client_request_token: client_request_token, copy_tags: copy_tags, kms_key_id: kms_key_id, source_region: source_region, tags: tags)
        copy_backup(input)
      end

      def copy_backup(input : Types::CopyBackupRequest) : Types::CopyBackupResponse
        request = Protocol::JsonRpc.build_request(Model::COPY_BACKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CopyBackupResponse, "CopyBackup")
      end

      # Updates an existing volume by using a snapshot from another Amazon FSx for OpenZFS file system. For
      # more information, see on-demand data replication in the Amazon FSx for OpenZFS User Guide.

      def copy_snapshot_and_update_volume(
        source_snapshot_arn : String,
        volume_id : String,
        client_request_token : String? = nil,
        copy_strategy : String? = nil,
        options : Array(String)? = nil
      ) : Types::CopySnapshotAndUpdateVolumeResponse

        input = Types::CopySnapshotAndUpdateVolumeRequest.new(source_snapshot_arn: source_snapshot_arn, volume_id: volume_id, client_request_token: client_request_token, copy_strategy: copy_strategy, options: options)
        copy_snapshot_and_update_volume(input)
      end

      def copy_snapshot_and_update_volume(input : Types::CopySnapshotAndUpdateVolumeRequest) : Types::CopySnapshotAndUpdateVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::COPY_SNAPSHOT_AND_UPDATE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CopySnapshotAndUpdateVolumeResponse, "CopySnapshotAndUpdateVolume")
      end

      # Creates an S3 access point and attaches it to an Amazon FSx volume. For FSx for OpenZFS file
      # systems, the volume must be hosted on a high-availability file system, either Single-AZ or Multi-AZ.
      # For more information, see Accessing your data using Amazon S3 access points . in the Amazon FSx for
      # OpenZFS User Guide. The requester requires the following permissions to perform these actions:
      # fsx:CreateAndAttachS3AccessPoint s3:CreateAccessPoint s3:GetAccessPoint s3:PutAccessPointPolicy
      # s3:DeleteAccessPoint The following actions are related to CreateAndAttachS3AccessPoint :
      # DescribeS3AccessPointAttachments DetachAndDeleteS3AccessPoint

      def create_and_attach_s3_access_point(
        name : String,
        type : String,
        client_request_token : String? = nil,
        ontap_configuration : Types::CreateAndAttachS3AccessPointOntapConfiguration? = nil,
        open_zfs_configuration : Types::CreateAndAttachS3AccessPointOpenZFSConfiguration? = nil,
        s3_access_point : Types::CreateAndAttachS3AccessPointS3Configuration? = nil
      ) : Types::CreateAndAttachS3AccessPointResponse

        input = Types::CreateAndAttachS3AccessPointRequest.new(name: name, type: type, client_request_token: client_request_token, ontap_configuration: ontap_configuration, open_zfs_configuration: open_zfs_configuration, s3_access_point: s3_access_point)
        create_and_attach_s3_access_point(input)
      end

      def create_and_attach_s3_access_point(input : Types::CreateAndAttachS3AccessPointRequest) : Types::CreateAndAttachS3AccessPointResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_AND_ATTACH_S3_ACCESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAndAttachS3AccessPointResponse, "CreateAndAttachS3AccessPoint")
      end

      # Creates a backup of an existing Amazon FSx for Windows File Server file system, Amazon FSx for
      # Lustre file system, Amazon FSx for NetApp ONTAP volume, or Amazon FSx for OpenZFS file system. We
      # recommend creating regular backups so that you can restore a file system or volume from a backup if
      # an issue arises with the original file system or volume. For Amazon FSx for Lustre file systems, you
      # can create a backup only for file systems that have the following configuration: A Persistent
      # deployment type Are not linked to a data repository For more information about backups, see the
      # following: For Amazon FSx for Lustre, see Working with FSx for Lustre backups . For Amazon FSx for
      # Windows, see Working with FSx for Windows backups . For Amazon FSx for NetApp ONTAP, see Working
      # with FSx for NetApp ONTAP backups . For Amazon FSx for OpenZFS, see Working with FSx for OpenZFS
      # backups . If a backup with the specified client request token exists and the parameters match, this
      # operation returns the description of the existing backup. If a backup with the specified client
      # request token exists and the parameters don't match, this operation returns
      # IncompatibleParameterError . If a backup with the specified client request token doesn't exist,
      # CreateBackup does the following: Creates a new Amazon FSx backup with an assigned ID, and an initial
      # lifecycle state of CREATING . Returns the description of the backup. By using the idempotent
      # operation, you can retry a CreateBackup operation without the risk of creating an extra backup. This
      # approach can be useful when an initial call fails in a way that makes it unclear whether a backup
      # was created. If you use the same client request token and the initial call created a backup, the
      # operation returns a successful result because all the parameters are the same. The CreateBackup
      # operation returns while the backup's lifecycle state is still CREATING . You can check the backup
      # creation status by calling the DescribeBackups operation, which returns the backup state along with
      # other information.

      def create_backup(
        client_request_token : String? = nil,
        file_system_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_id : String? = nil
      ) : Types::CreateBackupResponse

        input = Types::CreateBackupRequest.new(client_request_token: client_request_token, file_system_id: file_system_id, tags: tags, volume_id: volume_id)
        create_backup(input)
      end

      def create_backup(input : Types::CreateBackupRequest) : Types::CreateBackupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BACKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBackupResponse, "CreateBackup")
      end

      # Creates an Amazon FSx for Lustre data repository association (DRA). A data repository association is
      # a link between a directory on the file system and an Amazon S3 bucket or prefix. You can have a
      # maximum of 8 data repository associations on a file system. Data repository associations are
      # supported on all FSx for Lustre 2.12 and 2.15 file systems, excluding scratch_1 deployment type.
      # Each data repository association must have a unique Amazon FSx file system directory and a unique S3
      # bucket or prefix associated with it. You can configure a data repository association for automatic
      # import only, for automatic export only, or for both. To learn more about linking a data repository
      # to your file system, see Linking your file system to an S3 bucket . CreateDataRepositoryAssociation
      # isn't supported on Amazon File Cache resources. To create a DRA on Amazon File Cache, use the
      # CreateFileCache operation.

      def create_data_repository_association(
        data_repository_path : String,
        file_system_id : String,
        batch_import_meta_data_on_create : Bool? = nil,
        client_request_token : String? = nil,
        file_system_path : String? = nil,
        imported_file_chunk_size : Int32? = nil,
        s3 : Types::S3DataRepositoryConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDataRepositoryAssociationResponse

        input = Types::CreateDataRepositoryAssociationRequest.new(data_repository_path: data_repository_path, file_system_id: file_system_id, batch_import_meta_data_on_create: batch_import_meta_data_on_create, client_request_token: client_request_token, file_system_path: file_system_path, imported_file_chunk_size: imported_file_chunk_size, s3: s3, tags: tags)
        create_data_repository_association(input)
      end

      def create_data_repository_association(input : Types::CreateDataRepositoryAssociationRequest) : Types::CreateDataRepositoryAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_REPOSITORY_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataRepositoryAssociationResponse, "CreateDataRepositoryAssociation")
      end

      # Creates an Amazon FSx for Lustre data repository task. A CreateDataRepositoryTask operation will
      # fail if a data repository is not linked to the FSx file system. You use import and export data
      # repository tasks to perform bulk operations between your FSx for Lustre file system and its linked
      # data repositories. An example of a data repository task is exporting any data and metadata changes,
      # including POSIX metadata, to files, directories, and symbolic links (symlinks) from your FSx file
      # system to a linked data repository. You use release data repository tasks to release data from your
      # file system for files that are exported to S3. The metadata of released files remains on the file
      # system so users or applications can still access released files by reading the files again, which
      # will restore data from Amazon S3 to the FSx for Lustre file system. To learn more about data
      # repository tasks, see Data Repository Tasks . To learn more about linking a data repository to your
      # file system, see Linking your file system to an S3 bucket .

      def create_data_repository_task(
        file_system_id : String,
        report : Types::CompletionReport,
        type : String,
        capacity_to_release : Int64? = nil,
        client_request_token : String? = nil,
        paths : Array(String)? = nil,
        release_configuration : Types::ReleaseConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDataRepositoryTaskResponse

        input = Types::CreateDataRepositoryTaskRequest.new(file_system_id: file_system_id, report: report, type: type, capacity_to_release: capacity_to_release, client_request_token: client_request_token, paths: paths, release_configuration: release_configuration, tags: tags)
        create_data_repository_task(input)
      end

      def create_data_repository_task(input : Types::CreateDataRepositoryTaskRequest) : Types::CreateDataRepositoryTaskResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_REPOSITORY_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataRepositoryTaskResponse, "CreateDataRepositoryTask")
      end

      # Creates a new Amazon File Cache resource. You can use this operation with a client request token in
      # the request that Amazon File Cache uses to ensure idempotent creation. If a cache with the specified
      # client request token exists and the parameters match, CreateFileCache returns the description of the
      # existing cache. If a cache with the specified client request token exists and the parameters don't
      # match, this call returns IncompatibleParameterError . If a file cache with the specified client
      # request token doesn't exist, CreateFileCache does the following: Creates a new, empty Amazon File
      # Cache resource with an assigned ID, and an initial lifecycle state of CREATING . Returns the
      # description of the cache in JSON format. The CreateFileCache call returns while the cache's
      # lifecycle state is still CREATING . You can check the cache creation status by calling the
      # DescribeFileCaches operation, which returns the cache state along with other information.

      def create_file_cache(
        file_cache_type : String,
        file_cache_type_version : String,
        storage_capacity : Int32,
        subnet_ids : Array(String),
        client_request_token : String? = nil,
        copy_tags_to_data_repository_associations : Bool? = nil,
        data_repository_associations : Array(Types::FileCacheDataRepositoryAssociation)? = nil,
        kms_key_id : String? = nil,
        lustre_configuration : Types::CreateFileCacheLustreConfiguration? = nil,
        security_group_ids : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFileCacheResponse

        input = Types::CreateFileCacheRequest.new(file_cache_type: file_cache_type, file_cache_type_version: file_cache_type_version, storage_capacity: storage_capacity, subnet_ids: subnet_ids, client_request_token: client_request_token, copy_tags_to_data_repository_associations: copy_tags_to_data_repository_associations, data_repository_associations: data_repository_associations, kms_key_id: kms_key_id, lustre_configuration: lustre_configuration, security_group_ids: security_group_ids, tags: tags)
        create_file_cache(input)
      end

      def create_file_cache(input : Types::CreateFileCacheRequest) : Types::CreateFileCacheResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FILE_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFileCacheResponse, "CreateFileCache")
      end

      # Creates a new, empty Amazon FSx file system. You can create the following supported Amazon FSx file
      # systems using the CreateFileSystem API operation: Amazon FSx for Lustre Amazon FSx for NetApp ONTAP
      # Amazon FSx for OpenZFS Amazon FSx for Windows File Server This operation requires a client request
      # token in the request that Amazon FSx uses to ensure idempotent creation. This means that calling the
      # operation multiple times with the same client request token has no effect. By using the idempotent
      # operation, you can retry a CreateFileSystem operation without the risk of creating an extra file
      # system. This approach can be useful when an initial call fails in a way that makes it unclear
      # whether a file system was created. Examples are if a transport level timeout occurred, or your
      # connection was reset. If you use the same client request token and the initial call created a file
      # system, the client receives success as long as the parameters are the same. If a file system with
      # the specified client request token exists and the parameters match, CreateFileSystem returns the
      # description of the existing file system. If a file system with the specified client request token
      # exists and the parameters don't match, this call returns IncompatibleParameterError . If a file
      # system with the specified client request token doesn't exist, CreateFileSystem does the following:
      # Creates a new, empty Amazon FSx file system with an assigned ID, and an initial lifecycle state of
      # CREATING . Returns the description of the file system in JSON format. The CreateFileSystem call
      # returns while the file system's lifecycle state is still CREATING . You can check the file-system
      # creation status by calling the DescribeFileSystems operation, which returns the file system state
      # along with other information.

      def create_file_system(
        file_system_type : String,
        subnet_ids : Array(String),
        client_request_token : String? = nil,
        file_system_type_version : String? = nil,
        kms_key_id : String? = nil,
        lustre_configuration : Types::CreateFileSystemLustreConfiguration? = nil,
        network_type : String? = nil,
        ontap_configuration : Types::CreateFileSystemOntapConfiguration? = nil,
        open_zfs_configuration : Types::CreateFileSystemOpenZFSConfiguration? = nil,
        security_group_ids : Array(String)? = nil,
        storage_capacity : Int32? = nil,
        storage_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        windows_configuration : Types::CreateFileSystemWindowsConfiguration? = nil
      ) : Types::CreateFileSystemResponse

        input = Types::CreateFileSystemRequest.new(file_system_type: file_system_type, subnet_ids: subnet_ids, client_request_token: client_request_token, file_system_type_version: file_system_type_version, kms_key_id: kms_key_id, lustre_configuration: lustre_configuration, network_type: network_type, ontap_configuration: ontap_configuration, open_zfs_configuration: open_zfs_configuration, security_group_ids: security_group_ids, storage_capacity: storage_capacity, storage_type: storage_type, tags: tags, windows_configuration: windows_configuration)
        create_file_system(input)
      end

      def create_file_system(input : Types::CreateFileSystemRequest) : Types::CreateFileSystemResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FILE_SYSTEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFileSystemResponse, "CreateFileSystem")
      end

      # Creates a new Amazon FSx for Lustre, Amazon FSx for Windows File Server, or Amazon FSx for OpenZFS
      # file system from an existing Amazon FSx backup. If a file system with the specified client request
      # token exists and the parameters match, this operation returns the description of the file system. If
      # a file system with the specified client request token exists but the parameters don't match, this
      # call returns IncompatibleParameterError . If a file system with the specified client request token
      # doesn't exist, this operation does the following: Creates a new Amazon FSx file system from backup
      # with an assigned ID, and an initial lifecycle state of CREATING . Returns the description of the
      # file system. Parameters like the Active Directory, default share name, automatic backup, and backup
      # settings default to the parameters of the file system that was backed up, unless overridden. You can
      # explicitly supply other settings. By using the idempotent operation, you can retry a
      # CreateFileSystemFromBackup call without the risk of creating an extra file system. This approach can
      # be useful when an initial call fails in a way that makes it unclear whether a file system was
      # created. Examples are if a transport level timeout occurred, or your connection was reset. If you
      # use the same client request token and the initial call created a file system, the client receives a
      # success message as long as the parameters are the same. The CreateFileSystemFromBackup call returns
      # while the file system's lifecycle state is still CREATING . You can check the file-system creation
      # status by calling the DescribeFileSystems operation, which returns the file system state along with
      # other information.

      def create_file_system_from_backup(
        backup_id : String,
        subnet_ids : Array(String),
        client_request_token : String? = nil,
        file_system_type_version : String? = nil,
        kms_key_id : String? = nil,
        lustre_configuration : Types::CreateFileSystemLustreConfiguration? = nil,
        network_type : String? = nil,
        open_zfs_configuration : Types::CreateFileSystemOpenZFSConfiguration? = nil,
        security_group_ids : Array(String)? = nil,
        storage_capacity : Int32? = nil,
        storage_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        windows_configuration : Types::CreateFileSystemWindowsConfiguration? = nil
      ) : Types::CreateFileSystemFromBackupResponse

        input = Types::CreateFileSystemFromBackupRequest.new(backup_id: backup_id, subnet_ids: subnet_ids, client_request_token: client_request_token, file_system_type_version: file_system_type_version, kms_key_id: kms_key_id, lustre_configuration: lustre_configuration, network_type: network_type, open_zfs_configuration: open_zfs_configuration, security_group_ids: security_group_ids, storage_capacity: storage_capacity, storage_type: storage_type, tags: tags, windows_configuration: windows_configuration)
        create_file_system_from_backup(input)
      end

      def create_file_system_from_backup(input : Types::CreateFileSystemFromBackupRequest) : Types::CreateFileSystemFromBackupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FILE_SYSTEM_FROM_BACKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFileSystemFromBackupResponse, "CreateFileSystemFromBackup")
      end

      # Creates a snapshot of an existing Amazon FSx for OpenZFS volume. With snapshots, you can easily undo
      # file changes and compare file versions by restoring the volume to a previous version. If a snapshot
      # with the specified client request token exists, and the parameters match, this operation returns the
      # description of the existing snapshot. If a snapshot with the specified client request token exists,
      # and the parameters don't match, this operation returns IncompatibleParameterError . If a snapshot
      # with the specified client request token doesn't exist, CreateSnapshot does the following: Creates a
      # new OpenZFS snapshot with an assigned ID, and an initial lifecycle state of CREATING . Returns the
      # description of the snapshot. By using the idempotent operation, you can retry a CreateSnapshot
      # operation without the risk of creating an extra snapshot. This approach can be useful when an
      # initial call fails in a way that makes it unclear whether a snapshot was created. If you use the
      # same client request token and the initial call created a snapshot, the operation returns a
      # successful result because all the parameters are the same. The CreateSnapshot operation returns
      # while the snapshot's lifecycle state is still CREATING . You can check the snapshot creation status
      # by calling the DescribeSnapshots operation, which returns the snapshot state along with other
      # information.

      def create_snapshot(
        name : String,
        volume_id : String,
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSnapshotResponse

        input = Types::CreateSnapshotRequest.new(name: name, volume_id: volume_id, client_request_token: client_request_token, tags: tags)
        create_snapshot(input)
      end

      def create_snapshot(input : Types::CreateSnapshotRequest) : Types::CreateSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSnapshotResponse, "CreateSnapshot")
      end

      # Creates a storage virtual machine (SVM) for an Amazon FSx for ONTAP file system.

      def create_storage_virtual_machine(
        file_system_id : String,
        name : String,
        active_directory_configuration : Types::CreateSvmActiveDirectoryConfiguration? = nil,
        client_request_token : String? = nil,
        root_volume_security_style : String? = nil,
        svm_admin_password : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateStorageVirtualMachineResponse

        input = Types::CreateStorageVirtualMachineRequest.new(file_system_id: file_system_id, name: name, active_directory_configuration: active_directory_configuration, client_request_token: client_request_token, root_volume_security_style: root_volume_security_style, svm_admin_password: svm_admin_password, tags: tags)
        create_storage_virtual_machine(input)
      end

      def create_storage_virtual_machine(input : Types::CreateStorageVirtualMachineRequest) : Types::CreateStorageVirtualMachineResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_STORAGE_VIRTUAL_MACHINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStorageVirtualMachineResponse, "CreateStorageVirtualMachine")
      end

      # Creates an FSx for ONTAP or Amazon FSx for OpenZFS storage volume.

      def create_volume(
        name : String,
        volume_type : String,
        client_request_token : String? = nil,
        ontap_configuration : Types::CreateOntapVolumeConfiguration? = nil,
        open_zfs_configuration : Types::CreateOpenZFSVolumeConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateVolumeResponse

        input = Types::CreateVolumeRequest.new(name: name, volume_type: volume_type, client_request_token: client_request_token, ontap_configuration: ontap_configuration, open_zfs_configuration: open_zfs_configuration, tags: tags)
        create_volume(input)
      end

      def create_volume(input : Types::CreateVolumeRequest) : Types::CreateVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVolumeResponse, "CreateVolume")
      end

      # Creates a new Amazon FSx for NetApp ONTAP volume from an existing Amazon FSx volume backup.

      def create_volume_from_backup(
        backup_id : String,
        name : String,
        client_request_token : String? = nil,
        ontap_configuration : Types::CreateOntapVolumeConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateVolumeFromBackupResponse

        input = Types::CreateVolumeFromBackupRequest.new(backup_id: backup_id, name: name, client_request_token: client_request_token, ontap_configuration: ontap_configuration, tags: tags)
        create_volume_from_backup(input)
      end

      def create_volume_from_backup(input : Types::CreateVolumeFromBackupRequest) : Types::CreateVolumeFromBackupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VOLUME_FROM_BACKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVolumeFromBackupResponse, "CreateVolumeFromBackup")
      end

      # Deletes an Amazon FSx backup. After deletion, the backup no longer exists, and its data is gone. The
      # DeleteBackup call returns instantly. The backup won't show up in later DescribeBackups calls. The
      # data in a deleted backup is also deleted and can't be recovered by any means.

      def delete_backup(
        backup_id : String,
        client_request_token : String? = nil
      ) : Types::DeleteBackupResponse

        input = Types::DeleteBackupRequest.new(backup_id: backup_id, client_request_token: client_request_token)
        delete_backup(input)
      end

      def delete_backup(input : Types::DeleteBackupRequest) : Types::DeleteBackupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BACKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBackupResponse, "DeleteBackup")
      end

      # Deletes a data repository association on an Amazon FSx for Lustre file system. Deleting the data
      # repository association unlinks the file system from the Amazon S3 bucket. When deleting a data
      # repository association, you have the option of deleting the data in the file system that corresponds
      # to the data repository association. Data repository associations are supported on all FSx for Lustre
      # 2.12 and 2.15 file systems, excluding scratch_1 deployment type.

      def delete_data_repository_association(
        association_id : String,
        client_request_token : String? = nil,
        delete_data_in_file_system : Bool? = nil
      ) : Types::DeleteDataRepositoryAssociationResponse

        input = Types::DeleteDataRepositoryAssociationRequest.new(association_id: association_id, client_request_token: client_request_token, delete_data_in_file_system: delete_data_in_file_system)
        delete_data_repository_association(input)
      end

      def delete_data_repository_association(input : Types::DeleteDataRepositoryAssociationRequest) : Types::DeleteDataRepositoryAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATA_REPOSITORY_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDataRepositoryAssociationResponse, "DeleteDataRepositoryAssociation")
      end

      # Deletes an Amazon File Cache resource. After deletion, the cache no longer exists, and its data is
      # gone. The DeleteFileCache operation returns while the cache has the DELETING status. You can check
      # the cache deletion status by calling the DescribeFileCaches operation, which returns a list of
      # caches in your account. If you pass the cache ID for a deleted cache, the DescribeFileCaches
      # operation returns a FileCacheNotFound error. The data in a deleted cache is also deleted and can't
      # be recovered by any means.

      def delete_file_cache(
        file_cache_id : String,
        client_request_token : String? = nil
      ) : Types::DeleteFileCacheResponse

        input = Types::DeleteFileCacheRequest.new(file_cache_id: file_cache_id, client_request_token: client_request_token)
        delete_file_cache(input)
      end

      def delete_file_cache(input : Types::DeleteFileCacheRequest) : Types::DeleteFileCacheResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FILE_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFileCacheResponse, "DeleteFileCache")
      end

      # Deletes a file system. After deletion, the file system no longer exists, and its data is gone. Any
      # existing automatic backups and snapshots are also deleted. To delete an Amazon FSx for NetApp ONTAP
      # file system, first delete all the volumes and storage virtual machines (SVMs) on the file system.
      # Then provide a FileSystemId value to the DeleteFileSystem operation. Before deleting an Amazon FSx
      # for OpenZFS file system, make sure that there aren't any Amazon S3 access points attached to any
      # volume. For more information on how to list S3 access points that are attached to volumes, see
      # Listing S3 access point attachments . For more information on how to delete S3 access points, see
      # Deleting an S3 access point attachment . By default, when you delete an Amazon FSx for Windows File
      # Server file system, a final backup is created upon deletion. This final backup isn't subject to the
      # file system's retention policy, and must be manually deleted. To delete an Amazon FSx for Lustre
      # file system, first unmount it from every connected Amazon EC2 instance, then provide a FileSystemId
      # value to the DeleteFileSystem operation. By default, Amazon FSx will not take a final backup when
      # the DeleteFileSystem operation is invoked. On file systems not linked to an Amazon S3 bucket, set
      # SkipFinalBackup to false to take a final backup of the file system you are deleting. Backups cannot
      # be enabled on S3-linked file systems. To ensure all of your data is written back to S3 before
      # deleting your file system, you can either monitor for the AgeOfOldestQueuedMessage metric to be zero
      # (if using automatic export) or you can run an export data repository task . If you have automatic
      # export enabled and want to use an export data repository task, you have to disable automatic export
      # before executing the export data repository task. The DeleteFileSystem operation returns while the
      # file system has the DELETING status. You can check the file system deletion status by calling the
      # DescribeFileSystems operation, which returns a list of file systems in your account. If you pass the
      # file system ID for a deleted file system, the DescribeFileSystems operation returns a
      # FileSystemNotFound error. If a data repository task is in a PENDING or EXECUTING state, deleting an
      # Amazon FSx for Lustre file system will fail with an HTTP status code 400 (Bad Request). The data in
      # a deleted file system is also deleted and can't be recovered by any means.

      def delete_file_system(
        file_system_id : String,
        client_request_token : String? = nil,
        lustre_configuration : Types::DeleteFileSystemLustreConfiguration? = nil,
        open_zfs_configuration : Types::DeleteFileSystemOpenZFSConfiguration? = nil,
        windows_configuration : Types::DeleteFileSystemWindowsConfiguration? = nil
      ) : Types::DeleteFileSystemResponse

        input = Types::DeleteFileSystemRequest.new(file_system_id: file_system_id, client_request_token: client_request_token, lustre_configuration: lustre_configuration, open_zfs_configuration: open_zfs_configuration, windows_configuration: windows_configuration)
        delete_file_system(input)
      end

      def delete_file_system(input : Types::DeleteFileSystemRequest) : Types::DeleteFileSystemResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FILE_SYSTEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFileSystemResponse, "DeleteFileSystem")
      end

      # Deletes an Amazon FSx for OpenZFS snapshot. After deletion, the snapshot no longer exists, and its
      # data is gone. Deleting a snapshot doesn't affect snapshots stored in a file system backup. The
      # DeleteSnapshot operation returns instantly. The snapshot appears with the lifecycle status of
      # DELETING until the deletion is complete.

      def delete_snapshot(
        snapshot_id : String,
        client_request_token : String? = nil
      ) : Types::DeleteSnapshotResponse

        input = Types::DeleteSnapshotRequest.new(snapshot_id: snapshot_id, client_request_token: client_request_token)
        delete_snapshot(input)
      end

      def delete_snapshot(input : Types::DeleteSnapshotRequest) : Types::DeleteSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSnapshotResponse, "DeleteSnapshot")
      end

      # Deletes an existing Amazon FSx for ONTAP storage virtual machine (SVM). Prior to deleting an SVM,
      # you must delete all non-root volumes in the SVM, otherwise the operation will fail.

      def delete_storage_virtual_machine(
        storage_virtual_machine_id : String,
        client_request_token : String? = nil
      ) : Types::DeleteStorageVirtualMachineResponse

        input = Types::DeleteStorageVirtualMachineRequest.new(storage_virtual_machine_id: storage_virtual_machine_id, client_request_token: client_request_token)
        delete_storage_virtual_machine(input)
      end

      def delete_storage_virtual_machine(input : Types::DeleteStorageVirtualMachineRequest) : Types::DeleteStorageVirtualMachineResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_STORAGE_VIRTUAL_MACHINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteStorageVirtualMachineResponse, "DeleteStorageVirtualMachine")
      end

      # Deletes an Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volume.

      def delete_volume(
        volume_id : String,
        client_request_token : String? = nil,
        ontap_configuration : Types::DeleteVolumeOntapConfiguration? = nil,
        open_zfs_configuration : Types::DeleteVolumeOpenZFSConfiguration? = nil
      ) : Types::DeleteVolumeResponse

        input = Types::DeleteVolumeRequest.new(volume_id: volume_id, client_request_token: client_request_token, ontap_configuration: ontap_configuration, open_zfs_configuration: open_zfs_configuration)
        delete_volume(input)
      end

      def delete_volume(input : Types::DeleteVolumeRequest) : Types::DeleteVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVolumeResponse, "DeleteVolume")
      end

      # Returns the description of a specific Amazon FSx backup, if a BackupIds value is provided for that
      # backup. Otherwise, it returns all backups owned by your Amazon Web Services account in the Amazon
      # Web Services Region of the endpoint that you're calling. When retrieving all backups, you can
      # optionally specify the MaxResults parameter to limit the number of backups in a response. If more
      # backups remain, Amazon FSx returns a NextToken value in the response. In this case, send a later
      # request with the NextToken request parameter set to the value of the NextToken value from the last
      # response. This operation is used in an iterative process to retrieve a list of your backups.
      # DescribeBackups is called first without a NextToken value. Then the operation continues to be called
      # with the NextToken parameter set to the value of the last NextToken value until a response has no
      # NextToken value. When using this operation, keep the following in mind: The operation might return
      # fewer than the MaxResults value of backup descriptions while still including a NextToken value. The
      # order of the backups returned in the response of one DescribeBackups call and the order of the
      # backups returned across the responses of a multi-call iteration is unspecified.

      def describe_backups(
        backup_ids : Array(String)? = nil,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeBackupsResponse

        input = Types::DescribeBackupsRequest.new(backup_ids: backup_ids, filters: filters, max_results: max_results, next_token: next_token)
        describe_backups(input)
      end

      def describe_backups(input : Types::DescribeBackupsRequest) : Types::DescribeBackupsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BACKUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBackupsResponse, "DescribeBackups")
      end

      # Returns the description of specific Amazon FSx for Lustre or Amazon File Cache data repository
      # associations, if one or more AssociationIds values are provided in the request, or if filters are
      # used in the request. Data repository associations are supported on Amazon File Cache resources and
      # all FSx for Lustre 2.12 and 2,15 file systems, excluding scratch_1 deployment type. You can use
      # filters to narrow the response to include just data repository associations for specific file
      # systems (use the file-system-id filter with the ID of the file system) or caches (use the
      # file-cache-id filter with the ID of the cache), or data repository associations for a specific
      # repository type (use the data-repository-type filter with a value of S3 or NFS ). If you don't use
      # filters, the response returns all data repository associations owned by your Amazon Web Services
      # account in the Amazon Web Services Region of the endpoint that you're calling. When retrieving all
      # data repository associations, you can paginate the response by using the optional MaxResults
      # parameter to limit the number of data repository associations returned in a response. If more data
      # repository associations remain, a NextToken value is returned in the response. In this case, send a
      # later request with the NextToken request parameter set to the value of NextToken from the last
      # response.

      def describe_data_repository_associations(
        association_ids : Array(String)? = nil,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeDataRepositoryAssociationsResponse

        input = Types::DescribeDataRepositoryAssociationsRequest.new(association_ids: association_ids, filters: filters, max_results: max_results, next_token: next_token)
        describe_data_repository_associations(input)
      end

      def describe_data_repository_associations(input : Types::DescribeDataRepositoryAssociationsRequest) : Types::DescribeDataRepositoryAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATA_REPOSITORY_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDataRepositoryAssociationsResponse, "DescribeDataRepositoryAssociations")
      end

      # Returns the description of specific Amazon FSx for Lustre or Amazon File Cache data repository
      # tasks, if one or more TaskIds values are provided in the request, or if filters are used in the
      # request. You can use filters to narrow the response to include just tasks for specific file systems
      # or caches, or tasks in a specific lifecycle state. Otherwise, it returns all data repository tasks
      # owned by your Amazon Web Services account in the Amazon Web Services Region of the endpoint that
      # you're calling. When retrieving all tasks, you can paginate the response by using the optional
      # MaxResults parameter to limit the number of tasks returned in a response. If more tasks remain, a
      # NextToken value is returned in the response. In this case, send a later request with the NextToken
      # request parameter set to the value of NextToken from the last response.

      def describe_data_repository_tasks(
        filters : Array(Types::DataRepositoryTaskFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        task_ids : Array(String)? = nil
      ) : Types::DescribeDataRepositoryTasksResponse

        input = Types::DescribeDataRepositoryTasksRequest.new(filters: filters, max_results: max_results, next_token: next_token, task_ids: task_ids)
        describe_data_repository_tasks(input)
      end

      def describe_data_repository_tasks(input : Types::DescribeDataRepositoryTasksRequest) : Types::DescribeDataRepositoryTasksResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATA_REPOSITORY_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDataRepositoryTasksResponse, "DescribeDataRepositoryTasks")
      end

      # Returns the description of a specific Amazon File Cache resource, if a FileCacheIds value is
      # provided for that cache. Otherwise, it returns descriptions of all caches owned by your Amazon Web
      # Services account in the Amazon Web Services Region of the endpoint that you're calling. When
      # retrieving all cache descriptions, you can optionally specify the MaxResults parameter to limit the
      # number of descriptions in a response. If more cache descriptions remain, the operation returns a
      # NextToken value in the response. In this case, send a later request with the NextToken request
      # parameter set to the value of NextToken from the last response. This operation is used in an
      # iterative process to retrieve a list of your cache descriptions. DescribeFileCaches is called first
      # without a NextToken value. Then the operation continues to be called with the NextToken parameter
      # set to the value of the last NextToken value until a response has no NextToken . When using this
      # operation, keep the following in mind: The implementation might return fewer than MaxResults cache
      # descriptions while still including a NextToken value. The order of caches returned in the response
      # of one DescribeFileCaches call and the order of caches returned across the responses of a multicall
      # iteration is unspecified.

      def describe_file_caches(
        file_cache_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFileCachesResponse

        input = Types::DescribeFileCachesRequest.new(file_cache_ids: file_cache_ids, max_results: max_results, next_token: next_token)
        describe_file_caches(input)
      end

      def describe_file_caches(input : Types::DescribeFileCachesRequest) : Types::DescribeFileCachesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FILE_CACHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFileCachesResponse, "DescribeFileCaches")
      end

      # Returns the DNS aliases that are associated with the specified Amazon FSx for Windows File Server
      # file system. A history of all DNS aliases that have been associated with and disassociated from the
      # file system is available in the list of AdministrativeAction provided in the DescribeFileSystems
      # operation response.

      def describe_file_system_aliases(
        file_system_id : String,
        client_request_token : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFileSystemAliasesResponse

        input = Types::DescribeFileSystemAliasesRequest.new(file_system_id: file_system_id, client_request_token: client_request_token, max_results: max_results, next_token: next_token)
        describe_file_system_aliases(input)
      end

      def describe_file_system_aliases(input : Types::DescribeFileSystemAliasesRequest) : Types::DescribeFileSystemAliasesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FILE_SYSTEM_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFileSystemAliasesResponse, "DescribeFileSystemAliases")
      end

      # Returns the description of specific Amazon FSx file systems, if a FileSystemIds value is provided
      # for that file system. Otherwise, it returns descriptions of all file systems owned by your Amazon
      # Web Services account in the Amazon Web Services Region of the endpoint that you're calling. When
      # retrieving all file system descriptions, you can optionally specify the MaxResults parameter to
      # limit the number of descriptions in a response. If more file system descriptions remain, Amazon FSx
      # returns a NextToken value in the response. In this case, send a later request with the NextToken
      # request parameter set to the value of NextToken from the last response. This operation is used in an
      # iterative process to retrieve a list of your file system descriptions. DescribeFileSystems is called
      # first without a NextToken value. Then the operation continues to be called with the NextToken
      # parameter set to the value of the last NextToken value until a response has no NextToken . When
      # using this operation, keep the following in mind: The implementation might return fewer than
      # MaxResults file system descriptions while still including a NextToken value. The order of file
      # systems returned in the response of one DescribeFileSystems call and the order of file systems
      # returned across the responses of a multicall iteration is unspecified.

      def describe_file_systems(
        file_system_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFileSystemsResponse

        input = Types::DescribeFileSystemsRequest.new(file_system_ids: file_system_ids, max_results: max_results, next_token: next_token)
        describe_file_systems(input)
      end

      def describe_file_systems(input : Types::DescribeFileSystemsRequest) : Types::DescribeFileSystemsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FILE_SYSTEMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFileSystemsResponse, "DescribeFileSystems")
      end

      # Describes one or more S3 access points attached to Amazon FSx volumes. The requester requires the
      # following permission to perform this action: fsx:DescribeS3AccessPointAttachments

      def describe_s3_access_point_attachments(
        filters : Array(Types::S3AccessPointAttachmentsFilter)? = nil,
        max_results : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::DescribeS3AccessPointAttachmentsResponse

        input = Types::DescribeS3AccessPointAttachmentsRequest.new(filters: filters, max_results: max_results, names: names, next_token: next_token)
        describe_s3_access_point_attachments(input)
      end

      def describe_s3_access_point_attachments(input : Types::DescribeS3AccessPointAttachmentsRequest) : Types::DescribeS3AccessPointAttachmentsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_S3_ACCESS_POINT_ATTACHMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeS3AccessPointAttachmentsResponse, "DescribeS3AccessPointAttachments")
      end

      # Indicates whether participant accounts in your organization can create Amazon FSx for NetApp ONTAP
      # Multi-AZ file systems in subnets that are shared by a virtual private cloud (VPC) owner. For more
      # information, see Creating FSx for ONTAP file systems in shared subnets .

      def describe_shared_vpc_configuration : Types::DescribeSharedVpcConfigurationResponse
        input = Types::DescribeSharedVpcConfigurationRequest.new
        describe_shared_vpc_configuration(input)
      end

      def describe_shared_vpc_configuration(input : Types::DescribeSharedVpcConfigurationRequest) : Types::DescribeSharedVpcConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SHARED_VPC_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSharedVpcConfigurationResponse, "DescribeSharedVpcConfiguration")
      end

      # Returns the description of specific Amazon FSx for OpenZFS snapshots, if a SnapshotIds value is
      # provided. Otherwise, this operation returns all snapshots owned by your Amazon Web Services account
      # in the Amazon Web Services Region of the endpoint that you're calling. When retrieving all
      # snapshots, you can optionally specify the MaxResults parameter to limit the number of snapshots in a
      # response. If more backups remain, Amazon FSx returns a NextToken value in the response. In this
      # case, send a later request with the NextToken request parameter set to the value of NextToken from
      # the last response. Use this operation in an iterative process to retrieve a list of your snapshots.
      # DescribeSnapshots is called first without a NextToken value. Then the operation continues to be
      # called with the NextToken parameter set to the value of the last NextToken value until a response
      # has no NextToken value. When using this operation, keep the following in mind: The operation might
      # return fewer than the MaxResults value of snapshot descriptions while still including a NextToken
      # value. The order of snapshots returned in the response of one DescribeSnapshots call and the order
      # of backups returned across the responses of a multi-call iteration is unspecified.

      def describe_snapshots(
        filters : Array(Types::SnapshotFilter)? = nil,
        include_shared : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        snapshot_ids : Array(String)? = nil
      ) : Types::DescribeSnapshotsResponse

        input = Types::DescribeSnapshotsRequest.new(filters: filters, include_shared: include_shared, max_results: max_results, next_token: next_token, snapshot_ids: snapshot_ids)
        describe_snapshots(input)
      end

      def describe_snapshots(input : Types::DescribeSnapshotsRequest) : Types::DescribeSnapshotsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSnapshotsResponse, "DescribeSnapshots")
      end

      # Describes one or more Amazon FSx for NetApp ONTAP storage virtual machines (SVMs).

      def describe_storage_virtual_machines(
        filters : Array(Types::StorageVirtualMachineFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        storage_virtual_machine_ids : Array(String)? = nil
      ) : Types::DescribeStorageVirtualMachinesResponse

        input = Types::DescribeStorageVirtualMachinesRequest.new(filters: filters, max_results: max_results, next_token: next_token, storage_virtual_machine_ids: storage_virtual_machine_ids)
        describe_storage_virtual_machines(input)
      end

      def describe_storage_virtual_machines(input : Types::DescribeStorageVirtualMachinesRequest) : Types::DescribeStorageVirtualMachinesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STORAGE_VIRTUAL_MACHINES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStorageVirtualMachinesResponse, "DescribeStorageVirtualMachines")
      end

      # Describes one or more Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volumes.

      def describe_volumes(
        filters : Array(Types::VolumeFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        volume_ids : Array(String)? = nil
      ) : Types::DescribeVolumesResponse

        input = Types::DescribeVolumesRequest.new(filters: filters, max_results: max_results, next_token: next_token, volume_ids: volume_ids)
        describe_volumes(input)
      end

      def describe_volumes(input : Types::DescribeVolumesRequest) : Types::DescribeVolumesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VOLUMES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeVolumesResponse, "DescribeVolumes")
      end

      # Detaches an S3 access point from an Amazon FSx volume and deletes the S3 access point. The requester
      # requires the following permission to perform this action: fsx:DetachAndDeleteS3AccessPoint
      # s3:DeleteAccessPoint

      def detach_and_delete_s3_access_point(
        name : String,
        client_request_token : String? = nil
      ) : Types::DetachAndDeleteS3AccessPointResponse

        input = Types::DetachAndDeleteS3AccessPointRequest.new(name: name, client_request_token: client_request_token)
        detach_and_delete_s3_access_point(input)
      end

      def detach_and_delete_s3_access_point(input : Types::DetachAndDeleteS3AccessPointRequest) : Types::DetachAndDeleteS3AccessPointResponse
        request = Protocol::JsonRpc.build_request(Model::DETACH_AND_DELETE_S3_ACCESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachAndDeleteS3AccessPointResponse, "DetachAndDeleteS3AccessPoint")
      end

      # Use this action to disassociate, or remove, one or more Domain Name Service (DNS) aliases from an
      # Amazon FSx for Windows File Server file system. If you attempt to disassociate a DNS alias that is
      # not associated with the file system, Amazon FSx responds with an HTTP status code 400 (Bad Request).
      # For more information, see Working with DNS Aliases . The system generated response showing the DNS
      # aliases that Amazon FSx is attempting to disassociate from the file system. Use the API operation to
      # monitor the status of the aliases Amazon FSx is disassociating with the file system.

      def disassociate_file_system_aliases(
        aliases : Array(String),
        file_system_id : String,
        client_request_token : String? = nil
      ) : Types::DisassociateFileSystemAliasesResponse

        input = Types::DisassociateFileSystemAliasesRequest.new(aliases: aliases, file_system_id: file_system_id, client_request_token: client_request_token)
        disassociate_file_system_aliases(input)
      end

      def disassociate_file_system_aliases(input : Types::DisassociateFileSystemAliasesRequest) : Types::DisassociateFileSystemAliasesResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_FILE_SYSTEM_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateFileSystemAliasesResponse, "DisassociateFileSystemAliases")
      end

      # Lists tags for Amazon FSx resources. When retrieving all tags, you can optionally specify the
      # MaxResults parameter to limit the number of tags in a response. If more tags remain, Amazon FSx
      # returns a NextToken value in the response. In this case, send a later request with the NextToken
      # request parameter set to the value of NextToken from the last response. This action is used in an
      # iterative process to retrieve a list of your tags. ListTagsForResource is called first without a
      # NextToken value. Then the action continues to be called with the NextToken parameter set to the
      # value of the last NextToken value until a response has no NextToken . When using this action, keep
      # the following in mind: The implementation might return fewer than MaxResults file system
      # descriptions while still including a NextToken value. The order of tags returned in the response of
      # one ListTagsForResource call and the order of tags returned across the responses of a multi-call
      # iteration is unspecified.

      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Releases the file system lock from an Amazon FSx for OpenZFS file system.

      def release_file_system_nfs_v3_locks(
        file_system_id : String,
        client_request_token : String? = nil
      ) : Types::ReleaseFileSystemNfsV3LocksResponse

        input = Types::ReleaseFileSystemNfsV3LocksRequest.new(file_system_id: file_system_id, client_request_token: client_request_token)
        release_file_system_nfs_v3_locks(input)
      end

      def release_file_system_nfs_v3_locks(input : Types::ReleaseFileSystemNfsV3LocksRequest) : Types::ReleaseFileSystemNfsV3LocksResponse
        request = Protocol::JsonRpc.build_request(Model::RELEASE_FILE_SYSTEM_NFS_V3_LOCKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReleaseFileSystemNfsV3LocksResponse, "ReleaseFileSystemNfsV3Locks")
      end

      # Returns an Amazon FSx for OpenZFS volume to the state saved by the specified snapshot.

      def restore_volume_from_snapshot(
        snapshot_id : String,
        volume_id : String,
        client_request_token : String? = nil,
        options : Array(String)? = nil
      ) : Types::RestoreVolumeFromSnapshotResponse

        input = Types::RestoreVolumeFromSnapshotRequest.new(snapshot_id: snapshot_id, volume_id: volume_id, client_request_token: client_request_token, options: options)
        restore_volume_from_snapshot(input)
      end

      def restore_volume_from_snapshot(input : Types::RestoreVolumeFromSnapshotRequest) : Types::RestoreVolumeFromSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::RESTORE_VOLUME_FROM_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreVolumeFromSnapshotResponse, "RestoreVolumeFromSnapshot")
      end

      # After performing steps to repair the Active Directory configuration of an FSx for Windows File
      # Server file system, use this action to initiate the process of Amazon FSx attempting to reconnect to
      # the file system.

      def start_misconfigured_state_recovery(
        file_system_id : String,
        client_request_token : String? = nil
      ) : Types::StartMisconfiguredStateRecoveryResponse

        input = Types::StartMisconfiguredStateRecoveryRequest.new(file_system_id: file_system_id, client_request_token: client_request_token)
        start_misconfigured_state_recovery(input)
      end

      def start_misconfigured_state_recovery(input : Types::StartMisconfiguredStateRecoveryRequest) : Types::StartMisconfiguredStateRecoveryResponse
        request = Protocol::JsonRpc.build_request(Model::START_MISCONFIGURED_STATE_RECOVERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMisconfiguredStateRecoveryResponse, "StartMisconfiguredStateRecovery")
      end

      # Tags an Amazon FSx resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # This action removes a tag from an Amazon FSx resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates the configuration of an existing data repository association on an Amazon FSx for Lustre
      # file system. Data repository associations are supported on all FSx for Lustre 2.12 and 2.15 file
      # systems, excluding scratch_1 deployment type.

      def update_data_repository_association(
        association_id : String,
        client_request_token : String? = nil,
        imported_file_chunk_size : Int32? = nil,
        s3 : Types::S3DataRepositoryConfiguration? = nil
      ) : Types::UpdateDataRepositoryAssociationResponse

        input = Types::UpdateDataRepositoryAssociationRequest.new(association_id: association_id, client_request_token: client_request_token, imported_file_chunk_size: imported_file_chunk_size, s3: s3)
        update_data_repository_association(input)
      end

      def update_data_repository_association(input : Types::UpdateDataRepositoryAssociationRequest) : Types::UpdateDataRepositoryAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATA_REPOSITORY_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDataRepositoryAssociationResponse, "UpdateDataRepositoryAssociation")
      end

      # Updates the configuration of an existing Amazon File Cache resource. You can update multiple
      # properties in a single request.

      def update_file_cache(
        file_cache_id : String,
        client_request_token : String? = nil,
        lustre_configuration : Types::UpdateFileCacheLustreConfiguration? = nil
      ) : Types::UpdateFileCacheResponse

        input = Types::UpdateFileCacheRequest.new(file_cache_id: file_cache_id, client_request_token: client_request_token, lustre_configuration: lustre_configuration)
        update_file_cache(input)
      end

      def update_file_cache(input : Types::UpdateFileCacheRequest) : Types::UpdateFileCacheResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FILE_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFileCacheResponse, "UpdateFileCache")
      end

      # Use this operation to update the configuration of an existing Amazon FSx file system. You can update
      # multiple properties in a single request. For FSx for Windows File Server file systems, you can
      # update the following properties: AuditLogConfiguration AutomaticBackupRetentionDays
      # DailyAutomaticBackupStartTime DiskIopsConfiguration SelfManagedActiveDirectoryConfiguration
      # StorageCapacity StorageType ThroughputCapacity WeeklyMaintenanceStartTime For FSx for Lustre file
      # systems, you can update the following properties: AutoImportPolicy AutomaticBackupRetentionDays
      # DailyAutomaticBackupStartTime DataCompressionType FileSystemTypeVersion LogConfiguration
      # LustreReadCacheConfiguration LustreRootSquashConfiguration MetadataConfiguration
      # PerUnitStorageThroughput StorageCapacity ThroughputCapacity WeeklyMaintenanceStartTime For FSx for
      # ONTAP file systems, you can update the following properties: AddRouteTableIds
      # AutomaticBackupRetentionDays DailyAutomaticBackupStartTime DiskIopsConfiguration
      # EndpointIpv6AddressRange FsxAdminPassword HAPairs RemoveRouteTableIds StorageCapacity
      # ThroughputCapacity ThroughputCapacityPerHAPair WeeklyMaintenanceStartTime For FSx for OpenZFS file
      # systems, you can update the following properties: AddRouteTableIds AutomaticBackupRetentionDays
      # CopyTagsToBackups CopyTagsToVolumes DailyAutomaticBackupStartTime DiskIopsConfiguration
      # EndpointIpv6AddressRange ReadCacheConfiguration RemoveRouteTableIds StorageCapacity
      # ThroughputCapacity WeeklyMaintenanceStartTime

      def update_file_system(
        file_system_id : String,
        client_request_token : String? = nil,
        file_system_type_version : String? = nil,
        lustre_configuration : Types::UpdateFileSystemLustreConfiguration? = nil,
        network_type : String? = nil,
        ontap_configuration : Types::UpdateFileSystemOntapConfiguration? = nil,
        open_zfs_configuration : Types::UpdateFileSystemOpenZFSConfiguration? = nil,
        storage_capacity : Int32? = nil,
        storage_type : String? = nil,
        windows_configuration : Types::UpdateFileSystemWindowsConfiguration? = nil
      ) : Types::UpdateFileSystemResponse

        input = Types::UpdateFileSystemRequest.new(file_system_id: file_system_id, client_request_token: client_request_token, file_system_type_version: file_system_type_version, lustre_configuration: lustre_configuration, network_type: network_type, ontap_configuration: ontap_configuration, open_zfs_configuration: open_zfs_configuration, storage_capacity: storage_capacity, storage_type: storage_type, windows_configuration: windows_configuration)
        update_file_system(input)
      end

      def update_file_system(input : Types::UpdateFileSystemRequest) : Types::UpdateFileSystemResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FILE_SYSTEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFileSystemResponse, "UpdateFileSystem")
      end

      # Configures whether participant accounts in your organization can create Amazon FSx for NetApp ONTAP
      # Multi-AZ file systems in subnets that are shared by a virtual private cloud (VPC) owner. For more
      # information, see the Amazon FSx for NetApp ONTAP User Guide . We strongly recommend that
      # participant-created Multi-AZ file systems in the shared VPC are deleted before you disable this
      # feature. Once the feature is disabled, these file systems will enter a MISCONFIGURED state and
      # behave like Single-AZ file systems. For more information, see Important considerations before
      # disabling shared VPC support for Multi-AZ file systems .

      def update_shared_vpc_configuration(
        client_request_token : String? = nil,
        enable_fsx_route_table_updates_from_participant_accounts : String? = nil
      ) : Types::UpdateSharedVpcConfigurationResponse

        input = Types::UpdateSharedVpcConfigurationRequest.new(client_request_token: client_request_token, enable_fsx_route_table_updates_from_participant_accounts: enable_fsx_route_table_updates_from_participant_accounts)
        update_shared_vpc_configuration(input)
      end

      def update_shared_vpc_configuration(input : Types::UpdateSharedVpcConfigurationRequest) : Types::UpdateSharedVpcConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SHARED_VPC_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSharedVpcConfigurationResponse, "UpdateSharedVpcConfiguration")
      end

      # Updates the name of an Amazon FSx for OpenZFS snapshot.

      def update_snapshot(
        name : String,
        snapshot_id : String,
        client_request_token : String? = nil
      ) : Types::UpdateSnapshotResponse

        input = Types::UpdateSnapshotRequest.new(name: name, snapshot_id: snapshot_id, client_request_token: client_request_token)
        update_snapshot(input)
      end

      def update_snapshot(input : Types::UpdateSnapshotRequest) : Types::UpdateSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSnapshotResponse, "UpdateSnapshot")
      end

      # Updates an FSx for ONTAP storage virtual machine (SVM).

      def update_storage_virtual_machine(
        storage_virtual_machine_id : String,
        active_directory_configuration : Types::UpdateSvmActiveDirectoryConfiguration? = nil,
        client_request_token : String? = nil,
        svm_admin_password : String? = nil
      ) : Types::UpdateStorageVirtualMachineResponse

        input = Types::UpdateStorageVirtualMachineRequest.new(storage_virtual_machine_id: storage_virtual_machine_id, active_directory_configuration: active_directory_configuration, client_request_token: client_request_token, svm_admin_password: svm_admin_password)
        update_storage_virtual_machine(input)
      end

      def update_storage_virtual_machine(input : Types::UpdateStorageVirtualMachineRequest) : Types::UpdateStorageVirtualMachineResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STORAGE_VIRTUAL_MACHINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateStorageVirtualMachineResponse, "UpdateStorageVirtualMachine")
      end

      # Updates the configuration of an Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volume.

      def update_volume(
        volume_id : String,
        client_request_token : String? = nil,
        name : String? = nil,
        ontap_configuration : Types::UpdateOntapVolumeConfiguration? = nil,
        open_zfs_configuration : Types::UpdateOpenZFSVolumeConfiguration? = nil
      ) : Types::UpdateVolumeResponse

        input = Types::UpdateVolumeRequest.new(volume_id: volume_id, client_request_token: client_request_token, name: name, ontap_configuration: ontap_configuration, open_zfs_configuration: open_zfs_configuration)
        update_volume(input)
      end

      def update_volume(input : Types::UpdateVolumeRequest) : Types::UpdateVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateVolumeResponse, "UpdateVolume")
      end
    end
  end
end
