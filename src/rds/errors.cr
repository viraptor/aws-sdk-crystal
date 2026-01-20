module Aws
  module RDS
    module Errors
      class ServiceError < Exception
      end

      # The specified CIDR IP range or Amazon EC2 security group is already authorized for the specified DB
      # security group.

      class AuthorizationAlreadyExistsFault < ServiceError
      end

      # The specified CIDR IP range or Amazon EC2 security group might not be authorized for the specified
      # DB security group. Or, RDS might not be authorized to perform necessary actions using IAM on your
      # behalf.

      class AuthorizationNotFoundFault < ServiceError
      end

      # The DB security group authorization quota has been reached.

      class AuthorizationQuotaExceededFault < ServiceError
      end


      class BackupPolicyNotFoundFault < ServiceError
      end

      # A blue/green deployment with the specified name already exists.

      class BlueGreenDeploymentAlreadyExistsFault < ServiceError
      end

      # BlueGreenDeploymentIdentifier doesn't refer to an existing blue/green deployment.

      class BlueGreenDeploymentNotFoundFault < ServiceError
      end

      # CertificateIdentifier doesn't refer to an existing certificate.

      class CertificateNotFoundFault < ServiceError
      end

      # An error occurred while trying to create the CEV.

      class CreateCustomDBEngineVersionFault < ServiceError
      end

      # CustomAvailabilityZoneId doesn't refer to an existing custom Availability Zone identifier.

      class CustomAvailabilityZoneNotFoundFault < ServiceError
      end

      # A CEV with the specified name already exists.

      class CustomDBEngineVersionAlreadyExistsFault < ServiceError
      end

      # The specified CEV was not found.

      class CustomDBEngineVersionNotFoundFault < ServiceError
      end

      # You have exceeded your CEV quota.

      class CustomDBEngineVersionQuotaExceededFault < ServiceError
      end

      # The user already has a DB cluster with the given identifier.

      class DBClusterAlreadyExistsFault < ServiceError
      end

      # No automated backup for this DB cluster was found.

      class DBClusterAutomatedBackupNotFoundFault < ServiceError
      end

      # The quota for retained automated backups was exceeded. This prevents you from retaining any
      # additional automated backups. The retained automated backups quota is the same as your DB cluster
      # quota.

      class DBClusterAutomatedBackupQuotaExceededFault < ServiceError
      end

      # BacktrackIdentifier doesn't refer to an existing backtrack.

      class DBClusterBacktrackNotFoundFault < ServiceError
      end

      # The specified custom endpoint can't be created because it already exists.

      class DBClusterEndpointAlreadyExistsFault < ServiceError
      end

      # The specified custom endpoint doesn't exist.

      class DBClusterEndpointNotFoundFault < ServiceError
      end

      # The cluster already has the maximum number of custom endpoints.

      class DBClusterEndpointQuotaExceededFault < ServiceError
      end

      # DBClusterIdentifier doesn't refer to an existing DB cluster.

      class DBClusterNotFoundFault < ServiceError
      end

      # DBClusterParameterGroupName doesn't refer to an existing DB cluster parameter group.

      class DBClusterParameterGroupNotFoundFault < ServiceError
      end

      # The user attempted to create a new DB cluster and the user has already reached the maximum allowed
      # DB cluster quota.

      class DBClusterQuotaExceededFault < ServiceError
      end

      # The specified IAM role Amazon Resource Name (ARN) is already associated with the specified DB
      # cluster.

      class DBClusterRoleAlreadyExistsFault < ServiceError
      end

      # The specified IAM role Amazon Resource Name (ARN) isn't associated with the specified DB cluster.

      class DBClusterRoleNotFoundFault < ServiceError
      end

      # You have exceeded the maximum number of IAM roles that can be associated with the specified DB
      # cluster.

      class DBClusterRoleQuotaExceededFault < ServiceError
      end

      # The user already has a DB cluster snapshot with the given identifier.

      class DBClusterSnapshotAlreadyExistsFault < ServiceError
      end

      # DBClusterSnapshotIdentifier doesn't refer to an existing DB cluster snapshot.

      class DBClusterSnapshotNotFoundFault < ServiceError
      end

      # The user already has a DB instance with the given identifier.

      class DBInstanceAlreadyExistsFault < ServiceError
      end

      # No automated backup for this DB instance was found.

      class DBInstanceAutomatedBackupNotFoundFault < ServiceError
      end

      # The quota for retained automated backups was exceeded. This prevents you from retaining any
      # additional automated backups. The retained automated backups quota is the same as your DB instance
      # quota.

      class DBInstanceAutomatedBackupQuotaExceededFault < ServiceError
      end

      # DBInstanceIdentifier doesn't refer to an existing DB instance.

      class DBInstanceNotFoundFault < ServiceError
      end

      # An attempt to download or examine log files didn't succeed because an Aurora Serverless v2 instance
      # was paused.

      class DBInstanceNotReadyFault < ServiceError
      end

      # The specified RoleArn or FeatureName value is already associated with the DB instance.

      class DBInstanceRoleAlreadyExistsFault < ServiceError
      end

      # The specified RoleArn value doesn't match the specified feature for the DB instance.

      class DBInstanceRoleNotFoundFault < ServiceError
      end

      # You can't associate any more Amazon Web Services Identity and Access Management (IAM) roles with the
      # DB instance because the quota has been reached.

      class DBInstanceRoleQuotaExceededFault < ServiceError
      end

      # LogFileName doesn't refer to an existing DB log file.

      class DBLogFileNotFoundFault < ServiceError
      end

      # A DB parameter group with the same name exists.

      class DBParameterGroupAlreadyExistsFault < ServiceError
      end

      # DBParameterGroupName doesn't refer to an existing DB parameter group.

      class DBParameterGroupNotFoundFault < ServiceError
      end

      # The request would result in the user exceeding the allowed number of DB parameter groups.

      class DBParameterGroupQuotaExceededFault < ServiceError
      end

      # The specified proxy name must be unique for all proxies owned by your Amazon Web Services account in
      # the specified Amazon Web Services Region.

      class DBProxyAlreadyExistsFault < ServiceError
      end

      # The specified DB proxy endpoint name must be unique for all DB proxy endpoints owned by your Amazon
      # Web Services account in the specified Amazon Web Services Region.

      class DBProxyEndpointAlreadyExistsFault < ServiceError
      end

      # The DB proxy endpoint doesn't exist.

      class DBProxyEndpointNotFoundFault < ServiceError
      end

      # The DB proxy already has the maximum number of endpoints.

      class DBProxyEndpointQuotaExceededFault < ServiceError
      end

      # The specified proxy name doesn't correspond to a proxy owned by your Amazon Web Services account in
      # the specified Amazon Web Services Region.

      class DBProxyNotFoundFault < ServiceError
      end

      # Your Amazon Web Services account already has the maximum number of proxies in the specified Amazon
      # Web Services Region.

      class DBProxyQuotaExceededFault < ServiceError
      end

      # The proxy is already associated with the specified RDS DB instance or Aurora DB cluster.

      class DBProxyTargetAlreadyRegisteredFault < ServiceError
      end

      # The specified target group isn't available for a proxy owned by your Amazon Web Services account in
      # the specified Amazon Web Services Region.

      class DBProxyTargetGroupNotFoundFault < ServiceError
      end

      # The specified RDS DB instance or Aurora DB cluster isn't available for a proxy owned by your Amazon
      # Web Services account in the specified Amazon Web Services Region.

      class DBProxyTargetNotFoundFault < ServiceError
      end

      # A DB security group with the name specified in DBSecurityGroupName already exists.

      class DBSecurityGroupAlreadyExistsFault < ServiceError
      end

      # DBSecurityGroupName doesn't refer to an existing DB security group.

      class DBSecurityGroupNotFoundFault < ServiceError
      end

      # A DB security group isn't allowed for this action.

      class DBSecurityGroupNotSupportedFault < ServiceError
      end

      # The request would result in the user exceeding the allowed number of DB security groups.

      class DBSecurityGroupQuotaExceededFault < ServiceError
      end

      # The specified DB shard group name must be unique in your Amazon Web Services account in the
      # specified Amazon Web Services Region.

      class DBShardGroupAlreadyExistsFault < ServiceError
      end

      # The specified DB shard group name wasn't found.

      class DBShardGroupNotFoundFault < ServiceError
      end

      # DBSnapshotIdentifier is already used by an existing snapshot.

      class DBSnapshotAlreadyExistsFault < ServiceError
      end

      # DBSnapshotIdentifier doesn't refer to an existing DB snapshot.

      class DBSnapshotNotFoundFault < ServiceError
      end

      # The specified snapshot tenant database wasn't found.

      class DBSnapshotTenantDatabaseNotFoundFault < ServiceError
      end

      # DBSubnetGroupName is already used by an existing DB subnet group.

      class DBSubnetGroupAlreadyExistsFault < ServiceError
      end

      # Subnets in the DB subnet group should cover at least two Availability Zones unless there is only one
      # Availability Zone.

      class DBSubnetGroupDoesNotCoverEnoughAZs < ServiceError
      end

      # The DBSubnetGroup shouldn't be specified while creating read replicas that lie in the same region as
      # the source instance.

      class DBSubnetGroupNotAllowedFault < ServiceError
      end

      # DBSubnetGroupName doesn't refer to an existing DB subnet group.

      class DBSubnetGroupNotFoundFault < ServiceError
      end

      # The request would result in the user exceeding the allowed number of DB subnet groups.

      class DBSubnetGroupQuotaExceededFault < ServiceError
      end

      # The request would result in the user exceeding the allowed number of subnets in a DB subnet groups.

      class DBSubnetQuotaExceededFault < ServiceError
      end

      # The DB upgrade failed because a resource the DB depends on can't be modified.

      class DBUpgradeDependencyFailureFault < ServiceError
      end

      # Domain doesn't refer to an existing Active Directory domain.

      class DomainNotFoundFault < ServiceError
      end

      # The AMI configuration prerequisite has not been met.

      class Ec2ImagePropertiesNotSupportedFault < ServiceError
      end

      # You have reached the maximum number of event subscriptions.

      class EventSubscriptionQuotaExceededFault < ServiceError
      end

      # You can't start an export task that's already running.

      class ExportTaskAlreadyExistsFault < ServiceError
      end

      # The export task doesn't exist.

      class ExportTaskNotFoundFault < ServiceError
      end

      # The GlobalClusterIdentifier already exists. Specify a new global database identifier (unique name)
      # to create a new global database cluster or to rename an existing one.

      class GlobalClusterAlreadyExistsFault < ServiceError
      end

      # The GlobalClusterIdentifier doesn't refer to an existing global database cluster.

      class GlobalClusterNotFoundFault < ServiceError
      end

      # The number of global database clusters for this account is already at the maximum allowed.

      class GlobalClusterQuotaExceededFault < ServiceError
      end

      # The IAM role requires additional permissions to export to an Amazon S3 bucket.

      class IamRoleMissingPermissionsFault < ServiceError
      end

      # The IAM role is missing for exporting to an Amazon S3 bucket.

      class IamRoleNotFoundFault < ServiceError
      end

      # The request would result in the user exceeding the allowed number of DB instances.

      class InstanceQuotaExceededFault < ServiceError
      end

      # The requested operation can't be performed because there aren't enough available IP addresses in the
      # proxy's subnets. Add more CIDR blocks to the VPC or remove IP address that aren't required from the
      # subnets.

      class InsufficientAvailableIPsInSubnetFault < ServiceError
      end

      # The DB cluster doesn't have enough capacity for the current operation.

      class InsufficientDBClusterCapacityFault < ServiceError
      end

      # The specified DB instance class isn't available in the specified Availability Zone.

      class InsufficientDBInstanceCapacityFault < ServiceError
      end

      # There is insufficient storage available for the current action. You might be able to resolve this
      # error by updating your subnet group to use different Availability Zones that have more storage
      # available.

      class InsufficientStorageClusterCapacityFault < ServiceError
      end

      # The integration you are trying to create already exists.

      class IntegrationAlreadyExistsFault < ServiceError
      end

      # A conflicting conditional operation is currently in progress against this resource. Typically occurs
      # when there are multiple requests being made to the same resource at the same time, and these
      # requests conflict with each other.

      class IntegrationConflictOperationFault < ServiceError
      end

      # The specified integration could not be found.

      class IntegrationNotFoundFault < ServiceError
      end

      # You can't crate any more zero-ETL integrations because the quota has been reached.

      class IntegrationQuotaExceededFault < ServiceError
      end

      # The blue/green deployment can't be switched over or deleted because there is an invalid
      # configuration in the green environment.

      class InvalidBlueGreenDeploymentStateFault < ServiceError
      end

      # You can't delete the CEV.

      class InvalidCustomDBEngineVersionStateFault < ServiceError
      end

      # The automated backup is in an invalid state. For example, this automated backup is associated with
      # an active cluster.

      class InvalidDBClusterAutomatedBackupStateFault < ServiceError
      end

      # Capacity isn't a valid Aurora Serverless DB cluster capacity. Valid capacity values are 2 , 4 , 8 ,
      # 16 , 32 , 64 , 128 , and 256 .

      class InvalidDBClusterCapacityFault < ServiceError
      end

      # The requested operation can't be performed on the endpoint while the endpoint is in this state.

      class InvalidDBClusterEndpointStateFault < ServiceError
      end

      # The supplied value isn't a valid DB cluster snapshot state.

      class InvalidDBClusterSnapshotStateFault < ServiceError
      end

      # The requested operation can't be performed while the cluster is in this state.

      class InvalidDBClusterStateFault < ServiceError
      end

      # The automated backup is in an invalid state. For example, this automated backup is associated with
      # an active instance.

      class InvalidDBInstanceAutomatedBackupStateFault < ServiceError
      end

      # The DB instance isn't in a valid state.

      class InvalidDBInstanceStateFault < ServiceError
      end

      # The DB parameter group is in use or is in an invalid state. If you are attempting to delete the
      # parameter group, you can't delete it when the parameter group is in this state.

      class InvalidDBParameterGroupStateFault < ServiceError
      end

      # You can't perform this operation while the DB proxy endpoint is in a particular state.

      class InvalidDBProxyEndpointStateFault < ServiceError
      end

      # The requested operation can't be performed while the proxy is in this state.

      class InvalidDBProxyStateFault < ServiceError
      end

      # The state of the DB security group doesn't allow deletion.

      class InvalidDBSecurityGroupStateFault < ServiceError
      end

      # The DB shard group must be in the available state.

      class InvalidDBShardGroupStateFault < ServiceError
      end

      # The state of the DB snapshot doesn't allow deletion.

      class InvalidDBSnapshotStateFault < ServiceError
      end

      # The DBSubnetGroup doesn't belong to the same VPC as that of an existing cross-region read replica of
      # the same source instance.

      class InvalidDBSubnetGroupFault < ServiceError
      end

      # The DB subnet group cannot be deleted because it's in use.

      class InvalidDBSubnetGroupStateFault < ServiceError
      end

      # The DB subnet isn't in the available state.

      class InvalidDBSubnetStateFault < ServiceError
      end

      # This error can occur if someone else is modifying a subscription. You should retry the action.

      class InvalidEventSubscriptionStateFault < ServiceError
      end

      # The export is invalid for exporting to an Amazon S3 bucket.

      class InvalidExportOnlyFault < ServiceError
      end

      # The state of the export snapshot is invalid for exporting to an Amazon S3 bucket.

      class InvalidExportSourceStateFault < ServiceError
      end

      # You can't cancel an export task that has completed.

      class InvalidExportTaskStateFault < ServiceError
      end

      # The global cluster is in an invalid state and can't perform the requested operation.

      class InvalidGlobalClusterStateFault < ServiceError
      end

      # The integration is in an invalid state and can't perform the requested operation.

      class InvalidIntegrationStateFault < ServiceError
      end

      # The option group isn't in the available state.

      class InvalidOptionGroupStateFault < ServiceError
      end

      # The operation can't be performed because another operation is in progress.

      class InvalidResourceStateFault < ServiceError
      end

      # Cannot restore from VPC backup to non-VPC DB instance.

      class InvalidRestoreFault < ServiceError
      end

      # The specified Amazon S3 bucket name can't be found or Amazon RDS isn't authorized to access the
      # specified Amazon S3 bucket. Verify the SourceS3BucketName and S3IngestionRoleArn values and try
      # again.

      class InvalidS3BucketFault < ServiceError
      end

      # The requested subnet is invalid, or multiple subnets were requested that are not all in a common
      # VPC.

      class InvalidSubnet < ServiceError
      end

      # The DB subnet group doesn't cover all Availability Zones after it's created because of users'
      # change.

      class InvalidVPCNetworkStateFault < ServiceError
      end

      # An error occurred accessing an Amazon Web Services KMS key.

      class KMSKeyNotAccessibleFault < ServiceError
      end

      # The maximum number of DB shard groups for your Amazon Web Services account in the specified Amazon
      # Web Services Region has been reached.

      class MaxDBShardGroupLimitReached < ServiceError
      end

      # The network type is invalid for the DB instance. Valid nework type values are IPV4 and DUAL .

      class NetworkTypeNotSupported < ServiceError
      end

      # The option group you are trying to create already exists.

      class OptionGroupAlreadyExistsFault < ServiceError
      end

      # The specified option group could not be found.

      class OptionGroupNotFoundFault < ServiceError
      end

      # The quota of 20 option groups was exceeded for this Amazon Web Services account.

      class OptionGroupQuotaExceededFault < ServiceError
      end

      # SourceDBInstanceIdentifier refers to a DB instance with BackupRetentionPeriod equal to 0.

      class PointInTimeRestoreNotEnabledFault < ServiceError
      end

      # Provisioned IOPS not available in the specified Availability Zone.

      class ProvisionedIopsNotAvailableInAZFault < ServiceError
      end

      # User already has a reservation with the given identifier.

      class ReservedDBInstanceAlreadyExistsFault < ServiceError
      end

      # The specified reserved DB Instance not found.

      class ReservedDBInstanceNotFoundFault < ServiceError
      end

      # Request would exceed the user's DB Instance quota.

      class ReservedDBInstanceQuotaExceededFault < ServiceError
      end

      # Specified offering does not exist.

      class ReservedDBInstancesOfferingNotFoundFault < ServiceError
      end

      # The specified resource ID was not found.

      class ResourceNotFoundFault < ServiceError
      end

      # SNS has responded that there is a problem with the SNS topic specified.

      class SNSInvalidTopicFault < ServiceError
      end

      # You do not have permission to publish to the SNS topic ARN.

      class SNSNoAuthorizationFault < ServiceError
      end

      # The SNS topic ARN does not exist.

      class SNSTopicArnNotFoundFault < ServiceError
      end

      # You have exceeded the maximum number of accounts that you can share a manual DB snapshot with.

      class SharedSnapshotQuotaExceededFault < ServiceError
      end

      # The request would result in the user exceeding the allowed number of DB snapshots.

      class SnapshotQuotaExceededFault < ServiceError
      end

      # The source DB cluster isn't supported for a blue/green deployment.

      class SourceClusterNotSupportedFault < ServiceError
      end

      # The source DB instance isn't supported for a blue/green deployment.

      class SourceDatabaseNotSupportedFault < ServiceError
      end

      # The requested source could not be found.

      class SourceNotFoundFault < ServiceError
      end

      # The request would result in the user exceeding the allowed amount of storage available across all DB
      # instances.

      class StorageQuotaExceededFault < ServiceError
      end

      # The aurora-iopt1 storage type isn't available, because you modified the DB cluster to use this
      # storage type less than one month ago.

      class StorageTypeNotAvailableFault < ServiceError
      end

      # The specified StorageType can't be associated with the DB instance.

      class StorageTypeNotSupportedFault < ServiceError
      end

      # The DB subnet is already in use in the Availability Zone.

      class SubnetAlreadyInUse < ServiceError
      end

      # The supplied subscription name already exists.

      class SubscriptionAlreadyExistFault < ServiceError
      end

      # The supplied category does not exist.

      class SubscriptionCategoryNotFoundFault < ServiceError
      end

      # The subscription name does not exist.

      class SubscriptionNotFoundFault < ServiceError
      end

      # You attempted to either create a tenant database that already exists or modify a tenant database to
      # use the name of an existing tenant database.

      class TenantDatabaseAlreadyExistsFault < ServiceError
      end

      # The specified tenant database wasn't found in the DB instance.

      class TenantDatabaseNotFoundFault < ServiceError
      end

      # You attempted to create more tenant databases than are permitted in your Amazon Web Services
      # account.

      class TenantDatabaseQuotaExceededFault < ServiceError
      end

      # The specified DB engine version isn't supported for Aurora Limitless Database.

      class UnsupportedDBEngineVersionFault < ServiceError
      end

      # The operation violates VPC encryption control settings. Make sure that your DB instance type
      # supports the Nitro encryption-in-transit capability, or modify your VPC's encryption controls to not
      # enforce encryption-in-transit.

      class VpcEncryptionControlViolationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AuthorizationAlreadyExistsFault"
          AuthorizationAlreadyExistsFault.new(message)
        when "AuthorizationNotFoundFault"
          AuthorizationNotFoundFault.new(message)
        when "AuthorizationQuotaExceededFault"
          AuthorizationQuotaExceededFault.new(message)
        when "BackupPolicyNotFoundFault"
          BackupPolicyNotFoundFault.new(message)
        when "BlueGreenDeploymentAlreadyExistsFault"
          BlueGreenDeploymentAlreadyExistsFault.new(message)
        when "BlueGreenDeploymentNotFoundFault"
          BlueGreenDeploymentNotFoundFault.new(message)
        when "CertificateNotFoundFault"
          CertificateNotFoundFault.new(message)
        when "CreateCustomDBEngineVersionFault"
          CreateCustomDBEngineVersionFault.new(message)
        when "CustomAvailabilityZoneNotFoundFault"
          CustomAvailabilityZoneNotFoundFault.new(message)
        when "CustomDBEngineVersionAlreadyExistsFault"
          CustomDBEngineVersionAlreadyExistsFault.new(message)
        when "CustomDBEngineVersionNotFoundFault"
          CustomDBEngineVersionNotFoundFault.new(message)
        when "CustomDBEngineVersionQuotaExceededFault"
          CustomDBEngineVersionQuotaExceededFault.new(message)
        when "DBClusterAlreadyExistsFault"
          DBClusterAlreadyExistsFault.new(message)
        when "DBClusterAutomatedBackupNotFoundFault"
          DBClusterAutomatedBackupNotFoundFault.new(message)
        when "DBClusterAutomatedBackupQuotaExceededFault"
          DBClusterAutomatedBackupQuotaExceededFault.new(message)
        when "DBClusterBacktrackNotFoundFault"
          DBClusterBacktrackNotFoundFault.new(message)
        when "DBClusterEndpointAlreadyExistsFault"
          DBClusterEndpointAlreadyExistsFault.new(message)
        when "DBClusterEndpointNotFoundFault"
          DBClusterEndpointNotFoundFault.new(message)
        when "DBClusterEndpointQuotaExceededFault"
          DBClusterEndpointQuotaExceededFault.new(message)
        when "DBClusterNotFoundFault"
          DBClusterNotFoundFault.new(message)
        when "DBClusterParameterGroupNotFoundFault"
          DBClusterParameterGroupNotFoundFault.new(message)
        when "DBClusterQuotaExceededFault"
          DBClusterQuotaExceededFault.new(message)
        when "DBClusterRoleAlreadyExistsFault"
          DBClusterRoleAlreadyExistsFault.new(message)
        when "DBClusterRoleNotFoundFault"
          DBClusterRoleNotFoundFault.new(message)
        when "DBClusterRoleQuotaExceededFault"
          DBClusterRoleQuotaExceededFault.new(message)
        when "DBClusterSnapshotAlreadyExistsFault"
          DBClusterSnapshotAlreadyExistsFault.new(message)
        when "DBClusterSnapshotNotFoundFault"
          DBClusterSnapshotNotFoundFault.new(message)
        when "DBInstanceAlreadyExistsFault"
          DBInstanceAlreadyExistsFault.new(message)
        when "DBInstanceAutomatedBackupNotFoundFault"
          DBInstanceAutomatedBackupNotFoundFault.new(message)
        when "DBInstanceAutomatedBackupQuotaExceededFault"
          DBInstanceAutomatedBackupQuotaExceededFault.new(message)
        when "DBInstanceNotFoundFault"
          DBInstanceNotFoundFault.new(message)
        when "DBInstanceNotReadyFault"
          DBInstanceNotReadyFault.new(message)
        when "DBInstanceRoleAlreadyExistsFault"
          DBInstanceRoleAlreadyExistsFault.new(message)
        when "DBInstanceRoleNotFoundFault"
          DBInstanceRoleNotFoundFault.new(message)
        when "DBInstanceRoleQuotaExceededFault"
          DBInstanceRoleQuotaExceededFault.new(message)
        when "DBLogFileNotFoundFault"
          DBLogFileNotFoundFault.new(message)
        when "DBParameterGroupAlreadyExistsFault"
          DBParameterGroupAlreadyExistsFault.new(message)
        when "DBParameterGroupNotFoundFault"
          DBParameterGroupNotFoundFault.new(message)
        when "DBParameterGroupQuotaExceededFault"
          DBParameterGroupQuotaExceededFault.new(message)
        when "DBProxyAlreadyExistsFault"
          DBProxyAlreadyExistsFault.new(message)
        when "DBProxyEndpointAlreadyExistsFault"
          DBProxyEndpointAlreadyExistsFault.new(message)
        when "DBProxyEndpointNotFoundFault"
          DBProxyEndpointNotFoundFault.new(message)
        when "DBProxyEndpointQuotaExceededFault"
          DBProxyEndpointQuotaExceededFault.new(message)
        when "DBProxyNotFoundFault"
          DBProxyNotFoundFault.new(message)
        when "DBProxyQuotaExceededFault"
          DBProxyQuotaExceededFault.new(message)
        when "DBProxyTargetAlreadyRegisteredFault"
          DBProxyTargetAlreadyRegisteredFault.new(message)
        when "DBProxyTargetGroupNotFoundFault"
          DBProxyTargetGroupNotFoundFault.new(message)
        when "DBProxyTargetNotFoundFault"
          DBProxyTargetNotFoundFault.new(message)
        when "DBSecurityGroupAlreadyExistsFault"
          DBSecurityGroupAlreadyExistsFault.new(message)
        when "DBSecurityGroupNotFoundFault"
          DBSecurityGroupNotFoundFault.new(message)
        when "DBSecurityGroupNotSupportedFault"
          DBSecurityGroupNotSupportedFault.new(message)
        when "DBSecurityGroupQuotaExceededFault"
          DBSecurityGroupQuotaExceededFault.new(message)
        when "DBShardGroupAlreadyExistsFault"
          DBShardGroupAlreadyExistsFault.new(message)
        when "DBShardGroupNotFoundFault"
          DBShardGroupNotFoundFault.new(message)
        when "DBSnapshotAlreadyExistsFault"
          DBSnapshotAlreadyExistsFault.new(message)
        when "DBSnapshotNotFoundFault"
          DBSnapshotNotFoundFault.new(message)
        when "DBSnapshotTenantDatabaseNotFoundFault"
          DBSnapshotTenantDatabaseNotFoundFault.new(message)
        when "DBSubnetGroupAlreadyExistsFault"
          DBSubnetGroupAlreadyExistsFault.new(message)
        when "DBSubnetGroupDoesNotCoverEnoughAZs"
          DBSubnetGroupDoesNotCoverEnoughAZs.new(message)
        when "DBSubnetGroupNotAllowedFault"
          DBSubnetGroupNotAllowedFault.new(message)
        when "DBSubnetGroupNotFoundFault"
          DBSubnetGroupNotFoundFault.new(message)
        when "DBSubnetGroupQuotaExceededFault"
          DBSubnetGroupQuotaExceededFault.new(message)
        when "DBSubnetQuotaExceededFault"
          DBSubnetQuotaExceededFault.new(message)
        when "DBUpgradeDependencyFailureFault"
          DBUpgradeDependencyFailureFault.new(message)
        when "DomainNotFoundFault"
          DomainNotFoundFault.new(message)
        when "Ec2ImagePropertiesNotSupportedFault"
          Ec2ImagePropertiesNotSupportedFault.new(message)
        when "EventSubscriptionQuotaExceededFault"
          EventSubscriptionQuotaExceededFault.new(message)
        when "ExportTaskAlreadyExistsFault"
          ExportTaskAlreadyExistsFault.new(message)
        when "ExportTaskNotFoundFault"
          ExportTaskNotFoundFault.new(message)
        when "GlobalClusterAlreadyExistsFault"
          GlobalClusterAlreadyExistsFault.new(message)
        when "GlobalClusterNotFoundFault"
          GlobalClusterNotFoundFault.new(message)
        when "GlobalClusterQuotaExceededFault"
          GlobalClusterQuotaExceededFault.new(message)
        when "IamRoleMissingPermissionsFault"
          IamRoleMissingPermissionsFault.new(message)
        when "IamRoleNotFoundFault"
          IamRoleNotFoundFault.new(message)
        when "InstanceQuotaExceededFault"
          InstanceQuotaExceededFault.new(message)
        when "InsufficientAvailableIPsInSubnetFault"
          InsufficientAvailableIPsInSubnetFault.new(message)
        when "InsufficientDBClusterCapacityFault"
          InsufficientDBClusterCapacityFault.new(message)
        when "InsufficientDBInstanceCapacityFault"
          InsufficientDBInstanceCapacityFault.new(message)
        when "InsufficientStorageClusterCapacityFault"
          InsufficientStorageClusterCapacityFault.new(message)
        when "IntegrationAlreadyExistsFault"
          IntegrationAlreadyExistsFault.new(message)
        when "IntegrationConflictOperationFault"
          IntegrationConflictOperationFault.new(message)
        when "IntegrationNotFoundFault"
          IntegrationNotFoundFault.new(message)
        when "IntegrationQuotaExceededFault"
          IntegrationQuotaExceededFault.new(message)
        when "InvalidBlueGreenDeploymentStateFault"
          InvalidBlueGreenDeploymentStateFault.new(message)
        when "InvalidCustomDBEngineVersionStateFault"
          InvalidCustomDBEngineVersionStateFault.new(message)
        when "InvalidDBClusterAutomatedBackupStateFault"
          InvalidDBClusterAutomatedBackupStateFault.new(message)
        when "InvalidDBClusterCapacityFault"
          InvalidDBClusterCapacityFault.new(message)
        when "InvalidDBClusterEndpointStateFault"
          InvalidDBClusterEndpointStateFault.new(message)
        when "InvalidDBClusterSnapshotStateFault"
          InvalidDBClusterSnapshotStateFault.new(message)
        when "InvalidDBClusterStateFault"
          InvalidDBClusterStateFault.new(message)
        when "InvalidDBInstanceAutomatedBackupStateFault"
          InvalidDBInstanceAutomatedBackupStateFault.new(message)
        when "InvalidDBInstanceStateFault"
          InvalidDBInstanceStateFault.new(message)
        when "InvalidDBParameterGroupStateFault"
          InvalidDBParameterGroupStateFault.new(message)
        when "InvalidDBProxyEndpointStateFault"
          InvalidDBProxyEndpointStateFault.new(message)
        when "InvalidDBProxyStateFault"
          InvalidDBProxyStateFault.new(message)
        when "InvalidDBSecurityGroupStateFault"
          InvalidDBSecurityGroupStateFault.new(message)
        when "InvalidDBShardGroupStateFault"
          InvalidDBShardGroupStateFault.new(message)
        when "InvalidDBSnapshotStateFault"
          InvalidDBSnapshotStateFault.new(message)
        when "InvalidDBSubnetGroupFault"
          InvalidDBSubnetGroupFault.new(message)
        when "InvalidDBSubnetGroupStateFault"
          InvalidDBSubnetGroupStateFault.new(message)
        when "InvalidDBSubnetStateFault"
          InvalidDBSubnetStateFault.new(message)
        when "InvalidEventSubscriptionStateFault"
          InvalidEventSubscriptionStateFault.new(message)
        when "InvalidExportOnlyFault"
          InvalidExportOnlyFault.new(message)
        when "InvalidExportSourceStateFault"
          InvalidExportSourceStateFault.new(message)
        when "InvalidExportTaskStateFault"
          InvalidExportTaskStateFault.new(message)
        when "InvalidGlobalClusterStateFault"
          InvalidGlobalClusterStateFault.new(message)
        when "InvalidIntegrationStateFault"
          InvalidIntegrationStateFault.new(message)
        when "InvalidOptionGroupStateFault"
          InvalidOptionGroupStateFault.new(message)
        when "InvalidResourceStateFault"
          InvalidResourceStateFault.new(message)
        when "InvalidRestoreFault"
          InvalidRestoreFault.new(message)
        when "InvalidS3BucketFault"
          InvalidS3BucketFault.new(message)
        when "InvalidSubnet"
          InvalidSubnet.new(message)
        when "InvalidVPCNetworkStateFault"
          InvalidVPCNetworkStateFault.new(message)
        when "KMSKeyNotAccessibleFault"
          KMSKeyNotAccessibleFault.new(message)
        when "MaxDBShardGroupLimitReached"
          MaxDBShardGroupLimitReached.new(message)
        when "NetworkTypeNotSupported"
          NetworkTypeNotSupported.new(message)
        when "OptionGroupAlreadyExistsFault"
          OptionGroupAlreadyExistsFault.new(message)
        when "OptionGroupNotFoundFault"
          OptionGroupNotFoundFault.new(message)
        when "OptionGroupQuotaExceededFault"
          OptionGroupQuotaExceededFault.new(message)
        when "PointInTimeRestoreNotEnabledFault"
          PointInTimeRestoreNotEnabledFault.new(message)
        when "ProvisionedIopsNotAvailableInAZFault"
          ProvisionedIopsNotAvailableInAZFault.new(message)
        when "ReservedDBInstanceAlreadyExistsFault"
          ReservedDBInstanceAlreadyExistsFault.new(message)
        when "ReservedDBInstanceNotFoundFault"
          ReservedDBInstanceNotFoundFault.new(message)
        when "ReservedDBInstanceQuotaExceededFault"
          ReservedDBInstanceQuotaExceededFault.new(message)
        when "ReservedDBInstancesOfferingNotFoundFault"
          ReservedDBInstancesOfferingNotFoundFault.new(message)
        when "ResourceNotFoundFault"
          ResourceNotFoundFault.new(message)
        when "SNSInvalidTopicFault"
          SNSInvalidTopicFault.new(message)
        when "SNSNoAuthorizationFault"
          SNSNoAuthorizationFault.new(message)
        when "SNSTopicArnNotFoundFault"
          SNSTopicArnNotFoundFault.new(message)
        when "SharedSnapshotQuotaExceededFault"
          SharedSnapshotQuotaExceededFault.new(message)
        when "SnapshotQuotaExceededFault"
          SnapshotQuotaExceededFault.new(message)
        when "SourceClusterNotSupportedFault"
          SourceClusterNotSupportedFault.new(message)
        when "SourceDatabaseNotSupportedFault"
          SourceDatabaseNotSupportedFault.new(message)
        when "SourceNotFoundFault"
          SourceNotFoundFault.new(message)
        when "StorageQuotaExceededFault"
          StorageQuotaExceededFault.new(message)
        when "StorageTypeNotAvailableFault"
          StorageTypeNotAvailableFault.new(message)
        when "StorageTypeNotSupportedFault"
          StorageTypeNotSupportedFault.new(message)
        when "SubnetAlreadyInUse"
          SubnetAlreadyInUse.new(message)
        when "SubscriptionAlreadyExistFault"
          SubscriptionAlreadyExistFault.new(message)
        when "SubscriptionCategoryNotFoundFault"
          SubscriptionCategoryNotFoundFault.new(message)
        when "SubscriptionNotFoundFault"
          SubscriptionNotFoundFault.new(message)
        when "TenantDatabaseAlreadyExistsFault"
          TenantDatabaseAlreadyExistsFault.new(message)
        when "TenantDatabaseNotFoundFault"
          TenantDatabaseNotFoundFault.new(message)
        when "TenantDatabaseQuotaExceededFault"
          TenantDatabaseQuotaExceededFault.new(message)
        when "UnsupportedDBEngineVersionFault"
          UnsupportedDBEngineVersionFault.new(message)
        when "VpcEncryptionControlViolationException"
          VpcEncryptionControlViolationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
