module AwsSdk
  module StorageGateway
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

      # Activates the gateway you previously deployed on your host. In the activation process, you specify
      # information such as the Amazon Web Services Region that you want to use for storing snapshots or
      # tapes, the time zone for scheduled snapshots the gateway snapshot schedule window, an activation
      # key, and a name for your gateway. The activation process also associates your gateway with your
      # account. For more information, see UpdateGatewayInformation . You must turn on the gateway VM before
      # you can activate your gateway.

      def activate_gateway(
        activation_key : String,
        gateway_name : String,
        gateway_region : String,
        gateway_timezone : String,
        gateway_type : String? = nil,
        medium_changer_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        tape_drive_type : String? = nil
      ) : Types::ActivateGatewayOutput

        input = Types::ActivateGatewayInput.new(activation_key: activation_key, gateway_name: gateway_name, gateway_region: gateway_region, gateway_timezone: gateway_timezone, gateway_type: gateway_type, medium_changer_type: medium_changer_type, tags: tags, tape_drive_type: tape_drive_type)
        activate_gateway(input)
      end

      def activate_gateway(input : Types::ActivateGatewayInput) : Types::ActivateGatewayOutput
        request = Protocol::JsonRpc.build_request(Model::ACTIVATE_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ActivateGatewayOutput, "ActivateGateway")
      end

      # Configures one or more gateway local disks as cache for a gateway. This operation is only supported
      # in the cached volume, tape, and file gateway type (see How Storage Gateway works (architecture) . In
      # the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add cache, and
      # one or more disk IDs that you want to configure as cache.

      def add_cache(
        disk_ids : Array(String),
        gateway_arn : String
      ) : Types::AddCacheOutput

        input = Types::AddCacheInput.new(disk_ids: disk_ids, gateway_arn: gateway_arn)
        add_cache(input)
      end

      def add_cache(input : Types::AddCacheInput) : Types::AddCacheOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddCacheOutput, "AddCache")
      end

      # Adds one or more tags to the specified resource. You use tags to add metadata to resources, which
      # you can use to categorize these resources. For example, you can categorize resources by purpose,
      # owner, environment, or team. Each tag consists of a key and a value, which you define. You can add
      # tags to the following Storage Gateway resources: Storage gateways of all types Storage volumes
      # Virtual tapes NFS and SMB file shares File System associations You can create a maximum of 50 tags
      # for each resource. Virtual tapes and storage volumes that are recovered to a new gateway maintain
      # their tags.

      def add_tags_to_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::AddTagsToResourceOutput

        input = Types::AddTagsToResourceInput.new(resource_arn: resource_arn, tags: tags)
        add_tags_to_resource(input)
      end

      def add_tags_to_resource(input : Types::AddTagsToResourceInput) : Types::AddTagsToResourceOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS_TO_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsToResourceOutput, "AddTagsToResource")
      end

      # Configures one or more gateway local disks as upload buffer for a specified gateway. This operation
      # is supported for the stored volume, cached volume, and tape gateway types. In the request, you
      # specify the gateway Amazon Resource Name (ARN) to which you want to add upload buffer, and one or
      # more disk IDs that you want to configure as upload buffer.

      def add_upload_buffer(
        disk_ids : Array(String),
        gateway_arn : String
      ) : Types::AddUploadBufferOutput

        input = Types::AddUploadBufferInput.new(disk_ids: disk_ids, gateway_arn: gateway_arn)
        add_upload_buffer(input)
      end

      def add_upload_buffer(input : Types::AddUploadBufferInput) : Types::AddUploadBufferOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_UPLOAD_BUFFER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddUploadBufferOutput, "AddUploadBuffer")
      end

      # Configures one or more gateway local disks as working storage for a gateway. This operation is only
      # supported in the stored volume gateway type. This operation is deprecated in cached volume API
      # version 20120630. Use AddUploadBuffer instead. Working storage is also referred to as upload buffer.
      # You can also use the AddUploadBuffer operation to add upload buffer to a stored volume gateway. In
      # the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add working
      # storage, and one or more disk IDs that you want to configure as working storage.

      def add_working_storage(
        disk_ids : Array(String),
        gateway_arn : String
      ) : Types::AddWorkingStorageOutput

        input = Types::AddWorkingStorageInput.new(disk_ids: disk_ids, gateway_arn: gateway_arn)
        add_working_storage(input)
      end

      def add_working_storage(input : Types::AddWorkingStorageInput) : Types::AddWorkingStorageOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_WORKING_STORAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddWorkingStorageOutput, "AddWorkingStorage")
      end

      # Assigns a tape to a tape pool for archiving. The tape assigned to a pool is archived in the S3
      # storage class that is associated with the pool. When you use your backup application to eject the
      # tape, the tape is archived directly into the S3 storage class (S3 Glacier or S3 Glacier Deep
      # Archive) that corresponds to the pool.

      def assign_tape_pool(
        pool_id : String,
        tape_arn : String,
        bypass_governance_retention : Bool? = nil
      ) : Types::AssignTapePoolOutput

        input = Types::AssignTapePoolInput.new(pool_id: pool_id, tape_arn: tape_arn, bypass_governance_retention: bypass_governance_retention)
        assign_tape_pool(input)
      end

      def assign_tape_pool(input : Types::AssignTapePoolInput) : Types::AssignTapePoolOutput
        request = Protocol::JsonRpc.build_request(Model::ASSIGN_TAPE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssignTapePoolOutput, "AssignTapePool")
      end

      # Associate an Amazon FSx file system with the FSx File Gateway. After the association process is
      # complete, the file shares on the Amazon FSx file system are available for access through the
      # gateway. This operation only supports the FSx File Gateway type.

      def associate_file_system(
        client_token : String,
        gateway_arn : String,
        location_arn : String,
        password : String,
        user_name : String,
        audit_destination_arn : String? = nil,
        cache_attributes : Types::CacheAttributes? = nil,
        endpoint_network_configuration : Types::EndpointNetworkConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::AssociateFileSystemOutput

        input = Types::AssociateFileSystemInput.new(client_token: client_token, gateway_arn: gateway_arn, location_arn: location_arn, password: password, user_name: user_name, audit_destination_arn: audit_destination_arn, cache_attributes: cache_attributes, endpoint_network_configuration: endpoint_network_configuration, tags: tags)
        associate_file_system(input)
      end

      def associate_file_system(input : Types::AssociateFileSystemInput) : Types::AssociateFileSystemOutput
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_FILE_SYSTEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateFileSystemOutput, "AssociateFileSystem")
      end

      # Connects a volume to an iSCSI connection and then attaches the volume to the specified gateway.
      # Detaching and attaching a volume enables you to recover your data from one gateway to a different
      # gateway without creating a snapshot. It also makes it easier to move your volumes from an
      # on-premises gateway to a gateway hosted on an Amazon EC2 instance.

      def attach_volume(
        gateway_arn : String,
        network_interface_id : String,
        volume_arn : String,
        disk_id : String? = nil,
        target_name : String? = nil
      ) : Types::AttachVolumeOutput

        input = Types::AttachVolumeInput.new(gateway_arn: gateway_arn, network_interface_id: network_interface_id, volume_arn: volume_arn, disk_id: disk_id, target_name: target_name)
        attach_volume(input)
      end

      def attach_volume(input : Types::AttachVolumeInput) : Types::AttachVolumeOutput
        request = Protocol::JsonRpc.build_request(Model::ATTACH_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachVolumeOutput, "AttachVolume")
      end

      # Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after the archiving process is
      # initiated. This operation is only supported in the tape gateway type.

      def cancel_archival(
        gateway_arn : String,
        tape_arn : String
      ) : Types::CancelArchivalOutput

        input = Types::CancelArchivalInput.new(gateway_arn: gateway_arn, tape_arn: tape_arn)
        cancel_archival(input)
      end

      def cancel_archival(input : Types::CancelArchivalInput) : Types::CancelArchivalOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_ARCHIVAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelArchivalOutput, "CancelArchival")
      end

      # Cancels generation of a specified cache report. You can use this operation to manually cancel an
      # IN-PROGRESS report for any reason. This action changes the report status from IN-PROGRESS to
      # CANCELLED. You can only cancel in-progress reports. If the the report you attempt to cancel is in
      # FAILED, ERROR, or COMPLETED state, the cancel operation returns an error.

      def cancel_cache_report(
        cache_report_arn : String
      ) : Types::CancelCacheReportOutput

        input = Types::CancelCacheReportInput.new(cache_report_arn: cache_report_arn)
        cancel_cache_report(input)
      end

      def cancel_cache_report(input : Types::CancelCacheReportInput) : Types::CancelCacheReportOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_CACHE_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelCacheReportOutput, "CancelCacheReport")
      end

      # Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a gateway after the
      # retrieval process is initiated. The virtual tape is returned to the VTS. This operation is only
      # supported in the tape gateway type.

      def cancel_retrieval(
        gateway_arn : String,
        tape_arn : String
      ) : Types::CancelRetrievalOutput

        input = Types::CancelRetrievalInput.new(gateway_arn: gateway_arn, tape_arn: tape_arn)
        cancel_retrieval(input)
      end

      def cancel_retrieval(input : Types::CancelRetrievalInput) : Types::CancelRetrievalOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_RETRIEVAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelRetrievalOutput, "CancelRetrieval")
      end

      # Creates a cached volume on a specified cached volume gateway. This operation is only supported in
      # the cached volume gateway type. Cache storage must be allocated to the gateway before you can create
      # a cached volume. Use the AddCache operation to add cache storage to a gateway. In the request, you
      # must specify the gateway, size of the volume in bytes, the iSCSI target name, an IP address on which
      # to expose the target, and a unique client token. In response, the gateway creates the volume and
      # returns information about it. This information includes the volume Amazon Resource Name (ARN), its
      # size, and the iSCSI target ARN that initiators can use to connect to the volume target. Optionally,
      # you can provide the ARN for an existing volume as the SourceVolumeARN for this cached volume, which
      # creates an exact copy of the existing volume’s latest recovery point. The VolumeSizeInBytes value
      # must be equal to or larger than the size of the copied volume, in bytes.

      def create_cachedi_scsi_volume(
        client_token : String,
        gateway_arn : String,
        network_interface_id : String,
        target_name : String,
        volume_size_in_bytes : Int64,
        kms_encrypted : Bool? = nil,
        kms_key : String? = nil,
        snapshot_id : String? = nil,
        source_volume_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCachediSCSIVolumeOutput

        input = Types::CreateCachediSCSIVolumeInput.new(client_token: client_token, gateway_arn: gateway_arn, network_interface_id: network_interface_id, target_name: target_name, volume_size_in_bytes: volume_size_in_bytes, kms_encrypted: kms_encrypted, kms_key: kms_key, snapshot_id: snapshot_id, source_volume_arn: source_volume_arn, tags: tags)
        create_cachedi_scsi_volume(input)
      end

      def create_cachedi_scsi_volume(input : Types::CreateCachediSCSIVolumeInput) : Types::CreateCachediSCSIVolumeOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CACHEDI_SCSI_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCachediSCSIVolumeOutput, "CreateCachediSCSIVolume")
      end

      # Creates a Network File System (NFS) file share on an existing S3 File Gateway. In Storage Gateway, a
      # file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway exposes
      # file shares using an NFS interface. This operation is only supported for S3 File Gateways. S3 File
      # gateway requires Security Token Service (Amazon Web Services STS) to be activated to enable you to
      # create a file share. Make sure Amazon Web Services STS is activated in the Amazon Web Services
      # Region you are creating your S3 File Gateway in. If Amazon Web Services STS is not activated in the
      # Amazon Web Services Region, activate it. For information about how to activate Amazon Web Services
      # STS, see Activating and deactivating Amazon Web Services STS in an Amazon Web Services Region in the
      # Identity and Access Management User Guide . S3 File Gateways do not support creating hard or
      # symbolic links on a file share.

      def create_nfs_file_share(
        client_token : String,
        gateway_arn : String,
        location_arn : String,
        role : String,
        audit_destination_arn : String? = nil,
        bucket_region : String? = nil,
        cache_attributes : Types::CacheAttributes? = nil,
        client_list : Array(String)? = nil,
        default_storage_class : String? = nil,
        encryption_type : String? = nil,
        file_share_name : String? = nil,
        guess_mime_type_enabled : Bool? = nil,
        kms_encrypted : Bool? = nil,
        kms_key : String? = nil,
        nfs_file_share_defaults : Types::NFSFileShareDefaults? = nil,
        notification_policy : String? = nil,
        object_acl : String? = nil,
        read_only : Bool? = nil,
        requester_pays : Bool? = nil,
        squash : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_endpoint_dns_name : String? = nil
      ) : Types::CreateNFSFileShareOutput

        input = Types::CreateNFSFileShareInput.new(client_token: client_token, gateway_arn: gateway_arn, location_arn: location_arn, role: role, audit_destination_arn: audit_destination_arn, bucket_region: bucket_region, cache_attributes: cache_attributes, client_list: client_list, default_storage_class: default_storage_class, encryption_type: encryption_type, file_share_name: file_share_name, guess_mime_type_enabled: guess_mime_type_enabled, kms_encrypted: kms_encrypted, kms_key: kms_key, nfs_file_share_defaults: nfs_file_share_defaults, notification_policy: notification_policy, object_acl: object_acl, read_only: read_only, requester_pays: requester_pays, squash: squash, tags: tags, vpc_endpoint_dns_name: vpc_endpoint_dns_name)
        create_nfs_file_share(input)
      end

      def create_nfs_file_share(input : Types::CreateNFSFileShareInput) : Types::CreateNFSFileShareOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_NFS_FILE_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateNFSFileShareOutput, "CreateNFSFileShare")
      end

      # Creates a Server Message Block (SMB) file share on an existing S3 File Gateway. In Storage Gateway,
      # a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway exposes
      # file shares using an SMB interface. This operation is only supported for S3 File Gateways. S3 File
      # Gateways require Security Token Service (Amazon Web Services STS) to be activated to enable you to
      # create a file share. Make sure that Amazon Web Services STS is activated in the Amazon Web Services
      # Region you are creating your S3 File Gateway in. If Amazon Web Services STS is not activated in this
      # Amazon Web Services Region, activate it. For information about how to activate Amazon Web Services
      # STS, see Activating and deactivating Amazon Web Services STS in an Amazon Web Services Region in the
      # Identity and Access Management User Guide . File gateways don't support creating hard or symbolic
      # links on a file share.

      def create_smb_file_share(
        client_token : String,
        gateway_arn : String,
        location_arn : String,
        role : String,
        access_based_enumeration : Bool? = nil,
        admin_user_list : Array(String)? = nil,
        audit_destination_arn : String? = nil,
        authentication : String? = nil,
        bucket_region : String? = nil,
        cache_attributes : Types::CacheAttributes? = nil,
        case_sensitivity : String? = nil,
        default_storage_class : String? = nil,
        encryption_type : String? = nil,
        file_share_name : String? = nil,
        guess_mime_type_enabled : Bool? = nil,
        invalid_user_list : Array(String)? = nil,
        kms_encrypted : Bool? = nil,
        kms_key : String? = nil,
        notification_policy : String? = nil,
        object_acl : String? = nil,
        oplocks_enabled : Bool? = nil,
        read_only : Bool? = nil,
        requester_pays : Bool? = nil,
        smbacl_enabled : Bool? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_endpoint_dns_name : String? = nil,
        valid_user_list : Array(String)? = nil
      ) : Types::CreateSMBFileShareOutput

        input = Types::CreateSMBFileShareInput.new(client_token: client_token, gateway_arn: gateway_arn, location_arn: location_arn, role: role, access_based_enumeration: access_based_enumeration, admin_user_list: admin_user_list, audit_destination_arn: audit_destination_arn, authentication: authentication, bucket_region: bucket_region, cache_attributes: cache_attributes, case_sensitivity: case_sensitivity, default_storage_class: default_storage_class, encryption_type: encryption_type, file_share_name: file_share_name, guess_mime_type_enabled: guess_mime_type_enabled, invalid_user_list: invalid_user_list, kms_encrypted: kms_encrypted, kms_key: kms_key, notification_policy: notification_policy, object_acl: object_acl, oplocks_enabled: oplocks_enabled, read_only: read_only, requester_pays: requester_pays, smbacl_enabled: smbacl_enabled, tags: tags, vpc_endpoint_dns_name: vpc_endpoint_dns_name, valid_user_list: valid_user_list)
        create_smb_file_share(input)
      end

      def create_smb_file_share(input : Types::CreateSMBFileShareInput) : Types::CreateSMBFileShareOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SMB_FILE_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSMBFileShareOutput, "CreateSMBFileShare")
      end

      # Initiates a snapshot of a volume. Storage Gateway provides the ability to back up point-in-time
      # snapshots of your data to Amazon Simple Storage (Amazon S3) for durable off-site recovery, and also
      # import the data to an Amazon Elastic Block Store (EBS) volume in Amazon Elastic Compute Cloud (EC2).
      # You can take snapshots of your gateway volume on a scheduled or ad hoc basis. This API enables you
      # to take an ad hoc snapshot. For more information, see Editing a snapshot schedule . In the
      # CreateSnapshot request, you identify the volume by providing its Amazon Resource Name (ARN). You
      # must also provide description for the snapshot. When Storage Gateway takes the snapshot of specified
      # volume, the snapshot and description appears in the Storage Gateway console. In response, Storage
      # Gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or
      # later use it when you want to create a volume from a snapshot. This operation is only supported in
      # stored and cached volume gateway type. To list or delete a snapshot, you must use the Amazon EC2
      # API. For more information, see DescribeSnapshots or DeleteSnapshot in the Amazon Elastic Compute
      # Cloud API Reference . Volume and snapshot IDs are changing to a longer length ID format. For more
      # information, see the important note on the Welcome page.

      def create_snapshot(
        snapshot_description : String,
        volume_arn : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSnapshotOutput

        input = Types::CreateSnapshotInput.new(snapshot_description: snapshot_description, volume_arn: volume_arn, tags: tags)
        create_snapshot(input)
      end

      def create_snapshot(input : Types::CreateSnapshotInput) : Types::CreateSnapshotOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSnapshotOutput, "CreateSnapshot")
      end

      # Initiates a snapshot of a gateway from a volume recovery point. This operation is only supported in
      # the cached volume gateway type. A volume recovery point is a point in time at which all data of the
      # volume is consistent and from which you can create a snapshot. To get a list of volume recovery
      # point for cached volume gateway, use ListVolumeRecoveryPoints . In the
      # CreateSnapshotFromVolumeRecoveryPoint request, you identify the volume by providing its Amazon
      # Resource Name (ARN). You must also provide a description for the snapshot. When the gateway takes a
      # snapshot of the specified volume, the snapshot and its description appear in the Storage Gateway
      # console. In response, the gateway returns you a snapshot ID. You can use this snapshot ID to check
      # the snapshot progress or later use it when you want to create a volume from a snapshot. To list or
      # delete a snapshot, you must use the Amazon EC2 API. For more information, see DescribeSnapshots or
      # DeleteSnapshot in the Amazon Elastic Compute Cloud API Reference .

      def create_snapshot_from_volume_recovery_point(
        snapshot_description : String,
        volume_arn : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSnapshotFromVolumeRecoveryPointOutput

        input = Types::CreateSnapshotFromVolumeRecoveryPointInput.new(snapshot_description: snapshot_description, volume_arn: volume_arn, tags: tags)
        create_snapshot_from_volume_recovery_point(input)
      end

      def create_snapshot_from_volume_recovery_point(input : Types::CreateSnapshotFromVolumeRecoveryPointInput) : Types::CreateSnapshotFromVolumeRecoveryPointOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SNAPSHOT_FROM_VOLUME_RECOVERY_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSnapshotFromVolumeRecoveryPointOutput, "CreateSnapshotFromVolumeRecoveryPoint")
      end

      # Creates a volume on a specified gateway. This operation is only supported in the stored volume
      # gateway type. The size of the volume to create is inferred from the disk size. You can choose to
      # preserve existing data on the disk, create volume from an existing snapshot, or create an empty
      # volume. If you choose to create an empty gateway volume, then any existing data on the disk is
      # erased. In the request, you must specify the gateway and the disk information on which you are
      # creating the volume. In response, the gateway creates the volume and returns volume information such
      # as the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use
      # to connect to the volume target.

      def create_storedi_scsi_volume(
        disk_id : String,
        gateway_arn : String,
        network_interface_id : String,
        preserve_existing_data : Bool,
        target_name : String,
        kms_encrypted : Bool? = nil,
        kms_key : String? = nil,
        snapshot_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateStorediSCSIVolumeOutput

        input = Types::CreateStorediSCSIVolumeInput.new(disk_id: disk_id, gateway_arn: gateway_arn, network_interface_id: network_interface_id, preserve_existing_data: preserve_existing_data, target_name: target_name, kms_encrypted: kms_encrypted, kms_key: kms_key, snapshot_id: snapshot_id, tags: tags)
        create_storedi_scsi_volume(input)
      end

      def create_storedi_scsi_volume(input : Types::CreateStorediSCSIVolumeInput) : Types::CreateStorediSCSIVolumeOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_STOREDI_SCSI_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStorediSCSIVolumeOutput, "CreateStorediSCSIVolume")
      end

      # Creates a new custom tape pool. You can use custom tape pool to enable tape retention lock on tapes
      # that are archived in the custom pool.

      def create_tape_pool(
        pool_name : String,
        storage_class : String,
        retention_lock_time_in_days : Int32? = nil,
        retention_lock_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTapePoolOutput

        input = Types::CreateTapePoolInput.new(pool_name: pool_name, storage_class: storage_class, retention_lock_time_in_days: retention_lock_time_in_days, retention_lock_type: retention_lock_type, tags: tags)
        create_tape_pool(input)
      end

      def create_tape_pool(input : Types::CreateTapePoolInput) : Types::CreateTapePoolOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_TAPE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTapePoolOutput, "CreateTapePool")
      end

      # Creates a virtual tape by using your own barcode. You write data to the virtual tape and then
      # archive the tape. A barcode is unique and cannot be reused if it has already been used on a tape.
      # This applies to barcodes used on deleted tapes. This operation is only supported in the tape gateway
      # type. Cache storage must be allocated to the gateway before you can create a virtual tape. Use the
      # AddCache operation to add cache storage to a gateway.

      def create_tape_with_barcode(
        gateway_arn : String,
        tape_barcode : String,
        tape_size_in_bytes : Int64,
        kms_encrypted : Bool? = nil,
        kms_key : String? = nil,
        pool_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        worm : Bool? = nil
      ) : Types::CreateTapeWithBarcodeOutput

        input = Types::CreateTapeWithBarcodeInput.new(gateway_arn: gateway_arn, tape_barcode: tape_barcode, tape_size_in_bytes: tape_size_in_bytes, kms_encrypted: kms_encrypted, kms_key: kms_key, pool_id: pool_id, tags: tags, worm: worm)
        create_tape_with_barcode(input)
      end

      def create_tape_with_barcode(input : Types::CreateTapeWithBarcodeInput) : Types::CreateTapeWithBarcodeOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_TAPE_WITH_BARCODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTapeWithBarcodeOutput, "CreateTapeWithBarcode")
      end

      # Creates one or more virtual tapes. You write data to the virtual tapes and then archive the tapes.
      # This operation is only supported in the tape gateway type. Cache storage must be allocated to the
      # gateway before you can create virtual tapes. Use the AddCache operation to add cache storage to a
      # gateway.

      def create_tapes(
        client_token : String,
        gateway_arn : String,
        num_tapes_to_create : Int32,
        tape_barcode_prefix : String,
        tape_size_in_bytes : Int64,
        kms_encrypted : Bool? = nil,
        kms_key : String? = nil,
        pool_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        worm : Bool? = nil
      ) : Types::CreateTapesOutput

        input = Types::CreateTapesInput.new(client_token: client_token, gateway_arn: gateway_arn, num_tapes_to_create: num_tapes_to_create, tape_barcode_prefix: tape_barcode_prefix, tape_size_in_bytes: tape_size_in_bytes, kms_encrypted: kms_encrypted, kms_key: kms_key, pool_id: pool_id, tags: tags, worm: worm)
        create_tapes(input)
      end

      def create_tapes(input : Types::CreateTapesInput) : Types::CreateTapesOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_TAPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTapesOutput, "CreateTapes")
      end

      # Deletes the automatic tape creation policy of a gateway. If you delete this policy, new virtual
      # tapes must be created manually. Use the Amazon Resource Name (ARN) of the gateway in your request to
      # remove the policy.

      def delete_automatic_tape_creation_policy(
        gateway_arn : String
      ) : Types::DeleteAutomaticTapeCreationPolicyOutput

        input = Types::DeleteAutomaticTapeCreationPolicyInput.new(gateway_arn: gateway_arn)
        delete_automatic_tape_creation_policy(input)
      end

      def delete_automatic_tape_creation_policy(input : Types::DeleteAutomaticTapeCreationPolicyInput) : Types::DeleteAutomaticTapeCreationPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_AUTOMATIC_TAPE_CREATION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAutomaticTapeCreationPolicyOutput, "DeleteAutomaticTapeCreationPolicy")
      end

      # Deletes the bandwidth rate limits of a gateway. You can delete either the upload and download
      # bandwidth rate limit, or you can delete both. If you delete only one of the limits, the other limit
      # remains unchanged. To specify which gateway to work with, use the Amazon Resource Name (ARN) of the
      # gateway in your request. This operation is supported only for the stored volume, cached volume, and
      # tape gateway types.

      def delete_bandwidth_rate_limit(
        bandwidth_type : String,
        gateway_arn : String
      ) : Types::DeleteBandwidthRateLimitOutput

        input = Types::DeleteBandwidthRateLimitInput.new(bandwidth_type: bandwidth_type, gateway_arn: gateway_arn)
        delete_bandwidth_rate_limit(input)
      end

      def delete_bandwidth_rate_limit(input : Types::DeleteBandwidthRateLimitInput) : Types::DeleteBandwidthRateLimitOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_BANDWIDTH_RATE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBandwidthRateLimitOutput, "DeleteBandwidthRateLimit")
      end

      # Deletes the specified cache report and any associated tags from the Storage Gateway database. You
      # can only delete completed reports. If the status of the report you attempt to delete still
      # IN-PROGRESS, the delete operation returns an error. You can use CancelCacheReport to cancel an
      # IN-PROGRESS report. DeleteCacheReport does not delete the report object from your Amazon S3 bucket.

      def delete_cache_report(
        cache_report_arn : String
      ) : Types::DeleteCacheReportOutput

        input = Types::DeleteCacheReportInput.new(cache_report_arn: cache_report_arn)
        delete_cache_report(input)
      end

      def delete_cache_report(input : Types::DeleteCacheReportInput) : Types::DeleteCacheReportOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CACHE_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCacheReportOutput, "DeleteCacheReport")
      end

      # Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target
      # and initiator pair. This operation is supported in volume and tape gateway types.

      def delete_chap_credentials(
        initiator_name : String,
        target_arn : String
      ) : Types::DeleteChapCredentialsOutput

        input = Types::DeleteChapCredentialsInput.new(initiator_name: initiator_name, target_arn: target_arn)
        delete_chap_credentials(input)
      end

      def delete_chap_credentials(input : Types::DeleteChapCredentialsInput) : Types::DeleteChapCredentialsOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CHAP_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteChapCredentialsOutput, "DeleteChapCredentials")
      end

      # Deletes a file share from an S3 File Gateway. This operation is only supported for S3 File Gateways.

      def delete_file_share(
        file_share_arn : String,
        force_delete : Bool? = nil
      ) : Types::DeleteFileShareOutput

        input = Types::DeleteFileShareInput.new(file_share_arn: file_share_arn, force_delete: force_delete)
        delete_file_share(input)
      end

      def delete_file_share(input : Types::DeleteFileShareInput) : Types::DeleteFileShareOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_FILE_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFileShareOutput, "DeleteFileShare")
      end

      # Deletes a gateway. To specify which gateway to delete, use the Amazon Resource Name (ARN) of the
      # gateway in your request. The operation deletes the gateway; however, it does not delete the gateway
      # virtual machine (VM) from your host computer. After you delete a gateway, you cannot reactivate it.
      # Completed snapshots of the gateway volumes are not deleted upon deleting the gateway, however,
      # pending snapshots will not complete. After you delete a gateway, your next step is to remove it from
      # your environment. You no longer pay software charges after the gateway is deleted; however, your
      # existing Amazon EBS snapshots persist and you will continue to be billed for these snapshots. You
      # can choose to remove all remaining Amazon EBS snapshots by canceling your Amazon EC2 subscription.
      # If you prefer not to cancel your Amazon EC2 subscription, you can delete your snapshots using the
      # Amazon EC2 console. For more information, see the Storage Gateway detail page .

      def delete_gateway(
        gateway_arn : String
      ) : Types::DeleteGatewayOutput

        input = Types::DeleteGatewayInput.new(gateway_arn: gateway_arn)
        delete_gateway(input)
      end

      def delete_gateway(input : Types::DeleteGatewayInput) : Types::DeleteGatewayOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGatewayOutput, "DeleteGateway")
      end

      # Deletes a snapshot of a volume. You can take snapshots of your gateway volumes on a scheduled or ad
      # hoc basis. This API action enables you to delete a snapshot schedule for a volume. For more
      # information, see Backing up your volumes . In the DeleteSnapshotSchedule request, you identify the
      # volume by providing its Amazon Resource Name (ARN). This operation is only supported for cached
      # volume gateway types. To list or delete a snapshot, you must use the Amazon EC2 API. For more
      # information, go to DescribeSnapshots in the Amazon Elastic Compute Cloud API Reference .

      def delete_snapshot_schedule(
        volume_arn : String
      ) : Types::DeleteSnapshotScheduleOutput

        input = Types::DeleteSnapshotScheduleInput.new(volume_arn: volume_arn)
        delete_snapshot_schedule(input)
      end

      def delete_snapshot_schedule(input : Types::DeleteSnapshotScheduleInput) : Types::DeleteSnapshotScheduleOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_SNAPSHOT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSnapshotScheduleOutput, "DeleteSnapshotSchedule")
      end

      # Deletes the specified virtual tape. This operation is only supported in the tape gateway type.

      def delete_tape(
        gateway_arn : String,
        tape_arn : String,
        bypass_governance_retention : Bool? = nil
      ) : Types::DeleteTapeOutput

        input = Types::DeleteTapeInput.new(gateway_arn: gateway_arn, tape_arn: tape_arn, bypass_governance_retention: bypass_governance_retention)
        delete_tape(input)
      end

      def delete_tape(input : Types::DeleteTapeInput) : Types::DeleteTapeOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_TAPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTapeOutput, "DeleteTape")
      end

      # Deletes the specified virtual tape from the virtual tape shelf (VTS). This operation is only
      # supported in the tape gateway type.

      def delete_tape_archive(
        tape_arn : String,
        bypass_governance_retention : Bool? = nil
      ) : Types::DeleteTapeArchiveOutput

        input = Types::DeleteTapeArchiveInput.new(tape_arn: tape_arn, bypass_governance_retention: bypass_governance_retention)
        delete_tape_archive(input)
      end

      def delete_tape_archive(input : Types::DeleteTapeArchiveInput) : Types::DeleteTapeArchiveOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_TAPE_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTapeArchiveOutput, "DeleteTapeArchive")
      end

      # Delete a custom tape pool. A custom tape pool can only be deleted if there are no tapes in the pool
      # and if there are no automatic tape creation policies that reference the custom tape pool.

      def delete_tape_pool(
        pool_arn : String
      ) : Types::DeleteTapePoolOutput

        input = Types::DeleteTapePoolInput.new(pool_arn: pool_arn)
        delete_tape_pool(input)
      end

      def delete_tape_pool(input : Types::DeleteTapePoolInput) : Types::DeleteTapePoolOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_TAPE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTapePoolOutput, "DeleteTapePool")
      end

      # Deletes the specified storage volume that you previously created using the CreateCachediSCSIVolume
      # or CreateStorediSCSIVolume API. This operation is only supported in the cached volume and stored
      # volume types. For stored volume gateways, the local disk that was configured as the storage volume
      # is not deleted. You can reuse the local disk to create another storage volume. Before you delete a
      # volume, make sure there are no iSCSI connections to the volume you are deleting. You should also
      # make sure there is no snapshot in progress. You can use the Amazon Elastic Compute Cloud (Amazon
      # EC2) API to query snapshots on the volume you are deleting and check the snapshot status. For more
      # information, go to DescribeSnapshots in the Amazon Elastic Compute Cloud API Reference . In the
      # request, you must provide the Amazon Resource Name (ARN) of the storage volume you want to delete.

      def delete_volume(
        volume_arn : String
      ) : Types::DeleteVolumeOutput

        input = Types::DeleteVolumeInput.new(volume_arn: volume_arn)
        delete_volume(input)
      end

      def delete_volume(input : Types::DeleteVolumeInput) : Types::DeleteVolumeOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVolumeOutput, "DeleteVolume")
      end

      # Returns information about the most recent high availability monitoring test that was performed on
      # the host in a cluster. If a test isn't performed, the status and start time in the response would be
      # null.

      def describe_availability_monitor_test(
        gateway_arn : String
      ) : Types::DescribeAvailabilityMonitorTestOutput

        input = Types::DescribeAvailabilityMonitorTestInput.new(gateway_arn: gateway_arn)
        describe_availability_monitor_test(input)
      end

      def describe_availability_monitor_test(input : Types::DescribeAvailabilityMonitorTestInput) : Types::DescribeAvailabilityMonitorTestOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AVAILABILITY_MONITOR_TEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAvailabilityMonitorTestOutput, "DescribeAvailabilityMonitorTest")
      end

      # Returns the bandwidth rate limits of a gateway. By default, these limits are not set, which means no
      # bandwidth rate limiting is in effect. This operation is supported only for the stored volume, cached
      # volume, and tape gateway types. To describe bandwidth rate limits for S3 file gateways, use
      # DescribeBandwidthRateLimitSchedule . This operation returns a value for a bandwidth rate limit only
      # if the limit is set. If no limits are set for the gateway, then this operation returns only the
      # gateway ARN in the response body. To specify which gateway to describe, use the Amazon Resource Name
      # (ARN) of the gateway in your request.

      def describe_bandwidth_rate_limit(
        gateway_arn : String
      ) : Types::DescribeBandwidthRateLimitOutput

        input = Types::DescribeBandwidthRateLimitInput.new(gateway_arn: gateway_arn)
        describe_bandwidth_rate_limit(input)
      end

      def describe_bandwidth_rate_limit(input : Types::DescribeBandwidthRateLimitInput) : Types::DescribeBandwidthRateLimitOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BANDWIDTH_RATE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBandwidthRateLimitOutput, "DescribeBandwidthRateLimit")
      end

      # Returns information about the bandwidth rate limit schedule of a gateway. By default, gateways do
      # not have bandwidth rate limit schedules, which means no bandwidth rate limiting is in effect. This
      # operation is supported only for volume, tape and S3 file gateways. FSx file gateways do not support
      # bandwidth rate limits. This operation returns information about a gateway's bandwidth rate limit
      # schedule. A bandwidth rate limit schedule consists of one or more bandwidth rate limit intervals. A
      # bandwidth rate limit interval defines a period of time on one or more days of the week, during which
      # bandwidth rate limits are specified for uploading, downloading, or both. A bandwidth rate limit
      # interval consists of one or more days of the week, a start hour and minute, an ending hour and
      # minute, and bandwidth rate limits for uploading and downloading If no bandwidth rate limit schedule
      # intervals are set for the gateway, this operation returns an empty response. To specify which
      # gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.

      def describe_bandwidth_rate_limit_schedule(
        gateway_arn : String
      ) : Types::DescribeBandwidthRateLimitScheduleOutput

        input = Types::DescribeBandwidthRateLimitScheduleInput.new(gateway_arn: gateway_arn)
        describe_bandwidth_rate_limit_schedule(input)
      end

      def describe_bandwidth_rate_limit_schedule(input : Types::DescribeBandwidthRateLimitScheduleInput) : Types::DescribeBandwidthRateLimitScheduleOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BANDWIDTH_RATE_LIMIT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBandwidthRateLimitScheduleOutput, "DescribeBandwidthRateLimitSchedule")
      end

      # Returns information about the cache of a gateway. This operation is only supported in the cached
      # volume, tape, and file gateway types. The response includes disk IDs that are configured as cache,
      # and it includes the amount of cache allocated and used.

      def describe_cache(
        gateway_arn : String
      ) : Types::DescribeCacheOutput

        input = Types::DescribeCacheInput.new(gateway_arn: gateway_arn)
        describe_cache(input)
      end

      def describe_cache(input : Types::DescribeCacheInput) : Types::DescribeCacheOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCacheOutput, "DescribeCache")
      end

      # Returns information about the specified cache report, including completion status and generation
      # progress.

      def describe_cache_report(
        cache_report_arn : String
      ) : Types::DescribeCacheReportOutput

        input = Types::DescribeCacheReportInput.new(cache_report_arn: cache_report_arn)
        describe_cache_report(input)
      end

      def describe_cache_report(input : Types::DescribeCacheReportInput) : Types::DescribeCacheReportOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CACHE_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCacheReportOutput, "DescribeCacheReport")
      end

      # Returns a description of the gateway volumes specified in the request. This operation is only
      # supported in the cached volume gateway types. The list of gateway volumes in the request must be
      # from one gateway. In the response, Storage Gateway returns volume information sorted by volume
      # Amazon Resource Name (ARN).

      def describe_cachedi_scsi_volumes(
        volume_ar_ns : Array(String)
      ) : Types::DescribeCachediSCSIVolumesOutput

        input = Types::DescribeCachediSCSIVolumesInput.new(volume_ar_ns: volume_ar_ns)
        describe_cachedi_scsi_volumes(input)
      end

      def describe_cachedi_scsi_volumes(input : Types::DescribeCachediSCSIVolumesInput) : Types::DescribeCachediSCSIVolumesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CACHEDI_SCSI_VOLUMES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCachediSCSIVolumesOutput, "DescribeCachediSCSIVolumes")
      end

      # Returns an array of Challenge-Handshake Authentication Protocol (CHAP) credentials information for a
      # specified iSCSI target, one for each target-initiator pair. This operation is supported in the
      # volume and tape gateway types.

      def describe_chap_credentials(
        target_arn : String
      ) : Types::DescribeChapCredentialsOutput

        input = Types::DescribeChapCredentialsInput.new(target_arn: target_arn)
        describe_chap_credentials(input)
      end

      def describe_chap_credentials(input : Types::DescribeChapCredentialsInput) : Types::DescribeChapCredentialsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CHAP_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeChapCredentialsOutput, "DescribeChapCredentials")
      end

      # Gets the file system association information. This operation is only supported for FSx File
      # Gateways.

      def describe_file_system_associations(
        file_system_association_arn_list : Array(String)
      ) : Types::DescribeFileSystemAssociationsOutput

        input = Types::DescribeFileSystemAssociationsInput.new(file_system_association_arn_list: file_system_association_arn_list)
        describe_file_system_associations(input)
      end

      def describe_file_system_associations(input : Types::DescribeFileSystemAssociationsInput) : Types::DescribeFileSystemAssociationsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FILE_SYSTEM_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFileSystemAssociationsOutput, "DescribeFileSystemAssociations")
      end

      # Returns metadata about a gateway such as its name, network interfaces, time zone, status, and
      # software version. To specify which gateway to describe, use the Amazon Resource Name (ARN) of the
      # gateway in your request.

      def describe_gateway_information(
        gateway_arn : String
      ) : Types::DescribeGatewayInformationOutput

        input = Types::DescribeGatewayInformationInput.new(gateway_arn: gateway_arn)
        describe_gateway_information(input)
      end

      def describe_gateway_information(input : Types::DescribeGatewayInformationInput) : Types::DescribeGatewayInformationOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GATEWAY_INFORMATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGatewayInformationOutput, "DescribeGatewayInformation")
      end

      # Returns your gateway's maintenance window schedule information, with values for monthly or weekly
      # cadence, specific day and time to begin maintenance, and which types of updates to apply. Time
      # values returned are for the gateway's time zone.

      def describe_maintenance_start_time(
        gateway_arn : String
      ) : Types::DescribeMaintenanceStartTimeOutput

        input = Types::DescribeMaintenanceStartTimeInput.new(gateway_arn: gateway_arn)
        describe_maintenance_start_time(input)
      end

      def describe_maintenance_start_time(input : Types::DescribeMaintenanceStartTimeInput) : Types::DescribeMaintenanceStartTimeOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAINTENANCE_START_TIME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMaintenanceStartTimeOutput, "DescribeMaintenanceStartTime")
      end

      # Gets a description for one or more Network File System (NFS) file shares from an S3 File Gateway.
      # This operation is only supported for S3 File Gateways.

      def describe_nfs_file_shares(
        file_share_arn_list : Array(String)
      ) : Types::DescribeNFSFileSharesOutput

        input = Types::DescribeNFSFileSharesInput.new(file_share_arn_list: file_share_arn_list)
        describe_nfs_file_shares(input)
      end

      def describe_nfs_file_shares(input : Types::DescribeNFSFileSharesInput) : Types::DescribeNFSFileSharesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_NFS_FILE_SHARES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeNFSFileSharesOutput, "DescribeNFSFileShares")
      end

      # Gets a description for one or more Server Message Block (SMB) file shares from a S3 File Gateway.
      # This operation is only supported for S3 File Gateways.

      def describe_smb_file_shares(
        file_share_arn_list : Array(String)
      ) : Types::DescribeSMBFileSharesOutput

        input = Types::DescribeSMBFileSharesInput.new(file_share_arn_list: file_share_arn_list)
        describe_smb_file_shares(input)
      end

      def describe_smb_file_shares(input : Types::DescribeSMBFileSharesInput) : Types::DescribeSMBFileSharesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SMB_FILE_SHARES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSMBFileSharesOutput, "DescribeSMBFileShares")
      end

      # Gets a description of a Server Message Block (SMB) file share settings from a file gateway. This
      # operation is only supported for file gateways.

      def describe_smb_settings(
        gateway_arn : String
      ) : Types::DescribeSMBSettingsOutput

        input = Types::DescribeSMBSettingsInput.new(gateway_arn: gateway_arn)
        describe_smb_settings(input)
      end

      def describe_smb_settings(input : Types::DescribeSMBSettingsInput) : Types::DescribeSMBSettingsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SMB_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSMBSettingsOutput, "DescribeSMBSettings")
      end

      # Describes the snapshot schedule for the specified gateway volume. The snapshot schedule information
      # includes intervals at which snapshots are automatically initiated on the volume. This operation is
      # only supported in the cached volume and stored volume types.

      def describe_snapshot_schedule(
        volume_arn : String
      ) : Types::DescribeSnapshotScheduleOutput

        input = Types::DescribeSnapshotScheduleInput.new(volume_arn: volume_arn)
        describe_snapshot_schedule(input)
      end

      def describe_snapshot_schedule(input : Types::DescribeSnapshotScheduleInput) : Types::DescribeSnapshotScheduleOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SNAPSHOT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSnapshotScheduleOutput, "DescribeSnapshotSchedule")
      end

      # Returns the description of the gateway volumes specified in the request. The list of gateway volumes
      # in the request must be from one gateway. In the response, Storage Gateway returns volume information
      # sorted by volume ARNs. This operation is only supported in stored volume gateway type.

      def describe_storedi_scsi_volumes(
        volume_ar_ns : Array(String)
      ) : Types::DescribeStorediSCSIVolumesOutput

        input = Types::DescribeStorediSCSIVolumesInput.new(volume_ar_ns: volume_ar_ns)
        describe_storedi_scsi_volumes(input)
      end

      def describe_storedi_scsi_volumes(input : Types::DescribeStorediSCSIVolumesInput) : Types::DescribeStorediSCSIVolumesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STOREDI_SCSI_VOLUMES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStorediSCSIVolumesOutput, "DescribeStorediSCSIVolumes")
      end

      # Returns a description of specified virtual tapes in the virtual tape shelf (VTS). This operation is
      # only supported in the tape gateway type. If a specific TapeARN is not specified, Storage Gateway
      # returns a description of all virtual tapes found in the VTS associated with your account.

      def describe_tape_archives(
        limit : Int32? = nil,
        marker : String? = nil,
        tape_ar_ns : Array(String)? = nil
      ) : Types::DescribeTapeArchivesOutput

        input = Types::DescribeTapeArchivesInput.new(limit: limit, marker: marker, tape_ar_ns: tape_ar_ns)
        describe_tape_archives(input)
      end

      def describe_tape_archives(input : Types::DescribeTapeArchivesInput) : Types::DescribeTapeArchivesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TAPE_ARCHIVES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTapeArchivesOutput, "DescribeTapeArchives")
      end

      # Returns a list of virtual tape recovery points that are available for the specified tape gateway. A
      # recovery point is a point-in-time view of a virtual tape at which all the data on the virtual tape
      # is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to
      # a new gateway. This operation is only supported in the tape gateway type.

      def describe_tape_recovery_points(
        gateway_arn : String,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Types::DescribeTapeRecoveryPointsOutput

        input = Types::DescribeTapeRecoveryPointsInput.new(gateway_arn: gateway_arn, limit: limit, marker: marker)
        describe_tape_recovery_points(input)
      end

      def describe_tape_recovery_points(input : Types::DescribeTapeRecoveryPointsInput) : Types::DescribeTapeRecoveryPointsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TAPE_RECOVERY_POINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTapeRecoveryPointsOutput, "DescribeTapeRecoveryPoints")
      end

      # Returns a description of virtual tapes that correspond to the specified Amazon Resource Names
      # (ARNs). If TapeARN is not specified, returns a description of the virtual tapes associated with the
      # specified gateway. This operation is only supported for the tape gateway type. The operation
      # supports pagination. By default, the operation returns a maximum of up to 100 tapes. You can
      # optionally specify the Limit field in the body to limit the number of tapes in the response. If the
      # number of tapes returned in the response is truncated, the response includes a Marker field. You can
      # use this Marker value in your subsequent request to retrieve the next set of tapes.

      def describe_tapes(
        gateway_arn : String,
        limit : Int32? = nil,
        marker : String? = nil,
        tape_ar_ns : Array(String)? = nil
      ) : Types::DescribeTapesOutput

        input = Types::DescribeTapesInput.new(gateway_arn: gateway_arn, limit: limit, marker: marker, tape_ar_ns: tape_ar_ns)
        describe_tapes(input)
      end

      def describe_tapes(input : Types::DescribeTapesInput) : Types::DescribeTapesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TAPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTapesOutput, "DescribeTapes")
      end

      # Returns information about the upload buffer of a gateway. This operation is supported for the stored
      # volume, cached volume, and tape gateway types. The response includes disk IDs that are configured as
      # upload buffer space, and it includes the amount of upload buffer space allocated and used.

      def describe_upload_buffer(
        gateway_arn : String
      ) : Types::DescribeUploadBufferOutput

        input = Types::DescribeUploadBufferInput.new(gateway_arn: gateway_arn)
        describe_upload_buffer(input)
      end

      def describe_upload_buffer(input : Types::DescribeUploadBufferInput) : Types::DescribeUploadBufferOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_UPLOAD_BUFFER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUploadBufferOutput, "DescribeUploadBuffer")
      end

      # Returns a description of virtual tape library (VTL) devices for the specified tape gateway. In the
      # response, Storage Gateway returns VTL device information. This operation is only supported in the
      # tape gateway type.

      def describe_vtl_devices(
        gateway_arn : String,
        limit : Int32? = nil,
        marker : String? = nil,
        vtl_device_ar_ns : Array(String)? = nil
      ) : Types::DescribeVTLDevicesOutput

        input = Types::DescribeVTLDevicesInput.new(gateway_arn: gateway_arn, limit: limit, marker: marker, vtl_device_ar_ns: vtl_device_ar_ns)
        describe_vtl_devices(input)
      end

      def describe_vtl_devices(input : Types::DescribeVTLDevicesInput) : Types::DescribeVTLDevicesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VTL_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeVTLDevicesOutput, "DescribeVTLDevices")
      end

      # Returns information about the working storage of a gateway. This operation is only supported in the
      # stored volumes gateway type. This operation is deprecated in cached volumes API version (20120630).
      # Use DescribeUploadBuffer instead. Working storage is also referred to as upload buffer. You can also
      # use the DescribeUploadBuffer operation to add upload buffer to a stored volume gateway. The response
      # includes disk IDs that are configured as working storage, and it includes the amount of working
      # storage allocated and used.

      def describe_working_storage(
        gateway_arn : String
      ) : Types::DescribeWorkingStorageOutput

        input = Types::DescribeWorkingStorageInput.new(gateway_arn: gateway_arn)
        describe_working_storage(input)
      end

      def describe_working_storage(input : Types::DescribeWorkingStorageInput) : Types::DescribeWorkingStorageOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKING_STORAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkingStorageOutput, "DescribeWorkingStorage")
      end

      # Disconnects a volume from an iSCSI connection and then detaches the volume from the specified
      # gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a
      # different gateway without creating a snapshot. It also makes it easier to move your volumes from an
      # on-premises gateway to a gateway hosted on an Amazon EC2 instance. This operation is only supported
      # in the volume gateway type.

      def detach_volume(
        volume_arn : String,
        force_detach : Bool? = nil
      ) : Types::DetachVolumeOutput

        input = Types::DetachVolumeInput.new(volume_arn: volume_arn, force_detach: force_detach)
        detach_volume(input)
      end

      def detach_volume(input : Types::DetachVolumeInput) : Types::DetachVolumeOutput
        request = Protocol::JsonRpc.build_request(Model::DETACH_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachVolumeOutput, "DetachVolume")
      end

      # Disables a tape gateway when the gateway is no longer functioning. For example, if your gateway VM
      # is damaged, you can disable the gateway so you can recover virtual tapes. Use this operation for a
      # tape gateway that is not reachable or not functioning. This operation is only supported in the tape
      # gateway type. After a gateway is disabled, it cannot be enabled.

      def disable_gateway(
        gateway_arn : String
      ) : Types::DisableGatewayOutput

        input = Types::DisableGatewayInput.new(gateway_arn: gateway_arn)
        disable_gateway(input)
      end

      def disable_gateway(input : Types::DisableGatewayInput) : Types::DisableGatewayOutput
        request = Protocol::JsonRpc.build_request(Model::DISABLE_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableGatewayOutput, "DisableGateway")
      end

      # Disassociates an Amazon FSx file system from the specified gateway. After the disassociation process
      # finishes, the gateway can no longer access the Amazon FSx file system. This operation is only
      # supported in the FSx File Gateway type.

      def disassociate_file_system(
        file_system_association_arn : String,
        force_delete : Bool? = nil
      ) : Types::DisassociateFileSystemOutput

        input = Types::DisassociateFileSystemInput.new(file_system_association_arn: file_system_association_arn, force_delete: force_delete)
        disassociate_file_system(input)
      end

      def disassociate_file_system(input : Types::DisassociateFileSystemInput) : Types::DisassociateFileSystemOutput
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_FILE_SYSTEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateFileSystemOutput, "DisassociateFileSystem")
      end

      # Starts a process that cleans the specified file share's cache of file entries that are failing
      # upload to Amazon S3. This API operation reports success if the request is received with valid
      # arguments, and there are no other cache clean operations currently in-progress for the specified
      # file share. After a successful request, the cache clean operation occurs asynchronously and reports
      # progress using CloudWatch logs and notifications. If ForceRemove is set to True , the cache clean
      # operation will delete file data from the gateway which might otherwise be recoverable. We recommend
      # using this operation only after all other methods to clear files failing upload have been exhausted,
      # and if your business need outweighs the potential data loss.

      def evict_files_failing_upload(
        file_share_arn : String,
        force_remove : Bool? = nil
      ) : Types::EvictFilesFailingUploadOutput

        input = Types::EvictFilesFailingUploadInput.new(file_share_arn: file_share_arn, force_remove: force_remove)
        evict_files_failing_upload(input)
      end

      def evict_files_failing_upload(input : Types::EvictFilesFailingUploadInput) : Types::EvictFilesFailingUploadOutput
        request = Protocol::JsonRpc.build_request(Model::EVICT_FILES_FAILING_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EvictFilesFailingUploadOutput, "EvictFilesFailingUpload")
      end

      # Adds a file gateway to an Active Directory domain. This operation is only supported for file
      # gateways that support the SMB file protocol. Joining a domain creates an Active Directory computer
      # account in the default organizational unit, using the gateway's Gateway ID as the account name (for
      # example, SGW-1234ADE). If your Active Directory environment requires that you pre-stage accounts to
      # facilitate the join domain process, you will need to create this account ahead of time. To create
      # the gateway's computer account in an organizational unit other than the default, you must specify
      # the organizational unit when joining the domain.

      def join_domain(
        domain_name : String,
        gateway_arn : String,
        password : String,
        user_name : String,
        domain_controllers : Array(String)? = nil,
        organizational_unit : String? = nil,
        timeout_in_seconds : Int32? = nil
      ) : Types::JoinDomainOutput

        input = Types::JoinDomainInput.new(domain_name: domain_name, gateway_arn: gateway_arn, password: password, user_name: user_name, domain_controllers: domain_controllers, organizational_unit: organizational_unit, timeout_in_seconds: timeout_in_seconds)
        join_domain(input)
      end

      def join_domain(input : Types::JoinDomainInput) : Types::JoinDomainOutput
        request = Protocol::JsonRpc.build_request(Model::JOIN_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::JoinDomainOutput, "JoinDomain")
      end

      # Lists the automatic tape creation policies for a gateway. If there are no automatic tape creation
      # policies for the gateway, it returns an empty list. This operation is only supported for tape
      # gateways.

      def list_automatic_tape_creation_policies(
        gateway_arn : String? = nil
      ) : Types::ListAutomaticTapeCreationPoliciesOutput

        input = Types::ListAutomaticTapeCreationPoliciesInput.new(gateway_arn: gateway_arn)
        list_automatic_tape_creation_policies(input)
      end

      def list_automatic_tape_creation_policies(input : Types::ListAutomaticTapeCreationPoliciesInput) : Types::ListAutomaticTapeCreationPoliciesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTOMATIC_TAPE_CREATION_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutomaticTapeCreationPoliciesOutput, "ListAutomaticTapeCreationPolicies")
      end

      # Returns a list of existing cache reports for all file shares associated with your Amazon Web
      # Services account. This list includes all information provided by the DescribeCacheReport action,
      # such as report name, status, completion progress, start time, end time, filters, and tags.

      def list_cache_reports(
        marker : String? = nil
      ) : Types::ListCacheReportsOutput

        input = Types::ListCacheReportsInput.new(marker: marker)
        list_cache_reports(input)
      end

      def list_cache_reports(input : Types::ListCacheReportsInput) : Types::ListCacheReportsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CACHE_REPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCacheReportsOutput, "ListCacheReports")
      end

      # Gets a list of the file shares for a specific S3 File Gateway, or the list of file shares that
      # belong to the calling Amazon Web Services account. This operation is only supported for S3 File
      # Gateways.

      def list_file_shares(
        gateway_arn : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Types::ListFileSharesOutput

        input = Types::ListFileSharesInput.new(gateway_arn: gateway_arn, limit: limit, marker: marker)
        list_file_shares(input)
      end

      def list_file_shares(input : Types::ListFileSharesInput) : Types::ListFileSharesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_FILE_SHARES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFileSharesOutput, "ListFileShares")
      end

      # Gets a list of FileSystemAssociationSummary objects. Each object contains a summary of a file system
      # association. This operation is only supported for FSx File Gateways.

      def list_file_system_associations(
        gateway_arn : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Types::ListFileSystemAssociationsOutput

        input = Types::ListFileSystemAssociationsInput.new(gateway_arn: gateway_arn, limit: limit, marker: marker)
        list_file_system_associations(input)
      end

      def list_file_system_associations(input : Types::ListFileSystemAssociationsInput) : Types::ListFileSystemAssociationsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_FILE_SYSTEM_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFileSystemAssociationsOutput, "ListFileSystemAssociations")
      end

      # Lists gateways owned by an Amazon Web Services account in an Amazon Web Services Region specified in
      # the request. The returned list is ordered by gateway Amazon Resource Name (ARN). By default, the
      # operation returns a maximum of 100 gateways. This operation supports pagination that allows you to
      # optionally reduce the number of gateways returned in a response. If you have more gateways than are
      # returned in a response (that is, the response returns only a truncated list of your gateways), the
      # response contains a marker that you can specify in your next request to fetch the next page of
      # gateways.

      def list_gateways(
        limit : Int32? = nil,
        marker : String? = nil
      ) : Types::ListGatewaysOutput

        input = Types::ListGatewaysInput.new(limit: limit, marker: marker)
        list_gateways(input)
      end

      def list_gateways(input : Types::ListGatewaysInput) : Types::ListGatewaysOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_GATEWAYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGatewaysOutput, "ListGateways")
      end

      # Returns a list of the gateway's local disks. To specify which gateway to describe, you use the
      # Amazon Resource Name (ARN) of the gateway in the body of the request. The request returns a list of
      # all disks, specifying which are configured as working storage, cache storage, or stored volume or
      # not configured at all. The response includes a DiskStatus field. This field can have a value of
      # present (the disk is available to use), missing (the disk is no longer connected to the gateway), or
      # mismatch (the disk node is occupied by a disk that has incorrect metadata or the disk content is
      # corrupted).

      def list_local_disks(
        gateway_arn : String
      ) : Types::ListLocalDisksOutput

        input = Types::ListLocalDisksInput.new(gateway_arn: gateway_arn)
        list_local_disks(input)
      end

      def list_local_disks(input : Types::ListLocalDisksInput) : Types::ListLocalDisksOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_LOCAL_DISKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLocalDisksOutput, "ListLocalDisks")
      end

      # Lists the tags that have been added to the specified resource. This operation is supported in
      # storage gateways of all types.

      def list_tags_for_resource(
        resource_arn : String,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Types::ListTagsForResourceOutput

        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn, limit: limit, marker: marker)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Lists custom tape pools. You specify custom tape pools to list by specifying one or more custom tape
      # pool Amazon Resource Names (ARNs). If you don't specify a custom tape pool ARN, the operation lists
      # all custom tape pools. This operation supports pagination. You can optionally specify the Limit
      # parameter in the body to limit the number of tape pools in the response. If the number of tape pools
      # returned in the response is truncated, the response includes a Marker element that you can use in
      # your subsequent request to retrieve the next set of tape pools.

      def list_tape_pools(
        limit : Int32? = nil,
        marker : String? = nil,
        pool_ar_ns : Array(String)? = nil
      ) : Types::ListTapePoolsOutput

        input = Types::ListTapePoolsInput.new(limit: limit, marker: marker, pool_ar_ns: pool_ar_ns)
        list_tape_pools(input)
      end

      def list_tape_pools(input : Types::ListTapePoolsInput) : Types::ListTapePoolsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAPE_POOLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTapePoolsOutput, "ListTapePools")
      end

      # Lists virtual tapes in your virtual tape library (VTL) and your virtual tape shelf (VTS). You
      # specify the tapes to list by specifying one or more tape Amazon Resource Names (ARNs). If you don't
      # specify a tape ARN, the operation lists all virtual tapes in both your VTL and VTS. This operation
      # supports pagination. By default, the operation returns a maximum of up to 100 tapes. You can
      # optionally specify the Limit parameter in the body to limit the number of tapes in the response. If
      # the number of tapes returned in the response is truncated, the response includes a Marker element
      # that you can use in your subsequent request to retrieve the next set of tapes. This operation is
      # only supported in the tape gateway type.

      def list_tapes(
        limit : Int32? = nil,
        marker : String? = nil,
        tape_ar_ns : Array(String)? = nil
      ) : Types::ListTapesOutput

        input = Types::ListTapesInput.new(limit: limit, marker: marker, tape_ar_ns: tape_ar_ns)
        list_tapes(input)
      end

      def list_tapes(input : Types::ListTapesInput) : Types::ListTapesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTapesOutput, "ListTapes")
      end

      # Lists iSCSI initiators that are connected to a volume. You can use this operation to determine
      # whether a volume is being used or not. This operation is only supported in the cached volume and
      # stored volume gateway types.

      def list_volume_initiators(
        volume_arn : String
      ) : Types::ListVolumeInitiatorsOutput

        input = Types::ListVolumeInitiatorsInput.new(volume_arn: volume_arn)
        list_volume_initiators(input)
      end

      def list_volume_initiators(input : Types::ListVolumeInitiatorsInput) : Types::ListVolumeInitiatorsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_VOLUME_INITIATORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVolumeInitiatorsOutput, "ListVolumeInitiators")
      end

      # Lists the recovery points for a specified gateway. This operation is only supported in the cached
      # volume gateway type. Each cache volume has one recovery point. A volume recovery point is a point in
      # time at which all data of the volume is consistent and from which you can create a snapshot or clone
      # a new cached volume from a source volume. To create a snapshot from a volume recovery point use the
      # CreateSnapshotFromVolumeRecoveryPoint operation.

      def list_volume_recovery_points(
        gateway_arn : String
      ) : Types::ListVolumeRecoveryPointsOutput

        input = Types::ListVolumeRecoveryPointsInput.new(gateway_arn: gateway_arn)
        list_volume_recovery_points(input)
      end

      def list_volume_recovery_points(input : Types::ListVolumeRecoveryPointsInput) : Types::ListVolumeRecoveryPointsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_VOLUME_RECOVERY_POINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVolumeRecoveryPointsOutput, "ListVolumeRecoveryPoints")
      end

      # Lists the iSCSI stored volumes of a gateway. Results are sorted by volume ARN. The response includes
      # only the volume ARNs. If you want additional volume information, use the DescribeStorediSCSIVolumes
      # or the DescribeCachediSCSIVolumes API. The operation supports pagination. By default, the operation
      # returns a maximum of up to 100 volumes. You can optionally specify the Limit field in the body to
      # limit the number of volumes in the response. If the number of volumes returned in the response is
      # truncated, the response includes a Marker field. You can use this Marker value in your subsequent
      # request to retrieve the next set of volumes. This operation is only supported in the cached volume
      # and stored volume gateway types.

      def list_volumes(
        gateway_arn : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Types::ListVolumesOutput

        input = Types::ListVolumesInput.new(gateway_arn: gateway_arn, limit: limit, marker: marker)
        list_volumes(input)
      end

      def list_volumes(input : Types::ListVolumesInput) : Types::ListVolumesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_VOLUMES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVolumesOutput, "ListVolumes")
      end

      # Sends you notification through Amazon EventBridge when all files written to your file share have
      # been uploaded to Amazon S3. Storage Gateway can send a notification through Amazon EventBridge when
      # all files written to your file share up to that point in time have been uploaded to Amazon S3. These
      # files include files written to the file share up to the time that you make a request for
      # notification. When the upload is done, Storage Gateway sends you notification through EventBridge.
      # You can configure EventBridge to send the notification through event targets such as Amazon SNS or
      # Lambda function. This operation is only supported for S3 File Gateways. For more information, see
      # Getting file upload notification in the Amazon S3 File Gateway User Guide .

      def notify_when_uploaded(
        file_share_arn : String
      ) : Types::NotifyWhenUploadedOutput

        input = Types::NotifyWhenUploadedInput.new(file_share_arn: file_share_arn)
        notify_when_uploaded(input)
      end

      def notify_when_uploaded(input : Types::NotifyWhenUploadedInput) : Types::NotifyWhenUploadedOutput
        request = Protocol::JsonRpc.build_request(Model::NOTIFY_WHEN_UPLOADED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::NotifyWhenUploadedOutput, "NotifyWhenUploaded")
      end

      # Refreshes the cached inventory of objects for the specified file share. This operation finds objects
      # in the Amazon S3 bucket that were added, removed, or replaced since the gateway last listed the
      # bucket's contents and cached the results. This operation does not import files into the S3 File
      # Gateway cache storage. It only updates the cached inventory to reflect changes in the inventory of
      # the objects in the S3 bucket. This operation is only supported in the S3 File Gateway types. You can
      # subscribe to be notified through an Amazon CloudWatch event when your RefreshCache operation
      # completes. For more information, see Getting notified about file operations in the Amazon S3 File
      # Gateway User Guide . This operation is Only supported for S3 File Gateways. When this API is called,
      # it only initiates the refresh operation. When the API call completes and returns a success code, it
      # doesn't necessarily mean that the file refresh has completed. You should use the refresh-complete
      # notification to determine that the operation has completed before you check for new files on the
      # gateway file share. You can subscribe to be notified through a CloudWatch event when your
      # RefreshCache operation completes. Throttle limit: This API is asynchronous, so the gateway will
      # accept no more than two refreshes at any time. We recommend using the refresh-complete CloudWatch
      # event notification before issuing additional requests. For more information, see Getting notified
      # about file operations in the Amazon S3 File Gateway User Guide . Wait at least 60 seconds between
      # consecutive RefreshCache API requests. If you invoke the RefreshCache API when two requests are
      # already being processed, any new request will cause an InvalidGatewayRequestException error because
      # too many requests were sent to the server. The S3 bucket name does not need to be included when
      # entering the list of folders in the FolderList parameter. For more information, see Getting notified
      # about file operations in the Amazon S3 File Gateway User Guide .

      def refresh_cache(
        file_share_arn : String,
        folder_list : Array(String)? = nil,
        recursive : Bool? = nil
      ) : Types::RefreshCacheOutput

        input = Types::RefreshCacheInput.new(file_share_arn: file_share_arn, folder_list: folder_list, recursive: recursive)
        refresh_cache(input)
      end

      def refresh_cache(input : Types::RefreshCacheInput) : Types::RefreshCacheOutput
        request = Protocol::JsonRpc.build_request(Model::REFRESH_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RefreshCacheOutput, "RefreshCache")
      end

      # Removes one or more tags from the specified resource. This operation is supported in storage
      # gateways of all types.

      def remove_tags_from_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::RemoveTagsFromResourceOutput

        input = Types::RemoveTagsFromResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        remove_tags_from_resource(input)
      end

      def remove_tags_from_resource(input : Types::RemoveTagsFromResourceInput) : Types::RemoveTagsFromResourceOutput
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveTagsFromResourceOutput, "RemoveTagsFromResource")
      end

      # Resets all cache disks that have encountered an error and makes the disks available for
      # reconfiguration as cache storage. If your cache disk encounters an error, the gateway prevents read
      # and write operations on virtual tapes in the gateway. For example, an error can occur when a disk is
      # corrupted or removed from the gateway. When a cache is reset, the gateway loses its cache storage.
      # At this point, you can reconfigure the disks as cache disks. This operation is only supported in the
      # cached volume and tape types. If the cache disk you are resetting contains data that has not been
      # uploaded to Amazon S3 yet, that data can be lost. After you reset cache disks, there will be no
      # configured cache disks left in the gateway, so you must configure at least one new cache disk for
      # your gateway to function properly.

      def reset_cache(
        gateway_arn : String
      ) : Types::ResetCacheOutput

        input = Types::ResetCacheInput.new(gateway_arn: gateway_arn)
        reset_cache(input)
      end

      def reset_cache(input : Types::ResetCacheInput) : Types::ResetCacheOutput
        request = Protocol::JsonRpc.build_request(Model::RESET_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResetCacheOutput, "ResetCache")
      end

      # Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a tape gateway. Virtual
      # tapes archived in the VTS are not associated with any gateway. However after a tape is retrieved, it
      # is associated with a gateway, even though it is also listed in the VTS, that is, archive. This
      # operation is only supported in the tape gateway type. Once a tape is successfully retrieved to a
      # gateway, it cannot be retrieved again to another gateway. You must archive the tape again before you
      # can retrieve it to another gateway. This operation is only supported in the tape gateway type.

      def retrieve_tape_archive(
        gateway_arn : String,
        tape_arn : String
      ) : Types::RetrieveTapeArchiveOutput

        input = Types::RetrieveTapeArchiveInput.new(gateway_arn: gateway_arn, tape_arn: tape_arn)
        retrieve_tape_archive(input)
      end

      def retrieve_tape_archive(input : Types::RetrieveTapeArchiveInput) : Types::RetrieveTapeArchiveOutput
        request = Protocol::JsonRpc.build_request(Model::RETRIEVE_TAPE_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RetrieveTapeArchiveOutput, "RetrieveTapeArchive")
      end

      # Retrieves the recovery point for the specified virtual tape. This operation is only supported in the
      # tape gateway type. A recovery point is a point in time view of a virtual tape at which all the data
      # on the tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be
      # recovered to a new gateway. The virtual tape can be retrieved to only one gateway. The retrieved
      # tape is read-only. The virtual tape can be retrieved to only a tape gateway. There is no charge for
      # retrieving recovery points.

      def retrieve_tape_recovery_point(
        gateway_arn : String,
        tape_arn : String
      ) : Types::RetrieveTapeRecoveryPointOutput

        input = Types::RetrieveTapeRecoveryPointInput.new(gateway_arn: gateway_arn, tape_arn: tape_arn)
        retrieve_tape_recovery_point(input)
      end

      def retrieve_tape_recovery_point(input : Types::RetrieveTapeRecoveryPointInput) : Types::RetrieveTapeRecoveryPointOutput
        request = Protocol::JsonRpc.build_request(Model::RETRIEVE_TAPE_RECOVERY_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RetrieveTapeRecoveryPointOutput, "RetrieveTapeRecoveryPoint")
      end

      # Sets the password for your VM local console. When you log in to the local console for the first
      # time, you log in to the VM with the default credentials. We recommend that you set a new password.
      # You don't need to know the default password to set a new password.

      def set_local_console_password(
        gateway_arn : String,
        local_console_password : String
      ) : Types::SetLocalConsolePasswordOutput

        input = Types::SetLocalConsolePasswordInput.new(gateway_arn: gateway_arn, local_console_password: local_console_password)
        set_local_console_password(input)
      end

      def set_local_console_password(input : Types::SetLocalConsolePasswordInput) : Types::SetLocalConsolePasswordOutput
        request = Protocol::JsonRpc.build_request(Model::SET_LOCAL_CONSOLE_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetLocalConsolePasswordOutput, "SetLocalConsolePassword")
      end

      # Sets the password for the guest user smbguest . The smbguest user is the user when the
      # authentication method for the file share is set to GuestAccess . This operation only supported for
      # S3 File Gateways

      def set_smb_guest_password(
        gateway_arn : String,
        password : String
      ) : Types::SetSMBGuestPasswordOutput

        input = Types::SetSMBGuestPasswordInput.new(gateway_arn: gateway_arn, password: password)
        set_smb_guest_password(input)
      end

      def set_smb_guest_password(input : Types::SetSMBGuestPasswordInput) : Types::SetSMBGuestPasswordOutput
        request = Protocol::JsonRpc.build_request(Model::SET_SMB_GUEST_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetSMBGuestPasswordOutput, "SetSMBGuestPassword")
      end

      # Shuts down a Tape Gateway or Volume Gateway. To specify which gateway to shut down, use the Amazon
      # Resource Name (ARN) of the gateway in the body of your request. This API action cannot be used to
      # shut down S3 File Gateway or FSx File Gateway. The operation shuts down the gateway service
      # component running in the gateway's virtual machine (VM) and not the host VM. If you want to shut
      # down the VM, it is recommended that you first shut down the gateway component in the VM to avoid
      # unpredictable conditions. After the gateway is shutdown, you cannot call any other API except
      # StartGateway , DescribeGatewayInformation , and ListGateways . For more information, see
      # ActivateGateway . Your applications cannot read from or write to the gateway's storage volumes, and
      # there are no snapshots taken. When you make a shutdown request, you will get a 200 OK success
      # response immediately. However, it might take some time for the gateway to shut down. You can call
      # the DescribeGatewayInformation API to check the status. For more information, see ActivateGateway .
      # If do not intend to use the gateway again, you must delete the gateway (using DeleteGateway ) to no
      # longer pay software charges associated with the gateway.

      def shutdown_gateway(
        gateway_arn : String
      ) : Types::ShutdownGatewayOutput

        input = Types::ShutdownGatewayInput.new(gateway_arn: gateway_arn)
        shutdown_gateway(input)
      end

      def shutdown_gateway(input : Types::ShutdownGatewayInput) : Types::ShutdownGatewayOutput
        request = Protocol::JsonRpc.build_request(Model::SHUTDOWN_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ShutdownGatewayOutput, "ShutdownGateway")
      end

      # Start a test that verifies that the specified gateway is configured for High Availability monitoring
      # in your host environment. This request only initiates the test and that a successful response only
      # indicates that the test was started. It doesn't indicate that the test passed. For the status of the
      # test, invoke the DescribeAvailabilityMonitorTest API. Starting this test will cause your gateway to
      # go offline for a brief period.

      def start_availability_monitor_test(
        gateway_arn : String
      ) : Types::StartAvailabilityMonitorTestOutput

        input = Types::StartAvailabilityMonitorTestInput.new(gateway_arn: gateway_arn)
        start_availability_monitor_test(input)
      end

      def start_availability_monitor_test(input : Types::StartAvailabilityMonitorTestInput) : Types::StartAvailabilityMonitorTestOutput
        request = Protocol::JsonRpc.build_request(Model::START_AVAILABILITY_MONITOR_TEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAvailabilityMonitorTestOutput, "StartAvailabilityMonitorTest")
      end

      # Starts generating a report of the file metadata currently cached by an S3 File Gateway for a
      # specific file share. You can use this report to identify and resolve issues if you have files
      # failing upload from your gateway to Amazon S3. The report is a CSV file containing a list of files
      # which match the set of filter parameters you specify in the request. The Files Failing Upload flag
      # is reset every 24 hours and during gateway reboot. If this report captures the files after the
      # reset, but before they become flagged again, they will not be reported as Files Failing Upload . The
      # following requirements must be met to successfully generate a cache report: You must have
      # s3:PutObject and s3:AbortMultipartUpload permissions for the Amazon S3 bucket where you want to
      # store the cache report. No other cache reports can currently be in-progress for the specified file
      # share. There must be fewer than 10 existing cache reports for the specified file share. The gateway
      # must be online and connected to Amazon Web Services. The root disk must have at least 20GB of free
      # space when report generation starts. You must specify at least one value for InclusionFilters or
      # ExclusionFilters in the request.

      def start_cache_report(
        bucket_region : String,
        client_token : String,
        file_share_arn : String,
        location_arn : String,
        role : String,
        exclusion_filters : Array(Types::CacheReportFilter)? = nil,
        inclusion_filters : Array(Types::CacheReportFilter)? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_endpoint_dns_name : String? = nil
      ) : Types::StartCacheReportOutput

        input = Types::StartCacheReportInput.new(bucket_region: bucket_region, client_token: client_token, file_share_arn: file_share_arn, location_arn: location_arn, role: role, exclusion_filters: exclusion_filters, inclusion_filters: inclusion_filters, tags: tags, vpc_endpoint_dns_name: vpc_endpoint_dns_name)
        start_cache_report(input)
      end

      def start_cache_report(input : Types::StartCacheReportInput) : Types::StartCacheReportOutput
        request = Protocol::JsonRpc.build_request(Model::START_CACHE_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartCacheReportOutput, "StartCacheReport")
      end

      # Starts a gateway that you previously shut down (see ShutdownGateway ). After the gateway starts, you
      # can then make other API calls, your applications can read from or write to the gateway's storage
      # volumes and you will be able to take snapshot backups. When you make a request, you will get a 200
      # OK success response immediately. However, it might take some time for the gateway to be ready. You
      # should call DescribeGatewayInformation and check the status before making any additional API calls.
      # For more information, see ActivateGateway . To specify which gateway to start, use the Amazon
      # Resource Name (ARN) of the gateway in your request.

      def start_gateway(
        gateway_arn : String
      ) : Types::StartGatewayOutput

        input = Types::StartGatewayInput.new(gateway_arn: gateway_arn)
        start_gateway(input)
      end

      def start_gateway(input : Types::StartGatewayInput) : Types::StartGatewayOutput
        request = Protocol::JsonRpc.build_request(Model::START_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartGatewayOutput, "StartGateway")
      end

      # Updates the automatic tape creation policy of a gateway. Use this to update the policy with a new
      # set of automatic tape creation rules. This is only supported for tape gateways. By default, there is
      # no automatic tape creation policy. A gateway can have only one automatic tape creation policy.

      def update_automatic_tape_creation_policy(
        automatic_tape_creation_rules : Array(Types::AutomaticTapeCreationRule),
        gateway_arn : String
      ) : Types::UpdateAutomaticTapeCreationPolicyOutput

        input = Types::UpdateAutomaticTapeCreationPolicyInput.new(automatic_tape_creation_rules: automatic_tape_creation_rules, gateway_arn: gateway_arn)
        update_automatic_tape_creation_policy(input)
      end

      def update_automatic_tape_creation_policy(input : Types::UpdateAutomaticTapeCreationPolicyInput) : Types::UpdateAutomaticTapeCreationPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_AUTOMATIC_TAPE_CREATION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAutomaticTapeCreationPolicyOutput, "UpdateAutomaticTapeCreationPolicy")
      end

      # Updates the bandwidth rate limits of a gateway. You can update both the upload and download
      # bandwidth rate limit or specify only one of the two. If you don't set a bandwidth rate limit, the
      # existing rate limit remains. This operation is supported only for the stored volume, cached volume,
      # and tape gateway types. To update bandwidth rate limits for S3 file gateways, use
      # UpdateBandwidthRateLimitSchedule . By default, a gateway's bandwidth rate limits are not set. If you
      # don't set any limit, the gateway does not have any limitations on its bandwidth usage and could
      # potentially use the maximum available bandwidth. To specify which gateway to update, use the Amazon
      # Resource Name (ARN) of the gateway in your request.

      def update_bandwidth_rate_limit(
        gateway_arn : String,
        average_download_rate_limit_in_bits_per_sec : Int64? = nil,
        average_upload_rate_limit_in_bits_per_sec : Int64? = nil
      ) : Types::UpdateBandwidthRateLimitOutput

        input = Types::UpdateBandwidthRateLimitInput.new(gateway_arn: gateway_arn, average_download_rate_limit_in_bits_per_sec: average_download_rate_limit_in_bits_per_sec, average_upload_rate_limit_in_bits_per_sec: average_upload_rate_limit_in_bits_per_sec)
        update_bandwidth_rate_limit(input)
      end

      def update_bandwidth_rate_limit(input : Types::UpdateBandwidthRateLimitInput) : Types::UpdateBandwidthRateLimitOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BANDWIDTH_RATE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBandwidthRateLimitOutput, "UpdateBandwidthRateLimit")
      end

      # Updates the bandwidth rate limit schedule for a specified gateway. By default, gateways do not have
      # bandwidth rate limit schedules, which means no bandwidth rate limiting is in effect. Use this to
      # initiate or update a gateway's bandwidth rate limit schedule. This operation is supported for
      # volume, tape, and S3 file gateways. S3 file gateways support bandwidth rate limits for upload only.
      # FSx file gateways do not support bandwidth rate limits.

      def update_bandwidth_rate_limit_schedule(
        bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval),
        gateway_arn : String
      ) : Types::UpdateBandwidthRateLimitScheduleOutput

        input = Types::UpdateBandwidthRateLimitScheduleInput.new(bandwidth_rate_limit_intervals: bandwidth_rate_limit_intervals, gateway_arn: gateway_arn)
        update_bandwidth_rate_limit_schedule(input)
      end

      def update_bandwidth_rate_limit_schedule(input : Types::UpdateBandwidthRateLimitScheduleInput) : Types::UpdateBandwidthRateLimitScheduleOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BANDWIDTH_RATE_LIMIT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBandwidthRateLimitScheduleOutput, "UpdateBandwidthRateLimitSchedule")
      end

      # Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI
      # target. By default, a gateway does not have CHAP enabled; however, for added security, you might use
      # it. This operation is supported in the volume and tape gateway types. When you update CHAP
      # credentials, all existing connections on the target are closed and initiators must reconnect with
      # the new credentials.

      def update_chap_credentials(
        initiator_name : String,
        secret_to_authenticate_initiator : String,
        target_arn : String,
        secret_to_authenticate_target : String? = nil
      ) : Types::UpdateChapCredentialsOutput

        input = Types::UpdateChapCredentialsInput.new(initiator_name: initiator_name, secret_to_authenticate_initiator: secret_to_authenticate_initiator, target_arn: target_arn, secret_to_authenticate_target: secret_to_authenticate_target)
        update_chap_credentials(input)
      end

      def update_chap_credentials(input : Types::UpdateChapCredentialsInput) : Types::UpdateChapCredentialsOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CHAP_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateChapCredentialsOutput, "UpdateChapCredentials")
      end

      # Updates a file system association. This operation is only supported in the FSx File Gateways.

      def update_file_system_association(
        file_system_association_arn : String,
        audit_destination_arn : String? = nil,
        cache_attributes : Types::CacheAttributes? = nil,
        password : String? = nil,
        user_name : String? = nil
      ) : Types::UpdateFileSystemAssociationOutput

        input = Types::UpdateFileSystemAssociationInput.new(file_system_association_arn: file_system_association_arn, audit_destination_arn: audit_destination_arn, cache_attributes: cache_attributes, password: password, user_name: user_name)
        update_file_system_association(input)
      end

      def update_file_system_association(input : Types::UpdateFileSystemAssociationInput) : Types::UpdateFileSystemAssociationOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FILE_SYSTEM_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFileSystemAssociationOutput, "UpdateFileSystemAssociation")
      end

      # Updates a gateway's metadata, which includes the gateway's name, time zone, and metadata cache size.
      # To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your
      # request. For gateways activated after September 2, 2015, the gateway's ARN contains the gateway ID
      # rather than the gateway name. However, changing the name of the gateway has no effect on the
      # gateway's ARN.

      def update_gateway_information(
        gateway_arn : String,
        cloud_watch_log_group_arn : String? = nil,
        gateway_capacity : String? = nil,
        gateway_name : String? = nil,
        gateway_timezone : String? = nil
      ) : Types::UpdateGatewayInformationOutput

        input = Types::UpdateGatewayInformationInput.new(gateway_arn: gateway_arn, cloud_watch_log_group_arn: cloud_watch_log_group_arn, gateway_capacity: gateway_capacity, gateway_name: gateway_name, gateway_timezone: gateway_timezone)
        update_gateway_information(input)
      end

      def update_gateway_information(input : Types::UpdateGatewayInformationInput) : Types::UpdateGatewayInformationOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GATEWAY_INFORMATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGatewayInformationOutput, "UpdateGatewayInformation")
      end

      # Updates the gateway virtual machine (VM) software. The request immediately triggers the software
      # update. When you make this request, you get a 200 OK success response immediately. However, it might
      # take some time for the update to complete. You can call DescribeGatewayInformation to verify the
      # gateway is in the STATE_RUNNING state. A software update forces a system restart of your gateway.
      # You can minimize the chance of any disruption to your applications by increasing your iSCSI
      # Initiators' timeouts. For more information about increasing iSCSI Initiator timeouts for Windows and
      # Linux, see Customizing your Windows iSCSI settings and Customizing your Linux iSCSI settings ,
      # respectively.

      def update_gateway_software_now(
        gateway_arn : String
      ) : Types::UpdateGatewaySoftwareNowOutput

        input = Types::UpdateGatewaySoftwareNowInput.new(gateway_arn: gateway_arn)
        update_gateway_software_now(input)
      end

      def update_gateway_software_now(input : Types::UpdateGatewaySoftwareNowInput) : Types::UpdateGatewaySoftwareNowOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GATEWAY_SOFTWARE_NOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGatewaySoftwareNowOutput, "UpdateGatewaySoftwareNow")
      end

      # Updates a gateway's maintenance window schedule, with settings for monthly or weekly cadence,
      # specific day and time to begin maintenance, and which types of updates to apply. Time configuration
      # uses the gateway's time zone. You can pass values for a complete maintenance schedule, or update
      # policy, or both. Previous values will persist for whichever setting you choose not to modify. If an
      # incomplete or invalid maintenance schedule is passed, the entire request will be rejected with an
      # error and no changes will occur. A complete maintenance schedule must include values for both
      # MinuteOfHour and HourOfDay , and either DayOfMonth or DayOfWeek . We recommend keeping maintenance
      # updates turned on, except in specific use cases where the brief disruptions caused by updating the
      # gateway could critically impact your deployment.

      def update_maintenance_start_time(
        gateway_arn : String,
        day_of_month : Int32? = nil,
        day_of_week : Int32? = nil,
        hour_of_day : Int32? = nil,
        minute_of_hour : Int32? = nil,
        software_update_preferences : Types::SoftwareUpdatePreferences? = nil
      ) : Types::UpdateMaintenanceStartTimeOutput

        input = Types::UpdateMaintenanceStartTimeInput.new(gateway_arn: gateway_arn, day_of_month: day_of_month, day_of_week: day_of_week, hour_of_day: hour_of_day, minute_of_hour: minute_of_hour, software_update_preferences: software_update_preferences)
        update_maintenance_start_time(input)
      end

      def update_maintenance_start_time(input : Types::UpdateMaintenanceStartTimeInput) : Types::UpdateMaintenanceStartTimeOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MAINTENANCE_START_TIME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMaintenanceStartTimeOutput, "UpdateMaintenanceStartTime")
      end

      # Updates a Network File System (NFS) file share. This operation is only supported in S3 File
      # Gateways. To leave a file share field unchanged, set the corresponding input field to null. Updates
      # the following file share settings: Default storage class for your S3 bucket Metadata defaults for
      # your S3 bucket Allowed NFS clients for your file share Squash settings Write status of your file
      # share

      def update_nfs_file_share(
        file_share_arn : String,
        audit_destination_arn : String? = nil,
        cache_attributes : Types::CacheAttributes? = nil,
        client_list : Array(String)? = nil,
        default_storage_class : String? = nil,
        encryption_type : String? = nil,
        file_share_name : String? = nil,
        guess_mime_type_enabled : Bool? = nil,
        kms_encrypted : Bool? = nil,
        kms_key : String? = nil,
        nfs_file_share_defaults : Types::NFSFileShareDefaults? = nil,
        notification_policy : String? = nil,
        object_acl : String? = nil,
        read_only : Bool? = nil,
        requester_pays : Bool? = nil,
        squash : String? = nil
      ) : Types::UpdateNFSFileShareOutput

        input = Types::UpdateNFSFileShareInput.new(file_share_arn: file_share_arn, audit_destination_arn: audit_destination_arn, cache_attributes: cache_attributes, client_list: client_list, default_storage_class: default_storage_class, encryption_type: encryption_type, file_share_name: file_share_name, guess_mime_type_enabled: guess_mime_type_enabled, kms_encrypted: kms_encrypted, kms_key: kms_key, nfs_file_share_defaults: nfs_file_share_defaults, notification_policy: notification_policy, object_acl: object_acl, read_only: read_only, requester_pays: requester_pays, squash: squash)
        update_nfs_file_share(input)
      end

      def update_nfs_file_share(input : Types::UpdateNFSFileShareInput) : Types::UpdateNFSFileShareOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NFS_FILE_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNFSFileShareOutput, "UpdateNFSFileShare")
      end

      # Updates a Server Message Block (SMB) file share. This operation is only supported for S3 File
      # Gateways. To leave a file share field unchanged, set the corresponding input field to null. File
      # gateways require Security Token Service (Amazon Web Services STS) to be activated to enable you to
      # create a file share. Make sure that Amazon Web Services STS is activated in the Amazon Web Services
      # Region you are creating your file gateway in. If Amazon Web Services STS is not activated in this
      # Amazon Web Services Region, activate it. For information about how to activate Amazon Web Services
      # STS, see Activating and deactivating Amazon Web Services STS in an Amazon Web Services Region in the
      # Identity and Access Management User Guide . File gateways don't support creating hard or symbolic
      # links on a file share.

      def update_smb_file_share(
        file_share_arn : String,
        access_based_enumeration : Bool? = nil,
        admin_user_list : Array(String)? = nil,
        audit_destination_arn : String? = nil,
        cache_attributes : Types::CacheAttributes? = nil,
        case_sensitivity : String? = nil,
        default_storage_class : String? = nil,
        encryption_type : String? = nil,
        file_share_name : String? = nil,
        guess_mime_type_enabled : Bool? = nil,
        invalid_user_list : Array(String)? = nil,
        kms_encrypted : Bool? = nil,
        kms_key : String? = nil,
        notification_policy : String? = nil,
        object_acl : String? = nil,
        oplocks_enabled : Bool? = nil,
        read_only : Bool? = nil,
        requester_pays : Bool? = nil,
        smbacl_enabled : Bool? = nil,
        valid_user_list : Array(String)? = nil
      ) : Types::UpdateSMBFileShareOutput

        input = Types::UpdateSMBFileShareInput.new(file_share_arn: file_share_arn, access_based_enumeration: access_based_enumeration, admin_user_list: admin_user_list, audit_destination_arn: audit_destination_arn, cache_attributes: cache_attributes, case_sensitivity: case_sensitivity, default_storage_class: default_storage_class, encryption_type: encryption_type, file_share_name: file_share_name, guess_mime_type_enabled: guess_mime_type_enabled, invalid_user_list: invalid_user_list, kms_encrypted: kms_encrypted, kms_key: kms_key, notification_policy: notification_policy, object_acl: object_acl, oplocks_enabled: oplocks_enabled, read_only: read_only, requester_pays: requester_pays, smbacl_enabled: smbacl_enabled, valid_user_list: valid_user_list)
        update_smb_file_share(input)
      end

      def update_smb_file_share(input : Types::UpdateSMBFileShareInput) : Types::UpdateSMBFileShareOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SMB_FILE_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSMBFileShareOutput, "UpdateSMBFileShare")
      end

      # Controls whether the shares on an S3 File Gateway are visible in a net view or browse list. The
      # operation is only supported for S3 File Gateways.

      def update_smb_file_share_visibility(
        file_shares_visible : Bool,
        gateway_arn : String
      ) : Types::UpdateSMBFileShareVisibilityOutput

        input = Types::UpdateSMBFileShareVisibilityInput.new(file_shares_visible: file_shares_visible, gateway_arn: gateway_arn)
        update_smb_file_share_visibility(input)
      end

      def update_smb_file_share_visibility(input : Types::UpdateSMBFileShareVisibilityInput) : Types::UpdateSMBFileShareVisibilityOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SMB_FILE_SHARE_VISIBILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSMBFileShareVisibilityOutput, "UpdateSMBFileShareVisibility")
      end

      # Updates the list of Active Directory users and groups that have special permissions for SMB file
      # shares on the gateway.

      def update_smb_local_groups(
        gateway_arn : String,
        smb_local_groups : Types::SMBLocalGroups
      ) : Types::UpdateSMBLocalGroupsOutput

        input = Types::UpdateSMBLocalGroupsInput.new(gateway_arn: gateway_arn, smb_local_groups: smb_local_groups)
        update_smb_local_groups(input)
      end

      def update_smb_local_groups(input : Types::UpdateSMBLocalGroupsInput) : Types::UpdateSMBLocalGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SMB_LOCAL_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSMBLocalGroupsOutput, "UpdateSMBLocalGroups")
      end

      # Updates the SMB security strategy level for an Amazon S3 file gateway. This action is only supported
      # for Amazon S3 file gateways. For information about configuring this setting using the Amazon Web
      # Services console, see Setting a security level for your gateway in the Amazon S3 File Gateway User
      # Guide . A higher security strategy level can affect performance of the gateway.

      def update_smb_security_strategy(
        gateway_arn : String,
        smb_security_strategy : String
      ) : Types::UpdateSMBSecurityStrategyOutput

        input = Types::UpdateSMBSecurityStrategyInput.new(gateway_arn: gateway_arn, smb_security_strategy: smb_security_strategy)
        update_smb_security_strategy(input)
      end

      def update_smb_security_strategy(input : Types::UpdateSMBSecurityStrategyInput) : Types::UpdateSMBSecurityStrategyOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SMB_SECURITY_STRATEGY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSMBSecurityStrategyOutput, "UpdateSMBSecurityStrategy")
      end

      # Updates a snapshot schedule configured for a gateway volume. This operation is only supported in the
      # cached volume and stored volume gateway types. The default snapshot schedule for volume is once
      # every 24 hours, starting at the creation time of the volume. You can use this API to change the
      # snapshot schedule configured for the volume. In the request you must identify the gateway volume
      # whose snapshot schedule you want to update, and the schedule information, including when you want
      # the snapshot to begin on a day and the frequency (in hours) of snapshots.

      def update_snapshot_schedule(
        recurrence_in_hours : Int32,
        start_at : Int32,
        volume_arn : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::UpdateSnapshotScheduleOutput

        input = Types::UpdateSnapshotScheduleInput.new(recurrence_in_hours: recurrence_in_hours, start_at: start_at, volume_arn: volume_arn, description: description, tags: tags)
        update_snapshot_schedule(input)
      end

      def update_snapshot_schedule(input : Types::UpdateSnapshotScheduleInput) : Types::UpdateSnapshotScheduleOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SNAPSHOT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSnapshotScheduleOutput, "UpdateSnapshotSchedule")
      end

      # Updates the type of medium changer in a tape gateway. When you activate a tape gateway, you select a
      # medium changer type for the tape gateway. This operation enables you to select a different type of
      # medium changer after a tape gateway is activated. This operation is only supported in the tape
      # gateway type.

      def update_vtl_device_type(
        device_type : String,
        vtl_device_arn : String
      ) : Types::UpdateVTLDeviceTypeOutput

        input = Types::UpdateVTLDeviceTypeInput.new(device_type: device_type, vtl_device_arn: vtl_device_arn)
        update_vtl_device_type(input)
      end

      def update_vtl_device_type(input : Types::UpdateVTLDeviceTypeInput) : Types::UpdateVTLDeviceTypeOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VTL_DEVICE_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateVTLDeviceTypeOutput, "UpdateVTLDeviceType")
      end
    end
  end
end
