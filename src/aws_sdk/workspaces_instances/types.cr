require "json"
require "time"

module AwsSdk
  module WorkspacesInstances
    module Types

      # Indicates insufficient permissions to perform the requested action.
      struct AccessDeniedException
        include JSON::Serializable

        # Detailed explanation of the access denial.
        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Specifies volume attachment parameters.
      struct AssociateVolumeRequest
        include JSON::Serializable

        # Device path for volume attachment.
        @[JSON::Field(key: "Device")]
        getter device : String

        # Volume to be attached.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        # WorkSpace Instance to attach volume to.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String

        def initialize(
          @device : String,
          @volume_id : String,
          @workspace_instance_id : String
        )
        end
      end

      # Confirms volume attachment.
      struct AssociateVolumeResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Defines device mapping for WorkSpace Instance storage.
      struct BlockDeviceMappingRequest
        include JSON::Serializable

        # Name of the device for storage mapping.
        @[JSON::Field(key: "DeviceName")]
        getter device_name : String?

        # EBS volume configuration for the device.
        @[JSON::Field(key: "Ebs")]
        getter ebs : Types::EbsBlockDevice?

        # Indicates device should not be mapped.
        @[JSON::Field(key: "NoDevice")]
        getter no_device : String?

        # Virtual device name for ephemeral storage.
        @[JSON::Field(key: "VirtualName")]
        getter virtual_name : String?

        def initialize(
          @device_name : String? = nil,
          @ebs : Types::EbsBlockDevice? = nil,
          @no_device : String? = nil,
          @virtual_name : String? = nil
        )
        end
      end

      # Specifies capacity reservation preferences.
      struct CapacityReservationSpecification
        include JSON::Serializable

        # Preference for using capacity reservation.
        @[JSON::Field(key: "CapacityReservationPreference")]
        getter capacity_reservation_preference : String?

        # Specific capacity reservation target.
        @[JSON::Field(key: "CapacityReservationTarget")]
        getter capacity_reservation_target : Types::CapacityReservationTarget?

        def initialize(
          @capacity_reservation_preference : String? = nil,
          @capacity_reservation_target : Types::CapacityReservationTarget? = nil
        )
        end
      end

      # Identifies a specific capacity reservation.
      struct CapacityReservationTarget
        include JSON::Serializable

        # Unique identifier for the capacity reservation.
        @[JSON::Field(key: "CapacityReservationId")]
        getter capacity_reservation_id : String?

        # ARN of the capacity reservation resource group.
        @[JSON::Field(key: "CapacityReservationResourceGroupArn")]
        getter capacity_reservation_resource_group_arn : String?

        def initialize(
          @capacity_reservation_id : String? = nil,
          @capacity_reservation_resource_group_arn : String? = nil
        )
        end
      end

      # Signals a conflict with the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        # Description of the conflict encountered.
        @[JSON::Field(key: "Message")]
        getter message : String

        # Identifier of the conflicting resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Type of the conflicting resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Defines connection tracking parameters for network interfaces.
      struct ConnectionTrackingSpecificationRequest
        include JSON::Serializable

        # Timeout for established TCP connections.
        @[JSON::Field(key: "TcpEstablishedTimeout")]
        getter tcp_established_timeout : Int32?

        # Timeout for UDP stream connections.
        @[JSON::Field(key: "UdpStreamTimeout")]
        getter udp_stream_timeout : Int32?

        # General timeout for UDP connections.
        @[JSON::Field(key: "UdpTimeout")]
        getter udp_timeout : Int32?

        def initialize(
          @tcp_established_timeout : Int32? = nil,
          @udp_stream_timeout : Int32? = nil,
          @udp_timeout : Int32? = nil
        )
        end
      end

      # Configures CPU-specific settings for WorkSpace Instance.
      struct CpuOptionsRequest
        include JSON::Serializable

        # AMD Secure Encrypted Virtualization configuration.
        @[JSON::Field(key: "AmdSevSnp")]
        getter amd_sev_snp : String?

        # Number of CPU cores to allocate.
        @[JSON::Field(key: "CoreCount")]
        getter core_count : Int32?

        # Number of threads per CPU core.
        @[JSON::Field(key: "ThreadsPerCore")]
        getter threads_per_core : Int32?

        def initialize(
          @amd_sev_snp : String? = nil,
          @core_count : Int32? = nil,
          @threads_per_core : Int32? = nil
        )
        end
      end

      # Specifies volume creation parameters.
      struct CreateVolumeRequest
        include JSON::Serializable

        # Availability zone for the volume.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String

        # Unique token to prevent duplicate volume creation.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Indicates if the volume should be encrypted.
        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # Input/output operations per second for the volume.
        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # KMS key for volume encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Volume size in gigabytes.
        @[JSON::Field(key: "SizeInGB")]
        getter size_in_gb : Int32?

        # Source snapshot for volume creation.
        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        # Metadata tags for the volume.
        @[JSON::Field(key: "TagSpecifications")]
        getter tag_specifications : Array(Types::TagSpecification)?

        # Volume throughput performance.
        @[JSON::Field(key: "Throughput")]
        getter throughput : Int32?

        # Type of EBS volume.
        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String?

        def initialize(
          @availability_zone : String,
          @client_token : String? = nil,
          @encrypted : Bool? = nil,
          @iops : Int32? = nil,
          @kms_key_id : String? = nil,
          @size_in_gb : Int32? = nil,
          @snapshot_id : String? = nil,
          @tag_specifications : Array(Types::TagSpecification)? = nil,
          @throughput : Int32? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # Returns the created volume identifier.
      struct CreateVolumeResponse
        include JSON::Serializable

        # Unique identifier for the new volume.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        def initialize(
          @volume_id : String? = nil
        )
        end
      end

      # Defines the configuration parameters for creating a new WorkSpaces Instance.
      struct CreateWorkspaceInstanceRequest
        include JSON::Serializable

        # Comprehensive configuration settings for the WorkSpaces Instance, including network, compute, and
        # storage parameters.
        @[JSON::Field(key: "ManagedInstance")]
        getter managed_instance : Types::ManagedInstanceRequest

        # Unique token to ensure idempotent instance creation, preventing duplicate workspace launches.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Optional metadata tags for categorizing and managing WorkSpaces Instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @managed_instance : Types::ManagedInstanceRequest,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Returns the unique identifier for the newly created WorkSpaces Instance.
      struct CreateWorkspaceInstanceResponse
        include JSON::Serializable

        # Unique identifier assigned to the newly created WorkSpaces Instance.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String?

        def initialize(
          @workspace_instance_id : String? = nil
        )
        end
      end

      # Defines CPU credit configuration for burstable instances.
      struct CreditSpecificationRequest
        include JSON::Serializable

        # CPU credit specification mode.
        @[JSON::Field(key: "CpuCredits")]
        getter cpu_credits : String?

        def initialize(
          @cpu_credits : String? = nil
        )
        end
      end

      # Specifies the volume to delete.
      struct DeleteVolumeRequest
        include JSON::Serializable

        # Identifier of the volume to delete.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        def initialize(
          @volume_id : String
        )
        end
      end

      # Confirms volume deletion.
      struct DeleteVolumeResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The WorkSpace to delete
      struct DeleteWorkspaceInstanceRequest
        include JSON::Serializable

        # Unique identifier of the WorkSpaces Instance targeted for deletion.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String

        def initialize(
          @workspace_instance_id : String
        )
        end
      end

      # Confirms the successful deletion of the specified WorkSpace Instance.
      struct DeleteWorkspaceInstanceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies volume detachment parameters.
      struct DisassociateVolumeRequest
        include JSON::Serializable

        # Volume to be detached.
        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String

        # WorkSpace Instance to detach volume from.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String

        # Device path of volume to detach.
        @[JSON::Field(key: "Device")]
        getter device : String?

        # Mode for volume detachment.
        @[JSON::Field(key: "DisassociateMode")]
        getter disassociate_mode : String?

        def initialize(
          @volume_id : String,
          @workspace_instance_id : String,
          @device : String? = nil,
          @disassociate_mode : String? = nil
        )
        end
      end

      # Confirms volume detachment.
      struct DisassociateVolumeResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Captures detailed error information for EC2 instance operations.
      struct EC2InstanceError
        include JSON::Serializable

        # Unique error code identifying the specific EC2 instance error.
        @[JSON::Field(key: "EC2ErrorCode")]
        getter ec2_error_code : String?

        # Detailed description of the EC2 instance error.
        @[JSON::Field(key: "EC2ErrorMessage")]
        getter ec2_error_message : String?

        # Type of exception encountered during EC2 instance operation.
        @[JSON::Field(key: "EC2ExceptionType")]
        getter ec2_exception_type : String?

        def initialize(
          @ec2_error_code : String? = nil,
          @ec2_error_message : String? = nil,
          @ec2_exception_type : String? = nil
        )
        end
      end

      # Represents an EC2 instance managed by WorkSpaces.
      struct EC2ManagedInstance
        include JSON::Serializable

        # Unique identifier of the managed EC2 instance.
        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        def initialize(
          @instance_id : String? = nil
        )
        end
      end

      # Defines configuration for an Elastic Block Store volume.
      struct EbsBlockDevice
        include JSON::Serializable

        # Indicates if the volume is encrypted.
        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # Input/output operations per second for the volume.
        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # KMS key used for volume encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Volume data transfer rate.
        @[JSON::Field(key: "Throughput")]
        getter throughput : Int32?

        # Size of the EBS volume in gigabytes.
        @[JSON::Field(key: "VolumeSize")]
        getter volume_size : Int32?

        # Type of EBS volume (e.g., gp2, io1).
        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String?

        def initialize(
          @encrypted : Bool? = nil,
          @iops : Int32? = nil,
          @kms_key_id : String? = nil,
          @throughput : Int32? = nil,
          @volume_size : Int32? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # Defines Elastic Network Adapter (ENA) Scalable Reliable Datagram (SRD) configuration.
      struct EnaSrdSpecificationRequest
        include JSON::Serializable

        # Enables or disables ENA SRD for network performance.
        @[JSON::Field(key: "EnaSrdEnabled")]
        getter ena_srd_enabled : Bool?

        # Configures UDP-specific ENA SRD settings.
        @[JSON::Field(key: "EnaSrdUdpSpecification")]
        getter ena_srd_udp_specification : Types::EnaSrdUdpSpecificationRequest?

        def initialize(
          @ena_srd_enabled : Bool? = nil,
          @ena_srd_udp_specification : Types::EnaSrdUdpSpecificationRequest? = nil
        )
        end
      end

      # Specifies UDP configuration for ENA SRD.
      struct EnaSrdUdpSpecificationRequest
        include JSON::Serializable

        # Enables or disables ENA SRD for UDP traffic.
        @[JSON::Field(key: "EnaSrdUdpEnabled")]
        getter ena_srd_udp_enabled : Bool?

        def initialize(
          @ena_srd_udp_enabled : Bool? = nil
        )
        end
      end

      # Configures AWS Nitro Enclave options for the WorkSpace Instance.
      struct EnclaveOptionsRequest
        include JSON::Serializable

        # Enables or disables AWS Nitro Enclaves for enhanced security.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Identifies the WorkSpaces Instance to retrieve detailed information for.
      struct GetWorkspaceInstanceRequest
        include JSON::Serializable

        # Unique identifier of the WorkSpace Instance to retrieve.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String

        def initialize(
          @workspace_instance_id : String
        )
        end
      end

      # Provides comprehensive details about the requested WorkSpaces Instance.
      struct GetWorkspaceInstanceResponse
        include JSON::Serializable

        # Includes any underlying EC2 instance errors encountered.
        @[JSON::Field(key: "EC2InstanceErrors")]
        getter ec2_instance_errors : Array(Types::EC2InstanceError)?

        # Details of the associated EC2 managed instance.
        @[JSON::Field(key: "EC2ManagedInstance")]
        getter ec2_managed_instance : Types::EC2ManagedInstance?

        # Current provisioning state of the WorkSpaces Instance.
        @[JSON::Field(key: "ProvisionState")]
        getter provision_state : String?

        # Captures any errors specific to the WorkSpace Instance lifecycle.
        @[JSON::Field(key: "WorkspaceInstanceErrors")]
        getter workspace_instance_errors : Array(Types::WorkspaceInstanceError)?

        # Unique identifier of the retrieved WorkSpaces Instance.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String?

        def initialize(
          @ec2_instance_errors : Array(Types::EC2InstanceError)? = nil,
          @ec2_managed_instance : Types::EC2ManagedInstance? = nil,
          @provision_state : String? = nil,
          @workspace_instance_errors : Array(Types::WorkspaceInstanceError)? = nil,
          @workspace_instance_id : String? = nil
        )
        end
      end

      # Defines hibernation configuration for the WorkSpace Instance.
      struct HibernationOptionsRequest
        include JSON::Serializable

        # Enables or disables instance hibernation capability.
        @[JSON::Field(key: "Configured")]
        getter configured : Bool?

        def initialize(
          @configured : Bool? = nil
        )
        end
      end

      # Defines IAM instance profile configuration for WorkSpace Instance.
      struct IamInstanceProfileSpecification
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the IAM instance profile.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Name of the IAM instance profile.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Represents an IPv6 address configuration for a WorkSpace Instance.
      struct InstanceIpv6Address
        include JSON::Serializable

        # Specific IPv6 address assigned to the instance.
        @[JSON::Field(key: "Ipv6Address")]
        getter ipv6_address : String?

        # Indicates if this is the primary IPv6 address for the instance.
        @[JSON::Field(key: "IsPrimaryIpv6")]
        getter is_primary_ipv6 : Bool?

        def initialize(
          @ipv6_address : String? = nil,
          @is_primary_ipv6 : Bool? = nil
        )
        end
      end

      # Configures automatic maintenance settings for WorkSpace Instance.
      struct InstanceMaintenanceOptionsRequest
        include JSON::Serializable

        # Enables or disables automatic instance recovery.
        @[JSON::Field(key: "AutoRecovery")]
        getter auto_recovery : String?

        def initialize(
          @auto_recovery : String? = nil
        )
        end
      end

      # Configures marketplace-specific instance deployment options.
      struct InstanceMarketOptionsRequest
        include JSON::Serializable

        # Specifies the type of marketplace for instance deployment.
        @[JSON::Field(key: "MarketType")]
        getter market_type : String?

        # Configuration options for spot instance deployment.
        @[JSON::Field(key: "SpotOptions")]
        getter spot_options : Types::SpotMarketOptions?

        def initialize(
          @market_type : String? = nil,
          @spot_options : Types::SpotMarketOptions? = nil
        )
        end
      end

      # Defines instance metadata service configuration.
      struct InstanceMetadataOptionsRequest
        include JSON::Serializable

        # Enables or disables HTTP endpoint for instance metadata.
        @[JSON::Field(key: "HttpEndpoint")]
        getter http_endpoint : String?

        # Configures IPv6 support for instance metadata HTTP protocol.
        @[JSON::Field(key: "HttpProtocolIpv6")]
        getter http_protocol_ipv6 : String?

        # Sets maximum number of network hops for metadata PUT responses.
        @[JSON::Field(key: "HttpPutResponseHopLimit")]
        getter http_put_response_hop_limit : Int32?

        # Configures token requirement for instance metadata retrieval.
        @[JSON::Field(key: "HttpTokens")]
        getter http_tokens : String?

        # Enables or disables instance metadata tags retrieval.
        @[JSON::Field(key: "InstanceMetadataTags")]
        getter instance_metadata_tags : String?

        def initialize(
          @http_endpoint : String? = nil,
          @http_protocol_ipv6 : String? = nil,
          @http_put_response_hop_limit : Int32? = nil,
          @http_tokens : String? = nil,
          @instance_metadata_tags : String? = nil
        )
        end
      end

      # Defines network interface configuration for WorkSpace Instance.
      struct InstanceNetworkInterfaceSpecification
        include JSON::Serializable

        # Enables carrier IP address association.
        @[JSON::Field(key: "AssociateCarrierIpAddress")]
        getter associate_carrier_ip_address : Bool?

        # Enables public IP address assignment.
        @[JSON::Field(key: "AssociatePublicIpAddress")]
        getter associate_public_ip_address : Bool?

        # Configures network connection tracking parameters.
        @[JSON::Field(key: "ConnectionTrackingSpecification")]
        getter connection_tracking_specification : Types::ConnectionTrackingSpecificationRequest?

        # Descriptive text for the network interface.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Unique index for the network interface.
        @[JSON::Field(key: "DeviceIndex")]
        getter device_index : Int32?

        # Configures Elastic Network Adapter Scalable Reliable Datagram settings.
        @[JSON::Field(key: "EnaSrdSpecification")]
        getter ena_srd_specification : Types::EnaSrdSpecificationRequest?

        # Security groups associated with the network interface.
        @[JSON::Field(key: "Groups")]
        getter groups : Array(String)?

        # Specifies the type of network interface.
        @[JSON::Field(key: "InterfaceType")]
        getter interface_type : String?

        # Number of IPv4 prefixes to assign.
        @[JSON::Field(key: "Ipv4PrefixCount")]
        getter ipv4_prefix_count : Int32?

        # IPv4 prefix configurations for the interface.
        @[JSON::Field(key: "Ipv4Prefixes")]
        getter ipv4_prefixes : Array(Types::Ipv4PrefixSpecificationRequest)?

        # Number of IPv6 addresses to assign.
        @[JSON::Field(key: "Ipv6AddressCount")]
        getter ipv6_address_count : Int32?

        # Specific IPv6 addresses for the interface.
        @[JSON::Field(key: "Ipv6Addresses")]
        getter ipv6_addresses : Array(Types::InstanceIpv6Address)?

        # Number of IPv6 prefixes to assign.
        @[JSON::Field(key: "Ipv6PrefixCount")]
        getter ipv6_prefix_count : Int32?

        # IPv6 prefix configurations for the interface.
        @[JSON::Field(key: "Ipv6Prefixes")]
        getter ipv6_prefixes : Array(Types::Ipv6PrefixSpecificationRequest)?

        # Index of the network card for multiple network interfaces.
        @[JSON::Field(key: "NetworkCardIndex")]
        getter network_card_index : Int32?

        # Unique identifier for the network interface.
        @[JSON::Field(key: "NetworkInterfaceId")]
        getter network_interface_id : String?

        # Indicates the primary IPv6 configuration.
        @[JSON::Field(key: "PrimaryIpv6")]
        getter primary_ipv6 : Bool?

        # Primary private IP address for the interface.
        @[JSON::Field(key: "PrivateIpAddress")]
        getter private_ip_address : String?

        # List of private IP addresses for the interface.
        @[JSON::Field(key: "PrivateIpAddresses")]
        getter private_ip_addresses : Array(Types::PrivateIpAddressSpecification)?

        # Number of additional private IP addresses to assign.
        @[JSON::Field(key: "SecondaryPrivateIpAddressCount")]
        getter secondary_private_ip_address_count : Int32?

        # Subnet identifier for the network interface.
        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        def initialize(
          @associate_carrier_ip_address : Bool? = nil,
          @associate_public_ip_address : Bool? = nil,
          @connection_tracking_specification : Types::ConnectionTrackingSpecificationRequest? = nil,
          @description : String? = nil,
          @device_index : Int32? = nil,
          @ena_srd_specification : Types::EnaSrdSpecificationRequest? = nil,
          @groups : Array(String)? = nil,
          @interface_type : String? = nil,
          @ipv4_prefix_count : Int32? = nil,
          @ipv4_prefixes : Array(Types::Ipv4PrefixSpecificationRequest)? = nil,
          @ipv6_address_count : Int32? = nil,
          @ipv6_addresses : Array(Types::InstanceIpv6Address)? = nil,
          @ipv6_prefix_count : Int32? = nil,
          @ipv6_prefixes : Array(Types::Ipv6PrefixSpecificationRequest)? = nil,
          @network_card_index : Int32? = nil,
          @network_interface_id : String? = nil,
          @primary_ipv6 : Bool? = nil,
          @private_ip_address : String? = nil,
          @private_ip_addresses : Array(Types::PrivateIpAddressSpecification)? = nil,
          @secondary_private_ip_address_count : Int32? = nil,
          @subnet_id : String? = nil
        )
        end
      end

      # Configures network performance settings for WorkSpace Instance.
      struct InstanceNetworkPerformanceOptionsRequest
        include JSON::Serializable

        # Defines bandwidth allocation strategy for network interfaces.
        @[JSON::Field(key: "BandwidthWeighting")]
        getter bandwidth_weighting : String?

        def initialize(
          @bandwidth_weighting : String? = nil
        )
        end
      end

      # Provides details about a specific WorkSpace Instance type.
      struct InstanceTypeInfo
        include JSON::Serializable

        # Unique identifier for the WorkSpace Instance type.
        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        def initialize(
          @instance_type : String? = nil
        )
        end
      end

      # Indicates an unexpected server-side error occurred.
      struct InternalServerException
        include JSON::Serializable

        # Description of the internal server error.
        @[JSON::Field(key: "Message")]
        getter message : String

        # Recommended wait time before retrying the request.
        @[JSON::Field(key: "RetryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Specifies IPv4 prefix configuration for network interfaces.
      struct Ipv4PrefixSpecificationRequest
        include JSON::Serializable

        # Specific IPv4 prefix for network interface configuration.
        @[JSON::Field(key: "Ipv4Prefix")]
        getter ipv4_prefix : String?

        def initialize(
          @ipv4_prefix : String? = nil
        )
        end
      end

      # Specifies IPv6 prefix configuration for network interfaces.
      struct Ipv6PrefixSpecificationRequest
        include JSON::Serializable

        # Specific IPv6 prefix for network interface configuration.
        @[JSON::Field(key: "Ipv6Prefix")]
        getter ipv6_prefix : String?

        def initialize(
          @ipv6_prefix : String? = nil
        )
        end
      end

      # Specifies license configuration for WorkSpace Instance.
      struct LicenseConfigurationRequest
        include JSON::Serializable

        # ARN of the license configuration for the WorkSpace Instance.
        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String?

        def initialize(
          @license_configuration_arn : String? = nil
        )
        end
      end

      # Defines input parameters for retrieving supported WorkSpaces Instances instance types.
      struct ListInstanceTypesRequest
        include JSON::Serializable

        # Maximum number of instance types to return in a single API call. Enables pagination of instance type
        # results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token for retrieving subsequent pages of instance type results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains the list of instance types supported by WorkSpaces Instances.
      struct ListInstanceTypesResponse
        include JSON::Serializable

        # Collection of supported instance types for WorkSpaces Instances.
        @[JSON::Field(key: "InstanceTypes")]
        getter instance_types : Array(Types::InstanceTypeInfo)

        # Token for retrieving additional instance types if the result set is paginated.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_types : Array(Types::InstanceTypeInfo),
          @next_token : String? = nil
        )
        end
      end

      # Defines input parameters for retrieving supported WorkSpaces Instances regions.
      struct ListRegionsRequest
        include JSON::Serializable

        # Maximum number of regions to return in a single API call. Enables pagination of region results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token for retrieving subsequent pages of region results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains the list of supported AWS regions for WorkSpaces Instances.
      struct ListRegionsResponse
        include JSON::Serializable

        # Collection of AWS regions supported by WorkSpaces Instances.
        @[JSON::Field(key: "Regions")]
        getter regions : Array(Types::Region)

        # Token for retrieving additional regions if the result set is paginated.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @regions : Array(Types::Region),
          @next_token : String? = nil
        )
        end
      end

      # Specifies the WorkSpace Instance to retrieve tags for.
      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Unique identifier of the WorkSpace Instance.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String

        def initialize(
          @workspace_instance_id : String
        )
        end
      end

      # Returns the list of tags for the specified WorkSpace Instance.
      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Collection of tags associated with the WorkSpace Instance.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Defines filters and pagination parameters for retrieving WorkSpaces Instances.
      struct ListWorkspaceInstancesRequest
        include JSON::Serializable

        # Maximum number of WorkSpaces Instances to return in a single response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token for retrieving subsequent pages of WorkSpaces Instances.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter WorkSpaces Instances by their current provisioning states.
        @[JSON::Field(key: "ProvisionStates")]
        getter provision_states : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @provision_states : Array(String)? = nil
        )
        end
      end

      # Contains the list of WorkSpaces Instances matching the specified criteria.
      struct ListWorkspaceInstancesResponse
        include JSON::Serializable

        # Collection of WorkSpaces Instances returned by the query.
        @[JSON::Field(key: "WorkspaceInstances")]
        getter workspace_instances : Array(Types::WorkspaceInstance)

        # Token for retrieving additional WorkSpaces Instances if the result set is paginated.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @workspace_instances : Array(Types::WorkspaceInstance),
          @next_token : String? = nil
        )
        end
      end

      # Defines comprehensive configuration for a managed WorkSpace Instance.
      struct ManagedInstanceRequest
        include JSON::Serializable

        # Configures block device mappings for storage.
        @[JSON::Field(key: "BlockDeviceMappings")]
        getter block_device_mappings : Array(Types::BlockDeviceMappingRequest)?

        # Specifies capacity reservation preferences.
        @[JSON::Field(key: "CapacityReservationSpecification")]
        getter capacity_reservation_specification : Types::CapacityReservationSpecification?

        # Configures CPU-specific settings.
        @[JSON::Field(key: "CpuOptions")]
        getter cpu_options : Types::CpuOptionsRequest?

        # Defines CPU credit configuration for burstable instances.
        @[JSON::Field(key: "CreditSpecification")]
        getter credit_specification : Types::CreditSpecificationRequest?

        # Prevents API-initiated instance stop.
        @[JSON::Field(key: "DisableApiStop")]
        getter disable_api_stop : Bool?

        # Enables optimized EBS performance.
        @[JSON::Field(key: "EbsOptimized")]
        getter ebs_optimized : Bool?

        # Enables primary IPv6 address configuration.
        @[JSON::Field(key: "EnablePrimaryIpv6")]
        getter enable_primary_ipv6 : Bool?

        # Configures AWS Nitro Enclave settings.
        @[JSON::Field(key: "EnclaveOptions")]
        getter enclave_options : Types::EnclaveOptionsRequest?

        # Configures instance hibernation capabilities.
        @[JSON::Field(key: "HibernationOptions")]
        getter hibernation_options : Types::HibernationOptionsRequest?

        # Specifies IAM instance profile configuration.
        @[JSON::Field(key: "IamInstanceProfile")]
        getter iam_instance_profile : Types::IamInstanceProfileSpecification?

        # Identifies the Amazon Machine Image (AMI) for the instance.
        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # Configures marketplace-specific deployment options.
        @[JSON::Field(key: "InstanceMarketOptions")]
        getter instance_market_options : Types::InstanceMarketOptionsRequest?

        # Specifies the WorkSpace Instance type.
        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # Specifies number of IPv6 addresses to assign.
        @[JSON::Field(key: "Ipv6AddressCount")]
        getter ipv6_address_count : Int32?

        # Configures specific IPv6 addresses.
        @[JSON::Field(key: "Ipv6Addresses")]
        getter ipv6_addresses : Array(Types::InstanceIpv6Address)?

        # Identifies the kernel for the instance.
        @[JSON::Field(key: "KernelId")]
        getter kernel_id : String?

        # Specifies the key pair for instance access.
        @[JSON::Field(key: "KeyName")]
        getter key_name : String?

        # Configures license-related settings.
        @[JSON::Field(key: "LicenseSpecifications")]
        getter license_specifications : Array(Types::LicenseConfigurationRequest)?

        # Defines automatic maintenance settings.
        @[JSON::Field(key: "MaintenanceOptions")]
        getter maintenance_options : Types::InstanceMaintenanceOptionsRequest?

        # Configures instance metadata service settings.
        @[JSON::Field(key: "MetadataOptions")]
        getter metadata_options : Types::InstanceMetadataOptionsRequest?

        # Enables or disables detailed instance monitoring.
        @[JSON::Field(key: "Monitoring")]
        getter monitoring : Types::RunInstancesMonitoringEnabled?

        # Configures network interface settings.
        @[JSON::Field(key: "NetworkInterfaces")]
        getter network_interfaces : Array(Types::InstanceNetworkInterfaceSpecification)?

        # Defines network performance configuration.
        @[JSON::Field(key: "NetworkPerformanceOptions")]
        getter network_performance_options : Types::InstanceNetworkPerformanceOptionsRequest?

        # Specifies instance placement preferences.
        @[JSON::Field(key: "Placement")]
        getter placement : Types::Placement?

        # Configures private DNS name settings.
        @[JSON::Field(key: "PrivateDnsNameOptions")]
        getter private_dns_name_options : Types::PrivateDnsNameOptionsRequest?

        # Specifies the primary private IP address.
        @[JSON::Field(key: "PrivateIpAddress")]
        getter private_ip_address : String?

        # Identifies the ramdisk for the instance.
        @[JSON::Field(key: "RamdiskId")]
        getter ramdisk_id : String?

        # Specifies security group identifiers.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # Configures security group settings.
        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        # Identifies the subnet for the instance.
        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        # Configures resource tagging specifications.
        @[JSON::Field(key: "TagSpecifications")]
        getter tag_specifications : Array(Types::TagSpecification)?

        # Provides custom initialization data for the instance.
        @[JSON::Field(key: "UserData")]
        getter user_data : String?

        def initialize(
          @block_device_mappings : Array(Types::BlockDeviceMappingRequest)? = nil,
          @capacity_reservation_specification : Types::CapacityReservationSpecification? = nil,
          @cpu_options : Types::CpuOptionsRequest? = nil,
          @credit_specification : Types::CreditSpecificationRequest? = nil,
          @disable_api_stop : Bool? = nil,
          @ebs_optimized : Bool? = nil,
          @enable_primary_ipv6 : Bool? = nil,
          @enclave_options : Types::EnclaveOptionsRequest? = nil,
          @hibernation_options : Types::HibernationOptionsRequest? = nil,
          @iam_instance_profile : Types::IamInstanceProfileSpecification? = nil,
          @image_id : String? = nil,
          @instance_market_options : Types::InstanceMarketOptionsRequest? = nil,
          @instance_type : String? = nil,
          @ipv6_address_count : Int32? = nil,
          @ipv6_addresses : Array(Types::InstanceIpv6Address)? = nil,
          @kernel_id : String? = nil,
          @key_name : String? = nil,
          @license_specifications : Array(Types::LicenseConfigurationRequest)? = nil,
          @maintenance_options : Types::InstanceMaintenanceOptionsRequest? = nil,
          @metadata_options : Types::InstanceMetadataOptionsRequest? = nil,
          @monitoring : Types::RunInstancesMonitoringEnabled? = nil,
          @network_interfaces : Array(Types::InstanceNetworkInterfaceSpecification)? = nil,
          @network_performance_options : Types::InstanceNetworkPerformanceOptionsRequest? = nil,
          @placement : Types::Placement? = nil,
          @private_dns_name_options : Types::PrivateDnsNameOptionsRequest? = nil,
          @private_ip_address : String? = nil,
          @ramdisk_id : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @security_groups : Array(String)? = nil,
          @subnet_id : String? = nil,
          @tag_specifications : Array(Types::TagSpecification)? = nil,
          @user_data : String? = nil
        )
        end
      end

      # Defines instance placement configuration for WorkSpace Instance.
      struct Placement
        include JSON::Serializable

        # Specifies host affinity for dedicated instances.
        @[JSON::Field(key: "Affinity")]
        getter affinity : String?

        # Identifies the specific AWS availability zone.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # Unique identifier for placement group.
        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        # Name of the placement group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # Identifies the specific dedicated host.
        @[JSON::Field(key: "HostId")]
        getter host_id : String?

        # ARN of the host resource group.
        @[JSON::Field(key: "HostResourceGroupArn")]
        getter host_resource_group_arn : String?

        # Specifies partition number for partition placement groups.
        @[JSON::Field(key: "PartitionNumber")]
        getter partition_number : Int32?

        # Defines instance tenancy configuration.
        @[JSON::Field(key: "Tenancy")]
        getter tenancy : String?

        def initialize(
          @affinity : String? = nil,
          @availability_zone : String? = nil,
          @group_id : String? = nil,
          @group_name : String? = nil,
          @host_id : String? = nil,
          @host_resource_group_arn : String? = nil,
          @partition_number : Int32? = nil,
          @tenancy : String? = nil
        )
        end
      end

      # Configures private DNS name settings for WorkSpace Instance.
      struct PrivateDnsNameOptionsRequest
        include JSON::Serializable

        # Enables DNS AAAA record for resource name resolution.
        @[JSON::Field(key: "EnableResourceNameDnsAAAARecord")]
        getter enable_resource_name_dns_aaaa_record : Bool?

        # Enables DNS A record for resource name resolution.
        @[JSON::Field(key: "EnableResourceNameDnsARecord")]
        getter enable_resource_name_dns_a_record : Bool?

        # Specifies the type of hostname configuration.
        @[JSON::Field(key: "HostnameType")]
        getter hostname_type : String?

        def initialize(
          @enable_resource_name_dns_aaaa_record : Bool? = nil,
          @enable_resource_name_dns_a_record : Bool? = nil,
          @hostname_type : String? = nil
        )
        end
      end

      # Defines private IP address configuration for network interface.
      struct PrivateIpAddressSpecification
        include JSON::Serializable

        # Indicates if this is the primary private IP address.
        @[JSON::Field(key: "Primary")]
        getter primary : Bool?

        # Specific private IP address for the network interface.
        @[JSON::Field(key: "PrivateIpAddress")]
        getter private_ip_address : String?

        def initialize(
          @primary : Bool? = nil,
          @private_ip_address : String? = nil
        )
        end
      end

      # Represents an AWS region supported by WorkSpaces Instances.
      struct Region
        include JSON::Serializable

        # Name of the AWS region.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        def initialize(
          @region_name : String? = nil
        )
        end
      end

      # Indicates the requested resource could not be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        # Details about the missing resource.
        @[JSON::Field(key: "Message")]
        getter message : String

        # Identifier of the resource that was not found.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Type of the resource that was not found.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Configures detailed monitoring for WorkSpace Instance.
      struct RunInstancesMonitoringEnabled
        include JSON::Serializable

        # Enables or disables detailed instance monitoring.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Indicates that a service quota has been exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        # Description of the quota limitation.
        @[JSON::Field(key: "Message")]
        getter message : String

        # Specific code for the exceeded quota.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # Identifier of the resource related to the quota.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Type of resource related to the quota.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Code identifying the service with the quota limitation.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      # Defines configuration for spot instance deployment.
      struct SpotMarketOptions
        include JSON::Serializable

        # Duration of spot instance block reservation.
        @[JSON::Field(key: "BlockDurationMinutes")]
        getter block_duration_minutes : Int32?

        # Specifies behavior when spot instance is interrupted.
        @[JSON::Field(key: "InstanceInterruptionBehavior")]
        getter instance_interruption_behavior : String?

        # Maximum hourly price for spot instance.
        @[JSON::Field(key: "MaxPrice")]
        getter max_price : String?

        # Defines the type of spot instance request.
        @[JSON::Field(key: "SpotInstanceType")]
        getter spot_instance_type : String?

        # Timestamp until which spot instance request is valid.
        @[JSON::Field(key: "ValidUntilUtc", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter valid_until_utc : Time?

        def initialize(
          @block_duration_minutes : Int32? = nil,
          @instance_interruption_behavior : String? = nil,
          @max_price : String? = nil,
          @spot_instance_type : String? = nil,
          @valid_until_utc : Time? = nil
        )
        end
      end

      # Represents a key-value metadata tag.
      struct Tag
        include JSON::Serializable

        # Unique identifier for the tag.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # Value associated with the tag key.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Specifies tags to add to a WorkSpace Instance.
      struct TagResourceRequest
        include JSON::Serializable

        # Tags to be added to the WorkSpace Instance.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # Unique identifier of the WorkSpace Instance to tag.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String

        def initialize(
          @tags : Array(Types::Tag),
          @workspace_instance_id : String
        )
        end
      end

      # Confirms successful tag addition.
      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Defines tagging configuration for a resource.
      struct TagSpecification
        include JSON::Serializable

        # Type of resource being tagged.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Collection of tags for the specified resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Indicates the request rate has exceeded limits.
      struct ThrottlingException
        include JSON::Serializable

        # Description of the throttling event.
        @[JSON::Field(key: "Message")]
        getter message : String

        # Specific code for the throttling quota.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # Recommended wait time before retrying the request.
        @[JSON::Field(key: "RetryAfterSeconds")]
        getter retry_after_seconds : Int32?

        # Code identifying the service experiencing throttling.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Specifies tags to remove from a WorkSpace Instance.
      struct UntagResourceRequest
        include JSON::Serializable

        # Keys of tags to be removed.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        # Unique identifier of the WorkSpace Instance to untag.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String

        def initialize(
          @tag_keys : Array(String),
          @workspace_instance_id : String
        )
        end
      end

      # Confirms successful tag removal.
      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates invalid input parameters in the request.
      struct ValidationException
        include JSON::Serializable

        # Overall description of validation failures.
        @[JSON::Field(key: "Message")]
        getter message : String

        # Specific reason for the validation failure.
        @[JSON::Field(key: "Reason")]
        getter reason : String

        # List of fields that failed validation.
        @[JSON::Field(key: "FieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Represents a validation error field in an API request.
      struct ValidationExceptionField
        include JSON::Serializable

        # Detailed error message describing the validation issue.
        @[JSON::Field(key: "Message")]
        getter message : String

        # Name of the field that failed validation.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Reason for the validation failure.
        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @message : String,
          @name : String,
          @reason : String
        )
        end
      end

      # Represents a single WorkSpace Instance.
      struct WorkspaceInstance
        include JSON::Serializable

        # Details of the associated EC2 managed instance.
        @[JSON::Field(key: "EC2ManagedInstance")]
        getter ec2_managed_instance : Types::EC2ManagedInstance?

        # Current provisioning state of the WorkSpace Instance.
        @[JSON::Field(key: "ProvisionState")]
        getter provision_state : String?

        # Unique identifier for the WorkSpace Instance.
        @[JSON::Field(key: "WorkspaceInstanceId")]
        getter workspace_instance_id : String?

        def initialize(
          @ec2_managed_instance : Types::EC2ManagedInstance? = nil,
          @provision_state : String? = nil,
          @workspace_instance_id : String? = nil
        )
        end
      end

      # Captures errors specific to WorkSpace Instance operations.
      struct WorkspaceInstanceError
        include JSON::Serializable

        # Unique error code for the WorkSpace Instance error.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Detailed description of the WorkSpace Instance error.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end
    end
  end
end
