require "json"
require "time"

module AwsSdk
  module Redshift
    module Types

      struct AcceptReservedNodeExchangeInputMessage
        include JSON::Serializable

        # A string representing the node identifier of the DC1 Reserved Node to be exchanged.
        @[JSON::Field(key: "ReservedNodeId")]
        getter reserved_node_id : String

        # The unique identifier of the DC2 Reserved Node offering to be used for the exchange. You can obtain
        # the value for the parameter by calling GetReservedNodeExchangeOfferings
        @[JSON::Field(key: "TargetReservedNodeOfferingId")]
        getter target_reserved_node_offering_id : String

        def initialize(
          @reserved_node_id : String,
          @target_reserved_node_offering_id : String
        )
        end
      end

      struct AcceptReservedNodeExchangeOutputMessage
        include JSON::Serializable

        @[JSON::Field(key: "ExchangedReservedNode")]
        getter exchanged_reserved_node : Types::ReservedNode?

        def initialize(
          @exchanged_reserved_node : Types::ReservedNode? = nil
        )
        end
      end

      # You are not authorized to access the cluster.
      struct AccessToClusterDeniedFault
        include JSON::Serializable

        def initialize
        end
      end

      # The owner of the specified snapshot has not authorized your account to access the snapshot.
      struct AccessToSnapshotDeniedFault
        include JSON::Serializable

        def initialize
        end
      end

      # A name value pair that describes an aspect of an account.
      struct AccountAttribute
        include JSON::Serializable

        # The name of the attribute.
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # A list of attribute values.
        @[JSON::Field(key: "AttributeValues")]
        getter attribute_values : Array(Types::AttributeValueTarget)?

        def initialize(
          @attribute_name : String? = nil,
          @attribute_values : Array(Types::AttributeValueTarget)? = nil
        )
        end
      end

      struct AccountAttributeList
        include JSON::Serializable

        # A list of attributes assigned to an account.
        @[JSON::Field(key: "AccountAttributes")]
        getter account_attributes : Array(Types::AccountAttribute)?

        def initialize(
          @account_attributes : Array(Types::AccountAttribute)? = nil
        )
        end
      end

      # Describes an Amazon Web Services account authorized to restore a snapshot.
      struct AccountWithRestoreAccess
        include JSON::Serializable

        # The identifier of an Amazon Web Services support account authorized to restore a snapshot. For
        # Amazon Web Services Support, the identifier is amazon-redshift-support .
        @[JSON::Field(key: "AccountAlias")]
        getter account_alias : String?

        # The identifier of an Amazon Web Services account authorized to restore a snapshot.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @account_alias : String? = nil,
          @account_id : String? = nil
        )
        end
      end

      # The operation that uses this structure is retired. Amazon Redshift automatically determines whether
      # to use AQUA (Advanced Query Accelerator).
      struct AquaConfiguration
        include JSON::Serializable

        # This field is retired. Amazon Redshift automatically determines whether to use AQUA (Advanced Query
        # Accelerator).
        @[JSON::Field(key: "AquaConfigurationStatus")]
        getter aqua_configuration_status : String?

        # This field is retired. Amazon Redshift automatically determines whether to use AQUA (Advanced Query
        # Accelerator).
        @[JSON::Field(key: "AquaStatus")]
        getter aqua_status : String?

        def initialize(
          @aqua_configuration_status : String? = nil,
          @aqua_status : String? = nil
        )
        end
      end

      struct AssociateDataShareConsumerMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the datashare that the consumer is to use.
        @[JSON::Field(key: "DataShareArn")]
        getter data_share_arn : String

        # If set to true, allows write operations for a datashare.
        @[JSON::Field(key: "AllowWrites")]
        getter allow_writes : Bool?

        # A value that specifies whether the datashare is associated with the entire account.
        @[JSON::Field(key: "AssociateEntireAccount")]
        getter associate_entire_account : Bool?

        # The Amazon Resource Name (ARN) of the consumer namespace associated with the datashare.
        @[JSON::Field(key: "ConsumerArn")]
        getter consumer_arn : String?

        # From a datashare consumer account, associates a datashare with all existing and future namespaces in
        # the specified Amazon Web Services Region.
        @[JSON::Field(key: "ConsumerRegion")]
        getter consumer_region : String?

        def initialize(
          @data_share_arn : String,
          @allow_writes : Bool? = nil,
          @associate_entire_account : Bool? = nil,
          @consumer_arn : String? = nil,
          @consumer_region : String? = nil
        )
        end
      end

      # Contains information about the custom domain name association.
      struct Association
        include JSON::Serializable

        # A list of all associated clusters and domain names tied to a specific certificate.
        @[JSON::Field(key: "CertificateAssociations")]
        getter certificate_associations : Array(Types::CertificateAssociation)?

        # The Amazon Resource Name (ARN) for the certificate associated with the custom domain.
        @[JSON::Field(key: "CustomDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The expiration date for the certificate.
        @[JSON::Field(key: "CustomDomainCertificateExpiryDate")]
        getter custom_domain_certificate_expiry_date : Time?

        def initialize(
          @certificate_associations : Array(Types::CertificateAssociation)? = nil,
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_certificate_expiry_date : Time? = nil
        )
        end
      end

      # Describes an attribute value.
      struct AttributeValueTarget
        include JSON::Serializable

        # The value of the attribute.
        @[JSON::Field(key: "AttributeValue")]
        getter attribute_value : String?

        def initialize(
          @attribute_value : String? = nil
        )
        end
      end

      # Describes an authentication profile.
      struct AuthenticationProfile
        include JSON::Serializable

        # The content of the authentication profile in JSON format. The maximum length of the JSON string is
        # determined by a quota for your account.
        @[JSON::Field(key: "AuthenticationProfileContent")]
        getter authentication_profile_content : String?

        # The name of the authentication profile.
        @[JSON::Field(key: "AuthenticationProfileName")]
        getter authentication_profile_name : String?

        def initialize(
          @authentication_profile_content : String? = nil,
          @authentication_profile_name : String? = nil
        )
        end
      end

      # The authentication profile already exists.
      struct AuthenticationProfileAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The authentication profile can't be found.
      struct AuthenticationProfileNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The size or number of authentication profiles has exceeded the quota. The maximum length of the JSON
      # string and maximum number of authentication profiles is determined by a quota for your account.
      struct AuthenticationProfileQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified CIDR block or EC2 security group is already authorized for the specified cluster
      # security group.
      struct AuthorizationAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified CIDR IP range or EC2 security group is not authorized for the specified cluster
      # security group.
      struct AuthorizationNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The authorization quota for the cluster security group has been reached.
      struct AuthorizationQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      struct AuthorizeClusterSecurityGroupIngressMessage
        include JSON::Serializable

        # The name of the security group to which the ingress rule is added.
        @[JSON::Field(key: "ClusterSecurityGroupName")]
        getter cluster_security_group_name : String

        # The IP range to be added the Amazon Redshift security group.
        @[JSON::Field(key: "CIDRIP")]
        getter cidrip : String?

        # The EC2 security group to be added the Amazon Redshift security group.
        @[JSON::Field(key: "EC2SecurityGroupName")]
        getter ec2_security_group_name : String?

        # The Amazon Web Services account number of the owner of the security group specified by the
        # EC2SecurityGroupName parameter. The Amazon Web Services Access Key ID is not an acceptable value.
        # Example: 111122223333
        @[JSON::Field(key: "EC2SecurityGroupOwnerId")]
        getter ec2_security_group_owner_id : String?

        def initialize(
          @cluster_security_group_name : String,
          @cidrip : String? = nil,
          @ec2_security_group_name : String? = nil,
          @ec2_security_group_owner_id : String? = nil
        )
        end
      end

      struct AuthorizeClusterSecurityGroupIngressResult
        include JSON::Serializable

        @[JSON::Field(key: "ClusterSecurityGroup")]
        getter cluster_security_group : Types::ClusterSecurityGroup?

        def initialize(
          @cluster_security_group : Types::ClusterSecurityGroup? = nil
        )
        end
      end

      struct AuthorizeDataShareMessage
        include JSON::Serializable

        # The identifier of the data consumer that is authorized to access the datashare. This identifier is
        # an Amazon Web Services account ID or a keyword, such as ADX.
        @[JSON::Field(key: "ConsumerIdentifier")]
        getter consumer_identifier : String

        # The Amazon Resource Name (ARN) of the datashare namespace that producers are to authorize sharing
        # for.
        @[JSON::Field(key: "DataShareArn")]
        getter data_share_arn : String

        # If set to true, allows write operations for a datashare.
        @[JSON::Field(key: "AllowWrites")]
        getter allow_writes : Bool?

        def initialize(
          @consumer_identifier : String,
          @data_share_arn : String,
          @allow_writes : Bool? = nil
        )
        end
      end

      struct AuthorizeEndpointAccessMessage
        include JSON::Serializable

        # The Amazon Web Services account ID to grant access to.
        @[JSON::Field(key: "Account")]
        getter account : String

        # The cluster identifier of the cluster to grant access to.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The virtual private cloud (VPC) identifiers to grant access to.
        @[JSON::Field(key: "VpcIds")]
        getter vpc_ids : Array(String)?

        def initialize(
          @account : String,
          @cluster_identifier : String? = nil,
          @vpc_ids : Array(String)? = nil
        )
        end
      end

      struct AuthorizeSnapshotAccessMessage
        include JSON::Serializable

        # The identifier of the Amazon Web Services account authorized to restore the specified snapshot. To
        # share a snapshot with Amazon Web Services Support, specify amazon-redshift-support.
        @[JSON::Field(key: "AccountWithRestoreAccess")]
        getter account_with_restore_access : String

        # The Amazon Resource Name (ARN) of the snapshot to authorize access to.
        @[JSON::Field(key: "SnapshotArn")]
        getter snapshot_arn : String?

        # The identifier of the cluster the snapshot was created from. If the snapshot to access doesn't exist
        # and the associated IAM policy doesn't allow access to all (*) snapshots - This parameter is
        # required. Otherwise, permissions aren't available to check if the snapshot exists. If the snapshot
        # to access exists - This parameter isn't required. Redshift can retrieve the cluster identifier and
        # use it to validate snapshot authorization.
        @[JSON::Field(key: "SnapshotClusterIdentifier")]
        getter snapshot_cluster_identifier : String?

        # The identifier of the snapshot the account is authorized to restore.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String?

        def initialize(
          @account_with_restore_access : String,
          @snapshot_arn : String? = nil,
          @snapshot_cluster_identifier : String? = nil,
          @snapshot_identifier : String? = nil
        )
        end
      end

      struct AuthorizeSnapshotAccessResult
        include JSON::Serializable

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      # The authorized token issuer for the Amazon Redshift IAM Identity Center application.
      struct AuthorizedTokenIssuer
        include JSON::Serializable

        # The list of audiences for the authorized token issuer for integrating Amazon Redshift with IDC
        # Identity Center.
        @[JSON::Field(key: "AuthorizedAudiencesList")]
        getter authorized_audiences_list : Array(String)?

        # The ARN for the authorized token issuer for integrating Amazon Redshift with IDC Identity Center.
        @[JSON::Field(key: "TrustedTokenIssuerArn")]
        getter trusted_token_issuer_arn : String?

        def initialize(
          @authorized_audiences_list : Array(String)? = nil,
          @trusted_token_issuer_arn : String? = nil
        )
        end
      end

      # Describes an availability zone.
      struct AvailabilityZone
        include JSON::Serializable

        # The name of the availability zone.
        @[JSON::Field(key: "Name")]
        getter name : String?

        @[JSON::Field(key: "SupportedPlatforms")]
        getter supported_platforms : Array(Types::SupportedPlatform)?

        def initialize(
          @name : String? = nil,
          @supported_platforms : Array(Types::SupportedPlatform)? = nil
        )
        end
      end

      struct BatchDeleteClusterSnapshotsRequest
        include JSON::Serializable

        # A list of identifiers for the snapshots that you want to delete.
        @[JSON::Field(key: "Identifiers")]
        getter identifiers : Array(Types::DeleteClusterSnapshotMessage)

        def initialize(
          @identifiers : Array(Types::DeleteClusterSnapshotMessage)
        )
        end
      end

      struct BatchDeleteClusterSnapshotsResult
        include JSON::Serializable

        # A list of any errors returned.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::SnapshotErrorMessage)?

        # A list of the snapshot identifiers that were deleted.
        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        def initialize(
          @errors : Array(Types::SnapshotErrorMessage)? = nil,
          @resources : Array(String)? = nil
        )
        end
      end

      # The maximum number for a batch delete of snapshots has been reached. The limit is 100.
      struct BatchDeleteRequestSizeExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The maximum number for snapshot identifiers has been reached. The limit is 100.
      struct BatchModifyClusterSnapshotsLimitExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      struct BatchModifyClusterSnapshotsMessage
        include JSON::Serializable

        # A list of snapshot identifiers you want to modify.
        @[JSON::Field(key: "SnapshotIdentifierList")]
        getter snapshot_identifier_list : Array(String)

        # A boolean value indicating whether to override an exception if the retention period has passed.
        @[JSON::Field(key: "Force")]
        getter force : Bool?

        # The number of days that a manual snapshot is retained. If you specify the value -1, the manual
        # snapshot is retained indefinitely. The number must be either -1 or an integer between 1 and 3,653.
        # If you decrease the manual snapshot retention period from its current value, existing manual
        # snapshots that fall outside of the new retention period will return an error. If you want to
        # suppress the errors and delete the snapshots, use the force option.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        def initialize(
          @snapshot_identifier_list : Array(String),
          @force : Bool? = nil,
          @manual_snapshot_retention_period : Int32? = nil
        )
        end
      end

      struct BatchModifyClusterSnapshotsOutputMessage
        include JSON::Serializable

        # A list of any errors returned.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::SnapshotErrorMessage)?

        # A list of the snapshots that were modified.
        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        def initialize(
          @errors : Array(Types::SnapshotErrorMessage)? = nil,
          @resources : Array(String)? = nil
        )
        end
      end

      # Could not find the specified S3 bucket.
      struct BucketNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      struct CancelResizeMessage
        include JSON::Serializable

        # The unique identifier for the cluster that you want to cancel a resize operation for.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      # A cluster ID and custom domain name tied to a specific certificate. These are typically returned in
      # a list.
      struct CertificateAssociation
        include JSON::Serializable

        # The cluster identifier for the certificate association.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The custom domain name for the certificate association.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @custom_domain_name : String? = nil
        )
        end
      end

      # Describes a cluster.
      struct Cluster
        include JSON::Serializable

        # A boolean value that, if true , indicates that major version upgrades will be applied automatically
        # to the cluster during the maintenance window.
        @[JSON::Field(key: "AllowVersionUpgrade")]
        getter allow_version_upgrade : Bool?

        # This field is retired. Amazon Redshift automatically determines whether to use AQUA (Advanced Query
        # Accelerator).
        @[JSON::Field(key: "AquaConfiguration")]
        getter aqua_configuration : Types::AquaConfiguration?

        # The number of days that automatic cluster snapshots are retained.
        @[JSON::Field(key: "AutomatedSnapshotRetentionPeriod")]
        getter automated_snapshot_retention_period : Int32?

        # The name of the Availability Zone in which the cluster is located.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # Describes the status of the Availability Zone relocation operation.
        @[JSON::Field(key: "AvailabilityZoneRelocationStatus")]
        getter availability_zone_relocation_status : String?

        # The Amazon Resource Name (ARN) of the Glue data catalog associated with the cluster enabled with
        # Amazon Redshift federated permissions.
        @[JSON::Field(key: "CatalogArn")]
        getter catalog_arn : String?

        # The availability status of the cluster for queries. Possible values are the following: Available -
        # The cluster is available for queries. Unavailable - The cluster is not available for queries.
        # Maintenance - The cluster is intermittently available for queries due to maintenance activities.
        # Modifying - The cluster is intermittently available for queries due to changes that modify the
        # cluster. Failed - The cluster failed and is not available for queries.
        @[JSON::Field(key: "ClusterAvailabilityStatus")]
        getter cluster_availability_status : String?

        # The date and time that the cluster was created.
        @[JSON::Field(key: "ClusterCreateTime")]
        getter cluster_create_time : Time?

        # The unique identifier of the cluster.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The namespace Amazon Resource Name (ARN) of the cluster.
        @[JSON::Field(key: "ClusterNamespaceArn")]
        getter cluster_namespace_arn : String?

        # The nodes in the cluster.
        @[JSON::Field(key: "ClusterNodes")]
        getter cluster_nodes : Array(Types::ClusterNode)?

        # The list of cluster parameter groups that are associated with this cluster. Each parameter group in
        # the list is returned with its status.
        @[JSON::Field(key: "ClusterParameterGroups")]
        getter cluster_parameter_groups : Array(Types::ClusterParameterGroupStatus)?

        # The public key for the cluster.
        @[JSON::Field(key: "ClusterPublicKey")]
        getter cluster_public_key : String?

        # The specific revision number of the database in the cluster.
        @[JSON::Field(key: "ClusterRevisionNumber")]
        getter cluster_revision_number : String?

        # A list of cluster security group that are associated with the cluster. Each security group is
        # represented by an element that contains ClusterSecurityGroup.Name and ClusterSecurityGroup.Status
        # subelements. Cluster security groups are used when the cluster is not created in an Amazon Virtual
        # Private Cloud (VPC). Clusters that are created in a VPC use VPC security groups, which are listed by
        # the VpcSecurityGroups parameter.
        @[JSON::Field(key: "ClusterSecurityGroups")]
        getter cluster_security_groups : Array(Types::ClusterSecurityGroupMembership)?

        # A value that returns the destination region and retention period that are configured for
        # cross-region snapshot copy.
        @[JSON::Field(key: "ClusterSnapshotCopyStatus")]
        getter cluster_snapshot_copy_status : Types::ClusterSnapshotCopyStatus?

        # The current state of the cluster. Possible values are the following: available available,
        # prep-for-resize available, resize-cleanup cancelling-resize creating deleting final-snapshot
        # hardware-failure incompatible-hsm incompatible-network incompatible-parameters incompatible-restore
        # modifying paused rebooting renaming resizing rotating-keys storage-full updating-hsm
        @[JSON::Field(key: "ClusterStatus")]
        getter cluster_status : String?

        # The name of the subnet group that is associated with the cluster. This parameter is valid only when
        # the cluster is in a VPC.
        @[JSON::Field(key: "ClusterSubnetGroupName")]
        getter cluster_subnet_group_name : String?

        # The version ID of the Amazon Redshift engine that is running on the cluster.
        @[JSON::Field(key: "ClusterVersion")]
        getter cluster_version : String?

        # The certificate Amazon Resource Name (ARN) for the custom domain name.
        @[JSON::Field(key: "CustomDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The expiration date for the certificate associated with the custom domain name.
        @[JSON::Field(key: "CustomDomainCertificateExpiryDate")]
        getter custom_domain_certificate_expiry_date : Time?

        # The custom domain name associated with the cluster.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String?

        # The name of the initial database that was created when the cluster was created. This same name is
        # returned for the life of the cluster. If an initial database was not specified, a database named dev
        # dev was created by default.
        @[JSON::Field(key: "DBName")]
        getter db_name : String?

        @[JSON::Field(key: "DataTransferProgress")]
        getter data_transfer_progress : Types::DataTransferProgress?

        # The Amazon Resource Name (ARN) for the IAM role set as default for the cluster.
        @[JSON::Field(key: "DefaultIamRoleArn")]
        getter default_iam_role_arn : String?

        # Describes a group of DeferredMaintenanceWindow objects.
        @[JSON::Field(key: "DeferredMaintenanceWindows")]
        getter deferred_maintenance_windows : Array(Types::DeferredMaintenanceWindow)?

        # The status of the elastic IP (EIP) address.
        @[JSON::Field(key: "ElasticIpStatus")]
        getter elastic_ip_status : Types::ElasticIpStatus?

        # The number of nodes that you can resize the cluster to with the elastic resize method.
        @[JSON::Field(key: "ElasticResizeNumberOfNodeOptions")]
        getter elastic_resize_number_of_node_options : String?

        # A boolean value that, if true , indicates that data in the cluster is encrypted at rest.
        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # The connection endpoint.
        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        # An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create
        # a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see
        # Enhanced VPC Routing in the Amazon Redshift Cluster Management Guide. If this option is true ,
        # enhanced VPC routing is enabled. Default: false
        @[JSON::Field(key: "EnhancedVpcRouting")]
        getter enhanced_vpc_routing : Bool?

        # The date and time when the next snapshot is expected to be taken for clusters with a valid snapshot
        # schedule and backups enabled.
        @[JSON::Field(key: "ExpectedNextSnapshotScheduleTime")]
        getter expected_next_snapshot_schedule_time : Time?

        # The status of next expected snapshot for clusters having a valid snapshot schedule and backups
        # enabled. Possible values are the following: OnTrack - The next snapshot is expected to be taken on
        # time. Pending - The next snapshot is pending to be taken.
        @[JSON::Field(key: "ExpectedNextSnapshotScheduleTimeStatus")]
        getter expected_next_snapshot_schedule_time_status : String?

        # A boolean value that, if true , indicates that the cluster allocates additional compute resources to
        # run automatic optimization operations. Default: false
        @[JSON::Field(key: "ExtraComputeForAutomaticOptimization")]
        getter extra_compute_for_automatic_optimization : String?

        # A value that reports whether the Amazon Redshift cluster has finished applying any hardware security
        # module (HSM) settings changes specified in a modify cluster command. Values: active, applying
        @[JSON::Field(key: "HsmStatus")]
        getter hsm_status : Types::HsmStatus?

        # A list of Identity and Access Management (IAM) roles that can be used by the cluster to access other
        # Amazon Web Services services.
        @[JSON::Field(key: "IamRoles")]
        getter iam_roles : Array(Types::ClusterIamRole)?

        # The IP address type for the cluster. Possible values are ipv4 and dualstack .
        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The Key Management Service (KMS) key ID of the encryption key used to encrypt data in the cluster.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The status of the lakehouse registration for the cluster. Indicates whether the cluster is
        # successfully registered with Amazon Redshift federated permissions.
        @[JSON::Field(key: "LakehouseRegistrationStatus")]
        getter lakehouse_registration_status : String?

        # The name of the maintenance track for the cluster.
        @[JSON::Field(key: "MaintenanceTrackName")]
        getter maintenance_track_name : String?

        # The default number of days to retain a manual snapshot. If the value is -1, the snapshot is retained
        # indefinitely. This setting doesn't change the retention period of existing snapshots. The value must
        # be either -1 or an integer between 1 and 3,653.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        # The Amazon Resource Name (ARN) for the cluster's admin user credentials secret.
        @[JSON::Field(key: "MasterPasswordSecretArn")]
        getter master_password_secret_arn : String?

        # The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's admin
        # credentials secret.
        @[JSON::Field(key: "MasterPasswordSecretKmsKeyId")]
        getter master_password_secret_kms_key_id : String?

        # The admin user name for the cluster. This name is used to connect to the database that is specified
        # in the DBName parameter.
        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # The status of a modify operation, if any, initiated for the cluster.
        @[JSON::Field(key: "ModifyStatus")]
        getter modify_status : String?

        # A boolean value that, if true, indicates that the cluster is deployed in two Availability Zones.
        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : String?

        # The secondary compute unit of a cluster, if Multi-AZ deployment is turned on.
        @[JSON::Field(key: "MultiAZSecondary")]
        getter multi_az_secondary : Types::SecondaryClusterInfo?

        # The date and time in UTC when system maintenance can begin.
        @[JSON::Field(key: "NextMaintenanceWindowStartTime")]
        getter next_maintenance_window_start_time : Time?

        # The node type for the nodes in the cluster.
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The number of compute nodes in the cluster.
        @[JSON::Field(key: "NumberOfNodes")]
        getter number_of_nodes : Int32?

        # Cluster operations that are waiting to be started.
        @[JSON::Field(key: "PendingActions")]
        getter pending_actions : Array(String)?

        # A value that, if present, indicates that changes to the cluster are pending. Specific pending
        # changes are identified by subelements.
        @[JSON::Field(key: "PendingModifiedValues")]
        getter pending_modified_values : Types::PendingModifiedValues?

        # The weekly time range, in Universal Coordinated Time (UTC), during which system maintenance can
        # occur.
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # A boolean value that, if true , indicates that the cluster can be accessed from a public network.
        # Default: false
        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # The status of the reserved-node exchange request. Statuses include in-progress and requested.
        @[JSON::Field(key: "ReservedNodeExchangeStatus")]
        getter reserved_node_exchange_status : Types::ReservedNodeExchangeStatus?

        # Returns the following: AllowCancelResize: a boolean value indicating if the resize operation can be
        # cancelled. ResizeType: Returns ClassicResize
        @[JSON::Field(key: "ResizeInfo")]
        getter resize_info : Types::ResizeInfo?

        # A value that describes the status of a cluster restore action. This parameter returns null if the
        # cluster was not created by restoring a snapshot.
        @[JSON::Field(key: "RestoreStatus")]
        getter restore_status : Types::RestoreStatus?

        # A unique identifier for the cluster snapshot schedule.
        @[JSON::Field(key: "SnapshotScheduleIdentifier")]
        getter snapshot_schedule_identifier : String?

        # The current state of the cluster snapshot schedule.
        @[JSON::Field(key: "SnapshotScheduleState")]
        getter snapshot_schedule_state : String?

        # The list of tags for the cluster.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The total storage capacity of the cluster in megabytes.
        @[JSON::Field(key: "TotalStorageCapacityInMegaBytes")]
        getter total_storage_capacity_in_mega_bytes : Int64?

        # The identifier of the VPC the cluster is in, if the cluster is in a VPC.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        # A list of Amazon Virtual Private Cloud (Amazon VPC) security groups that are associated with the
        # cluster. This parameter is returned only if the cluster is in a VPC.
        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(Types::VpcSecurityGroupMembership)?

        def initialize(
          @allow_version_upgrade : Bool? = nil,
          @aqua_configuration : Types::AquaConfiguration? = nil,
          @automated_snapshot_retention_period : Int32? = nil,
          @availability_zone : String? = nil,
          @availability_zone_relocation_status : String? = nil,
          @catalog_arn : String? = nil,
          @cluster_availability_status : String? = nil,
          @cluster_create_time : Time? = nil,
          @cluster_identifier : String? = nil,
          @cluster_namespace_arn : String? = nil,
          @cluster_nodes : Array(Types::ClusterNode)? = nil,
          @cluster_parameter_groups : Array(Types::ClusterParameterGroupStatus)? = nil,
          @cluster_public_key : String? = nil,
          @cluster_revision_number : String? = nil,
          @cluster_security_groups : Array(Types::ClusterSecurityGroupMembership)? = nil,
          @cluster_snapshot_copy_status : Types::ClusterSnapshotCopyStatus? = nil,
          @cluster_status : String? = nil,
          @cluster_subnet_group_name : String? = nil,
          @cluster_version : String? = nil,
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_certificate_expiry_date : Time? = nil,
          @custom_domain_name : String? = nil,
          @db_name : String? = nil,
          @data_transfer_progress : Types::DataTransferProgress? = nil,
          @default_iam_role_arn : String? = nil,
          @deferred_maintenance_windows : Array(Types::DeferredMaintenanceWindow)? = nil,
          @elastic_ip_status : Types::ElasticIpStatus? = nil,
          @elastic_resize_number_of_node_options : String? = nil,
          @encrypted : Bool? = nil,
          @endpoint : Types::Endpoint? = nil,
          @enhanced_vpc_routing : Bool? = nil,
          @expected_next_snapshot_schedule_time : Time? = nil,
          @expected_next_snapshot_schedule_time_status : String? = nil,
          @extra_compute_for_automatic_optimization : String? = nil,
          @hsm_status : Types::HsmStatus? = nil,
          @iam_roles : Array(Types::ClusterIamRole)? = nil,
          @ip_address_type : String? = nil,
          @kms_key_id : String? = nil,
          @lakehouse_registration_status : String? = nil,
          @maintenance_track_name : String? = nil,
          @manual_snapshot_retention_period : Int32? = nil,
          @master_password_secret_arn : String? = nil,
          @master_password_secret_kms_key_id : String? = nil,
          @master_username : String? = nil,
          @modify_status : String? = nil,
          @multi_az : String? = nil,
          @multi_az_secondary : Types::SecondaryClusterInfo? = nil,
          @next_maintenance_window_start_time : Time? = nil,
          @node_type : String? = nil,
          @number_of_nodes : Int32? = nil,
          @pending_actions : Array(String)? = nil,
          @pending_modified_values : Types::PendingModifiedValues? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @reserved_node_exchange_status : Types::ReservedNodeExchangeStatus? = nil,
          @resize_info : Types::ResizeInfo? = nil,
          @restore_status : Types::RestoreStatus? = nil,
          @snapshot_schedule_identifier : String? = nil,
          @snapshot_schedule_state : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @total_storage_capacity_in_mega_bytes : Int64? = nil,
          @vpc_id : String? = nil,
          @vpc_security_groups : Array(Types::VpcSecurityGroupMembership)? = nil
        )
        end
      end

      # The account already has a cluster with the given identifier.
      struct ClusterAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      struct ClusterAssociatedToSchedule
        include JSON::Serializable

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        @[JSON::Field(key: "ScheduleAssociationState")]
        getter schedule_association_state : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @schedule_association_state : String? = nil
        )
        end
      end

      # Temporary credentials with authorization to log on to an Amazon Redshift database.
      struct ClusterCredentials
        include JSON::Serializable

        # A temporary password that authorizes the user name returned by DbUser to log on to the database
        # DbName .
        @[JSON::Field(key: "DbPassword")]
        getter db_password : String?

        # A database user name that is authorized to log on to the database DbName using the password
        # DbPassword . If the specified DbUser exists in the database, the new user name has the same database
        # permissions as the the user named in DbUser. By default, the user is added to PUBLIC. If the
        # DbGroups parameter is specifed, DbUser is added to the listed groups for any sessions created using
        # these credentials.
        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The date and time the password in DbPassword expires.
        @[JSON::Field(key: "Expiration")]
        getter expiration : Time?

        def initialize(
          @db_password : String? = nil,
          @db_user : String? = nil,
          @expiration : Time? = nil
        )
        end
      end

      # Describes a ClusterDbRevision .
      struct ClusterDbRevision
        include JSON::Serializable

        # The unique identifier of the cluster.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # A string representing the current cluster version.
        @[JSON::Field(key: "CurrentDatabaseRevision")]
        getter current_database_revision : String?

        # The date on which the database revision was released.
        @[JSON::Field(key: "DatabaseRevisionReleaseDate")]
        getter database_revision_release_date : Time?

        # A list of RevisionTarget objects, where each object describes the database revision that a cluster
        # can be updated to.
        @[JSON::Field(key: "RevisionTargets")]
        getter revision_targets : Array(Types::RevisionTarget)?

        def initialize(
          @cluster_identifier : String? = nil,
          @current_database_revision : String? = nil,
          @database_revision_release_date : Time? = nil,
          @revision_targets : Array(Types::RevisionTarget)? = nil
        )
        end
      end

      struct ClusterDbRevisionsMessage
        include JSON::Serializable

        # A list of revisions.
        @[JSON::Field(key: "ClusterDbRevisions")]
        getter cluster_db_revisions : Array(Types::ClusterDbRevision)?

        # A string representing the starting point for the next set of revisions. If a value is returned in a
        # response, you can retrieve the next set of revisions by providing the value in the marker parameter
        # and retrying the command. If the marker field is empty, all revisions have already been returned.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cluster_db_revisions : Array(Types::ClusterDbRevision)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ClusterExtendedCredentials
        include JSON::Serializable

        # A temporary password that you provide when you connect to a database.
        @[JSON::Field(key: "DbPassword")]
        getter db_password : String?

        # A database user name that you provide when you connect to a database. The database user is mapped
        # 1:1 to the source IAM identity.
        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The time (UTC) when the temporary password expires. After this timestamp, a log in with the
        # temporary password fails.
        @[JSON::Field(key: "Expiration")]
        getter expiration : Time?

        # Reserved for future use.
        @[JSON::Field(key: "NextRefreshTime")]
        getter next_refresh_time : Time?

        def initialize(
          @db_password : String? = nil,
          @db_user : String? = nil,
          @expiration : Time? = nil,
          @next_refresh_time : Time? = nil
        )
        end
      end

      # An Identity and Access Management (IAM) role that can be used by the associated Amazon Redshift
      # cluster to access other Amazon Web Services services.
      struct ClusterIamRole
        include JSON::Serializable

        # A value that describes the status of the IAM role's association with an Amazon Redshift cluster. The
        # following are possible statuses and descriptions. in-sync : The role is available for use by the
        # cluster. adding : The role is in the process of being associated with the cluster. removing : The
        # role is in the process of being disassociated with the cluster.
        @[JSON::Field(key: "ApplyStatus")]
        getter apply_status : String?

        # The Amazon Resource Name (ARN) of the IAM role, for example,
        # arn:aws:iam::123456789012:role/RedshiftCopyUnload .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        def initialize(
          @apply_status : String? = nil,
          @iam_role_arn : String? = nil
        )
        end
      end

      # The identifier of a node in a cluster.
      struct ClusterNode
        include JSON::Serializable

        # Whether the node is a leader node or a compute node.
        @[JSON::Field(key: "NodeRole")]
        getter node_role : String?

        # The private IP address of a node within a cluster.
        @[JSON::Field(key: "PrivateIPAddress")]
        getter private_ip_address : String?

        # The public IP address of a node within a cluster.
        @[JSON::Field(key: "PublicIPAddress")]
        getter public_ip_address : String?

        def initialize(
          @node_role : String? = nil,
          @private_ip_address : String? = nil,
          @public_ip_address : String? = nil
        )
        end
      end

      # The ClusterIdentifier parameter does not refer to an existing cluster.
      struct ClusterNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Cluster is already on the latest database revision.
      struct ClusterOnLatestRevisionFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a parameter group.
      struct ClusterParameterGroup
        include JSON::Serializable

        # The description of the parameter group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the cluster parameter group family that this cluster parameter group is compatible with.
        @[JSON::Field(key: "ParameterGroupFamily")]
        getter parameter_group_family : String?

        # The name of the cluster parameter group.
        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        # The list of tags for the cluster parameter group.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @description : String? = nil,
          @parameter_group_family : String? = nil,
          @parameter_group_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A cluster parameter group with the same name already exists.
      struct ClusterParameterGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the output from the DescribeClusterParameters action.
      struct ClusterParameterGroupDetails
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of Parameter instances. Each instance lists the parameters of one cluster parameter group.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @marker : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end

      struct ClusterParameterGroupNameMessage
        include JSON::Serializable

        # The name of the cluster parameter group.
        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        # The status of the parameter group. For example, if you made a change to a parameter group name-value
        # pair, then the change could be pending a reboot of an associated cluster.
        @[JSON::Field(key: "ParameterGroupStatus")]
        getter parameter_group_status : String?

        def initialize(
          @parameter_group_name : String? = nil,
          @parameter_group_status : String? = nil
        )
        end
      end

      # The parameter group name does not refer to an existing parameter group.
      struct ClusterParameterGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request would result in the user exceeding the allowed number of cluster parameter groups. For
      # information about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift
      # Cluster Management Guide .
      struct ClusterParameterGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the status of a parameter group.
      struct ClusterParameterGroupStatus
        include JSON::Serializable

        # The list of parameter statuses. For more information about parameters and parameter groups, go to
        # Amazon Redshift Parameter Groups in the Amazon Redshift Cluster Management Guide .
        @[JSON::Field(key: "ClusterParameterStatusList")]
        getter cluster_parameter_status_list : Array(Types::ClusterParameterStatus)?

        # The status of parameter updates.
        @[JSON::Field(key: "ParameterApplyStatus")]
        getter parameter_apply_status : String?

        # The name of the cluster parameter group.
        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        def initialize(
          @cluster_parameter_status_list : Array(Types::ClusterParameterStatus)? = nil,
          @parameter_apply_status : String? = nil,
          @parameter_group_name : String? = nil
        )
        end
      end

      # Contains the output from the DescribeClusterParameterGroups action.
      struct ClusterParameterGroupsMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of ClusterParameterGroup instances. Each instance describes one cluster parameter group.
        @[JSON::Field(key: "ParameterGroups")]
        getter parameter_groups : Array(Types::ClusterParameterGroup)?

        def initialize(
          @marker : String? = nil,
          @parameter_groups : Array(Types::ClusterParameterGroup)? = nil
        )
        end
      end

      # Describes the status of a parameter group.
      struct ClusterParameterStatus
        include JSON::Serializable

        # The error that prevented the parameter from being applied to the database.
        @[JSON::Field(key: "ParameterApplyErrorDescription")]
        getter parameter_apply_error_description : String?

        # The status of the parameter that indicates whether the parameter is in sync with the database,
        # waiting for a cluster reboot, or encountered an error when being applied. The following are possible
        # statuses and descriptions. in-sync : The parameter value is in sync with the database.
        # pending-reboot : The parameter value will be applied after the cluster reboots. applying : The
        # parameter value is being applied to the database. invalid-parameter : Cannot apply the parameter
        # value because it has an invalid value or syntax. apply-deferred : The parameter contains static
        # property changes. The changes are deferred until the cluster reboots. apply-error : Cannot connect
        # to the cluster. The parameter change will be applied after the cluster reboots. unknown-error :
        # Cannot apply the parameter change right now. The change will be applied after the cluster reboots.
        @[JSON::Field(key: "ParameterApplyStatus")]
        getter parameter_apply_status : String?

        # The name of the parameter.
        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        def initialize(
          @parameter_apply_error_description : String? = nil,
          @parameter_apply_status : String? = nil,
          @parameter_name : String? = nil
        )
        end
      end

      # The request would exceed the allowed number of cluster instances for this account. For information
      # about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift Cluster
      # Management Guide .
      struct ClusterQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a security group.
      struct ClusterSecurityGroup
        include JSON::Serializable

        # The name of the cluster security group to which the operation was applied.
        @[JSON::Field(key: "ClusterSecurityGroupName")]
        getter cluster_security_group_name : String?

        # A description of the security group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of EC2 security groups that are permitted to access clusters associated with this cluster
        # security group.
        @[JSON::Field(key: "EC2SecurityGroups")]
        getter ec2_security_groups : Array(Types::EC2SecurityGroup)?

        # A list of IP ranges (CIDR blocks) that are permitted to access clusters associated with this cluster
        # security group.
        @[JSON::Field(key: "IPRanges")]
        getter ip_ranges : Array(Types::IPRange)?

        # The list of tags for the cluster security group.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cluster_security_group_name : String? = nil,
          @description : String? = nil,
          @ec2_security_groups : Array(Types::EC2SecurityGroup)? = nil,
          @ip_ranges : Array(Types::IPRange)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A cluster security group with the same name already exists.
      struct ClusterSecurityGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a cluster security group.
      struct ClusterSecurityGroupMembership
        include JSON::Serializable

        # The name of the cluster security group.
        @[JSON::Field(key: "ClusterSecurityGroupName")]
        getter cluster_security_group_name : String?

        # The status of the cluster security group.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @cluster_security_group_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ClusterSecurityGroupMessage
        include JSON::Serializable

        # A list of ClusterSecurityGroup instances.
        @[JSON::Field(key: "ClusterSecurityGroups")]
        getter cluster_security_groups : Array(Types::ClusterSecurityGroup)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cluster_security_groups : Array(Types::ClusterSecurityGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The cluster security group name does not refer to an existing cluster security group.
      struct ClusterSecurityGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request would result in the user exceeding the allowed number of cluster security groups. For
      # information about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift
      # Cluster Management Guide .
      struct ClusterSecurityGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The value specified as a snapshot identifier is already used by an existing snapshot.
      struct ClusterSnapshotAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Returns the destination region and retention period that are configured for cross-region snapshot
      # copy.
      struct ClusterSnapshotCopyStatus
        include JSON::Serializable

        # The destination region that snapshots are automatically copied to when cross-region snapshot copy is
        # enabled.
        @[JSON::Field(key: "DestinationRegion")]
        getter destination_region : String?

        # The number of days that automated snapshots are retained in the destination region after they are
        # copied from a source region. If the value is -1, the manual snapshot is retained indefinitely. The
        # value must be either -1 or an integer between 1 and 3,653.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        # The number of days that automated snapshots are retained in the destination region after they are
        # copied from a source region.
        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int64?

        # The name of the snapshot copy grant.
        @[JSON::Field(key: "SnapshotCopyGrantName")]
        getter snapshot_copy_grant_name : String?

        def initialize(
          @destination_region : String? = nil,
          @manual_snapshot_retention_period : Int32? = nil,
          @retention_period : Int64? = nil,
          @snapshot_copy_grant_name : String? = nil
        )
        end
      end

      # The snapshot identifier does not refer to an existing cluster snapshot.
      struct ClusterSnapshotNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request would result in the user exceeding the allowed number of cluster snapshots.
      struct ClusterSnapshotQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a subnet group.
      struct ClusterSubnetGroup
        include JSON::Serializable

        # The name of the cluster subnet group.
        @[JSON::Field(key: "ClusterSubnetGroupName")]
        getter cluster_subnet_group_name : String?

        # The description of the cluster subnet group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The status of the cluster subnet group. Possible values are Complete , Incomplete and Invalid .
        @[JSON::Field(key: "SubnetGroupStatus")]
        getter subnet_group_status : String?

        # A list of the VPC Subnet elements.
        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(Types::Subnet)?

        # The IP address types supported by this cluster subnet group. Possible values are ipv4 and dualstack
        # .
        @[JSON::Field(key: "SupportedClusterIpAddressTypes")]
        getter supported_cluster_ip_address_types : Array(String)?

        # The list of tags for the cluster subnet group.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The VPC ID of the cluster subnet group.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @cluster_subnet_group_name : String? = nil,
          @description : String? = nil,
          @subnet_group_status : String? = nil,
          @subnets : Array(Types::Subnet)? = nil,
          @supported_cluster_ip_address_types : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # A ClusterSubnetGroupName is already used by an existing cluster subnet group.
      struct ClusterSubnetGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the output from the DescribeClusterSubnetGroups action.
      struct ClusterSubnetGroupMessage
        include JSON::Serializable

        # A list of ClusterSubnetGroup instances.
        @[JSON::Field(key: "ClusterSubnetGroups")]
        getter cluster_subnet_groups : Array(Types::ClusterSubnetGroup)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cluster_subnet_groups : Array(Types::ClusterSubnetGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The cluster subnet group name does not refer to an existing cluster subnet group.
      struct ClusterSubnetGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request would result in user exceeding the allowed number of cluster subnet groups. For
      # information about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift
      # Cluster Management Guide .
      struct ClusterSubnetGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request would result in user exceeding the allowed number of subnets in a cluster subnet groups.
      # For information about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift
      # Cluster Management Guide .
      struct ClusterSubnetQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a cluster version, including the parameter group family and description of the version.
      struct ClusterVersion
        include JSON::Serializable

        # The name of the cluster parameter group family for the cluster.
        @[JSON::Field(key: "ClusterParameterGroupFamily")]
        getter cluster_parameter_group_family : String?

        # The version number used by the cluster.
        @[JSON::Field(key: "ClusterVersion")]
        getter cluster_version : String?

        # The description of the cluster version.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @cluster_parameter_group_family : String? = nil,
          @cluster_version : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Contains the output from the DescribeClusterVersions action.
      struct ClusterVersionsMessage
        include JSON::Serializable

        # A list of Version elements.
        @[JSON::Field(key: "ClusterVersions")]
        getter cluster_versions : Array(Types::ClusterVersion)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cluster_versions : Array(Types::ClusterVersion)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Contains the output from the DescribeClusters action.
      struct ClustersMessage
        include JSON::Serializable

        # A list of Cluster objects, where each object describes one cluster.
        @[JSON::Field(key: "Clusters")]
        getter clusters : Array(Types::Cluster)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @clusters : Array(Types::Cluster)? = nil,
          @marker : String? = nil
        )
        end
      end

      # There is a conflict while updating the resource policy.
      struct ConflictPolicyUpdateFault
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that defines the Amazon Redshift connect service integration scope.
      struct Connect
        include JSON::Serializable

        # Determines whether the Amazon Redshift connect integration is enabled or disabled for the
        # application.
        @[JSON::Field(key: "Authorization")]
        getter authorization : String

        def initialize(
          @authorization : String
        )
        end
      end

      struct CopyClusterSnapshotMessage
        include JSON::Serializable

        # The identifier for the source snapshot. Constraints: Must be the identifier for a valid automated
        # snapshot whose state is available .
        @[JSON::Field(key: "SourceSnapshotIdentifier")]
        getter source_snapshot_identifier : String

        # The identifier given to the new manual snapshot. Constraints: Cannot be null, empty, or blank. Must
        # contain from 1 to 255 alphanumeric characters or hyphens. First character must be a letter. Cannot
        # end with a hyphen or contain two consecutive hyphens. Must be unique for the Amazon Web Services
        # account that is making the request.
        @[JSON::Field(key: "TargetSnapshotIdentifier")]
        getter target_snapshot_identifier : String

        # The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is
        # retained indefinitely. The value must be either -1 or an integer between 1 and 3,653. The default
        # value is -1.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        # The identifier of the cluster the source snapshot was created from. This parameter is required if
        # your IAM user has a policy containing a snapshot resource element that specifies anything other than
        # * for the cluster name. Constraints: Must be the identifier for a valid cluster.
        @[JSON::Field(key: "SourceSnapshotClusterIdentifier")]
        getter source_snapshot_cluster_identifier : String?

        def initialize(
          @source_snapshot_identifier : String,
          @target_snapshot_identifier : String,
          @manual_snapshot_retention_period : Int32? = nil,
          @source_snapshot_cluster_identifier : String? = nil
        )
        end
      end

      struct CopyClusterSnapshotResult
        include JSON::Serializable

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      # Cross-region snapshot copy was temporarily disabled. Try your request again.
      struct CopyToRegionDisabledFault
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateAuthenticationProfileMessage
        include JSON::Serializable

        # The content of the authentication profile in JSON format. The maximum length of the JSON string is
        # determined by a quota for your account.
        @[JSON::Field(key: "AuthenticationProfileContent")]
        getter authentication_profile_content : String

        # The name of the authentication profile to be created.
        @[JSON::Field(key: "AuthenticationProfileName")]
        getter authentication_profile_name : String

        def initialize(
          @authentication_profile_content : String,
          @authentication_profile_name : String
        )
        end
      end

      struct CreateAuthenticationProfileResult
        include JSON::Serializable

        # The content of the authentication profile in JSON format.
        @[JSON::Field(key: "AuthenticationProfileContent")]
        getter authentication_profile_content : String?

        # The name of the authentication profile that was created.
        @[JSON::Field(key: "AuthenticationProfileName")]
        getter authentication_profile_name : String?

        def initialize(
          @authentication_profile_content : String? = nil,
          @authentication_profile_name : String? = nil
        )
        end
      end

      struct CreateClusterMessage
        include JSON::Serializable

        # A unique identifier for the cluster. You use this identifier to refer to the cluster for any
        # subsequent cluster operations such as deleting or modifying. The identifier also appears in the
        # Amazon Redshift console. Constraints: Must contain from 1 to 63 alphanumeric characters or hyphens.
        # Alphabetic characters must be lowercase. First character must be a letter. Cannot end with a hyphen
        # or contain two consecutive hyphens. Must be unique for all clusters within an Amazon Web Services
        # account. Example: myexamplecluster
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The user name associated with the admin user account for the cluster that is being created.
        # Constraints: Must be 1 - 128 alphanumeric characters or hyphens. The user name can't be PUBLIC .
        # Must contain only lowercase letters, numbers, underscore, plus sign, period (dot), at symbol (@), or
        # hyphen. The first character must be a letter. Must not contain a colon (:) or a slash (/). Cannot be
        # a reserved word. A list of reserved words can be found in Reserved Words in the Amazon Redshift
        # Database Developer Guide.
        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String

        # The node type to be provisioned for the cluster. For information about node types, go to Working
        # with Clusters in the Amazon Redshift Cluster Management Guide . Valid Values: dc2.large |
        # dc2.8xlarge | ra3.large | ra3.xlplus | ra3.4xlarge | ra3.16xlarge
        @[JSON::Field(key: "NodeType")]
        getter node_type : String

        # Reserved.
        @[JSON::Field(key: "AdditionalInfo")]
        getter additional_info : String?

        # If true , major version upgrades can be applied during the maintenance window to the Amazon Redshift
        # engine that is running on the cluster. When a new major version of the Amazon Redshift engine is
        # released, you can request that the service automatically apply upgrades during the maintenance
        # window to the Amazon Redshift engine that is running on your cluster. Default: true
        @[JSON::Field(key: "AllowVersionUpgrade")]
        getter allow_version_upgrade : Bool?

        # This parameter is retired. It does not set the AQUA configuration status. Amazon Redshift
        # automatically determines whether to use AQUA (Advanced Query Accelerator).
        @[JSON::Field(key: "AquaConfigurationStatus")]
        getter aqua_configuration_status : String?

        # The number of days that automated snapshots are retained. If the value is 0, automated snapshots are
        # disabled. Even if automated snapshots are disabled, you can still create manual snapshots when you
        # want with CreateClusterSnapshot . You can't disable automated snapshots for RA3 node types. Set the
        # automated retention period from 1-35 days. Default: 1 Constraints: Must be a value from 0 to 35.
        @[JSON::Field(key: "AutomatedSnapshotRetentionPeriod")]
        getter automated_snapshot_retention_period : Int32?

        # The EC2 Availability Zone (AZ) in which you want Amazon Redshift to provision the cluster. For
        # example, if you have several EC2 instances running in a specific Availability Zone, then you might
        # want the cluster to be provisioned in the same zone in order to decrease network latency. Default: A
        # random, system-chosen Availability Zone in the region that is specified by the endpoint. Example:
        # us-east-2d Constraint: The specified Availability Zone must be in the same region as the current
        # endpoint.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The option to enable relocation for an Amazon Redshift cluster between Availability Zones after the
        # cluster is created.
        @[JSON::Field(key: "AvailabilityZoneRelocation")]
        getter availability_zone_relocation : Bool?

        # The name of the Glue data catalog that will be associated with the cluster enabled with Amazon
        # Redshift federated permissions. Constraints: Must contain at least one lowercase letter. Can only
        # contain lowercase letters (a-z), numbers (0-9), underscores (_), and hyphens (-). Pattern:
        # ^[a-z0-9_-]*[a-z]+[a-z0-9_-]*$ Example: my-catalog_01
        @[JSON::Field(key: "CatalogName")]
        getter catalog_name : String?

        # The name of the parameter group to be associated with this cluster. Default: The default Amazon
        # Redshift cluster parameter group. For information about the default parameter group, go to Working
        # with Amazon Redshift Parameter Groups Constraints: Must be 1 to 255 alphanumeric characters or
        # hyphens. First character must be a letter. Cannot end with a hyphen or contain two consecutive
        # hyphens.
        @[JSON::Field(key: "ClusterParameterGroupName")]
        getter cluster_parameter_group_name : String?

        # A list of security groups to be associated with this cluster. Default: The default cluster security
        # group for Amazon Redshift.
        @[JSON::Field(key: "ClusterSecurityGroups")]
        getter cluster_security_groups : Array(String)?

        # The name of a cluster subnet group to be associated with this cluster. If this parameter is not
        # provided the resulting cluster will be deployed outside virtual private cloud (VPC).
        @[JSON::Field(key: "ClusterSubnetGroupName")]
        getter cluster_subnet_group_name : String?

        # The type of the cluster. When cluster type is specified as single-node , the NumberOfNodes parameter
        # is not required. multi-node , the NumberOfNodes parameter is required. Valid Values: multi-node |
        # single-node Default: multi-node
        @[JSON::Field(key: "ClusterType")]
        getter cluster_type : String?

        # The version of the Amazon Redshift engine software that you want to deploy on the cluster. The
        # version selected runs on all the nodes in the cluster. Constraints: Only version 1.0 is currently
        # available. Example: 1.0
        @[JSON::Field(key: "ClusterVersion")]
        getter cluster_version : String?

        # The name of the first database to be created when the cluster is created. To create additional
        # databases after the cluster is created, connect to the cluster with a SQL client and use SQL
        # commands to create a database. For more information, go to Create a Database in the Amazon Redshift
        # Database Developer Guide. Default: dev Constraints: Must contain 1 to 64 alphanumeric characters.
        # Must contain only lowercase letters. Cannot be a word that is reserved by the service. A list of
        # reserved words can be found in Reserved Words in the Amazon Redshift Database Developer Guide.
        @[JSON::Field(key: "DBName")]
        getter db_name : String?

        # The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster when the
        # cluster was created.
        @[JSON::Field(key: "DefaultIamRoleArn")]
        getter default_iam_role_arn : String?

        # The Elastic IP (EIP) address for the cluster. Constraints: The cluster must be provisioned in
        # EC2-VPC and publicly-accessible through an Internet gateway. Don't specify the Elastic IP address
        # for a publicly accessible cluster with availability zone relocation turned on. For more information
        # about provisioning clusters in EC2-VPC, go to Supported Platforms to Launch Your Cluster in the
        # Amazon Redshift Cluster Management Guide.
        @[JSON::Field(key: "ElasticIp")]
        getter elastic_ip : String?

        # If true , the data in the cluster is encrypted at rest. If you set the value on this parameter to
        # false , the request will fail. Default: true
        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create
        # a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see
        # Enhanced VPC Routing in the Amazon Redshift Cluster Management Guide. If this option is true ,
        # enhanced VPC routing is enabled. Default: false
        @[JSON::Field(key: "EnhancedVpcRouting")]
        getter enhanced_vpc_routing : Bool?

        # If true , allocates additional compute resources for running automatic optimization operations.
        # Default: false
        @[JSON::Field(key: "ExtraComputeForAutomaticOptimization")]
        getter extra_compute_for_automatic_optimization : Bool?

        # Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to retrieve the
        # data encryption keys stored in an HSM.
        @[JSON::Field(key: "HsmClientCertificateIdentifier")]
        getter hsm_client_certificate_identifier : String?

        # Specifies the name of the HSM configuration that contains the information the Amazon Redshift
        # cluster can use to retrieve and store keys in an HSM.
        @[JSON::Field(key: "HsmConfigurationIdentifier")]
        getter hsm_configuration_identifier : String?

        # A list of Identity and Access Management (IAM) roles that can be used by the cluster to access other
        # Amazon Web Services services. You must supply the IAM roles in their Amazon Resource Name (ARN)
        # format. The maximum number of IAM roles that you can associate is subject to a quota. For more
        # information, go to Quotas and limits in the Amazon Redshift Cluster Management Guide .
        @[JSON::Field(key: "IamRoles")]
        getter iam_roles : Array(String)?

        # The IP address types that the cluster supports. Possible values are ipv4 and dualstack .
        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The Key Management Service (KMS) key ID of the encryption key that you want to use to encrypt data
        # in the cluster.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A flag that specifies whether to load sample data once the cluster is created.
        @[JSON::Field(key: "LoadSampleData")]
        getter load_sample_data : String?

        # An optional parameter for the name of the maintenance track for the cluster. If you don't provide a
        # maintenance track name, the cluster is assigned to the current track.
        @[JSON::Field(key: "MaintenanceTrackName")]
        getter maintenance_track_name : String?

        # If true , Amazon Redshift uses Secrets Manager to manage this cluster's admin credentials. You can't
        # use MasterUserPassword if ManageMasterPassword is true. If ManageMasterPassword is false or not set,
        # Amazon Redshift uses MasterUserPassword for the admin user account's password.
        @[JSON::Field(key: "ManageMasterPassword")]
        getter manage_master_password : Bool?

        # The default number of days to retain a manual snapshot. If the value is -1, the snapshot is retained
        # indefinitely. This setting doesn't change the retention period of existing snapshots. The value must
        # be either -1 or an integer between 1 and 3,653.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        # The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's admin
        # credentials secret. You can only use this parameter if ManageMasterPassword is true.
        @[JSON::Field(key: "MasterPasswordSecretKmsKeyId")]
        getter master_password_secret_kms_key_id : String?

        # The password associated with the admin user account for the cluster that is being created. You can't
        # use MasterUserPassword if ManageMasterPassword is true . Constraints: Must be between 8 and 64
        # characters in length. Must contain at least one uppercase letter. Must contain at least one
        # lowercase letter. Must contain one number. Can be any printable ASCII character (ASCII code 33-126)
        # except ' (single quote), " (double quote), \ , / , or @ .
        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # If true, Amazon Redshift will deploy the cluster in two Availability Zones (AZ).
        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The number of compute nodes in the cluster. This parameter is required when the ClusterType
        # parameter is specified as multi-node . For information about determining how many nodes you need, go
        # to Working with Clusters in the Amazon Redshift Cluster Management Guide . If you don't specify this
        # parameter, you get a single-node cluster. When requesting a multi-node cluster, you must specify the
        # number of nodes that you want in the cluster. Default: 1 Constraints: Value must be at least 1 and
        # no more than 100.
        @[JSON::Field(key: "NumberOfNodes")]
        getter number_of_nodes : Int32?

        # The port number on which the cluster accepts incoming connections. The cluster is accessible only
        # via the JDBC and ODBC connection strings. Part of the connection string requires the port on which
        # the cluster will listen for incoming connections. Default: 5439 Valid Values: For clusters with ra3
        # nodes - Select a port within the ranges 5431-5455 or 8191-8215 . (If you have an existing cluster
        # with ra3 nodes, it isn't required that you change the port to these ranges.) For clusters with dc2
        # nodes - Select a port within the range 1150-65535 .
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The weekly time range (in UTC) during which automated cluster maintenance can occur. Format:
        # ddd:hh24:mi-ddd:hh24:mi Default: A 30-minute window selected at random from an 8-hour block of time
        # per region, occurring on a random day of the week. For more information about the time blocks for
        # each region, see Maintenance Windows in Amazon Redshift Cluster Management Guide. Valid Days: Mon |
        # Tue | Wed | Thu | Fri | Sat | Sun Constraints: Minimum 30-minute window.
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # If true , the cluster can be accessed from a public network. Default: false
        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # The Amazon resource name (ARN) of the Amazon Redshift IAM Identity Center application.
        @[JSON::Field(key: "RedshiftIdcApplicationArn")]
        getter redshift_idc_application_arn : String?

        # A unique identifier for the snapshot schedule.
        @[JSON::Field(key: "SnapshotScheduleIdentifier")]
        getter snapshot_schedule_identifier : String?

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster. Default:
        # The default VPC security group is associated with the cluster.
        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @cluster_identifier : String,
          @master_username : String,
          @node_type : String,
          @additional_info : String? = nil,
          @allow_version_upgrade : Bool? = nil,
          @aqua_configuration_status : String? = nil,
          @automated_snapshot_retention_period : Int32? = nil,
          @availability_zone : String? = nil,
          @availability_zone_relocation : Bool? = nil,
          @catalog_name : String? = nil,
          @cluster_parameter_group_name : String? = nil,
          @cluster_security_groups : Array(String)? = nil,
          @cluster_subnet_group_name : String? = nil,
          @cluster_type : String? = nil,
          @cluster_version : String? = nil,
          @db_name : String? = nil,
          @default_iam_role_arn : String? = nil,
          @elastic_ip : String? = nil,
          @encrypted : Bool? = nil,
          @enhanced_vpc_routing : Bool? = nil,
          @extra_compute_for_automatic_optimization : Bool? = nil,
          @hsm_client_certificate_identifier : String? = nil,
          @hsm_configuration_identifier : String? = nil,
          @iam_roles : Array(String)? = nil,
          @ip_address_type : String? = nil,
          @kms_key_id : String? = nil,
          @load_sample_data : String? = nil,
          @maintenance_track_name : String? = nil,
          @manage_master_password : Bool? = nil,
          @manual_snapshot_retention_period : Int32? = nil,
          @master_password_secret_kms_key_id : String? = nil,
          @master_user_password : String? = nil,
          @multi_az : Bool? = nil,
          @number_of_nodes : Int32? = nil,
          @port : Int32? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @redshift_idc_application_arn : String? = nil,
          @snapshot_schedule_identifier : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      struct CreateClusterParameterGroupMessage
        include JSON::Serializable

        # A description of the parameter group.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The Amazon Redshift engine version to which the cluster parameter group applies. The cluster engine
        # version determines the set of parameters. To get a list of valid parameter group family names, you
        # can call DescribeClusterParameterGroups . By default, Amazon Redshift returns a list of all the
        # parameter groups that are owned by your Amazon Web Services account, including the default parameter
        # groups for each Amazon Redshift engine version. The parameter group family names associated with the
        # default parameter groups provide you the valid values. For example, a valid family name is
        # "redshift-1.0".
        @[JSON::Field(key: "ParameterGroupFamily")]
        getter parameter_group_family : String

        # The name of the cluster parameter group. Constraints: Must be 1 to 255 alphanumeric characters or
        # hyphens First character must be a letter. Cannot end with a hyphen or contain two consecutive
        # hyphens. Must be unique withing your Amazon Web Services account. This value is stored as a
        # lower-case string.
        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @description : String,
          @parameter_group_family : String,
          @parameter_group_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateClusterParameterGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "ClusterParameterGroup")]
        getter cluster_parameter_group : Types::ClusterParameterGroup?

        def initialize(
          @cluster_parameter_group : Types::ClusterParameterGroup? = nil
        )
        end
      end

      struct CreateClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct CreateClusterSecurityGroupMessage
        include JSON::Serializable

        # The name for the security group. Amazon Redshift stores the value as a lowercase string.
        # Constraints: Must contain no more than 255 alphanumeric characters or hyphens. Must not be
        # "Default". Must be unique for all security groups that are created by your Amazon Web Services
        # account. Example: examplesecuritygroup
        @[JSON::Field(key: "ClusterSecurityGroupName")]
        getter cluster_security_group_name : String

        # A description for the security group.
        @[JSON::Field(key: "Description")]
        getter description : String

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cluster_security_group_name : String,
          @description : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateClusterSecurityGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "ClusterSecurityGroup")]
        getter cluster_security_group : Types::ClusterSecurityGroup?

        def initialize(
          @cluster_security_group : Types::ClusterSecurityGroup? = nil
        )
        end
      end

      struct CreateClusterSnapshotMessage
        include JSON::Serializable

        # The cluster identifier for which you want a snapshot.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # A unique identifier for the snapshot that you are requesting. This identifier must be unique for all
        # snapshots within the Amazon Web Services account. Constraints: Cannot be null, empty, or blank Must
        # contain from 1 to 255 alphanumeric characters or hyphens First character must be a letter Cannot end
        # with a hyphen or contain two consecutive hyphens Example: my-snapshot-id
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String

        # The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is
        # retained indefinitely. The value must be either -1 or an integer between 1 and 3,653. The default
        # value is -1.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cluster_identifier : String,
          @snapshot_identifier : String,
          @manual_snapshot_retention_period : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateClusterSnapshotResult
        include JSON::Serializable

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct CreateClusterSubnetGroupMessage
        include JSON::Serializable

        # The name for the subnet group. Amazon Redshift stores the value as a lowercase string. Constraints:
        # Must contain no more than 255 alphanumeric characters or hyphens. Must not be "Default". Must be
        # unique for all subnet groups that are created by your Amazon Web Services account. Example:
        # examplesubnetgroup
        @[JSON::Field(key: "ClusterSubnetGroupName")]
        getter cluster_subnet_group_name : String

        # A description for the subnet group.
        @[JSON::Field(key: "Description")]
        getter description : String

        # An array of VPC subnet IDs. A maximum of 20 subnets can be modified in a single request.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cluster_subnet_group_name : String,
          @description : String,
          @subnet_ids : Array(String),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateClusterSubnetGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "ClusterSubnetGroup")]
        getter cluster_subnet_group : Types::ClusterSubnetGroup?

        def initialize(
          @cluster_subnet_group : Types::ClusterSubnetGroup? = nil
        )
        end
      end

      struct CreateCustomDomainAssociationMessage
        include JSON::Serializable

        # The cluster identifier that the custom domain is associated with.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The certificate Amazon Resource Name (ARN) for the custom domain name association.
        @[JSON::Field(key: "CustomDomainCertificateArn")]
        getter custom_domain_certificate_arn : String

        # The custom domain name for a custom domain association.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String

        def initialize(
          @cluster_identifier : String,
          @custom_domain_certificate_arn : String,
          @custom_domain_name : String
        )
        end
      end

      struct CreateCustomDomainAssociationResult
        include JSON::Serializable

        # The identifier of the cluster that the custom domain is associated with.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The expiration time for the certificate for the custom domain.
        @[JSON::Field(key: "CustomDomainCertExpiryTime")]
        getter custom_domain_cert_expiry_time : String?

        # The Amazon Resource Name (ARN) for the certificate associated with the custom domain name.
        @[JSON::Field(key: "CustomDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The custom domain name for the association result.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @custom_domain_cert_expiry_time : String? = nil,
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_name : String? = nil
        )
        end
      end

      struct CreateEndpointAccessMessage
        include JSON::Serializable

        # The Redshift-managed VPC endpoint name. An endpoint name must contain 1-30 characters. Valid
        # characters are A-Z, a-z, 0-9, and hyphen(-). The first character must be a letter. The name can't
        # contain two consecutive hyphens or end with a hyphen.
        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        # The subnet group from which Amazon Redshift chooses the subnet to deploy the endpoint.
        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String

        # The cluster identifier of the cluster to access.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The Amazon Web Services account ID of the owner of the cluster. This is only required if the cluster
        # is in another Amazon Web Services account.
        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # The security group that defines the ports, protocols, and sources for inbound traffic that you are
        # authorizing into your endpoint.
        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @endpoint_name : String,
          @subnet_group_name : String,
          @cluster_identifier : String? = nil,
          @resource_owner : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      struct CreateEventSubscriptionMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon SNS topic used to transmit the event notifications. The
        # ARN is created by Amazon SNS when you create a topic and subscribe to it.
        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String

        # The name of the event subscription to be created. Constraints: Cannot be null, empty, or blank. Must
        # contain from 1 to 255 alphanumeric characters or hyphens. First character must be a letter. Cannot
        # end with a hyphen or contain two consecutive hyphens.
        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        # A boolean value; set to true to activate the subscription, and set to false to create the
        # subscription but not activate it.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies the Amazon Redshift event categories to be published by the event notification
        # subscription. Values: configuration, management, monitoring, security, pending
        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # Specifies the Amazon Redshift event severity to be published by the event notification subscription.
        # Values: ERROR, INFO
        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # A list of one or more identifiers of Amazon Redshift source objects. All of the objects must be of
        # the same type as was specified in the source type parameter. The event subscription will return only
        # events generated by the specified objects. If not specified, then events are returned for all
        # objects within the source type specified. Example: my-cluster-1, my-cluster-2 Example:
        # my-snapshot-20131010
        @[JSON::Field(key: "SourceIds")]
        getter source_ids : Array(String)?

        # The type of source that will be generating the events. For example, if you want to be notified of
        # events generated by a cluster, you would set this parameter to cluster. If this value is not
        # specified, events are returned for all Amazon Redshift objects in your Amazon Web Services account.
        # You must specify a source type in order to specify source IDs. Valid values: cluster,
        # cluster-parameter-group, cluster-security-group, cluster-snapshot, and scheduled-action.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @sns_topic_arn : String,
          @subscription_name : String,
          @enabled : Bool? = nil,
          @event_categories : Array(String)? = nil,
          @severity : String? = nil,
          @source_ids : Array(String)? = nil,
          @source_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateEventSubscriptionResult
        include JSON::Serializable

        @[JSON::Field(key: "EventSubscription")]
        getter event_subscription : Types::EventSubscription?

        def initialize(
          @event_subscription : Types::EventSubscription? = nil
        )
        end
      end

      struct CreateHsmClientCertificateMessage
        include JSON::Serializable

        # The identifier to be assigned to the new HSM client certificate that the cluster will use to connect
        # to the HSM to use the database encryption keys.
        @[JSON::Field(key: "HsmClientCertificateIdentifier")]
        getter hsm_client_certificate_identifier : String

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @hsm_client_certificate_identifier : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateHsmClientCertificateResult
        include JSON::Serializable

        @[JSON::Field(key: "HsmClientCertificate")]
        getter hsm_client_certificate : Types::HsmClientCertificate?

        def initialize(
          @hsm_client_certificate : Types::HsmClientCertificate? = nil
        )
        end
      end

      struct CreateHsmConfigurationMessage
        include JSON::Serializable

        # A text description of the HSM configuration to be created.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The identifier to be assigned to the new Amazon Redshift HSM configuration.
        @[JSON::Field(key: "HsmConfigurationIdentifier")]
        getter hsm_configuration_identifier : String

        # The IP address that the Amazon Redshift cluster must use to access the HSM.
        @[JSON::Field(key: "HsmIpAddress")]
        getter hsm_ip_address : String

        # The name of the partition in the HSM where the Amazon Redshift clusters will store their database
        # encryption keys.
        @[JSON::Field(key: "HsmPartitionName")]
        getter hsm_partition_name : String

        # The password required to access the HSM partition.
        @[JSON::Field(key: "HsmPartitionPassword")]
        getter hsm_partition_password : String

        # The HSMs public certificate file. When using Cloud HSM, the file name is server.pem.
        @[JSON::Field(key: "HsmServerPublicCertificate")]
        getter hsm_server_public_certificate : String

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @description : String,
          @hsm_configuration_identifier : String,
          @hsm_ip_address : String,
          @hsm_partition_name : String,
          @hsm_partition_password : String,
          @hsm_server_public_certificate : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateHsmConfigurationResult
        include JSON::Serializable

        @[JSON::Field(key: "HsmConfiguration")]
        getter hsm_configuration : Types::HsmConfiguration?

        def initialize(
          @hsm_configuration : Types::HsmConfiguration? = nil
        )
        end
      end

      struct CreateIntegrationMessage
        include JSON::Serializable

        # The name of the integration.
        @[JSON::Field(key: "IntegrationName")]
        getter integration_name : String

        # The Amazon Resource Name (ARN) of the database to use as the source for replication.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String

        # The Amazon Resource Name (ARN) of the Amazon Redshift data warehouse to use as the target for
        # replication.
        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String

        # An optional set of non-secret key–value pairs that contains additional contextual information about
        # the data. For more information, see Encryption context in the Amazon Web Services Key Management
        # Service Developer Guide . You can only include this parameter if you specify the KMSKeyId parameter.
        @[JSON::Field(key: "AdditionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # A description of the integration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # An Key Management Service (KMS) key identifier for the key to use to encrypt the integration. If you
        # don't specify an encryption key, the default Amazon Web Services owned key is used.
        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        # A list of tags.
        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @integration_name : String,
          @source_arn : String,
          @target_arn : String,
          @additional_encryption_context : Hash(String, String)? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRedshiftIdcApplicationMessage
        include JSON::Serializable

        # The IAM role ARN for the Amazon Redshift IAM Identity Center application instance. It has the
        # required permissions to be assumed and invoke the IDC Identity Center API.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The display name for the Amazon Redshift IAM Identity Center application instance. It appears in the
        # console.
        @[JSON::Field(key: "IdcDisplayName")]
        getter idc_display_name : String

        # The Amazon resource name (ARN) of the IAM Identity Center instance where Amazon Redshift creates a
        # new managed application.
        @[JSON::Field(key: "IdcInstanceArn")]
        getter idc_instance_arn : String

        # The name of the Redshift application in IAM Identity Center.
        @[JSON::Field(key: "RedshiftIdcApplicationName")]
        getter redshift_idc_application_name : String

        # The type of application being created. Valid values are None or Lakehouse . Use Lakehouse to enable
        # Amazon Redshift federated permissions on cluster.
        @[JSON::Field(key: "ApplicationType")]
        getter application_type : String?

        # The token issuer list for the Amazon Redshift IAM Identity Center application instance.
        @[JSON::Field(key: "AuthorizedTokenIssuerList")]
        getter authorized_token_issuer_list : Array(Types::AuthorizedTokenIssuer)?

        # The namespace for the Amazon Redshift IAM Identity Center application instance. It determines which
        # managed application verifies the connection token.
        @[JSON::Field(key: "IdentityNamespace")]
        getter identity_namespace : String?

        # A collection of service integrations for the Redshift IAM Identity Center application.
        @[JSON::Field(key: "ServiceIntegrations")]
        getter service_integrations : Array(Types::ServiceIntegrationsUnion)?

        # A list of tags keys that Redshift Identity Center applications copy to IAM Identity Center. For each
        # input key, the tag corresponding to the key-value pair is propagated.
        @[JSON::Field(key: "SsoTagKeys")]
        getter sso_tag_keys : Array(String)?

        # A list of tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @iam_role_arn : String,
          @idc_display_name : String,
          @idc_instance_arn : String,
          @redshift_idc_application_name : String,
          @application_type : String? = nil,
          @authorized_token_issuer_list : Array(Types::AuthorizedTokenIssuer)? = nil,
          @identity_namespace : String? = nil,
          @service_integrations : Array(Types::ServiceIntegrationsUnion)? = nil,
          @sso_tag_keys : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRedshiftIdcApplicationResult
        include JSON::Serializable

        @[JSON::Field(key: "RedshiftIdcApplication")]
        getter redshift_idc_application : Types::RedshiftIdcApplication?

        def initialize(
          @redshift_idc_application : Types::RedshiftIdcApplication? = nil
        )
        end
      end

      struct CreateScheduledActionMessage
        include JSON::Serializable

        # The IAM role to assume to run the target action. For more information about this parameter, see
        # ScheduledAction .
        @[JSON::Field(key: "IamRole")]
        getter iam_role : String

        # The schedule in at( ) or cron( ) format. For more information about this parameter, see
        # ScheduledAction .
        @[JSON::Field(key: "Schedule")]
        getter schedule : String

        # The name of the scheduled action. The name must be unique within an account. For more information
        # about this parameter, see ScheduledAction .
        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        # A JSON format string of the Amazon Redshift API operation with input parameters. For more
        # information about this parameter, see ScheduledAction .
        @[JSON::Field(key: "TargetAction")]
        getter target_action : Types::ScheduledActionType

        # If true, the schedule is enabled. If false, the scheduled action does not trigger. For more
        # information about state of the scheduled action, see ScheduledAction .
        @[JSON::Field(key: "Enable")]
        getter enable : Bool?

        # The end time in UTC of the scheduled action. After this time, the scheduled action does not trigger.
        # For more information about this parameter, see ScheduledAction .
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The description of the scheduled action.
        @[JSON::Field(key: "ScheduledActionDescription")]
        getter scheduled_action_description : String?

        # The start time in UTC of the scheduled action. Before this time, the scheduled action does not
        # trigger. For more information about this parameter, see ScheduledAction .
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @iam_role : String,
          @schedule : String,
          @scheduled_action_name : String,
          @target_action : Types::ScheduledActionType,
          @enable : Bool? = nil,
          @end_time : Time? = nil,
          @scheduled_action_description : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # The result of the CreateSnapshotCopyGrant action.
      struct CreateSnapshotCopyGrantMessage
        include JSON::Serializable

        # The name of the snapshot copy grant. This name must be unique in the region for the Amazon Web
        # Services account. Constraints: Must contain from 1 to 63 alphanumeric characters or hyphens.
        # Alphabetic characters must be lowercase. First character must be a letter. Cannot end with a hyphen
        # or contain two consecutive hyphens. Must be unique for all clusters within an Amazon Web Services
        # account.
        @[JSON::Field(key: "SnapshotCopyGrantName")]
        getter snapshot_copy_grant_name : String

        # The unique identifier of the encrypted symmetric key to which to grant Amazon Redshift permission.
        # If no key is specified, the default key is used.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @snapshot_copy_grant_name : String,
          @kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSnapshotCopyGrantResult
        include JSON::Serializable

        @[JSON::Field(key: "SnapshotCopyGrant")]
        getter snapshot_copy_grant : Types::SnapshotCopyGrant?

        def initialize(
          @snapshot_copy_grant : Types::SnapshotCopyGrant? = nil
        )
        end
      end

      struct CreateSnapshotScheduleMessage
        include JSON::Serializable

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        @[JSON::Field(key: "NextInvocations")]
        getter next_invocations : Int32?

        # The definition of the snapshot schedule. The definition is made up of schedule expressions, for
        # example "cron(30 12 *)" or "rate(12 hours)".
        @[JSON::Field(key: "ScheduleDefinitions")]
        getter schedule_definitions : Array(String)?

        # The description of the snapshot schedule.
        @[JSON::Field(key: "ScheduleDescription")]
        getter schedule_description : String?

        # A unique identifier for a snapshot schedule. Only alphanumeric characters are allowed for the
        # identifier.
        @[JSON::Field(key: "ScheduleIdentifier")]
        getter schedule_identifier : String?

        # An optional set of tags you can use to search for the schedule.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dry_run : Bool? = nil,
          @next_invocations : Int32? = nil,
          @schedule_definitions : Array(String)? = nil,
          @schedule_description : String? = nil,
          @schedule_identifier : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the output from the CreateTags action.
      struct CreateTagsMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to which you want to add the tag or tags. For example,
        # arn:aws:redshift:us-east-2:123456789:cluster:t1 .
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # One or more name/value pairs to add as tags to the specified resource. Each tag name is passed in
        # with the parameter Key and the corresponding value is passed in with the parameter Value . The Key
        # and Value parameters are separated by a comma (,). Separate multiple tags with a space. For example,
        # --tags "Key"="owner","Value"="admin" "Key"="environment","Value"="test"
        # "Key"="version","Value"="1.0" .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct CreateUsageLimitMessage
        include JSON::Serializable

        # The limit amount. If time-based, this amount is in minutes. If data-based, this amount is in
        # terabytes (TB). The value must be a positive number.
        @[JSON::Field(key: "Amount")]
        getter amount : Int64

        # The identifier of the cluster that you want to limit usage.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The Amazon Redshift feature that you want to limit.
        @[JSON::Field(key: "FeatureType")]
        getter feature_type : String

        # The type of limit. Depending on the feature type, this can be based on a time duration or data size.
        # If FeatureType is spectrum , then LimitType must be data-scanned . If FeatureType is
        # concurrency-scaling , then LimitType must be time . If FeatureType is cross-region-datasharing ,
        # then LimitType must be data-scanned . If FeatureType is extra-compute-for-automatic-optimization ,
        # then LimitType must be time .
        @[JSON::Field(key: "LimitType")]
        getter limit_type : String

        # The action that Amazon Redshift takes when the limit is reached. The default is log. For more
        # information about this parameter, see UsageLimit .
        @[JSON::Field(key: "BreachAction")]
        getter breach_action : String?

        # The time period that the amount applies to. A weekly period begins on Sunday. The default is monthly
        # .
        @[JSON::Field(key: "Period")]
        getter period : String?

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @amount : Int64,
          @cluster_identifier : String,
          @feature_type : String,
          @limit_type : String,
          @breach_action : String? = nil,
          @period : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # An error occurred when an attempt was made to change the custom domain association.
      struct CustomCnameAssociationFault
        include JSON::Serializable

        def initialize
        end
      end

      # An error occurred. The custom domain name couldn't be found.
      struct CustomDomainAssociationNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      struct CustomDomainAssociationsMessage
        include JSON::Serializable

        # The associations for the custom domain.
        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::Association)?

        # The marker for the custom domain association.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @associations : Array(Types::Association)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct CustomerStorageMessage
        include JSON::Serializable

        # The total amount of storage currently used for snapshots.
        @[JSON::Field(key: "TotalBackupSizeInMegaBytes")]
        getter total_backup_size_in_mega_bytes : Float64?

        # The total amount of storage currently provisioned.
        @[JSON::Field(key: "TotalProvisionedStorageInMegaBytes")]
        getter total_provisioned_storage_in_mega_bytes : Float64?

        def initialize(
          @total_backup_size_in_mega_bytes : Float64? = nil,
          @total_provisioned_storage_in_mega_bytes : Float64? = nil
        )
        end
      end

      struct DataShare
        include JSON::Serializable

        # A value that specifies whether the datashare can be shared to a publicly accessible cluster.
        @[JSON::Field(key: "AllowPubliclyAccessibleConsumers")]
        getter allow_publicly_accessible_consumers : Bool?

        # The Amazon Resource Name (ARN) of the datashare that the consumer is to use.
        @[JSON::Field(key: "DataShareArn")]
        getter data_share_arn : String?

        # A value that specifies when the datashare has an association between producer and data consumers.
        @[JSON::Field(key: "DataShareAssociations")]
        getter data_share_associations : Array(Types::DataShareAssociation)?

        # The type of the datashare created by RegisterNamespace.
        @[JSON::Field(key: "DataShareType")]
        getter data_share_type : String?

        # The identifier of a datashare to show its managing entity.
        @[JSON::Field(key: "ManagedBy")]
        getter managed_by : String?

        # The Amazon Resource Name (ARN) of the producer namespace.
        @[JSON::Field(key: "ProducerArn")]
        getter producer_arn : String?

        def initialize(
          @allow_publicly_accessible_consumers : Bool? = nil,
          @data_share_arn : String? = nil,
          @data_share_associations : Array(Types::DataShareAssociation)? = nil,
          @data_share_type : String? = nil,
          @managed_by : String? = nil,
          @producer_arn : String? = nil
        )
        end
      end

      # The association of a datashare from a producer account with a data consumer.
      struct DataShareAssociation
        include JSON::Serializable

        # Specifies whether write operations were allowed during data share association.
        @[JSON::Field(key: "ConsumerAcceptedWrites")]
        getter consumer_accepted_writes : Bool?

        # The name of the consumer accounts that have an association with a producer datashare.
        @[JSON::Field(key: "ConsumerIdentifier")]
        getter consumer_identifier : String?

        # The Amazon Web Services Region of the consumer accounts that have an association with a producer
        # datashare.
        @[JSON::Field(key: "ConsumerRegion")]
        getter consumer_region : String?

        # The creation date of the datashare that is associated.
        @[JSON::Field(key: "CreatedDate")]
        getter created_date : Time?

        # Specifies whether write operations were allowed during data share authorization.
        @[JSON::Field(key: "ProducerAllowedWrites")]
        getter producer_allowed_writes : Bool?

        # The status of the datashare that is associated.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status change data of the datashare that is associated.
        @[JSON::Field(key: "StatusChangeDate")]
        getter status_change_date : Time?

        def initialize(
          @consumer_accepted_writes : Bool? = nil,
          @consumer_identifier : String? = nil,
          @consumer_region : String? = nil,
          @created_date : Time? = nil,
          @producer_allowed_writes : Bool? = nil,
          @status : String? = nil,
          @status_change_date : Time? = nil
        )
        end
      end

      # Describes the status of a cluster while it is in the process of resizing with an incremental resize.
      struct DataTransferProgress
        include JSON::Serializable

        # Describes the data transfer rate in MB's per second.
        @[JSON::Field(key: "CurrentRateInMegaBytesPerSecond")]
        getter current_rate_in_mega_bytes_per_second : Float64?

        # Describes the total amount of data that has been transfered in MB's.
        @[JSON::Field(key: "DataTransferredInMegaBytes")]
        getter data_transferred_in_mega_bytes : Int64?

        # Describes the number of seconds that have elapsed during the data transfer.
        @[JSON::Field(key: "ElapsedTimeInSeconds")]
        getter elapsed_time_in_seconds : Int64?

        # Describes the estimated number of seconds remaining to complete the transfer.
        @[JSON::Field(key: "EstimatedTimeToCompletionInSeconds")]
        getter estimated_time_to_completion_in_seconds : Int64?

        # Describes the status of the cluster. While the transfer is in progress the status is
        # transferringdata .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Describes the total amount of data to be transfered in megabytes.
        @[JSON::Field(key: "TotalDataInMegaBytes")]
        getter total_data_in_mega_bytes : Int64?

        def initialize(
          @current_rate_in_mega_bytes_per_second : Float64? = nil,
          @data_transferred_in_mega_bytes : Int64? = nil,
          @elapsed_time_in_seconds : Int64? = nil,
          @estimated_time_to_completion_in_seconds : Int64? = nil,
          @status : String? = nil,
          @total_data_in_mega_bytes : Int64? = nil
        )
        end
      end

      struct DeauthorizeDataShareMessage
        include JSON::Serializable

        # The identifier of the data consumer that is to have authorization removed from the datashare. This
        # identifier is an Amazon Web Services account ID or a keyword, such as ADX.
        @[JSON::Field(key: "ConsumerIdentifier")]
        getter consumer_identifier : String

        # The namespace Amazon Resource Name (ARN) of the datashare to remove authorization from.
        @[JSON::Field(key: "DataShareArn")]
        getter data_share_arn : String

        def initialize(
          @consumer_identifier : String,
          @data_share_arn : String
        )
        end
      end

      # Describes the default cluster parameters for a parameter group family.
      struct DefaultClusterParameters
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The name of the cluster parameter group family to which the engine default parameters apply.
        @[JSON::Field(key: "ParameterGroupFamily")]
        getter parameter_group_family : String?

        # The list of cluster default parameters.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @marker : String? = nil,
          @parameter_group_family : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end

      # Describes a deferred maintenance window
      struct DeferredMaintenanceWindow
        include JSON::Serializable

        # A timestamp for the end of the time period when we defer maintenance.
        @[JSON::Field(key: "DeferMaintenanceEndTime")]
        getter defer_maintenance_end_time : Time?

        # A unique identifier for the maintenance window.
        @[JSON::Field(key: "DeferMaintenanceIdentifier")]
        getter defer_maintenance_identifier : String?

        # A timestamp for the beginning of the time period when we defer maintenance.
        @[JSON::Field(key: "DeferMaintenanceStartTime")]
        getter defer_maintenance_start_time : Time?

        def initialize(
          @defer_maintenance_end_time : Time? = nil,
          @defer_maintenance_identifier : String? = nil,
          @defer_maintenance_start_time : Time? = nil
        )
        end
      end

      struct DeleteAuthenticationProfileMessage
        include JSON::Serializable

        # The name of the authentication profile to delete.
        @[JSON::Field(key: "AuthenticationProfileName")]
        getter authentication_profile_name : String

        def initialize(
          @authentication_profile_name : String
        )
        end
      end

      struct DeleteAuthenticationProfileResult
        include JSON::Serializable

        # The name of the authentication profile that was deleted.
        @[JSON::Field(key: "AuthenticationProfileName")]
        getter authentication_profile_name : String?

        def initialize(
          @authentication_profile_name : String? = nil
        )
        end
      end

      struct DeleteClusterMessage
        include JSON::Serializable

        # The identifier of the cluster to be deleted. Constraints: Must contain lowercase characters. Must
        # contain from 1 to 63 alphanumeric characters or hyphens. First character must be a letter. Cannot
        # end with a hyphen or contain two consecutive hyphens.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The identifier of the final snapshot that is to be created immediately before deleting the cluster.
        # If this parameter is provided, SkipFinalClusterSnapshot must be false . Constraints: Must be 1 to
        # 255 alphanumeric characters. First character must be a letter. Cannot end with a hyphen or contain
        # two consecutive hyphens.
        @[JSON::Field(key: "FinalClusterSnapshotIdentifier")]
        getter final_cluster_snapshot_identifier : String?

        # The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is
        # retained indefinitely. The value must be either -1 or an integer between 1 and 3,653. The default
        # value is -1.
        @[JSON::Field(key: "FinalClusterSnapshotRetentionPeriod")]
        getter final_cluster_snapshot_retention_period : Int32?

        # Determines whether a final snapshot of the cluster is created before Amazon Redshift deletes the
        # cluster. If true , a final cluster snapshot is not created. If false , a final cluster snapshot is
        # created before the cluster is deleted. The FinalClusterSnapshotIdentifier parameter must be
        # specified if SkipFinalClusterSnapshot is false . Default: false
        @[JSON::Field(key: "SkipFinalClusterSnapshot")]
        getter skip_final_cluster_snapshot : Bool?

        def initialize(
          @cluster_identifier : String,
          @final_cluster_snapshot_identifier : String? = nil,
          @final_cluster_snapshot_retention_period : Int32? = nil,
          @skip_final_cluster_snapshot : Bool? = nil
        )
        end
      end

      struct DeleteClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the parameter group to be deleted. Constraints: Must be the name of an existing cluster
        # parameter group. Cannot delete a default cluster parameter group.
        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        def initialize(
          @parameter_group_name : String
        )
        end
      end

      struct DeleteClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct DeleteClusterSecurityGroupMessage
        include JSON::Serializable

        # The name of the cluster security group to be deleted.
        @[JSON::Field(key: "ClusterSecurityGroupName")]
        getter cluster_security_group_name : String

        def initialize(
          @cluster_security_group_name : String
        )
        end
      end

      struct DeleteClusterSnapshotMessage
        include JSON::Serializable

        # The unique identifier of the manual snapshot to be deleted. Constraints: Must be the name of an
        # existing snapshot that is in the available , failed , or cancelled state.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String

        # The unique identifier of the cluster the snapshot was created from. This parameter is required if
        # your IAM user has a policy containing a snapshot resource element that specifies anything other than
        # * for the cluster name. Constraints: Must be the name of valid cluster.
        @[JSON::Field(key: "SnapshotClusterIdentifier")]
        getter snapshot_cluster_identifier : String?

        def initialize(
          @snapshot_identifier : String,
          @snapshot_cluster_identifier : String? = nil
        )
        end
      end

      struct DeleteClusterSnapshotResult
        include JSON::Serializable

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct DeleteClusterSubnetGroupMessage
        include JSON::Serializable

        # The name of the cluster subnet group name to be deleted.
        @[JSON::Field(key: "ClusterSubnetGroupName")]
        getter cluster_subnet_group_name : String

        def initialize(
          @cluster_subnet_group_name : String
        )
        end
      end

      struct DeleteCustomDomainAssociationMessage
        include JSON::Serializable

        # The identifier of the cluster to delete a custom domain association for.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The custom domain name for the custom domain association.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String

        def initialize(
          @cluster_identifier : String,
          @custom_domain_name : String
        )
        end
      end

      struct DeleteEndpointAccessMessage
        include JSON::Serializable

        # The Redshift-managed VPC endpoint to delete.
        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        def initialize(
          @endpoint_name : String
        )
        end
      end

      struct DeleteEventSubscriptionMessage
        include JSON::Serializable

        # The name of the Amazon Redshift event notification subscription to be deleted.
        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        def initialize(
          @subscription_name : String
        )
        end
      end

      struct DeleteHsmClientCertificateMessage
        include JSON::Serializable

        # The identifier of the HSM client certificate to be deleted.
        @[JSON::Field(key: "HsmClientCertificateIdentifier")]
        getter hsm_client_certificate_identifier : String

        def initialize(
          @hsm_client_certificate_identifier : String
        )
        end
      end

      struct DeleteHsmConfigurationMessage
        include JSON::Serializable

        # The identifier of the Amazon Redshift HSM configuration to be deleted.
        @[JSON::Field(key: "HsmConfigurationIdentifier")]
        getter hsm_configuration_identifier : String

        def initialize(
          @hsm_configuration_identifier : String
        )
        end
      end

      struct DeleteIntegrationMessage
        include JSON::Serializable

        # The unique identifier of the integration to delete.
        @[JSON::Field(key: "IntegrationArn")]
        getter integration_arn : String

        def initialize(
          @integration_arn : String
        )
        end
      end

      struct DeleteRedshiftIdcApplicationMessage
        include JSON::Serializable

        # The ARN for a deleted Amazon Redshift IAM Identity Center application.
        @[JSON::Field(key: "RedshiftIdcApplicationArn")]
        getter redshift_idc_application_arn : String

        def initialize(
          @redshift_idc_application_arn : String
        )
        end
      end

      struct DeleteResourcePolicyMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource of which its resource policy is deleted.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DeleteScheduledActionMessage
        include JSON::Serializable

        # The name of the scheduled action to delete.
        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        def initialize(
          @scheduled_action_name : String
        )
        end
      end

      # The result of the DeleteSnapshotCopyGrant action.
      struct DeleteSnapshotCopyGrantMessage
        include JSON::Serializable

        # The name of the snapshot copy grant to delete.
        @[JSON::Field(key: "SnapshotCopyGrantName")]
        getter snapshot_copy_grant_name : String

        def initialize(
          @snapshot_copy_grant_name : String
        )
        end
      end

      struct DeleteSnapshotScheduleMessage
        include JSON::Serializable

        # A unique identifier of the snapshot schedule to delete.
        @[JSON::Field(key: "ScheduleIdentifier")]
        getter schedule_identifier : String

        def initialize(
          @schedule_identifier : String
        )
        end
      end

      # Contains the output from the DeleteTags action.
      struct DeleteTagsMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) from which you want to remove the tag or tags. For example,
        # arn:aws:redshift:us-east-2:123456789:cluster:t1 .
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The tag key that you want to delete.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_name : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct DeleteUsageLimitMessage
        include JSON::Serializable

        # The identifier of the usage limit to delete.
        @[JSON::Field(key: "UsageLimitId")]
        getter usage_limit_id : String

        def initialize(
          @usage_limit_id : String
        )
        end
      end

      # A dependent service denied access for the integration.
      struct DependentServiceAccessDeniedFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be completed because a dependent service is throttling requests made by Amazon
      # Redshift on your behalf. Wait and retry the request.
      struct DependentServiceRequestThrottlingFault
        include JSON::Serializable

        def initialize
        end
      end

      # Your request cannot be completed because a dependent internal service is temporarily unavailable.
      # Wait 30 to 60 seconds and try again.
      struct DependentServiceUnavailableFault
        include JSON::Serializable

        def initialize
        end
      end

      struct DeregisterNamespaceInputMessage
        include JSON::Serializable

        # An array containing the ID of the consumer account that you want to deregister the cluster or
        # serverless namespace from.
        @[JSON::Field(key: "ConsumerIdentifiers")]
        getter consumer_identifiers : Array(String)

        # The unique identifier of the cluster or serverless namespace that you want to deregister.
        @[JSON::Field(key: "NamespaceIdentifier")]
        getter namespace_identifier : Types::NamespaceIdentifierUnion

        def initialize(
          @consumer_identifiers : Array(String),
          @namespace_identifier : Types::NamespaceIdentifierUnion
        )
        end
      end

      struct DeregisterNamespaceOutputMessage
        include JSON::Serializable

        # The registration status of the cluster or serverless namespace.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct DescribeAccountAttributesMessage
        include JSON::Serializable

        # A list of attribute names.
        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)?

        def initialize(
          @attribute_names : Array(String)? = nil
        )
        end
      end

      struct DescribeAuthenticationProfilesMessage
        include JSON::Serializable

        # The name of the authentication profile to describe. If not specified then all authentication
        # profiles owned by the account are listed.
        @[JSON::Field(key: "AuthenticationProfileName")]
        getter authentication_profile_name : String?

        def initialize(
          @authentication_profile_name : String? = nil
        )
        end
      end

      struct DescribeAuthenticationProfilesResult
        include JSON::Serializable

        # The list of authentication profiles.
        @[JSON::Field(key: "AuthenticationProfiles")]
        getter authentication_profiles : Array(Types::AuthenticationProfile)?

        def initialize(
          @authentication_profiles : Array(Types::AuthenticationProfile)? = nil
        )
        end
      end

      struct DescribeClusterDbRevisionsMessage
        include JSON::Serializable

        # A unique identifier for a cluster whose ClusterDbRevisions you are requesting. This parameter is
        # case sensitive. All clusters defined for an account are returned by default.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # An optional parameter that specifies the starting point for returning a set of response records.
        # When the results of a DescribeClusterDbRevisions request exceed the value specified in MaxRecords ,
        # Amazon Redshift returns a value in the marker field of the response. You can retrieve the next set
        # of response records by providing the returned marker value in the marker parameter and retrying the
        # request. Constraints: You can specify either the ClusterIdentifier parameter, or the marker
        # parameter, but not both.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in the marker field of the
        # response. You can retrieve the next set of response records by providing the returned marker value
        # in the marker parameter and retrying the request. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @cluster_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct DescribeClusterParameterGroupsMessage
        include JSON::Serializable

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeClusterParameterGroups request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The name of a specific parameter group for which to return details. By default, details about all
        # parameter groups and the default parameter group are returned.
        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        # A tag key or keys for which you want to return all matching cluster parameter groups that are
        # associated with the specified key or keys. For example, suppose that you have parameter groups that
        # are tagged with keys called owner and environment . If you specify both of these tag keys in the
        # request, Amazon Redshift returns a response with the parameter groups that have either or both of
        # these tag keys associated with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching cluster parameter groups that are
        # associated with the specified tag value or values. For example, suppose that you have parameter
        # groups that are tagged with values called admin and test . If you specify both of these tag values
        # in the request, Amazon Redshift returns a response with the parameter groups that have either or
        # both of these tag values associated with them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @parameter_group_name : String? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeClusterParametersMessage
        include JSON::Serializable

        # The name of a cluster parameter group for which to return details.
        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeClusterParameters request exceed the value specified in MaxRecords , Amazon
        # Web Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The parameter types to return. Specify user to show parameters that are different form the default.
        # Similarly, specify engine-default to show parameters that are the same as the default parameter
        # group. Default: All parameter types returned. Valid Values: user | engine-default
        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @parameter_group_name : String,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @source : String? = nil
        )
        end
      end

      struct DescribeClusterSecurityGroupsMessage
        include JSON::Serializable

        # The name of a cluster security group for which you are requesting details. You must specify either
        # the Marker parameter or a ClusterSecurityGroupName parameter, but not both. Example: securitygroup1
        @[JSON::Field(key: "ClusterSecurityGroupName")]
        getter cluster_security_group_name : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeClusterSecurityGroups request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request. Constraints: You must specify either the ClusterSecurityGroupName parameter or the
        # Marker parameter, but not both.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # A tag key or keys for which you want to return all matching cluster security groups that are
        # associated with the specified key or keys. For example, suppose that you have security groups that
        # are tagged with keys called owner and environment . If you specify both of these tag keys in the
        # request, Amazon Redshift returns a response with the security groups that have either or both of
        # these tag keys associated with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching cluster security groups that are
        # associated with the specified tag value or values. For example, suppose that you have security
        # groups that are tagged with values called admin and test . If you specify both of these tag values
        # in the request, Amazon Redshift returns a response with the security groups that have either or both
        # of these tag values associated with them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @cluster_security_group_name : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeClusterSnapshotsMessage
        include JSON::Serializable

        # A value that indicates whether to return snapshots only for an existing cluster. You can perform
        # table-level restore only by using a snapshot of an existing cluster, that is, a cluster that has not
        # been deleted. Values for this parameter work as follows: If ClusterExists is set to true ,
        # ClusterIdentifier is required. If ClusterExists is set to false and ClusterIdentifier isn't
        # specified, all snapshots associated with deleted clusters (orphaned snapshots) are returned. If
        # ClusterExists is set to false and ClusterIdentifier is specified for a deleted cluster, snapshots
        # associated with that cluster are returned. If ClusterExists is set to false and ClusterIdentifier is
        # specified for an existing cluster, no snapshots are returned.
        @[JSON::Field(key: "ClusterExists")]
        getter cluster_exists : Bool?

        # The identifier of the cluster which generated the requested snapshots.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # A time value that requests only snapshots created at or before the specified time. The time value is
        # specified in ISO 8601 format. For more information about ISO 8601, go to the ISO8601 Wikipedia page.
        # Example: 2012-07-16T18:00:00Z
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeClusterSnapshots request exceed the value specified in MaxRecords , Amazon
        # Web Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The Amazon Web Services account used to create or copy the snapshot. Use this field to filter the
        # results to snapshots owned by a particular account. To describe snapshots you own, either specify
        # your Amazon Web Services account, or do not specify the parameter.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # The Amazon Resource Name (ARN) of the snapshot associated with the message to describe cluster
        # snapshots.
        @[JSON::Field(key: "SnapshotArn")]
        getter snapshot_arn : String?

        # The snapshot identifier of the snapshot about which to return information.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String?

        # The type of snapshots for which you are requesting information. By default, snapshots of all types
        # are returned. Valid Values: automated | manual
        @[JSON::Field(key: "SnapshotType")]
        getter snapshot_type : String?

        @[JSON::Field(key: "SortingEntities")]
        getter sorting_entities : Array(Types::SnapshotSortingEntity)?

        # A value that requests only snapshots created at or after the specified time. The time value is
        # specified in ISO 8601 format. For more information about ISO 8601, go to the ISO8601 Wikipedia page.
        # Example: 2012-07-16T18:00:00Z
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # A tag key or keys for which you want to return all matching cluster snapshots that are associated
        # with the specified key or keys. For example, suppose that you have snapshots that are tagged with
        # keys called owner and environment . If you specify both of these tag keys in the request, Amazon
        # Redshift returns a response with the snapshots that have either or both of these tag keys associated
        # with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching cluster snapshots that are
        # associated with the specified tag value or values. For example, suppose that you have snapshots that
        # are tagged with values called admin and test . If you specify both of these tag values in the
        # request, Amazon Redshift returns a response with the snapshots that have either or both of these tag
        # values associated with them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @cluster_exists : Bool? = nil,
          @cluster_identifier : String? = nil,
          @end_time : Time? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @owner_account : String? = nil,
          @snapshot_arn : String? = nil,
          @snapshot_identifier : String? = nil,
          @snapshot_type : String? = nil,
          @sorting_entities : Array(Types::SnapshotSortingEntity)? = nil,
          @start_time : Time? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeClusterSubnetGroupsMessage
        include JSON::Serializable

        # The name of the cluster subnet group for which information is requested.
        @[JSON::Field(key: "ClusterSubnetGroupName")]
        getter cluster_subnet_group_name : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeClusterSubnetGroups request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # A tag key or keys for which you want to return all matching cluster subnet groups that are
        # associated with the specified key or keys. For example, suppose that you have subnet groups that are
        # tagged with keys called owner and environment . If you specify both of these tag keys in the
        # request, Amazon Redshift returns a response with the subnet groups that have either or both of these
        # tag keys associated with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching cluster subnet groups that are
        # associated with the specified tag value or values. For example, suppose that you have subnet groups
        # that are tagged with values called admin and test . If you specify both of these tag values in the
        # request, Amazon Redshift returns a response with the subnet groups that have either or both of these
        # tag values associated with them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @cluster_subnet_group_name : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeClusterTracksMessage
        include JSON::Serializable

        # The name of the maintenance track.
        @[JSON::Field(key: "MaintenanceTrackName")]
        getter maintenance_track_name : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeClusterTracks request exceed the value specified in MaxRecords , Amazon
        # Redshift returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An integer value for the maximum number of maintenance tracks to return.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @maintenance_track_name : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct DescribeClusterVersionsMessage
        include JSON::Serializable

        # The name of a specific cluster parameter group family to return details for. Constraints: Must be 1
        # to 255 alphanumeric characters First character must be a letter Cannot end with a hyphen or contain
        # two consecutive hyphens
        @[JSON::Field(key: "ClusterParameterGroupFamily")]
        getter cluster_parameter_group_family : String?

        # The specific cluster version to return. Example: 1.0
        @[JSON::Field(key: "ClusterVersion")]
        getter cluster_version : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeClusterVersions request exceed the value specified in MaxRecords , Amazon
        # Web Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @cluster_parameter_group_family : String? = nil,
          @cluster_version : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct DescribeClustersMessage
        include JSON::Serializable

        # The unique identifier of a cluster whose properties you are requesting. This parameter is case
        # sensitive. The default is that all clusters defined for an account are returned.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeClusters request exceed the value specified in MaxRecords , Amazon Web
        # Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request. Constraints: You can specify either the ClusterIdentifier parameter or the Marker
        # parameter, but not both.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # A tag key or keys for which you want to return all matching clusters that are associated with the
        # specified key or keys. For example, suppose that you have clusters that are tagged with keys called
        # owner and environment . If you specify both of these tag keys in the request, Amazon Redshift
        # returns a response with the clusters that have either or both of these tag keys associated with
        # them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching clusters that are associated with
        # the specified tag value or values. For example, suppose that you have clusters that are tagged with
        # values called admin and test . If you specify both of these tag values in the request, Amazon
        # Redshift returns a response with the clusters that have either or both of these tag values
        # associated with them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @cluster_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeCustomDomainAssociationsMessage
        include JSON::Serializable

        # The certificate Amazon Resource Name (ARN) for the custom domain association.
        @[JSON::Field(key: "CustomDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The custom domain name for the custom domain association.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String?

        # The marker for the custom domain association.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum records setting for the associated custom domain.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_name : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct DescribeDataSharesForConsumerMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the consumer namespace that returns in the list of datashares.
        @[JSON::Field(key: "ConsumerArn")]
        getter consumer_arn : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeDataSharesForConsumer request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # An identifier giving the status of a datashare in the consumer cluster. If this field is specified,
        # Amazon Redshift returns the list of datashares that have the specified status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @consumer_arn : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeDataSharesForConsumerResult
        include JSON::Serializable

        # Shows the results of datashares available for consumers.
        @[JSON::Field(key: "DataShares")]
        getter data_shares : Array(Types::DataShare)?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeDataSharesForConsumer request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @data_shares : Array(Types::DataShare)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeDataSharesForProducerMessage
        include JSON::Serializable

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeDataSharesForProducer request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The Amazon Resource Name (ARN) of the producer namespace that returns in the list of datashares.
        @[JSON::Field(key: "ProducerArn")]
        getter producer_arn : String?

        # An identifier giving the status of a datashare in the producer. If this field is specified, Amazon
        # Redshift returns the list of datashares that have the specified status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @producer_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeDataSharesForProducerResult
        include JSON::Serializable

        # Shows the results of datashares available for producers.
        @[JSON::Field(key: "DataShares")]
        getter data_shares : Array(Types::DataShare)?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeDataSharesForProducer request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @data_shares : Array(Types::DataShare)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeDataSharesMessage
        include JSON::Serializable

        # The Amazon resource name (ARN) of the datashare to describe details of.
        @[JSON::Field(key: "DataShareArn")]
        getter data_share_arn : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeDataShares request exceed the value specified in MaxRecords , Amazon Web
        # Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @data_share_arn : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct DescribeDataSharesResult
        include JSON::Serializable

        # The results returned from describing datashares.
        @[JSON::Field(key: "DataShares")]
        getter data_shares : Array(Types::DataShare)?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeDataShares request exceed the value specified in MaxRecords , Amazon Web
        # Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @data_shares : Array(Types::DataShare)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeDefaultClusterParametersMessage
        include JSON::Serializable

        # The name of the cluster parameter group family.
        @[JSON::Field(key: "ParameterGroupFamily")]
        getter parameter_group_family : String

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeDefaultClusterParameters request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @parameter_group_family : String,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct DescribeDefaultClusterParametersResult
        include JSON::Serializable

        @[JSON::Field(key: "DefaultClusterParameters")]
        getter default_cluster_parameters : Types::DefaultClusterParameters?

        def initialize(
          @default_cluster_parameters : Types::DefaultClusterParameters? = nil
        )
        end
      end

      struct DescribeEndpointAccessMessage
        include JSON::Serializable

        # The cluster identifier associated with the described endpoint.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The name of the endpoint to be described.
        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String?

        # An optional pagination token provided by a previous DescribeEndpointAccess request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by the MaxRecords parameter.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a Marker is included in the response so that the
        # remaining results can be retrieved.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The Amazon Web Services account ID of the owner of the cluster.
        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # The virtual private cloud (VPC) identifier with access to the cluster.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @endpoint_name : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @resource_owner : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct DescribeEndpointAuthorizationMessage
        include JSON::Serializable

        # The Amazon Web Services account ID of either the cluster owner (grantor) or grantee. If Grantee
        # parameter is true, then the Account value is of the grantor.
        @[JSON::Field(key: "Account")]
        getter account : String?

        # The cluster identifier of the cluster to access.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # Indicates whether to check authorization from a grantor or grantee point of view. If true, Amazon
        # Redshift returns endpoint authorizations that you've been granted. If false (default), checks
        # authorization from a grantor point of view.
        @[JSON::Field(key: "Grantee")]
        getter grantee : Bool?

        # An optional pagination token provided by a previous DescribeEndpointAuthorization request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by the MaxRecords parameter.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a Marker is included in the response so that the
        # remaining results can be retrieved.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @account : String? = nil,
          @cluster_identifier : String? = nil,
          @grantee : Bool? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct DescribeEventCategoriesMessage
        include JSON::Serializable

        # The source type, such as cluster or parameter group, to which the described event categories apply.
        # Valid values: cluster, cluster-snapshot, cluster-parameter-group, cluster-security-group, and
        # scheduled-action.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @source_type : String? = nil
        )
        end
      end

      struct DescribeEventSubscriptionsMessage
        include JSON::Serializable

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeEventSubscriptions request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The name of the Amazon Redshift event notification subscription to be described.
        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String?

        # A tag key or keys for which you want to return all matching event notification subscriptions that
        # are associated with the specified key or keys. For example, suppose that you have subscriptions that
        # are tagged with keys called owner and environment . If you specify both of these tag keys in the
        # request, Amazon Redshift returns a response with the subscriptions that have either or both of these
        # tag keys associated with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching event notification subscriptions
        # that are associated with the specified tag value or values. For example, suppose that you have
        # subscriptions that are tagged with values called admin and test . If you specify both of these tag
        # values in the request, Amazon Redshift returns a response with the subscriptions that have either or
        # both of these tag values associated with them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @subscription_name : String? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeEventsMessage
        include JSON::Serializable

        # The number of minutes prior to the time of the request for which to retrieve events. For example, if
        # the request is sent at 18:00 and you specify a duration of 60, then only events which have occurred
        # after 17:00 will be returned. Default: 60
        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The end of the time interval for which to retrieve events, specified in ISO 8601 format. For more
        # information about ISO 8601, go to the ISO8601 Wikipedia page. Example: 2009-07-08T18:00Z
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeEvents request exceed the value specified in MaxRecords , Amazon Web
        # Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The identifier of the event source for which events will be returned. If this parameter is not
        # specified, then all sources are included in the response. Constraints: If SourceIdentifier is
        # supplied, SourceType must also be provided. Specify a cluster identifier when SourceType is cluster
        # . Specify a cluster security group name when SourceType is cluster-security-group . Specify a
        # cluster parameter group name when SourceType is cluster-parameter-group . Specify a cluster snapshot
        # identifier when SourceType is cluster-snapshot .
        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        # The event source to retrieve events for. If no value is specified, all events are returned.
        # Constraints: If SourceType is supplied, SourceIdentifier must also be provided. Specify cluster when
        # SourceIdentifier is a cluster identifier. Specify cluster-security-group when SourceIdentifier is a
        # cluster security group name. Specify cluster-parameter-group when SourceIdentifier is a cluster
        # parameter group name. Specify cluster-snapshot when SourceIdentifier is a cluster snapshot
        # identifier.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The beginning of the time interval to retrieve events for, specified in ISO 8601 format. For more
        # information about ISO 8601, go to the ISO8601 Wikipedia page. Example: 2009-07-08T18:00Z
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @duration : Int32? = nil,
          @end_time : Time? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @source_identifier : String? = nil,
          @source_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct DescribeHsmClientCertificatesMessage
        include JSON::Serializable

        # The identifier of a specific HSM client certificate for which you want information. If no identifier
        # is specified, information is returned for all HSM client certificates owned by your Amazon Web
        # Services account.
        @[JSON::Field(key: "HsmClientCertificateIdentifier")]
        getter hsm_client_certificate_identifier : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeHsmClientCertificates request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # A tag key or keys for which you want to return all matching HSM client certificates that are
        # associated with the specified key or keys. For example, suppose that you have HSM client
        # certificates that are tagged with keys called owner and environment . If you specify both of these
        # tag keys in the request, Amazon Redshift returns a response with the HSM client certificates that
        # have either or both of these tag keys associated with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching HSM client certificates that are
        # associated with the specified tag value or values. For example, suppose that you have HSM client
        # certificates that are tagged with values called admin and test . If you specify both of these tag
        # values in the request, Amazon Redshift returns a response with the HSM client certificates that have
        # either or both of these tag values associated with them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @hsm_client_certificate_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeHsmConfigurationsMessage
        include JSON::Serializable

        # The identifier of a specific Amazon Redshift HSM configuration to be described. If no identifier is
        # specified, information is returned for all HSM configurations owned by your Amazon Web Services
        # account.
        @[JSON::Field(key: "HsmConfigurationIdentifier")]
        getter hsm_configuration_identifier : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeHsmConfigurations request exceed the value specified in MaxRecords , Amazon
        # Web Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # A tag key or keys for which you want to return all matching HSM configurations that are associated
        # with the specified key or keys. For example, suppose that you have HSM configurations that are
        # tagged with keys called owner and environment . If you specify both of these tag keys in the
        # request, Amazon Redshift returns a response with the HSM configurations that have either or both of
        # these tag keys associated with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching HSM configurations that are
        # associated with the specified tag value or values. For example, suppose that you have HSM
        # configurations that are tagged with values called admin and test . If you specify both of these tag
        # values in the request, Amazon Redshift returns a response with the HSM configurations that have
        # either or both of these tag values associated with them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @hsm_configuration_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeInboundIntegrationsMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the inbound integration.
        @[JSON::Field(key: "IntegrationArn")]
        getter integration_arn : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeInboundIntegrations request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The Amazon Resource Name (ARN) of the target of an inbound integration.
        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String?

        def initialize(
          @integration_arn : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @target_arn : String? = nil
        )
        end
      end

      # A set of elements to filter the returned integrations.
      struct DescribeIntegrationsFilter
        include JSON::Serializable

        # Specifies the type of integration filter.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies the values to filter on.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      struct DescribeIntegrationsMessage
        include JSON::Serializable

        # A filter that specifies one or more resources to return.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::DescribeIntegrationsFilter)?

        # The unique identifier of the integration.
        @[JSON::Field(key: "IntegrationArn")]
        getter integration_arn : String?

        # An optional pagination token provided by a previous DescribeIntegrations request. If this parameter
        # is specified, the response includes only records beyond the marker, up to the value specified by
        # MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::DescribeIntegrationsFilter)? = nil,
          @integration_arn : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct DescribeLoggingStatusMessage
        include JSON::Serializable

        # The identifier of the cluster from which to get the logging status. Example: examplecluster
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct DescribeNodeConfigurationOptionsMessage
        include JSON::Serializable

        # The action type to evaluate for possible node configurations. Specify "restore-cluster" to get
        # configuration combinations based on an existing snapshot. Specify "recommend-node-config" to get
        # configuration recommendations based on an existing cluster or snapshot. Specify "resize-cluster" to
        # get configuration combinations for elastic resize based on an existing cluster.
        @[JSON::Field(key: "ActionType")]
        getter action_type : String

        # The identifier of the cluster to evaluate for possible node configurations.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # A set of name, operator, and value items to filter the results.
        @[JSON::Field(key: "Filter")]
        getter filters : Array(Types::NodeConfigurationOptionsFilter)?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeNodeConfigurationOptions request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 500 Constraints: minimum 100, maximum 500.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The Amazon Web Services account used to create or copy the snapshot. Required if you are restoring a
        # snapshot you do not own, optional if you own the snapshot.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # The Amazon Resource Name (ARN) of the snapshot associated with the message to describe node
        # configuration.
        @[JSON::Field(key: "SnapshotArn")]
        getter snapshot_arn : String?

        # The identifier of the snapshot to evaluate for possible node configurations.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String?

        def initialize(
          @action_type : String,
          @cluster_identifier : String? = nil,
          @filters : Array(Types::NodeConfigurationOptionsFilter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @owner_account : String? = nil,
          @snapshot_arn : String? = nil,
          @snapshot_identifier : String? = nil
        )
        end
      end

      struct DescribeOrderableClusterOptionsMessage
        include JSON::Serializable

        # The version filter value. Specify this parameter to show only the available offerings matching the
        # specified version. Default: All versions. Constraints: Must be one of the version returned from
        # DescribeClusterVersions .
        @[JSON::Field(key: "ClusterVersion")]
        getter cluster_version : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeOrderableClusterOptions request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The node type filter value. Specify this parameter to show only the available offerings matching the
        # specified node type.
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        def initialize(
          @cluster_version : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @node_type : String? = nil
        )
        end
      end

      struct DescribePartnersInputMessage
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the cluster.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The cluster identifier of the cluster whose partner integration is being described.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The name of the database whose partner integration is being described. If database name is not
        # specified, then all databases in the cluster are described.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The name of the partner that is being described. If partner name is not specified, then all partner
        # integrations are described.
        @[JSON::Field(key: "PartnerName")]
        getter partner_name : String?

        def initialize(
          @account_id : String,
          @cluster_identifier : String,
          @database_name : String? = nil,
          @partner_name : String? = nil
        )
        end
      end

      struct DescribePartnersOutputMessage
        include JSON::Serializable

        # A list of partner integrations.
        @[JSON::Field(key: "PartnerIntegrationInfoList")]
        getter partner_integration_info_list : Array(Types::PartnerIntegrationInfo)?

        def initialize(
          @partner_integration_info_list : Array(Types::PartnerIntegrationInfo)? = nil
        )
        end
      end

      struct DescribeRedshiftIdcApplicationsMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The ARN for the Redshift application that integrates with IAM Identity Center.
        @[JSON::Field(key: "RedshiftIdcApplicationArn")]
        getter redshift_idc_application_arn : String?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @redshift_idc_application_arn : String? = nil
        )
        end
      end

      struct DescribeRedshiftIdcApplicationsResult
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The list of Amazon Redshift IAM Identity Center applications.
        @[JSON::Field(key: "RedshiftIdcApplications")]
        getter redshift_idc_applications : Array(Types::RedshiftIdcApplication)?

        def initialize(
          @marker : String? = nil,
          @redshift_idc_applications : Array(Types::RedshiftIdcApplication)? = nil
        )
        end
      end

      struct DescribeReservedNodeExchangeStatusInputMessage
        include JSON::Serializable

        # An optional pagination token provided by a previous DescribeReservedNodeExchangeStatus request. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by the MaxRecords parameter. You can retrieve the next set of response records by
        # providing the returned marker value in the Marker parameter and retrying the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a Marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The identifier of the reserved-node exchange request.
        @[JSON::Field(key: "ReservedNodeExchangeRequestId")]
        getter reserved_node_exchange_request_id : String?

        # The identifier of the source reserved node in a reserved-node exchange request.
        @[JSON::Field(key: "ReservedNodeId")]
        getter reserved_node_id : String?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @reserved_node_exchange_request_id : String? = nil,
          @reserved_node_id : String? = nil
        )
        end
      end

      struct DescribeReservedNodeExchangeStatusOutputMessage
        include JSON::Serializable

        # A pagination token provided by a previous DescribeReservedNodeExchangeStatus request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The details of the reserved-node exchange request, including the status, request time, source
        # reserved-node identifier, and additional details.
        @[JSON::Field(key: "ReservedNodeExchangeStatusDetails")]
        getter reserved_node_exchange_status_details : Array(Types::ReservedNodeExchangeStatus)?

        def initialize(
          @marker : String? = nil,
          @reserved_node_exchange_status_details : Array(Types::ReservedNodeExchangeStatus)? = nil
        )
        end
      end

      struct DescribeReservedNodeOfferingsMessage
        include JSON::Serializable

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeReservedNodeOfferings request exceed the value specified in MaxRecords ,
        # Amazon Web Services returns a value in the Marker field of the response. You can retrieve the next
        # set of response records by providing the returned marker value in the Marker parameter and retrying
        # the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The unique identifier for the offering.
        @[JSON::Field(key: "ReservedNodeOfferingId")]
        getter reserved_node_offering_id : String?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @reserved_node_offering_id : String? = nil
        )
        end
      end

      struct DescribeReservedNodesMessage
        include JSON::Serializable

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeReservedNodes request exceed the value specified in MaxRecords , Amazon Web
        # Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # Identifier for the node reservation.
        @[JSON::Field(key: "ReservedNodeId")]
        getter reserved_node_id : String?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @reserved_node_id : String? = nil
        )
        end
      end

      struct DescribeResizeMessage
        include JSON::Serializable

        # The unique identifier of a cluster whose resize progress you are requesting. This parameter is
        # case-sensitive. By default, resize operations for all clusters defined for an Amazon Web Services
        # account are returned.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct DescribeScheduledActionsMessage
        include JSON::Serializable

        # If true, retrieve only active scheduled actions. If false, retrieve only disabled scheduled actions.
        @[JSON::Field(key: "Active")]
        getter active : Bool?

        # The end time in UTC of the scheduled action to retrieve. Only active scheduled actions that have
        # invocations before this time are retrieved.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # List of scheduled action filters.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ScheduledActionFilter)?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeScheduledActions request exceed the value specified in MaxRecords , Amazon
        # Web Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The name of the scheduled action to retrieve.
        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String?

        # The start time in UTC of the scheduled actions to retrieve. Only active scheduled actions that have
        # invocations after this time are retrieved.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The type of the scheduled actions to retrieve.
        @[JSON::Field(key: "TargetActionType")]
        getter target_action_type : String?

        def initialize(
          @active : Bool? = nil,
          @end_time : Time? = nil,
          @filters : Array(Types::ScheduledActionFilter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @scheduled_action_name : String? = nil,
          @start_time : Time? = nil,
          @target_action_type : String? = nil
        )
        end
      end

      # The result of the DescribeSnapshotCopyGrants action.
      struct DescribeSnapshotCopyGrantsMessage
        include JSON::Serializable

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeSnapshotCopyGrant request exceed the value specified in MaxRecords , Amazon
        # Web Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request. Constraints: You can specify either the SnapshotCopyGrantName parameter or the Marker
        # parameter, but not both.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The name of the snapshot copy grant.
        @[JSON::Field(key: "SnapshotCopyGrantName")]
        getter snapshot_copy_grant_name : String?

        # A tag key or keys for which you want to return all matching resources that are associated with the
        # specified key or keys. For example, suppose that you have resources tagged with keys called owner
        # and environment . If you specify both of these tag keys in the request, Amazon Redshift returns a
        # response with all resources that have either or both of these tag keys associated with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching resources that are associated with
        # the specified value or values. For example, suppose that you have resources tagged with values
        # called admin and test . If you specify both of these tag values in the request, Amazon Redshift
        # returns a response with all resources that have either or both of these tag values associated with
        # them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @snapshot_copy_grant_name : String? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeSnapshotSchedulesMessage
        include JSON::Serializable

        # The unique identifier for the cluster whose snapshot schedules you want to view.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the marker parameter and retrying the command. If the marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number or response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # A unique identifier for a snapshot schedule.
        @[JSON::Field(key: "ScheduleIdentifier")]
        getter schedule_identifier : String?

        # The key value for a snapshot schedule tag.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # The value corresponding to the key of the snapshot schedule tag.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @cluster_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @schedule_identifier : String? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeSnapshotSchedulesOutputMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the marker parameter and retrying the command. If the marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of SnapshotSchedules.
        @[JSON::Field(key: "SnapshotSchedules")]
        getter snapshot_schedules : Array(Types::SnapshotSchedule)?

        def initialize(
          @marker : String? = nil,
          @snapshot_schedules : Array(Types::SnapshotSchedule)? = nil
        )
        end
      end

      struct DescribeTableRestoreStatusMessage
        include JSON::Serializable

        # The Amazon Redshift cluster that the table is being restored to.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # An optional pagination token provided by a previous DescribeTableRestoreStatus request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by the MaxRecords parameter.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The identifier of the table restore request to return status for. If you don't specify a
        # TableRestoreRequestId value, then DescribeTableRestoreStatus returns the status of all in-progress
        # table restore requests.
        @[JSON::Field(key: "TableRestoreRequestId")]
        getter table_restore_request_id : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @table_restore_request_id : String? = nil
        )
        end
      end

      struct DescribeTagsMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the marker parameter and retrying the command. If the marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number or response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The Amazon Resource Name (ARN) for which you want to describe the tag or tags. For example,
        # arn:aws:redshift:us-east-2:123456789:cluster:t1 .
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of resource with which you want to view tags. Valid resource types are: Cluster CIDR/IP EC2
        # security group Snapshot Cluster security group Subnet group HSM connection HSM certificate Parameter
        # group Snapshot copy grant Integration (zero-ETL integration or S3 event integration) To describe the
        # tags associated with an integration , don't specify ResourceType , instead specify the ResourceName
        # of the integration. For more information about Amazon Redshift resource types and constructing ARNs,
        # go to Specifying Policy Elements: Actions, Effects, Resources, and Principals in the Amazon Redshift
        # Cluster Management Guide.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # A tag key or keys for which you want to return all matching resources that are associated with the
        # specified key or keys. For example, suppose that you have resources tagged with keys called owner
        # and environment . If you specify both of these tag keys in the request, Amazon Redshift returns a
        # response with all resources that have either or both of these tag keys associated with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching resources that are associated with
        # the specified value or values. For example, suppose that you have resources tagged with values
        # called admin and test . If you specify both of these tag values in the request, Amazon Redshift
        # returns a response with all resources that have either or both of these tag values associated with
        # them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      struct DescribeUsageLimitsMessage
        include JSON::Serializable

        # The identifier of the cluster for which you want to describe usage limits.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The feature type for which you want to describe usage limits.
        @[JSON::Field(key: "FeatureType")]
        getter feature_type : String?

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeUsageLimits request exceed the value specified in MaxRecords , Amazon Web
        # Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value. Default: 100 Constraints: minimum 20, maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # A tag key or keys for which you want to return all matching usage limit objects that are associated
        # with the specified key or keys. For example, suppose that you have parameter groups that are tagged
        # with keys called owner and environment . If you specify both of these tag keys in the request,
        # Amazon Redshift returns a response with the usage limit objects have either or both of these tag
        # keys associated with them.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # A tag value or values for which you want to return all matching usage limit objects that are
        # associated with the specified tag value or values. For example, suppose that you have parameter
        # groups that are tagged with values called admin and test . If you specify both of these tag values
        # in the request, Amazon Redshift returns a response with the usage limit objects that have either or
        # both of these tag values associated with them.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        # The identifier of the usage limit to describe.
        @[JSON::Field(key: "UsageLimitId")]
        getter usage_limit_id : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @feature_type : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @tag_keys : Array(String)? = nil,
          @tag_values : Array(String)? = nil,
          @usage_limit_id : String? = nil
        )
        end
      end

      struct DisableLoggingMessage
        include JSON::Serializable

        # The identifier of the cluster on which logging is to be stopped. Example: examplecluster
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct DisableSnapshotCopyMessage
        include JSON::Serializable

        # The unique identifier of the source cluster that you want to disable copying of snapshots to a
        # destination region. Constraints: Must be the valid name of an existing cluster that has cross-region
        # snapshot copy enabled.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct DisableSnapshotCopyResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct DisassociateDataShareConsumerMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the datashare to remove association for.
        @[JSON::Field(key: "DataShareArn")]
        getter data_share_arn : String

        # The Amazon Resource Name (ARN) of the consumer namespace that association for the datashare is
        # removed from.
        @[JSON::Field(key: "ConsumerArn")]
        getter consumer_arn : String?

        # From a datashare consumer account, removes association of a datashare from all the existing and
        # future namespaces in the specified Amazon Web Services Region.
        @[JSON::Field(key: "ConsumerRegion")]
        getter consumer_region : String?

        # A value that specifies whether association for the datashare is removed from the entire account.
        @[JSON::Field(key: "DisassociateEntireAccount")]
        getter disassociate_entire_account : Bool?

        def initialize(
          @data_share_arn : String,
          @consumer_arn : String? = nil,
          @consumer_region : String? = nil,
          @disassociate_entire_account : Bool? = nil
        )
        end
      end

      # Describes an Amazon EC2 security group.
      struct EC2SecurityGroup
        include JSON::Serializable

        # The name of the EC2 Security Group.
        @[JSON::Field(key: "EC2SecurityGroupName")]
        getter ec2_security_group_name : String?

        # The Amazon Web Services account ID of the owner of the EC2 security group specified in the
        # EC2SecurityGroupName field.
        @[JSON::Field(key: "EC2SecurityGroupOwnerId")]
        getter ec2_security_group_owner_id : String?

        # The status of the EC2 security group.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The list of tags for the EC2 security group.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @ec2_security_group_name : String? = nil,
          @ec2_security_group_owner_id : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes the status of the elastic IP (EIP) address.
      struct ElasticIpStatus
        include JSON::Serializable

        # The elastic IP (EIP) address for the cluster.
        @[JSON::Field(key: "ElasticIp")]
        getter elastic_ip : String?

        # The status of the elastic IP (EIP) address.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @elastic_ip : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct EnableLoggingMessage
        include JSON::Serializable

        # The identifier of the cluster on which logging is to be started. Example: examplecluster
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The name of an existing S3 bucket where the log files are to be stored. Constraints: Must be in the
        # same region as the cluster The cluster must have read bucket and put object permissions
        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # The log destination type. An enum with possible values of s3 and cloudwatch .
        @[JSON::Field(key: "LogDestinationType")]
        getter log_destination_type : String?

        # The collection of exported log types. Possible values are connectionlog , useractivitylog , and
        # userlog .
        @[JSON::Field(key: "LogExports")]
        getter log_exports : Array(String)?

        # The prefix applied to the log file names. Valid characters are any letter from any language, any
        # whitespace character, any numeric character, and the following characters: underscore ( _ ), period
        # ( . ), colon ( : ), slash ( / ), equal ( = ), plus ( + ), backslash ( \ ), hyphen ( - ), at symbol (
        # @ ).
        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @cluster_identifier : String,
          @bucket_name : String? = nil,
          @log_destination_type : String? = nil,
          @log_exports : Array(String)? = nil,
          @s3_key_prefix : String? = nil
        )
        end
      end

      struct EnableSnapshotCopyMessage
        include JSON::Serializable

        # The unique identifier of the source cluster to copy snapshots from. Constraints: Must be the valid
        # name of an existing cluster that does not already have cross-region snapshot copy enabled.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The destination Amazon Web Services Region that you want to copy snapshots to. Constraints: Must be
        # the name of a valid Amazon Web Services Region. For more information, see Regions and Endpoints in
        # the Amazon Web Services General Reference.
        @[JSON::Field(key: "DestinationRegion")]
        getter destination_region : String

        # The number of days to retain newly copied snapshots in the destination Amazon Web Services Region
        # after they are copied from the source Amazon Web Services Region. If the value is -1, the manual
        # snapshot is retained indefinitely. The value must be either -1 or an integer between 1 and 3,653.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        # The number of days to retain automated snapshots in the destination region after they are copied
        # from the source region. Default: 7. Constraints: Must be at least 1 and no more than 35.
        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int32?

        # The name of the snapshot copy grant to use when snapshots of an Amazon Web Services KMS-encrypted
        # cluster are copied to the destination region.
        @[JSON::Field(key: "SnapshotCopyGrantName")]
        getter snapshot_copy_grant_name : String?

        def initialize(
          @cluster_identifier : String,
          @destination_region : String,
          @manual_snapshot_retention_period : Int32? = nil,
          @retention_period : Int32? = nil,
          @snapshot_copy_grant_name : String? = nil
        )
        end
      end

      struct EnableSnapshotCopyResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # Describes a connection endpoint.
      struct Endpoint
        include JSON::Serializable

        # The DNS address of the Cluster.
        @[JSON::Field(key: "Address")]
        getter address : String?

        # The port that the database engine is listening on.
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Describes a connection endpoint.
        @[JSON::Field(key: "VpcEndpoints")]
        getter vpc_endpoints : Array(Types::VpcEndpoint)?

        def initialize(
          @address : String? = nil,
          @port : Int32? = nil,
          @vpc_endpoints : Array(Types::VpcEndpoint)? = nil
        )
        end
      end

      # Describes a Redshift-managed VPC endpoint.
      struct EndpointAccess
        include JSON::Serializable

        # The DNS address of the endpoint.
        @[JSON::Field(key: "Address")]
        getter address : String?

        # The cluster identifier of the cluster associated with the endpoint.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The time (UTC) that the endpoint was created.
        @[JSON::Field(key: "EndpointCreateTime")]
        getter endpoint_create_time : Time?

        # The name of the endpoint.
        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String?

        # The status of the endpoint.
        @[JSON::Field(key: "EndpointStatus")]
        getter endpoint_status : String?

        # The port number on which the cluster accepts incoming connections.
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The Amazon Web Services account ID of the owner of the cluster.
        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # The subnet group name where Amazon Redshift chooses to deploy the endpoint.
        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String?

        @[JSON::Field(key: "VpcEndpoint")]
        getter vpc_endpoint : Types::VpcEndpoint?

        # The security groups associated with the endpoint.
        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(Types::VpcSecurityGroupMembership)?

        def initialize(
          @address : String? = nil,
          @cluster_identifier : String? = nil,
          @endpoint_create_time : Time? = nil,
          @endpoint_name : String? = nil,
          @endpoint_status : String? = nil,
          @port : Int32? = nil,
          @resource_owner : String? = nil,
          @subnet_group_name : String? = nil,
          @vpc_endpoint : Types::VpcEndpoint? = nil,
          @vpc_security_groups : Array(Types::VpcSecurityGroupMembership)? = nil
        )
        end
      end

      struct EndpointAccessList
        include JSON::Serializable

        # The list of endpoints with access to the cluster.
        @[JSON::Field(key: "EndpointAccessList")]
        getter endpoint_access_list : Array(Types::EndpointAccess)?

        # An optional pagination token provided by a previous DescribeEndpointAccess request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by the MaxRecords parameter.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @endpoint_access_list : Array(Types::EndpointAccess)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The account already has a Redshift-managed VPC endpoint with the given identifier.
      struct EndpointAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an endpoint authorization for authorizing Redshift-managed VPC endpoint access to a
      # cluster across Amazon Web Services accounts.
      struct EndpointAuthorization
        include JSON::Serializable

        # Indicates whether all VPCs in the grantee account are allowed access to the cluster.
        @[JSON::Field(key: "AllowedAllVPCs")]
        getter allowed_all_vp_cs : Bool?

        # The VPCs allowed access to the cluster.
        @[JSON::Field(key: "AllowedVPCs")]
        getter allowed_vp_cs : Array(String)?

        # The time (UTC) when the authorization was created.
        @[JSON::Field(key: "AuthorizeTime")]
        getter authorize_time : Time?

        # The cluster identifier.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The status of the cluster.
        @[JSON::Field(key: "ClusterStatus")]
        getter cluster_status : String?

        # The number of Redshift-managed VPC endpoints created for the authorization.
        @[JSON::Field(key: "EndpointCount")]
        getter endpoint_count : Int32?

        # The Amazon Web Services account ID of the grantee of the cluster.
        @[JSON::Field(key: "Grantee")]
        getter grantee : String?

        # The Amazon Web Services account ID of the cluster owner.
        @[JSON::Field(key: "Grantor")]
        getter grantor : String?

        # The status of the authorization action.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @allowed_all_vp_cs : Bool? = nil,
          @allowed_vp_cs : Array(String)? = nil,
          @authorize_time : Time? = nil,
          @cluster_identifier : String? = nil,
          @cluster_status : String? = nil,
          @endpoint_count : Int32? = nil,
          @grantee : String? = nil,
          @grantor : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The authorization already exists for this endpoint.
      struct EndpointAuthorizationAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      struct EndpointAuthorizationList
        include JSON::Serializable

        # The authorizations to an endpoint.
        @[JSON::Field(key: "EndpointAuthorizationList")]
        getter endpoint_authorization_list : Array(Types::EndpointAuthorization)?

        # An optional pagination token provided by a previous DescribeEndpointAuthorization request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by the MaxRecords parameter.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @endpoint_authorization_list : Array(Types::EndpointAuthorization)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The authorization for this endpoint can't be found.
      struct EndpointAuthorizationNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The number of endpoint authorizations per cluster has exceeded its limit.
      struct EndpointAuthorizationsPerClusterLimitExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The endpoint name doesn't refer to an existing endpoint.
      struct EndpointNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The number of Redshift-managed VPC endpoints per authorization has exceeded its limit.
      struct EndpointsPerAuthorizationLimitExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The number of Redshift-managed VPC endpoints per cluster has exceeded its limit.
      struct EndpointsPerClusterLimitExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an event.
      struct Event
        include JSON::Serializable

        # The date and time of the event.
        @[JSON::Field(key: "Date")]
        getter date : Time?

        # A list of the event categories. Values: Configuration, Management, Monitoring, Security, Pending
        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The identifier of the event.
        @[JSON::Field(key: "EventId")]
        getter event_id : String?

        # The text of this event.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The severity of the event. Values: ERROR, INFO
        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The identifier for the source of the event.
        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        # The source type for this event.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @date : Time? = nil,
          @event_categories : Array(String)? = nil,
          @event_id : String? = nil,
          @message : String? = nil,
          @severity : String? = nil,
          @source_identifier : String? = nil,
          @source_type : String? = nil
        )
        end
      end

      # Describes event categories.
      struct EventCategoriesMap
        include JSON::Serializable

        # The events in the event category.
        @[JSON::Field(key: "Events")]
        getter events : Array(Types::EventInfoMap)?

        # The source type, such as cluster or cluster-snapshot, that the returned categories belong to.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @events : Array(Types::EventInfoMap)? = nil,
          @source_type : String? = nil
        )
        end
      end

      struct EventCategoriesMessage
        include JSON::Serializable

        # A list of event categories descriptions.
        @[JSON::Field(key: "EventCategoriesMapList")]
        getter event_categories_map_list : Array(Types::EventCategoriesMap)?

        def initialize(
          @event_categories_map_list : Array(Types::EventCategoriesMap)? = nil
        )
        end
      end

      # Describes event information.
      struct EventInfoMap
        include JSON::Serializable

        # The category of an Amazon Redshift event.
        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The description of an Amazon Redshift event.
        @[JSON::Field(key: "EventDescription")]
        getter event_description : String?

        # The identifier of an Amazon Redshift event.
        @[JSON::Field(key: "EventId")]
        getter event_id : String?

        # The severity of the event. Values: ERROR, INFO
        @[JSON::Field(key: "Severity")]
        getter severity : String?

        def initialize(
          @event_categories : Array(String)? = nil,
          @event_description : String? = nil,
          @event_id : String? = nil,
          @severity : String? = nil
        )
        end
      end

      # Describes event subscriptions.
      struct EventSubscription
        include JSON::Serializable

        # The name of the Amazon Redshift event notification subscription.
        @[JSON::Field(key: "CustSubscriptionId")]
        getter cust_subscription_id : String?

        # The Amazon Web Services account associated with the Amazon Redshift event notification subscription.
        @[JSON::Field(key: "CustomerAwsId")]
        getter customer_aws_id : String?

        # A boolean value indicating whether the subscription is enabled; true indicates that the subscription
        # is enabled.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The list of Amazon Redshift event categories specified in the event notification subscription.
        # Values: Configuration, Management, Monitoring, Security, Pending
        @[JSON::Field(key: "EventCategoriesList")]
        getter event_categories_list : Array(String)?

        # The event severity specified in the Amazon Redshift event notification subscription. Values: ERROR,
        # INFO
        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The Amazon Resource Name (ARN) of the Amazon SNS topic used by the event notification subscription.
        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # A list of the sources that publish events to the Amazon Redshift event notification subscription.
        @[JSON::Field(key: "SourceIdsList")]
        getter source_ids_list : Array(String)?

        # The source type of the events returned by the Amazon Redshift event notification, such as cluster,
        # cluster-snapshot, cluster-parameter-group, cluster-security-group, or scheduled-action.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The status of the Amazon Redshift event notification subscription. Constraints: Can be one of the
        # following: active | no-permission | topic-not-exist The status "no-permission" indicates that Amazon
        # Redshift no longer has permission to post to the Amazon SNS topic. The status "topic-not-exist"
        # indicates that the topic was deleted after the subscription was created.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date and time the Amazon Redshift event notification subscription was created.
        @[JSON::Field(key: "SubscriptionCreationTime")]
        getter subscription_creation_time : Time?

        # The list of tags for the event subscription.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cust_subscription_id : String? = nil,
          @customer_aws_id : String? = nil,
          @enabled : Bool? = nil,
          @event_categories_list : Array(String)? = nil,
          @severity : String? = nil,
          @sns_topic_arn : String? = nil,
          @source_ids_list : Array(String)? = nil,
          @source_type : String? = nil,
          @status : String? = nil,
          @subscription_creation_time : Time? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The request would exceed the allowed number of event subscriptions for this account. For information
      # about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift Cluster
      # Management Guide .
      struct EventSubscriptionQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      struct EventSubscriptionsMessage
        include JSON::Serializable

        # A list of event subscriptions.
        @[JSON::Field(key: "EventSubscriptionsList")]
        getter event_subscriptions_list : Array(Types::EventSubscription)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @event_subscriptions_list : Array(Types::EventSubscription)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct EventsMessage
        include JSON::Serializable

        # A list of Event instances.
        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct FailoverPrimaryComputeInputMessage
        include JSON::Serializable

        # The unique identifier of the cluster for which the primary compute unit will be failed over to
        # another Availability Zone.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct FailoverPrimaryComputeResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # The request parameters to get cluster credentials.
      struct GetClusterCredentialsMessage
        include JSON::Serializable

        # The name of a database user. If a user name matching DbUser exists in the database, the temporary
        # user credentials have the same permissions as the existing user. If DbUser doesn't exist in the
        # database and Autocreate is True , a new user is created using the value for DbUser with PUBLIC
        # permissions. If a database user matching the value for DbUser doesn't exist and Autocreate is False
        # , then the command succeeds but the connection attempt will fail because the user doesn't exist in
        # the database. For more information, see CREATE USER in the Amazon Redshift Database Developer Guide.
        # Constraints: Must be 1 to 64 alphanumeric characters or hyphens. The user name can't be PUBLIC .
        # Must contain uppercase or lowercase letters, numbers, underscore, plus sign, period (dot), at symbol
        # (@), or hyphen. First character must be a letter. Must not contain a colon ( : ) or slash ( / ).
        # Cannot be a reserved word. A list of reserved words can be found in Reserved Words in the Amazon
        # Redshift Database Developer Guide.
        @[JSON::Field(key: "DbUser")]
        getter db_user : String

        # Create a database user with the name specified for the user named in DbUser if one does not exist.
        @[JSON::Field(key: "AutoCreate")]
        getter auto_create : Bool?

        # The unique identifier of the cluster that contains the database for which you are requesting
        # credentials. This parameter is case sensitive.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The custom domain name for the cluster credentials.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String?

        # A list of the names of existing database groups that the user named in DbUser will join for the
        # current session, in addition to any group memberships for an existing user. If not specified, a new
        # user is added only to PUBLIC. Database group name constraints Must be 1 to 64 alphanumeric
        # characters or hyphens Must contain only lowercase letters, numbers, underscore, plus sign, period
        # (dot), at symbol (@), or hyphen. First character must be a letter. Must not contain a colon ( : ) or
        # slash ( / ). Cannot be a reserved word. A list of reserved words can be found in Reserved Words in
        # the Amazon Redshift Database Developer Guide.
        @[JSON::Field(key: "DbGroups")]
        getter db_groups : Array(String)?

        # The name of a database that DbUser is authorized to log on to. If DbName is not specified, DbUser
        # can log on to any existing database. Constraints: Must be 1 to 64 alphanumeric characters or hyphens
        # Must contain uppercase or lowercase letters, numbers, underscore, plus sign, period (dot), at symbol
        # (@), or hyphen. First character must be a letter. Must not contain a colon ( : ) or slash ( / ).
        # Cannot be a reserved word. A list of reserved words can be found in Reserved Words in the Amazon
        # Redshift Database Developer Guide.
        @[JSON::Field(key: "DbName")]
        getter db_name : String?

        # The number of seconds until the returned temporary password expires. Constraint: minimum 900,
        # maximum 3600. Default: 900
        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Int32?

        def initialize(
          @db_user : String,
          @auto_create : Bool? = nil,
          @cluster_identifier : String? = nil,
          @custom_domain_name : String? = nil,
          @db_groups : Array(String)? = nil,
          @db_name : String? = nil,
          @duration_seconds : Int32? = nil
        )
        end
      end

      struct GetClusterCredentialsWithIAMMessage
        include JSON::Serializable

        # The unique identifier of the cluster that contains the database for which you are requesting
        # credentials.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The custom domain name for the IAM message cluster credentials.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String?

        # The name of the database for which you are requesting credentials. If the database name is
        # specified, the IAM policy must allow access to the resource dbname for the specified database name.
        # If the database name is not specified, access to all databases is allowed.
        @[JSON::Field(key: "DbName")]
        getter db_name : String?

        # The number of seconds until the returned temporary password expires. Range: 900-3600. Default: 900.
        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Int32?

        def initialize(
          @cluster_identifier : String? = nil,
          @custom_domain_name : String? = nil,
          @db_name : String? = nil,
          @duration_seconds : Int32? = nil
        )
        end
      end

      # The request parameters for GetIdentityCenterAuthToken .
      struct GetIdentityCenterAuthTokenRequest
        include JSON::Serializable

        # A list of cluster identifiers that the generated token can be used with. The token will be scoped to
        # only allow authentication to the specified clusters. Constraints: ClusterIds must contain at least 1
        # cluster identifier. ClusterIds can hold a maximum of 20 cluster identifiers. Cluster identifiers
        # must be 1 to 63 characters in length. The characters accepted for cluster identifiers are the
        # following: Alphanumeric characters Hyphens Cluster identifiers must start with a letter. Cluster
        # identifiers can't end with a hyphen or contain two consecutive hyphens.
        @[JSON::Field(key: "ClusterIds")]
        getter cluster_ids : Array(String)

        def initialize(
          @cluster_ids : Array(String)
        )
        end
      end

      # The response from GetIdentityCenterAuthToken containing the encrypted authentication token and
      # expiration time.
      struct GetIdentityCenterAuthTokenResponse
        include JSON::Serializable

        # The time (UTC) when the token expires. After this timestamp, the token will no longer be valid for
        # authentication.
        @[JSON::Field(key: "ExpirationTime")]
        getter expiration_time : Time?

        # The encrypted authentication token containing the caller's Amazon Web Services IAM Identity Center
        # identity information. This token is encrypted using Key Management Service and can only be decrypted
        # by the specified Amazon Redshift clusters. Use this token with Amazon Redshift drivers to
        # authenticate using your Amazon Web Services IAM Identity Center identity.
        @[JSON::Field(key: "Token")]
        getter token : String?

        def initialize(
          @expiration_time : Time? = nil,
          @token : String? = nil
        )
        end
      end

      struct GetReservedNodeExchangeConfigurationOptionsInputMessage
        include JSON::Serializable

        # The action type of the reserved-node configuration. The action type can be an exchange initiated
        # from either a snapshot or a resize.
        @[JSON::Field(key: "ActionType")]
        getter action_type : String

        # The identifier for the cluster that is the source for a reserved-node exchange.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # An optional pagination token provided by a previous GetReservedNodeExchangeConfigurationOptions
        # request. If this parameter is specified, the response includes only records beyond the marker, up to
        # the value specified by the MaxRecords parameter. You can retrieve the next set of response records
        # by providing the returned marker value in the Marker parameter and retrying the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a Marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The identifier for the snapshot that is the source for the reserved-node exchange.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String?

        def initialize(
          @action_type : String,
          @cluster_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @snapshot_identifier : String? = nil
        )
        end
      end

      struct GetReservedNodeExchangeConfigurationOptionsOutputMessage
        include JSON::Serializable

        # A pagination token provided by a previous GetReservedNodeExchangeConfigurationOptions request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # the configuration options for the reserved-node exchange. These options include information about
        # the source reserved node and target reserved node. Details include the node type, the price, the
        # node count, and the offering type.
        @[JSON::Field(key: "ReservedNodeConfigurationOptionList")]
        getter reserved_node_configuration_option_list : Array(Types::ReservedNodeConfigurationOption)?

        def initialize(
          @marker : String? = nil,
          @reserved_node_configuration_option_list : Array(Types::ReservedNodeConfigurationOption)? = nil
        )
        end
      end

      struct GetReservedNodeExchangeOfferingsInputMessage
        include JSON::Serializable

        # A string representing the node identifier for the DC1 Reserved Node to be exchanged.
        @[JSON::Field(key: "ReservedNodeId")]
        getter reserved_node_id : String

        # A value that indicates the starting point for the next set of ReservedNodeOfferings.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An integer setting the maximum number of ReservedNodeOfferings to retrieve.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @reserved_node_id : String,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct GetReservedNodeExchangeOfferingsOutputMessage
        include JSON::Serializable

        # An optional parameter that specifies the starting point for returning a set of response records.
        # When the results of a GetReservedNodeExchangeOfferings request exceed the value specified in
        # MaxRecords, Amazon Redshift returns a value in the marker field of the response. You can retrieve
        # the next set of response records by providing the returned marker value in the marker parameter and
        # retrying the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Returns an array of ReservedNodeOffering objects.
        @[JSON::Field(key: "ReservedNodeOfferings")]
        getter reserved_node_offerings : Array(Types::ReservedNodeOffering)?

        def initialize(
          @marker : String? = nil,
          @reserved_node_offerings : Array(Types::ReservedNodeOffering)? = nil
        )
        end
      end

      struct GetResourcePolicyMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource of which its resource policy is fetched.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetResourcePolicyResult
        include JSON::Serializable

        # The content of the resource policy.
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : Types::ResourcePolicy?

        def initialize(
          @resource_policy : Types::ResourcePolicy? = nil
        )
        end
      end

      # Returns information about an HSM client certificate. The certificate is stored in a secure Hardware
      # Storage Module (HSM), and used by the Amazon Redshift cluster to encrypt data files.
      struct HsmClientCertificate
        include JSON::Serializable

        # The identifier of the HSM client certificate.
        @[JSON::Field(key: "HsmClientCertificateIdentifier")]
        getter hsm_client_certificate_identifier : String?

        # The public key that the Amazon Redshift cluster will use to connect to the HSM. You must register
        # the public key in the HSM.
        @[JSON::Field(key: "HsmClientCertificatePublicKey")]
        getter hsm_client_certificate_public_key : String?

        # The list of tags for the HSM client certificate.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @hsm_client_certificate_identifier : String? = nil,
          @hsm_client_certificate_public_key : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # There is already an existing Amazon Redshift HSM client certificate with the specified identifier.
      struct HsmClientCertificateAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      struct HsmClientCertificateMessage
        include JSON::Serializable

        # A list of the identifiers for one or more HSM client certificates used by Amazon Redshift clusters
        # to store and retrieve database encryption keys in an HSM.
        @[JSON::Field(key: "HsmClientCertificates")]
        getter hsm_client_certificates : Array(Types::HsmClientCertificate)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @hsm_client_certificates : Array(Types::HsmClientCertificate)? = nil,
          @marker : String? = nil
        )
        end
      end

      # There is no Amazon Redshift HSM client certificate with the specified identifier.
      struct HsmClientCertificateNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The quota for HSM client certificates has been reached. For information about increasing your quota,
      # go to Limits in Amazon Redshift in the Amazon Redshift Cluster Management Guide .
      struct HsmClientCertificateQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about an HSM configuration, which is an object that describes to Amazon Redshift
      # clusters the information they require to connect to an HSM where they can store database encryption
      # keys.
      struct HsmConfiguration
        include JSON::Serializable

        # A text description of the HSM configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the Amazon Redshift HSM configuration.
        @[JSON::Field(key: "HsmConfigurationIdentifier")]
        getter hsm_configuration_identifier : String?

        # The IP address that the Amazon Redshift cluster must use to access the HSM.
        @[JSON::Field(key: "HsmIpAddress")]
        getter hsm_ip_address : String?

        # The name of the partition in the HSM where the Amazon Redshift clusters will store their database
        # encryption keys.
        @[JSON::Field(key: "HsmPartitionName")]
        getter hsm_partition_name : String?

        # The list of tags for the HSM configuration.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @description : String? = nil,
          @hsm_configuration_identifier : String? = nil,
          @hsm_ip_address : String? = nil,
          @hsm_partition_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # There is already an existing Amazon Redshift HSM configuration with the specified identifier.
      struct HsmConfigurationAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      struct HsmConfigurationMessage
        include JSON::Serializable

        # A list of HsmConfiguration objects.
        @[JSON::Field(key: "HsmConfigurations")]
        getter hsm_configurations : Array(Types::HsmConfiguration)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @hsm_configurations : Array(Types::HsmConfiguration)? = nil,
          @marker : String? = nil
        )
        end
      end

      # There is no Amazon Redshift HSM configuration with the specified identifier.
      struct HsmConfigurationNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The quota for HSM configurations has been reached. For information about increasing your quota, go
      # to Limits in Amazon Redshift in the Amazon Redshift Cluster Management Guide .
      struct HsmConfigurationQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the status of changes to HSM settings.
      struct HsmStatus
        include JSON::Serializable

        # Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to retrieve the
        # data encryption keys stored in an HSM.
        @[JSON::Field(key: "HsmClientCertificateIdentifier")]
        getter hsm_client_certificate_identifier : String?

        # Specifies the name of the HSM configuration that contains the information the Amazon Redshift
        # cluster can use to retrieve and store keys in an HSM.
        @[JSON::Field(key: "HsmConfigurationIdentifier")]
        getter hsm_configuration_identifier : String?

        # Reports whether the Amazon Redshift cluster has finished applying any HSM settings changes specified
        # in a modify cluster command. Values: active, applying
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @hsm_client_certificate_identifier : String? = nil,
          @hsm_configuration_identifier : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes an IP range used in a security group.
      struct IPRange
        include JSON::Serializable

        # The IP range in Classless Inter-Domain Routing (CIDR) notation.
        @[JSON::Field(key: "CIDRIP")]
        getter cidrip : String?

        # The status of the IP range, for example, "authorized".
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The list of tags for the IP range.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cidrip : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # You have exceeded the allowed number of table restore requests. Wait for your current table restore
      # requests to complete before making a new request.
      struct InProgressTableRestoreQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The content of an inbound integration.
      struct InboundIntegration
        include JSON::Serializable

        # The creation time of an inbound integration.
        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time?

        # The outstanding errors of an inbound integration. Each item is an "IntegrationError". This is null
        # if there is no error.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::IntegrationError)?

        # The Amazon Resource Name (ARN) of an inbound integration.
        @[JSON::Field(key: "IntegrationArn")]
        getter integration_arn : String?

        # The Amazon Resource Name (ARN) of the source of an inbound integration.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # The status of an inbound integration.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the target of an inbound integration.
        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String?

        def initialize(
          @create_time : Time? = nil,
          @errors : Array(Types::IntegrationError)? = nil,
          @integration_arn : String? = nil,
          @source_arn : String? = nil,
          @status : String? = nil,
          @target_arn : String? = nil
        )
        end
      end

      struct InboundIntegrationsMessage
        include JSON::Serializable

        # A list of InboundIntegration instances.
        @[JSON::Field(key: "InboundIntegrations")]
        getter inbound_integrations : Array(Types::InboundIntegration)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @inbound_integrations : Array(Types::InboundIntegration)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The specified options are incompatible.
      struct IncompatibleOrderableOptions
        include JSON::Serializable

        def initialize
        end
      end

      # The number of nodes specified exceeds the allotted capacity of the cluster.
      struct InsufficientClusterCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster does not have read bucket or put object permissions on the S3 bucket specified when
      # enabling logging.
      struct InsufficientS3BucketPolicyFault
        include JSON::Serializable

        def initialize
        end
      end

      struct Integration
        include JSON::Serializable

        # The encryption context for the integration. For more information, see Encryption context in the
        # Amazon Web Services Key Management Service Developer Guide .
        @[JSON::Field(key: "AdditionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # The time (UTC) when the integration was created.
        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time?

        # The description of the integration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Any errors associated with the integration.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::IntegrationError)?

        # The Amazon Resource Name (ARN) of the integration.
        @[JSON::Field(key: "IntegrationArn")]
        getter integration_arn : String?

        # The name of the integration.
        @[JSON::Field(key: "IntegrationName")]
        getter integration_name : String?

        # The Key Management Service (KMS) key identifier for the key used to encrypt the integration.
        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        # The Amazon Resource Name (ARN) of the database used as the source for replication.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # The current status of the integration.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The list of tags associated with the integration.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon Resource Name (ARN) of the Amazon Redshift data warehouse to use as the target for
        # replication.
        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String?

        def initialize(
          @additional_encryption_context : Hash(String, String)? = nil,
          @create_time : Time? = nil,
          @description : String? = nil,
          @errors : Array(Types::IntegrationError)? = nil,
          @integration_arn : String? = nil,
          @integration_name : String? = nil,
          @kms_key_id : String? = nil,
          @source_arn : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_arn : String? = nil
        )
        end
      end

      # The integration you are trying to create already exists.
      struct IntegrationAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # A conflicting conditional operation is currently in progress against this resource. This typically
      # occurs when there are multiple requests being made to the same resource at the same time, and these
      # requests conflict with each other.
      struct IntegrationConflictOperationFault
        include JSON::Serializable

        def initialize
        end
      end

      # The integration is in an invalid state and can't perform the requested operation.
      struct IntegrationConflictStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The error of an inbound integration.
      struct IntegrationError
        include JSON::Serializable

        # The error code of an inbound integration error.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        # The error message of an inbound integration error.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String,
          @error_message : String? = nil
        )
        end
      end

      # The integration can't be found.
      struct IntegrationNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # You can't create any more zero-ETL or S3 event integrations because the quota has been reached.
      struct IntegrationQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified integration source can't be found.
      struct IntegrationSourceNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified integration target can't be found.
      struct IntegrationTargetNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      struct IntegrationsMessage
        include JSON::Serializable

        # List of integrations that are described.
        @[JSON::Field(key: "Integrations")]
        getter integrations : Array(Types::Integration)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @integrations : Array(Types::Integration)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The authentication profile request is not valid. The profile name can't be null or empty. The
      # authentication profile API operation must be available in the Amazon Web Services Region.
      struct InvalidAuthenticationProfileRequestFault
        include JSON::Serializable

        def initialize
        end
      end

      # The status of the authorization is not valid.
      struct InvalidAuthorizationStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster parameter group action can not be completed because another task is in progress that
      # involves the parameter group. Wait a few moments and try the operation again.
      struct InvalidClusterParameterGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The state of the cluster security group is not available .
      struct InvalidClusterSecurityGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster snapshot schedule state is not valid.
      struct InvalidClusterSnapshotScheduleStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified cluster snapshot is not in the available state, or other accounts are authorized to
      # access the snapshot.
      struct InvalidClusterSnapshotStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified cluster is not in the available state.
      struct InvalidClusterStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster subnet group cannot be deleted because it is in use.
      struct InvalidClusterSubnetGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The state of the subnet is invalid.
      struct InvalidClusterSubnetStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The provided cluster track name is not valid.
      struct InvalidClusterTrackFault
        include JSON::Serializable

        def initialize
        end
      end

      # There is an error with the datashare.
      struct InvalidDataShareFault
        include JSON::Serializable

        def initialize
        end
      end

      # The Elastic IP (EIP) is invalid or cannot be found.
      struct InvalidElasticIpFault
        include JSON::Serializable

        def initialize
        end
      end

      # The status of the endpoint is not valid.
      struct InvalidEndpointStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified HSM client certificate is not in the available state, or it is still in use by one or
      # more Amazon Redshift clusters.
      struct InvalidHsmClientCertificateStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified HSM configuration is not in the available state, or it is still in use by one or more
      # Amazon Redshift clusters.
      struct InvalidHsmConfigurationStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The namespace isn't valid because the namespace doesn't exist. Provide a valid namespace.
      struct InvalidNamespaceFault
        include JSON::Serializable

        def initialize
        end
      end

      # The resource policy isn't valid.
      struct InvalidPolicyFault
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that the Reserved Node being exchanged is not in an active state.
      struct InvalidReservedNodeStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The restore is invalid.
      struct InvalidRestoreFault
        include JSON::Serializable

        def initialize
        end
      end

      # The retention period specified is either in the past or is not a valid value. The value must be
      # either -1 or an integer between 1 and 3,653.
      struct InvalidRetentionPeriodFault
        include JSON::Serializable

        def initialize
        end
      end

      # The S3 bucket name is invalid. For more information about naming rules, go to Bucket Restrictions
      # and Limitations in the Amazon Simple Storage Service (S3) Developer Guide.
      struct InvalidS3BucketNameFault
        include JSON::Serializable

        def initialize
        end
      end

      # The string specified for the logging S3 key prefix does not comply with the documented constraints.
      struct InvalidS3KeyPrefixFault
        include JSON::Serializable

        def initialize
        end
      end

      # The schedule you submitted isn't valid.
      struct InvalidScheduleFault
        include JSON::Serializable

        def initialize
        end
      end

      # The scheduled action is not valid.
      struct InvalidScheduledActionFault
        include JSON::Serializable

        def initialize
        end
      end

      # The snapshot copy grant can't be deleted because it is used by one or more clusters.
      struct InvalidSnapshotCopyGrantStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested subnet is not valid, or not all of the subnets are in the same VPC.
      struct InvalidSubnet
        include JSON::Serializable

        def initialize
        end
      end

      # The subscription request is invalid because it is a duplicate request. This subscription request is
      # already in progress.
      struct InvalidSubscriptionStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The value specified for the sourceDatabaseName , sourceSchemaName , or sourceTableName parameter, or
      # a combination of these, doesn't exist in the snapshot.
      struct InvalidTableRestoreArgumentFault
        include JSON::Serializable

        def initialize
        end
      end

      # The tag is invalid.
      struct InvalidTagFault
        include JSON::Serializable

        def initialize
        end
      end

      # The usage limit is not valid.
      struct InvalidUsageLimitFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster subnet group does not cover all Availability Zones.
      struct InvalidVPCNetworkStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # There are no subnets in your VPC with associated IPv6 CIDR blocks. To use dual-stack mode, associate
      # an IPv6 CIDR block with each subnet in your VPC.
      struct Ipv6CidrBlockNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The Lake Formation scope.
      struct LakeFormationQuery
        include JSON::Serializable

        # Determines whether the query scope is enabled or disabled.
        @[JSON::Field(key: "Authorization")]
        getter authorization : String

        def initialize(
          @authorization : String
        )
        end
      end

      # A list of scopes set up for Lake Formation integration.
      struct LakeFormationScopeUnion
        include JSON::Serializable

        # The Lake Formation scope.
        @[JSON::Field(key: "LakeFormationQuery")]
        getter lake_formation_query : Types::LakeFormationQuery?

        def initialize(
          @lake_formation_query : Types::LakeFormationQuery? = nil
        )
        end
      end

      # Contains configuration information for lakehouse integration, including the cluster identifier,
      # catalog ARN, and registration status.
      struct LakehouseConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Glue data catalog associated with the lakehouse configuration.
        @[JSON::Field(key: "CatalogArn")]
        getter catalog_arn : String?

        # The unique identifier of the cluster associated with this lakehouse configuration.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling Amazon Web
        # Services IAM Identity Center trusted identity propagation on a cluster enabled with Amazon Redshift
        # federated permissions.
        @[JSON::Field(key: "LakehouseIdcApplicationArn")]
        getter lakehouse_idc_application_arn : String?

        # The current status of the lakehouse registration. Indicates whether the cluster is successfully
        # registered with the lakehouse.
        @[JSON::Field(key: "LakehouseRegistrationStatus")]
        getter lakehouse_registration_status : String?

        def initialize(
          @catalog_arn : String? = nil,
          @cluster_identifier : String? = nil,
          @lakehouse_idc_application_arn : String? = nil,
          @lakehouse_registration_status : String? = nil
        )
        end
      end

      # The encryption key has exceeded its grant limit in Amazon Web Services KMS.
      struct LimitExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      struct ListRecommendationsMessage
        include JSON::Serializable

        # The unique identifier of the Amazon Redshift cluster for which the list of Advisor recommendations
        # is returned. If the neither the cluster identifier and the cluster namespace ARN parameters are
        # specified, then recommendations for all clusters in the account are returned.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The Amazon Redshift cluster namespace Amazon Resource Name (ARN) for which the list of Advisor
        # recommendations is returned. If the neither the cluster identifier and the cluster namespace ARN
        # parameters are specified, then recommendations for all clusters in the account are returned.
        @[JSON::Field(key: "NamespaceArn")]
        getter namespace_arn : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @namespace_arn : String? = nil
        )
        end
      end

      struct ListRecommendationsResult
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The Advisor recommendations for action on the Amazon Redshift cluster.
        @[JSON::Field(key: "Recommendations")]
        getter recommendations : Array(Types::Recommendation)?

        def initialize(
          @marker : String? = nil,
          @recommendations : Array(Types::Recommendation)? = nil
        )
        end
      end

      # Describes the status of logging for a cluster.
      struct LoggingStatus
        include JSON::Serializable

        # The name of the S3 bucket where the log files are stored.
        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # The message indicating that logs failed to be delivered.
        @[JSON::Field(key: "LastFailureMessage")]
        getter last_failure_message : String?

        # The last time when logs failed to be delivered.
        @[JSON::Field(key: "LastFailureTime")]
        getter last_failure_time : Time?

        # The last time that logs were delivered.
        @[JSON::Field(key: "LastSuccessfulDeliveryTime")]
        getter last_successful_delivery_time : Time?

        # The log destination type. An enum with possible values of s3 and cloudwatch .
        @[JSON::Field(key: "LogDestinationType")]
        getter log_destination_type : String?

        # The collection of exported log types. Possible values are connectionlog , useractivitylog , and
        # userlog .
        @[JSON::Field(key: "LogExports")]
        getter log_exports : Array(String)?

        # true if logging is on, false if logging is off.
        @[JSON::Field(key: "LoggingEnabled")]
        getter logging_enabled : Bool?

        # The prefix applied to the log file names.
        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @last_failure_message : String? = nil,
          @last_failure_time : Time? = nil,
          @last_successful_delivery_time : Time? = nil,
          @log_destination_type : String? = nil,
          @log_exports : Array(String)? = nil,
          @logging_enabled : Bool? = nil,
          @s3_key_prefix : String? = nil
        )
        end
      end

      # Defines a maintenance track that determines which Amazon Redshift version to apply during a
      # maintenance window. If the value for MaintenanceTrack is current , the cluster is updated to the
      # most recently certified maintenance release. If the value is trailing , the cluster is updated to
      # the previously certified maintenance release.
      struct MaintenanceTrack
        include JSON::Serializable

        # The version number for the cluster release.
        @[JSON::Field(key: "DatabaseVersion")]
        getter database_version : String?

        # The name of the maintenance track. Possible values are current and trailing .
        @[JSON::Field(key: "MaintenanceTrackName")]
        getter maintenance_track_name : String?

        # An array of UpdateTarget objects to update with the maintenance track.
        @[JSON::Field(key: "UpdateTargets")]
        getter update_targets : Array(Types::UpdateTarget)?

        def initialize(
          @database_version : String? = nil,
          @maintenance_track_name : String? = nil,
          @update_targets : Array(Types::UpdateTarget)? = nil
        )
        end
      end

      struct ModifyAquaInputMessage
        include JSON::Serializable

        # The identifier of the cluster to be modified.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # This parameter is retired. Amazon Redshift automatically determines whether to use AQUA (Advanced
        # Query Accelerator).
        @[JSON::Field(key: "AquaConfigurationStatus")]
        getter aqua_configuration_status : String?

        def initialize(
          @cluster_identifier : String,
          @aqua_configuration_status : String? = nil
        )
        end
      end

      struct ModifyAquaOutputMessage
        include JSON::Serializable

        # This parameter is retired. Amazon Redshift automatically determines whether to use AQUA (Advanced
        # Query Accelerator).
        @[JSON::Field(key: "AquaConfiguration")]
        getter aqua_configuration : Types::AquaConfiguration?

        def initialize(
          @aqua_configuration : Types::AquaConfiguration? = nil
        )
        end
      end

      struct ModifyAuthenticationProfileMessage
        include JSON::Serializable

        # The new content of the authentication profile in JSON format. The maximum length of the JSON string
        # is determined by a quota for your account.
        @[JSON::Field(key: "AuthenticationProfileContent")]
        getter authentication_profile_content : String

        # The name of the authentication profile to replace.
        @[JSON::Field(key: "AuthenticationProfileName")]
        getter authentication_profile_name : String

        def initialize(
          @authentication_profile_content : String,
          @authentication_profile_name : String
        )
        end
      end

      struct ModifyAuthenticationProfileResult
        include JSON::Serializable

        # The updated content of the authentication profile in JSON format.
        @[JSON::Field(key: "AuthenticationProfileContent")]
        getter authentication_profile_content : String?

        # The name of the authentication profile that was replaced.
        @[JSON::Field(key: "AuthenticationProfileName")]
        getter authentication_profile_name : String?

        def initialize(
          @authentication_profile_content : String? = nil,
          @authentication_profile_name : String? = nil
        )
        end
      end

      struct ModifyClusterDbRevisionMessage
        include JSON::Serializable

        # The unique identifier of a cluster whose database revision you want to modify. Example:
        # examplecluster
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The identifier of the database revision. You can retrieve this value from the response to the
        # DescribeClusterDbRevisions request.
        @[JSON::Field(key: "RevisionTarget")]
        getter revision_target : String

        def initialize(
          @cluster_identifier : String,
          @revision_target : String
        )
        end
      end

      struct ModifyClusterDbRevisionResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct ModifyClusterIamRolesMessage
        include JSON::Serializable

        # The unique identifier of the cluster for which you want to associate or disassociate IAM roles.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # Zero or more IAM roles to associate with the cluster. The roles must be in their Amazon Resource
        # Name (ARN) format.
        @[JSON::Field(key: "AddIamRoles")]
        getter add_iam_roles : Array(String)?

        # The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster when the
        # cluster was last modified.
        @[JSON::Field(key: "DefaultIamRoleArn")]
        getter default_iam_role_arn : String?

        # Zero or more IAM roles in ARN format to disassociate from the cluster.
        @[JSON::Field(key: "RemoveIamRoles")]
        getter remove_iam_roles : Array(String)?

        def initialize(
          @cluster_identifier : String,
          @add_iam_roles : Array(String)? = nil,
          @default_iam_role_arn : String? = nil,
          @remove_iam_roles : Array(String)? = nil
        )
        end
      end

      struct ModifyClusterIamRolesResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct ModifyClusterMaintenanceMessage
        include JSON::Serializable

        # A unique identifier for the cluster.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # A boolean indicating whether to enable the deferred maintenance window.
        @[JSON::Field(key: "DeferMaintenance")]
        getter defer_maintenance : Bool?

        # An integer indicating the duration of the maintenance window in days. If you specify a duration, you
        # can't specify an end time. The duration must be 45 days or less.
        @[JSON::Field(key: "DeferMaintenanceDuration")]
        getter defer_maintenance_duration : Int32?

        # A timestamp indicating end time for the deferred maintenance window. If you specify an end time, you
        # can't specify a duration.
        @[JSON::Field(key: "DeferMaintenanceEndTime")]
        getter defer_maintenance_end_time : Time?

        # A unique identifier for the deferred maintenance window.
        @[JSON::Field(key: "DeferMaintenanceIdentifier")]
        getter defer_maintenance_identifier : String?

        # A timestamp indicating the start time for the deferred maintenance window.
        @[JSON::Field(key: "DeferMaintenanceStartTime")]
        getter defer_maintenance_start_time : Time?

        def initialize(
          @cluster_identifier : String,
          @defer_maintenance : Bool? = nil,
          @defer_maintenance_duration : Int32? = nil,
          @defer_maintenance_end_time : Time? = nil,
          @defer_maintenance_identifier : String? = nil,
          @defer_maintenance_start_time : Time? = nil
        )
        end
      end

      struct ModifyClusterMaintenanceResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct ModifyClusterMessage
        include JSON::Serializable

        # The unique identifier of the cluster to be modified. Example: examplecluster
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # If true , major version upgrades will be applied automatically to the cluster during the maintenance
        # window. Default: false
        @[JSON::Field(key: "AllowVersionUpgrade")]
        getter allow_version_upgrade : Bool?

        # The number of days that automated snapshots are retained. If the value is 0, automated snapshots are
        # disabled. Even if automated snapshots are disabled, you can still create manual snapshots when you
        # want with CreateClusterSnapshot . If you decrease the automated snapshot retention period from its
        # current value, existing automated snapshots that fall outside of the new retention period will be
        # immediately deleted. You can't disable automated snapshots for RA3 node types. Set the automated
        # retention period from 1-35 days. Default: Uses existing setting. Constraints: Must be a value from 0
        # to 35.
        @[JSON::Field(key: "AutomatedSnapshotRetentionPeriod")]
        getter automated_snapshot_retention_period : Int32?

        # The option to initiate relocation for an Amazon Redshift cluster to the target Availability Zone.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The option to enable relocation for an Amazon Redshift cluster between Availability Zones after the
        # cluster modification is complete.
        @[JSON::Field(key: "AvailabilityZoneRelocation")]
        getter availability_zone_relocation : Bool?

        # The name of the cluster parameter group to apply to this cluster. This change is applied only after
        # the cluster is rebooted. To reboot a cluster use RebootCluster . Default: Uses existing setting.
        # Constraints: The cluster parameter group must be in the same parameter group family that matches the
        # cluster version.
        @[JSON::Field(key: "ClusterParameterGroupName")]
        getter cluster_parameter_group_name : String?

        # A list of cluster security groups to be authorized on this cluster. This change is asynchronously
        # applied as soon as possible. Security groups currently associated with the cluster, and not in the
        # list of groups to apply, will be revoked from the cluster. Constraints: Must be 1 to 255
        # alphanumeric characters or hyphens First character must be a letter Cannot end with a hyphen or
        # contain two consecutive hyphens
        @[JSON::Field(key: "ClusterSecurityGroups")]
        getter cluster_security_groups : Array(String)?

        # The new cluster type. When you submit your cluster resize request, your existing cluster goes into a
        # read-only mode. After Amazon Redshift provisions a new cluster based on your resize requirements,
        # there will be outage for a period while the old cluster is deleted and your connection is switched
        # to the new cluster. You can use DescribeResize to track the progress of the resize request. Valid
        # Values: multi-node | single-node
        @[JSON::Field(key: "ClusterType")]
        getter cluster_type : String?

        # The new version number of the Amazon Redshift engine to upgrade to. For major version upgrades, if a
        # non-default cluster parameter group is currently in use, a new cluster parameter group in the
        # cluster parameter group family for the new version must be specified. The new cluster parameter
        # group can be the default for that cluster parameter group family. For more information about
        # parameters and parameter groups, go to Amazon Redshift Parameter Groups in the Amazon Redshift
        # Cluster Management Guide . Example: 1.0
        @[JSON::Field(key: "ClusterVersion")]
        getter cluster_version : String?

        # The Elastic IP (EIP) address for the cluster. Constraints: The cluster must be provisioned in
        # EC2-VPC and publicly-accessible through an Internet gateway. For more information about provisioning
        # clusters in EC2-VPC, go to Supported Platforms to Launch Your Cluster in the Amazon Redshift Cluster
        # Management Guide.
        @[JSON::Field(key: "ElasticIp")]
        getter elastic_ip : String?

        # Indicates whether the cluster is encrypted. If the value is encrypted (true) and you provide a value
        # for the KmsKeyId parameter, we encrypt the cluster with the provided KmsKeyId . If you don't provide
        # a KmsKeyId , we encrypt with the default key. If the value is not encrypted (false), then the
        # cluster is decrypted.
        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create
        # a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see
        # Enhanced VPC Routing in the Amazon Redshift Cluster Management Guide. If this option is true ,
        # enhanced VPC routing is enabled. Default: false
        @[JSON::Field(key: "EnhancedVpcRouting")]
        getter enhanced_vpc_routing : Bool?

        # If true , allocates additional compute resources for running automatic optimization operations.
        # Default: false
        @[JSON::Field(key: "ExtraComputeForAutomaticOptimization")]
        getter extra_compute_for_automatic_optimization : Bool?

        # Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to retrieve the
        # data encryption keys stored in an HSM.
        @[JSON::Field(key: "HsmClientCertificateIdentifier")]
        getter hsm_client_certificate_identifier : String?

        # Specifies the name of the HSM configuration that contains the information the Amazon Redshift
        # cluster can use to retrieve and store keys in an HSM.
        @[JSON::Field(key: "HsmConfigurationIdentifier")]
        getter hsm_configuration_identifier : String?

        # The IP address types that the cluster supports. Possible values are ipv4 and dualstack .
        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The Key Management Service (KMS) key ID of the encryption key that you want to use to encrypt data
        # in the cluster.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The name for the maintenance track that you want to assign for the cluster. This name change is
        # asynchronous. The new track name stays in the PendingModifiedValues for the cluster until the next
        # maintenance window. When the maintenance track changes, the cluster is switched to the latest
        # cluster release available for the maintenance track. At this point, the maintenance track name is
        # applied.
        @[JSON::Field(key: "MaintenanceTrackName")]
        getter maintenance_track_name : String?

        # If true , Amazon Redshift uses Secrets Manager to manage this cluster's admin credentials. You can't
        # use MasterUserPassword if ManageMasterPassword is true. If ManageMasterPassword is false or not set,
        # Amazon Redshift uses MasterUserPassword for the admin user account's password.
        @[JSON::Field(key: "ManageMasterPassword")]
        getter manage_master_password : Bool?

        # The default for number of days that a newly created manual snapshot is retained. If the value is -1,
        # the manual snapshot is retained indefinitely. This value doesn't retroactively change the retention
        # periods of existing manual snapshots. The value must be either -1 or an integer between 1 and 3,653.
        # The default value is -1.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        # The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's admin
        # credentials secret. You can only use this parameter if ManageMasterPassword is true.
        @[JSON::Field(key: "MasterPasswordSecretKmsKeyId")]
        getter master_password_secret_kms_key_id : String?

        # The new password for the cluster admin user. This change is asynchronously applied as soon as
        # possible. Between the time of the request and the completion of the request, the MasterUserPassword
        # element exists in the PendingModifiedValues element of the operation response. You can't use
        # MasterUserPassword if ManageMasterPassword is true . Operations never return the password, so this
        # operation provides a way to regain access to the admin user account for a cluster if the password is
        # lost. Default: Uses existing setting. Constraints: Must be between 8 and 64 characters in length.
        # Must contain at least one uppercase letter. Must contain at least one lowercase letter. Must contain
        # one number. Can be any printable ASCII character (ASCII code 33-126) except ' (single quote), "
        # (double quote), \ , / , or @ .
        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # If true and the cluster is currently only deployed in a single Availability Zone, the cluster will
        # be modified to be deployed in two Availability Zones.
        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The new identifier for the cluster. Constraints: Must contain from 1 to 63 alphanumeric characters
        # or hyphens. Alphabetic characters must be lowercase. First character must be a letter. Cannot end
        # with a hyphen or contain two consecutive hyphens. Must be unique for all clusters within an Amazon
        # Web Services account. Example: examplecluster
        @[JSON::Field(key: "NewClusterIdentifier")]
        getter new_cluster_identifier : String?

        # The new node type of the cluster. If you specify a new node type, you must also specify the number
        # of nodes parameter. For more information about resizing clusters, go to Resizing Clusters in Amazon
        # Redshift in the Amazon Redshift Cluster Management Guide . Valid Values: dc2.large | dc2.8xlarge |
        # ra3.large | ra3.xlplus | ra3.4xlarge | ra3.16xlarge
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The new number of nodes of the cluster. If you specify a new number of nodes, you must also specify
        # the node type parameter. For more information about resizing clusters, go to Resizing Clusters in
        # Amazon Redshift in the Amazon Redshift Cluster Management Guide . Valid Values: Integer greater than
        # 0 .
        @[JSON::Field(key: "NumberOfNodes")]
        getter number_of_nodes : Int32?

        # The option to change the port of an Amazon Redshift cluster. Valid Values: For clusters with ra3
        # nodes - Select a port within the ranges 5431-5455 or 8191-8215 . (If you have an existing cluster
        # with ra3 nodes, it isn't required that you change the port to these ranges.) For clusters with dc2
        # nodes - Select a port within the range 1150-65535 .
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The weekly time range (in UTC) during which system maintenance can occur, if necessary. If system
        # maintenance is necessary during the window, it may result in an outage. This maintenance window
        # change is made immediately. If the new maintenance window indicates the current time, there must be
        # at least 120 minutes between the current time and end of the window in order to ensure that pending
        # changes are applied. Default: Uses existing setting. Format: ddd:hh24:mi-ddd:hh24:mi, for example
        # wed:07:30-wed:08:00 . Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun Constraints: Must be at
        # least 30 minutes.
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # If true , the cluster can be accessed from a public network. Only clusters in VPCs can be set to be
        # publicly available. Default: false
        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # A list of virtual private cloud (VPC) security groups to be associated with the cluster. This change
        # is asynchronously applied as soon as possible.
        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @cluster_identifier : String,
          @allow_version_upgrade : Bool? = nil,
          @automated_snapshot_retention_period : Int32? = nil,
          @availability_zone : String? = nil,
          @availability_zone_relocation : Bool? = nil,
          @cluster_parameter_group_name : String? = nil,
          @cluster_security_groups : Array(String)? = nil,
          @cluster_type : String? = nil,
          @cluster_version : String? = nil,
          @elastic_ip : String? = nil,
          @encrypted : Bool? = nil,
          @enhanced_vpc_routing : Bool? = nil,
          @extra_compute_for_automatic_optimization : Bool? = nil,
          @hsm_client_certificate_identifier : String? = nil,
          @hsm_configuration_identifier : String? = nil,
          @ip_address_type : String? = nil,
          @kms_key_id : String? = nil,
          @maintenance_track_name : String? = nil,
          @manage_master_password : Bool? = nil,
          @manual_snapshot_retention_period : Int32? = nil,
          @master_password_secret_kms_key_id : String? = nil,
          @master_user_password : String? = nil,
          @multi_az : Bool? = nil,
          @new_cluster_identifier : String? = nil,
          @node_type : String? = nil,
          @number_of_nodes : Int32? = nil,
          @port : Int32? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      # Describes a modify cluster parameter group operation.
      struct ModifyClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the parameter group to be modified.
        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # An array of parameters to be modified. A maximum of 20 parameters can be modified in a single
        # request. For each parameter to be modified, you must supply at least the parameter name and
        # parameter value; other name-value pairs of the parameter are optional. For the workload management
        # (WLM) configuration, you must supply all the name-value pairs in the wlm_json_configuration
        # parameter.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)

        def initialize(
          @parameter_group_name : String,
          @parameters : Array(Types::Parameter)
        )
        end
      end

      struct ModifyClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct ModifyClusterSnapshotMessage
        include JSON::Serializable

        # The identifier of the snapshot whose setting you want to modify.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String

        # A Boolean option to override an exception if the retention period has already passed.
        @[JSON::Field(key: "Force")]
        getter force : Bool?

        # The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is
        # retained indefinitely. If the manual snapshot falls outside of the new retention period, you can
        # specify the force option to immediately delete the snapshot. The value must be either -1 or an
        # integer between 1 and 3,653.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        def initialize(
          @snapshot_identifier : String,
          @force : Bool? = nil,
          @manual_snapshot_retention_period : Int32? = nil
        )
        end
      end

      struct ModifyClusterSnapshotResult
        include JSON::Serializable

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct ModifyClusterSnapshotScheduleMessage
        include JSON::Serializable

        # A unique identifier for the cluster whose snapshot schedule you want to modify.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # A boolean to indicate whether to remove the assoiciation between the cluster and the schedule.
        @[JSON::Field(key: "DisassociateSchedule")]
        getter disassociate_schedule : Bool?

        # A unique alphanumeric identifier for the schedule that you want to associate with the cluster.
        @[JSON::Field(key: "ScheduleIdentifier")]
        getter schedule_identifier : String?

        def initialize(
          @cluster_identifier : String,
          @disassociate_schedule : Bool? = nil,
          @schedule_identifier : String? = nil
        )
        end
      end

      struct ModifyClusterSubnetGroupMessage
        include JSON::Serializable

        # The name of the subnet group to be modified.
        @[JSON::Field(key: "ClusterSubnetGroupName")]
        getter cluster_subnet_group_name : String

        # An array of VPC subnet IDs. A maximum of 20 subnets can be modified in a single request.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A text description of the subnet group to be modified.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @cluster_subnet_group_name : String,
          @subnet_ids : Array(String),
          @description : String? = nil
        )
        end
      end

      struct ModifyClusterSubnetGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "ClusterSubnetGroup")]
        getter cluster_subnet_group : Types::ClusterSubnetGroup?

        def initialize(
          @cluster_subnet_group : Types::ClusterSubnetGroup? = nil
        )
        end
      end

      struct ModifyCustomDomainAssociationMessage
        include JSON::Serializable

        # The identifier of the cluster to change a custom domain association for.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The certificate Amazon Resource Name (ARN) for the changed custom domain association.
        @[JSON::Field(key: "CustomDomainCertificateArn")]
        getter custom_domain_certificate_arn : String

        # The custom domain name for a changed custom domain association.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String

        def initialize(
          @cluster_identifier : String,
          @custom_domain_certificate_arn : String,
          @custom_domain_name : String
        )
        end
      end

      struct ModifyCustomDomainAssociationResult
        include JSON::Serializable

        # The identifier of the cluster associated with the result for the changed custom domain association.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The certificate expiration time associated with the result for the changed custom domain
        # association.
        @[JSON::Field(key: "CustomDomainCertExpiryTime")]
        getter custom_domain_cert_expiry_time : String?

        # The certificate Amazon Resource Name (ARN) associated with the result for the changed custom domain
        # association.
        @[JSON::Field(key: "CustomDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The custom domain name associated with the result for the changed custom domain association.
        @[JSON::Field(key: "CustomDomainName")]
        getter custom_domain_name : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @custom_domain_cert_expiry_time : String? = nil,
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_name : String? = nil
        )
        end
      end

      struct ModifyEndpointAccessMessage
        include JSON::Serializable

        # The endpoint to be modified.
        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        # The complete list of VPC security groups associated with the endpoint after the endpoint is
        # modified.
        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @endpoint_name : String,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      struct ModifyEventSubscriptionMessage
        include JSON::Serializable

        # The name of the modified Amazon Redshift event notification subscription.
        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        # A Boolean value indicating if the subscription is enabled. true indicates the subscription is
        # enabled
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies the Amazon Redshift event categories to be published by the event notification
        # subscription. Values: configuration, management, monitoring, security, pending
        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # Specifies the Amazon Redshift event severity to be published by the event notification subscription.
        # Values: ERROR, INFO
        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The Amazon Resource Name (ARN) of the SNS topic to be used by the event notification subscription.
        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # A list of one or more identifiers of Amazon Redshift source objects. All of the objects must be of
        # the same type as was specified in the source type parameter. The event subscription will return only
        # events generated by the specified objects. If not specified, then events are returned for all
        # objects within the source type specified. Example: my-cluster-1, my-cluster-2 Example:
        # my-snapshot-20131010
        @[JSON::Field(key: "SourceIds")]
        getter source_ids : Array(String)?

        # The type of source that will be generating the events. For example, if you want to be notified of
        # events generated by a cluster, you would set this parameter to cluster. If this value is not
        # specified, events are returned for all Amazon Redshift objects in your Amazon Web Services account.
        # You must specify a source type in order to specify source IDs. Valid values: cluster,
        # cluster-parameter-group, cluster-security-group, cluster-snapshot, and scheduled-action.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @subscription_name : String,
          @enabled : Bool? = nil,
          @event_categories : Array(String)? = nil,
          @severity : String? = nil,
          @sns_topic_arn : String? = nil,
          @source_ids : Array(String)? = nil,
          @source_type : String? = nil
        )
        end
      end

      struct ModifyEventSubscriptionResult
        include JSON::Serializable

        @[JSON::Field(key: "EventSubscription")]
        getter event_subscription : Types::EventSubscription?

        def initialize(
          @event_subscription : Types::EventSubscription? = nil
        )
        end
      end

      struct ModifyIntegrationMessage
        include JSON::Serializable

        # The unique identifier of the integration to modify.
        @[JSON::Field(key: "IntegrationArn")]
        getter integration_arn : String

        # A new description for the integration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A new name for the integration.
        @[JSON::Field(key: "IntegrationName")]
        getter integration_name : String?

        def initialize(
          @integration_arn : String,
          @description : String? = nil,
          @integration_name : String? = nil
        )
        end
      end

      struct ModifyLakehouseConfigurationMessage
        include JSON::Serializable

        # The unique identifier of the cluster whose lakehouse configuration you want to modify.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The name of the Glue data catalog that will be associated with the cluster enabled with Amazon
        # Redshift federated permissions. Constraints: Must contain at least one lowercase letter. Can only
        # contain lowercase letters (a-z), numbers (0-9), underscores (_), and hyphens (-). Pattern:
        # ^[a-z0-9_-]*[a-z]+[a-z0-9_-]*$ Example: my-catalog_01
        @[JSON::Field(key: "CatalogName")]
        getter catalog_name : String?

        # A boolean value that, if true , validates the request without actually modifying the lakehouse
        # configuration. Use this to check for errors before making changes.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling Amazon Web
        # Services IAM Identity Center trusted identity propagation on a cluster enabled with Amazon Redshift
        # federated permissions.
        @[JSON::Field(key: "LakehouseIdcApplicationArn")]
        getter lakehouse_idc_application_arn : String?

        # Modifies the Amazon Web Services IAM Identity Center trusted identity propagation on a cluster
        # enabled with Amazon Redshift federated permissions. Valid values are Associate or Disassociate .
        @[JSON::Field(key: "LakehouseIdcRegistration")]
        getter lakehouse_idc_registration : String?

        # Specifies whether to register or deregister the cluster with Amazon Redshift federated permissions.
        # Valid values are Register or Deregister .
        @[JSON::Field(key: "LakehouseRegistration")]
        getter lakehouse_registration : String?

        def initialize(
          @cluster_identifier : String,
          @catalog_name : String? = nil,
          @dry_run : Bool? = nil,
          @lakehouse_idc_application_arn : String? = nil,
          @lakehouse_idc_registration : String? = nil,
          @lakehouse_registration : String? = nil
        )
        end
      end

      struct ModifyRedshiftIdcApplicationMessage
        include JSON::Serializable

        # The ARN for the Redshift application that integrates with IAM Identity Center.
        @[JSON::Field(key: "RedshiftIdcApplicationArn")]
        getter redshift_idc_application_arn : String

        # The authorized token issuer list for the Amazon Redshift IAM Identity Center application to change.
        @[JSON::Field(key: "AuthorizedTokenIssuerList")]
        getter authorized_token_issuer_list : Array(Types::AuthorizedTokenIssuer)?

        # The IAM role ARN associated with the Amazon Redshift IAM Identity Center application to change. It
        # has the required permissions to be assumed and invoke the IDC Identity Center API.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The display name for the Amazon Redshift IAM Identity Center application to change. It appears on
        # the console.
        @[JSON::Field(key: "IdcDisplayName")]
        getter idc_display_name : String?

        # The namespace for the Amazon Redshift IAM Identity Center application to change. It determines which
        # managed application verifies the connection token.
        @[JSON::Field(key: "IdentityNamespace")]
        getter identity_namespace : String?

        # A collection of service integrations associated with the application.
        @[JSON::Field(key: "ServiceIntegrations")]
        getter service_integrations : Array(Types::ServiceIntegrationsUnion)?

        def initialize(
          @redshift_idc_application_arn : String,
          @authorized_token_issuer_list : Array(Types::AuthorizedTokenIssuer)? = nil,
          @iam_role_arn : String? = nil,
          @idc_display_name : String? = nil,
          @identity_namespace : String? = nil,
          @service_integrations : Array(Types::ServiceIntegrationsUnion)? = nil
        )
        end
      end

      struct ModifyRedshiftIdcApplicationResult
        include JSON::Serializable

        @[JSON::Field(key: "RedshiftIdcApplication")]
        getter redshift_idc_application : Types::RedshiftIdcApplication?

        def initialize(
          @redshift_idc_application : Types::RedshiftIdcApplication? = nil
        )
        end
      end

      struct ModifyScheduledActionMessage
        include JSON::Serializable

        # The name of the scheduled action to modify.
        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        # A modified enable flag of the scheduled action. If true, the scheduled action is active. If false,
        # the scheduled action is disabled.
        @[JSON::Field(key: "Enable")]
        getter enable : Bool?

        # A modified end time of the scheduled action. For more information about this parameter, see
        # ScheduledAction .
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # A different IAM role to assume to run the target action. For more information about this parameter,
        # see ScheduledAction .
        @[JSON::Field(key: "IamRole")]
        getter iam_role : String?

        # A modified schedule in either at( ) or cron( ) format. For more information about this parameter,
        # see ScheduledAction .
        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # A modified description of the scheduled action.
        @[JSON::Field(key: "ScheduledActionDescription")]
        getter scheduled_action_description : String?

        # A modified start time of the scheduled action. For more information about this parameter, see
        # ScheduledAction .
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # A modified JSON format of the scheduled action. For more information about this parameter, see
        # ScheduledAction .
        @[JSON::Field(key: "TargetAction")]
        getter target_action : Types::ScheduledActionType?

        def initialize(
          @scheduled_action_name : String,
          @enable : Bool? = nil,
          @end_time : Time? = nil,
          @iam_role : String? = nil,
          @schedule : String? = nil,
          @scheduled_action_description : String? = nil,
          @start_time : Time? = nil,
          @target_action : Types::ScheduledActionType? = nil
        )
        end
      end

      struct ModifySnapshotCopyRetentionPeriodMessage
        include JSON::Serializable

        # The unique identifier of the cluster for which you want to change the retention period for either
        # automated or manual snapshots that are copied to a destination Amazon Web Services Region.
        # Constraints: Must be the valid name of an existing cluster that has cross-region snapshot copy
        # enabled.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The number of days to retain automated snapshots in the destination Amazon Web Services Region after
        # they are copied from the source Amazon Web Services Region. By default, this only changes the
        # retention period of copied automated snapshots. If you decrease the retention period for automated
        # snapshots that are copied to a destination Amazon Web Services Region, Amazon Redshift deletes any
        # existing automated snapshots that were copied to the destination Amazon Web Services Region and that
        # fall outside of the new retention period. Constraints: Must be at least 1 and no more than 35 for
        # automated snapshots. If you specify the manual option, only newly copied manual snapshots will have
        # the new retention period. If you specify the value of -1 newly copied manual snapshots are retained
        # indefinitely. Constraints: The number of days must be either -1 or an integer between 1 and 3,653
        # for manual snapshots.
        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int32

        # Indicates whether to apply the snapshot retention period to newly copied manual snapshots instead of
        # automated snapshots.
        @[JSON::Field(key: "Manual")]
        getter manual : Bool?

        def initialize(
          @cluster_identifier : String,
          @retention_period : Int32,
          @manual : Bool? = nil
        )
        end
      end

      struct ModifySnapshotCopyRetentionPeriodResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct ModifySnapshotScheduleMessage
        include JSON::Serializable

        # An updated list of schedule definitions. A schedule definition is made up of schedule expressions,
        # for example, "cron(30 12 *)" or "rate(12 hours)".
        @[JSON::Field(key: "ScheduleDefinitions")]
        getter schedule_definitions : Array(String)

        # A unique alphanumeric identifier of the schedule to modify.
        @[JSON::Field(key: "ScheduleIdentifier")]
        getter schedule_identifier : String

        def initialize(
          @schedule_definitions : Array(String),
          @schedule_identifier : String
        )
        end
      end

      struct ModifyUsageLimitMessage
        include JSON::Serializable

        # The identifier of the usage limit to modify.
        @[JSON::Field(key: "UsageLimitId")]
        getter usage_limit_id : String

        # The new limit amount. For more information about this parameter, see UsageLimit .
        @[JSON::Field(key: "Amount")]
        getter amount : Int64?

        # The new action that Amazon Redshift takes when the limit is reached. For more information about this
        # parameter, see UsageLimit .
        @[JSON::Field(key: "BreachAction")]
        getter breach_action : String?

        def initialize(
          @usage_limit_id : String,
          @amount : Int64? = nil,
          @breach_action : String? = nil
        )
        end
      end

      # Object to store union of values for a provisioned cluster or serverless namespace’s identifier.
      struct NamespaceIdentifierUnion
        include JSON::Serializable

        # The identifier for a provisioned cluster.
        @[JSON::Field(key: "ProvisionedIdentifier")]
        getter provisioned_identifier : Types::ProvisionedIdentifier?

        # The identifier for a serverless namespace.
        @[JSON::Field(key: "ServerlessIdentifier")]
        getter serverless_identifier : Types::ServerlessIdentifier?

        def initialize(
          @provisioned_identifier : Types::ProvisionedIdentifier? = nil,
          @serverless_identifier : Types::ServerlessIdentifier? = nil
        )
        end
      end

      # Describes a network interface.
      struct NetworkInterface
        include JSON::Serializable

        # The Availability Zone.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The IPv6 address of the network interface within the subnet.
        @[JSON::Field(key: "Ipv6Address")]
        getter ipv6_address : String?

        # The network interface identifier.
        @[JSON::Field(key: "NetworkInterfaceId")]
        getter network_interface_id : String?

        # The IPv4 address of the network interface within the subnet.
        @[JSON::Field(key: "PrivateIpAddress")]
        getter private_ip_address : String?

        # The subnet identifier.
        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        def initialize(
          @availability_zone : String? = nil,
          @ipv6_address : String? = nil,
          @network_interface_id : String? = nil,
          @private_ip_address : String? = nil,
          @subnet_id : String? = nil
        )
        end
      end

      # A list of node configurations.
      struct NodeConfigurationOption
        include JSON::Serializable

        # The estimated disk utilizaton percentage.
        @[JSON::Field(key: "EstimatedDiskUtilizationPercent")]
        getter estimated_disk_utilization_percent : Float64?

        # The category of the node configuration recommendation.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The node type, such as, "ra3.4xlarge".
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The number of nodes.
        @[JSON::Field(key: "NumberOfNodes")]
        getter number_of_nodes : Int32?

        def initialize(
          @estimated_disk_utilization_percent : Float64? = nil,
          @mode : String? = nil,
          @node_type : String? = nil,
          @number_of_nodes : Int32? = nil
        )
        end
      end

      # A set of elements to filter the returned node configurations.
      struct NodeConfigurationOptionsFilter
        include JSON::Serializable

        # The name of the element to filter.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The filter operator. If filter Name is NodeType only the 'in' operator is supported. Provide one
        # value to evaluate for 'eq', 'lt', 'le', 'gt', and 'ge'. Provide two values to evaluate for
        # 'between'. Provide a list of values for 'in'.
        @[JSON::Field(key: "Operator")]
        getter operator : String?

        # List of values. Compare Name using Operator to Values. If filter Name is NumberOfNodes, then values
        # can range from 0 to 200. If filter Name is EstimatedDiskUtilizationPercent, then values can range
        # from 0 to 100. For example, filter NumberOfNodes (name) GT (operator) 3 (values).
        @[JSON::Field(key: "Value")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @operator : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      struct NodeConfigurationOptionsMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of valid node configurations.
        @[JSON::Field(key: "NodeConfigurationOptionList")]
        getter node_configuration_option_list : Array(Types::NodeConfigurationOption)?

        def initialize(
          @marker : String? = nil,
          @node_configuration_option_list : Array(Types::NodeConfigurationOption)? = nil
        )
        end
      end

      # The operation would exceed the number of nodes allowed for a cluster.
      struct NumberOfNodesPerClusterLimitExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The operation would exceed the number of nodes allotted to the account. For information about
      # increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift Cluster Management
      # Guide .
      struct NumberOfNodesQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an orderable cluster option.
      struct OrderableClusterOption
        include JSON::Serializable

        # A list of availability zones for the orderable cluster.
        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(Types::AvailabilityZone)?

        # The cluster type, for example multi-node .
        @[JSON::Field(key: "ClusterType")]
        getter cluster_type : String?

        # The version of the orderable cluster.
        @[JSON::Field(key: "ClusterVersion")]
        getter cluster_version : String?

        # The node type for the orderable cluster.
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        def initialize(
          @availability_zones : Array(Types::AvailabilityZone)? = nil,
          @cluster_type : String? = nil,
          @cluster_version : String? = nil,
          @node_type : String? = nil
        )
        end
      end

      # Contains the output from the DescribeOrderableClusterOptions action.
      struct OrderableClusterOptionsMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An OrderableClusterOption structure containing information about orderable options for the cluster.
        @[JSON::Field(key: "OrderableClusterOptions")]
        getter orderable_cluster_options : Array(Types::OrderableClusterOption)?

        def initialize(
          @marker : String? = nil,
          @orderable_cluster_options : Array(Types::OrderableClusterOption)? = nil
        )
        end
      end

      # Describes a parameter in a cluster parameter group.
      struct Parameter
        include JSON::Serializable

        # The valid range of values for the parameter.
        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : String?

        # Specifies how to apply the WLM configuration parameter. Some properties can be applied dynamically,
        # while other properties require that any associated clusters be rebooted for the configuration
        # changes to be applied. For more information about parameters and parameter groups, go to Amazon
        # Redshift Parameter Groups in the Amazon Redshift Cluster Management Guide .
        @[JSON::Field(key: "ApplyType")]
        getter apply_type : String?

        # The data type of the parameter.
        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # A description of the parameter.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # If true , the parameter can be modified. Some parameters have security or operational implications
        # that prevent them from being changed.
        @[JSON::Field(key: "IsModifiable")]
        getter is_modifiable : Bool?

        # The earliest engine version to which the parameter can apply.
        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # The name of the parameter.
        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        # The value of the parameter. If ParameterName is wlm_json_configuration , then the maximum size of
        # ParameterValue is 8000 characters.
        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String?

        # The source of the parameter value, such as "engine-default" or "user".
        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @allowed_values : String? = nil,
          @apply_type : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @is_modifiable : Bool? = nil,
          @minimum_engine_version : String? = nil,
          @parameter_name : String? = nil,
          @parameter_value : String? = nil,
          @source : String? = nil
        )
        end
      end

      # Describes a partner integration.
      struct PartnerIntegrationInfo
        include JSON::Serializable

        # The date (UTC) that the partner integration was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The name of the database that receives data from a partner.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The name of the partner.
        @[JSON::Field(key: "PartnerName")]
        getter partner_name : String?

        # The partner integration status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message provided by the partner.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The date (UTC) that the partner integration status was last updated by the partner.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @database_name : String? = nil,
          @partner_name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct PartnerIntegrationInputMessage
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the cluster.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The cluster identifier of the cluster that receives data from the partner.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The name of the database that receives data from the partner.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of the partner that is authorized to send data.
        @[JSON::Field(key: "PartnerName")]
        getter partner_name : String

        def initialize(
          @account_id : String,
          @cluster_identifier : String,
          @database_name : String,
          @partner_name : String
        )
        end
      end

      struct PartnerIntegrationOutputMessage
        include JSON::Serializable

        # The name of the database that receives data from the partner.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The name of the partner that is authorized to send data.
        @[JSON::Field(key: "PartnerName")]
        getter partner_name : String?

        def initialize(
          @database_name : String? = nil,
          @partner_name : String? = nil
        )
        end
      end

      # The name of the partner was not found.
      struct PartnerNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a pause cluster operation. For example, a scheduled action to run the PauseCluster API
      # operation.
      struct PauseClusterMessage
        include JSON::Serializable

        # The identifier of the cluster to be paused.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct PauseClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # Describes cluster attributes that are in a pending state. A change to one or more the attributes was
      # requested and is in progress or will be applied.
      struct PendingModifiedValues
        include JSON::Serializable

        # The pending or in-progress change of the automated snapshot retention period.
        @[JSON::Field(key: "AutomatedSnapshotRetentionPeriod")]
        getter automated_snapshot_retention_period : Int32?

        # The pending or in-progress change of the new identifier for the cluster.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The pending or in-progress change of the cluster type.
        @[JSON::Field(key: "ClusterType")]
        getter cluster_type : String?

        # The pending or in-progress change of the service version.
        @[JSON::Field(key: "ClusterVersion")]
        getter cluster_version : String?

        # The encryption type for a cluster. Possible values are: KMS and None.
        @[JSON::Field(key: "EncryptionType")]
        getter encryption_type : String?

        # An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create
        # a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see
        # Enhanced VPC Routing in the Amazon Redshift Cluster Management Guide. If this option is true ,
        # enhanced VPC routing is enabled. Default: false
        @[JSON::Field(key: "EnhancedVpcRouting")]
        getter enhanced_vpc_routing : Bool?

        # The name of the maintenance track that the cluster will change to during the next maintenance
        # window.
        @[JSON::Field(key: "MaintenanceTrackName")]
        getter maintenance_track_name : String?

        # The pending or in-progress change of the admin user password for the cluster.
        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # The pending or in-progress change of the cluster's node type.
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The pending or in-progress change of the number of nodes in the cluster.
        @[JSON::Field(key: "NumberOfNodes")]
        getter number_of_nodes : Int32?

        # The pending or in-progress change of the ability to connect to the cluster from the public network.
        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        def initialize(
          @automated_snapshot_retention_period : Int32? = nil,
          @cluster_identifier : String? = nil,
          @cluster_type : String? = nil,
          @cluster_version : String? = nil,
          @encryption_type : String? = nil,
          @enhanced_vpc_routing : Bool? = nil,
          @maintenance_track_name : String? = nil,
          @master_user_password : String? = nil,
          @node_type : String? = nil,
          @number_of_nodes : Int32? = nil,
          @publicly_accessible : Bool? = nil
        )
        end
      end

      # The identifier for a provisioned cluster.
      struct ProvisionedIdentifier
        include JSON::Serializable

        # The unique identifier for the provisioned cluster.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct PurchaseReservedNodeOfferingMessage
        include JSON::Serializable

        # The unique identifier of the reserved node offering you want to purchase.
        @[JSON::Field(key: "ReservedNodeOfferingId")]
        getter reserved_node_offering_id : String

        # The number of reserved nodes that you want to purchase. Default: 1
        @[JSON::Field(key: "NodeCount")]
        getter node_count : Int32?

        def initialize(
          @reserved_node_offering_id : String,
          @node_count : Int32? = nil
        )
        end
      end

      struct PurchaseReservedNodeOfferingResult
        include JSON::Serializable

        @[JSON::Field(key: "ReservedNode")]
        getter reserved_node : Types::ReservedNode?

        def initialize(
          @reserved_node : Types::ReservedNode? = nil
        )
        end
      end

      struct PutResourcePolicyMessage
        include JSON::Serializable

        # The content of the resource policy being updated.
        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the resource of which its resource policy is updated.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end

      struct PutResourcePolicyResult
        include JSON::Serializable

        # The content of the updated resource policy.
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : Types::ResourcePolicy?

        def initialize(
          @resource_policy : Types::ResourcePolicy? = nil
        )
        end
      end

      # The S3 Access Grants scope.
      struct ReadWriteAccess
        include JSON::Serializable

        # Determines whether the read/write scope is enabled or disabled.
        @[JSON::Field(key: "Authorization")]
        getter authorization : String

        def initialize(
          @authorization : String
        )
        end
      end

      struct RebootClusterMessage
        include JSON::Serializable

        # The cluster identifier.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct RebootClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # An Amazon Redshift Advisor recommended action on the Amazon Redshift cluster.
      struct Recommendation
        include JSON::Serializable

        # The unique identifier of the cluster for which the recommendation is returned.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The date and time (UTC) that the recommendation was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the recommendation.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier of the Advisor recommendation.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The scale of the impact that the Advisor recommendation has to the performance and cost of the
        # cluster.
        @[JSON::Field(key: "ImpactRanking")]
        getter impact_ranking : String?

        # The Amazon Redshift cluster namespace ARN for which the recommendations is returned.
        @[JSON::Field(key: "NamespaceArn")]
        getter namespace_arn : String?

        # The description of what was observed about your cluster.
        @[JSON::Field(key: "Observation")]
        getter observation : String?

        # The description of the recommendation.
        @[JSON::Field(key: "RecommendationText")]
        getter recommendation_text : String?

        # The type of Advisor recommendation.
        @[JSON::Field(key: "RecommendationType")]
        getter recommendation_type : String?

        # List of Amazon Redshift recommended actions.
        @[JSON::Field(key: "RecommendedActions")]
        getter recommended_actions : Array(Types::RecommendedAction)?

        # List of helpful links for more information about the Advisor recommendation.
        @[JSON::Field(key: "ReferenceLinks")]
        getter reference_links : Array(Types::ReferenceLink)?

        # The title of the recommendation.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @impact_ranking : String? = nil,
          @namespace_arn : String? = nil,
          @observation : String? = nil,
          @recommendation_text : String? = nil,
          @recommendation_type : String? = nil,
          @recommended_actions : Array(Types::RecommendedAction)? = nil,
          @reference_links : Array(Types::ReferenceLink)? = nil,
          @title : String? = nil
        )
        end
      end

      # The recommended action from the Amazon Redshift Advisor recommendation.
      struct RecommendedAction
        include JSON::Serializable

        # The command to run.
        @[JSON::Field(key: "Command")]
        getter command : String?

        # The database name to perform the action on. Only applicable if the type of command is SQL.
        @[JSON::Field(key: "Database")]
        getter database : String?

        # The specific instruction about the command.
        @[JSON::Field(key: "Text")]
        getter text : String?

        # The type of command.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @command : String? = nil,
          @database : String? = nil,
          @text : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes a recurring charge.
      struct RecurringCharge
        include JSON::Serializable

        # The amount charged per the period of time specified by the recurring charge frequency.
        @[JSON::Field(key: "RecurringChargeAmount")]
        getter recurring_charge_amount : Float64?

        # The frequency at which the recurring charge amount is applied.
        @[JSON::Field(key: "RecurringChargeFrequency")]
        getter recurring_charge_frequency : String?

        def initialize(
          @recurring_charge_amount : Float64? = nil,
          @recurring_charge_frequency : String? = nil
        )
        end
      end

      # Contains properties for the Redshift IDC application.
      struct RedshiftIdcApplication
        include JSON::Serializable

        # The type of application being created. Valid values are None or Lakehouse . Use Lakehouse to enable
        # Amazon Redshift federated permissions on cluster.
        @[JSON::Field(key: "ApplicationType")]
        getter application_type : String?

        # The authorized token issuer list for the Amazon Redshift IAM Identity Center application.
        @[JSON::Field(key: "AuthorizedTokenIssuerList")]
        getter authorized_token_issuer_list : Array(Types::AuthorizedTokenIssuer)?

        # The ARN for the Amazon Redshift IAM Identity Center application. It has the required permissions to
        # be assumed and invoke the IDC Identity Center API.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The display name for the Amazon Redshift IAM Identity Center application. It appears on the console.
        @[JSON::Field(key: "IdcDisplayName")]
        getter idc_display_name : String?

        # The ARN for the IAM Identity Center instance that Redshift integrates with.
        @[JSON::Field(key: "IdcInstanceArn")]
        getter idc_instance_arn : String?

        # The ARN for the Amazon Redshift IAM Identity Center application.
        @[JSON::Field(key: "IdcManagedApplicationArn")]
        getter idc_managed_application_arn : String?

        # The onboarding status for the Amazon Redshift IAM Identity Center application.
        @[JSON::Field(key: "IdcOnboardStatus")]
        getter idc_onboard_status : String?

        # The identity namespace for the Amazon Redshift IAM Identity Center application. It determines which
        # managed application verifies the connection token.
        @[JSON::Field(key: "IdentityNamespace")]
        getter identity_namespace : String?

        # The ARN for the Redshift application that integrates with IAM Identity Center.
        @[JSON::Field(key: "RedshiftIdcApplicationArn")]
        getter redshift_idc_application_arn : String?

        # The name of the Redshift application in IAM Identity Center.
        @[JSON::Field(key: "RedshiftIdcApplicationName")]
        getter redshift_idc_application_name : String?

        # A list of service integrations for the Redshift IAM Identity Center application.
        @[JSON::Field(key: "ServiceIntegrations")]
        getter service_integrations : Array(Types::ServiceIntegrationsUnion)?

        # A list of tags keys that Redshift Identity Center applications copy to IAM Identity Center. For each
        # input key, the tag corresponding to the key-value pair is propagated.
        @[JSON::Field(key: "SsoTagKeys")]
        getter sso_tag_keys : Array(String)?

        # A list of tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_type : String? = nil,
          @authorized_token_issuer_list : Array(Types::AuthorizedTokenIssuer)? = nil,
          @iam_role_arn : String? = nil,
          @idc_display_name : String? = nil,
          @idc_instance_arn : String? = nil,
          @idc_managed_application_arn : String? = nil,
          @idc_onboard_status : String? = nil,
          @identity_namespace : String? = nil,
          @redshift_idc_application_arn : String? = nil,
          @redshift_idc_application_name : String? = nil,
          @service_integrations : Array(Types::ServiceIntegrationsUnion)? = nil,
          @sso_tag_keys : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The application you attempted to add already exists.
      struct RedshiftIdcApplicationAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The application you attempted to find doesn't exist.
      struct RedshiftIdcApplicationNotExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The maximum number of Redshift IAM Identity Center applications was exceeded.
      struct RedshiftIdcApplicationQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request contains one or more invalid parameters. This error occurs when required parameters are
      # missing, parameter values are outside acceptable ranges, or parameter formats are incorrect.
      struct RedshiftInvalidParameterFault
        include JSON::Serializable

        def initialize
        end
      end

      # A union structure that defines the scope of Amazon Redshift service integrations. Contains
      # configuration for different integration types such as Amazon Redshift.
      struct RedshiftScopeUnion
        include JSON::Serializable

        # The Amazon Redshift connect integration scope configuration. Defines authorization settings for
        # Amazon Redshift connect service integration.
        @[JSON::Field(key: "Connect")]
        getter connect : Types::Connect?

        def initialize(
          @connect : Types::Connect? = nil
        )
        end
      end

      # A link to an Amazon Redshift Advisor reference for more information about a recommendation.
      struct ReferenceLink
        include JSON::Serializable

        # The URL address to find more information.
        @[JSON::Field(key: "Link")]
        getter link : String?

        # The hyperlink text that describes the link to more information.
        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @link : String? = nil,
          @text : String? = nil
        )
        end
      end

      struct RegisterNamespaceInputMessage
        include JSON::Serializable

        # An array containing the ID of the consumer account that you want to register the namespace to.
        @[JSON::Field(key: "ConsumerIdentifiers")]
        getter consumer_identifiers : Array(String)

        # The unique identifier of the cluster or serverless namespace that you want to register.
        @[JSON::Field(key: "NamespaceIdentifier")]
        getter namespace_identifier : Types::NamespaceIdentifierUnion

        def initialize(
          @consumer_identifiers : Array(String),
          @namespace_identifier : Types::NamespaceIdentifierUnion
        )
        end
      end

      struct RegisterNamespaceOutputMessage
        include JSON::Serializable

        # The registration status of the cluster or serverless namespace.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct RejectDataShareMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the datashare to reject.
        @[JSON::Field(key: "DataShareArn")]
        getter data_share_arn : String

        def initialize(
          @data_share_arn : String
        )
        end
      end

      # Describes a reserved node. You can call the DescribeReservedNodeOfferings API to obtain the
      # available reserved node offerings.
      struct ReservedNode
        include JSON::Serializable

        # The currency code for the reserved cluster.
        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The duration of the node reservation in seconds.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The fixed cost Amazon Redshift charges you for this reserved node.
        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # The number of reserved compute nodes.
        @[JSON::Field(key: "NodeCount")]
        getter node_count : Int32?

        # The node type of the reserved node.
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The anticipated utilization of the reserved node, as defined in the reserved node offering.
        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The recurring charges for the reserved node.
        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # The unique identifier for the reservation.
        @[JSON::Field(key: "ReservedNodeId")]
        getter reserved_node_id : String?

        # The identifier for the reserved node offering.
        @[JSON::Field(key: "ReservedNodeOfferingId")]
        getter reserved_node_offering_id : String?

        @[JSON::Field(key: "ReservedNodeOfferingType")]
        getter reserved_node_offering_type : String?

        # The time the reservation started. You purchase a reserved node offering for a duration. This is the
        # start time of that duration.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The state of the reserved compute node. Possible Values: pending-payment-This reserved node has
        # recently been purchased, and the sale has been approved, but payment has not yet been confirmed.
        # active-This reserved node is owned by the caller and is available for use. payment-failed-Payment
        # failed for the purchase attempt. retired-The reserved node is no longer available. exchanging-The
        # owner is exchanging the reserved node for another reserved node.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The hourly rate Amazon Redshift charges you for this reserved node.
        @[JSON::Field(key: "UsagePrice")]
        getter usage_price : Float64?

        def initialize(
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @fixed_price : Float64? = nil,
          @node_count : Int32? = nil,
          @node_type : String? = nil,
          @offering_type : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reserved_node_id : String? = nil,
          @reserved_node_offering_id : String? = nil,
          @reserved_node_offering_type : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # User already has a reservation with the given identifier.
      struct ReservedNodeAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that the reserved node has already been exchanged.
      struct ReservedNodeAlreadyMigratedFault
        include JSON::Serializable

        def initialize
        end
      end

      # Details for a reserved-node exchange. Examples include the node type for a reserved node, the price
      # for a node, the node's state, and other details.
      struct ReservedNodeConfigurationOption
        include JSON::Serializable

        @[JSON::Field(key: "SourceReservedNode")]
        getter source_reserved_node : Types::ReservedNode?

        # The target reserved-node count.
        @[JSON::Field(key: "TargetReservedNodeCount")]
        getter target_reserved_node_count : Int32?

        @[JSON::Field(key: "TargetReservedNodeOffering")]
        getter target_reserved_node_offering : Types::ReservedNodeOffering?

        def initialize(
          @source_reserved_node : Types::ReservedNode? = nil,
          @target_reserved_node_count : Int32? = nil,
          @target_reserved_node_offering : Types::ReservedNodeOffering? = nil
        )
        end
      end

      # The reserved-node exchange status wasn't found.
      struct ReservedNodeExchangeNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Reserved-node status details, such as the source reserved-node identifier, the target reserved-node
      # identifier, the node type, the node count, and other details.
      struct ReservedNodeExchangeStatus
        include JSON::Serializable

        # A date and time that indicate when the reserved-node exchange was requested.
        @[JSON::Field(key: "RequestTime")]
        getter request_time : Time?

        # The identifier of the reserved-node exchange request.
        @[JSON::Field(key: "ReservedNodeExchangeRequestId")]
        getter reserved_node_exchange_request_id : String?

        # The source reserved-node count in the cluster.
        @[JSON::Field(key: "SourceReservedNodeCount")]
        getter source_reserved_node_count : Int32?

        # The identifier of the source reserved node.
        @[JSON::Field(key: "SourceReservedNodeId")]
        getter source_reserved_node_id : String?

        # The source reserved-node type, for example ra3.4xlarge.
        @[JSON::Field(key: "SourceReservedNodeType")]
        getter source_reserved_node_type : String?

        # The status of the reserved-node exchange request. Statuses include in-progress and requested.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The count of target reserved nodes in the cluster.
        @[JSON::Field(key: "TargetReservedNodeCount")]
        getter target_reserved_node_count : Int32?

        # The identifier of the target reserved node offering.
        @[JSON::Field(key: "TargetReservedNodeOfferingId")]
        getter target_reserved_node_offering_id : String?

        # The node type of the target reserved node, for example ra3.4xlarge.
        @[JSON::Field(key: "TargetReservedNodeType")]
        getter target_reserved_node_type : String?

        def initialize(
          @request_time : Time? = nil,
          @reserved_node_exchange_request_id : String? = nil,
          @source_reserved_node_count : Int32? = nil,
          @source_reserved_node_id : String? = nil,
          @source_reserved_node_type : String? = nil,
          @status : String? = nil,
          @target_reserved_node_count : Int32? = nil,
          @target_reserved_node_offering_id : String? = nil,
          @target_reserved_node_type : String? = nil
        )
        end
      end

      # The specified reserved compute node not found.
      struct ReservedNodeNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a reserved node offering.
      struct ReservedNodeOffering
        include JSON::Serializable

        # The currency code for the compute nodes offering.
        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The duration, in seconds, for which the offering will reserve the node.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The upfront fixed charge you will pay to purchase the specific reserved node offering.
        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # The node type offered by the reserved node offering.
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The anticipated utilization of the reserved node, as defined in the reserved node offering.
        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The charge to your account regardless of whether you are creating any clusters using the node
        # offering. Recurring charges are only in effect for heavy-utilization reserved nodes.
        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # The offering identifier.
        @[JSON::Field(key: "ReservedNodeOfferingId")]
        getter reserved_node_offering_id : String?

        @[JSON::Field(key: "ReservedNodeOfferingType")]
        getter reserved_node_offering_type : String?

        # The rate you are charged for each hour the cluster that is using the offering is running.
        @[JSON::Field(key: "UsagePrice")]
        getter usage_price : Float64?

        def initialize(
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @fixed_price : Float64? = nil,
          @node_type : String? = nil,
          @offering_type : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reserved_node_offering_id : String? = nil,
          @reserved_node_offering_type : String? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # Specified offering does not exist.
      struct ReservedNodeOfferingNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      struct ReservedNodeOfferingsMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of ReservedNodeOffering objects.
        @[JSON::Field(key: "ReservedNodeOfferings")]
        getter reserved_node_offerings : Array(Types::ReservedNodeOffering)?

        def initialize(
          @marker : String? = nil,
          @reserved_node_offerings : Array(Types::ReservedNodeOffering)? = nil
        )
        end
      end

      # Request would exceed the user's compute node quota. For information about increasing your quota, go
      # to Limits in Amazon Redshift in the Amazon Redshift Cluster Management Guide .
      struct ReservedNodeQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      struct ReservedNodesMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The list of ReservedNode objects.
        @[JSON::Field(key: "ReservedNodes")]
        getter reserved_nodes : Array(Types::ReservedNode)?

        def initialize(
          @marker : String? = nil,
          @reserved_nodes : Array(Types::ReservedNode)? = nil
        )
        end
      end

      struct ResetClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the cluster parameter group to be reset.
        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # An array of names of parameters to be reset. If ResetAllParameters option is not used, then at least
        # one parameter name must be supplied. Constraints: A maximum of 20 parameters can be reset in a
        # single request.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # If true , all parameters in the specified parameter group will be reset to their default values.
        # Default: true
        @[JSON::Field(key: "ResetAllParameters")]
        getter reset_all_parameters : Bool?

        def initialize(
          @parameter_group_name : String,
          @parameters : Array(Types::Parameter)? = nil,
          @reset_all_parameters : Bool? = nil
        )
        end
      end

      # Describes a resize cluster operation. For example, a scheduled action to run the ResizeCluster API
      # operation.
      struct ResizeClusterMessage
        include JSON::Serializable

        # The unique identifier for the cluster to resize.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # A boolean value indicating whether the resize operation is using the classic resize process. If you
        # don't provide this parameter or set the value to false , the resize type is elastic.
        @[JSON::Field(key: "Classic")]
        getter classic : Bool?

        # The new cluster type for the specified cluster.
        @[JSON::Field(key: "ClusterType")]
        getter cluster_type : String?

        # The new node type for the nodes you are adding. If not specified, the cluster's current node type is
        # used.
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The new number of nodes for the cluster. If not specified, the cluster's current number of nodes is
        # used.
        @[JSON::Field(key: "NumberOfNodes")]
        getter number_of_nodes : Int32?

        # The identifier of the reserved node.
        @[JSON::Field(key: "ReservedNodeId")]
        getter reserved_node_id : String?

        # The identifier of the target reserved node offering.
        @[JSON::Field(key: "TargetReservedNodeOfferingId")]
        getter target_reserved_node_offering_id : String?

        def initialize(
          @cluster_identifier : String,
          @classic : Bool? = nil,
          @cluster_type : String? = nil,
          @node_type : String? = nil,
          @number_of_nodes : Int32? = nil,
          @reserved_node_id : String? = nil,
          @target_reserved_node_offering_id : String? = nil
        )
        end
      end

      struct ResizeClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # Describes a resize operation.
      struct ResizeInfo
        include JSON::Serializable

        # A boolean value indicating if the resize operation can be cancelled.
        @[JSON::Field(key: "AllowCancelResize")]
        getter allow_cancel_resize : Bool?

        # Returns the value ClassicResize .
        @[JSON::Field(key: "ResizeType")]
        getter resize_type : String?

        def initialize(
          @allow_cancel_resize : Bool? = nil,
          @resize_type : String? = nil
        )
        end
      end

      # A resize operation for the specified cluster is not found.
      struct ResizeNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the result of a cluster resize operation.
      struct ResizeProgressMessage
        include JSON::Serializable

        # The average rate of the resize operation over the last few minutes, measured in megabytes per
        # second. After the resize operation completes, this value shows the average rate of the entire resize
        # operation.
        @[JSON::Field(key: "AvgResizeRateInMegaBytesPerSecond")]
        getter avg_resize_rate_in_mega_bytes_per_second : Float64?

        # The percent of data transferred from source cluster to target cluster.
        @[JSON::Field(key: "DataTransferProgressPercent")]
        getter data_transfer_progress_percent : Float64?

        # The amount of seconds that have elapsed since the resize operation began. After the resize operation
        # completes, this value shows the total actual time, in seconds, for the resize operation.
        @[JSON::Field(key: "ElapsedTimeInSeconds")]
        getter elapsed_time_in_seconds : Int64?

        # The estimated time remaining, in seconds, until the resize operation is complete. This value is
        # calculated based on the average resize rate and the estimated amount of data remaining to be
        # processed. Once the resize operation is complete, this value will be 0.
        @[JSON::Field(key: "EstimatedTimeToCompletionInSeconds")]
        getter estimated_time_to_completion_in_seconds : Int64?

        # The names of tables that have been completely imported . Valid Values: List of table names.
        @[JSON::Field(key: "ImportTablesCompleted")]
        getter import_tables_completed : Array(String)?

        # The names of tables that are being currently imported. Valid Values: List of table names.
        @[JSON::Field(key: "ImportTablesInProgress")]
        getter import_tables_in_progress : Array(String)?

        # The names of tables that have not been yet imported. Valid Values: List of table names
        @[JSON::Field(key: "ImportTablesNotStarted")]
        getter import_tables_not_started : Array(String)?

        # An optional string to provide additional details about the resize action.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # While the resize operation is in progress, this value shows the current amount of data, in
        # megabytes, that has been processed so far. When the resize operation is complete, this value shows
        # the total amount of data, in megabytes, on the cluster, which may be more or less than
        # TotalResizeDataInMegaBytes (the estimated total amount of data before resize).
        @[JSON::Field(key: "ProgressInMegaBytes")]
        getter progress_in_mega_bytes : Int64?

        # An enum with possible values of ClassicResize and ElasticResize . These values describe the type of
        # resize operation being performed.
        @[JSON::Field(key: "ResizeType")]
        getter resize_type : String?

        # The status of the resize operation. Valid Values: NONE | IN_PROGRESS | FAILED | SUCCEEDED |
        # CANCELLING
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The cluster type after the resize operation is complete. Valid Values: multi-node | single-node
        @[JSON::Field(key: "TargetClusterType")]
        getter target_cluster_type : String?

        # The type of encryption for the cluster after the resize is complete. Possible values are KMS and
        # None .
        @[JSON::Field(key: "TargetEncryptionType")]
        getter target_encryption_type : String?

        # The node type that the cluster will have after the resize operation is complete.
        @[JSON::Field(key: "TargetNodeType")]
        getter target_node_type : String?

        # The number of nodes that the cluster will have after the resize operation is complete.
        @[JSON::Field(key: "TargetNumberOfNodes")]
        getter target_number_of_nodes : Int32?

        # The estimated total amount of data, in megabytes, on the cluster before the resize operation began.
        @[JSON::Field(key: "TotalResizeDataInMegaBytes")]
        getter total_resize_data_in_mega_bytes : Int64?

        def initialize(
          @avg_resize_rate_in_mega_bytes_per_second : Float64? = nil,
          @data_transfer_progress_percent : Float64? = nil,
          @elapsed_time_in_seconds : Int64? = nil,
          @estimated_time_to_completion_in_seconds : Int64? = nil,
          @import_tables_completed : Array(String)? = nil,
          @import_tables_in_progress : Array(String)? = nil,
          @import_tables_not_started : Array(String)? = nil,
          @message : String? = nil,
          @progress_in_mega_bytes : Int64? = nil,
          @resize_type : String? = nil,
          @status : String? = nil,
          @target_cluster_type : String? = nil,
          @target_encryption_type : String? = nil,
          @target_node_type : String? = nil,
          @target_number_of_nodes : Int32? = nil,
          @total_resize_data_in_mega_bytes : Int64? = nil
        )
        end
      end

      # The resource could not be found.
      struct ResourceNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The policy that is attached to a resource.
      struct ResourcePolicy
        include JSON::Serializable

        # The content of a resource policy.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The resources that a policy is attached to.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct RestoreFromClusterSnapshotMessage
        include JSON::Serializable

        # The identifier of the cluster that will be created from restoring the snapshot. Constraints: Must
        # contain from 1 to 63 alphanumeric characters or hyphens. Alphabetic characters must be lowercase.
        # First character must be a letter. Cannot end with a hyphen or contain two consecutive hyphens. Must
        # be unique for all clusters within an Amazon Web Services account.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # Reserved.
        @[JSON::Field(key: "AdditionalInfo")]
        getter additional_info : String?

        # If true , major version upgrades can be applied during the maintenance window to the Amazon Redshift
        # engine that is running on the cluster. Default: true
        @[JSON::Field(key: "AllowVersionUpgrade")]
        getter allow_version_upgrade : Bool?

        # This parameter is retired. It does not set the AQUA configuration status. Amazon Redshift
        # automatically determines whether to use AQUA (Advanced Query Accelerator).
        @[JSON::Field(key: "AquaConfigurationStatus")]
        getter aqua_configuration_status : String?

        # The number of days that automated snapshots are retained. If the value is 0, automated snapshots are
        # disabled. Even if automated snapshots are disabled, you can still create manual snapshots when you
        # want with CreateClusterSnapshot . You can't disable automated snapshots for RA3 node types. Set the
        # automated retention period from 1-35 days. Default: The value selected for the cluster from which
        # the snapshot was taken. Constraints: Must be a value from 0 to 35.
        @[JSON::Field(key: "AutomatedSnapshotRetentionPeriod")]
        getter automated_snapshot_retention_period : Int32?

        # The Amazon EC2 Availability Zone in which to restore the cluster. Default: A random, system-chosen
        # Availability Zone. Example: us-east-2a
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The option to enable relocation for an Amazon Redshift cluster between Availability Zones after the
        # cluster is restored.
        @[JSON::Field(key: "AvailabilityZoneRelocation")]
        getter availability_zone_relocation : Bool?

        # The name of the Glue Data Catalog that will be associated with the cluster enabled with Amazon
        # Redshift federated permissions. Constraints: Must contain at least one lowercase letter. Can only
        # contain lowercase letters (a-z), numbers (0-9), underscores (_), and hyphens (-). Pattern:
        # ^[a-z0-9_-]*[a-z]+[a-z0-9_-]*$ Example: my-catalog_01
        @[JSON::Field(key: "CatalogName")]
        getter catalog_name : String?

        # The name of the parameter group to be associated with this cluster. Default: The default Amazon
        # Redshift cluster parameter group. For information about the default parameter group, go to Working
        # with Amazon Redshift Parameter Groups . Constraints: Must be 1 to 255 alphanumeric characters or
        # hyphens. First character must be a letter. Cannot end with a hyphen or contain two consecutive
        # hyphens.
        @[JSON::Field(key: "ClusterParameterGroupName")]
        getter cluster_parameter_group_name : String?

        # A list of security groups to be associated with this cluster. Default: The default cluster security
        # group for Amazon Redshift. Cluster security groups only apply to clusters outside of VPCs.
        @[JSON::Field(key: "ClusterSecurityGroups")]
        getter cluster_security_groups : Array(String)?

        # The name of the subnet group where you want to cluster restored. A snapshot of cluster in VPC can be
        # restored only in VPC. Therefore, you must provide subnet group name where you want the cluster
        # restored.
        @[JSON::Field(key: "ClusterSubnetGroupName")]
        getter cluster_subnet_group_name : String?

        # The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster when the
        # cluster was last modified while it was restored from a snapshot.
        @[JSON::Field(key: "DefaultIamRoleArn")]
        getter default_iam_role_arn : String?

        # The Elastic IP (EIP) address for the cluster. Don't specify the Elastic IP address for a publicly
        # accessible cluster with availability zone relocation turned on.
        @[JSON::Field(key: "ElasticIp")]
        getter elastic_ip : String?

        # Enables support for restoring an unencrypted snapshot to a cluster encrypted with Key Management
        # Service (KMS) and a customer managed key.
        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create
        # a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see
        # Enhanced VPC Routing in the Amazon Redshift Cluster Management Guide. If this option is true ,
        # enhanced VPC routing is enabled. Default: false
        @[JSON::Field(key: "EnhancedVpcRouting")]
        getter enhanced_vpc_routing : Bool?

        # Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to retrieve the
        # data encryption keys stored in an HSM.
        @[JSON::Field(key: "HsmClientCertificateIdentifier")]
        getter hsm_client_certificate_identifier : String?

        # Specifies the name of the HSM configuration that contains the information the Amazon Redshift
        # cluster can use to retrieve and store keys in an HSM.
        @[JSON::Field(key: "HsmConfigurationIdentifier")]
        getter hsm_configuration_identifier : String?

        # A list of Identity and Access Management (IAM) roles that can be used by the cluster to access other
        # Amazon Web Services services. You must supply the IAM roles in their Amazon Resource Name (ARN)
        # format. The maximum number of IAM roles that you can associate is subject to a quota. For more
        # information, go to Quotas and limits in the Amazon Redshift Cluster Management Guide .
        @[JSON::Field(key: "IamRoles")]
        getter iam_roles : Array(String)?

        # The IP address type for the cluster. Possible values are ipv4 and dualstack .
        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The Key Management Service (KMS) key ID of the encryption key that encrypts data in the cluster
        # restored from a shared snapshot. You can also provide the key ID when you restore from an
        # unencrypted snapshot to an encrypted cluster in the same account. Additionally, you can specify a
        # new KMS key ID when you restore from an encrypted snapshot in the same account in order to change
        # it. In that case, the restored cluster is encrypted with the new KMS key ID.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The name of the maintenance track for the restored cluster. When you take a snapshot, the snapshot
        # inherits the MaintenanceTrack value from the cluster. The snapshot might be on a different track
        # than the cluster that was the source for the snapshot. For example, suppose that you take a snapshot
        # of a cluster that is on the current track and then change the cluster to be on the trailing track.
        # In this case, the snapshot and the source cluster are on different tracks.
        @[JSON::Field(key: "MaintenanceTrackName")]
        getter maintenance_track_name : String?

        # If true , Amazon Redshift uses Secrets Manager to manage the restored cluster's admin credentials.
        # If ManageMasterPassword is false or not set, Amazon Redshift uses the admin credentials the cluster
        # had at the time the snapshot was taken.
        @[JSON::Field(key: "ManageMasterPassword")]
        getter manage_master_password : Bool?

        # The default number of days to retain a manual snapshot. If the value is -1, the snapshot is retained
        # indefinitely. This setting doesn't change the retention period of existing snapshots. The value must
        # be either -1 or an integer between 1 and 3,653.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        # The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's admin
        # credentials secret. You can only use this parameter if ManageMasterPassword is true.
        @[JSON::Field(key: "MasterPasswordSecretKmsKeyId")]
        getter master_password_secret_kms_key_id : String?

        # If true, the snapshot will be restored to a cluster deployed in two Availability Zones.
        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The node type that the restored cluster will be provisioned with. If you have a DC instance type,
        # you must restore into that same instance type and size. In other words, you can only restore a
        # dc2.large node type into another dc2 type. For more information about node types, see About Clusters
        # and Nodes in the Amazon Redshift Cluster Management Guide .
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The number of nodes specified when provisioning the restored cluster.
        @[JSON::Field(key: "NumberOfNodes")]
        getter number_of_nodes : Int32?

        # The Amazon Web Services account used to create or copy the snapshot. Required if you are restoring a
        # snapshot you do not own, optional if you own the snapshot.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # The port number on which the cluster accepts connections. Default: The same port as the original
        # cluster. Valid values: For clusters with DC2 nodes, must be within the range 1150 - 65535 . For
        # clusters with ra3 nodes, must be within the ranges 5431 - 5455 or 8191 - 8215 .
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The weekly time range (in UTC) during which automated cluster maintenance can occur. Format:
        # ddd:hh24:mi-ddd:hh24:mi Default: The value selected for the cluster from which the snapshot was
        # taken. For more information about the time blocks for each region, see Maintenance Windows in Amazon
        # Redshift Cluster Management Guide. Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun Constraints:
        # Minimum 30-minute window.
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # If true , the cluster can be accessed from a public network. Default: false
        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling Amazon Web
        # Services IAM Identity Center trusted identity propagation on a cluster enabled with Amazon Redshift
        # federated permissions.
        @[JSON::Field(key: "RedshiftIdcApplicationArn")]
        getter redshift_idc_application_arn : String?

        # The identifier of the target reserved node offering.
        @[JSON::Field(key: "ReservedNodeId")]
        getter reserved_node_id : String?

        # The Amazon Resource Name (ARN) of the snapshot associated with the message to restore from a
        # cluster. You must specify this parameter or snapshotIdentifier , but not both.
        @[JSON::Field(key: "SnapshotArn")]
        getter snapshot_arn : String?

        # The name of the cluster the source snapshot was created from. This parameter is required if your IAM
        # user has a policy containing a snapshot resource element that specifies anything other than * for
        # the cluster name.
        @[JSON::Field(key: "SnapshotClusterIdentifier")]
        getter snapshot_cluster_identifier : String?

        # The name of the snapshot from which to create the new cluster. This parameter isn't case sensitive.
        # You must specify this parameter or snapshotArn , but not both. Example: my-snapshot-id
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String?

        # A unique identifier for the snapshot schedule.
        @[JSON::Field(key: "SnapshotScheduleIdentifier")]
        getter snapshot_schedule_identifier : String?

        # The identifier of the target reserved node offering.
        @[JSON::Field(key: "TargetReservedNodeOfferingId")]
        getter target_reserved_node_offering_id : String?

        # A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster. Default:
        # The default VPC security group is associated with the cluster. VPC security groups only apply to
        # clusters in VPCs.
        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @cluster_identifier : String,
          @additional_info : String? = nil,
          @allow_version_upgrade : Bool? = nil,
          @aqua_configuration_status : String? = nil,
          @automated_snapshot_retention_period : Int32? = nil,
          @availability_zone : String? = nil,
          @availability_zone_relocation : Bool? = nil,
          @catalog_name : String? = nil,
          @cluster_parameter_group_name : String? = nil,
          @cluster_security_groups : Array(String)? = nil,
          @cluster_subnet_group_name : String? = nil,
          @default_iam_role_arn : String? = nil,
          @elastic_ip : String? = nil,
          @encrypted : Bool? = nil,
          @enhanced_vpc_routing : Bool? = nil,
          @hsm_client_certificate_identifier : String? = nil,
          @hsm_configuration_identifier : String? = nil,
          @iam_roles : Array(String)? = nil,
          @ip_address_type : String? = nil,
          @kms_key_id : String? = nil,
          @maintenance_track_name : String? = nil,
          @manage_master_password : Bool? = nil,
          @manual_snapshot_retention_period : Int32? = nil,
          @master_password_secret_kms_key_id : String? = nil,
          @multi_az : Bool? = nil,
          @node_type : String? = nil,
          @number_of_nodes : Int32? = nil,
          @owner_account : String? = nil,
          @port : Int32? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @redshift_idc_application_arn : String? = nil,
          @reserved_node_id : String? = nil,
          @snapshot_arn : String? = nil,
          @snapshot_cluster_identifier : String? = nil,
          @snapshot_identifier : String? = nil,
          @snapshot_schedule_identifier : String? = nil,
          @target_reserved_node_offering_id : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      struct RestoreFromClusterSnapshotResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # Describes the status of a cluster restore action. Returns null if the cluster was not created by
      # restoring a snapshot.
      struct RestoreStatus
        include JSON::Serializable

        # The number of megabytes per second being transferred from the backup storage. Returns the average
        # rate for a completed backup. This field is only updated when you restore to DC2 node types.
        @[JSON::Field(key: "CurrentRestoreRateInMegaBytesPerSecond")]
        getter current_restore_rate_in_mega_bytes_per_second : Float64?

        # The amount of time an in-progress restore has been running, or the amount of time it took a
        # completed restore to finish. This field is only updated when you restore to DC2 node types.
        @[JSON::Field(key: "ElapsedTimeInSeconds")]
        getter elapsed_time_in_seconds : Int64?

        # The estimate of the time remaining before the restore will complete. Returns 0 for a completed
        # restore. This field is only updated when you restore to DC2 node types.
        @[JSON::Field(key: "EstimatedTimeToCompletionInSeconds")]
        getter estimated_time_to_completion_in_seconds : Int64?

        # The number of megabytes that have been transferred from snapshot storage. This field is only updated
        # when you restore to DC2 node types.
        @[JSON::Field(key: "ProgressInMegaBytes")]
        getter progress_in_mega_bytes : Int64?

        # The size of the set of snapshot data used to restore the cluster. This field is only updated when
        # you restore to DC2 node types.
        @[JSON::Field(key: "SnapshotSizeInMegaBytes")]
        getter snapshot_size_in_mega_bytes : Int64?

        # The status of the restore action. Returns starting, restoring, completed, or failed.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @current_restore_rate_in_mega_bytes_per_second : Float64? = nil,
          @elapsed_time_in_seconds : Int64? = nil,
          @estimated_time_to_completion_in_seconds : Int64? = nil,
          @progress_in_mega_bytes : Int64? = nil,
          @snapshot_size_in_mega_bytes : Int64? = nil,
          @status : String? = nil
        )
        end
      end

      struct RestoreTableFromClusterSnapshotMessage
        include JSON::Serializable

        # The identifier of the Amazon Redshift cluster to restore the table to.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The name of the table to create as a result of the current request.
        @[JSON::Field(key: "NewTableName")]
        getter new_table_name : String

        # The identifier of the snapshot to restore the table from. This snapshot must have been created from
        # the Amazon Redshift cluster specified by the ClusterIdentifier parameter.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String

        # The name of the source database that contains the table to restore from.
        @[JSON::Field(key: "SourceDatabaseName")]
        getter source_database_name : String

        # The name of the source table to restore from.
        @[JSON::Field(key: "SourceTableName")]
        getter source_table_name : String

        # Indicates whether name identifiers for database, schema, and table are case sensitive. If true , the
        # names are case sensitive. If false (default), the names are not case sensitive.
        @[JSON::Field(key: "EnableCaseSensitiveIdentifier")]
        getter enable_case_sensitive_identifier : Bool?

        # The name of the source schema that contains the table to restore from. If you do not specify a
        # SourceSchemaName value, the default is public .
        @[JSON::Field(key: "SourceSchemaName")]
        getter source_schema_name : String?

        # The name of the database to restore the table to.
        @[JSON::Field(key: "TargetDatabaseName")]
        getter target_database_name : String?

        # The name of the schema to restore the table to.
        @[JSON::Field(key: "TargetSchemaName")]
        getter target_schema_name : String?

        def initialize(
          @cluster_identifier : String,
          @new_table_name : String,
          @snapshot_identifier : String,
          @source_database_name : String,
          @source_table_name : String,
          @enable_case_sensitive_identifier : Bool? = nil,
          @source_schema_name : String? = nil,
          @target_database_name : String? = nil,
          @target_schema_name : String? = nil
        )
        end
      end

      struct RestoreTableFromClusterSnapshotResult
        include JSON::Serializable

        @[JSON::Field(key: "TableRestoreStatus")]
        getter table_restore_status : Types::TableRestoreStatus?

        def initialize(
          @table_restore_status : Types::TableRestoreStatus? = nil
        )
        end
      end

      # Describes a resume cluster operation. For example, a scheduled action to run the ResumeCluster API
      # operation.
      struct ResumeClusterMessage
        include JSON::Serializable

        # The identifier of the cluster to be resumed.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct ResumeClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # Describes a RevisionTarget .
      struct RevisionTarget
        include JSON::Serializable

        # A unique string that identifies the version to update the cluster to. You can use this value in
        # ModifyClusterDbRevision .
        @[JSON::Field(key: "DatabaseRevision")]
        getter database_revision : String?

        # The date on which the database revision was released.
        @[JSON::Field(key: "DatabaseRevisionReleaseDate")]
        getter database_revision_release_date : Time?

        # A string that describes the changes and features that will be applied to the cluster when it is
        # updated to the corresponding ClusterDbRevision .
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @database_revision : String? = nil,
          @database_revision_release_date : Time? = nil,
          @description : String? = nil
        )
        end
      end

      struct RevokeClusterSecurityGroupIngressMessage
        include JSON::Serializable

        # The name of the security Group from which to revoke the ingress rule.
        @[JSON::Field(key: "ClusterSecurityGroupName")]
        getter cluster_security_group_name : String

        # The IP range for which to revoke access. This range must be a valid Classless Inter-Domain Routing
        # (CIDR) block of IP addresses. If CIDRIP is specified, EC2SecurityGroupName and
        # EC2SecurityGroupOwnerId cannot be provided.
        @[JSON::Field(key: "CIDRIP")]
        getter cidrip : String?

        # The name of the EC2 Security Group whose access is to be revoked. If EC2SecurityGroupName is
        # specified, EC2SecurityGroupOwnerId must also be provided and CIDRIP cannot be provided.
        @[JSON::Field(key: "EC2SecurityGroupName")]
        getter ec2_security_group_name : String?

        # The Amazon Web Services account number of the owner of the security group specified in the
        # EC2SecurityGroupName parameter. The Amazon Web Services access key ID is not an acceptable value. If
        # EC2SecurityGroupOwnerId is specified, EC2SecurityGroupName must also be provided. and CIDRIP cannot
        # be provided. Example: 111122223333
        @[JSON::Field(key: "EC2SecurityGroupOwnerId")]
        getter ec2_security_group_owner_id : String?

        def initialize(
          @cluster_security_group_name : String,
          @cidrip : String? = nil,
          @ec2_security_group_name : String? = nil,
          @ec2_security_group_owner_id : String? = nil
        )
        end
      end

      struct RevokeClusterSecurityGroupIngressResult
        include JSON::Serializable

        @[JSON::Field(key: "ClusterSecurityGroup")]
        getter cluster_security_group : Types::ClusterSecurityGroup?

        def initialize(
          @cluster_security_group : Types::ClusterSecurityGroup? = nil
        )
        end
      end

      struct RevokeEndpointAccessMessage
        include JSON::Serializable

        # The Amazon Web Services account ID whose access is to be revoked.
        @[JSON::Field(key: "Account")]
        getter account : String?

        # The cluster to revoke access from.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # Indicates whether to force the revoke action. If true, the Redshift-managed VPC endpoints associated
        # with the endpoint authorization are also deleted.
        @[JSON::Field(key: "Force")]
        getter force : Bool?

        # The virtual private cloud (VPC) identifiers for which access is to be revoked.
        @[JSON::Field(key: "VpcIds")]
        getter vpc_ids : Array(String)?

        def initialize(
          @account : String? = nil,
          @cluster_identifier : String? = nil,
          @force : Bool? = nil,
          @vpc_ids : Array(String)? = nil
        )
        end
      end

      struct RevokeSnapshotAccessMessage
        include JSON::Serializable

        # The identifier of the Amazon Web Services account that can no longer restore the specified snapshot.
        @[JSON::Field(key: "AccountWithRestoreAccess")]
        getter account_with_restore_access : String

        # The Amazon Resource Name (ARN) of the snapshot associated with the message to revoke access.
        @[JSON::Field(key: "SnapshotArn")]
        getter snapshot_arn : String?

        # The identifier of the cluster the snapshot was created from. This parameter is required if your IAM
        # user has a policy containing a snapshot resource element that specifies anything other than * for
        # the cluster name.
        @[JSON::Field(key: "SnapshotClusterIdentifier")]
        getter snapshot_cluster_identifier : String?

        # The identifier of the snapshot that the account can no longer access.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String?

        def initialize(
          @account_with_restore_access : String,
          @snapshot_arn : String? = nil,
          @snapshot_cluster_identifier : String? = nil,
          @snapshot_identifier : String? = nil
        )
        end
      end

      struct RevokeSnapshotAccessResult
        include JSON::Serializable

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct RotateEncryptionKeyMessage
        include JSON::Serializable

        # The unique identifier of the cluster that you want to rotate the encryption keys for. Constraints:
        # Must be the name of valid cluster that has encryption enabled.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end

      struct RotateEncryptionKeyResult
        include JSON::Serializable

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # A list of scopes set up for S3 Access Grants integration.
      struct S3AccessGrantsScopeUnion
        include JSON::Serializable

        # The S3 Access Grants scope.
        @[JSON::Field(key: "ReadWriteAccess")]
        getter read_write_access : Types::ReadWriteAccess?

        def initialize(
          @read_write_access : Types::ReadWriteAccess? = nil
        )
        end
      end

      # Amazon SNS has responded that there is a problem with the specified Amazon SNS topic.
      struct SNSInvalidTopicFault
        include JSON::Serializable

        def initialize
        end
      end

      # You do not have permission to publish to the specified Amazon SNS topic.
      struct SNSNoAuthorizationFault
        include JSON::Serializable

        def initialize
        end
      end

      # An Amazon SNS topic with the specified Amazon Resource Name (ARN) does not exist.
      struct SNSTopicArnNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The definition you submitted is not supported.
      struct ScheduleDefinitionTypeUnsupportedFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a scheduled action. You can use a scheduled action to trigger some Amazon Redshift API
      # operations on a schedule. For information about which API operations can be scheduled, see
      # ScheduledActionType .
      struct ScheduledAction
        include JSON::Serializable

        # The end time in UTC when the schedule is no longer active. After this time, the scheduled action
        # does not trigger.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The IAM role to assume to run the scheduled action. This IAM role must have permission to run the
        # Amazon Redshift API operation in the scheduled action. This IAM role must allow the Amazon Redshift
        # scheduler (Principal scheduler.redshift.amazonaws.com) to assume permissions on your behalf. For
        # more information about the IAM role to use with the Amazon Redshift scheduler, see Using
        # Identity-Based Policies for Amazon Redshift in the Amazon Redshift Cluster Management Guide .
        @[JSON::Field(key: "IamRole")]
        getter iam_role : String?

        # List of times when the scheduled action will run.
        @[JSON::Field(key: "NextInvocations")]
        getter next_invocations : Array(Time)?

        # The schedule for a one-time (at format) or recurring (cron format) scheduled action. Schedule
        # invocations must be separated by at least one hour. Format of at expressions is "
        # at(yyyy-mm-ddThh:mm:ss) ". For example, " at(2016-03-04T17:27:00) ". Format of cron expressions is "
        # cron(Minutes Hours Day-of-month Month Day-of-week Year) ". For example, " cron(0 10 ? * MON *) ".
        # For more information, see Cron Expressions in the Amazon CloudWatch Events User Guide .
        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # The description of the scheduled action.
        @[JSON::Field(key: "ScheduledActionDescription")]
        getter scheduled_action_description : String?

        # The name of the scheduled action.
        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String?

        # The start time in UTC when the schedule is active. Before this time, the scheduled action does not
        # trigger.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The state of the scheduled action. For example, DISABLED .
        @[JSON::Field(key: "State")]
        getter state : String?

        # A JSON format string of the Amazon Redshift API operation with input parameters. "
        # {\"ResizeCluster\":{\"NodeType\":\"ra3.4xlarge\",\"ClusterIdentifier\":\"my-test-cluster\",\"NumberOfNodes\":3}}
        # ".
        @[JSON::Field(key: "TargetAction")]
        getter target_action : Types::ScheduledActionType?

        def initialize(
          @end_time : Time? = nil,
          @iam_role : String? = nil,
          @next_invocations : Array(Time)? = nil,
          @schedule : String? = nil,
          @scheduled_action_description : String? = nil,
          @scheduled_action_name : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @target_action : Types::ScheduledActionType? = nil
        )
        end
      end

      # The scheduled action already exists.
      struct ScheduledActionAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # A set of elements to filter the returned scheduled actions.
      struct ScheduledActionFilter
        include JSON::Serializable

        # The type of element to filter.
        @[JSON::Field(key: "Name")]
        getter name : String

        # List of values. Compare if the value (of type defined by Name ) equals an item in the list of
        # scheduled actions.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The scheduled action cannot be found.
      struct ScheduledActionNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The quota for scheduled actions exceeded.
      struct ScheduledActionQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The action type that specifies an Amazon Redshift API operation that is supported by the Amazon
      # Redshift scheduler.
      struct ScheduledActionType
        include JSON::Serializable

        # An action that runs a PauseCluster API operation.
        @[JSON::Field(key: "PauseCluster")]
        getter pause_cluster : Types::PauseClusterMessage?

        # An action that runs a ResizeCluster API operation.
        @[JSON::Field(key: "ResizeCluster")]
        getter resize_cluster : Types::ResizeClusterMessage?

        # An action that runs a ResumeCluster API operation.
        @[JSON::Field(key: "ResumeCluster")]
        getter resume_cluster : Types::ResumeClusterMessage?

        def initialize(
          @pause_cluster : Types::PauseClusterMessage? = nil,
          @resize_cluster : Types::ResizeClusterMessage? = nil,
          @resume_cluster : Types::ResumeClusterMessage? = nil
        )
        end
      end

      # The action type specified for a scheduled action is not supported.
      struct ScheduledActionTypeUnsupportedFault
        include JSON::Serializable

        def initialize
        end
      end

      struct ScheduledActionsMessage
        include JSON::Serializable

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeScheduledActions request exceed the value specified in MaxRecords , Amazon
        # Web Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # List of retrieved scheduled actions.
        @[JSON::Field(key: "ScheduledActions")]
        getter scheduled_actions : Array(Types::ScheduledAction)?

        def initialize(
          @marker : String? = nil,
          @scheduled_actions : Array(Types::ScheduledAction)? = nil
        )
        end
      end

      # The AvailabilityZone and ClusterNodes information of the secondary compute unit.
      struct SecondaryClusterInfo
        include JSON::Serializable

        # The name of the Availability Zone in which the secondary compute unit of the cluster is located.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The nodes in the secondary compute unit.
        @[JSON::Field(key: "ClusterNodes")]
        getter cluster_nodes : Array(Types::ClusterNode)?

        def initialize(
          @availability_zone : String? = nil,
          @cluster_nodes : Array(Types::ClusterNode)? = nil
        )
        end
      end

      # The identifier for a serverless namespace.
      struct ServerlessIdentifier
        include JSON::Serializable

        # The unique identifier for the serverless namespace.
        @[JSON::Field(key: "NamespaceIdentifier")]
        getter namespace_identifier : String

        # The unique identifier for the workgroup associated with the serverless namespace.
        @[JSON::Field(key: "WorkgroupIdentifier")]
        getter workgroup_identifier : String

        def initialize(
          @namespace_identifier : String,
          @workgroup_identifier : String
        )
        end
      end

      # A list of service integrations.
      struct ServiceIntegrationsUnion
        include JSON::Serializable

        # A list of scopes set up for Lake Formation integration.
        @[JSON::Field(key: "LakeFormation")]
        getter lake_formation : Array(Types::LakeFormationScopeUnion)?

        # A list of scopes set up for Amazon Redshift integration.
        @[JSON::Field(key: "Redshift")]
        getter redshift : Array(Types::RedshiftScopeUnion)?

        # A list of scopes set up for S3 Access Grants integration.
        @[JSON::Field(key: "S3AccessGrants")]
        getter s3_access_grants : Array(Types::S3AccessGrantsScopeUnion)?

        def initialize(
          @lake_formation : Array(Types::LakeFormationScopeUnion)? = nil,
          @redshift : Array(Types::RedshiftScopeUnion)? = nil,
          @s3_access_grants : Array(Types::S3AccessGrantsScopeUnion)? = nil
        )
        end
      end

      # Describes a snapshot.
      struct Snapshot
        include JSON::Serializable

        # A list of the Amazon Web Services accounts authorized to restore the snapshot. Returns null if no
        # accounts are authorized. Visible only to the snapshot owner.
        @[JSON::Field(key: "AccountsWithRestoreAccess")]
        getter accounts_with_restore_access : Array(Types::AccountWithRestoreAccess)?

        # The size of the incremental backup.
        @[JSON::Field(key: "ActualIncrementalBackupSizeInMegaBytes")]
        getter actual_incremental_backup_size_in_mega_bytes : Float64?

        # The Availability Zone in which the cluster was created.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The number of megabytes that have been transferred to the snapshot backup.
        @[JSON::Field(key: "BackupProgressInMegaBytes")]
        getter backup_progress_in_mega_bytes : Float64?

        # The time (UTC) when the cluster was originally created.
        @[JSON::Field(key: "ClusterCreateTime")]
        getter cluster_create_time : Time?

        # The identifier of the cluster for which the snapshot was taken.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The version ID of the Amazon Redshift engine that is running on the cluster.
        @[JSON::Field(key: "ClusterVersion")]
        getter cluster_version : String?

        # The number of megabytes per second being transferred to the snapshot backup. Returns 0 for a
        # completed backup.
        @[JSON::Field(key: "CurrentBackupRateInMegaBytesPerSecond")]
        getter current_backup_rate_in_mega_bytes_per_second : Float64?

        # The name of the database that was created when the cluster was created.
        @[JSON::Field(key: "DBName")]
        getter db_name : String?

        # The amount of time an in-progress snapshot backup has been running, or the amount of time it took a
        # completed backup to finish.
        @[JSON::Field(key: "ElapsedTimeInSeconds")]
        getter elapsed_time_in_seconds : Int64?

        # If true , the data in the snapshot is encrypted at rest.
        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        # A boolean that indicates whether the snapshot data is encrypted using the HSM keys of the source
        # cluster. true indicates that the data is encrypted using HSM keys.
        @[JSON::Field(key: "EncryptedWithHSM")]
        getter encrypted_with_hsm : Bool?

        # The cluster version of the cluster used to create the snapshot. For example, 1.0.15503.
        @[JSON::Field(key: "EngineFullVersion")]
        getter engine_full_version : String?

        # An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create
        # a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see
        # Enhanced VPC Routing in the Amazon Redshift Cluster Management Guide. If this option is true ,
        # enhanced VPC routing is enabled. Default: false
        @[JSON::Field(key: "EnhancedVpcRouting")]
        getter enhanced_vpc_routing : Bool?

        # The estimate of the time remaining before the snapshot backup will complete. Returns 0 for a
        # completed backup.
        @[JSON::Field(key: "EstimatedSecondsToCompletion")]
        getter estimated_seconds_to_completion : Int64?

        # The Key Management Service (KMS) key ID of the encryption key that was used to encrypt data in the
        # cluster from which the snapshot was taken.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The name of the maintenance track for the snapshot.
        @[JSON::Field(key: "MaintenanceTrackName")]
        getter maintenance_track_name : String?

        # The number of days until a manual snapshot will pass its retention period.
        @[JSON::Field(key: "ManualSnapshotRemainingDays")]
        getter manual_snapshot_remaining_days : Int32?

        # The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is
        # retained indefinitely. The value must be either -1 or an integer between 1 and 3,653.
        @[JSON::Field(key: "ManualSnapshotRetentionPeriod")]
        getter manual_snapshot_retention_period : Int32?

        # The Amazon Resource Name (ARN) for the cluster's admin user credentials secret.
        @[JSON::Field(key: "MasterPasswordSecretArn")]
        getter master_password_secret_arn : String?

        # The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's admin
        # credentials secret.
        @[JSON::Field(key: "MasterPasswordSecretKmsKeyId")]
        getter master_password_secret_kms_key_id : String?

        # The admin user name for the cluster.
        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # The node type of the nodes in the cluster.
        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The number of nodes in the cluster.
        @[JSON::Field(key: "NumberOfNodes")]
        getter number_of_nodes : Int32?

        # For manual snapshots, the Amazon Web Services account used to create or copy the snapshot. For
        # automatic snapshots, the owner of the cluster. The owner can perform all snapshot actions, such as
        # sharing a manual snapshot.
        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # The port that the cluster is listening on.
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The list of node types that this cluster snapshot is able to restore into.
        @[JSON::Field(key: "RestorableNodeTypes")]
        getter restorable_node_types : Array(String)?

        # The Amazon Resource Name (ARN) of the snapshot.
        @[JSON::Field(key: "SnapshotArn")]
        getter snapshot_arn : String?

        # The time (in UTC format) when Amazon Redshift began the snapshot. A snapshot contains a copy of the
        # cluster data as of this exact time.
        @[JSON::Field(key: "SnapshotCreateTime")]
        getter snapshot_create_time : Time?

        # The snapshot identifier that is provided in the request.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String?

        # A timestamp representing the start of the retention period for the snapshot.
        @[JSON::Field(key: "SnapshotRetentionStartTime")]
        getter snapshot_retention_start_time : Time?

        # The snapshot type. Snapshots created using CreateClusterSnapshot and CopyClusterSnapshot are of type
        # "manual".
        @[JSON::Field(key: "SnapshotType")]
        getter snapshot_type : String?

        # The source region from which the snapshot was copied.
        @[JSON::Field(key: "SourceRegion")]
        getter source_region : String?

        # The snapshot status. The value of the status depends on the API operation used:
        # CreateClusterSnapshot and CopyClusterSnapshot returns status as "creating". DescribeClusterSnapshots
        # returns status as "creating", "available", "final snapshot", or "failed". DeleteClusterSnapshot
        # returns status as "deleted".
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The list of tags for the cluster snapshot.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The size of the complete set of backup data that would be used to restore the cluster.
        @[JSON::Field(key: "TotalBackupSizeInMegaBytes")]
        getter total_backup_size_in_mega_bytes : Float64?

        # The VPC identifier of the cluster if the snapshot is from a cluster in a VPC. Otherwise, this field
        # is not in the output.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @accounts_with_restore_access : Array(Types::AccountWithRestoreAccess)? = nil,
          @actual_incremental_backup_size_in_mega_bytes : Float64? = nil,
          @availability_zone : String? = nil,
          @backup_progress_in_mega_bytes : Float64? = nil,
          @cluster_create_time : Time? = nil,
          @cluster_identifier : String? = nil,
          @cluster_version : String? = nil,
          @current_backup_rate_in_mega_bytes_per_second : Float64? = nil,
          @db_name : String? = nil,
          @elapsed_time_in_seconds : Int64? = nil,
          @encrypted : Bool? = nil,
          @encrypted_with_hsm : Bool? = nil,
          @engine_full_version : String? = nil,
          @enhanced_vpc_routing : Bool? = nil,
          @estimated_seconds_to_completion : Int64? = nil,
          @kms_key_id : String? = nil,
          @maintenance_track_name : String? = nil,
          @manual_snapshot_remaining_days : Int32? = nil,
          @manual_snapshot_retention_period : Int32? = nil,
          @master_password_secret_arn : String? = nil,
          @master_password_secret_kms_key_id : String? = nil,
          @master_username : String? = nil,
          @node_type : String? = nil,
          @number_of_nodes : Int32? = nil,
          @owner_account : String? = nil,
          @port : Int32? = nil,
          @restorable_node_types : Array(String)? = nil,
          @snapshot_arn : String? = nil,
          @snapshot_create_time : Time? = nil,
          @snapshot_identifier : String? = nil,
          @snapshot_retention_start_time : Time? = nil,
          @snapshot_type : String? = nil,
          @source_region : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @total_backup_size_in_mega_bytes : Float64? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The cluster already has cross-region snapshot copy disabled.
      struct SnapshotCopyAlreadyDisabledFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster already has cross-region snapshot copy enabled.
      struct SnapshotCopyAlreadyEnabledFault
        include JSON::Serializable

        def initialize
        end
      end

      # Cross-region snapshot copy was temporarily disabled. Try your request again.
      struct SnapshotCopyDisabledFault
        include JSON::Serializable

        def initialize
        end
      end

      # The snapshot copy grant that grants Amazon Redshift permission to encrypt copied snapshots with the
      # specified encrypted symmetric key from Amazon Web Services KMS in the destination region. For more
      # information about managing snapshot copy grants, go to Amazon Redshift Database Encryption in the
      # Amazon Redshift Cluster Management Guide .
      struct SnapshotCopyGrant
        include JSON::Serializable

        # The unique identifier of the encrypted symmetric key in Amazon Web Services KMS to which Amazon
        # Redshift is granted permission.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The name of the snapshot copy grant.
        @[JSON::Field(key: "SnapshotCopyGrantName")]
        getter snapshot_copy_grant_name : String?

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @kms_key_id : String? = nil,
          @snapshot_copy_grant_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The snapshot copy grant can't be created because a grant with the same name already exists.
      struct SnapshotCopyGrantAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      struct SnapshotCopyGrantMessage
        include JSON::Serializable

        # An optional parameter that specifies the starting point to return a set of response records. When
        # the results of a DescribeSnapshotCopyGrant request exceed the value specified in MaxRecords , Amazon
        # Web Services returns a value in the Marker field of the response. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request. Constraints: You can specify either the SnapshotCopyGrantName parameter or the Marker
        # parameter, but not both.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The list of SnapshotCopyGrant objects.
        @[JSON::Field(key: "SnapshotCopyGrants")]
        getter snapshot_copy_grants : Array(Types::SnapshotCopyGrant)?

        def initialize(
          @marker : String? = nil,
          @snapshot_copy_grants : Array(Types::SnapshotCopyGrant)? = nil
        )
        end
      end

      # The specified snapshot copy grant can't be found. Make sure that the name is typed correctly and
      # that the grant exists in the destination region.
      struct SnapshotCopyGrantNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon Web Services account has exceeded the maximum number of snapshot copy grants in this
      # region.
      struct SnapshotCopyGrantQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the errors returned by a snapshot.
      struct SnapshotErrorMessage
        include JSON::Serializable

        # The failure code for the error.
        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # The text message describing the error.
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # A unique identifier for the cluster.
        @[JSON::Field(key: "SnapshotClusterIdentifier")]
        getter snapshot_cluster_identifier : String?

        # A unique identifier for the snapshot returning the error.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String?

        def initialize(
          @failure_code : String? = nil,
          @failure_reason : String? = nil,
          @snapshot_cluster_identifier : String? = nil,
          @snapshot_identifier : String? = nil
        )
        end
      end

      # Contains the output from the DescribeClusterSnapshots action.
      struct SnapshotMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of Snapshot instances.
        @[JSON::Field(key: "Snapshots")]
        getter snapshots : Array(Types::Snapshot)?

        def initialize(
          @marker : String? = nil,
          @snapshots : Array(Types::Snapshot)? = nil
        )
        end
      end

      # Describes a snapshot schedule. You can set a regular interval for creating snapshots of a cluster.
      # You can also schedule snapshots for specific dates.
      struct SnapshotSchedule
        include JSON::Serializable

        # The number of clusters associated with the schedule.
        @[JSON::Field(key: "AssociatedClusterCount")]
        getter associated_cluster_count : Int32?

        # A list of clusters associated with the schedule. A maximum of 100 clusters is returned.
        @[JSON::Field(key: "AssociatedClusters")]
        getter associated_clusters : Array(Types::ClusterAssociatedToSchedule)?

        @[JSON::Field(key: "NextInvocations")]
        getter next_invocations : Array(Time)?

        # A list of ScheduleDefinitions.
        @[JSON::Field(key: "ScheduleDefinitions")]
        getter schedule_definitions : Array(String)?

        # The description of the schedule.
        @[JSON::Field(key: "ScheduleDescription")]
        getter schedule_description : String?

        # A unique identifier for the schedule.
        @[JSON::Field(key: "ScheduleIdentifier")]
        getter schedule_identifier : String?

        # An optional set of tags describing the schedule.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @associated_cluster_count : Int32? = nil,
          @associated_clusters : Array(Types::ClusterAssociatedToSchedule)? = nil,
          @next_invocations : Array(Time)? = nil,
          @schedule_definitions : Array(String)? = nil,
          @schedule_description : String? = nil,
          @schedule_identifier : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The specified snapshot schedule already exists.
      struct SnapshotScheduleAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # We could not find the specified snapshot schedule.
      struct SnapshotScheduleNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # You have exceeded the quota of snapshot schedules.
      struct SnapshotScheduleQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified snapshot schedule is already being updated.
      struct SnapshotScheduleUpdateInProgressFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a sorting entity
      struct SnapshotSortingEntity
        include JSON::Serializable

        # The category for sorting the snapshots.
        @[JSON::Field(key: "Attribute")]
        getter attribute : String

        # The order for listing the attributes.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @attribute : String,
          @sort_order : String? = nil
        )
        end
      end

      # The specified Amazon Redshift event source could not be found.
      struct SourceNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a subnet.
      struct Subnet
        include JSON::Serializable

        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : Types::AvailabilityZone?

        # The identifier of the subnet.
        @[JSON::Field(key: "SubnetIdentifier")]
        getter subnet_identifier : String?

        # The status of the subnet.
        @[JSON::Field(key: "SubnetStatus")]
        getter subnet_status : String?

        def initialize(
          @subnet_availability_zone : Types::AvailabilityZone? = nil,
          @subnet_identifier : String? = nil,
          @subnet_status : String? = nil
        )
        end
      end

      # A specified subnet is already in use by another cluster.
      struct SubnetAlreadyInUse
        include JSON::Serializable

        def initialize
        end
      end

      # There is already an existing event notification subscription with the specified name.
      struct SubscriptionAlreadyExistFault
        include JSON::Serializable

        def initialize
        end
      end

      # The value specified for the event category was not one of the allowed values, or it specified a
      # category that does not apply to the specified source type. The allowed values are Configuration,
      # Management, Monitoring, and Security.
      struct SubscriptionCategoryNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # An Amazon Redshift event with the specified event ID does not exist.
      struct SubscriptionEventIdNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # An Amazon Redshift event notification subscription with the specified name does not exist.
      struct SubscriptionNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The value specified for the event severity was not one of the allowed values, or it specified a
      # severity that does not apply to the specified source type. The allowed values are ERROR and INFO.
      struct SubscriptionSeverityNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the operations that are allowed on a maintenance track.
      struct SupportedOperation
        include JSON::Serializable

        # A list of the supported operations.
        @[JSON::Field(key: "OperationName")]
        getter operation_name : String?

        def initialize(
          @operation_name : String? = nil
        )
        end
      end

      # A list of supported platforms for orderable clusters.
      struct SupportedPlatform
        include JSON::Serializable

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # The number of tables in the cluster exceeds the limit for the requested new cluster node type.
      struct TableLimitExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified TableRestoreRequestId value was not found.
      struct TableRestoreNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the status of a RestoreTableFromClusterSnapshot operation.
      struct TableRestoreStatus
        include JSON::Serializable

        # The identifier of the Amazon Redshift cluster that the table is being restored to.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # A description of the status of the table restore request. Status values include SUCCEEDED , FAILED ,
        # CANCELED , PENDING , IN_PROGRESS .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the table to create as a result of the table restore request.
        @[JSON::Field(key: "NewTableName")]
        getter new_table_name : String?

        # The amount of data restored to the new table so far, in megabytes (MB).
        @[JSON::Field(key: "ProgressInMegaBytes")]
        getter progress_in_mega_bytes : Int64?

        # The time that the table restore request was made, in Universal Coordinated Time (UTC).
        @[JSON::Field(key: "RequestTime")]
        getter request_time : Time?

        # The identifier of the snapshot that the table is being restored from.
        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String?

        # The name of the source database that contains the table being restored.
        @[JSON::Field(key: "SourceDatabaseName")]
        getter source_database_name : String?

        # The name of the source schema that contains the table being restored.
        @[JSON::Field(key: "SourceSchemaName")]
        getter source_schema_name : String?

        # The name of the source table being restored.
        @[JSON::Field(key: "SourceTableName")]
        getter source_table_name : String?

        # A value that describes the current state of the table restore request. Valid Values: SUCCEEDED ,
        # FAILED , CANCELED , PENDING , IN_PROGRESS
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The unique identifier for the table restore request.
        @[JSON::Field(key: "TableRestoreRequestId")]
        getter table_restore_request_id : String?

        # The name of the database to restore the table to.
        @[JSON::Field(key: "TargetDatabaseName")]
        getter target_database_name : String?

        # The name of the schema to restore the table to.
        @[JSON::Field(key: "TargetSchemaName")]
        getter target_schema_name : String?

        # The total amount of data to restore to the new table, in megabytes (MB).
        @[JSON::Field(key: "TotalDataInMegaBytes")]
        getter total_data_in_mega_bytes : Int64?

        def initialize(
          @cluster_identifier : String? = nil,
          @message : String? = nil,
          @new_table_name : String? = nil,
          @progress_in_mega_bytes : Int64? = nil,
          @request_time : Time? = nil,
          @snapshot_identifier : String? = nil,
          @source_database_name : String? = nil,
          @source_schema_name : String? = nil,
          @source_table_name : String? = nil,
          @status : String? = nil,
          @table_restore_request_id : String? = nil,
          @target_database_name : String? = nil,
          @target_schema_name : String? = nil,
          @total_data_in_mega_bytes : Int64? = nil
        )
        end
      end

      struct TableRestoreStatusMessage
        include JSON::Serializable

        # A pagination token that can be used in a subsequent DescribeTableRestoreStatus request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of status details for one or more table restore requests.
        @[JSON::Field(key: "TableRestoreStatusDetails")]
        getter table_restore_status_details : Array(Types::TableRestoreStatus)?

        def initialize(
          @marker : String? = nil,
          @table_restore_status_details : Array(Types::TableRestoreStatus)? = nil
        )
        end
      end

      # A tag consisting of a name/value pair for a resource.
      struct Tag
        include JSON::Serializable

        # The key, or name, for the resource tag.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value for the resource tag.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # You have exceeded the number of tags allowed.
      struct TagLimitExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # A tag and its associated resource.
      struct TaggedResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) with which the tag is associated, for example:
        # arn:aws:redshift:us-east-2:123456789:cluster:t1 .
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of resource with which the tag is associated. Valid resource types are: Cluster CIDR/IP EC2
        # security group Snapshot Cluster security group Subnet group HSM connection HSM certificate Parameter
        # group For more information about Amazon Redshift resource types and constructing ARNs, go to
        # Constructing an Amazon Redshift Amazon Resource Name (ARN) in the Amazon Redshift Cluster Management
        # Guide.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The tag for the resource.
        @[JSON::Field(key: "Tag")]
        getter tag : Types::Tag?

        def initialize(
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @tag : Types::Tag? = nil
        )
        end
      end

      struct TaggedResourceListMessage
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of tags with their associated resources.
        @[JSON::Field(key: "TaggedResources")]
        getter tagged_resources : Array(Types::TaggedResource)?

        def initialize(
          @marker : String? = nil,
          @tagged_resources : Array(Types::TaggedResource)? = nil
        )
        end
      end

      struct TrackListMessage
        include JSON::Serializable

        # A list of maintenance tracks output by the DescribeClusterTracks operation.
        @[JSON::Field(key: "MaintenanceTracks")]
        getter maintenance_tracks : Array(Types::MaintenanceTrack)?

        # The starting point to return a set of response tracklist records. You can retrieve the next set of
        # response records by providing the returned marker value in the Marker parameter and retrying the
        # request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @maintenance_tracks : Array(Types::MaintenanceTrack)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Your account is not authorized to perform the requested operation.
      struct UnauthorizedOperation
        include JSON::Serializable

        def initialize
        end
      end

      # The partner integration is not authorized.
      struct UnauthorizedPartnerIntegrationFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified region is incorrect or does not exist.
      struct UnknownSnapshotCopyRegionFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation isn't supported.
      struct UnsupportedOperationFault
        include JSON::Serializable

        def initialize
        end
      end

      # A request option was specified that is not supported.
      struct UnsupportedOptionFault
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdatePartnerStatusInputMessage
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the cluster.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The cluster identifier of the cluster whose partner integration status is being updated.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        # The name of the database whose partner integration status is being updated.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of the partner whose integration status is being updated.
        @[JSON::Field(key: "PartnerName")]
        getter partner_name : String

        # The value of the updated status.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The status message provided by the partner.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @account_id : String,
          @cluster_identifier : String,
          @database_name : String,
          @partner_name : String,
          @status : String,
          @status_message : String? = nil
        )
        end
      end

      # A maintenance track that you can switch the current track to.
      struct UpdateTarget
        include JSON::Serializable

        # The cluster version for the new maintenance track.
        @[JSON::Field(key: "DatabaseVersion")]
        getter database_version : String?

        # The name of the new maintenance track.
        @[JSON::Field(key: "MaintenanceTrackName")]
        getter maintenance_track_name : String?

        # A list of operations supported by the maintenance track.
        @[JSON::Field(key: "SupportedOperations")]
        getter supported_operations : Array(Types::SupportedOperation)?

        def initialize(
          @database_version : String? = nil,
          @maintenance_track_name : String? = nil,
          @supported_operations : Array(Types::SupportedOperation)? = nil
        )
        end
      end

      # Describes a usage limit object for a cluster.
      struct UsageLimit
        include JSON::Serializable

        # The limit amount. If time-based, this amount is in minutes. If data-based, this amount is in
        # terabytes (TB).
        @[JSON::Field(key: "Amount")]
        getter amount : Int64?

        # The action that Amazon Redshift takes when the limit is reached. Possible values are: log - To log
        # an event in a system table. The default is log. emit-metric - To emit CloudWatch metrics. disable -
        # To disable the feature until the next usage period begins.
        @[JSON::Field(key: "BreachAction")]
        getter breach_action : String?

        # The identifier of the cluster with a usage limit.
        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The Amazon Redshift feature to which the limit applies.
        @[JSON::Field(key: "FeatureType")]
        getter feature_type : String?

        # The type of limit. Depending on the feature type, this can be based on a time duration or data size.
        @[JSON::Field(key: "LimitType")]
        getter limit_type : String?

        # The time period that the amount applies to. A weekly period begins on Sunday. The default is monthly
        # .
        @[JSON::Field(key: "Period")]
        getter period : String?

        # A list of tag instances.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The identifier of the usage limit.
        @[JSON::Field(key: "UsageLimitId")]
        getter usage_limit_id : String?

        def initialize(
          @amount : Int64? = nil,
          @breach_action : String? = nil,
          @cluster_identifier : String? = nil,
          @feature_type : String? = nil,
          @limit_type : String? = nil,
          @period : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @usage_limit_id : String? = nil
        )
        end
      end

      # The usage limit already exists.
      struct UsageLimitAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      struct UsageLimitList
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned marker value in the Marker parameter and retrying the command. If the Marker field is
        # empty, all response records have been retrieved for the request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Contains the output from the DescribeUsageLimits action.
        @[JSON::Field(key: "UsageLimits")]
        getter usage_limits : Array(Types::UsageLimit)?

        def initialize(
          @marker : String? = nil,
          @usage_limits : Array(Types::UsageLimit)? = nil
        )
        end
      end

      # The usage limit identifier can't be found.
      struct UsageLimitNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The connection endpoint for connecting to an Amazon Redshift cluster through the proxy.
      struct VpcEndpoint
        include JSON::Serializable

        # One or more network interfaces of the endpoint. Also known as an interface endpoint.
        @[JSON::Field(key: "NetworkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # The connection endpoint ID for connecting an Amazon Redshift cluster through the proxy.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The VPC identifier that the endpoint is associated.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @vpc_endpoint_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Describes the members of a VPC security group.
      struct VpcSecurityGroupMembership
        include JSON::Serializable

        # The status of the VPC security group.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The identifier of the VPC security group.
        @[JSON::Field(key: "VpcSecurityGroupId")]
        getter vpc_security_group_id : String?

        def initialize(
          @status : String? = nil,
          @vpc_security_group_id : String? = nil
        )
        end
      end
    end
  end
end
