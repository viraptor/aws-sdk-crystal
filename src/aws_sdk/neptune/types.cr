require "json"
require "time"

module AwsSdk
  module Neptune
    module Types


      struct AddRoleToDBClusterMessage
        include JSON::Serializable

        # The name of the DB cluster to associate the IAM role with.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The Amazon Resource Name (ARN) of the IAM role to associate with the Neptune DB cluster, for example
        # arn:aws:iam::123456789012:role/NeptuneAccessRole .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The name of the feature for the Neptune DB cluster that the IAM role is to be associated with. For
        # the list of supported feature names, see DBEngineVersion .

        @[JSON::Field(key: "FeatureName")]
        getter feature_name : String?

        def initialize(
          @db_cluster_identifier : String,
          @role_arn : String,
          @feature_name : String? = nil
        )
        end
      end


      struct AddSourceIdentifierToSubscriptionMessage
        include JSON::Serializable

        # The identifier of the event source to be added. Constraints: If the source type is a DB instance,
        # then a DBInstanceIdentifier must be supplied. If the source type is a DB security group, a
        # DBSecurityGroupName must be supplied. If the source type is a DB parameter group, a
        # DBParameterGroupName must be supplied. If the source type is a DB snapshot, a DBSnapshotIdentifier
        # must be supplied.

        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String

        # The name of the event notification subscription you want to add a source identifier to.

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


      struct AddTagsToResourceMessage
        include JSON::Serializable

        # The Amazon Neptune resource that the tags are added to. This value is an Amazon Resource Name (ARN).
        # For information about creating an ARN, see Constructing an Amazon Resource Name (ARN) .

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The tags to be assigned to the Amazon Neptune resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct ApplyPendingMaintenanceActionMessage
        include JSON::Serializable

        # The pending maintenance action to apply to this resource. Valid values: system-update , db-upgrade

        @[JSON::Field(key: "ApplyAction")]
        getter apply_action : String

        # A value that specifies the type of opt-in request, or undoes an opt-in request. An opt-in request of
        # type immediate can't be undone. Valid values: immediate - Apply the maintenance action immediately.
        # next-maintenance - Apply the maintenance action during the next maintenance window for the resource.
        # undo-opt-in - Cancel any existing next-maintenance opt-in requests.

        @[JSON::Field(key: "OptInType")]
        getter opt_in_type : String

        # The Amazon Resource Name (ARN) of the resource that the pending maintenance action applies to. For
        # information about creating an ARN, see Constructing an Amazon Resource Name (ARN) .

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

      # Specified CIDRIP or EC2 security group is not authorized for the specified DB security group.
      # Neptune may not also be authorized via IAM to perform necessary actions on your behalf.

      struct AuthorizationNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies an Availability Zone.

      struct AvailabilityZone
        include JSON::Serializable

        # The name of the availability zone.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # CertificateIdentifier does not refer to an existing certificate.

      struct CertificateNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies a character set.

      struct CharacterSet
        include JSON::Serializable

        # The description of the character set.

        @[JSON::Field(key: "CharacterSetDescription")]
        getter character_set_description : String?

        # The name of the character set.

        @[JSON::Field(key: "CharacterSetName")]
        getter character_set_name : String?

        def initialize(
          @character_set_description : String? = nil,
          @character_set_name : String? = nil
        )
        end
      end

      # The configuration setting for the log types to be enabled for export to CloudWatch Logs for a
      # specific DB instance or DB cluster. The EnableLogTypes and DisableLogTypes arrays determine which
      # logs will be exported (or not exported) to CloudWatch Logs. Valid log types are: audit (to publish
      # audit logs) and slowquery (to publish slow-query logs). See Publishing Neptune logs to Amazon
      # CloudWatch logs .

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

      # This data type is used as a response element in the ModifyDBCluster operation and contains changes
      # that will be applied during the next maintenance window.

      struct ClusterPendingModifiedValues
        include JSON::Serializable

        # The allocated storage size in gibibytes (GiB) for database engines. For Neptune, AllocatedStorage
        # always returns 1, because Neptune DB cluster storage size isn't fixed, but instead automatically
        # adjusts as needed.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # The number of days for which automatic DB snapshots are retained.

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # The DBClusterIdentifier value for the DB cluster.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The database engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # A value that indicates whether mapping of Amazon Web Services Identity and Access Management (IAM)
        # accounts to database accounts is enabled.

        @[JSON::Field(key: "IAMDatabaseAuthenticationEnabled")]
        getter iam_database_authentication_enabled : Bool?

        # The Provisioned IOPS (I/O operations per second) value. This setting is only for Multi-AZ DB
        # clusters.

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # This PendingCloudwatchLogsExports structure specifies pending changes to which CloudWatch logs are
        # enabled and which are disabled.

        @[JSON::Field(key: "PendingCloudwatchLogsExports")]
        getter pending_cloudwatch_logs_exports : Types::PendingCloudwatchLogsExports?

        # The pending change in storage type for the DB cluster. Valid Values: standard – ( the default )
        # Configures cost-effective database storage for applications with moderate to small I/O usage. iopt1
        # – Enables I/O-Optimized storage that's designed to meet the needs of I/O-intensive graph workloads
        # that require predictable pricing with low I/O latency and consistent I/O throughput. Neptune
        # I/O-Optimized storage is only available starting with engine release 1.3.0.0.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        def initialize(
          @allocated_storage : Int32? = nil,
          @backup_retention_period : Int32? = nil,
          @db_cluster_identifier : String? = nil,
          @engine_version : String? = nil,
          @iam_database_authentication_enabled : Bool? = nil,
          @iops : Int32? = nil,
          @pending_cloudwatch_logs_exports : Types::PendingCloudwatchLogsExports? = nil,
          @storage_type : String? = nil
        )
        end
      end


      struct CopyDBClusterParameterGroupMessage
        include JSON::Serializable

        # The identifier or Amazon Resource Name (ARN) for the source DB cluster parameter group. For
        # information about creating an ARN, see Constructing an Amazon Resource Name (ARN) . Constraints:
        # Must specify a valid DB cluster parameter group. If the source DB cluster parameter group is in the
        # same Amazon Region as the copy, specify a valid DB parameter group identifier, for example
        # my-db-cluster-param-group , or a valid ARN. If the source DB parameter group is in a different
        # Amazon Region than the copy, specify a valid DB cluster parameter group ARN, for example
        # arn:aws:rds:us-east-1:123456789012:cluster-pg:custom-cluster-group1 .

        @[JSON::Field(key: "SourceDBClusterParameterGroupIdentifier")]
        getter source_db_cluster_parameter_group_identifier : String

        # A description for the copied DB cluster parameter group.

        @[JSON::Field(key: "TargetDBClusterParameterGroupDescription")]
        getter target_db_cluster_parameter_group_description : String

        # The identifier for the copied DB cluster parameter group. Constraints: Cannot be null, empty, or
        # blank Must contain from 1 to 255 letters, numbers, or hyphens First character must be a letter
        # Cannot end with a hyphen or contain two consecutive hyphens Example: my-cluster-param-group1

        @[JSON::Field(key: "TargetDBClusterParameterGroupIdentifier")]
        getter target_db_cluster_parameter_group_identifier : String

        # The tags to be assigned to the copied DB cluster parameter group.

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


      struct CopyDBClusterSnapshotMessage
        include JSON::Serializable

        # The identifier of the DB cluster snapshot to copy. This parameter is not case-sensitive. If the
        # source DB cluster snapshot is in a different region or owned by another account, specify the
        # snapshot ARN. Constraints: Must specify a valid system snapshot in the "available" state. Specify a
        # valid DB snapshot identifier. Example: my-cluster-snapshot1

        @[JSON::Field(key: "SourceDBClusterSnapshotIdentifier")]
        getter source_db_cluster_snapshot_identifier : String

        # The identifier of the new DB cluster snapshot to create from the source DB cluster snapshot. This
        # parameter is not case-sensitive. Constraints: Must contain from 1 to 63 letters, numbers, or
        # hyphens. First character must be a letter. Cannot end with a hyphen or contain two consecutive
        # hyphens. Example: my-cluster-snapshot2

        @[JSON::Field(key: "TargetDBClusterSnapshotIdentifier")]
        getter target_db_cluster_snapshot_identifier : String

        # True to copy all tags from the source DB cluster snapshot to the target DB cluster snapshot, and
        # otherwise false. The default is false.

        @[JSON::Field(key: "CopyTags")]
        getter copy_tags : Bool?

        # The Amazon Amazon KMS key ID for an encrypted DB cluster snapshot. The KMS key ID is the Amazon
        # Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key. If you
        # copy an encrypted DB cluster snapshot from your Amazon account, you can specify a value for KmsKeyId
        # to encrypt the copy with a new KMS encryption key. If you don't specify a value for KmsKeyId , then
        # the copy of the DB cluster snapshot is encrypted with the same KMS key as the source DB cluster
        # snapshot. If you copy an encrypted DB cluster snapshot that is shared from another Amazon account,
        # then you must specify a value for KmsKeyId . KMS encryption keys are specific to the Amazon Region
        # that they are created in, and you can't use encryption keys from one Amazon Region in another Amazon
        # Region. You cannot encrypt an unencrypted DB cluster snapshot when you copy it. If you try to copy
        # an unencrypted DB cluster snapshot and specify a value for the KmsKeyId parameter, an error is
        # returned.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Not currently supported.

        @[JSON::Field(key: "PreSignedUrl")]
        getter pre_signed_url : String?

        # The tags to assign to the new DB cluster snapshot copy.

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


      struct CopyDBParameterGroupMessage
        include JSON::Serializable

        # The identifier or ARN for the source DB parameter group. For information about creating an ARN, see
        # Constructing an Amazon Resource Name (ARN) . Constraints: Must specify a valid DB parameter group.
        # Must specify a valid DB parameter group identifier, for example my-db-param-group , or a valid ARN.

        @[JSON::Field(key: "SourceDBParameterGroupIdentifier")]
        getter source_db_parameter_group_identifier : String

        # A description for the copied DB parameter group.

        @[JSON::Field(key: "TargetDBParameterGroupDescription")]
        getter target_db_parameter_group_description : String

        # The identifier for the copied DB parameter group. Constraints: Cannot be null, empty, or blank. Must
        # contain from 1 to 255 letters, numbers, or hyphens. First character must be a letter. Cannot end
        # with a hyphen or contain two consecutive hyphens. Example: my-db-parameter-group

        @[JSON::Field(key: "TargetDBParameterGroupIdentifier")]
        getter target_db_parameter_group_identifier : String

        # The tags to be assigned to the copied DB parameter group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @source_db_parameter_group_identifier : String,
          @target_db_parameter_group_description : String,
          @target_db_parameter_group_identifier : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CopyDBParameterGroupResult
        include JSON::Serializable


        @[JSON::Field(key: "DBParameterGroup")]
        getter db_parameter_group : Types::DBParameterGroup?

        def initialize(
          @db_parameter_group : Types::DBParameterGroup? = nil
        )
        end
      end


      struct CreateDBClusterEndpointMessage
        include JSON::Serializable

        # The identifier to use for the new endpoint. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterEndpointIdentifier")]
        getter db_cluster_endpoint_identifier : String

        # The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored
        # as a lowercase string.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The type of the endpoint. One of: READER , WRITER , ANY .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String

        # List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible
        # instances are reachable through the custom endpoint. Only relevant if the list of static members is
        # empty.

        @[JSON::Field(key: "ExcludedMembers")]
        getter excluded_members : Array(String)?

        # List of DB instance identifiers that are part of the custom endpoint group.

        @[JSON::Field(key: "StaticMembers")]
        getter static_members : Array(String)?

        # The tags to be assigned to the Amazon Neptune resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @db_cluster_endpoint_identifier : String,
          @db_cluster_identifier : String,
          @endpoint_type : String,
          @excluded_members : Array(String)? = nil,
          @static_members : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # This data type represents the information you need to connect to an Amazon Neptune DB cluster. This
      # data type is used as a response element in the following actions: CreateDBClusterEndpoint
      # DescribeDBClusterEndpoints ModifyDBClusterEndpoint DeleteDBClusterEndpoint For the data structure
      # that represents Amazon Neptune DB instance endpoints, see Endpoint .

      struct CreateDBClusterEndpointOutput
        include JSON::Serializable

        # The type associated with a custom endpoint. One of: READER , WRITER , ANY .

        @[JSON::Field(key: "CustomEndpointType")]
        getter custom_endpoint_type : String?

        # The Amazon Resource Name (ARN) for the endpoint.

        @[JSON::Field(key: "DBClusterEndpointArn")]
        getter db_cluster_endpoint_arn : String?

        # The identifier associated with the endpoint. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterEndpointIdentifier")]
        getter db_cluster_endpoint_identifier : String?

        # A unique system-generated identifier for an endpoint. It remains the same for the whole life of the
        # endpoint.

        @[JSON::Field(key: "DBClusterEndpointResourceIdentifier")]
        getter db_cluster_endpoint_resource_identifier : String?

        # The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored
        # as a lowercase string.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The DNS address of the endpoint.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The type of the endpoint. One of: READER , WRITER , CUSTOM .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible
        # instances are reachable through the custom endpoint. Only relevant if the list of static members is
        # empty.

        @[JSON::Field(key: "ExcludedMembers")]
        getter excluded_members : Array(String)?

        # List of DB instance identifiers that are part of the custom endpoint group.

        @[JSON::Field(key: "StaticMembers")]
        getter static_members : Array(String)?

        # The current status of the endpoint. One of: creating , available , deleting , inactive , modifying .
        # The inactive state applies to an endpoint that cannot be used for a certain kind of cluster, such as
        # a writer endpoint for a read-only secondary cluster in a global database.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @custom_endpoint_type : String? = nil,
          @db_cluster_endpoint_arn : String? = nil,
          @db_cluster_endpoint_identifier : String? = nil,
          @db_cluster_endpoint_resource_identifier : String? = nil,
          @db_cluster_identifier : String? = nil,
          @endpoint : String? = nil,
          @endpoint_type : String? = nil,
          @excluded_members : Array(String)? = nil,
          @static_members : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end


      struct CreateDBClusterMessage
        include JSON::Serializable

        # The DB cluster identifier. This parameter is stored as a lowercase string. Constraints: Must contain
        # from 1 to 63 letters, numbers, or hyphens. First character must be a letter. Cannot end with a
        # hyphen or contain two consecutive hyphens. Example: my-cluster1

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The name of the database engine to be used for this DB cluster. Valid Values: neptune

        @[JSON::Field(key: "Engine")]
        getter engine : String

        # A list of EC2 Availability Zones that instances in the DB cluster can be created in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The number of days for which automated backups are retained. You must specify a minimum value of 1.
        # Default: 1 Constraints: Must be a value from 1 to 35

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # (Not supported by Neptune)

        @[JSON::Field(key: "CharacterSetName")]
        getter character_set_name : String?

        # If set to true , tags are copied to any snapshot of the DB cluster that is created.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # The name of the DB cluster parameter group to associate with this DB cluster. If this argument is
        # omitted, the default is used. Constraints: If supplied, must match the name of an existing
        # DBClusterParameterGroup.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # A DB subnet group to associate with this DB cluster. Constraints: Must match the name of an existing
        # DBSubnetGroup. Must not be default. Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # The name for your database of up to 64 alpha-numeric characters. If you do not provide a name,
        # Amazon Neptune will not create a database in the DB cluster you are creating.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # A value that indicates whether the DB cluster has deletion protection enabled. The database can't be
        # deleted when deletion protection is enabled. By default, deletion protection is enabled.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # A list of the log types that this DB cluster should export to CloudWatch Logs. Valid log types are:
        # audit (to publish audit logs) and slowquery (to publish slow-query logs). See Publishing Neptune
        # logs to Amazon CloudWatch logs .

        @[JSON::Field(key: "EnableCloudwatchLogsExports")]
        getter enable_cloudwatch_logs_exports : Array(String)?

        # If set to true , enables Amazon Identity and Access Management (IAM) authentication for the entire
        # DB cluster (this cannot be set at an instance level). Default: false .

        @[JSON::Field(key: "EnableIAMDatabaseAuthentication")]
        getter enable_iam_database_authentication : Bool?

        # The version number of the database engine to use for the new DB cluster. Example: 1.2.1.0

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The ID of the Neptune global database to which this new DB cluster should be added.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String?

        # The Amazon KMS key identifier for an encrypted DB cluster. The KMS key identifier is the Amazon
        # Resource Name (ARN) for the KMS encryption key. If you are creating a DB cluster with the same
        # Amazon account that owns the KMS encryption key used to encrypt the new DB cluster, then you can use
        # the KMS key alias instead of the ARN for the KMS encryption key. If an encryption key is not
        # specified in KmsKeyId : If ReplicationSourceIdentifier identifies an encrypted source, then Amazon
        # Neptune will use the encryption key used to encrypt the source. Otherwise, Amazon Neptune will use
        # your default encryption key. If the StorageEncrypted parameter is true and
        # ReplicationSourceIdentifier is not specified, then Amazon Neptune will use your default encryption
        # key. Amazon KMS creates the default encryption key for your Amazon account. Your Amazon account has
        # a different default encryption key for each Amazon Region. If you create a Read Replica of an
        # encrypted DB cluster in another Amazon Region, you must set KmsKeyId to a KMS key ID that is valid
        # in the destination Amazon Region. This key is used to encrypt the Read Replica in that Amazon
        # Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # (Not supported by Neptune)

        @[JSON::Field(key: "OptionGroupName")]
        getter option_group_name : String?

        # The port number on which the instances in the DB cluster accept connections. Default: 8182

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # This parameter is not currently supported.

        @[JSON::Field(key: "PreSignedUrl")]
        getter pre_signed_url : String?

        # The daily time range during which automated backups are created if automated backups are enabled
        # using the BackupRetentionPeriod parameter. The default is a 30-minute window selected at random from
        # an 8-hour block of time for each Amazon Region. To see the time blocks available, see Neptune
        # Maintenance Window in the Amazon Neptune User Guide. Constraints: Must be in the format
        # hh24:mi-hh24:mi . Must be in Universal Coordinated Time (UTC). Must not conflict with the preferred
        # maintenance window. Must be at least 30 minutes.

        @[JSON::Field(key: "PreferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format: ddd:hh24:mi-ddd:hh24:mi The default is a 30-minute window selected at random from an
        # 8-hour block of time for each Amazon Region, occurring on a random day of the week. To see the time
        # blocks available, see Neptune Maintenance Window in the Amazon Neptune User Guide. Valid Days: Mon,
        # Tue, Wed, Thu, Fri, Sat, Sun. Constraints: Minimum 30-minute window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # The Amazon Resource Name (ARN) of the source DB instance or DB cluster if this DB cluster is created
        # as a Read Replica.

        @[JSON::Field(key: "ReplicationSourceIdentifier")]
        getter replication_source_identifier : String?

        # Contains the scaling configuration of a Neptune Serverless DB cluster. For more information, see
        # Using Amazon Neptune Serverless in the Amazon Neptune User Guide .

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration?

        # Specifies whether the DB cluster is encrypted.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # The storage type for the new DB cluster. Valid Values: standard – ( the default ) Configures
        # cost-effective database storage for applications with moderate to small I/O usage. When set to
        # standard , the storage type is not returned in the response. iopt1 – Enables I/O-Optimized storage
        # that's designed to meet the needs of I/O-intensive graph workloads that require predictable pricing
        # with low I/O latency and consistent I/O throughput. Neptune I/O-Optimized storage is only available
        # starting with engine release 1.3.0.0.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The tags to assign to the new DB cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A list of EC2 VPC security groups to associate with this DB cluster.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_cluster_identifier : String,
          @engine : String,
          @availability_zones : Array(String)? = nil,
          @backup_retention_period : Int32? = nil,
          @character_set_name : String? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @db_cluster_parameter_group_name : String? = nil,
          @db_subnet_group_name : String? = nil,
          @database_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @enable_cloudwatch_logs_exports : Array(String)? = nil,
          @enable_iam_database_authentication : Bool? = nil,
          @engine_version : String? = nil,
          @global_cluster_identifier : String? = nil,
          @kms_key_id : String? = nil,
          @master_user_password : String? = nil,
          @master_username : String? = nil,
          @option_group_name : String? = nil,
          @port : Int32? = nil,
          @pre_signed_url : String? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @replication_source_identifier : String? = nil,
          @serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
          @storage_encrypted : Bool? = nil,
          @storage_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct CreateDBClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the DB cluster parameter group. Constraints: Must match the name of an existing
        # DBClusterParameterGroup. This value is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String

        # The DB cluster parameter group family name. A DB cluster parameter group can be associated with one
        # and only one DB cluster parameter group family, and can be applied only to a DB cluster running a
        # database engine and engine version compatible with that DB cluster parameter group family.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String

        # The description for the DB cluster parameter group.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The tags to be assigned to the new DB cluster parameter group.

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


      struct CreateDBClusterSnapshotMessage
        include JSON::Serializable

        # The identifier of the DB cluster to create a snapshot for. This parameter is not case-sensitive.
        # Constraints: Must match the identifier of an existing DBCluster. Example: my-cluster1

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The identifier of the DB cluster snapshot. This parameter is stored as a lowercase string.
        # Constraints: Must contain from 1 to 63 letters, numbers, or hyphens. First character must be a
        # letter. Cannot end with a hyphen or contain two consecutive hyphens. Example: my-cluster1-snapshot1

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String

        # The tags to be assigned to the DB cluster snapshot.

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


      struct CreateDBInstanceMessage
        include JSON::Serializable

        # The identifier of the DB cluster that the instance will belong to. For information on creating a DB
        # cluster, see CreateDBCluster . Type: String

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The compute and memory capacity of the DB instance, for example, db.m4.large . Not all DB instance
        # classes are available in all Amazon Regions.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String

        # The DB instance identifier. This parameter is stored as a lowercase string. Constraints: Must
        # contain from 1 to 63 letters, numbers, or hyphens. First character must be a letter. Cannot end with
        # a hyphen or contain two consecutive hyphens. Example: mydbinstance

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String

        # The name of the database engine to be used for this instance. Valid Values: neptune

        @[JSON::Field(key: "Engine")]
        getter engine : String

        # Not supported by Neptune.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # Indicates that minor engine upgrades are applied automatically to the DB instance during the
        # maintenance window. Default: true

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # The EC2 Availability Zone that the DB instance is created in Default: A random, system-chosen
        # Availability Zone in the endpoint's Amazon Region. Example: us-east-1d Constraint: The
        # AvailabilityZone parameter can't be specified if the MultiAZ parameter is set to true . The
        # specified Availability Zone must be in the same Amazon Region as the current endpoint.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The number of days for which automated backups are retained. Not applicable. The retention period
        # for automated backups is managed by the DB cluster. For more information, see CreateDBCluster .
        # Default: 1 Constraints: Must be a value from 0 to 35 Cannot be set to 0 if the DB instance is a
        # source to Read Replicas

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # (Not supported by Neptune)

        @[JSON::Field(key: "CharacterSetName")]
        getter character_set_name : String?

        # True to copy all tags from the DB instance to snapshots of the DB instance, and otherwise false. The
        # default is false.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # Not supported.

        @[JSON::Field(key: "DBName")]
        getter db_name : String?

        # The name of the DB parameter group to associate with this DB instance. If this argument is omitted,
        # the default DBParameterGroup for the specified engine is used. Constraints: Must be 1 to 255
        # letters, numbers, or hyphens. First character must be a letter Cannot end with a hyphen or contain
        # two consecutive hyphens

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String?

        # A list of DB security groups to associate with this DB instance. Default: The default DB security
        # group for the database engine.

        @[JSON::Field(key: "DBSecurityGroups")]
        getter db_security_groups : Array(String)?

        # A DB subnet group to associate with this DB instance. If there is no DB subnet group, then it is a
        # non-VPC DB instance.

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # A value that indicates whether the DB instance has deletion protection enabled. The database can't
        # be deleted when deletion protection is enabled. By default, deletion protection is disabled. See
        # Deleting a DB Instance . DB instances in a DB cluster can be deleted even when deletion protection
        # is enabled in their parent DB cluster.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # Specify the Active Directory Domain to create the instance in.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # Specify the name of the IAM role to be used when making API calls to the Directory Service.

        @[JSON::Field(key: "DomainIAMRoleName")]
        getter domain_iam_role_name : String?

        # The list of log types that need to be enabled for exporting to CloudWatch Logs.

        @[JSON::Field(key: "EnableCloudwatchLogsExports")]
        getter enable_cloudwatch_logs_exports : Array(String)?

        # Not supported by Neptune (ignored).

        @[JSON::Field(key: "EnableIAMDatabaseAuthentication")]
        getter enable_iam_database_authentication : Bool?

        # (Not supported by Neptune)

        @[JSON::Field(key: "EnablePerformanceInsights")]
        getter enable_performance_insights : Bool?

        # The version number of the database engine to use. Currently, setting this parameter has no effect.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for
        # the DB instance.

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # The Amazon KMS key identifier for an encrypted DB instance. The KMS key identifier is the Amazon
        # Resource Name (ARN) for the KMS encryption key. If you are creating a DB instance with the same
        # Amazon account that owns the KMS encryption key used to encrypt the new DB instance, then you can
        # use the KMS key alias instead of the ARN for the KM encryption key. Not applicable. The KMS key
        # identifier is managed by the DB cluster. For more information, see CreateDBCluster . If the
        # StorageEncrypted parameter is true, and you do not specify a value for the KmsKeyId parameter, then
        # Amazon Neptune will use your default encryption key. Amazon KMS creates the default encryption key
        # for your Amazon account. Your Amazon account has a different default encryption key for each Amazon
        # Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # License model information for this DB instance. Valid values: license-included |
        # bring-your-own-license | general-public-license

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB
        # instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. If
        # MonitoringRoleArn is specified, then you must also set MonitoringInterval to a value other than 0.
        # Valid Values: 0, 1, 5, 10, 15, 30, 60

        @[JSON::Field(key: "MonitoringInterval")]
        getter monitoring_interval : Int32?

        # The ARN for the IAM role that permits Neptune to send enhanced monitoring metrics to Amazon
        # CloudWatch Logs. For example, arn:aws:iam:123456789012:role/emaccess . If MonitoringInterval is set
        # to a value other than 0, then you must supply a MonitoringRoleArn value.

        @[JSON::Field(key: "MonitoringRoleArn")]
        getter monitoring_role_arn : String?

        # Specifies if the DB instance is a Multi-AZ deployment. You can't set the AvailabilityZone parameter
        # if the MultiAZ parameter is set to true.

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # (Not supported by Neptune)

        @[JSON::Field(key: "OptionGroupName")]
        getter option_group_name : String?

        # (Not supported by Neptune)

        @[JSON::Field(key: "PerformanceInsightsKMSKeyId")]
        getter performance_insights_kms_key_id : String?

        # The port number on which the database accepts connections. Not applicable. The port is managed by
        # the DB cluster. For more information, see CreateDBCluster . Default: 8182 Type: Integer

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The daily time range during which automated backups are created. Not applicable. The daily time
        # range for creating automated backups is managed by the DB cluster. For more information, see
        # CreateDBCluster .

        @[JSON::Field(key: "PreferredBackupWindow")]
        getter preferred_backup_window : String?

        # The time range each week during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format: ddd:hh24:mi-ddd:hh24:mi The default is a 30-minute window selected at random from an
        # 8-hour block of time for each Amazon Region, occurring on a random day of the week. Valid Days: Mon,
        # Tue, Wed, Thu, Fri, Sat, Sun. Constraints: Minimum 30-minute window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # A value that specifies the order in which an Read Replica is promoted to the primary instance after
        # a failure of the existing primary instance. Default: 1 Valid Values: 0 - 15

        @[JSON::Field(key: "PromotionTier")]
        getter promotion_tier : Int32?

        # Indicates whether the DB instance is publicly accessible. When the DB instance is publicly
        # accessible and you connect from outside of the DB instance's virtual private cloud (VPC), its Domain
        # Name System (DNS) endpoint resolves to the public IP address. When you connect from within the same
        # VPC as the DB instance, the endpoint resolves to the private IP address. Access to the DB instance
        # is ultimately controlled by the security group it uses. That public access isn't permitted if the
        # security group assigned to the DB cluster doesn't permit it. When the DB instance isn't publicly
        # accessible, it is an internal DB instance with a DNS name that resolves to a private IP address.

        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # Specifies whether the DB instance is encrypted. Not applicable. The encryption for DB instances is
        # managed by the DB cluster. For more information, see CreateDBCluster . Default: false

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # Not applicable. In Neptune the storage type is managed at the DB Cluster level.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The tags to assign to the new instance.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The ARN from the key store with which to associate the instance for TDE encryption.

        @[JSON::Field(key: "TdeCredentialArn")]
        getter tde_credential_arn : String?

        # The password for the given ARN from the key store in order to access the device.

        @[JSON::Field(key: "TdeCredentialPassword")]
        getter tde_credential_password : String?

        # The time zone of the DB instance.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        # A list of EC2 VPC security groups to associate with this DB instance. Not applicable. The associated
        # list of EC2 VPC security groups is managed by the DB cluster. For more information, see
        # CreateDBCluster . Default: The default EC2 VPC security group for the DB subnet group's VPC.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_cluster_identifier : String,
          @db_instance_class : String,
          @db_instance_identifier : String,
          @engine : String,
          @allocated_storage : Int32? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @availability_zone : String? = nil,
          @backup_retention_period : Int32? = nil,
          @character_set_name : String? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @db_name : String? = nil,
          @db_parameter_group_name : String? = nil,
          @db_security_groups : Array(String)? = nil,
          @db_subnet_group_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @domain : String? = nil,
          @domain_iam_role_name : String? = nil,
          @enable_cloudwatch_logs_exports : Array(String)? = nil,
          @enable_iam_database_authentication : Bool? = nil,
          @enable_performance_insights : Bool? = nil,
          @engine_version : String? = nil,
          @iops : Int32? = nil,
          @kms_key_id : String? = nil,
          @license_model : String? = nil,
          @master_user_password : String? = nil,
          @master_username : String? = nil,
          @monitoring_interval : Int32? = nil,
          @monitoring_role_arn : String? = nil,
          @multi_az : Bool? = nil,
          @option_group_name : String? = nil,
          @performance_insights_kms_key_id : String? = nil,
          @port : Int32? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @promotion_tier : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @storage_encrypted : Bool? = nil,
          @storage_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tde_credential_arn : String? = nil,
          @tde_credential_password : String? = nil,
          @timezone : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
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


      struct CreateDBParameterGroupMessage
        include JSON::Serializable

        # The DB parameter group family name. A DB parameter group can be associated with one and only one DB
        # parameter group family, and can be applied only to a DB instance running a database engine and
        # engine version compatible with that DB parameter group family.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String

        # The name of the DB parameter group. Constraints: Must be 1 to 255 letters, numbers, or hyphens.
        # First character must be a letter Cannot end with a hyphen or contain two consecutive hyphens This
        # value is stored as a lowercase string.

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String

        # The description for the DB parameter group.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The tags to be assigned to the new DB parameter group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @db_parameter_group_family : String,
          @db_parameter_group_name : String,
          @description : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDBParameterGroupResult
        include JSON::Serializable


        @[JSON::Field(key: "DBParameterGroup")]
        getter db_parameter_group : Types::DBParameterGroup?

        def initialize(
          @db_parameter_group : Types::DBParameterGroup? = nil
        )
        end
      end


      struct CreateDBSubnetGroupMessage
        include JSON::Serializable

        # The description for the DB subnet group.

        @[JSON::Field(key: "DBSubnetGroupDescription")]
        getter db_subnet_group_description : String

        # The name for the DB subnet group. This value is stored as a lowercase string. Constraints: Must
        # contain no more than 255 letters, numbers, periods, underscores, spaces, or hyphens. Must not be
        # default. Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String

        # The EC2 Subnet IDs for the DB subnet group.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The tags to be assigned to the new DB subnet group.

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


      struct CreateEventSubscriptionMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN is created
        # by Amazon SNS when you create a topic and subscribe to it.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String

        # The name of the subscription. Constraints: The name must be less than 255 characters.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        # A Boolean value; set to true to activate the subscription, set to false to create the subscription
        # but not active it.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A list of event categories for a SourceType that you want to subscribe to. You can see a list of the
        # categories for a given SourceType by using the DescribeEventCategories action.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The list of identifiers of the event sources for which events are returned. If not specified, then
        # all sources are included in the response. An identifier must begin with a letter and must contain
        # only ASCII letters, digits, and hyphens; it can't end with a hyphen or contain two consecutive
        # hyphens. Constraints: If SourceIds are supplied, SourceType must also be provided. If the source
        # type is a DB instance, then a DBInstanceIdentifier must be supplied. If the source type is a DB
        # security group, a DBSecurityGroupName must be supplied. If the source type is a DB parameter group,
        # a DBParameterGroupName must be supplied. If the source type is a DB snapshot, a DBSnapshotIdentifier
        # must be supplied.

        @[JSON::Field(key: "SourceIds")]
        getter source_ids : Array(String)?

        # The type of source that is generating the events. For example, if you want to be notified of events
        # generated by a DB instance, you would set this parameter to db-instance. if this value is not
        # specified, all events are returned. Valid values: db-instance | db-cluster | db-parameter-group |
        # db-security-group | db-snapshot | db-cluster-snapshot

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The tags to be applied to the new event subscription.

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


      struct CreateGlobalClusterMessage
        include JSON::Serializable

        # The cluster identifier of the new global database cluster.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        # The deletion protection setting for the new global database. The global database can't be deleted
        # when deletion protection is enabled.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The name of the database engine to be used in the global database. Valid values: neptune

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The Neptune engine version to be used by the global database. Valid values: 1.2.0.0 or above.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # ( Optional ) The Amazon Resource Name (ARN) of an existing Neptune DB cluster to use as the primary
        # cluster of the new global database.

        @[JSON::Field(key: "SourceDBClusterIdentifier")]
        getter source_db_cluster_identifier : String?

        # The storage encryption setting for the new global database cluster.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        def initialize(
          @global_cluster_identifier : String,
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

      # Contains the details of an Amazon Neptune DB cluster. This data type is used as a response element
      # in the DescribeDBClusters .

      struct DBCluster
        include JSON::Serializable

        # AllocatedStorage always returns 1, because Neptune DB cluster storage size is not fixed, but instead
        # automatically adjusts as needed.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # Provides a list of the Amazon Identity and Access Management (IAM) roles that are associated with
        # the DB cluster. IAM roles that are associated with a DB cluster grant permission for the DB cluster
        # to access other Amazon services on your behalf.

        @[JSON::Field(key: "AssociatedRoles")]
        getter associated_roles : Array(Types::DBClusterRole)?

        # Time at which the DB cluster will be automatically restarted.

        @[JSON::Field(key: "AutomaticRestartTime")]
        getter automatic_restart_time : Time?

        # Provides the list of EC2 Availability Zones that instances in the DB cluster can be created in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Specifies the number of days for which automatic DB snapshots are retained.

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # Not supported by Neptune.

        @[JSON::Field(key: "CharacterSetName")]
        getter character_set_name : String?

        # Identifies the clone group to which the DB cluster is associated.

        @[JSON::Field(key: "CloneGroupId")]
        getter clone_group_id : String?

        # Specifies the time when the DB cluster was created, in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "ClusterCreateTime")]
        getter cluster_create_time : Time?

        # If set to true , tags are copied to any snapshot of the DB cluster that is created.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # If set to true , the DB cluster can be cloned across accounts.

        @[JSON::Field(key: "CrossAccountClone")]
        getter cross_account_clone : Bool?

        # The Amazon Resource Name (ARN) for the DB cluster.

        @[JSON::Field(key: "DBClusterArn")]
        getter db_cluster_arn : String?

        # Contains a user-supplied DB cluster identifier. This identifier is the unique key that identifies a
        # DB cluster.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # Provides the list of instances that make up the DB cluster.

        @[JSON::Field(key: "DBClusterMembers")]
        getter db_cluster_members : Array(Types::DBClusterMember)?

        # Not supported by Neptune.

        @[JSON::Field(key: "DBClusterOptionGroupMemberships")]
        getter db_cluster_option_group_memberships : Array(Types::DBClusterOptionGroupStatus)?

        # Specifies the name of the DB cluster parameter group for the DB cluster.

        @[JSON::Field(key: "DBClusterParameterGroup")]
        getter db_cluster_parameter_group : String?

        # Specifies information on the subnet group associated with the DB cluster, including the name,
        # description, and subnets in the subnet group.

        @[JSON::Field(key: "DBSubnetGroup")]
        getter db_subnet_group : String?

        # Contains the name of the initial database of this DB cluster that was provided at create time, if
        # one was specified when the DB cluster was created. This same name is returned for the life of the DB
        # cluster.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The Amazon Region-unique, immutable identifier for the DB cluster. This identifier is found in
        # Amazon CloudTrail log entries whenever the Amazon KMS key for the DB cluster is accessed.

        @[JSON::Field(key: "DbClusterResourceId")]
        getter db_cluster_resource_id : String?

        # Indicates whether or not the DB cluster has deletion protection enabled. The database can't be
        # deleted when deletion protection is enabled.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # Specifies the earliest time to which a database can be restored with point-in-time restore.

        @[JSON::Field(key: "EarliestRestorableTime")]
        getter earliest_restorable_time : Time?

        # A list of the log types that this DB cluster is configured to export to CloudWatch Logs. Valid log
        # types are: audit (to publish audit logs to CloudWatch) and slowquery (to publish slow-query logs to
        # CloudWatch). See Publishing Neptune logs to Amazon CloudWatch logs .

        @[JSON::Field(key: "EnabledCloudwatchLogsExports")]
        getter enabled_cloudwatch_logs_exports : Array(String)?

        # Specifies the connection endpoint for the primary instance of the DB cluster.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # Provides the name of the database engine to be used for this DB cluster.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Indicates the database engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Contains a user-supplied global database cluster identifier. This identifier is the unique key that
        # identifies a global database.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String?

        # Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String?

        # True if mapping of Amazon Identity and Access Management (IAM) accounts to database accounts is
        # enabled, and otherwise false.

        @[JSON::Field(key: "IAMDatabaseAuthenticationEnabled")]
        getter iam_database_authentication_enabled : Bool?

        # The next time you can modify the DB cluster to use the iopt1 storage type.

        @[JSON::Field(key: "IOOptimizedNextAllowedModificationTime")]
        getter io_optimized_next_allowed_modification_time : Time?

        # If StorageEncrypted is true, the Amazon KMS key identifier for the encrypted DB cluster.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the latest time to which a database can be restored with point-in-time restore.

        @[JSON::Field(key: "LatestRestorableTime")]
        getter latest_restorable_time : Time?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # Specifies whether the DB cluster has instances in multiple Availability Zones.

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # This data type is used as a response element in the ModifyDBCluster operation and contains changes
        # that will be applied during the next maintenance window.

        @[JSON::Field(key: "PendingModifiedValues")]
        getter pending_modified_values : Types::ClusterPendingModifiedValues?

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

        # Contains one or more identifiers of the Read Replicas associated with this DB cluster.

        @[JSON::Field(key: "ReadReplicaIdentifiers")]
        getter read_replica_identifiers : Array(String)?

        # The reader endpoint for the DB cluster. The reader endpoint for a DB cluster load-balances
        # connections across the Read Replicas that are available in a DB cluster. As clients request new
        # connections to the reader endpoint, Neptune distributes the connection requests among the Read
        # Replicas in the DB cluster. This functionality can help balance your read workload across multiple
        # Read Replicas in your DB cluster. If a failover occurs, and the Read Replica that you are connected
        # to is promoted to be the primary instance, your connection is dropped. To continue sending your read
        # workload to other Read Replicas in the cluster, you can then reconnect to the reader endpoint.

        @[JSON::Field(key: "ReaderEndpoint")]
        getter reader_endpoint : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "ReplicationSourceIdentifier")]
        getter replication_source_identifier : String?

        # Shows the scaling configuration for a Neptune Serverless DB cluster. For more information, see Using
        # Amazon Neptune Serverless in the Amazon Neptune User Guide .

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfigurationInfo?

        # Specifies the current state of this DB cluster.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Specifies whether the DB cluster is encrypted.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # The storage type used by the DB cluster. Valid Values: standard – ( the default ) Provides
        # cost-effective database storage for applications with moderate to small I/O usage. iopt1 – Enables
        # I/O-Optimized storage that's designed to meet the needs of I/O-intensive graph workloads that
        # require predictable pricing with low I/O latency and consistent I/O throughput. Neptune
        # I/O-Optimized storage is only available starting with engine release 1.3.0.0.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # Provides a list of VPC security groups that the DB cluster belongs to.

        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(Types::VpcSecurityGroupMembership)?

        def initialize(
          @allocated_storage : Int32? = nil,
          @associated_roles : Array(Types::DBClusterRole)? = nil,
          @automatic_restart_time : Time? = nil,
          @availability_zones : Array(String)? = nil,
          @backup_retention_period : Int32? = nil,
          @character_set_name : String? = nil,
          @clone_group_id : String? = nil,
          @cluster_create_time : Time? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @cross_account_clone : Bool? = nil,
          @db_cluster_arn : String? = nil,
          @db_cluster_identifier : String? = nil,
          @db_cluster_members : Array(Types::DBClusterMember)? = nil,
          @db_cluster_option_group_memberships : Array(Types::DBClusterOptionGroupStatus)? = nil,
          @db_cluster_parameter_group : String? = nil,
          @db_subnet_group : String? = nil,
          @database_name : String? = nil,
          @db_cluster_resource_id : String? = nil,
          @deletion_protection : Bool? = nil,
          @earliest_restorable_time : Time? = nil,
          @enabled_cloudwatch_logs_exports : Array(String)? = nil,
          @endpoint : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @global_cluster_identifier : String? = nil,
          @hosted_zone_id : String? = nil,
          @iam_database_authentication_enabled : Bool? = nil,
          @io_optimized_next_allowed_modification_time : Time? = nil,
          @kms_key_id : String? = nil,
          @latest_restorable_time : Time? = nil,
          @master_username : String? = nil,
          @multi_az : Bool? = nil,
          @pending_modified_values : Types::ClusterPendingModifiedValues? = nil,
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

      # User already has a DB cluster with the given identifier.

      struct DBClusterAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # This data type represents the information you need to connect to an Amazon Neptune DB cluster. This
      # data type is used as a response element in the following actions: CreateDBClusterEndpoint
      # DescribeDBClusterEndpoints ModifyDBClusterEndpoint DeleteDBClusterEndpoint For the data structure
      # that represents Amazon Neptune DB instance endpoints, see Endpoint .

      struct DBClusterEndpoint
        include JSON::Serializable

        # The type associated with a custom endpoint. One of: READER , WRITER , ANY .

        @[JSON::Field(key: "CustomEndpointType")]
        getter custom_endpoint_type : String?

        # The Amazon Resource Name (ARN) for the endpoint.

        @[JSON::Field(key: "DBClusterEndpointArn")]
        getter db_cluster_endpoint_arn : String?

        # The identifier associated with the endpoint. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterEndpointIdentifier")]
        getter db_cluster_endpoint_identifier : String?

        # A unique system-generated identifier for an endpoint. It remains the same for the whole life of the
        # endpoint.

        @[JSON::Field(key: "DBClusterEndpointResourceIdentifier")]
        getter db_cluster_endpoint_resource_identifier : String?

        # The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored
        # as a lowercase string.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The DNS address of the endpoint.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The type of the endpoint. One of: READER , WRITER , CUSTOM .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible
        # instances are reachable through the custom endpoint. Only relevant if the list of static members is
        # empty.

        @[JSON::Field(key: "ExcludedMembers")]
        getter excluded_members : Array(String)?

        # List of DB instance identifiers that are part of the custom endpoint group.

        @[JSON::Field(key: "StaticMembers")]
        getter static_members : Array(String)?

        # The current status of the endpoint. One of: creating , available , deleting , inactive , modifying .
        # The inactive state applies to an endpoint that cannot be used for a certain kind of cluster, such as
        # a writer endpoint for a read-only secondary cluster in a global database.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @custom_endpoint_type : String? = nil,
          @db_cluster_endpoint_arn : String? = nil,
          @db_cluster_endpoint_identifier : String? = nil,
          @db_cluster_endpoint_resource_identifier : String? = nil,
          @db_cluster_identifier : String? = nil,
          @endpoint : String? = nil,
          @endpoint_type : String? = nil,
          @excluded_members : Array(String)? = nil,
          @static_members : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # The specified custom endpoint cannot be created because it already exists.

      struct DBClusterEndpointAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end


      struct DBClusterEndpointMessage
        include JSON::Serializable

        # Contains the details of the endpoints associated with the cluster and matching any filter
        # conditions.

        @[JSON::Field(key: "DBClusterEndpoints")]
        getter db_cluster_endpoints : Array(Types::DBClusterEndpoint)?

        # n optional pagination token provided by a previous DescribeDBClusterEndpoints request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_cluster_endpoints : Array(Types::DBClusterEndpoint)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The specified custom endpoint doesn't exist.

      struct DBClusterEndpointNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster already has the maximum number of custom endpoints.

      struct DBClusterEndpointQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about an instance that is part of a DB cluster.

      struct DBClusterMember
        include JSON::Serializable

        # Specifies the status of the DB cluster parameter group for this member of the DB cluster.

        @[JSON::Field(key: "DBClusterParameterGroupStatus")]
        getter db_cluster_parameter_group_status : String?

        # Specifies the instance identifier for this member of the DB cluster.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String?

        # Value that is true if the cluster member is the primary instance for the DB cluster and false
        # otherwise.

        @[JSON::Field(key: "IsClusterWriter")]
        getter is_cluster_writer : Bool?

        # A value that specifies the order in which a Read Replica is promoted to the primary instance after a
        # failure of the existing primary instance.

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


      struct DBClusterMessage
        include JSON::Serializable

        # Contains a list of DB clusters for the user.

        @[JSON::Field(key: "DBClusters")]
        getter db_clusters : Array(Types::DBCluster)?

        # A pagination token that can be used in a subsequent DescribeDBClusters request.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_clusters : Array(Types::DBCluster)? = nil,
          @marker : String? = nil
        )
        end
      end

      # DBClusterIdentifier does not refer to an existing DB cluster.

      struct DBClusterNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Not supported by Neptune.

      struct DBClusterOptionGroupStatus
        include JSON::Serializable

        # Not supported by Neptune.

        @[JSON::Field(key: "DBClusterOptionGroupName")]
        getter db_cluster_option_group_name : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @db_cluster_option_group_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains the details of an Amazon Neptune DB cluster parameter group. This data type is used as a
      # response element in the DescribeDBClusterParameterGroups action.

      struct DBClusterParameterGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the DB cluster parameter group.

        @[JSON::Field(key: "DBClusterParameterGroupArn")]
        getter db_cluster_parameter_group_arn : String?

        # Provides the name of the DB cluster parameter group.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # Provides the name of the DB parameter group family that this DB cluster parameter group is
        # compatible with.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String?

        # Provides the customer-specified description for this DB cluster parameter group.

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


      struct DBClusterParameterGroupDetails
        include JSON::Serializable

        # An optional pagination token provided by a previous DescribeDBClusterParameters request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Provides a list of parameters for the DB cluster parameter group.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @marker : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end


      struct DBClusterParameterGroupNameMessage
        include JSON::Serializable

        # The name of the DB cluster parameter group. Constraints: Must be 1 to 255 letters or numbers. First
        # character must be a letter Cannot end with a hyphen or contain two consecutive hyphens This value is
        # stored as a lowercase string.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        def initialize(
          @db_cluster_parameter_group_name : String? = nil
        )
        end
      end

      # DBClusterParameterGroupName does not refer to an existing DB Cluster parameter group.

      struct DBClusterParameterGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end


      struct DBClusterParameterGroupsMessage
        include JSON::Serializable

        # A list of DB cluster parameter groups.

        @[JSON::Field(key: "DBClusterParameterGroups")]
        getter db_cluster_parameter_groups : Array(Types::DBClusterParameterGroup)?

        # An optional pagination token provided by a previous DescribeDBClusterParameterGroups request. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_cluster_parameter_groups : Array(Types::DBClusterParameterGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # User attempted to create a new DB cluster and the user has already reached the maximum allowed DB
      # cluster quota.

      struct DBClusterQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an Amazon Identity and Access Management (IAM) role that is associated with a DB cluster.

      struct DBClusterRole
        include JSON::Serializable

        # The name of the feature associated with the Amazon Identity and Access Management (IAM) role. For
        # the list of supported feature names, see DescribeDBEngineVersions .

        @[JSON::Field(key: "FeatureName")]
        getter feature_name : String?

        # The Amazon Resource Name (ARN) of the IAM role that is associated with the DB cluster.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Describes the state of association between the IAM role and the DB cluster. The Status property
        # returns one of the following values: ACTIVE - the IAM role ARN is associated with the DB cluster and
        # can be used to access other Amazon services on your behalf. PENDING - the IAM role ARN is being
        # associated with the DB cluster. INVALID - the IAM role ARN is associated with the DB cluster, but
        # the DB cluster is unable to assume the IAM role in order to access other Amazon services on your
        # behalf.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @feature_name : String? = nil,
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The specified IAM role Amazon Resource Name (ARN) is already associated with the specified DB
      # cluster.

      struct DBClusterRoleAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified IAM role Amazon Resource Name (ARN) is not associated with the specified DB cluster.

      struct DBClusterRoleNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # You have exceeded the maximum number of IAM roles that can be associated with the specified DB
      # cluster.

      struct DBClusterRoleQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the details for an Amazon Neptune DB cluster snapshot This data type is used as a response
      # element in the DescribeDBClusterSnapshots action.

      struct DBClusterSnapshot
        include JSON::Serializable

        # Specifies the allocated storage size in gibibytes (GiB).

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # Provides the list of EC2 Availability Zones that instances in the DB cluster snapshot can be
        # restored in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Specifies the time when the DB cluster was created, in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "ClusterCreateTime")]
        getter cluster_create_time : Time?

        # Specifies the DB cluster identifier of the DB cluster that this DB cluster snapshot was created
        # from.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The Amazon Resource Name (ARN) for the DB cluster snapshot.

        @[JSON::Field(key: "DBClusterSnapshotArn")]
        getter db_cluster_snapshot_arn : String?

        # Specifies the identifier for a DB cluster snapshot. Must match the identifier of an existing
        # snapshot. After you restore a DB cluster using a DBClusterSnapshotIdentifier , you must specify the
        # same DBClusterSnapshotIdentifier for any future updates to the DB cluster. When you specify this
        # property for an update, the DB cluster is not restored from the snapshot again, and the data in the
        # database is not changed. However, if you don't specify the DBClusterSnapshotIdentifier , an empty DB
        # cluster is created, and the original DB cluster is deleted. If you specify a property that is
        # different from the previous snapshot restore property, the DB cluster is restored from the snapshot
        # specified by the DBClusterSnapshotIdentifier , and the original DB cluster is deleted.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String?

        # Specifies the name of the database engine.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Provides the version of the database engine for this DB cluster snapshot.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # True if mapping of Amazon Identity and Access Management (IAM) accounts to database accounts is
        # enabled, and otherwise false.

        @[JSON::Field(key: "IAMDatabaseAuthenticationEnabled")]
        getter iam_database_authentication_enabled : Bool?

        # If StorageEncrypted is true, the Amazon KMS key identifier for the encrypted DB cluster snapshot.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Provides the license model information for this DB cluster snapshot.

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # Specifies the percentage of the estimated data that has been transferred.

        @[JSON::Field(key: "PercentProgress")]
        getter percent_progress : Int32?

        # Specifies the port that the DB cluster was listening on at the time of the snapshot.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Provides the time when the snapshot was taken, in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "SnapshotCreateTime")]
        getter snapshot_create_time : Time?

        # Provides the type of the DB cluster snapshot.

        @[JSON::Field(key: "SnapshotType")]
        getter snapshot_type : String?

        # If the DB cluster snapshot was copied from a source DB cluster snapshot, the Amazon Resource Name
        # (ARN) for the source DB cluster snapshot, otherwise, a null value.

        @[JSON::Field(key: "SourceDBClusterSnapshotArn")]
        getter source_db_cluster_snapshot_arn : String?

        # Specifies the status of this DB cluster snapshot.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Specifies whether the DB cluster snapshot is encrypted.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # The storage type associated with the DB cluster snapshot.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # Provides the VPC ID associated with the DB cluster snapshot.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @allocated_storage : Int32? = nil,
          @availability_zones : Array(String)? = nil,
          @cluster_create_time : Time? = nil,
          @db_cluster_identifier : String? = nil,
          @db_cluster_snapshot_arn : String? = nil,
          @db_cluster_snapshot_identifier : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @iam_database_authentication_enabled : Bool? = nil,
          @kms_key_id : String? = nil,
          @license_model : String? = nil,
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

      # User already has a DB cluster snapshot with the given identifier.

      struct DBClusterSnapshotAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the name and values of a manual DB cluster snapshot attribute. Manual DB cluster snapshot
      # attributes are used to authorize other Amazon accounts to restore a manual DB cluster snapshot. For
      # more information, see the ModifyDBClusterSnapshotAttribute API action.

      struct DBClusterSnapshotAttribute
        include JSON::Serializable

        # The name of the manual DB cluster snapshot attribute. The attribute named restore refers to the list
        # of Amazon accounts that have permission to copy or restore the manual DB cluster snapshot. For more
        # information, see the ModifyDBClusterSnapshotAttribute API action.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The value(s) for the manual DB cluster snapshot attribute. If the AttributeName field is set to
        # restore , then this element returns a list of IDs of the Amazon accounts that are authorized to copy
        # or restore the manual DB cluster snapshot. If a value of all is in the list, then the manual DB
        # cluster snapshot is public and available for any Amazon account to copy or restore.

        @[JSON::Field(key: "AttributeValues")]
        getter attribute_values : Array(String)?

        def initialize(
          @attribute_name : String? = nil,
          @attribute_values : Array(String)? = nil
        )
        end
      end

      # Contains the results of a successful call to the DescribeDBClusterSnapshotAttributes API action.
      # Manual DB cluster snapshot attributes are used to authorize other Amazon accounts to copy or restore
      # a manual DB cluster snapshot. For more information, see the ModifyDBClusterSnapshotAttribute API
      # action.

      struct DBClusterSnapshotAttributesResult
        include JSON::Serializable

        # The list of attributes and values for the manual DB cluster snapshot.

        @[JSON::Field(key: "DBClusterSnapshotAttributes")]
        getter db_cluster_snapshot_attributes : Array(Types::DBClusterSnapshotAttribute)?

        # The identifier of the manual DB cluster snapshot that the attributes apply to.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String?

        def initialize(
          @db_cluster_snapshot_attributes : Array(Types::DBClusterSnapshotAttribute)? = nil,
          @db_cluster_snapshot_identifier : String? = nil
        )
        end
      end


      struct DBClusterSnapshotMessage
        include JSON::Serializable

        # Provides a list of DB cluster snapshots for the user.

        @[JSON::Field(key: "DBClusterSnapshots")]
        getter db_cluster_snapshots : Array(Types::DBClusterSnapshot)?

        # An optional pagination token provided by a previous DescribeDBClusterSnapshots request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_cluster_snapshots : Array(Types::DBClusterSnapshot)? = nil,
          @marker : String? = nil
        )
        end
      end

      # DBClusterSnapshotIdentifier does not refer to an existing DB cluster snapshot.

      struct DBClusterSnapshotNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # This data type is used as a response element in the action DescribeDBEngineVersions .

      struct DBEngineVersion
        include JSON::Serializable

        # The description of the database engine.

        @[JSON::Field(key: "DBEngineDescription")]
        getter db_engine_description : String?

        # The description of the database engine version.

        @[JSON::Field(key: "DBEngineVersionDescription")]
        getter db_engine_version_description : String?

        # The name of the DB parameter group family for the database engine.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String?

        # (Not supported by Neptune)

        @[JSON::Field(key: "DefaultCharacterSet")]
        getter default_character_set : Types::CharacterSet?

        # The name of the database engine.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version number of the database engine.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The types of logs that the database engine has available for export to CloudWatch Logs.

        @[JSON::Field(key: "ExportableLogTypes")]
        getter exportable_log_types : Array(String)?

        # (Not supported by Neptune)

        @[JSON::Field(key: "SupportedCharacterSets")]
        getter supported_character_sets : Array(Types::CharacterSet)?

        # A list of the time zones supported by this engine for the Timezone parameter of the CreateDBInstance
        # action.

        @[JSON::Field(key: "SupportedTimezones")]
        getter supported_timezones : Array(Types::Timezone)?

        # A value that indicates whether you can use Aurora global databases with a specific DB engine
        # version.

        @[JSON::Field(key: "SupportsGlobalDatabases")]
        getter supports_global_databases : Bool?

        # A value that indicates whether the engine version supports exporting the log types specified by
        # ExportableLogTypes to CloudWatch Logs.

        @[JSON::Field(key: "SupportsLogExportsToCloudwatchLogs")]
        getter supports_log_exports_to_cloudwatch_logs : Bool?

        # Indicates whether the database engine version supports read replicas.

        @[JSON::Field(key: "SupportsReadReplica")]
        getter supports_read_replica : Bool?

        # A list of engine versions that this database engine version can be upgraded to.

        @[JSON::Field(key: "ValidUpgradeTarget")]
        getter valid_upgrade_target : Array(Types::UpgradeTarget)?

        def initialize(
          @db_engine_description : String? = nil,
          @db_engine_version_description : String? = nil,
          @db_parameter_group_family : String? = nil,
          @default_character_set : Types::CharacterSet? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @exportable_log_types : Array(String)? = nil,
          @supported_character_sets : Array(Types::CharacterSet)? = nil,
          @supported_timezones : Array(Types::Timezone)? = nil,
          @supports_global_databases : Bool? = nil,
          @supports_log_exports_to_cloudwatch_logs : Bool? = nil,
          @supports_read_replica : Bool? = nil,
          @valid_upgrade_target : Array(Types::UpgradeTarget)? = nil
        )
        end
      end


      struct DBEngineVersionMessage
        include JSON::Serializable

        # A list of DBEngineVersion elements.

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

      # Contains the details of an Amazon Neptune DB instance. This data type is used as a response element
      # in the DescribeDBInstances action.

      struct DBInstance
        include JSON::Serializable

        # Not supported by Neptune.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # Indicates that minor version patches are applied automatically.

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Specifies the name of the Availability Zone the DB instance is located in.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # Specifies the number of days for which automatic DB snapshots are retained.

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # The identifier of the CA certificate for this DB instance.

        @[JSON::Field(key: "CACertificateIdentifier")]
        getter ca_certificate_identifier : String?

        # (Not supported by Neptune)

        @[JSON::Field(key: "CharacterSetName")]
        getter character_set_name : String?

        # Specifies whether tags are copied from the DB instance to snapshots of the DB instance.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # If the DB instance is a member of a DB cluster, contains the name of the DB cluster that the DB
        # instance is a member of.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The Amazon Resource Name (ARN) for the DB instance.

        @[JSON::Field(key: "DBInstanceArn")]
        getter db_instance_arn : String?

        # Contains the name of the compute and memory capacity class of the DB instance.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # Contains a user-supplied database identifier. This identifier is the unique key that identifies a DB
        # instance.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String?

        # Specifies the current state of this database.

        @[JSON::Field(key: "DBInstanceStatus")]
        getter db_instance_status : String?

        # The database name.

        @[JSON::Field(key: "DBName")]
        getter db_name : String?

        # Provides the list of DB parameter groups applied to this DB instance.

        @[JSON::Field(key: "DBParameterGroups")]
        getter db_parameter_groups : Array(Types::DBParameterGroupStatus)?

        # Provides List of DB security group elements containing only DBSecurityGroup.Name and
        # DBSecurityGroup.Status subelements.

        @[JSON::Field(key: "DBSecurityGroups")]
        getter db_security_groups : Array(Types::DBSecurityGroupMembership)?

        # Specifies information on the subnet group associated with the DB instance, including the name,
        # description, and subnets in the subnet group.

        @[JSON::Field(key: "DBSubnetGroup")]
        getter db_subnet_group : Types::DBSubnetGroup?

        # Specifies the port that the DB instance listens on. If the DB instance is part of a DB cluster, this
        # can be a different port than the DB cluster port.

        @[JSON::Field(key: "DbInstancePort")]
        getter db_instance_port : Int32?

        # The Amazon Region-unique, immutable identifier for the DB instance. This identifier is found in
        # Amazon CloudTrail log entries whenever the Amazon KMS key for the DB instance is accessed.

        @[JSON::Field(key: "DbiResourceId")]
        getter dbi_resource_id : String?

        # Indicates whether or not the DB instance has deletion protection enabled. The instance can't be
        # deleted when deletion protection is enabled. See Deleting a DB Instance .

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # Not supported

        @[JSON::Field(key: "DomainMemberships")]
        getter domain_memberships : Array(Types::DomainMembership)?

        # A list of log types that this DB instance is configured to export to CloudWatch Logs.

        @[JSON::Field(key: "EnabledCloudwatchLogsExports")]
        getter enabled_cloudwatch_logs_exports : Array(String)?

        # Specifies the connection endpoint.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        # Provides the name of the database engine to be used for this DB instance.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Indicates the database engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log stream that receives the Enhanced
        # Monitoring metrics data for the DB instance.

        @[JSON::Field(key: "EnhancedMonitoringResourceArn")]
        getter enhanced_monitoring_resource_arn : String?

        # True if Amazon Identity and Access Management (IAM) authentication is enabled, and otherwise false.

        @[JSON::Field(key: "IAMDatabaseAuthenticationEnabled")]
        getter iam_database_authentication_enabled : Bool?

        # Provides the date and time the DB instance was created.

        @[JSON::Field(key: "InstanceCreateTime")]
        getter instance_create_time : Time?

        # Specifies the Provisioned IOPS (I/O operations per second) value.

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # Not supported: The encryption for DB instances is managed by the DB cluster.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the latest time to which a database can be restored with point-in-time restore.

        @[JSON::Field(key: "LatestRestorableTime")]
        getter latest_restorable_time : Time?

        # License model information for this DB instance.

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUsername")]
        getter master_username : String?

        # The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB
        # instance.

        @[JSON::Field(key: "MonitoringInterval")]
        getter monitoring_interval : Int32?

        # The ARN for the IAM role that permits Neptune to send Enhanced Monitoring metrics to Amazon
        # CloudWatch Logs.

        @[JSON::Field(key: "MonitoringRoleArn")]
        getter monitoring_role_arn : String?

        # Specifies if the DB instance is a Multi-AZ deployment.

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # (Not supported by Neptune)

        @[JSON::Field(key: "OptionGroupMemberships")]
        getter option_group_memberships : Array(Types::OptionGroupMembership)?

        # Specifies that changes to the DB instance are pending. This element is only included when changes
        # are pending. Specific changes are identified by subelements.

        @[JSON::Field(key: "PendingModifiedValues")]
        getter pending_modified_values : Types::PendingModifiedValues?

        # (Not supported by Neptune)

        @[JSON::Field(key: "PerformanceInsightsEnabled")]
        getter performance_insights_enabled : Bool?

        # (Not supported by Neptune)

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

        # A value that specifies the order in which a Read Replica is promoted to the primary instance after a
        # failure of the existing primary instance.

        @[JSON::Field(key: "PromotionTier")]
        getter promotion_tier : Int32?

        # Indicates whether the DB instance is publicly accessible. When the DB instance is publicly
        # accessible and you connect from outside of the DB instance's virtual private cloud (VPC), its Domain
        # Name System (DNS) endpoint resolves to the public IP address. When you connect from within the same
        # VPC as the DB instance, the endpoint resolves to the private IP address. Access to the DB instance
        # is ultimately controlled by the security group it uses. That public access isn't permitted if the
        # security group assigned to the DB cluster doesn't permit it. When the DB instance isn't publicly
        # accessible, it is an internal DB instance with a DNS name that resolves to a private IP address.

        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # Contains one or more identifiers of DB clusters that are Read Replicas of this DB instance.

        @[JSON::Field(key: "ReadReplicaDBClusterIdentifiers")]
        getter read_replica_db_cluster_identifiers : Array(String)?

        # Contains one or more identifiers of the Read Replicas associated with this DB instance.

        @[JSON::Field(key: "ReadReplicaDBInstanceIdentifiers")]
        getter read_replica_db_instance_identifiers : Array(String)?

        # Contains the identifier of the source DB instance if this DB instance is a Read Replica.

        @[JSON::Field(key: "ReadReplicaSourceDBInstanceIdentifier")]
        getter read_replica_source_db_instance_identifier : String?

        # If present, specifies the name of the secondary Availability Zone for a DB instance with multi-AZ
        # support.

        @[JSON::Field(key: "SecondaryAvailabilityZone")]
        getter secondary_availability_zone : String?

        # The status of a Read Replica. If the instance is not a Read Replica, this is blank.

        @[JSON::Field(key: "StatusInfos")]
        getter status_infos : Array(Types::DBInstanceStatusInfo)?

        # Not supported: The encryption for DB instances is managed by the DB cluster.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        # Specifies the storage type associated with the DB instance.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The ARN from the key store with which the instance is associated for TDE encryption.

        @[JSON::Field(key: "TdeCredentialArn")]
        getter tde_credential_arn : String?

        # Not supported.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        # Provides a list of VPC security group elements that the DB instance belongs to.

        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(Types::VpcSecurityGroupMembership)?

        def initialize(
          @allocated_storage : Int32? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @availability_zone : String? = nil,
          @backup_retention_period : Int32? = nil,
          @ca_certificate_identifier : String? = nil,
          @character_set_name : String? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @db_cluster_identifier : String? = nil,
          @db_instance_arn : String? = nil,
          @db_instance_class : String? = nil,
          @db_instance_identifier : String? = nil,
          @db_instance_status : String? = nil,
          @db_name : String? = nil,
          @db_parameter_groups : Array(Types::DBParameterGroupStatus)? = nil,
          @db_security_groups : Array(Types::DBSecurityGroupMembership)? = nil,
          @db_subnet_group : Types::DBSubnetGroup? = nil,
          @db_instance_port : Int32? = nil,
          @dbi_resource_id : String? = nil,
          @deletion_protection : Bool? = nil,
          @domain_memberships : Array(Types::DomainMembership)? = nil,
          @enabled_cloudwatch_logs_exports : Array(String)? = nil,
          @endpoint : Types::Endpoint? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @enhanced_monitoring_resource_arn : String? = nil,
          @iam_database_authentication_enabled : Bool? = nil,
          @instance_create_time : Time? = nil,
          @iops : Int32? = nil,
          @kms_key_id : String? = nil,
          @latest_restorable_time : Time? = nil,
          @license_model : String? = nil,
          @master_username : String? = nil,
          @monitoring_interval : Int32? = nil,
          @monitoring_role_arn : String? = nil,
          @multi_az : Bool? = nil,
          @option_group_memberships : Array(Types::OptionGroupMembership)? = nil,
          @pending_modified_values : Types::PendingModifiedValues? = nil,
          @performance_insights_enabled : Bool? = nil,
          @performance_insights_kms_key_id : String? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @promotion_tier : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @read_replica_db_cluster_identifiers : Array(String)? = nil,
          @read_replica_db_instance_identifiers : Array(String)? = nil,
          @read_replica_source_db_instance_identifier : String? = nil,
          @secondary_availability_zone : String? = nil,
          @status_infos : Array(Types::DBInstanceStatusInfo)? = nil,
          @storage_encrypted : Bool? = nil,
          @storage_type : String? = nil,
          @tde_credential_arn : String? = nil,
          @timezone : String? = nil,
          @vpc_security_groups : Array(Types::VpcSecurityGroupMembership)? = nil
        )
        end
      end

      # User already has a DB instance with the given identifier.

      struct DBInstanceAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end


      struct DBInstanceMessage
        include JSON::Serializable

        # A list of DBInstance instances.

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

      # DBInstanceIdentifier does not refer to an existing DB instance.

      struct DBInstanceNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Provides a list of status information for a DB instance.

      struct DBInstanceStatusInfo
        include JSON::Serializable

        # Details of the error if there is an error for the instance. If the instance is not in an error
        # state, this value is blank.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # Boolean value that is true if the instance is operating normally, or false if the instance is in an
        # error state.

        @[JSON::Field(key: "Normal")]
        getter normal : Bool?

        # Status of the DB instance. For a StatusType of read replica, the values can be replicating, error,
        # stopped, or terminated.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # This value is currently "read replication."

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

      # Contains the details of an Amazon Neptune DB parameter group. This data type is used as a response
      # element in the DescribeDBParameterGroups action.

      struct DBParameterGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the DB parameter group.

        @[JSON::Field(key: "DBParameterGroupArn")]
        getter db_parameter_group_arn : String?

        # Provides the name of the DB parameter group family that this DB parameter group is compatible with.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String?

        # Provides the name of the DB parameter group.

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String?

        # Provides the customer-specified description for this DB parameter group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @db_parameter_group_arn : String? = nil,
          @db_parameter_group_family : String? = nil,
          @db_parameter_group_name : String? = nil,
          @description : String? = nil
        )
        end
      end

      # A DB parameter group with the same name exists.

      struct DBParameterGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end


      struct DBParameterGroupDetails
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of Parameter values.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @marker : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end


      struct DBParameterGroupNameMessage
        include JSON::Serializable

        # Provides the name of the DB parameter group.

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String?

        def initialize(
          @db_parameter_group_name : String? = nil
        )
        end
      end

      # DBParameterGroupName does not refer to an existing DB parameter group.

      struct DBParameterGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Request would result in user exceeding the allowed number of DB parameter groups.

      struct DBParameterGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The status of the DB parameter group. This data type is used as a response element in the following
      # actions: CreateDBInstance DeleteDBInstance ModifyDBInstance RebootDBInstance

      struct DBParameterGroupStatus
        include JSON::Serializable

        # The name of the DP parameter group.

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String?

        # The status of parameter updates.

        @[JSON::Field(key: "ParameterApplyStatus")]
        getter parameter_apply_status : String?

        def initialize(
          @db_parameter_group_name : String? = nil,
          @parameter_apply_status : String? = nil
        )
        end
      end


      struct DBParameterGroupsMessage
        include JSON::Serializable

        # A list of DBParameterGroup instances.

        @[JSON::Field(key: "DBParameterGroups")]
        getter db_parameter_groups : Array(Types::DBParameterGroup)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @db_parameter_groups : Array(Types::DBParameterGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Specifies membership in a designated DB security group.

      struct DBSecurityGroupMembership
        include JSON::Serializable

        # The name of the DB security group.

        @[JSON::Field(key: "DBSecurityGroupName")]
        getter db_security_group_name : String?

        # The status of the DB security group.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @db_security_group_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # DBSecurityGroupName does not refer to an existing DB security group.

      struct DBSecurityGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # DBSnapshotIdentifier is already used by an existing snapshot.

      struct DBSnapshotAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # DBSnapshotIdentifier does not refer to an existing DB snapshot.

      struct DBSnapshotNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the details of an Amazon Neptune DB subnet group. This data type is used as a response
      # element in the DescribeDBSubnetGroups action.

      struct DBSubnetGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the DB subnet group.

        @[JSON::Field(key: "DBSubnetGroupArn")]
        getter db_subnet_group_arn : String?

        # Provides the description of the DB subnet group.

        @[JSON::Field(key: "DBSubnetGroupDescription")]
        getter db_subnet_group_description : String?

        # The name of the DB subnet group.

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # Provides the status of the DB subnet group.

        @[JSON::Field(key: "SubnetGroupStatus")]
        getter subnet_group_status : String?

        # Contains a list of Subnet elements.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(Types::Subnet)?

        # Provides the VpcId of the DB subnet group.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @db_subnet_group_arn : String? = nil,
          @db_subnet_group_description : String? = nil,
          @db_subnet_group_name : String? = nil,
          @subnet_group_status : String? = nil,
          @subnets : Array(Types::Subnet)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # DBSubnetGroupName is already used by an existing DB subnet group.

      struct DBSubnetGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Subnets in the DB subnet group should cover at least two Availability Zones unless there is only one
      # Availability Zone.

      struct DBSubnetGroupDoesNotCoverEnoughAZs
        include JSON::Serializable

        def initialize
        end
      end


      struct DBSubnetGroupMessage
        include JSON::Serializable

        # A list of DBSubnetGroup instances.

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

      # DBSubnetGroupName does not refer to an existing DB subnet group.

      struct DBSubnetGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Request would result in user exceeding the allowed number of DB subnet groups.

      struct DBSubnetGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Request would result in user exceeding the allowed number of subnets in a DB subnet groups.

      struct DBSubnetQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The DB upgrade failed because a resource the DB depends on could not be modified.

      struct DBUpgradeDependencyFailureFault
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDBClusterEndpointMessage
        include JSON::Serializable

        # The identifier associated with the custom endpoint. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterEndpointIdentifier")]
        getter db_cluster_endpoint_identifier : String

        def initialize(
          @db_cluster_endpoint_identifier : String
        )
        end
      end

      # This data type represents the information you need to connect to an Amazon Neptune DB cluster. This
      # data type is used as a response element in the following actions: CreateDBClusterEndpoint
      # DescribeDBClusterEndpoints ModifyDBClusterEndpoint DeleteDBClusterEndpoint For the data structure
      # that represents Amazon RDS DB instance endpoints, see Endpoint .

      struct DeleteDBClusterEndpointOutput
        include JSON::Serializable

        # The type associated with a custom endpoint. One of: READER , WRITER , ANY .

        @[JSON::Field(key: "CustomEndpointType")]
        getter custom_endpoint_type : String?

        # The Amazon Resource Name (ARN) for the endpoint.

        @[JSON::Field(key: "DBClusterEndpointArn")]
        getter db_cluster_endpoint_arn : String?

        # The identifier associated with the endpoint. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterEndpointIdentifier")]
        getter db_cluster_endpoint_identifier : String?

        # A unique system-generated identifier for an endpoint. It remains the same for the whole life of the
        # endpoint.

        @[JSON::Field(key: "DBClusterEndpointResourceIdentifier")]
        getter db_cluster_endpoint_resource_identifier : String?

        # The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored
        # as a lowercase string.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The DNS address of the endpoint.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The type of the endpoint. One of: READER , WRITER , CUSTOM .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible
        # instances are reachable through the custom endpoint. Only relevant if the list of static members is
        # empty.

        @[JSON::Field(key: "ExcludedMembers")]
        getter excluded_members : Array(String)?

        # List of DB instance identifiers that are part of the custom endpoint group.

        @[JSON::Field(key: "StaticMembers")]
        getter static_members : Array(String)?

        # The current status of the endpoint. One of: creating , available , deleting , inactive , modifying .
        # The inactive state applies to an endpoint that cannot be used for a certain kind of cluster, such as
        # a writer endpoint for a read-only secondary cluster in a global database.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @custom_endpoint_type : String? = nil,
          @db_cluster_endpoint_arn : String? = nil,
          @db_cluster_endpoint_identifier : String? = nil,
          @db_cluster_endpoint_resource_identifier : String? = nil,
          @db_cluster_identifier : String? = nil,
          @endpoint : String? = nil,
          @endpoint_type : String? = nil,
          @excluded_members : Array(String)? = nil,
          @static_members : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteDBClusterMessage
        include JSON::Serializable

        # The DB cluster identifier for the DB cluster to be deleted. This parameter isn't case-sensitive.
        # Constraints: Must match an existing DBClusterIdentifier.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The DB cluster snapshot identifier of the new DB cluster snapshot created when SkipFinalSnapshot is
        # set to false . Specifying this parameter and also setting the SkipFinalShapshot parameter to true
        # results in an error. Constraints: Must be 1 to 255 letters, numbers, or hyphens. First character
        # must be a letter Cannot end with a hyphen or contain two consecutive hyphens

        @[JSON::Field(key: "FinalDBSnapshotIdentifier")]
        getter final_db_snapshot_identifier : String?

        # Determines whether a final DB cluster snapshot is created before the DB cluster is deleted. If true
        # is specified, no DB cluster snapshot is created. If false is specified, a DB cluster snapshot is
        # created before the DB cluster is deleted. You must specify a FinalDBSnapshotIdentifier parameter if
        # SkipFinalSnapshot is false . Default: false

        @[JSON::Field(key: "SkipFinalSnapshot")]
        getter skip_final_snapshot : Bool?

        def initialize(
          @db_cluster_identifier : String,
          @final_db_snapshot_identifier : String? = nil,
          @skip_final_snapshot : Bool? = nil
        )
        end
      end


      struct DeleteDBClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the DB cluster parameter group. Constraints: Must be the name of an existing DB cluster
        # parameter group. You can't delete a default DB cluster parameter group. Cannot be associated with
        # any DB clusters.

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


      struct DeleteDBClusterSnapshotMessage
        include JSON::Serializable

        # The identifier of the DB cluster snapshot to delete. Constraints: Must be the name of an existing DB
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


      struct DeleteDBInstanceMessage
        include JSON::Serializable

        # The DB instance identifier for the DB instance to be deleted. This parameter isn't case-sensitive.
        # Constraints: Must match the name of an existing DB instance.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String

        # The DBSnapshotIdentifier of the new DBSnapshot created when SkipFinalSnapshot is set to false .
        # Specifying this parameter and also setting the SkipFinalShapshot parameter to true results in an
        # error. Constraints: Must be 1 to 255 letters or numbers. First character must be a letter Cannot end
        # with a hyphen or contain two consecutive hyphens Cannot be specified when deleting a Read Replica.

        @[JSON::Field(key: "FinalDBSnapshotIdentifier")]
        getter final_db_snapshot_identifier : String?

        # Determines whether a final DB snapshot is created before the DB instance is deleted. If true is
        # specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB
        # instance is deleted. Note that when a DB instance is in a failure state and has a status of
        # 'failed', 'incompatible-restore', or 'incompatible-network', it can only be deleted when the
        # SkipFinalSnapshot parameter is set to "true". Specify true when deleting a Read Replica. The
        # FinalDBSnapshotIdentifier parameter must be specified if SkipFinalSnapshot is false . Default: false

        @[JSON::Field(key: "SkipFinalSnapshot")]
        getter skip_final_snapshot : Bool?

        def initialize(
          @db_instance_identifier : String,
          @final_db_snapshot_identifier : String? = nil,
          @skip_final_snapshot : Bool? = nil
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


      struct DeleteDBParameterGroupMessage
        include JSON::Serializable

        # The name of the DB parameter group. Constraints: Must be the name of an existing DB parameter group
        # You can't delete a default DB parameter group Cannot be associated with any DB instances

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String

        def initialize(
          @db_parameter_group_name : String
        )
        end
      end


      struct DeleteDBSubnetGroupMessage
        include JSON::Serializable

        # The name of the database subnet group to delete. You can't delete the default subnet group.
        # Constraints: Constraints: Must match the name of an existing DBSubnetGroup. Must not be default.
        # Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String

        def initialize(
          @db_subnet_group_name : String
        )
        end
      end


      struct DeleteEventSubscriptionMessage
        include JSON::Serializable

        # The name of the event notification subscription you want to delete.

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


      struct DeleteGlobalClusterMessage
        include JSON::Serializable

        # The cluster identifier of the global database cluster being deleted.

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


      struct DescribeDBClusterEndpointsMessage
        include JSON::Serializable

        # The identifier of the endpoint to describe. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterEndpointIdentifier")]
        getter db_cluster_endpoint_identifier : String?

        # The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored
        # as a lowercase string.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # A set of name-value pairs that define which endpoints to include in the output. The filters are
        # specified as name-value pairs, in the format Name= endpoint_type ,Values= endpoint_type1 ,
        # endpoint_type2 ,... . Name can be one of: db-cluster-endpoint-type , db-cluster-endpoint-custom-type
        # , db-cluster-endpoint-id , db-cluster-endpoint-status . Values for the db-cluster-endpoint-type
        # filter can be one or more of: reader , writer , custom . Values for the
        # db-cluster-endpoint-custom-type filter can be one or more of: reader , any . Values for the
        # db-cluster-endpoint-status filter can be one or more of: available , creating , deleting , inactive
        # , modifying .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeDBClusterEndpoints request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so you can retrieve
        # the remaining results. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @db_cluster_endpoint_identifier : String? = nil,
          @db_cluster_identifier : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeDBClusterParameterGroupsMessage
        include JSON::Serializable

        # The name of a specific DB cluster parameter group to return details for. Constraints: If supplied,
        # must match the name of an existing DBClusterParameterGroup.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeDBClusterParameterGroups request. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

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


      struct DescribeDBClusterParametersMessage
        include JSON::Serializable

        # The name of a specific DB cluster parameter group to return parameter details for. Constraints: If
        # supplied, must match the name of an existing DBClusterParameterGroup.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeDBClusterParameters request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

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


      struct DescribeDBClusterSnapshotAttributesMessage
        include JSON::Serializable

        # The identifier for the DB cluster snapshot to describe the attributes for.

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


      struct DescribeDBClusterSnapshotsMessage
        include JSON::Serializable

        # The ID of the DB cluster to retrieve the list of DB cluster snapshots for. This parameter can't be
        # used in conjunction with the DBClusterSnapshotIdentifier parameter. This parameter is not
        # case-sensitive. Constraints: If supplied, must match the identifier of an existing DBCluster.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # A specific DB cluster snapshot identifier to describe. This parameter can't be used in conjunction
        # with the DBClusterIdentifier parameter. This value is stored as a lowercase string. Constraints: If
        # supplied, must match the identifier of an existing DBClusterSnapshot. If this identifier is for an
        # automated snapshot, the SnapshotType parameter must also be specified.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # True to include manual DB cluster snapshots that are public and can be copied or restored by any
        # Amazon account, and otherwise false. The default is false . The default is false. You can share a
        # manual DB cluster snapshot as public by using the ModifyDBClusterSnapshotAttribute API action.

        @[JSON::Field(key: "IncludePublic")]
        getter include_public : Bool?

        # True to include shared manual DB cluster snapshots from other Amazon accounts that this Amazon
        # account has been given permission to copy or restore, and otherwise false. The default is false .
        # You can give an Amazon account permission to restore a manual DB cluster snapshot from another
        # Amazon account by the ModifyDBClusterSnapshotAttribute API action.

        @[JSON::Field(key: "IncludeShared")]
        getter include_shared : Bool?

        # An optional pagination token provided by a previous DescribeDBClusterSnapshots request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The type of DB cluster snapshots to be returned. You can specify one of the following values:
        # automated - Return all DB cluster snapshots that have been automatically taken by Amazon Neptune for
        # my Amazon account. manual - Return all DB cluster snapshots that have been taken by my Amazon
        # account. shared - Return all manual DB cluster snapshots that have been shared to my Amazon account.
        # public - Return all DB cluster snapshots that have been marked as public. If you don't specify a
        # SnapshotType value, then both automated and manual DB cluster snapshots are returned. You can
        # include shared DB cluster snapshots with these results by setting the IncludeShared parameter to
        # true . You can include public DB cluster snapshots with these results by setting the IncludePublic
        # parameter to true . The IncludeShared and IncludePublic parameters don't apply for SnapshotType
        # values of manual or automated . The IncludePublic parameter doesn't apply when SnapshotType is set
        # to shared . The IncludeShared parameter doesn't apply when SnapshotType is set to public .

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


      struct DescribeDBClustersMessage
        include JSON::Serializable

        # The user-supplied DB cluster identifier. If this parameter is specified, information from only the
        # specific DB cluster is returned. This parameter isn't case-sensitive. Constraints: If supplied, must
        # match an existing DBClusterIdentifier.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # A filter that specifies one or more DB clusters to describe. Supported filters: db-cluster-id -
        # Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will
        # only include information about the DB clusters identified by these ARNs. engine - Accepts an engine
        # name (such as neptune ), and restricts the results list to DB clusters created by that engine. For
        # example, to invoke this API from the Amazon CLI and filter so that only Neptune DB clusters are
        # returned, you could use the following command:

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeDBClusters request. If this parameter is
        # specified, the response includes only records beyond the marker, up to the value specified by
        # MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

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


      struct DescribeDBEngineVersionsMessage
        include JSON::Serializable

        # The name of a specific DB parameter group family to return details for. Constraints: If supplied,
        # must match an existing DBParameterGroupFamily.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String?

        # Indicates that only the default version of the specified engine or engine and major version
        # combination is returned.

        @[JSON::Field(key: "DefaultOnly")]
        getter default_only : Bool?

        # The database engine to return.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The database engine version to return. Example: 5.1.49

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Not currently supported.

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

        # The maximum number of records to include in the response. If more than the MaxRecords value is
        # available, a pagination token called a marker is included in the response so that the following
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


      struct DescribeDBInstancesMessage
        include JSON::Serializable

        # The user-supplied instance identifier. If this parameter is specified, information from only the
        # specific DB instance is returned. This parameter isn't case-sensitive. Constraints: If supplied,
        # must match the identifier of an existing DBInstance.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String?

        # A filter that specifies one or more DB instances to describe. Supported filters: db-cluster-id -
        # Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will
        # only include information about the DB instances associated with the DB clusters identified by these
        # ARNs. engine - Accepts an engine name (such as neptune ), and restricts the results list to DB
        # instances created by that engine. For example, to invoke this API from the Amazon CLI and filter so
        # that only Neptune DB instances are returned, you could use the following command:

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeDBInstances request. If this parameter
        # is specified, the response includes only records beyond the marker, up to the value specified by
        # MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

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


      struct DescribeDBParameterGroupsMessage
        include JSON::Serializable

        # The name of a specific DB parameter group to return details for. Constraints: If supplied, must
        # match the name of an existing DBClusterParameterGroup.

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeDBParameterGroups request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @db_parameter_group_name : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeDBParametersMessage
        include JSON::Serializable

        # The name of a specific DB parameter group to return details for. Constraints: If supplied, must
        # match the name of an existing DBParameterGroup.

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeDBParameters request. If this parameter
        # is specified, the response includes only records beyond the marker, up to the value specified by
        # MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The parameter types to return. Default: All parameter types returned Valid Values: user | system |
        # engine-default

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @db_parameter_group_name : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @source : String? = nil
        )
        end
      end


      struct DescribeDBSubnetGroupsMessage
        include JSON::Serializable

        # The name of the DB subnet group to return details for.

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeDBSubnetGroups request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

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


      struct DescribeEngineDefaultClusterParametersMessage
        include JSON::Serializable

        # The name of the DB cluster parameter group family to return engine parameter information for.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeEngineDefaultClusterParameters request.
        # If this parameter is specified, the response includes only records beyond the marker, up to the
        # value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

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


      struct DescribeEngineDefaultParametersMessage
        include JSON::Serializable

        # The name of the DB parameter group family.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String

        # Not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeEngineDefaultParameters request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

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


      struct DescribeEngineDefaultParametersResult
        include JSON::Serializable


        @[JSON::Field(key: "EngineDefaults")]
        getter engine_defaults : Types::EngineDefaults?

        def initialize(
          @engine_defaults : Types::EngineDefaults? = nil
        )
        end
      end


      struct DescribeEventCategoriesMessage
        include JSON::Serializable

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The type of source that is generating the events. Valid values: db-instance | db-parameter-group |
        # db-security-group | db-snapshot

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @source_type : String? = nil
        )
        end
      end


      struct DescribeEventSubscriptionsMessage
        include JSON::Serializable

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions request. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The name of the event notification subscription you want to describe.

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


      struct DescribeEventsMessage
        include JSON::Serializable

        # The number of minutes to retrieve events for. Default: 60

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The end of the time interval for which to retrieve events, specified in ISO 8601 format. For more
        # information about ISO 8601, go to the ISO8601 Wikipedia page. Example: 2009-07-08T18:00Z

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # A list of event categories that trigger notifications for a event notification subscription.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribeEvents request. If this parameter is
        # specified, the response includes only records beyond the marker, up to the value specified by
        # MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The identifier of the event source for which events are returned. If not specified, then all sources
        # are included in the response. Constraints: If SourceIdentifier is supplied, SourceType must also be
        # provided. If the source type is DBInstance , then a DBInstanceIdentifier must be supplied. If the
        # source type is DBSecurityGroup , a DBSecurityGroupName must be supplied. If the source type is
        # DBParameterGroup , a DBParameterGroupName must be supplied. If the source type is DBSnapshot , a
        # DBSnapshotIdentifier must be supplied. Cannot end with a hyphen or contain two consecutive hyphens.

        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        # The event source to retrieve events for. If no value is specified, all events are returned.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The beginning of the time interval to retrieve events for, specified in ISO 8601 format. For more
        # information about ISO 8601, go to the ISO8601 Wikipedia page. Example: 2009-07-08T18:00Z

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

        # The user-supplied DB cluster identifier. If this parameter is specified, only information about the
        # specified DB cluster is returned. This parameter is not case-sensitive. Constraints: If supplied,
        # must match an existing DB cluster identifier.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String?

        # ( Optional ) A pagination token returned by a previous call to DescribeGlobalClusters . If this
        # parameter is specified, the response will only include records beyond the marker, up to the number
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination marker token is included in the response that you can use to retrieve
        # the remaining results. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @global_cluster_identifier : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeOrderableDBInstanceOptionsMessage
        include JSON::Serializable

        # The name of the engine to retrieve DB instance options for.

        @[JSON::Field(key: "Engine")]
        getter engine : String

        # The DB instance class filter value. Specify this parameter to show only the available offerings
        # matching the specified DB instance class.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # The engine version filter value. Specify this parameter to show only the available offerings
        # matching the specified engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # This parameter is not currently supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The license model filter value. Specify this parameter to show only the available offerings matching
        # the specified license model.

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions request. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The VPC filter value. Specify this parameter to show only the available VPC or non-VPC offerings.

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


      struct DescribePendingMaintenanceActionsMessage
        include JSON::Serializable

        # A filter that specifies one or more resources to return pending maintenance actions for. Supported
        # filters: db-cluster-id - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs).
        # The results list will only include pending maintenance actions for the DB clusters identified by
        # these ARNs. db-instance-id - Accepts DB instance identifiers and DB instance ARNs. The results list
        # will only include pending maintenance actions for the DB instances identified by these ARNs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous DescribePendingMaintenanceActions request. If
        # this parameter is specified, the response includes only records beyond the marker, up to a number of
        # records specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

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


      struct DescribeValidDBInstanceModificationsMessage
        include JSON::Serializable

        # The customer identifier or the ARN of your DB instance.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String

        def initialize(
          @db_instance_identifier : String
        )
        end
      end


      struct DescribeValidDBInstanceModificationsResult
        include JSON::Serializable


        @[JSON::Field(key: "ValidDBInstanceModificationsMessage")]
        getter valid_db_instance_modifications_message : Types::ValidDBInstanceModificationsMessage?

        def initialize(
          @valid_db_instance_modifications_message : Types::ValidDBInstanceModificationsMessage? = nil
        )
        end
      end

      # An Active Directory Domain membership record associated with a DB instance.

      struct DomainMembership
        include JSON::Serializable

        # The identifier of the Active Directory Domain.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The fully qualified domain name of the Active Directory Domain.

        @[JSON::Field(key: "FQDN")]
        getter fqdn : String?

        # The name of the IAM role to be used when making API calls to the Directory Service.

        @[JSON::Field(key: "IAMRoleName")]
        getter iam_role_name : String?

        # The status of the DB instance's Active Directory Domain membership, such as joined, pending-join,
        # failed etc).

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @domain : String? = nil,
          @fqdn : String? = nil,
          @iam_role_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Domain does not refer to an existing Active Directory Domain.

      struct DomainNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # A range of double values.

      struct DoubleRange
        include JSON::Serializable

        # The minimum value in the range.

        @[JSON::Field(key: "From")]
        getter from : Float64?

        # The maximum value in the range.

        @[JSON::Field(key: "To")]
        getter to : Float64?

        def initialize(
          @from : Float64? = nil,
          @to : Float64? = nil
        )
        end
      end

      # Specifies a connection endpoint. For the data structure that represents Amazon Neptune DB cluster
      # endpoints, see DBClusterEndpoint .

      struct Endpoint
        include JSON::Serializable

        # Specifies the DNS address of the DB instance.

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

      # Contains the result of a successful invocation of the DescribeEngineDefaultParameters action.

      struct EngineDefaults
        include JSON::Serializable

        # Specifies the name of the DB parameter group family that the engine default parameters apply to.

        @[JSON::Field(key: "DBParameterGroupFamily")]
        getter db_parameter_group_family : String?

        # An optional pagination token provided by a previous EngineDefaults request. If this parameter is
        # specified, the response includes only records beyond the marker, up to the value specified by
        # MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Contains a list of engine default parameters.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @db_parameter_group_family : String? = nil,
          @marker : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end

      # This data type is used as a response element in the DescribeEvents action.

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

      # Contains the results of a successful invocation of the DescribeEventCategories action.

      struct EventCategoriesMap
        include JSON::Serializable

        # The event categories for the specified source type

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The source type that the returned categories belong to

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @event_categories : Array(String)? = nil,
          @source_type : String? = nil
        )
        end
      end


      struct EventCategoriesMessage
        include JSON::Serializable

        # A list of EventCategoriesMap data types.

        @[JSON::Field(key: "EventCategoriesMapList")]
        getter event_categories_map_list : Array(Types::EventCategoriesMap)?

        def initialize(
          @event_categories_map_list : Array(Types::EventCategoriesMap)? = nil
        )
        end
      end

      # Contains the results of a successful invocation of the DescribeEventSubscriptions action.

      struct EventSubscription
        include JSON::Serializable

        # The event notification subscription Id.

        @[JSON::Field(key: "CustSubscriptionId")]
        getter cust_subscription_id : String?

        # The Amazon customer account associated with the event notification subscription.

        @[JSON::Field(key: "CustomerAwsId")]
        getter customer_aws_id : String?

        # A Boolean value indicating if the subscription is enabled. True indicates the subscription is
        # enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A list of event categories for the event notification subscription.

        @[JSON::Field(key: "EventCategoriesList")]
        getter event_categories_list : Array(String)?

        # The Amazon Resource Name (ARN) for the event subscription.

        @[JSON::Field(key: "EventSubscriptionArn")]
        getter event_subscription_arn : String?

        # The topic ARN of the event notification subscription.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # A list of source IDs for the event notification subscription.

        @[JSON::Field(key: "SourceIdsList")]
        getter source_ids_list : Array(String)?

        # The source type for the event notification subscription.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The status of the event notification subscription. Constraints: Can be one of the following:
        # creating | modifying | deleting | active | no-permission | topic-not-exist The status
        # "no-permission" indicates that Neptune no longer has permission to post to the SNS topic. The status
        # "topic-not-exist" indicates that the topic was deleted after the subscription was created.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time the event notification subscription was created.

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

      # You have exceeded the number of events you can subscribe to.

      struct EventSubscriptionQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end


      struct EventSubscriptionsMessage
        include JSON::Serializable

        # A list of EventSubscriptions data types.

        @[JSON::Field(key: "EventSubscriptionsList")]
        getter event_subscriptions_list : Array(Types::EventSubscription)?

        # An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions request. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

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

        # An optional pagination token provided by a previous Events request. If this parameter is specified,
        # the response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct FailoverDBClusterMessage
        include JSON::Serializable

        # A DB cluster identifier to force a failover for. This parameter is not case-sensitive. Constraints:
        # Must match the identifier of an existing DBCluster.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The name of the instance to promote to the primary instance. You must specify the instance
        # identifier for an Read Replica in the DB cluster. For example, mydbcluster-replica1 .

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

        # Identifier of the Neptune global database that should be failed over. The identifier is the unique
        # key assigned by the user when the Neptune global database was created. In other words, it's the name
        # of the global database that you want to fail over. Constraints: Must match the identifier of an
        # existing Neptune global database.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        # The Amazon Resource Name (ARN) of the secondary Neptune DB cluster that you want to promote to
        # primary for the global database.

        @[JSON::Field(key: "TargetDbClusterIdentifier")]
        getter target_db_cluster_identifier : String

        # Specifies whether to allow data loss for this global database cluster operation. Allowing data loss
        # triggers a global failover operation. If you don't specify AllowDataLoss , the global database
        # cluster operation defaults to a switchover. Constraints:Can't be specified together with the
        # Switchover parameter.

        @[JSON::Field(key: "AllowDataLoss")]
        getter allow_data_loss : Bool?

        # Specifies whether to switch over this global database cluster. Constraints:Can't be specified
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

      # Contains the state of scheduled or in-process operations on a global cluster (Neptune global
      # database). This data type is empty unless a switchover or failover operation is scheduled or is in
      # progress on the Neptune global database.

      struct FailoverState
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Neptune DB cluster that is currently being demoted, and which
        # is associated with this state.

        @[JSON::Field(key: "FromDbClusterArn")]
        getter from_db_cluster_arn : String?

        # Indicates whether the operation is a global switchover or a global failover. If data loss is
        # allowed, then the operation is a global failover. Otherwise, it's a switchover.

        @[JSON::Field(key: "IsDataLossAllowed")]
        getter is_data_loss_allowed : Bool?

        # The current status of the global cluster. Possible values are as follows: pending &#x96; The service
        # received a request to switch over or fail over the global cluster. The global cluster's primary DB
        # cluster and the specified secondary DB cluster are being verified before the operation starts.
        # failing-over &#x96; Neptune is promoting the chosen secondary Neptune DB cluster to become the new
        # primary DB cluster to fail over the global cluster. cancelling &#x96; The request to switch over or
        # fail over the global cluster was cancelled and the primary Neptune DB cluster and the selected
        # secondary Neptune DB cluster are returning to their previous states. switching-over &#x96; This
        # status covers the range of Neptune internal operations that take place during the switchover
        # process, such as demoting the primary Neptune DB cluster, promoting the secondary Neptune DB
        # cluster, and synchronizing replicas.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the Neptune DB cluster that is currently being promoted, and which
        # is associated with this state.

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

      # This type is not currently supported.

      struct Filter
        include JSON::Serializable

        # This parameter is not currently supported.

        @[JSON::Field(key: "Name")]
        getter name : String

        # This parameter is not currently supported.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Contains the details of an Amazon Neptune global database. This data type is used as a response
      # element for the CreateGlobalCluster , DescribeGlobalClusters , ModifyGlobalCluster ,
      # DeleteGlobalCluster , FailoverGlobalCluster , and RemoveFromGlobalCluster actions.

      struct GlobalCluster
        include JSON::Serializable

        # The deletion protection setting for the global database.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The Neptune database engine used by the global database ( "neptune" ).

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The Neptune engine version used by the global database.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # A data object containing all properties for the current state of an in-process or pending switchover
        # or failover process for this global cluster (Neptune global database). This object is empty unless
        # the SwitchoverGlobalCluster or FailoverGlobalCluster operation was called on this global cluster.

        @[JSON::Field(key: "FailoverState")]
        getter failover_state : Types::FailoverState?

        # The Amazon Resource Name (ARN) for the global database.

        @[JSON::Field(key: "GlobalClusterArn")]
        getter global_cluster_arn : String?

        # Contains a user-supplied global database cluster identifier. This identifier is the unique key that
        # identifies a global database.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String?

        # A list of cluster ARNs and instance ARNs for all the DB clusters that are part of the global
        # database.

        @[JSON::Field(key: "GlobalClusterMembers")]
        getter global_cluster_members : Array(Types::GlobalClusterMember)?

        # An immutable identifier for the global database that is unique within in all regions. This
        # identifier is found in CloudTrail log entries whenever the KMS key for the DB cluster is accessed.

        @[JSON::Field(key: "GlobalClusterResourceId")]
        getter global_cluster_resource_id : String?

        # Specifies the current state of this global database.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The storage encryption setting for the global database.

        @[JSON::Field(key: "StorageEncrypted")]
        getter storage_encrypted : Bool?

        def initialize(
          @deletion_protection : Bool? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @failover_state : Types::FailoverState? = nil,
          @global_cluster_arn : String? = nil,
          @global_cluster_identifier : String? = nil,
          @global_cluster_members : Array(Types::GlobalClusterMember)? = nil,
          @global_cluster_resource_id : String? = nil,
          @status : String? = nil,
          @storage_encrypted : Bool? = nil
        )
        end
      end

      # The GlobalClusterIdentifier already exists. Choose a new global database identifier (unique name) to
      # create a new global database cluster.

      struct GlobalClusterAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # A data structure with information about any primary and secondary clusters associated with an
      # Neptune global database.

      struct GlobalClusterMember
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for each Neptune cluster.

        @[JSON::Field(key: "DBClusterArn")]
        getter db_cluster_arn : String?

        # Specifies whether the Neptune cluster is the primary cluster (that is, has read-write capability)
        # for the Neptune global database with which it is associated.

        @[JSON::Field(key: "IsWriter")]
        getter is_writer : Bool?

        # The Amazon Resource Name (ARN) for each read-only secondary cluster associated with the Neptune
        # global database.

        @[JSON::Field(key: "Readers")]
        getter readers : Array(String)?

        def initialize(
          @db_cluster_arn : String? = nil,
          @is_writer : Bool? = nil,
          @readers : Array(String)? = nil
        )
        end
      end

      # The GlobalClusterIdentifier doesn't refer to an existing global database cluster.

      struct GlobalClusterNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The number of global database clusters for this account is already at the maximum allowed.

      struct GlobalClusterQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end


      struct GlobalClustersMessage
        include JSON::Serializable

        # The list of global clusters and instances returned by this request.

        @[JSON::Field(key: "GlobalClusters")]
        getter global_clusters : Array(Types::GlobalCluster)?

        # A pagination token. If this parameter is returned in the response, more records are available, which
        # can be retrieved by one or more additional calls to DescribeGlobalClusters .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @global_clusters : Array(Types::GlobalCluster)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Request would result in user exceeding the allowed number of DB instances.

      struct InstanceQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The DB cluster does not have enough capacity for the current operation.

      struct InsufficientDBClusterCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # Specified DB instance class is not available in the specified Availability Zone.

      struct InsufficientDBInstanceCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # There is insufficient storage available for the current action. You may be able to resolve this
      # error by updating your subnet group to use different Availability Zones that have more storage
      # available.

      struct InsufficientStorageClusterCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation cannot be performed on the endpoint while the endpoint is in this state.

      struct InvalidDBClusterEndpointStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The supplied value is not a valid DB cluster snapshot state.

      struct InvalidDBClusterSnapshotStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The DB cluster is not in a valid state.

      struct InvalidDBClusterStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified DB instance is not in the available state.

      struct InvalidDBInstanceStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The DB parameter group is in use or is in an invalid state. If you are attempting to delete the
      # parameter group, you cannot delete it when the parameter group is in this state.

      struct InvalidDBParameterGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The state of the DB security group does not allow deletion.

      struct InvalidDBSecurityGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The state of the DB snapshot does not allow deletion.

      struct InvalidDBSnapshotStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The DB subnet group cannot be deleted because it is in use.

      struct InvalidDBSubnetGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The DB subnet is not in the available state.

      struct InvalidDBSubnetStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The event subscription is in an invalid state.

      struct InvalidEventSubscriptionStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The global cluster is in an invalid state and can't perform the requested operation.

      struct InvalidGlobalClusterStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # Cannot restore from vpc backup to non-vpc DB instance.

      struct InvalidRestoreFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested subnet is invalid, or multiple subnets were requested that are not all in a common
      # VPC.

      struct InvalidSubnet
        include JSON::Serializable

        def initialize
        end
      end

      # DB subnet group does not cover all Availability Zones after it is created because users' change.

      struct InvalidVPCNetworkStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # Error accessing KMS key.

      struct KMSKeyNotAccessibleFault
        include JSON::Serializable

        def initialize
        end
      end


      struct ListTagsForResourceMessage
        include JSON::Serializable

        # The Amazon Neptune resource with tags to be listed. This value is an Amazon Resource Name (ARN). For
        # information about creating an ARN, see Constructing an Amazon Resource Name (ARN) .

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


      struct ModifyDBClusterEndpointMessage
        include JSON::Serializable

        # The identifier of the endpoint to modify. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterEndpointIdentifier")]
        getter db_cluster_endpoint_identifier : String

        # The type of the endpoint. One of: READER , WRITER , ANY .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible
        # instances are reachable through the custom endpoint. Only relevant if the list of static members is
        # empty.

        @[JSON::Field(key: "ExcludedMembers")]
        getter excluded_members : Array(String)?

        # List of DB instance identifiers that are part of the custom endpoint group.

        @[JSON::Field(key: "StaticMembers")]
        getter static_members : Array(String)?

        def initialize(
          @db_cluster_endpoint_identifier : String,
          @endpoint_type : String? = nil,
          @excluded_members : Array(String)? = nil,
          @static_members : Array(String)? = nil
        )
        end
      end

      # This data type represents the information you need to connect to an Amazon Neptune DB cluster. This
      # data type is used as a response element in the following actions: CreateDBClusterEndpoint
      # DescribeDBClusterEndpoints ModifyDBClusterEndpoint DeleteDBClusterEndpoint For the data structure
      # that represents Amazon RDS DB instance endpoints, see Endpoint .

      struct ModifyDBClusterEndpointOutput
        include JSON::Serializable

        # The type associated with a custom endpoint. One of: READER , WRITER , ANY .

        @[JSON::Field(key: "CustomEndpointType")]
        getter custom_endpoint_type : String?

        # The Amazon Resource Name (ARN) for the endpoint.

        @[JSON::Field(key: "DBClusterEndpointArn")]
        getter db_cluster_endpoint_arn : String?

        # The identifier associated with the endpoint. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "DBClusterEndpointIdentifier")]
        getter db_cluster_endpoint_identifier : String?

        # A unique system-generated identifier for an endpoint. It remains the same for the whole life of the
        # endpoint.

        @[JSON::Field(key: "DBClusterEndpointResourceIdentifier")]
        getter db_cluster_endpoint_resource_identifier : String?

        # The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored
        # as a lowercase string.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The DNS address of the endpoint.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The type of the endpoint. One of: READER , WRITER , CUSTOM .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible
        # instances are reachable through the custom endpoint. Only relevant if the list of static members is
        # empty.

        @[JSON::Field(key: "ExcludedMembers")]
        getter excluded_members : Array(String)?

        # List of DB instance identifiers that are part of the custom endpoint group.

        @[JSON::Field(key: "StaticMembers")]
        getter static_members : Array(String)?

        # The current status of the endpoint. One of: creating , available , deleting , inactive , modifying .
        # The inactive state applies to an endpoint that cannot be used for a certain kind of cluster, such as
        # a writer endpoint for a read-only secondary cluster in a global database.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @custom_endpoint_type : String? = nil,
          @db_cluster_endpoint_arn : String? = nil,
          @db_cluster_endpoint_identifier : String? = nil,
          @db_cluster_endpoint_resource_identifier : String? = nil,
          @db_cluster_identifier : String? = nil,
          @endpoint : String? = nil,
          @endpoint_type : String? = nil,
          @excluded_members : Array(String)? = nil,
          @static_members : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end


      struct ModifyDBClusterMessage
        include JSON::Serializable

        # The DB cluster identifier for the cluster being modified. This parameter is not case-sensitive.
        # Constraints: Must match the identifier of an existing DBCluster.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # A value that indicates whether upgrades between different major versions are allowed. Constraints:
        # You must set the allow-major-version-upgrade flag when providing an EngineVersion parameter that
        # uses a different major version than the DB cluster's current version.

        @[JSON::Field(key: "AllowMajorVersionUpgrade")]
        getter allow_major_version_upgrade : Bool?

        # A value that specifies whether the modifications in this request and any pending modifications are
        # asynchronously applied as soon as possible, regardless of the PreferredMaintenanceWindow setting for
        # the DB cluster. If this parameter is set to false , changes to the DB cluster are applied during the
        # next maintenance window. The ApplyImmediately parameter only affects NewDBClusterIdentifier values.
        # If you set the ApplyImmediately parameter value to false, then changes to NewDBClusterIdentifier
        # values are applied during the next maintenance window. All other changes are applied immediately,
        # regardless of the value of the ApplyImmediately parameter. Default: false

        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool?

        # The number of days for which automated backups are retained. You must specify a minimum value of 1.
        # Default: 1 Constraints: Must be a value from 1 to 35

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # The configuration setting for the log types to be enabled for export to CloudWatch Logs for a
        # specific DB cluster. See Using the CLI to publish Neptune audit logs to CloudWatch Logs .

        @[JSON::Field(key: "CloudwatchLogsExportConfiguration")]
        getter cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration?

        # If set to true , tags are copied to any snapshot of the DB cluster that is created.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # The name of the DB cluster parameter group to use for the DB cluster.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # The name of the DB parameter group to apply to all instances of the DB cluster. When you apply a
        # parameter group using DBInstanceParameterGroupName , parameter changes aren't applied during the
        # next maintenance window but instead are applied immediately. Default: The existing name setting
        # Constraints: The DB parameter group must be in the same DB parameter group family as the target DB
        # cluster version. The DBInstanceParameterGroupName parameter is only valid in combination with the
        # AllowMajorVersionUpgrade parameter.

        @[JSON::Field(key: "DBInstanceParameterGroupName")]
        getter db_instance_parameter_group_name : String?

        # A value that indicates whether the DB cluster has deletion protection enabled. The database can't be
        # deleted when deletion protection is enabled. By default, deletion protection is disabled.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # True to enable mapping of Amazon Identity and Access Management (IAM) accounts to database accounts,
        # and otherwise false. Default: false

        @[JSON::Field(key: "EnableIAMDatabaseAuthentication")]
        getter enable_iam_database_authentication : Bool?

        # The version number of the database engine to which you want to upgrade. Changing this parameter
        # results in an outage. The change is applied during the next maintenance window unless the
        # ApplyImmediately parameter is set to true. For a list of valid engine versions, see Engine Releases
        # for Amazon Neptune , or call DescribeDBEngineVersions .

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # The new DB cluster identifier for the DB cluster when renaming a DB cluster. This value is stored as
        # a lowercase string. Constraints: Must contain from 1 to 63 letters, numbers, or hyphens The first
        # character must be a letter Cannot end with a hyphen or contain two consecutive hyphens Example:
        # my-cluster2

        @[JSON::Field(key: "NewDBClusterIdentifier")]
        getter new_db_cluster_identifier : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "OptionGroupName")]
        getter option_group_name : String?

        # The port number on which the DB cluster accepts connections. Constraints: Value must be 1150-65535
        # Default: The same port as the original DB cluster.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The daily time range during which automated backups are created if automated backups are enabled,
        # using the BackupRetentionPeriod parameter. The default is a 30-minute window selected at random from
        # an 8-hour block of time for each Amazon Region. Constraints: Must be in the format hh24:mi-hh24:mi .
        # Must be in Universal Coordinated Time (UTC). Must not conflict with the preferred maintenance
        # window. Must be at least 30 minutes.

        @[JSON::Field(key: "PreferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format: ddd:hh24:mi-ddd:hh24:mi The default is a 30-minute window selected at random from an
        # 8-hour block of time for each Amazon Region, occurring on a random day of the week. Valid Days: Mon,
        # Tue, Wed, Thu, Fri, Sat, Sun. Constraints: Minimum 30-minute window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Contains the scaling configuration of a Neptune Serverless DB cluster. For more information, see
        # Using Amazon Neptune Serverless in the Amazon Neptune User Guide .

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration?

        # The storage type to associate with the DB cluster. Valid Values: standard – ( the default )
        # Configures cost-effective database storage for applications with moderate to small I/O usage. iopt1
        # – Enables I/O-Optimized storage that's designed to meet the needs of I/O-intensive graph workloads
        # that require predictable pricing with low I/O latency and consistent I/O throughput. Neptune
        # I/O-Optimized storage is only available starting with engine release 1.3.0.0.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # A list of VPC security groups that the DB cluster will belong to.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_cluster_identifier : String,
          @allow_major_version_upgrade : Bool? = nil,
          @apply_immediately : Bool? = nil,
          @backup_retention_period : Int32? = nil,
          @cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @db_cluster_parameter_group_name : String? = nil,
          @db_instance_parameter_group_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @enable_iam_database_authentication : Bool? = nil,
          @engine_version : String? = nil,
          @master_user_password : String? = nil,
          @new_db_cluster_identifier : String? = nil,
          @option_group_name : String? = nil,
          @port : Int32? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
          @storage_type : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct ModifyDBClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the DB cluster parameter group to modify.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String

        # A list of parameters in the DB cluster parameter group to modify.

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


      struct ModifyDBClusterSnapshotAttributeMessage
        include JSON::Serializable

        # The name of the DB cluster snapshot attribute to modify. To manage authorization for other Amazon
        # accounts to copy or restore a manual DB cluster snapshot, set this value to restore .

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The identifier for the DB cluster snapshot to modify the attributes for.

        @[JSON::Field(key: "DBClusterSnapshotIdentifier")]
        getter db_cluster_snapshot_identifier : String

        # A list of DB cluster snapshot attributes to add to the attribute specified by AttributeName . To
        # authorize other Amazon accounts to copy or restore a manual DB cluster snapshot, set this list to
        # include one or more Amazon account IDs, or all to make the manual DB cluster snapshot restorable by
        # any Amazon account. Do not add the all value for any manual DB cluster snapshots that contain
        # private information that you don't want available to all Amazon accounts.

        @[JSON::Field(key: "ValuesToAdd")]
        getter values_to_add : Array(String)?

        # A list of DB cluster snapshot attributes to remove from the attribute specified by AttributeName .
        # To remove authorization for other Amazon accounts to copy or restore a manual DB cluster snapshot,
        # set this list to include one or more Amazon account identifiers, or all to remove authorization for
        # any Amazon account to copy or restore the DB cluster snapshot. If you specify all , an Amazon
        # account whose account ID is explicitly added to the restore attribute can still copy or restore a
        # manual DB cluster snapshot.

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


      struct ModifyDBInstanceMessage
        include JSON::Serializable

        # The DB instance identifier. This value is stored as a lowercase string. Constraints: Must match the
        # identifier of an existing DBInstance.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String

        # Not supported by Neptune.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # Indicates that major version upgrades are allowed. Changing this parameter doesn't result in an
        # outage and the change is asynchronously applied as soon as possible.

        @[JSON::Field(key: "AllowMajorVersionUpgrade")]
        getter allow_major_version_upgrade : Bool?

        # Specifies whether the modifications in this request and any pending modifications are asynchronously
        # applied as soon as possible, regardless of the PreferredMaintenanceWindow setting for the DB
        # instance. If this parameter is set to false , changes to the DB instance are applied during the next
        # maintenance window. Some parameter changes can cause an outage and are applied on the next call to
        # RebootDBInstance , or the next failure reboot. Default: false

        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool?

        # Indicates that minor version upgrades are applied automatically to the DB instance during the
        # maintenance window. Changing this parameter doesn't result in an outage except in the following case
        # and the change is asynchronously applied as soon as possible. An outage will result if this
        # parameter is set to true during the maintenance window, and a newer minor version is available, and
        # Neptune has enabled auto patching for that engine version.

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Not applicable. The retention period for automated backups is managed by the DB cluster. For more
        # information, see ModifyDBCluster . Default: Uses existing setting

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # Indicates the certificate that needs to be associated with the instance.

        @[JSON::Field(key: "CACertificateIdentifier")]
        getter ca_certificate_identifier : String?

        # The configuration setting for the log types to be enabled for export to CloudWatch Logs for a
        # specific DB instance or DB cluster.

        @[JSON::Field(key: "CloudwatchLogsExportConfiguration")]
        getter cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration?

        # True to copy all tags from the DB instance to snapshots of the DB instance, and otherwise false. The
        # default is false.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # The new compute and memory capacity of the DB instance, for example, db.m4.large . Not all DB
        # instance classes are available in all Amazon Regions. If you modify the DB instance class, an outage
        # occurs during the change. The change is applied during the next maintenance window, unless
        # ApplyImmediately is specified as true for this request. Default: Uses existing setting

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # The name of the DB parameter group to apply to the DB instance. Changing this setting doesn't result
        # in an outage. The parameter group name itself is changed immediately, but the actual parameter
        # changes are not applied until you reboot the instance without failover. The db instance will NOT be
        # rebooted automatically and the parameter changes will NOT be applied during the next maintenance
        # window. Default: Uses existing setting Constraints: The DB parameter group must be in the same DB
        # parameter group family as this DB instance.

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String?

        # The port number on which the database accepts connections. The value of the DBPortNumber parameter
        # must not match any of the port values specified for options in the option group for the DB instance.
        # Your database will restart when you change the DBPortNumber value regardless of the value of the
        # ApplyImmediately parameter. Default: 8182

        @[JSON::Field(key: "DBPortNumber")]
        getter db_port_number : Int32?

        # A list of DB security groups to authorize on this DB instance. Changing this setting doesn't result
        # in an outage and the change is asynchronously applied as soon as possible. Constraints: If supplied,
        # must match existing DBSecurityGroups.

        @[JSON::Field(key: "DBSecurityGroups")]
        getter db_security_groups : Array(String)?

        # The new DB subnet group for the DB instance. You can use this parameter to move your DB instance to
        # a different VPC. Changing the subnet group causes an outage during the change. The change is applied
        # during the next maintenance window, unless you specify true for the ApplyImmediately parameter.
        # Constraints: If supplied, must match the name of an existing DBSubnetGroup. Example: mySubnetGroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # A value that indicates whether the DB instance has deletion protection enabled. The database can't
        # be deleted when deletion protection is enabled. By default, deletion protection is disabled. See
        # Deleting a DB Instance .

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # Not supported.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # Not supported

        @[JSON::Field(key: "DomainIAMRoleName")]
        getter domain_iam_role_name : String?

        # True to enable mapping of Amazon Identity and Access Management (IAM) accounts to database accounts,
        # and otherwise false. You can enable IAM database authentication for the following database engines
        # Not applicable. Mapping Amazon IAM accounts to database accounts is managed by the DB cluster. For
        # more information, see ModifyDBCluster . Default: false

        @[JSON::Field(key: "EnableIAMDatabaseAuthentication")]
        getter enable_iam_database_authentication : Bool?

        # (Not supported by Neptune)

        @[JSON::Field(key: "EnablePerformanceInsights")]
        getter enable_performance_insights : Bool?

        # The version number of the database engine to upgrade to. Currently, setting this parameter has no
        # effect. To upgrade your database engine to the most recent release, use the
        # ApplyPendingMaintenanceAction API.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The new Provisioned IOPS (I/O operations per second) value for the instance. Changing this setting
        # doesn't result in an outage and the change is applied during the next maintenance window unless the
        # ApplyImmediately parameter is set to true for this request. Default: Uses existing setting

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # Not supported by Neptune.

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB
        # instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. If
        # MonitoringRoleArn is specified, then you must also set MonitoringInterval to a value other than 0.
        # Valid Values: 0, 1, 5, 10, 15, 30, 60

        @[JSON::Field(key: "MonitoringInterval")]
        getter monitoring_interval : Int32?

        # The ARN for the IAM role that permits Neptune to send enhanced monitoring metrics to Amazon
        # CloudWatch Logs. For example, arn:aws:iam:123456789012:role/emaccess . If MonitoringInterval is set
        # to a value other than 0, then you must supply a MonitoringRoleArn value.

        @[JSON::Field(key: "MonitoringRoleArn")]
        getter monitoring_role_arn : String?

        # Specifies if the DB instance is a Multi-AZ deployment. Changing this parameter doesn't result in an
        # outage and the change is applied during the next maintenance window unless the ApplyImmediately
        # parameter is set to true for this request.

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The new DB instance identifier for the DB instance when renaming a DB instance. When you change the
        # DB instance identifier, an instance reboot will occur immediately if you set Apply Immediately to
        # true, or will occur during the next maintenance window if Apply Immediately to false. This value is
        # stored as a lowercase string. Constraints: Must contain from 1 to 63 letters, numbers, or hyphens.
        # The first character must be a letter. Cannot end with a hyphen or contain two consecutive hyphens.
        # Example: mydbinstance

        @[JSON::Field(key: "NewDBInstanceIdentifier")]
        getter new_db_instance_identifier : String?

        # (Not supported by Neptune)

        @[JSON::Field(key: "OptionGroupName")]
        getter option_group_name : String?

        # (Not supported by Neptune)

        @[JSON::Field(key: "PerformanceInsightsKMSKeyId")]
        getter performance_insights_kms_key_id : String?

        # The daily time range during which automated backups are created if automated backups are enabled.
        # Not applicable. The daily time range for creating automated backups is managed by the DB cluster.
        # For more information, see ModifyDBCluster . Constraints: Must be in the format hh24:mi-hh24:mi Must
        # be in Universal Time Coordinated (UTC) Must not conflict with the preferred maintenance window Must
        # be at least 30 minutes

        @[JSON::Field(key: "PreferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range (in UTC) during which system maintenance can occur, which might result in an
        # outage. Changing this parameter doesn't result in an outage, except in the following situation, and
        # the change is asynchronously applied as soon as possible. If there are pending actions that cause a
        # reboot, and the maintenance window is changed to include the current time, then changing this
        # parameter will cause a reboot of the DB instance. If moving this window to the current time, there
        # must be at least 30 minutes between the current time and end of the window to ensure pending changes
        # are applied. Default: Uses existing setting Format: ddd:hh24:mi-ddd:hh24:mi Valid Days: Mon | Tue |
        # Wed | Thu | Fri | Sat | Sun Constraints: Must be at least 30 minutes

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # A value that specifies the order in which a Read Replica is promoted to the primary instance after a
        # failure of the existing primary instance. Default: 1 Valid Values: 0 - 15

        @[JSON::Field(key: "PromotionTier")]
        getter promotion_tier : Int32?

        # Indicates whether the DB instance is publicly accessible. When the DB instance is publicly
        # accessible and you connect from outside of the DB instance's virtual private cloud (VPC), its Domain
        # Name System (DNS) endpoint resolves to the public IP address. When you connect from within the same
        # VPC as the DB instance, the endpoint resolves to the private IP address. Access to the DB instance
        # is ultimately controlled by the security group it uses. That public access isn't permitted if the
        # security group assigned to the DB cluster doesn't permit it. When the DB instance isn't publicly
        # accessible, it is an internal DB instance with a DNS name that resolves to a private IP address.

        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # Not applicable. In Neptune the storage type is managed at the DB Cluster level.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The ARN from the key store with which to associate the instance for TDE encryption.

        @[JSON::Field(key: "TdeCredentialArn")]
        getter tde_credential_arn : String?

        # The password for the given ARN from the key store in order to access the device.

        @[JSON::Field(key: "TdeCredentialPassword")]
        getter tde_credential_password : String?

        # A list of EC2 VPC security groups to authorize on this DB instance. This change is asynchronously
        # applied as soon as possible. Not applicable. The associated list of EC2 VPC security groups is
        # managed by the DB cluster. For more information, see ModifyDBCluster . Constraints: If supplied,
        # must match existing VpcSecurityGroupIds.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_instance_identifier : String,
          @allocated_storage : Int32? = nil,
          @allow_major_version_upgrade : Bool? = nil,
          @apply_immediately : Bool? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @backup_retention_period : Int32? = nil,
          @ca_certificate_identifier : String? = nil,
          @cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @db_instance_class : String? = nil,
          @db_parameter_group_name : String? = nil,
          @db_port_number : Int32? = nil,
          @db_security_groups : Array(String)? = nil,
          @db_subnet_group_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @domain : String? = nil,
          @domain_iam_role_name : String? = nil,
          @enable_iam_database_authentication : Bool? = nil,
          @enable_performance_insights : Bool? = nil,
          @engine_version : String? = nil,
          @iops : Int32? = nil,
          @license_model : String? = nil,
          @master_user_password : String? = nil,
          @monitoring_interval : Int32? = nil,
          @monitoring_role_arn : String? = nil,
          @multi_az : Bool? = nil,
          @new_db_instance_identifier : String? = nil,
          @option_group_name : String? = nil,
          @performance_insights_kms_key_id : String? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @promotion_tier : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @storage_type : String? = nil,
          @tde_credential_arn : String? = nil,
          @tde_credential_password : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
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


      struct ModifyDBParameterGroupMessage
        include JSON::Serializable

        # The name of the DB parameter group. Constraints: If supplied, must match the name of an existing
        # DBParameterGroup.

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String

        # An array of parameter names, values, and the apply method for the parameter update. At least one
        # parameter name, value, and apply method must be supplied; subsequent arguments are optional. A
        # maximum of 20 parameters can be modified in a single request. Valid Values (for the application
        # method): immediate | pending-reboot You can use the immediate value with dynamic parameters only.
        # You can use the pending-reboot value for both dynamic and static parameters, and changes are applied
        # when you reboot the DB instance without failover.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)

        def initialize(
          @db_parameter_group_name : String,
          @parameters : Array(Types::Parameter)
        )
        end
      end


      struct ModifyDBSubnetGroupMessage
        include JSON::Serializable

        # The name for the DB subnet group. This value is stored as a lowercase string. You can't modify the
        # default subnet group. Constraints: Must match the name of an existing DBSubnetGroup. Must not be
        # default. Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String

        # The EC2 subnet IDs for the DB subnet group.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The description for the DB subnet group.

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


      struct ModifyEventSubscriptionMessage
        include JSON::Serializable

        # The name of the event notification subscription.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        # A Boolean value; set to true to activate the subscription.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A list of event categories for a SourceType that you want to subscribe to. You can see a list of the
        # categories for a given SourceType by using the DescribeEventCategories action.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN is created
        # by Amazon SNS when you create a topic and subscribe to it.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The type of source that is generating the events. For example, if you want to be notified of events
        # generated by a DB instance, you would set this parameter to db-instance. if this value is not
        # specified, all events are returned. Valid values: db-instance | db-parameter-group |
        # db-security-group | db-snapshot

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


      struct ModifyGlobalClusterMessage
        include JSON::Serializable

        # The DB cluster identifier for the global cluster being modified. This parameter is not
        # case-sensitive. Constraints: Must match the identifier of an existing global database cluster.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        # A value that indicates whether major version upgrades are allowed. Constraints: You must allow major
        # version upgrades if you specify a value for the EngineVersion parameter that is a different major
        # version than the DB cluster's current version. If you upgrade the major version of a global
        # database, the cluster and DB instance parameter groups are set to the default parameter groups for
        # the new version, so you will need to apply any custom parameter groups after completing the upgrade.

        @[JSON::Field(key: "AllowMajorVersionUpgrade")]
        getter allow_major_version_upgrade : Bool?

        # Indicates whether the global database has deletion protection enabled. The global database cannot be
        # deleted when deletion protection is enabled.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The version number of the database engine to which you want to upgrade. Changing this parameter will
        # result in an outage. The change is applied during the next maintenance window unless
        # ApplyImmediately is enabled. To list all of the available Neptune engine versions, use the following
        # command:

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # A new cluster identifier to assign to the global database. This value is stored as a lowercase
        # string. Constraints: Must contain from 1 to 63 letters, numbers, or hyphens. The first character
        # must be a letter. Can't end with a hyphen or contain two consecutive hyphens Example: my-cluster2

        @[JSON::Field(key: "NewGlobalClusterIdentifier")]
        getter new_global_cluster_identifier : String?

        def initialize(
          @global_cluster_identifier : String,
          @allow_major_version_upgrade : Bool? = nil,
          @deletion_protection : Bool? = nil,
          @engine_version : String? = nil,
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

      # Not supported by Neptune.

      struct OptionGroupMembership
        include JSON::Serializable

        # Not supported by Neptune.

        @[JSON::Field(key: "OptionGroupName")]
        getter option_group_name : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @option_group_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The designated option group could not be found.

      struct OptionGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains a list of available options for a DB instance. This data type is used as a response element
      # in the DescribeOrderableDBInstanceOptions action.

      struct OrderableDBInstanceOption
        include JSON::Serializable

        # A list of Availability Zones for a DB instance.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(Types::AvailabilityZone)?

        # The DB instance class for a DB instance.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # The engine type of a DB instance.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The engine version of a DB instance.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The license model for a DB instance.

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # Maximum total provisioned IOPS for a DB instance.

        @[JSON::Field(key: "MaxIopsPerDbInstance")]
        getter max_iops_per_db_instance : Int32?

        # Maximum provisioned IOPS per GiB for a DB instance.

        @[JSON::Field(key: "MaxIopsPerGib")]
        getter max_iops_per_gib : Float64?

        # Maximum storage size for a DB instance.

        @[JSON::Field(key: "MaxStorageSize")]
        getter max_storage_size : Int32?

        # Minimum total provisioned IOPS for a DB instance.

        @[JSON::Field(key: "MinIopsPerDbInstance")]
        getter min_iops_per_db_instance : Int32?

        # Minimum provisioned IOPS per GiB for a DB instance.

        @[JSON::Field(key: "MinIopsPerGib")]
        getter min_iops_per_gib : Float64?

        # Minimum storage size for a DB instance.

        @[JSON::Field(key: "MinStorageSize")]
        getter min_storage_size : Int32?

        # Indicates whether a DB instance is Multi-AZ capable.

        @[JSON::Field(key: "MultiAZCapable")]
        getter multi_az_capable : Bool?

        # Indicates whether a DB instance can have a Read Replica.

        @[JSON::Field(key: "ReadReplicaCapable")]
        getter read_replica_capable : Bool?

        # Not applicable. In Neptune the storage type is managed at the DB Cluster level.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # Indicates whether a DB instance supports Enhanced Monitoring at intervals from 1 to 60 seconds.

        @[JSON::Field(key: "SupportsEnhancedMonitoring")]
        getter supports_enhanced_monitoring : Bool?

        # A value that indicates whether you can use Neptune global databases with a specific combination of
        # other DB engine attributes.

        @[JSON::Field(key: "SupportsGlobalDatabases")]
        getter supports_global_databases : Bool?

        # Indicates whether a DB instance supports IAM database authentication.

        @[JSON::Field(key: "SupportsIAMDatabaseAuthentication")]
        getter supports_iam_database_authentication : Bool?

        # Indicates whether a DB instance supports provisioned IOPS.

        @[JSON::Field(key: "SupportsIops")]
        getter supports_iops : Bool?

        # (Not supported by Neptune)

        @[JSON::Field(key: "SupportsPerformanceInsights")]
        getter supports_performance_insights : Bool?

        # Indicates whether a DB instance supports encrypted storage.

        @[JSON::Field(key: "SupportsStorageEncryption")]
        getter supports_storage_encryption : Bool?

        # Indicates whether a DB instance is in a VPC.

        @[JSON::Field(key: "Vpc")]
        getter vpc : Bool?

        def initialize(
          @availability_zones : Array(Types::AvailabilityZone)? = nil,
          @db_instance_class : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @license_model : String? = nil,
          @max_iops_per_db_instance : Int32? = nil,
          @max_iops_per_gib : Float64? = nil,
          @max_storage_size : Int32? = nil,
          @min_iops_per_db_instance : Int32? = nil,
          @min_iops_per_gib : Float64? = nil,
          @min_storage_size : Int32? = nil,
          @multi_az_capable : Bool? = nil,
          @read_replica_capable : Bool? = nil,
          @storage_type : String? = nil,
          @supports_enhanced_monitoring : Bool? = nil,
          @supports_global_databases : Bool? = nil,
          @supports_iam_database_authentication : Bool? = nil,
          @supports_iops : Bool? = nil,
          @supports_performance_insights : Bool? = nil,
          @supports_storage_encryption : Bool? = nil,
          @vpc : Bool? = nil
        )
        end
      end


      struct OrderableDBInstanceOptionsMessage
        include JSON::Serializable

        # An optional pagination token provided by a previous OrderableDBInstanceOptions request. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # An OrderableDBInstanceOption structure containing information about orderable options for the DB
        # instance.

        @[JSON::Field(key: "OrderableDBInstanceOptions")]
        getter orderable_db_instance_options : Array(Types::OrderableDBInstanceOption)?

        def initialize(
          @marker : String? = nil,
          @orderable_db_instance_options : Array(Types::OrderableDBInstanceOption)? = nil
        )
        end
      end

      # Specifies a parameter.

      struct Parameter
        include JSON::Serializable

        # Specifies the valid range of values for the parameter.

        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : String?

        # Indicates when to apply parameter updates.

        @[JSON::Field(key: "ApplyMethod")]
        getter apply_method : String?

        # Specifies the engine specific parameters type.

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

        # Specifies the value of the parameter.

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

      # A list of the log types whose configuration is still pending. In other words, these log types are in
      # the process of being activated or deactivated. Valid log types are: audit (to publish audit logs)
      # and slowquery (to publish slow-query logs). See Publishing Neptune logs to Amazon CloudWatch logs .

      struct PendingCloudwatchLogsExports
        include JSON::Serializable

        # Log types that are in the process of being enabled. After they are enabled, these log types are
        # exported to CloudWatch Logs.

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

        # The effective date when the pending maintenance action is applied to the resource. This date takes
        # into account opt-in requests received from the ApplyPendingMaintenanceAction API, the
        # AutoAppliedAfterDate , and the ForcedApplyDate . This value is blank if an opt-in request has not
        # been received and nothing has been specified as AutoAppliedAfterDate or ForcedApplyDate .

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


      struct PendingMaintenanceActionsMessage
        include JSON::Serializable

        # An optional pagination token provided by a previous DescribePendingMaintenanceActions request. If
        # this parameter is specified, the response includes only records beyond the marker, up to a number of
        # records specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of the pending maintenance actions for the resource.

        @[JSON::Field(key: "PendingMaintenanceActions")]
        getter pending_maintenance_actions : Array(Types::ResourcePendingMaintenanceActions)?

        def initialize(
          @marker : String? = nil,
          @pending_maintenance_actions : Array(Types::ResourcePendingMaintenanceActions)? = nil
        )
        end
      end

      # This data type is used as a response element in the ModifyDBInstance action.

      struct PendingModifiedValues
        include JSON::Serializable

        # Contains the new AllocatedStorage size for the DB instance that will be applied or is currently
        # being applied.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # Specifies the pending number of days for which automated backups are retained.

        @[JSON::Field(key: "BackupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # Specifies the identifier of the CA certificate for the DB instance.

        @[JSON::Field(key: "CACertificateIdentifier")]
        getter ca_certificate_identifier : String?

        # Contains the new DBInstanceClass for the DB instance that will be applied or is currently being
        # applied.

        @[JSON::Field(key: "DBInstanceClass")]
        getter db_instance_class : String?

        # Contains the new DBInstanceIdentifier for the DB instance that will be applied or is currently being
        # applied.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String?

        # The new DB subnet group for the DB instance.

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # Indicates the database engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Specifies the new Provisioned IOPS value for the DB instance that will be applied or is currently
        # being applied.

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # Not supported by Neptune.

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # Not supported by Neptune.

        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        # Indicates that the Single-AZ DB instance is to change to a Multi-AZ deployment.

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # This PendingCloudwatchLogsExports structure specifies pending changes to which CloudWatch logs are
        # enabled and which are disabled.

        @[JSON::Field(key: "PendingCloudwatchLogsExports")]
        getter pending_cloudwatch_logs_exports : Types::PendingCloudwatchLogsExports?

        # Specifies the pending port for the DB instance.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Not applicable. In Neptune the storage type is managed at the DB Cluster level.

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


      struct PromoteReadReplicaDBClusterMessage
        include JSON::Serializable

        # Not supported.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        def initialize(
          @db_cluster_identifier : String
        )
        end
      end


      struct PromoteReadReplicaDBClusterResult
        include JSON::Serializable


        @[JSON::Field(key: "DBCluster")]
        getter db_cluster : Types::DBCluster?

        def initialize(
          @db_cluster : Types::DBCluster? = nil
        )
        end
      end

      # Provisioned IOPS not available in the specified Availability Zone.

      struct ProvisionedIopsNotAvailableInAZFault
        include JSON::Serializable

        def initialize
        end
      end

      # A range of integer values.

      struct Range
        include JSON::Serializable

        # The minimum value in the range.

        @[JSON::Field(key: "From")]
        getter from : Int32?

        # The step value for the range. For example, if you have a range of 5,000 to 10,000, with a step value
        # of 1,000, the valid values start at 5,000 and step up by 1,000. Even though 7,500 is within the
        # range, it isn't a valid value for the range. The valid values are 5,000, 6,000, 7,000, 8,000...

        @[JSON::Field(key: "Step")]
        getter step : Int32?

        # The maximum value in the range.

        @[JSON::Field(key: "To")]
        getter to : Int32?

        def initialize(
          @from : Int32? = nil,
          @step : Int32? = nil,
          @to : Int32? = nil
        )
        end
      end


      struct RebootDBInstanceMessage
        include JSON::Serializable

        # The DB instance identifier. This parameter is stored as a lowercase string. Constraints: Must match
        # the identifier of an existing DBInstance.

        @[JSON::Field(key: "DBInstanceIdentifier")]
        getter db_instance_identifier : String

        # When true , the reboot is conducted through a MultiAZ failover. Constraint: You can't specify true
        # if the instance is not configured for MultiAZ.

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


      struct RemoveFromGlobalClusterMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) identifying the cluster to be detached from the Neptune global
        # database cluster.

        @[JSON::Field(key: "DbClusterIdentifier")]
        getter db_cluster_identifier : String

        # The identifier of the Neptune global database from which to detach the specified Neptune DB cluster.

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


      struct RemoveRoleFromDBClusterMessage
        include JSON::Serializable

        # The name of the DB cluster to disassociate the IAM role from.

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The Amazon Resource Name (ARN) of the IAM role to disassociate from the DB cluster, for example
        # arn:aws:iam::123456789012:role/NeptuneAccessRole .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The name of the feature for the DB cluster that the IAM role is to be disassociated from. For the
        # list of supported feature names, see DescribeDBEngineVersions .

        @[JSON::Field(key: "FeatureName")]
        getter feature_name : String?

        def initialize(
          @db_cluster_identifier : String,
          @role_arn : String,
          @feature_name : String? = nil
        )
        end
      end


      struct RemoveSourceIdentifierFromSubscriptionMessage
        include JSON::Serializable

        # The source identifier to be removed from the subscription, such as the DB instance identifier for a
        # DB instance or the name of a security group.

        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String

        # The name of the event notification subscription you want to remove a source identifier from.

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


      struct RemoveTagsFromResourceMessage
        include JSON::Serializable

        # The Amazon Neptune resource that the tags are removed from. This value is an Amazon Resource Name
        # (ARN). For information about creating an ARN, see Constructing an Amazon Resource Name (ARN) .

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


      struct ResetDBClusterParameterGroupMessage
        include JSON::Serializable

        # The name of the DB cluster parameter group to reset.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String

        # A list of parameter names in the DB cluster parameter group to reset to the default values. You
        # can't use this parameter if the ResetAllParameters parameter is set to true .

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # A value that is set to true to reset all parameters in the DB cluster parameter group to their
        # default values, and false otherwise. You can't use this parameter if there is a list of parameter
        # names specified for the Parameters parameter.

        @[JSON::Field(key: "ResetAllParameters")]
        getter reset_all_parameters : Bool?

        def initialize(
          @db_cluster_parameter_group_name : String,
          @parameters : Array(Types::Parameter)? = nil,
          @reset_all_parameters : Bool? = nil
        )
        end
      end


      struct ResetDBParameterGroupMessage
        include JSON::Serializable

        # The name of the DB parameter group. Constraints: Must match the name of an existing
        # DBParameterGroup.

        @[JSON::Field(key: "DBParameterGroupName")]
        getter db_parameter_group_name : String

        # To reset the entire DB parameter group, specify the DBParameterGroup name and ResetAllParameters
        # parameters. To reset specific parameters, provide a list of the following: ParameterName and
        # ApplyMethod . A maximum of 20 parameters can be modified in a single request. Valid Values (for
        # Apply method): pending-reboot

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # Specifies whether ( true ) or not ( false ) to reset all parameters in the DB parameter group to
        # default values. Default: true

        @[JSON::Field(key: "ResetAllParameters")]
        getter reset_all_parameters : Bool?

        def initialize(
          @db_parameter_group_name : String,
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

      # Describes the pending maintenance actions for a resource.

      struct ResourcePendingMaintenanceActions
        include JSON::Serializable

        # A list that provides details about the pending maintenance actions for the resource.

        @[JSON::Field(key: "PendingMaintenanceActionDetails")]
        getter pending_maintenance_action_details : Array(Types::PendingMaintenanceAction)?

        # The ARN of the resource that has pending maintenance actions.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        def initialize(
          @pending_maintenance_action_details : Array(Types::PendingMaintenanceAction)? = nil,
          @resource_identifier : String? = nil
        )
        end
      end


      struct RestoreDBClusterFromSnapshotMessage
        include JSON::Serializable

        # The name of the DB cluster to create from the DB snapshot or DB cluster snapshot. This parameter
        # isn't case-sensitive. Constraints: Must contain from 1 to 63 letters, numbers, or hyphens First
        # character must be a letter Cannot end with a hyphen or contain two consecutive hyphens Example:
        # my-snapshot-id

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The database engine to use for the new DB cluster. Default: The same as source Constraint: Must be
        # compatible with the engine of the source

        @[JSON::Field(key: "Engine")]
        getter engine : String

        # The identifier for the DB snapshot or DB cluster snapshot to restore from. You can use either the
        # name or the Amazon Resource Name (ARN) to specify a DB cluster snapshot. However, you can use only
        # the ARN to specify a DB snapshot. Constraints: Must match the identifier of an existing Snapshot.

        @[JSON::Field(key: "SnapshotIdentifier")]
        getter snapshot_identifier : String

        # Provides the list of EC2 Availability Zones that instances in the restored DB cluster can be created
        # in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # If set to true , tags are copied to any snapshot of the restored DB cluster that is created.

        @[JSON::Field(key: "CopyTagsToSnapshot")]
        getter copy_tags_to_snapshot : Bool?

        # The name of the DB cluster parameter group to associate with the new DB cluster. Constraints: If
        # supplied, must match the name of an existing DBClusterParameterGroup.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # The name of the DB subnet group to use for the new DB cluster. Constraints: If supplied, must match
        # the name of an existing DBSubnetGroup. Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # Not supported.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # A value that indicates whether the DB cluster has deletion protection enabled. The database can't be
        # deleted when deletion protection is enabled. By default, deletion protection is disabled.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The list of logs that the restored DB cluster is to export to Amazon CloudWatch Logs.

        @[JSON::Field(key: "EnableCloudwatchLogsExports")]
        getter enable_cloudwatch_logs_exports : Array(String)?

        # True to enable mapping of Amazon Identity and Access Management (IAM) accounts to database accounts,
        # and otherwise false. Default: false

        @[JSON::Field(key: "EnableIAMDatabaseAuthentication")]
        getter enable_iam_database_authentication : Bool?

        # The version of the database engine to use for the new DB cluster.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The Amazon KMS key identifier to use when restoring an encrypted DB cluster from a DB snapshot or DB
        # cluster snapshot. The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption
        # key. If you are restoring a DB cluster with the same Amazon account that owns the KMS encryption key
        # used to encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the
        # KMS encryption key. If you do not specify a value for the KmsKeyId parameter, then the following
        # will occur: If the DB snapshot or DB cluster snapshot in SnapshotIdentifier is encrypted, then the
        # restored DB cluster is encrypted using the KMS key that was used to encrypt the DB snapshot or DB
        # cluster snapshot. If the DB snapshot or DB cluster snapshot in SnapshotIdentifier is not encrypted,
        # then the restored DB cluster is not encrypted.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # (Not supported by Neptune)

        @[JSON::Field(key: "OptionGroupName")]
        getter option_group_name : String?

        # The port number on which the new DB cluster accepts connections. Constraints: Value must be
        # 1150-65535 Default: The same port as the original DB cluster.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Contains the scaling configuration of a Neptune Serverless DB cluster. For more information, see
        # Using Amazon Neptune Serverless in the Amazon Neptune User Guide .

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration?

        # Specifies the storage type to be associated with the DB cluster. Valid values: standard , iopt1
        # Default: standard

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The tags to be assigned to the restored DB cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A list of VPC security groups that the new DB cluster will belong to.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_cluster_identifier : String,
          @engine : String,
          @snapshot_identifier : String,
          @availability_zones : Array(String)? = nil,
          @copy_tags_to_snapshot : Bool? = nil,
          @db_cluster_parameter_group_name : String? = nil,
          @db_subnet_group_name : String? = nil,
          @database_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @enable_cloudwatch_logs_exports : Array(String)? = nil,
          @enable_iam_database_authentication : Bool? = nil,
          @engine_version : String? = nil,
          @kms_key_id : String? = nil,
          @option_group_name : String? = nil,
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


      struct RestoreDBClusterToPointInTimeMessage
        include JSON::Serializable

        # The name of the new DB cluster to be created. Constraints: Must contain from 1 to 63 letters,
        # numbers, or hyphens First character must be a letter Cannot end with a hyphen or contain two
        # consecutive hyphens

        @[JSON::Field(key: "DBClusterIdentifier")]
        getter db_cluster_identifier : String

        # The identifier of the source DB cluster from which to restore. Constraints: Must match the
        # identifier of an existing DBCluster.

        @[JSON::Field(key: "SourceDBClusterIdentifier")]
        getter source_db_cluster_identifier : String

        # The name of the DB cluster parameter group to associate with the new DB cluster. Constraints: If
        # supplied, must match the name of an existing DBClusterParameterGroup.

        @[JSON::Field(key: "DBClusterParameterGroupName")]
        getter db_cluster_parameter_group_name : String?

        # The DB subnet group name to use for the new DB cluster. Constraints: If supplied, must match the
        # name of an existing DBSubnetGroup. Example: mySubnetgroup

        @[JSON::Field(key: "DBSubnetGroupName")]
        getter db_subnet_group_name : String?

        # A value that indicates whether the DB cluster has deletion protection enabled. The database can't be
        # deleted when deletion protection is enabled. By default, deletion protection is disabled.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Bool?

        # The list of logs that the restored DB cluster is to export to CloudWatch Logs.

        @[JSON::Field(key: "EnableCloudwatchLogsExports")]
        getter enable_cloudwatch_logs_exports : Array(String)?

        # True to enable mapping of Amazon Identity and Access Management (IAM) accounts to database accounts,
        # and otherwise false. Default: false

        @[JSON::Field(key: "EnableIAMDatabaseAuthentication")]
        getter enable_iam_database_authentication : Bool?

        # The Amazon KMS key identifier to use when restoring an encrypted DB cluster from an encrypted DB
        # cluster. The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you
        # are restoring a DB cluster with the same Amazon account that owns the KMS encryption key used to
        # encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the KMS
        # encryption key. You can restore to a new DB cluster and encrypt the new DB cluster with a KMS key
        # that is different than the KMS key used to encrypt the source DB cluster. The new DB cluster is
        # encrypted with the KMS key identified by the KmsKeyId parameter. If you do not specify a value for
        # the KmsKeyId parameter, then the following will occur: If the DB cluster is encrypted, then the
        # restored DB cluster is encrypted using the KMS key that was used to encrypt the source DB cluster.
        # If the DB cluster is not encrypted, then the restored DB cluster is not encrypted. If
        # DBClusterIdentifier refers to a DB cluster that is not encrypted, then the restore request is
        # rejected.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # (Not supported by Neptune)

        @[JSON::Field(key: "OptionGroupName")]
        getter option_group_name : String?

        # The port number on which the new DB cluster accepts connections. Constraints: Value must be
        # 1150-65535 Default: The same port as the original DB cluster.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The date and time to restore the DB cluster to. Valid Values: Value must be a time in Universal
        # Coordinated Time (UTC) format Constraints: Must be before the latest restorable time for the DB
        # instance Must be specified if UseLatestRestorableTime parameter is not provided Cannot be specified
        # if UseLatestRestorableTime parameter is true Cannot be specified if RestoreType parameter is
        # copy-on-write Example: 2015-03-07T23:45:00Z

        @[JSON::Field(key: "RestoreToTime")]
        getter restore_to_time : Time?

        # The type of restore to be performed. You can specify one of the following values: full-copy - The
        # new DB cluster is restored as a full copy of the source DB cluster. copy-on-write - The new DB
        # cluster is restored as a clone of the source DB cluster. If you don't specify a RestoreType value,
        # then the new DB cluster is restored as a full copy of the source DB cluster.

        @[JSON::Field(key: "RestoreType")]
        getter restore_type : String?

        # Contains the scaling configuration of a Neptune Serverless DB cluster. For more information, see
        # Using Amazon Neptune Serverless in the Amazon Neptune User Guide .

        @[JSON::Field(key: "ServerlessV2ScalingConfiguration")]
        getter serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration?

        # Specifies the storage type to be associated with the DB cluster. Valid values: standard , iopt1
        # Default: standard

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # The tags to be applied to the restored DB cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A value that is set to true to restore the DB cluster to the latest restorable backup time, and
        # false otherwise. Default: false Constraints: Cannot be specified if RestoreToTime parameter is
        # provided.

        @[JSON::Field(key: "UseLatestRestorableTime")]
        getter use_latest_restorable_time : Bool?

        # A list of VPC security groups that the new DB cluster belongs to.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @db_cluster_identifier : String,
          @source_db_cluster_identifier : String,
          @db_cluster_parameter_group_name : String? = nil,
          @db_subnet_group_name : String? = nil,
          @deletion_protection : Bool? = nil,
          @enable_cloudwatch_logs_exports : Array(String)? = nil,
          @enable_iam_database_authentication : Bool? = nil,
          @kms_key_id : String? = nil,
          @option_group_name : String? = nil,
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

      # The SNS topic is invalid.

      struct SNSInvalidTopicFault
        include JSON::Serializable

        def initialize
        end
      end

      # There is no SNS authorization.

      struct SNSNoAuthorizationFault
        include JSON::Serializable

        def initialize
        end
      end

      # The ARN of the SNS topic could not be found.

      struct SNSTopicArnNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the scaling configuration of a Neptune Serverless DB cluster. For more information, see
      # Using Amazon Neptune Serverless in the Amazon Neptune User Guide .

      struct ServerlessV2ScalingConfiguration
        include JSON::Serializable

        # The maximum number of Neptune capacity units (NCUs) for a DB instance in a Neptune Serverless
        # cluster. You can specify NCU values in half-step increments, such as 40, 40.5, 41, and so on.

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Float64?

        # The minimum number of Neptune capacity units (NCUs) for a DB instance in a Neptune Serverless
        # cluster. You can specify NCU values in half-step increments, such as 8, 8.5, 9, and so on.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Float64?

        def initialize(
          @max_capacity : Float64? = nil,
          @min_capacity : Float64? = nil
        )
        end
      end

      # Shows the scaling configuration for a Neptune Serverless DB cluster. For more information, see Using
      # Amazon Neptune Serverless in the Amazon Neptune User Guide .

      struct ServerlessV2ScalingConfigurationInfo
        include JSON::Serializable

        # The maximum number of Neptune capacity units (NCUs) for a DB instance in a Neptune Serverless
        # cluster. You can specify NCU values in half-step increments, such as 40, 40.5, 41, and so on.

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Float64?

        # The minimum number of Neptune capacity units (NCUs) for a DB instance in a Neptune Serverless
        # cluster. You can specify NCU values in half-step increments, such as 8, 8.5, 9, and so on.

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

      # Request would result in user exceeding the allowed number of DB snapshots.

      struct SnapshotQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The source could not be found.

      struct SourceNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end


      struct StartDBClusterMessage
        include JSON::Serializable

        # The DB cluster identifier of the Neptune DB cluster to be started. This parameter is stored as a
        # lowercase string.

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

        # The DB cluster identifier of the Neptune DB cluster to be stopped. This parameter is stored as a
        # lowercase string.

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

      # Request would result in user exceeding the allowed amount of storage available across all DB
      # instances.

      struct StorageQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # StorageType specified cannot be associated with the DB Instance.

      struct StorageTypeNotSupportedFault
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies a subnet. This data type is used as a response element in the DescribeDBSubnetGroups
      # action.

      struct Subnet
        include JSON::Serializable

        # Specifies the EC2 Availability Zone that the subnet is in.

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

      # The DB subnet is already in use in the Availability Zone.

      struct SubnetAlreadyInUse
        include JSON::Serializable

        def initialize
        end
      end

      # This subscription already exists.

      struct SubscriptionAlreadyExistFault
        include JSON::Serializable

        def initialize
        end
      end

      # The designated subscription category could not be found.

      struct SubscriptionCategoryNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The designated subscription could not be found.

      struct SubscriptionNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end


      struct SwitchoverGlobalClusterMessage
        include JSON::Serializable

        # The identifier of the global database cluster to switch over. This parameter isn't case-sensitive.
        # Constraints: Must match the identifier of an existing global database cluster.

        @[JSON::Field(key: "GlobalClusterIdentifier")]
        getter global_cluster_identifier : String

        # The Amazon Resource Name (ARN) of the secondary Neptune DB cluster that you want to promote to
        # primary for the global database.

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

      # Metadata assigned to an Amazon Neptune resource consisting of a key-value pair.

      struct Tag
        include JSON::Serializable

        # A key is the required name of the tag. The string value can be from 1 to 128 Unicode characters in
        # length and can't be prefixed with aws: or rds: . The string can only contain the set of Unicode
        # letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex:
        # "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").

        @[JSON::Field(key: "Key")]
        getter key : String?

        # A value is the optional value of the tag. The string value can be from 1 to 256 Unicode characters
        # in length and can't be prefixed with aws: or rds: . The string can only contain the set of Unicode
        # letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex:
        # "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct TagListMessage
        include JSON::Serializable

        # List of tags returned by the ListTagsForResource operation.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # A time zone associated with a DBInstance .

      struct Timezone
        include JSON::Serializable

        # The name of the time zone.

        @[JSON::Field(key: "TimezoneName")]
        getter timezone_name : String?

        def initialize(
          @timezone_name : String? = nil
        )
        end
      end

      # The version of the database engine that a DB instance can be upgraded to.

      struct UpgradeTarget
        include JSON::Serializable

        # A value that indicates whether the target version is applied to any source DB instances that have
        # AutoMinorVersionUpgrade set to true.

        @[JSON::Field(key: "AutoUpgrade")]
        getter auto_upgrade : Bool?

        # The version of the database engine that a DB instance can be upgraded to.

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

        # A value that indicates whether you can use Neptune global databases with the target engine version.

        @[JSON::Field(key: "SupportsGlobalDatabases")]
        getter supports_global_databases : Bool?

        def initialize(
          @auto_upgrade : Bool? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @is_major_version_upgrade : Bool? = nil,
          @supports_global_databases : Bool? = nil
        )
        end
      end

      # Information about valid modifications that you can make to your DB instance. Contains the result of
      # a successful call to the DescribeValidDBInstanceModifications action. You can use this information
      # when you call ModifyDBInstance .

      struct ValidDBInstanceModificationsMessage
        include JSON::Serializable

        # Valid storage options for your DB instance.

        @[JSON::Field(key: "Storage")]
        getter storage : Array(Types::ValidStorageOptions)?

        def initialize(
          @storage : Array(Types::ValidStorageOptions)? = nil
        )
        end
      end

      # Not applicable. In Neptune the storage type is managed at the DB Cluster level.

      struct ValidStorageOptions
        include JSON::Serializable

        # Not applicable. In Neptune the storage type is managed at the DB Cluster level.

        @[JSON::Field(key: "IopsToStorageRatio")]
        getter iops_to_storage_ratio : Array(Types::DoubleRange)?

        # Not applicable. In Neptune the storage type is managed at the DB Cluster level.

        @[JSON::Field(key: "ProvisionedIops")]
        getter provisioned_iops : Array(Types::Range)?

        # Not applicable. In Neptune the storage type is managed at the DB Cluster level.

        @[JSON::Field(key: "StorageSize")]
        getter storage_size : Array(Types::Range)?

        # Not applicable. In Neptune the storage type is managed at the DB Cluster level.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        def initialize(
          @iops_to_storage_ratio : Array(Types::DoubleRange)? = nil,
          @provisioned_iops : Array(Types::Range)? = nil,
          @storage_size : Array(Types::Range)? = nil,
          @storage_type : String? = nil
        )
        end
      end

      # This data type is used as a response element for queries on VPC security group membership.

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
