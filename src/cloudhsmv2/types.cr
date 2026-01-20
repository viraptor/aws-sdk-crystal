require "json"
require "time"

module Aws
  module CloudHSMV2
    module Types

      # Contains information about a backup of an CloudHSM cluster. All backup objects contain the BackupId
      # , BackupState , ClusterId , and CreateTimestamp parameters. Backups that were copied into a
      # destination region additionally contain the CopyTimestamp , SourceBackup , SourceCluster , and
      # SourceRegion parameters. A backup that is pending deletion will include the DeleteTimestamp
      # parameter.

      struct Backup
        include JSON::Serializable

        # The identifier (ID) of the backup.

        @[JSON::Field(key: "BackupId")]
        getter backup_id : String

        # The Amazon Resource Name (ARN) of the backup.

        @[JSON::Field(key: "BackupArn")]
        getter backup_arn : String?

        # The state of the backup.

        @[JSON::Field(key: "BackupState")]
        getter backup_state : String?

        # The identifier (ID) of the cluster that was backed up.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # The date and time when the backup was copied from a source backup.

        @[JSON::Field(key: "CopyTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter copy_timestamp : Time?

        # The date and time when the backup was created.

        @[JSON::Field(key: "CreateTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_timestamp : Time?

        # The date and time when the backup will be permanently deleted.

        @[JSON::Field(key: "DeleteTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter delete_timestamp : Time?

        # The HSM type used to create the backup.

        @[JSON::Field(key: "HsmType")]
        getter hsm_type : String?

        # The mode of the cluster that was backed up.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # Specifies whether the service should exempt a backup from the retention policy for the cluster. True
        # exempts a backup from the retention policy. False means the service applies the backup retention
        # policy defined at the cluster.

        @[JSON::Field(key: "NeverExpires")]
        getter never_expires : Bool?

        # The identifier (ID) of the source backup from which the new backup was copied.

        @[JSON::Field(key: "SourceBackup")]
        getter source_backup : String?

        # The identifier (ID) of the cluster containing the source backup from which the new backup was
        # copied.

        @[JSON::Field(key: "SourceCluster")]
        getter source_cluster : String?

        # The AWS Region that contains the source backup from which the new backup was copied.

        @[JSON::Field(key: "SourceRegion")]
        getter source_region : String?

        # The list of tags for the backup.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @backup_id : String,
          @backup_arn : String? = nil,
          @backup_state : String? = nil,
          @cluster_id : String? = nil,
          @copy_timestamp : Time? = nil,
          @create_timestamp : Time? = nil,
          @delete_timestamp : Time? = nil,
          @hsm_type : String? = nil,
          @mode : String? = nil,
          @never_expires : Bool? = nil,
          @source_backup : String? = nil,
          @source_cluster : String? = nil,
          @source_region : String? = nil,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # A policy that defines the number of days to retain backups.

      struct BackupRetentionPolicy
        include JSON::Serializable

        # The type of backup retention policy. For the DAYS type, the value is the number of days to retain
        # backups.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Use a value between 7 - 379.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains one or more certificates or a certificate signing request (CSR).

      struct Certificates
        include JSON::Serializable

        # The HSM hardware certificate issued (signed) by CloudHSM.

        @[JSON::Field(key: "AwsHardwareCertificate")]
        getter aws_hardware_certificate : String?

        # The cluster certificate issued (signed) by the issuing certificate authority (CA) of the cluster's
        # owner.

        @[JSON::Field(key: "ClusterCertificate")]
        getter cluster_certificate : String?

        # The cluster's certificate signing request (CSR). The CSR exists only when the cluster's state is
        # UNINITIALIZED .

        @[JSON::Field(key: "ClusterCsr")]
        getter cluster_csr : String?

        # The HSM certificate issued (signed) by the HSM hardware.

        @[JSON::Field(key: "HsmCertificate")]
        getter hsm_certificate : String?

        # The HSM hardware certificate issued (signed) by the hardware manufacturer.

        @[JSON::Field(key: "ManufacturerHardwareCertificate")]
        getter manufacturer_hardware_certificate : String?

        def initialize(
          @aws_hardware_certificate : String? = nil,
          @cluster_certificate : String? = nil,
          @cluster_csr : String? = nil,
          @hsm_certificate : String? = nil,
          @manufacturer_hardware_certificate : String? = nil
        )
        end
      end

      # The request was rejected because the requester does not have permission to perform the requested
      # operation.

      struct CloudHsmAccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because of an CloudHSM internal failure. The request can be retried.

      struct CloudHsmInternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because it is not a valid request.

      struct CloudHsmInvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because it exceeds an CloudHSM limit.

      struct CloudHsmResourceLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because it refers to a resource that cannot be found.

      struct CloudHsmResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because an error occurred.

      struct CloudHsmServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because of a tagging failure. Verify the tag conditions in all applicable
      # policies, and then retry the request.

      struct CloudHsmTagException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about an CloudHSM cluster.

      struct Cluster
        include JSON::Serializable

        # The cluster's backup policy.

        @[JSON::Field(key: "BackupPolicy")]
        getter backup_policy : String?

        # A policy that defines how the service retains backups.

        @[JSON::Field(key: "BackupRetentionPolicy")]
        getter backup_retention_policy : Types::BackupRetentionPolicy?

        # Contains one or more certificates or a certificate signing request (CSR).

        @[JSON::Field(key: "Certificates")]
        getter certificates : Types::Certificates?

        # The cluster's identifier (ID).

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # The date and time when the cluster was created.

        @[JSON::Field(key: "CreateTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_timestamp : Time?

        # The type of HSM that the cluster contains.

        @[JSON::Field(key: "HsmType")]
        getter hsm_type : String?

        # The timestamp until when the cluster can be rolled back to its original HSM type.

        @[JSON::Field(key: "HsmTypeRollbackExpiration", converter: Aws::Runtime::UnixTimestampConverter)]
        getter hsm_type_rollback_expiration : Time?

        # Contains information about the HSMs in the cluster.

        @[JSON::Field(key: "Hsms")]
        getter hsms : Array(Types::Hsm)?

        # The mode of the cluster.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The cluster's NetworkType can be IPv4 (the default) or DUALSTACK. The IPv4 NetworkType restricts
        # communication between your application and the hardware security modules (HSMs) to the IPv4 protocol
        # only. The DUALSTACK NetworkType enables communication over both IPv4 and IPv6 protocols. To use
        # DUALSTACK, configure your virtual private cloud (VPC) and subnets to support both IPv4 and IPv6.
        # This configuration involves adding IPv6 Classless Inter-Domain Routing (CIDR) blocks to the existing
        # IPv4 CIDR blocks in your subnets. The NetworkType you choose affects the network addressing options
        # for your cluster. DUALSTACK provides more flexibility by supporting both IPv4 and IPv6
        # communication.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The default password for the cluster's Pre-Crypto Officer (PRECO) user.

        @[JSON::Field(key: "PreCoPassword")]
        getter pre_co_password : String?

        # The identifier (ID) of the cluster's security group.

        @[JSON::Field(key: "SecurityGroup")]
        getter security_group : String?

        # The identifier (ID) of the backup used to create the cluster. This value exists only when the
        # cluster was created from a backup.

        @[JSON::Field(key: "SourceBackupId")]
        getter source_backup_id : String?

        # The cluster's state.

        @[JSON::Field(key: "State")]
        getter state : String?

        # A description of the cluster's state.

        @[JSON::Field(key: "StateMessage")]
        getter state_message : String?

        # A map from availability zone to the cluster’s subnet in that availability zone.

        @[JSON::Field(key: "SubnetMapping")]
        getter subnet_mapping : Hash(String, String)?

        # The list of tags for the cluster.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        # The identifier (ID) of the virtual private cloud (VPC) that contains the cluster.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @backup_policy : String? = nil,
          @backup_retention_policy : Types::BackupRetentionPolicy? = nil,
          @certificates : Types::Certificates? = nil,
          @cluster_id : String? = nil,
          @create_timestamp : Time? = nil,
          @hsm_type : String? = nil,
          @hsm_type_rollback_expiration : Time? = nil,
          @hsms : Array(Types::Hsm)? = nil,
          @mode : String? = nil,
          @network_type : String? = nil,
          @pre_co_password : String? = nil,
          @security_group : String? = nil,
          @source_backup_id : String? = nil,
          @state : String? = nil,
          @state_message : String? = nil,
          @subnet_mapping : Hash(String, String)? = nil,
          @tag_list : Array(Types::Tag)? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct CopyBackupToRegionRequest
        include JSON::Serializable

        # The ID of the backup that will be copied to the destination region.

        @[JSON::Field(key: "BackupId")]
        getter backup_id : String

        # The AWS region that will contain your copied CloudHSM cluster backup.

        @[JSON::Field(key: "DestinationRegion")]
        getter destination_region : String

        # Tags to apply to the destination backup during creation. If you specify tags, only these tags will
        # be applied to the destination backup. If you do not specify tags, the service copies tags from the
        # source backup to the destination backup.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @backup_id : String,
          @destination_region : String,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end


      struct CopyBackupToRegionResponse
        include JSON::Serializable

        # Information on the backup that will be copied to the destination region, including CreateTimestamp,
        # SourceBackup, SourceCluster, and Source Region. CreateTimestamp of the destination backup will be
        # the same as that of the source backup. You will need to use the sourceBackupID returned in this
        # operation to use the DescribeBackups operation on the backup that will be copied to the destination
        # region.

        @[JSON::Field(key: "DestinationBackup")]
        getter destination_backup : Types::DestinationBackup?

        def initialize(
          @destination_backup : Types::DestinationBackup? = nil
        )
        end
      end


      struct CreateClusterRequest
        include JSON::Serializable

        # The type of HSM to use in the cluster. The allowed values are hsm1.medium and hsm2m.medium .

        @[JSON::Field(key: "HsmType")]
        getter hsm_type : String

        # The identifiers (IDs) of the subnets where you are creating the cluster. You must specify at least
        # one subnet. If you specify multiple subnets, they must meet the following criteria: All subnets must
        # be in the same virtual private cloud (VPC). You can specify only one subnet per Availability Zone.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A policy that defines how the service retains backups.

        @[JSON::Field(key: "BackupRetentionPolicy")]
        getter backup_retention_policy : Types::BackupRetentionPolicy?

        # The mode to use in the cluster. The allowed values are FIPS and NON_FIPS .

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The NetworkType to create a cluster with. The allowed values are IPV4 and DUALSTACK .

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The identifier (ID) or the Amazon Resource Name (ARN) of the cluster backup to restore. Use this
        # value to restore the cluster from a backup instead of creating a new cluster. To find the backup ID
        # or ARN, use DescribeBackups . If using a backup in another account, the full ARN must be supplied.

        @[JSON::Field(key: "SourceBackupId")]
        getter source_backup_id : String?

        # Tags to apply to the CloudHSM cluster during creation.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @hsm_type : String,
          @subnet_ids : Array(String),
          @backup_retention_policy : Types::BackupRetentionPolicy? = nil,
          @mode : String? = nil,
          @network_type : String? = nil,
          @source_backup_id : String? = nil,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateClusterResponse
        include JSON::Serializable

        # Information about the cluster that was created.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct CreateHsmRequest
        include JSON::Serializable

        # The Availability Zone where you are creating the HSM. To find the cluster's Availability Zones, use
        # DescribeClusters .

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String

        # The identifier (ID) of the HSM's cluster. To find the cluster ID, use DescribeClusters .

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The HSM's IP address. If you specify an IP address, use an available address from the subnet that
        # maps to the Availability Zone where you are creating the HSM. If you don't specify an IP address,
        # one is chosen for you from that subnet.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        def initialize(
          @availability_zone : String,
          @cluster_id : String,
          @ip_address : String? = nil
        )
        end
      end


      struct CreateHsmResponse
        include JSON::Serializable

        # Information about the HSM that was created.

        @[JSON::Field(key: "Hsm")]
        getter hsm : Types::Hsm?

        def initialize(
          @hsm : Types::Hsm? = nil
        )
        end
      end


      struct DeleteBackupRequest
        include JSON::Serializable

        # The ID of the backup to be deleted. To find the ID of a backup, use the DescribeBackups operation.

        @[JSON::Field(key: "BackupId")]
        getter backup_id : String

        def initialize(
          @backup_id : String
        )
        end
      end


      struct DeleteBackupResponse
        include JSON::Serializable

        # Information on the Backup object deleted.

        @[JSON::Field(key: "Backup")]
        getter backup : Types::Backup?

        def initialize(
          @backup : Types::Backup? = nil
        )
        end
      end


      struct DeleteClusterRequest
        include JSON::Serializable

        # The identifier (ID) of the cluster that you are deleting. To find the cluster ID, use
        # DescribeClusters .

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end


      struct DeleteClusterResponse
        include JSON::Serializable

        # Information about the cluster that was deleted.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct DeleteHsmRequest
        include JSON::Serializable

        # The identifier (ID) of the cluster that contains the HSM that you are deleting.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The identifier (ID) of the elastic network interface (ENI) of the HSM that you are deleting.

        @[JSON::Field(key: "EniId")]
        getter eni_id : String?

        # The IP address of the elastic network interface (ENI) of the HSM that you are deleting.

        @[JSON::Field(key: "EniIp")]
        getter eni_ip : String?

        # The identifier (ID) of the HSM that you are deleting.

        @[JSON::Field(key: "HsmId")]
        getter hsm_id : String?

        def initialize(
          @cluster_id : String,
          @eni_id : String? = nil,
          @eni_ip : String? = nil,
          @hsm_id : String? = nil
        )
        end
      end


      struct DeleteHsmResponse
        include JSON::Serializable

        # The identifier (ID) of the HSM that was deleted.

        @[JSON::Field(key: "HsmId")]
        getter hsm_id : String?

        def initialize(
          @hsm_id : String? = nil
        )
        end
      end


      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource from which the policy will be removed.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end


      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        # The policy previously attached to the resource.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # Amazon Resource Name (ARN) of the resource from which the policy was deleted.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end


      struct DescribeBackupsRequest
        include JSON::Serializable

        # One or more filters to limit the items returned in the response. Use the backupIds filter to return
        # only the specified backups. Specify backups by their backup identifier (ID). Use the sourceBackupIds
        # filter to return only the backups created from a source backup. The sourceBackupID of a source
        # backup is returned by the CopyBackupToRegion operation. Use the clusterIds filter to return only the
        # backups for the specified clusters. Specify clusters by their cluster identifier (ID). Use the
        # states filter to return only backups that match the specified state. Use the neverExpires filter to
        # return backups filtered by the value in the neverExpires parameter. True returns all backups exempt
        # from the backup retention policy. False returns all backups with a backup retention policy defined
        # at the cluster.

        @[JSON::Field(key: "Filters")]
        getter filters : Hash(String, Array(String))?

        # The maximum number of backups to return in the response. When there are more backups than the number
        # you specify, the response contains a NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The NextToken value that you received in the previous response. Use this value to get more backups.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Describe backups that are shared with you. By default when using this option, the command returns
        # backups that have been shared using a standard Resource Access Manager resource share. In order for
        # a backup that was shared using the PutResourcePolicy command to be returned, the share must be
        # promoted to a standard resource share using the RAM PromoteResourceShareCreatedFromPolicy API
        # operation. For more information about sharing backups, see Working with shared backups in the
        # CloudHSM User Guide.

        @[JSON::Field(key: "Shared")]
        getter shared : Bool?

        # Designates whether or not to sort the return backups by ascending chronological order of generation.

        @[JSON::Field(key: "SortAscending")]
        getter sort_ascending : Bool?

        def initialize(
          @filters : Hash(String, Array(String))? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @shared : Bool? = nil,
          @sort_ascending : Bool? = nil
        )
        end
      end


      struct DescribeBackupsResponse
        include JSON::Serializable

        # A list of backups.

        @[JSON::Field(key: "Backups")]
        getter backups : Array(Types::Backup)?

        # An opaque string that indicates that the response contains only a subset of backups. Use this value
        # in a subsequent DescribeBackups request to get more backups.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backups : Array(Types::Backup)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeClustersRequest
        include JSON::Serializable

        # One or more filters to limit the items returned in the response. Use the clusterIds filter to return
        # only the specified clusters. Specify clusters by their cluster identifier (ID). Use the vpcIds
        # filter to return only the clusters in the specified virtual private clouds (VPCs). Specify VPCs by
        # their VPC identifier (ID). Use the states filter to return only clusters that match the specified
        # state.

        @[JSON::Field(key: "Filters")]
        getter filters : Hash(String, Array(String))?

        # The maximum number of clusters to return in the response. When there are more clusters than the
        # number you specify, the response contains a NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The NextToken value that you received in the previous response. Use this value to get more clusters.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Hash(String, Array(String))? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeClustersResponse
        include JSON::Serializable

        # A list of clusters.

        @[JSON::Field(key: "Clusters")]
        getter clusters : Array(Types::Cluster)?

        # An opaque string that indicates that the response contains only a subset of clusters. Use this value
        # in a subsequent DescribeClusters request to get more clusters.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(Types::Cluster)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains information about the backup that will be copied and created by the CopyBackupToRegion
      # operation.

      struct DestinationBackup
        include JSON::Serializable

        # The date and time when both the source backup was created.

        @[JSON::Field(key: "CreateTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_timestamp : Time?

        # The identifier (ID) of the source backup from which the new backup was copied.

        @[JSON::Field(key: "SourceBackup")]
        getter source_backup : String?

        # The identifier (ID) of the cluster containing the source backup from which the new backup was
        # copied.

        @[JSON::Field(key: "SourceCluster")]
        getter source_cluster : String?

        # The AWS region that contains the source backup from which the new backup was copied.

        @[JSON::Field(key: "SourceRegion")]
        getter source_region : String?

        def initialize(
          @create_timestamp : Time? = nil,
          @source_backup : String? = nil,
          @source_cluster : String? = nil,
          @source_region : String? = nil
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource to which a policy is attached.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end


      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The policy attached to a resource.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      # Contains information about a hardware security module (HSM) in an CloudHSM cluster.

      struct Hsm
        include JSON::Serializable

        # The HSM's identifier (ID).

        @[JSON::Field(key: "HsmId")]
        getter hsm_id : String

        # The Availability Zone that contains the HSM.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The identifier (ID) of the cluster that contains the HSM.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # The identifier (ID) of the HSM's elastic network interface (ENI).

        @[JSON::Field(key: "EniId")]
        getter eni_id : String?

        # The IP address of the HSM's elastic network interface (ENI).

        @[JSON::Field(key: "EniIp")]
        getter eni_ip : String?

        # The IPv6 address (if any) of the HSM's elastic network interface (ENI).

        @[JSON::Field(key: "EniIpV6")]
        getter eni_ip_v6 : String?

        # The type of HSM.

        @[JSON::Field(key: "HsmType")]
        getter hsm_type : String?

        # The HSM's state.

        @[JSON::Field(key: "State")]
        getter state : String?

        # A description of the HSM's state.

        @[JSON::Field(key: "StateMessage")]
        getter state_message : String?

        # The subnet that contains the HSM's elastic network interface (ENI).

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        def initialize(
          @hsm_id : String,
          @availability_zone : String? = nil,
          @cluster_id : String? = nil,
          @eni_id : String? = nil,
          @eni_ip : String? = nil,
          @eni_ip_v6 : String? = nil,
          @hsm_type : String? = nil,
          @state : String? = nil,
          @state_message : String? = nil,
          @subnet_id : String? = nil
        )
        end
      end


      struct InitializeClusterRequest
        include JSON::Serializable

        # The identifier (ID) of the cluster that you are claiming. To find the cluster ID, use
        # DescribeClusters .

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The cluster certificate issued (signed) by your issuing certificate authority (CA). The certificate
        # must be in PEM format and can contain a maximum of 5000 characters.

        @[JSON::Field(key: "SignedCert")]
        getter signed_cert : String

        # The issuing certificate of the issuing certificate authority (CA) that issued (signed) the cluster
        # certificate. You must use a self-signed certificate. The certificate used to sign the HSM CSR must
        # be directly available, and thus must be the root certificate. The certificate must be in PEM format
        # and can contain a maximum of 5000 characters.

        @[JSON::Field(key: "TrustAnchor")]
        getter trust_anchor : String

        def initialize(
          @cluster_id : String,
          @signed_cert : String,
          @trust_anchor : String
        )
        end
      end


      struct InitializeClusterResponse
        include JSON::Serializable

        # The cluster's state.

        @[JSON::Field(key: "State")]
        getter state : String?

        # A description of the cluster's state.

        @[JSON::Field(key: "StateMessage")]
        getter state_message : String?

        def initialize(
          @state : String? = nil,
          @state_message : String? = nil
        )
        end
      end


      struct ListTagsRequest
        include JSON::Serializable

        # The cluster identifier (ID) for the cluster whose tags you are getting. To find the cluster ID, use
        # DescribeClusters .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The maximum number of tags to return in the response. When there are more tags than the number you
        # specify, the response contains a NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The NextToken value that you received in the previous response. Use this value to get more tags.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsResponse
        include JSON::Serializable

        # A list of tags.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)

        # An opaque string that indicates that the response contains only a subset of tags. Use this value in
        # a subsequent ListTags request to get more tags.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @tag_list : Array(Types::Tag),
          @next_token : String? = nil
        )
        end
      end


      struct ModifyBackupAttributesRequest
        include JSON::Serializable

        # The identifier (ID) of the backup to modify. To find the ID of a backup, use the DescribeBackups
        # operation.

        @[JSON::Field(key: "BackupId")]
        getter backup_id : String

        # Specifies whether the service should exempt a backup from the retention policy for the cluster. True
        # exempts a backup from the retention policy. False means the service applies the backup retention
        # policy defined at the cluster.

        @[JSON::Field(key: "NeverExpires")]
        getter never_expires : Bool

        def initialize(
          @backup_id : String,
          @never_expires : Bool
        )
        end
      end


      struct ModifyBackupAttributesResponse
        include JSON::Serializable


        @[JSON::Field(key: "Backup")]
        getter backup : Types::Backup?

        def initialize(
          @backup : Types::Backup? = nil
        )
        end
      end


      struct ModifyClusterRequest
        include JSON::Serializable

        # The identifier (ID) of the cluster that you want to modify. To find the cluster ID, use
        # DescribeClusters .

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # A policy that defines how the service retains backups.

        @[JSON::Field(key: "BackupRetentionPolicy")]
        getter backup_retention_policy : Types::BackupRetentionPolicy?

        # The desired HSM type of the cluster.

        @[JSON::Field(key: "HsmType")]
        getter hsm_type : String?

        def initialize(
          @cluster_id : String,
          @backup_retention_policy : Types::BackupRetentionPolicy? = nil,
          @hsm_type : String? = nil
        )
        end
      end


      struct ModifyClusterResponse
        include JSON::Serializable


        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The policy you want to associate with a resource. For an example policy, see Working with shared
        # backups in the CloudHSM User Guide

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # Amazon Resource Name (ARN) of the resource to which you want to attach a policy.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end


      struct PutResourcePolicyResponse
        include JSON::Serializable

        # The policy attached to a resource.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # Amazon Resource Name (ARN) of the resource to which a policy is attached.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end


      struct RestoreBackupRequest
        include JSON::Serializable

        # The ID of the backup to be restored. To find the ID of a backup, use the DescribeBackups operation.

        @[JSON::Field(key: "BackupId")]
        getter backup_id : String

        def initialize(
          @backup_id : String
        )
        end
      end


      struct RestoreBackupResponse
        include JSON::Serializable

        # Information on the Backup object created.

        @[JSON::Field(key: "Backup")]
        getter backup : Types::Backup?

        def initialize(
          @backup : Types::Backup? = nil
        )
        end
      end

      # Contains a tag. A tag is a key-value pair.

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag.

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

        # The cluster identifier (ID) for the cluster that you are tagging. To find the cluster ID, use
        # DescribeClusters .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # A list of one or more tags.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @tag_list : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The cluster identifier (ID) for the cluster whose tags you are removing. To find the cluster ID, use
        # DescribeClusters .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # A list of one or more tag keys for the tags that you are removing. Specify only the tag keys, not
        # the tag values.

        @[JSON::Field(key: "TagKeyList")]
        getter tag_key_list : Array(String)

        def initialize(
          @resource_id : String,
          @tag_key_list : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
