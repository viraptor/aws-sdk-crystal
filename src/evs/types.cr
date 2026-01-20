require "json"
require "time"

module Aws
  module Evs
    module Types


      struct AssociateEipToVlanRequest
        include JSON::Serializable

        # The Elastic IP address allocation ID.

        @[JSON::Field(key: "allocationId")]
        getter allocation_id : String

        # A unique ID for the environment containing the VLAN that the Elastic IP address associates with.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The name of the VLAN. hcx is the only accepted VLAN name at this time.

        @[JSON::Field(key: "vlanName")]
        getter vlan_name : String

        # This parameter is not used in Amazon EVS currently. If you supply input for this parameter, it will
        # have no effect. A unique, case-sensitive identifier that you provide to ensure the idempotency of
        # the environment creation request. If you do not specify a client token, a randomly generated token
        # is used for the request to ensure idempotency.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @allocation_id : String,
          @environment_id : String,
          @vlan_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct AssociateEipToVlanResponse
        include JSON::Serializable


        @[JSON::Field(key: "vlan")]
        getter vlan : Types::Vlan?

        def initialize(
          @vlan : Types::Vlan? = nil
        )
        end
      end

      # A check on the environment to identify environment health and validate VMware VCF licensing
      # compliance.

      struct Check
        include JSON::Serializable

        # The time when environment health began to be impaired.

        @[JSON::Field(key: "impairedSince", converter: Aws::Runtime::UnixTimestampConverter)]
        getter impaired_since : Time?

        # The check result.

        @[JSON::Field(key: "result")]
        getter result : String?

        # The check type. Amazon EVS performs the following checks. KEY_REUSE : checks that the VCF license
        # key is not used by another Amazon EVS environment. This check fails if a used license is added to
        # the environment. KEY_COVERAGE : checks that your VCF license key allocates sufficient vCPU cores for
        # all deployed hosts. The check fails when any assigned hosts in the EVS environment are not covered
        # by license keys, or when any unassigned hosts cannot be covered by available vCPU cores in keys.
        # REACHABILITY : checks that the Amazon EVS control plane has a persistent connection to SDDC Manager.
        # If Amazon EVS cannot reach the environment, this check fails. HOST_COUNT : Checks that your
        # environment has a minimum of 4 hosts. If this check fails, you will need to add hosts so that your
        # environment meets this minimum requirement. Amazon EVS only supports environments with 4-16 hosts.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @impaired_since : Time? = nil,
          @result : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The connectivity configuration for the environment. Amazon EVS requires that you specify two route
      # server peer IDs. During environment creation, the route server endpoints peer with the NSX uplink
      # VLAN for connectivity to the NSX overlay network.

      struct ConnectivityInfo
        include JSON::Serializable

        # The unique IDs for private route server peers.

        @[JSON::Field(key: "privateRouteServerPeerings")]
        getter private_route_server_peerings : Array(String)

        def initialize(
          @private_route_server_peerings : Array(String)
        )
        end
      end


      struct CreateEnvironmentHostRequest
        include JSON::Serializable

        # A unique ID for the environment that the host is added to.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The host that is created and added to the environment.

        @[JSON::Field(key: "host")]
        getter host : Types::HostInfoForCreate

        # This parameter is not used in Amazon EVS currently. If you supply input for this parameter, it will
        # have no effect. A unique, case-sensitive identifier that you provide to ensure the idempotency of
        # the host creation request. If you do not specify a client token, a randomly generated token is used
        # for the request to ensure idempotency.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The ESX version to use for the host.

        @[JSON::Field(key: "esxVersion")]
        getter esx_version : String?

        def initialize(
          @environment_id : String,
          @host : Types::HostInfoForCreate,
          @client_token : String? = nil,
          @esx_version : String? = nil
        )
        end
      end


      struct CreateEnvironmentHostResponse
        include JSON::Serializable

        # A summary of the environment that the host is created in.

        @[JSON::Field(key: "environmentSummary")]
        getter environment_summary : Types::EnvironmentSummary?

        # A description of the created host.

        @[JSON::Field(key: "host")]
        getter host : Types::Host?

        def initialize(
          @environment_summary : Types::EnvironmentSummary? = nil,
          @host : Types::Host? = nil
        )
        end
      end


      struct CreateEnvironmentRequest
        include JSON::Serializable

        # The connectivity configuration for the environment. Amazon EVS requires that you specify two route
        # server peer IDs. During environment creation, the route server endpoints peer with the NSX edges
        # over the NSX uplink subnet, providing BGP-based dynamic routing for overlay networks.

        @[JSON::Field(key: "connectivityInfo")]
        getter connectivity_info : Types::ConnectivityInfo

        # The ESX hosts to add to the environment. Amazon EVS requires that you provide details for a minimum
        # of 4 hosts during environment creation. For each host, you must provide the desired hostname, EC2
        # SSH keypair name, and EC2 instance type. Optionally, you can also provide a partition or cluster
        # placement group to use, or use Amazon EC2 Dedicated Hosts.

        @[JSON::Field(key: "hosts")]
        getter hosts : Array(Types::HostInfoForCreate)

        # The initial VLAN subnets for the Amazon EVS environment. For each Amazon EVS VLAN subnet, you must
        # specify a non-overlapping CIDR block. Amazon EVS VLAN subnets have a minimum CIDR block size of /28
        # and a maximum size of /24.

        @[JSON::Field(key: "initialVlans")]
        getter initial_vlans : Types::InitialVlans

        # The license information that Amazon EVS requires to create an environment. Amazon EVS requires two
        # license keys: a VCF solution key and a vSAN license key. The VCF solution key must cover a minimum
        # of 256 cores. The vSAN license key must provide at least 110 TiB of vSAN capacity. VCF licenses can
        # be used for only one Amazon EVS environment. Amazon EVS does not support reuse of VCF licenses for
        # multiple environments. VCF license information can be retrieved from the Broadcom portal.

        @[JSON::Field(key: "licenseInfo")]
        getter license_info : Array(Types::LicenseInfo)

        # The subnet that is used to establish connectivity between the Amazon EVS control plane and VPC.
        # Amazon EVS uses this subnet to validate mandatory DNS records for your VCF appliances and hosts and
        # create the environment.

        @[JSON::Field(key: "serviceAccessSubnetId")]
        getter service_access_subnet_id : String

        # The Broadcom Site ID that is allocated to you as part of your electronic software delivery. This ID
        # allows customer access to the Broadcom portal, and is provided to you by Broadcom at the close of
        # your software contract or contract renewal. Amazon EVS uses the Broadcom Site ID that you provide to
        # meet Broadcom VCF license usage reporting requirements for Amazon EVS.

        @[JSON::Field(key: "siteId")]
        getter site_id : String

        # Customer confirmation that the customer has purchased and will continue to maintain the required
        # number of VCF software licenses to cover all physical processor cores in the Amazon EVS environment.
        # Information about your VCF software in Amazon EVS will be shared with Broadcom to verify license
        # compliance. Amazon EVS does not validate license keys. To validate license keys, visit the Broadcom
        # support portal.

        @[JSON::Field(key: "termsAccepted")]
        getter terms_accepted : Bool

        # The DNS hostnames for the virtual machines that host the VCF management appliances. Amazon EVS
        # requires that you provide DNS hostnames for the following appliances: vCenter, NSX Manager, SDDC
        # Manager, and Cloud Builder.

        @[JSON::Field(key: "vcfHostnames")]
        getter vcf_hostnames : Types::VcfHostnames

        # The VCF version to use for the environment.

        @[JSON::Field(key: "vcfVersion")]
        getter vcf_version : String

        # A unique ID for the VPC that the environment is deployed inside. Amazon EVS requires that all VPC
        # subnets exist in a single Availability Zone in a Region where the service is available. The VPC that
        # you specify must have a valid DHCP option set with domain name, at least two DNS servers, and an NTP
        # server. These settings are used to configure your VCF appliances and hosts. The VPC cannot be used
        # with any other deployed Amazon EVS environment. Amazon EVS does not provide multi-VPC support for
        # environments at this time. Amazon EVS does not support the following Amazon Web Services networking
        # options for NSX overlay connectivity: cross-Region VPC peering, Amazon S3 gateway endpoints, or
        # Amazon Web Services Direct Connect virtual private gateway associations. Ensure that you specify a
        # VPC that is adequately sized to accommodate the Amazon EVS subnets.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # This parameter is not used in Amazon EVS currently. If you supply input for this parameter, it will
        # have no effect. A unique, case-sensitive identifier that you provide to ensure the idempotency of
        # the environment creation request. If you do not specify a client token, a randomly generated token
        # is used for the request to ensure idempotency.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The name to give to your environment. The name can contain only alphanumeric characters
        # (case-sensitive), hyphens, and underscores. It must start with an alphanumeric character, and can't
        # be longer than 100 characters. The name must be unique within the Amazon Web Services Region and
        # Amazon Web Services account that you're creating the environment in.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String?

        # A unique ID for the customer-managed KMS key that is used to encrypt the VCF credential pairs for
        # SDDC Manager, NSX Manager, and vCenter appliances. These credentials are stored in Amazon Web
        # Services Secrets Manager.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The security group that controls communication between the Amazon EVS control plane and VPC. The
        # default security group is used if a custom security group isn't specified. The security group should
        # allow access to the following. TCP/UDP access to the DNS servers HTTPS/SSH access to the host
        # management VLAN subnet HTTPS/SSH access to the Management VM VLAN subnet You should avoid modifying
        # the security group rules after deployment, as this can break the persistent connection between the
        # Amazon EVS control plane and VPC. This can cause future environment actions like adding or removing
        # hosts to fail.

        @[JSON::Field(key: "serviceAccessSecurityGroups")]
        getter service_access_security_groups : Types::ServiceAccessSecurityGroups?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @connectivity_info : Types::ConnectivityInfo,
          @hosts : Array(Types::HostInfoForCreate),
          @initial_vlans : Types::InitialVlans,
          @license_info : Array(Types::LicenseInfo),
          @service_access_subnet_id : String,
          @site_id : String,
          @terms_accepted : Bool,
          @vcf_hostnames : Types::VcfHostnames,
          @vcf_version : String,
          @vpc_id : String,
          @client_token : String? = nil,
          @environment_name : String? = nil,
          @kms_key_id : String? = nil,
          @service_access_security_groups : Types::ServiceAccessSecurityGroups? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEnvironmentResponse
        include JSON::Serializable

        # A description of the created environment.

        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment?

        def initialize(
          @environment : Types::Environment? = nil
        )
        end
      end


      struct DeleteEnvironmentHostRequest
        include JSON::Serializable

        # A unique ID for the host's environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The DNS hostname associated with the host to be deleted.

        @[JSON::Field(key: "hostName")]
        getter host_name : String

        # This parameter is not used in Amazon EVS currently. If you supply input for this parameter, it will
        # have no effect. A unique, case-sensitive identifier that you provide to ensure the idempotency of
        # the host deletion request. If you do not specify a client token, a randomly generated token is used
        # for the request to ensure idempotency.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @environment_id : String,
          @host_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteEnvironmentHostResponse
        include JSON::Serializable

        # A summary of the environment that the host was deleted from.

        @[JSON::Field(key: "environmentSummary")]
        getter environment_summary : Types::EnvironmentSummary?

        # A description of the deleted host.

        @[JSON::Field(key: "host")]
        getter host : Types::Host?

        def initialize(
          @environment_summary : Types::EnvironmentSummary? = nil,
          @host : Types::Host? = nil
        )
        end
      end


      struct DeleteEnvironmentRequest
        include JSON::Serializable

        # A unique ID associated with the environment to be deleted.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # This parameter is not used in Amazon EVS currently. If you supply input for this parameter, it will
        # have no effect. A unique, case-sensitive identifier that you provide to ensure the idempotency of
        # the environment deletion request. If you do not specify a client token, a randomly generated token
        # is used for the request to ensure idempotency.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @environment_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteEnvironmentResponse
        include JSON::Serializable

        # A description of the deleted environment.

        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment?

        def initialize(
          @environment : Types::Environment? = nil
        )
        end
      end


      struct DisassociateEipFromVlanRequest
        include JSON::Serializable

        # A unique ID for the Elastic IP address association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # A unique ID for the environment containing the VLAN that the Elastic IP address disassociates from.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The name of the VLAN. hcx is the only accepted VLAN name at this time.

        @[JSON::Field(key: "vlanName")]
        getter vlan_name : String

        # This parameter is not used in Amazon EVS currently. If you supply input for this parameter, it will
        # have no effect. A unique, case-sensitive identifier that you provide to ensure the idempotency of
        # the environment creation request. If you do not specify a client token, a randomly generated token
        # is used for the request to ensure idempotency.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @association_id : String,
          @environment_id : String,
          @vlan_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct DisassociateEipFromVlanResponse
        include JSON::Serializable


        @[JSON::Field(key: "vlan")]
        getter vlan : Types::Vlan?

        def initialize(
          @vlan : Types::Vlan? = nil
        )
        end
      end

      # An Elastic IP address association with the elastic network interface in the VLAN subnet.

      struct EipAssociation
        include JSON::Serializable

        # The Elastic IP address allocation ID.

        @[JSON::Field(key: "allocationId")]
        getter allocation_id : String?

        # A unique ID for the elastic IP address association with the VLAN subnet.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The Elastic IP address.

        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        def initialize(
          @allocation_id : String? = nil,
          @association_id : String? = nil,
          @ip_address : String? = nil
        )
        end
      end

      # An object that represents an Amazon EVS environment.

      struct Environment
        include JSON::Serializable

        # A check on the environment to identify instance health and VMware VCF licensing issues.

        @[JSON::Field(key: "checks")]
        getter checks : Array(Types::Check)?

        # The connectivity configuration for the environment. Amazon EVS requires that you specify two route
        # server peer IDs. During environment creation, the route server endpoints peer with the NSX uplink
        # VLAN for connectivity to the NSX overlay network.

        @[JSON::Field(key: "connectivityInfo")]
        getter connectivity_info : Types::ConnectivityInfo?

        # The date and time that the environment was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The VCF credentials that are stored as Amazon EVS managed secrets in Amazon Web Services Secrets
        # Manager. Amazon EVS stores credentials that are needed to install vCenter Server, NSX, and SDDC
        # Manager.

        @[JSON::Field(key: "credentials")]
        getter credentials : Array(Types::Secret)?

        # The Amazon Resource Name (ARN) that is associated with the environment.

        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String?

        # The unique ID for the environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The name of the environment.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String?

        # The state of an environment.

        @[JSON::Field(key: "environmentState")]
        getter environment_state : String?

        # Reports impaired functionality that stems from issues internal to the environment, such as impaired
        # reachability.

        @[JSON::Field(key: "environmentStatus")]
        getter environment_status : String?

        # The Amazon Web Services KMS key ID that Amazon Web Services Secrets Manager uses to encrypt secrets
        # that are associated with the environment. These secrets contain the VCF credentials that are needed
        # to install vCenter Server, NSX, and SDDC Manager. By default, Amazon EVS use the Amazon Web Services
        # Secrets Manager managed key aws/secretsmanager . You can also specify a customer managed key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The license information that Amazon EVS requires to create an environment. Amazon EVS requires two
        # license keys: a VCF solution key and a vSAN license key. The VCF solution key must cover a minimum
        # of 256 cores. The vSAN license key must provide at least 110 TiB of vSAN capacity.

        @[JSON::Field(key: "licenseInfo")]
        getter license_info : Array(Types::LicenseInfo)?

        # The date and time that the environment was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The security groups that allow traffic between the Amazon EVS control plane and your VPC for service
        # access. If a security group is not specified, Amazon EVS uses the default security group in your
        # account for service access.

        @[JSON::Field(key: "serviceAccessSecurityGroups")]
        getter service_access_security_groups : Types::ServiceAccessSecurityGroups?

        # The subnet that is used to establish connectivity between the Amazon EVS control plane and VPC.
        # Amazon EVS uses this subnet to perform validations and create the environment.

        @[JSON::Field(key: "serviceAccessSubnetId")]
        getter service_access_subnet_id : String?

        # The Broadcom Site ID that is associated with your Amazon EVS environment. Amazon EVS uses the
        # Broadcom Site ID that you provide to meet Broadcom VCF license usage reporting requirements for
        # Amazon EVS.

        @[JSON::Field(key: "siteId")]
        getter site_id : String?

        # A detailed description of the environmentState of an environment.

        @[JSON::Field(key: "stateDetails")]
        getter state_details : String?

        # Customer confirmation that the customer has purchased and will continue to maintain the required
        # number of VCF software licenses to cover all physical processor cores in the Amazon EVS environment.
        # Information about your VCF software in Amazon EVS will be shared with Broadcom to verify license
        # compliance. Amazon EVS does not validate license keys. To validate license keys, visit the Broadcom
        # support portal.

        @[JSON::Field(key: "termsAccepted")]
        getter terms_accepted : Bool?

        # The DNS hostnames to be used by the VCF management appliances in your environment. For environment
        # creation to be successful, each hostname entry must resolve to a domain name that you've registered
        # in your DNS service of choice and configured in the DHCP option set of your VPC. DNS hostnames
        # cannot be changed after environment creation has started.

        @[JSON::Field(key: "vcfHostnames")]
        getter vcf_hostnames : Types::VcfHostnames?

        # The VCF version of the environment.

        @[JSON::Field(key: "vcfVersion")]
        getter vcf_version : String?

        # The VPC associated with the environment.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @checks : Array(Types::Check)? = nil,
          @connectivity_info : Types::ConnectivityInfo? = nil,
          @created_at : Time? = nil,
          @credentials : Array(Types::Secret)? = nil,
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @environment_name : String? = nil,
          @environment_state : String? = nil,
          @environment_status : String? = nil,
          @kms_key_id : String? = nil,
          @license_info : Array(Types::LicenseInfo)? = nil,
          @modified_at : Time? = nil,
          @service_access_security_groups : Types::ServiceAccessSecurityGroups? = nil,
          @service_access_subnet_id : String? = nil,
          @site_id : String? = nil,
          @state_details : String? = nil,
          @terms_accepted : Bool? = nil,
          @vcf_hostnames : Types::VcfHostnames? = nil,
          @vcf_version : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # A list of environments with summarized environment details.

      struct EnvironmentSummary
        include JSON::Serializable

        # The date and time that the environment was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) that is associated with the environment.

        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String?

        # A unique ID for the environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The name of the environment.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String?

        # The state of an environment.

        @[JSON::Field(key: "environmentState")]
        getter environment_state : String?

        # Reports impaired functionality that stems from issues internal to the environment, such as impaired
        # reachability.

        @[JSON::Field(key: "environmentStatus")]
        getter environment_status : String?

        # The date and time that the environment was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The VCF version of the environment.

        @[JSON::Field(key: "vcfVersion")]
        getter vcf_version : String?

        def initialize(
          @created_at : Time? = nil,
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @environment_name : String? = nil,
          @environment_state : String? = nil,
          @environment_status : String? = nil,
          @modified_at : Time? = nil,
          @vcf_version : String? = nil
        )
        end
      end


      struct GetEnvironmentRequest
        include JSON::Serializable

        # A unique ID for the environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end


      struct GetEnvironmentResponse
        include JSON::Serializable

        # A description of the requested environment.

        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment?

        def initialize(
          @environment : Types::Environment? = nil
        )
        end
      end


      struct GetVersionsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetVersionsResponse
        include JSON::Serializable

        # A list of EC2 instance types and their available ESX versions.

        @[JSON::Field(key: "instanceTypeEsxVersions")]
        getter instance_type_esx_versions : Array(Types::InstanceTypeEsxVersionsInfo)

        # A list of VCF versions with their availability status, default ESX version, and instance types.

        @[JSON::Field(key: "vcfVersions")]
        getter vcf_versions : Array(Types::VcfVersionInfo)

        def initialize(
          @instance_type_esx_versions : Array(Types::InstanceTypeEsxVersionsInfo),
          @vcf_versions : Array(Types::VcfVersionInfo)
        )
        end
      end

      # An ESX host that runs on an Amazon EC2 bare metal instance. Four hosts are created in an Amazon EVS
      # environment during environment creation. You can add hosts to an environment using the
      # CreateEnvironmentHost operation. Amazon EVS supports 4-16 hosts per environment.

      struct Host
        include JSON::Serializable

        # The date and time that the host was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The unique ID of the Amazon EC2 Dedicated Host.

        @[JSON::Field(key: "dedicatedHostId")]
        getter dedicated_host_id : String?

        # The unique ID of the EC2 instance that represents the host.

        @[JSON::Field(key: "ec2InstanceId")]
        getter ec2_instance_id : String?

        # The DNS hostname of the host. DNS hostnames for hosts must be unique across Amazon EVS environments
        # and within VCF.

        @[JSON::Field(key: "hostName")]
        getter host_name : String?

        # The state of the host.

        @[JSON::Field(key: "hostState")]
        getter host_state : String?

        # The EC2 instance type of the host. Currently, Amazon EVS supports only the i4i.metal instance type.
        # EC2 instances created through Amazon EVS do not support associating an IAM instance profile.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The IP address of the host.

        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # The name of the SSH key that is used to access the host.

        @[JSON::Field(key: "keyName")]
        getter key_name : String?

        # The date and time that the host was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The elastic network interfaces that are attached to the host.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # The unique ID of the placement group where the host is placed.

        @[JSON::Field(key: "placementGroupId")]
        getter placement_group_id : String?

        # A detailed description of the hostState of a host.

        @[JSON::Field(key: "stateDetails")]
        getter state_details : String?

        def initialize(
          @created_at : Time? = nil,
          @dedicated_host_id : String? = nil,
          @ec2_instance_id : String? = nil,
          @host_name : String? = nil,
          @host_state : String? = nil,
          @instance_type : String? = nil,
          @ip_address : String? = nil,
          @key_name : String? = nil,
          @modified_at : Time? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @placement_group_id : String? = nil,
          @state_details : String? = nil
        )
        end
      end

      # An object that represents a host. You cannot use dedicatedHostId and placementGroupId together in
      # the same HostInfoForCreate object. This results in a ValidationException response.

      struct HostInfoForCreate
        include JSON::Serializable

        # The DNS hostname of the host. DNS hostnames for hosts must be unique across Amazon EVS environments
        # and within VCF.

        @[JSON::Field(key: "hostName")]
        getter host_name : String

        # The EC2 instance type that represents the host. Currently, Amazon EVS supports only the i4i.metal
        # instance type.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The name of the SSH key that is used to access the host.

        @[JSON::Field(key: "keyName")]
        getter key_name : String

        # The unique ID of the Amazon EC2 Dedicated Host.

        @[JSON::Field(key: "dedicatedHostId")]
        getter dedicated_host_id : String?

        # The unique ID of the placement group where the host is placed.

        @[JSON::Field(key: "placementGroupId")]
        getter placement_group_id : String?

        def initialize(
          @host_name : String,
          @instance_type : String,
          @key_name : String,
          @dedicated_host_id : String? = nil,
          @placement_group_id : String? = nil
        )
        end
      end

      # An object that represents an initial VLAN subnet for the Amazon EVS environment. Amazon EVS creates
      # initial VLAN subnets when you first create the environment. Amazon EVS creates the following 10 VLAN
      # subnets: host management VLAN, vMotion VLAN, vSAN VLAN, VTEP VLAN, Edge VTEP VLAN, Management VM
      # VLAN, HCX uplink VLAN, NSX uplink VLAN, expansion VLAN 1, expansion VLAN 2. For each Amazon EVS VLAN
      # subnet, you must specify a non-overlapping CIDR block. Amazon EVS VLAN subnets have a minimum CIDR
      # block size of /28 and a maximum size of /24.

      struct InitialVlanInfo
        include JSON::Serializable

        # The CIDR block that you provide to create an Amazon EVS VLAN subnet. Amazon EVS VLAN subnets have a
        # minimum CIDR block size of /28 and a maximum size of /24. Amazon EVS VLAN subnet CIDR blocks must
        # not overlap with other subnets in the VPC.

        @[JSON::Field(key: "cidr")]
        getter cidr : String

        def initialize(
          @cidr : String
        )
        end
      end

      # The initial VLAN subnets for the environment. Amazon EVS VLAN subnets have a minimum CIDR block size
      # of /28 and a maximum size of /24. Amazon EVS VLAN subnet CIDR blocks must not overlap with other
      # subnets in the VPC.

      struct InitialVlans
        include JSON::Serializable

        # The edge VTEP VLAN subnet. This VLAN subnet manages traffic flowing between the internal network and
        # external networks, including internet access and other site connections.

        @[JSON::Field(key: "edgeVTep")]
        getter edge_v_tep : Types::InitialVlanInfo

        # An additional VLAN subnet that can be used to extend VCF capabilities once configured. For example,
        # you can configure an expansion VLAN subnet to use NSX Federation for centralized management and
        # synchronization of multiple NSX deployments across different locations.

        @[JSON::Field(key: "expansionVlan1")]
        getter expansion_vlan1 : Types::InitialVlanInfo

        # An additional VLAN subnet that can be used to extend VCF capabilities once configured. For example,
        # you can configure an expansion VLAN subnet to use NSX Federation for centralized management and
        # synchronization of multiple NSX deployments across different locations.

        @[JSON::Field(key: "expansionVlan2")]
        getter expansion_vlan2 : Types::InitialVlanInfo

        # The HCX VLAN subnet. This VLAN subnet allows the HCX Interconnnect (IX) and HCX Network Extension
        # (NE) to reach their peers and enable HCX Service Mesh creation. If you plan to use a public HCX VLAN
        # subnet, the following requirements must be met: Must have a /28 netmask and be allocated from the
        # IPAM public pool. Required for HCX internet access configuration. The HCX public VLAN CIDR block
        # must be added to the VPC as a secondary CIDR block. Must have at least two Elastic IP addresses to
        # be allocated from the public IPAM pool for HCX components.

        @[JSON::Field(key: "hcx")]
        getter hcx : Types::InitialVlanInfo

        # The NSX uplink VLAN subnet. This VLAN subnet allows connectivity to the NSX overlay network.

        @[JSON::Field(key: "nsxUplink")]
        getter nsx_uplink : Types::InitialVlanInfo

        # The vMotion VLAN subnet. This VLAN subnet carries traffic for vSphere vMotion.

        @[JSON::Field(key: "vMotion")]
        getter v_motion : Types::InitialVlanInfo

        # The vSAN VLAN subnet. This VLAN subnet carries the communication between ESX hosts to implement a
        # vSAN shared storage pool.

        @[JSON::Field(key: "vSan")]
        getter v_san : Types::InitialVlanInfo

        # The VTEP VLAN subnet. This VLAN subnet handles internal network traffic between virtual machines
        # within a VCF instance.

        @[JSON::Field(key: "vTep")]
        getter v_tep : Types::InitialVlanInfo

        # The VM management VLAN subnet. This VLAN subnet carries traffic for vSphere virtual machines.

        @[JSON::Field(key: "vmManagement")]
        getter vm_management : Types::InitialVlanInfo

        # The host VMkernel management VLAN subnet. This VLAN subnet carries traffic for managing ESX hosts
        # and communicating with VMware vCenter Server.

        @[JSON::Field(key: "vmkManagement")]
        getter vmk_management : Types::InitialVlanInfo

        # A unique ID for a network access control list that the HCX VLAN uses. Required when isHcxPublic is
        # set to true .

        @[JSON::Field(key: "hcxNetworkAclId")]
        getter hcx_network_acl_id : String?

        # Determines if the HCX VLAN that Amazon EVS provisions is public or private.

        @[JSON::Field(key: "isHcxPublic")]
        getter is_hcx_public : Bool?

        def initialize(
          @edge_v_tep : Types::InitialVlanInfo,
          @expansion_vlan1 : Types::InitialVlanInfo,
          @expansion_vlan2 : Types::InitialVlanInfo,
          @hcx : Types::InitialVlanInfo,
          @nsx_uplink : Types::InitialVlanInfo,
          @v_motion : Types::InitialVlanInfo,
          @v_san : Types::InitialVlanInfo,
          @v_tep : Types::InitialVlanInfo,
          @vm_management : Types::InitialVlanInfo,
          @vmk_management : Types::InitialVlanInfo,
          @hcx_network_acl_id : String? = nil,
          @is_hcx_public : Bool? = nil
        )
        end
      end

      # Information about ESX versions offered for each EC2 instance type.

      struct InstanceTypeEsxVersionsInfo
        include JSON::Serializable

        # The list of ESX versions offered for this instance type.

        @[JSON::Field(key: "esxVersions")]
        getter esx_versions : Array(String)

        # The EC2 instance type.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        def initialize(
          @esx_versions : Array(String),
          @instance_type : String
        )
        end
      end

      # An internal server error occurred. Retry your request.

      struct InternalServerException
        include JSON::Serializable

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The license information that Amazon EVS requires to create an environment. Amazon EVS requires two
      # license keys: a VCF solution key and a vSAN license key.

      struct LicenseInfo
        include JSON::Serializable

        # The VCF solution key. This license unlocks VMware VCF product features, including vSphere, NSX, SDDC
        # Manager, and vCenter Server. The VCF solution key must cover a minimum of 256 cores.

        @[JSON::Field(key: "solutionKey")]
        getter solution_key : String

        # The VSAN license key. This license unlocks vSAN features. The vSAN license key must provide at least
        # 110 TiB of vSAN capacity.

        @[JSON::Field(key: "vsanKey")]
        getter vsan_key : String

        def initialize(
          @solution_key : String,
          @vsan_key : String
        )
        end
      end


      struct ListEnvironmentHostsRequest
        include JSON::Serializable

        # A unique ID for the environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The maximum number of results to return. If you specify MaxResults in the request, the response
        # includes information up to the limit specified.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A unique pagination token for each page. If nextToken is returned, there are more results available.
        # Make the call again using the returned token with all other arguments unchanged to retrieve the next
        # page. Each pagination token expires after 24 hours. Using an expired pagination token will return an
        # HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentHostsResponse
        include JSON::Serializable

        # A list of hosts in the environment.

        @[JSON::Field(key: "environmentHosts")]
        getter environment_hosts : Array(Types::Host)?

        # A unique pagination token for next page results. Make the call again using this token to retrieve
        # the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_hosts : Array(Types::Host)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentVlansRequest
        include JSON::Serializable

        # A unique ID for the environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The maximum number of results to return. If you specify MaxResults in the request, the response
        # includes information up to the limit specified.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A unique pagination token for each page. If nextToken is returned, there are more results available.
        # Make the call again using the returned token with all other arguments unchanged to retrieve the next
        # page. Each pagination token expires after 24 hours. Using an expired pagination token will return an
        # HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentVlansResponse
        include JSON::Serializable

        # A list of VLANs that are associated with the specified environment.

        @[JSON::Field(key: "environmentVlans")]
        getter environment_vlans : Array(Types::Vlan)?

        # A unique pagination token for next page results. Make the call again using this token to retrieve
        # the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_vlans : Array(Types::Vlan)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsRequest
        include JSON::Serializable

        # The maximum number of results to return. If you specify MaxResults in the request, the response
        # includes information up to the limit specified.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A unique pagination token for each page. If nextToken is returned, there are more results available.
        # Make the call again using the returned token with all other arguments unchanged to retrieve the next
        # page. Each pagination token expires after 24 hours. Using an expired pagination token will return an
        # HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The state of an environment. Used to filter response results to return only environments with the
        # specified environmentState .

        @[JSON::Field(key: "state")]
        getter state : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state : Array(String)? = nil
        )
        end
      end


      struct ListEnvironmentsResponse
        include JSON::Serializable

        # A list of environments with summarized environment details.

        @[JSON::Field(key: "environmentSummaries")]
        getter environment_summaries : Array(Types::EnvironmentSummary)?

        # A unique pagination token for next page results. Make the call again using this token to retrieve
        # the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_summaries : Array(Types::EnvironmentSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to list tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags for the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An elastic network interface (ENI) that connects hosts to the VLAN subnets. Amazon EVS provisions
      # two identically configured ENIs in the VMkernel management subnet during host creation. One ENI is
      # active, and the other is in standby mode for automatic switchover during a failure scenario.

      struct NetworkInterface
        include JSON::Serializable

        # The unique ID of the elastic network interface.

        @[JSON::Field(key: "networkInterfaceId")]
        getter network_interface_id : String?

        def initialize(
          @network_interface_id : String? = nil
        )
        end
      end

      # A service resource associated with the request could not be found. The resource might not be
      # specified correctly, or it may have a state of DELETED .

      struct ResourceNotFoundException
        include JSON::Serializable

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource that could not be found.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that is associated with the error.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # A managed secret that contains the credentials for installing vCenter Server, NSX, and SDDC Manager.
      # During environment creation, the Amazon EVS control plane uses Amazon Web Services Secrets Manager
      # to create, encrypt, validate, and store secrets. If you choose to delete your environment, Amazon
      # EVS also deletes the secrets that are associated with your environment. Amazon EVS does not provide
      # managed rotation of secrets. We recommend that you rotate secrets regularly to ensure that secrets
      # are not long-lived.

      struct Secret
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        def initialize(
          @secret_arn : String? = nil
        )
        end
      end

      # The security groups that allow traffic between the Amazon EVS control plane and your VPC for Amazon
      # EVS service access. If a security group is not specified, Amazon EVS uses the default security group
      # in your account for service access.

      struct ServiceAccessSecurityGroups
        include JSON::Serializable

        # The security groups that allow service access.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @security_groups : Array(String)? = nil
        )
        end
      end

      # The number of one or more Amazon EVS resources exceeds the maximum allowed. For a list of Amazon EVS
      # quotas, see Amazon EVS endpoints and quotas in the Amazon EVS User Guide . Delete some resources or
      # request an increase in your service quota. To request an increase, see Amazon Web Services Service
      # Quotas in the Amazon Web Services General Reference Guide .

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # TagPolicyException is deprecated. See ValidationException instead. The request doesn't comply with
      # IAM tag policy. Correct your request and then retry it.

      struct TagPolicyException
        include JSON::Serializable

        # Describes the error encountered

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to add tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other environment or Amazon Web
        # Services resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The operation could not be performed because the service is throttling requests. This exception is
      # thrown when the service endpoint receives too many concurrent requests.

      struct ThrottlingException
        include JSON::Serializable

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String

        # The seconds to wait to retry.

        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # TooManyTagsException is deprecated. See ServiceQuotaExceededException instead. A service resource
      # associated with the request has more than 200 tags.

      struct TooManyTagsException
        include JSON::Serializable

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to delete tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to delete.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input fails to satisfy the specified constraints. You will see this exception if invalid inputs
      # are provided for any of the Amazon EVS environment operations, or if a list operation is performed
      # on an environment resource that is still initializing.

      struct ValidationException
        include JSON::Serializable

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the exception.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # A list of fields that didn't validate.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Stores information about a field passed inside a request that resulted in an exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message describing why the field failed validation.

        @[JSON::Field(key: "message")]
        getter message : String

        # The field name.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The DNS hostnames that Amazon EVS uses to install VMware vCenter Server, NSX, SDDC Manager, and
      # Cloud Builder. Each hostname must be unique, and resolve to a domain name that you've registered in
      # your DNS service of choice. Hostnames cannot be changed. VMware VCF requires the deployment of two
      # NSX Edge nodes, and three NSX Manager virtual machines.

      struct VcfHostnames
        include JSON::Serializable

        # The hostname for VMware Cloud Builder.

        @[JSON::Field(key: "cloudBuilder")]
        getter cloud_builder : String

        # The VMware NSX hostname.

        @[JSON::Field(key: "nsx")]
        getter nsx : String

        # The hostname for the first NSX Edge node.

        @[JSON::Field(key: "nsxEdge1")]
        getter nsx_edge1 : String

        # The hostname for the second NSX Edge node.

        @[JSON::Field(key: "nsxEdge2")]
        getter nsx_edge2 : String

        # The hostname for the first VMware NSX Manager virtual machine (VM).

        @[JSON::Field(key: "nsxManager1")]
        getter nsx_manager1 : String

        # The hostname for the second VMware NSX Manager virtual machine (VM).

        @[JSON::Field(key: "nsxManager2")]
        getter nsx_manager2 : String

        # The hostname for the third VMware NSX Manager virtual machine (VM).

        @[JSON::Field(key: "nsxManager3")]
        getter nsx_manager3 : String

        # The hostname for SDDC Manager.

        @[JSON::Field(key: "sddcManager")]
        getter sddc_manager : String

        # The VMware vCenter hostname.

        @[JSON::Field(key: "vCenter")]
        getter v_center : String

        def initialize(
          @cloud_builder : String,
          @nsx : String,
          @nsx_edge1 : String,
          @nsx_edge2 : String,
          @nsx_manager1 : String,
          @nsx_manager2 : String,
          @nsx_manager3 : String,
          @sddc_manager : String,
          @v_center : String
        )
        end
      end

      # Information about a VCF versions provided by Amazon EVS, including its status, default ESX version,
      # and EC2 instance types.

      struct VcfVersionInfo
        include JSON::Serializable

        # The default ESX version for this VCF version. It is based on Broadcom's Bill Of Materials (BOM).

        @[JSON::Field(key: "defaultEsxVersion")]
        getter default_esx_version : String

        # EC2 instance types provided by Amazon EVS for this VCF version for creating environments.

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)

        # The status for this VCF version. Valid values are: AVAILABLE - This VCF version is available to you.
        # RESTRICTED - This VCF version has limited availability. If the version you need shows RESTRICTED,
        # and you require, check out VCF versions and EC2 instance types provided by Amazon EVS for more
        # information.

        @[JSON::Field(key: "status")]
        getter status : String

        # The VCF version number.

        @[JSON::Field(key: "vcfVersion")]
        getter vcf_version : String

        def initialize(
          @default_esx_version : String,
          @instance_types : Array(String),
          @status : String,
          @vcf_version : String
        )
        end
      end

      # The VLANs that Amazon EVS creates during environment creation.

      struct Vlan
        include JSON::Serializable

        # The availability zone of the VLAN.

        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The CIDR block of the VLAN. Amazon EVS VLAN subnets have a minimum CIDR block size of /28 and a
        # maximum size of /24.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        # The date and time that the VLAN was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An array of Elastic IP address associations.

        @[JSON::Field(key: "eipAssociations")]
        getter eip_associations : Array(Types::EipAssociation)?

        # The VMware VCF traffic type that is carried over the VLAN. For example, a VLAN with a functionName
        # of hcx is being used to carry VMware HCX traffic.

        @[JSON::Field(key: "functionName")]
        getter function_name : String?

        # Determines if the VLAN that Amazon EVS provisions is public or private.

        @[JSON::Field(key: "isPublic")]
        getter is_public : Bool?

        # The date and time that the VLAN was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # A unique ID for a network access control list.

        @[JSON::Field(key: "networkAclId")]
        getter network_acl_id : String?

        # The state details of the VLAN.

        @[JSON::Field(key: "stateDetails")]
        getter state_details : String?

        # The unique ID of the VLAN subnet.

        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        # The unique ID of the VLAN.

        @[JSON::Field(key: "vlanId")]
        getter vlan_id : Int32?

        # The state of the VLAN.

        @[JSON::Field(key: "vlanState")]
        getter vlan_state : String?

        def initialize(
          @availability_zone : String? = nil,
          @cidr : String? = nil,
          @created_at : Time? = nil,
          @eip_associations : Array(Types::EipAssociation)? = nil,
          @function_name : String? = nil,
          @is_public : Bool? = nil,
          @modified_at : Time? = nil,
          @network_acl_id : String? = nil,
          @state_details : String? = nil,
          @subnet_id : String? = nil,
          @vlan_id : Int32? = nil,
          @vlan_state : String? = nil
        )
        end
      end
    end
  end
end
