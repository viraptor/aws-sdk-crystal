require "json"
require "time"

module Aws
  module DocDB
    module Types

      # Represents the input to AddSourceIdentifierToSubscription .

      struct AddSourceIdentifierToSubscriptionMessage
        include JSON::Serializable

        # The identifier of the event source to be added: If the source type is an instance, a
        # DBInstanceIdentifier must be provided. If the source type is a security group, a DBSecurityGroupName
        # must be provided. If the source type is a parameter group, a DBParameterGroupName must be provided.
        # If the source type is a snapshot, a DBSnapshotIdentifier must be provided.

        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String

        # The name of the Amazon DocumentDB event notification subscription that you want to add a source
        # identifier to.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        def initialize(
          @source_identifier : String,
          @subscription_name : String
        )
        end
      end


      struct AddSourceIdentifierToSubscriptionResult
        include JSON::Serializable


        @[JSON::Field(key: "EventSubscription")]
        getter event_subscription : Types::EventSubscription?

        def initialize(
          @event_subscription : Types::EventSubscription? = nil
        )
        end
      end

      # Represents the input to AddTagsToResource .

      struct AddTagsToResourceMessage
        include JSON::Serializable

        # The Amazon DocumentDB resource that the tags are added to. This value is an Amazon Resource Name .

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The tags to be assigned to the Amazon DocumentDB resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Represents the input to ApplyPendingMaintenanceAction .

      struct ApplyPendingMaintenanceActionMessage
        include JSON::Serializable

        # The pending maintenance action to apply to this resource. Valid values: system-update , db-upgrade

        @[JSON::Field(key: "ApplyAction")]
        getter apply_action : String

        # A value that specifies the type of opt-in request or undoes an opt-in request. An opt-in request of
        # type immediate can't be undone. Valid values: immediate - Apply the maintenance action immediately.
        # next-maintenance - Apply the maintenance action during the next maintenance window for the resource.
        # undo-opt-in - Cancel any existing next-maintenance opt-in requests.

        @[JSON::Field(key: "OptInType")]
        getter opt_in_type : String

        # The Amazon Resource Name (ARN) of the resource that the pending maintenance action applies to.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        def initialize(
          @apply_action : String,
          @opt_in_type : String,
          @resource_identifier : String
        )
        end
      end


      struct ApplyPendingMaintenanceActionResult
        include JSON::Serializable


        @[JSON::Field(key: "ResourcePendingMaintenanceActions")]
        getter resource_pending_maintenance_actions : Types::ResourcePendingMaintenanceActions?

        def initialize(
          @resource_pending_maintenance_actions : Types::ResourcePendingMaintenanceActions? = nil
        )
        end
      end

      # The specified CIDR IP or Amazon EC2 security group isn't authorized for the specified security
      # group. Amazon DocumentDB also might not be authorized to perform necessary actions on your behalf
      # using IAM.

      struct AuthorizationNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an Availability Zone.

      struct AvailabilityZone
        include JSON::Serializable

        # The name of the Availability Zone.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # A certificate authority (CA) certificate for an Amazon Web Services account.

      struct Certificate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the certificate. Example: arn:aws:rds:us-east-1::cert:rds-ca-2019

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The unique key that identifies a certificate. Example: rds-ca-2019

        @[JSON::Field(key: "CertificateIdentifier")]
        getter certificate_identifier : String?

        # The type of the certificate. Example: CA

        @[JSON::Field(key: "CertificateType")]
        getter certificate_type : String?

        # The thumbprint of the certificate.

        @[JSON::Field(key: "Thumbprint")]
        getter thumbprint : String?

        # The starting date-time from which the certificate is valid. Example: 2019-07-31T17:57:09Z

        @[JSON::Field(key: "ValidFrom")]
        getter valid_from : Time?

        # The date-time after which the certificate is no longer valid. Example: 2024-07-31T17:57:09Z

        @[JSON::Field(key: "ValidTill")]
        getter valid_till : Time?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_identifier : String? = nil,
          @certificate_type : String? = nil,
          @thumbprint : String? = nil,
          @valid_from : Time? = nil,
          @valid_till : Time? = nil
        )
        end
      end

      # Returns the details of the DB instance’s server certificate. For more information, see Updating Your
      # Amazon DocumentDB TLS Certificates and Encrypting Data in Transit in the Amazon DocumentDB Developer
      # Guide .

      struct CertificateDetails
        include JSON::Serializable

        # The CA identifier of the CA certificate used for the DB instance's server certificate.

        @[JSON::Field(key: "CAIdentifier")]
        getter ca_identifier : String?

        # The expiration date of the DB instance’s server certificate.

        @[JSON::Field(key: "ValidTill")]
        getter valid_till : Time?

        def initialize(
          @ca_identifier : String? = nil,
          @valid_till : Time? = nil
        )
        end
      end


      struct CertificateMessage
        include JSON::Serializable

        # A list of certificates for this Amazon Web Services account.

        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::Certificate)?

        # An optional pagination token provided if the number of records retrieved is greater than MaxRecords
        # . If this parameter is specified, the marker specifies the next record in the list. Including the
        # value of Marker in the next call to DescribeCertificates results in the next page of certificates.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @certificates : Array(Types::Certificate)? = nil,
          @marker : String? = nil
        )
        end
      end

      # CertificateIdentifier doesn't refer to an existing certificate.

      struct CertificateNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration setting for the log types to be enabled for export to Amazon CloudWatch Logs for a
      # specific instance or cluster. The EnableLogTypes and DisableLogTypes arrays determine which logs are
      # exported (or not exported) to CloudWatch Logs. The values within these arrays depend on the engine
      # that is being used.

      struct CloudwatchLogsExportConfiguration
        include JSON::Serializable

        # The list of log types to disable.

        @[JSON::Field(key: "DisableLogTypes")]
        getter disable_log_types : Array(String)?

        # The list of log types to enable.

        @[JSON::Field(key: "EnableLogTypes")]
        getter enable_log_types : Array(String)?

        def initialize(
          @disable_log_types : Array(String)? = nil,
          @enable_log_types : Array(String)? = nil
        )
        end
      end

      # Contains the secret managed by Amazon DocumentDB in Amazon Web Services Secrets Manager for the
      # master user password.

      struct ClusterMasterUserSecret
        include JSON::Serializable

        # The Amazon Web Services KMS key identifier that is used to encrypt the secret.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The Amazon Resource Name (ARN) of the secret.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The status of the secret. The possible status values include the following: creating - The secret is
        # being created. active - The secret is available for normal use and rotation. rotating - The secret
        # is being rotated. impaired - The secret can be used to access database credentials, but it can't be
        # rotated. A secret might have this status if, for example, permissions are changed so that Amazon
        # DocumentDB can no longer access either the secret or the KMS key for the secret. When a secret has
        # this status, you can correct the condition that caused the status. Alternatively, modify the
        # instance to turn off automatic management of database credentials, and then modify the instance
        # again to turn on automatic management of database credentials.

        @[JSON::Field(key: "SecretStatus")]
        getter secret_status : String?

        def initialize(
          @kms_key_id : String? = nil,
          @secret_arn : String? = nil,
          @secret_status : String? = nil
        )
        end
      end

      # Represents the input to CopyDBClusterParameterGroup .

      struct CopyDBClusterParameterGroupMessage
        include JSON::Serializable

        # The identifier or Amazon Resource Name (ARN) for the source cluster parameter group. Constraints:
        # Must specify a valid cluster parameter group. If the source cluster parameter group is in the same
        # Amazon Web Services Region as the copy, specify a valid parameter group identifier; for example,
        # my-db-cluster-param-group , or a valid ARN. If the source parameter group is in a different Amazon
        # Web Services Region than the copy, specify a valid cluster parameter group ARN; for example,
        # arn:aws:rds:us-east-1:123456789012:sample-cluster:sample-parameter-group .

        @[JSON::Field(key: "SourceDBClusterParameterGroupIdentifier")]
        getter source_db_cluster_parameter_group_identifier : String

        # A description for the copied cluster parameter group.

        @[JSON::Field(key: "TargetDBClusterParameterGroupDescription")]
        getter target_db_cluster_parameter_group_description : String

        # The identifier for the copied cluster parameter group. Constraints: Cannot be null, empty, or blank.
        # Must contain from 1 to 255 letters, numbers, or hyphens. The first character must be a letter.
        # Cannot end with a hyphen or contain two consecutive hyphens. Example: my-cluster-param-group1

        @[JSON::Field(key: "TargetDBClusterParameterGroupIdentifier")]
        getter target_db_cluster_parameter_group_identifier : String

        # The tags that are to be assigned to the parameter group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @source_db_cluster_parameter_group_identifier : String,
          @target_db_cluster_parameter_group_description : String,
          @target_db_cluster_parameter_group_identifier : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CopyDBClusterParameterGroupResult
        include JSON::Serializable


        @[JSON::Field(key: "DBClusterParameterGroup")]
        getter db_cluster_parameter_group : Types::DBClusterParameterGroup?

        def initialize(
          @db_cluster_parameter_group : Types::DBClusterParameterGroup? = nil
        )
        end
      end

      # Represents the input to CopyDBClusterSnapshot .

      struct CopyDBClusterSnapshotMessage
        include JSON::Serializable

        # The identifier of the cluster snapshot to copy. This parameter is not case sensitive. Constraints:
        # Must specify a valid cluster snapshot in the available state. If the source cluster snapshot is in
        # the same Amazon Web Services Region as the copy, specify a valid snapshot identifier. If the source
        # cluster snapshot is in a different Amazon Web Services Region or owned by another Amazon Web
        # Services account, specify the snapshot ARN. Example: my-cluster-snapshot1

        @[JSON::Field(key: "SourceDBClusterSnapshotIdentifier")]
        getter source_db_cluster_snapshot_identifier : String

        # The identifier of the new cluster snapshot to create from the source cluster snapshot. This
        # parameter is not case sensitive. Constraints: Must contain from 1 to 63 letters, numbers, or
        # hyphens. The first character must be a letter. Cannot end with a hyphen or contain two consecutive
        # hyphens. Example: my-cluster-snapshot2

        @[JSON::Field(key: "TargetDBClusterSnapshotIdentifier")]
        getter target_db_cluster_snapshot_identifier : String

        # Set to true to copy all tags from the source cluster snapshot to the target cluster snapshot, and
        # otherwise false . The default is false .

        @[JSON::Field(key: "CopyTags")]
        getter copy_tags : Bool?

        # The KMS key ID for an encrypted cluster snapshot. The KMS key ID is the Amazon Resource Name (ARN),
        # KMS key identifier, or the KMS key alias for the KMS encryption key. If you copy an encrypted
        # cluster snapshot from your Amazon Web Services account, you can specify a value for KmsKeyId to
        # encrypt the copy with a new KMS encryption key. If you don't specify a value for KmsKeyId , then the
        # copy of the cluster snapshot is encrypted with the same KMS key as the source cluster snapshot. If
        # you copy an encrypted cluster snapshot that is shared from another Amazon Web Services account, then
        # you must specify a value for KmsKeyId . To copy an encrypted cluster snapshot to another Amazon Web
        # Services Region, set KmsKeyId to the KMS key ID that you want to use to encrypt the copy of the
        # cluster snapshot in the destination Region. KMS encryption keys are specific to the Amazon Web
        # Services Region that they are created in, and you can't use encryption keys from one Amazon Web
        # Services Region in another Amazon Web Services Region. If you copy an unencrypted cluster snapshot
        # and specify a value for the KmsKeyId parameter, an error is returned.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The URL that contains a Signature Version 4 signed request for the CopyDBClusterSnapshot API action
        # in the Amazon Web Services Region that contains the source cluster snapshot to copy. You must use
        # the PreSignedUrl parameter when copying a cluster snapshot from another Amazon Web Services Region.
        # If you are using an Amazon Web Services SDK tool or the CLI, you can specify SourceRegion (or
        # --source-region for the CLI) instead of specifying PreSignedUrl manually. Specifying SourceRegion
        # autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the
        # source Amazon Web Services Region. The presigned URL must be a valid request for the
        # CopyDBClusterSnapshot API action that can be executed in the source Amazon Web Services Region that
        # contains the cluster snapshot to be copied. The presigned URL request must contain the following
        # parameter values: SourceRegion - The ID of the region that contains the snapshot to be copied.
        # SourceDBClusterSnapshotIdentifier - The identifier for the the encrypted cluster snapshot to be
        # copied. This identifier must be in the Amazon Resource Name (ARN) format for the source Amazon Web
        # Services Region. For example, if you are copying an encrypted cluster snapshot from the us-east-1
        # Amazon Web Services Region, then your SourceDBClusterSnapshotIdentifier looks something like the
        # following: arn:aws:rds:us-east-1:12345678012:sample-cluster:sample-cluster-snapshot .
        # TargetDBClusterSnapshotIdentifier - The identifier for the new cluster snapshot to be created. This
        # parameter isn't case sensitive.

        @[JSON::Field(key: "PreSignedUrl")]
        getter pre_signed_url : String?

        # The tags to be assigned to the cluster snapshot.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @source_db_cluster_snapshot_identifier : String,
          @target_db_cluster_snapshot_identifier : String,
          @copy_tags : Bool? = nil,
          @kms_key_id : String? = nil,
          @pre_signed_url : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CopyDBClusterSnapshotResult
        include JSON::Serializable


        @[JSON::Field(key: "DBClusterSnapshot")]
        getter db_cluster_snapshot : Types::DBClusterSnapshot?

        def initialize(
          @db_cluster_snapshot : Types::DBClusterSnapshot? = nil
        )
        end
      end

      # Represents the input to CreateDBCluster .

      struct CreateDBClusterMessage
        include JSON::Serializable

        # The cluster identifier. This parameter is stored as a lowercase string. Constraints: Must contain
        # from 1 to 63 letters, numbers, or hyphens. The first character must be a letter. Cannot end with a
        # hyphen or contain two consecutive hyphens. Example: my-cluster

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The name of the database engine to be used for this cluster. Valid values: docdb

        @[JSON::Field(key: "Engine")]
        getter engine : String

        # A list of Amazon EC2 Availability Zones that instances in the cluster can be created in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The number of days for which automated backups are retained. You must specify a minimum value of 1.
        # Default: 1 Constraints: Must be a value from 1 to 35.

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # The name of the cluster parameter group to associate with this cluster.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # A subnet group to associate with this cluster. Constraints: Must match the name of an existing
        # DBSubnetGroup . Must not be default. Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # Specifies whether this cluster can be deleted. If DeletionProtection is enabled, the cluster cannot
        # be deleted unless it is modified and DeletionProtection is disabled. DeletionProtection protects
        # clusters from being accidentally deleted.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # A list of log types that need to be enabled for exporting to Amazon CloudWatch Logs. You can enable
        # audit logs or profiler logs. For more information, see Auditing Amazon DocumentDB Events and
        # Profiling Amazon DocumentDB Operations .

        @[JSON::Field(key: "EnableCloudwatchLogsExports")]
        getter enable_cloudwatch_logs_exports : Array(String)?

        # The version number of the database engine to use. The --engine-version will default to the latest
        # major engine version. For production workloads, we recommend explicitly declaring this parameter
        # with the intended major engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The cluster identifier of the new global cluster.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String?

        # The KMS key identifier for an encrypted cluster. The KMS key identifier is the Amazon Resource Name
        # (ARN) for the KMS encryption key. If you are creating a cluster using the same Amazon Web Services
        # account that owns the KMS encryption key that is used to encrypt the new cluster, you can use the
        # KMS key alias instead of the ARN for the KMS encryption key. If an encryption key is not specified
        # in KmsKeyId : If the StorageEncrypted parameter is true , Amazon DocumentDB uses your default
        # encryption key. KMS creates the default encryption key for your Amazon Web Services account. Your
        # Amazon Web Services account has a different default encryption key for each Amazon Web Services
        # Regions.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies whether to manage the master user password with Amazon Web Services Secrets Manager.
        # Constraint: You can't manage the master user password with Amazon Web Services Secrets Manager if
        # MasterUserPassword is specified.

        @[JSON::Field(key: "ManageMasterUserPassword")]
        getter manage_master_user_password : Bool?

        # The password for the master database user. This password can contain any printable ASCII character
        # except forward slash (/), double quote ("), or the "at" symbol (@). Constraints: Must contain from 8
        # to 100 characters.

        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # The Amazon Web Services KMS key identifier to encrypt a secret that is automatically generated and
        # managed in Amazon Web Services Secrets Manager. This setting is valid only if the master user
        # password is managed by Amazon DocumentDB in Amazon Web Services Secrets Manager for the DB cluster.
        # The Amazon Web Services KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the
        # KMS key. To use a KMS key in a different Amazon Web Services account, specify the key ARN or alias
        # ARN. If you don't specify MasterUserSecretKmsKeyId , then the aws/secretsmanager KMS key is used to
        # encrypt the secret. If the secret is in a different Amazon Web Services account, then you can't use
        # the aws/secretsmanager KMS key to encrypt the secret, and you must use a customer managed KMS key.
        # There is a default KMS key for your Amazon Web Services account. Your Amazon Web Services account
        # has a different default KMS key for each Amazon Web Services Region.

        @[JSON::Field(key: "MasterUserSecretKmsKeyId")]
        getter master_user_secret_kms_key_id : String?

        # The name of the master user for the cluster. Constraints: Must be from 1 to 63 letters or numbers.
        # The first character must be a letter. Cannot be a reserved word for the chosen database engine.

        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # The network type of the cluster. The network type is determined by the DBSubnetGroup specified for
        # the cluster. A DBSubnetGroup can support only the IPv4 protocol or the IPv4 and the IPv6 protocols (
        # DUAL ). For more information, see DocumentDB clusters in a VPC in the Amazon DocumentDB Developer
        # Guide. Valid Values: IPV4 | DUAL

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The port number on which the instances in the cluster accept connections.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Not currently supported.

        @[JSON::Field(key: "PreSignedUrl")]
        getter pre_signed_url : String?

        # The daily time range during which automated backups are created if automated backups are enabled
        # using the BackupRetentionPeriod parameter. The default is a 30-minute window selected at random from
        # an 8-hour block of time for each Amazon Web Services Region. Constraints: Must be in the format
        # hh24:mi-hh24:mi . Must be in Universal Coordinated Time (UTC). Must not conflict with the preferred
        # maintenance window. Must be at least 30 minutes.

        @[JSON::Field(key: "PreferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format: ddd:hh24:mi-ddd:hh24:mi The default is a 30-minute window selected at random from an
        # 8-hour block of time for each Amazon Web Services Region, occurring on a random day of the week.
        # Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Contains the scaling configuration of an Amazon DocumentDB Serverless cluster.

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration?

        # Specifies whether the cluster is encrypted.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # The storage type to associate with the DB cluster. For information on storage types for Amazon
        # DocumentDB clusters, see Cluster storage configurations in the Amazon DocumentDB Developer Guide .
        # Valid values for storage type - standard | iopt1 Default value is standard When you create an Amazon
        # DocumentDB cluster with the storage type set to iopt1 , the storage type is returned in the
        # response. The storage type isn't returned when you set it to standard .

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The tags to be assigned to the cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A list of EC2 VPC security groups to associate with this cluster.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_cluster_identifier : String,
          @engine : String,
          @availability_zones : Array(String)? = nil,
          @backup_retention_period : Int32? = nil,
          @db_cluster_parameter_group_name : String? = nil,
          @db_subnet_group_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @enable_cloudwatch_logs_exports : Array(String)? = nil,
          @engine_version : String? = nil,
          @global_cluster_identifier : String? = nil,
          @kms_key_id : String? = nil,
          @manage_master_user_password : Bool? = nil,
          @master_user_password : String? = nil,
          @master_user_secret_kms_key_id : String? = nil,
          @master_username : String? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @pre_signed_url : String? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
          @storage_encrypted : Bool? = nil,
          @storage_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      # Represents the input of CreateDBClusterParameterGroup .

      struct CreateDBClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the cluster parameter group. Constraints: Must not match the name of an existing
        # DBClusterParameterGroup . This value is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String

        # The cluster parameter group family name.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String

        # The description for the cluster parameter group.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The tags to be assigned to the cluster parameter group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @db_cluster_parameter_group_name : String,
          @db_parameter_group_family : String,
          @description : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDBClusterParameterGroupResult
        include JSON::Serializable


        @[JSON::Field(key: "DBClusterParameterGroup")]
        getter db_cluster_parameter_group : Types::DBClusterParameterGroup?

        def initialize(
          @db_cluster_parameter_group : Types::DBClusterParameterGroup? = nil
        )
        end
      end


      struct CreateDBClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "DBCluster")]
        getter db_cluster : Types::DBCluster?

        def initialize(
          @db_cluster : Types::DBCluster? = nil
        )
        end
      end

      # Represents the input of CreateDBClusterSnapshot .

      struct CreateDBClusterSnapshotMessage
        include JSON::Serializable

        # The identifier of the cluster to create a snapshot for. This parameter is not case sensitive.
        # Constraints: Must match the identifier of an existing DBCluster . Example: my-cluster

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The identifier of the cluster snapshot. This parameter is stored as a lowercase string. Constraints:
        # Must contain from 1 to 63 letters, numbers, or hyphens. The first character must be a letter. Cannot
        # end with a hyphen or contain two consecutive hyphens. Example: my-cluster-snapshot1

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String

        # The tags to be assigned to the cluster snapshot.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @db_cluster_identifier : String,
          @db_cluster_snapshot_identifier : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDBClusterSnapshotResult
        include JSON::Serializable


        @[JSON::Field(key: "DBClusterSnapshot")]
        getter db_cluster_snapshot : Types::DBClusterSnapshot?

        def initialize(
          @db_cluster_snapshot : Types::DBClusterSnapshot? = nil
        )
        end
      end

      # Represents the input to CreateDBInstance .

      struct CreateDBInstanceMessage
        include JSON::Serializable

        # The identifier of the cluster that the instance will belong to.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The compute and memory capacity of the instance; for example, db.r5.large .

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String

        # The instance identifier. This parameter is stored as a lowercase string. Constraints: Must contain
        # from 1 to 63 letters, numbers, or hyphens. The first character must be a letter. Cannot end with a
        # hyphen or contain two consecutive hyphens. Example: mydbinstance

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String

        # The name of the database engine to be used for this instance. Valid value: docdb

        @[JSON::Field(key: "Engine")]
        getter engine : String

        # This parameter does not apply to Amazon DocumentDB. Amazon DocumentDB does not perform minor version
        # upgrades regardless of the value set. Default: false

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # The Amazon EC2 Availability Zone that the instance is created in. Default: A random, system-chosen
        # Availability Zone in the endpoint's Amazon Web Services Region. Example: us-east-1d

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The CA certificate identifier to use for the DB instance's server certificate. For more information,
        # see Updating Your Amazon DocumentDB TLS Certificates and Encrypting Data in Transit in the Amazon
        # DocumentDB Developer Guide .

        @[JSON::Field(key: "CACertificateIdentifier")]
        getter ca_certificate_identifier : String?

        # A value that indicates whether to copy tags from the DB instance to snapshots of the DB instance. By
        # default, tags are not copied.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # A value that indicates whether to enable Performance Insights for the DB Instance. For more
        # information, see Using Amazon Performance Insights .

        @[JSON::Field(key: "EnablePerformanceInsights")]
        getter enable_performance_insights : Bool?

        # The KMS key identifier for encryption of Performance Insights data. The KMS key identifier is the
        # key ARN, key ID, alias ARN, or alias name for the KMS key. If you do not specify a value for
        # PerformanceInsightsKMSKeyId, then Amazon DocumentDB uses your default KMS key. There is a default
        # KMS key for your Amazon Web Services account. Your Amazon Web Services account has a different
        # default KMS key for each Amazon Web Services region.

        @[JSON::Field(key: "PerformanceInsightsKMSKeyId")]
        getter performance_insights_kms_key_id : String?

        # The time range each week during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format: ddd:hh24:mi-ddd:hh24:mi The default is a 30-minute window selected at random from an
        # 8-hour block of time for each Amazon Web Services Region, occurring on a random day of the week.
        # Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # A value that specifies the order in which an Amazon DocumentDB replica is promoted to the primary
        # instance after a failure of the existing primary instance. Default: 1 Valid values: 0-15

        @[JSON::Field(key: "PromotionTier")]
        getter promotion_tier : Int32?

        # The tags to be assigned to the instance. You can assign up to 10 tags to an instance.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @db_cluster_identifier : String,
          @db_instance_class : String,
          @db_instance_identifier : String,
          @engine : String,
          @auto_minor_version_upgrade : Bool? = nil,
          @availability_zone : String? = nil,
          @ca_certificate_identifier : String? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @enable_performance_insights : Bool? = nil,
          @performance_insights_kms_key_id : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @promotion_tier : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDBInstanceResult
        include JSON::Serializable


        @[JSON::Field(key: "DBInstance")]
        getter db_instance : Types::DBInstance?

        def initialize(
          @db_instance : Types::DBInstance? = nil
        )
        end
      end

      # Represents the input to CreateDBSubnetGroup .

      struct CreateDBSubnetGroupMessage
        include JSON::Serializable

        # The description for the subnet group.

        @[JSON::Field(key: "DBSubnetGroupDescription")]
        getter db_subnet_group_description : String

        # The name for the subnet group. This value is stored as a lowercase string. Constraints: Must contain
        # no more than 255 letters, numbers, periods, underscores, spaces, or hyphens. Must not be default.
        # Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String

        # The Amazon EC2 subnet IDs for the subnet group.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The tags to be assigned to the subnet group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @db_subnet_group_description : String,
          @db_subnet_group_name : String,
          @subnet_ids : Array(String),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDBSubnetGroupResult
        include JSON::Serializable


        @[JSON::Field(key: "DBSubnetGroup")]
        getter db_subnet_group : Types::DBSubnetGroup?

        def initialize(
          @db_subnet_group : Types::DBSubnetGroup? = nil
        )
        end
      end

      # Represents the input to CreateEventSubscription .

      struct CreateEventSubscriptionMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SNS topic created for event notification. Amazon SNS creates
        # the ARN when you create a topic and subscribe to it.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String

        # The name of the subscription. Constraints: The name must be fewer than 255 characters.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        # A Boolean value; set to true to activate the subscription, set to false to create the subscription
        # but not active it.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A list of event categories for a SourceType that you want to subscribe to.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The list of identifiers of the event sources for which events are returned. If not specified, then
        # all sources are included in the response. An identifier must begin with a letter and must contain
        # only ASCII letters, digits, and hyphens; it can't end with a hyphen or contain two consecutive
        # hyphens. Constraints: If SourceIds are provided, SourceType must also be provided. If the source
        # type is an instance, a DBInstanceIdentifier must be provided. If the source type is a security
        # group, a DBSecurityGroupName must be provided. If the source type is a parameter group, a
        # DBParameterGroupName must be provided. If the source type is a snapshot, a DBSnapshotIdentifier must
        # be provided.

        @[JSON::Field(key: "SourceIds")]
        getter source_ids : Array(String)?

        # The type of source that is generating the events. For example, if you want to be notified of events
        # generated by an instance, you would set this parameter to db-instance . If this value is not
        # specified, all events are returned. Valid values: db-instance , db-cluster , db-parameter-group ,
        # db-security-group , db-cluster-snapshot

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The tags to be assigned to the event subscription.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @sns_topic_arn : String,
          @subscription_name : String,
          @enabled : Bool? = nil,
          @event_categories : Array(String)? = nil,
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

      # Represents the input to CreateGlobalCluster .

      struct CreateGlobalClusterMessage
        include JSON::Serializable

        # The cluster identifier of the new global cluster.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        # The name for your database of up to 64 alpha-numeric characters. If you do not provide a name,
        # Amazon DocumentDB will not create a database in the global cluster you are creating.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The deletion protection setting for the new global cluster. The global cluster can't be deleted when
        # deletion protection is enabled.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The name of the database engine to be used for this cluster.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The engine version of the global cluster.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The Amazon Resource Name (ARN) to use as the primary cluster of the global cluster. This parameter
        # is optional.

        @[JSON::Field(key: "SourceDBClusterIdentifier")]
        getter source_db_cluster_identifier : String?

        # The storage encryption setting for the new global cluster.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        def initialize(
          @global_cluster_identifier : String,
          @database_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @source_db_cluster_identifier : String? = nil,
          @storage_encrypted : Bool? = nil
        )
        end
      end


      struct CreateGlobalClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "GlobalCluster")]
        getter global_cluster : Types::GlobalCluster?

        def initialize(
          @global_cluster : Types::GlobalCluster? = nil
        )
        end
      end

      # Detailed information about a cluster.

      struct DBCluster
        include JSON::Serializable

        # Provides a list of the Identity and Access Management (IAM) roles that are associated with the
        # cluster. (IAM) roles that are associated with a cluster grant permission for the cluster to access
        # other Amazon Web Services services on your behalf.

        @[JSON::Field(key: "AssociatedRoles")]
        getter associated_roles : Array(Types::DBClusterRole)?

        # Provides the list of Amazon EC2 Availability Zones that instances in the cluster can be created in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Specifies the number of days for which automatic snapshots are retained.

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # Identifies the clone group to which the DB cluster is associated.

        @[JSON::Field(key: "CloneGroupId")]
        getter clone_group_id : String?

        # Specifies the time when the cluster was created, in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "ClusterCreateTime")]
        getter cluster_create_time : Time?

        # The Amazon Resource Name (ARN) for the cluster.

        @[JSON::Field(key: "DBClusterArn")]
        getter db_cluster_arn : String?

        # Contains a user-supplied cluster identifier. This identifier is the unique key that identifies a
        # cluster.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # Provides the list of instances that make up the cluster.

        @[JSON::Field(key: "DBClusterMembers")]
        getter db_cluster_members : Array(Types::DBClusterMember)?

        # Specifies the name of the cluster parameter group for the cluster.

        @[JSON::Field(key: "DBClusterParameterGroup")]
        getter db_cluster_parameter_group : String?

        # Specifies information on the subnet group that is associated with the cluster, including the name,
        # description, and subnets in the subnet group.

        @[JSON::Field(key: "DBSubnetGroup")]
        getter db_subnet_group : String?

        # The Amazon Web Services Region-unique, immutable identifier for the cluster. This identifier is
        # found in CloudTrail log entries whenever the KMS key for the cluster is accessed.

        @[JSON::Field(key: "DbClusterResourceId")]
        getter db_cluster_resource_id : String?

        # Specifies whether this cluster can be deleted. If DeletionProtection is enabled, the cluster cannot
        # be deleted unless it is modified and DeletionProtection is disabled. DeletionProtection protects
        # clusters from being accidentally deleted.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The earliest time to which a database can be restored with point-in-time restore.

        @[JSON::Field(key: "EarliestRestorableTime")]
        getter earliest_restorable_time : Time?

        # A list of log types that this cluster is configured to export to Amazon CloudWatch Logs.

        @[JSON::Field(key: "EnabledCloudwatchLogsExports")]
        getter enabled_cloudwatch_logs_exports : Array(String)?

        # Specifies the connection endpoint for the primary instance of the cluster.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # Provides the name of the database engine to be used for this cluster.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Indicates the database engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String?

        # The next time you can modify the Amazon DocumentDB cluster to use the iopt1 storage type.

        @[JSON::Field(key: "IOOptimizedNextAllowedModificationTime")]
        getter io_optimized_next_allowed_modification_time : Time?

        # If StorageEncrypted is true , the KMS key identifier for the encrypted cluster.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the latest time to which a database can be restored with point-in-time restore.

        @[JSON::Field(key: "LatestRestorableTime")]
        getter latest_restorable_time : Time?

        # The secret managed by Amazon DocumentDB in Amazon Web Services Secrets Manager for the master user
        # password.

        @[JSON::Field(key: "MasterUserSecret")]
        getter master_user_secret : Types::ClusterMasterUserSecret?

        # Contains the master user name for the cluster.

        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # Specifies whether the cluster has instances in multiple Availability Zones.

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The network type of the cluster. The network type is determined by the DBSubnetGroup specified for
        # the cluster. A DBSubnetGroup can support only the IPv4 protocol or the IPv4 and the IPv6 protocols (
        # DUAL ). For more information, see DocumentDB clusters in a VPC in the Amazon DocumentDB Developer
        # Guide. Valid Values: IPV4 | DUAL

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # Specifies the progress of the operation as a percentage.

        @[JSON::Field(key: "PercentProgress")]
        getter percent_progress : String?

        # Specifies the port that the database engine is listening on.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Specifies the daily time range during which automated backups are created if automated backups are
        # enabled, as determined by the BackupRetentionPeriod .

        @[JSON::Field(key: "PreferredBackupWindow")]
        getter preferred_backup_window : String?

        # Specifies the weekly time range during which system maintenance can occur, in Universal Coordinated
        # Time (UTC).

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Contains one or more identifiers of the secondary clusters that are associated with this cluster.

        @[JSON::Field(key: "ReadReplicaIdentifiers")]
        getter read_replica_identifiers : Array(String)?

        # The reader endpoint for the cluster. The reader endpoint for a cluster load balances connections
        # across the Amazon DocumentDB replicas that are available in a cluster. As clients request new
        # connections to the reader endpoint, Amazon DocumentDB distributes the connection requests among the
        # Amazon DocumentDB replicas in the cluster. This functionality can help balance your read workload
        # across multiple Amazon DocumentDB replicas in your cluster. If a failover occurs, and the Amazon
        # DocumentDB replica that you are connected to is promoted to be the primary instance, your connection
        # is dropped. To continue sending your read workload to other Amazon DocumentDB replicas in the
        # cluster, you can then reconnect to the reader endpoint.

        @[JSON::Field(key: "ReaderEndpoint")]
        getter reader_endpoint : String?

        # Contains the identifier of the source cluster if this cluster is a secondary cluster.

        @[JSON::Field(key: "ReplicationSourceIdentifier")]
        getter replication_source_identifier : String?

        # The scaling configuration of an Amazon DocumentDB Serverless cluster.

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfigurationInfo?

        # Specifies the current state of this cluster.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Specifies whether the cluster is encrypted.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # Storage type associated with your cluster For information on storage types for Amazon DocumentDB
        # clusters, see Cluster storage configurations in the Amazon DocumentDB Developer Guide . Valid values
        # for storage type - standard | iopt1 Default value is standard

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # Provides a list of virtual private cloud (VPC) security groups that the cluster belongs to.

        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(Types::VpcSecurityGroupMembership)?

        def initialize(
          @associated_roles : Array(Types::DBClusterRole)? = nil,
          @availability_zones : Array(String)? = nil,
          @backup_retention_period : Int32? = nil,
          @clone_group_id : String? = nil,
          @cluster_create_time : Time? = nil,
          @db_cluster_arn : String? = nil,
          @db_cluster_identifier : String? = nil,
          @db_cluster_members : Array(Types::DBClusterMember)? = nil,
          @db_cluster_parameter_group : String? = nil,
          @db_subnet_group : String? = nil,
          @db_cluster_resource_id : String? = nil,
          @deletion_protection : Bool? = nil,
          @earliest_restorable_time : Time? = nil,
          @enabled_cloudwatch_logs_exports : Array(String)? = nil,
          @endpoint : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @hosted_zone_id : String? = nil,
          @io_optimized_next_allowed_modification_time : Time? = nil,
          @kms_key_id : String? = nil,
          @latest_restorable_time : Time? = nil,
          @master_user_secret : Types::ClusterMasterUserSecret? = nil,
          @master_username : String? = nil,
          @multi_az : Bool? = nil,
          @network_type : String? = nil,
          @percent_progress : String? = nil,
          @port : Int32? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @read_replica_identifiers : Array(String)? = nil,
          @reader_endpoint : String? = nil,
          @replication_source_identifier : String? = nil,
          @serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfigurationInfo? = nil,
          @status : String? = nil,
          @storage_encrypted : Bool? = nil,
          @storage_type : String? = nil,
          @vpc_security_groups : Array(Types::VpcSecurityGroupMembership)? = nil
        )
        end
      end

      # You already have a cluster with the given identifier.

      struct DBClusterAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about an instance that is part of a cluster.

      struct DBClusterMember
        include JSON::Serializable

        # Specifies the status of the cluster parameter group for this member of the DB cluster.

        @[JSON::Field(key: "DBClusterParameterGroupStatus")]
        getter db_cluster_parameter_group_status : String?

        # Specifies the instance identifier for this member of the cluster.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String?

        # A value that is true if the cluster member is the primary instance for the cluster and false
        # otherwise.

        @[JSON::Field(key: "IsClusterWriter")]
        getter is_cluster_writer : Bool?

        # A value that specifies the order in which an Amazon DocumentDB replica is promoted to the primary
        # instance after a failure of the existing primary instance.

        @[JSON::Field(key: "PromotionTier")]
        getter promotion_tier : Int32?

        def initialize(
          @db_cluster_parameter_group_status : String? = nil,
          @db_instance_identifier : String? = nil,
          @is_cluster_writer : Bool? = nil,
          @promotion_tier : Int32? = nil
        )
        end
      end

      # Represents the output of DescribeDBClusters .

      struct DBClusterMessage
        include JSON::Serializable

        # A list of clusters.

        @[JSON::Field(key: "DBClusters")]
        getter db_clusters : Array(Types::DBCluster)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_clusters : Array(Types::DBCluster)? = nil,
          @marker : String? = nil
        )
        end
      end

      # DBClusterIdentifier doesn't refer to an existing cluster.

      struct DBClusterNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Detailed information about a cluster parameter group.

      struct DBClusterParameterGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the cluster parameter group.

        @[JSON::Field(key: "DBClusterParameterGroupArn")]
        getter db_cluster_parameter_group_arn : String?

        # Provides the name of the cluster parameter group.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # Provides the name of the parameter group family that this cluster parameter group is compatible
        # with.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String?

        # Provides the customer-specified description for this cluster parameter group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @db_cluster_parameter_group_arn : String? = nil,
          @db_cluster_parameter_group_name : String? = nil,
          @db_parameter_group_family : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Represents the output of DBClusterParameterGroup .

      struct DBClusterParameterGroupDetails
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Provides a list of parameters for the cluster parameter group.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @marker : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end

      # Contains the name of a cluster parameter group.

      struct DBClusterParameterGroupNameMessage
        include JSON::Serializable

        # The name of a cluster parameter group. Constraints: Must be from 1 to 255 letters or numbers. The
        # first character must be a letter. Cannot end with a hyphen or contain two consecutive hyphens. This
        # value is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        def initialize(
          @db_cluster_parameter_group_name : String? = nil
        )
        end
      end

      # DBClusterParameterGroupName doesn't refer to an existing cluster parameter group.

      struct DBClusterParameterGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of DBClusterParameterGroups .

      struct DBClusterParameterGroupsMessage
        include JSON::Serializable

        # A list of cluster parameter groups.

        @[JSON::Field(key: "DBClusterParameterGroups")]
        getter db_cluster_parameter_groups : Array(Types::DBClusterParameterGroup)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_cluster_parameter_groups : Array(Types::DBClusterParameterGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The cluster can't be created because you have reached the maximum allowed quota of clusters.

      struct DBClusterQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an Identity and Access Management (IAM) role that is associated with a cluster.

      struct DBClusterRole
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAMrole that is associated with the DB cluster.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Describes the state of association between the IAMrole and the cluster. The Status property returns
        # one of the following values: ACTIVE - The IAMrole ARN is associated with the cluster and can be used
        # to access other Amazon Web Services services on your behalf. PENDING - The IAMrole ARN is being
        # associated with the cluster. INVALID - The IAMrole ARN is associated with the cluster, but the
        # cluster cannot assume the IAMrole to access other Amazon Web Services services on your behalf.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Detailed information about a cluster snapshot.

      struct DBClusterSnapshot
        include JSON::Serializable

        # Provides the list of Amazon EC2 Availability Zones that instances in the cluster snapshot can be
        # restored in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Specifies the time when the cluster was created, in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "ClusterCreateTime")]
        getter cluster_create_time : Time?

        # Specifies the cluster identifier of the cluster that this cluster snapshot was created from.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The Amazon Resource Name (ARN) for the cluster snapshot.

        @[JSON::Field(key: "DBClusterSnapshotArn")]
        getter db_cluster_snapshot_arn : String?

        # Specifies the identifier for the cluster snapshot.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String?

        # Specifies the name of the database engine.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Provides the version of the database engine for this cluster snapshot.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # If StorageEncrypted is true , the KMS key identifier for the encrypted cluster snapshot.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Provides the master user name for the cluster snapshot.

        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # Specifies the percentage of the estimated data that has been transferred.

        @[JSON::Field(key: "PercentProgress")]
        getter percent_progress : Int32?

        # Specifies the port that the cluster was listening on at the time of the snapshot.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Provides the time when the snapshot was taken, in UTC.

        @[JSON::Field(key: "SnapshotCreateTime")]
        getter snapshot_create_time : Time?

        # Provides the type of the cluster snapshot.

        @[JSON::Field(key: "SnapshotType")]
        getter snapshot_type : String?

        # If the cluster snapshot was copied from a source cluster snapshot, the ARN for the source cluster
        # snapshot; otherwise, a null value.

        @[JSON::Field(key: "SourceDBClusterSnapshotArn")]
        getter source_db_cluster_snapshot_arn : String?

        # Specifies the status of this cluster snapshot.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Specifies whether the cluster snapshot is encrypted.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # Storage type associated with your cluster snapshot For information on storage types for Amazon
        # DocumentDB clusters, see Cluster storage configurations in the Amazon DocumentDB Developer Guide .
        # Valid values for storage type - standard | iopt1 Default value is standard

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # Provides the virtual private cloud (VPC) ID that is associated with the cluster snapshot.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @availability_zones : Array(String)? = nil,
          @cluster_create_time : Time? = nil,
          @db_cluster_identifier : String? = nil,
          @db_cluster_snapshot_arn : String? = nil,
          @db_cluster_snapshot_identifier : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @kms_key_id : String? = nil,
          @master_username : String? = nil,
          @percent_progress : Int32? = nil,
          @port : Int32? = nil,
          @snapshot_create_time : Time? = nil,
          @snapshot_type : String? = nil,
          @source_db_cluster_snapshot_arn : String? = nil,
          @status : String? = nil,
          @storage_encrypted : Bool? = nil,
          @storage_type : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # You already have a cluster snapshot with the given identifier.

      struct DBClusterSnapshotAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the name and values of a manual cluster snapshot attribute. Manual cluster snapshot
      # attributes are used to authorize other Amazon Web Services accounts to restore a manual cluster
      # snapshot.

      struct DBClusterSnapshotAttribute
        include JSON::Serializable

        # The name of the manual cluster snapshot attribute. The attribute named restore refers to the list of
        # Amazon Web Services accounts that have permission to copy or restore the manual cluster snapshot.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The values for the manual cluster snapshot attribute. If the AttributeName field is set to restore ,
        # then this element returns a list of IDs of the Amazon Web Services accounts that are authorized to
        # copy or restore the manual cluster snapshot. If a value of all is in the list, then the manual
        # cluster snapshot is public and available for any Amazon Web Services account to copy or restore.

        @[JSON::Field(key: "AttributeValues")]
        getter attribute_values : Array(String)?

        def initialize(
          @attribute_name : String? = nil,
          @attribute_values : Array(String)? = nil
        )
        end
      end

      # Detailed information about the attributes that are associated with a cluster snapshot.

      struct DBClusterSnapshotAttributesResult
        include JSON::Serializable

        # The list of attributes and values for the cluster snapshot.

        @[JSON::Field(key: "DBClusterSnapshotAttributes")]
        getter db_cluster_snapshot_attributes : Array(Types::DBClusterSnapshotAttribute)?

        # The identifier of the cluster snapshot that the attributes apply to.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String?

        def initialize(
          @db_cluster_snapshot_attributes : Array(Types::DBClusterSnapshotAttribute)? = nil,
          @db_cluster_snapshot_identifier : String? = nil
        )
        end
      end

      # Represents the output of DescribeDBClusterSnapshots .

      struct DBClusterSnapshotMessage
        include JSON::Serializable

        # Provides a list of cluster snapshots.

        @[JSON::Field(key: "DBClusterSnapshots")]
        getter db_cluster_snapshots : Array(Types::DBClusterSnapshot)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_cluster_snapshots : Array(Types::DBClusterSnapshot)? = nil,
          @marker : String? = nil
        )
        end
      end

      # DBClusterSnapshotIdentifier doesn't refer to an existing cluster snapshot.

      struct DBClusterSnapshotNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Detailed information about an engine version.

      struct DBEngineVersion
        include JSON::Serializable

        # The description of the database engine.

        @[JSON::Field(key: "DBEngineDescription")]
        getter db_engine_description : String?

        # The description of the database engine version.

        @[JSON::Field(key: "DBEngineVersionDescription")]
        getter db_engine_version_description : String?

        # The name of the parameter group family for the database engine.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String?

        # The name of the database engine.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version number of the database engine.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The types of logs that the database engine has available for export to Amazon CloudWatch Logs.

        @[JSON::Field(key: "ExportableLogTypes")]
        getter exportable_log_types : Array(String)?

        # Specifies any Amazon DocumentDB Serverless properties or limits that differ between Amazon
        # DocumentDB engine versions. You can test the values of this attribute when deciding which Amazon
        # DocumentDB version to use in a new or upgraded cluster. You can also retrieve the version of an
        # existing cluster and check whether that version supports certain Amazon DocumentDB Serverless
        # features before you attempt to use those features.

        @[JSON::Field(key: "ServerlessV2FeaturesSupport")]
        getter serverless_v2_features_support : Types::ServerlessV2FeaturesSupport?

        # A list of the supported CA certificate identifiers. For more information, see Updating Your Amazon
        # DocumentDB TLS Certificates and Encrypting Data in Transit in the Amazon DocumentDB Developer Guide
        # .

        @[JSON::Field(key: "SupportedCACertificateIdentifiers")]
        getter supported_ca_certificate_identifiers : Array(String)?

        # Indicates whether the engine version supports rotating the server certificate without rebooting the
        # DB instance.

        @[JSON::Field(key: "SupportsCertificateRotationWithoutRestart")]
        getter supports_certificate_rotation_without_restart : Bool?

        # A value that indicates whether the engine version supports exporting the log types specified by
        # ExportableLogTypes to CloudWatch Logs.

        @[JSON::Field(key: "SupportsLogExportsToCloudwatchLogs")]
        getter supports_log_exports_to_cloudwatch_logs : Bool?

        # A list of engine versions that this database engine version can be upgraded to.

        @[JSON::Field(key: "ValidUpgradeTarget")]
        getter valid_upgrade_target : Array(Types::UpgradeTarget)?

        def initialize(
          @db_engine_description : String? = nil,
          @db_engine_version_description : String? = nil,
          @db_parameter_group_family : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @exportable_log_types : Array(String)? = nil,
          @serverless_v2_features_support : Types::ServerlessV2FeaturesSupport? = nil,
          @supported_ca_certificate_identifiers : Array(String)? = nil,
          @supports_certificate_rotation_without_restart : Bool? = nil,
          @supports_log_exports_to_cloudwatch_logs : Bool? = nil,
          @valid_upgrade_target : Array(Types::UpgradeTarget)? = nil
        )
        end
      end

      # Represents the output of DescribeDBEngineVersions .

      struct DBEngineVersionMessage
        include JSON::Serializable

        # Detailed information about one or more engine versions.

        @[JSON::Field(key: "DBEngineVersions")]
        getter db_engine_versions : Array(Types::DBEngineVersion)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_engine_versions : Array(Types::DBEngineVersion)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Detailed information about an instance.

      struct DBInstance
        include JSON::Serializable

        # Does not apply. This parameter does not apply to Amazon DocumentDB. Amazon DocumentDB does not
        # perform minor version upgrades regardless of the value set.

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Specifies the name of the Availability Zone that the instance is located in.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # Specifies the number of days for which automatic snapshots are retained.

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # The identifier of the CA certificate for this DB instance.

        @[JSON::Field(key: "CACertificateIdentifier")]
        getter ca_certificate_identifier : String?

        # The details of the DB instance's server certificate.

        @[JSON::Field(key: "CertificateDetails")]
        getter certificate_details : Types::CertificateDetails?

        # A value that indicates whether to copy tags from the DB instance to snapshots of the DB instance. By
        # default, tags are not copied.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # Contains the name of the cluster that the instance is a member of if the instance is a member of a
        # cluster.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The Amazon Resource Name (ARN) for the instance.

        @[JSON::Field(key: "DBInstanceArn")]
        getter db_instance_arn : String?

        # Contains the name of the compute and memory capacity class of the instance.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # Contains a user-provided database identifier. This identifier is the unique key that identifies an
        # instance.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String?

        # Specifies the current state of this database.

        @[JSON::Field(key: "DBInstanceStatus")]
        getter db_instance_status : String?

        # Specifies information on the subnet group that is associated with the instance, including the name,
        # description, and subnets in the subnet group.

        @[JSON::Field(key: "DBSubnetGroup")]
        getter db_subnet_group : Types::DBSubnetGroup?

        # The Amazon Web Services Region-unique, immutable identifier for the instance. This identifier is
        # found in CloudTrail log entries whenever the KMS key for the instance is accessed.

        @[JSON::Field(key: "DbiResourceId")]
        getter dbi_resource_id : String?

        # A list of log types that this instance is configured to export to CloudWatch Logs.

        @[JSON::Field(key: "EnabledCloudwatchLogsExports")]
        getter enabled_cloudwatch_logs_exports : Array(String)?

        # Specifies the connection endpoint.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        # Provides the name of the database engine to be used for this instance.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Indicates the database engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Provides the date and time that the instance was created.

        @[JSON::Field(key: "InstanceCreateTime")]
        getter instance_create_time : Time?

        # If StorageEncrypted is true , the KMS key identifier for the encrypted instance.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the latest time to which a database can be restored with point-in-time restore.

        @[JSON::Field(key: "LatestRestorableTime")]
        getter latest_restorable_time : Time?

        # Specifies that changes to the instance are pending. This element is included only when changes are
        # pending. Specific changes are identified by subelements.

        @[JSON::Field(key: "PendingModifiedValues")]
        getter pending_modified_values : Types::PendingModifiedValues?

        # Set to true if Amazon RDS Performance Insights is enabled for the DB instance, and otherwise false .

        @[JSON::Field(key: "PerformanceInsightsEnabled")]
        getter performance_insights_enabled : Bool?

        # The KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon
        # Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key.

        @[JSON::Field(key: "PerformanceInsightsKMSKeyId")]
        getter performance_insights_kms_key_id : String?

        # Specifies the daily time range during which automated backups are created if automated backups are
        # enabled, as determined by the BackupRetentionPeriod .

        @[JSON::Field(key: "PreferredBackupWindow")]
        getter preferred_backup_window : String?

        # Specifies the weekly time range during which system maintenance can occur, in Universal Coordinated
        # Time (UTC).

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # A value that specifies the order in which an Amazon DocumentDB replica is promoted to the primary
        # instance after a failure of the existing primary instance.

        @[JSON::Field(key: "PromotionTier")]
        getter promotion_tier : Int32?

        # Not supported. Amazon DocumentDB does not currently support public endpoints. The value of
        # PubliclyAccessible is always false .

        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # The status of a read replica. If the instance is not a read replica, this is blank.

        @[JSON::Field(key: "StatusInfos")]
        getter status_infos : Array(Types::DBInstanceStatusInfo)?

        # Specifies whether or not the instance is encrypted.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # Provides a list of VPC security group elements that the instance belongs to.

        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(Types::VpcSecurityGroupMembership)?

        def initialize(
          @auto_minor_version_upgrade : Bool? = nil,
          @availability_zone : String? = nil,
          @backup_retention_period : Int32? = nil,
          @ca_certificate_identifier : String? = nil,
          @certificate_details : Types::CertificateDetails? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @db_cluster_identifier : String? = nil,
          @db_instance_arn : String? = nil,
          @db_instance_class : String? = nil,
          @db_instance_identifier : String? = nil,
          @db_instance_status : String? = nil,
          @db_subnet_group : Types::DBSubnetGroup? = nil,
          @dbi_resource_id : String? = nil,
          @enabled_cloudwatch_logs_exports : Array(String)? = nil,
          @endpoint : Types::Endpoint? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @instance_create_time : Time? = nil,
          @kms_key_id : String? = nil,
          @latest_restorable_time : Time? = nil,
          @pending_modified_values : Types::PendingModifiedValues? = nil,
          @performance_insights_enabled : Bool? = nil,
          @performance_insights_kms_key_id : String? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @promotion_tier : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @status_infos : Array(Types::DBInstanceStatusInfo)? = nil,
          @storage_encrypted : Bool? = nil,
          @vpc_security_groups : Array(Types::VpcSecurityGroupMembership)? = nil
        )
        end
      end

      # You already have a instance with the given identifier.

      struct DBInstanceAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of DescribeDBInstances .

      struct DBInstanceMessage
        include JSON::Serializable

        # Detailed information about one or more instances.

        @[JSON::Field(key: "DBInstances")]
        getter db_instances : Array(Types::DBInstance)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_instances : Array(Types::DBInstance)? = nil,
          @marker : String? = nil
        )
        end
      end

      # DBInstanceIdentifier doesn't refer to an existing instance.

      struct DBInstanceNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Provides a list of status information for an instance.

      struct DBInstanceStatusInfo
        include JSON::Serializable

        # Details of the error if there is an error for the instance. If the instance is not in an error
        # state, this value is blank.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # A Boolean value that is true if the instance is operating normally, or false if the instance is in
        # an error state.

        @[JSON::Field(key: "Normal")]
        getter normal : Bool?

        # Status of the instance. For a StatusType of read replica, the values can be replicating , error,
        # stopped , or terminated .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # This value is currently " read replication ."

        @[JSON::Field(key: "StatusType")]
        getter status_type : String?

        def initialize(
          @message : String? = nil,
          @normal : Bool? = nil,
          @status : String? = nil,
          @status_type : String? = nil
        )
        end
      end

      # A parameter group with the same name already exists.

      struct DBParameterGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # DBParameterGroupName doesn't refer to an existing parameter group.

      struct DBParameterGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # This request would cause you to exceed the allowed number of parameter groups.

      struct DBParameterGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # DBSecurityGroupName doesn't refer to an existing security group.

      struct DBSecurityGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # DBSnapshotIdentifier is already being used by an existing snapshot.

      struct DBSnapshotAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # DBSnapshotIdentifier doesn't refer to an existing snapshot.

      struct DBSnapshotNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Detailed information about a subnet group.

      struct DBSubnetGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the DB subnet group.

        @[JSON::Field(key: "DBSubnetGroupArn")]
        getter db_subnet_group_arn : String?

        # Provides the description of the subnet group.

        @[JSON::Field(key: "DBSubnetGroupDescription")]
        getter db_subnet_group_description : String?

        # The name of the subnet group.

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # Provides the status of the subnet group.

        @[JSON::Field(key: "SubnetGroupStatus")]
        getter subnet_group_status : String?

        # Detailed information about one or more subnets within a subnet group.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(Types::Subnet)?

        # The network type of the DB subnet group. Valid Values: IPV4 | DUAL A DBSubnetGroup can support only
        # the IPv4 protocol or the IPv4 and the IPv6 protocols (DUAL).

        @[JSON::Field(key: "SupportedNetworkTypes")]
        getter supported_network_types : Array(String)?

        # Provides the virtual private cloud (VPC) ID of the subnet group.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @db_subnet_group_arn : String? = nil,
          @db_subnet_group_description : String? = nil,
          @db_subnet_group_name : String? = nil,
          @subnet_group_status : String? = nil,
          @subnets : Array(Types::Subnet)? = nil,
          @supported_network_types : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # DBSubnetGroupName is already being used by an existing subnet group.

      struct DBSubnetGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Subnets in the subnet group should cover at least two Availability Zones unless there is only one
      # Availability Zone.

      struct DBSubnetGroupDoesNotCoverEnoughAZs
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of DescribeDBSubnetGroups .

      struct DBSubnetGroupMessage
        include JSON::Serializable

        # Detailed information about one or more subnet groups.

        @[JSON::Field(key: "DBSubnetGroups")]
        getter db_subnet_groups : Array(Types::DBSubnetGroup)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_subnet_groups : Array(Types::DBSubnetGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # DBSubnetGroupName doesn't refer to an existing subnet group.

      struct DBSubnetGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request would cause you to exceed the allowed number of subnet groups.

      struct DBSubnetGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request would cause you to exceed the allowed number of subnets in a subnet group.

      struct DBSubnetQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The upgrade failed because a resource that the depends on can't be modified.

      struct DBUpgradeDependencyFailureFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input to DeleteDBCluster .

      struct DeleteDBClusterMessage
        include JSON::Serializable

        # The cluster identifier for the cluster to be deleted. This parameter isn't case sensitive.
        # Constraints: Must match an existing DBClusterIdentifier .

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The cluster snapshot identifier of the new cluster snapshot created when SkipFinalSnapshot is set to
        # false . Specifying this parameter and also setting the SkipFinalShapshot parameter to true results
        # in an error. Constraints: Must be from 1 to 255 letters, numbers, or hyphens. The first character
        # must be a letter. Cannot end with a hyphen or contain two consecutive hyphens.

        @[JSON::Field(key: "FinalDBSnapshotIdentifier")]
        getter final_db_snapshot_identifier : String?

        # Determines whether a final cluster snapshot is created before the cluster is deleted. If true is
        # specified, no cluster snapshot is created. If false is specified, a cluster snapshot is created
        # before the DB cluster is deleted. If SkipFinalSnapshot is false , you must specify a
        # FinalDBSnapshotIdentifier parameter. Default: false

        @[JSON::Field(key: "SkipFinalSnapshot")]
        getter skip_final_snapshot : Bool?

        def initialize(
          @db_cluster_identifier : String,
          @final_db_snapshot_identifier : String? = nil,
          @skip_final_snapshot : Bool? = nil
        )
        end
      end

      # Represents the input to DeleteDBClusterParameterGroup .

      struct DeleteDBClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the cluster parameter group. Constraints: Must be the name of an existing cluster
        # parameter group. You can't delete a default cluster parameter group. Cannot be associated with any
        # clusters.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String

        def initialize(
          @db_cluster_parameter_group_name : String
        )
        end
      end


      struct DeleteDBClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "DBCluster")]
        getter db_cluster : Types::DBCluster?

        def initialize(
          @db_cluster : Types::DBCluster? = nil
        )
        end
      end

      # Represents the input to DeleteDBClusterSnapshot .

      struct DeleteDBClusterSnapshotMessage
        include JSON::Serializable

        # The identifier of the cluster snapshot to delete. Constraints: Must be the name of an existing
        # cluster snapshot in the available state.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String

        def initialize(
          @db_cluster_snapshot_identifier : String
        )
        end
      end


      struct DeleteDBClusterSnapshotResult
        include JSON::Serializable


        @[JSON::Field(key: "DBClusterSnapshot")]
        getter db_cluster_snapshot : Types::DBClusterSnapshot?

        def initialize(
          @db_cluster_snapshot : Types::DBClusterSnapshot? = nil
        )
        end
      end

      # Represents the input to DeleteDBInstance .

      struct DeleteDBInstanceMessage
        include JSON::Serializable

        # The instance identifier for the instance to be deleted. This parameter isn't case sensitive.
        # Constraints: Must match the name of an existing instance.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String

        def initialize(
          @db_instance_identifier : String
        )
        end
      end


      struct DeleteDBInstanceResult
        include JSON::Serializable


        @[JSON::Field(key: "DBInstance")]
        getter db_instance : Types::DBInstance?

        def initialize(
          @db_instance : Types::DBInstance? = nil
        )
        end
      end

      # Represents the input to DeleteDBSubnetGroup .

      struct DeleteDBSubnetGroupMessage
        include JSON::Serializable

        # The name of the database subnet group to delete. You can't delete the default subnet group.
        # Constraints: Must match the name of an existing DBSubnetGroup . Must not be default. Example:
        # mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String

        def initialize(
          @db_subnet_group_name : String
        )
        end
      end

      # Represents the input to DeleteEventSubscription .

      struct DeleteEventSubscriptionMessage
        include JSON::Serializable

        # The name of the Amazon DocumentDB event notification subscription that you want to delete.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        def initialize(
          @subscription_name : String
        )
        end
      end


      struct DeleteEventSubscriptionResult
        include JSON::Serializable


        @[JSON::Field(key: "EventSubscription")]
        getter event_subscription : Types::EventSubscription?

        def initialize(
          @event_subscription : Types::EventSubscription? = nil
        )
        end
      end

      # Represents the input to DeleteGlobalCluster .

      struct DeleteGlobalClusterMessage
        include JSON::Serializable

        # The cluster identifier of the global cluster being deleted.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        def initialize(
          @global_cluster_identifier : String
        )
        end
      end


      struct DeleteGlobalClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "GlobalCluster")]
        getter global_cluster : Types::GlobalCluster?

        def initialize(
          @global_cluster : Types::GlobalCluster? = nil
        )
        end
      end


      struct DescribeCertificatesMessage
        include JSON::Serializable

        # The user-supplied certificate identifier. If this parameter is specified, information for only the
        # specified certificate is returned. If this parameter is omitted, a list of up to MaxRecords
        # certificates is returned. This parameter is not case sensitive. Constraints Must match an existing
        # CertificateIdentifier .

        @[JSON::Field(key: "CertificateIdentifier")]
        getter certificate_identifier : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeCertificates request. If this parameter
        # is specified, the response includes only records beyond the marker, up to the value specified by
        # MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum: 20 Maximum: 100

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @certificate_identifier : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input to DescribeDBClusterParameterGroups .

      struct DescribeDBClusterParameterGroupsMessage
        include JSON::Serializable

        # The name of a specific cluster parameter group to return details for. Constraints: If provided, must
        # match the name of an existing DBClusterParameterGroup .

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @db_cluster_parameter_group_name : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input to DescribeDBClusterParameters .

      struct DescribeDBClusterParametersMessage
        include JSON::Serializable

        # The name of a specific cluster parameter group to return parameter details for. Constraints: If
        # provided, must match the name of an existing DBClusterParameterGroup .

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # A value that indicates to return only parameters for a specific source. Parameter sources can be
        # engine , service , or customer .

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @db_cluster_parameter_group_name : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @source : String? = nil
        )
        end
      end

      # Represents the input to DescribeDBClusterSnapshotAttributes .

      struct DescribeDBClusterSnapshotAttributesMessage
        include JSON::Serializable

        # The identifier for the cluster snapshot to describe the attributes for.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String

        def initialize(
          @db_cluster_snapshot_identifier : String
        )
        end
      end


      struct DescribeDBClusterSnapshotAttributesResult
        include JSON::Serializable


        @[JSON::Field(key: "DBClusterSnapshotAttributesResult")]
        getter db_cluster_snapshot_attributes_result : Types::DBClusterSnapshotAttributesResult?

        def initialize(
          @db_cluster_snapshot_attributes_result : Types::DBClusterSnapshotAttributesResult? = nil
        )
        end
      end

      # Represents the input to DescribeDBClusterSnapshots .

      struct DescribeDBClusterSnapshotsMessage
        include JSON::Serializable

        # The ID of the cluster to retrieve the list of cluster snapshots for. This parameter can't be used
        # with the DBClusterSnapshotIdentifier parameter. This parameter is not case sensitive. Constraints:
        # If provided, must match the identifier of an existing DBCluster .

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # A specific cluster snapshot identifier to describe. This parameter can't be used with the
        # DBClusterIdentifier parameter. This value is stored as a lowercase string. Constraints: If provided,
        # must match the identifier of an existing DBClusterSnapshot . If this identifier is for an automated
        # snapshot, the SnapshotType parameter must also be specified.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Set to true to include manual cluster snapshots that are public and can be copied or restored by any
        # Amazon Web Services account, and otherwise false . The default is false .

        @[JSON::Field(key: "IncludePublic")]
        getter include_public : Bool?

        # Set to true to include shared manual cluster snapshots from other Amazon Web Services accounts that
        # this Amazon Web Services account has been given permission to copy or restore, and otherwise false .
        # The default is false .

        @[JSON::Field(key: "IncludeShared")]
        getter include_shared : Bool?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The type of cluster snapshots to be returned. You can specify one of the following values: automated
        # - Return all cluster snapshots that Amazon DocumentDB has automatically created for your Amazon Web
        # Services account. manual - Return all cluster snapshots that you have manually created for your
        # Amazon Web Services account. shared - Return all manual cluster snapshots that have been shared to
        # your Amazon Web Services account. public - Return all cluster snapshots that have been marked as
        # public. If you don't specify a SnapshotType value, then both automated and manual cluster snapshots
        # are returned. You can include shared cluster snapshots with these results by setting the
        # IncludeShared parameter to true . You can include public cluster snapshots with these results by
        # setting the IncludePublic parameter to true . The IncludeShared and IncludePublic parameters don't
        # apply for SnapshotType values of manual or automated . The IncludePublic parameter doesn't apply
        # when SnapshotType is set to shared . The IncludeShared parameter doesn't apply when SnapshotType is
        # set to public .

        @[JSON::Field(key: "SnapshotType")]
        getter snapshot_type : String?

        def initialize(
          @db_cluster_identifier : String? = nil,
          @db_cluster_snapshot_identifier : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @include_public : Bool? = nil,
          @include_shared : Bool? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @snapshot_type : String? = nil
        )
        end
      end

      # Represents the input to DescribeDBClusters .

      struct DescribeDBClustersMessage
        include JSON::Serializable

        # The user-provided cluster identifier. If this parameter is specified, information from only the
        # specific cluster is returned. This parameter isn't case sensitive. Constraints: If provided, must
        # match an existing DBClusterIdentifier .

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # A filter that specifies one or more clusters to describe. Supported filters: db-cluster-id - Accepts
        # cluster identifiers and cluster Amazon Resource Names (ARNs). The results list only includes
        # information about the clusters identified by these ARNs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @db_cluster_identifier : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input to DescribeDBEngineVersions .

      struct DescribeDBEngineVersionsMessage
        include JSON::Serializable

        # The name of a specific parameter group family to return details for. Constraints: If provided, must
        # match an existing DBParameterGroupFamily .

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String?

        # Indicates that only the default version of the specified engine or engine and major version
        # combination is returned.

        @[JSON::Field(key: "DefaultOnly")]
        getter default_only : Bool?

        # The database engine to return.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The database engine version to return. Example: 3.6.0

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # If this parameter is specified and the requested engine supports the CharacterSetName parameter for
        # CreateDBInstance , the response includes a list of supported character sets for each engine version.

        @[JSON::Field(key: "ListSupportedCharacterSets")]
        getter list_supported_character_sets : Bool?

        # If this parameter is specified and the requested engine supports the TimeZone parameter for
        # CreateDBInstance , the response includes a list of supported time zones for each engine version.

        @[JSON::Field(key: "ListSupportedTimezones")]
        getter list_supported_timezones : Bool?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @db_parameter_group_family : String? = nil,
          @default_only : Bool? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @list_supported_character_sets : Bool? = nil,
          @list_supported_timezones : Bool? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input to DescribeDBInstances .

      struct DescribeDBInstancesMessage
        include JSON::Serializable

        # The user-provided instance identifier. If this parameter is specified, information from only the
        # specific instance is returned. This parameter isn't case sensitive. Constraints: If provided, must
        # match the identifier of an existing DBInstance .

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String?

        # A filter that specifies one or more instances to describe. Supported filters: db-cluster-id -
        # Accepts cluster identifiers and cluster Amazon Resource Names (ARNs). The results list includes only
        # the information about the instances that are associated with the clusters that are identified by
        # these ARNs. db-instance-id - Accepts instance identifiers and instance ARNs. The results list
        # includes only the information about the instances that are identified by these ARNs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @db_instance_identifier : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input to DescribeDBSubnetGroups .

      struct DescribeDBSubnetGroupsMessage
        include JSON::Serializable

        # The name of the subnet group to return details for.

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @db_subnet_group_name : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input to DescribeEngineDefaultClusterParameters .

      struct DescribeEngineDefaultClusterParametersMessage
        include JSON::Serializable

        # The name of the cluster parameter group family to return the engine parameter information for.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @db_parameter_group_family : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeEngineDefaultClusterParametersResult
        include JSON::Serializable


        @[JSON::Field(key: "EngineDefaults")]
        getter engine_defaults : Types::EngineDefaults?

        def initialize(
          @engine_defaults : Types::EngineDefaults? = nil
        )
        end
      end

      # Represents the input to DescribeEventCategories .

      struct DescribeEventCategoriesMessage
        include JSON::Serializable

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The type of source that is generating the events. Valid values: db-instance , db-parameter-group ,
        # db-security-group

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @source_type : String? = nil
        )
        end
      end

      # Represents the input to DescribeEventSubscriptions .

      struct DescribeEventSubscriptionsMessage
        include JSON::Serializable

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The name of the Amazon DocumentDB event notification subscription that you want to describe.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @subscription_name : String? = nil
        )
        end
      end

      # Represents the input to DescribeEvents .

      struct DescribeEventsMessage
        include JSON::Serializable

        # The number of minutes to retrieve events for. Default: 60

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The end of the time interval for which to retrieve events, specified in ISO 8601 format. Example:
        # 2009-07-08T18:00Z

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # A list of event categories that trigger notifications for an event notification subscription.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The identifier of the event source for which events are returned. If not specified, then all sources
        # are included in the response. Constraints: If SourceIdentifier is provided, SourceType must also be
        # provided. If the source type is DBInstance , a DBInstanceIdentifier must be provided. If the source
        # type is DBSecurityGroup , a DBSecurityGroupName must be provided. If the source type is
        # DBParameterGroup , a DBParameterGroupName must be provided. If the source type is DBSnapshot , a
        # DBSnapshotIdentifier must be provided. Cannot end with a hyphen or contain two consecutive hyphens.

        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        # The event source to retrieve events for. If no value is specified, all events are returned.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The beginning of the time interval to retrieve events for, specified in ISO 8601 format. Example:
        # 2009-07-08T18:00Z

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @duration : Int32? = nil,
          @end_time : Time? = nil,
          @event_categories : Array(String)? = nil,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @source_identifier : String? = nil,
          @source_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct DescribeGlobalClustersMessage
        include JSON::Serializable

        # A filter that specifies one or more global DB clusters to describe. Supported filters: db-cluster-id
        # accepts cluster identifiers and cluster Amazon Resource Names (ARNs). The results list will only
        # include information about the clusters identified by these ARNs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The user-supplied cluster identifier. If this parameter is specified, information from only the
        # specific cluster is returned. This parameter isn't case-sensitive.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String?

        # An optional pagination token provided by a previous DescribeGlobalClusters request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that you can
        # retrieve the remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @global_cluster_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input to DescribeOrderableDBInstanceOptions .

      struct DescribeOrderableDBInstanceOptionsMessage
        include JSON::Serializable

        # The name of the engine to retrieve instance options for.

        @[JSON::Field(key: "Engine")]
        getter engine : String

        # The instance class filter value. Specify this parameter to show only the available offerings that
        # match the specified instance class.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # The engine version filter value. Specify this parameter to show only the available offerings that
        # match the specified engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The license model filter value. Specify this parameter to show only the available offerings that
        # match the specified license model.

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The virtual private cloud (VPC) filter value. Specify this parameter to show only the available VPC
        # or non-VPC offerings.

        @[JSON::Field(key: "Vpc")]
        getter vpc : Bool?

        def initialize(
          @engine : String,
          @db_instance_class : String? = nil,
          @engine_version : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @license_model : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @vpc : Bool? = nil
        )
        end
      end

      # Represents the input to DescribePendingMaintenanceActions .

      struct DescribePendingMaintenanceActionsMessage
        include JSON::Serializable

        # A filter that specifies one or more resources to return pending maintenance actions for. Supported
        # filters: db-cluster-id - Accepts cluster identifiers and cluster Amazon Resource Names (ARNs). The
        # results list includes only pending maintenance actions for the clusters identified by these ARNs.
        # db-instance-id - Accepts instance identifiers and instance ARNs. The results list includes only
        # pending maintenance actions for the DB instances identified by these ARNs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The ARN of a resource to return pending maintenance actions for.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @resource_identifier : String? = nil
        )
        end
      end

      # Network information for accessing a cluster or instance. Client programs must specify a valid
      # endpoint to access these Amazon DocumentDB resources.

      struct Endpoint
        include JSON::Serializable

        # Specifies the DNS address of the instance.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String?

        # Specifies the port that the database engine is listening on.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        def initialize(
          @address : String? = nil,
          @hosted_zone_id : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # Contains the result of a successful invocation of the DescribeEngineDefaultClusterParameters
      # operation.

      struct EngineDefaults
        include JSON::Serializable

        # The name of the cluster parameter group family to return the engine parameter information for.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The parameters of a particular cluster parameter group family.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @db_parameter_group_family : String? = nil,
          @marker : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end

      # Detailed information about an event.

      struct Event
        include JSON::Serializable

        # Specifies the date and time of the event.

        @[JSON::Field(key: "Date")]
        getter date : Time?

        # Specifies the category for the event.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # Provides the text of this event.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The Amazon Resource Name (ARN) for the event.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # Provides the identifier for the source of the event.

        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        # Specifies the source type for this event.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @date : Time? = nil,
          @event_categories : Array(String)? = nil,
          @message : String? = nil,
          @source_arn : String? = nil,
          @source_identifier : String? = nil,
          @source_type : String? = nil
        )
        end
      end

      # An event source type, accompanied by one or more event category names.

      struct EventCategoriesMap
        include JSON::Serializable

        # The event categories for the specified source type.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The source type that the returned categories belong to.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @event_categories : Array(String)? = nil,
          @source_type : String? = nil
        )
        end
      end

      # Represents the output of DescribeEventCategories .

      struct EventCategoriesMessage
        include JSON::Serializable

        # A list of event category maps.

        @[JSON::Field(key: "EventCategoriesMapList")]
        getter event_categories_map_list : Array(Types::EventCategoriesMap)?

        def initialize(
          @event_categories_map_list : Array(Types::EventCategoriesMap)? = nil
        )
        end
      end

      # Detailed information about an event to which you have subscribed.

      struct EventSubscription
        include JSON::Serializable

        # The Amazon DocumentDB event notification subscription ID.

        @[JSON::Field(key: "CustSubscriptionId")]
        getter cust_subscription_id : String?

        # The Amazon Web Services customer account that is associated with the Amazon DocumentDB event
        # notification subscription.

        @[JSON::Field(key: "CustomerAwsId")]
        getter customer_aws_id : String?

        # A Boolean value indicating whether the subscription is enabled. A value of true indicates that the
        # subscription is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A list of event categories for the Amazon DocumentDB event notification subscription.

        @[JSON::Field(key: "EventCategoriesList")]
        getter event_categories_list : Array(String)?

        # The Amazon Resource Name (ARN) for the event subscription.

        @[JSON::Field(key: "EventSubscriptionArn")]
        getter event_subscription_arn : String?

        # The topic ARN of the Amazon DocumentDB event notification subscription.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # A list of source IDs for the Amazon DocumentDB event notification subscription.

        @[JSON::Field(key: "SourceIdsList")]
        getter source_ids_list : Array(String)?

        # The source type for the Amazon DocumentDB event notification subscription.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The status of the Amazon DocumentDB event notification subscription. Constraints: Can be one of the
        # following: creating , modifying , deleting , active , no-permission , topic-not-exist The
        # no-permission status indicates that Amazon DocumentDB no longer has permission to post to the SNS
        # topic. The topic-not-exist status indicates that the topic was deleted after the subscription was
        # created.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time at which the Amazon DocumentDB event notification subscription was created.

        @[JSON::Field(key: "SubscriptionCreationTime")]
        getter subscription_creation_time : String?

        def initialize(
          @cust_subscription_id : String? = nil,
          @customer_aws_id : String? = nil,
          @enabled : Bool? = nil,
          @event_categories_list : Array(String)? = nil,
          @event_subscription_arn : String? = nil,
          @sns_topic_arn : String? = nil,
          @source_ids_list : Array(String)? = nil,
          @source_type : String? = nil,
          @status : String? = nil,
          @subscription_creation_time : String? = nil
        )
        end
      end

      # You have reached the maximum number of event subscriptions.

      struct EventSubscriptionQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of DescribeEventSubscriptions .

      struct EventSubscriptionsMessage
        include JSON::Serializable

        # A list of event subscriptions.

        @[JSON::Field(key: "EventSubscriptionsList")]
        getter event_subscriptions_list : Array(Types::EventSubscription)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @event_subscriptions_list : Array(Types::EventSubscription)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Represents the output of DescribeEvents .

      struct EventsMessage
        include JSON::Serializable

        # Detailed information about one or more events.

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Represents the input to FailoverDBCluster .

      struct FailoverDBClusterMessage
        include JSON::Serializable

        # A cluster identifier to force a failover for. This parameter is not case sensitive. Constraints:
        # Must match the identifier of an existing DBCluster .

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The name of the instance to promote to the primary instance. You must specify the instance
        # identifier for an Amazon DocumentDB replica in the cluster. For example, mydbcluster-replica1 .

        @[JSON::Field(key: "TargetDBInstanceIdentifier")]
        getter target_db_instance_identifier : String?

        def initialize(
          @db_cluster_identifier : String? = nil,
          @target_db_instance_identifier : String? = nil
        )
        end
      end


      struct FailoverDBClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "DBCluster")]
        getter db_cluster : Types::DBCluster?

        def initialize(
          @db_cluster : Types::DBCluster? = nil
        )
        end
      end


      struct FailoverGlobalClusterMessage
        include JSON::Serializable

        # The identifier of the Amazon DocumentDB global cluster to apply this operation. The identifier is
        # the unique key assigned by the user when the cluster is created. In other words, it's the name of
        # the global cluster. Constraints: Must match the identifier of an existing global cluster. Minimum
        # length of 1. Maximum length of 255. Pattern: [A-Za-z][0-9A-Za-z-:._]*

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        # The identifier of the secondary Amazon DocumentDB cluster that you want to promote to the primary
        # for the global cluster. Use the Amazon Resource Name (ARN) for the identifier so that Amazon
        # DocumentDB can locate the cluster in its Amazon Web Services region. Constraints: Must match the
        # identifier of an existing secondary cluster. Minimum length of 1. Maximum length of 255. Pattern:
        # [A-Za-z][0-9A-Za-z-:._]*

        @[JSON::Field(key: "TargetDbClusterIdentifier")]
        getter target_db_cluster_identifier : String

        # Specifies whether to allow data loss for this global cluster operation. Allowing data loss triggers
        # a global failover operation. If you don't specify AllowDataLoss , the global cluster operation
        # defaults to a switchover. Constraints: Can't be specified together with the Switchover parameter.

        @[JSON::Field(key: "AllowDataLoss")]
        getter allow_data_loss : Bool?

        # Specifies whether to switch over this global database cluster. Constraints: Can't be specified
        # together with the AllowDataLoss parameter.

        @[JSON::Field(key: "Switchover")]
        getter switchover : Bool?

        def initialize(
          @global_cluster_identifier : String,
          @target_db_cluster_identifier : String,
          @allow_data_loss : Bool? = nil,
          @switchover : Bool? = nil
        )
        end
      end


      struct FailoverGlobalClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "GlobalCluster")]
        getter global_cluster : Types::GlobalCluster?

        def initialize(
          @global_cluster : Types::GlobalCluster? = nil
        )
        end
      end

      # Contains the state of scheduled or in-process operations on an Amazon DocumentDB global cluster.
      # This data type is empty unless a switchover or failover operation is scheduled or is in progress on
      # the global cluster.

      struct FailoverState
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon DocumentDB cluster that is currently being demoted, and
        # which is associated with this state.

        @[JSON::Field(key: "FromDbClusterArn")]
        getter from_db_cluster_arn : String?

        # Indicates whether the operation is a global switchover or a global failover. If data loss is
        # allowed, then the operation is a global failover. Otherwise, it's a switchover.

        @[JSON::Field(key: "IsDataLossAllowed")]
        getter is_data_loss_allowed : Bool?

        # The current status of the global cluster. Possible values are as follows: pending – The service
        # received a request to switch over or fail over the global cluster. The global cluster's primary
        # cluster and the specified secondary cluster are being verified before the operation starts.
        # failing-over – The chosen secondary cluster is being promoted to become the new primary cluster to
        # fail over the global cluster. cancelling – The request to switch over or fail over the global
        # cluster was cancelled and the primary cluster and the selected secondary cluster are returning to
        # their previous states.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the Amazon DocumentDB cluster that is currently being promoted,
        # and which is associated with this state.

        @[JSON::Field(key: "ToDbClusterArn")]
        getter to_db_cluster_arn : String?

        def initialize(
          @from_db_cluster_arn : String? = nil,
          @is_data_loss_allowed : Bool? = nil,
          @status : String? = nil,
          @to_db_cluster_arn : String? = nil
        )
        end
      end

      # A named set of filter values, used to return a more specific list of results. You can use a filter
      # to match a set of resources by specific criteria, such as IDs. Wildcards are not supported in
      # filters.

      struct Filter
        include JSON::Serializable

        # The name of the filter. Filter names are case sensitive.

        @[JSON::Field(key: "Name")]
        getter name : String

        # One or more filter values. Filter values are case sensitive.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # A data type representing an Amazon DocumentDB global cluster.

      struct GlobalCluster
        include JSON::Serializable

        # The default database name within the new global cluster.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The deletion protection setting for the new global cluster.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The Amazon DocumentDB database engine used by the global cluster.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Indicates the database engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # A data object containing all properties for the current state of an in-process or pending switchover
        # or failover process for this global cluster. This object is empty unless the SwitchoverGlobalCluster
        # or FailoverGlobalCluster operation was called on this global cluster.

        @[JSON::Field(key: "FailoverState")]
        getter failover_state : Types::FailoverState?

        # The Amazon Resource Name (ARN) for the global cluster.

        @[JSON::Field(key: "GlobalClusterArn")]
        getter global_cluster_arn : String?

        # Contains a user-supplied global cluster identifier. This identifier is the unique key that
        # identifies a global cluster.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String?

        # The list of cluster IDs for secondary clusters within the global cluster. Currently limited to one
        # item.

        @[JSON::Field(key: "GlobalClusterMembers")]
        getter global_cluster_members : Array(Types::GlobalClusterMember)?

        # The Amazon Web Services RegionRegion-unique, immutable identifier for the global database cluster.
        # This identifier is found in CloudTrail log entries whenever the KMS customer master key (CMK) for
        # the cluster is accessed.

        @[JSON::Field(key: "GlobalClusterResourceId")]
        getter global_cluster_resource_id : String?

        # Specifies the current state of this global cluster.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The storage encryption setting for the global cluster.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # A list of global cluster tags.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @database_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @failover_state : Types::FailoverState? = nil,
          @global_cluster_arn : String? = nil,
          @global_cluster_identifier : String? = nil,
          @global_cluster_members : Array(Types::GlobalClusterMember)? = nil,
          @global_cluster_resource_id : String? = nil,
          @status : String? = nil,
          @storage_encrypted : Bool? = nil,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # The GlobalClusterIdentifier already exists. Choose a new global cluster identifier (unique name) to
      # create a new global cluster.

      struct GlobalClusterAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # A data structure with information about any primary and secondary clusters associated with an Amazon
      # DocumentDB global clusters.

      struct GlobalClusterMember
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for each Amazon DocumentDB cluster.

        @[JSON::Field(key: "DBClusterArn")]
        getter db_cluster_arn : String?

        # Specifies whether the Amazon DocumentDB cluster is the primary cluster (that is, has read-write
        # capability) for the Amazon DocumentDB global cluster with which it is associated.

        @[JSON::Field(key: "IsWriter")]
        getter is_writer : Bool?

        # The Amazon Resource Name (ARN) for each read-only secondary cluster associated with the Amazon
        # DocumentDB global cluster.

        @[JSON::Field(key: "Readers")]
        getter readers : Array(String)?

        # The status of synchronization of each Amazon DocumentDB cluster in the global cluster.

        @[JSON::Field(key: "SynchronizationStatus")]
        getter synchronization_status : String?

        def initialize(
          @db_cluster_arn : String? = nil,
          @is_writer : Bool? = nil,
          @readers : Array(String)? = nil,
          @synchronization_status : String? = nil
        )
        end
      end

      # The GlobalClusterIdentifier doesn't refer to an existing global cluster.

      struct GlobalClusterNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The number of global clusters for this account is already at the maximum allowed.

      struct GlobalClusterQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end


      struct GlobalClustersMessage
        include JSON::Serializable


        @[JSON::Field(key: "GlobalClusters")]
        getter global_clusters : Array(Types::GlobalCluster)?


        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @global_clusters : Array(Types::GlobalCluster)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The request would cause you to exceed the allowed number of instances.

      struct InstanceQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster doesn't have enough capacity for the current operation.

      struct InsufficientDBClusterCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified instance class isn't available in the specified Availability Zone.

      struct InsufficientDBInstanceCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # There is not enough storage available for the current action. You might be able to resolve this
      # error by updating your subnet group to use different Availability Zones that have more storage
      # available.

      struct InsufficientStorageClusterCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # The provided value isn't a valid cluster snapshot state.

      struct InvalidDBClusterSnapshotStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster isn't in a valid state.

      struct InvalidDBClusterStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified instance isn't in the available state.

      struct InvalidDBInstanceStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The parameter group is in use, or it is in a state that is not valid. If you are trying to delete
      # the parameter group, you can't delete it when the parameter group is in this state.

      struct InvalidDBParameterGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The state of the security group doesn't allow deletion.

      struct InvalidDBSecurityGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The state of the snapshot doesn't allow deletion.

      struct InvalidDBSnapshotStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The subnet group can't be deleted because it's in use.

      struct InvalidDBSubnetGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The subnet isn't in the available state.

      struct InvalidDBSubnetStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # Someone else might be modifying a subscription. Wait a few seconds, and try again.

      struct InvalidEventSubscriptionStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation can't be performed while the cluster is in this state.

      struct InvalidGlobalClusterStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # You cannot restore from a virtual private cloud (VPC) backup to a non-VPC DB instance.

      struct InvalidRestoreFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested subnet is not valid, or multiple subnets were requested that are not all in a common
      # virtual private cloud (VPC).

      struct InvalidSubnet
        include JSON::Serializable

        def initialize
        end
      end

      # The subnet group doesn't cover all Availability Zones after it is created because of changes that
      # were made.

      struct InvalidVPCNetworkStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # An error occurred when accessing an KMS key.

      struct KMSKeyNotAccessibleFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input to ListTagsForResource .

      struct ListTagsForResourceMessage
        include JSON::Serializable

        # The Amazon DocumentDB resource with tags to be listed. This value is an Amazon Resource Name (ARN).

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        def initialize(
          @resource_name : String,
          @filters : Array(Types::Filter)? = nil
        )
        end
      end

      # Represents the input to ModifyDBCluster .

      struct ModifyDBClusterMessage
        include JSON::Serializable

        # The cluster identifier for the cluster that is being modified. This parameter is not case sensitive.
        # Constraints: Must match the identifier of an existing DBCluster .

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # A value that indicates whether major version upgrades are allowed. Constraints: You must allow major
        # version upgrades when specifying a value for the EngineVersion parameter that is a different major
        # version than the cluster's current version. Since some parameters are version specific, changing
        # them requires executing a new ModifyDBCluster API call after the in-place MVU completes. Performing
        # an MVU directly impacts the following parameters: MasterUserPassword NewDBClusterIdentifier
        # VpcSecurityGroupIds Port

        @[JSON::Field(key: "AllowMajorVersionUpgrade")]
        getter allow_major_version_upgrade : Bool?

        # A value that specifies whether the changes in this request and any pending changes are
        # asynchronously applied as soon as possible, regardless of the PreferredMaintenanceWindow setting for
        # the cluster. If this parameter is set to false , changes to the cluster are applied during the next
        # maintenance window. The ApplyImmediately parameter affects only the NewDBClusterIdentifier and
        # MasterUserPassword values. If you set this parameter value to false , the changes to the
        # NewDBClusterIdentifier and MasterUserPassword values are applied during the next maintenance window.
        # All other changes are applied immediately, regardless of the value of the ApplyImmediately
        # parameter. Default: false

        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool?

        # The number of days for which automated backups are retained. You must specify a minimum value of 1.
        # Default: 1 Constraints: Must be a value from 1 to 35.

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # The configuration setting for the log types to be enabled for export to Amazon CloudWatch Logs for a
        # specific instance or cluster. The EnableLogTypes and DisableLogTypes arrays determine which logs are
        # exported (or not exported) to CloudWatch Logs.

        @[JSON::Field(key: "CloudwatchLogsExportConfiguration")]
        getter cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration?

        # The name of the cluster parameter group to use for the cluster.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # Specifies whether this cluster can be deleted. If DeletionProtection is enabled, the cluster cannot
        # be deleted unless it is modified and DeletionProtection is disabled. DeletionProtection protects
        # clusters from being accidentally deleted.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The version number of the database engine to which you want to upgrade. Changing this parameter
        # results in an outage. The change is applied during the next maintenance window unless
        # ApplyImmediately is enabled. To list all of the available engine versions for Amazon DocumentDB use
        # the following command: aws docdb describe-db-engine-versions --engine docdb --query
        # "DBEngineVersions[].EngineVersion"

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Specifies whether to manage the master user password with Amazon Web Services Secrets Manager. If
        # the cluster doesn't manage the master user password with Amazon Web Services Secrets Manager, you
        # can turn on this management. In this case, you can't specify MasterUserPassword . If the cluster
        # already manages the master user password with Amazon Web Services Secrets Manager, and you specify
        # that the master user password is not managed with Amazon Web Services Secrets Manager, then you must
        # specify MasterUserPassword . In this case, Amazon DocumentDB deletes the secret and uses the new
        # password for the master user specified by MasterUserPassword .

        @[JSON::Field(key: "ManageMasterUserPassword")]
        getter manage_master_user_password : Bool?

        # The password for the master database user. This password can contain any printable ASCII character
        # except forward slash (/), double quote ("), or the "at" symbol (@). Constraints: Must contain from 8
        # to 100 characters.

        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # The Amazon Web Services KMS key identifier to encrypt a secret that is automatically generated and
        # managed in Amazon Web Services Secrets Manager. This setting is valid only if both of the following
        # conditions are met: The cluster doesn't manage the master user password in Amazon Web Services
        # Secrets Manager. If the cluster already manages the master user password in Amazon Web Services
        # Secrets Manager, you can't change the KMS key that is used to encrypt the secret. You are enabling
        # ManageMasterUserPassword to manage the master user password in Amazon Web Services Secrets Manager.
        # If you are turning on ManageMasterUserPassword and don't specify MasterUserSecretKmsKeyId , then the
        # aws/secretsmanager KMS key is used to encrypt the secret. If the secret is in a different Amazon Web
        # Services account, then you can't use the aws/secretsmanager KMS key to encrypt the secret, and you
        # must use a customer managed KMS key. The Amazon Web Services KMS key identifier is the key ARN, key
        # ID, alias ARN, or alias name for the KMS key. To use a KMS key in a different Amazon Web Services
        # account, specify the key ARN or alias ARN. There is a default KMS key for your Amazon Web Services
        # account. Your Amazon Web Services account has a different default KMS key for each Amazon Web
        # Services Region.

        @[JSON::Field(key: "MasterUserSecretKmsKeyId")]
        getter master_user_secret_kms_key_id : String?

        # The network type of the cluster. The network type is determined by the DBSubnetGroup specified for
        # the cluster. A DBSubnetGroup can support only the IPv4 protocol or the IPv4 and the IPv6 protocols (
        # DUAL ). For more information, see DocumentDB clusters in a VPC in the Amazon DocumentDB Developer
        # Guide. Valid Values: IPV4 | DUAL

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The new cluster identifier for the cluster when renaming a cluster. This value is stored as a
        # lowercase string. Constraints: Must contain from 1 to 63 letters, numbers, or hyphens. The first
        # character must be a letter. Cannot end with a hyphen or contain two consecutive hyphens. Example:
        # my-cluster2

        @[JSON::Field(key: "NewDBClusterIdentifier")]
        getter new_db_cluster_identifier : String?

        # The port number on which the cluster accepts connections. Constraints: Must be a value from 1150 to
        # 65535 . Default: The same port as the original cluster.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The daily time range during which automated backups are created if automated backups are enabled,
        # using the BackupRetentionPeriod parameter. The default is a 30-minute window selected at random from
        # an 8-hour block of time for each Amazon Web Services Region. Constraints: Must be in the format
        # hh24:mi-hh24:mi . Must be in Universal Coordinated Time (UTC). Must not conflict with the preferred
        # maintenance window. Must be at least 30 minutes.

        @[JSON::Field(key: "PreferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format: ddd:hh24:mi-ddd:hh24:mi The default is a 30-minute window selected at random from an
        # 8-hour block of time for each Amazon Web Services Region, occurring on a random day of the week.
        # Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Specifies whether to rotate the secret managed by Amazon Web Services Secrets Manager for the master
        # user password. This setting is valid only if the master user password is managed by Amazon
        # DocumentDB in Amazon Web Services Secrets Manager for the cluster. The secret value contains the
        # updated password. Constraint: You must apply the change immediately when rotating the master user
        # password.

        @[JSON::Field(key: "RotateMasterUserPassword")]
        getter rotate_master_user_password : Bool?

        # Contains the scaling configuration of an Amazon DocumentDB Serverless cluster.

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration?

        # The storage type to associate with the DB cluster. For information on storage types for Amazon
        # DocumentDB clusters, see Cluster storage configurations in the Amazon DocumentDB Developer Guide .
        # Valid values for storage type - standard | iopt1 Default value is standard

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # A list of virtual private cloud (VPC) security groups that the cluster will belong to.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_cluster_identifier : String,
          @allow_major_version_upgrade : Bool? = nil,
          @apply_immediately : Bool? = nil,
          @backup_retention_period : Int32? = nil,
          @cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration? = nil,
          @db_cluster_parameter_group_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @engine_version : String? = nil,
          @manage_master_user_password : Bool? = nil,
          @master_user_password : String? = nil,
          @master_user_secret_kms_key_id : String? = nil,
          @network_type : String? = nil,
          @new_db_cluster_identifier : String? = nil,
          @port : Int32? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @rotate_master_user_password : Bool? = nil,
          @serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
          @storage_type : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      # Represents the input to ModifyDBClusterParameterGroup .

      struct ModifyDBClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the cluster parameter group to modify.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String

        # A list of parameters in the cluster parameter group to modify.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)

        def initialize(
          @db_cluster_parameter_group_name : String,
          @parameters : Array(Types::Parameter)
        )
        end
      end


      struct ModifyDBClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "DBCluster")]
        getter db_cluster : Types::DBCluster?

        def initialize(
          @db_cluster : Types::DBCluster? = nil
        )
        end
      end

      # Represents the input to ModifyDBClusterSnapshotAttribute .

      struct ModifyDBClusterSnapshotAttributeMessage
        include JSON::Serializable

        # The name of the cluster snapshot attribute to modify. To manage authorization for other Amazon Web
        # Services accounts to copy or restore a manual cluster snapshot, set this value to restore .

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The identifier for the cluster snapshot to modify the attributes for.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String

        # A list of cluster snapshot attributes to add to the attribute specified by AttributeName . To
        # authorize other Amazon Web Services accounts to copy or restore a manual cluster snapshot, set this
        # list to include one or more Amazon Web Services account IDs. To make the manual cluster snapshot
        # restorable by any Amazon Web Services account, set it to all . Do not add the all value for any
        # manual cluster snapshots that contain private information that you don't want to be available to all
        # Amazon Web Services accounts.

        @[JSON::Field(key: "ValuesToAdd")]
        getter values_to_add : Array(String)?

        # A list of cluster snapshot attributes to remove from the attribute specified by AttributeName . To
        # remove authorization for other Amazon Web Services accounts to copy or restore a manual cluster
        # snapshot, set this list to include one or more Amazon Web Services account identifiers. To remove
        # authorization for any Amazon Web Services account to copy or restore the cluster snapshot, set it to
        # all . If you specify all , an Amazon Web Services account whose account ID is explicitly added to
        # the restore attribute can still copy or restore a manual cluster snapshot.

        @[JSON::Field(key: "ValuesToRemove")]
        getter values_to_remove : Array(String)?

        def initialize(
          @attribute_name : String,
          @db_cluster_snapshot_identifier : String,
          @values_to_add : Array(String)? = nil,
          @values_to_remove : Array(String)? = nil
        )
        end
      end


      struct ModifyDBClusterSnapshotAttributeResult
        include JSON::Serializable


        @[JSON::Field(key: "DBClusterSnapshotAttributesResult")]
        getter db_cluster_snapshot_attributes_result : Types::DBClusterSnapshotAttributesResult?

        def initialize(
          @db_cluster_snapshot_attributes_result : Types::DBClusterSnapshotAttributesResult? = nil
        )
        end
      end

      # Represents the input to ModifyDBInstance .

      struct ModifyDBInstanceMessage
        include JSON::Serializable

        # The instance identifier. This value is stored as a lowercase string. Constraints: Must match the
        # identifier of an existing DBInstance .

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String

        # Specifies whether the modifications in this request and any pending modifications are asynchronously
        # applied as soon as possible, regardless of the PreferredMaintenanceWindow setting for the instance.
        # If this parameter is set to false , changes to the instance are applied during the next maintenance
        # window. Some parameter changes can cause an outage and are applied on the next reboot. Default:
        # false

        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool?

        # This parameter does not apply to Amazon DocumentDB. Amazon DocumentDB does not perform minor version
        # upgrades regardless of the value set.

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Indicates the certificate that needs to be associated with the instance.

        @[JSON::Field(key: "CACertificateIdentifier")]
        getter ca_certificate_identifier : String?

        # Specifies whether the DB instance is restarted when you rotate your SSL/TLS certificate. By default,
        # the DB instance is restarted when you rotate your SSL/TLS certificate. The certificate is not
        # updated until the DB instance is restarted. Set this parameter only if you are not using SSL/TLS to
        # connect to the DB instance. If you are using SSL/TLS to connect to the DB instance, see Updating
        # Your Amazon DocumentDB TLS Certificates and Encrypting Data in Transit in the Amazon DocumentDB
        # Developer Guide .

        @[JSON::Field(key: "CertificateRotationRestart")]
        getter certificate_rotation_restart : Bool?

        # A value that indicates whether to copy all tags from the DB instance to snapshots of the DB
        # instance. By default, tags are not copied.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # The new compute and memory capacity of the instance; for example, db.r5.large . Not all instance
        # classes are available in all Amazon Web Services Regions. If you modify the instance class, an
        # outage occurs during the change. The change is applied during the next maintenance window, unless
        # ApplyImmediately is specified as true for this request. Default: Uses existing setting.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # A value that indicates whether to enable Performance Insights for the DB Instance. For more
        # information, see Using Amazon Performance Insights .

        @[JSON::Field(key: "EnablePerformanceInsights")]
        getter enable_performance_insights : Bool?

        # The new instance identifier for the instance when renaming an instance. When you change the instance
        # identifier, an instance reboot occurs immediately if you set Apply Immediately to true . It occurs
        # during the next maintenance window if you set Apply Immediately to false . This value is stored as a
        # lowercase string. Constraints: Must contain from 1 to 63 letters, numbers, or hyphens. The first
        # character must be a letter. Cannot end with a hyphen or contain two consecutive hyphens. Example:
        # mydbinstance

        @[JSON::Field(key: "NewDBInstanceIdentifier")]
        getter new_db_instance_identifier : String?

        # The KMS key identifier for encryption of Performance Insights data. The KMS key identifier is the
        # key ARN, key ID, alias ARN, or alias name for the KMS key. If you do not specify a value for
        # PerformanceInsightsKMSKeyId, then Amazon DocumentDB uses your default KMS key. There is a default
        # KMS key for your Amazon Web Services account. Your Amazon Web Services account has a different
        # default KMS key for each Amazon Web Services region.

        @[JSON::Field(key: "PerformanceInsightsKMSKeyId")]
        getter performance_insights_kms_key_id : String?

        # The weekly time range (in UTC) during which system maintenance can occur, which might result in an
        # outage. Changing this parameter doesn't result in an outage except in the following situation, and
        # the change is asynchronously applied as soon as possible. If there are pending actions that cause a
        # reboot, and the maintenance window is changed to include the current time, changing this parameter
        # causes a reboot of the instance. If you are moving this window to the current time, there must be at
        # least 30 minutes between the current time and end of the window to ensure that pending changes are
        # applied. Default: Uses existing setting. Format: ddd:hh24:mi-ddd:hh24:mi Valid days: Mon, Tue, Wed,
        # Thu, Fri, Sat, Sun Constraints: Must be at least 30 minutes.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # A value that specifies the order in which an Amazon DocumentDB replica is promoted to the primary
        # instance after a failure of the existing primary instance. Default: 1 Valid values: 0-15

        @[JSON::Field(key: "PromotionTier")]
        getter promotion_tier : Int32?

        def initialize(
          @db_instance_identifier : String,
          @apply_immediately : Bool? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @ca_certificate_identifier : String? = nil,
          @certificate_rotation_restart : Bool? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @db_instance_class : String? = nil,
          @enable_performance_insights : Bool? = nil,
          @new_db_instance_identifier : String? = nil,
          @performance_insights_kms_key_id : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @promotion_tier : Int32? = nil
        )
        end
      end


      struct ModifyDBInstanceResult
        include JSON::Serializable


        @[JSON::Field(key: "DBInstance")]
        getter db_instance : Types::DBInstance?

        def initialize(
          @db_instance : Types::DBInstance? = nil
        )
        end
      end

      # Represents the input to ModifyDBSubnetGroup .

      struct ModifyDBSubnetGroupMessage
        include JSON::Serializable

        # The name for the subnet group. This value is stored as a lowercase string. You can't modify the
        # default subnet group. Constraints: Must match the name of an existing DBSubnetGroup . Must not be
        # default. Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String

        # The Amazon EC2 subnet IDs for the subnet group.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The description for the subnet group.

        @[JSON::Field(key: "DBSubnetGroupDescription")]
        getter db_subnet_group_description : String?

        def initialize(
          @db_subnet_group_name : String,
          @subnet_ids : Array(String),
          @db_subnet_group_description : String? = nil
        )
        end
      end


      struct ModifyDBSubnetGroupResult
        include JSON::Serializable


        @[JSON::Field(key: "DBSubnetGroup")]
        getter db_subnet_group : Types::DBSubnetGroup?

        def initialize(
          @db_subnet_group : Types::DBSubnetGroup? = nil
        )
        end
      end

      # Represents the input to ModifyEventSubscription .

      struct ModifyEventSubscriptionMessage
        include JSON::Serializable

        # The name of the Amazon DocumentDB event notification subscription.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        # A Boolean value; set to true to activate the subscription.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A list of event categories for a SourceType that you want to subscribe to.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN is created
        # by Amazon SNS when you create a topic and subscribe to it.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The type of source that is generating the events. For example, if you want to be notified of events
        # generated by an instance, set this parameter to db-instance . If this value is not specified, all
        # events are returned. Valid values: db-instance , db-parameter-group , db-security-group

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @subscription_name : String,
          @enabled : Bool? = nil,
          @event_categories : Array(String)? = nil,
          @sns_topic_arn : String? = nil,
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

      # Represents the input to ModifyGlobalCluster .

      struct ModifyGlobalClusterMessage
        include JSON::Serializable

        # The identifier for the global cluster being modified. This parameter isn't case-sensitive.
        # Constraints: Must match the identifier of an existing global cluster.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        # Indicates if the global cluster has deletion protection enabled. The global cluster can't be deleted
        # when deletion protection is enabled.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The new identifier for a global cluster when you modify a global cluster. This value is stored as a
        # lowercase string. Must contain from 1 to 63 letters, numbers, or hyphens The first character must be
        # a letter Can't end with a hyphen or contain two consecutive hyphens Example: my-cluster2

        @[JSON::Field(key: "NewGlobalClusterIdentifier")]
        getter new_global_cluster_identifier : String?

        def initialize(
          @global_cluster_identifier : String,
          @deletion_protection : Bool? = nil,
          @new_global_cluster_identifier : String? = nil
        )
        end
      end


      struct ModifyGlobalClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "GlobalCluster")]
        getter global_cluster : Types::GlobalCluster?

        def initialize(
          @global_cluster : Types::GlobalCluster? = nil
        )
        end
      end

      # The network type is not supported by either DBSubnetGroup or the DB engine version.

      struct NetworkTypeNotSupported
        include JSON::Serializable

        def initialize
        end
      end

      # The options that are available for an instance.

      struct OrderableDBInstanceOption
        include JSON::Serializable

        # A list of Availability Zones for an instance.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(Types::AvailabilityZone)?

        # The instance class for an instance.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # The engine type of an instance.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The engine version of an instance.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The license model for an instance.

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # The storage type to associate with the DB cluster

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # Indicates whether an instance is in a virtual private cloud (VPC).

        @[JSON::Field(key: "Vpc")]
        getter vpc : Bool?

        def initialize(
          @availability_zones : Array(Types::AvailabilityZone)? = nil,
          @db_instance_class : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @license_model : String? = nil,
          @storage_type : String? = nil,
          @vpc : Bool? = nil
        )
        end
      end

      # Represents the output of DescribeOrderableDBInstanceOptions .

      struct OrderableDBInstanceOptionsMessage
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The options that are available for a particular orderable instance.

        @[JSON::Field(key: "OrderableDBInstanceOptions")]
        getter orderable_db_instance_options : Array(Types::OrderableDBInstanceOption)?

        def initialize(
          @marker : String? = nil,
          @orderable_db_instance_options : Array(Types::OrderableDBInstanceOption)? = nil
        )
        end
      end

      # Detailed information about an individual parameter.

      struct Parameter
        include JSON::Serializable

        # Specifies the valid range of values for the parameter.

        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : String?

        # Indicates when to apply parameter updates.

        @[JSON::Field(key: "ApplyMethod")]
        getter apply_method : String?

        # Specifies the engine-specific parameters type.

        @[JSON::Field(key: "ApplyType")]
        getter apply_type : String?

        # Specifies the valid data type for the parameter.

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # Provides a description of the parameter.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether ( true ) or not ( false ) the parameter can be modified. Some parameters have
        # security or operational implications that prevent them from being changed.

        @[JSON::Field(key: "IsModifiable")]
        getter is_modifiable : Bool?

        # The earliest engine version to which the parameter can apply.

        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # Specifies the name of the parameter.

        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        # Specifies the value of the parameter. Must be one or more of the cluster parameter's AllowedValues
        # in CSV format: Valid values are: enabled : The cluster accepts secure connections using TLS version
        # 1.0 through 1.3. disabled : The cluster does not accept secure connections using TLS. fips-140-3 :
        # The cluster only accepts secure connections per the requirements of the Federal Information
        # Processing Standards (FIPS) publication 140-3. Only supported starting with Amazon DocumentDB 5.0
        # (engine version 3.0.3727) clusters in these regions: ca-central-1, us-west-2, us-east-1, us-east-2,
        # us-gov-east-1, us-gov-west-1. tls1.2+ : The cluster accepts secure connections using TLS version 1.2
        # and above. Only supported starting with Amazon DocumentDB 4.0 (engine version 2.0.10980) and Amazon
        # DocumentDB 5.0 (engine version 3.0.11051). tls1.3+ : The cluster accepts secure connections using
        # TLS version 1.3 and above. Only supported starting with Amazon DocumentDB 4.0 (engine version
        # 2.0.10980) and Amazon DocumentDB 5.0 (engine version 3.0.11051).

        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String?

        # Indicates the source of the parameter value.

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @allowed_values : String? = nil,
          @apply_method : String? = nil,
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

      # A list of the log types whose configuration is still pending. These log types are in the process of
      # being activated or deactivated.

      struct PendingCloudwatchLogsExports
        include JSON::Serializable

        # Log types that are in the process of being enabled. After they are enabled, these log types are
        # exported to Amazon CloudWatch Logs.

        @[JSON::Field(key: "LogTypesToDisable")]
        getter log_types_to_disable : Array(String)?

        # Log types that are in the process of being deactivated. After they are deactivated, these log types
        # aren't exported to CloudWatch Logs.

        @[JSON::Field(key: "LogTypesToEnable")]
        getter log_types_to_enable : Array(String)?

        def initialize(
          @log_types_to_disable : Array(String)? = nil,
          @log_types_to_enable : Array(String)? = nil
        )
        end
      end

      # Provides information about a pending maintenance action for a resource.

      struct PendingMaintenanceAction
        include JSON::Serializable

        # The type of pending maintenance action that is available for the resource.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The date of the maintenance window when the action is applied. The maintenance action is applied to
        # the resource during its first maintenance window after this date. If this date is specified, any
        # next-maintenance opt-in requests are ignored.

        @[JSON::Field(key: "AutoAppliedAfterDate")]
        getter auto_applied_after_date : Time?

        # The effective date when the pending maintenance action is applied to the resource.

        @[JSON::Field(key: "CurrentApplyDate")]
        getter current_apply_date : Time?

        # A description providing more detail about the maintenance action.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date when the maintenance action is automatically applied. The maintenance action is applied to
        # the resource on this date regardless of the maintenance window for the resource. If this date is
        # specified, any immediate opt-in requests are ignored.

        @[JSON::Field(key: "ForcedApplyDate")]
        getter forced_apply_date : Time?

        # Indicates the type of opt-in request that has been received for the resource.

        @[JSON::Field(key: "OptInStatus")]
        getter opt_in_status : String?

        def initialize(
          @action : String? = nil,
          @auto_applied_after_date : Time? = nil,
          @current_apply_date : Time? = nil,
          @description : String? = nil,
          @forced_apply_date : Time? = nil,
          @opt_in_status : String? = nil
        )
        end
      end

      # Represents the output of DescribePendingMaintenanceActions .

      struct PendingMaintenanceActionsMessage
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maintenance actions to be applied.

        @[JSON::Field(key: "PendingMaintenanceActions")]
        getter pending_maintenance_actions : Array(Types::ResourcePendingMaintenanceActions)?

        def initialize(
          @marker : String? = nil,
          @pending_maintenance_actions : Array(Types::ResourcePendingMaintenanceActions)? = nil
        )
        end
      end

      # One or more modified settings for an instance. These modified settings have been requested, but
      # haven't been applied yet.

      struct PendingModifiedValues
        include JSON::Serializable

        # Contains the new AllocatedStorage size for then instance that will be applied or is currently being
        # applied.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # Specifies the pending number of days for which automated backups are retained.

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # Specifies the identifier of the certificate authority (CA) certificate for the DB instance.

        @[JSON::Field(key: "CACertificateIdentifier")]
        getter ca_certificate_identifier : String?

        # Contains the new DBInstanceClass for the instance that will be applied or is currently being
        # applied.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # Contains the new DBInstanceIdentifier for the instance that will be applied or is currently being
        # applied.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String?

        # The new subnet group for the instance.

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # Indicates the database engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Specifies the new Provisioned IOPS value for the instance that will be applied or is currently being
        # applied.

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # The license model for the instance. Valid values: license-included , bring-your-own-license ,
        # general-public-license

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # Contains the pending or currently in-progress change of the master credentials for the instance.

        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # Indicates that the Single-AZ instance is to change to a Multi-AZ deployment.

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # A list of the log types whose configuration is still pending. These log types are in the process of
        # being activated or deactivated.

        @[JSON::Field(key: "PendingCloudwatchLogsExports")]
        getter pending_cloudwatch_logs_exports : Types::PendingCloudwatchLogsExports?

        # Specifies the pending port for the instance.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Specifies the storage type to be associated with the instance.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        def initialize(
          @allocated_storage : Int32? = nil,
          @backup_retention_period : Int32? = nil,
          @ca_certificate_identifier : String? = nil,
          @db_instance_class : String? = nil,
          @db_instance_identifier : String? = nil,
          @db_subnet_group_name : String? = nil,
          @engine_version : String? = nil,
          @iops : Int32? = nil,
          @license_model : String? = nil,
          @master_user_password : String? = nil,
          @multi_az : Bool? = nil,
          @pending_cloudwatch_logs_exports : Types::PendingCloudwatchLogsExports? = nil,
          @port : Int32? = nil,
          @storage_type : String? = nil
        )
        end
      end

      # Represents the input to RebootDBInstance .

      struct RebootDBInstanceMessage
        include JSON::Serializable

        # The instance identifier. This parameter is stored as a lowercase string. Constraints: Must match the
        # identifier of an existing DBInstance .

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String

        # When true , the reboot is conducted through a Multi-AZ failover. Constraint: You can't specify true
        # if the instance is not configured for Multi-AZ.

        @[JSON::Field(key: "ForceFailover")]
        getter force_failover : Bool?

        def initialize(
          @db_instance_identifier : String,
          @force_failover : Bool? = nil
        )
        end
      end


      struct RebootDBInstanceResult
        include JSON::Serializable


        @[JSON::Field(key: "DBInstance")]
        getter db_instance : Types::DBInstance?

        def initialize(
          @db_instance : Types::DBInstance? = nil
        )
        end
      end

      # Represents the input to RemoveFromGlobalCluster .

      struct RemoveFromGlobalClusterMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) identifying the cluster that was detached from the Amazon DocumentDB
        # global cluster.

        @[JSON::Field(key: "DbClusterIdentifier")]
        getter db_cluster_identifier : String

        # The cluster identifier to detach from the Amazon DocumentDB global cluster.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        def initialize(
          @db_cluster_identifier : String,
          @global_cluster_identifier : String
        )
        end
      end


      struct RemoveFromGlobalClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "GlobalCluster")]
        getter global_cluster : Types::GlobalCluster?

        def initialize(
          @global_cluster : Types::GlobalCluster? = nil
        )
        end
      end

      # Represents the input to RemoveSourceIdentifierFromSubscription .

      struct RemoveSourceIdentifierFromSubscriptionMessage
        include JSON::Serializable

        # The source identifier to be removed from the subscription, such as the instance identifier for an
        # instance, or the name of a security group.

        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String

        # The name of the Amazon DocumentDB event notification subscription that you want to remove a source
        # identifier from.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        def initialize(
          @source_identifier : String,
          @subscription_name : String
        )
        end
      end


      struct RemoveSourceIdentifierFromSubscriptionResult
        include JSON::Serializable


        @[JSON::Field(key: "EventSubscription")]
        getter event_subscription : Types::EventSubscription?

        def initialize(
          @event_subscription : Types::EventSubscription? = nil
        )
        end
      end

      # Represents the input to RemoveTagsFromResource .

      struct RemoveTagsFromResourceMessage
        include JSON::Serializable

        # The Amazon DocumentDB resource that the tags are removed from. This value is an Amazon Resource Name
        # (ARN).

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The tag key (name) of the tag to be removed.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_name : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Represents the input to ResetDBClusterParameterGroup .

      struct ResetDBClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the cluster parameter group to reset.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String

        # A list of parameter names in the cluster parameter group to reset to the default values. You can't
        # use this parameter if the ResetAllParameters parameter is set to true .

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # A value that is set to true to reset all parameters in the cluster parameter group to their default
        # values, and false otherwise. You can't use this parameter if there is a list of parameter names
        # specified for the Parameters parameter.

        @[JSON::Field(key: "ResetAllParameters")]
        getter reset_all_parameters : Bool?

        def initialize(
          @db_cluster_parameter_group_name : String,
          @parameters : Array(Types::Parameter)? = nil,
          @reset_all_parameters : Bool? = nil
        )
        end
      end

      # The specified resource ID was not found.

      struct ResourceNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of ApplyPendingMaintenanceAction .

      struct ResourcePendingMaintenanceActions
        include JSON::Serializable

        # A list that provides details about the pending maintenance actions for the resource.

        @[JSON::Field(key: "PendingMaintenanceActionDetails")]
        getter pending_maintenance_action_details : Array(Types::PendingMaintenanceAction)?

        # The Amazon Resource Name (ARN) of the resource that has pending maintenance actions.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        def initialize(
          @pending_maintenance_action_details : Array(Types::PendingMaintenanceAction)? = nil,
          @resource_identifier : String? = nil
        )
        end
      end

      # Represents the input to RestoreDBClusterFromSnapshot .

      struct RestoreDBClusterFromSnapshotMessage
        include JSON::Serializable

        # The name of the cluster to create from the snapshot or cluster snapshot. This parameter isn't case
        # sensitive. Constraints: Must contain from 1 to 63 letters, numbers, or hyphens. The first character
        # must be a letter. Cannot end with a hyphen or contain two consecutive hyphens. Example:
        # my-snapshot-id

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The database engine to use for the new cluster. Default: The same as source. Constraint: Must be
        # compatible with the engine of the source.

        @[JSON::Field(key: "Engine")]
        getter engine : String

        # The identifier for the snapshot or cluster snapshot to restore from. You can use either the name or
        # the Amazon Resource Name (ARN) to specify a cluster snapshot. However, you can use only the ARN to
        # specify a snapshot. Constraints: Must match the identifier of an existing snapshot.

        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String

        # Provides the list of Amazon EC2 Availability Zones that instances in the restored DB cluster can be
        # created in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The name of the DB cluster parameter group to associate with this DB cluster. Type: String.
        # Required: No. If this argument is omitted, the default DB cluster parameter group is used. If
        # supplied, must match the name of an existing default DB cluster parameter group. The string must
        # consist of from 1 to 255 letters, numbers or hyphens. Its first character must be a letter, and it
        # cannot end with a hyphen or contain two consecutive hyphens.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # The name of the subnet group to use for the new cluster. Constraints: If provided, must match the
        # name of an existing DBSubnetGroup . Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # Specifies whether this cluster can be deleted. If DeletionProtection is enabled, the cluster cannot
        # be deleted unless it is modified and DeletionProtection is disabled. DeletionProtection protects
        # clusters from being accidentally deleted.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # A list of log types that must be enabled for exporting to Amazon CloudWatch Logs.

        @[JSON::Field(key: "EnableCloudwatchLogsExports")]
        getter enable_cloudwatch_logs_exports : Array(String)?

        # The version of the database engine to use for the new cluster.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The KMS key identifier to use when restoring an encrypted cluster from a DB snapshot or cluster
        # snapshot. The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If
        # you are restoring a cluster with the same Amazon Web Services account that owns the KMS encryption
        # key used to encrypt the new cluster, then you can use the KMS key alias instead of the ARN for the
        # KMS encryption key. If you do not specify a value for the KmsKeyId parameter, then the following
        # occurs: If the snapshot or cluster snapshot in SnapshotIdentifier is encrypted, then the restored
        # cluster is encrypted using the KMS key that was used to encrypt the snapshot or the cluster
        # snapshot. If the snapshot or the cluster snapshot in SnapshotIdentifier is not encrypted, then the
        # restored DB cluster is not encrypted.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The network type of the cluster. The network type is determined by the DBSubnetGroup specified for
        # the cluster. A DBSubnetGroup can support only the IPv4 protocol or the IPv4 and the IPv6 protocols (
        # DUAL ). For more information, see DocumentDB clusters in a VPC in the Amazon DocumentDB Developer
        # Guide. Valid Values: IPV4 | DUAL

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The port number on which the new cluster accepts connections. Constraints: Must be a value from 1150
        # to 65535 . Default: The same port as the original cluster.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Contains the scaling configuration of an Amazon DocumentDB Serverless cluster.

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration?

        # The storage type to associate with the DB cluster. For information on storage types for Amazon
        # DocumentDB clusters, see Cluster storage configurations in the Amazon DocumentDB Developer Guide .
        # Valid values for storage type - standard | iopt1 Default value is standard

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The tags to be assigned to the restored cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A list of virtual private cloud (VPC) security groups that the new cluster will belong to.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_cluster_identifier : String,
          @engine : String,
          @snapshot_identifier : String,
          @availability_zones : Array(String)? = nil,
          @db_cluster_parameter_group_name : String? = nil,
          @db_subnet_group_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @enable_cloudwatch_logs_exports : Array(String)? = nil,
          @engine_version : String? = nil,
          @kms_key_id : String? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
          @storage_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct RestoreDBClusterFromSnapshotResult
        include JSON::Serializable


        @[JSON::Field(key: "DBCluster")]
        getter db_cluster : Types::DBCluster?

        def initialize(
          @db_cluster : Types::DBCluster? = nil
        )
        end
      end

      # Represents the input to RestoreDBClusterToPointInTime .

      struct RestoreDBClusterToPointInTimeMessage
        include JSON::Serializable

        # The name of the new cluster to be created. Constraints: Must contain from 1 to 63 letters, numbers,
        # or hyphens. The first character must be a letter. Cannot end with a hyphen or contain two
        # consecutive hyphens.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The identifier of the source cluster from which to restore. Constraints: Must match the identifier
        # of an existing DBCluster .

        @[JSON::Field(key: "SourceDBClusterIdentifier")]
        getter source_db_cluster_identifier : String

        # The subnet group name to use for the new cluster. Constraints: If provided, must match the name of
        # an existing DBSubnetGroup . Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # Specifies whether this cluster can be deleted. If DeletionProtection is enabled, the cluster cannot
        # be deleted unless it is modified and DeletionProtection is disabled. DeletionProtection protects
        # clusters from being accidentally deleted.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # A list of log types that must be enabled for exporting to Amazon CloudWatch Logs.

        @[JSON::Field(key: "EnableCloudwatchLogsExports")]
        getter enable_cloudwatch_logs_exports : Array(String)?

        # The KMS key identifier to use when restoring an encrypted cluster from an encrypted cluster. The KMS
        # key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are restoring a
        # cluster with the same Amazon Web Services account that owns the KMS encryption key used to encrypt
        # the new cluster, then you can use the KMS key alias instead of the ARN for the KMS encryption key.
        # You can restore to a new cluster and encrypt the new cluster with an KMS key that is different from
        # the KMS key used to encrypt the source cluster. The new DB cluster is encrypted with the KMS key
        # identified by the KmsKeyId parameter. If you do not specify a value for the KmsKeyId parameter, then
        # the following occurs: If the cluster is encrypted, then the restored cluster is encrypted using the
        # KMS key that was used to encrypt the source cluster. If the cluster is not encrypted, then the
        # restored cluster is not encrypted. If DBClusterIdentifier refers to a cluster that is not encrypted,
        # then the restore request is rejected.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The network type of the cluster. The network type is determined by the DBSubnetGroup specified for
        # the cluster. A DBSubnetGroup can support only the IPv4 protocol or the IPv4 and the IPv6 protocols (
        # DUAL ). For more information, see DocumentDB clusters in a VPC in the Amazon DocumentDB Developer
        # Guide. Valid Values: IPV4 | DUAL

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The port number on which the new cluster accepts connections. Constraints: Must be a value from 1150
        # to 65535 . Default: The default port for the engine.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The date and time to restore the cluster to. Valid values: A time in Universal Coordinated Time
        # (UTC) format. Constraints: Must be before the latest restorable time for the instance. Must be
        # specified if the UseLatestRestorableTime parameter is not provided. Cannot be specified if the
        # UseLatestRestorableTime parameter is true . Cannot be specified if the RestoreType parameter is
        # copy-on-write . Example: 2015-03-07T23:45:00Z

        @[JSON::Field(key: "RestoreToTime")]
        getter restore_to_time : Time?

        # The type of restore to be performed. You can specify one of the following values: full-copy - The
        # new DB cluster is restored as a full copy of the source DB cluster. copy-on-write - The new DB
        # cluster is restored as a clone of the source DB cluster. Constraints: You can't specify
        # copy-on-write if the engine version of the source DB cluster is earlier than 1.11. If you don't
        # specify a RestoreType value, then the new DB cluster is restored as a full copy of the source DB
        # cluster.

        @[JSON::Field(key: "RestoreType")]
        getter restore_type : String?

        # Contains the scaling configuration of an Amazon DocumentDB Serverless cluster.

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration?

        # The storage type to associate with the DB cluster. For information on storage types for Amazon
        # DocumentDB clusters, see Cluster storage configurations in the Amazon DocumentDB Developer Guide .
        # Valid values for storage type - standard | iopt1 Default value is standard

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The tags to be assigned to the restored cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A value that is set to true to restore the cluster to the latest restorable backup time, and false
        # otherwise. Default: false Constraints: Cannot be specified if the RestoreToTime parameter is
        # provided.

        @[JSON::Field(key: "UseLatestRestorableTime")]
        getter use_latest_restorable_time : Bool?

        # A list of VPC security groups that the new cluster belongs to.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_cluster_identifier : String,
          @source_db_cluster_identifier : String,
          @db_subnet_group_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @enable_cloudwatch_logs_exports : Array(String)? = nil,
          @kms_key_id : String? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @restore_to_time : Time? = nil,
          @restore_type : String? = nil,
          @serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
          @storage_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @use_latest_restorable_time : Bool? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct RestoreDBClusterToPointInTimeResult
        include JSON::Serializable


        @[JSON::Field(key: "DBCluster")]
        getter db_cluster : Types::DBCluster?

        def initialize(
          @db_cluster : Types::DBCluster? = nil
        )
        end
      end

      # Amazon SNS has responded that there is a problem with the specified topic.

      struct SNSInvalidTopicFault
        include JSON::Serializable

        def initialize
        end
      end

      # You do not have permission to publish to the SNS topic Amazon Resource Name (ARN).

      struct SNSNoAuthorizationFault
        include JSON::Serializable

        def initialize
        end
      end

      # The SNS topic Amazon Resource Name (ARN) does not exist.

      struct SNSTopicArnNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies any Amazon DocumentDB Serverless properties or limits that differ between Amazon
      # DocumentDB engine versions. You can test the values of this attribute when deciding which Amazon
      # DocumentDB version to use in a new or upgraded cluster. You can also retrieve the version of an
      # existing cluster and check whether that version supports certain Amazon DocumentDB Serverless
      # features before you attempt to use those features.

      struct ServerlessV2FeaturesSupport
        include JSON::Serializable

        # The maximum number of Amazon DocumentDB capacity units (DCUs) for an instance in an Amazon
        # DocumentDB Serverless cluster. You can specify DCU values in half-step increments, such as 32, 32.5,
        # 33, and so on.

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Float64?

        # The minimum number of Amazon DocumentDB capacity units (DCUs) for an instance in an Amazon
        # DocumentDB Serverless cluster. You can specify DCU values in half-step increments, such as 8, 8.5,
        # 9, and so on.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Float64?

        def initialize(
          @max_capacity : Float64? = nil,
          @min_capacity : Float64? = nil
        )
        end
      end

      # Sets the scaling configuration of an Amazon DocumentDB Serverless cluster.

      struct ServerlessV2ScalingConfiguration
        include JSON::Serializable

        # The maximum number of Amazon DocumentDB capacity units (DCUs) for an instance in an Amazon
        # DocumentDB Serverless cluster. You can specify DCU values in half-step increments, such as 32, 32.5,
        # 33, and so on.

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Float64?

        # The minimum number of Amazon DocumentDB capacity units (DCUs) for an instance in an Amazon
        # DocumentDB Serverless cluster. You can specify DCU values in half-step increments, such as 8, 8.5,
        # 9, and so on.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Float64?

        def initialize(
          @max_capacity : Float64? = nil,
          @min_capacity : Float64? = nil
        )
        end
      end

      # Retrieves the scaling configuration for an Amazon DocumentDB Serverless cluster.

      struct ServerlessV2ScalingConfigurationInfo
        include JSON::Serializable

        # The maximum number of Amazon DocumentDB capacity units (DCUs) for an instance in an Amazon
        # DocumentDB Serverless cluster. You can specify DCU values in half-step increments, such as 32, 32.5,
        # 33, and so on.

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Float64?

        # The minimum number of Amazon DocumentDB capacity units (DCUs) for an instance in an Amazon
        # DocumentDB Serverless cluster. You can specify DCU values in half-step increments, such as 8, 8.5,
        # 9, and so on.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Float64?

        def initialize(
          @max_capacity : Float64? = nil,
          @min_capacity : Float64? = nil
        )
        end
      end

      # You have exceeded the maximum number of accounts that you can share a manual DB snapshot with.

      struct SharedSnapshotQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request would cause you to exceed the allowed number of snapshots.

      struct SnapshotQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested source could not be found.

      struct SourceNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end


      struct StartDBClusterMessage
        include JSON::Serializable

        # The identifier of the cluster to restart. Example: docdb-2019-05-28-15-24-52

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        def initialize(
          @db_cluster_identifier : String
        )
        end
      end


      struct StartDBClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "DBCluster")]
        getter db_cluster : Types::DBCluster?

        def initialize(
          @db_cluster : Types::DBCluster? = nil
        )
        end
      end


      struct StopDBClusterMessage
        include JSON::Serializable

        # The identifier of the cluster to stop. Example: docdb-2019-05-28-15-24-52

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        def initialize(
          @db_cluster_identifier : String
        )
        end
      end


      struct StopDBClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "DBCluster")]
        getter db_cluster : Types::DBCluster?

        def initialize(
          @db_cluster : Types::DBCluster? = nil
        )
        end
      end

      # The request would cause you to exceed the allowed amount of storage available across all instances.

      struct StorageQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Storage of the specified StorageType can't be associated with the DB instance.

      struct StorageTypeNotSupportedFault
        include JSON::Serializable

        def initialize
        end
      end

      # Detailed information about a subnet.

      struct Subnet
        include JSON::Serializable

        # Specifies the Availability Zone for the subnet.

        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : Types::AvailabilityZone?

        # Specifies the identifier of the subnet.

        @[JSON::Field(key: "SubnetIdentifier")]
        getter subnet_identifier : String?

        # Specifies the status of the subnet.

        @[JSON::Field(key: "SubnetStatus")]
        getter subnet_status : String?

        def initialize(
          @subnet_availability_zone : Types::AvailabilityZone? = nil,
          @subnet_identifier : String? = nil,
          @subnet_status : String? = nil
        )
        end
      end

      # The subnet is already in use in the Availability Zone.

      struct SubnetAlreadyInUse
        include JSON::Serializable

        def initialize
        end
      end

      # The provided subscription name already exists.

      struct SubscriptionAlreadyExistFault
        include JSON::Serializable

        def initialize
        end
      end

      # The provided category does not exist.

      struct SubscriptionCategoryNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The subscription name does not exist.

      struct SubscriptionNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end


      struct SwitchoverGlobalClusterMessage
        include JSON::Serializable

        # The identifier of the Amazon DocumentDB global database cluster to switch over. The identifier is
        # the unique key assigned by the user when the cluster is created. In other words, it's the name of
        # the global cluster. This parameter isn’t case-sensitive. Constraints: Must match the identifier of
        # an existing global cluster (Amazon DocumentDB global database). Minimum length of 1. Maximum length
        # of 255. Pattern: [A-Za-z][0-9A-Za-z-:._]*

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        # The identifier of the secondary Amazon DocumentDB cluster to promote to the new primary for the
        # global database cluster. Use the Amazon Resource Name (ARN) for the identifier so that Amazon
        # DocumentDB can locate the cluster in its Amazon Web Services region. Constraints: Must match the
        # identifier of an existing secondary cluster. Minimum length of 1. Maximum length of 255. Pattern:
        # [A-Za-z][0-9A-Za-z-:._]*

        @[JSON::Field(key: "TargetDbClusterIdentifier")]
        getter target_db_cluster_identifier : String

        def initialize(
          @global_cluster_identifier : String,
          @target_db_cluster_identifier : String
        )
        end
      end


      struct SwitchoverGlobalClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "GlobalCluster")]
        getter global_cluster : Types::GlobalCluster?

        def initialize(
          @global_cluster : Types::GlobalCluster? = nil
        )
        end
      end

      # Metadata assigned to an Amazon DocumentDB resource consisting of a key-value pair.

      struct Tag
        include JSON::Serializable

        # The required name of the tag. The string value can be from 1 to 128 Unicode characters in length and
        # can't be prefixed with " aws: " or " rds: ". The string can contain only the set of Unicode letters,
        # digits, white space, '_', '.', '/', '=', '+', '-' (Java regex:
        # "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The optional value of the tag. The string value can be from 1 to 256 Unicode characters in length
        # and can't be prefixed with " aws: " or " rds: ". The string can contain only the set of Unicode
        # letters, digits, white space, '_', '.', '/', '=', '+', '-' (Java regex:
        # "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Represents the output of ListTagsForResource .

      struct TagListMessage
        include JSON::Serializable

        # A list of one or more tags.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # The version of the database engine that an instance can be upgraded to.

      struct UpgradeTarget
        include JSON::Serializable

        # A value that indicates whether the target version is applied to any source DB instances that have
        # AutoMinorVersionUpgrade set to true .

        @[JSON::Field(key: "AutoUpgrade")]
        getter auto_upgrade : Bool?

        # The version of the database engine that an instance can be upgraded to.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the upgrade target database engine.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version number of the upgrade target database engine.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # A value that indicates whether a database engine is upgraded to a major version.

        @[JSON::Field(key: "IsMajorVersionUpgrade")]
        getter is_major_version_upgrade : Bool?

        def initialize(
          @auto_upgrade : Bool? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @is_major_version_upgrade : Bool? = nil
        )
        end
      end

      # Used as a response element for queries on virtual private cloud (VPC) security group membership.

      struct VpcSecurityGroupMembership
        include JSON::Serializable

        # The status of the VPC security group.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The name of the VPC security group.

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
