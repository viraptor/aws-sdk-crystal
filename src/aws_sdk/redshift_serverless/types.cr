require "json"
require "time"

module AwsSdk
  module RedshiftServerless
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # An object that represents the custom domain name association.
      struct Association
        include JSON::Serializable

        # The custom domain name’s certificate Amazon resource name (ARN).
        @[JSON::Field(key: "customDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The expiration time for the certificate.
        @[JSON::Field(key: "customDomainCertificateExpiryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter custom_domain_certificate_expiry_time : Time?

        # The custom domain name associated with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The name of the workgroup associated with the database.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_certificate_expiry_time : Time? = nil,
          @custom_domain_name : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      # An array of key-value pairs to set for advanced control over Amazon Redshift Serverless.
      struct ConfigParameter
        include JSON::Serializable

        # The key of the parameter. The options are auto_mv , datestyle , enable_case_sensitive_identifier ,
        # enable_user_activity_logging , query_group , search_path , require_ssl , use_fips_ssl , and either
        # wlm_json_configuration or query monitoring metrics that let you define performance boundaries. You
        # can either specify individual query monitoring metrics (such as max_scan_row_count ,
        # max_query_execution_time ) or use wlm_json_configuration to define query queues with rules, but not
        # both. For more information about query monitoring rules and available metrics, see Query monitoring
        # metrics for Amazon Redshift Serverless .
        @[JSON::Field(key: "parameterKey")]
        getter parameter_key : String?

        # The value of the parameter to set.
        @[JSON::Field(key: "parameterValue")]
        getter parameter_value : String?

        def initialize(
          @parameter_key : String? = nil,
          @parameter_value : String? = nil
        )
        end
      end

      # The submitted action has conflicts.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct ConvertRecoveryPointToSnapshotRequest
        include JSON::Serializable

        # The unique identifier of the recovery point.
        @[JSON::Field(key: "recoveryPointId")]
        getter recovery_point_id : String

        # The name of the snapshot.
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String

        # How long to retain the snapshot.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Int32?

        # An array of Tag objects to associate with the created snapshot.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @recovery_point_id : String,
          @snapshot_name : String,
          @retention_period : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ConvertRecoveryPointToSnapshotResponse
        include JSON::Serializable

        # The snapshot converted from the recovery point.
        @[JSON::Field(key: "snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct CreateCustomDomainAssociationRequest
        include JSON::Serializable

        # The custom domain name’s certificate Amazon resource name (ARN).
        @[JSON::Field(key: "customDomainCertificateArn")]
        getter custom_domain_certificate_arn : String

        # The custom domain name to associate with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String

        # The name of the workgroup associated with the database.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        def initialize(
          @custom_domain_certificate_arn : String,
          @custom_domain_name : String,
          @workgroup_name : String
        )
        end
      end

      struct CreateCustomDomainAssociationResponse
        include JSON::Serializable

        # The custom domain name’s certificate Amazon resource name (ARN).
        @[JSON::Field(key: "customDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The expiration time for the certificate.
        @[JSON::Field(key: "customDomainCertificateExpiryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter custom_domain_certificate_expiry_time : Time?

        # The custom domain name to associate with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The name of the workgroup associated with the database.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_certificate_expiry_time : Time? = nil,
          @custom_domain_name : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      struct CreateEndpointAccessRequest
        include JSON::Serializable

        # The name of the VPC endpoint. An endpoint name must contain 1-30 characters. Valid characters are
        # A-Z, a-z, 0-9, and hyphen(-). The first character must be a letter. The name can't contain two
        # consecutive hyphens or end with a hyphen.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String

        # The unique identifers of subnets from which Amazon Redshift Serverless chooses one to deploy a VPC
        # endpoint.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The name of the workgroup to associate with the VPC endpoint.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        # The owner Amazon Web Services account for the Amazon Redshift Serverless workgroup.
        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The unique identifiers of the security group that defines the ports, protocols, and sources for
        # inbound traffic that you are authorizing into your endpoint.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @endpoint_name : String,
          @subnet_ids : Array(String),
          @workgroup_name : String,
          @owner_account : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      struct CreateEndpointAccessResponse
        include JSON::Serializable

        # The created VPC endpoint.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : Types::EndpointAccess?

        def initialize(
          @endpoint : Types::EndpointAccess? = nil
        )
        end
      end

      struct CreateNamespaceRequest
        include JSON::Serializable

        # The name of the namespace.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's admin
        # credentials secret. You can only use this parameter if manageAdminPassword is true.
        @[JSON::Field(key: "adminPasswordSecretKmsKeyId")]
        getter admin_password_secret_kms_key_id : String?

        # The password of the administrator for the first database created in the namespace. You can't use
        # adminUserPassword if manageAdminPassword is true.
        @[JSON::Field(key: "adminUserPassword")]
        getter admin_user_password : String?

        # The username of the administrator for the first database created in the namespace.
        @[JSON::Field(key: "adminUsername")]
        getter admin_username : String?

        # The name of the first database created in the namespace.
        @[JSON::Field(key: "dbName")]
        getter db_name : String?

        # The Amazon Resource Name (ARN) of the IAM role to set as a default in the namespace.
        @[JSON::Field(key: "defaultIamRoleArn")]
        getter default_iam_role_arn : String?

        # A list of IAM roles to associate with the namespace.
        @[JSON::Field(key: "iamRoles")]
        getter iam_roles : Array(String)?

        # The ID of the Amazon Web Services Key Management Service key used to encrypt your data.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The types of logs the namespace can export. Available export types are userlog , connectionlog , and
        # useractivitylog .
        @[JSON::Field(key: "logExports")]
        getter log_exports : Array(String)?

        # If true , Amazon Redshift uses Secrets Manager to manage the namespace's admin credentials. You
        # can't use adminUserPassword if manageAdminPassword is true. If manageAdminPassword is false or not
        # set, Amazon Redshift uses adminUserPassword for the admin user account's password.
        @[JSON::Field(key: "manageAdminPassword")]
        getter manage_admin_password : Bool?

        # The ARN for the Redshift application that integrates with IAM Identity Center.
        @[JSON::Field(key: "redshiftIdcApplicationArn")]
        getter redshift_idc_application_arn : String?

        # A list of tag instances.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @namespace_name : String,
          @admin_password_secret_kms_key_id : String? = nil,
          @admin_user_password : String? = nil,
          @admin_username : String? = nil,
          @db_name : String? = nil,
          @default_iam_role_arn : String? = nil,
          @iam_roles : Array(String)? = nil,
          @kms_key_id : String? = nil,
          @log_exports : Array(String)? = nil,
          @manage_admin_password : Bool? = nil,
          @redshift_idc_application_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateNamespaceResponse
        include JSON::Serializable

        # The created namespace object.
        @[JSON::Field(key: "namespace")]
        getter namespace : Types::Namespace?

        def initialize(
          @namespace : Types::Namespace? = nil
        )
        end
      end

      struct CreateReservationRequest
        include JSON::Serializable

        # The number of Redshift Processing Units (RPUs) to reserve.
        @[JSON::Field(key: "capacity")]
        getter capacity : Int32

        # The ID of the offering associated with the reservation. The offering determines the payment schedule
        # for the reservation.
        @[JSON::Field(key: "offeringId")]
        getter offering_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. This token must be a valid UUIDv4
        # value. For more information about idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @capacity : Int32,
          @offering_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreateReservationResponse
        include JSON::Serializable

        # The reservation object that the CreateReservation action created.
        @[JSON::Field(key: "reservation")]
        getter reservation : Types::Reservation?

        def initialize(
          @reservation : Types::Reservation? = nil
        )
        end
      end

      struct CreateScheduledActionRequest
        include JSON::Serializable

        # The name of the namespace for which to create a scheduled action.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The ARN of the IAM role to assume to run the scheduled action. This IAM role must have permission to
        # run the Amazon Redshift Serverless API operation in the scheduled action. This IAM role must allow
        # the Amazon Redshift scheduler to schedule creating snapshots. (Principal
        # scheduler.redshift.amazonaws.com) to assume permissions on your behalf. For more information about
        # the IAM role to use with the Amazon Redshift scheduler, see Using Identity-Based Policies for Amazon
        # Redshift in the Amazon Redshift Management Guide
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The schedule for a one-time (at timestamp format) or recurring (cron format) scheduled action.
        # Schedule invocations must be separated by at least one hour. Times are in UTC. Format of at
        # timestamp is yyyy-mm-ddThh:mm:ss . For example, 2016-03-04T17:27:00 . Format of cron expression is
        # (Minutes Hours Day-of-month Month Day-of-week Year) . For example, "(0 10 ? * MON *)" . For more
        # information, see Cron Expressions in the Amazon CloudWatch Events User Guide .
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule

        # The name of the scheduled action.
        @[JSON::Field(key: "scheduledActionName")]
        getter scheduled_action_name : String

        @[JSON::Field(key: "targetAction")]
        getter target_action : Types::TargetAction

        # Indicates whether the schedule is enabled. If false, the scheduled action does not trigger. For more
        # information about state of the scheduled action, see ScheduledAction .
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The end time in UTC when the schedule is no longer active. After this time, the scheduled action
        # does not trigger.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The description of the scheduled action.
        @[JSON::Field(key: "scheduledActionDescription")]
        getter scheduled_action_description : String?

        # The start time in UTC when the schedule is active. Before this time, the scheduled action does not
        # trigger.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @namespace_name : String,
          @role_arn : String,
          @schedule : Types::Schedule,
          @scheduled_action_name : String,
          @target_action : Types::TargetAction,
          @enabled : Bool? = nil,
          @end_time : Time? = nil,
          @scheduled_action_description : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct CreateScheduledActionResponse
        include JSON::Serializable

        # The returned ScheduledAction object that describes the properties of a scheduled action.
        @[JSON::Field(key: "scheduledAction")]
        getter scheduled_action : Types::ScheduledActionResponse?

        def initialize(
          @scheduled_action : Types::ScheduledActionResponse? = nil
        )
        end
      end

      struct CreateSnapshotCopyConfigurationRequest
        include JSON::Serializable

        # The destination Amazon Web Services Region that you want to copy snapshots to.
        @[JSON::Field(key: "destinationRegion")]
        getter destination_region : String

        # The name of the namespace to copy snapshots from.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The KMS key to use to encrypt your snapshots in the destination Amazon Web Services Region.
        @[JSON::Field(key: "destinationKmsKeyId")]
        getter destination_kms_key_id : String?

        # The retention period of the snapshots that you copy to the destination Amazon Web Services Region.
        @[JSON::Field(key: "snapshotRetentionPeriod")]
        getter snapshot_retention_period : Int32?

        def initialize(
          @destination_region : String,
          @namespace_name : String,
          @destination_kms_key_id : String? = nil,
          @snapshot_retention_period : Int32? = nil
        )
        end
      end

      struct CreateSnapshotCopyConfigurationResponse
        include JSON::Serializable

        # The snapshot copy configuration object that is returned.
        @[JSON::Field(key: "snapshotCopyConfiguration")]
        getter snapshot_copy_configuration : Types::SnapshotCopyConfiguration

        def initialize(
          @snapshot_copy_configuration : Types::SnapshotCopyConfiguration
        )
        end
      end

      struct CreateSnapshotRequest
        include JSON::Serializable

        # The namespace to create a snapshot for.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The name of the snapshot.
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String

        # How long to retain the created snapshot.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Int32?

        # An array of Tag objects to associate with the snapshot.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @namespace_name : String,
          @snapshot_name : String,
          @retention_period : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSnapshotResponse
        include JSON::Serializable

        # The created snapshot object.
        @[JSON::Field(key: "snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      # The parameters that you can use to configure a scheduled action to create a snapshot. For more
      # information about creating a scheduled action, see CreateScheduledAction .
      struct CreateSnapshotScheduleActionParameters
        include JSON::Serializable

        # The name of the namespace for which you want to configure a scheduled action to create a snapshot.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # A string prefix that is attached to the name of the snapshot created by the scheduled action. The
        # final name of the snapshot is the string prefix appended by the date and time of when the snapshot
        # was created.
        @[JSON::Field(key: "snapshotNamePrefix")]
        getter snapshot_name_prefix : String

        # The retention period of the snapshot created by the scheduled action.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Int32?

        # An array of Tag objects to associate with the snapshot.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @namespace_name : String,
          @snapshot_name_prefix : String,
          @retention_period : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateUsageLimitRequest
        include JSON::Serializable

        # The limit amount. If time-based, this amount is in Redshift Processing Units (RPU) consumed per
        # hour. If data-based, this amount is in terabytes (TB) of data transferred between Regions in
        # cross-account sharing. The value must be a positive number.
        @[JSON::Field(key: "amount")]
        getter amount : Int64

        # The Amazon Resource Name (ARN) of the Amazon Redshift Serverless resource to create the usage limit
        # for.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The type of Amazon Redshift Serverless usage to create a usage limit for.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # The action that Amazon Redshift Serverless takes when the limit is reached. The default is log.
        @[JSON::Field(key: "breachAction")]
        getter breach_action : String?

        # The time period that the amount applies to. A weekly period begins on Sunday. The default is
        # monthly.
        @[JSON::Field(key: "period")]
        getter period : String?

        def initialize(
          @amount : Int64,
          @resource_arn : String,
          @usage_type : String,
          @breach_action : String? = nil,
          @period : String? = nil
        )
        end
      end

      struct CreateUsageLimitResponse
        include JSON::Serializable

        # The returned usage limit object.
        @[JSON::Field(key: "usageLimit")]
        getter usage_limit : Types::UsageLimit?

        def initialize(
          @usage_limit : Types::UsageLimit? = nil
        )
        end
      end

      struct CreateWorkgroupRequest
        include JSON::Serializable

        # The name of the namespace to associate with the workgroup.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The name of the created workgroup.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        # The base data warehouse capacity of the workgroup in Redshift Processing Units (RPUs).
        @[JSON::Field(key: "baseCapacity")]
        getter base_capacity : Int32?

        # An array of parameters to set for advanced control over a database. The options are auto_mv ,
        # datestyle , enable_case_sensitive_identifier , enable_user_activity_logging , query_group ,
        # search_path , require_ssl , use_fips_ssl , and either wlm_json_configuration or query monitoring
        # metrics that let you define performance boundaries. You can either specify individual query
        # monitoring metrics (such as max_scan_row_count , max_query_execution_time ) or use
        # wlm_json_configuration to define query queues with rules, but not both. If you're using
        # wlm_json_configuration , the maximum size of parameterValue is 8000 characters. For more information
        # about query monitoring rules and available metrics, see Query monitoring metrics for Amazon Redshift
        # Serverless .
        @[JSON::Field(key: "configParameters")]
        getter config_parameters : Array(Types::ConfigParameter)?

        # The value that specifies whether to turn on enhanced virtual private cloud (VPC) routing, which
        # forces Amazon Redshift Serverless to route traffic through your VPC instead of over the internet.
        @[JSON::Field(key: "enhancedVpcRouting")]
        getter enhanced_vpc_routing : Bool?

        # If true , allocates additional compute resources for running automatic optimization operations.
        # Default: false
        @[JSON::Field(key: "extraComputeForAutomaticOptimization")]
        getter extra_compute_for_automatic_optimization : Bool?

        # The IP address type that the workgroup supports. Possible values are ipv4 and dualstack .
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The maximum data-warehouse capacity Amazon Redshift Serverless uses to serve queries. The max
        # capacity is specified in RPUs.
        @[JSON::Field(key: "maxCapacity")]
        getter max_capacity : Int32?

        # The custom port to use when connecting to a workgroup. Valid port ranges are 5431-5455 and
        # 8191-8215. The default is 5439.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # An object that represents the price performance target settings for the workgroup.
        @[JSON::Field(key: "pricePerformanceTarget")]
        getter price_performance_target : Types::PerformanceTarget?

        # A value that specifies whether the workgroup can be accessed from a public network.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # An array of security group IDs to associate with the workgroup.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # An array of VPC subnet IDs to associate with the workgroup.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # A array of tag instances.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # An optional parameter for the name of the track for the workgroup. If you don't provide a track
        # name, the workgroup is assigned to the current track.
        @[JSON::Field(key: "trackName")]
        getter track_name : String?

        def initialize(
          @namespace_name : String,
          @workgroup_name : String,
          @base_capacity : Int32? = nil,
          @config_parameters : Array(Types::ConfigParameter)? = nil,
          @enhanced_vpc_routing : Bool? = nil,
          @extra_compute_for_automatic_optimization : Bool? = nil,
          @ip_address_type : String? = nil,
          @max_capacity : Int32? = nil,
          @port : Int32? = nil,
          @price_performance_target : Types::PerformanceTarget? = nil,
          @publicly_accessible : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @track_name : String? = nil
        )
        end
      end

      struct CreateWorkgroupResponse
        include JSON::Serializable

        # The created workgroup object.
        @[JSON::Field(key: "workgroup")]
        getter workgroup : Types::Workgroup?

        def initialize(
          @workgroup : Types::Workgroup? = nil
        )
        end
      end

      struct DeleteCustomDomainAssociationRequest
        include JSON::Serializable

        # The custom domain name associated with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String

        # The name of the workgroup associated with the database.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        def initialize(
          @custom_domain_name : String,
          @workgroup_name : String
        )
        end
      end

      struct DeleteCustomDomainAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteEndpointAccessRequest
        include JSON::Serializable

        # The name of the VPC endpoint to delete.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String

        def initialize(
          @endpoint_name : String
        )
        end
      end

      struct DeleteEndpointAccessResponse
        include JSON::Serializable

        # The deleted VPC endpoint.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : Types::EndpointAccess?

        def initialize(
          @endpoint : Types::EndpointAccess? = nil
        )
        end
      end

      struct DeleteNamespaceRequest
        include JSON::Serializable

        # The name of the namespace to delete.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The name of the snapshot to be created before the namespace is deleted.
        @[JSON::Field(key: "finalSnapshotName")]
        getter final_snapshot_name : String?

        # How long to retain the final snapshot.
        @[JSON::Field(key: "finalSnapshotRetentionPeriod")]
        getter final_snapshot_retention_period : Int32?

        def initialize(
          @namespace_name : String,
          @final_snapshot_name : String? = nil,
          @final_snapshot_retention_period : Int32? = nil
        )
        end
      end

      struct DeleteNamespaceResponse
        include JSON::Serializable

        # The deleted namespace object.
        @[JSON::Field(key: "namespace")]
        getter namespace : Types::Namespace

        def initialize(
          @namespace : Types::Namespace
        )
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the policy to delete.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteScheduledActionRequest
        include JSON::Serializable

        # The name of the scheduled action to delete.
        @[JSON::Field(key: "scheduledActionName")]
        getter scheduled_action_name : String

        def initialize(
          @scheduled_action_name : String
        )
        end
      end

      struct DeleteScheduledActionResponse
        include JSON::Serializable

        # The deleted scheduled action object.
        @[JSON::Field(key: "scheduledAction")]
        getter scheduled_action : Types::ScheduledActionResponse?

        def initialize(
          @scheduled_action : Types::ScheduledActionResponse? = nil
        )
        end
      end

      struct DeleteSnapshotCopyConfigurationRequest
        include JSON::Serializable

        # The ID of the snapshot copy configuration to delete.
        @[JSON::Field(key: "snapshotCopyConfigurationId")]
        getter snapshot_copy_configuration_id : String

        def initialize(
          @snapshot_copy_configuration_id : String
        )
        end
      end

      struct DeleteSnapshotCopyConfigurationResponse
        include JSON::Serializable

        # The deleted snapshot copy configuration object.
        @[JSON::Field(key: "snapshotCopyConfiguration")]
        getter snapshot_copy_configuration : Types::SnapshotCopyConfiguration

        def initialize(
          @snapshot_copy_configuration : Types::SnapshotCopyConfiguration
        )
        end
      end

      struct DeleteSnapshotRequest
        include JSON::Serializable

        # The name of the snapshot to be deleted.
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String

        def initialize(
          @snapshot_name : String
        )
        end
      end

      struct DeleteSnapshotResponse
        include JSON::Serializable

        # The deleted snapshot object.
        @[JSON::Field(key: "snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct DeleteUsageLimitRequest
        include JSON::Serializable

        # The unique identifier of the usage limit to delete.
        @[JSON::Field(key: "usageLimitId")]
        getter usage_limit_id : String

        def initialize(
          @usage_limit_id : String
        )
        end
      end

      struct DeleteUsageLimitResponse
        include JSON::Serializable

        # The deleted usage limit object.
        @[JSON::Field(key: "usageLimit")]
        getter usage_limit : Types::UsageLimit?

        def initialize(
          @usage_limit : Types::UsageLimit? = nil
        )
        end
      end

      struct DeleteWorkgroupRequest
        include JSON::Serializable

        # The name of the workgroup to be deleted.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        def initialize(
          @workgroup_name : String
        )
        end
      end

      struct DeleteWorkgroupResponse
        include JSON::Serializable

        # The deleted workgroup object.
        @[JSON::Field(key: "workgroup")]
        getter workgroup : Types::Workgroup

        def initialize(
          @workgroup : Types::Workgroup
        )
        end
      end

      # This exception is thrown when the request was successful, but dry run was enabled so no action was
      # taken.
      struct DryRunException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The VPC endpoint object.
      struct Endpoint
        include JSON::Serializable

        # The DNS address of the VPC endpoint.
        @[JSON::Field(key: "address")]
        getter address : String?

        # The port that Amazon Redshift Serverless listens on.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # An array of VpcEndpoint objects.
        @[JSON::Field(key: "vpcEndpoints")]
        getter vpc_endpoints : Array(Types::VpcEndpoint)?

        def initialize(
          @address : String? = nil,
          @port : Int32? = nil,
          @vpc_endpoints : Array(Types::VpcEndpoint)? = nil
        )
        end
      end

      # Information about an Amazon Redshift Serverless VPC endpoint.
      struct EndpointAccess
        include JSON::Serializable

        # The DNS address of the endpoint.
        @[JSON::Field(key: "address")]
        getter address : String?

        # The Amazon Resource Name (ARN) of the VPC endpoint.
        @[JSON::Field(key: "endpointArn")]
        getter endpoint_arn : String?

        # The time that the endpoint was created.
        @[JSON::Field(key: "endpointCreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter endpoint_create_time : Time?

        # The name of the VPC endpoint.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String?

        # The status of the VPC endpoint.
        @[JSON::Field(key: "endpointStatus")]
        getter endpoint_status : String?

        # The port number on which Amazon Redshift Serverless accepts incoming connections.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The unique identifier of subnets where Amazon Redshift Serverless choose to deploy the VPC endpoint.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The connection endpoint for connecting to Amazon Redshift Serverless.
        @[JSON::Field(key: "vpcEndpoint")]
        getter vpc_endpoint : Types::VpcEndpoint?

        # The security groups associated with the endpoint.
        @[JSON::Field(key: "vpcSecurityGroups")]
        getter vpc_security_groups : Array(Types::VpcSecurityGroupMembership)?

        # The name of the workgroup associated with the endpoint.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @address : String? = nil,
          @endpoint_arn : String? = nil,
          @endpoint_create_time : Time? = nil,
          @endpoint_name : String? = nil,
          @endpoint_status : String? = nil,
          @port : Int32? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_endpoint : Types::VpcEndpoint? = nil,
          @vpc_security_groups : Array(Types::VpcSecurityGroupMembership)? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      struct GetCredentialsRequest
        include JSON::Serializable

        # The custom domain name associated with the workgroup. The custom domain name or the workgroup name
        # must be included in the request.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The name of the database to get temporary authorization to log on to. Constraints: Must be 1 to 64
        # alphanumeric characters or hyphens. Must contain only uppercase or lowercase letters, numbers,
        # underscore, plus sign, period (dot), at symbol (@), or hyphen. The first character must be a letter.
        # Must not contain a colon ( : ) or slash ( / ). Cannot be a reserved word. A list of reserved words
        # can be found in Reserved Words in the Amazon Redshift Database Developer Guide
        @[JSON::Field(key: "dbName")]
        getter db_name : String?

        # The number of seconds until the returned temporary password expires. The minimum is 900 seconds, and
        # the maximum is 3600 seconds.
        @[JSON::Field(key: "durationSeconds")]
        getter duration_seconds : Int32?

        # The name of the workgroup associated with the database.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @custom_domain_name : String? = nil,
          @db_name : String? = nil,
          @duration_seconds : Int32? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      struct GetCredentialsResponse
        include JSON::Serializable

        # A temporary password that authorizes the user name returned by DbUser to log on to the database
        # DbName .
        @[JSON::Field(key: "dbPassword")]
        getter db_password : String?

        # A database user name that is authorized to log on to the database DbName using the password
        # DbPassword . If the specified DbUser exists in the database, the new user name has the same database
        # privileges as the the user named in DbUser . By default, the user is added to PUBLIC.
        @[JSON::Field(key: "dbUser")]
        getter db_user : String?

        # The date and time the password in DbPassword expires.
        @[JSON::Field(key: "expiration", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration : Time?

        # The date and time of when the DbUser and DbPassword authorization refreshes.
        @[JSON::Field(key: "nextRefreshTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter next_refresh_time : Time?

        def initialize(
          @db_password : String? = nil,
          @db_user : String? = nil,
          @expiration : Time? = nil,
          @next_refresh_time : Time? = nil
        )
        end
      end

      struct GetCustomDomainAssociationRequest
        include JSON::Serializable

        # The custom domain name associated with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String

        # The name of the workgroup associated with the database.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        def initialize(
          @custom_domain_name : String,
          @workgroup_name : String
        )
        end
      end

      struct GetCustomDomainAssociationResponse
        include JSON::Serializable

        # The custom domain name’s certificate Amazon resource name (ARN).
        @[JSON::Field(key: "customDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The expiration time for the certificate.
        @[JSON::Field(key: "customDomainCertificateExpiryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter custom_domain_certificate_expiry_time : Time?

        # The custom domain name associated with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The name of the workgroup associated with the database.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_certificate_expiry_time : Time? = nil,
          @custom_domain_name : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      struct GetEndpointAccessRequest
        include JSON::Serializable

        # The name of the VPC endpoint to return information for.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String

        def initialize(
          @endpoint_name : String
        )
        end
      end

      struct GetEndpointAccessResponse
        include JSON::Serializable

        # The returned VPC endpoint.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : Types::EndpointAccess?

        def initialize(
          @endpoint : Types::EndpointAccess? = nil
        )
        end
      end

      struct GetIdentityCenterAuthTokenRequest
        include JSON::Serializable

        # A list of workgroup names for which to generate the Identity Center authentication token.
        # Constraints: Must contain between 1 and 20 workgroup names. Each workgroup name must be a valid
        # Amazon Redshift Serverless workgroup identifier. All specified workgroups must have Identity Center
        # integration enabled.
        @[JSON::Field(key: "workgroupNames")]
        getter workgroup_names : Array(String)

        def initialize(
          @workgroup_names : Array(String)
        )
        end
      end

      struct GetIdentityCenterAuthTokenResponse
        include JSON::Serializable

        # The date and time when the Identity Center authentication token expires. After this time, a new
        # token must be requested for continued access.
        @[JSON::Field(key: "expirationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time?

        # The Identity Center authentication token that can be used to access data in the specified
        # workgroups. This token contains the Identity Center identity information and is encrypted for secure
        # transmission.
        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @expiration_time : Time? = nil,
          @token : String? = nil
        )
        end
      end

      struct GetNamespaceRequest
        include JSON::Serializable

        # The name of the namespace to retrieve information for.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        def initialize(
          @namespace_name : String
        )
        end
      end

      struct GetNamespaceResponse
        include JSON::Serializable

        # The returned namespace object.
        @[JSON::Field(key: "namespace")]
        getter namespace : Types::Namespace

        def initialize(
          @namespace : Types::Namespace
        )
        end
      end

      struct GetRecoveryPointRequest
        include JSON::Serializable

        # The unique identifier of the recovery point to return information for.
        @[JSON::Field(key: "recoveryPointId")]
        getter recovery_point_id : String

        def initialize(
          @recovery_point_id : String
        )
        end
      end

      struct GetRecoveryPointResponse
        include JSON::Serializable

        # The returned recovery point object.
        @[JSON::Field(key: "recoveryPoint")]
        getter recovery_point : Types::RecoveryPoint?

        def initialize(
          @recovery_point : Types::RecoveryPoint? = nil
        )
        end
      end

      struct GetReservationOfferingRequest
        include JSON::Serializable

        # The identifier for the offering..
        @[JSON::Field(key: "offeringId")]
        getter offering_id : String

        def initialize(
          @offering_id : String
        )
        end
      end

      struct GetReservationOfferingResponse
        include JSON::Serializable

        # The returned reservation offering. The offering determines the payment schedule for the reservation.
        @[JSON::Field(key: "reservationOffering")]
        getter reservation_offering : Types::ReservationOffering

        def initialize(
          @reservation_offering : Types::ReservationOffering
        )
        end
      end

      struct GetReservationRequest
        include JSON::Serializable

        # The ID of the reservation to retrieve.
        @[JSON::Field(key: "reservationId")]
        getter reservation_id : String

        def initialize(
          @reservation_id : String
        )
        end
      end

      struct GetReservationResponse
        include JSON::Serializable

        # The returned reservation object.
        @[JSON::Field(key: "reservation")]
        getter reservation : Types::Reservation

        def initialize(
          @reservation : Types::Reservation
        )
        end
      end

      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to return.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The returned resource policy.
        @[JSON::Field(key: "resourcePolicy")]
        getter resource_policy : Types::ResourcePolicy?

        def initialize(
          @resource_policy : Types::ResourcePolicy? = nil
        )
        end
      end

      struct GetScheduledActionRequest
        include JSON::Serializable

        # The name of the scheduled action.
        @[JSON::Field(key: "scheduledActionName")]
        getter scheduled_action_name : String

        def initialize(
          @scheduled_action_name : String
        )
        end
      end

      struct GetScheduledActionResponse
        include JSON::Serializable

        # The returned scheduled action object.
        @[JSON::Field(key: "scheduledAction")]
        getter scheduled_action : Types::ScheduledActionResponse?

        def initialize(
          @scheduled_action : Types::ScheduledActionResponse? = nil
        )
        end
      end

      struct GetSnapshotRequest
        include JSON::Serializable

        # The owner Amazon Web Services account of a snapshot shared with another user.
        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The Amazon Resource Name (ARN) of the snapshot to return.
        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String?

        # The name of the snapshot to return.
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String?

        def initialize(
          @owner_account : String? = nil,
          @snapshot_arn : String? = nil,
          @snapshot_name : String? = nil
        )
        end
      end

      struct GetSnapshotResponse
        include JSON::Serializable

        # The returned snapshot object.
        @[JSON::Field(key: "snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct GetTableRestoreStatusRequest
        include JSON::Serializable

        # The ID of the RestoreTableFromSnapshot request to return status for.
        @[JSON::Field(key: "tableRestoreRequestId")]
        getter table_restore_request_id : String

        def initialize(
          @table_restore_request_id : String
        )
        end
      end

      struct GetTableRestoreStatusResponse
        include JSON::Serializable

        # The returned TableRestoreStatus object that contains information about the status of your
        # RestoreTableFromSnapshot request.
        @[JSON::Field(key: "tableRestoreStatus")]
        getter table_restore_status : Types::TableRestoreStatus?

        def initialize(
          @table_restore_status : Types::TableRestoreStatus? = nil
        )
        end
      end

      struct GetTrackRequest
        include JSON::Serializable

        # The name of the track of which its version is fetched.
        @[JSON::Field(key: "trackName")]
        getter track_name : String

        def initialize(
          @track_name : String
        )
        end
      end

      struct GetTrackResponse
        include JSON::Serializable

        # The version of the specified track.
        @[JSON::Field(key: "track")]
        getter track : Types::ServerlessTrack?

        def initialize(
          @track : Types::ServerlessTrack? = nil
        )
        end
      end

      struct GetUsageLimitRequest
        include JSON::Serializable

        # The unique identifier of the usage limit to return information for.
        @[JSON::Field(key: "usageLimitId")]
        getter usage_limit_id : String

        def initialize(
          @usage_limit_id : String
        )
        end
      end

      struct GetUsageLimitResponse
        include JSON::Serializable

        # The returned usage limit object.
        @[JSON::Field(key: "usageLimit")]
        getter usage_limit : Types::UsageLimit?

        def initialize(
          @usage_limit : Types::UsageLimit? = nil
        )
        end
      end

      struct GetWorkgroupRequest
        include JSON::Serializable

        # The name of the workgroup to return information for.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        def initialize(
          @workgroup_name : String
        )
        end
      end

      struct GetWorkgroupResponse
        include JSON::Serializable

        # The returned workgroup object.
        @[JSON::Field(key: "workgroup")]
        getter workgroup : Types::Workgroup

        def initialize(
          @workgroup : Types::Workgroup
        )
        end
      end

      # There is an insufficient capacity to perform the action.
      struct InsufficientCapacityException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The provided pagination token is invalid.
      struct InvalidPaginationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # There are no subnets in your VPC with associated IPv6 CIDR blocks. To use dual-stack mode, associate
      # an IPv6 CIDR block with each subnet in your VPC.
      struct Ipv6CidrBlockNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct ListCustomDomainAssociationsRequest
        include JSON::Serializable

        # The custom domain name’s certificate Amazon resource name (ARN).
        @[JSON::Field(key: "customDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The custom domain name associated with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCustomDomainAssociationsResponse
        include JSON::Serializable

        # A list of Association objects.
        @[JSON::Field(key: "associations")]
        getter associations : Array(Types::Association)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @associations : Array(Types::Association)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEndpointAccessRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListEndpointAccess operation returns a nextToken , you can include the returned
        # nextToken in following ListEndpointAccess operations, which returns results in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The owner Amazon Web Services account for the Amazon Redshift Serverless workgroup.
        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The unique identifier of the virtual private cloud with access to Amazon Redshift Serverless.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        # The name of the workgroup associated with the VPC endpoint to return.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner_account : String? = nil,
          @vpc_id : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      struct ListEndpointAccessResponse
        include JSON::Serializable

        # The returned VPC endpoints.
        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(Types::EndpointAccess)

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @endpoints : Array(Types::EndpointAccess),
          @next_token : String? = nil
        )
        end
      end

      struct ListManagedWorkgroupsRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListManagedWorkgroups operation returns a nextToken, you can include the returned
        # nextToken in following ListManagedWorkgroups operations, which returns results in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) for the managed workgroup in the Glue Data Catalog.
        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @source_arn : String? = nil
        )
        end
      end

      struct ListManagedWorkgroupsResponse
        include JSON::Serializable

        # The returned array of managed workgroups.
        @[JSON::Field(key: "managedWorkgroups")]
        getter managed_workgroups : Array(Types::ManagedWorkgroupListItem)?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. To retrieve the next page, make the call again using the returned
        # token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @managed_workgroups : Array(Types::ManagedWorkgroupListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListNamespacesRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListNamespaces operation returns a nextToken , you can include the returned
        # nextToken in following ListNamespaces operations, which returns results in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListNamespacesResponse
        include JSON::Serializable

        # The list of returned namespaces.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(Types::Namespace)

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @namespaces : Array(Types::Namespace),
          @next_token : String? = nil
        )
        end
      end

      struct ListRecoveryPointsRequest
        include JSON::Serializable

        # The time when creation of the recovery point finished.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The Amazon Resource Name (ARN) of the namespace from which to list recovery points.
        @[JSON::Field(key: "namespaceArn")]
        getter namespace_arn : String?

        # The name of the namespace to list recovery points for.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # If your initial ListRecoveryPoints operation returns a nextToken , you can include the returned
        # nextToken in following ListRecoveryPoints operations, which returns results in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The time when the recovery point's creation was initiated.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @namespace_arn : String? = nil,
          @namespace_name : String? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct ListRecoveryPointsResponse
        include JSON::Serializable

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The returned recovery point objects.
        @[JSON::Field(key: "recoveryPoints")]
        getter recovery_points : Array(Types::RecoveryPoint)?

        def initialize(
          @next_token : String? = nil,
          @recovery_points : Array(Types::RecoveryPoint)? = nil
        )
        end
      end

      struct ListReservationOfferingsRequest
        include JSON::Serializable

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReservationOfferingsResponse
        include JSON::Serializable

        # The returned list of reservation offerings.
        @[JSON::Field(key: "reservationOfferingsList")]
        getter reservation_offerings_list : Array(Types::ReservationOffering)

        # The token to use when requesting the next set of items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @reservation_offerings_list : Array(Types::ReservationOffering),
          @next_token : String? = nil
        )
        end
      end

      struct ListReservationsRequest
        include JSON::Serializable

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReservationsResponse
        include JSON::Serializable

        # The serverless reservations returned by the request.
        @[JSON::Field(key: "reservationsList")]
        getter reservations_list : Array(Types::Reservation)

        # The token to use when requesting the next set of items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @reservations_list : Array(Types::Reservation),
          @next_token : String? = nil
        )
        end
      end

      struct ListScheduledActionsRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. Use nextToken to
        # display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of namespace associated with the scheduled action to retrieve.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @namespace_name : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListScheduledActionsResponse
        include JSON::Serializable

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # All of the returned scheduled action association objects.
        @[JSON::Field(key: "scheduledActions")]
        getter scheduled_actions : Array(Types::ScheduledActionAssociation)?

        def initialize(
          @next_token : String? = nil,
          @scheduled_actions : Array(Types::ScheduledActionAssociation)? = nil
        )
        end
      end

      struct ListSnapshotCopyConfigurationsRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The namespace from which to list all snapshot copy configurations.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @namespace_name : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSnapshotCopyConfigurationsResponse
        include JSON::Serializable

        # All of the returned snapshot copy configurations.
        @[JSON::Field(key: "snapshotCopyConfigurations")]
        getter snapshot_copy_configurations : Array(Types::SnapshotCopyConfiguration)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @snapshot_copy_configurations : Array(Types::SnapshotCopyConfiguration),
          @next_token : String? = nil
        )
        end
      end

      struct ListSnapshotsRequest
        include JSON::Serializable

        # The timestamp showing when the snapshot creation finished.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The Amazon Resource Name (ARN) of the namespace from which to list all snapshots.
        @[JSON::Field(key: "namespaceArn")]
        getter namespace_arn : String?

        # The namespace from which to list all snapshots.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The owner Amazon Web Services account of the snapshot.
        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The time when the creation of the snapshot was initiated.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @namespace_arn : String? = nil,
          @namespace_name : String? = nil,
          @next_token : String? = nil,
          @owner_account : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct ListSnapshotsResponse
        include JSON::Serializable

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # All of the returned snapshot objects.
        @[JSON::Field(key: "snapshots")]
        getter snapshots : Array(Types::Snapshot)?

        def initialize(
          @next_token : String? = nil,
          @snapshots : Array(Types::Snapshot)? = nil
        )
        end
      end

      struct ListTableRestoreStatusRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The namespace from which to list all of the statuses of RestoreTableFromSnapshot operations .
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # If your initial ListTableRestoreStatus operation returns a nextToken, you can include the returned
        # nextToken in following ListTableRestoreStatus operations. This will return results on the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The workgroup from which to list all of the statuses of RestoreTableFromSnapshot operations.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @namespace_name : String? = nil,
          @next_token : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      struct ListTableRestoreStatusResponse
        include JSON::Serializable

        # If your initial ListTableRestoreStatus operation returns a nextToken , you can include the returned
        # nextToken in following ListTableRestoreStatus operations. This will returns results on the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The array of returned TableRestoreStatus objects.
        @[JSON::Field(key: "tableRestoreStatuses")]
        getter table_restore_statuses : Array(Types::TableRestoreStatus)?

        def initialize(
          @next_token : String? = nil,
          @table_restore_statuses : Array(Types::TableRestoreStatus)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to list tags for.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A map of the key-value pairs assigned to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListTracksRequest
        include JSON::Serializable

        # The maximum number of response records to return in each call. If the number of remaining response
        # records exceeds the specified MaxRecords value, a value is returned in a marker field of the
        # response. You can retrieve the next set of records by retrying the command with the returned marker
        # value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListTracksRequest operation returns a nextToken , you can include the returned
        # nextToken in following ListTracksRequest operations, which returns results in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTracksResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The returned tracks.
        @[JSON::Field(key: "tracks")]
        getter tracks : Array(Types::ServerlessTrack)?

        def initialize(
          @next_token : String? = nil,
          @tracks : Array(Types::ServerlessTrack)? = nil
        )
        end
      end

      struct ListUsageLimitsRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results. The default is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListUsageLimits operation returns a nextToken , you can include the returned
        # nextToken in following ListUsageLimits operations, which returns results in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) associated with the resource whose usage limits you want to list.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The Amazon Redshift Serverless feature whose limits you want to see.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_arn : String? = nil,
          @usage_type : String? = nil
        )
        end
      end

      struct ListUsageLimitsResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of returned usage limit objects.
        @[JSON::Field(key: "usageLimits")]
        getter usage_limits : Array(Types::UsageLimit)?

        def initialize(
          @next_token : String? = nil,
          @usage_limits : Array(Types::UsageLimit)? = nil
        )
        end
      end

      struct ListWorkgroupsRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListWorkgroups operation returns a nextToken , you can include the returned
        # nextToken in following ListNamespaces operations, which returns results in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The owner Amazon Web Services account for the Amazon Redshift Serverless workgroup.
        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner_account : String? = nil
        )
        end
      end

      struct ListWorkgroupsResponse
        include JSON::Serializable

        # The returned array of workgroups.
        @[JSON::Field(key: "workgroups")]
        getter workgroups : Array(Types::Workgroup)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. To retrieve the next page, make the call again using the returned
        # token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workgroups : Array(Types::Workgroup),
          @next_token : String? = nil
        )
        end
      end

      # A collection of Amazon Redshift compute resources managed by Glue.
      struct ManagedWorkgroupListItem
        include JSON::Serializable

        # The creation date of the managed workgroup.
        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The unique identifier of the managed workgroup.
        @[JSON::Field(key: "managedWorkgroupId")]
        getter managed_workgroup_id : String?

        # The name of the managed workgroup.
        @[JSON::Field(key: "managedWorkgroupName")]
        getter managed_workgroup_name : String?

        # The Amazon Resource Name (ARN) for the managed workgroup in the Glue Data Catalog.
        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String?

        # The status of the managed workgroup.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_date : Time? = nil,
          @managed_workgroup_id : String? = nil,
          @managed_workgroup_name : String? = nil,
          @source_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A collection of database objects and users.
      struct Namespace
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the namespace's admin user credentials secret.
        @[JSON::Field(key: "adminPasswordSecretArn")]
        getter admin_password_secret_arn : String?

        # The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's admin
        # credentials secret.
        @[JSON::Field(key: "adminPasswordSecretKmsKeyId")]
        getter admin_password_secret_kms_key_id : String?

        # The username of the administrator for the first database created in the namespace.
        @[JSON::Field(key: "adminUsername")]
        getter admin_username : String?

        # The Amazon Resource Name (ARN) of the Glue Data Catalog associated with the namespace enabled with
        # Amazon Redshift federated permissions.
        @[JSON::Field(key: "catalogArn")]
        getter catalog_arn : String?

        # The date of when the namespace was created.
        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The name of the first database created in the namespace.
        @[JSON::Field(key: "dbName")]
        getter db_name : String?

        # The Amazon Resource Name (ARN) of the IAM role to set as a default in the namespace.
        @[JSON::Field(key: "defaultIamRoleArn")]
        getter default_iam_role_arn : String?

        # A list of IAM roles to associate with the namespace.
        @[JSON::Field(key: "iamRoles")]
        getter iam_roles : Array(String)?

        # The ID of the Amazon Web Services Key Management Service key used to encrypt your data.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The status of the lakehouse registration for the namespace. Indicates whether the namespace is
        # successfully registered with Amazon Redshift federated permissions.
        @[JSON::Field(key: "lakehouseRegistrationStatus")]
        getter lakehouse_registration_status : String?

        # The types of logs the namespace can export. Available export types are User log, Connection log, and
        # User activity log.
        @[JSON::Field(key: "logExports")]
        getter log_exports : Array(String)?

        # The Amazon Resource Name (ARN) associated with a namespace.
        @[JSON::Field(key: "namespaceArn")]
        getter namespace_arn : String?

        # The unique identifier of a namespace.
        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # The name of the namespace. Must be between 3-64 alphanumeric characters in lowercase, and it cannot
        # be a reserved word. A list of reserved words can be found in Reserved Words in the Amazon Redshift
        # Database Developer Guide.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # The status of the namespace.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @admin_password_secret_arn : String? = nil,
          @admin_password_secret_kms_key_id : String? = nil,
          @admin_username : String? = nil,
          @catalog_arn : String? = nil,
          @creation_date : Time? = nil,
          @db_name : String? = nil,
          @default_iam_role_arn : String? = nil,
          @iam_roles : Array(String)? = nil,
          @kms_key_id : String? = nil,
          @lakehouse_registration_status : String? = nil,
          @log_exports : Array(String)? = nil,
          @namespace_arn : String? = nil,
          @namespace_id : String? = nil,
          @namespace_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about a network interface in an Amazon Redshift Serverless managed VPC
      # endpoint.
      struct NetworkInterface
        include JSON::Serializable

        # The availability Zone.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The IPv6 address of the network interface within the subnet.
        @[JSON::Field(key: "ipv6Address")]
        getter ipv6_address : String?

        # The unique identifier of the network interface.
        @[JSON::Field(key: "networkInterfaceId")]
        getter network_interface_id : String?

        # The IPv4 address of the network interface within the subnet.
        @[JSON::Field(key: "privateIpAddress")]
        getter private_ip_address : String?

        # The unique identifier of the subnet.
        @[JSON::Field(key: "subnetId")]
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

      # An object that represents the price performance target settings for the workgroup.
      struct PerformanceTarget
        include JSON::Serializable

        # The target price performance level for the workgroup. Valid values include 1, 25, 50, 75, and 100.
        # These correspond to the price performance levels LOW_COST, ECONOMICAL, BALANCED, RESOURCEFUL, and
        # HIGH_PERFORMANCE.
        @[JSON::Field(key: "level")]
        getter level : Int32?

        # Whether the price performance target is enabled for the workgroup.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @level : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The policy to create or update. For example, the following policy grants a user authorization to
        # restore a snapshot. "{\"Version\": \"2012-10-17\", \"Statement\" : [{ \"Sid\":
        # \"AllowUserRestoreFromSnapshot\", \"Principal\":{\"AWS\": [\"739247239426\"]}, \"Action\":
        # [\"redshift-serverless:RestoreFromSnapshot\"] , \"Effect\": \"Allow\" }]}"
        @[JSON::Field(key: "policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the account to create or update a resource policy for.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end

      struct PutResourcePolicyResponse
        include JSON::Serializable

        # The policy that was created or updated.
        @[JSON::Field(key: "resourcePolicy")]
        getter resource_policy : Types::ResourcePolicy?

        def initialize(
          @resource_policy : Types::ResourcePolicy? = nil
        )
        end
      end

      # The automatically created recovery point of a namespace. Recovery points are created every 30
      # minutes and kept for 24 hours.
      struct RecoveryPoint
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the namespace the recovery point is associated with.
        @[JSON::Field(key: "namespaceArn")]
        getter namespace_arn : String?

        # The name of the namespace the recovery point is associated with.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # The time the recovery point is created.
        @[JSON::Field(key: "recoveryPointCreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter recovery_point_create_time : Time?

        # The unique identifier of the recovery point.
        @[JSON::Field(key: "recoveryPointId")]
        getter recovery_point_id : String?

        # The total size of the data in the recovery point in megabytes.
        @[JSON::Field(key: "totalSizeInMegaBytes")]
        getter total_size_in_mega_bytes : Float64?

        # The name of the workgroup the recovery point is associated with.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @namespace_arn : String? = nil,
          @namespace_name : String? = nil,
          @recovery_point_create_time : Time? = nil,
          @recovery_point_id : String? = nil,
          @total_size_in_mega_bytes : Float64? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      # Represents an Amazon Redshift Serverless reservation, which gives you the option to commit to a
      # specified number of Redshift Processing Units (RPUs) for a year at a discount from Serverless
      # on-demand (OD) rates.
      struct Reservation
        include JSON::Serializable

        # The number of Redshift Processing Units (RPUs) to reserve.
        @[JSON::Field(key: "capacity")]
        getter capacity : Int32?

        # The end date for the serverless reservation. This date is one year after the start date that you
        # specify.
        @[JSON::Field(key: "endDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date : Time?

        # The type of offering for the reservation. The offering class determines the payment schedule for the
        # reservation.
        @[JSON::Field(key: "offering")]
        getter offering : Types::ReservationOffering?

        # The Amazon Resource Name (ARN) that uniquely identifies the serverless reservation.
        @[JSON::Field(key: "reservationArn")]
        getter reservation_arn : String?

        # The identifier that uniquely identifies the serverless reservation.
        @[JSON::Field(key: "reservationId")]
        getter reservation_id : String?

        # The start date for the serverless reservation. This is the date you created the reservation.
        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        # The status of the reservation. Possible values include the following: payment-pending active
        # payment-failed retired
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @capacity : Int32? = nil,
          @end_date : Time? = nil,
          @offering : Types::ReservationOffering? = nil,
          @reservation_arn : String? = nil,
          @reservation_id : String? = nil,
          @start_date : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The class of offering for the reservation. The offering class determines the payment schedule for
      # the reservation.
      struct ReservationOffering
        include JSON::Serializable

        # The currency code for the offering.
        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # The duration, in seconds, for which the reservation reserves the RPUs.
        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # The rate you are charged for each hour the reservation is active.
        @[JSON::Field(key: "hourlyCharge")]
        getter hourly_charge : Float64?

        # The offering identifier.
        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?

        # Determines the payment schedule for the reservation.
        @[JSON::Field(key: "offeringType")]
        getter offering_type : String?

        # The up-front price you are charged for the reservation.
        @[JSON::Field(key: "upfrontCharge")]
        getter upfront_charge : Float64?

        def initialize(
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @hourly_charge : Float64? = nil,
          @offering_id : String? = nil,
          @offering_type : String? = nil,
          @upfront_charge : Float64? = nil
        )
        end
      end

      # The resource could not be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the resource that could not be found.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String,
          @resource_name : String? = nil
        )
        end
      end

      # The resource policy object. Currently, you can use policies to share snapshots across Amazon Web
      # Services accounts.
      struct ResourcePolicy
        include JSON::Serializable

        # The resource policy.
        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The Amazon Resource Name (ARN) of the policy.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct RestoreFromRecoveryPointRequest
        include JSON::Serializable

        # The name of the namespace to restore data into.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The unique identifier of the recovery point to restore from.
        @[JSON::Field(key: "recoveryPointId")]
        getter recovery_point_id : String

        # The name of the workgroup used to restore data.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        def initialize(
          @namespace_name : String,
          @recovery_point_id : String,
          @workgroup_name : String
        )
        end
      end

      struct RestoreFromRecoveryPointResponse
        include JSON::Serializable

        # The namespace that data was restored into.
        @[JSON::Field(key: "namespace")]
        getter namespace : Types::Namespace?

        # The unique identifier of the recovery point used for the restore.
        @[JSON::Field(key: "recoveryPointId")]
        getter recovery_point_id : String?

        def initialize(
          @namespace : Types::Namespace? = nil,
          @recovery_point_id : String? = nil
        )
        end
      end

      struct RestoreFromSnapshotRequest
        include JSON::Serializable

        # The name of the namespace to restore the snapshot to.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The name of the workgroup used to restore the snapshot.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        # The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's admin
        # credentials secret.
        @[JSON::Field(key: "adminPasswordSecretKmsKeyId")]
        getter admin_password_secret_kms_key_id : String?

        # If true , Amazon Redshift uses Secrets Manager to manage the restored snapshot's admin credentials.
        # If MmanageAdminPassword is false or not set, Amazon Redshift uses the admin credentials that the
        # namespace or cluster had at the time the snapshot was taken.
        @[JSON::Field(key: "manageAdminPassword")]
        getter manage_admin_password : Bool?

        # The Amazon Web Services account that owns the snapshot.
        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The Amazon Resource Name (ARN) of the snapshot to restore from. Required if restoring from a
        # provisioned cluster to Amazon Redshift Serverless. Must not be specified at the same time as
        # snapshotName . The format of the ARN is
        # arn:aws:redshift:&lt;region&gt;:&lt;account_id&gt;:snapshot:&lt;cluster_identifier&gt;/&lt;snapshot_identifier&gt;.
        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String?

        # The name of the snapshot to restore from. Must not be specified at the same time as snapshotArn .
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String?

        def initialize(
          @namespace_name : String,
          @workgroup_name : String,
          @admin_password_secret_kms_key_id : String? = nil,
          @manage_admin_password : Bool? = nil,
          @owner_account : String? = nil,
          @snapshot_arn : String? = nil,
          @snapshot_name : String? = nil
        )
        end
      end

      struct RestoreFromSnapshotResponse
        include JSON::Serializable

        @[JSON::Field(key: "namespace")]
        getter namespace : Types::Namespace?

        # The owner Amazon Web Services; account of the snapshot that was restored.
        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The name of the snapshot used to restore the namespace.
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String?

        def initialize(
          @namespace : Types::Namespace? = nil,
          @owner_account : String? = nil,
          @snapshot_name : String? = nil
        )
        end
      end

      struct RestoreTableFromRecoveryPointRequest
        include JSON::Serializable

        # Namespace of the recovery point to restore from.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The name of the table to create from the restore operation.
        @[JSON::Field(key: "newTableName")]
        getter new_table_name : String

        # The ID of the recovery point to restore the table from.
        @[JSON::Field(key: "recoveryPointId")]
        getter recovery_point_id : String

        # The name of the source database that contains the table being restored.
        @[JSON::Field(key: "sourceDatabaseName")]
        getter source_database_name : String

        # The name of the source table being restored.
        @[JSON::Field(key: "sourceTableName")]
        getter source_table_name : String

        # The workgroup to restore the table to.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        # Indicates whether name identifiers for database, schema, and table are case sensitive. If true, the
        # names are case sensitive. If false, the names are not case sensitive. The default is false.
        @[JSON::Field(key: "activateCaseSensitiveIdentifier")]
        getter activate_case_sensitive_identifier : Bool?

        # The name of the source schema that contains the table being restored.
        @[JSON::Field(key: "sourceSchemaName")]
        getter source_schema_name : String?

        # The name of the database to restore the table to.
        @[JSON::Field(key: "targetDatabaseName")]
        getter target_database_name : String?

        # The name of the schema to restore the table to.
        @[JSON::Field(key: "targetSchemaName")]
        getter target_schema_name : String?

        def initialize(
          @namespace_name : String,
          @new_table_name : String,
          @recovery_point_id : String,
          @source_database_name : String,
          @source_table_name : String,
          @workgroup_name : String,
          @activate_case_sensitive_identifier : Bool? = nil,
          @source_schema_name : String? = nil,
          @target_database_name : String? = nil,
          @target_schema_name : String? = nil
        )
        end
      end

      struct RestoreTableFromRecoveryPointResponse
        include JSON::Serializable

        @[JSON::Field(key: "tableRestoreStatus")]
        getter table_restore_status : Types::TableRestoreStatus?

        def initialize(
          @table_restore_status : Types::TableRestoreStatus? = nil
        )
        end
      end

      struct RestoreTableFromSnapshotRequest
        include JSON::Serializable

        # The namespace of the snapshot to restore from.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The name of the table to create from the restore operation.
        @[JSON::Field(key: "newTableName")]
        getter new_table_name : String

        # The name of the snapshot to restore the table from.
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String

        # The name of the source database that contains the table being restored.
        @[JSON::Field(key: "sourceDatabaseName")]
        getter source_database_name : String

        # The name of the source table being restored.
        @[JSON::Field(key: "sourceTableName")]
        getter source_table_name : String

        # The workgroup to restore the table to.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        # Indicates whether name identifiers for database, schema, and table are case sensitive. If true, the
        # names are case sensitive. If false, the names are not case sensitive. The default is false.
        @[JSON::Field(key: "activateCaseSensitiveIdentifier")]
        getter activate_case_sensitive_identifier : Bool?

        # The name of the source schema that contains the table being restored.
        @[JSON::Field(key: "sourceSchemaName")]
        getter source_schema_name : String?

        # The name of the database to restore the table to.
        @[JSON::Field(key: "targetDatabaseName")]
        getter target_database_name : String?

        # The name of the schema to restore the table to.
        @[JSON::Field(key: "targetSchemaName")]
        getter target_schema_name : String?

        def initialize(
          @namespace_name : String,
          @new_table_name : String,
          @snapshot_name : String,
          @source_database_name : String,
          @source_table_name : String,
          @workgroup_name : String,
          @activate_case_sensitive_identifier : Bool? = nil,
          @source_schema_name : String? = nil,
          @target_database_name : String? = nil,
          @target_schema_name : String? = nil
        )
        end
      end

      struct RestoreTableFromSnapshotResponse
        include JSON::Serializable

        # The TableRestoreStatus object that contains the status of the restore operation.
        @[JSON::Field(key: "tableRestoreStatus")]
        getter table_restore_status : Types::TableRestoreStatus?

        def initialize(
          @table_restore_status : Types::TableRestoreStatus? = nil
        )
        end
      end

      # The schedule of when Amazon Redshift Serverless should run the scheduled action.
      struct Schedule
        include JSON::Serializable

        # The timestamp of when Amazon Redshift Serverless should run the scheduled action. Timestamp is in
        # UTC. Format of at expression is yyyy-mm-ddThh:mm:ss . For example, 2016-03-04T17:27:00 .
        @[JSON::Field(key: "at", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter at : Time?

        # The cron expression to use to schedule a recurring scheduled action. Schedule invocations must be
        # separated by at least one hour. Times are in UTC. Format of cron expressions is (Minutes Hours
        # Day-of-month Month Day-of-week Year) . For example, "(0 10 ? * MON *)" . For more information, see
        # Cron Expressions in the Amazon CloudWatch Events User Guide .
        @[JSON::Field(key: "cron")]
        getter cron : String?

        def initialize(
          @at : Time? = nil,
          @cron : String? = nil
        )
        end
      end

      # Contains names of objects associated with a scheduled action.
      struct ScheduledActionAssociation
        include JSON::Serializable

        # Name of associated Amazon Redshift Serverless namespace.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # Name of associated scheduled action.
        @[JSON::Field(key: "scheduledActionName")]
        getter scheduled_action_name : String?

        def initialize(
          @namespace_name : String? = nil,
          @scheduled_action_name : String? = nil
        )
        end
      end

      # The returned scheduled action object.
      struct ScheduledActionResponse
        include JSON::Serializable

        # The end time of
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The end time in UTC when the schedule is no longer active. After this time, the scheduled action
        # does not trigger.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # An array of timestamps of when the next scheduled actions will trigger.
        @[JSON::Field(key: "nextInvocations")]
        getter next_invocations : Array(Time)?

        # The ARN of the IAM role to assume to run the scheduled action. This IAM role must have permission to
        # run the Amazon Redshift Serverless API operation in the scheduled action. This IAM role must allow
        # the Amazon Redshift scheduler to schedule creating snapshots. (Principal
        # scheduler.redshift.amazonaws.com) to assume permissions on your behalf. For more information about
        # the IAM role to use with the Amazon Redshift scheduler, see Using Identity-Based Policies for Amazon
        # Redshift in the Amazon Redshift Management Guide
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The schedule for a one-time (at timestamp format) or recurring (cron format) scheduled action.
        # Schedule invocations must be separated by at least one hour. Times are in UTC. Format of at
        # timestamp is yyyy-mm-ddThh:mm:ss . For example, 2016-03-04T17:27:00 . Format of cron expression is
        # (Minutes Hours Day-of-month Month Day-of-week Year) . For example, "(0 10 ? * MON *)" . For more
        # information, see Cron Expressions in the Amazon CloudWatch Events User Guide .
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The description of the scheduled action.
        @[JSON::Field(key: "scheduledActionDescription")]
        getter scheduled_action_description : String?

        # The name of the scheduled action.
        @[JSON::Field(key: "scheduledActionName")]
        getter scheduled_action_name : String?

        # The uuid of the scheduled action.
        @[JSON::Field(key: "scheduledActionUuid")]
        getter scheduled_action_uuid : String?

        # The start time in UTC when the schedule is active. Before this time, the scheduled action does not
        # trigger.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The state of the scheduled action.
        @[JSON::Field(key: "state")]
        getter state : String?

        @[JSON::Field(key: "targetAction")]
        getter target_action : Types::TargetAction?

        def initialize(
          @end_time : Time? = nil,
          @namespace_name : String? = nil,
          @next_invocations : Array(Time)? = nil,
          @role_arn : String? = nil,
          @schedule : Types::Schedule? = nil,
          @scheduled_action_description : String? = nil,
          @scheduled_action_name : String? = nil,
          @scheduled_action_uuid : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @target_action : Types::TargetAction? = nil
        )
        end
      end

      # Defines a track that determines which Amazon Redshift version to apply after a new version is
      # released. If the value for ServerlessTrack is current , the workgroup is updated to the most
      # recently certified release. If the value is trailing , the workgroup is updated to the previously
      # certified release.
      struct ServerlessTrack
        include JSON::Serializable

        # The name of the track. Valid values are current and trailing .
        @[JSON::Field(key: "trackName")]
        getter track_name : String?

        # An array of UpdateTarget objects to update with the track.
        @[JSON::Field(key: "updateTargets")]
        getter update_targets : Array(Types::UpdateTarget)?

        # The workgroup version number for the workgroup release.
        @[JSON::Field(key: "workgroupVersion")]
        getter workgroup_version : String?

        def initialize(
          @track_name : String? = nil,
          @update_targets : Array(Types::UpdateTarget)? = nil,
          @workgroup_version : String? = nil
        )
        end
      end

      # The service limit was exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A snapshot object that contains databases.
      struct Snapshot
        include JSON::Serializable

        # All of the Amazon Web Services accounts that have access to restore a snapshot to a provisioned
        # cluster.
        @[JSON::Field(key: "accountsWithProvisionedRestoreAccess")]
        getter accounts_with_provisioned_restore_access : Array(String)?

        # All of the Amazon Web Services accounts that have access to restore a snapshot to a namespace.
        @[JSON::Field(key: "accountsWithRestoreAccess")]
        getter accounts_with_restore_access : Array(String)?

        # The size of the incremental backup in megabytes.
        @[JSON::Field(key: "actualIncrementalBackupSizeInMegaBytes")]
        getter actual_incremental_backup_size_in_mega_bytes : Float64?

        # The Amazon Resource Name (ARN) for the namespace's admin user credentials secret.
        @[JSON::Field(key: "adminPasswordSecretArn")]
        getter admin_password_secret_arn : String?

        # The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's admin
        # credentials secret.
        @[JSON::Field(key: "adminPasswordSecretKmsKeyId")]
        getter admin_password_secret_kms_key_id : String?

        # The username of the database within a snapshot.
        @[JSON::Field(key: "adminUsername")]
        getter admin_username : String?

        # The size in megabytes of the data that has been backed up to a snapshot.
        @[JSON::Field(key: "backupProgressInMegaBytes")]
        getter backup_progress_in_mega_bytes : Float64?

        # The rate at which data is backed up into a snapshot in megabytes per second.
        @[JSON::Field(key: "currentBackupRateInMegaBytesPerSecond")]
        getter current_backup_rate_in_mega_bytes_per_second : Float64?

        # The amount of time it took to back up data into a snapshot.
        @[JSON::Field(key: "elapsedTimeInSeconds")]
        getter elapsed_time_in_seconds : Int64?

        # The estimated amount of seconds until the snapshot completes backup.
        @[JSON::Field(key: "estimatedSecondsToCompletion")]
        getter estimated_seconds_to_completion : Int64?

        # The unique identifier of the KMS key used to encrypt the snapshot.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The Amazon Resource Name (ARN) of the namespace the snapshot was created from.
        @[JSON::Field(key: "namespaceArn")]
        getter namespace_arn : String?

        # The name of the namepsace.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # The owner Amazon Web Services; account of the snapshot.
        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The Amazon Resource Name (ARN) of the snapshot.
        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String?

        # The timestamp of when the snapshot was created.
        @[JSON::Field(key: "snapshotCreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter snapshot_create_time : Time?

        # The name of the snapshot.
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String?

        # The amount of days until the snapshot is deleted.
        @[JSON::Field(key: "snapshotRemainingDays")]
        getter snapshot_remaining_days : Int32?

        # The period of time, in days, of how long the snapshot is retained.
        @[JSON::Field(key: "snapshotRetentionPeriod")]
        getter snapshot_retention_period : Int32?

        # The timestamp of when data within the snapshot started getting retained.
        @[JSON::Field(key: "snapshotRetentionStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter snapshot_retention_start_time : Time?

        # The status of the snapshot.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The total size, in megabytes, of how big the snapshot is.
        @[JSON::Field(key: "totalBackupSizeInMegaBytes")]
        getter total_backup_size_in_mega_bytes : Float64?

        def initialize(
          @accounts_with_provisioned_restore_access : Array(String)? = nil,
          @accounts_with_restore_access : Array(String)? = nil,
          @actual_incremental_backup_size_in_mega_bytes : Float64? = nil,
          @admin_password_secret_arn : String? = nil,
          @admin_password_secret_kms_key_id : String? = nil,
          @admin_username : String? = nil,
          @backup_progress_in_mega_bytes : Float64? = nil,
          @current_backup_rate_in_mega_bytes_per_second : Float64? = nil,
          @elapsed_time_in_seconds : Int64? = nil,
          @estimated_seconds_to_completion : Int64? = nil,
          @kms_key_id : String? = nil,
          @namespace_arn : String? = nil,
          @namespace_name : String? = nil,
          @owner_account : String? = nil,
          @snapshot_arn : String? = nil,
          @snapshot_create_time : Time? = nil,
          @snapshot_name : String? = nil,
          @snapshot_remaining_days : Int32? = nil,
          @snapshot_retention_period : Int32? = nil,
          @snapshot_retention_start_time : Time? = nil,
          @status : String? = nil,
          @total_backup_size_in_mega_bytes : Float64? = nil
        )
        end
      end

      # The object that you configure to copy snapshots from one namespace to a namespace in another Amazon
      # Web Services Region.
      struct SnapshotCopyConfiguration
        include JSON::Serializable

        # The ID of the KMS key to use to encrypt your snapshots in the destination Amazon Web Services
        # Region.
        @[JSON::Field(key: "destinationKmsKeyId")]
        getter destination_kms_key_id : String?

        # The destination Amazon Web Services Region to copy snapshots to.
        @[JSON::Field(key: "destinationRegion")]
        getter destination_region : String?

        # The name of the namespace to copy snapshots from in the source Amazon Web Services Region.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # The ARN of the snapshot copy configuration object.
        @[JSON::Field(key: "snapshotCopyConfigurationArn")]
        getter snapshot_copy_configuration_arn : String?

        # The ID of the snapshot copy configuration object.
        @[JSON::Field(key: "snapshotCopyConfigurationId")]
        getter snapshot_copy_configuration_id : String?

        # The retention period of snapshots that are copied to the destination Amazon Web Services Region.
        @[JSON::Field(key: "snapshotRetentionPeriod")]
        getter snapshot_retention_period : Int32?

        def initialize(
          @destination_kms_key_id : String? = nil,
          @destination_region : String? = nil,
          @namespace_name : String? = nil,
          @snapshot_copy_configuration_arn : String? = nil,
          @snapshot_copy_configuration_id : String? = nil,
          @snapshot_retention_period : Int32? = nil
        )
        end
      end

      # Contains information about a table restore request.
      struct TableRestoreStatus
        include JSON::Serializable

        # A message that explains the returned status. For example, if the status of the operation is FAILED ,
        # the message explains why the operation failed.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The namespace of the table being restored from.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # The name of the table to create from the restore operation.
        @[JSON::Field(key: "newTableName")]
        getter new_table_name : String?

        # The amount of data restored to the new table so far, in megabytes (MB).
        @[JSON::Field(key: "progressInMegaBytes")]
        getter progress_in_mega_bytes : Int64?

        # The ID of the recovery point being restored from.
        @[JSON::Field(key: "recoveryPointId")]
        getter recovery_point_id : String?

        # The time that the table restore request was made, in Universal Coordinated Time (UTC).
        @[JSON::Field(key: "requestTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter request_time : Time?

        # The name of the snapshot being restored from.
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String?

        # The name of the source database being restored from.
        @[JSON::Field(key: "sourceDatabaseName")]
        getter source_database_name : String?

        # The name of the source schema being restored from.
        @[JSON::Field(key: "sourceSchemaName")]
        getter source_schema_name : String?

        # The name of the source table being restored from.
        @[JSON::Field(key: "sourceTableName")]
        getter source_table_name : String?

        # A value that describes the current state of the table restore request. Possible values are SUCCEEDED
        # , FAILED , CANCELED , PENDING , and IN_PROGRESS .
        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the RestoreTableFromSnapshot request.
        @[JSON::Field(key: "tableRestoreRequestId")]
        getter table_restore_request_id : String?

        # The name of the database to restore to.
        @[JSON::Field(key: "targetDatabaseName")]
        getter target_database_name : String?

        # The name of the schema to restore to.
        @[JSON::Field(key: "targetSchemaName")]
        getter target_schema_name : String?

        # The total amount of data to restore to the new table, in megabytes (MB).
        @[JSON::Field(key: "totalDataInMegaBytes")]
        getter total_data_in_mega_bytes : Int64?

        # The name of the workgroup being restored from.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @message : String? = nil,
          @namespace_name : String? = nil,
          @new_table_name : String? = nil,
          @progress_in_mega_bytes : Int64? = nil,
          @recovery_point_id : String? = nil,
          @request_time : Time? = nil,
          @snapshot_name : String? = nil,
          @source_database_name : String? = nil,
          @source_schema_name : String? = nil,
          @source_table_name : String? = nil,
          @status : String? = nil,
          @table_restore_request_id : String? = nil,
          @target_database_name : String? = nil,
          @target_schema_name : String? = nil,
          @total_data_in_mega_bytes : Int64? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      # A map of key-value pairs.
      struct Tag
        include JSON::Serializable

        # The key to use in the tag.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the tag.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to tag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The map of the key-value pairs used to tag the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A JSON format string of the Amazon Redshift Serverless API operation with input parameters. The
      # following is an example of a target action. "{"CreateSnapshot": {"NamespaceName":
      # "sampleNamespace","SnapshotName": "sampleSnapshot", "retentionPeriod": "1"}}"
      struct TargetAction
        include JSON::Serializable

        @[JSON::Field(key: "createSnapshot")]
        getter create_snapshot : Types::CreateSnapshotScheduleActionParameters?

        def initialize(
          @create_snapshot : Types::CreateSnapshotScheduleActionParameters? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The request exceeded the number of tags allowed for a resource.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the resource that exceeded the number of tags allowed for a resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove tags from.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag or set of tags to remove from the resource.
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

      struct UpdateCustomDomainAssociationRequest
        include JSON::Serializable

        # The custom domain name’s certificate Amazon resource name (ARN). This is optional.
        @[JSON::Field(key: "customDomainCertificateArn")]
        getter custom_domain_certificate_arn : String

        # The custom domain name associated with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String

        # The name of the workgroup associated with the database.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        def initialize(
          @custom_domain_certificate_arn : String,
          @custom_domain_name : String,
          @workgroup_name : String
        )
        end
      end

      struct UpdateCustomDomainAssociationResponse
        include JSON::Serializable

        # The custom domain name’s certificate Amazon resource name (ARN).
        @[JSON::Field(key: "customDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The expiration time for the certificate.
        @[JSON::Field(key: "customDomainCertificateExpiryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter custom_domain_certificate_expiry_time : Time?

        # The custom domain name associated with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The name of the workgroup associated with the database.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_certificate_expiry_time : Time? = nil,
          @custom_domain_name : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      struct UpdateEndpointAccessRequest
        include JSON::Serializable

        # The name of the VPC endpoint to update.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String

        # The list of VPC security groups associated with the endpoint after the endpoint is modified.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @endpoint_name : String,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      struct UpdateEndpointAccessResponse
        include JSON::Serializable

        # The updated VPC endpoint.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : Types::EndpointAccess?

        def initialize(
          @endpoint : Types::EndpointAccess? = nil
        )
        end
      end

      struct UpdateLakehouseConfigurationRequest
        include JSON::Serializable

        # The name of the namespace whose lakehouse configuration you want to modify.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The name of the Glue Data Catalog that will be associated with the namespace enabled with Amazon
        # Redshift federated permissions. Pattern: ^[a-z0-9_-]*[a-z]+[a-z0-9_-]*$
        @[JSON::Field(key: "catalogName")]
        getter catalog_name : String?

        # A boolean value that, if true , validates the request without actually updating the lakehouse
        # configuration. Use this to check for errors before making changes.
        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        # The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling Amazon Web
        # Services IAM Identity Center trusted identity propagation on a namespace enabled with Amazon
        # Redshift federated permissions.
        @[JSON::Field(key: "lakehouseIdcApplicationArn")]
        getter lakehouse_idc_application_arn : String?

        # Modifies the Amazon Web Services IAM Identity Center trusted identity propagation on a namespace
        # enabled with Amazon Redshift federated permissions. Valid values are Associate or Disassociate .
        @[JSON::Field(key: "lakehouseIdcRegistration")]
        getter lakehouse_idc_registration : String?

        # Specifies whether to register or deregister the namespace with Amazon Redshift federated
        # permissions. Valid values are Register or Deregister .
        @[JSON::Field(key: "lakehouseRegistration")]
        getter lakehouse_registration : String?

        def initialize(
          @namespace_name : String,
          @catalog_name : String? = nil,
          @dry_run : Bool? = nil,
          @lakehouse_idc_application_arn : String? = nil,
          @lakehouse_idc_registration : String? = nil,
          @lakehouse_registration : String? = nil
        )
        end
      end

      struct UpdateLakehouseConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Glue Data Catalog associated with the lakehouse configuration.
        @[JSON::Field(key: "catalogArn")]
        getter catalog_arn : String?

        # The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling Amazon Web
        # Services IAM Identity Center trusted identity propagation.
        @[JSON::Field(key: "lakehouseIdcApplicationArn")]
        getter lakehouse_idc_application_arn : String?

        # The current status of the lakehouse registration. Indicates whether the namespace is successfully
        # registered with Amazon Redshift federated permissions.
        @[JSON::Field(key: "lakehouseRegistrationStatus")]
        getter lakehouse_registration_status : String?

        # The name of the namespace.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        def initialize(
          @catalog_arn : String? = nil,
          @lakehouse_idc_application_arn : String? = nil,
          @lakehouse_registration_status : String? = nil,
          @namespace_name : String? = nil
        )
        end
      end

      struct UpdateNamespaceRequest
        include JSON::Serializable

        # The name of the namespace to update. You can't update the name of a namespace once it is created.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The ID of the Key Management Service (KMS) key used to encrypt and store the namespace's admin
        # credentials secret. You can only use this parameter if manageAdminPassword is true.
        @[JSON::Field(key: "adminPasswordSecretKmsKeyId")]
        getter admin_password_secret_kms_key_id : String?

        # The password of the administrator for the first database created in the namespace. This parameter
        # must be updated together with adminUsername . You can't use adminUserPassword if manageAdminPassword
        # is true.
        @[JSON::Field(key: "adminUserPassword")]
        getter admin_user_password : String?

        # The username of the administrator for the first database created in the namespace. This parameter
        # must be updated together with adminUserPassword .
        @[JSON::Field(key: "adminUsername")]
        getter admin_username : String?

        # The Amazon Resource Name (ARN) of the IAM role to set as a default in the namespace. This parameter
        # must be updated together with iamRoles .
        @[JSON::Field(key: "defaultIamRoleArn")]
        getter default_iam_role_arn : String?

        # A list of IAM roles to associate with the namespace. This parameter must be updated together with
        # defaultIamRoleArn .
        @[JSON::Field(key: "iamRoles")]
        getter iam_roles : Array(String)?

        # The ID of the Amazon Web Services Key Management Service key used to encrypt your data.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The types of logs the namespace can export. The export types are userlog , connectionlog , and
        # useractivitylog .
        @[JSON::Field(key: "logExports")]
        getter log_exports : Array(String)?

        # If true , Amazon Redshift uses Secrets Manager to manage the namespace's admin credentials. You
        # can't use adminUserPassword if manageAdminPassword is true. If manageAdminPassword is false or not
        # set, Amazon Redshift uses adminUserPassword for the admin user account's password.
        @[JSON::Field(key: "manageAdminPassword")]
        getter manage_admin_password : Bool?

        def initialize(
          @namespace_name : String,
          @admin_password_secret_kms_key_id : String? = nil,
          @admin_user_password : String? = nil,
          @admin_username : String? = nil,
          @default_iam_role_arn : String? = nil,
          @iam_roles : Array(String)? = nil,
          @kms_key_id : String? = nil,
          @log_exports : Array(String)? = nil,
          @manage_admin_password : Bool? = nil
        )
        end
      end

      struct UpdateNamespaceResponse
        include JSON::Serializable

        # A list of tag instances.
        @[JSON::Field(key: "namespace")]
        getter namespace : Types::Namespace

        def initialize(
          @namespace : Types::Namespace
        )
        end
      end

      struct UpdateScheduledActionRequest
        include JSON::Serializable

        # The name of the scheduled action to update to.
        @[JSON::Field(key: "scheduledActionName")]
        getter scheduled_action_name : String

        # Specifies whether to enable the scheduled action.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The end time in UTC of the scheduled action to update.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The ARN of the IAM role to assume to run the scheduled action. This IAM role must have permission to
        # run the Amazon Redshift Serverless API operation in the scheduled action. This IAM role must allow
        # the Amazon Redshift scheduler to schedule creating snapshots (Principal
        # scheduler.redshift.amazonaws.com) to assume permissions on your behalf. For more information about
        # the IAM role to use with the Amazon Redshift scheduler, see Using Identity-Based Policies for Amazon
        # Redshift in the Amazon Redshift Management Guide
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The schedule for a one-time (at timestamp format) or recurring (cron format) scheduled action.
        # Schedule invocations must be separated by at least one hour. Times are in UTC. Format of at
        # timestamp is yyyy-mm-ddThh:mm:ss . For example, 2016-03-04T17:27:00 . Format of cron expression is
        # (Minutes Hours Day-of-month Month Day-of-week Year) . For example, "(0 10 ? * MON *)" . For more
        # information, see Cron Expressions in the Amazon CloudWatch Events User Guide .
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The descripion of the scheduled action to update to.
        @[JSON::Field(key: "scheduledActionDescription")]
        getter scheduled_action_description : String?

        # The start time in UTC of the scheduled action to update to.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        @[JSON::Field(key: "targetAction")]
        getter target_action : Types::TargetAction?

        def initialize(
          @scheduled_action_name : String,
          @enabled : Bool? = nil,
          @end_time : Time? = nil,
          @role_arn : String? = nil,
          @schedule : Types::Schedule? = nil,
          @scheduled_action_description : String? = nil,
          @start_time : Time? = nil,
          @target_action : Types::TargetAction? = nil
        )
        end
      end

      struct UpdateScheduledActionResponse
        include JSON::Serializable

        # The ScheduledAction object that was updated.
        @[JSON::Field(key: "scheduledAction")]
        getter scheduled_action : Types::ScheduledActionResponse?

        def initialize(
          @scheduled_action : Types::ScheduledActionResponse? = nil
        )
        end
      end

      struct UpdateSnapshotCopyConfigurationRequest
        include JSON::Serializable

        # The ID of the snapshot copy configuration to update.
        @[JSON::Field(key: "snapshotCopyConfigurationId")]
        getter snapshot_copy_configuration_id : String

        # The new retention period of how long to keep a snapshot in the destination Amazon Web Services
        # Region.
        @[JSON::Field(key: "snapshotRetentionPeriod")]
        getter snapshot_retention_period : Int32?

        def initialize(
          @snapshot_copy_configuration_id : String,
          @snapshot_retention_period : Int32? = nil
        )
        end
      end

      struct UpdateSnapshotCopyConfigurationResponse
        include JSON::Serializable

        # The updated snapshot copy configuration object.
        @[JSON::Field(key: "snapshotCopyConfiguration")]
        getter snapshot_copy_configuration : Types::SnapshotCopyConfiguration

        def initialize(
          @snapshot_copy_configuration : Types::SnapshotCopyConfiguration
        )
        end
      end

      struct UpdateSnapshotRequest
        include JSON::Serializable

        # The name of the snapshot.
        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String

        # The new retention period of the snapshot.
        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : Int32?

        def initialize(
          @snapshot_name : String,
          @retention_period : Int32? = nil
        )
        end
      end

      struct UpdateSnapshotResponse
        include JSON::Serializable

        # The updated snapshot object.
        @[JSON::Field(key: "snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      # A track that you can switch the current track to.
      struct UpdateTarget
        include JSON::Serializable

        # The name of the new track.
        @[JSON::Field(key: "trackName")]
        getter track_name : String?

        # The workgroup version for the new track.
        @[JSON::Field(key: "workgroupVersion")]
        getter workgroup_version : String?

        def initialize(
          @track_name : String? = nil,
          @workgroup_version : String? = nil
        )
        end
      end

      struct UpdateUsageLimitRequest
        include JSON::Serializable

        # The identifier of the usage limit to update.
        @[JSON::Field(key: "usageLimitId")]
        getter usage_limit_id : String

        # The new limit amount. If time-based, this amount is in Redshift Processing Units (RPU) consumed per
        # hour. If data-based, this amount is in terabytes (TB) of data transferred between Regions in
        # cross-account sharing. The value must be a positive number.
        @[JSON::Field(key: "amount")]
        getter amount : Int64?

        # The new action that Amazon Redshift Serverless takes when the limit is reached.
        @[JSON::Field(key: "breachAction")]
        getter breach_action : String?

        def initialize(
          @usage_limit_id : String,
          @amount : Int64? = nil,
          @breach_action : String? = nil
        )
        end
      end

      struct UpdateUsageLimitResponse
        include JSON::Serializable

        # The updated usage limit object.
        @[JSON::Field(key: "usageLimit")]
        getter usage_limit : Types::UsageLimit?

        def initialize(
          @usage_limit : Types::UsageLimit? = nil
        )
        end
      end

      struct UpdateWorkgroupRequest
        include JSON::Serializable

        # The name of the workgroup to update. You can't update the name of a workgroup once it is created.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        # The new base data warehouse capacity in Redshift Processing Units (RPUs).
        @[JSON::Field(key: "baseCapacity")]
        getter base_capacity : Int32?

        # An array of parameters to set for advanced control over a database. The options are auto_mv ,
        # datestyle , enable_case_sensitive_identifier , enable_user_activity_logging , query_group ,
        # search_path , require_ssl , use_fips_ssl , and either wlm_json_configuration or query monitoring
        # metrics that let you define performance boundaries. You can either specify individual query
        # monitoring metrics (such as max_scan_row_count , max_query_execution_time ) or use
        # wlm_json_configuration to define query queues with rules, but not both. If you're using
        # wlm_json_configuration , the maximum size of parameterValue is 8000 characters. For more information
        # about query monitoring rules and available metrics, see Query monitoring metrics for Amazon Redshift
        # Serverless .
        @[JSON::Field(key: "configParameters")]
        getter config_parameters : Array(Types::ConfigParameter)?

        # The value that specifies whether to turn on enhanced virtual private cloud (VPC) routing, which
        # forces Amazon Redshift Serverless to route traffic through your VPC.
        @[JSON::Field(key: "enhancedVpcRouting")]
        getter enhanced_vpc_routing : Bool?

        # If true , allocates additional compute resources for running automatic optimization operations.
        # Default: false
        @[JSON::Field(key: "extraComputeForAutomaticOptimization")]
        getter extra_compute_for_automatic_optimization : Bool?

        # The IP address type that the workgroup supports. Possible values are ipv4 and dualstack .
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The maximum data-warehouse capacity Amazon Redshift Serverless uses to serve queries. The max
        # capacity is specified in RPUs.
        @[JSON::Field(key: "maxCapacity")]
        getter max_capacity : Int32?

        # The custom port to use when connecting to a workgroup. Valid port ranges are 5431-5455 and
        # 8191-8215. The default is 5439.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # An object that represents the price performance target settings for the workgroup.
        @[JSON::Field(key: "pricePerformanceTarget")]
        getter price_performance_target : Types::PerformanceTarget?

        # A value that specifies whether the workgroup can be accessible from a public network.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # An array of security group IDs to associate with the workgroup.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # An array of VPC subnet IDs to associate with the workgroup.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # An optional parameter for the name of the track for the workgroup. If you don't provide a track
        # name, the workgroup is assigned to the current track.
        @[JSON::Field(key: "trackName")]
        getter track_name : String?

        def initialize(
          @workgroup_name : String,
          @base_capacity : Int32? = nil,
          @config_parameters : Array(Types::ConfigParameter)? = nil,
          @enhanced_vpc_routing : Bool? = nil,
          @extra_compute_for_automatic_optimization : Bool? = nil,
          @ip_address_type : String? = nil,
          @max_capacity : Int32? = nil,
          @port : Int32? = nil,
          @price_performance_target : Types::PerformanceTarget? = nil,
          @publicly_accessible : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @track_name : String? = nil
        )
        end
      end

      struct UpdateWorkgroupResponse
        include JSON::Serializable

        # The updated workgroup object.
        @[JSON::Field(key: "workgroup")]
        getter workgroup : Types::Workgroup

        def initialize(
          @workgroup : Types::Workgroup
        )
        end
      end

      # The usage limit object.
      struct UsageLimit
        include JSON::Serializable

        # The limit amount. If time-based, this amount is in RPUs consumed per hour. If data-based, this
        # amount is in terabytes (TB). The value must be a positive number.
        @[JSON::Field(key: "amount")]
        getter amount : Int64?

        # The action that Amazon Redshift Serverless takes when the limit is reached.
        @[JSON::Field(key: "breachAction")]
        getter breach_action : String?

        # The time period that the amount applies to. A weekly period begins on Sunday. The default is
        # monthly.
        @[JSON::Field(key: "period")]
        getter period : String?

        # The Amazon Resource Name (ARN) that identifies the Amazon Redshift Serverless resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The Amazon Resource Name (ARN) of the resource associated with the usage limit.
        @[JSON::Field(key: "usageLimitArn")]
        getter usage_limit_arn : String?

        # The identifier of the usage limit.
        @[JSON::Field(key: "usageLimitId")]
        getter usage_limit_id : String?

        # The Amazon Redshift Serverless feature to limit.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String?

        def initialize(
          @amount : Int64? = nil,
          @breach_action : String? = nil,
          @period : String? = nil,
          @resource_arn : String? = nil,
          @usage_limit_arn : String? = nil,
          @usage_limit_id : String? = nil,
          @usage_type : String? = nil
        )
        end
      end

      # The input failed to satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The connection endpoint for connecting to Amazon Redshift Serverless through the proxy.
      struct VpcEndpoint
        include JSON::Serializable

        # One or more network interfaces of the endpoint. Also known as an interface endpoint.
        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # The connection endpoint ID for connecting to Amazon Redshift Serverless.
        @[JSON::Field(key: "vpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The VPC identifier that the endpoint is associated with.
        @[JSON::Field(key: "vpcId")]
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
        @[JSON::Field(key: "status")]
        getter status : String?

        # The unique identifier of the VPC security group.
        @[JSON::Field(key: "vpcSecurityGroupId")]
        getter vpc_security_group_id : String?

        def initialize(
          @status : String? = nil,
          @vpc_security_group_id : String? = nil
        )
        end
      end

      # The collection of computing resources from which an endpoint is created.
      struct Workgroup
        include JSON::Serializable

        # The base data warehouse capacity of the workgroup in Redshift Processing Units (RPUs).
        @[JSON::Field(key: "baseCapacity")]
        getter base_capacity : Int32?

        # An array of parameters to set for advanced control over a database. The options are auto_mv ,
        # datestyle , enable_case_sensitive_identifier , enable_user_activity_logging , query_group ,
        # search_path , require_ssl , use_fips_ssl , and either wlm_json_configuration or query monitoring
        # metrics that let you define performance boundaries. You can either specify individual query
        # monitoring metrics (such as max_scan_row_count , max_query_execution_time ) or use
        # wlm_json_configuration to define query queues with rules, but not both. If you're using
        # wlm_json_configuration , the maximum size of parameterValue is 8000 characters. For more information
        # about query monitoring rules and available metrics, see Query monitoring metrics for Amazon Redshift
        # Serverless .
        @[JSON::Field(key: "configParameters")]
        getter config_parameters : Array(Types::ConfigParameter)?

        # The creation date of the workgroup.
        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # A list of VPCs. Each entry is the unique identifier of a virtual private cloud with access to Amazon
        # Redshift Serverless. If all of the VPCs for the grantee are allowed, it shows an asterisk.
        @[JSON::Field(key: "crossAccountVpcs")]
        getter cross_account_vpcs : Array(String)?

        # The custom domain name’s certificate Amazon resource name (ARN).
        @[JSON::Field(key: "customDomainCertificateArn")]
        getter custom_domain_certificate_arn : String?

        # The expiration time for the certificate.
        @[JSON::Field(key: "customDomainCertificateExpiryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter custom_domain_certificate_expiry_time : Time?

        # The custom domain name associated with the workgroup.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The endpoint that is created from the workgroup.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : Types::Endpoint?

        # The value that specifies whether to enable enhanced virtual private cloud (VPC) routing, which
        # forces Amazon Redshift Serverless to route traffic through your VPC.
        @[JSON::Field(key: "enhancedVpcRouting")]
        getter enhanced_vpc_routing : Bool?

        # A boolean value that, if true , indicates that the workgroup allocates additional compute resources
        # to run automatic optimization operations. Default: false
        @[JSON::Field(key: "extraComputeForAutomaticOptimization")]
        getter extra_compute_for_automatic_optimization : Bool?

        # The IP address type that the workgroup supports. Possible values are ipv4 and dualstack .
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The maximum data-warehouse capacity Amazon Redshift Serverless uses to serve queries. The max
        # capacity is specified in RPUs.
        @[JSON::Field(key: "maxCapacity")]
        getter max_capacity : Int32?

        # The namespace the workgroup is associated with.
        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # The patch version of your Amazon Redshift Serverless workgroup. For more information about patch
        # versions, see Cluster versions for Amazon Redshift .
        @[JSON::Field(key: "patchVersion")]
        getter patch_version : String?

        # The name for the track that you want to assign to the workgroup. When the track changes, the
        # workgroup is switched to the latest workgroup release available for the track. At this point, the
        # track name is applied.
        @[JSON::Field(key: "pendingTrackName")]
        getter pending_track_name : String?

        # The custom port to use when connecting to a workgroup. Valid port ranges are 5431-5455 and
        # 8191-8215. The default is 5439.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # An object that represents the price performance target settings for the workgroup.
        @[JSON::Field(key: "pricePerformanceTarget")]
        getter price_performance_target : Types::PerformanceTarget?

        # A value that specifies whether the workgroup can be accessible from a public network.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # An array of security group IDs to associate with the workgroup.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The status of the workgroup.
        @[JSON::Field(key: "status")]
        getter status : String?

        # An array of subnet IDs the workgroup is associated with.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The name of the track for the workgroup.
        @[JSON::Field(key: "trackName")]
        getter track_name : String?

        # The Amazon Resource Name (ARN) that links to the workgroup.
        @[JSON::Field(key: "workgroupArn")]
        getter workgroup_arn : String?

        # The unique identifier of the workgroup.
        @[JSON::Field(key: "workgroupId")]
        getter workgroup_id : String?

        # The name of the workgroup.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        # The Amazon Redshift Serverless version of your workgroup. For more information about Amazon Redshift
        # Serverless versions, see Cluster versions for Amazon Redshift .
        @[JSON::Field(key: "workgroupVersion")]
        getter workgroup_version : String?

        def initialize(
          @base_capacity : Int32? = nil,
          @config_parameters : Array(Types::ConfigParameter)? = nil,
          @creation_date : Time? = nil,
          @cross_account_vpcs : Array(String)? = nil,
          @custom_domain_certificate_arn : String? = nil,
          @custom_domain_certificate_expiry_time : Time? = nil,
          @custom_domain_name : String? = nil,
          @endpoint : Types::Endpoint? = nil,
          @enhanced_vpc_routing : Bool? = nil,
          @extra_compute_for_automatic_optimization : Bool? = nil,
          @ip_address_type : String? = nil,
          @max_capacity : Int32? = nil,
          @namespace_name : String? = nil,
          @patch_version : String? = nil,
          @pending_track_name : String? = nil,
          @port : Int32? = nil,
          @price_performance_target : Types::PerformanceTarget? = nil,
          @publicly_accessible : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @track_name : String? = nil,
          @workgroup_arn : String? = nil,
          @workgroup_id : String? = nil,
          @workgroup_name : String? = nil,
          @workgroup_version : String? = nil
        )
        end
      end
    end
  end
end
