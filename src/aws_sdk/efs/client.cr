module AwsSdk
  module EFS
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates an EFS access point. An access point is an application-specific view into an EFS file system
      # that applies an operating system user and group, and a file system path, to any file system request
      # made through the access point. The operating system user and group override any identity information
      # provided by the NFS client. The file system path is exposed as the access point's root directory.
      # Applications using the access point can only access data in the application's own directory and any
      # subdirectories. A file system can have a maximum of 10,000 access points unless you request an
      # increase. To learn more, see Mounting a file system using EFS access points . If multiple requests
      # to create access points on the same file system are sent in quick succession, and the file system is
      # near the limit of access points, you may experience a throttling response for these requests. This
      # is to ensure that the file system does not exceed the stated access point limit. This operation
      # requires permissions for the elasticfilesystem:CreateAccessPoint action. Access points can be tagged
      # on creation. If tags are specified in the creation action, IAM performs additional authorization on
      # the elasticfilesystem:TagResource action to verify if users have permissions to create tags.
      # Therefore, you must grant explicit permissions to use the elasticfilesystem:TagResource action. For
      # more information, see Granting permissions to tag resources during creation .

      def create_access_point(
        client_token : String,
        file_system_id : String,
        posix_user : Types::PosixUser? = nil,
        root_directory : Types::RootDirectory? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAccessPointRequest.new(client_token: client_token, file_system_id: file_system_id, posix_user: posix_user, root_directory: root_directory, tags: tags)
        create_access_point(input)
      end

      def create_access_point(input : Types::CreateAccessPointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCESS_POINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new, empty file system. The operation requires a creation token in the request that Amazon
      # EFS uses to ensure idempotent creation (calling the operation with same creation token has no
      # effect). If a file system does not currently exist that is owned by the caller's Amazon Web Services
      # account with the specified creation token, this operation does the following: Creates a new, empty
      # file system. The file system will have an Amazon EFS assigned ID, and an initial lifecycle state
      # creating . Returns with the description of the created file system. Otherwise, this operation
      # returns a FileSystemAlreadyExists error with the ID of the existing file system. For basic use
      # cases, you can use a randomly generated UUID for the creation token. The idempotent operation allows
      # you to retry a CreateFileSystem call without risk of creating an extra file system. This can happen
      # when an initial call fails in a way that leaves it uncertain whether or not a file system was
      # actually created. An example might be that a transport level timeout occurred or your connection was
      # reset. As long as you use the same creation token, if the initial call had succeeded in creating a
      # file system, the client can learn of its existence from the FileSystemAlreadyExists error. For more
      # information, see Creating a file system in the Amazon EFS User Guide . The CreateFileSystem call
      # returns while the file system's lifecycle state is still creating . You can check the file system
      # creation status by calling the DescribeFileSystems operation, which among other things returns the
      # file system state. This operation accepts an optional PerformanceMode parameter that you choose for
      # your file system. We recommend generalPurpose PerformanceMode for all file systems. The maxIO mode
      # is a previous generation performance type that is designed for highly parallelized workloads that
      # can tolerate higher latencies than the generalPurpose mode. MaxIO mode is not supported for One Zone
      # file systems or file systems that use Elastic throughput. The PerformanceMode can't be changed after
      # the file system has been created. For more information, see Amazon EFS performance modes . You can
      # set the throughput mode for the file system using the ThroughputMode parameter. After the file
      # system is fully created, Amazon EFS sets its lifecycle state to available , at which point you can
      # create one or more mount targets for the file system in your VPC. For more information, see
      # CreateMountTarget . You mount your Amazon EFS file system on an EC2 instances in your VPC by using
      # the mount target. For more information, see Amazon EFS: How it Works . This operation requires
      # permissions for the elasticfilesystem:CreateFileSystem action. File systems can be tagged on
      # creation. If tags are specified in the creation action, IAM performs additional authorization on the
      # elasticfilesystem:TagResource action to verify if users have permissions to create tags. Therefore,
      # you must grant explicit permissions to use the elasticfilesystem:TagResource action. For more
      # information, see Granting permissions to tag resources during creation .

      def create_file_system(
        creation_token : String,
        availability_zone_name : String? = nil,
        backup : Bool? = nil,
        encrypted : Bool? = nil,
        kms_key_id : String? = nil,
        performance_mode : String? = nil,
        provisioned_throughput_in_mibps : Float64? = nil,
        tags : Array(Types::Tag)? = nil,
        throughput_mode : String? = nil
      ) : Protocol::Request
        input = Types::CreateFileSystemRequest.new(creation_token: creation_token, availability_zone_name: availability_zone_name, backup: backup, encrypted: encrypted, kms_key_id: kms_key_id, performance_mode: performance_mode, provisioned_throughput_in_mibps: provisioned_throughput_in_mibps, tags: tags, throughput_mode: throughput_mode)
        create_file_system(input)
      end

      def create_file_system(input : Types::CreateFileSystemRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FILE_SYSTEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a mount target for a file system. You can then mount the file system on EC2 instances by
      # using the mount target. You can create one mount target in each Availability Zone in your VPC. All
      # EC2 instances in a VPC within a given Availability Zone share a single mount target for a given file
      # system. If you have multiple subnets in an Availability Zone, you create a mount target in one of
      # the subnets. EC2 instances do not need to be in the same subnet as the mount target in order to
      # access their file system. You can create only one mount target for a One Zone file system. You must
      # create that mount target in the same Availability Zone in which the file system is located. Use the
      # AvailabilityZoneName and AvailabiltyZoneId properties in the DescribeFileSystems response object to
      # get this information. Use the subnetId associated with the file system's Availability Zone when
      # creating the mount target. For more information, see Amazon EFS: How it Works . To create a mount
      # target for a file system, the file system's lifecycle state must be available . For more
      # information, see DescribeFileSystems . In the request, provide the following: The file system ID for
      # which you are creating the mount target. A subnet ID, which determines the following: The VPC in
      # which Amazon EFS creates the mount target The Availability Zone in which Amazon EFS creates the
      # mount target The IP address range from which Amazon EFS selects the IP address of the mount target
      # (if you don't specify an IP address in the request) After creating the mount target, Amazon EFS
      # returns a response that includes, a MountTargetId and an IpAddress . You use this IP address when
      # mounting the file system in an EC2 instance. You can also use the mount target's DNS name when
      # mounting the file system. The EC2 instance on which you mount the file system by using the mount
      # target can resolve the mount target's DNS name to its IP address. For more information, see How it
      # Works: Implementation Overview . Note that you can create mount targets for a file system in only
      # one VPC, and there can be only one mount target per Availability Zone. That is, if the file system
      # already has one or more mount targets created for it, the subnet specified in the request to add
      # another mount target must meet the following requirements: Must belong to the same VPC as the
      # subnets of the existing mount targets Must not be in the same Availability Zone as any of the
      # subnets of the existing mount targets If the request satisfies the requirements, Amazon EFS does the
      # following: Creates a new mount target in the specified subnet. Also creates a new network interface
      # in the subnet as follows: If the request provides an IpAddress , Amazon EFS assigns that IP address
      # to the network interface. Otherwise, Amazon EFS assigns a free address in the subnet (in the same
      # way that the Amazon EC2 CreateNetworkInterface call does when a request does not specify a primary
      # private IP address). If the request provides SecurityGroups , this network interface is associated
      # with those security groups. Otherwise, it belongs to the default security group for the subnet's
      # VPC. Assigns the description Mount target fsmt-id for file system fs-id where fsmt-id is the mount
      # target ID, and fs-id is the FileSystemId . Sets the requesterManaged property of the network
      # interface to true , and the requesterId value to EFS . Each Amazon EFS mount target has one
      # corresponding requester-managed EC2 network interface. After the network interface is created,
      # Amazon EFS sets the NetworkInterfaceId field in the mount target's description to the network
      # interface ID, and the IpAddress field to its address. If network interface creation fails, the
      # entire CreateMountTarget operation fails. The CreateMountTarget call returns only after creating the
      # network interface, but while the mount target state is still creating , you can check the mount
      # target creation status by calling the DescribeMountTargets operation, which among other things
      # returns the mount target state. We recommend that you create a mount target in each of the
      # Availability Zones. There are cost considerations for using a file system in an Availability Zone
      # through a mount target created in another Availability Zone. For more information, see Amazon EFS
      # pricing . In addition, by always using a mount target local to the instance's Availability Zone, you
      # eliminate a partial failure scenario. If the Availability Zone in which your mount target is created
      # goes down, then you can't access your file system through that mount target. This operation requires
      # permissions for the following action on the file system: elasticfilesystem:CreateMountTarget This
      # operation also requires permissions for the following Amazon EC2 actions: ec2:DescribeSubnets
      # ec2:DescribeNetworkInterfaces ec2:CreateNetworkInterface

      def create_mount_target(
        file_system_id : String,
        subnet_id : String,
        ip_address : String? = nil,
        ip_address_type : String? = nil,
        ipv6_address : String? = nil,
        security_groups : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateMountTargetRequest.new(file_system_id: file_system_id, subnet_id: subnet_id, ip_address: ip_address, ip_address_type: ip_address_type, ipv6_address: ipv6_address, security_groups: security_groups)
        create_mount_target(input)
      end

      def create_mount_target(input : Types::CreateMountTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MOUNT_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a replication conﬁguration to either a new or existing EFS file system. For more
      # information, see Amazon EFS replication in the Amazon EFS User Guide . The replication configuration
      # specifies the following: Source file system – The EFS file system that you want to replicate.
      # Destination file system – The destination file system to which the source file system is replicated.
      # There can only be one destination file system in a replication configuration. A file system can be
      # part of only one replication configuration. The destination parameters for the replication
      # configuration depend on whether you are replicating to a new file system or to an existing file
      # system, and if you are replicating across Amazon Web Services accounts. See DestinationToCreate for
      # more information. This operation requires permissions for the
      # elasticfilesystem:CreateReplicationConfiguration action. Additionally, other permissions are
      # required depending on how you are replicating file systems. For more information, see Required
      # permissions for replication in the Amazon EFS User Guide .

      def create_replication_configuration(
        destinations : Array(Types::DestinationToCreate),
        source_file_system_id : String
      ) : Protocol::Request
        input = Types::CreateReplicationConfigurationRequest.new(destinations: destinations, source_file_system_id: source_file_system_id)
        create_replication_configuration(input)
      end

      def create_replication_configuration(input : Types::CreateReplicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REPLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # DEPRECATED - CreateTags is deprecated and not maintained. To create tags for EFS resources, use the
      # API action. Creates or overwrites tags associated with a file system. Each tag is a key-value pair.
      # If a tag key specified in the request already exists on the file system, this operation overwrites
      # its value with the value provided in the request. If you add the Name tag to your file system,
      # Amazon EFS returns it in the response to the DescribeFileSystems operation. This operation requires
      # permission for the elasticfilesystem:CreateTags action.

      def create_tags(
        file_system_id : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::CreateTagsRequest.new(file_system_id: file_system_id, tags: tags)
        create_tags(input)
      end

      def create_tags(input : Types::CreateTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified access point. After deletion is complete, new clients can no longer connect to
      # the access points. Clients connected to the access point at the time of deletion will continue to
      # function until they terminate their connection. This operation requires permissions for the
      # elasticfilesystem:DeleteAccessPoint action.

      def delete_access_point(
        access_point_id : String
      ) : Protocol::Request
        input = Types::DeleteAccessPointRequest.new(access_point_id: access_point_id)
        delete_access_point(input)
      end

      def delete_access_point(input : Types::DeleteAccessPointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCESS_POINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a file system, permanently severing access to its contents. Upon return, the file system no
      # longer exists and you can't access any contents of the deleted file system. You need to manually
      # delete mount targets attached to a file system before you can delete an EFS file system. This step
      # is performed for you when you use the Amazon Web Services console to delete a file system. You
      # cannot delete a file system that is part of an EFS replication configuration. You need to delete the
      # replication configuration first. You can't delete a file system that is in use. That is, if the file
      # system has any mount targets, you must first delete them. For more information, see
      # DescribeMountTargets and DeleteMountTarget . The DeleteFileSystem call returns while the file system
      # state is still deleting . You can check the file system deletion status by calling the
      # DescribeFileSystems operation, which returns a list of file systems in your account. If you pass
      # file system ID or creation token for the deleted file system, the DescribeFileSystems returns a 404
      # FileSystemNotFound error. This operation requires permissions for the
      # elasticfilesystem:DeleteFileSystem action.

      def delete_file_system(
        file_system_id : String
      ) : Protocol::Request
        input = Types::DeleteFileSystemRequest.new(file_system_id: file_system_id)
        delete_file_system(input)
      end

      def delete_file_system(input : Types::DeleteFileSystemRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FILE_SYSTEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the FileSystemPolicy for the specified file system. The default FileSystemPolicy goes into
      # effect once the existing policy is deleted. For more information about the default file system
      # policy, see Using Resource-based Policies with EFS . This operation requires permissions for the
      # elasticfilesystem:DeleteFileSystemPolicy action.

      def delete_file_system_policy(
        file_system_id : String
      ) : Protocol::Request
        input = Types::DeleteFileSystemPolicyRequest.new(file_system_id: file_system_id)
        delete_file_system_policy(input)
      end

      def delete_file_system_policy(input : Types::DeleteFileSystemPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FILE_SYSTEM_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified mount target. This operation forcibly breaks any mounts of the file system by
      # using the mount target that is being deleted, which might disrupt instances or applications using
      # those mounts. To avoid applications getting cut off abruptly, you might consider unmounting any
      # mounts of the mount target, if feasible. The operation also deletes the associated network
      # interface. Uncommitted writes might be lost, but breaking a mount target using this operation does
      # not corrupt the file system itself. The file system you created remains. You can mount an EC2
      # instance in your VPC by using another mount target. This operation requires permissions for the
      # following action on the file system: elasticfilesystem:DeleteMountTarget The DeleteMountTarget call
      # returns while the mount target state is still deleting . You can check the mount target deletion by
      # calling the DescribeMountTargets operation, which returns a list of mount target descriptions for
      # the given file system. The operation also requires permissions for the following Amazon EC2 action
      # on the mount target's network interface: ec2:DeleteNetworkInterface

      def delete_mount_target(
        mount_target_id : String
      ) : Protocol::Request
        input = Types::DeleteMountTargetRequest.new(mount_target_id: mount_target_id)
        delete_mount_target(input)
      end

      def delete_mount_target(input : Types::DeleteMountTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MOUNT_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a replication configuration. Deleting a replication configuration ends the replication
      # process. After a replication configuration is deleted, the destination file system becomes Writeable
      # and its replication overwrite protection is re-enabled. For more information, see Delete a
      # replication configuration . This operation requires permissions for the
      # elasticfilesystem:DeleteReplicationConfiguration action.

      def delete_replication_configuration(
        source_file_system_id : String,
        deletion_mode : String? = nil
      ) : Protocol::Request
        input = Types::DeleteReplicationConfigurationRequest.new(source_file_system_id: source_file_system_id, deletion_mode: deletion_mode)
        delete_replication_configuration(input)
      end

      def delete_replication_configuration(input : Types::DeleteReplicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REPLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # DEPRECATED - DeleteTags is deprecated and not maintained. To remove tags from EFS resources, use the
      # API action. Deletes the specified tags from a file system. If the DeleteTags request includes a tag
      # key that doesn't exist, Amazon EFS ignores it and doesn't cause an error. For more information about
      # tags and related restrictions, see Tag restrictions in the Billing and Cost Management User Guide .
      # This operation requires permissions for the elasticfilesystem:DeleteTags action.

      def delete_tags(
        file_system_id : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::DeleteTagsRequest.new(file_system_id: file_system_id, tag_keys: tag_keys)
        delete_tags(input)
      end

      def delete_tags(input : Types::DeleteTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the description of a specific Amazon EFS access point if the AccessPointId is provided. If
      # you provide an EFS FileSystemId , it returns descriptions of all access points for that file system.
      # You can provide either an AccessPointId or a FileSystemId in the request, but not both. This
      # operation requires permissions for the elasticfilesystem:DescribeAccessPoints action.

      def describe_access_points(
        access_point_id : String? = nil,
        file_system_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeAccessPointsRequest.new(access_point_id: access_point_id, file_system_id: file_system_id, max_results: max_results, next_token: next_token)
        describe_access_points(input)
      end

      def describe_access_points(input : Types::DescribeAccessPointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCESS_POINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the account preferences settings for the Amazon Web Services account associated with the
      # user making the request, in the current Amazon Web Services Region.

      def describe_account_preferences(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeAccountPreferencesRequest.new(max_results: max_results, next_token: next_token)
        describe_account_preferences(input)
      end

      def describe_account_preferences(input : Types::DescribeAccountPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCOUNT_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the backup policy for the specified EFS file system.

      def describe_backup_policy(
        file_system_id : String
      ) : Protocol::Request
        input = Types::DescribeBackupPolicyRequest.new(file_system_id: file_system_id)
        describe_backup_policy(input)
      end

      def describe_backup_policy(input : Types::DescribeBackupPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BACKUP_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the FileSystemPolicy for the specified EFS file system. This operation requires permissions
      # for the elasticfilesystem:DescribeFileSystemPolicy action.

      def describe_file_system_policy(
        file_system_id : String
      ) : Protocol::Request
        input = Types::DescribeFileSystemPolicyRequest.new(file_system_id: file_system_id)
        describe_file_system_policy(input)
      end

      def describe_file_system_policy(input : Types::DescribeFileSystemPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FILE_SYSTEM_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the description of a specific Amazon EFS file system if either the file system CreationToken
      # or the FileSystemId is provided. Otherwise, it returns descriptions of all file systems owned by the
      # caller's Amazon Web Services account in the Amazon Web Services Region of the endpoint that you're
      # calling. When retrieving all file system descriptions, you can optionally specify the MaxItems
      # parameter to limit the number of descriptions in a response. This number is automatically set to
      # 100. If more file system descriptions remain, Amazon EFS returns a NextMarker , an opaque token, in
      # the response. In this case, you should send a subsequent request with the Marker request parameter
      # set to the value of NextMarker . To retrieve a list of your file system descriptions, this operation
      # is used in an iterative process, where DescribeFileSystems is called first without the Marker and
      # then the operation continues to call it with the Marker parameter set to the value of the NextMarker
      # from the previous response until the response has no NextMarker . The order of file systems returned
      # in the response of one DescribeFileSystems call and the order of file systems returned across the
      # responses of a multi-call iteration is unspecified. This operation requires permissions for the
      # elasticfilesystem:DescribeFileSystems action.

      def describe_file_systems(
        creation_token : String? = nil,
        file_system_id : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::DescribeFileSystemsRequest.new(creation_token: creation_token, file_system_id: file_system_id, marker: marker, max_items: max_items)
        describe_file_systems(input)
      end

      def describe_file_systems(input : Types::DescribeFileSystemsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FILE_SYSTEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current LifecycleConfiguration object for the specified EFS file system. Lifecycle
      # management uses the LifecycleConfiguration object to identify when to move files between storage
      # classes. For a file system without a LifecycleConfiguration object, the call returns an empty array
      # in the response. This operation requires permissions for the
      # elasticfilesystem:DescribeLifecycleConfiguration operation.

      def describe_lifecycle_configuration(
        file_system_id : String
      ) : Protocol::Request
        input = Types::DescribeLifecycleConfigurationRequest.new(file_system_id: file_system_id)
        describe_lifecycle_configuration(input)
      end

      def describe_lifecycle_configuration(input : Types::DescribeLifecycleConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_LIFECYCLE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the security groups currently in effect for a mount target. This operation requires that the
      # network interface of the mount target has been created and the lifecycle state of the mount target
      # is not deleted . This operation requires permissions for the following actions:
      # elasticfilesystem:DescribeMountTargetSecurityGroups action on the mount target's file system.
      # ec2:DescribeNetworkInterfaceAttribute action on the mount target's network interface.

      def describe_mount_target_security_groups(
        mount_target_id : String
      ) : Protocol::Request
        input = Types::DescribeMountTargetSecurityGroupsRequest.new(mount_target_id: mount_target_id)
        describe_mount_target_security_groups(input)
      end

      def describe_mount_target_security_groups(input : Types::DescribeMountTargetSecurityGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MOUNT_TARGET_SECURITY_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the descriptions of all the current mount targets, or a specific mount target, for a file
      # system. When requesting all of the current mount targets, the order of mount targets returned in the
      # response is unspecified. This operation requires permissions for the
      # elasticfilesystem:DescribeMountTargets action, on either the file system ID that you specify in
      # FileSystemId , or on the file system of the mount target that you specify in MountTargetId .

      def describe_mount_targets(
        access_point_id : String? = nil,
        file_system_id : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        mount_target_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeMountTargetsRequest.new(access_point_id: access_point_id, file_system_id: file_system_id, marker: marker, max_items: max_items, mount_target_id: mount_target_id)
        describe_mount_targets(input)
      end

      def describe_mount_targets(input : Types::DescribeMountTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MOUNT_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the replication configuration for a specific file system. If a file system is not
      # specified, all of the replication configurations for the Amazon Web Services account in an Amazon
      # Web Services Region are retrieved.

      def describe_replication_configurations(
        file_system_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeReplicationConfigurationsRequest.new(file_system_id: file_system_id, max_results: max_results, next_token: next_token)
        describe_replication_configurations(input)
      end

      def describe_replication_configurations(input : Types::DescribeReplicationConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REPLICATION_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # DEPRECATED - The DescribeTags action is deprecated and not maintained. To view tags associated with
      # EFS resources, use the ListTagsForResource API action. Returns the tags associated with a file
      # system. The order of tags returned in the response of one DescribeTags call and the order of tags
      # returned across the responses of a multiple-call iteration (when using pagination) is unspecified.
      # This operation requires permissions for the elasticfilesystem:DescribeTags action.

      def describe_tags(
        file_system_id : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::DescribeTagsRequest.new(file_system_id: file_system_id, marker: marker, max_items: max_items)
        describe_tags(input)
      end

      def describe_tags(input : Types::DescribeTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all tags for a top-level EFS resource. You must provide the ID of the resource that you want
      # to retrieve the tags for. This operation requires permissions for the
      # elasticfilesystem:DescribeAccessPoints action.

      def list_tags_for_resource(
        resource_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_id: resource_id, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the set of security groups in effect for a mount target. When you create a mount target,
      # Amazon EFS also creates a new network interface. For more information, see CreateMountTarget . This
      # operation replaces the security groups in effect for the network interface associated with a mount
      # target, with the SecurityGroups provided in the request. This operation requires that the network
      # interface of the mount target has been created and the lifecycle state of the mount target is not
      # deleted . The operation requires permissions for the following actions:
      # elasticfilesystem:ModifyMountTargetSecurityGroups action on the mount target's file system.
      # ec2:ModifyNetworkInterfaceAttribute action on the mount target's network interface.

      def modify_mount_target_security_groups(
        mount_target_id : String,
        security_groups : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ModifyMountTargetSecurityGroupsRequest.new(mount_target_id: mount_target_id, security_groups: security_groups)
        modify_mount_target_security_groups(input)
      end

      def modify_mount_target_security_groups(input : Types::ModifyMountTargetSecurityGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::MODIFY_MOUNT_TARGET_SECURITY_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to set the account preference in the current Amazon Web Services Region to use
      # long 17 character (63 bit) or short 8 character (32 bit) resource IDs for new EFS file system and
      # mount target resources. All existing resource IDs are not affected by any changes you make. You can
      # set the ID preference during the opt-in period as EFS transitions to long resource IDs. For more
      # information, see Managing Amazon EFS resource IDs . Starting in October, 2021, you will receive an
      # error if you try to set the account preference to use the short 8 character format resource ID.
      # Contact Amazon Web Services support if you receive an error and must use short IDs for file system
      # and mount target resources.

      def put_account_preferences(
        resource_id_type : String
      ) : Protocol::Request
        input = Types::PutAccountPreferencesRequest.new(resource_id_type: resource_id_type)
        put_account_preferences(input)
      end

      def put_account_preferences(input : Types::PutAccountPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the file system's backup policy. Use this action to start or stop automatic backups of the
      # file system.

      def put_backup_policy(
        backup_policy : Types::BackupPolicy,
        file_system_id : String
      ) : Protocol::Request
        input = Types::PutBackupPolicyRequest.new(backup_policy: backup_policy, file_system_id: file_system_id)
        put_backup_policy(input)
      end

      def put_backup_policy(input : Types::PutBackupPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_BACKUP_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies an Amazon EFS FileSystemPolicy to an Amazon EFS file system. A file system policy is an IAM
      # resource-based policy and can contain multiple policy statements. A file system always has exactly
      # one file system policy, which can be the default policy or an explicit policy set or updated using
      # this API operation. EFS file system policies have a 20,000 character limit. When an explicit policy
      # is set, it overrides the default policy. For more information about the default file system policy,
      # see Default EFS file system policy . EFS file system policies have a 20,000 character limit. This
      # operation requires permissions for the elasticfilesystem:PutFileSystemPolicy action.

      def put_file_system_policy(
        file_system_id : String,
        policy : String,
        bypass_policy_lockout_safety_check : Bool? = nil
      ) : Protocol::Request
        input = Types::PutFileSystemPolicyRequest.new(file_system_id: file_system_id, policy: policy, bypass_policy_lockout_safety_check: bypass_policy_lockout_safety_check)
        put_file_system_policy(input)
      end

      def put_file_system_policy(input : Types::PutFileSystemPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FILE_SYSTEM_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this action to manage storage for your file system. A LifecycleConfiguration consists of one or
      # more LifecyclePolicy objects that define the following: TransitionToIA – When to move files in the
      # file system from primary storage (Standard storage class) into the Infrequent Access (IA) storage.
      # TransitionToArchive – When to move files in the file system from their current storage class (either
      # IA or Standard storage) into the Archive storage. File systems cannot transition into Archive
      # storage before transitioning into IA storage. Therefore, TransitionToArchive must either not be set
      # or must be later than TransitionToIA. The Archive storage class is available only for file systems
      # that use the Elastic throughput mode and the General Purpose performance mode.
      # TransitionToPrimaryStorageClass – Whether to move files in the file system back to primary storage
      # (Standard storage class) after they are accessed in IA or Archive storage. For more information, see
      # Managing file system storage . Each Amazon EFS file system supports one lifecycle configuration,
      # which applies to all files in the file system. If a LifecycleConfiguration object already exists for
      # the specified file system, a PutLifecycleConfiguration call modifies the existing configuration. A
      # PutLifecycleConfiguration call with an empty LifecyclePolicies array in the request body deletes any
      # existing LifecycleConfiguration . In the request, specify the following: The ID for the file system
      # for which you are enabling, disabling, or modifying lifecycle management. A LifecyclePolicies array
      # of LifecyclePolicy objects that define when to move files to IA storage, to Archive storage, and
      # back to primary storage. Amazon EFS requires that each LifecyclePolicy object have only have a
      # single transition, so the LifecyclePolicies array needs to be structured with separate
      # LifecyclePolicy objects. See the example requests in the following section for more information.
      # This operation requires permissions for the elasticfilesystem:PutLifecycleConfiguration operation.
      # To apply a LifecycleConfiguration object to an encrypted file system, you need the same Key
      # Management Service permissions as when you created the encrypted file system.

      def put_lifecycle_configuration(
        file_system_id : String,
        lifecycle_policies : Array(Types::LifecyclePolicy)
      ) : Protocol::Request
        input = Types::PutLifecycleConfigurationRequest.new(file_system_id: file_system_id, lifecycle_policies: lifecycle_policies)
        put_lifecycle_configuration(input)
      end

      def put_lifecycle_configuration(input : Types::PutLifecycleConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_LIFECYCLE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a tag for an EFS resource. You can create tags for EFS file systems and access points using
      # this API operation. This operation requires permissions for the elasticfilesystem:TagResource
      # action.

      def tag_resource(
        resource_id : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_id: resource_id, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from an EFS resource. You can remove tags from EFS file systems and access points using
      # this API operation. This operation requires permissions for the elasticfilesystem:UntagResource
      # action.

      def untag_resource(
        resource_id : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_id: resource_id, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the throughput mode or the amount of provisioned throughput of an existing file system.

      def update_file_system(
        file_system_id : String,
        provisioned_throughput_in_mibps : Float64? = nil,
        throughput_mode : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFileSystemRequest.new(file_system_id: file_system_id, provisioned_throughput_in_mibps: provisioned_throughput_in_mibps, throughput_mode: throughput_mode)
        update_file_system(input)
      end

      def update_file_system(input : Types::UpdateFileSystemRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FILE_SYSTEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates protection on the file system. This operation requires permissions for the
      # elasticfilesystem:UpdateFileSystemProtection action.

      def update_file_system_protection(
        file_system_id : String,
        replication_overwrite_protection : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFileSystemProtectionRequest.new(file_system_id: file_system_id, replication_overwrite_protection: replication_overwrite_protection)
        update_file_system_protection(input)
      end

      def update_file_system_protection(input : Types::UpdateFileSystemProtectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FILE_SYSTEM_PROTECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
