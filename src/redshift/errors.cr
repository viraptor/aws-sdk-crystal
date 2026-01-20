module Aws
  module Redshift
    module Errors
      class ServiceError < Exception
      end

      # You are not authorized to access the cluster.

      class AccessToClusterDeniedFault < ServiceError
      end

      # The owner of the specified snapshot has not authorized your account to access the snapshot.

      class AccessToSnapshotDeniedFault < ServiceError
      end

      # The authentication profile already exists.

      class AuthenticationProfileAlreadyExistsFault < ServiceError
      end

      # The authentication profile can't be found.

      class AuthenticationProfileNotFoundFault < ServiceError
      end

      # The size or number of authentication profiles has exceeded the quota. The maximum length of the JSON
      # string and maximum number of authentication profiles is determined by a quota for your account.

      class AuthenticationProfileQuotaExceededFault < ServiceError
      end

      # The specified CIDR block or EC2 security group is already authorized for the specified cluster
      # security group.

      class AuthorizationAlreadyExistsFault < ServiceError
      end

      # The specified CIDR IP range or EC2 security group is not authorized for the specified cluster
      # security group.

      class AuthorizationNotFoundFault < ServiceError
      end

      # The authorization quota for the cluster security group has been reached.

      class AuthorizationQuotaExceededFault < ServiceError
      end

      # The maximum number for a batch delete of snapshots has been reached. The limit is 100.

      class BatchDeleteRequestSizeExceededFault < ServiceError
      end

      # The maximum number for snapshot identifiers has been reached. The limit is 100.

      class BatchModifyClusterSnapshotsLimitExceededFault < ServiceError
      end

      # Could not find the specified S3 bucket.

      class BucketNotFoundFault < ServiceError
      end

      # The account already has a cluster with the given identifier.

      class ClusterAlreadyExistsFault < ServiceError
      end

      # The ClusterIdentifier parameter does not refer to an existing cluster.

      class ClusterNotFoundFault < ServiceError
      end

      # Cluster is already on the latest database revision.

      class ClusterOnLatestRevisionFault < ServiceError
      end

      # A cluster parameter group with the same name already exists.

      class ClusterParameterGroupAlreadyExistsFault < ServiceError
      end

      # The parameter group name does not refer to an existing parameter group.

      class ClusterParameterGroupNotFoundFault < ServiceError
      end

      # The request would result in the user exceeding the allowed number of cluster parameter groups. For
      # information about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift
      # Cluster Management Guide .

      class ClusterParameterGroupQuotaExceededFault < ServiceError
      end

      # The request would exceed the allowed number of cluster instances for this account. For information
      # about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift Cluster
      # Management Guide .

      class ClusterQuotaExceededFault < ServiceError
      end

      # A cluster security group with the same name already exists.

      class ClusterSecurityGroupAlreadyExistsFault < ServiceError
      end

      # The cluster security group name does not refer to an existing cluster security group.

      class ClusterSecurityGroupNotFoundFault < ServiceError
      end

      # The request would result in the user exceeding the allowed number of cluster security groups. For
      # information about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift
      # Cluster Management Guide .

      class ClusterSecurityGroupQuotaExceededFault < ServiceError
      end

      # The value specified as a snapshot identifier is already used by an existing snapshot.

      class ClusterSnapshotAlreadyExistsFault < ServiceError
      end

      # The snapshot identifier does not refer to an existing cluster snapshot.

      class ClusterSnapshotNotFoundFault < ServiceError
      end

      # The request would result in the user exceeding the allowed number of cluster snapshots.

      class ClusterSnapshotQuotaExceededFault < ServiceError
      end

      # A ClusterSubnetGroupName is already used by an existing cluster subnet group.

      class ClusterSubnetGroupAlreadyExistsFault < ServiceError
      end

      # The cluster subnet group name does not refer to an existing cluster subnet group.

      class ClusterSubnetGroupNotFoundFault < ServiceError
      end

      # The request would result in user exceeding the allowed number of cluster subnet groups. For
      # information about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift
      # Cluster Management Guide .

      class ClusterSubnetGroupQuotaExceededFault < ServiceError
      end

      # The request would result in user exceeding the allowed number of subnets in a cluster subnet groups.
      # For information about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift
      # Cluster Management Guide .

      class ClusterSubnetQuotaExceededFault < ServiceError
      end

      # There is a conflict while updating the resource policy.

      class ConflictPolicyUpdateFault < ServiceError
      end

      # Cross-region snapshot copy was temporarily disabled. Try your request again.

      class CopyToRegionDisabledFault < ServiceError
      end

      # An error occurred when an attempt was made to change the custom domain association.

      class CustomCnameAssociationFault < ServiceError
      end

      # An error occurred. The custom domain name couldn't be found.

      class CustomDomainAssociationNotFoundFault < ServiceError
      end

      # A dependent service denied access for the integration.

      class DependentServiceAccessDeniedFault < ServiceError
      end

      # The request cannot be completed because a dependent service is throttling requests made by Amazon
      # Redshift on your behalf. Wait and retry the request.

      class DependentServiceRequestThrottlingFault < ServiceError
      end

      # Your request cannot be completed because a dependent internal service is temporarily unavailable.
      # Wait 30 to 60 seconds and try again.

      class DependentServiceUnavailableFault < ServiceError
      end

      # The account already has a Redshift-managed VPC endpoint with the given identifier.

      class EndpointAlreadyExistsFault < ServiceError
      end

      # The authorization already exists for this endpoint.

      class EndpointAuthorizationAlreadyExistsFault < ServiceError
      end

      # The authorization for this endpoint can't be found.

      class EndpointAuthorizationNotFoundFault < ServiceError
      end

      # The number of endpoint authorizations per cluster has exceeded its limit.

      class EndpointAuthorizationsPerClusterLimitExceededFault < ServiceError
      end

      # The endpoint name doesn't refer to an existing endpoint.

      class EndpointNotFoundFault < ServiceError
      end

      # The number of Redshift-managed VPC endpoints per authorization has exceeded its limit.

      class EndpointsPerAuthorizationLimitExceededFault < ServiceError
      end

      # The number of Redshift-managed VPC endpoints per cluster has exceeded its limit.

      class EndpointsPerClusterLimitExceededFault < ServiceError
      end

      # The request would exceed the allowed number of event subscriptions for this account. For information
      # about increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift Cluster
      # Management Guide .

      class EventSubscriptionQuotaExceededFault < ServiceError
      end

      # There is already an existing Amazon Redshift HSM client certificate with the specified identifier.

      class HsmClientCertificateAlreadyExistsFault < ServiceError
      end

      # There is no Amazon Redshift HSM client certificate with the specified identifier.

      class HsmClientCertificateNotFoundFault < ServiceError
      end

      # The quota for HSM client certificates has been reached. For information about increasing your quota,
      # go to Limits in Amazon Redshift in the Amazon Redshift Cluster Management Guide .

      class HsmClientCertificateQuotaExceededFault < ServiceError
      end

      # There is already an existing Amazon Redshift HSM configuration with the specified identifier.

      class HsmConfigurationAlreadyExistsFault < ServiceError
      end

      # There is no Amazon Redshift HSM configuration with the specified identifier.

      class HsmConfigurationNotFoundFault < ServiceError
      end

      # The quota for HSM configurations has been reached. For information about increasing your quota, go
      # to Limits in Amazon Redshift in the Amazon Redshift Cluster Management Guide .

      class HsmConfigurationQuotaExceededFault < ServiceError
      end

      # You have exceeded the allowed number of table restore requests. Wait for your current table restore
      # requests to complete before making a new request.

      class InProgressTableRestoreQuotaExceededFault < ServiceError
      end

      # The specified options are incompatible.

      class IncompatibleOrderableOptions < ServiceError
      end

      # The number of nodes specified exceeds the allotted capacity of the cluster.

      class InsufficientClusterCapacityFault < ServiceError
      end

      # The cluster does not have read bucket or put object permissions on the S3 bucket specified when
      # enabling logging.

      class InsufficientS3BucketPolicyFault < ServiceError
      end

      # The integration you are trying to create already exists.

      class IntegrationAlreadyExistsFault < ServiceError
      end

      # A conflicting conditional operation is currently in progress against this resource. This typically
      # occurs when there are multiple requests being made to the same resource at the same time, and these
      # requests conflict with each other.

      class IntegrationConflictOperationFault < ServiceError
      end

      # The integration is in an invalid state and can't perform the requested operation.

      class IntegrationConflictStateFault < ServiceError
      end

      # The integration can't be found.

      class IntegrationNotFoundFault < ServiceError
      end

      # You can't create any more zero-ETL or S3 event integrations because the quota has been reached.

      class IntegrationQuotaExceededFault < ServiceError
      end

      # The specified integration source can't be found.

      class IntegrationSourceNotFoundFault < ServiceError
      end

      # The specified integration target can't be found.

      class IntegrationTargetNotFoundFault < ServiceError
      end

      # The authentication profile request is not valid. The profile name can't be null or empty. The
      # authentication profile API operation must be available in the Amazon Web Services Region.

      class InvalidAuthenticationProfileRequestFault < ServiceError
      end

      # The status of the authorization is not valid.

      class InvalidAuthorizationStateFault < ServiceError
      end

      # The cluster parameter group action can not be completed because another task is in progress that
      # involves the parameter group. Wait a few moments and try the operation again.

      class InvalidClusterParameterGroupStateFault < ServiceError
      end

      # The state of the cluster security group is not available .

      class InvalidClusterSecurityGroupStateFault < ServiceError
      end

      # The cluster snapshot schedule state is not valid.

      class InvalidClusterSnapshotScheduleStateFault < ServiceError
      end

      # The specified cluster snapshot is not in the available state, or other accounts are authorized to
      # access the snapshot.

      class InvalidClusterSnapshotStateFault < ServiceError
      end

      # The specified cluster is not in the available state.

      class InvalidClusterStateFault < ServiceError
      end

      # The cluster subnet group cannot be deleted because it is in use.

      class InvalidClusterSubnetGroupStateFault < ServiceError
      end

      # The state of the subnet is invalid.

      class InvalidClusterSubnetStateFault < ServiceError
      end

      # The provided cluster track name is not valid.

      class InvalidClusterTrackFault < ServiceError
      end

      # There is an error with the datashare.

      class InvalidDataShareFault < ServiceError
      end

      # The Elastic IP (EIP) is invalid or cannot be found.

      class InvalidElasticIpFault < ServiceError
      end

      # The status of the endpoint is not valid.

      class InvalidEndpointStateFault < ServiceError
      end

      # The specified HSM client certificate is not in the available state, or it is still in use by one or
      # more Amazon Redshift clusters.

      class InvalidHsmClientCertificateStateFault < ServiceError
      end

      # The specified HSM configuration is not in the available state, or it is still in use by one or more
      # Amazon Redshift clusters.

      class InvalidHsmConfigurationStateFault < ServiceError
      end

      # The namespace isn't valid because the namespace doesn't exist. Provide a valid namespace.

      class InvalidNamespaceFault < ServiceError
      end

      # The resource policy isn't valid.

      class InvalidPolicyFault < ServiceError
      end

      # Indicates that the Reserved Node being exchanged is not in an active state.

      class InvalidReservedNodeStateFault < ServiceError
      end

      # The restore is invalid.

      class InvalidRestoreFault < ServiceError
      end

      # The retention period specified is either in the past or is not a valid value. The value must be
      # either -1 or an integer between 1 and 3,653.

      class InvalidRetentionPeriodFault < ServiceError
      end

      # The S3 bucket name is invalid. For more information about naming rules, go to Bucket Restrictions
      # and Limitations in the Amazon Simple Storage Service (S3) Developer Guide.

      class InvalidS3BucketNameFault < ServiceError
      end

      # The string specified for the logging S3 key prefix does not comply with the documented constraints.

      class InvalidS3KeyPrefixFault < ServiceError
      end

      # The schedule you submitted isn't valid.

      class InvalidScheduleFault < ServiceError
      end

      # The scheduled action is not valid.

      class InvalidScheduledActionFault < ServiceError
      end

      # The snapshot copy grant can't be deleted because it is used by one or more clusters.

      class InvalidSnapshotCopyGrantStateFault < ServiceError
      end

      # The requested subnet is not valid, or not all of the subnets are in the same VPC.

      class InvalidSubnet < ServiceError
      end

      # The subscription request is invalid because it is a duplicate request. This subscription request is
      # already in progress.

      class InvalidSubscriptionStateFault < ServiceError
      end

      # The value specified for the sourceDatabaseName , sourceSchemaName , or sourceTableName parameter, or
      # a combination of these, doesn't exist in the snapshot.

      class InvalidTableRestoreArgumentFault < ServiceError
      end

      # The tag is invalid.

      class InvalidTagFault < ServiceError
      end

      # The usage limit is not valid.

      class InvalidUsageLimitFault < ServiceError
      end

      # The cluster subnet group does not cover all Availability Zones.

      class InvalidVPCNetworkStateFault < ServiceError
      end

      # There are no subnets in your VPC with associated IPv6 CIDR blocks. To use dual-stack mode, associate
      # an IPv6 CIDR block with each subnet in your VPC.

      class Ipv6CidrBlockNotFoundFault < ServiceError
      end

      # The encryption key has exceeded its grant limit in Amazon Web Services KMS.

      class LimitExceededFault < ServiceError
      end

      # The operation would exceed the number of nodes allowed for a cluster.

      class NumberOfNodesPerClusterLimitExceededFault < ServiceError
      end

      # The operation would exceed the number of nodes allotted to the account. For information about
      # increasing your quota, go to Limits in Amazon Redshift in the Amazon Redshift Cluster Management
      # Guide .

      class NumberOfNodesQuotaExceededFault < ServiceError
      end

      # The name of the partner was not found.

      class PartnerNotFoundFault < ServiceError
      end

      # The application you attempted to add already exists.

      class RedshiftIdcApplicationAlreadyExistsFault < ServiceError
      end

      # The application you attempted to find doesn't exist.

      class RedshiftIdcApplicationNotExistsFault < ServiceError
      end

      # The maximum number of Redshift IAM Identity Center applications was exceeded.

      class RedshiftIdcApplicationQuotaExceededFault < ServiceError
      end

      # The request contains one or more invalid parameters. This error occurs when required parameters are
      # missing, parameter values are outside acceptable ranges, or parameter formats are incorrect.

      class RedshiftInvalidParameterFault < ServiceError
      end

      # User already has a reservation with the given identifier.

      class ReservedNodeAlreadyExistsFault < ServiceError
      end

      # Indicates that the reserved node has already been exchanged.

      class ReservedNodeAlreadyMigratedFault < ServiceError
      end

      # The reserved-node exchange status wasn't found.

      class ReservedNodeExchangeNotFoundFault < ServiceError
      end

      # The specified reserved compute node not found.

      class ReservedNodeNotFoundFault < ServiceError
      end

      # Specified offering does not exist.

      class ReservedNodeOfferingNotFoundFault < ServiceError
      end

      # Request would exceed the user's compute node quota. For information about increasing your quota, go
      # to Limits in Amazon Redshift in the Amazon Redshift Cluster Management Guide .

      class ReservedNodeQuotaExceededFault < ServiceError
      end

      # A resize operation for the specified cluster is not found.

      class ResizeNotFoundFault < ServiceError
      end

      # The resource could not be found.

      class ResourceNotFoundFault < ServiceError
      end

      # Amazon SNS has responded that there is a problem with the specified Amazon SNS topic.

      class SNSInvalidTopicFault < ServiceError
      end

      # You do not have permission to publish to the specified Amazon SNS topic.

      class SNSNoAuthorizationFault < ServiceError
      end

      # An Amazon SNS topic with the specified Amazon Resource Name (ARN) does not exist.

      class SNSTopicArnNotFoundFault < ServiceError
      end

      # The definition you submitted is not supported.

      class ScheduleDefinitionTypeUnsupportedFault < ServiceError
      end

      # The scheduled action already exists.

      class ScheduledActionAlreadyExistsFault < ServiceError
      end

      # The scheduled action cannot be found.

      class ScheduledActionNotFoundFault < ServiceError
      end

      # The quota for scheduled actions exceeded.

      class ScheduledActionQuotaExceededFault < ServiceError
      end

      # The action type specified for a scheduled action is not supported.

      class ScheduledActionTypeUnsupportedFault < ServiceError
      end

      # The cluster already has cross-region snapshot copy disabled.

      class SnapshotCopyAlreadyDisabledFault < ServiceError
      end

      # The cluster already has cross-region snapshot copy enabled.

      class SnapshotCopyAlreadyEnabledFault < ServiceError
      end

      # Cross-region snapshot copy was temporarily disabled. Try your request again.

      class SnapshotCopyDisabledFault < ServiceError
      end

      # The snapshot copy grant can't be created because a grant with the same name already exists.

      class SnapshotCopyGrantAlreadyExistsFault < ServiceError
      end

      # The specified snapshot copy grant can't be found. Make sure that the name is typed correctly and
      # that the grant exists in the destination region.

      class SnapshotCopyGrantNotFoundFault < ServiceError
      end

      # The Amazon Web Services account has exceeded the maximum number of snapshot copy grants in this
      # region.

      class SnapshotCopyGrantQuotaExceededFault < ServiceError
      end

      # The specified snapshot schedule already exists.

      class SnapshotScheduleAlreadyExistsFault < ServiceError
      end

      # We could not find the specified snapshot schedule.

      class SnapshotScheduleNotFoundFault < ServiceError
      end

      # You have exceeded the quota of snapshot schedules.

      class SnapshotScheduleQuotaExceededFault < ServiceError
      end

      # The specified snapshot schedule is already being updated.

      class SnapshotScheduleUpdateInProgressFault < ServiceError
      end

      # The specified Amazon Redshift event source could not be found.

      class SourceNotFoundFault < ServiceError
      end

      # A specified subnet is already in use by another cluster.

      class SubnetAlreadyInUse < ServiceError
      end

      # There is already an existing event notification subscription with the specified name.

      class SubscriptionAlreadyExistFault < ServiceError
      end

      # The value specified for the event category was not one of the allowed values, or it specified a
      # category that does not apply to the specified source type. The allowed values are Configuration,
      # Management, Monitoring, and Security.

      class SubscriptionCategoryNotFoundFault < ServiceError
      end

      # An Amazon Redshift event with the specified event ID does not exist.

      class SubscriptionEventIdNotFoundFault < ServiceError
      end

      # An Amazon Redshift event notification subscription with the specified name does not exist.

      class SubscriptionNotFoundFault < ServiceError
      end

      # The value specified for the event severity was not one of the allowed values, or it specified a
      # severity that does not apply to the specified source type. The allowed values are ERROR and INFO.

      class SubscriptionSeverityNotFoundFault < ServiceError
      end

      # The number of tables in the cluster exceeds the limit for the requested new cluster node type.

      class TableLimitExceededFault < ServiceError
      end

      # The specified TableRestoreRequestId value was not found.

      class TableRestoreNotFoundFault < ServiceError
      end

      # You have exceeded the number of tags allowed.

      class TagLimitExceededFault < ServiceError
      end

      # Your account is not authorized to perform the requested operation.

      class UnauthorizedOperation < ServiceError
      end

      # The partner integration is not authorized.

      class UnauthorizedPartnerIntegrationFault < ServiceError
      end

      # The specified region is incorrect or does not exist.

      class UnknownSnapshotCopyRegionFault < ServiceError
      end

      # The requested operation isn't supported.

      class UnsupportedOperationFault < ServiceError
      end

      # A request option was specified that is not supported.

      class UnsupportedOptionFault < ServiceError
      end

      # The usage limit already exists.

      class UsageLimitAlreadyExistsFault < ServiceError
      end

      # The usage limit identifier can't be found.

      class UsageLimitNotFoundFault < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessToClusterDeniedFault"
          AccessToClusterDeniedFault.new(message)
        when "AccessToSnapshotDeniedFault"
          AccessToSnapshotDeniedFault.new(message)
        when "AuthenticationProfileAlreadyExistsFault"
          AuthenticationProfileAlreadyExistsFault.new(message)
        when "AuthenticationProfileNotFoundFault"
          AuthenticationProfileNotFoundFault.new(message)
        when "AuthenticationProfileQuotaExceededFault"
          AuthenticationProfileQuotaExceededFault.new(message)
        when "AuthorizationAlreadyExistsFault"
          AuthorizationAlreadyExistsFault.new(message)
        when "AuthorizationNotFoundFault"
          AuthorizationNotFoundFault.new(message)
        when "AuthorizationQuotaExceededFault"
          AuthorizationQuotaExceededFault.new(message)
        when "BatchDeleteRequestSizeExceededFault"
          BatchDeleteRequestSizeExceededFault.new(message)
        when "BatchModifyClusterSnapshotsLimitExceededFault"
          BatchModifyClusterSnapshotsLimitExceededFault.new(message)
        when "BucketNotFoundFault"
          BucketNotFoundFault.new(message)
        when "ClusterAlreadyExistsFault"
          ClusterAlreadyExistsFault.new(message)
        when "ClusterNotFoundFault"
          ClusterNotFoundFault.new(message)
        when "ClusterOnLatestRevisionFault"
          ClusterOnLatestRevisionFault.new(message)
        when "ClusterParameterGroupAlreadyExistsFault"
          ClusterParameterGroupAlreadyExistsFault.new(message)
        when "ClusterParameterGroupNotFoundFault"
          ClusterParameterGroupNotFoundFault.new(message)
        when "ClusterParameterGroupQuotaExceededFault"
          ClusterParameterGroupQuotaExceededFault.new(message)
        when "ClusterQuotaExceededFault"
          ClusterQuotaExceededFault.new(message)
        when "ClusterSecurityGroupAlreadyExistsFault"
          ClusterSecurityGroupAlreadyExistsFault.new(message)
        when "ClusterSecurityGroupNotFoundFault"
          ClusterSecurityGroupNotFoundFault.new(message)
        when "ClusterSecurityGroupQuotaExceededFault"
          ClusterSecurityGroupQuotaExceededFault.new(message)
        when "ClusterSnapshotAlreadyExistsFault"
          ClusterSnapshotAlreadyExistsFault.new(message)
        when "ClusterSnapshotNotFoundFault"
          ClusterSnapshotNotFoundFault.new(message)
        when "ClusterSnapshotQuotaExceededFault"
          ClusterSnapshotQuotaExceededFault.new(message)
        when "ClusterSubnetGroupAlreadyExistsFault"
          ClusterSubnetGroupAlreadyExistsFault.new(message)
        when "ClusterSubnetGroupNotFoundFault"
          ClusterSubnetGroupNotFoundFault.new(message)
        when "ClusterSubnetGroupQuotaExceededFault"
          ClusterSubnetGroupQuotaExceededFault.new(message)
        when "ClusterSubnetQuotaExceededFault"
          ClusterSubnetQuotaExceededFault.new(message)
        when "ConflictPolicyUpdateFault"
          ConflictPolicyUpdateFault.new(message)
        when "CopyToRegionDisabledFault"
          CopyToRegionDisabledFault.new(message)
        when "CustomCnameAssociationFault"
          CustomCnameAssociationFault.new(message)
        when "CustomDomainAssociationNotFoundFault"
          CustomDomainAssociationNotFoundFault.new(message)
        when "DependentServiceAccessDeniedFault"
          DependentServiceAccessDeniedFault.new(message)
        when "DependentServiceRequestThrottlingFault"
          DependentServiceRequestThrottlingFault.new(message)
        when "DependentServiceUnavailableFault"
          DependentServiceUnavailableFault.new(message)
        when "EndpointAlreadyExistsFault"
          EndpointAlreadyExistsFault.new(message)
        when "EndpointAuthorizationAlreadyExistsFault"
          EndpointAuthorizationAlreadyExistsFault.new(message)
        when "EndpointAuthorizationNotFoundFault"
          EndpointAuthorizationNotFoundFault.new(message)
        when "EndpointAuthorizationsPerClusterLimitExceededFault"
          EndpointAuthorizationsPerClusterLimitExceededFault.new(message)
        when "EndpointNotFoundFault"
          EndpointNotFoundFault.new(message)
        when "EndpointsPerAuthorizationLimitExceededFault"
          EndpointsPerAuthorizationLimitExceededFault.new(message)
        when "EndpointsPerClusterLimitExceededFault"
          EndpointsPerClusterLimitExceededFault.new(message)
        when "EventSubscriptionQuotaExceededFault"
          EventSubscriptionQuotaExceededFault.new(message)
        when "HsmClientCertificateAlreadyExistsFault"
          HsmClientCertificateAlreadyExistsFault.new(message)
        when "HsmClientCertificateNotFoundFault"
          HsmClientCertificateNotFoundFault.new(message)
        when "HsmClientCertificateQuotaExceededFault"
          HsmClientCertificateQuotaExceededFault.new(message)
        when "HsmConfigurationAlreadyExistsFault"
          HsmConfigurationAlreadyExistsFault.new(message)
        when "HsmConfigurationNotFoundFault"
          HsmConfigurationNotFoundFault.new(message)
        when "HsmConfigurationQuotaExceededFault"
          HsmConfigurationQuotaExceededFault.new(message)
        when "InProgressTableRestoreQuotaExceededFault"
          InProgressTableRestoreQuotaExceededFault.new(message)
        when "IncompatibleOrderableOptions"
          IncompatibleOrderableOptions.new(message)
        when "InsufficientClusterCapacityFault"
          InsufficientClusterCapacityFault.new(message)
        when "InsufficientS3BucketPolicyFault"
          InsufficientS3BucketPolicyFault.new(message)
        when "IntegrationAlreadyExistsFault"
          IntegrationAlreadyExistsFault.new(message)
        when "IntegrationConflictOperationFault"
          IntegrationConflictOperationFault.new(message)
        when "IntegrationConflictStateFault"
          IntegrationConflictStateFault.new(message)
        when "IntegrationNotFoundFault"
          IntegrationNotFoundFault.new(message)
        when "IntegrationQuotaExceededFault"
          IntegrationQuotaExceededFault.new(message)
        when "IntegrationSourceNotFoundFault"
          IntegrationSourceNotFoundFault.new(message)
        when "IntegrationTargetNotFoundFault"
          IntegrationTargetNotFoundFault.new(message)
        when "InvalidAuthenticationProfileRequestFault"
          InvalidAuthenticationProfileRequestFault.new(message)
        when "InvalidAuthorizationStateFault"
          InvalidAuthorizationStateFault.new(message)
        when "InvalidClusterParameterGroupStateFault"
          InvalidClusterParameterGroupStateFault.new(message)
        when "InvalidClusterSecurityGroupStateFault"
          InvalidClusterSecurityGroupStateFault.new(message)
        when "InvalidClusterSnapshotScheduleStateFault"
          InvalidClusterSnapshotScheduleStateFault.new(message)
        when "InvalidClusterSnapshotStateFault"
          InvalidClusterSnapshotStateFault.new(message)
        when "InvalidClusterStateFault"
          InvalidClusterStateFault.new(message)
        when "InvalidClusterSubnetGroupStateFault"
          InvalidClusterSubnetGroupStateFault.new(message)
        when "InvalidClusterSubnetStateFault"
          InvalidClusterSubnetStateFault.new(message)
        when "InvalidClusterTrackFault"
          InvalidClusterTrackFault.new(message)
        when "InvalidDataShareFault"
          InvalidDataShareFault.new(message)
        when "InvalidElasticIpFault"
          InvalidElasticIpFault.new(message)
        when "InvalidEndpointStateFault"
          InvalidEndpointStateFault.new(message)
        when "InvalidHsmClientCertificateStateFault"
          InvalidHsmClientCertificateStateFault.new(message)
        when "InvalidHsmConfigurationStateFault"
          InvalidHsmConfigurationStateFault.new(message)
        when "InvalidNamespaceFault"
          InvalidNamespaceFault.new(message)
        when "InvalidPolicyFault"
          InvalidPolicyFault.new(message)
        when "InvalidReservedNodeStateFault"
          InvalidReservedNodeStateFault.new(message)
        when "InvalidRestoreFault"
          InvalidRestoreFault.new(message)
        when "InvalidRetentionPeriodFault"
          InvalidRetentionPeriodFault.new(message)
        when "InvalidS3BucketNameFault"
          InvalidS3BucketNameFault.new(message)
        when "InvalidS3KeyPrefixFault"
          InvalidS3KeyPrefixFault.new(message)
        when "InvalidScheduleFault"
          InvalidScheduleFault.new(message)
        when "InvalidScheduledActionFault"
          InvalidScheduledActionFault.new(message)
        when "InvalidSnapshotCopyGrantStateFault"
          InvalidSnapshotCopyGrantStateFault.new(message)
        when "InvalidSubnet"
          InvalidSubnet.new(message)
        when "InvalidSubscriptionStateFault"
          InvalidSubscriptionStateFault.new(message)
        when "InvalidTableRestoreArgumentFault"
          InvalidTableRestoreArgumentFault.new(message)
        when "InvalidTagFault"
          InvalidTagFault.new(message)
        when "InvalidUsageLimitFault"
          InvalidUsageLimitFault.new(message)
        when "InvalidVPCNetworkStateFault"
          InvalidVPCNetworkStateFault.new(message)
        when "Ipv6CidrBlockNotFoundFault"
          Ipv6CidrBlockNotFoundFault.new(message)
        when "LimitExceededFault"
          LimitExceededFault.new(message)
        when "NumberOfNodesPerClusterLimitExceededFault"
          NumberOfNodesPerClusterLimitExceededFault.new(message)
        when "NumberOfNodesQuotaExceededFault"
          NumberOfNodesQuotaExceededFault.new(message)
        when "PartnerNotFoundFault"
          PartnerNotFoundFault.new(message)
        when "RedshiftIdcApplicationAlreadyExistsFault"
          RedshiftIdcApplicationAlreadyExistsFault.new(message)
        when "RedshiftIdcApplicationNotExistsFault"
          RedshiftIdcApplicationNotExistsFault.new(message)
        when "RedshiftIdcApplicationQuotaExceededFault"
          RedshiftIdcApplicationQuotaExceededFault.new(message)
        when "RedshiftInvalidParameterFault"
          RedshiftInvalidParameterFault.new(message)
        when "ReservedNodeAlreadyExistsFault"
          ReservedNodeAlreadyExistsFault.new(message)
        when "ReservedNodeAlreadyMigratedFault"
          ReservedNodeAlreadyMigratedFault.new(message)
        when "ReservedNodeExchangeNotFoundFault"
          ReservedNodeExchangeNotFoundFault.new(message)
        when "ReservedNodeNotFoundFault"
          ReservedNodeNotFoundFault.new(message)
        when "ReservedNodeOfferingNotFoundFault"
          ReservedNodeOfferingNotFoundFault.new(message)
        when "ReservedNodeQuotaExceededFault"
          ReservedNodeQuotaExceededFault.new(message)
        when "ResizeNotFoundFault"
          ResizeNotFoundFault.new(message)
        when "ResourceNotFoundFault"
          ResourceNotFoundFault.new(message)
        when "SNSInvalidTopicFault"
          SNSInvalidTopicFault.new(message)
        when "SNSNoAuthorizationFault"
          SNSNoAuthorizationFault.new(message)
        when "SNSTopicArnNotFoundFault"
          SNSTopicArnNotFoundFault.new(message)
        when "ScheduleDefinitionTypeUnsupportedFault"
          ScheduleDefinitionTypeUnsupportedFault.new(message)
        when "ScheduledActionAlreadyExistsFault"
          ScheduledActionAlreadyExistsFault.new(message)
        when "ScheduledActionNotFoundFault"
          ScheduledActionNotFoundFault.new(message)
        when "ScheduledActionQuotaExceededFault"
          ScheduledActionQuotaExceededFault.new(message)
        when "ScheduledActionTypeUnsupportedFault"
          ScheduledActionTypeUnsupportedFault.new(message)
        when "SnapshotCopyAlreadyDisabledFault"
          SnapshotCopyAlreadyDisabledFault.new(message)
        when "SnapshotCopyAlreadyEnabledFault"
          SnapshotCopyAlreadyEnabledFault.new(message)
        when "SnapshotCopyDisabledFault"
          SnapshotCopyDisabledFault.new(message)
        when "SnapshotCopyGrantAlreadyExistsFault"
          SnapshotCopyGrantAlreadyExistsFault.new(message)
        when "SnapshotCopyGrantNotFoundFault"
          SnapshotCopyGrantNotFoundFault.new(message)
        when "SnapshotCopyGrantQuotaExceededFault"
          SnapshotCopyGrantQuotaExceededFault.new(message)
        when "SnapshotScheduleAlreadyExistsFault"
          SnapshotScheduleAlreadyExistsFault.new(message)
        when "SnapshotScheduleNotFoundFault"
          SnapshotScheduleNotFoundFault.new(message)
        when "SnapshotScheduleQuotaExceededFault"
          SnapshotScheduleQuotaExceededFault.new(message)
        when "SnapshotScheduleUpdateInProgressFault"
          SnapshotScheduleUpdateInProgressFault.new(message)
        when "SourceNotFoundFault"
          SourceNotFoundFault.new(message)
        when "SubnetAlreadyInUse"
          SubnetAlreadyInUse.new(message)
        when "SubscriptionAlreadyExistFault"
          SubscriptionAlreadyExistFault.new(message)
        when "SubscriptionCategoryNotFoundFault"
          SubscriptionCategoryNotFoundFault.new(message)
        when "SubscriptionEventIdNotFoundFault"
          SubscriptionEventIdNotFoundFault.new(message)
        when "SubscriptionNotFoundFault"
          SubscriptionNotFoundFault.new(message)
        when "SubscriptionSeverityNotFoundFault"
          SubscriptionSeverityNotFoundFault.new(message)
        when "TableLimitExceededFault"
          TableLimitExceededFault.new(message)
        when "TableRestoreNotFoundFault"
          TableRestoreNotFoundFault.new(message)
        when "TagLimitExceededFault"
          TagLimitExceededFault.new(message)
        when "UnauthorizedOperation"
          UnauthorizedOperation.new(message)
        when "UnauthorizedPartnerIntegrationFault"
          UnauthorizedPartnerIntegrationFault.new(message)
        when "UnknownSnapshotCopyRegionFault"
          UnknownSnapshotCopyRegionFault.new(message)
        when "UnsupportedOperationFault"
          UnsupportedOperationFault.new(message)
        when "UnsupportedOptionFault"
          UnsupportedOptionFault.new(message)
        when "UsageLimitAlreadyExistsFault"
          UsageLimitAlreadyExistsFault.new(message)
        when "UsageLimitNotFoundFault"
          UsageLimitNotFoundFault.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
