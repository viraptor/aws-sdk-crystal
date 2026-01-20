require "json"

module AwsSdk
  module DocDBElastic
    module Types

      # An exception that occurs when there are not sufficient permissions to perform an action.

      struct AccessDeniedException
        include JSON::Serializable

        # An error message explaining why access was denied.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ApplyPendingMaintenanceActionInput
        include JSON::Serializable

        # The pending maintenance action to apply to the resource. Valid actions are: ENGINE_UPDATE
        # ENGINE_UPGRADE SECURITY_UPDATE OS_UPDATE MASTER_USER_PASSWORD_UPDATE

        @[JSON::Field(key: "applyAction")]
        getter apply_action : String

        # A value that specifies the type of opt-in request, or undoes an opt-in request. An opt-in request of
        # type IMMEDIATE can't be undone.

        @[JSON::Field(key: "optInType")]
        getter opt_in_type : String

        # The Amazon DocumentDB Amazon Resource Name (ARN) of the resource to which the pending maintenance
        # action applies.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A specific date to apply the pending maintenance action. Required if opt-in-type is APPLY_ON .
        # Format: yyyy/MM/dd HH:mm-yyyy/MM/dd HH:mm

        @[JSON::Field(key: "applyOn")]
        getter apply_on : String?

        def initialize(
          @apply_action : String,
          @opt_in_type : String,
          @resource_arn : String,
          @apply_on : String? = nil
        )
        end
      end


      struct ApplyPendingMaintenanceActionOutput
        include JSON::Serializable

        # The output of the pending maintenance action being applied.

        @[JSON::Field(key: "resourcePendingMaintenanceAction")]
        getter resource_pending_maintenance_action : Types::ResourcePendingMaintenanceAction

        def initialize(
          @resource_pending_maintenance_action : Types::ResourcePendingMaintenanceAction
        )
        end
      end

      # Returns information about a specific elastic cluster.

      struct Cluster
        include JSON::Serializable

        # The name of the elastic cluster administrator.

        @[JSON::Field(key: "adminUserName")]
        getter admin_user_name : String

        # The authentication type for the elastic cluster.

        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # The ARN identifier of the elastic cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The URL used to connect to the elastic cluster.

        @[JSON::Field(key: "clusterEndpoint")]
        getter cluster_endpoint : String

        # The name of the elastic cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # The time when the elastic cluster was created in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "createTime")]
        getter create_time : String

        # The KMS key identifier to use to encrypt the elastic cluster.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String

        # The weekly time range during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format : ddd:hh24:mi-ddd:hh24:mi

        @[JSON::Field(key: "preferredMaintenanceWindow")]
        getter preferred_maintenance_window : String

        # The number of vCPUs assigned to each elastic cluster shard. Maximum is 64. Allowed values are 2, 4,
        # 8, 16, 32, 64.

        @[JSON::Field(key: "shardCapacity")]
        getter shard_capacity : Int32

        # The number of shards assigned to the elastic cluster. Maximum is 32.

        @[JSON::Field(key: "shardCount")]
        getter shard_count : Int32

        # The status of the elastic cluster.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon EC2 subnet IDs for the elastic cluster.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # A list of EC2 VPC security groups associated with thie elastic cluster.

        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)

        # The number of days for which automatic snapshots are retained.

        @[JSON::Field(key: "backupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # The daily time range during which automated backups are created if automated backups are enabled, as
        # determined by backupRetentionPeriod .

        @[JSON::Field(key: "preferredBackupWindow")]
        getter preferred_backup_window : String?

        # The number of replica instances applying to all shards in the cluster. A shardInstanceCount value of
        # 1 means there is one writer instance, and any additional instances are replicas that can be used for
        # reads and to improve availability.

        @[JSON::Field(key: "shardInstanceCount")]
        getter shard_instance_count : Int32?

        # The total number of shards in the cluster.

        @[JSON::Field(key: "shards")]
        getter shards : Array(Types::Shard)?

        def initialize(
          @admin_user_name : String,
          @auth_type : String,
          @cluster_arn : String,
          @cluster_endpoint : String,
          @cluster_name : String,
          @create_time : String,
          @kms_key_id : String,
          @preferred_maintenance_window : String,
          @shard_capacity : Int32,
          @shard_count : Int32,
          @status : String,
          @subnet_ids : Array(String),
          @vpc_security_group_ids : Array(String),
          @backup_retention_period : Int32? = nil,
          @preferred_backup_window : String? = nil,
          @shard_instance_count : Int32? = nil,
          @shards : Array(Types::Shard)? = nil
        )
        end
      end

      # A list of Amazon DocumentDB elastic clusters.

      struct ClusterInList
        include JSON::Serializable

        # The ARN identifier of the elastic cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The name of the elastic cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # The status of the elastic cluster.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @cluster_arn : String,
          @cluster_name : String,
          @status : String
        )
        end
      end

      # Returns information about a specific elastic cluster snapshot.

      struct ClusterSnapshot
        include JSON::Serializable

        # The name of the elastic cluster administrator.

        @[JSON::Field(key: "adminUserName")]
        getter admin_user_name : String

        # The ARN identifier of the elastic cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The time when the elastic cluster was created in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "clusterCreationTime")]
        getter cluster_creation_time : String

        # The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are
        # creating a cluster using the same Amazon account that owns this KMS encryption key, you can use the
        # KMS key alias instead of the ARN as the KMS encryption key. If an encryption key is not specified
        # here, Amazon DocumentDB uses the default encryption key that KMS creates for your account. Your
        # account has a different default encryption key for each Amazon Region.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String

        # The ARN identifier of the elastic cluster snapshot.

        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String

        # The time when the elastic cluster snapshot was created in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "snapshotCreationTime")]
        getter snapshot_creation_time : String

        # The name of the elastic cluster snapshot.

        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String

        # The status of the elastic cluster snapshot.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon EC2 subnet IDs for the elastic cluster.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # A list of EC2 VPC security groups to associate with the elastic cluster.

        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)

        # The type of cluster snapshots to be returned. You can specify one of the following values: automated
        # - Return all cluster snapshots that Amazon DocumentDB has automatically created for your Amazon Web
        # Services account. manual - Return all cluster snapshots that you have manually created for your
        # Amazon Web Services account.

        @[JSON::Field(key: "snapshotType")]
        getter snapshot_type : String?

        def initialize(
          @admin_user_name : String,
          @cluster_arn : String,
          @cluster_creation_time : String,
          @kms_key_id : String,
          @snapshot_arn : String,
          @snapshot_creation_time : String,
          @snapshot_name : String,
          @status : String,
          @subnet_ids : Array(String),
          @vpc_security_group_ids : Array(String),
          @snapshot_type : String? = nil
        )
        end
      end

      # A list of elastic cluster snapshots.

      struct ClusterSnapshotInList
        include JSON::Serializable

        # The ARN identifier of the elastic cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The ARN identifier of the elastic cluster snapshot.

        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String

        # The time when the elastic cluster snapshot was created in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "snapshotCreationTime")]
        getter snapshot_creation_time : String

        # The name of the elastic cluster snapshot.

        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String

        # The status of the elastic cluster snapshot.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @cluster_arn : String,
          @snapshot_arn : String,
          @snapshot_creation_time : String,
          @snapshot_name : String,
          @status : String
        )
        end
      end

      # There was an access conflict.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource where there was an access conflict.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource where there was an access conflict.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct CopyClusterSnapshotInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) identifier of the elastic cluster snapshot.

        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String

        # The identifier of the new elastic cluster snapshot to create from the source cluster snapshot. This
        # parameter is not case sensitive. Constraints: Must contain from 1 to 63 letters, numbers, or
        # hyphens. The first character must be a letter. Cannot end with a hyphen or contain two consecutive
        # hyphens. Example: elastic-cluster-snapshot-5

        @[JSON::Field(key: "targetSnapshotName")]
        getter target_snapshot_name : String

        # Set to true to copy all tags from the source cluster snapshot to the target elastic cluster
        # snapshot. The default is false .

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # The Amazon Web Services KMS key ID for an encrypted elastic cluster snapshot. The Amazon Web
        # Services KMS key ID is the Amazon Resource Name (ARN), Amazon Web Services KMS key identifier, or
        # the Amazon Web Services KMS key alias for the Amazon Web Services KMS encryption key. If you copy an
        # encrypted elastic cluster snapshot from your Amazon Web Services account, you can specify a value
        # for KmsKeyId to encrypt the copy with a new Amazon Web ServicesS KMS encryption key. If you don't
        # specify a value for KmsKeyId , then the copy of the elastic cluster snapshot is encrypted with the
        # same AWS KMS key as the source elastic cluster snapshot. To copy an encrypted elastic cluster
        # snapshot to another Amazon Web Services region, set KmsKeyId to the Amazon Web Services KMS key ID
        # that you want to use to encrypt the copy of the elastic cluster snapshot in the destination region.
        # Amazon Web Services KMS encryption keys are specific to the Amazon Web Services region that they are
        # created in, and you can't use encryption keys from one Amazon Web Services region in another Amazon
        # Web Services region. If you copy an unencrypted elastic cluster snapshot and specify a value for the
        # KmsKeyId parameter, an error is returned.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The tags to be assigned to the elastic cluster snapshot.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @snapshot_arn : String,
          @target_snapshot_name : String,
          @copy_tags : Bool? = nil,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CopyClusterSnapshotOutput
        include JSON::Serializable


        @[JSON::Field(key: "snapshot")]
        getter snapshot : Types::ClusterSnapshot

        def initialize(
          @snapshot : Types::ClusterSnapshot
        )
        end
      end


      struct CreateClusterInput
        include JSON::Serializable

        # The name of the Amazon DocumentDB elastic clusters administrator. Constraints : Must be from 1 to 63
        # letters or numbers. The first character must be a letter. Cannot be a reserved word.

        @[JSON::Field(key: "adminUserName")]
        getter admin_user_name : String

        # The password for the Amazon DocumentDB elastic clusters administrator. The password can contain any
        # printable ASCII characters. Constraints : Must contain from 8 to 100 characters. Cannot contain a
        # forward slash (/), double quote ("), or the "at" symbol (@).

        @[JSON::Field(key: "adminUserPassword")]
        getter admin_user_password : String

        # The authentication type used to determine where to fetch the password used for accessing the elastic
        # cluster. Valid types are PLAIN_TEXT or SECRET_ARN .

        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # The name of the new elastic cluster. This parameter is stored as a lowercase string. Constraints :
        # Must contain from 1 to 63 letters, numbers, or hyphens. The first character must be a letter. Cannot
        # end with a hyphen or contain two consecutive hyphens. Example : my-cluster

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # The number of vCPUs assigned to each elastic cluster shard. Maximum is 64. Allowed values are 2, 4,
        # 8, 16, 32, 64.

        @[JSON::Field(key: "shardCapacity")]
        getter shard_capacity : Int32

        # The number of shards assigned to the elastic cluster. Maximum is 32.

        @[JSON::Field(key: "shardCount")]
        getter shard_count : Int32

        # The number of days for which automatic snapshots are retained.

        @[JSON::Field(key: "backupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # The client token for the elastic cluster.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The KMS key identifier to use to encrypt the new elastic cluster. The KMS key identifier is the
        # Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a cluster using the same
        # Amazon account that owns this KMS encryption key, you can use the KMS key alias instead of the ARN
        # as the KMS encryption key. If an encryption key is not specified, Amazon DocumentDB uses the default
        # encryption key that KMS creates for your account. Your account has a different default encryption
        # key for each Amazon Region.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The daily time range during which automated backups are created if automated backups are enabled, as
        # determined by the backupRetentionPeriod .

        @[JSON::Field(key: "preferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format : ddd:hh24:mi-ddd:hh24:mi Default : a 30-minute window selected at random from an
        # 8-hour block of time for each Amazon Web Services Region, occurring on a random day of the week.
        # Valid days : Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints : Minimum 30-minute window.

        @[JSON::Field(key: "preferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # The number of replica instances applying to all shards in the elastic cluster. A shardInstanceCount
        # value of 1 means there is one writer instance, and any additional instances are replicas that can be
        # used for reads and to improve availability.

        @[JSON::Field(key: "shardInstanceCount")]
        getter shard_instance_count : Int32?

        # The Amazon EC2 subnet IDs for the new elastic cluster.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The tags to be assigned to the new elastic cluster.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A list of EC2 VPC security groups to associate with the new elastic cluster.

        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @admin_user_name : String,
          @admin_user_password : String,
          @auth_type : String,
          @cluster_name : String,
          @shard_capacity : Int32,
          @shard_count : Int32,
          @backup_retention_period : Int32? = nil,
          @client_token : String? = nil,
          @kms_key_id : String? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @shard_instance_count : Int32? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct CreateClusterOutput
        include JSON::Serializable

        # The new elastic cluster that has been created.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster

        def initialize(
          @cluster : Types::Cluster
        )
        end
      end


      struct CreateClusterSnapshotInput
        include JSON::Serializable

        # The ARN identifier of the elastic cluster of which you want to create a snapshot.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The name of the new elastic cluster snapshot.

        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String

        # The tags to be assigned to the new elastic cluster snapshot.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_arn : String,
          @snapshot_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateClusterSnapshotOutput
        include JSON::Serializable

        # Returns information about the new elastic cluster snapshot.

        @[JSON::Field(key: "snapshot")]
        getter snapshot : Types::ClusterSnapshot

        def initialize(
          @snapshot : Types::ClusterSnapshot
        )
        end
      end


      struct DeleteClusterInput
        include JSON::Serializable

        # The ARN identifier of the elastic cluster that is to be deleted.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end


      struct DeleteClusterOutput
        include JSON::Serializable

        # Returns information about the newly deleted elastic cluster.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster

        def initialize(
          @cluster : Types::Cluster
        )
        end
      end


      struct DeleteClusterSnapshotInput
        include JSON::Serializable

        # The ARN identifier of the elastic cluster snapshot that is to be deleted.

        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String

        def initialize(
          @snapshot_arn : String
        )
        end
      end


      struct DeleteClusterSnapshotOutput
        include JSON::Serializable

        # Returns information about the newly deleted elastic cluster snapshot.

        @[JSON::Field(key: "snapshot")]
        getter snapshot : Types::ClusterSnapshot

        def initialize(
          @snapshot : Types::ClusterSnapshot
        )
        end
      end


      struct GetClusterInput
        include JSON::Serializable

        # The ARN identifier of the elastic cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end


      struct GetClusterOutput
        include JSON::Serializable

        # Returns information about a specific elastic cluster.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster

        def initialize(
          @cluster : Types::Cluster
        )
        end
      end


      struct GetClusterSnapshotInput
        include JSON::Serializable

        # The ARN identifier of the elastic cluster snapshot.

        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String

        def initialize(
          @snapshot_arn : String
        )
        end
      end


      struct GetClusterSnapshotOutput
        include JSON::Serializable

        # Returns information about a specific elastic cluster snapshot.

        @[JSON::Field(key: "snapshot")]
        getter snapshot : Types::ClusterSnapshot

        def initialize(
          @snapshot : Types::ClusterSnapshot
        )
        end
      end


      struct GetPendingMaintenanceActionInput
        include JSON::Serializable

        # Retrieves pending maintenance actions for a specific Amazon Resource Name (ARN).

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetPendingMaintenanceActionOutput
        include JSON::Serializable

        # Provides information about a pending maintenance action for a resource.

        @[JSON::Field(key: "resourcePendingMaintenanceAction")]
        getter resource_pending_maintenance_action : Types::ResourcePendingMaintenanceAction

        def initialize(
          @resource_pending_maintenance_action : Types::ResourcePendingMaintenanceAction
        )
        end
      end

      # There was an internal server error.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListClusterSnapshotsInput
        include JSON::Serializable

        # The ARN identifier of the elastic cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The maximum number of elastic cluster snapshot results to receive in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token provided by a previous request. If this parameter is specified, the response
        # includes only records beyond this token, up to the value specified by max-results . If there is no
        # more data in the responce, the nextToken will not be returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of cluster snapshots to be returned. You can specify one of the following values: automated
        # - Return all cluster snapshots that Amazon DocumentDB has automatically created for your Amazon Web
        # Services account. manual - Return all cluster snapshots that you have manually created for your
        # Amazon Web Services account.

        @[JSON::Field(key: "snapshotType")]
        getter snapshot_type : String?

        def initialize(
          @cluster_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @snapshot_type : String? = nil
        )
        end
      end


      struct ListClusterSnapshotsOutput
        include JSON::Serializable

        # A pagination token provided by a previous request. If this parameter is specified, the response
        # includes only records beyond this token, up to the value specified by max-results . If there is no
        # more data in the responce, the nextToken will not be returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of snapshots for a specified elastic cluster.

        @[JSON::Field(key: "snapshots")]
        getter snapshots : Array(Types::ClusterSnapshotInList)?

        def initialize(
          @next_token : String? = nil,
          @snapshots : Array(Types::ClusterSnapshotInList)? = nil
        )
        end
      end


      struct ListClustersInput
        include JSON::Serializable

        # The maximum number of elastic cluster snapshot results to receive in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token provided by a previous request. If this parameter is specified, the response
        # includes only records beyond this token, up to the value specified by max-results . If there is no
        # more data in the responce, the nextToken will not be returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClustersOutput
        include JSON::Serializable

        # A list of Amazon DocumentDB elastic clusters.

        @[JSON::Field(key: "clusters")]
        getter clusters : Array(Types::ClusterInList)?

        # A pagination token provided by a previous request. If this parameter is specified, the response
        # includes only records beyond this token, up to the value specified by max-results . If there is no
        # more data in the responce, the nextToken will not be returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(Types::ClusterInList)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPendingMaintenanceActionsInput
        include JSON::Serializable

        # The maximum number of results to include in the response. If more records exist than the specified
        # maxResults value, a pagination token (marker) is included in the response so that the remaining
        # results can be retrieved.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by maxResults .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPendingMaintenanceActionsOutput
        include JSON::Serializable

        # Provides information about a pending maintenance action for a resource.

        @[JSON::Field(key: "resourcePendingMaintenanceActions")]
        getter resource_pending_maintenance_actions : Array(Types::ResourcePendingMaintenanceAction)

        # An optional pagination token provided by a previous request. If this parameter is displayed, the
        # responses will include only records beyond the marker, up to the value specified by maxResults .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_pending_maintenance_actions : Array(Types::ResourcePendingMaintenanceAction),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN identifier of the elastic cluster resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags for the specified elastic cluster resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Retrieves the details of maintenance actions that are pending.

      struct PendingMaintenanceActionDetails
        include JSON::Serializable

        # Displays the specific action of a pending maintenance action.

        @[JSON::Field(key: "action")]
        getter action : String

        # Displays the date of the maintenance window when the action is applied. The maintenance action is
        # applied to the resource during its first maintenance window after this date. If this date is
        # specified, any NEXT_MAINTENANCE optInType requests are ignored.

        @[JSON::Field(key: "autoAppliedAfterDate")]
        getter auto_applied_after_date : String?

        # Displays the effective date when the pending maintenance action is applied to the resource.

        @[JSON::Field(key: "currentApplyDate")]
        getter current_apply_date : String?

        # Displays a description providing more detail about the maintenance action.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Displays the date when the maintenance action is automatically applied. The maintenance action is
        # applied to the resource on this date regardless of the maintenance window for the resource. If this
        # date is specified, any IMMEDIATE optInType requests are ignored.

        @[JSON::Field(key: "forcedApplyDate")]
        getter forced_apply_date : String?

        # Displays the type of optInType request that has been received for the resource.

        @[JSON::Field(key: "optInStatus")]
        getter opt_in_status : String?

        def initialize(
          @action : String,
          @auto_applied_after_date : String? = nil,
          @current_apply_date : String? = nil,
          @description : String? = nil,
          @forced_apply_date : String? = nil,
          @opt_in_status : String? = nil
        )
        end
      end

      # The specified resource could not be located.

      struct ResourceNotFoundException
        include JSON::Serializable

        # An error message describing the failure.

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource that could not be located.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that could not be found.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Provides information about a pending maintenance action for a resource.

      struct ResourcePendingMaintenanceAction
        include JSON::Serializable

        # Provides information about a pending maintenance action for a resource.

        @[JSON::Field(key: "pendingMaintenanceActionDetails")]
        getter pending_maintenance_action_details : Array(Types::PendingMaintenanceActionDetails)?

        # The Amazon DocumentDB Amazon Resource Name (ARN) of the resource to which the pending maintenance
        # action applies.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @pending_maintenance_action_details : Array(Types::PendingMaintenanceActionDetails)? = nil,
          @resource_arn : String? = nil
        )
        end
      end


      struct RestoreClusterFromSnapshotInput
        include JSON::Serializable

        # The name of the elastic cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # The ARN identifier of the elastic cluster snapshot.

        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String

        # The KMS key identifier to use to encrypt the new Amazon DocumentDB elastic clusters cluster. The KMS
        # key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a
        # cluster using the same Amazon account that owns this KMS encryption key, you can use the KMS key
        # alias instead of the ARN as the KMS encryption key. If an encryption key is not specified here,
        # Amazon DocumentDB uses the default encryption key that KMS creates for your account. Your account
        # has a different default encryption key for each Amazon Region.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The capacity of each shard in the new restored elastic cluster.

        @[JSON::Field(key: "shardCapacity")]
        getter shard_capacity : Int32?

        # The number of replica instances applying to all shards in the elastic cluster. A shardInstanceCount
        # value of 1 means there is one writer instance, and any additional instances are replicas that can be
        # used for reads and to improve availability.

        @[JSON::Field(key: "shardInstanceCount")]
        getter shard_instance_count : Int32?

        # The Amazon EC2 subnet IDs for the elastic cluster.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # A list of the tag names to be assigned to the restored elastic cluster, in the form of an array of
        # key-value pairs in which the key is the tag name and the value is the key value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A list of EC2 VPC security groups to associate with the elastic cluster.

        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @cluster_name : String,
          @snapshot_arn : String,
          @kms_key_id : String? = nil,
          @shard_capacity : Int32? = nil,
          @shard_instance_count : Int32? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct RestoreClusterFromSnapshotOutput
        include JSON::Serializable

        # Returns information about a the restored elastic cluster.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster

        def initialize(
          @cluster : Types::Cluster
        )
        end
      end

      # The service quota for the action was exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The name of the shard.

      struct Shard
        include JSON::Serializable

        # The time when the shard was created in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "createTime")]
        getter create_time : String

        # The ID of the shard.

        @[JSON::Field(key: "shardId")]
        getter shard_id : String

        # The current status of the shard.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @create_time : String,
          @shard_id : String,
          @status : String
        )
        end
      end


      struct StartClusterInput
        include JSON::Serializable

        # The ARN identifier of the elastic cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end


      struct StartClusterOutput
        include JSON::Serializable


        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster

        def initialize(
          @cluster : Types::Cluster
        )
        end
      end


      struct StopClusterInput
        include JSON::Serializable

        # The ARN identifier of the elastic cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end


      struct StopClusterOutput
        include JSON::Serializable


        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster

        def initialize(
          @cluster : Types::Cluster
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN identifier of the elastic cluster resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags that are assigned to the elastic cluster resource.

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

      # ThrottlingException will be thrown when request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying the operation.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN identifier of the elastic cluster resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys to be removed from the elastic cluster resource.

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


      struct UpdateClusterInput
        include JSON::Serializable

        # The ARN identifier of the elastic cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The password associated with the elastic cluster administrator. This password can contain any
        # printable ASCII character except forward slash (/), double quote ("), or the "at" symbol (@).
        # Constraints : Must contain from 8 to 100 characters.

        @[JSON::Field(key: "adminUserPassword")]
        getter admin_user_password : String?

        # The authentication type used to determine where to fetch the password used for accessing the elastic
        # cluster. Valid types are PLAIN_TEXT or SECRET_ARN .

        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The number of days for which automatic snapshots are retained.

        @[JSON::Field(key: "backupRetentionPeriod")]
        getter backup_retention_period : Int32?

        # The client token for the elastic cluster.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The daily time range during which automated backups are created if automated backups are enabled, as
        # determined by the backupRetentionPeriod .

        @[JSON::Field(key: "preferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format : ddd:hh24:mi-ddd:hh24:mi Default : a 30-minute window selected at random from an
        # 8-hour block of time for each Amazon Web Services Region, occurring on a random day of the week.
        # Valid days : Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints : Minimum 30-minute window.

        @[JSON::Field(key: "preferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # The number of vCPUs assigned to each elastic cluster shard. Maximum is 64. Allowed values are 2, 4,
        # 8, 16, 32, 64.

        @[JSON::Field(key: "shardCapacity")]
        getter shard_capacity : Int32?

        # The number of shards assigned to the elastic cluster. Maximum is 32.

        @[JSON::Field(key: "shardCount")]
        getter shard_count : Int32?

        # The number of replica instances applying to all shards in the elastic cluster. A shardInstanceCount
        # value of 1 means there is one writer instance, and any additional instances are replicas that can be
        # used for reads and to improve availability.

        @[JSON::Field(key: "shardInstanceCount")]
        getter shard_instance_count : Int32?

        # The Amazon EC2 subnet IDs for the elastic cluster.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # A list of EC2 VPC security groups to associate with the elastic cluster.

        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @cluster_arn : String,
          @admin_user_password : String? = nil,
          @auth_type : String? = nil,
          @backup_retention_period : Int32? = nil,
          @client_token : String? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @shard_capacity : Int32? = nil,
          @shard_count : Int32? = nil,
          @shard_instance_count : Int32? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct UpdateClusterOutput
        include JSON::Serializable

        # Returns information about the updated elastic cluster.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster

        def initialize(
          @cluster : Types::Cluster
        )
        end
      end

      # A structure defining a validation exception.

      struct ValidationException
        include JSON::Serializable

        # An error message describing the validation exception.

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason why the validation exception occurred (one of unknownOperation , cannotParse ,
        # fieldValidationFailed , or other ).

        @[JSON::Field(key: "reason")]
        getter reason : String

        # A list of the fields in which the validation exception occurred.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # A specific field in which a given validation exception occurred.

      struct ValidationExceptionField
        include JSON::Serializable

        # An error message describing the validation exception in this field.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field where the validation exception occurred.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
