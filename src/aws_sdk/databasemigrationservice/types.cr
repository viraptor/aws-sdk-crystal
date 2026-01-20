require "json"
require "time"

module AwsSdk
  module DatabaseMigrationService
    module Types

      # DMS was denied access to the endpoint. Check that the role is correctly configured.

      struct AccessDeniedFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a quota for an Amazon Web Services account, for example the number of replication
      # instances allowed.

      struct AccountQuota
        include JSON::Serializable

        # The name of the DMS quota for this Amazon Web Services account.

        @[JSON::Field(key: "AccountQuotaName")]
        getter account_quota_name : String?

        # The maximum allowed value for the quota.

        @[JSON::Field(key: "Max")]
        getter max : Int64?

        # The amount currently used toward the quota maximum.

        @[JSON::Field(key: "Used")]
        getter used : Int64?

        def initialize(
          @account_quota_name : String? = nil,
          @max : Int64? = nil,
          @used : Int64? = nil
        )
        end
      end

      # Associates a set of tags with an DMS resource.

      struct AddTagsToResourceMessage
        include JSON::Serializable

        # Identifies the DMS resource to which tags should be added. The value for this parameter is an Amazon
        # Resource Name (ARN). For DMS, you can tag a replication instance, an endpoint, or a replication
        # task.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # One or more tags to be assigned to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct AddTagsToResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct ApplyPendingMaintenanceActionMessage
        include JSON::Serializable

        # The pending maintenance action to apply to this resource. Valid values: os-upgrade , system-update ,
        # db-upgrade , os-patch

        @[JSON::Field(key: "ApplyAction")]
        getter apply_action : String

        # A value that specifies the type of opt-in request, or undoes an opt-in request. You can't undo an
        # opt-in request of type immediate . Valid values: immediate - Apply the maintenance action
        # immediately. next-maintenance - Apply the maintenance action during the next maintenance window for
        # the resource. undo-opt-in - Cancel any existing next-maintenance opt-in requests.

        @[JSON::Field(key: "OptInType")]
        getter opt_in_type : String

        # The Amazon Resource Name (ARN) of the DMS resource that the pending maintenance action applies to.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String

        def initialize(
          @apply_action : String,
          @opt_in_type : String,
          @replication_instance_arn : String
        )
        end
      end


      struct ApplyPendingMaintenanceActionResponse
        include JSON::Serializable

        # The DMS resource that the pending maintenance action will be applied to.

        @[JSON::Field(key: "ResourcePendingMaintenanceActions")]
        getter resource_pending_maintenance_actions : Types::ResourcePendingMaintenanceActions?

        def initialize(
          @resource_pending_maintenance_actions : Types::ResourcePendingMaintenanceActions? = nil
        )
        end
      end

      # The name of an Availability Zone for use during database migration. AvailabilityZone is an optional
      # parameter to the CreateReplicationInstance operation, and it’s value relates to the Amazon Web
      # Services Region of an endpoint. For example, the availability zone of an endpoint in the us-east-1
      # region might be us-east-1a, us-east-1b, us-east-1c, or us-east-1d.

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

      # Provides information about the errors that occurred during the analysis of the source database.

      struct BatchStartRecommendationsErrorEntry
        include JSON::Serializable

        # The code of an error that occurred during the analysis of the source database.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The identifier of the source database.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String?

        # The information about the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @database_id : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct BatchStartRecommendationsRequest
        include JSON::Serializable

        # Provides information about source databases to analyze. After this analysis, Fleet Advisor
        # recommends target engines for each source database.

        @[JSON::Field(key: "Data")]
        getter data : Array(Types::StartRecommendationsRequestEntry)?

        def initialize(
          @data : Array(Types::StartRecommendationsRequestEntry)? = nil
        )
        end
      end


      struct BatchStartRecommendationsResponse
        include JSON::Serializable

        # A list with error details about the analysis of each source database.

        @[JSON::Field(key: "ErrorEntries")]
        getter error_entries : Array(Types::BatchStartRecommendationsErrorEntry)?

        def initialize(
          @error_entries : Array(Types::BatchStartRecommendationsErrorEntry)? = nil
        )
        end
      end


      struct CancelMetadataModelConversionMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # The identifier for the metadata model conversion operation to cancel. This operation was initiated
        # by StartMetadataModelConversion.

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String

        def initialize(
          @migration_project_identifier : String,
          @request_identifier : String
        )
        end
      end


      struct CancelMetadataModelConversionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Request")]
        getter request : Types::SchemaConversionRequest?

        def initialize(
          @request : Types::SchemaConversionRequest? = nil
        )
        end
      end


      struct CancelMetadataModelCreationMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # The identifier for the metadata model creation operation to cancel. This operation was initiated by
        # StartMetadataModelCreation .

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String

        def initialize(
          @migration_project_identifier : String,
          @request_identifier : String
        )
        end
      end


      struct CancelMetadataModelCreationResponse
        include JSON::Serializable


        @[JSON::Field(key: "Request")]
        getter request : Types::SchemaConversionRequest?

        def initialize(
          @request : Types::SchemaConversionRequest? = nil
        )
        end
      end


      struct CancelReplicationTaskAssessmentRunMessage
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the premigration assessment run to be canceled.

        @[JSON::Field(key: "ReplicationTaskAssessmentRunArn")]
        getter replication_task_assessment_run_arn : String

        def initialize(
          @replication_task_assessment_run_arn : String
        )
        end
      end


      struct CancelReplicationTaskAssessmentRunResponse
        include JSON::Serializable

        # The ReplicationTaskAssessmentRun object for the canceled assessment run.

        @[JSON::Field(key: "ReplicationTaskAssessmentRun")]
        getter replication_task_assessment_run : Types::ReplicationTaskAssessmentRun?

        def initialize(
          @replication_task_assessment_run : Types::ReplicationTaskAssessmentRun? = nil
        )
        end
      end

      # The SSL certificate that can be used to encrypt connections between the endpoints and the
      # replication instance.

      struct Certificate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the certificate.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The date that the certificate was created.

        @[JSON::Field(key: "CertificateCreationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter certificate_creation_date : Time?

        # A customer-assigned name for the certificate. Identifiers must begin with a letter and must contain
        # only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive
        # hyphens.

        @[JSON::Field(key: "CertificateIdentifier")]
        getter certificate_identifier : String?

        # The owner of the certificate.

        @[JSON::Field(key: "CertificateOwner")]
        getter certificate_owner : String?

        # The contents of a .pem file, which contains an X.509 certificate.

        @[JSON::Field(key: "CertificatePem")]
        getter certificate_pem : String?

        # The location of an imported Oracle Wallet certificate for use with SSL. Example:
        # filebase64("${path.root}/rds-ca-2019-root.sso")

        @[JSON::Field(key: "CertificateWallet")]
        getter certificate_wallet : Bytes?

        # The key length of the cryptographic algorithm being used.

        @[JSON::Field(key: "KeyLength")]
        getter key_length : Int32?

        # An KMS key identifier that is used to encrypt the certificate. If you don't specify a value for the
        # KmsKeyId parameter, then DMS uses your default encryption key. KMS creates the default encryption
        # key for your Amazon Web Services account. Your Amazon Web Services account has a different default
        # encryption key for each Amazon Web Services Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The signing algorithm for the certificate.

        @[JSON::Field(key: "SigningAlgorithm")]
        getter signing_algorithm : String?

        # The beginning date that the certificate is valid.

        @[JSON::Field(key: "ValidFromDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter valid_from_date : Time?

        # The final date that the certificate is valid.

        @[JSON::Field(key: "ValidToDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter valid_to_date : Time?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_creation_date : Time? = nil,
          @certificate_identifier : String? = nil,
          @certificate_owner : String? = nil,
          @certificate_pem : String? = nil,
          @certificate_wallet : Bytes? = nil,
          @key_length : Int32? = nil,
          @kms_key_id : String? = nil,
          @signing_algorithm : String? = nil,
          @valid_from_date : Time? = nil,
          @valid_to_date : Time? = nil
        )
        end
      end

      # Describes the last Fleet Advisor collector health check.

      struct CollectorHealthCheck
        include JSON::Serializable

        # The status of the Fleet Advisor collector.

        @[JSON::Field(key: "CollectorStatus")]
        getter collector_status : String?

        # Whether the local collector can access its Amazon S3 bucket.

        @[JSON::Field(key: "LocalCollectorS3Access")]
        getter local_collector_s3_access : Bool?

        # Whether the role that you provided when creating the Fleet Advisor collector has sufficient
        # permissions to access the Fleet Advisor web collector.

        @[JSON::Field(key: "WebCollectorGrantedRoleBasedAccess")]
        getter web_collector_granted_role_based_access : Bool?

        # Whether the web collector can access its Amazon S3 bucket.

        @[JSON::Field(key: "WebCollectorS3Access")]
        getter web_collector_s3_access : Bool?

        def initialize(
          @collector_status : String? = nil,
          @local_collector_s3_access : Bool? = nil,
          @web_collector_granted_role_based_access : Bool? = nil,
          @web_collector_s3_access : Bool? = nil
        )
        end
      end

      # The specified collector doesn't exist.

      struct CollectorNotFoundFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a Fleet Advisor collector.

      struct CollectorResponse
        include JSON::Serializable


        @[JSON::Field(key: "CollectorHealthCheck")]
        getter collector_health_check : Types::CollectorHealthCheck?

        # The name of the Fleet Advisor collector .

        @[JSON::Field(key: "CollectorName")]
        getter collector_name : String?

        # The reference ID of the Fleet Advisor collector.

        @[JSON::Field(key: "CollectorReferencedId")]
        getter collector_referenced_id : String?

        # The version of your Fleet Advisor collector, in semantic versioning format, for example 1.0.2

        @[JSON::Field(key: "CollectorVersion")]
        getter collector_version : String?

        # The timestamp when you created the collector, in the following format: 2022-01-24T19:04:02.596113Z

        @[JSON::Field(key: "CreatedDate")]
        getter created_date : String?

        # A summary description of the Fleet Advisor collector.

        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "InventoryData")]
        getter inventory_data : Types::InventoryData?

        # The timestamp of the last time the collector received data, in the following format:
        # 2022-01-24T19:04:02.596113Z

        @[JSON::Field(key: "LastDataReceived")]
        getter last_data_received : String?

        # The timestamp when DMS last modified the collector, in the following format:
        # 2022-01-24T19:04:02.596113Z

        @[JSON::Field(key: "ModifiedDate")]
        getter modified_date : String?

        # The timestamp when DMS registered the collector, in the following format:
        # 2022-01-24T19:04:02.596113Z

        @[JSON::Field(key: "RegisteredDate")]
        getter registered_date : String?

        # The Amazon S3 bucket that the Fleet Advisor collector uses to store inventory metadata.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The IAM role that grants permissions to access the specified Amazon S3 bucket.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # Whether the collector version is up to date.

        @[JSON::Field(key: "VersionStatus")]
        getter version_status : String?

        def initialize(
          @collector_health_check : Types::CollectorHealthCheck? = nil,
          @collector_name : String? = nil,
          @collector_referenced_id : String? = nil,
          @collector_version : String? = nil,
          @created_date : String? = nil,
          @description : String? = nil,
          @inventory_data : Types::InventoryData? = nil,
          @last_data_received : String? = nil,
          @modified_date : String? = nil,
          @registered_date : String? = nil,
          @s3_bucket_name : String? = nil,
          @service_access_role_arn : String? = nil,
          @version_status : String? = nil
        )
        end
      end

      # Briefly describes a Fleet Advisor collector.

      struct CollectorShortInfoResponse
        include JSON::Serializable

        # The name of the Fleet Advisor collector.

        @[JSON::Field(key: "CollectorName")]
        getter collector_name : String?

        # The reference ID of the Fleet Advisor collector.

        @[JSON::Field(key: "CollectorReferencedId")]
        getter collector_referenced_id : String?

        def initialize(
          @collector_name : String? = nil,
          @collector_referenced_id : String? = nil
        )
        end
      end

      # Configuration parameters for provisioning an DMS Serverless replication.

      struct ComputeConfig
        include JSON::Serializable

        # The Availability Zone where the DMS Serverless replication using this configuration will run. The
        # default value is a random, system-chosen Availability Zone in the configuration's Amazon Web
        # Services Region, for example, "us-west-2" . You can't set this parameter if the MultiAZ parameter is
        # set to true .

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # A list of custom DNS name servers supported for the DMS Serverless replication to access your source
        # or target database. This list overrides the default name servers supported by the DMS Serverless
        # replication. You can specify a comma-separated list of internet addresses for up to four DNS name
        # servers. For example: "1.1.1.1,2.2.2.2,3.3.3.3,4.4.4.4"

        @[JSON::Field(key: "DnsNameServers")]
        getter dns_name_servers : String?

        # An Key Management Service (KMS) key Amazon Resource Name (ARN) that is used to encrypt the data
        # during DMS Serverless replication. If you don't specify a value for the KmsKeyId parameter, DMS uses
        # your default encryption key. KMS creates the default encryption key for your Amazon Web Services
        # account. Your Amazon Web Services account has a different default encryption key for each Amazon Web
        # Services Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the maximum value of the DMS capacity units (DCUs) for which a given DMS Serverless
        # replication can be provisioned. A single DCU is 2GB of RAM, with 1 DCU as the minimum value allowed.
        # The list of valid DCU values includes 1, 2, 4, 8, 16, 32, 64, 128, 192, 256, and 384. So, the
        # maximum value that you can specify for DMS Serverless is 384. The MaxCapacityUnits parameter is the
        # only DCU parameter you are required to specify.

        @[JSON::Field(key: "MaxCapacityUnits")]
        getter max_capacity_units : Int32?

        # Specifies the minimum value of the DMS capacity units (DCUs) for which a given DMS Serverless
        # replication can be provisioned. A single DCU is 2GB of RAM, with 1 DCU as the minimum value allowed.
        # The list of valid DCU values includes 1, 2, 4, 8, 16, 32, 64, 128, 192, 256, and 384. So, the
        # minimum DCU value that you can specify for DMS Serverless is 1. If you don't set this value, DMS
        # sets this parameter to the minimum DCU value allowed, 1. If there is no current source activity, DMS
        # scales down your replication until it reaches the value specified in MinCapacityUnits .

        @[JSON::Field(key: "MinCapacityUnits")]
        getter min_capacity_units : Int32?

        # Specifies whether the DMS Serverless replication is a Multi-AZ deployment. You can't set the
        # AvailabilityZone parameter if the MultiAZ parameter is set to true .

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The weekly time range during which system maintenance can occur for the DMS Serverless replication,
        # in Universal Coordinated Time (UTC). The format is ddd:hh24:mi-ddd:hh24:mi . The default is a
        # 30-minute window selected at random from an 8-hour block of time per Amazon Web Services Region.
        # This maintenance occurs on a random day of the week. Valid values for days of the week include Mon ,
        # Tue , Wed , Thu , Fri , Sat , and Sun . Constraints include a minimum 30-minute window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Specifies a subnet group identifier to associate with the DMS Serverless replication.

        @[JSON::Field(key: "ReplicationSubnetGroupId")]
        getter replication_subnet_group_id : String?

        # Specifies the virtual private cloud (VPC) security group to use with the DMS Serverless replication.
        # The VPC security group must work with the VPC containing the replication.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @availability_zone : String? = nil,
          @dns_name_servers : String? = nil,
          @kms_key_id : String? = nil,
          @max_capacity_units : Int32? = nil,
          @min_capacity_units : Int32? = nil,
          @multi_az : Bool? = nil,
          @preferred_maintenance_window : String? = nil,
          @replication_subnet_group_id : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      # Status of the connection between an endpoint and a replication instance, including Amazon Resource
      # Names (ARNs) and the last error message issued.

      struct Connection
        include JSON::Serializable

        # The ARN string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        # The identifier of the endpoint. Identifiers must begin with a letter and must contain only ASCII
        # letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.

        @[JSON::Field(key: "EndpointIdentifier")]
        getter endpoint_identifier : String?

        # The error message when the connection last failed.

        @[JSON::Field(key: "LastFailureMessage")]
        getter last_failure_message : String?

        # The ARN of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String?

        # The replication instance identifier. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "ReplicationInstanceIdentifier")]
        getter replication_instance_identifier : String?

        # The connection status. This parameter can return one of the following values: "successful" "testing"
        # "failed" "deleting"

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @endpoint_arn : String? = nil,
          @endpoint_identifier : String? = nil,
          @last_failure_message : String? = nil,
          @replication_instance_arn : String? = nil,
          @replication_instance_identifier : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct CreateDataMigrationMessage
        include JSON::Serializable

        # Specifies if the data migration is full-load only, change data capture (CDC) only, or full-load and
        # CDC.

        @[JSON::Field(key: "DataMigrationType")]
        getter data_migration_type : String

        # An identifier for the migration project.

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # The Amazon Resource Name (ARN) for the service access role that you want to use to create the data
        # migration.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String

        # A user-friendly name for the data migration. Data migration names have the following constraints:
        # Must begin with a letter, and can only contain ASCII letters, digits, and hyphens. Can't end with a
        # hyphen or contain two consecutive hyphens. Length must be from 1 to 255 characters.

        @[JSON::Field(key: "DataMigrationName")]
        getter data_migration_name : String?

        # Specifies whether to enable CloudWatch logs for the data migration.

        @[JSON::Field(key: "EnableCloudwatchLogs")]
        getter enable_cloudwatch_logs : Bool?

        # The number of parallel jobs that trigger parallel threads to unload the tables from the source, and
        # then load them to the target.

        @[JSON::Field(key: "NumberOfJobs")]
        getter number_of_jobs : Int32?

        # An optional JSON string specifying what tables, views, and schemas to include or exclude from the
        # migration.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String?

        # Specifies information about the source data provider.

        @[JSON::Field(key: "SourceDataSettings")]
        getter source_data_settings : Array(Types::SourceDataSetting)?

        # One or more tags to be assigned to the data migration.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies information about the target data provider.

        @[JSON::Field(key: "TargetDataSettings")]
        getter target_data_settings : Array(Types::TargetDataSetting)?

        def initialize(
          @data_migration_type : String,
          @migration_project_identifier : String,
          @service_access_role_arn : String,
          @data_migration_name : String? = nil,
          @enable_cloudwatch_logs : Bool? = nil,
          @number_of_jobs : Int32? = nil,
          @selection_rules : String? = nil,
          @source_data_settings : Array(Types::SourceDataSetting)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_data_settings : Array(Types::TargetDataSetting)? = nil
        )
        end
      end


      struct CreateDataMigrationResponse
        include JSON::Serializable

        # Information about the created data migration.

        @[JSON::Field(key: "DataMigration")]
        getter data_migration : Types::DataMigration?

        def initialize(
          @data_migration : Types::DataMigration? = nil
        )
        end
      end


      struct CreateDataProviderMessage
        include JSON::Serializable

        # The type of database engine for the data provider. Valid values include "aurora" ,
        # "aurora-postgresql" , "mysql" , "oracle" , "postgres" , "sqlserver" , redshift , mariadb , mongodb ,
        # db2 , db2-zos , docdb , and sybase . A value of "aurora" represents Amazon Aurora MySQL-Compatible
        # Edition.

        @[JSON::Field(key: "Engine")]
        getter engine : String

        # The settings in JSON format for a data provider.

        @[JSON::Field(key: "Settings")]
        getter settings : Types::DataProviderSettings

        # A user-friendly name for the data provider.

        @[JSON::Field(key: "DataProviderName")]
        getter data_provider_name : String?

        # A user-friendly description of the data provider.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # One or more tags to be assigned to the data provider.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Indicates whether the data provider is virtual.

        @[JSON::Field(key: "Virtual")]
        getter virtual : Bool?

        def initialize(
          @engine : String,
          @settings : Types::DataProviderSettings,
          @data_provider_name : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @virtual : Bool? = nil
        )
        end
      end


      struct CreateDataProviderResponse
        include JSON::Serializable

        # The data provider that was created.

        @[JSON::Field(key: "DataProvider")]
        getter data_provider : Types::DataProvider?

        def initialize(
          @data_provider : Types::DataProvider? = nil
        )
        end
      end


      struct CreateEndpointMessage
        include JSON::Serializable

        # The database endpoint identifier. Identifiers must begin with a letter and must contain only ASCII
        # letters, digits, and hyphens. They can't end with a hyphen, or contain two consecutive hyphens.

        @[JSON::Field(key: "EndpointIdentifier")]
        getter endpoint_identifier : String

        # The type of endpoint. Valid values are source and target .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String

        # The type of engine for the endpoint. Valid values, depending on the EndpointType value, include
        # "mysql" , "oracle" , "postgres" , "mariadb" , "aurora" , "aurora-postgresql" , "opensearch" ,
        # "redshift" , "s3" , "db2" , "db2-zos" , "azuredb" , "sybase" , "dynamodb" , "mongodb" , "kinesis" ,
        # "kafka" , "elasticsearch" , "docdb" , "sqlserver" , "neptune" , "babelfish" , redshift-serverless ,
        # aurora-serverless , aurora-postgresql-serverless , gcp-mysql , azure-sql-managed-instance , redis ,
        # dms-transfer .

        @[JSON::Field(key: "EngineName")]
        getter engine_name : String

        # The Amazon Resource Name (ARN) for the certificate.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The name of the endpoint database. For a MySQL source or target endpoint, do not specify
        # DatabaseName. To migrate to a specific database, use this setting and targetDbType .

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The settings in JSON format for the DMS transfer type of source endpoint. Possible settings include
        # the following: ServiceAccessRoleArn - The Amazon Resource Name (ARN) used by the service access IAM
        # role. The role must allow the iam:PassRole action. BucketName - The name of the S3 bucket to use.
        # Shorthand syntax for these settings is as follows: ServiceAccessRoleArn=string,BucketName=string
        # JSON syntax for these settings is as follows: { "ServiceAccessRoleArn": "string", "BucketName":
        # "string", }

        @[JSON::Field(key: "DmsTransferSettings")]
        getter dms_transfer_settings : Types::DmsTransferSettings?


        @[JSON::Field(key: "DocDbSettings")]
        getter doc_db_settings : Types::DocDbSettings?

        # Settings in JSON format for the target Amazon DynamoDB endpoint. For information about other
        # available settings, see Using Object Mapping to Migrate Data to DynamoDB in the Database Migration
        # Service User Guide.

        @[JSON::Field(key: "DynamoDbSettings")]
        getter dynamo_db_settings : Types::DynamoDbSettings?

        # Settings in JSON format for the target OpenSearch endpoint. For more information about the available
        # settings, see Extra Connection Attributes When Using OpenSearch as a Target for DMS in the Database
        # Migration Service User Guide .

        @[JSON::Field(key: "ElasticsearchSettings")]
        getter elasticsearch_settings : Types::ElasticsearchSettings?

        # The external table definition.

        @[JSON::Field(key: "ExternalTableDefinition")]
        getter external_table_definition : String?

        # Additional attributes associated with the connection. Each attribute is specified as a name-value
        # pair associated by an equal sign (=). Multiple attributes are separated by a semicolon (;) with no
        # additional white space. For information on the attributes available for connecting your source or
        # target endpoint, see Working with DMS Endpoints in the Database Migration Service User Guide.

        @[JSON::Field(key: "ExtraConnectionAttributes")]
        getter extra_connection_attributes : String?

        # Settings in JSON format for the source GCP MySQL endpoint.

        @[JSON::Field(key: "GcpMySQLSettings")]
        getter gcp_my_sql_settings : Types::GcpMySQLSettings?

        # Settings in JSON format for the source IBM Db2 LUW endpoint. For information about other available
        # settings, see Extra connection attributes when using Db2 LUW as a source for DMS in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "IBMDb2Settings")]
        getter ibm_db2_settings : Types::IBMDb2Settings?

        # Settings in JSON format for the target Apache Kafka endpoint. For more information about the
        # available settings, see Using object mapping to migrate data to a Kafka topic in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "KafkaSettings")]
        getter kafka_settings : Types::KafkaSettings?

        # Settings in JSON format for the target endpoint for Amazon Kinesis Data Streams. For more
        # information about the available settings, see Using object mapping to migrate data to a Kinesis data
        # stream in the Database Migration Service User Guide.

        @[JSON::Field(key: "KinesisSettings")]
        getter kinesis_settings : Types::KinesisSettings?

        # An KMS key identifier that is used to encrypt the connection parameters for the endpoint. If you
        # don't specify a value for the KmsKeyId parameter, then DMS uses your default encryption key. KMS
        # creates the default encryption key for your Amazon Web Services account. Your Amazon Web Services
        # account has a different default encryption key for each Amazon Web Services Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Settings in JSON format for the source and target Microsoft SQL Server endpoint. For information
        # about other available settings, see Extra connection attributes when using SQL Server as a source
        # for DMS and Extra connection attributes when using SQL Server as a target for DMS in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "MicrosoftSQLServerSettings")]
        getter microsoft_sql_server_settings : Types::MicrosoftSQLServerSettings?

        # Settings in JSON format for the source MongoDB endpoint. For more information about the available
        # settings, see Endpoint configuration settings when using MongoDB as a source for Database Migration
        # Service in the Database Migration Service User Guide.

        @[JSON::Field(key: "MongoDbSettings")]
        getter mongo_db_settings : Types::MongoDbSettings?

        # Settings in JSON format for the source and target MySQL endpoint. For information about other
        # available settings, see Extra connection attributes when using MySQL as a source for DMS and Extra
        # connection attributes when using a MySQL-compatible database as a target for DMS in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "MySQLSettings")]
        getter my_sql_settings : Types::MySQLSettings?

        # Settings in JSON format for the target Amazon Neptune endpoint. For more information about the
        # available settings, see Specifying graph-mapping rules using Gremlin and R2RML for Amazon Neptune as
        # a target in the Database Migration Service User Guide.

        @[JSON::Field(key: "NeptuneSettings")]
        getter neptune_settings : Types::NeptuneSettings?

        # Settings in JSON format for the source and target Oracle endpoint. For information about other
        # available settings, see Extra connection attributes when using Oracle as a source for DMS and Extra
        # connection attributes when using Oracle as a target for DMS in the Database Migration Service User
        # Guide.

        @[JSON::Field(key: "OracleSettings")]
        getter oracle_settings : Types::OracleSettings?

        # The password to be used to log in to the endpoint database.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The port used by the endpoint database.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Settings in JSON format for the source and target PostgreSQL endpoint. For information about other
        # available settings, see Extra connection attributes when using PostgreSQL as a source for DMS and
        # Extra connection attributes when using PostgreSQL as a target for DMS in the Database Migration
        # Service User Guide.

        @[JSON::Field(key: "PostgreSQLSettings")]
        getter postgre_sql_settings : Types::PostgreSQLSettings?

        # Settings in JSON format for the target Redis endpoint.

        @[JSON::Field(key: "RedisSettings")]
        getter redis_settings : Types::RedisSettings?


        @[JSON::Field(key: "RedshiftSettings")]
        getter redshift_settings : Types::RedshiftSettings?

        # A friendly name for the resource identifier at the end of the EndpointArn response parameter that is
        # returned in the created Endpoint object. The value for this parameter can have up to 31 characters.
        # It can contain only ASCII letters, digits, and hyphen ('-'). Also, it can't end with a hyphen or
        # contain two consecutive hyphens, and can only begin with a letter, such as Example-App-ARN1 . For
        # example, this value might result in the EndpointArn value
        # arn:aws:dms:eu-west-1:012345678901:rep:Example-App-ARN1 . If you don't specify a ResourceIdentifier
        # value, DMS generates a default identifier value for the end of EndpointArn .

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # Settings in JSON format for the target Amazon S3 endpoint. For more information about the available
        # settings, see Extra Connection Attributes When Using Amazon S3 as a Target for DMS in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "S3Settings")]
        getter s3_settings : Types::S3Settings?

        # The name of the server where the endpoint database resides.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The Amazon Resource Name (ARN) for the service access role that you want to use to create the
        # endpoint. The role must allow the iam:PassRole action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # The Secure Sockets Layer (SSL) mode to use for the SSL connection. The default is none

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        # Settings in JSON format for the source and target SAP ASE endpoint. For information about other
        # available settings, see Extra connection attributes when using SAP ASE as a source for DMS and Extra
        # connection attributes when using SAP ASE as a target for DMS in the Database Migration Service User
        # Guide.

        @[JSON::Field(key: "SybaseSettings")]
        getter sybase_settings : Types::SybaseSettings?

        # One or more tags to be assigned to the endpoint.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Settings in JSON format for the target Amazon Timestream endpoint.

        @[JSON::Field(key: "TimestreamSettings")]
        getter timestream_settings : Types::TimestreamSettings?

        # The user name to be used to log in to the endpoint database.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @endpoint_identifier : String,
          @endpoint_type : String,
          @engine_name : String,
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @dms_transfer_settings : Types::DmsTransferSettings? = nil,
          @doc_db_settings : Types::DocDbSettings? = nil,
          @dynamo_db_settings : Types::DynamoDbSettings? = nil,
          @elasticsearch_settings : Types::ElasticsearchSettings? = nil,
          @external_table_definition : String? = nil,
          @extra_connection_attributes : String? = nil,
          @gcp_my_sql_settings : Types::GcpMySQLSettings? = nil,
          @ibm_db2_settings : Types::IBMDb2Settings? = nil,
          @kafka_settings : Types::KafkaSettings? = nil,
          @kinesis_settings : Types::KinesisSettings? = nil,
          @kms_key_id : String? = nil,
          @microsoft_sql_server_settings : Types::MicrosoftSQLServerSettings? = nil,
          @mongo_db_settings : Types::MongoDbSettings? = nil,
          @my_sql_settings : Types::MySQLSettings? = nil,
          @neptune_settings : Types::NeptuneSettings? = nil,
          @oracle_settings : Types::OracleSettings? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @postgre_sql_settings : Types::PostgreSQLSettings? = nil,
          @redis_settings : Types::RedisSettings? = nil,
          @redshift_settings : Types::RedshiftSettings? = nil,
          @resource_identifier : String? = nil,
          @s3_settings : Types::S3Settings? = nil,
          @server_name : String? = nil,
          @service_access_role_arn : String? = nil,
          @ssl_mode : String? = nil,
          @sybase_settings : Types::SybaseSettings? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timestream_settings : Types::TimestreamSettings? = nil,
          @username : String? = nil
        )
        end
      end


      struct CreateEndpointResponse
        include JSON::Serializable

        # The endpoint that was created.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        def initialize(
          @endpoint : Types::Endpoint? = nil
        )
        end
      end


      struct CreateEventSubscriptionMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon SNS topic created for event notification. The ARN is
        # created by Amazon SNS when you create a topic and subscribe to it.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String

        # The name of the DMS event notification subscription. This name must be less than 255 characters.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        # A Boolean value; set to true to activate the subscription, or set to false to create the
        # subscription but not activate it.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A list of event categories for a source type that you want to subscribe to. For more information,
        # see Working with Events and Notifications in the Database Migration Service User Guide.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # A list of identifiers for which DMS provides notification events. If you don't specify a value,
        # notifications are provided for all sources. If you specify multiple values, they must be of the same
        # type. For example, if you specify a database instance ID, then all of the other values must be
        # database instance IDs.

        @[JSON::Field(key: "SourceIds")]
        getter source_ids : Array(String)?

        # The type of DMS resource that generates the events. For example, if you want to be notified of
        # events generated by a replication instance, you set this parameter to replication-instance . If this
        # value isn't specified, all events are returned. Valid values: replication-instance |
        # replication-task

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # One or more tags to be assigned to the event subscription.

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


      struct CreateEventSubscriptionResponse
        include JSON::Serializable

        # The event subscription that was created.

        @[JSON::Field(key: "EventSubscription")]
        getter event_subscription : Types::EventSubscription?

        def initialize(
          @event_subscription : Types::EventSubscription? = nil
        )
        end
      end


      struct CreateFleetAdvisorCollectorRequest
        include JSON::Serializable

        # The name of your Fleet Advisor collector (for example, sample-collector ).

        @[JSON::Field(key: "CollectorName")]
        getter collector_name : String

        # The Amazon S3 bucket that the Fleet Advisor collector uses to store inventory metadata.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        # The IAM role that grants permissions to access the specified Amazon S3 bucket.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String

        # A summary description of your Fleet Advisor collector.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @collector_name : String,
          @s3_bucket_name : String,
          @service_access_role_arn : String,
          @description : String? = nil
        )
        end
      end


      struct CreateFleetAdvisorCollectorResponse
        include JSON::Serializable

        # The name of the new Fleet Advisor collector.

        @[JSON::Field(key: "CollectorName")]
        getter collector_name : String?

        # The unique ID of the new Fleet Advisor collector, for example: 22fda70c-40d5-4acf-b233-a495bd8eb7f5

        @[JSON::Field(key: "CollectorReferencedId")]
        getter collector_referenced_id : String?

        # A summary description of the Fleet Advisor collector.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon S3 bucket that the collector uses to store inventory metadata.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The IAM role that grants permissions to access the specified Amazon S3 bucket.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        def initialize(
          @collector_name : String? = nil,
          @collector_referenced_id : String? = nil,
          @description : String? = nil,
          @s3_bucket_name : String? = nil,
          @service_access_role_arn : String? = nil
        )
        end
      end


      struct CreateInstanceProfileMessage
        include JSON::Serializable

        # The Availability Zone where the instance profile will be created. The default value is a random,
        # system-chosen Availability Zone in the Amazon Web Services Region where your data provider is
        # created, for examplem us-east-1d .

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # A user-friendly description of the instance profile.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A user-friendly name for the instance profile.

        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String?

        # The Amazon Resource Name (ARN) of the KMS key that is used to encrypt the connection parameters for
        # the instance profile. If you don't specify a value for the KmsKeyArn parameter, then DMS uses an
        # Amazon Web Services owned encryption key to encrypt your resources.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # Specifies the network type for the instance profile. A value of IPV4 represents an instance profile
        # with IPv4 network type and only supports IPv4 addressing. A value of IPV6 represents an instance
        # profile with IPv6 network type and only supports IPv6 addressing. A value of DUAL represents an
        # instance profile with dual network type that supports IPv4 and IPv6 addressing.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # Specifies the accessibility options for the instance profile. A value of true represents an instance
        # profile with a public IP address. A value of false represents an instance profile with a private IP
        # address. The default value is true .

        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # A subnet group to associate with the instance profile.

        @[JSON::Field(key: "SubnetGroupIdentifier")]
        getter subnet_group_identifier : String?

        # One or more tags to be assigned to the instance profile.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the VPC security group names to be used with the instance profile. The VPC security group
        # must work with the VPC containing the instance profile.

        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(String)?

        def initialize(
          @availability_zone : String? = nil,
          @description : String? = nil,
          @instance_profile_name : String? = nil,
          @kms_key_arn : String? = nil,
          @network_type : String? = nil,
          @publicly_accessible : Bool? = nil,
          @subnet_group_identifier : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_security_groups : Array(String)? = nil
        )
        end
      end


      struct CreateInstanceProfileResponse
        include JSON::Serializable

        # The instance profile that was created.

        @[JSON::Field(key: "InstanceProfile")]
        getter instance_profile : Types::InstanceProfile?

        def initialize(
          @instance_profile : Types::InstanceProfile? = nil
        )
        end
      end


      struct CreateMigrationProjectMessage
        include JSON::Serializable

        # The identifier of the associated instance profile. Identifiers must begin with a letter and must
        # contain only ASCII letters, digits, and hyphens. They can't end with a hyphen, or contain two
        # consecutive hyphens.

        @[JSON::Field(key: "InstanceProfileIdentifier")]
        getter instance_profile_identifier : String

        # Information about the source data provider, including the name, ARN, and Secrets Manager parameters.

        @[JSON::Field(key: "SourceDataProviderDescriptors")]
        getter source_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition)

        # Information about the target data provider, including the name, ARN, and Amazon Web Services Secrets
        # Manager parameters.

        @[JSON::Field(key: "TargetDataProviderDescriptors")]
        getter target_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition)

        # A user-friendly description of the migration project.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A user-friendly name for the migration project.

        @[JSON::Field(key: "MigrationProjectName")]
        getter migration_project_name : String?

        # The schema conversion application attributes, including the Amazon S3 bucket name and Amazon S3 role
        # ARN.

        @[JSON::Field(key: "SchemaConversionApplicationAttributes")]
        getter schema_conversion_application_attributes : Types::SCApplicationAttributes?

        # One or more tags to be assigned to the migration project.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The settings in JSON format for migration rules. Migration rules make it possible for you to change
        # the object names according to the rules that you specify. For example, you can change an object name
        # to lowercase or uppercase, add or remove a prefix or suffix, or rename objects.

        @[JSON::Field(key: "TransformationRules")]
        getter transformation_rules : String?

        def initialize(
          @instance_profile_identifier : String,
          @source_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition),
          @target_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition),
          @description : String? = nil,
          @migration_project_name : String? = nil,
          @schema_conversion_application_attributes : Types::SCApplicationAttributes? = nil,
          @tags : Array(Types::Tag)? = nil,
          @transformation_rules : String? = nil
        )
        end
      end


      struct CreateMigrationProjectResponse
        include JSON::Serializable

        # The migration project that was created.

        @[JSON::Field(key: "MigrationProject")]
        getter migration_project : Types::MigrationProject?

        def initialize(
          @migration_project : Types::MigrationProject? = nil
        )
        end
      end


      struct CreateReplicationConfigMessage
        include JSON::Serializable

        # Configuration parameters for provisioning an DMS Serverless replication.

        @[JSON::Field(key: "ComputeConfig")]
        getter compute_config : Types::ComputeConfig

        # A unique identifier that you want to use to create a ReplicationConfigArn that is returned as part
        # of the output from this action. You can then pass this output ReplicationConfigArn as the value of
        # the ReplicationConfigArn option for other actions to identify both DMS Serverless replications and
        # replication configurations that you want those actions to operate on. For some actions, you can also
        # use either this unique identifier or a corresponding ARN in action filters to identify the specific
        # replication and replication configuration to operate on.

        @[JSON::Field(key: "ReplicationConfigIdentifier")]
        getter replication_config_identifier : String

        # The type of DMS Serverless replication to provision using this replication configuration. Possible
        # values: "full-load" "cdc" "full-load-and-cdc"

        @[JSON::Field(key: "ReplicationType")]
        getter replication_type : String

        # The Amazon Resource Name (ARN) of the source endpoint for this DMS Serverless replication
        # configuration.

        @[JSON::Field(key: "SourceEndpointArn")]
        getter source_endpoint_arn : String

        # JSON table mappings for DMS Serverless replications that are provisioned using this replication
        # configuration. For more information, see Specifying table selection and transformations rules using
        # JSON .

        @[JSON::Field(key: "TableMappings")]
        getter table_mappings : String

        # The Amazon Resource Name (ARN) of the target endpoint for this DMS serverless replication
        # configuration.

        @[JSON::Field(key: "TargetEndpointArn")]
        getter target_endpoint_arn : String

        # Optional JSON settings for DMS Serverless replications that are provisioned using this replication
        # configuration. For example, see Change processing tuning settings .

        @[JSON::Field(key: "ReplicationSettings")]
        getter replication_settings : String?

        # Optional unique value or name that you set for a given resource that can be used to construct an
        # Amazon Resource Name (ARN) for that resource. For more information, see Fine-grained access control
        # using resource names and tags .

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # Optional JSON settings for specifying supplemental data. For more information, see Specifying
        # supplemental data for task settings .

        @[JSON::Field(key: "SupplementalSettings")]
        getter supplemental_settings : String?

        # One or more optional tags associated with resources used by the DMS Serverless replication. For more
        # information, see Tagging resources in Database Migration Service .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @compute_config : Types::ComputeConfig,
          @replication_config_identifier : String,
          @replication_type : String,
          @source_endpoint_arn : String,
          @table_mappings : String,
          @target_endpoint_arn : String,
          @replication_settings : String? = nil,
          @resource_identifier : String? = nil,
          @supplemental_settings : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateReplicationConfigResponse
        include JSON::Serializable

        # Configuration parameters returned from the DMS Serverless replication after it is created.

        @[JSON::Field(key: "ReplicationConfig")]
        getter replication_config : Types::ReplicationConfig?

        def initialize(
          @replication_config : Types::ReplicationConfig? = nil
        )
        end
      end


      struct CreateReplicationInstanceMessage
        include JSON::Serializable

        # The compute and memory capacity of the replication instance as defined for the specified replication
        # instance class. For example to specify the instance class dms.c4.large, set this parameter to
        # "dms.c4.large" . For more information on the settings and capacities for the available replication
        # instance classes, see Choosing the right DMS replication instance ; and, Selecting the best size for
        # a replication instance .

        @[JSON::Field(key: "ReplicationInstanceClass")]
        getter replication_instance_class : String

        # The replication instance identifier. This parameter is stored as a lowercase string. Constraints:
        # Must contain 1-63 alphanumeric characters or hyphens. First character must be a letter. Can't end
        # with a hyphen or contain two consecutive hyphens. Example: myrepinstance

        @[JSON::Field(key: "ReplicationInstanceIdentifier")]
        getter replication_instance_identifier : String

        # The amount of storage (in gigabytes) to be initially allocated for the replication instance.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # A value that indicates whether minor engine upgrades are applied automatically to the replication
        # instance during the maintenance window. This parameter defaults to true . Default: true

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # The Availability Zone where the replication instance will be created. The default value is a random,
        # system-chosen Availability Zone in the endpoint's Amazon Web Services Region, for example:
        # us-east-1d .

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # A list of custom DNS name servers supported for the replication instance to access your on-premise
        # source or target database. This list overrides the default name servers supported by the replication
        # instance. You can specify a comma-separated list of internet addresses for up to four on-premise DNS
        # name servers. For example: "1.1.1.1,2.2.2.2,3.3.3.3,4.4.4.4"

        @[JSON::Field(key: "DnsNameServers")]
        getter dns_name_servers : String?

        # The engine version number of the replication instance. If an engine version number is not specified
        # when a replication instance is created, the default is the latest engine version available.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Specifies the settings required for kerberos authentication when creating the replication instance.

        @[JSON::Field(key: "KerberosAuthenticationSettings")]
        getter kerberos_authentication_settings : Types::KerberosAuthenticationSettings?

        # An KMS key identifier that is used to encrypt the data on the replication instance. If you don't
        # specify a value for the KmsKeyId parameter, then DMS uses your default encryption key. KMS creates
        # the default encryption key for your Amazon Web Services account. Your Amazon Web Services account
        # has a different default encryption key for each Amazon Web Services Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies whether the replication instance is a Multi-AZ deployment. You can't set the
        # AvailabilityZone parameter if the Multi-AZ parameter is set to true .

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The type of IP address protocol used by a replication instance, such as IPv4 only or Dual-stack that
        # supports both IPv4 and IPv6 addressing. IPv6 only is not yet supported.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The weekly time range during which system maintenance can occur, in Universal Coordinated Time
        # (UTC). Format: ddd:hh24:mi-ddd:hh24:mi Default: A 30-minute window selected at random from an 8-hour
        # block of time per Amazon Web Services Region, occurring on a random day of the week. Valid Days:
        # Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Specifies the accessibility options for the replication instance. A value of true represents an
        # instance with a public IP address. A value of false represents an instance with a private IP
        # address. The default value is true .

        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # A subnet group to associate with the replication instance.

        @[JSON::Field(key: "ReplicationSubnetGroupIdentifier")]
        getter replication_subnet_group_identifier : String?

        # A friendly name for the resource identifier at the end of the EndpointArn response parameter that is
        # returned in the created Endpoint object. The value for this parameter can have up to 31 characters.
        # It can contain only ASCII letters, digits, and hyphen ('-'). Also, it can't end with a hyphen or
        # contain two consecutive hyphens, and can only begin with a letter, such as Example-App-ARN1 . For
        # example, this value might result in the EndpointArn value
        # arn:aws:dms:eu-west-1:012345678901:rep:Example-App-ARN1 . If you don't specify a ResourceIdentifier
        # value, DMS generates a default identifier value for the end of EndpointArn .

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # One or more tags to be assigned to the replication instance.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the VPC security group to be used with the replication instance. The VPC security group
        # must work with the VPC containing the replication instance.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @replication_instance_class : String,
          @replication_instance_identifier : String,
          @allocated_storage : Int32? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @availability_zone : String? = nil,
          @dns_name_servers : String? = nil,
          @engine_version : String? = nil,
          @kerberos_authentication_settings : Types::KerberosAuthenticationSettings? = nil,
          @kms_key_id : String? = nil,
          @multi_az : Bool? = nil,
          @network_type : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @replication_subnet_group_identifier : String? = nil,
          @resource_identifier : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct CreateReplicationInstanceResponse
        include JSON::Serializable

        # The replication instance that was created.

        @[JSON::Field(key: "ReplicationInstance")]
        getter replication_instance : Types::ReplicationInstance?

        def initialize(
          @replication_instance : Types::ReplicationInstance? = nil
        )
        end
      end


      struct CreateReplicationSubnetGroupMessage
        include JSON::Serializable

        # The description for the subnet group. Constraints: This parameter Must not contain non-printable
        # control characters.

        @[JSON::Field(key: "ReplicationSubnetGroupDescription")]
        getter replication_subnet_group_description : String

        # The name for the replication subnet group. This value is stored as a lowercase string. Constraints:
        # Must contain no more than 255 alphanumeric characters, periods, underscores, or hyphens. Must not be
        # "default". Example: mySubnetgroup

        @[JSON::Field(key: "ReplicationSubnetGroupIdentifier")]
        getter replication_subnet_group_identifier : String

        # Two or more subnet IDs to be assigned to the subnet group.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # One or more tags to be assigned to the subnet group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @replication_subnet_group_description : String,
          @replication_subnet_group_identifier : String,
          @subnet_ids : Array(String),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateReplicationSubnetGroupResponse
        include JSON::Serializable

        # The replication subnet group that was created.

        @[JSON::Field(key: "ReplicationSubnetGroup")]
        getter replication_subnet_group : Types::ReplicationSubnetGroup?

        def initialize(
          @replication_subnet_group : Types::ReplicationSubnetGroup? = nil
        )
        end
      end


      struct CreateReplicationTaskMessage
        include JSON::Serializable

        # The migration type. Valid values: full-load | cdc | full-load-and-cdc

        @[JSON::Field(key: "MigrationType")]
        getter migration_type : String

        # The Amazon Resource Name (ARN) of a replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String

        # An identifier for the replication task. Constraints: Must contain 1-255 alphanumeric characters or
        # hyphens. First character must be a letter. Cannot end with a hyphen or contain two consecutive
        # hyphens.

        @[JSON::Field(key: "ReplicationTaskIdentifier")]
        getter replication_task_identifier : String

        # An Amazon Resource Name (ARN) that uniquely identifies the source endpoint.

        @[JSON::Field(key: "SourceEndpointArn")]
        getter source_endpoint_arn : String

        # The table mappings for the task, in JSON format. For more information, see Using Table Mapping to
        # Specify Task Settings in the Database Migration Service User Guide.

        @[JSON::Field(key: "TableMappings")]
        getter table_mappings : String

        # An Amazon Resource Name (ARN) that uniquely identifies the target endpoint.

        @[JSON::Field(key: "TargetEndpointArn")]
        getter target_endpoint_arn : String

        # Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition
        # or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in
        # an error. The value can be in date, checkpoint, or LSN/SCN format. Date Example:
        # --cdc-start-position “2018-03-08T12:12:12” Checkpoint Example: --cdc-start-position
        # "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
        # LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373” When you use this task setting
        # with a source PostgreSQL database, a logical replication slot should already be created and
        # associated with the source endpoint. You can verify this by setting the slotName extra connection
        # attribute to the name of this logical replication slot. For more information, see Extra Connection
        # Attributes When Using PostgreSQL as a Source for DMS .

        @[JSON::Field(key: "CdcStartPosition")]
        getter cdc_start_position : String?

        # Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or
        # CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results
        # in an error. Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”

        @[JSON::Field(key: "CdcStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cdc_start_time : Time?

        # Indicates when you want a change data capture (CDC) operation to stop. The value can be either
        # server time or commit time. Server time example: --cdc-stop-position
        # “server_time:2018-02-09T12:12:12” Commit time example: --cdc-stop-position
        # “commit_time:2018-02-09T12:12:12“

        @[JSON::Field(key: "CdcStopPosition")]
        getter cdc_stop_position : String?

        # Overall settings for the task, in JSON format. For more information, see Specifying Task Settings
        # for Database Migration Service Tasks in the Database Migration Service User Guide.

        @[JSON::Field(key: "ReplicationTaskSettings")]
        getter replication_task_settings : String?

        # A friendly name for the resource identifier at the end of the EndpointArn response parameter that is
        # returned in the created Endpoint object. The value for this parameter can have up to 31 characters.
        # It can contain only ASCII letters, digits, and hyphen ('-'). Also, it can't end with a hyphen or
        # contain two consecutive hyphens, and can only begin with a letter, such as Example-App-ARN1 . For
        # example, this value might result in the EndpointArn value
        # arn:aws:dms:eu-west-1:012345678901:rep:Example-App-ARN1 . If you don't specify a ResourceIdentifier
        # value, DMS generates a default identifier value for the end of EndpointArn .

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # One or more tags to be assigned to the replication task.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Supplemental information that the task requires to migrate the data for certain source and target
        # endpoints. For more information, see Specifying Supplemental Data for Task Settings in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "TaskData")]
        getter task_data : String?

        def initialize(
          @migration_type : String,
          @replication_instance_arn : String,
          @replication_task_identifier : String,
          @source_endpoint_arn : String,
          @table_mappings : String,
          @target_endpoint_arn : String,
          @cdc_start_position : String? = nil,
          @cdc_start_time : Time? = nil,
          @cdc_stop_position : String? = nil,
          @replication_task_settings : String? = nil,
          @resource_identifier : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_data : String? = nil
        )
        end
      end


      struct CreateReplicationTaskResponse
        include JSON::Serializable

        # The replication task that was created.

        @[JSON::Field(key: "ReplicationTask")]
        getter replication_task : Types::ReplicationTask?

        def initialize(
          @replication_task : Types::ReplicationTask? = nil
        )
        end
      end

      # This object provides information about a DMS data migration.

      struct DataMigration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies this replication.

        @[JSON::Field(key: "DataMigrationArn")]
        getter data_migration_arn : String?

        # The CIDR blocks of the endpoints for the data migration.

        @[JSON::Field(key: "DataMigrationCidrBlocks")]
        getter data_migration_cidr_blocks : Array(String)?

        # The UTC time when DMS created the data migration.

        @[JSON::Field(key: "DataMigrationCreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_migration_create_time : Time?

        # The UTC time when data migration ended.

        @[JSON::Field(key: "DataMigrationEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_migration_end_time : Time?

        # The user-friendly name for the data migration.

        @[JSON::Field(key: "DataMigrationName")]
        getter data_migration_name : String?

        # Specifies CloudWatch settings and selection rules for the data migration.

        @[JSON::Field(key: "DataMigrationSettings")]
        getter data_migration_settings : Types::DataMigrationSettings?

        # The UTC time when DMS started the data migration.

        @[JSON::Field(key: "DataMigrationStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_migration_start_time : Time?

        # Provides information about the data migration's run, including start and stop time, latency, and
        # data migration progress.

        @[JSON::Field(key: "DataMigrationStatistics")]
        getter data_migration_statistics : Types::DataMigrationStatistics?

        # The current status of the data migration.

        @[JSON::Field(key: "DataMigrationStatus")]
        getter data_migration_status : String?

        # Specifies whether the data migration is full-load only, change data capture (CDC) only, or full-load
        # and CDC.

        @[JSON::Field(key: "DataMigrationType")]
        getter data_migration_type : String?

        # Information about the data migration's most recent error or failure.

        @[JSON::Field(key: "LastFailureMessage")]
        getter last_failure_message : String?

        # The Amazon Resource Name (ARN) of the data migration's associated migration project.

        @[JSON::Field(key: "MigrationProjectArn")]
        getter migration_project_arn : String?

        # The IP addresses of the endpoints for the data migration.

        @[JSON::Field(key: "PublicIpAddresses")]
        getter public_ip_addresses : Array(String)?

        # The IAM role that the data migration uses to access Amazon Web Services resources.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # Specifies information about the data migration's source data provider.

        @[JSON::Field(key: "SourceDataSettings")]
        getter source_data_settings : Array(Types::SourceDataSetting)?

        # The reason the data migration last stopped.

        @[JSON::Field(key: "StopReason")]
        getter stop_reason : String?

        # Specifies information about the data migration's target data provider.

        @[JSON::Field(key: "TargetDataSettings")]
        getter target_data_settings : Array(Types::TargetDataSetting)?

        def initialize(
          @data_migration_arn : String? = nil,
          @data_migration_cidr_blocks : Array(String)? = nil,
          @data_migration_create_time : Time? = nil,
          @data_migration_end_time : Time? = nil,
          @data_migration_name : String? = nil,
          @data_migration_settings : Types::DataMigrationSettings? = nil,
          @data_migration_start_time : Time? = nil,
          @data_migration_statistics : Types::DataMigrationStatistics? = nil,
          @data_migration_status : String? = nil,
          @data_migration_type : String? = nil,
          @last_failure_message : String? = nil,
          @migration_project_arn : String? = nil,
          @public_ip_addresses : Array(String)? = nil,
          @service_access_role_arn : String? = nil,
          @source_data_settings : Array(Types::SourceDataSetting)? = nil,
          @stop_reason : String? = nil,
          @target_data_settings : Array(Types::TargetDataSetting)? = nil
        )
        end
      end

      # Options for configuring a data migration, including whether to enable CloudWatch logs, and the
      # selection rules to use to include or exclude database objects from the migration.

      struct DataMigrationSettings
        include JSON::Serializable

        # Whether to enable CloudWatch logging for the data migration.

        @[JSON::Field(key: "CloudwatchLogsEnabled")]
        getter cloudwatch_logs_enabled : Bool?

        # The number of parallel jobs that trigger parallel threads to unload the tables from the source, and
        # then load them to the target.

        @[JSON::Field(key: "NumberOfJobs")]
        getter number_of_jobs : Int32?

        # A JSON-formatted string that defines what objects to include and exclude from the migration.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String?

        def initialize(
          @cloudwatch_logs_enabled : Bool? = nil,
          @number_of_jobs : Int32? = nil,
          @selection_rules : String? = nil
        )
        end
      end

      # Information about the data migration run, including start and stop time, latency, and migration
      # progress.

      struct DataMigrationStatistics
        include JSON::Serializable

        # The current latency of the change data capture (CDC) operation.

        @[JSON::Field(key: "CDCLatency")]
        getter cdc_latency : Int32?

        # The elapsed duration of the data migration run.

        @[JSON::Field(key: "ElapsedTimeMillis")]
        getter elapsed_time_millis : Int64?

        # The data migration's progress in the full-load migration phase.

        @[JSON::Field(key: "FullLoadPercentage")]
        getter full_load_percentage : Int32?

        # The time when the migration started.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The time when the migration stopped or failed.

        @[JSON::Field(key: "StopTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_time : Time?

        # The number of tables that DMS failed to process.

        @[JSON::Field(key: "TablesErrored")]
        getter tables_errored : Int32?

        # The number of tables loaded in the current data migration run.

        @[JSON::Field(key: "TablesLoaded")]
        getter tables_loaded : Int32?

        # The data migration's table loading progress.

        @[JSON::Field(key: "TablesLoading")]
        getter tables_loading : Int32?

        # The number of tables that are waiting for processing.

        @[JSON::Field(key: "TablesQueued")]
        getter tables_queued : Int32?

        def initialize(
          @cdc_latency : Int32? = nil,
          @elapsed_time_millis : Int64? = nil,
          @full_load_percentage : Int32? = nil,
          @start_time : Time? = nil,
          @stop_time : Time? = nil,
          @tables_errored : Int32? = nil,
          @tables_loaded : Int32? = nil,
          @tables_loading : Int32? = nil,
          @tables_queued : Int32? = nil
        )
        end
      end

      # Provides information that defines a data provider.

      struct DataProvider
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the data provider.

        @[JSON::Field(key: "DataProviderArn")]
        getter data_provider_arn : String?

        # The time the data provider was created.

        @[JSON::Field(key: "DataProviderCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter data_provider_creation_time : Time?

        # The name of the data provider.

        @[JSON::Field(key: "DataProviderName")]
        getter data_provider_name : String?

        # A description of the data provider. Descriptions can have up to 31 characters. A description can
        # contain only ASCII letters, digits, and hyphens ('-'). Also, it can't end with a hyphen or contain
        # two consecutive hyphens, and can only begin with a letter.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The type of database engine for the data provider. Valid values include "aurora" ,
        # "aurora-postgresql" , "mysql" , "oracle" , "postgres" , "sqlserver" , redshift , mariadb , mongodb ,
        # db2 , db2-zos , docdb , and sybase . A value of "aurora" represents Amazon Aurora MySQL-Compatible
        # Edition.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The settings in JSON format for a data provider.

        @[JSON::Field(key: "Settings")]
        getter settings : Types::DataProviderSettings?

        # Indicates whether the data provider is virtual.

        @[JSON::Field(key: "Virtual")]
        getter virtual : Bool?

        def initialize(
          @data_provider_arn : String? = nil,
          @data_provider_creation_time : Time? = nil,
          @data_provider_name : String? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @settings : Types::DataProviderSettings? = nil,
          @virtual : Bool? = nil
        )
        end
      end

      # Information about a data provider.

      struct DataProviderDescriptor
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the data provider.

        @[JSON::Field(key: "DataProviderArn")]
        getter data_provider_arn : String?

        # The user-friendly name of the data provider.

        @[JSON::Field(key: "DataProviderName")]
        getter data_provider_name : String?

        # The ARN of the role used to access Amazon Web Services Secrets Manager.

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The identifier of the Amazon Web Services Secrets Manager Secret used to store access credentials
        # for the data provider.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        def initialize(
          @data_provider_arn : String? = nil,
          @data_provider_name : String? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil
        )
        end
      end

      # Information about a data provider.

      struct DataProviderDescriptorDefinition
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the data provider.

        @[JSON::Field(key: "DataProviderIdentifier")]
        getter data_provider_identifier : String

        # The ARN of the role used to access Amazon Web Services Secrets Manager.

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The identifier of the Amazon Web Services Secrets Manager Secret used to store access credentials
        # for the data provider.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        def initialize(
          @data_provider_identifier : String,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil
        )
        end
      end

      # Provides information that defines a data provider.

      struct DataProviderSettings
        include JSON::Serializable


        @[JSON::Field(key: "DocDbSettings")]
        getter doc_db_settings : Types::DocDbDataProviderSettings?

        # Provides information that defines an IBM DB2 LUW data provider.

        @[JSON::Field(key: "IbmDb2LuwSettings")]
        getter ibm_db2_luw_settings : Types::IbmDb2LuwDataProviderSettings?

        # Provides information that defines an IBM DB2 for z/OS data provider.

        @[JSON::Field(key: "IbmDb2zOsSettings")]
        getter ibm_db2z_os_settings : Types::IbmDb2zOsDataProviderSettings?

        # Provides information that defines a MariaDB data provider.

        @[JSON::Field(key: "MariaDbSettings")]
        getter maria_db_settings : Types::MariaDbDataProviderSettings?


        @[JSON::Field(key: "MicrosoftSqlServerSettings")]
        getter microsoft_sql_server_settings : Types::MicrosoftSqlServerDataProviderSettings?

        # Provides information that defines a MongoDB data provider.

        @[JSON::Field(key: "MongoDbSettings")]
        getter mongo_db_settings : Types::MongoDbDataProviderSettings?


        @[JSON::Field(key: "MySqlSettings")]
        getter my_sql_settings : Types::MySqlDataProviderSettings?


        @[JSON::Field(key: "OracleSettings")]
        getter oracle_settings : Types::OracleDataProviderSettings?


        @[JSON::Field(key: "PostgreSqlSettings")]
        getter postgre_sql_settings : Types::PostgreSqlDataProviderSettings?


        @[JSON::Field(key: "RedshiftSettings")]
        getter redshift_settings : Types::RedshiftDataProviderSettings?


        @[JSON::Field(key: "SybaseAseSettings")]
        getter sybase_ase_settings : Types::SybaseAseDataProviderSettings?

        def initialize(
          @doc_db_settings : Types::DocDbDataProviderSettings? = nil,
          @ibm_db2_luw_settings : Types::IbmDb2LuwDataProviderSettings? = nil,
          @ibm_db2z_os_settings : Types::IbmDb2zOsDataProviderSettings? = nil,
          @maria_db_settings : Types::MariaDbDataProviderSettings? = nil,
          @microsoft_sql_server_settings : Types::MicrosoftSqlServerDataProviderSettings? = nil,
          @mongo_db_settings : Types::MongoDbDataProviderSettings? = nil,
          @my_sql_settings : Types::MySqlDataProviderSettings? = nil,
          @oracle_settings : Types::OracleDataProviderSettings? = nil,
          @postgre_sql_settings : Types::PostgreSqlDataProviderSettings? = nil,
          @redshift_settings : Types::RedshiftDataProviderSettings? = nil,
          @sybase_ase_settings : Types::SybaseAseDataProviderSettings? = nil
        )
        end
      end

      # Describes an inventory database instance for a Fleet Advisor collector.

      struct DatabaseInstanceSoftwareDetailsResponse
        include JSON::Serializable

        # The database engine of a database in a Fleet Advisor collector inventory, for example Microsoft SQL
        # Server .

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The database engine edition of a database in a Fleet Advisor collector inventory, for example
        # Express .

        @[JSON::Field(key: "EngineEdition")]
        getter engine_edition : String?

        # The database engine version of a database in a Fleet Advisor collector inventory, for example 2019 .

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The operating system architecture of the database.

        @[JSON::Field(key: "OsArchitecture")]
        getter os_architecture : Int32?

        # The service pack level of the database.

        @[JSON::Field(key: "ServicePack")]
        getter service_pack : String?

        # The support level of the database, for example Mainstream support .

        @[JSON::Field(key: "SupportLevel")]
        getter support_level : String?

        # Information about the database engine software, for example Mainstream support ends on November
        # 14th, 2024 .

        @[JSON::Field(key: "Tooltip")]
        getter tooltip : String?

        def initialize(
          @engine : String? = nil,
          @engine_edition : String? = nil,
          @engine_version : String? = nil,
          @os_architecture : Int32? = nil,
          @service_pack : String? = nil,
          @support_level : String? = nil,
          @tooltip : String? = nil
        )
        end
      end

      # Describes a database in a Fleet Advisor collector inventory.

      struct DatabaseResponse
        include JSON::Serializable

        # A list of collectors associated with the database.

        @[JSON::Field(key: "Collectors")]
        getter collectors : Array(Types::CollectorShortInfoResponse)?

        # The ID of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String?

        # The name of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The IP address of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The number of schemas in a Fleet Advisor collector inventory database.

        @[JSON::Field(key: "NumberOfSchemas")]
        getter number_of_schemas : Int64?

        # The server name of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "Server")]
        getter server : Types::ServerShortInfoResponse?

        # The software details of a database in a Fleet Advisor collector inventory, such as database engine
        # and version.

        @[JSON::Field(key: "SoftwareDetails")]
        getter software_details : Types::DatabaseInstanceSoftwareDetailsResponse?

        def initialize(
          @collectors : Array(Types::CollectorShortInfoResponse)? = nil,
          @database_id : String? = nil,
          @database_name : String? = nil,
          @ip_address : String? = nil,
          @number_of_schemas : Int64? = nil,
          @server : Types::ServerShortInfoResponse? = nil,
          @software_details : Types::DatabaseInstanceSoftwareDetailsResponse? = nil
        )
        end
      end

      # Describes a database in a Fleet Advisor collector inventory.

      struct DatabaseShortInfoResponse
        include JSON::Serializable

        # The database engine of a database in a Fleet Advisor collector inventory, for example PostgreSQL .

        @[JSON::Field(key: "DatabaseEngine")]
        getter database_engine : String?

        # The ID of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String?

        # The IP address of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "DatabaseIpAddress")]
        getter database_ip_address : String?

        # The name of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        def initialize(
          @database_engine : String? = nil,
          @database_id : String? = nil,
          @database_ip_address : String? = nil,
          @database_name : String? = nil
        )
        end
      end

      # Provides error information about a schema conversion operation.

      struct DefaultErrorDetails
        include JSON::Serializable

        # The error message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteCertificateMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end


      struct DeleteCertificateResponse
        include JSON::Serializable

        # The Secure Sockets Layer (SSL) certificate.

        @[JSON::Field(key: "Certificate")]
        getter certificate : Types::Certificate?

        def initialize(
          @certificate : Types::Certificate? = nil
        )
        end
      end


      struct DeleteCollectorRequest
        include JSON::Serializable

        # The reference ID of the Fleet Advisor collector to delete.

        @[JSON::Field(key: "CollectorReferencedId")]
        getter collector_referenced_id : String

        def initialize(
          @collector_referenced_id : String
        )
        end
      end


      struct DeleteConnectionMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String

        def initialize(
          @endpoint_arn : String,
          @replication_instance_arn : String
        )
        end
      end


      struct DeleteConnectionResponse
        include JSON::Serializable

        # The connection that is being deleted.

        @[JSON::Field(key: "Connection")]
        getter connection : Types::Connection?

        def initialize(
          @connection : Types::Connection? = nil
        )
        end
      end


      struct DeleteDataMigrationMessage
        include JSON::Serializable

        # The identifier (name or ARN) of the data migration to delete.

        @[JSON::Field(key: "DataMigrationIdentifier")]
        getter data_migration_identifier : String

        def initialize(
          @data_migration_identifier : String
        )
        end
      end


      struct DeleteDataMigrationResponse
        include JSON::Serializable

        # The deleted data migration.

        @[JSON::Field(key: "DataMigration")]
        getter data_migration : Types::DataMigration?

        def initialize(
          @data_migration : Types::DataMigration? = nil
        )
        end
      end


      struct DeleteDataProviderMessage
        include JSON::Serializable

        # The identifier of the data provider to delete.

        @[JSON::Field(key: "DataProviderIdentifier")]
        getter data_provider_identifier : String

        def initialize(
          @data_provider_identifier : String
        )
        end
      end


      struct DeleteDataProviderResponse
        include JSON::Serializable

        # The data provider that was deleted.

        @[JSON::Field(key: "DataProvider")]
        getter data_provider : Types::DataProvider?

        def initialize(
          @data_provider : Types::DataProvider? = nil
        )
        end
      end


      struct DeleteEndpointMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        def initialize(
          @endpoint_arn : String
        )
        end
      end


      struct DeleteEndpointResponse
        include JSON::Serializable

        # The endpoint that was deleted.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        def initialize(
          @endpoint : Types::Endpoint? = nil
        )
        end
      end


      struct DeleteEventSubscriptionMessage
        include JSON::Serializable

        # The name of the DMS event notification subscription to be deleted.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        def initialize(
          @subscription_name : String
        )
        end
      end


      struct DeleteEventSubscriptionResponse
        include JSON::Serializable

        # The event subscription that was deleted.

        @[JSON::Field(key: "EventSubscription")]
        getter event_subscription : Types::EventSubscription?

        def initialize(
          @event_subscription : Types::EventSubscription? = nil
        )
        end
      end


      struct DeleteFleetAdvisorDatabasesRequest
        include JSON::Serializable

        # The IDs of the Fleet Advisor collector databases to delete.

        @[JSON::Field(key: "DatabaseIds")]
        getter database_ids : Array(String)

        def initialize(
          @database_ids : Array(String)
        )
        end
      end


      struct DeleteFleetAdvisorDatabasesResponse
        include JSON::Serializable

        # The IDs of the databases that the operation deleted.

        @[JSON::Field(key: "DatabaseIds")]
        getter database_ids : Array(String)?

        def initialize(
          @database_ids : Array(String)? = nil
        )
        end
      end


      struct DeleteInstanceProfileMessage
        include JSON::Serializable

        # The identifier of the instance profile to delete.

        @[JSON::Field(key: "InstanceProfileIdentifier")]
        getter instance_profile_identifier : String

        def initialize(
          @instance_profile_identifier : String
        )
        end
      end


      struct DeleteInstanceProfileResponse
        include JSON::Serializable

        # The instance profile that was deleted.

        @[JSON::Field(key: "InstanceProfile")]
        getter instance_profile : Types::InstanceProfile?

        def initialize(
          @instance_profile : Types::InstanceProfile? = nil
        )
        end
      end


      struct DeleteMigrationProjectMessage
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the migration project to delete.

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        def initialize(
          @migration_project_identifier : String
        )
        end
      end


      struct DeleteMigrationProjectResponse
        include JSON::Serializable

        # The migration project that was deleted.

        @[JSON::Field(key: "MigrationProject")]
        getter migration_project : Types::MigrationProject?

        def initialize(
          @migration_project : Types::MigrationProject? = nil
        )
        end
      end


      struct DeleteReplicationConfigMessage
        include JSON::Serializable

        # The replication config to delete.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String

        def initialize(
          @replication_config_arn : String
        )
        end
      end


      struct DeleteReplicationConfigResponse
        include JSON::Serializable

        # Configuration parameters returned for the DMS Serverless replication after it is deleted.

        @[JSON::Field(key: "ReplicationConfig")]
        getter replication_config : Types::ReplicationConfig?

        def initialize(
          @replication_config : Types::ReplicationConfig? = nil
        )
        end
      end


      struct DeleteReplicationInstanceMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication instance to be deleted.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String

        def initialize(
          @replication_instance_arn : String
        )
        end
      end


      struct DeleteReplicationInstanceResponse
        include JSON::Serializable

        # The replication instance that was deleted.

        @[JSON::Field(key: "ReplicationInstance")]
        getter replication_instance : Types::ReplicationInstance?

        def initialize(
          @replication_instance : Types::ReplicationInstance? = nil
        )
        end
      end


      struct DeleteReplicationSubnetGroupMessage
        include JSON::Serializable

        # The subnet group name of the replication instance.

        @[JSON::Field(key: "ReplicationSubnetGroupIdentifier")]
        getter replication_subnet_group_identifier : String

        def initialize(
          @replication_subnet_group_identifier : String
        )
        end
      end


      struct DeleteReplicationSubnetGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteReplicationTaskAssessmentRunMessage
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the premigration assessment run to be deleted.

        @[JSON::Field(key: "ReplicationTaskAssessmentRunArn")]
        getter replication_task_assessment_run_arn : String

        def initialize(
          @replication_task_assessment_run_arn : String
        )
        end
      end


      struct DeleteReplicationTaskAssessmentRunResponse
        include JSON::Serializable

        # The ReplicationTaskAssessmentRun object for the deleted assessment run.

        @[JSON::Field(key: "ReplicationTaskAssessmentRun")]
        getter replication_task_assessment_run : Types::ReplicationTaskAssessmentRun?

        def initialize(
          @replication_task_assessment_run : Types::ReplicationTaskAssessmentRun? = nil
        )
        end
      end


      struct DeleteReplicationTaskMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication task to be deleted.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String

        def initialize(
          @replication_task_arn : String
        )
        end
      end


      struct DeleteReplicationTaskResponse
        include JSON::Serializable

        # The deleted replication task.

        @[JSON::Field(key: "ReplicationTask")]
        getter replication_task : Types::ReplicationTask?

        def initialize(
          @replication_task : Types::ReplicationTask? = nil
        )
        end
      end


      struct DescribeAccountAttributesMessage
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountAttributesResponse
        include JSON::Serializable

        # Account quota information.

        @[JSON::Field(key: "AccountQuotas")]
        getter account_quotas : Array(Types::AccountQuota)?

        # A unique DMS identifier for an account in a particular Amazon Web Services Region. The value of this
        # identifier has the following format: c99999999999 . DMS uses this identifier to name artifacts. For
        # example, DMS uses this identifier to name the default Amazon S3 bucket for storing task assessment
        # reports in a given Amazon Web Services Region. The format of this S3 bucket name is the following:
        # dms- AccountNumber - UniqueAccountIdentifier . Here is an example name for this default S3 bucket:
        # dms-111122223333-c44445555666 . DMS supports the UniqueAccountIdentifier parameter in versions 3.1.4
        # and later.

        @[JSON::Field(key: "UniqueAccountIdentifier")]
        getter unique_account_identifier : String?

        def initialize(
          @account_quotas : Array(Types::AccountQuota)? = nil,
          @unique_account_identifier : String? = nil
        )
        end
      end


      struct DescribeApplicableIndividualAssessmentsMessage
        include JSON::Serializable

        # Optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # Name of the migration type that each provided individual assessment must support.

        @[JSON::Field(key: "MigrationType")]
        getter migration_type : String?

        # Amazon Resource Name (ARN) of a serverless replication on which you want to base the default list of
        # individual assessments.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String?

        # ARN of a replication instance on which you want to base the default list of individual assessments.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String?

        # Amazon Resource Name (ARN) of a migration task on which you want to base the default list of
        # individual assessments.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String?

        # Name of a database engine that the specified replication instance supports as a source.

        @[JSON::Field(key: "SourceEngineName")]
        getter source_engine_name : String?

        # Name of a database engine that the specified replication instance supports as a target.

        @[JSON::Field(key: "TargetEngineName")]
        getter target_engine_name : String?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @migration_type : String? = nil,
          @replication_config_arn : String? = nil,
          @replication_instance_arn : String? = nil,
          @replication_task_arn : String? = nil,
          @source_engine_name : String? = nil,
          @target_engine_name : String? = nil
        )
        end
      end


      struct DescribeApplicableIndividualAssessmentsResponse
        include JSON::Serializable

        # List of names for the individual assessments supported by the premigration assessment run that you
        # start based on the specified request parameters. For more information on the available individual
        # assessments, including compatibility with different migration task configurations, see Working with
        # premigration assessment runs in the Database Migration Service User Guide.

        @[JSON::Field(key: "IndividualAssessmentNames")]
        getter individual_assessment_names : Array(String)?

        # Pagination token returned for you to pass to a subsequent request. If you pass this token as the
        # Marker value in a subsequent request, the response includes only records beyond the marker, up to
        # the value specified in the request by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @individual_assessment_names : Array(String)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct DescribeCertificatesMessage
        include JSON::Serializable

        # Filters applied to the certificates described in the form of key-value pairs. Valid values are
        # certificate-arn and certificate-id .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 10

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeCertificatesResponse
        include JSON::Serializable

        # The Secure Sockets Layer (SSL) certificates associated with the replication instance.

        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::Certificate)?

        # The pagination token.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @certificates : Array(Types::Certificate)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct DescribeConnectionsMessage
        include JSON::Serializable

        # The filters applied to the connection. Valid filter names: endpoint-arn | replication-instance-arn

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeConnectionsResponse
        include JSON::Serializable

        # A description of the connections.

        @[JSON::Field(key: "Connections")]
        getter connections : Array(Types::Connection)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @connections : Array(Types::Connection)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct DescribeConversionConfigurationMessage
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) for the schema conversion project to describe.

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        def initialize(
          @migration_project_identifier : String
        )
        end
      end


      struct DescribeConversionConfigurationResponse
        include JSON::Serializable

        # The configuration parameters for the schema conversion project.

        @[JSON::Field(key: "ConversionConfiguration")]
        getter conversion_configuration : String?

        # The name or Amazon Resource Name (ARN) for the schema conversion project.

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String?

        def initialize(
          @conversion_configuration : String? = nil,
          @migration_project_identifier : String? = nil
        )
        end
      end


      struct DescribeDataMigrationsMessage
        include JSON::Serializable

        # Filters applied to the data migrations.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # An option to set to avoid returning information about settings. Use this to reduce overhead when
        # setting information is too large. To use this option, choose true ; otherwise, choose false (the
        # default).

        @[JSON::Field(key: "WithoutSettings")]
        getter without_settings : Bool?

        # An option to set to avoid returning information about statistics. Use this to reduce overhead when
        # statistics information is too large. To use this option, choose true ; otherwise, choose false (the
        # default).

        @[JSON::Field(key: "WithoutStatistics")]
        getter without_statistics : Bool?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @without_settings : Bool? = nil,
          @without_statistics : Bool? = nil
        )
        end
      end


      struct DescribeDataMigrationsResponse
        include JSON::Serializable

        # Returns information about the data migrations used in the project.

        @[JSON::Field(key: "DataMigrations")]
        getter data_migrations : Array(Types::DataMigration)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @data_migrations : Array(Types::DataMigration)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct DescribeDataProvidersMessage
        include JSON::Serializable

        # Filters applied to the data providers described in the form of key-value pairs. Valid filter names
        # and values: data-provider-identifier, data provider arn or name

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, DMS includes a pagination token in the response so that you can retrieve the
        # remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeDataProvidersResponse
        include JSON::Serializable

        # A description of data providers.

        @[JSON::Field(key: "DataProviders")]
        getter data_providers : Array(Types::DataProvider)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @data_providers : Array(Types::DataProvider)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct DescribeEndpointSettingsMessage
        include JSON::Serializable

        # The database engine used for your source or target endpoint.

        @[JSON::Field(key: "EngineName")]
        getter engine_name : String

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @engine_name : String,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeEndpointSettingsResponse
        include JSON::Serializable

        # Descriptions of the endpoint settings available for your source or target database engine.

        @[JSON::Field(key: "EndpointSettings")]
        getter endpoint_settings : Array(Types::EndpointSetting)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @endpoint_settings : Array(Types::EndpointSetting)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct DescribeEndpointTypesMessage
        include JSON::Serializable

        # Filters applied to the endpoint types. Valid filter names: engine-name | endpoint-type

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeEndpointTypesResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The types of endpoints that are supported.

        @[JSON::Field(key: "SupportedEndpointTypes")]
        getter supported_endpoint_types : Array(Types::SupportedEndpointType)?

        def initialize(
          @marker : String? = nil,
          @supported_endpoint_types : Array(Types::SupportedEndpointType)? = nil
        )
        end
      end


      struct DescribeEndpointsMessage
        include JSON::Serializable

        # Filters applied to the endpoints. Valid filter names: endpoint-arn | endpoint-type | endpoint-id |
        # engine-name

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeEndpointsResponse
        include JSON::Serializable

        # Endpoint description.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::Endpoint)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @endpoints : Array(Types::Endpoint)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct DescribeEngineVersionsMessage
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeEngineVersionsResponse
        include JSON::Serializable

        # Returned EngineVersion objects that describe the replication instance engine versions used in the
        # project.

        @[JSON::Field(key: "EngineVersions")]
        getter engine_versions : Array(Types::EngineVersion)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @engine_versions : Array(Types::EngineVersion)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct DescribeEventCategoriesMessage
        include JSON::Serializable

        # Filters applied to the event categories.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The type of DMS resource that generates events. Valid values: replication-instance |
        # replication-task

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @source_type : String? = nil
        )
        end
      end


      struct DescribeEventCategoriesResponse
        include JSON::Serializable

        # A list of event categories.

        @[JSON::Field(key: "EventCategoryGroupList")]
        getter event_category_group_list : Array(Types::EventCategoryGroup)?

        def initialize(
          @event_category_group_list : Array(Types::EventCategoryGroup)? = nil
        )
        end
      end


      struct DescribeEventSubscriptionsMessage
        include JSON::Serializable

        # Filters applied to event subscriptions. Valid filter names: event-subscription-arn |
        # event-subscription-id

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The name of the DMS event subscription to be described.

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


      struct DescribeEventSubscriptionsResponse
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


      struct DescribeEventsMessage
        include JSON::Serializable

        # The duration of the events to be listed.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The end time for the events to be listed.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # A list of event categories for the source type that you've chosen.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # Filters applied to events. The only valid filter is replication-instance-id .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The identifier of an event source.

        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        # The type of DMS resource that generates events. Valid values: replication-instance |
        # replication-task

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The start time for the events to be listed.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
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


      struct DescribeEventsResponse
        include JSON::Serializable

        # The events described.

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


      struct DescribeExtensionPackAssociationsMessage
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) for the migration project.

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Filters applied to the extension pack associations described in the form of key-value pairs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, DMS includes a pagination token in the response so that you can retrieve the
        # remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @migration_project_identifier : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeExtensionPackAssociationsResponse
        include JSON::Serializable

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A paginated list of extension pack associations for the specified migration project.

        @[JSON::Field(key: "Requests")]
        getter requests : Array(Types::SchemaConversionRequest)?

        def initialize(
          @marker : String? = nil,
          @requests : Array(Types::SchemaConversionRequest)? = nil
        )
        end
      end


      struct DescribeFleetAdvisorCollectorsRequest
        include JSON::Serializable

        # If you specify any of the following filters, the output includes information for only those
        # collectors that meet the filter criteria: collector-referenced-id – The ID of the collector agent,
        # for example d4610ac5-e323-4ad9-bc50-eaf7249dfe9d . collector-name – The name of the collector agent.
        # An example is: describe-fleet-advisor-collectors --filter
        # Name="collector-referenced-id",Values="d4610ac5-e323-4ad9-bc50-eaf7249dfe9d"

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Sets the maximum number of records returned in the response.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # If NextToken is returned by a previous response, there are more results available. The value of
        # NextToken is a unique pagination token for each page. Make the call again using the returned token
        # to retrieve the next page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAdvisorCollectorsResponse
        include JSON::Serializable

        # Provides descriptions of the Fleet Advisor collectors, including the collectors' name and ID, and
        # the latest inventory data.

        @[JSON::Field(key: "Collectors")]
        getter collectors : Array(Types::CollectorResponse)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @collectors : Array(Types::CollectorResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAdvisorDatabasesRequest
        include JSON::Serializable

        # If you specify any of the following filters, the output includes information for only those
        # databases that meet the filter criteria: database-id – The ID of the database. database-name – The
        # name of the database. database-engine – The name of the database engine. server-ip-address – The IP
        # address of the database server. database-ip-address – The IP address of the database. collector-name
        # – The name of the associated Fleet Advisor collector. An example is:
        # describe-fleet-advisor-databases --filter Name="database-id",Values="45"

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Sets the maximum number of records returned in the response.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # If NextToken is returned by a previous response, there are more results available. The value of
        # NextToken is a unique pagination token for each page. Make the call again using the returned token
        # to retrieve the next page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAdvisorDatabasesResponse
        include JSON::Serializable

        # Provides descriptions of the Fleet Advisor collector databases, including the database's collector,
        # ID, and name.

        @[JSON::Field(key: "Databases")]
        getter databases : Array(Types::DatabaseResponse)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @databases : Array(Types::DatabaseResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAdvisorLsaAnalysisRequest
        include JSON::Serializable

        # Sets the maximum number of records returned in the response.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # If NextToken is returned by a previous response, there are more results available. The value of
        # NextToken is a unique pagination token for each page. Make the call again using the returned token
        # to retrieve the next page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAdvisorLsaAnalysisResponse
        include JSON::Serializable

        # A list of FleetAdvisorLsaAnalysisResponse objects.

        @[JSON::Field(key: "Analysis")]
        getter analysis : Array(Types::FleetAdvisorLsaAnalysisResponse)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @analysis : Array(Types::FleetAdvisorLsaAnalysisResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAdvisorSchemaObjectSummaryRequest
        include JSON::Serializable

        # If you specify any of the following filters, the output includes information for only those schema
        # objects that meet the filter criteria: schema-id – The ID of the schema, for example
        # d4610ac5-e323-4ad9-bc50-eaf7249dfe9d . Example: describe-fleet-advisor-schema-object-summary
        # --filter Name="schema-id",Values="50"

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
        # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
        # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
        # information, see Amazon Web Services DMS Fleet Advisor end of support . Sets the maximum number of
        # records returned in the response.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # If NextToken is returned by a previous response, there are more results available. The value of
        # NextToken is a unique pagination token for each page. Make the call again using the returned token
        # to retrieve the next page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAdvisorSchemaObjectSummaryResponse
        include JSON::Serializable

        # A collection of FleetAdvisorSchemaObjectResponse objects.

        @[JSON::Field(key: "FleetAdvisorSchemaObjects")]
        getter fleet_advisor_schema_objects : Array(Types::FleetAdvisorSchemaObjectResponse)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_advisor_schema_objects : Array(Types::FleetAdvisorSchemaObjectResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAdvisorSchemasRequest
        include JSON::Serializable

        # If you specify any of the following filters, the output includes information for only those schemas
        # that meet the filter criteria: complexity – The schema's complexity, for example Simple .
        # database-id – The ID of the schema's database. database-ip-address – The IP address of the schema's
        # database. database-name – The name of the schema's database. database-engine – The name of the
        # schema database's engine. original-schema-name – The name of the schema's database's main schema.
        # schema-id – The ID of the schema, for example 15 . schema-name – The name of the schema.
        # server-ip-address – The IP address of the schema database's server. An example is:
        # describe-fleet-advisor-schemas --filter Name="schema-id",Values="50"

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Sets the maximum number of records returned in the response.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # If NextToken is returned by a previous response, there are more results available. The value of
        # NextToken is a unique pagination token for each page. Make the call again using the returned token
        # to retrieve the next page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAdvisorSchemasResponse
        include JSON::Serializable

        # A collection of SchemaResponse objects.

        @[JSON::Field(key: "FleetAdvisorSchemas")]
        getter fleet_advisor_schemas : Array(Types::SchemaResponse)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_advisor_schemas : Array(Types::SchemaResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstanceProfilesMessage
        include JSON::Serializable

        # Filters applied to the instance profiles described in the form of key-value pairs. Valid filter
        # names and values: instance-profile-identifier, instance profile arn or name

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, DMS includes a pagination token in the response so that you can retrieve the
        # remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeInstanceProfilesResponse
        include JSON::Serializable

        # A description of instance profiles.

        @[JSON::Field(key: "InstanceProfiles")]
        getter instance_profiles : Array(Types::InstanceProfile)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @instance_profiles : Array(Types::InstanceProfile)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct DescribeMetadataModelAssessmentsMessage
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the migration project.

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Filters applied to the metadata model assessments described in the form of key-value pairs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, DMS includes a pagination token in the response so that you can retrieve the
        # remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @migration_project_identifier : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeMetadataModelAssessmentsResponse
        include JSON::Serializable

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A paginated list of metadata model assessments for the specified migration project.

        @[JSON::Field(key: "Requests")]
        getter requests : Array(Types::SchemaConversionRequest)?

        def initialize(
          @marker : String? = nil,
          @requests : Array(Types::SchemaConversionRequest)? = nil
        )
        end
      end


      struct DescribeMetadataModelChildrenMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Specifies whether to retrieve metadata from the source or target tree. Valid values: SOURCE | TARGET

        @[JSON::Field(key: "Origin")]
        getter origin : String

        # The JSON string that specifies which metadata model's children to retrieve. Only one selection rule
        # with "rule-action": "explicit" can be provided. For more information, see Selection Rules in the DMS
        # User Guide.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        # Specifies the unique pagination token that indicates where the next page should start. If this
        # parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of metadata model children to include in the response. If more items exist than
        # the specified MaxRecords value, a marker is included in the response so that the remaining results
        # can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @migration_project_identifier : String,
          @origin : String,
          @selection_rules : String,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeMetadataModelChildrenResponse
        include JSON::Serializable

        # Specifies the unique pagination token that makes it possible to display the next page of metadata
        # model children. If a marker is returned, there are more metadata model children available.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of child metadata models.

        @[JSON::Field(key: "MetadataModelChildren")]
        getter metadata_model_children : Array(Types::MetadataModelReference)?

        def initialize(
          @marker : String? = nil,
          @metadata_model_children : Array(Types::MetadataModelReference)? = nil
        )
        end
      end


      struct DescribeMetadataModelConversionsMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Filters applied to the metadata model conversions described in the form of key-value pairs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, DMS includes a pagination token in the response so that you can retrieve the
        # remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @migration_project_identifier : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeMetadataModelConversionsResponse
        include JSON::Serializable

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A paginated list of metadata model conversions.

        @[JSON::Field(key: "Requests")]
        getter requests : Array(Types::SchemaConversionRequest)?

        def initialize(
          @marker : String? = nil,
          @requests : Array(Types::SchemaConversionRequest)? = nil
        )
        end
      end


      struct DescribeMetadataModelCreationsMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Filters applied to the metadata model creation requests described in the form of key-value pairs.
        # The supported filters are request-id and status.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of metadata
        # model creation requests. If Marker is returned by a previous response, there are more metadata model
        # creation requests available.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of metadata model creation requests to include in the response. If more requests
        # exist than the specified MaxRecords value, a pagination token is provided in the response so that
        # you can retrieve the remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @migration_project_identifier : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeMetadataModelCreationsResponse
        include JSON::Serializable

        # Specifies the unique pagination token that makes it possible to display the next page of metadata
        # model creation requests. If Marker is returned, there are more metadata model creation requests
        # available.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of metadata model creation requests. The ExportSqlDetails field will never be populated for
        # the DescribeMetadataModelCreations operation.

        @[JSON::Field(key: "Requests")]
        getter requests : Array(Types::SchemaConversionRequest)?

        def initialize(
          @marker : String? = nil,
          @requests : Array(Types::SchemaConversionRequest)? = nil
        )
        end
      end


      struct DescribeMetadataModelExportsAsScriptMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Filters applied to the metadata model exports described in the form of key-value pairs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, DMS includes a pagination token in the response so that you can retrieve the
        # remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @migration_project_identifier : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeMetadataModelExportsAsScriptResponse
        include JSON::Serializable

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A paginated list of metadata model exports.

        @[JSON::Field(key: "Requests")]
        getter requests : Array(Types::SchemaConversionRequest)?

        def initialize(
          @marker : String? = nil,
          @requests : Array(Types::SchemaConversionRequest)? = nil
        )
        end
      end


      struct DescribeMetadataModelExportsToTargetMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Filters applied to the metadata model exports described in the form of key-value pairs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, DMS includes a pagination token in the response so that you can retrieve the
        # remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @migration_project_identifier : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeMetadataModelExportsToTargetResponse
        include JSON::Serializable

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A paginated list of metadata model exports.

        @[JSON::Field(key: "Requests")]
        getter requests : Array(Types::SchemaConversionRequest)?

        def initialize(
          @marker : String? = nil,
          @requests : Array(Types::SchemaConversionRequest)? = nil
        )
        end
      end


      struct DescribeMetadataModelImportsMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Filters applied to the metadata model imports described in the form of key-value pairs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A paginated list of metadata model imports.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @migration_project_identifier : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeMetadataModelImportsResponse
        include JSON::Serializable

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A paginated list of metadata model imports.

        @[JSON::Field(key: "Requests")]
        getter requests : Array(Types::SchemaConversionRequest)?

        def initialize(
          @marker : String? = nil,
          @requests : Array(Types::SchemaConversionRequest)? = nil
        )
        end
      end


      struct DescribeMetadataModelMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Specifies whether to retrieve metadata from the source or target tree. Valid values: SOURCE | TARGET

        @[JSON::Field(key: "Origin")]
        getter origin : String

        # The JSON string that specifies which metadata model to retrieve. Only one selection rule with
        # "rule-action": "explicit" can be provided. For more information, see Selection Rules in the DMS User
        # Guide.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        def initialize(
          @migration_project_identifier : String,
          @origin : String,
          @selection_rules : String
        )
        end
      end


      struct DescribeMetadataModelResponse
        include JSON::Serializable

        # The SQL text of the metadata model. This field might not be populated for some metadata models.

        @[JSON::Field(key: "Definition")]
        getter definition : String?

        # The name of the metadata model.

        @[JSON::Field(key: "MetadataModelName")]
        getter metadata_model_name : String?

        # The type of the metadata model.

        @[JSON::Field(key: "MetadataModelType")]
        getter metadata_model_type : String?

        # A list of counterpart metadata models in the target. This field is populated only when Origin is
        # SOURCE and after the object has been converted by DMS Schema Conversion.

        @[JSON::Field(key: "TargetMetadataModels")]
        getter target_metadata_models : Array(Types::MetadataModelReference)?

        def initialize(
          @definition : String? = nil,
          @metadata_model_name : String? = nil,
          @metadata_model_type : String? = nil,
          @target_metadata_models : Array(Types::MetadataModelReference)? = nil
        )
        end
      end


      struct DescribeMigrationProjectsMessage
        include JSON::Serializable

        # Filters applied to the migration projects described in the form of key-value pairs. Valid filter
        # names and values: instance-profile-identifier, instance profile arn or name
        # data-provider-identifier, data provider arn or name migration-project-identifier, migration project
        # arn or name

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, DMS includes a pagination token in the response so that you can retrieve the
        # remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeMigrationProjectsResponse
        include JSON::Serializable

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If Marker is returned by a previous response, there are more results
        # available. The value of Marker is a unique pagination token for each page. To retrieve the next
        # page, make the call again using the returned token and keeping all other arguments unchanged.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A description of migration projects.

        @[JSON::Field(key: "MigrationProjects")]
        getter migration_projects : Array(Types::MigrationProject)?

        def initialize(
          @marker : String? = nil,
          @migration_projects : Array(Types::MigrationProject)? = nil
        )
        end
      end


      struct DescribeOrderableReplicationInstancesMessage
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeOrderableReplicationInstancesResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The order-able replication instances available.

        @[JSON::Field(key: "OrderableReplicationInstances")]
        getter orderable_replication_instances : Array(Types::OrderableReplicationInstance)?

        def initialize(
          @marker : String? = nil,
          @orderable_replication_instances : Array(Types::OrderableReplicationInstance)? = nil
        )
        end
      end


      struct DescribePendingMaintenanceActionsMessage
        include JSON::Serializable


        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @replication_instance_arn : String? = nil
        )
        end
      end


      struct DescribePendingMaintenanceActionsResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The pending maintenance action.

        @[JSON::Field(key: "PendingMaintenanceActions")]
        getter pending_maintenance_actions : Array(Types::ResourcePendingMaintenanceActions)?

        def initialize(
          @marker : String? = nil,
          @pending_maintenance_actions : Array(Types::ResourcePendingMaintenanceActions)? = nil
        )
        end
      end


      struct DescribeRecommendationLimitationsRequest
        include JSON::Serializable

        # Filters applied to the limitations described in the form of key-value pairs. Valid filter names:
        # database-id | engine-name

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, Fleet Advisor includes a pagination token in the response so that you can retrieve
        # the remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If NextToken is returned by a previous response, there are more results
        # available. The value of NextToken is a unique pagination token for each page. Make the call again
        # using the returned token to retrieve the next page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeRecommendationLimitationsResponse
        include JSON::Serializable

        # The list of limitations for recommendations of target Amazon Web Services engines.

        @[JSON::Field(key: "Limitations")]
        getter limitations : Array(Types::Limitation)?

        # The unique pagination token returned for you to pass to a subsequent request. Fleet Advisor returns
        # this token when the number of records in the response is greater than the MaxRecords value. To
        # retrieve the next page, make the call again using the returned token and keeping all other arguments
        # unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limitations : Array(Types::Limitation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeRecommendationsRequest
        include JSON::Serializable

        # Filters applied to the target engine recommendations described in the form of key-value pairs. Valid
        # filter names: database-id | engine-name

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, Fleet Advisor includes a pagination token in the response so that you can retrieve
        # the remaining results.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # Specifies the unique pagination token that makes it possible to display the next page of results. If
        # this parameter is specified, the response includes only records beyond the marker, up to the value
        # specified by MaxRecords . If NextToken is returned by a previous response, there are more results
        # available. The value of NextToken is a unique pagination token for each page. Make the call again
        # using the returned token to retrieve the next page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeRecommendationsResponse
        include JSON::Serializable

        # The unique pagination token returned for you to pass to a subsequent request. Fleet Advisor returns
        # this token when the number of records in the response is greater than the MaxRecords value. To
        # retrieve the next page, make the call again using the returned token and keeping all other arguments
        # unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of recommendations of target engines that Fleet Advisor created for the source database.

        @[JSON::Field(key: "Recommendations")]
        getter recommendations : Array(Types::Recommendation)?

        def initialize(
          @next_token : String? = nil,
          @recommendations : Array(Types::Recommendation)? = nil
        )
        end
      end


      struct DescribeRefreshSchemasStatusMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        def initialize(
          @endpoint_arn : String
        )
        end
      end


      struct DescribeRefreshSchemasStatusResponse
        include JSON::Serializable

        # The status of the schema.

        @[JSON::Field(key: "RefreshSchemasStatus")]
        getter refresh_schemas_status : Types::RefreshSchemasStatus?

        def initialize(
          @refresh_schemas_status : Types::RefreshSchemasStatus? = nil
        )
        end
      end


      struct DescribeReplicationConfigsMessage
        include JSON::Serializable

        # Filters applied to the replication configs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeReplicationConfigsResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Returned configuration parameters that describe each provisioned DMS Serverless replication.

        @[JSON::Field(key: "ReplicationConfigs")]
        getter replication_configs : Array(Types::ReplicationConfig)?

        def initialize(
          @marker : String? = nil,
          @replication_configs : Array(Types::ReplicationConfig)? = nil
        )
        end
      end


      struct DescribeReplicationInstanceTaskLogsMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @replication_instance_arn : String,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeReplicationInstanceTaskLogsResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String?

        # An array of replication task log metadata. Each member of the array contains the replication task
        # name, ARN, and task log size (in bytes).

        @[JSON::Field(key: "ReplicationInstanceTaskLogs")]
        getter replication_instance_task_logs : Array(Types::ReplicationInstanceTaskLog)?

        def initialize(
          @marker : String? = nil,
          @replication_instance_arn : String? = nil,
          @replication_instance_task_logs : Array(Types::ReplicationInstanceTaskLog)? = nil
        )
        end
      end


      struct DescribeReplicationInstancesMessage
        include JSON::Serializable

        # Filters applied to replication instances. Valid filter names: replication-instance-arn |
        # replication-instance-id | replication-instance-class | engine-version

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeReplicationInstancesResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The replication instances described.

        @[JSON::Field(key: "ReplicationInstances")]
        getter replication_instances : Array(Types::ReplicationInstance)?

        def initialize(
          @marker : String? = nil,
          @replication_instances : Array(Types::ReplicationInstance)? = nil
        )
        end
      end


      struct DescribeReplicationSubnetGroupsMessage
        include JSON::Serializable

        # Filters applied to replication subnet groups. Valid filter names: replication-subnet-group-id

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeReplicationSubnetGroupsResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A description of the replication subnet groups.

        @[JSON::Field(key: "ReplicationSubnetGroups")]
        getter replication_subnet_groups : Array(Types::ReplicationSubnetGroup)?

        def initialize(
          @marker : String? = nil,
          @replication_subnet_groups : Array(Types::ReplicationSubnetGroup)? = nil
        )
        end
      end


      struct DescribeReplicationTableStatisticsMessage
        include JSON::Serializable

        # The replication config to describe.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String

        # Filters applied to the replication table statistics.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @replication_config_arn : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeReplicationTableStatisticsResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The Amazon Resource Name of the replication config.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String?

        # Returns table statistics on the replication, including table name, rows inserted, rows updated, and
        # rows deleted.

        @[JSON::Field(key: "ReplicationTableStatistics")]
        getter replication_table_statistics : Array(Types::TableStatistics)?

        def initialize(
          @marker : String? = nil,
          @replication_config_arn : String? = nil,
          @replication_table_statistics : Array(Types::TableStatistics)? = nil
        )
        end
      end


      struct DescribeReplicationTaskAssessmentResultsMessage
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The Amazon Resource Name (ARN) string that uniquely identifies the task. When this input parameter
        # is specified, the API returns only one result and ignore the values of the MaxRecords and Marker
        # parameters.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @replication_task_arn : String? = nil
        )
        end
      end


      struct DescribeReplicationTaskAssessmentResultsResponse
        include JSON::Serializable

        # - The Amazon S3 bucket where the task assessment report is located.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The task assessment report.

        @[JSON::Field(key: "ReplicationTaskAssessmentResults")]
        getter replication_task_assessment_results : Array(Types::ReplicationTaskAssessmentResult)?

        def initialize(
          @bucket_name : String? = nil,
          @marker : String? = nil,
          @replication_task_assessment_results : Array(Types::ReplicationTaskAssessmentResult)? = nil
        )
        end
      end


      struct DescribeReplicationTaskAssessmentRunsMessage
        include JSON::Serializable

        # Filters applied to the premigration assessment runs described in the form of key-value pairs. Valid
        # filter names: replication-task-assessment-run-arn , replication-task-arn , replication-instance-arn
        # , status

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeReplicationTaskAssessmentRunsResponse
        include JSON::Serializable

        # A pagination token returned for you to pass to a subsequent request. If you pass this token as the
        # Marker value in a subsequent request, the response includes only records beyond the marker, up to
        # the value specified in the request by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # One or more premigration assessment runs as specified by Filters .

        @[JSON::Field(key: "ReplicationTaskAssessmentRuns")]
        getter replication_task_assessment_runs : Array(Types::ReplicationTaskAssessmentRun)?

        def initialize(
          @marker : String? = nil,
          @replication_task_assessment_runs : Array(Types::ReplicationTaskAssessmentRun)? = nil
        )
        end
      end


      struct DescribeReplicationTaskIndividualAssessmentsMessage
        include JSON::Serializable

        # Filters applied to the individual assessments described in the form of key-value pairs. Valid filter
        # names: replication-task-assessment-run-arn , replication-task-arn , status

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeReplicationTaskIndividualAssessmentsResponse
        include JSON::Serializable

        # A pagination token returned for you to pass to a subsequent request. If you pass this token as the
        # Marker value in a subsequent request, the response includes only records beyond the marker, up to
        # the value specified in the request by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # One or more individual assessments as specified by Filters .

        @[JSON::Field(key: "ReplicationTaskIndividualAssessments")]
        getter replication_task_individual_assessments : Array(Types::ReplicationTaskIndividualAssessment)?

        def initialize(
          @marker : String? = nil,
          @replication_task_individual_assessments : Array(Types::ReplicationTaskIndividualAssessment)? = nil
        )
        end
      end


      struct DescribeReplicationTasksMessage
        include JSON::Serializable

        # Filters applied to replication tasks. Valid filter names: replication-task-arn | replication-task-id
        # | migration-type | endpoint-arn | replication-instance-arn

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # An option to set to avoid returning information about settings. Use this to reduce overhead when
        # setting information is too large. To use this option, choose true ; otherwise, choose false (the
        # default).

        @[JSON::Field(key: "WithoutSettings")]
        getter without_settings : Bool?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @without_settings : Bool? = nil
        )
        end
      end


      struct DescribeReplicationTasksResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A description of the replication tasks.

        @[JSON::Field(key: "ReplicationTasks")]
        getter replication_tasks : Array(Types::ReplicationTask)?

        def initialize(
          @marker : String? = nil,
          @replication_tasks : Array(Types::ReplicationTask)? = nil
        )
        end
      end


      struct DescribeReplicationsMessage
        include JSON::Serializable

        # Filters applied to the replications. Valid filter names: replication-config-arn |
        # replication-config-id

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeReplicationsResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The replication descriptions.

        @[JSON::Field(key: "Replications")]
        getter replications : Array(Types::Replication)?

        def initialize(
          @marker : String? = nil,
          @replications : Array(Types::Replication)? = nil
        )
        end
      end


      struct DescribeSchemasMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @endpoint_arn : String,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeSchemasResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The described schema.

        @[JSON::Field(key: "Schemas")]
        getter schemas : Array(String)?

        def initialize(
          @marker : String? = nil,
          @schemas : Array(String)? = nil
        )
        end
      end


      struct DescribeTableStatisticsMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication task.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String

        # Filters applied to table statistics. Valid filter names: schema-name | table-name | table-state A
        # combination of filters creates an AND condition where each record matches all specified filters.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a pagination token called a marker is included in the response so that the
        # remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 500.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @replication_task_arn : String,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end


      struct DescribeTableStatisticsResponse
        include JSON::Serializable

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the marker, up to the value specified by MaxRecords .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The Amazon Resource Name (ARN) of the replication task.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String?

        # The table statistics.

        @[JSON::Field(key: "TableStatistics")]
        getter table_statistics : Array(Types::TableStatistics)?

        def initialize(
          @marker : String? = nil,
          @replication_task_arn : String? = nil,
          @table_statistics : Array(Types::TableStatistics)? = nil
        )
        end
      end

      # The settings in JSON format for the DMS Transfer type source endpoint.

      struct DmsTransferSettings
        include JSON::Serializable

        # The name of the S3 bucket to use.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # The Amazon Resource Name (ARN) used by the service access IAM role. The role must allow the
        # iam:PassRole action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        def initialize(
          @bucket_name : String? = nil,
          @service_access_role_arn : String? = nil
        )
        end
      end

      # Provides information that defines a DocumentDB data provider.

      struct DocDbDataProviderSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The database name on the DocumentDB data provider.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The port value for the DocumentDB data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The name of the source DocumentDB server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the DocumentDB data provider. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @port : Int32? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end

      # Provides information that defines a DocumentDB endpoint.

      struct DocDbSettings
        include JSON::Serializable

        # The database name on the DocumentDB source endpoint.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Indicates the number of documents to preview to determine the document organization. Use this
        # setting when NestingLevel is set to "one" . Must be a positive value greater than 0 . Default value
        # is 1000 .

        @[JSON::Field(key: "DocsToInvestigate")]
        getter docs_to_investigate : Int32?

        # Specifies the document ID. Use this setting when NestingLevel is set to "none" . Default value is
        # "false" .

        @[JSON::Field(key: "ExtractDocId")]
        getter extract_doc_id : Bool?

        # The KMS key identifier that is used to encrypt the content on the replication instance. If you don't
        # specify a value for the KmsKeyId parameter, then DMS uses your default encryption key. KMS creates
        # the default encryption key for your Amazon Web Services account. Your Amazon Web Services account
        # has a different default encryption key for each Amazon Web Services Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies either document or table mode. Default value is "none" . Specify "none" to use document
        # mode. Specify "one" to use table mode.

        @[JSON::Field(key: "NestingLevel")]
        getter nesting_level : String?

        # The password for the user account you use to access the DocumentDB source endpoint.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The port value for the DocumentDB source endpoint.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # If true , DMS replicates data to shard collections. DMS only uses this setting if the target
        # endpoint is a DocumentDB elastic cluster. When this setting is true , note the following: You must
        # set TargetTablePrepMode to nothing . DMS automatically sets useUpdateLookup to false .

        @[JSON::Field(key: "ReplicateShardCollections")]
        getter replicate_shard_collections : Bool?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret . The role must allow
        # the iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets
        # Manager secret that allows access to the DocumentDB endpoint. You can specify one of two sets of
        # values for these permissions. You can specify the values for this setting and SecretsManagerSecretId
        # . Or you can specify clear-text values for UserName , Password , ServerName , and Port . You can't
        # specify both. For more information on creating this SecretsManagerSecret and the
        # SecretsManagerAccessRoleArn and SecretsManagerSecretId required to access it, see Using secrets to
        # access Database Migration Service resources in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the DocumentDB
        # endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # The name of the server on the DocumentDB source endpoint.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # If true , DMS retrieves the entire document from the DocumentDB source during migration. This may
        # cause a migration failure if the server response exceeds bandwidth limits. To fetch only updates and
        # deletes during migration, set this parameter to false .

        @[JSON::Field(key: "UseUpdateLookUp")]
        getter use_update_look_up : Bool?

        # The user name you use to access the DocumentDB source endpoint.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @database_name : String? = nil,
          @docs_to_investigate : Int32? = nil,
          @extract_doc_id : Bool? = nil,
          @kms_key_id : String? = nil,
          @nesting_level : String? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @replicate_shard_collections : Bool? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @server_name : String? = nil,
          @use_update_look_up : Bool? = nil,
          @username : String? = nil
        )
        end
      end

      # Provides the Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role used to
      # define an Amazon DynamoDB target endpoint.

      struct DynamoDbSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) used by the service to access the IAM role. The role must allow the
        # iam:PassRole action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String

        def initialize(
          @service_access_role_arn : String
        )
        end
      end

      # Provides information that defines an OpenSearch endpoint.

      struct ElasticsearchSettings
        include JSON::Serializable

        # The endpoint for the OpenSearch cluster. DMS uses HTTPS if a transport protocol (http/https) is not
        # specified.

        @[JSON::Field(key: "EndpointUri")]
        getter endpoint_uri : String

        # The Amazon Resource Name (ARN) used by the service to access the IAM role. The role must allow the
        # iam:PassRole action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String

        # The maximum number of seconds for which DMS retries failed API requests to the OpenSearch cluster.

        @[JSON::Field(key: "ErrorRetryDuration")]
        getter error_retry_duration : Int32?

        # The maximum percentage of records that can fail to be written before a full load operation stops. To
        # avoid early failure, this counter is only effective after 1000 records are transferred. OpenSearch
        # also has the concept of error monitoring during the last 10 minutes of an Observation Window. If
        # transfer of all records fail in the last 10 minutes, the full load operation stops.

        @[JSON::Field(key: "FullLoadErrorPercentage")]
        getter full_load_error_percentage : Int32?

        # Set this option to true for DMS to migrate documentation using the documentation type _doc .
        # OpenSearch and an Elasticsearch cluster only support the _doc documentation type in versions 7. x
        # and later. The default value is false .

        @[JSON::Field(key: "UseNewMappingType")]
        getter use_new_mapping_type : Bool?

        def initialize(
          @endpoint_uri : String,
          @service_access_role_arn : String,
          @error_retry_duration : Int32? = nil,
          @full_load_error_percentage : Int32? = nil,
          @use_new_mapping_type : Bool? = nil
        )
        end
      end

      # Describes an endpoint of a database instance in response to operations such as the following:
      # CreateEndpoint DescribeEndpoint ModifyEndpoint

      struct Endpoint
        include JSON::Serializable

        # The Amazon Resource Name (ARN) used for SSL connection to the endpoint.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The name of the database at the endpoint.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The settings for the DMS Transfer type source. For more information, see the DmsTransferSettings
        # structure.

        @[JSON::Field(key: "DmsTransferSettings")]
        getter dms_transfer_settings : Types::DmsTransferSettings?


        @[JSON::Field(key: "DocDbSettings")]
        getter doc_db_settings : Types::DocDbSettings?

        # The settings for the DynamoDB target endpoint. For more information, see the DynamoDBSettings
        # structure.

        @[JSON::Field(key: "DynamoDbSettings")]
        getter dynamo_db_settings : Types::DynamoDbSettings?

        # The settings for the OpenSearch source endpoint. For more information, see the ElasticsearchSettings
        # structure.

        @[JSON::Field(key: "ElasticsearchSettings")]
        getter elasticsearch_settings : Types::ElasticsearchSettings?

        # The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        # The database endpoint identifier. Identifiers must begin with a letter and must contain only ASCII
        # letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.

        @[JSON::Field(key: "EndpointIdentifier")]
        getter endpoint_identifier : String?

        # The type of endpoint. Valid values are source and target .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The expanded name for the engine name. For example, if the EngineName parameter is "aurora", this
        # value would be "Amazon Aurora MySQL".

        @[JSON::Field(key: "EngineDisplayName")]
        getter engine_display_name : String?

        # The database engine name. Valid values, depending on the EndpointType, include "mysql" , "oracle" ,
        # "postgres" , "mariadb" , "aurora" , "aurora-postgresql" , "redshift" , "redshift-serverless" , "s3"
        # , "db2" , "db2-zos" , "azuredb" , "sybase" , "dynamodb" , "mongodb" , "kinesis" , "kafka" ,
        # "elasticsearch" , "documentdb" , "sqlserver" , "neptune" , and "babelfish" .

        @[JSON::Field(key: "EngineName")]
        getter engine_name : String?

        # Value returned by a call to CreateEndpoint that can be used for cross-account validation. Use it on
        # a subsequent call to CreateEndpoint to create the endpoint with a cross-account.

        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # The external table definition.

        @[JSON::Field(key: "ExternalTableDefinition")]
        getter external_table_definition : String?

        # Additional connection attributes used to connect to the endpoint.

        @[JSON::Field(key: "ExtraConnectionAttributes")]
        getter extra_connection_attributes : String?

        # Settings in JSON format for the source GCP MySQL endpoint.

        @[JSON::Field(key: "GcpMySQLSettings")]
        getter gcp_my_sql_settings : Types::GcpMySQLSettings?

        # The settings for the IBM Db2 LUW source endpoint. For more information, see the IBMDb2Settings
        # structure.

        @[JSON::Field(key: "IBMDb2Settings")]
        getter ibm_db2_settings : Types::IBMDb2Settings?

        # Indicates whether the endpoint is read-only. When set to true , this endpoint is managed by DMS as
        # part of a zero-ETL integration and cannot be modified or deleted directly. You can only modify or
        # delete read-only endpoints through their associated zero-ETL integration.

        @[JSON::Field(key: "IsReadOnly")]
        getter is_read_only : Bool?

        # The settings for the Apache Kafka target endpoint. For more information, see the KafkaSettings
        # structure.

        @[JSON::Field(key: "KafkaSettings")]
        getter kafka_settings : Types::KafkaSettings?

        # The settings for the Amazon Kinesis target endpoint. For more information, see the KinesisSettings
        # structure.

        @[JSON::Field(key: "KinesisSettings")]
        getter kinesis_settings : Types::KinesisSettings?

        # An KMS key identifier that is used to encrypt the connection parameters for the endpoint. If you
        # don't specify a value for the KmsKeyId parameter, then DMS uses your default encryption key. KMS
        # creates the default encryption key for your Amazon Web Services account. Your Amazon Web Services
        # account has a different default encryption key for each Amazon Web Services Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Settings in JSON format for the target Lakehouse endpoint. This parameter applies to endpoints that
        # are automatically created by DMS for a Lakehouse data warehouse as part of a zero-ETL integration.

        @[JSON::Field(key: "LakehouseSettings")]
        getter lakehouse_settings : Types::LakehouseSettings?

        # The settings for the Microsoft SQL Server source and target endpoint. For more information, see the
        # MicrosoftSQLServerSettings structure.

        @[JSON::Field(key: "MicrosoftSQLServerSettings")]
        getter microsoft_sql_server_settings : Types::MicrosoftSQLServerSettings?

        # The settings for the MongoDB source endpoint. For more information, see the MongoDbSettings
        # structure.

        @[JSON::Field(key: "MongoDbSettings")]
        getter mongo_db_settings : Types::MongoDbSettings?

        # The settings for the MySQL source and target endpoint. For more information, see the MySQLSettings
        # structure.

        @[JSON::Field(key: "MySQLSettings")]
        getter my_sql_settings : Types::MySQLSettings?

        # The settings for the Amazon Neptune target endpoint. For more information, see the NeptuneSettings
        # structure.

        @[JSON::Field(key: "NeptuneSettings")]
        getter neptune_settings : Types::NeptuneSettings?

        # The settings for the Oracle source and target endpoint. For more information, see the OracleSettings
        # structure.

        @[JSON::Field(key: "OracleSettings")]
        getter oracle_settings : Types::OracleSettings?

        # The port value used to access the endpoint.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The settings for the PostgreSQL source and target endpoint. For more information, see the
        # PostgreSQLSettings structure.

        @[JSON::Field(key: "PostgreSQLSettings")]
        getter postgre_sql_settings : Types::PostgreSQLSettings?

        # The settings for the Redis target endpoint. For more information, see the RedisSettings structure.

        @[JSON::Field(key: "RedisSettings")]
        getter redis_settings : Types::RedisSettings?

        # Settings for the Amazon Redshift endpoint.

        @[JSON::Field(key: "RedshiftSettings")]
        getter redshift_settings : Types::RedshiftSettings?

        # The settings for the S3 target endpoint. For more information, see the S3Settings structure.

        @[JSON::Field(key: "S3Settings")]
        getter s3_settings : Types::S3Settings?

        # The name of the server at the endpoint.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The Amazon Resource Name (ARN) used by the service to access the IAM role. The role must allow the
        # iam:PassRole action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # The SSL mode used to connect to the endpoint. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        # The status of the endpoint.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The settings for the SAP ASE source and target endpoint. For more information, see the
        # SybaseSettings structure.

        @[JSON::Field(key: "SybaseSettings")]
        getter sybase_settings : Types::SybaseSettings?

        # The settings for the Amazon Timestream target endpoint. For more information, see the
        # TimestreamSettings structure.

        @[JSON::Field(key: "TimestreamSettings")]
        getter timestream_settings : Types::TimestreamSettings?

        # The user name used to connect to the endpoint.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @dms_transfer_settings : Types::DmsTransferSettings? = nil,
          @doc_db_settings : Types::DocDbSettings? = nil,
          @dynamo_db_settings : Types::DynamoDbSettings? = nil,
          @elasticsearch_settings : Types::ElasticsearchSettings? = nil,
          @endpoint_arn : String? = nil,
          @endpoint_identifier : String? = nil,
          @endpoint_type : String? = nil,
          @engine_display_name : String? = nil,
          @engine_name : String? = nil,
          @external_id : String? = nil,
          @external_table_definition : String? = nil,
          @extra_connection_attributes : String? = nil,
          @gcp_my_sql_settings : Types::GcpMySQLSettings? = nil,
          @ibm_db2_settings : Types::IBMDb2Settings? = nil,
          @is_read_only : Bool? = nil,
          @kafka_settings : Types::KafkaSettings? = nil,
          @kinesis_settings : Types::KinesisSettings? = nil,
          @kms_key_id : String? = nil,
          @lakehouse_settings : Types::LakehouseSettings? = nil,
          @microsoft_sql_server_settings : Types::MicrosoftSQLServerSettings? = nil,
          @mongo_db_settings : Types::MongoDbSettings? = nil,
          @my_sql_settings : Types::MySQLSettings? = nil,
          @neptune_settings : Types::NeptuneSettings? = nil,
          @oracle_settings : Types::OracleSettings? = nil,
          @port : Int32? = nil,
          @postgre_sql_settings : Types::PostgreSQLSettings? = nil,
          @redis_settings : Types::RedisSettings? = nil,
          @redshift_settings : Types::RedshiftSettings? = nil,
          @s3_settings : Types::S3Settings? = nil,
          @server_name : String? = nil,
          @service_access_role_arn : String? = nil,
          @ssl_mode : String? = nil,
          @status : String? = nil,
          @sybase_settings : Types::SybaseSettings? = nil,
          @timestream_settings : Types::TimestreamSettings? = nil,
          @username : String? = nil
        )
        end
      end

      # Endpoint settings.

      struct EndpointSetting
        include JSON::Serializable

        # The relevance or validity of an endpoint setting for an engine name and its endpoint type.

        @[JSON::Field(key: "Applicability")]
        getter applicability : String?

        # The default value of the endpoint setting if no value is specified using CreateEndpoint or
        # ModifyEndpoint .

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # Enumerated values to use for this endpoint.

        @[JSON::Field(key: "EnumValues")]
        getter enum_values : Array(String)?

        # The maximum value of an endpoint setting that is of type int .

        @[JSON::Field(key: "IntValueMax")]
        getter int_value_max : Int32?

        # The minimum value of an endpoint setting that is of type int .

        @[JSON::Field(key: "IntValueMin")]
        getter int_value_min : Int32?

        # The name that you want to give the endpoint settings.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A value that marks this endpoint setting as sensitive.

        @[JSON::Field(key: "Sensitive")]
        getter sensitive : Bool?

        # The type of endpoint. Valid values are source and target .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The unit of measure for this endpoint setting.

        @[JSON::Field(key: "Units")]
        getter units : String?

        def initialize(
          @applicability : String? = nil,
          @default_value : String? = nil,
          @enum_values : Array(String)? = nil,
          @int_value_max : Int32? = nil,
          @int_value_min : Int32? = nil,
          @name : String? = nil,
          @sensitive : Bool? = nil,
          @type : String? = nil,
          @units : String? = nil
        )
        end
      end

      # Provides information about a replication instance version.

      struct EngineVersion
        include JSON::Serializable

        # The date when the replication instance will be automatically upgraded. This setting only applies if
        # the auto-minor-version setting is enabled.

        @[JSON::Field(key: "AutoUpgradeDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter auto_upgrade_date : Time?

        # The list of valid replication instance versions that you can upgrade to.

        @[JSON::Field(key: "AvailableUpgrades")]
        getter available_upgrades : Array(String)?

        # The date when the replication instance version will be deprecated and can no longer be requested.

        @[JSON::Field(key: "DeprecationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deprecation_date : Time?

        # The date when the replication instance will have a version upgrade forced.

        @[JSON::Field(key: "ForceUpgradeDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter force_upgrade_date : Time?

        # The date when the replication instance version became publicly available.

        @[JSON::Field(key: "LaunchDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter launch_date : Time?

        # The lifecycle status of the replication instance version. Valid values are DEPRECATED ,
        # DEFAULT_VERSION , and ACTIVE .

        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The release status of the replication instance version.

        @[JSON::Field(key: "ReleaseStatus")]
        getter release_status : String?

        # The version number of the replication instance.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @auto_upgrade_date : Time? = nil,
          @available_upgrades : Array(String)? = nil,
          @deprecation_date : Time? = nil,
          @force_upgrade_date : Time? = nil,
          @launch_date : Time? = nil,
          @lifecycle : String? = nil,
          @release_status : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Provides error information about a project.

      struct ErrorDetails
        include JSON::Serializable

        # Error information about a project.

        @[JSON::Field(key: "defaultErrorDetails")]
        getter default_error_details : Types::DefaultErrorDetails?

        def initialize(
          @default_error_details : Types::DefaultErrorDetails? = nil
        )
        end
      end

      # Describes an identifiable significant activity that affects a replication instance or task. This
      # object can provide the message, the available event categories, the date and source of the event,
      # and the DMS resource type.

      struct Event
        include JSON::Serializable

        # The date of the event.

        @[JSON::Field(key: "Date", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date : Time?

        # The event categories available for the specified source type.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The event message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The identifier of an event source.

        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        # The type of DMS resource that generates events. Valid values: replication-instance | endpoint |
        # replication-task

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @date : Time? = nil,
          @event_categories : Array(String)? = nil,
          @message : String? = nil,
          @source_identifier : String? = nil,
          @source_type : String? = nil
        )
        end
      end

      # Lists categories of events subscribed to, and generated by, the applicable DMS resource type. This
      # data type appears in response to the DescribeEventCategories action.

      struct EventCategoryGroup
        include JSON::Serializable

        # A list of event categories from a source type that you've chosen.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The type of DMS resource that generates events. Valid values: replication-instance |
        # replication-server | security-group | replication-task

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @event_categories : Array(String)? = nil,
          @source_type : String? = nil
        )
        end
      end

      # Describes an event notification subscription created by the CreateEventSubscription operation.

      struct EventSubscription
        include JSON::Serializable

        # The DMS event notification subscription Id.

        @[JSON::Field(key: "CustSubscriptionId")]
        getter cust_subscription_id : String?

        # The Amazon Web Services customer account associated with the DMS event notification subscription.

        @[JSON::Field(key: "CustomerAwsId")]
        getter customer_aws_id : String?

        # Boolean value that indicates if the event subscription is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A lists of event categories.

        @[JSON::Field(key: "EventCategoriesList")]
        getter event_categories_list : Array(String)?

        # The topic ARN of the DMS event notification subscription.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # A list of source Ids for the event subscription.

        @[JSON::Field(key: "SourceIdsList")]
        getter source_ids_list : Array(String)?

        # The type of DMS resource that generates events. Valid values: replication-instance |
        # replication-server | security-group | replication-task

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The status of the DMS event notification subscription. Constraints: Can be one of the following:
        # creating | modifying | deleting | active | no-permission | topic-not-exist The status
        # "no-permission" indicates that DMS no longer has permission to post to the SNS topic. The status
        # "topic-not-exist" indicates that the topic was deleted after the subscription was created.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time the DMS event notification subscription was created.

        @[JSON::Field(key: "SubscriptionCreationTime")]
        getter subscription_creation_time : String?

        def initialize(
          @cust_subscription_id : String? = nil,
          @customer_aws_id : String? = nil,
          @enabled : Bool? = nil,
          @event_categories_list : Array(String)? = nil,
          @sns_topic_arn : String? = nil,
          @source_ids_list : Array(String)? = nil,
          @source_type : String? = nil,
          @status : String? = nil,
          @subscription_creation_time : String? = nil
        )
        end
      end


      struct ExportMetadataModelAssessmentMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # A value that specifies the database objects to assess.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        # The file format of the assessment file.

        @[JSON::Field(key: "AssessmentReportTypes")]
        getter assessment_report_types : Array(String)?

        # The name of the assessment file to create in your Amazon S3 bucket.

        @[JSON::Field(key: "FileName")]
        getter file_name : String?

        def initialize(
          @migration_project_identifier : String,
          @selection_rules : String,
          @assessment_report_types : Array(String)? = nil,
          @file_name : String? = nil
        )
        end
      end


      struct ExportMetadataModelAssessmentResponse
        include JSON::Serializable

        # The Amazon S3 details for an assessment exported in CSV format.

        @[JSON::Field(key: "CsvReport")]
        getter csv_report : Types::ExportMetadataModelAssessmentResultEntry?

        # The Amazon S3 details for an assessment exported in PDF format.

        @[JSON::Field(key: "PdfReport")]
        getter pdf_report : Types::ExportMetadataModelAssessmentResultEntry?

        def initialize(
          @csv_report : Types::ExportMetadataModelAssessmentResultEntry? = nil,
          @pdf_report : Types::ExportMetadataModelAssessmentResultEntry? = nil
        )
        end
      end

      # Provides information about an exported metadata model assessment.

      struct ExportMetadataModelAssessmentResultEntry
        include JSON::Serializable

        # The URL for the object containing the exported metadata model assessment.

        @[JSON::Field(key: "ObjectURL")]
        getter object_url : String?

        # The object key for the object containing the exported metadata model assessment.

        @[JSON::Field(key: "S3ObjectKey")]
        getter s3_object_key : String?

        def initialize(
          @object_url : String? = nil,
          @s3_object_key : String? = nil
        )
        end
      end

      # Provides information about a metadata model assessment exported to SQL.

      struct ExportSqlDetails
        include JSON::Serializable

        # The URL for the object containing the exported metadata model assessment.

        @[JSON::Field(key: "ObjectURL")]
        getter object_url : String?

        # The Amazon S3 object key for the object containing the exported metadata model assessment.

        @[JSON::Field(key: "S3ObjectKey")]
        getter s3_object_key : String?

        def initialize(
          @object_url : String? = nil,
          @s3_object_key : String? = nil
        )
        end
      end

      # A dependency threw an exception.

      struct FailedDependencyFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Identifies the name and value of a filter object. This filter is used to limit the number and type
      # of DMS objects that are returned for a particular Describe* call or similar operation. Filters are
      # used as an optional parameter for certain API operations.

      struct Filter
        include JSON::Serializable

        # The name of the filter as specified for a Describe* or similar operation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The filter value, which can specify one or more values used to narrow the returned results.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Describes a large-scale assessment (LSA) analysis run by a Fleet Advisor collector.

      struct FleetAdvisorLsaAnalysisResponse
        include JSON::Serializable

        # The ID of an LSA analysis run by a Fleet Advisor collector.

        @[JSON::Field(key: "LsaAnalysisId")]
        getter lsa_analysis_id : String?

        # The status of an LSA analysis run by a Fleet Advisor collector.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @lsa_analysis_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes a schema object in a Fleet Advisor collector inventory.

      struct FleetAdvisorSchemaObjectResponse
        include JSON::Serializable

        # The number of lines of code in a schema object in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "CodeLineCount")]
        getter code_line_count : Int64?

        # The size level of the code in a schema object in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "CodeSize")]
        getter code_size : Int64?

        # The number of objects in a schema object in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "NumberOfObjects")]
        getter number_of_objects : Int64?

        # The type of the schema object, as reported by the database engine. Examples include the following:
        # function trigger SYSTEM_TABLE QUEUE

        @[JSON::Field(key: "ObjectType")]
        getter object_type : String?

        # The ID of a schema object in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "SchemaId")]
        getter schema_id : String?

        def initialize(
          @code_line_count : Int64? = nil,
          @code_size : Int64? = nil,
          @number_of_objects : Int64? = nil,
          @object_type : String? = nil,
          @schema_id : String? = nil
        )
        end
      end

      # Settings in JSON format for the source GCP MySQL endpoint.

      struct GcpMySQLSettings
        include JSON::Serializable

        # Specifies a script to run immediately after DMS connects to the endpoint. The migration task
        # continues running regardless if the SQL statement succeeds or fails. For this parameter, provide the
        # code of the script itself, not the name of a file containing the script.

        @[JSON::Field(key: "AfterConnectScript")]
        getter after_connect_script : String?

        # Cleans and recreates table metadata information on the replication instance when a mismatch occurs.
        # For example, in a situation where running an alter DDL on the table could result in different
        # information about the table cached in the replication instance.

        @[JSON::Field(key: "CleanSourceMetadataOnMismatch")]
        getter clean_source_metadata_on_mismatch : Bool?

        # Database name for the endpoint. For a MySQL source or target endpoint, don't explicitly specify the
        # database using the DatabaseName request parameter on either the CreateEndpoint or ModifyEndpoint API
        # call. Specifying DatabaseName when you create or modify a MySQL endpoint replicates all the task
        # tables to this single database. For MySQL endpoints, you specify the database only when you specify
        # the schema in the table-mapping rules of the DMS task.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Specifies how often to check the binary log for new changes/events when the database is idle. The
        # default is five seconds. Example: eventsPollInterval=5; In the example, DMS checks for changes in
        # the binary logs every five seconds.

        @[JSON::Field(key: "EventsPollInterval")]
        getter events_poll_interval : Int32?

        # Specifies the maximum size (in KB) of any .csv file used to transfer data to a MySQL-compatible
        # database. Example: maxFileSize=512

        @[JSON::Field(key: "MaxFileSize")]
        getter max_file_size : Int32?

        # Improves performance when loading data into the MySQL-compatible target database. Specifies how many
        # threads to use to load the data into the MySQL-compatible target database. Setting a large number of
        # threads can have an adverse effect on database performance, because a separate connection is
        # required for each thread. The default is one. Example: parallelLoadThreads=1

        @[JSON::Field(key: "ParallelLoadThreads")]
        getter parallel_load_threads : Int32?

        # Endpoint connection password.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # Endpoint TCP port.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret. The role must allow the
        # iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets Manager
        # secret that allows access to the MySQL endpoint. You can specify one of two sets of values for these
        # permissions. You can specify the values for this setting and SecretsManagerSecretId . Or you can
        # specify clear-text values for UserName , Password , ServerName , and Port . You can't specify both.
        # For more information on creating this SecretsManagerSecret and the SecretsManagerAccessRoleArn and
        # SecretsManagerSecretId required to access it, see Using secrets to access Database Migration Service
        # resources in the Database Migration Service User Guide.

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the MySQL
        # endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # The MySQL host name.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # Specifies the time zone for the source MySQL database. Example: serverTimezone=US/Pacific; Note: Do
        # not enclose time zones in single quotes.

        @[JSON::Field(key: "ServerTimezone")]
        getter server_timezone : String?

        # Specifies where to migrate source tables on the target, either to a single database or multiple
        # databases. Example: targetDbType=MULTIPLE_DATABASES

        @[JSON::Field(key: "TargetDbType")]
        getter target_db_type : String?

        # Endpoint connection user name.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @after_connect_script : String? = nil,
          @clean_source_metadata_on_mismatch : Bool? = nil,
          @database_name : String? = nil,
          @events_poll_interval : Int32? = nil,
          @max_file_size : Int32? = nil,
          @parallel_load_threads : Int32? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @server_name : String? = nil,
          @server_timezone : String? = nil,
          @target_db_type : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct GetTargetSelectionRulesMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # The JSON string representing the source selection rules for conversion. Selection rules must contain
        # only supported metadata model types. For more information, see Selection Rules in the DMS User
        # Guide.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        def initialize(
          @migration_project_identifier : String,
          @selection_rules : String
        )
        end
      end


      struct GetTargetSelectionRulesResponse
        include JSON::Serializable

        # The JSON string representing the counterpart selection rules in the target.

        @[JSON::Field(key: "TargetSelectionRules")]
        getter target_selection_rules : String?

        def initialize(
          @target_selection_rules : String? = nil
        )
        end
      end

      # Provides information that defines an IBM Db2 LUW endpoint.

      struct IBMDb2Settings
        include JSON::Serializable

        # For ongoing replication (CDC), use CurrentLSN to specify a log sequence number (LSN) where you want
        # the replication to start.

        @[JSON::Field(key: "CurrentLsn")]
        getter current_lsn : String?

        # Database name for the endpoint.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # If true, DMS saves any .csv files to the Db2 LUW target that were used to replicate data. DMS uses
        # these files for analysis and troubleshooting. The default value is false.

        @[JSON::Field(key: "KeepCsvFiles")]
        getter keep_csv_files : Bool?

        # The amount of time (in milliseconds) before DMS times out operations performed by DMS on the Db2
        # target. The default value is 1200 (20 minutes).

        @[JSON::Field(key: "LoadTimeout")]
        getter load_timeout : Int32?

        # Specifies the maximum size (in KB) of .csv files used to transfer data to Db2 LUW.

        @[JSON::Field(key: "MaxFileSize")]
        getter max_file_size : Int32?

        # Maximum number of bytes per read, as a NUMBER value. The default is 64 KB.

        @[JSON::Field(key: "MaxKBytesPerRead")]
        getter max_k_bytes_per_read : Int32?

        # Endpoint connection password.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # Endpoint TCP port. The default value is 50000.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret . The role must allow
        # the iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets
        # Manager secret that allows access to the Db2 LUW endpoint. You can specify one of two sets of values
        # for these permissions. You can specify the values for this setting and SecretsManagerSecretId . Or
        # you can specify clear-text values for UserName , Password , ServerName , and Port . You can't
        # specify both. For more information on creating this SecretsManagerSecret and the
        # SecretsManagerAccessRoleArn and SecretsManagerSecretId required to access it, see Using secrets to
        # access Database Migration Service resources in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the Db2 LUW
        # endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # Fully qualified domain name of the endpoint.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # Enables ongoing replication (CDC) as a BOOLEAN value. The default is true.

        @[JSON::Field(key: "SetDataCaptureChanges")]
        getter set_data_capture_changes : Bool?

        # Endpoint connection user name.

        @[JSON::Field(key: "Username")]
        getter username : String?

        # The size (in KB) of the in-memory file write buffer used when generating .csv files on the local
        # disk on the DMS replication instance. The default value is 1024 (1 MB).

        @[JSON::Field(key: "WriteBufferSize")]
        getter write_buffer_size : Int32?

        def initialize(
          @current_lsn : String? = nil,
          @database_name : String? = nil,
          @keep_csv_files : Bool? = nil,
          @load_timeout : Int32? = nil,
          @max_file_size : Int32? = nil,
          @max_k_bytes_per_read : Int32? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @server_name : String? = nil,
          @set_data_capture_changes : Bool? = nil,
          @username : String? = nil,
          @write_buffer_size : Int32? = nil
        )
        end
      end

      # Provides information about an IBM DB2 LUW data provider.

      struct IbmDb2LuwDataProviderSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The database name on the DB2 LUW data provider.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The port value for the DB2 LUW data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The ARN for the role the application uses to access its Amazon S3 bucket.

        @[JSON::Field(key: "S3AccessRoleArn")]
        getter s3_access_role_arn : String?

        # The path for the Amazon S3 bucket that the application uses for accessing the user-defined schema.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The name of the DB2 LUW server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the DB2 LUW data provider. The default value is none . Valid Values:
        # none and verify-ca .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @port : Int32? = nil,
          @s3_access_role_arn : String? = nil,
          @s3_path : String? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end

      # Provides information about an IBM DB2 for z/OS data provider.

      struct IbmDb2zOsDataProviderSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The database name on the DB2 for z/OS data provider.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The port value for the DB2 for z/OS data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The ARN for the role the application uses to access its Amazon S3 bucket.

        @[JSON::Field(key: "S3AccessRoleArn")]
        getter s3_access_role_arn : String?

        # The path for the Amazon S3 bucket that the application uses for accessing the user-defined schema.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The name of the DB2 for z/OS server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the DB2 for z/OS data provider. The default value is none . Valid
        # Values: none and verify-ca .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @port : Int32? = nil,
          @s3_access_role_arn : String? = nil,
          @s3_path : String? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end


      struct ImportCertificateMessage
        include JSON::Serializable

        # A customer-assigned name for the certificate. Identifiers must begin with a letter and must contain
        # only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive
        # hyphens.

        @[JSON::Field(key: "CertificateIdentifier")]
        getter certificate_identifier : String

        # The contents of a .pem file, which contains an X.509 certificate.

        @[JSON::Field(key: "CertificatePem")]
        getter certificate_pem : String?

        # The location of an imported Oracle Wallet certificate for use with SSL. Provide the name of a .sso
        # file using the fileb:// prefix. You can't provide the certificate inline. Example:
        # filebase64("${path.root}/rds-ca-2019-root.sso")

        @[JSON::Field(key: "CertificateWallet")]
        getter certificate_wallet : Bytes?

        # An KMS key identifier that is used to encrypt the certificate. If you don't specify a value for the
        # KmsKeyId parameter, then DMS uses your default encryption key. KMS creates the default encryption
        # key for your Amazon Web Services account. Your Amazon Web Services account has a different default
        # encryption key for each Amazon Web Services Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The tags associated with the certificate.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @certificate_identifier : String,
          @certificate_pem : String? = nil,
          @certificate_wallet : Bytes? = nil,
          @kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ImportCertificateResponse
        include JSON::Serializable

        # The certificate to be uploaded.

        @[JSON::Field(key: "Certificate")]
        getter certificate : Types::Certificate?

        def initialize(
          @certificate : Types::Certificate? = nil
        )
        end
      end

      # Provides information that defines an instance profile.

      struct InstanceProfile
        include JSON::Serializable

        # The Availability Zone where the instance profile runs.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # A description of the instance profile. Descriptions can have up to 31 characters. A description can
        # contain only ASCII letters, digits, and hyphens ('-'). Also, it can't end with a hyphen or contain
        # two consecutive hyphens, and can only begin with a letter.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) string that uniquely identifies the instance profile.

        @[JSON::Field(key: "InstanceProfileArn")]
        getter instance_profile_arn : String?

        # The time the instance profile was created.

        @[JSON::Field(key: "InstanceProfileCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter instance_profile_creation_time : Time?

        # The user-friendly name for the instance profile.

        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String?

        # The Amazon Resource Name (ARN) of the KMS key that is used to encrypt the connection parameters for
        # the instance profile. If you don't specify a value for the KmsKeyArn parameter, then DMS uses an
        # Amazon Web Services owned encryption key to encrypt your resources.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # Specifies the network type for the instance profile. A value of IPV4 represents an instance profile
        # with IPv4 network type and only supports IPv4 addressing. A value of IPV6 represents an instance
        # profile with IPv6 network type and only supports IPv6 addressing. A value of DUAL represents an
        # instance profile with dual network type that supports IPv4 and IPv6 addressing.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # Specifies the accessibility options for the instance profile. A value of true represents an instance
        # profile with a public IP address. A value of false represents an instance profile with a private IP
        # address. The default value is true .

        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # The identifier of the subnet group that is associated with the instance profile.

        @[JSON::Field(key: "SubnetGroupIdentifier")]
        getter subnet_group_identifier : String?

        # The VPC security groups that are used with the instance profile. The VPC security group must work
        # with the VPC containing the instance profile.

        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(String)?

        def initialize(
          @availability_zone : String? = nil,
          @description : String? = nil,
          @instance_profile_arn : String? = nil,
          @instance_profile_creation_time : Time? = nil,
          @instance_profile_name : String? = nil,
          @kms_key_arn : String? = nil,
          @network_type : String? = nil,
          @publicly_accessible : Bool? = nil,
          @subnet_group_identifier : String? = nil,
          @vpc_security_groups : Array(String)? = nil
        )
        end
      end

      # There are not enough resources allocated to the database migration.

      struct InsufficientResourceCapacityFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The certificate was not valid.

      struct InvalidCertificateFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The action or operation requested isn't valid.

      struct InvalidOperationFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource is in a state that prevents it from being used for database migration.

      struct InvalidResourceStateFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The subnet provided isn't valid.

      struct InvalidSubnet
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a Fleet Advisor collector inventory.

      struct InventoryData
        include JSON::Serializable

        # The number of databases in the Fleet Advisor collector inventory.

        @[JSON::Field(key: "NumberOfDatabases")]
        getter number_of_databases : Int32?

        # The number of schemas in the Fleet Advisor collector inventory.

        @[JSON::Field(key: "NumberOfSchemas")]
        getter number_of_schemas : Int32?

        def initialize(
          @number_of_databases : Int32? = nil,
          @number_of_schemas : Int32? = nil
        )
        end
      end

      # The ciphertext references a key that doesn't exist or that the DMS account doesn't have access to.

      struct KMSAccessDeniedFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified KMS key isn't enabled.

      struct KMSDisabledFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An Key Management Service (KMS) error is preventing access to KMS.

      struct KMSFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The state of the specified KMS resource isn't valid for this request.

      struct KMSInvalidStateFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # DMS cannot access the KMS key.

      struct KMSKeyNotAccessibleFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified KMS entity or resource can't be found.

      struct KMSNotFoundFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This request triggered KMS request throttling.

      struct KMSThrottlingFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information that describes an Apache Kafka endpoint. This information includes the output
      # format of records applied to the endpoint and details of transaction and control table data
      # information.

      struct KafkaSettings
        include JSON::Serializable

        # A comma-separated list of one or more broker locations in your Kafka cluster that host your Kafka
        # instance. Specify each broker location in the form broker-hostname-or-ip : port . For example,
        # "ec2-12-345-678-901.compute-1.amazonaws.com:2345" . For more information and examples of specifying
        # a list of broker locations, see Using Apache Kafka as a target for Database Migration Service in the
        # Database Migration Service User Guide .

        @[JSON::Field(key: "Broker")]
        getter broker : String?

        # Shows detailed control information for table definition, column definition, and table and column
        # changes in the Kafka message output. The default is false .

        @[JSON::Field(key: "IncludeControlDetails")]
        getter include_control_details : Bool?

        # Include NULL and empty columns for records migrated to the endpoint. The default is false .

        @[JSON::Field(key: "IncludeNullAndEmpty")]
        getter include_null_and_empty : Bool?

        # Shows the partition value within the Kafka message output unless the partition type is
        # schema-table-type . The default is false .

        @[JSON::Field(key: "IncludePartitionValue")]
        getter include_partition_value : Bool?

        # Includes any data definition language (DDL) operations that change the table in the control data,
        # such as rename-table , drop-table , add-column , drop-column , and rename-column . The default is
        # false .

        @[JSON::Field(key: "IncludeTableAlterOperations")]
        getter include_table_alter_operations : Bool?

        # Provides detailed transaction information from the source database. This information includes a
        # commit timestamp, a log position, and values for transaction_id , previous transaction_id , and
        # transaction_record_id (the record offset within a transaction). The default is false .

        @[JSON::Field(key: "IncludeTransactionDetails")]
        getter include_transaction_details : Bool?

        # The output format for the records created on the endpoint. The message format is JSON (default) or
        # JSON_UNFORMATTED (a single line with no tab).

        @[JSON::Field(key: "MessageFormat")]
        getter message_format : String?

        # The maximum size in bytes for records created on the endpoint The default is 1,000,000.

        @[JSON::Field(key: "MessageMaxBytes")]
        getter message_max_bytes : Int32?

        # Set this optional parameter to true to avoid adding a '0x' prefix to raw data in hexadecimal format.
        # For example, by default, DMS adds a '0x' prefix to the LOB column type in hexadecimal format moving
        # from an Oracle source to a Kafka target. Use the NoHexPrefix endpoint setting to enable migration of
        # RAW data type columns without adding the '0x' prefix.

        @[JSON::Field(key: "NoHexPrefix")]
        getter no_hex_prefix : Bool?

        # Prefixes schema and table names to partition values, when the partition type is primary-key-type .
        # Doing this increases data distribution among Kafka partitions. For example, suppose that a SysBench
        # schema has thousands of tables and each table has only limited range for a primary key. In this
        # case, the same primary key is sent from thousands of tables to the same partition, which causes
        # throttling. The default is false .

        @[JSON::Field(key: "PartitionIncludeSchemaTable")]
        getter partition_include_schema_table : Bool?

        # For SASL/SSL authentication, DMS supports the SCRAM-SHA-512 mechanism by default. DMS versions 3.5.0
        # and later also support the PLAIN mechanism. To use the PLAIN mechanism, set this parameter to PLAIN.

        @[JSON::Field(key: "SaslMechanism")]
        getter sasl_mechanism : String?

        # The secure password you created when you first set up your MSK cluster to validate a client identity
        # and make an encrypted connection between server and client using SASL-SSL authentication.

        @[JSON::Field(key: "SaslPassword")]
        getter sasl_password : String?

        # The secure user name you created when you first set up your MSK cluster to validate a client
        # identity and make an encrypted connection between server and client using SASL-SSL authentication.

        @[JSON::Field(key: "SaslUsername")]
        getter sasl_username : String?

        # Set secure connection to a Kafka target endpoint using Transport Layer Security (TLS). Options
        # include ssl-encryption , ssl-authentication , and sasl-ssl . sasl-ssl requires SaslUsername and
        # SaslPassword .

        @[JSON::Field(key: "SecurityProtocol")]
        getter security_protocol : String?

        # The Amazon Resource Name (ARN) for the private certificate authority (CA) cert that DMS uses to
        # securely connect to your Kafka target endpoint.

        @[JSON::Field(key: "SslCaCertificateArn")]
        getter ssl_ca_certificate_arn : String?

        # The Amazon Resource Name (ARN) of the client certificate used to securely connect to a Kafka target
        # endpoint.

        @[JSON::Field(key: "SslClientCertificateArn")]
        getter ssl_client_certificate_arn : String?

        # The Amazon Resource Name (ARN) for the client private key used to securely connect to a Kafka target
        # endpoint.

        @[JSON::Field(key: "SslClientKeyArn")]
        getter ssl_client_key_arn : String?

        # The password for the client private key used to securely connect to a Kafka target endpoint.

        @[JSON::Field(key: "SslClientKeyPassword")]
        getter ssl_client_key_password : String?

        # Sets hostname verification for the certificate. This setting is supported in DMS version 3.5.1 and
        # later.

        @[JSON::Field(key: "SslEndpointIdentificationAlgorithm")]
        getter ssl_endpoint_identification_algorithm : String?

        # The topic to which you migrate the data. If you don't specify a topic, DMS specifies
        # "kafka-default-topic" as the migration topic.

        @[JSON::Field(key: "Topic")]
        getter topic : String?

        # Specifies using the large integer value with Kafka.

        @[JSON::Field(key: "UseLargeIntegerValue")]
        getter use_large_integer_value : Bool?

        def initialize(
          @broker : String? = nil,
          @include_control_details : Bool? = nil,
          @include_null_and_empty : Bool? = nil,
          @include_partition_value : Bool? = nil,
          @include_table_alter_operations : Bool? = nil,
          @include_transaction_details : Bool? = nil,
          @message_format : String? = nil,
          @message_max_bytes : Int32? = nil,
          @no_hex_prefix : Bool? = nil,
          @partition_include_schema_table : Bool? = nil,
          @sasl_mechanism : String? = nil,
          @sasl_password : String? = nil,
          @sasl_username : String? = nil,
          @security_protocol : String? = nil,
          @ssl_ca_certificate_arn : String? = nil,
          @ssl_client_certificate_arn : String? = nil,
          @ssl_client_key_arn : String? = nil,
          @ssl_client_key_password : String? = nil,
          @ssl_endpoint_identification_algorithm : String? = nil,
          @topic : String? = nil,
          @use_large_integer_value : Bool? = nil
        )
        end
      end

      # Specifies the settings required for kerberos authentication when creating the replication instance.

      struct KerberosAuthenticationSettings
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the IAM role that grants Amazon Web Services DMS access
        # to the secret containing key cache file for the kerberos authentication.

        @[JSON::Field(key: "KeyCacheSecretIamArn")]
        getter key_cache_secret_iam_arn : String?

        # Specifies the ID of the secret that stores the key cache file required for kerberos authentication.

        @[JSON::Field(key: "KeyCacheSecretId")]
        getter key_cache_secret_id : String?

        # Specifies the contents of krb5 configuration file required for kerberos authentication.

        @[JSON::Field(key: "Krb5FileContents")]
        getter krb5_file_contents : String?

        def initialize(
          @key_cache_secret_iam_arn : String? = nil,
          @key_cache_secret_id : String? = nil,
          @krb5_file_contents : String? = nil
        )
        end
      end

      # Provides information that describes an Amazon Kinesis Data Stream endpoint. This information
      # includes the output format of records applied to the endpoint and details of transaction and control
      # table data information.

      struct KinesisSettings
        include JSON::Serializable

        # Shows detailed control information for table definition, column definition, and table and column
        # changes in the Kinesis message output. The default is false .

        @[JSON::Field(key: "IncludeControlDetails")]
        getter include_control_details : Bool?

        # Include NULL and empty columns for records migrated to the endpoint. The default is false .

        @[JSON::Field(key: "IncludeNullAndEmpty")]
        getter include_null_and_empty : Bool?

        # Shows the partition value within the Kinesis message output, unless the partition type is
        # schema-table-type . The default is false .

        @[JSON::Field(key: "IncludePartitionValue")]
        getter include_partition_value : Bool?

        # Includes any data definition language (DDL) operations that change the table in the control data,
        # such as rename-table , drop-table , add-column , drop-column , and rename-column . The default is
        # false .

        @[JSON::Field(key: "IncludeTableAlterOperations")]
        getter include_table_alter_operations : Bool?

        # Provides detailed transaction information from the source database. This information includes a
        # commit timestamp, a log position, and values for transaction_id , previous transaction_id , and
        # transaction_record_id (the record offset within a transaction). The default is false .

        @[JSON::Field(key: "IncludeTransactionDetails")]
        getter include_transaction_details : Bool?

        # The output format for the records created on the endpoint. The message format is JSON (default) or
        # JSON_UNFORMATTED (a single line with no tab).

        @[JSON::Field(key: "MessageFormat")]
        getter message_format : String?

        # Set this optional parameter to true to avoid adding a '0x' prefix to raw data in hexadecimal format.
        # For example, by default, DMS adds a '0x' prefix to the LOB column type in hexadecimal format moving
        # from an Oracle source to an Amazon Kinesis target. Use the NoHexPrefix endpoint setting to enable
        # migration of RAW data type columns without adding the '0x' prefix.

        @[JSON::Field(key: "NoHexPrefix")]
        getter no_hex_prefix : Bool?

        # Prefixes schema and table names to partition values, when the partition type is primary-key-type .
        # Doing this increases data distribution among Kinesis shards. For example, suppose that a SysBench
        # schema has thousands of tables and each table has only limited range for a primary key. In this
        # case, the same primary key is sent from thousands of tables to the same shard, which causes
        # throttling. The default is false .

        @[JSON::Field(key: "PartitionIncludeSchemaTable")]
        getter partition_include_schema_table : Bool?

        # The Amazon Resource Name (ARN) for the IAM role that DMS uses to write to the Kinesis data stream.
        # The role must allow the iam:PassRole action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # The Amazon Resource Name (ARN) for the Amazon Kinesis Data Streams endpoint.

        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String?

        # Specifies using the large integer value with Kinesis.

        @[JSON::Field(key: "UseLargeIntegerValue")]
        getter use_large_integer_value : Bool?

        def initialize(
          @include_control_details : Bool? = nil,
          @include_null_and_empty : Bool? = nil,
          @include_partition_value : Bool? = nil,
          @include_table_alter_operations : Bool? = nil,
          @include_transaction_details : Bool? = nil,
          @message_format : String? = nil,
          @no_hex_prefix : Bool? = nil,
          @partition_include_schema_table : Bool? = nil,
          @service_access_role_arn : String? = nil,
          @stream_arn : String? = nil,
          @use_large_integer_value : Bool? = nil
        )
        end
      end

      # Provides information that defines a Lakehouse endpoint. This endpoint type is used for zero-ETL
      # integrations with Lakehouse data warehouses.

      struct LakehouseSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lakehouse resource that serves as the target for this
        # endpoint.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Provides information about the limitations of target Amazon Web Services engines. Your source
      # database might include features that the target Amazon Web Services engine doesn't support. Fleet
      # Advisor lists these features as limitations. You should consider these limitations during database
      # migration. For each limitation, Fleet Advisor recommends an action that you can take to address or
      # avoid this limitation.

      struct Limitation
        include JSON::Serializable

        # The identifier of the source database.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String?

        # A description of the limitation. Provides additional information about the limitation, and includes
        # recommended actions that you can take to address or avoid this limitation.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the target engine that Fleet Advisor should use in the target engine recommendation.
        # Valid values include "rds-aurora-mysql" , "rds-aurora-postgresql" , "rds-mysql" , "rds-oracle" ,
        # "rds-sql-server" , and "rds-postgresql" .

        @[JSON::Field(key: "EngineName")]
        getter engine_name : String?

        # The impact of the limitation. You can use this parameter to prioritize limitations that you want to
        # address. Valid values include "Blocker" , "High" , "Medium" , and "Low" .

        @[JSON::Field(key: "Impact")]
        getter impact : String?

        # The name of the limitation. Describes unsupported database features, migration action items, and
        # other limitations.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of the limitation, such as action required, upgrade required, and limited feature.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @database_id : String? = nil,
          @description : String? = nil,
          @engine_name : String? = nil,
          @impact : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListTagsForResourceMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the DMS resource to list tags for.
        # This returns a list of keys (names of tags) created for the resource and their associated tag
        # values.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # List of ARNs that identify multiple DMS resources that you want to list tags for. This returns a
        # list of keys (tag names) and their associated tag values. It also returns each tag's associated
        # ResourceArn value, which is the ARN of the resource for which each listed tag is created.

        @[JSON::Field(key: "ResourceArnList")]
        getter resource_arn_list : Array(String)?

        def initialize(
          @resource_arn : String? = nil,
          @resource_arn_list : Array(String)? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags for the resource.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # Provides information that defines a MariaDB data provider.

      struct MariaDbDataProviderSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The port value for the MariaDB data provider

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The ARN for the role the application uses to access its Amazon S3 bucket.

        @[JSON::Field(key: "S3AccessRoleArn")]
        getter s3_access_role_arn : String?

        # The path for the Amazon S3 bucket that the application uses for accessing the user-defined schema.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The name of the MariaDB server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the MariaDB data provider. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @certificate_arn : String? = nil,
          @port : Int32? = nil,
          @s3_access_role_arn : String? = nil,
          @s3_path : String? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end

      # The properties of metadata model in JSON format. This object is a Union. Only one member of this
      # object can be specified or returned.

      struct MetadataModelProperties
        include JSON::Serializable

        # The properties of the statement.

        @[JSON::Field(key: "StatementProperties")]
        getter statement_properties : Types::StatementProperties?

        def initialize(
          @statement_properties : Types::StatementProperties? = nil
        )
        end
      end

      # A reference to a metadata model, including its name and selection rules for location identification.

      struct MetadataModelReference
        include JSON::Serializable

        # The name of the metadata model.

        @[JSON::Field(key: "MetadataModelName")]
        getter metadata_model_name : String?

        # The JSON string representing metadata model location.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String?

        def initialize(
          @metadata_model_name : String? = nil,
          @selection_rules : String? = nil
        )
        end
      end

      # Provides information that defines a Microsoft SQL Server endpoint.

      struct MicrosoftSQLServerSettings
        include JSON::Serializable

        # Specifies the authentication method to be used with Microsoft SQL Server.

        @[JSON::Field(key: "AuthenticationMethod")]
        getter authentication_method : String?

        # The maximum size of the packets (in bytes) used to transfer data using BCP.

        @[JSON::Field(key: "BcpPacketSize")]
        getter bcp_packet_size : Int32?

        # Specifies a file group for the DMS internal tables. When the replication task starts, all the
        # internal DMS control tables (awsdms_ apply_exception, awsdms_apply, awsdms_changes) are created for
        # the specified file group.

        @[JSON::Field(key: "ControlTablesFileGroup")]
        getter control_tables_file_group : String?

        # Database name for the endpoint.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Forces LOB lookup on inline LOB.

        @[JSON::Field(key: "ForceLobLookup")]
        getter force_lob_lookup : Bool?

        # Endpoint connection password.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # Endpoint TCP port.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Cleans and recreates table metadata information on the replication instance when a mismatch occurs.
        # An example is a situation where running an alter DDL statement on a table might result in different
        # information about the table cached in the replication instance.

        @[JSON::Field(key: "QuerySingleAlwaysOnNode")]
        getter query_single_always_on_node : Bool?

        # When this attribute is set to Y , DMS only reads changes from transaction log backups and doesn't
        # read from the active transaction log file during ongoing replication. Setting this parameter to Y
        # enables you to control active transaction log file growth during full load and ongoing replication
        # tasks. However, it can add some source latency to ongoing replication.

        @[JSON::Field(key: "ReadBackupOnly")]
        getter read_backup_only : Bool?

        # Use this attribute to minimize the need to access the backup log and enable DMS to prevent
        # truncation using one of the following two methods. Start transactions in the database: This is the
        # default method. When this method is used, DMS prevents TLOG truncation by mimicking a transaction in
        # the database. As long as such a transaction is open, changes that appear after the transaction
        # started aren't truncated. If you need Microsoft Replication to be enabled in your database, then you
        # must choose this method. Exclusively use sp_repldone within a single task : When this method is
        # used, DMS reads the changes and then uses sp_repldone to mark the TLOG transactions as ready for
        # truncation. Although this method doesn't involve any transactional activities, it can only be used
        # when Microsoft Replication isn't running. Also, when using this method, only one DMS task can access
        # the database at any given time. Therefore, if you need to run parallel DMS tasks against the same
        # database, use the default method.

        @[JSON::Field(key: "SafeguardPolicy")]
        getter safeguard_policy : String?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret . The role must allow
        # the iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets
        # Manager secret that allows access to the SQL Server endpoint. You can specify one of two sets of
        # values for these permissions. You can specify the values for this setting and SecretsManagerSecretId
        # . Or you can specify clear-text values for UserName , Password , ServerName , and Port . You can't
        # specify both. For more information on creating this SecretsManagerSecret and the
        # SecretsManagerAccessRoleArn and SecretsManagerSecretId required to access it, see Using secrets to
        # access Database Migration Service resources in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the SQL Server
        # endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # Fully qualified domain name of the endpoint. For an Amazon RDS SQL Server instance, this is the
        # output of DescribeDBInstances , in the Endpoint .Address field.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # Indicates the mode used to fetch CDC data.

        @[JSON::Field(key: "TlogAccessMode")]
        getter tlog_access_mode : String?

        # Use the TrimSpaceInChar source endpoint setting to right-trim data on CHAR and NCHAR data types
        # during migration. Setting TrimSpaceInChar does not left-trim data. The default value is true .

        @[JSON::Field(key: "TrimSpaceInChar")]
        getter trim_space_in_char : Bool?

        # Use this to attribute to transfer data for full-load operations using BCP. When the target table
        # contains an identity column that does not exist in the source table, you must disable the use BCP
        # for loading table option.

        @[JSON::Field(key: "UseBcpFullLoad")]
        getter use_bcp_full_load : Bool?

        # When this attribute is set to Y , DMS processes third-party transaction log backups if they are
        # created in native format.

        @[JSON::Field(key: "UseThirdPartyBackupDevice")]
        getter use_third_party_backup_device : Bool?

        # Endpoint connection user name.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @authentication_method : String? = nil,
          @bcp_packet_size : Int32? = nil,
          @control_tables_file_group : String? = nil,
          @database_name : String? = nil,
          @force_lob_lookup : Bool? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @query_single_always_on_node : Bool? = nil,
          @read_backup_only : Bool? = nil,
          @safeguard_policy : String? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @server_name : String? = nil,
          @tlog_access_mode : String? = nil,
          @trim_space_in_char : Bool? = nil,
          @use_bcp_full_load : Bool? = nil,
          @use_third_party_backup_device : Bool? = nil,
          @username : String? = nil
        )
        end
      end

      # Provides information that defines a Microsoft SQL Server data provider.

      struct MicrosoftSqlServerDataProviderSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The database name on the Microsoft SQL Server data provider.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The port value for the Microsoft SQL Server data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The ARN for the role the application uses to access its Amazon S3 bucket.

        @[JSON::Field(key: "S3AccessRoleArn")]
        getter s3_access_role_arn : String?

        # The path for the Amazon S3 bucket that the application uses for accessing the user-defined schema.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The name of the Microsoft SQL Server server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the Microsoft SQL Server data provider. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @port : Int32? = nil,
          @s3_access_role_arn : String? = nil,
          @s3_path : String? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end

      # Provides information that defines a migration project.

      struct MigrationProject
        include JSON::Serializable

        # A user-friendly description of the migration project.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the instance profile for your migration project.

        @[JSON::Field(key: "InstanceProfileArn")]
        getter instance_profile_arn : String?

        # The name of the associated instance profile.

        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String?

        # The ARN string that uniquely identifies the migration project.

        @[JSON::Field(key: "MigrationProjectArn")]
        getter migration_project_arn : String?

        # The time when the migration project was created.

        @[JSON::Field(key: "MigrationProjectCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter migration_project_creation_time : Time?

        # The name of the migration project.

        @[JSON::Field(key: "MigrationProjectName")]
        getter migration_project_name : String?

        # The schema conversion application attributes, including the Amazon S3 bucket name and Amazon S3 role
        # ARN.

        @[JSON::Field(key: "SchemaConversionApplicationAttributes")]
        getter schema_conversion_application_attributes : Types::SCApplicationAttributes?

        # Information about the source data provider, including the name or ARN, and Secrets Manager
        # parameters.

        @[JSON::Field(key: "SourceDataProviderDescriptors")]
        getter source_data_provider_descriptors : Array(Types::DataProviderDescriptor)?

        # Information about the target data provider, including the name or ARN, and Secrets Manager
        # parameters.

        @[JSON::Field(key: "TargetDataProviderDescriptors")]
        getter target_data_provider_descriptors : Array(Types::DataProviderDescriptor)?

        # The settings in JSON format for migration rules. Migration rules make it possible for you to change
        # the object names according to the rules that you specify. For example, you can change an object name
        # to lowercase or uppercase, add or remove a prefix or suffix, or rename objects.

        @[JSON::Field(key: "TransformationRules")]
        getter transformation_rules : String?

        def initialize(
          @description : String? = nil,
          @instance_profile_arn : String? = nil,
          @instance_profile_name : String? = nil,
          @migration_project_arn : String? = nil,
          @migration_project_creation_time : Time? = nil,
          @migration_project_name : String? = nil,
          @schema_conversion_application_attributes : Types::SCApplicationAttributes? = nil,
          @source_data_provider_descriptors : Array(Types::DataProviderDescriptor)? = nil,
          @target_data_provider_descriptors : Array(Types::DataProviderDescriptor)? = nil,
          @transformation_rules : String? = nil
        )
        end
      end


      struct ModifyConversionConfigurationMessage
        include JSON::Serializable

        # The new conversion configuration.

        @[JSON::Field(key: "ConversionConfiguration")]
        getter conversion_configuration : String

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        def initialize(
          @conversion_configuration : String,
          @migration_project_identifier : String
        )
        end
      end


      struct ModifyConversionConfigurationResponse
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the modified configuration.

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String?

        def initialize(
          @migration_project_identifier : String? = nil
        )
        end
      end


      struct ModifyDataMigrationMessage
        include JSON::Serializable

        # The identifier (name or ARN) of the data migration to modify.

        @[JSON::Field(key: "DataMigrationIdentifier")]
        getter data_migration_identifier : String

        # The new name for the data migration.

        @[JSON::Field(key: "DataMigrationName")]
        getter data_migration_name : String?

        # The new migration type for the data migration.

        @[JSON::Field(key: "DataMigrationType")]
        getter data_migration_type : String?

        # Whether to enable Cloudwatch logs for the data migration.

        @[JSON::Field(key: "EnableCloudwatchLogs")]
        getter enable_cloudwatch_logs : Bool?

        # The number of parallel jobs that trigger parallel threads to unload the tables from the source, and
        # then load them to the target.

        @[JSON::Field(key: "NumberOfJobs")]
        getter number_of_jobs : Int32?

        # A JSON-formatted string that defines what objects to include and exclude from the migration.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String?

        # The new service access role ARN for the data migration.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # The new information about the source data provider for the data migration.

        @[JSON::Field(key: "SourceDataSettings")]
        getter source_data_settings : Array(Types::SourceDataSetting)?

        # The new information about the target data provider for the data migration.

        @[JSON::Field(key: "TargetDataSettings")]
        getter target_data_settings : Array(Types::TargetDataSetting)?

        def initialize(
          @data_migration_identifier : String,
          @data_migration_name : String? = nil,
          @data_migration_type : String? = nil,
          @enable_cloudwatch_logs : Bool? = nil,
          @number_of_jobs : Int32? = nil,
          @selection_rules : String? = nil,
          @service_access_role_arn : String? = nil,
          @source_data_settings : Array(Types::SourceDataSetting)? = nil,
          @target_data_settings : Array(Types::TargetDataSetting)? = nil
        )
        end
      end


      struct ModifyDataMigrationResponse
        include JSON::Serializable

        # Information about the modified data migration.

        @[JSON::Field(key: "DataMigration")]
        getter data_migration : Types::DataMigration?

        def initialize(
          @data_migration : Types::DataMigration? = nil
        )
        end
      end


      struct ModifyDataProviderMessage
        include JSON::Serializable

        # The identifier of the data provider. Identifiers must begin with a letter and must contain only
        # ASCII letters, digits, and hyphens. They can't end with a hyphen, or contain two consecutive
        # hyphens.

        @[JSON::Field(key: "DataProviderIdentifier")]
        getter data_provider_identifier : String

        # The name of the data provider.

        @[JSON::Field(key: "DataProviderName")]
        getter data_provider_name : String?

        # A user-friendly description of the data provider.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The type of database engine for the data provider. Valid values include "aurora" ,
        # "aurora-postgresql" , "mysql" , "oracle" , "postgres" , "sqlserver" , redshift , mariadb , mongodb ,
        # db2 , db2-zos , docdb , and sybase . A value of "aurora" represents Amazon Aurora MySQL-Compatible
        # Edition.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # If this attribute is Y, the current call to ModifyDataProvider replaces all existing data provider
        # settings with the exact settings that you specify in this call. If this attribute is N, the current
        # call to ModifyDataProvider does two things: It replaces any data provider settings that already
        # exist with new values, for settings with the same names. It creates new data provider settings that
        # you specify in the call, for settings with different names.

        @[JSON::Field(key: "ExactSettings")]
        getter exact_settings : Bool?

        # The settings in JSON format for a data provider.

        @[JSON::Field(key: "Settings")]
        getter settings : Types::DataProviderSettings?

        # Indicates whether the data provider is virtual.

        @[JSON::Field(key: "Virtual")]
        getter virtual : Bool?

        def initialize(
          @data_provider_identifier : String,
          @data_provider_name : String? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @exact_settings : Bool? = nil,
          @settings : Types::DataProviderSettings? = nil,
          @virtual : Bool? = nil
        )
        end
      end


      struct ModifyDataProviderResponse
        include JSON::Serializable

        # The data provider that was modified.

        @[JSON::Field(key: "DataProvider")]
        getter data_provider : Types::DataProvider?

        def initialize(
          @data_provider : Types::DataProvider? = nil
        )
        end
      end


      struct ModifyEndpointMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The name of the endpoint database. For a MySQL source or target endpoint, do not specify
        # DatabaseName.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The settings in JSON format for the DMS transfer type of source endpoint. Attributes include the
        # following: serviceAccessRoleArn - The Amazon Resource Name (ARN) used by the service access IAM
        # role. The role must allow the iam:PassRole action. BucketName - The name of the S3 bucket to use.
        # Shorthand syntax for these settings is as follows: ServiceAccessRoleArn=string ,BucketName=string
        # JSON syntax for these settings is as follows: { "ServiceAccessRoleArn": "string", "BucketName":
        # "string"}

        @[JSON::Field(key: "DmsTransferSettings")]
        getter dms_transfer_settings : Types::DmsTransferSettings?

        # Settings in JSON format for the source DocumentDB endpoint. For more information about the available
        # settings, see the configuration properties section in Using DocumentDB as a Target for Database
        # Migration Service in the Database Migration Service User Guide.

        @[JSON::Field(key: "DocDbSettings")]
        getter doc_db_settings : Types::DocDbSettings?

        # Settings in JSON format for the target Amazon DynamoDB endpoint. For information about other
        # available settings, see Using Object Mapping to Migrate Data to DynamoDB in the Database Migration
        # Service User Guide.

        @[JSON::Field(key: "DynamoDbSettings")]
        getter dynamo_db_settings : Types::DynamoDbSettings?

        # Settings in JSON format for the target OpenSearch endpoint. For more information about the available
        # settings, see Extra Connection Attributes When Using OpenSearch as a Target for DMS in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "ElasticsearchSettings")]
        getter elasticsearch_settings : Types::ElasticsearchSettings?

        # The database endpoint identifier. Identifiers must begin with a letter and must contain only ASCII
        # letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.

        @[JSON::Field(key: "EndpointIdentifier")]
        getter endpoint_identifier : String?

        # The type of endpoint. Valid values are source and target .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The database engine name. Valid values, depending on the EndpointType, include "mysql" , "oracle" ,
        # "postgres" , "mariadb" , "aurora" , "aurora-postgresql" , "redshift" , "s3" , "db2" , "db2-zos" ,
        # "azuredb" , "sybase" , "dynamodb" , "mongodb" , "kinesis" , "kafka" , "elasticsearch" , "documentdb"
        # , "sqlserver" , "neptune" , and "babelfish" .

        @[JSON::Field(key: "EngineName")]
        getter engine_name : String?

        # If this attribute is Y, the current call to ModifyEndpoint replaces all existing endpoint settings
        # with the exact settings that you specify in this call. If this attribute is N, the current call to
        # ModifyEndpoint does two things: It replaces any endpoint settings that already exist with new
        # values, for settings with the same names. It creates new endpoint settings that you specify in the
        # call, for settings with different names. For example, if you call create-endpoint ...
        # --endpoint-settings '{"a":1}' ... , the endpoint has the following endpoint settings: '{"a":1}' . If
        # you then call modify-endpoint ... --endpoint-settings '{"b":2}' ... for the same endpoint, the
        # endpoint has the following settings: '{"a":1,"b":2}' . However, suppose that you follow this with a
        # call to modify-endpoint ... --endpoint-settings '{"b":2}' --exact-settings ... for that same
        # endpoint again. Then the endpoint has the following settings: '{"b":2}' . All existing settings are
        # replaced with the exact settings that you specify.

        @[JSON::Field(key: "ExactSettings")]
        getter exact_settings : Bool?

        # The external table definition.

        @[JSON::Field(key: "ExternalTableDefinition")]
        getter external_table_definition : String?

        # Additional attributes associated with the connection. To reset this parameter, pass the empty string
        # ("") as an argument.

        @[JSON::Field(key: "ExtraConnectionAttributes")]
        getter extra_connection_attributes : String?

        # Settings in JSON format for the source GCP MySQL endpoint.

        @[JSON::Field(key: "GcpMySQLSettings")]
        getter gcp_my_sql_settings : Types::GcpMySQLSettings?

        # Settings in JSON format for the source IBM Db2 LUW endpoint. For information about other available
        # settings, see Extra connection attributes when using Db2 LUW as a source for DMS in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "IBMDb2Settings")]
        getter ibm_db2_settings : Types::IBMDb2Settings?

        # Settings in JSON format for the target Apache Kafka endpoint. For more information about the
        # available settings, see Using object mapping to migrate data to a Kafka topic in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "KafkaSettings")]
        getter kafka_settings : Types::KafkaSettings?

        # Settings in JSON format for the target endpoint for Amazon Kinesis Data Streams. For more
        # information about the available settings, see Using object mapping to migrate data to a Kinesis data
        # stream in the Database Migration Service User Guide.

        @[JSON::Field(key: "KinesisSettings")]
        getter kinesis_settings : Types::KinesisSettings?

        # Settings in JSON format for the source and target Microsoft SQL Server endpoint. For information
        # about other available settings, see Extra connection attributes when using SQL Server as a source
        # for DMS and Extra connection attributes when using SQL Server as a target for DMS in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "MicrosoftSQLServerSettings")]
        getter microsoft_sql_server_settings : Types::MicrosoftSQLServerSettings?

        # Settings in JSON format for the source MongoDB endpoint. For more information about the available
        # settings, see the configuration properties section in Endpoint configuration settings when using
        # MongoDB as a source for Database Migration Service in the Database Migration Service User Guide.

        @[JSON::Field(key: "MongoDbSettings")]
        getter mongo_db_settings : Types::MongoDbSettings?

        # Settings in JSON format for the source and target MySQL endpoint. For information about other
        # available settings, see Extra connection attributes when using MySQL as a source for DMS and Extra
        # connection attributes when using a MySQL-compatible database as a target for DMS in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "MySQLSettings")]
        getter my_sql_settings : Types::MySQLSettings?

        # Settings in JSON format for the target Amazon Neptune endpoint. For more information about the
        # available settings, see Specifying graph-mapping rules using Gremlin and R2RML for Amazon Neptune as
        # a target in the Database Migration Service User Guide.

        @[JSON::Field(key: "NeptuneSettings")]
        getter neptune_settings : Types::NeptuneSettings?

        # Settings in JSON format for the source and target Oracle endpoint. For information about other
        # available settings, see Extra connection attributes when using Oracle as a source for DMS and Extra
        # connection attributes when using Oracle as a target for DMS in the Database Migration Service User
        # Guide.

        @[JSON::Field(key: "OracleSettings")]
        getter oracle_settings : Types::OracleSettings?

        # The password to be used to login to the endpoint database.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The port used by the endpoint database.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Settings in JSON format for the source and target PostgreSQL endpoint. For information about other
        # available settings, see Extra connection attributes when using PostgreSQL as a source for DMS and
        # Extra connection attributes when using PostgreSQL as a target for DMS in the Database Migration
        # Service User Guide.

        @[JSON::Field(key: "PostgreSQLSettings")]
        getter postgre_sql_settings : Types::PostgreSQLSettings?

        # Settings in JSON format for the Redis target endpoint.

        @[JSON::Field(key: "RedisSettings")]
        getter redis_settings : Types::RedisSettings?


        @[JSON::Field(key: "RedshiftSettings")]
        getter redshift_settings : Types::RedshiftSettings?

        # Settings in JSON format for the target Amazon S3 endpoint. For more information about the available
        # settings, see Extra Connection Attributes When Using Amazon S3 as a Target for DMS in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "S3Settings")]
        getter s3_settings : Types::S3Settings?

        # The name of the server where the endpoint database resides.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The Amazon Resource Name (ARN) for the IAM role you want to use to modify the endpoint. The role
        # must allow the iam:PassRole action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # The SSL mode used to connect to the endpoint. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        # Settings in JSON format for the source and target SAP ASE endpoint. For information about other
        # available settings, see Extra connection attributes when using SAP ASE as a source for DMS and Extra
        # connection attributes when using SAP ASE as a target for DMS in the Database Migration Service User
        # Guide.

        @[JSON::Field(key: "SybaseSettings")]
        getter sybase_settings : Types::SybaseSettings?

        # Settings in JSON format for the target Amazon Timestream endpoint.

        @[JSON::Field(key: "TimestreamSettings")]
        getter timestream_settings : Types::TimestreamSettings?

        # The user name to be used to login to the endpoint database.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @endpoint_arn : String,
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @dms_transfer_settings : Types::DmsTransferSettings? = nil,
          @doc_db_settings : Types::DocDbSettings? = nil,
          @dynamo_db_settings : Types::DynamoDbSettings? = nil,
          @elasticsearch_settings : Types::ElasticsearchSettings? = nil,
          @endpoint_identifier : String? = nil,
          @endpoint_type : String? = nil,
          @engine_name : String? = nil,
          @exact_settings : Bool? = nil,
          @external_table_definition : String? = nil,
          @extra_connection_attributes : String? = nil,
          @gcp_my_sql_settings : Types::GcpMySQLSettings? = nil,
          @ibm_db2_settings : Types::IBMDb2Settings? = nil,
          @kafka_settings : Types::KafkaSettings? = nil,
          @kinesis_settings : Types::KinesisSettings? = nil,
          @microsoft_sql_server_settings : Types::MicrosoftSQLServerSettings? = nil,
          @mongo_db_settings : Types::MongoDbSettings? = nil,
          @my_sql_settings : Types::MySQLSettings? = nil,
          @neptune_settings : Types::NeptuneSettings? = nil,
          @oracle_settings : Types::OracleSettings? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @postgre_sql_settings : Types::PostgreSQLSettings? = nil,
          @redis_settings : Types::RedisSettings? = nil,
          @redshift_settings : Types::RedshiftSettings? = nil,
          @s3_settings : Types::S3Settings? = nil,
          @server_name : String? = nil,
          @service_access_role_arn : String? = nil,
          @ssl_mode : String? = nil,
          @sybase_settings : Types::SybaseSettings? = nil,
          @timestream_settings : Types::TimestreamSettings? = nil,
          @username : String? = nil
        )
        end
      end


      struct ModifyEndpointResponse
        include JSON::Serializable

        # The modified endpoint.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        def initialize(
          @endpoint : Types::Endpoint? = nil
        )
        end
      end


      struct ModifyEventSubscriptionMessage
        include JSON::Serializable

        # The name of the DMS event notification subscription to be modified.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        # A Boolean value; set to true to activate the subscription.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A list of event categories for a source type that you want to subscribe to. Use the
        # DescribeEventCategories action to see a list of event categories.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The Amazon Resource Name (ARN) of the Amazon SNS topic created for event notification. The ARN is
        # created by Amazon SNS when you create a topic and subscribe to it.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The type of DMS resource that generates the events you want to subscribe to. Valid values:
        # replication-instance | replication-task

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


      struct ModifyEventSubscriptionResponse
        include JSON::Serializable

        # The modified event subscription.

        @[JSON::Field(key: "EventSubscription")]
        getter event_subscription : Types::EventSubscription?

        def initialize(
          @event_subscription : Types::EventSubscription? = nil
        )
        end
      end


      struct ModifyInstanceProfileMessage
        include JSON::Serializable

        # The identifier of the instance profile. Identifiers must begin with a letter and must contain only
        # ASCII letters, digits, and hyphens. They can't end with a hyphen, or contain two consecutive
        # hyphens.

        @[JSON::Field(key: "InstanceProfileIdentifier")]
        getter instance_profile_identifier : String

        # The Availability Zone where the instance profile runs.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # A user-friendly description for the instance profile.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A user-friendly name for the instance profile.

        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String?

        # The Amazon Resource Name (ARN) of the KMS key that is used to encrypt the connection parameters for
        # the instance profile. If you don't specify a value for the KmsKeyArn parameter, then DMS uses an
        # Amazon Web Services owned encryption key to encrypt your resources.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # Specifies the network type for the instance profile. A value of IPV4 represents an instance profile
        # with IPv4 network type and only supports IPv4 addressing. A value of IPV6 represents an instance
        # profile with IPv6 network type and only supports IPv6 addressing. A value of DUAL represents an
        # instance profile with dual network type that supports IPv4 and IPv6 addressing.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # Specifies the accessibility options for the instance profile. A value of true represents an instance
        # profile with a public IP address. A value of false represents an instance profile with a private IP
        # address. The default value is true .

        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # A subnet group to associate with the instance profile.

        @[JSON::Field(key: "SubnetGroupIdentifier")]
        getter subnet_group_identifier : String?

        # Specifies the VPC security groups to be used with the instance profile. The VPC security group must
        # work with the VPC containing the instance profile.

        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(String)?

        def initialize(
          @instance_profile_identifier : String,
          @availability_zone : String? = nil,
          @description : String? = nil,
          @instance_profile_name : String? = nil,
          @kms_key_arn : String? = nil,
          @network_type : String? = nil,
          @publicly_accessible : Bool? = nil,
          @subnet_group_identifier : String? = nil,
          @vpc_security_groups : Array(String)? = nil
        )
        end
      end


      struct ModifyInstanceProfileResponse
        include JSON::Serializable

        # The instance profile that was modified.

        @[JSON::Field(key: "InstanceProfile")]
        getter instance_profile : Types::InstanceProfile?

        def initialize(
          @instance_profile : Types::InstanceProfile? = nil
        )
        end
      end


      struct ModifyMigrationProjectMessage
        include JSON::Serializable

        # The identifier of the migration project. Identifiers must begin with a letter and must contain only
        # ASCII letters, digits, and hyphens. They can't end with a hyphen, or contain two consecutive
        # hyphens.

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # A user-friendly description of the migration project.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name or Amazon Resource Name (ARN) for the instance profile.

        @[JSON::Field(key: "InstanceProfileIdentifier")]
        getter instance_profile_identifier : String?

        # A user-friendly name for the migration project.

        @[JSON::Field(key: "MigrationProjectName")]
        getter migration_project_name : String?

        # The schema conversion application attributes, including the Amazon S3 bucket name and Amazon S3 role
        # ARN.

        @[JSON::Field(key: "SchemaConversionApplicationAttributes")]
        getter schema_conversion_application_attributes : Types::SCApplicationAttributes?

        # Information about the source data provider, including the name, ARN, and Amazon Web Services Secrets
        # Manager parameters.

        @[JSON::Field(key: "SourceDataProviderDescriptors")]
        getter source_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition)?

        # Information about the target data provider, including the name, ARN, and Amazon Web Services Secrets
        # Manager parameters.

        @[JSON::Field(key: "TargetDataProviderDescriptors")]
        getter target_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition)?

        # The settings in JSON format for migration rules. Migration rules make it possible for you to change
        # the object names according to the rules that you specify. For example, you can change an object name
        # to lowercase or uppercase, add or remove a prefix or suffix, or rename objects.

        @[JSON::Field(key: "TransformationRules")]
        getter transformation_rules : String?

        def initialize(
          @migration_project_identifier : String,
          @description : String? = nil,
          @instance_profile_identifier : String? = nil,
          @migration_project_name : String? = nil,
          @schema_conversion_application_attributes : Types::SCApplicationAttributes? = nil,
          @source_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition)? = nil,
          @target_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition)? = nil,
          @transformation_rules : String? = nil
        )
        end
      end


      struct ModifyMigrationProjectResponse
        include JSON::Serializable

        # The migration project that was modified.

        @[JSON::Field(key: "MigrationProject")]
        getter migration_project : Types::MigrationProject?

        def initialize(
          @migration_project : Types::MigrationProject? = nil
        )
        end
      end


      struct ModifyReplicationConfigMessage
        include JSON::Serializable

        # The Amazon Resource Name of the replication to modify.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String

        # Configuration parameters for provisioning an DMS Serverless replication.

        @[JSON::Field(key: "ComputeConfig")]
        getter compute_config : Types::ComputeConfig?

        # The new replication config to apply to the replication.

        @[JSON::Field(key: "ReplicationConfigIdentifier")]
        getter replication_config_identifier : String?

        # The settings for the replication.

        @[JSON::Field(key: "ReplicationSettings")]
        getter replication_settings : String?

        # The type of replication.

        @[JSON::Field(key: "ReplicationType")]
        getter replication_type : String?

        # The Amazon Resource Name (ARN) of the source endpoint for this DMS serverless replication
        # configuration.

        @[JSON::Field(key: "SourceEndpointArn")]
        getter source_endpoint_arn : String?

        # Additional settings for the replication.

        @[JSON::Field(key: "SupplementalSettings")]
        getter supplemental_settings : String?

        # Table mappings specified in the replication.

        @[JSON::Field(key: "TableMappings")]
        getter table_mappings : String?

        # The Amazon Resource Name (ARN) of the target endpoint for this DMS serverless replication
        # configuration.

        @[JSON::Field(key: "TargetEndpointArn")]
        getter target_endpoint_arn : String?

        def initialize(
          @replication_config_arn : String,
          @compute_config : Types::ComputeConfig? = nil,
          @replication_config_identifier : String? = nil,
          @replication_settings : String? = nil,
          @replication_type : String? = nil,
          @source_endpoint_arn : String? = nil,
          @supplemental_settings : String? = nil,
          @table_mappings : String? = nil,
          @target_endpoint_arn : String? = nil
        )
        end
      end


      struct ModifyReplicationConfigResponse
        include JSON::Serializable

        # Information about the serverless replication config that was modified.

        @[JSON::Field(key: "ReplicationConfig")]
        getter replication_config : Types::ReplicationConfig?

        def initialize(
          @replication_config : Types::ReplicationConfig? = nil
        )
        end
      end


      struct ModifyReplicationInstanceMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String

        # The amount of storage (in gigabytes) to be allocated for the replication instance.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # Indicates that major version upgrades are allowed. Changing this parameter does not result in an
        # outage, and the change is asynchronously applied as soon as possible. This parameter must be set to
        # true when specifying a value for the EngineVersion parameter that is a different major version than
        # the replication instance's current version.

        @[JSON::Field(key: "AllowMajorVersionUpgrade")]
        getter allow_major_version_upgrade : Bool?

        # Indicates whether the changes should be applied immediately or during the next maintenance window.

        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool?

        # A value that indicates that minor version upgrades are applied automatically to the replication
        # instance during the maintenance window. Changing this parameter doesn't result in an outage, except
        # in the case described following. The change is asynchronously applied as soon as possible. An outage
        # does result if these factors apply: This parameter is set to true during the maintenance window. A
        # newer minor version is available. DMS has enabled automatic patching for the given engine version.

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # The engine version number of the replication instance. When modifying a major engine version of an
        # instance, also set AllowMajorVersionUpgrade to true .

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Specifies the settings required for kerberos authentication when modifying a replication instance.

        @[JSON::Field(key: "KerberosAuthenticationSettings")]
        getter kerberos_authentication_settings : Types::KerberosAuthenticationSettings?

        # Specifies whether the replication instance is a Multi-AZ deployment. You can't set the
        # AvailabilityZone parameter if the Multi-AZ parameter is set to true .

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The type of IP address protocol used by a replication instance, such as IPv4 only or Dual-stack that
        # supports both IPv4 and IPv6 addressing. IPv6 only is not yet supported.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The weekly time range (in UTC) during which system maintenance can occur, which might result in an
        # outage. Changing this parameter does not result in an outage, except in the following situation, and
        # the change is asynchronously applied as soon as possible. If moving this window to the current time,
        # there must be at least 30 minutes between the current time and end of the window to ensure pending
        # changes are applied. Default: Uses existing setting Format: ddd:hh24:mi-ddd:hh24:mi Valid Days: Mon
        # | Tue | Wed | Thu | Fri | Sat | Sun Constraints: Must be at least 30 minutes

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # The compute and memory capacity of the replication instance as defined for the specified replication
        # instance class. For example to specify the instance class dms.c4.large, set this parameter to
        # "dms.c4.large" . For more information on the settings and capacities for the available replication
        # instance classes, see Selecting the right DMS replication instance for your migration .

        @[JSON::Field(key: "ReplicationInstanceClass")]
        getter replication_instance_class : String?

        # The replication instance identifier. This parameter is stored as a lowercase string.

        @[JSON::Field(key: "ReplicationInstanceIdentifier")]
        getter replication_instance_identifier : String?

        # Specifies the VPC security group to be used with the replication instance. The VPC security group
        # must work with the VPC containing the replication instance.

        @[JSON::Field(key: "VpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @replication_instance_arn : String,
          @allocated_storage : Int32? = nil,
          @allow_major_version_upgrade : Bool? = nil,
          @apply_immediately : Bool? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @engine_version : String? = nil,
          @kerberos_authentication_settings : Types::KerberosAuthenticationSettings? = nil,
          @multi_az : Bool? = nil,
          @network_type : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @replication_instance_class : String? = nil,
          @replication_instance_identifier : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct ModifyReplicationInstanceResponse
        include JSON::Serializable

        # The modified replication instance.

        @[JSON::Field(key: "ReplicationInstance")]
        getter replication_instance : Types::ReplicationInstance?

        def initialize(
          @replication_instance : Types::ReplicationInstance? = nil
        )
        end
      end


      struct ModifyReplicationSubnetGroupMessage
        include JSON::Serializable

        # The name of the replication instance subnet group.

        @[JSON::Field(key: "ReplicationSubnetGroupIdentifier")]
        getter replication_subnet_group_identifier : String

        # A list of subnet IDs.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A description for the replication instance subnet group.

        @[JSON::Field(key: "ReplicationSubnetGroupDescription")]
        getter replication_subnet_group_description : String?

        def initialize(
          @replication_subnet_group_identifier : String,
          @subnet_ids : Array(String),
          @replication_subnet_group_description : String? = nil
        )
        end
      end


      struct ModifyReplicationSubnetGroupResponse
        include JSON::Serializable

        # The modified replication subnet group.

        @[JSON::Field(key: "ReplicationSubnetGroup")]
        getter replication_subnet_group : Types::ReplicationSubnetGroup?

        def initialize(
          @replication_subnet_group : Types::ReplicationSubnetGroup? = nil
        )
        end
      end


      struct ModifyReplicationTaskMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication task.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String

        # Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition
        # or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in
        # an error. The value can be in date, checkpoint, or LSN/SCN format. Date Example:
        # --cdc-start-position “2018-03-08T12:12:12” Checkpoint Example: --cdc-start-position
        # "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
        # LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373” When you use this task setting
        # with a source PostgreSQL database, a logical replication slot should already be created and
        # associated with the source endpoint. You can verify this by setting the slotName extra connection
        # attribute to the name of this logical replication slot. For more information, see Extra Connection
        # Attributes When Using PostgreSQL as a Source for DMS .

        @[JSON::Field(key: "CdcStartPosition")]
        getter cdc_start_position : String?

        # Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or
        # CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results
        # in an error. Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”

        @[JSON::Field(key: "CdcStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cdc_start_time : Time?

        # Indicates when you want a change data capture (CDC) operation to stop. The value can be either
        # server time or commit time. Server time example: --cdc-stop-position
        # “server_time:2018-02-09T12:12:12” Commit time example: --cdc-stop-position
        # “commit_time:2018-02-09T12:12:12“

        @[JSON::Field(key: "CdcStopPosition")]
        getter cdc_stop_position : String?

        # The migration type. Valid values: full-load | cdc | full-load-and-cdc

        @[JSON::Field(key: "MigrationType")]
        getter migration_type : String?

        # The replication task identifier. Constraints: Must contain 1-255 alphanumeric characters or hyphens.
        # First character must be a letter. Cannot end with a hyphen or contain two consecutive hyphens.

        @[JSON::Field(key: "ReplicationTaskIdentifier")]
        getter replication_task_identifier : String?

        # JSON file that contains settings for the task, such as task metadata settings.

        @[JSON::Field(key: "ReplicationTaskSettings")]
        getter replication_task_settings : String?

        # When using the CLI or boto3, provide the path of the JSON file that contains the table mappings.
        # Precede the path with file:// . For example, --table-mappings file://mappingfile.json . When working
        # with the DMS API, provide the JSON as the parameter value.

        @[JSON::Field(key: "TableMappings")]
        getter table_mappings : String?

        # Supplemental information that the task requires to migrate the data for certain source and target
        # endpoints. For more information, see Specifying Supplemental Data for Task Settings in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "TaskData")]
        getter task_data : String?

        def initialize(
          @replication_task_arn : String,
          @cdc_start_position : String? = nil,
          @cdc_start_time : Time? = nil,
          @cdc_stop_position : String? = nil,
          @migration_type : String? = nil,
          @replication_task_identifier : String? = nil,
          @replication_task_settings : String? = nil,
          @table_mappings : String? = nil,
          @task_data : String? = nil
        )
        end
      end


      struct ModifyReplicationTaskResponse
        include JSON::Serializable

        # The replication task that was modified.

        @[JSON::Field(key: "ReplicationTask")]
        getter replication_task : Types::ReplicationTask?

        def initialize(
          @replication_task : Types::ReplicationTask? = nil
        )
        end
      end

      # Provides information that defines a MongoDB data provider.

      struct MongoDbDataProviderSettings
        include JSON::Serializable

        # The authentication method for connecting to the data provider. Valid values are DEFAULT, MONGODB_CR,
        # or SCRAM_SHA_1.

        @[JSON::Field(key: "AuthMechanism")]
        getter auth_mechanism : String?

        # The MongoDB database name. This setting isn't used when AuthType is set to "no" . The default is
        # "admin" .

        @[JSON::Field(key: "AuthSource")]
        getter auth_source : String?

        # The authentication type for the database connection. Valid values are PASSWORD or NO.

        @[JSON::Field(key: "AuthType")]
        getter auth_type : String?

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The database name on the MongoDB data provider.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The port value for the MongoDB data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The name of the MongoDB server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the MongoDB data provider. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @auth_mechanism : String? = nil,
          @auth_source : String? = nil,
          @auth_type : String? = nil,
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @port : Int32? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end

      # Provides information that defines a MongoDB endpoint.

      struct MongoDbSettings
        include JSON::Serializable

        # The authentication mechanism you use to access the MongoDB source endpoint. For the default value,
        # in MongoDB version 2.x, "default" is "mongodb_cr" . For MongoDB version 3.x or later, "default" is
        # "scram_sha_1" . This setting isn't used when AuthType is set to "no" .

        @[JSON::Field(key: "AuthMechanism")]
        getter auth_mechanism : String?

        # The MongoDB database name. This setting isn't used when AuthType is set to "no" . The default is
        # "admin" .

        @[JSON::Field(key: "AuthSource")]
        getter auth_source : String?

        # The authentication type you use to access the MongoDB source endpoint. When when set to "no" , user
        # name and password parameters are not used and can be empty.

        @[JSON::Field(key: "AuthType")]
        getter auth_type : String?

        # The database name on the MongoDB source endpoint.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Indicates the number of documents to preview to determine the document organization. Use this
        # setting when NestingLevel is set to "one" . Must be a positive value greater than 0 . Default value
        # is 1000 .

        @[JSON::Field(key: "DocsToInvestigate")]
        getter docs_to_investigate : String?

        # Specifies the document ID. Use this setting when NestingLevel is set to "none" . Default value is
        # "false" .

        @[JSON::Field(key: "ExtractDocId")]
        getter extract_doc_id : String?

        # The KMS key identifier that is used to encrypt the content on the replication instance. If you don't
        # specify a value for the KmsKeyId parameter, then DMS uses your default encryption key. KMS creates
        # the default encryption key for your Amazon Web Services account. Your Amazon Web Services account
        # has a different default encryption key for each Amazon Web Services Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies either document or table mode. Default value is "none" . Specify "none" to use document
        # mode. Specify "one" to use table mode.

        @[JSON::Field(key: "NestingLevel")]
        getter nesting_level : String?

        # The password for the user account you use to access the MongoDB source endpoint.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The port value for the MongoDB source endpoint.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # If true , DMS replicates data to shard collections. DMS only uses this setting if the target
        # endpoint is a DocumentDB elastic cluster. When this setting is true , note the following: You must
        # set TargetTablePrepMode to nothing . DMS automatically sets useUpdateLookup to false .

        @[JSON::Field(key: "ReplicateShardCollections")]
        getter replicate_shard_collections : Bool?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret . The role must allow
        # the iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets
        # Manager secret that allows access to the MongoDB endpoint. You can specify one of two sets of values
        # for these permissions. You can specify the values for this setting and SecretsManagerSecretId . Or
        # you can specify clear-text values for UserName , Password , ServerName , and Port . You can't
        # specify both. For more information on creating this SecretsManagerSecret and the
        # SecretsManagerAccessRoleArn and SecretsManagerSecretId required to access it, see Using secrets to
        # access Database Migration Service resources in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the MongoDB
        # endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # The name of the server on the MongoDB source endpoint. For MongoDB Atlas, provide the server name
        # for any of the servers in the replication set.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # If true , DMS retrieves the entire document from the MongoDB source during migration. This may cause
        # a migration failure if the server response exceeds bandwidth limits. To fetch only updates and
        # deletes during migration, set this parameter to false .

        @[JSON::Field(key: "UseUpdateLookUp")]
        getter use_update_look_up : Bool?

        # The user name you use to access the MongoDB source endpoint.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @auth_mechanism : String? = nil,
          @auth_source : String? = nil,
          @auth_type : String? = nil,
          @database_name : String? = nil,
          @docs_to_investigate : String? = nil,
          @extract_doc_id : String? = nil,
          @kms_key_id : String? = nil,
          @nesting_level : String? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @replicate_shard_collections : Bool? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @server_name : String? = nil,
          @use_update_look_up : Bool? = nil,
          @username : String? = nil
        )
        end
      end


      struct MoveReplicationTaskMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the task that you want to move.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String

        # The ARN of the replication instance where you want to move the task to.

        @[JSON::Field(key: "TargetReplicationInstanceArn")]
        getter target_replication_instance_arn : String

        def initialize(
          @replication_task_arn : String,
          @target_replication_instance_arn : String
        )
        end
      end


      struct MoveReplicationTaskResponse
        include JSON::Serializable

        # The replication task that was moved.

        @[JSON::Field(key: "ReplicationTask")]
        getter replication_task : Types::ReplicationTask?

        def initialize(
          @replication_task : Types::ReplicationTask? = nil
        )
        end
      end

      # Provides information that defines a MySQL endpoint.

      struct MySQLSettings
        include JSON::Serializable

        # Specifies a script to run immediately after DMS connects to the endpoint. The migration task
        # continues running regardless if the SQL statement succeeds or fails. For this parameter, provide the
        # code of the script itself, not the name of a file containing the script.

        @[JSON::Field(key: "AfterConnectScript")]
        getter after_connect_script : String?

        # This attribute allows you to specify the authentication method as "iam auth".

        @[JSON::Field(key: "AuthenticationMethod")]
        getter authentication_method : String?

        # Cleans and recreates table metadata information on the replication instance when a mismatch occurs.
        # For example, in a situation where running an alter DDL on the table could result in different
        # information about the table cached in the replication instance.

        @[JSON::Field(key: "CleanSourceMetadataOnMismatch")]
        getter clean_source_metadata_on_mismatch : Bool?

        # Database name for the endpoint. For a MySQL source or target endpoint, don't explicitly specify the
        # database using the DatabaseName request parameter on either the CreateEndpoint or ModifyEndpoint API
        # call. Specifying DatabaseName when you create or modify a MySQL endpoint replicates all the task
        # tables to this single database. For MySQL endpoints, you specify the database only when you specify
        # the schema in the table-mapping rules of the DMS task.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Specifies how often to check the binary log for new changes/events when the database is idle. The
        # default is five seconds. Example: eventsPollInterval=5; In the example, DMS checks for changes in
        # the binary logs every five seconds.

        @[JSON::Field(key: "EventsPollInterval")]
        getter events_poll_interval : Int32?

        # Sets the client statement timeout (in seconds) for a MySQL source endpoint.

        @[JSON::Field(key: "ExecuteTimeout")]
        getter execute_timeout : Int32?

        # Specifies the maximum size (in KB) of any .csv file used to transfer data to a MySQL-compatible
        # database. Example: maxFileSize=512

        @[JSON::Field(key: "MaxFileSize")]
        getter max_file_size : Int32?

        # Improves performance when loading data into the MySQL-compatible target database. Specifies how many
        # threads to use to load the data into the MySQL-compatible target database. Setting a large number of
        # threads can have an adverse effect on database performance, because a separate connection is
        # required for each thread. The default is one. Example: parallelLoadThreads=1

        @[JSON::Field(key: "ParallelLoadThreads")]
        getter parallel_load_threads : Int32?

        # Endpoint connection password.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # Endpoint TCP port.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret . The role must allow
        # the iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets
        # Manager secret that allows access to the MySQL endpoint. You can specify one of two sets of values
        # for these permissions. You can specify the values for this setting and SecretsManagerSecretId . Or
        # you can specify clear-text values for UserName , Password , ServerName , and Port . You can't
        # specify both. For more information on creating this SecretsManagerSecret and the
        # SecretsManagerAccessRoleArn and SecretsManagerSecretId required to access it, see Using secrets to
        # access Database Migration Service resources in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the MySQL
        # endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # The host name of the endpoint database. For an Amazon RDS MySQL instance, this is the output of
        # DescribeDBInstances , in the Endpoint .Address field. For an Aurora MySQL instance, this is the
        # output of DescribeDBClusters , in the Endpoint field.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # Specifies the time zone for the source MySQL database. Example: serverTimezone=US/Pacific; Note: Do
        # not enclose time zones in single quotes.

        @[JSON::Field(key: "ServerTimezone")]
        getter server_timezone : String?

        # The IAM role you can use to authenticate when connecting to your endpoint. Ensure to include
        # iam:PassRole and rds-db:connect actions in permission policy.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # Specifies where to migrate source tables on the target, either to a single database or multiple
        # databases. If you specify SPECIFIC_DATABASE , specify the database name using the DatabaseName
        # parameter of the Endpoint object. Example: targetDbType=MULTIPLE_DATABASES

        @[JSON::Field(key: "TargetDbType")]
        getter target_db_type : String?

        # Endpoint connection user name.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @after_connect_script : String? = nil,
          @authentication_method : String? = nil,
          @clean_source_metadata_on_mismatch : Bool? = nil,
          @database_name : String? = nil,
          @events_poll_interval : Int32? = nil,
          @execute_timeout : Int32? = nil,
          @max_file_size : Int32? = nil,
          @parallel_load_threads : Int32? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @server_name : String? = nil,
          @server_timezone : String? = nil,
          @service_access_role_arn : String? = nil,
          @target_db_type : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Provides information that defines a MySQL data provider.

      struct MySqlDataProviderSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The port value for the MySQL data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The ARN for the role the application uses to access its Amazon S3 bucket.

        @[JSON::Field(key: "S3AccessRoleArn")]
        getter s3_access_role_arn : String?

        # The path for the Amazon S3 bucket that the application uses for accessing the user-defined schema.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The name of the MySQL server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the MySQL data provider. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @certificate_arn : String? = nil,
          @port : Int32? = nil,
          @s3_access_role_arn : String? = nil,
          @s3_path : String? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end

      # Provides information that defines an Amazon Neptune endpoint.

      struct NeptuneSettings
        include JSON::Serializable

        # A folder path where you want DMS to store migrated graph data in the S3 bucket specified by
        # S3BucketName

        @[JSON::Field(key: "S3BucketFolder")]
        getter s3_bucket_folder : String

        # The name of the Amazon S3 bucket where DMS can temporarily store migrated graph data in .csv files
        # before bulk-loading it to the Neptune target database. DMS maps the SQL source data to graph data
        # before storing it in these .csv files.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        # The number of milliseconds for DMS to wait to retry a bulk-load of migrated graph data to the
        # Neptune target database before raising an error. The default is 250.

        @[JSON::Field(key: "ErrorRetryDuration")]
        getter error_retry_duration : Int32?

        # If you want Identity and Access Management (IAM) authorization enabled for this endpoint, set this
        # parameter to true . Then attach the appropriate IAM policy document to your service role specified
        # by ServiceAccessRoleArn . The default is false .

        @[JSON::Field(key: "IamAuthEnabled")]
        getter iam_auth_enabled : Bool?

        # The maximum size in kilobytes of migrated graph data stored in a .csv file before DMS bulk-loads the
        # data to the Neptune target database. The default is 1,048,576 KB. If the bulk load is successful,
        # DMS clears the bucket, ready to store the next batch of migrated graph data.

        @[JSON::Field(key: "MaxFileSize")]
        getter max_file_size : Int32?

        # The number of times for DMS to retry a bulk load of migrated graph data to the Neptune target
        # database before raising an error. The default is 5.

        @[JSON::Field(key: "MaxRetryCount")]
        getter max_retry_count : Int32?

        # The Amazon Resource Name (ARN) of the service role that you created for the Neptune target endpoint.
        # The role must allow the iam:PassRole action. For more information, see Creating an IAM Service Role
        # for Accessing Amazon Neptune as a Target in the Database Migration Service User Guide.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        def initialize(
          @s3_bucket_folder : String,
          @s3_bucket_name : String,
          @error_retry_duration : Int32? = nil,
          @iam_auth_enabled : Bool? = nil,
          @max_file_size : Int32? = nil,
          @max_retry_count : Int32? = nil,
          @service_access_role_arn : String? = nil
        )
        end
      end

      # Provides information that defines an Oracle data provider.

      struct OracleDataProviderSettings
        include JSON::Serializable

        # The address of your Oracle Automatic Storage Management (ASM) server. You can set this value from
        # the asm_server value. You set asm_server as part of the extra connection attribute string to access
        # an Oracle server with Binary Reader that uses ASM. For more information, see Configuration for
        # change data capture (CDC) on an Oracle source database .

        @[JSON::Field(key: "AsmServer")]
        getter asm_server : String?

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The database name on the Oracle data provider.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The port value for the Oracle data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The ARN for the role the application uses to access its Amazon S3 bucket.

        @[JSON::Field(key: "S3AccessRoleArn")]
        getter s3_access_role_arn : String?

        # The path for the Amazon S3 bucket that the application uses for accessing the user-defined schema.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The ARN of the IAM role that provides access to the secret in Secrets Manager that contains the
        # Oracle ASM connection details.

        @[JSON::Field(key: "SecretsManagerOracleAsmAccessRoleArn")]
        getter secrets_manager_oracle_asm_access_role_arn : String?

        # The identifier of the secret in Secrets Manager that contains the Oracle ASM connection details.
        # Required only if your data provider uses the Oracle ASM server.

        @[JSON::Field(key: "SecretsManagerOracleAsmSecretId")]
        getter secrets_manager_oracle_asm_secret_id : String?

        # The ARN of the IAM role that provides access to the secret in Secrets Manager that contains the TDE
        # password.

        @[JSON::Field(key: "SecretsManagerSecurityDbEncryptionAccessRoleArn")]
        getter secrets_manager_security_db_encryption_access_role_arn : String?

        # The identifier of the secret in Secrets Manager that contains the transparent data encryption (TDE)
        # password. DMS requires this password to access Oracle redo logs encrypted by TDE using Binary
        # Reader.

        @[JSON::Field(key: "SecretsManagerSecurityDbEncryptionSecretId")]
        getter secrets_manager_security_db_encryption_secret_id : String?

        # The name of the Oracle server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the Oracle data provider. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @asm_server : String? = nil,
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @port : Int32? = nil,
          @s3_access_role_arn : String? = nil,
          @s3_path : String? = nil,
          @secrets_manager_oracle_asm_access_role_arn : String? = nil,
          @secrets_manager_oracle_asm_secret_id : String? = nil,
          @secrets_manager_security_db_encryption_access_role_arn : String? = nil,
          @secrets_manager_security_db_encryption_secret_id : String? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end

      # Provides information that defines an Oracle endpoint.

      struct OracleSettings
        include JSON::Serializable

        # Set this attribute to false in order to use the Binary Reader to capture change data for an Amazon
        # RDS for Oracle as the source. This tells the DMS instance to not access redo logs through any
        # specified path prefix replacement using direct file access.

        @[JSON::Field(key: "AccessAlternateDirectly")]
        getter access_alternate_directly : Bool?

        # Set this attribute to set up table-level supplemental logging for the Oracle database. This
        # attribute enables PRIMARY KEY supplemental logging on all tables selected for a migration task. If
        # you use this option, you still need to enable database-level supplemental logging.

        @[JSON::Field(key: "AddSupplementalLogging")]
        getter add_supplemental_logging : Bool?

        # Set this attribute with ArchivedLogDestId in a primary/ standby setup. This attribute is useful in
        # the case of a switchover. In this case, DMS needs to know which destination to get archive redo logs
        # from to read changes. This need arises because the previous primary instance is now a standby
        # instance after switchover. Although DMS supports the use of the Oracle RESETLOGS option to open the
        # database, never use RESETLOGS unless necessary. For additional information about RESETLOGS , see
        # RMAN Data Repair Concepts in the Oracle Database Backup and Recovery User's Guide .

        @[JSON::Field(key: "AdditionalArchivedLogDestId")]
        getter additional_archived_log_dest_id : Int32?

        # Set this attribute to true to enable replication of Oracle tables containing columns that are nested
        # tables or defined types.

        @[JSON::Field(key: "AllowSelectNestedTables")]
        getter allow_select_nested_tables : Bool?

        # Specifies the ID of the destination for the archived redo logs. This value should be the same as a
        # number in the dest_id column of the v$archived_log view. If you work with an additional redo log
        # destination, use the AdditionalArchivedLogDestId option to specify the additional destination ID.
        # Doing this improves performance by ensuring that the correct logs are accessed from the outset.

        @[JSON::Field(key: "ArchivedLogDestId")]
        getter archived_log_dest_id : Int32?

        # When this field is set to True , DMS only accesses the archived redo logs. If the archived redo logs
        # are stored on Automatic Storage Management (ASM) only, the DMS user account needs to be granted ASM
        # privileges.

        @[JSON::Field(key: "ArchivedLogsOnly")]
        getter archived_logs_only : Bool?

        # For an Oracle source endpoint, your Oracle Automatic Storage Management (ASM) password. You can set
        # this value from the asm_user_password value. You set this value as part of the comma-separated value
        # that you set to the Password request parameter when you create the endpoint to access transaction
        # logs using Binary Reader. For more information, see Configuration for change data capture (CDC) on
        # an Oracle source database .

        @[JSON::Field(key: "AsmPassword")]
        getter asm_password : String?

        # For an Oracle source endpoint, your ASM server address. You can set this value from the asm_server
        # value. You set asm_server as part of the extra connection attribute string to access an Oracle
        # server with Binary Reader that uses ASM. For more information, see Configuration for change data
        # capture (CDC) on an Oracle source database .

        @[JSON::Field(key: "AsmServer")]
        getter asm_server : String?

        # For an Oracle source endpoint, your ASM user name. You can set this value from the asm_user value.
        # You set asm_user as part of the extra connection attribute string to access an Oracle server with
        # Binary Reader that uses ASM. For more information, see Configuration for change data capture (CDC)
        # on an Oracle source database .

        @[JSON::Field(key: "AsmUser")]
        getter asm_user : String?

        # Specifies the authentication method to be used with Oracle.

        @[JSON::Field(key: "AuthenticationMethod")]
        getter authentication_method : String?

        # Specifies whether the length of a character column is in bytes or in characters. To indicate that
        # the character column length is in characters, set this attribute to CHAR . Otherwise, the character
        # column length is in bytes. Example: charLengthSemantics=CHAR;

        @[JSON::Field(key: "CharLengthSemantics")]
        getter char_length_semantics : String?

        # When true, converts timestamps with the timezone datatype to their UTC value.

        @[JSON::Field(key: "ConvertTimestampWithZoneToUTC")]
        getter convert_timestamp_with_zone_to_utc : Bool?

        # Database name for the endpoint.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # When set to true , this attribute helps to increase the commit rate on the Oracle target database by
        # writing directly to tables and not writing a trail to database logs.

        @[JSON::Field(key: "DirectPathNoLog")]
        getter direct_path_no_log : Bool?

        # When set to true , this attribute specifies a parallel load when useDirectPathFullLoad is set to Y .
        # This attribute also only applies when you use the DMS parallel load feature. Note that the target
        # table cannot have any constraints or indexes.

        @[JSON::Field(key: "DirectPathParallelLoad")]
        getter direct_path_parallel_load : Bool?

        # Set this attribute to enable homogenous tablespace replication and create existing tables or indexes
        # under the same tablespace on the target.

        @[JSON::Field(key: "EnableHomogenousTablespace")]
        getter enable_homogenous_tablespace : Bool?

        # Specifies the IDs of one more destinations for one or more archived redo logs. These IDs are the
        # values of the dest_id column in the v$archived_log view. Use this setting with the archivedLogDestId
        # extra connection attribute in a primary-to-single setup or a primary-to-multiple-standby setup. This
        # setting is useful in a switchover when you use an Oracle Data Guard database as a source. In this
        # case, DMS needs information about what destination to get archive redo logs from to read changes.
        # DMS needs this because after the switchover the previous primary is a standby instance. For example,
        # in a primary-to-single standby setup you might apply the following settings. archivedLogDestId=1;
        # ExtraArchivedLogDestIds=[2] In a primary-to-multiple-standby setup, you might apply the following
        # settings. archivedLogDestId=1; ExtraArchivedLogDestIds=[2,3,4] Although DMS supports the use of the
        # Oracle RESETLOGS option to open the database, never use RESETLOGS unless it's necessary. For more
        # information about RESETLOGS , see RMAN Data Repair Concepts in the Oracle Database Backup and
        # Recovery User's Guide .

        @[JSON::Field(key: "ExtraArchivedLogDestIds")]
        getter extra_archived_log_dest_ids : Array(Int32)?

        # When set to true , this attribute causes a task to fail if the actual size of an LOB column is
        # greater than the specified LobMaxSize . If a task is set to limited LOB mode and this option is set
        # to true , the task fails instead of truncating the LOB data.

        @[JSON::Field(key: "FailTasksOnLobTruncation")]
        getter fail_tasks_on_lob_truncation : Bool?

        # Specifies the number scale. You can select a scale up to 38, or you can select FLOAT. By default,
        # the NUMBER data type is converted to precision 38, scale 10. Example: numberDataTypeScale=12

        @[JSON::Field(key: "NumberDatatypeScale")]
        getter number_datatype_scale : Int32?

        # The timeframe in minutes to check for open transactions for a CDC-only task. You can specify an
        # integer value between 0 (the default) and 240 (the maximum). This parameter is only valid in DMS
        # version 3.5.0 and later.

        @[JSON::Field(key: "OpenTransactionWindow")]
        getter open_transaction_window : Int32?

        # Set this string attribute to the required value in order to use the Binary Reader to capture change
        # data for an Amazon RDS for Oracle as the source. This value specifies the default Oracle root used
        # to access the redo logs.

        @[JSON::Field(key: "OraclePathPrefix")]
        getter oracle_path_prefix : String?

        # Set this attribute to change the number of threads that DMS configures to perform a change data
        # capture (CDC) load using Oracle Automatic Storage Management (ASM). You can specify an integer value
        # between 2 (the default) and 8 (the maximum). Use this attribute together with the readAheadBlocks
        # attribute.

        @[JSON::Field(key: "ParallelAsmReadThreads")]
        getter parallel_asm_read_threads : Int32?

        # Endpoint connection password.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # Endpoint TCP port.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Set this attribute to change the number of read-ahead blocks that DMS configures to perform a change
        # data capture (CDC) load using Oracle Automatic Storage Management (ASM). You can specify an integer
        # value between 1000 (the default) and 200,000 (the maximum).

        @[JSON::Field(key: "ReadAheadBlocks")]
        getter read_ahead_blocks : Int32?

        # When set to true , this attribute supports tablespace replication.

        @[JSON::Field(key: "ReadTableSpaceName")]
        getter read_table_space_name : Bool?

        # Set this attribute to true in order to use the Binary Reader to capture change data for an Amazon
        # RDS for Oracle as the source. This setting tells DMS instance to replace the default Oracle root
        # with the specified usePathPrefix setting to access the redo logs.

        @[JSON::Field(key: "ReplacePathPrefix")]
        getter replace_path_prefix : Bool?

        # Specifies the number of seconds that the system waits before resending a query. Example:
        # retryInterval=6;

        @[JSON::Field(key: "RetryInterval")]
        getter retry_interval : Int32?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret . The role must allow
        # the iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets
        # Manager secret that allows access to the Oracle endpoint. You can specify one of two sets of values
        # for these permissions. You can specify the values for this setting and SecretsManagerSecretId . Or
        # you can specify clear-text values for UserName , Password , ServerName , and Port . You can't
        # specify both. For more information on creating this SecretsManagerSecret and the
        # SecretsManagerAccessRoleArn and SecretsManagerSecretId required to access it, see Using secrets to
        # access Database Migration Service resources in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # Required only if your Oracle endpoint uses Automatic Storage Management (ASM). The full ARN of the
        # IAM role that specifies DMS as the trusted entity and grants the required permissions to access the
        # SecretsManagerOracleAsmSecret . This SecretsManagerOracleAsmSecret has the secret value that allows
        # access to the Oracle ASM of the endpoint. You can specify one of two sets of values for these
        # permissions. You can specify the values for this setting and SecretsManagerOracleAsmSecretId . Or
        # you can specify clear-text values for AsmUser , AsmPassword , and AsmServerName . You can't specify
        # both. For more information on creating this SecretsManagerOracleAsmSecret and the
        # SecretsManagerOracleAsmAccessRoleArn and SecretsManagerOracleAsmSecretId required to access it, see
        # Using secrets to access Database Migration Service resources in the Database Migration Service User
        # Guide .

        @[JSON::Field(key: "SecretsManagerOracleAsmAccessRoleArn")]
        getter secrets_manager_oracle_asm_access_role_arn : String?

        # Required only if your Oracle endpoint uses Automatic Storage Management (ASM). The full ARN, partial
        # ARN, or friendly name of the SecretsManagerOracleAsmSecret that contains the Oracle ASM connection
        # details for the Oracle endpoint.

        @[JSON::Field(key: "SecretsManagerOracleAsmSecretId")]
        getter secrets_manager_oracle_asm_secret_id : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the Oracle
        # endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # For an Oracle source endpoint, the transparent data encryption (TDE) password required by AWM DMS to
        # access Oracle redo logs encrypted by TDE using Binary Reader. It is also the TDE_Password part of
        # the comma-separated value you set to the Password request parameter when you create the endpoint.
        # The SecurityDbEncryptian setting is related to this SecurityDbEncryptionName setting. For more
        # information, see Supported encryption methods for using Oracle as a source for DMS in the Database
        # Migration Service User Guide .

        @[JSON::Field(key: "SecurityDbEncryption")]
        getter security_db_encryption : String?

        # For an Oracle source endpoint, the name of a key used for the transparent data encryption (TDE) of
        # the columns and tablespaces in an Oracle source database that is encrypted using TDE. The key value
        # is the value of the SecurityDbEncryption setting. For more information on setting the key name value
        # of SecurityDbEncryptionName , see the information and example for setting the
        # securityDbEncryptionName extra connection attribute in Supported encryption methods for using Oracle
        # as a source for DMS in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecurityDbEncryptionName")]
        getter security_db_encryption_name : String?

        # Fully qualified domain name of the endpoint. For an Amazon RDS Oracle instance, this is the output
        # of DescribeDBInstances , in the Endpoint .Address field.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # Use this attribute to convert SDO_GEOMETRY to GEOJSON format. By default, DMS calls the SDO2GEOJSON
        # custom function if present and accessible. Or you can create your own custom function that mimics
        # the operation of SDOGEOJSON and set SpatialDataOptionToGeoJsonFunctionName to call it instead.

        @[JSON::Field(key: "SpatialDataOptionToGeoJsonFunctionName")]
        getter spatial_data_option_to_geo_json_function_name : String?

        # Use this attribute to specify a time in minutes for the delay in standby sync. If the source is an
        # Oracle Active Data Guard standby database, use this attribute to specify the time lag between
        # primary and standby databases. In DMS, you can create an Oracle CDC task that uses an Active Data
        # Guard standby instance as a source for replicating ongoing changes. Doing this eliminates the need
        # to connect to an active database that might be in production.

        @[JSON::Field(key: "StandbyDelayTime")]
        getter standby_delay_time : Int32?

        # Use the TrimSpaceInChar source endpoint setting to trim data on CHAR and NCHAR data types during
        # migration. The default value is true .

        @[JSON::Field(key: "TrimSpaceInChar")]
        getter trim_space_in_char : Bool?

        # Set this attribute to true in order to use the Binary Reader to capture change data for an Amazon
        # RDS for Oracle as the source. This tells the DMS instance to use any specified prefix replacement to
        # access all online redo logs.

        @[JSON::Field(key: "UseAlternateFolderForOnline")]
        getter use_alternate_folder_for_online : Bool?

        # Set this attribute to True to capture change data using the Binary Reader utility. Set
        # UseLogminerReader to False to set this attribute to True. To use Binary Reader with Amazon RDS for
        # Oracle as the source, you set additional attributes. For more information about using this setting
        # with Oracle Automatic Storage Management (ASM), see Using Oracle LogMiner or DMS Binary Reader for
        # CDC .

        @[JSON::Field(key: "UseBFile")]
        getter use_b_file : Bool?

        # Set this attribute to True to have DMS use a direct path full load. Specify this value to use the
        # direct path protocol in the Oracle Call Interface (OCI). By using this OCI protocol, you can
        # bulk-load Oracle target tables during a full load.

        @[JSON::Field(key: "UseDirectPathFullLoad")]
        getter use_direct_path_full_load : Bool?

        # Set this attribute to True to capture change data using the Oracle LogMiner utility (the default).
        # Set this attribute to False if you want to access the redo logs as a binary file. When you set
        # UseLogminerReader to False, also set UseBfile to True. For more information on this setting and
        # using Oracle ASM, see Using Oracle LogMiner or DMS Binary Reader for CDC in the DMS User Guide .

        @[JSON::Field(key: "UseLogminerReader")]
        getter use_logminer_reader : Bool?

        # Set this string attribute to the required value in order to use the Binary Reader to capture change
        # data for an Amazon RDS for Oracle as the source. This value specifies the path prefix used to
        # replace the default Oracle root to access the redo logs.

        @[JSON::Field(key: "UsePathPrefix")]
        getter use_path_prefix : String?

        # Endpoint connection user name.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @access_alternate_directly : Bool? = nil,
          @add_supplemental_logging : Bool? = nil,
          @additional_archived_log_dest_id : Int32? = nil,
          @allow_select_nested_tables : Bool? = nil,
          @archived_log_dest_id : Int32? = nil,
          @archived_logs_only : Bool? = nil,
          @asm_password : String? = nil,
          @asm_server : String? = nil,
          @asm_user : String? = nil,
          @authentication_method : String? = nil,
          @char_length_semantics : String? = nil,
          @convert_timestamp_with_zone_to_utc : Bool? = nil,
          @database_name : String? = nil,
          @direct_path_no_log : Bool? = nil,
          @direct_path_parallel_load : Bool? = nil,
          @enable_homogenous_tablespace : Bool? = nil,
          @extra_archived_log_dest_ids : Array(Int32)? = nil,
          @fail_tasks_on_lob_truncation : Bool? = nil,
          @number_datatype_scale : Int32? = nil,
          @open_transaction_window : Int32? = nil,
          @oracle_path_prefix : String? = nil,
          @parallel_asm_read_threads : Int32? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @read_ahead_blocks : Int32? = nil,
          @read_table_space_name : Bool? = nil,
          @replace_path_prefix : Bool? = nil,
          @retry_interval : Int32? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_oracle_asm_access_role_arn : String? = nil,
          @secrets_manager_oracle_asm_secret_id : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @security_db_encryption : String? = nil,
          @security_db_encryption_name : String? = nil,
          @server_name : String? = nil,
          @spatial_data_option_to_geo_json_function_name : String? = nil,
          @standby_delay_time : Int32? = nil,
          @trim_space_in_char : Bool? = nil,
          @use_alternate_folder_for_online : Bool? = nil,
          @use_b_file : Bool? = nil,
          @use_direct_path_full_load : Bool? = nil,
          @use_logminer_reader : Bool? = nil,
          @use_path_prefix : String? = nil,
          @username : String? = nil
        )
        end
      end

      # In response to the DescribeOrderableReplicationInstances operation, this object describes an
      # available replication instance. This description includes the replication instance's type, engine
      # version, and allocated storage.

      struct OrderableReplicationInstance
        include JSON::Serializable

        # List of Availability Zones for this replication instance.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The default amount of storage (in gigabytes) that is allocated for the replication instance.

        @[JSON::Field(key: "DefaultAllocatedStorage")]
        getter default_allocated_storage : Int32?

        # The version of the replication engine.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The amount of storage (in gigabytes) that is allocated for the replication instance.

        @[JSON::Field(key: "IncludedAllocatedStorage")]
        getter included_allocated_storage : Int32?

        # The minimum amount of storage (in gigabytes) that can be allocated for the replication instance.

        @[JSON::Field(key: "MaxAllocatedStorage")]
        getter max_allocated_storage : Int32?

        # The minimum amount of storage (in gigabytes) that can be allocated for the replication instance.

        @[JSON::Field(key: "MinAllocatedStorage")]
        getter min_allocated_storage : Int32?

        # The value returned when the specified EngineVersion of the replication instance is in Beta or test
        # mode. This indicates some features might not work as expected. DMS supports the ReleaseStatus
        # parameter in versions 3.1.4 and later.

        @[JSON::Field(key: "ReleaseStatus")]
        getter release_status : String?

        # The compute and memory capacity of the replication instance as defined for the specified replication
        # instance class. For example to specify the instance class dms.c4.large, set this parameter to
        # "dms.c4.large" . For more information on the settings and capacities for the available replication
        # instance classes, see Selecting the right DMS replication instance for your migration .

        @[JSON::Field(key: "ReplicationInstanceClass")]
        getter replication_instance_class : String?

        # The type of storage used by the replication instance.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        def initialize(
          @availability_zones : Array(String)? = nil,
          @default_allocated_storage : Int32? = nil,
          @engine_version : String? = nil,
          @included_allocated_storage : Int32? = nil,
          @max_allocated_storage : Int32? = nil,
          @min_allocated_storage : Int32? = nil,
          @release_status : String? = nil,
          @replication_instance_class : String? = nil,
          @storage_type : String? = nil
        )
        end
      end

      # Describes a maintenance action pending for an DMS resource, including when and how it will be
      # applied. This data type is a response element to the DescribePendingMaintenanceActions operation.

      struct PendingMaintenanceAction
        include JSON::Serializable

        # The type of pending maintenance action that is available for the resource.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The date of the maintenance window when the action is to be applied. The maintenance action is
        # applied to the resource during its first maintenance window after this date. If this date is
        # specified, any next-maintenance opt-in requests are ignored.

        @[JSON::Field(key: "AutoAppliedAfterDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter auto_applied_after_date : Time?

        # The effective date when the pending maintenance action will be applied to the resource. This date
        # takes into account opt-in requests received from the ApplyPendingMaintenanceAction API operation,
        # and also the AutoAppliedAfterDate and ForcedApplyDate parameter values. This value is blank if an
        # opt-in request has not been received and nothing has been specified for AutoAppliedAfterDate or
        # ForcedApplyDate .

        @[JSON::Field(key: "CurrentApplyDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter current_apply_date : Time?

        # A description providing more detail about the maintenance action.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date when the maintenance action will be automatically applied. The maintenance action is
        # applied to the resource on this date regardless of the maintenance window for the resource. If this
        # date is specified, any immediate opt-in requests are ignored.

        @[JSON::Field(key: "ForcedApplyDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter forced_apply_date : Time?

        # The type of opt-in request that has been received for the resource.

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

      # Provides information that defines a PostgreSQL endpoint.

      struct PostgreSQLSettings
        include JSON::Serializable

        # For use with change data capture (CDC) only, this attribute has DMS bypass foreign keys and user
        # triggers to reduce the time it takes to bulk load data. Example: afterConnectScript=SET
        # session_replication_role='replica'

        @[JSON::Field(key: "AfterConnectScript")]
        getter after_connect_script : String?

        # This attribute allows you to specify the authentication method as "iam auth".

        @[JSON::Field(key: "AuthenticationMethod")]
        getter authentication_method : String?

        # The Babelfish for Aurora PostgreSQL database name for the endpoint.

        @[JSON::Field(key: "BabelfishDatabaseName")]
        getter babelfish_database_name : String?

        # To capture DDL events, DMS creates various artifacts in the PostgreSQL database when the task
        # starts. You can later remove these artifacts. The default value is true . If this value is set to N
        # , you don't have to create tables or triggers on the source database.

        @[JSON::Field(key: "CaptureDdls")]
        getter capture_ddls : Bool?

        # Specifies the default behavior of the replication's handling of PostgreSQL- compatible endpoints
        # that require some additional configuration, such as Babelfish endpoints.

        @[JSON::Field(key: "DatabaseMode")]
        getter database_mode : String?

        # Database name for the endpoint.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The schema in which the operational DDL database artifacts are created. The default value is public
        # . Example: ddlArtifactsSchema=xyzddlschema;

        @[JSON::Field(key: "DdlArtifactsSchema")]
        getter ddl_artifacts_schema : String?

        # Disables the Unicode source filter with PostgreSQL, for values passed into the Selection rule filter
        # on Source Endpoint column values. By default DMS performs source filter comparisons using a Unicode
        # string which can cause look ups to ignore the indexes in the text columns and slow down migrations.
        # Unicode support should only be disabled when using a selection rule filter is on a text column in
        # the Source database that is indexed.

        @[JSON::Field(key: "DisableUnicodeSourceFilter")]
        getter disable_unicode_source_filter : Bool?

        # Sets the client statement timeout for the PostgreSQL instance, in seconds. The default value is 60
        # seconds. Example: executeTimeout=100;

        @[JSON::Field(key: "ExecuteTimeout")]
        getter execute_timeout : Int32?

        # When set to true , this value causes a task to fail if the actual size of a LOB column is greater
        # than the specified LobMaxSize . The default value is false . If task is set to Limited LOB mode and
        # this option is set to true, the task fails instead of truncating the LOB data.

        @[JSON::Field(key: "FailTasksOnLobTruncation")]
        getter fail_tasks_on_lob_truncation : Bool?

        # The write-ahead log (WAL) heartbeat feature mimics a dummy transaction. By doing this, it prevents
        # idle logical replication slots from holding onto old WAL logs, which can result in storage full
        # situations on the source. This heartbeat keeps restart_lsn moving and prevents storage full
        # scenarios. The default value is false .

        @[JSON::Field(key: "HeartbeatEnable")]
        getter heartbeat_enable : Bool?

        # Sets the WAL heartbeat frequency (in minutes). The default value is 5 minutes.

        @[JSON::Field(key: "HeartbeatFrequency")]
        getter heartbeat_frequency : Int32?

        # Sets the schema in which the heartbeat artifacts are created. The default value is public .

        @[JSON::Field(key: "HeartbeatSchema")]
        getter heartbeat_schema : String?

        # When true, lets PostgreSQL migrate the boolean type as boolean. By default, PostgreSQL migrates
        # booleans as varchar(5) . You must set this setting on both the source and target endpoints for it to
        # take effect. The default value is false .

        @[JSON::Field(key: "MapBooleanAsBoolean")]
        getter map_boolean_as_boolean : Bool?

        # When true, DMS migrates JSONB values as CLOB. The default value is false .

        @[JSON::Field(key: "MapJsonbAsClob")]
        getter map_jsonb_as_clob : Bool?

        # Sets what datatype to map LONG values as. The default value is wstring .

        @[JSON::Field(key: "MapLongVarcharAs")]
        getter map_long_varchar_as : String?

        # Specifies the maximum size (in KB) of any .csv file used to transfer data to PostgreSQL. The default
        # value is 32,768 KB (32 MB). Example: maxFileSize=512

        @[JSON::Field(key: "MaxFileSize")]
        getter max_file_size : Int32?

        # Endpoint connection password.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # Specifies the plugin to use to create a replication slot. The default value is pglogical .

        @[JSON::Field(key: "PluginName")]
        getter plugin_name : String?

        # Endpoint TCP port. The default is 5432.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret . The role must allow
        # the iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets
        # Manager secret that allows access to the PostgreSQL endpoint. You can specify one of two sets of
        # values for these permissions. You can specify the values for this setting and SecretsManagerSecretId
        # . Or you can specify clear-text values for UserName , Password , ServerName , and Port . You can't
        # specify both. For more information on creating this SecretsManagerSecret and the
        # SecretsManagerAccessRoleArn and SecretsManagerSecretId required to access it, see Using secrets to
        # access Database Migration Service resources in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the PostgreSQL
        # endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # The host name of the endpoint database. For an Amazon RDS PostgreSQL instance, this is the output of
        # DescribeDBInstances , in the Endpoint .Address field. For an Aurora PostgreSQL instance, this is the
        # output of DescribeDBClusters , in the Endpoint field.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The IAM role arn you can use to authenticate the connection to your endpoint. Ensure to include
        # iam:PassRole and rds-db:connect actions in permission policy.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # Sets the name of a previously created logical replication slot for a change data capture (CDC) load
        # of the PostgreSQL source instance. When used with the CdcStartPosition request parameter for the DMS
        # API , this attribute also makes it possible to use native CDC start points. DMS verifies that the
        # specified logical replication slot exists before starting the CDC load task. It also verifies that
        # the task was created with a valid setting of CdcStartPosition . If the specified slot doesn't exist
        # or the task doesn't have a valid CdcStartPosition setting, DMS raises an error. For more information
        # about setting the CdcStartPosition request parameter, see Determining a CDC native start point in
        # the Database Migration Service User Guide . For more information about using CdcStartPosition , see
        # CreateReplicationTask , StartReplicationTask , and ModifyReplicationTask .

        @[JSON::Field(key: "SlotName")]
        getter slot_name : String?

        # Use the TrimSpaceInChar source endpoint setting to trim data on CHAR and NCHAR data types during
        # migration. The default value is true .

        @[JSON::Field(key: "TrimSpaceInChar")]
        getter trim_space_in_char : Bool?

        # Endpoint connection user name.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @after_connect_script : String? = nil,
          @authentication_method : String? = nil,
          @babelfish_database_name : String? = nil,
          @capture_ddls : Bool? = nil,
          @database_mode : String? = nil,
          @database_name : String? = nil,
          @ddl_artifacts_schema : String? = nil,
          @disable_unicode_source_filter : Bool? = nil,
          @execute_timeout : Int32? = nil,
          @fail_tasks_on_lob_truncation : Bool? = nil,
          @heartbeat_enable : Bool? = nil,
          @heartbeat_frequency : Int32? = nil,
          @heartbeat_schema : String? = nil,
          @map_boolean_as_boolean : Bool? = nil,
          @map_jsonb_as_clob : Bool? = nil,
          @map_long_varchar_as : String? = nil,
          @max_file_size : Int32? = nil,
          @password : String? = nil,
          @plugin_name : String? = nil,
          @port : Int32? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @server_name : String? = nil,
          @service_access_role_arn : String? = nil,
          @slot_name : String? = nil,
          @trim_space_in_char : Bool? = nil,
          @username : String? = nil
        )
        end
      end

      # Provides information that defines a PostgreSQL data provider.

      struct PostgreSqlDataProviderSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The database name on the PostgreSQL data provider.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The port value for the PostgreSQL data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The ARN for the role the application uses to access its Amazon S3 bucket.

        @[JSON::Field(key: "S3AccessRoleArn")]
        getter s3_access_role_arn : String?

        # The path for the Amazon S3 bucket that the application uses for accessing the user-defined schema.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The name of the PostgreSQL server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the PostgreSQL data provider. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @port : Int32? = nil,
          @s3_access_role_arn : String? = nil,
          @s3_path : String? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end

      # The results returned in describe-replications to display the results of the premigration assessment
      # from the replication configuration.

      struct PremigrationAssessmentStatus
        include JSON::Serializable


        @[JSON::Field(key: "AssessmentProgress")]
        getter assessment_progress : Types::ReplicationTaskAssessmentRunProgress?

        # A configurable setting you can set to true (the defualt setting) or false . Use this setting to to
        # stop the replication from starting automatically if the assessment fails. This can help you evaluate
        # the issue that is preventing the replication from running successfully.

        @[JSON::Field(key: "FailOnAssessmentFailure")]
        getter fail_on_assessment_failure : Bool?

        # The last message generated by an individual assessment failure.

        @[JSON::Field(key: "LastFailureMessage")]
        getter last_failure_message : String?

        # The Amazon Resource Name (ARN) of this assessment run.

        @[JSON::Field(key: "PremigrationAssessmentRunArn")]
        getter premigration_assessment_run_arn : String?

        # The date which the assessment run was created.

        @[JSON::Field(key: "PremigrationAssessmentRunCreationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter premigration_assessment_run_creation_date : Time?

        # The supported values are SSE_KMS and SSE_S3 . If these values are not provided, then the files are
        # not encrypted at rest. For more information, see Creating Amazon Web Services KMS keys to encrypt
        # Amazon S3 target objects .

        @[JSON::Field(key: "ResultEncryptionMode")]
        getter result_encryption_mode : String?

        # The ARN of a custom KMS encryption key that you specify when you set ResultEncryptionMode to SSE_KMS
        # .

        @[JSON::Field(key: "ResultKmsKeyArn")]
        getter result_kms_key_arn : String?

        # The Amazon S3 bucket that Database Migration Service Serverless created to store the results of this
        # assessment run.

        @[JSON::Field(key: "ResultLocationBucket")]
        getter result_location_bucket : String?

        # The folder within an Amazon S3 bucket where you want Database Migration Service to store the results
        # of this assessment run.

        @[JSON::Field(key: "ResultLocationFolder")]
        getter result_location_folder : String?


        @[JSON::Field(key: "ResultStatistic")]
        getter result_statistic : Types::ReplicationTaskAssessmentRunResultStatistic?

        # This describes the assessment run status. The status can be one of the following values: cancelling
        # : The assessment run was canceled. deleting : The assessment run was deleted. failed : At least one
        # individual assessment completed with a failed status. error-provisioning : An internal error
        # occurred while resources were provisioned (during the provisioning status). error-executing An
        # internal error occurred while individual assessments ran (during the running status). invalid state
        # : The assessment run is in an unknown state. passed : All individual assessments have completed and
        # none have a failed status. provisioning : The resources required to run individual assessments are
        # being provisioned. running : Individual assessments are being run. starting : The assessment run is
        # starting, but resources are not yet being provisioned for individual assessments. warning : At least
        # one individual assessment completed with a warning status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @assessment_progress : Types::ReplicationTaskAssessmentRunProgress? = nil,
          @fail_on_assessment_failure : Bool? = nil,
          @last_failure_message : String? = nil,
          @premigration_assessment_run_arn : String? = nil,
          @premigration_assessment_run_creation_date : Time? = nil,
          @result_encryption_mode : String? = nil,
          @result_kms_key_arn : String? = nil,
          @result_location_bucket : String? = nil,
          @result_location_folder : String? = nil,
          @result_statistic : Types::ReplicationTaskAssessmentRunResultStatistic? = nil,
          @status : String? = nil
        )
        end
      end

      # The database object that the schema conversion operation currently uses.

      struct ProcessedObject
        include JSON::Serializable

        # The type of the data provider. This parameter can store one of the following values: "SOURCE" or
        # "TARGET" .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The name of the database object.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of the database object. For example, a table, view, procedure, and so on.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @endpoint_type : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides information about the progress of the schema conversion operation.

      struct Progress
        include JSON::Serializable

        # The name of the database object that the schema conversion operation currently uses.

        @[JSON::Field(key: "ProcessedObject")]
        getter processed_object : Types::ProcessedObject?

        # The percent complete for the current step of the schema conversion operation.

        @[JSON::Field(key: "ProgressPercent")]
        getter progress_percent : Float64?

        # The step of the schema conversion operation. This parameter can store one of the following values:
        # IN_PROGRESS – The operation is running. LOADING_METADATA – Loads metadata from the source database.
        # COUNTING_OBJECTS – Determines the number of objects involved in the operation. ANALYZING – Analyzes
        # the source database objects. CONVERTING – Converts the source database objects to a format
        # compatible with the target database. APPLYING – Applies the converted code to the target database.
        # FINISHED – The operation completed successfully.

        @[JSON::Field(key: "ProgressStep")]
        getter progress_step : String?

        # The number of objects in this schema conversion operation.

        @[JSON::Field(key: "TotalObjects")]
        getter total_objects : Int64?

        def initialize(
          @processed_object : Types::ProcessedObject? = nil,
          @progress_percent : Float64? = nil,
          @progress_step : String? = nil,
          @total_objects : Int64? = nil
        )
        end
      end

      # Information about provisioning resources for an DMS serverless replication.

      struct ProvisionData
        include JSON::Serializable

        # The timestamp when provisioning became available.

        @[JSON::Field(key: "DateNewProvisioningDataAvailable", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_new_provisioning_data_available : Time?

        # The timestamp when DMS provisioned replication resources.

        @[JSON::Field(key: "DateProvisioned", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_provisioned : Time?

        # Whether the new provisioning is available to the replication.

        @[JSON::Field(key: "IsNewProvisioningAvailable")]
        getter is_new_provisioning_available : Bool?

        # The current provisioning state

        @[JSON::Field(key: "ProvisionState")]
        getter provision_state : String?

        # The number of capacity units the replication is using.

        @[JSON::Field(key: "ProvisionedCapacityUnits")]
        getter provisioned_capacity_units : Int32?

        # A message describing the reason that DMS provisioned new resources for the serverless replication.

        @[JSON::Field(key: "ReasonForNewProvisioningData")]
        getter reason_for_new_provisioning_data : String?

        def initialize(
          @date_new_provisioning_data_available : Time? = nil,
          @date_provisioned : Time? = nil,
          @is_new_provisioning_available : Bool? = nil,
          @provision_state : String? = nil,
          @provisioned_capacity_units : Int32? = nil,
          @reason_for_new_provisioning_data : String? = nil
        )
        end
      end

      # Provides information that describes the configuration of the recommended target engine on Amazon
      # RDS.

      struct RdsConfiguration
        include JSON::Serializable

        # Describes the deployment option for the recommended Amazon RDS DB instance. The deployment options
        # include Multi-AZ and Single-AZ deployments. Valid values include "MULTI_AZ" and "SINGLE_AZ" .

        @[JSON::Field(key: "DeploymentOption")]
        getter deployment_option : String?

        # Describes the recommended target Amazon RDS engine edition.

        @[JSON::Field(key: "EngineEdition")]
        getter engine_edition : String?

        # Describes the recommended target Amazon RDS engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Describes the memory on the recommended Amazon RDS DB instance that meets your requirements.

        @[JSON::Field(key: "InstanceMemory")]
        getter instance_memory : Float64?

        # Describes the recommended target Amazon RDS instance type.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # Describes the number of virtual CPUs (vCPU) on the recommended Amazon RDS DB instance that meets
        # your requirements.

        @[JSON::Field(key: "InstanceVcpu")]
        getter instance_vcpu : Float64?

        # Describes the number of I/O operations completed each second (IOPS) on the recommended Amazon RDS DB
        # instance that meets your requirements.

        @[JSON::Field(key: "StorageIops")]
        getter storage_iops : Int32?

        # Describes the storage size of the recommended Amazon RDS DB instance that meets your requirements.

        @[JSON::Field(key: "StorageSize")]
        getter storage_size : Int32?

        # Describes the storage type of the recommended Amazon RDS DB instance that meets your requirements.
        # Amazon RDS provides three storage types: General Purpose SSD (also known as gp2 and gp3),
        # Provisioned IOPS SSD (also known as io1), and magnetic (also known as standard).

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        def initialize(
          @deployment_option : String? = nil,
          @engine_edition : String? = nil,
          @engine_version : String? = nil,
          @instance_memory : Float64? = nil,
          @instance_type : String? = nil,
          @instance_vcpu : Float64? = nil,
          @storage_iops : Int32? = nil,
          @storage_size : Int32? = nil,
          @storage_type : String? = nil
        )
        end
      end

      # Provides information that describes a recommendation of a target engine on Amazon RDS.

      struct RdsRecommendation
        include JSON::Serializable

        # Supplemental information about the requirements to the recommended target database on Amazon RDS.

        @[JSON::Field(key: "RequirementsToTarget")]
        getter requirements_to_target : Types::RdsRequirements?

        # Supplemental information about the configuration of the recommended target database on Amazon RDS.

        @[JSON::Field(key: "TargetConfiguration")]
        getter target_configuration : Types::RdsConfiguration?

        def initialize(
          @requirements_to_target : Types::RdsRequirements? = nil,
          @target_configuration : Types::RdsConfiguration? = nil
        )
        end
      end

      # Provides information that describes the requirements to the target engine on Amazon RDS.

      struct RdsRequirements
        include JSON::Serializable

        # The required deployment option for the Amazon RDS DB instance. Valid values include "MULTI_AZ" for
        # Multi-AZ deployments and "SINGLE_AZ" for Single-AZ deployments.

        @[JSON::Field(key: "DeploymentOption")]
        getter deployment_option : String?

        # The required target Amazon RDS engine edition.

        @[JSON::Field(key: "EngineEdition")]
        getter engine_edition : String?

        # The required target Amazon RDS engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The required memory on the Amazon RDS DB instance.

        @[JSON::Field(key: "InstanceMemory")]
        getter instance_memory : Float64?

        # The required number of virtual CPUs (vCPU) on the Amazon RDS DB instance.

        @[JSON::Field(key: "InstanceVcpu")]
        getter instance_vcpu : Float64?

        # The required number of I/O operations completed each second (IOPS) on your Amazon RDS DB instance.

        @[JSON::Field(key: "StorageIops")]
        getter storage_iops : Int32?

        # The required Amazon RDS DB instance storage size.

        @[JSON::Field(key: "StorageSize")]
        getter storage_size : Int32?

        def initialize(
          @deployment_option : String? = nil,
          @engine_edition : String? = nil,
          @engine_version : String? = nil,
          @instance_memory : Float64? = nil,
          @instance_vcpu : Float64? = nil,
          @storage_iops : Int32? = nil,
          @storage_size : Int32? = nil
        )
        end
      end


      struct RebootReplicationInstanceMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String

        # If this parameter is true , the reboot is conducted through a Multi-AZ failover. If the instance
        # isn't configured for Multi-AZ, then you can't specify true . ( --force-planned-failover and
        # --force-failover can't both be set to true .)

        @[JSON::Field(key: "ForceFailover")]
        getter force_failover : Bool?

        # If this parameter is true , the reboot is conducted through a planned Multi-AZ failover where
        # resources are released and cleaned up prior to conducting the failover. If the instance isn''t
        # configured for Multi-AZ, then you can't specify true . ( --force-planned-failover and
        # --force-failover can't both be set to true .)

        @[JSON::Field(key: "ForcePlannedFailover")]
        getter force_planned_failover : Bool?

        def initialize(
          @replication_instance_arn : String,
          @force_failover : Bool? = nil,
          @force_planned_failover : Bool? = nil
        )
        end
      end


      struct RebootReplicationInstanceResponse
        include JSON::Serializable

        # The replication instance that is being rebooted.

        @[JSON::Field(key: "ReplicationInstance")]
        getter replication_instance : Types::ReplicationInstance?

        def initialize(
          @replication_instance : Types::ReplicationInstance? = nil
        )
        end
      end

      # Provides information that describes a recommendation of a target engine. A recommendation is a set
      # of possible Amazon Web Services target engines that you can choose to migrate your source
      # on-premises database. In this set, Fleet Advisor suggests a single target engine as the right sized
      # migration destination. To determine this rightsized migration destination, Fleet Advisor uses the
      # inventory metadata and metrics from data collector. You can use recommendations before the start of
      # migration to save costs and reduce risks. With recommendations, you can explore different target
      # options and compare metrics, so you can make an informed decision when you choose the migration
      # target.

      struct Recommendation
        include JSON::Serializable

        # The date when Fleet Advisor created the target engine recommendation.

        @[JSON::Field(key: "CreatedDate")]
        getter created_date : String?

        # The recommendation of a target engine for the specified source database.

        @[JSON::Field(key: "Data")]
        getter data : Types::RecommendationData?

        # The identifier of the source database for which Fleet Advisor provided this recommendation.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String?

        # The name of the target engine. Valid values include "rds-aurora-mysql" , "rds-aurora-postgresql" ,
        # "rds-mysql" , "rds-oracle" , "rds-sql-server" , and "rds-postgresql" .

        @[JSON::Field(key: "EngineName")]
        getter engine_name : String?

        # Indicates that this target is the rightsized migration destination.

        @[JSON::Field(key: "Preferred")]
        getter preferred : Bool?

        # The settings in JSON format for the preferred target engine parameters. These parameters include
        # capacity, resource utilization, and the usage type (production, development, or testing).

        @[JSON::Field(key: "Settings")]
        getter settings : Types::RecommendationSettings?

        # The status of the target engine recommendation. Valid values include "alternate" , "in-progress" ,
        # "not-viable" , and "recommended" .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_date : String? = nil,
          @data : Types::RecommendationData? = nil,
          @database_id : String? = nil,
          @engine_name : String? = nil,
          @preferred : Bool? = nil,
          @settings : Types::RecommendationSettings? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides information about the target engine for the specified source database.

      struct RecommendationData
        include JSON::Serializable

        # The recommendation of a target Amazon RDS database engine.

        @[JSON::Field(key: "RdsEngine")]
        getter rds_engine : Types::RdsRecommendation?

        def initialize(
          @rds_engine : Types::RdsRecommendation? = nil
        )
        end
      end

      # Provides information about the required target engine settings.

      struct RecommendationSettings
        include JSON::Serializable

        # The size of your target instance. Fleet Advisor calculates this value based on your data collection
        # type, such as total capacity and resource utilization. Valid values include "total-capacity" and
        # "utilization" .

        @[JSON::Field(key: "InstanceSizingType")]
        getter instance_sizing_type : String

        # The deployment option for your target engine. For production databases, Fleet Advisor chooses
        # Multi-AZ deployment. For development or test databases, Fleet Advisor chooses Single-AZ deployment.
        # Valid values include "development" and "production" .

        @[JSON::Field(key: "WorkloadType")]
        getter workload_type : String

        def initialize(
          @instance_sizing_type : String,
          @workload_type : String
        )
        end
      end

      # Provides information that defines a Redis target endpoint.

      struct RedisSettings
        include JSON::Serializable

        # Transmission Control Protocol (TCP) port for the endpoint.

        @[JSON::Field(key: "Port")]
        getter port : Int32

        # Fully qualified domain name of the endpoint.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String

        # The password provided with the auth-role and auth-token options of the AuthType setting for a Redis
        # target endpoint.

        @[JSON::Field(key: "AuthPassword")]
        getter auth_password : String?

        # The type of authentication to perform when connecting to a Redis target. Options include none ,
        # auth-token , and auth-role . The auth-token option requires an AuthPassword value to be provided.
        # The auth-role option requires AuthUserName and AuthPassword values to be provided.

        @[JSON::Field(key: "AuthType")]
        getter auth_type : String?

        # The user name provided with the auth-role option of the AuthType setting for a Redis target
        # endpoint.

        @[JSON::Field(key: "AuthUserName")]
        getter auth_user_name : String?

        # The Amazon Resource Name (ARN) for the certificate authority (CA) that DMS uses to connect to your
        # Redis target endpoint.

        @[JSON::Field(key: "SslCaCertificateArn")]
        getter ssl_ca_certificate_arn : String?

        # The connection to a Redis target endpoint using Transport Layer Security (TLS). Valid values include
        # plaintext and ssl-encryption . The default is ssl-encryption . The ssl-encryption option makes an
        # encrypted connection. Optionally, you can identify an Amazon Resource Name (ARN) for an SSL
        # certificate authority (CA) using the SslCaCertificateArn setting. If an ARN isn't given for a CA,
        # DMS uses the Amazon root CA. The plaintext option doesn't provide Transport Layer Security (TLS)
        # encryption for traffic between endpoint and database.

        @[JSON::Field(key: "SslSecurityProtocol")]
        getter ssl_security_protocol : String?

        def initialize(
          @port : Int32,
          @server_name : String,
          @auth_password : String? = nil,
          @auth_type : String? = nil,
          @auth_user_name : String? = nil,
          @ssl_ca_certificate_arn : String? = nil,
          @ssl_security_protocol : String? = nil
        )
        end
      end

      # Provides information that defines an Amazon Redshift data provider.

      struct RedshiftDataProviderSettings
        include JSON::Serializable

        # The database name on the Amazon Redshift data provider.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The port value for the Amazon Redshift data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The ARN for the role the application uses to access its Amazon S3 bucket.

        @[JSON::Field(key: "S3AccessRoleArn")]
        getter s3_access_role_arn : String?

        # The path for the Amazon S3 bucket that the application uses for accessing the user-defined schema.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The name of the Amazon Redshift server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        def initialize(
          @database_name : String? = nil,
          @port : Int32? = nil,
          @s3_access_role_arn : String? = nil,
          @s3_path : String? = nil,
          @server_name : String? = nil
        )
        end
      end

      # Provides information that defines an Amazon Redshift endpoint.

      struct RedshiftSettings
        include JSON::Serializable

        # A value that indicates to allow any date format, including invalid formats such as 00/00/00
        # 00:00:00, to be loaded without generating an error. You can choose true or false (the default). This
        # parameter applies only to TIMESTAMP and DATE columns. Always use ACCEPTANYDATE with the DATEFORMAT
        # parameter. If the date format for the data doesn't match the DATEFORMAT specification, Amazon
        # Redshift inserts a NULL value into that field.

        @[JSON::Field(key: "AcceptAnyDate")]
        getter accept_any_date : Bool?

        # Code to run after connecting. This parameter should contain the code itself, not the name of a file
        # containing the code.

        @[JSON::Field(key: "AfterConnectScript")]
        getter after_connect_script : String?

        # An S3 folder where the comma-separated-value (.csv) files are stored before being uploaded to the
        # target Redshift cluster. For full load mode, DMS converts source records into .csv files and loads
        # them to the BucketFolder/TableID path. DMS uses the Redshift COPY command to upload the .csv files
        # to the target table. The files are deleted once the COPY operation has finished. For more
        # information, see COPY in the Amazon Redshift Database Developer Guide . For change-data-capture
        # (CDC) mode, DMS creates a NetChanges table, and loads the .csv files to this
        # BucketFolder/NetChangesTableID path.

        @[JSON::Field(key: "BucketFolder")]
        getter bucket_folder : String?

        # The name of the intermediate S3 bucket used to store .csv files before uploading data to Redshift.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # If Amazon Redshift is configured to support case sensitive schema names, set CaseSensitiveNames to
        # true . The default is false .

        @[JSON::Field(key: "CaseSensitiveNames")]
        getter case_sensitive_names : Bool?

        # If you set CompUpdate to true Amazon Redshift applies automatic compression if the table is empty.
        # This applies even if the table columns already have encodings other than RAW . If you set CompUpdate
        # to false , automatic compression is disabled and existing column encodings aren't changed. The
        # default is true .

        @[JSON::Field(key: "CompUpdate")]
        getter comp_update : Bool?

        # A value that sets the amount of time to wait (in milliseconds) before timing out, beginning from
        # when you initially establish a connection.

        @[JSON::Field(key: "ConnectionTimeout")]
        getter connection_timeout : Int32?

        # The name of the Amazon Redshift data warehouse (service) that you are working with.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The date format that you are using. Valid values are auto (case-sensitive), your date format string
        # enclosed in quotes, or NULL. If this parameter is left unset (NULL), it defaults to a format of
        # 'YYYY-MM-DD'. Using auto recognizes most strings, even some that aren't supported when you use a
        # date format string. If your date and time values use formats different from each other, set this to
        # auto .

        @[JSON::Field(key: "DateFormat")]
        getter date_format : String?

        # A value that specifies whether DMS should migrate empty CHAR and VARCHAR fields as NULL. A value of
        # true sets empty CHAR and VARCHAR fields to null. The default is false .

        @[JSON::Field(key: "EmptyAsNull")]
        getter empty_as_null : Bool?

        # The type of server-side encryption that you want to use for your data. This encryption type is part
        # of the endpoint settings or the extra connections attributes for Amazon S3. You can choose either
        # SSE_S3 (the default) or SSE_KMS . For the ModifyEndpoint operation, you can change the existing
        # value of the EncryptionMode parameter from SSE_KMS to SSE_S3 . But you can’t change the existing
        # value from SSE_S3 to SSE_KMS . To use SSE_S3 , create an Identity and Access Management (IAM) role
        # with a policy that allows "arn:aws:s3:::*" to use the following actions: "s3:PutObject",
        # "s3:ListBucket"

        @[JSON::Field(key: "EncryptionMode")]
        getter encryption_mode : String?

        # This setting is only valid for a full-load migration task. Set ExplicitIds to true to have tables
        # with IDENTITY columns override their auto-generated values with explicit values loaded from the
        # source data files used to populate the tables. The default is false .

        @[JSON::Field(key: "ExplicitIds")]
        getter explicit_ids : Bool?

        # The number of threads used to upload a single file. This parameter accepts a value from 1 through
        # 64. It defaults to 10. The number of parallel streams used to upload a single .csv file to an S3
        # bucket using S3 Multipart Upload. For more information, see Multipart upload overview .
        # FileTransferUploadStreams accepts a value from 1 through 64. It defaults to 10.

        @[JSON::Field(key: "FileTransferUploadStreams")]
        getter file_transfer_upload_streams : Int32?

        # The amount of time to wait (in milliseconds) before timing out of operations performed by DMS on a
        # Redshift cluster, such as Redshift COPY, INSERT, DELETE, and UPDATE.

        @[JSON::Field(key: "LoadTimeout")]
        getter load_timeout : Int32?

        # When true, lets Redshift migrate the boolean type as boolean. By default, Redshift migrates booleans
        # as varchar(1) . You must set this setting on both the source and target endpoints for it to take
        # effect.

        @[JSON::Field(key: "MapBooleanAsBoolean")]
        getter map_boolean_as_boolean : Bool?

        # The maximum size (in KB) of any .csv file used to load data on an S3 bucket and transfer data to
        # Amazon Redshift. It defaults to 1048576KB (1 GB).

        @[JSON::Field(key: "MaxFileSize")]
        getter max_file_size : Int32?

        # The password for the user named in the username property.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The port number for Amazon Redshift. The default value is 5439.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # A value that specifies to remove surrounding quotation marks from strings in the incoming data. All
        # characters within the quotation marks, including delimiters, are retained. Choose true to remove
        # quotation marks. The default is false .

        @[JSON::Field(key: "RemoveQuotes")]
        getter remove_quotes : Bool?

        # A value that specifies to replaces the invalid characters specified in ReplaceInvalidChars ,
        # substituting the specified characters instead. The default is "?" .

        @[JSON::Field(key: "ReplaceChars")]
        getter replace_chars : String?

        # A list of characters that you want to replace. Use with ReplaceChars .

        @[JSON::Field(key: "ReplaceInvalidChars")]
        getter replace_invalid_chars : String?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret . The role must allow
        # the iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets
        # Manager secret that allows access to the Amazon Redshift endpoint. You can specify one of two sets
        # of values for these permissions. You can specify the values for this setting and
        # SecretsManagerSecretId . Or you can specify clear-text values for UserName , Password , ServerName ,
        # and Port . You can't specify both. For more information on creating this SecretsManagerSecret and
        # the SecretsManagerAccessRoleArn and SecretsManagerSecretId required to access it, see Using secrets
        # to access Database Migration Service resources in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the Amazon
        # Redshift endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # The name of the Amazon Redshift cluster you are using.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The KMS key ID. If you are using SSE_KMS for the EncryptionMode , provide this key ID. The key that
        # you use needs an attached policy that enables IAM user permissions and allows use of the key.

        @[JSON::Field(key: "ServerSideEncryptionKmsKeyId")]
        getter server_side_encryption_kms_key_id : String?

        # The Amazon Resource Name (ARN) of the IAM role that has access to the Amazon Redshift service. The
        # role must allow the iam:PassRole action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # The time format that you want to use. Valid values are auto (case-sensitive), 'timeformat_string' ,
        # 'epochsecs' , or 'epochmillisecs' . It defaults to 10. Using auto recognizes most strings, even some
        # that aren't supported when you use a time format string. If your date and time values use formats
        # different from each other, set this parameter to auto .

        @[JSON::Field(key: "TimeFormat")]
        getter time_format : String?

        # A value that specifies to remove the trailing white space characters from a VARCHAR string. This
        # parameter applies only to columns with a VARCHAR data type. Choose true to remove unneeded white
        # space. The default is false .

        @[JSON::Field(key: "TrimBlanks")]
        getter trim_blanks : Bool?

        # A value that specifies to truncate data in columns to the appropriate number of characters, so that
        # the data fits in the column. This parameter applies only to columns with a VARCHAR or CHAR data
        # type, and rows with a size of 4 MB or less. Choose true to truncate data. The default is false .

        @[JSON::Field(key: "TruncateColumns")]
        getter truncate_columns : Bool?

        # An Amazon Redshift user name for a registered user.

        @[JSON::Field(key: "Username")]
        getter username : String?

        # The size (in KB) of the in-memory file write buffer used when generating .csv files on the local
        # disk at the DMS replication instance. The default value is 1000 (buffer size is 1000KB).

        @[JSON::Field(key: "WriteBufferSize")]
        getter write_buffer_size : Int32?

        def initialize(
          @accept_any_date : Bool? = nil,
          @after_connect_script : String? = nil,
          @bucket_folder : String? = nil,
          @bucket_name : String? = nil,
          @case_sensitive_names : Bool? = nil,
          @comp_update : Bool? = nil,
          @connection_timeout : Int32? = nil,
          @database_name : String? = nil,
          @date_format : String? = nil,
          @empty_as_null : Bool? = nil,
          @encryption_mode : String? = nil,
          @explicit_ids : Bool? = nil,
          @file_transfer_upload_streams : Int32? = nil,
          @load_timeout : Int32? = nil,
          @map_boolean_as_boolean : Bool? = nil,
          @max_file_size : Int32? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @remove_quotes : Bool? = nil,
          @replace_chars : String? = nil,
          @replace_invalid_chars : String? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @server_name : String? = nil,
          @server_side_encryption_kms_key_id : String? = nil,
          @service_access_role_arn : String? = nil,
          @time_format : String? = nil,
          @trim_blanks : Bool? = nil,
          @truncate_columns : Bool? = nil,
          @username : String? = nil,
          @write_buffer_size : Int32? = nil
        )
        end
      end


      struct RefreshSchemasMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String

        def initialize(
          @endpoint_arn : String,
          @replication_instance_arn : String
        )
        end
      end


      struct RefreshSchemasResponse
        include JSON::Serializable

        # The status of the refreshed schema.

        @[JSON::Field(key: "RefreshSchemasStatus")]
        getter refresh_schemas_status : Types::RefreshSchemasStatus?

        def initialize(
          @refresh_schemas_status : Types::RefreshSchemasStatus? = nil
        )
        end
      end

      # Provides information that describes status of a schema at an endpoint specified by the
      # DescribeRefreshSchemaStatus operation.

      struct RefreshSchemasStatus
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        # The last failure message for the schema.

        @[JSON::Field(key: "LastFailureMessage")]
        getter last_failure_message : String?

        # The date the schema was last refreshed.

        @[JSON::Field(key: "LastRefreshDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_date : Time?

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String?

        # The status of the schema.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @endpoint_arn : String? = nil,
          @last_failure_message : String? = nil,
          @last_refresh_date : Time? = nil,
          @replication_instance_arn : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ReloadReplicationTablesMessage
        include JSON::Serializable

        # The Amazon Resource Name of the replication config for which to reload tables.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String

        # The list of tables to reload.

        @[JSON::Field(key: "TablesToReload")]
        getter tables_to_reload : Array(Types::TableToReload)

        # Options for reload. Specify data-reload to reload the data and re-validate it if validation is
        # enabled. Specify validate-only to re-validate the table. This option applies only when validation is
        # enabled for the replication.

        @[JSON::Field(key: "ReloadOption")]
        getter reload_option : String?

        def initialize(
          @replication_config_arn : String,
          @tables_to_reload : Array(Types::TableToReload),
          @reload_option : String? = nil
        )
        end
      end


      struct ReloadReplicationTablesResponse
        include JSON::Serializable

        # The Amazon Resource Name of the replication config for which to reload tables.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String?

        def initialize(
          @replication_config_arn : String? = nil
        )
        end
      end


      struct ReloadTablesMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication task.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String

        # The name and schema of the table to be reloaded.

        @[JSON::Field(key: "TablesToReload")]
        getter tables_to_reload : Array(Types::TableToReload)

        # Options for reload. Specify data-reload to reload the data and re-validate it if validation is
        # enabled. Specify validate-only to re-validate the table. This option applies only when validation is
        # enabled for the task. Valid values: data-reload, validate-only Default value is data-reload.

        @[JSON::Field(key: "ReloadOption")]
        getter reload_option : String?

        def initialize(
          @replication_task_arn : String,
          @tables_to_reload : Array(Types::TableToReload),
          @reload_option : String? = nil
        )
        end
      end


      struct ReloadTablesResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication task.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String?

        def initialize(
          @replication_task_arn : String? = nil
        )
        end
      end

      # Removes one or more tags from an DMS resource.

      struct RemoveTagsFromResourceMessage
        include JSON::Serializable

        # An DMS resource from which you want to remove tag(s). The value for this parameter is an Amazon
        # Resource Name (ARN).

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag key (name) of the tag to be removed.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct RemoveTagsFromResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information that describes a serverless replication created by the CreateReplication
      # operation.

      struct Replication
        include JSON::Serializable

        # Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or
        # CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results
        # in an error.

        @[JSON::Field(key: "CdcStartPosition")]
        getter cdc_start_position : String?

        # Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or
        # CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results
        # in an error.

        @[JSON::Field(key: "CdcStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cdc_start_time : Time?

        # Indicates when you want a change data capture (CDC) operation to stop. The value can be either
        # server time or commit time.

        @[JSON::Field(key: "CdcStopPosition")]
        getter cdc_stop_position : String?

        # Error and other information about why a serverless replication failed.

        @[JSON::Field(key: "FailureMessages")]
        getter failure_messages : Array(String)?

        # Indicates whether the serverless replication is read-only. When set to true , this replication is
        # managed by DMS as part of a zero-ETL integration and cannot be modified or deleted directly. You can
        # only modify or delete read-only replications through their associated zero-ETL integration.

        @[JSON::Field(key: "IsReadOnly")]
        getter is_read_only : Bool?

        # The status output of premigration assessment in describe-replications.

        @[JSON::Field(key: "PremigrationAssessmentStatuses")]
        getter premigration_assessment_statuses : Array(Types::PremigrationAssessmentStatus)?

        # Information about provisioning resources for an DMS serverless replication.

        @[JSON::Field(key: "ProvisionData")]
        getter provision_data : Types::ProvisionData?

        # Indicates the last checkpoint that occurred during a change data capture (CDC) operation. You can
        # provide this value to the CdcStartPosition parameter to start a CDC operation that begins at that
        # checkpoint.

        @[JSON::Field(key: "RecoveryCheckpoint")]
        getter recovery_checkpoint : String?

        # The Amazon Resource Name for the ReplicationConfig associated with the replication.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String?

        # The identifier for the ReplicationConfig associated with the replication.

        @[JSON::Field(key: "ReplicationConfigIdentifier")]
        getter replication_config_identifier : String?

        # The time the serverless replication was created.

        @[JSON::Field(key: "ReplicationCreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_create_time : Time?

        # The timestamp when DMS will deprovision the replication.

        @[JSON::Field(key: "ReplicationDeprovisionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_deprovision_time : Time?

        # The timestamp when replication was last stopped.

        @[JSON::Field(key: "ReplicationLastStopTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_last_stop_time : Time?

        # This object provides a collection of statistics about a serverless replication.

        @[JSON::Field(key: "ReplicationStats")]
        getter replication_stats : Types::ReplicationStats?

        # The type of the serverless replication.

        @[JSON::Field(key: "ReplicationType")]
        getter replication_type : String?

        # The time the serverless replication was updated.

        @[JSON::Field(key: "ReplicationUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_update_time : Time?

        # The Amazon Resource Name for an existing Endpoint the serverless replication uses for its data
        # source.

        @[JSON::Field(key: "SourceEndpointArn")]
        getter source_endpoint_arn : String?

        # The type of replication to start.

        @[JSON::Field(key: "StartReplicationType")]
        getter start_replication_type : String?

        # The current status of the serverless replication.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason the replication task was stopped. This response parameter can return one of the following
        # values: "Stop Reason NORMAL" "Stop Reason RECOVERABLE_ERROR" "Stop Reason FATAL_ERROR" "Stop Reason
        # FULL_LOAD_ONLY_FINISHED" "Stop Reason STOPPED_AFTER_FULL_LOAD" – Full load completed, with cached
        # changes not applied "Stop Reason STOPPED_AFTER_CACHED_EVENTS" – Full load completed, with cached
        # changes applied "Stop Reason EXPRESS_LICENSE_LIMITS_REACHED" "Stop Reason STOPPED_AFTER_DDL_APPLY" –
        # User-defined stop task after DDL applied "Stop Reason STOPPED_DUE_TO_LOW_MEMORY" "Stop Reason
        # STOPPED_DUE_TO_LOW_DISK" "Stop Reason STOPPED_AT_SERVER_TIME" – User-defined server time for
        # stopping task "Stop Reason STOPPED_AT_COMMIT_TIME" – User-defined commit time for stopping task
        # "Stop Reason RECONFIGURATION_RESTART" "Stop Reason RECYCLE_TASK"

        @[JSON::Field(key: "StopReason")]
        getter stop_reason : String?

        # The Amazon Resource Name for an existing Endpoint the serverless replication uses for its data
        # target.

        @[JSON::Field(key: "TargetEndpointArn")]
        getter target_endpoint_arn : String?

        def initialize(
          @cdc_start_position : String? = nil,
          @cdc_start_time : Time? = nil,
          @cdc_stop_position : String? = nil,
          @failure_messages : Array(String)? = nil,
          @is_read_only : Bool? = nil,
          @premigration_assessment_statuses : Array(Types::PremigrationAssessmentStatus)? = nil,
          @provision_data : Types::ProvisionData? = nil,
          @recovery_checkpoint : String? = nil,
          @replication_config_arn : String? = nil,
          @replication_config_identifier : String? = nil,
          @replication_create_time : Time? = nil,
          @replication_deprovision_time : Time? = nil,
          @replication_last_stop_time : Time? = nil,
          @replication_stats : Types::ReplicationStats? = nil,
          @replication_type : String? = nil,
          @replication_update_time : Time? = nil,
          @source_endpoint_arn : String? = nil,
          @start_replication_type : String? = nil,
          @status : String? = nil,
          @stop_reason : String? = nil,
          @target_endpoint_arn : String? = nil
        )
        end
      end

      # This object provides configuration information about a serverless replication.

      struct ReplicationConfig
        include JSON::Serializable

        # Configuration parameters for provisioning an DMS serverless replication.

        @[JSON::Field(key: "ComputeConfig")]
        getter compute_config : Types::ComputeConfig?

        # Indicates whether the replication configuration is read-only. When set to true , this replication
        # configuration is managed by DMS as part of a zero-ETL integration and cannot be modified or deleted
        # directly. You can only modify or delete read-only replication configurations through their
        # associated zero-ETL integration.

        @[JSON::Field(key: "IsReadOnly")]
        getter is_read_only : Bool?

        # The Amazon Resource Name (ARN) of this DMS Serverless replication configuration.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String?

        # The time the serverless replication config was created.

        @[JSON::Field(key: "ReplicationConfigCreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_config_create_time : Time?

        # The identifier for the ReplicationConfig associated with the replication.

        @[JSON::Field(key: "ReplicationConfigIdentifier")]
        getter replication_config_identifier : String?

        # The time the serverless replication config was updated.

        @[JSON::Field(key: "ReplicationConfigUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_config_update_time : Time?

        # Configuration parameters for an DMS serverless replication.

        @[JSON::Field(key: "ReplicationSettings")]
        getter replication_settings : String?

        # The type of the replication.

        @[JSON::Field(key: "ReplicationType")]
        getter replication_type : String?

        # The Amazon Resource Name (ARN) of the source endpoint for this DMS serverless replication
        # configuration.

        @[JSON::Field(key: "SourceEndpointArn")]
        getter source_endpoint_arn : String?

        # Additional parameters for an DMS serverless replication.

        @[JSON::Field(key: "SupplementalSettings")]
        getter supplemental_settings : String?

        # Table mappings specified in the replication.

        @[JSON::Field(key: "TableMappings")]
        getter table_mappings : String?

        # The Amazon Resource Name (ARN) of the target endpoint for this DMS serverless replication
        # configuration.

        @[JSON::Field(key: "TargetEndpointArn")]
        getter target_endpoint_arn : String?

        def initialize(
          @compute_config : Types::ComputeConfig? = nil,
          @is_read_only : Bool? = nil,
          @replication_config_arn : String? = nil,
          @replication_config_create_time : Time? = nil,
          @replication_config_identifier : String? = nil,
          @replication_config_update_time : Time? = nil,
          @replication_settings : String? = nil,
          @replication_type : String? = nil,
          @source_endpoint_arn : String? = nil,
          @supplemental_settings : String? = nil,
          @table_mappings : String? = nil,
          @target_endpoint_arn : String? = nil
        )
        end
      end

      # Provides information that defines a replication instance.

      struct ReplicationInstance
        include JSON::Serializable

        # The amount of storage (in gigabytes) that is allocated for the replication instance.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # Boolean value indicating if minor version upgrades will be automatically applied to the instance.

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # The Availability Zone for the instance.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The DNS name servers supported for the replication instance to access your on-premise source or
        # target database.

        @[JSON::Field(key: "DnsNameServers")]
        getter dns_name_servers : String?

        # The engine version number of the replication instance. If an engine version number is not specified
        # when a replication instance is created, the default is the latest engine version available. When
        # modifying a major engine version of an instance, also set AllowMajorVersionUpgrade to true .

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The expiration date of the free replication instance that is part of the Free DMS program.

        @[JSON::Field(key: "FreeUntil", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter free_until : Time?

        # The time the replication instance was created.

        @[JSON::Field(key: "InstanceCreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter instance_create_time : Time?

        # Specifies the settings required for kerberos authentication when replicating an instance.

        @[JSON::Field(key: "KerberosAuthenticationSettings")]
        getter kerberos_authentication_settings : Types::KerberosAuthenticationSettings?

        # An KMS key identifier that is used to encrypt the data on the replication instance. If you don't
        # specify a value for the KmsKeyId parameter, then DMS uses your default encryption key. KMS creates
        # the default encryption key for your Amazon Web Services account. Your Amazon Web Services account
        # has a different default encryption key for each Amazon Web Services Region.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies whether the replication instance is a Multi-AZ deployment. You can't set the
        # AvailabilityZone parameter if the Multi-AZ parameter is set to true .

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The type of IP address protocol used by a replication instance, such as IPv4 only or Dual-stack that
        # supports both IPv4 and IPv6 addressing. IPv6 only is not yet supported.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The pending modification values.

        @[JSON::Field(key: "PendingModifiedValues")]
        getter pending_modified_values : Types::ReplicationPendingModifiedValues?

        # The maintenance window times for the replication instance. Any pending upgrades to the replication
        # instance are performed during this time.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Specifies the accessibility options for the replication instance. A value of true represents an
        # instance with a public IP address. A value of false represents an instance with a private IP
        # address. The default value is true .

        @[JSON::Field(key: "PubliclyAccessible")]
        getter publicly_accessible : Bool?

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String?

        # The compute and memory capacity of the replication instance as defined for the specified replication
        # instance class. It is a required parameter, although a default value is pre-selected in the DMS
        # console. For more information on the settings and capacities for the available replication instance
        # classes, see Selecting the right DMS replication instance for your migration .

        @[JSON::Field(key: "ReplicationInstanceClass")]
        getter replication_instance_class : String?

        # The replication instance identifier is a required parameter. This parameter is stored as a lowercase
        # string. Constraints: Must contain 1-63 alphanumeric characters or hyphens. First character must be a
        # letter. Cannot end with a hyphen or contain two consecutive hyphens. Example: myrepinstance

        @[JSON::Field(key: "ReplicationInstanceIdentifier")]
        getter replication_instance_identifier : String?

        # One or more IPv6 addresses for the replication instance.

        @[JSON::Field(key: "ReplicationInstanceIpv6Addresses")]
        getter replication_instance_ipv6_addresses : Array(String)?

        # The private IP address of the replication instance.

        @[JSON::Field(key: "ReplicationInstancePrivateIpAddress")]
        getter replication_instance_private_ip_address : String?

        # One or more private IP addresses for the replication instance.

        @[JSON::Field(key: "ReplicationInstancePrivateIpAddresses")]
        getter replication_instance_private_ip_addresses : Array(String)?

        # The public IP address of the replication instance.

        @[JSON::Field(key: "ReplicationInstancePublicIpAddress")]
        getter replication_instance_public_ip_address : String?

        # One or more public IP addresses for the replication instance.

        @[JSON::Field(key: "ReplicationInstancePublicIpAddresses")]
        getter replication_instance_public_ip_addresses : Array(String)?

        # The status of the replication instance. The possible return values include: "available" "creating"
        # "deleted" "deleting" "failed" "modifying" "upgrading" "rebooting" "resetting-master-credentials"
        # "storage-full" "incompatible-credentials" "incompatible-network" "maintenance"

        @[JSON::Field(key: "ReplicationInstanceStatus")]
        getter replication_instance_status : String?

        # The subnet group for the replication instance.

        @[JSON::Field(key: "ReplicationSubnetGroup")]
        getter replication_subnet_group : Types::ReplicationSubnetGroup?

        # The Availability Zone of the standby replication instance in a Multi-AZ deployment.

        @[JSON::Field(key: "SecondaryAvailabilityZone")]
        getter secondary_availability_zone : String?

        # The VPC security group for the instance.

        @[JSON::Field(key: "VpcSecurityGroups")]
        getter vpc_security_groups : Array(Types::VpcSecurityGroupMembership)?

        def initialize(
          @allocated_storage : Int32? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @availability_zone : String? = nil,
          @dns_name_servers : String? = nil,
          @engine_version : String? = nil,
          @free_until : Time? = nil,
          @instance_create_time : Time? = nil,
          @kerberos_authentication_settings : Types::KerberosAuthenticationSettings? = nil,
          @kms_key_id : String? = nil,
          @multi_az : Bool? = nil,
          @network_type : String? = nil,
          @pending_modified_values : Types::ReplicationPendingModifiedValues? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @replication_instance_arn : String? = nil,
          @replication_instance_class : String? = nil,
          @replication_instance_identifier : String? = nil,
          @replication_instance_ipv6_addresses : Array(String)? = nil,
          @replication_instance_private_ip_address : String? = nil,
          @replication_instance_private_ip_addresses : Array(String)? = nil,
          @replication_instance_public_ip_address : String? = nil,
          @replication_instance_public_ip_addresses : Array(String)? = nil,
          @replication_instance_status : String? = nil,
          @replication_subnet_group : Types::ReplicationSubnetGroup? = nil,
          @secondary_availability_zone : String? = nil,
          @vpc_security_groups : Array(Types::VpcSecurityGroupMembership)? = nil
        )
        end
      end

      # Contains metadata for a replication instance task log.

      struct ReplicationInstanceTaskLog
        include JSON::Serializable

        # The size, in bytes, of the replication task log.

        @[JSON::Field(key: "ReplicationInstanceTaskLogSize")]
        getter replication_instance_task_log_size : Int64?

        # The Amazon Resource Name (ARN) of the replication task.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String?

        # The name of the replication task.

        @[JSON::Field(key: "ReplicationTaskName")]
        getter replication_task_name : String?

        def initialize(
          @replication_instance_task_log_size : Int64? = nil,
          @replication_task_arn : String? = nil,
          @replication_task_name : String? = nil
        )
        end
      end

      # Provides information about the values of pending modifications to a replication instance. This data
      # type is an object of the ReplicationInstance user-defined data type.

      struct ReplicationPendingModifiedValues
        include JSON::Serializable

        # The amount of storage (in gigabytes) that is allocated for the replication instance.

        @[JSON::Field(key: "AllocatedStorage")]
        getter allocated_storage : Int32?

        # The engine version number of the replication instance.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Specifies whether the replication instance is a Multi-AZ deployment. You can't set the
        # AvailabilityZone parameter if the Multi-AZ parameter is set to true .

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool?

        # The type of IP address protocol used by a replication instance, such as IPv4 only or Dual-stack that
        # supports both IPv4 and IPv6 addressing. IPv6 only is not yet supported.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The compute and memory capacity of the replication instance as defined for the specified replication
        # instance class. For more information on the settings and capacities for the available replication
        # instance classes, see Selecting the right DMS replication instance for your migration .

        @[JSON::Field(key: "ReplicationInstanceClass")]
        getter replication_instance_class : String?

        def initialize(
          @allocated_storage : Int32? = nil,
          @engine_version : String? = nil,
          @multi_az : Bool? = nil,
          @network_type : String? = nil,
          @replication_instance_class : String? = nil
        )
        end
      end

      # This object provides a collection of statistics about a serverless replication.

      struct ReplicationStats
        include JSON::Serializable

        # The elapsed time of the replication, in milliseconds.

        @[JSON::Field(key: "ElapsedTimeMillis")]
        getter elapsed_time_millis : Int64?

        # The date the replication was started either with a fresh start or a target reload.

        @[JSON::Field(key: "FreshStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter fresh_start_date : Time?

        # The date the replication full load was finished.

        @[JSON::Field(key: "FullLoadFinishDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter full_load_finish_date : Time?

        # The percent complete for the full load serverless replication.

        @[JSON::Field(key: "FullLoadProgressPercent")]
        getter full_load_progress_percent : Int32?

        # The date the replication full load was started.

        @[JSON::Field(key: "FullLoadStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter full_load_start_date : Time?

        # The date the replication is scheduled to start.

        @[JSON::Field(key: "StartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        # The date the replication was stopped.

        @[JSON::Field(key: "StopDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_date : Time?

        # The number of errors that have occured for this replication.

        @[JSON::Field(key: "TablesErrored")]
        getter tables_errored : Int32?

        # The number of tables loaded for this replication.

        @[JSON::Field(key: "TablesLoaded")]
        getter tables_loaded : Int32?

        # The number of tables currently loading for this replication.

        @[JSON::Field(key: "TablesLoading")]
        getter tables_loading : Int32?

        # The number of tables queued for this replication.

        @[JSON::Field(key: "TablesQueued")]
        getter tables_queued : Int32?

        def initialize(
          @elapsed_time_millis : Int64? = nil,
          @fresh_start_date : Time? = nil,
          @full_load_finish_date : Time? = nil,
          @full_load_progress_percent : Int32? = nil,
          @full_load_start_date : Time? = nil,
          @start_date : Time? = nil,
          @stop_date : Time? = nil,
          @tables_errored : Int32? = nil,
          @tables_loaded : Int32? = nil,
          @tables_loading : Int32? = nil,
          @tables_queued : Int32? = nil
        )
        end
      end

      # Describes a subnet group in response to a request by the DescribeReplicationSubnetGroups operation.

      struct ReplicationSubnetGroup
        include JSON::Serializable

        # Indicates whether the replication subnet group is read-only. When set to true , this subnet group is
        # managed by DMS as part of a zero-ETL integration and cannot be modified or deleted directly. You can
        # only modify or delete read-only subnet groups through their associated zero-ETL integration.

        @[JSON::Field(key: "IsReadOnly")]
        getter is_read_only : Bool?

        # A description for the replication subnet group.

        @[JSON::Field(key: "ReplicationSubnetGroupDescription")]
        getter replication_subnet_group_description : String?

        # The identifier of the replication instance subnet group.

        @[JSON::Field(key: "ReplicationSubnetGroupIdentifier")]
        getter replication_subnet_group_identifier : String?

        # The status of the subnet group.

        @[JSON::Field(key: "SubnetGroupStatus")]
        getter subnet_group_status : String?

        # The subnets that are in the subnet group.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(Types::Subnet)?

        # The IP addressing protocol supported by the subnet group. This is used by a replication instance
        # with values such as IPv4 only or Dual-stack that supports both IPv4 and IPv6 addressing. IPv6 only
        # is not yet supported.

        @[JSON::Field(key: "SupportedNetworkTypes")]
        getter supported_network_types : Array(String)?

        # The ID of the VPC.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @is_read_only : Bool? = nil,
          @replication_subnet_group_description : String? = nil,
          @replication_subnet_group_identifier : String? = nil,
          @subnet_group_status : String? = nil,
          @subnets : Array(Types::Subnet)? = nil,
          @supported_network_types : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The replication subnet group does not cover enough Availability Zones (AZs). Edit the replication
      # subnet group and add more AZs.

      struct ReplicationSubnetGroupDoesNotCoverEnoughAZs
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information that describes a replication task created by the CreateReplicationTask
      # operation.

      struct ReplicationTask
        include JSON::Serializable

        # Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition
        # or CdcStartTime to specify when you want the CDC operation to start. Specifying both values results
        # in an error. The value can be in date, checkpoint, or LSN/SCN format. Date Example:
        # --cdc-start-position “2018-03-08T12:12:12” Checkpoint Example: --cdc-start-position
        # "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
        # LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”

        @[JSON::Field(key: "CdcStartPosition")]
        getter cdc_start_position : String?

        # Indicates when you want a change data capture (CDC) operation to stop. The value can be either
        # server time or commit time. Server time example: --cdc-stop-position
        # “server_time:2018-02-09T12:12:12” Commit time example: --cdc-stop-position
        # “commit_time:2018-02-09T12:12:12“

        @[JSON::Field(key: "CdcStopPosition")]
        getter cdc_stop_position : String?

        # The last error (failure) message generated for the replication task.

        @[JSON::Field(key: "LastFailureMessage")]
        getter last_failure_message : String?

        # The type of migration.

        @[JSON::Field(key: "MigrationType")]
        getter migration_type : String?

        # Indicates the last checkpoint that occurred during a change data capture (CDC) operation. You can
        # provide this value to the CdcStartPosition parameter to start a CDC operation that begins at that
        # checkpoint.

        @[JSON::Field(key: "RecoveryCheckpoint")]
        getter recovery_checkpoint : String?

        # The ARN of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String?

        # The Amazon Resource Name (ARN) of the replication task.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String?

        # The date the replication task was created.

        @[JSON::Field(key: "ReplicationTaskCreationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_task_creation_date : Time?

        # The user-assigned replication task identifier or name. Constraints: Must contain 1-255 alphanumeric
        # characters or hyphens. First character must be a letter. Cannot end with a hyphen or contain two
        # consecutive hyphens.

        @[JSON::Field(key: "ReplicationTaskIdentifier")]
        getter replication_task_identifier : String?

        # The settings for the replication task.

        @[JSON::Field(key: "ReplicationTaskSettings")]
        getter replication_task_settings : String?

        # The date the replication task is scheduled to start.

        @[JSON::Field(key: "ReplicationTaskStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_task_start_date : Time?

        # The statistics for the task, including elapsed time, tables loaded, and table errors.

        @[JSON::Field(key: "ReplicationTaskStats")]
        getter replication_task_stats : Types::ReplicationTaskStats?

        # The Amazon Resource Name (ARN) that uniquely identifies the endpoint.

        @[JSON::Field(key: "SourceEndpointArn")]
        getter source_endpoint_arn : String?

        # The status of the replication task. This response parameter can return one of the following values:
        # "moving" – The task is being moved in response to running the MoveReplicationTask operation.
        # "creating" – The task is being created in response to running the CreateReplicationTask operation.
        # "deleting" – The task is being deleted in response to running the DeleteReplicationTask operation.
        # "failed" – The task failed to successfully complete the database migration in response to running
        # the StartReplicationTask operation. "failed-move" – The task failed to move in response to running
        # the MoveReplicationTask operation. "modifying" – The task definition is being modified in response
        # to running the ModifyReplicationTask operation. "ready" – The task is in a ready state where it can
        # respond to other task operations, such as StartReplicationTask or DeleteReplicationTask . "running"
        # – The task is performing a database migration in response to running the StartReplicationTask
        # operation. "starting" – The task is preparing to perform a database migration in response to running
        # the StartReplicationTask operation. "stopped" – The task has stopped in response to running the
        # StopReplicationTask operation. "stopping" – The task is preparing to stop in response to running the
        # StopReplicationTask operation. "testing" – The database migration specified for this task is being
        # tested in response to running either the StartReplicationTaskAssessmentRun or the
        # StartReplicationTaskAssessment operation. StartReplicationTaskAssessmentRun is an improved
        # premigration task assessment operation. The StartReplicationTaskAssessment operation assesses data
        # type compatibility only between the source and target database of a given migration task. In
        # contrast, StartReplicationTaskAssessmentRun enables you to specify a variety of premigration task
        # assessments in addition to data type compatibility. These assessments include ones for the validity
        # of primary key definitions and likely issues with database migration performance, among others.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason the replication task was stopped. This response parameter can return one of the following
        # values: "Stop Reason NORMAL" – The task completed successfully with no additional information
        # returned. "Stop Reason RECOVERABLE_ERROR" "Stop Reason FATAL_ERROR" "Stop Reason
        # FULL_LOAD_ONLY_FINISHED" – The task completed the full load phase. DMS applied cached changes if you
        # set StopTaskCachedChangesApplied to true . "Stop Reason STOPPED_AFTER_FULL_LOAD" – Full load
        # completed, with cached changes not applied "Stop Reason STOPPED_AFTER_CACHED_EVENTS" – Full load
        # completed, with cached changes applied "Stop Reason EXPRESS_LICENSE_LIMITS_REACHED" "Stop Reason
        # STOPPED_AFTER_DDL_APPLY" – User-defined stop task after DDL applied "Stop Reason
        # STOPPED_DUE_TO_LOW_MEMORY" "Stop Reason STOPPED_DUE_TO_LOW_DISK" "Stop Reason
        # STOPPED_AT_SERVER_TIME" – User-defined server time for stopping task "Stop Reason
        # STOPPED_AT_COMMIT_TIME" – User-defined commit time for stopping task "Stop Reason
        # RECONFIGURATION_RESTART" "Stop Reason RECYCLE_TASK"

        @[JSON::Field(key: "StopReason")]
        getter stop_reason : String?

        # Table mappings specified in the task.

        @[JSON::Field(key: "TableMappings")]
        getter table_mappings : String?

        # The ARN that uniquely identifies the endpoint.

        @[JSON::Field(key: "TargetEndpointArn")]
        getter target_endpoint_arn : String?

        # The ARN of the replication instance to which this task is moved in response to running the
        # MoveReplicationTask operation. Otherwise, this response parameter isn't a member of the
        # ReplicationTask object.

        @[JSON::Field(key: "TargetReplicationInstanceArn")]
        getter target_replication_instance_arn : String?

        # Supplemental information that the task requires to migrate the data for certain source and target
        # endpoints. For more information, see Specifying Supplemental Data for Task Settings in the Database
        # Migration Service User Guide.

        @[JSON::Field(key: "TaskData")]
        getter task_data : String?

        def initialize(
          @cdc_start_position : String? = nil,
          @cdc_stop_position : String? = nil,
          @last_failure_message : String? = nil,
          @migration_type : String? = nil,
          @recovery_checkpoint : String? = nil,
          @replication_instance_arn : String? = nil,
          @replication_task_arn : String? = nil,
          @replication_task_creation_date : Time? = nil,
          @replication_task_identifier : String? = nil,
          @replication_task_settings : String? = nil,
          @replication_task_start_date : Time? = nil,
          @replication_task_stats : Types::ReplicationTaskStats? = nil,
          @source_endpoint_arn : String? = nil,
          @status : String? = nil,
          @stop_reason : String? = nil,
          @table_mappings : String? = nil,
          @target_endpoint_arn : String? = nil,
          @target_replication_instance_arn : String? = nil,
          @task_data : String? = nil
        )
        end
      end

      # The task assessment report in JSON format.

      struct ReplicationTaskAssessmentResult
        include JSON::Serializable

        # The task assessment results in JSON format. The response object only contains this field if you
        # provide DescribeReplicationTaskAssessmentResultsMessage$ReplicationTaskArn in the request.

        @[JSON::Field(key: "AssessmentResults")]
        getter assessment_results : String?

        # The file containing the results of the task assessment.

        @[JSON::Field(key: "AssessmentResultsFile")]
        getter assessment_results_file : String?

        # The status of the task assessment.

        @[JSON::Field(key: "AssessmentStatus")]
        getter assessment_status : String?

        # The Amazon Resource Name (ARN) of the replication task.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String?

        # The replication task identifier of the task on which the task assessment was run.

        @[JSON::Field(key: "ReplicationTaskIdentifier")]
        getter replication_task_identifier : String?

        # The date the task assessment was completed.

        @[JSON::Field(key: "ReplicationTaskLastAssessmentDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_task_last_assessment_date : Time?

        # The URL of the S3 object containing the task assessment results. The response object only contains
        # this field if you provide DescribeReplicationTaskAssessmentResultsMessage$ReplicationTaskArn in the
        # request.

        @[JSON::Field(key: "S3ObjectUrl")]
        getter s3_object_url : String?

        def initialize(
          @assessment_results : String? = nil,
          @assessment_results_file : String? = nil,
          @assessment_status : String? = nil,
          @replication_task_arn : String? = nil,
          @replication_task_identifier : String? = nil,
          @replication_task_last_assessment_date : Time? = nil,
          @s3_object_url : String? = nil
        )
        end
      end

      # Provides information that describes a premigration assessment run that you have started using the
      # StartReplicationTaskAssessmentRun operation. Some of the information appears based on other
      # operations that can return the ReplicationTaskAssessmentRun object.

      struct ReplicationTaskAssessmentRun
        include JSON::Serializable

        # Indication of the completion progress for the individual assessments specified to run.

        @[JSON::Field(key: "AssessmentProgress")]
        getter assessment_progress : Types::ReplicationTaskAssessmentRunProgress?

        # Unique name of the assessment run.

        @[JSON::Field(key: "AssessmentRunName")]
        getter assessment_run_name : String?

        # Indicates that the following PreflightAssessmentRun is the latest for the ReplicationTask. The
        # status is either true or false.

        @[JSON::Field(key: "IsLatestTaskAssessmentRun")]
        getter is_latest_task_assessment_run : Bool?

        # Last message generated by an individual assessment failure.

        @[JSON::Field(key: "LastFailureMessage")]
        getter last_failure_message : String?

        # ARN of the migration task associated with this premigration assessment run.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String?

        # Amazon Resource Name (ARN) of this assessment run.

        @[JSON::Field(key: "ReplicationTaskAssessmentRunArn")]
        getter replication_task_assessment_run_arn : String?

        # Date on which the assessment run was created using the StartReplicationTaskAssessmentRun operation.

        @[JSON::Field(key: "ReplicationTaskAssessmentRunCreationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_task_assessment_run_creation_date : Time?

        # Encryption mode used to encrypt the assessment run results.

        @[JSON::Field(key: "ResultEncryptionMode")]
        getter result_encryption_mode : String?

        # ARN of the KMS encryption key used to encrypt the assessment run results.

        @[JSON::Field(key: "ResultKmsKeyArn")]
        getter result_kms_key_arn : String?

        # Amazon S3 bucket where DMS stores the results of this assessment run.

        @[JSON::Field(key: "ResultLocationBucket")]
        getter result_location_bucket : String?

        # Folder in an Amazon S3 bucket where DMS stores the results of this assessment run.

        @[JSON::Field(key: "ResultLocationFolder")]
        getter result_location_folder : String?

        # Result statistics for a completed assessment run, showing aggregated statistics of
        # IndividualAssessments for how many assessments were passed, failed, or encountered issues such as
        # errors or warnings.

        @[JSON::Field(key: "ResultStatistic")]
        getter result_statistic : Types::ReplicationTaskAssessmentRunResultStatistic?

        # ARN of the service role used to start the assessment run using the StartReplicationTaskAssessmentRun
        # operation. The role must allow the iam:PassRole action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # Assessment run status. This status can have one of the following values: "cancelling" – The
        # assessment run was canceled by the CancelReplicationTaskAssessmentRun operation. "deleting" – The
        # assessment run was deleted by the DeleteReplicationTaskAssessmentRun operation. "failed" – At least
        # one individual assessment completed with a failed status. "error-provisioning" – An internal error
        # occurred while resources were provisioned (during provisioning status). "error-executing" – An
        # internal error occurred while individual assessments ran (during running status). "invalid state" –
        # The assessment run is in an unknown state. "passed" – All individual assessments have completed, and
        # none has a failed status. "provisioning" – Resources required to run individual assessments are
        # being provisioned. "running" – Individual assessments are being run. "starting" – The assessment run
        # is starting, but resources are not yet being provisioned for individual assessments. "warning" – At
        # least one individual assessment completed with a warning status or all individual assessments were
        # skipped (completed with a skipped status).

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @assessment_progress : Types::ReplicationTaskAssessmentRunProgress? = nil,
          @assessment_run_name : String? = nil,
          @is_latest_task_assessment_run : Bool? = nil,
          @last_failure_message : String? = nil,
          @replication_task_arn : String? = nil,
          @replication_task_assessment_run_arn : String? = nil,
          @replication_task_assessment_run_creation_date : Time? = nil,
          @result_encryption_mode : String? = nil,
          @result_kms_key_arn : String? = nil,
          @result_location_bucket : String? = nil,
          @result_location_folder : String? = nil,
          @result_statistic : Types::ReplicationTaskAssessmentRunResultStatistic? = nil,
          @service_access_role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The progress values reported by the AssessmentProgress response element.

      struct ReplicationTaskAssessmentRunProgress
        include JSON::Serializable

        # The number of individual assessments that have completed, successfully or not.

        @[JSON::Field(key: "IndividualAssessmentCompletedCount")]
        getter individual_assessment_completed_count : Int32?

        # The number of individual assessments that are specified to run.

        @[JSON::Field(key: "IndividualAssessmentCount")]
        getter individual_assessment_count : Int32?

        def initialize(
          @individual_assessment_completed_count : Int32? = nil,
          @individual_assessment_count : Int32? = nil
        )
        end
      end

      # The object containing the result statistics for a completed assessment run.

      struct ReplicationTaskAssessmentRunResultStatistic
        include JSON::Serializable

        # The number of individual assessments that were cancelled during the assessment run.

        @[JSON::Field(key: "Cancelled")]
        getter cancelled : Int32?

        # The number of individual assessments that encountered a critical error and could not complete
        # properly.

        @[JSON::Field(key: "Error")]
        getter error : Int32?

        # The number of individual assessments that failed to meet the criteria defined in the assessment run.

        @[JSON::Field(key: "Failed")]
        getter failed : Int32?

        # The number of individual assessments that successfully passed all checks in the assessment run.

        @[JSON::Field(key: "Passed")]
        getter passed : Int32?

        # The number of individual assessments that were skipped during the assessment run.

        @[JSON::Field(key: "Skipped")]
        getter skipped : Int32?

        # Indicates that the recent completed AssessmentRun triggered a warning.

        @[JSON::Field(key: "Warning")]
        getter warning : Int32?

        def initialize(
          @cancelled : Int32? = nil,
          @error : Int32? = nil,
          @failed : Int32? = nil,
          @passed : Int32? = nil,
          @skipped : Int32? = nil,
          @warning : Int32? = nil
        )
        end
      end

      # Provides information that describes an individual assessment from a premigration assessment run.

      struct ReplicationTaskIndividualAssessment
        include JSON::Serializable

        # Name of this individual assessment.

        @[JSON::Field(key: "IndividualAssessmentName")]
        getter individual_assessment_name : String?

        # ARN of the premigration assessment run that is created to run this individual assessment.

        @[JSON::Field(key: "ReplicationTaskAssessmentRunArn")]
        getter replication_task_assessment_run_arn : String?

        # Amazon Resource Name (ARN) of this individual assessment.

        @[JSON::Field(key: "ReplicationTaskIndividualAssessmentArn")]
        getter replication_task_individual_assessment_arn : String?

        # Date when this individual assessment was started as part of running the
        # StartReplicationTaskAssessmentRun operation.

        @[JSON::Field(key: "ReplicationTaskIndividualAssessmentStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replication_task_individual_assessment_start_date : Time?

        # Individual assessment status. This status can have one of the following values: "cancelled" "error"
        # "failed" "passed" "pending" "skipped" "running"

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @individual_assessment_name : String? = nil,
          @replication_task_assessment_run_arn : String? = nil,
          @replication_task_individual_assessment_arn : String? = nil,
          @replication_task_individual_assessment_start_date : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # In response to a request by the DescribeReplicationTasks operation, this object provides a
      # collection of statistics about a replication task.

      struct ReplicationTaskStats
        include JSON::Serializable

        # The elapsed time of the task, in milliseconds.

        @[JSON::Field(key: "ElapsedTimeMillis")]
        getter elapsed_time_millis : Int64?

        # The date the replication task was started either with a fresh start or a target reload.

        @[JSON::Field(key: "FreshStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter fresh_start_date : Time?

        # The date the replication task full load was completed.

        @[JSON::Field(key: "FullLoadFinishDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter full_load_finish_date : Time?

        # The percent complete for the full load migration task.

        @[JSON::Field(key: "FullLoadProgressPercent")]
        getter full_load_progress_percent : Int32?

        # The date the replication task full load was started.

        @[JSON::Field(key: "FullLoadStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter full_load_start_date : Time?

        # The date the replication task was started either with a fresh start or a resume. For more
        # information, see StartReplicationTaskType .

        @[JSON::Field(key: "StartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        # The date the replication task was stopped.

        @[JSON::Field(key: "StopDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_date : Time?

        # The number of errors that have occurred during this task.

        @[JSON::Field(key: "TablesErrored")]
        getter tables_errored : Int32?

        # The number of tables loaded for this task.

        @[JSON::Field(key: "TablesLoaded")]
        getter tables_loaded : Int32?

        # The number of tables currently loading for this task.

        @[JSON::Field(key: "TablesLoading")]
        getter tables_loading : Int32?

        # The number of tables queued for this task.

        @[JSON::Field(key: "TablesQueued")]
        getter tables_queued : Int32?

        def initialize(
          @elapsed_time_millis : Int64? = nil,
          @fresh_start_date : Time? = nil,
          @full_load_finish_date : Time? = nil,
          @full_load_progress_percent : Int32? = nil,
          @full_load_start_date : Time? = nil,
          @start_date : Time? = nil,
          @stop_date : Time? = nil,
          @tables_errored : Int32? = nil,
          @tables_loaded : Int32? = nil,
          @tables_loading : Int32? = nil,
          @tables_queued : Int32? = nil
        )
        end
      end

      # The resource you are attempting to create already exists.

      struct ResourceAlreadyExistsFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @message : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # The resource could not be found.

      struct ResourceNotFoundFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Identifies an DMS resource and any pending actions for it.

      struct ResourcePendingMaintenanceActions
        include JSON::Serializable

        # Detailed information about the pending maintenance action.

        @[JSON::Field(key: "PendingMaintenanceActionDetails")]
        getter pending_maintenance_action_details : Array(Types::PendingMaintenanceAction)?

        # The Amazon Resource Name (ARN) of the DMS resource that the pending maintenance action applies to.
        # For information about creating an ARN, see Constructing an Amazon Resource Name (ARN) for DMS in the
        # DMS documentation.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        def initialize(
          @pending_maintenance_action_details : Array(Types::PendingMaintenanceAction)? = nil,
          @resource_identifier : String? = nil
        )
        end
      end

      # The quota for this resource quota has been exceeded.

      struct ResourceQuotaExceededFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RunFleetAdvisorLsaAnalysisResponse
        include JSON::Serializable

        # The ID of the LSA analysis run.

        @[JSON::Field(key: "LsaAnalysisId")]
        getter lsa_analysis_id : String?

        # The status of the LSA analysis, for example COMPLETED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @lsa_analysis_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Insufficient privileges are preventing access to an Amazon S3 object.

      struct S3AccessDeniedFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A specified Amazon S3 bucket, bucket folder, or other object can't be found.

      struct S3ResourceNotFoundFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Settings for exporting data to Amazon S3.

      struct S3Settings
        include JSON::Serializable

        # An optional parameter that, when set to true or y , you can use to add column name information to
        # the .csv output file. The default value is false . Valid values are true , false , y , and n .

        @[JSON::Field(key: "AddColumnName")]
        getter add_column_name : Bool?

        # Use the S3 target endpoint setting AddTrailingPaddingCharacter to add padding on string data. The
        # default value is false .

        @[JSON::Field(key: "AddTrailingPaddingCharacter")]
        getter add_trailing_padding_character : Bool?

        # An optional parameter to set a folder name in the S3 bucket. If provided, tables are created in the
        # path bucketFolder / schema_name / table_name / . If this parameter isn't specified, then the path
        # used is schema_name / table_name / .

        @[JSON::Field(key: "BucketFolder")]
        getter bucket_folder : String?

        # The name of the S3 bucket.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # A value that enables DMS to specify a predefined (canned) access control list for objects created in
        # an Amazon S3 bucket as .csv or .parquet files. For more information about Amazon S3 canned ACLs, see
        # Canned ACL in the Amazon S3 Developer Guide. The default value is NONE. Valid values include NONE,
        # PRIVATE, PUBLIC_READ, PUBLIC_READ_WRITE, AUTHENTICATED_READ, AWS_EXEC_READ, BUCKET_OWNER_READ, and
        # BUCKET_OWNER_FULL_CONTROL.

        @[JSON::Field(key: "CannedAclForObjects")]
        getter canned_acl_for_objects : String?

        # A value that enables a change data capture (CDC) load to write INSERT and UPDATE operations to .csv
        # or .parquet (columnar storage) output files. The default setting is false , but when
        # CdcInsertsAndUpdates is set to true or y , only INSERTs and UPDATEs from the source database are
        # migrated to the .csv or .parquet file. DMS supports the use of the .parquet files in versions 3.4.7
        # and later. How these INSERTs and UPDATEs are recorded depends on the value of the
        # IncludeOpForFullLoad parameter. If IncludeOpForFullLoad is set to true , the first field of every
        # CDC record is set to either I or U to indicate INSERT and UPDATE operations at the source. But if
        # IncludeOpForFullLoad is set to false , CDC records are written without an indication of INSERT or
        # UPDATE operations at the source. For more information about how these settings work together, see
        # Indicating Source DB Operations in Migrated S3 Data in the Database Migration Service User Guide. .
        # DMS supports the use of the CdcInsertsAndUpdates parameter in versions 3.3.1 and later.
        # CdcInsertsOnly and CdcInsertsAndUpdates can't both be set to true for the same endpoint. Set either
        # CdcInsertsOnly or CdcInsertsAndUpdates to true for the same endpoint, but not both.

        @[JSON::Field(key: "CdcInsertsAndUpdates")]
        getter cdc_inserts_and_updates : Bool?

        # A value that enables a change data capture (CDC) load to write only INSERT operations to .csv or
        # columnar storage (.parquet) output files. By default (the false setting), the first field in a .csv
        # or .parquet record contains the letter I (INSERT), U (UPDATE), or D (DELETE). These values indicate
        # whether the row was inserted, updated, or deleted at the source database for a CDC load to the
        # target. If CdcInsertsOnly is set to true or y , only INSERTs from the source database are migrated
        # to the .csv or .parquet file. For .csv format only, how these INSERTs are recorded depends on the
        # value of IncludeOpForFullLoad . If IncludeOpForFullLoad is set to true , the first field of every
        # CDC record is set to I to indicate the INSERT operation at the source. If IncludeOpForFullLoad is
        # set to false , every CDC record is written without a first field to indicate the INSERT operation at
        # the source. For more information about how these settings work together, see Indicating Source DB
        # Operations in Migrated S3 Data in the Database Migration Service User Guide. . DMS supports the
        # interaction described preceding between the CdcInsertsOnly and IncludeOpForFullLoad parameters in
        # versions 3.1.4 and later. CdcInsertsOnly and CdcInsertsAndUpdates can't both be set to true for the
        # same endpoint. Set either CdcInsertsOnly or CdcInsertsAndUpdates to true for the same endpoint, but
        # not both.

        @[JSON::Field(key: "CdcInsertsOnly")]
        getter cdc_inserts_only : Bool?

        # Maximum length of the interval, defined in seconds, after which to output a file to Amazon S3. When
        # CdcMaxBatchInterval and CdcMinFileSize are both specified, the file write is triggered by whichever
        # parameter condition is met first within an DMS CloudFormation template. The default value is 60
        # seconds.

        @[JSON::Field(key: "CdcMaxBatchInterval")]
        getter cdc_max_batch_interval : Int32?

        # Minimum file size, defined in kilobytes, to reach for a file output to Amazon S3. When
        # CdcMinFileSize and CdcMaxBatchInterval are both specified, the file write is triggered by whichever
        # parameter condition is met first within an DMS CloudFormation template. The default value is 32 MB.

        @[JSON::Field(key: "CdcMinFileSize")]
        getter cdc_min_file_size : Int32?

        # Specifies the folder path of CDC files. For an S3 source, this setting is required if a task
        # captures change data; otherwise, it's optional. If CdcPath is set, DMS reads CDC files from this
        # path and replicates the data changes to the target endpoint. For an S3 target if you set
        # PreserveTransactions to true , DMS verifies that you have set this parameter to a folder path on
        # your S3 target where DMS can save the transaction order for the CDC load. DMS creates this CDC
        # folder path in either your S3 target working directory or the S3 target location specified by
        # BucketFolder and BucketName . For example, if you specify CdcPath as MyChangedData , and you specify
        # BucketName as MyTargetBucket but do not specify BucketFolder , DMS creates the CDC folder path
        # following: MyTargetBucket/MyChangedData . If you specify the same CdcPath , and you specify
        # BucketName as MyTargetBucket and BucketFolder as MyTargetData , DMS creates the CDC folder path
        # following: MyTargetBucket/MyTargetData/MyChangedData . For more information on CDC including
        # transaction order on an S3 target, see Capturing data changes (CDC) including transaction order on
        # the S3 target . This setting is supported in DMS versions 3.4.2 and later.

        @[JSON::Field(key: "CdcPath")]
        getter cdc_path : String?

        # An optional parameter to use GZIP to compress the target files. Set to GZIP to compress the target
        # files. Either set this parameter to NONE (the default) or don't use it to leave the files
        # uncompressed. This parameter applies to both .csv and .parquet file formats.

        @[JSON::Field(key: "CompressionType")]
        getter compression_type : String?

        # The delimiter used to separate columns in the .csv file for both source and target. The default is a
        # comma.

        @[JSON::Field(key: "CsvDelimiter")]
        getter csv_delimiter : String?

        # This setting only applies if your Amazon S3 output files during a change data capture (CDC) load are
        # written in .csv format. If UseCsvNoSupValue is set to true, specify a string value that you want DMS
        # to use for all columns not included in the supplemental log. If you do not specify a string value,
        # DMS uses the null value for these columns regardless of the UseCsvNoSupValue setting. This setting
        # is supported in DMS versions 3.4.1 and later.

        @[JSON::Field(key: "CsvNoSupValue")]
        getter csv_no_sup_value : String?

        # An optional parameter that specifies how DMS treats null values. While handling the null value, you
        # can use this parameter to pass a user-defined string as null when writing to the target. For
        # example, when target columns are nullable, you can use this option to differentiate between the
        # empty string value and the null value. So, if you set this parameter value to the empty string (""
        # or ''), DMS treats the empty string as the null value instead of NULL . The default value is NULL .
        # Valid values include any valid string.

        @[JSON::Field(key: "CsvNullValue")]
        getter csv_null_value : String?

        # The delimiter used to separate rows in the .csv file for both source and target. The default is a
        # carriage return ( \n ).

        @[JSON::Field(key: "CsvRowDelimiter")]
        getter csv_row_delimiter : String?

        # The format of the data that you want to use for output. You can choose one of the following: csv :
        # This is a row-based file format with comma-separated values (.csv). parquet : Apache Parquet
        # (.parquet) is a columnar storage file format that features efficient compression and provides faster
        # query response.

        @[JSON::Field(key: "DataFormat")]
        getter data_format : String?

        # The size of one data page in bytes. This parameter defaults to 1024 * 1024 bytes (1 MiB). This
        # number is used for .parquet file format only.

        @[JSON::Field(key: "DataPageSize")]
        getter data_page_size : Int32?

        # Specifies a date separating delimiter to use during folder partitioning. The default value is SLASH
        # . Use this parameter when DatePartitionedEnabled is set to true .

        @[JSON::Field(key: "DatePartitionDelimiter")]
        getter date_partition_delimiter : String?

        # When set to true , this parameter partitions S3 bucket folders based on transaction commit dates.
        # The default value is false . For more information about date-based folder partitioning, see Using
        # date-based folder partitioning .

        @[JSON::Field(key: "DatePartitionEnabled")]
        getter date_partition_enabled : Bool?

        # Identifies the sequence of the date format to use during folder partitioning. The default value is
        # YYYYMMDD . Use this parameter when DatePartitionedEnabled is set to true .

        @[JSON::Field(key: "DatePartitionSequence")]
        getter date_partition_sequence : String?

        # When creating an S3 target endpoint, set DatePartitionTimezone to convert the current UTC time into
        # a specified time zone. The conversion occurs when a date partition folder is created and a CDC
        # filename is generated. The time zone format is Area/Location. Use this parameter when
        # DatePartitionedEnabled is set to true, as shown in the following example:
        # s3-settings='{"DatePartitionEnabled": true, "DatePartitionSequence": "YYYYMMDDHH",
        # "DatePartitionDelimiter": "SLASH", "DatePartitionTimezone":"Asia/Seoul", "BucketName":
        # "dms-nattarat-test"}'

        @[JSON::Field(key: "DatePartitionTimezone")]
        getter date_partition_timezone : String?

        # The maximum size of an encoded dictionary page of a column. If the dictionary page exceeds this,
        # this column is stored using an encoding type of PLAIN . This parameter defaults to 1024 * 1024 bytes
        # (1 MiB), the maximum size of a dictionary page before it reverts to PLAIN encoding. This size is
        # used for .parquet file format only.

        @[JSON::Field(key: "DictPageSizeLimit")]
        getter dict_page_size_limit : Int32?

        # A value that enables statistics for Parquet pages and row groups. Choose true to enable statistics,
        # false to disable. Statistics include NULL , DISTINCT , MAX , and MIN values. This parameter defaults
        # to true . This value is used for .parquet file format only.

        @[JSON::Field(key: "EnableStatistics")]
        getter enable_statistics : Bool?

        # The type of encoding you are using: RLE_DICTIONARY uses a combination of bit-packing and run-length
        # encoding to store repeated values more efficiently. This is the default. PLAIN doesn't use encoding
        # at all. Values are stored as they are. PLAIN_DICTIONARY builds a dictionary of the values
        # encountered in a given column. The dictionary is stored in a dictionary page for each column chunk.

        @[JSON::Field(key: "EncodingType")]
        getter encoding_type : String?

        # The type of server-side encryption that you want to use for your data. This encryption type is part
        # of the endpoint settings or the extra connections attributes for Amazon S3. You can choose either
        # SSE_S3 (the default) or SSE_KMS . For the ModifyEndpoint operation, you can change the existing
        # value of the EncryptionMode parameter from SSE_KMS to SSE_S3 . But you can’t change the existing
        # value from SSE_S3 to SSE_KMS . To use SSE_S3 , you need an Identity and Access Management (IAM) role
        # with permission to allow "arn:aws:s3:::dms-*" to use the following actions: s3:CreateBucket
        # s3:ListBucket s3:DeleteBucket s3:GetBucketLocation s3:GetObject s3:PutObject s3:DeleteObject
        # s3:GetObjectVersion s3:GetBucketPolicy s3:PutBucketPolicy s3:DeleteBucketPolicy

        @[JSON::Field(key: "EncryptionMode")]
        getter encryption_mode : String?

        # To specify a bucket owner and prevent sniping, you can use the ExpectedBucketOwner endpoint setting.
        # Example: --s3-settings='{"ExpectedBucketOwner": " AWS_Account_ID "}' When you make a request to test
        # a connection or perform a migration, S3 checks the account ID of the bucket owner against the
        # specified parameter.

        @[JSON::Field(key: "ExpectedBucketOwner")]
        getter expected_bucket_owner : String?

        # Specifies how tables are defined in the S3 source files only.

        @[JSON::Field(key: "ExternalTableDefinition")]
        getter external_table_definition : String?

        # When true, allows Glue to catalog your S3 bucket. Creating an Glue catalog lets you use Athena to
        # query your data.

        @[JSON::Field(key: "GlueCatalogGeneration")]
        getter glue_catalog_generation : Bool?

        # When this value is set to 1, DMS ignores the first row header in a .csv file. A value of 1 turns on
        # the feature; a value of 0 turns off the feature. The default is 0.

        @[JSON::Field(key: "IgnoreHeaderRows")]
        getter ignore_header_rows : Int32?

        # A value that enables a full load to write INSERT operations to the comma-separated value (.csv) or
        # .parquet output files only to indicate how the rows were added to the source database. DMS supports
        # the IncludeOpForFullLoad parameter in versions 3.1.4 and later. DMS supports the use of the .parquet
        # files with the IncludeOpForFullLoad parameter in versions 3.4.7 and later. For full load, records
        # can only be inserted. By default (the false setting), no information is recorded in these output
        # files for a full load to indicate that the rows were inserted at the source database. If
        # IncludeOpForFullLoad is set to true or y , the INSERT is recorded as an I annotation in the first
        # field of the .csv file. This allows the format of your target records from a full load to be
        # consistent with the target records from a CDC load. This setting works together with the
        # CdcInsertsOnly and the CdcInsertsAndUpdates parameters for output to .csv files only. For more
        # information about how these settings work together, see Indicating Source DB Operations in Migrated
        # S3 Data in the Database Migration Service User Guide. .

        @[JSON::Field(key: "IncludeOpForFullLoad")]
        getter include_op_for_full_load : Bool?

        # A value that specifies the maximum size (in KB) of any .csv file to be created while migrating to an
        # S3 target during full load. The default value is 1,048,576 KB (1 GB). Valid values include 1 to
        # 1,048,576.

        @[JSON::Field(key: "MaxFileSize")]
        getter max_file_size : Int32?

        # A value that specifies the precision of any TIMESTAMP column values that are written to an Amazon S3
        # object file in .parquet format. DMS supports the ParquetTimestampInMillisecond parameter in versions
        # 3.1.4 and later. When ParquetTimestampInMillisecond is set to true or y , DMS writes all TIMESTAMP
        # columns in a .parquet formatted file with millisecond precision. Otherwise, DMS writes them with
        # microsecond precision. Currently, Amazon Athena and Glue can handle only millisecond precision for
        # TIMESTAMP values. Set this parameter to true for S3 endpoint object files that are .parquet
        # formatted only if you plan to query or process the data with Athena or Glue. DMS writes any
        # TIMESTAMP column values written to an S3 file in .csv format with microsecond precision. Setting
        # ParquetTimestampInMillisecond has no effect on the string format of the timestamp column value that
        # is inserted by setting the TimestampColumnName parameter.

        @[JSON::Field(key: "ParquetTimestampInMillisecond")]
        getter parquet_timestamp_in_millisecond : Bool?

        # The version of the Apache Parquet format that you want to use: parquet_1_0 (the default) or
        # parquet_2_0 .

        @[JSON::Field(key: "ParquetVersion")]
        getter parquet_version : String?

        # If set to true , DMS saves the transaction order for a change data capture (CDC) load on the Amazon
        # S3 target specified by CdcPath . For more information, see Capturing data changes (CDC) including
        # transaction order on the S3 target . This setting is supported in DMS versions 3.4.2 and later.

        @[JSON::Field(key: "PreserveTransactions")]
        getter preserve_transactions : Bool?

        # For an S3 source, when this value is set to true or y , each leading double quotation mark has to be
        # followed by an ending double quotation mark. This formatting complies with RFC 4180. When this value
        # is set to false or n , string literals are copied to the target as is. In this case, a delimiter
        # (row or column) signals the end of the field. Thus, you can't use a delimiter as part of the string,
        # because it signals the end of the value. For an S3 target, an optional parameter used to set
        # behavior to comply with RFC 4180 for data migrated to Amazon S3 using .csv file format only. When
        # this value is set to true or y using Amazon S3 as a target, if the data has quotation marks or
        # newline characters in it, DMS encloses the entire column with an additional pair of double quotation
        # marks ("). Every quotation mark within the data is repeated twice. The default value is true . Valid
        # values include true , false , y , and n .

        @[JSON::Field(key: "Rfc4180")]
        getter rfc4180 : Bool?

        # The number of rows in a row group. A smaller row group size provides faster reads. But as the number
        # of row groups grows, the slower writes become. This parameter defaults to 10,000 rows. This number
        # is used for .parquet file format only. If you choose a value larger than the maximum, RowGroupLength
        # is set to the max row group length in bytes (64 * 1024 * 1024).

        @[JSON::Field(key: "RowGroupLength")]
        getter row_group_length : Int32?

        # If you are using SSE_KMS for the EncryptionMode , provide the KMS key ID. The key that you use needs
        # an attached policy that enables Identity and Access Management (IAM) user permissions and allows use
        # of the key. Here is a CLI example: aws dms create-endpoint --endpoint-identifier value
        # --endpoint-type target --engine-name s3 --s3-settings ServiceAccessRoleArn= value ,BucketFolder=
        # value ,BucketName= value ,EncryptionMode=SSE_KMS,ServerSideEncryptionKmsKeyId= value

        @[JSON::Field(key: "ServerSideEncryptionKmsKeyId")]
        getter server_side_encryption_kms_key_id : String?

        # The Amazon Resource Name (ARN) used by the service to access the IAM role. The role must allow the
        # iam:PassRole action. It is a required parameter that enables DMS to write and read objects from an
        # S3 bucket.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String?

        # A value that when nonblank causes DMS to add a column with timestamp information to the endpoint
        # data for an Amazon S3 target. DMS supports the TimestampColumnName parameter in versions 3.1.4 and
        # later. DMS includes an additional STRING column in the .csv or .parquet object files of your
        # migrated data when you set TimestampColumnName to a nonblank value. For a full load, each row of
        # this timestamp column contains a timestamp for when the data was transferred from the source to the
        # target by DMS. For a change data capture (CDC) load, each row of the timestamp column contains the
        # timestamp for the commit of that row in the source database. The string format for this timestamp
        # column value is yyyy-MM-dd HH:mm:ss.SSSSSS . By default, the precision of this value is in
        # microseconds. For a CDC load, the rounding of the precision depends on the commit timestamp
        # supported by DMS for the source database. When the AddColumnName parameter is set to true , DMS also
        # includes a name for the timestamp column that you set with TimestampColumnName .

        @[JSON::Field(key: "TimestampColumnName")]
        getter timestamp_column_name : String?

        # This setting applies if the S3 output files during a change data capture (CDC) load are written in
        # .csv format. If set to true for columns not included in the supplemental log, DMS uses the value
        # specified by CsvNoSupValue . If not set or set to false , DMS uses the null value for these columns.
        # This setting is supported in DMS versions 3.4.1 and later.

        @[JSON::Field(key: "UseCsvNoSupValue")]
        getter use_csv_no_sup_value : Bool?

        # When set to true, this parameter uses the task start time as the timestamp column value instead of
        # the time data is written to target. For full load, when useTaskStartTimeForFullLoadTimestamp is set
        # to true , each row of the timestamp column contains the task start time. For CDC loads, each row of
        # the timestamp column contains the transaction commit time. When useTaskStartTimeForFullLoadTimestamp
        # is set to false , the full load timestamp in the timestamp column increments with the time data
        # arrives at the target.

        @[JSON::Field(key: "UseTaskStartTimeForFullLoadTimestamp")]
        getter use_task_start_time_for_full_load_timestamp : Bool?

        def initialize(
          @add_column_name : Bool? = nil,
          @add_trailing_padding_character : Bool? = nil,
          @bucket_folder : String? = nil,
          @bucket_name : String? = nil,
          @canned_acl_for_objects : String? = nil,
          @cdc_inserts_and_updates : Bool? = nil,
          @cdc_inserts_only : Bool? = nil,
          @cdc_max_batch_interval : Int32? = nil,
          @cdc_min_file_size : Int32? = nil,
          @cdc_path : String? = nil,
          @compression_type : String? = nil,
          @csv_delimiter : String? = nil,
          @csv_no_sup_value : String? = nil,
          @csv_null_value : String? = nil,
          @csv_row_delimiter : String? = nil,
          @data_format : String? = nil,
          @data_page_size : Int32? = nil,
          @date_partition_delimiter : String? = nil,
          @date_partition_enabled : Bool? = nil,
          @date_partition_sequence : String? = nil,
          @date_partition_timezone : String? = nil,
          @dict_page_size_limit : Int32? = nil,
          @enable_statistics : Bool? = nil,
          @encoding_type : String? = nil,
          @encryption_mode : String? = nil,
          @expected_bucket_owner : String? = nil,
          @external_table_definition : String? = nil,
          @glue_catalog_generation : Bool? = nil,
          @ignore_header_rows : Int32? = nil,
          @include_op_for_full_load : Bool? = nil,
          @max_file_size : Int32? = nil,
          @parquet_timestamp_in_millisecond : Bool? = nil,
          @parquet_version : String? = nil,
          @preserve_transactions : Bool? = nil,
          @rfc4180 : Bool? = nil,
          @row_group_length : Int32? = nil,
          @server_side_encryption_kms_key_id : String? = nil,
          @service_access_role_arn : String? = nil,
          @timestamp_column_name : String? = nil,
          @use_csv_no_sup_value : Bool? = nil,
          @use_task_start_time_for_full_load_timestamp : Bool? = nil
        )
        end
      end

      # Provides information that defines a schema conversion application.

      struct SCApplicationAttributes
        include JSON::Serializable

        # The path for the Amazon S3 bucket that the application uses for exporting assessment reports.

        @[JSON::Field(key: "S3BucketPath")]
        getter s3_bucket_path : String?

        # The ARN for the role the application uses to access its Amazon S3 bucket.

        @[JSON::Field(key: "S3BucketRoleArn")]
        getter s3_bucket_role_arn : String?

        def initialize(
          @s3_bucket_path : String? = nil,
          @s3_bucket_role_arn : String? = nil
        )
        end
      end

      # The SNS topic is invalid.

      struct SNSInvalidTopicFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You are not authorized for the SNS subscription.

      struct SNSNoAuthorizationFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about a schema conversion action.

      struct SchemaConversionRequest
        include JSON::Serializable


        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorDetails?


        @[JSON::Field(key: "ExportSqlDetails")]
        getter export_sql_details : Types::ExportSqlDetails?

        # The migration project ARN.

        @[JSON::Field(key: "MigrationProjectArn")]
        getter migration_project_arn : String?


        @[JSON::Field(key: "Progress")]
        getter progress : Types::Progress?

        # The identifier for the schema conversion action.

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String?

        # The schema conversion action status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @error : Types::ErrorDetails? = nil,
          @export_sql_details : Types::ExportSqlDetails? = nil,
          @migration_project_arn : String? = nil,
          @progress : Types::Progress? = nil,
          @request_identifier : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes a schema in a Fleet Advisor collector inventory.

      struct SchemaResponse
        include JSON::Serializable

        # The number of lines of code in a schema in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "CodeLineCount")]
        getter code_line_count : Int64?

        # The size level of the code in a schema in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "CodeSize")]
        getter code_size : Int64?

        # The complexity level of the code in a schema in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "Complexity")]
        getter complexity : String?

        # The database for a schema in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "DatabaseInstance")]
        getter database_instance : Types::DatabaseShortInfoResponse?


        @[JSON::Field(key: "OriginalSchema")]
        getter original_schema : Types::SchemaShortInfoResponse?

        # The ID of a schema in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "SchemaId")]
        getter schema_id : String?

        # The name of a schema in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        # The database server for a schema in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "Server")]
        getter server : Types::ServerShortInfoResponse?

        # The similarity value for a schema in a Fleet Advisor collector inventory. A higher similarity value
        # indicates that a schema is likely to be a duplicate.

        @[JSON::Field(key: "Similarity")]
        getter similarity : Float64?

        def initialize(
          @code_line_count : Int64? = nil,
          @code_size : Int64? = nil,
          @complexity : String? = nil,
          @database_instance : Types::DatabaseShortInfoResponse? = nil,
          @original_schema : Types::SchemaShortInfoResponse? = nil,
          @schema_id : String? = nil,
          @schema_name : String? = nil,
          @server : Types::ServerShortInfoResponse? = nil,
          @similarity : Float64? = nil
        )
        end
      end

      # Describes a schema in a Fleet Advisor collector inventory.

      struct SchemaShortInfoResponse
        include JSON::Serializable

        # The ID of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String?

        # The IP address of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "DatabaseIpAddress")]
        getter database_ip_address : String?

        # The name of a database in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The ID of a schema in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "SchemaId")]
        getter schema_id : String?

        # The name of a schema in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        def initialize(
          @database_id : String? = nil,
          @database_ip_address : String? = nil,
          @database_name : String? = nil,
          @schema_id : String? = nil,
          @schema_name : String? = nil
        )
        end
      end

      # Describes a server in a Fleet Advisor collector inventory.

      struct ServerShortInfoResponse
        include JSON::Serializable

        # The IP address of a server in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The ID of a server in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "ServerId")]
        getter server_id : String?

        # The name address of a server in a Fleet Advisor collector inventory.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        def initialize(
          @ip_address : String? = nil,
          @server_id : String? = nil,
          @server_name : String? = nil
        )
        end
      end

      # Defines settings for a source data provider for a data migration.

      struct SourceDataSetting
        include JSON::Serializable

        # The change data capture (CDC) start position for the source data provider.

        @[JSON::Field(key: "CDCStartPosition")]
        getter cdc_start_position : String?

        # The change data capture (CDC) start time for the source data provider.

        @[JSON::Field(key: "CDCStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cdc_start_time : Time?

        # The change data capture (CDC) stop time for the source data provider.

        @[JSON::Field(key: "CDCStopTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cdc_stop_time : Time?

        # The name of the replication slot on the source data provider. This attribute is only valid for a
        # PostgreSQL or Aurora PostgreSQL source.

        @[JSON::Field(key: "SlotName")]
        getter slot_name : String?

        def initialize(
          @cdc_start_position : String? = nil,
          @cdc_start_time : Time? = nil,
          @cdc_stop_time : Time? = nil,
          @slot_name : String? = nil
        )
        end
      end


      struct StartDataMigrationMessage
        include JSON::Serializable

        # The identifier (name or ARN) of the data migration to start.

        @[JSON::Field(key: "DataMigrationIdentifier")]
        getter data_migration_identifier : String

        # Specifies the start type for the data migration. Valid values include start-replication ,
        # reload-target , and resume-processing .

        @[JSON::Field(key: "StartType")]
        getter start_type : String

        def initialize(
          @data_migration_identifier : String,
          @start_type : String
        )
        end
      end


      struct StartDataMigrationResponse
        include JSON::Serializable

        # The data migration that DMS started.

        @[JSON::Field(key: "DataMigration")]
        getter data_migration : Types::DataMigration?

        def initialize(
          @data_migration : Types::DataMigration? = nil
        )
        end
      end


      struct StartExtensionPackAssociationMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        def initialize(
          @migration_project_identifier : String
        )
        end
      end


      struct StartExtensionPackAssociationResponse
        include JSON::Serializable

        # The identifier for the request operation.

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String?

        def initialize(
          @request_identifier : String? = nil
        )
        end
      end


      struct StartMetadataModelAssessmentMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # A value that specifies the database objects to assess.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        def initialize(
          @migration_project_identifier : String,
          @selection_rules : String
        )
        end
      end


      struct StartMetadataModelAssessmentResponse
        include JSON::Serializable

        # The identifier for the assessment operation.

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String?

        def initialize(
          @request_identifier : String? = nil
        )
        end
      end


      struct StartMetadataModelConversionMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # A value that specifies the database objects to convert.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        def initialize(
          @migration_project_identifier : String,
          @selection_rules : String
        )
        end
      end


      struct StartMetadataModelConversionResponse
        include JSON::Serializable

        # The identifier for the conversion operation.

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String?

        def initialize(
          @request_identifier : String? = nil
        )
        end
      end


      struct StartMetadataModelCreationMessage
        include JSON::Serializable

        # The name of the metadata model.

        @[JSON::Field(key: "MetadataModelName")]
        getter metadata_model_name : String

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # The properties of metadata model in JSON format. This object is a Union. Only one member of this
        # object can be specified or returned.

        @[JSON::Field(key: "Properties")]
        getter properties : Types::MetadataModelProperties

        # The JSON string that specifies the location where the metadata model will be created. Selection
        # rules must specify a single schema. For more information, see Selection Rules in the DMS User Guide.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        def initialize(
          @metadata_model_name : String,
          @migration_project_identifier : String,
          @properties : Types::MetadataModelProperties,
          @selection_rules : String
        )
        end
      end


      struct StartMetadataModelCreationResponse
        include JSON::Serializable

        # The identifier for the metadata model creation operation.

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String?

        def initialize(
          @request_identifier : String? = nil
        )
        end
      end


      struct StartMetadataModelExportAsScriptMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Whether to export the metadata model from the source or the target.

        @[JSON::Field(key: "Origin")]
        getter origin : String

        # A value that specifies the database objects to export.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        # The name of the model file to create in the Amazon S3 bucket.

        @[JSON::Field(key: "FileName")]
        getter file_name : String?

        def initialize(
          @migration_project_identifier : String,
          @origin : String,
          @selection_rules : String,
          @file_name : String? = nil
        )
        end
      end


      struct StartMetadataModelExportAsScriptResponse
        include JSON::Serializable

        # The identifier for the export operation.

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String?

        def initialize(
          @request_identifier : String? = nil
        )
        end
      end


      struct StartMetadataModelExportToTargetMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # A value that specifies the database objects to export.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        # Whether to overwrite the migration project extension pack. An extension pack is an add-on module
        # that emulates functions present in a source database that are required when converting objects to
        # the target database.

        @[JSON::Field(key: "OverwriteExtensionPack")]
        getter overwrite_extension_pack : Bool?

        def initialize(
          @migration_project_identifier : String,
          @selection_rules : String,
          @overwrite_extension_pack : Bool? = nil
        )
        end
      end


      struct StartMetadataModelExportToTargetResponse
        include JSON::Serializable

        # The identifier for the export operation.

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String?

        def initialize(
          @request_identifier : String? = nil
        )
        end
      end


      struct StartMetadataModelImportMessage
        include JSON::Serializable

        # The migration project name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "MigrationProjectIdentifier")]
        getter migration_project_identifier : String

        # Whether to load metadata to the source or target database.

        @[JSON::Field(key: "Origin")]
        getter origin : String

        # A value that specifies the database objects to import.

        @[JSON::Field(key: "SelectionRules")]
        getter selection_rules : String

        # If true , DMS loads metadata for the specified objects from the source database.

        @[JSON::Field(key: "Refresh")]
        getter refresh : Bool?

        def initialize(
          @migration_project_identifier : String,
          @origin : String,
          @selection_rules : String,
          @refresh : Bool? = nil
        )
        end
      end


      struct StartMetadataModelImportResponse
        include JSON::Serializable

        # The identifier for the import operation.

        @[JSON::Field(key: "RequestIdentifier")]
        getter request_identifier : String?

        def initialize(
          @request_identifier : String? = nil
        )
        end
      end


      struct StartRecommendationsRequest
        include JSON::Serializable

        # The identifier of the source database to analyze and provide recommendations for.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String

        # The settings in JSON format that Fleet Advisor uses to determine target engine recommendations.
        # These parameters include target instance sizing and availability and durability settings. For target
        # instance sizing, Fleet Advisor supports the following two options: total capacity and resource
        # utilization. For availability and durability, Fleet Advisor supports the following two options:
        # production (Multi-AZ deployments) and Dev/Test (Single-AZ deployments).

        @[JSON::Field(key: "Settings")]
        getter settings : Types::RecommendationSettings

        def initialize(
          @database_id : String,
          @settings : Types::RecommendationSettings
        )
        end
      end

      # Provides information about the source database to analyze and provide target recommendations
      # according to the specified requirements.

      struct StartRecommendationsRequestEntry
        include JSON::Serializable

        # The identifier of the source database.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String

        # The required target engine settings.

        @[JSON::Field(key: "Settings")]
        getter settings : Types::RecommendationSettings

        def initialize(
          @database_id : String,
          @settings : Types::RecommendationSettings
        )
        end
      end


      struct StartReplicationMessage
        include JSON::Serializable

        # The Amazon Resource Name of the replication for which to start replication.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String

        # The replication type. When the replication type is full-load or full-load-and-cdc , the only valid
        # value for the first run of the replication is start-replication . This option will start the
        # replication. You can also use ReloadTables to reload specific tables that failed during replication
        # instead of restarting the replication. The resume-processing option isn't applicable for a full-load
        # replication, because you can't resume partially loaded tables during the full load phase. For a
        # full-load-and-cdc replication, DMS migrates table data, and then applies data changes that occur on
        # the source. To load all the tables again, and start capturing source changes, use reload-target .
        # Otherwise use resume-processing , to replicate the changes from the last stop position.

        @[JSON::Field(key: "StartReplicationType")]
        getter start_replication_type : String

        # Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition
        # or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in
        # an error. The value can be in date, checkpoint, or LSN/SCN format.

        @[JSON::Field(key: "CdcStartPosition")]
        getter cdc_start_position : String?

        # Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or
        # CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results
        # in an error.

        @[JSON::Field(key: "CdcStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cdc_start_time : Time?

        # Indicates when you want a change data capture (CDC) operation to stop. The value can be either
        # server time or commit time.

        @[JSON::Field(key: "CdcStopPosition")]
        getter cdc_stop_position : String?

        # User-defined settings for the premigration assessment. The possible values are: ResultLocationFolder
        # : The folder within an Amazon S3 bucket where you want DMS to store the results of this assessment
        # run. ResultEncryptionMode : The supported values are SSE_KMS and SSE_S3 . If these values are not
        # provided, then the files are not encrypted at rest. For more information, see Creating Amazon Web
        # Services KMS keys to encrypt Amazon S3 target objects . ResultKmsKeyArn : The ARN of a customer KMS
        # encryption key that you specify when you set ResultEncryptionMode to SSE_KMS . IncludeOnly : A
        # space-separated list of names for specific individual assessments that you want to include. These
        # names come from the default list of individual assessments that Database Migration Service supports
        # for the associated migration. Exclude : A space-separated list of names for specific individual
        # assessments that you want to exclude. These names come from the default list of individual
        # assessments that Database Migration Service supports for the associated migration.
        # FailOnAssessmentFailure : A configurable setting you can set to true (the default setting) or false
        # . Use this setting to to stop the replication from starting automatically if the assessment fails.
        # This can help you evaluate the issue that is preventing the replication from running successfully.

        @[JSON::Field(key: "PremigrationAssessmentSettings")]
        getter premigration_assessment_settings : String?

        def initialize(
          @replication_config_arn : String,
          @start_replication_type : String,
          @cdc_start_position : String? = nil,
          @cdc_start_time : Time? = nil,
          @cdc_stop_position : String? = nil,
          @premigration_assessment_settings : String? = nil
        )
        end
      end


      struct StartReplicationResponse
        include JSON::Serializable

        # The replication that DMS started.

        @[JSON::Field(key: "Replication")]
        getter replication : Types::Replication?

        def initialize(
          @replication : Types::Replication? = nil
        )
        end
      end


      struct StartReplicationTaskAssessmentMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication task.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String

        def initialize(
          @replication_task_arn : String
        )
        end
      end


      struct StartReplicationTaskAssessmentResponse
        include JSON::Serializable

        # The assessed replication task.

        @[JSON::Field(key: "ReplicationTask")]
        getter replication_task : Types::ReplicationTask?

        def initialize(
          @replication_task : Types::ReplicationTask? = nil
        )
        end
      end


      struct StartReplicationTaskAssessmentRunMessage
        include JSON::Serializable

        # Unique name to identify the assessment run.

        @[JSON::Field(key: "AssessmentRunName")]
        getter assessment_run_name : String

        # Amazon Resource Name (ARN) of the migration task associated with the premigration assessment run
        # that you want to start.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String

        # Amazon S3 bucket where you want DMS to store the results of this assessment run.

        @[JSON::Field(key: "ResultLocationBucket")]
        getter result_location_bucket : String

        # ARN of the service role needed to start the assessment run. The role must allow the iam:PassRole
        # action.

        @[JSON::Field(key: "ServiceAccessRoleArn")]
        getter service_access_role_arn : String

        # Space-separated list of names for specific individual assessments that you want to exclude. These
        # names come from the default list of individual assessments that DMS supports for the associated
        # migration task. This task is specified by ReplicationTaskArn . You can't set a value for Exclude if
        # you also set a value for IncludeOnly in the API operation. To identify the names of the default
        # individual assessments that DMS supports for the associated migration task, run the
        # DescribeApplicableIndividualAssessments operation using its own ReplicationTaskArn request
        # parameter.

        @[JSON::Field(key: "Exclude")]
        getter exclude : Array(String)?

        # Space-separated list of names for specific individual assessments that you want to include. These
        # names come from the default list of individual assessments that DMS supports for the associated
        # migration task. This task is specified by ReplicationTaskArn . You can't set a value for IncludeOnly
        # if you also set a value for Exclude in the API operation. To identify the names of the default
        # individual assessments that DMS supports for the associated migration task, run the
        # DescribeApplicableIndividualAssessments operation using its own ReplicationTaskArn request
        # parameter.

        @[JSON::Field(key: "IncludeOnly")]
        getter include_only : Array(String)?

        # Encryption mode that you can specify to encrypt the results of this assessment run. If you don't
        # specify this request parameter, DMS stores the assessment run results without encryption. You can
        # specify one of the options following: "SSE_S3" – The server-side encryption provided as a default by
        # Amazon S3. "SSE_KMS" – Key Management Service (KMS) encryption. This encryption can use either a
        # custom KMS encryption key that you specify or the default KMS encryption key that DMS provides.

        @[JSON::Field(key: "ResultEncryptionMode")]
        getter result_encryption_mode : String?

        # ARN of a custom KMS encryption key that you specify when you set ResultEncryptionMode to "SSE_KMS ".

        @[JSON::Field(key: "ResultKmsKeyArn")]
        getter result_kms_key_arn : String?

        # Folder within an Amazon S3 bucket where you want DMS to store the results of this assessment run.

        @[JSON::Field(key: "ResultLocationFolder")]
        getter result_location_folder : String?

        # One or more tags to be assigned to the premigration assessment run that you want to start.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @assessment_run_name : String,
          @replication_task_arn : String,
          @result_location_bucket : String,
          @service_access_role_arn : String,
          @exclude : Array(String)? = nil,
          @include_only : Array(String)? = nil,
          @result_encryption_mode : String? = nil,
          @result_kms_key_arn : String? = nil,
          @result_location_folder : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartReplicationTaskAssessmentRunResponse
        include JSON::Serializable

        # The premigration assessment run that was started.

        @[JSON::Field(key: "ReplicationTaskAssessmentRun")]
        getter replication_task_assessment_run : Types::ReplicationTaskAssessmentRun?

        def initialize(
          @replication_task_assessment_run : Types::ReplicationTaskAssessmentRun? = nil
        )
        end
      end


      struct StartReplicationTaskMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication task to be started.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String

        # The type of replication task to start. start-replication is the only valid action that can be used
        # for the first time a task with the migration type of full-load full-load, full-load-and-cdc or cdc
        # is run. Any other action used for the first time on a given task, such as resume-processing and
        # reload-target will result in data errors. You can also use ReloadTables to reload specific tables
        # that failed during migration instead of restarting the task. For a full-load task, the
        # resume-processing option will reload any tables that were partially loaded or not yet loaded during
        # the full load phase. For a full-load-and-cdc task, DMS migrates table data, and then applies data
        # changes that occur on the source. To load all the tables again, and start capturing source changes,
        # use reload-target . Otherwise use resume-processing , to replicate the changes from the last stop
        # position. For a cdc only task, to start from a specific position, you must use start-replication and
        # also specify the start position. Check the source endpoint DMS documentation for any limitations.
        # For example, not all sources support starting from a time. resume-processing is only available for
        # previously executed tasks.

        @[JSON::Field(key: "StartReplicationTaskType")]
        getter start_replication_task_type : String

        # Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition
        # or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in
        # an error. The value can be in date, checkpoint, or LSN/SCN format. Date Example:
        # --cdc-start-position “2018-03-08T12:12:12” Checkpoint Example: --cdc-start-position
        # "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
        # LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373” When you use this task setting
        # with a source PostgreSQL database, a logical replication slot should already be created and
        # associated with the source endpoint. You can verify this by setting the slotName extra connection
        # attribute to the name of this logical replication slot. For more information, see Extra Connection
        # Attributes When Using PostgreSQL as a Source for DMS .

        @[JSON::Field(key: "CdcStartPosition")]
        getter cdc_start_position : String?

        # Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or
        # CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results
        # in an error. Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”

        @[JSON::Field(key: "CdcStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cdc_start_time : Time?

        # Indicates when you want a change data capture (CDC) operation to stop. The value can be either
        # server time or commit time. Server time example: --cdc-stop-position
        # “server_time:2018-02-09T12:12:12” Commit time example: --cdc-stop-position
        # “commit_time:2018-02-09T12:12:12“

        @[JSON::Field(key: "CdcStopPosition")]
        getter cdc_stop_position : String?

        def initialize(
          @replication_task_arn : String,
          @start_replication_task_type : String,
          @cdc_start_position : String? = nil,
          @cdc_start_time : Time? = nil,
          @cdc_stop_position : String? = nil
        )
        end
      end


      struct StartReplicationTaskResponse
        include JSON::Serializable

        # The replication task started.

        @[JSON::Field(key: "ReplicationTask")]
        getter replication_task : Types::ReplicationTask?

        def initialize(
          @replication_task : Types::ReplicationTask? = nil
        )
        end
      end

      # The properties of the statement for metadata model creation.

      struct StatementProperties
        include JSON::Serializable

        # The SQL text of the statement.

        @[JSON::Field(key: "Definition")]
        getter definition : String

        def initialize(
          @definition : String
        )
        end
      end


      struct StopDataMigrationMessage
        include JSON::Serializable

        # The identifier (name or ARN) of the data migration to stop.

        @[JSON::Field(key: "DataMigrationIdentifier")]
        getter data_migration_identifier : String

        def initialize(
          @data_migration_identifier : String
        )
        end
      end


      struct StopDataMigrationResponse
        include JSON::Serializable

        # The data migration that DMS stopped.

        @[JSON::Field(key: "DataMigration")]
        getter data_migration : Types::DataMigration?

        def initialize(
          @data_migration : Types::DataMigration? = nil
        )
        end
      end


      struct StopReplicationMessage
        include JSON::Serializable

        # The Amazon Resource Name of the replication to stop.

        @[JSON::Field(key: "ReplicationConfigArn")]
        getter replication_config_arn : String

        def initialize(
          @replication_config_arn : String
        )
        end
      end


      struct StopReplicationResponse
        include JSON::Serializable

        # The replication that DMS stopped.

        @[JSON::Field(key: "Replication")]
        getter replication : Types::Replication?

        def initialize(
          @replication : Types::Replication? = nil
        )
        end
      end


      struct StopReplicationTaskMessage
        include JSON::Serializable

        # The Amazon Resource Name(ARN) of the replication task to be stopped.

        @[JSON::Field(key: "ReplicationTaskArn")]
        getter replication_task_arn : String

        def initialize(
          @replication_task_arn : String
        )
        end
      end


      struct StopReplicationTaskResponse
        include JSON::Serializable

        # The replication task stopped.

        @[JSON::Field(key: "ReplicationTask")]
        getter replication_task : Types::ReplicationTask?

        def initialize(
          @replication_task : Types::ReplicationTask? = nil
        )
        end
      end

      # The storage quota has been exceeded.

      struct StorageQuotaExceededFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # In response to a request by the DescribeReplicationSubnetGroups operation, this object identifies a
      # subnet by its given Availability Zone, subnet identifier, and status.

      struct Subnet
        include JSON::Serializable

        # The Availability Zone of the subnet.

        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : Types::AvailabilityZone?

        # The subnet identifier.

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

      # The specified subnet is already in use.

      struct SubnetAlreadyInUse
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about types of supported endpoints in response to a request by the
      # DescribeEndpointTypes operation. This information includes the type of endpoint, the database engine
      # name, and whether change data capture (CDC) is supported.

      struct SupportedEndpointType
        include JSON::Serializable

        # The type of endpoint. Valid values are source and target .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The expanded name for the engine name. For example, if the EngineName parameter is "aurora", this
        # value would be "Amazon Aurora MySQL".

        @[JSON::Field(key: "EngineDisplayName")]
        getter engine_display_name : String?

        # The database engine name. Valid values, depending on the EndpointType, include "mysql" , "oracle" ,
        # "postgres" , "mariadb" , "aurora" , "aurora-postgresql" , "redshift" , "s3" , "db2" , "db2-zos" ,
        # "azuredb" , "sybase" , "dynamodb" , "mongodb" , "kinesis" , "kafka" , "elasticsearch" , "documentdb"
        # , "sqlserver" , "neptune" , and "babelfish" .

        @[JSON::Field(key: "EngineName")]
        getter engine_name : String?

        # The earliest DMS engine version that supports this endpoint engine. Note that endpoint engines
        # released with DMS versions earlier than 3.1.1 do not return a value for this parameter.

        @[JSON::Field(key: "ReplicationInstanceEngineMinimumVersion")]
        getter replication_instance_engine_minimum_version : String?

        # Indicates if change data capture (CDC) is supported.

        @[JSON::Field(key: "SupportsCDC")]
        getter supports_cdc : Bool?

        def initialize(
          @endpoint_type : String? = nil,
          @engine_display_name : String? = nil,
          @engine_name : String? = nil,
          @replication_instance_engine_minimum_version : String? = nil,
          @supports_cdc : Bool? = nil
        )
        end
      end

      # Provides information that defines an SAP ASE data provider.

      struct SybaseAseDataProviderSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate used for SSL connection.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The database name on the SAP ASE data provider.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Specifies whether to encrypt the password when connecting to the Sybase ASE database. When set to
        # true, the connection password is encrypted during transmission. Default is true.

        @[JSON::Field(key: "EncryptPassword")]
        getter encrypt_password : Bool?

        # The port value for the SAP ASE data provider.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The name of the SAP ASE server.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The SSL mode used to connect to the SAP ASE data provider. The default value is none .

        @[JSON::Field(key: "SslMode")]
        getter ssl_mode : String?

        def initialize(
          @certificate_arn : String? = nil,
          @database_name : String? = nil,
          @encrypt_password : Bool? = nil,
          @port : Int32? = nil,
          @server_name : String? = nil,
          @ssl_mode : String? = nil
        )
        end
      end

      # Provides information that defines a SAP ASE endpoint.

      struct SybaseSettings
        include JSON::Serializable

        # Database name for the endpoint.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Endpoint connection password.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # Endpoint TCP port. The default is 5000.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted entity and
        # grants the required permissions to access the value in SecretsManagerSecret . The role must allow
        # the iam:PassRole action. SecretsManagerSecret has the value of the Amazon Web Services Secrets
        # Manager secret that allows access to the SAP ASE endpoint. You can specify one of two sets of values
        # for these permissions. You can specify the values for this setting and SecretsManagerSecretId . Or
        # you can specify clear-text values for UserName , Password , ServerName , and Port . You can't
        # specify both. For more information on creating this SecretsManagerSecret and the
        # SecretsManagerAccessRoleArn and SecretsManagerSecretId required to access it, see Using secrets to
        # access Database Migration Service resources in the Database Migration Service User Guide .

        @[JSON::Field(key: "SecretsManagerAccessRoleArn")]
        getter secrets_manager_access_role_arn : String?

        # The full ARN, partial ARN, or friendly name of the SecretsManagerSecret that contains the SAP SAE
        # endpoint connection details.

        @[JSON::Field(key: "SecretsManagerSecretId")]
        getter secrets_manager_secret_id : String?

        # Fully qualified domain name of the endpoint.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # Endpoint connection user name.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @database_name : String? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @secrets_manager_access_role_arn : String? = nil,
          @secrets_manager_secret_id : String? = nil,
          @server_name : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Provides a collection of table statistics in response to a request by the DescribeTableStatistics
      # operation.

      struct TableStatistics
        include JSON::Serializable

        # The number of data definition language (DDL) statements used to build and modify the structure of
        # your tables applied on the target.

        @[JSON::Field(key: "AppliedDdls")]
        getter applied_ddls : Int64?

        # The number of delete actions applied on a target table.

        @[JSON::Field(key: "AppliedDeletes")]
        getter applied_deletes : Int64?

        # The number of insert actions applied on a target table.

        @[JSON::Field(key: "AppliedInserts")]
        getter applied_inserts : Int64?

        # The number of update actions applied on a target table.

        @[JSON::Field(key: "AppliedUpdates")]
        getter applied_updates : Int64?

        # The data definition language (DDL) used to build and modify the structure of your tables.

        @[JSON::Field(key: "Ddls")]
        getter ddls : Int64?

        # The number of delete actions performed on a table.

        @[JSON::Field(key: "Deletes")]
        getter deletes : Int64?

        # The number of rows that failed conditional checks during the full load operation (valid only for
        # migrations where DynamoDB is the target).

        @[JSON::Field(key: "FullLoadCondtnlChkFailedRows")]
        getter full_load_condtnl_chk_failed_rows : Int64?

        # The time when the full load operation completed.

        @[JSON::Field(key: "FullLoadEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter full_load_end_time : Time?

        # The number of rows that failed to load during the full load operation (valid only for migrations
        # where DynamoDB is the target).

        @[JSON::Field(key: "FullLoadErrorRows")]
        getter full_load_error_rows : Int64?

        # A value that indicates if the table was reloaded ( true ) or loaded as part of a new full load
        # operation ( false ).

        @[JSON::Field(key: "FullLoadReloaded")]
        getter full_load_reloaded : Bool?

        # The number of rows added during the full load operation.

        @[JSON::Field(key: "FullLoadRows")]
        getter full_load_rows : Int64?

        # The time when the full load operation started.

        @[JSON::Field(key: "FullLoadStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter full_load_start_time : Time?

        # The number of insert actions performed on a table.

        @[JSON::Field(key: "Inserts")]
        getter inserts : Int64?

        # The last time a table was updated.

        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # Calculates the percentage of failed validations that were successfully resynced to the system.

        @[JSON::Field(key: "ResyncProgress")]
        getter resync_progress : Float64?

        # Records the total number of mismatched data rows where the system attempted to apply fixes in the
        # target database.

        @[JSON::Field(key: "ResyncRowsAttempted")]
        getter resync_rows_attempted : Int64?

        # Records the total number of mismatched data rows where fix attempts failed in the target database.

        @[JSON::Field(key: "ResyncRowsFailed")]
        getter resync_rows_failed : Int64?

        # Records the total number of mismatched data rows where fixes were successfully applied in the target
        # database.

        @[JSON::Field(key: "ResyncRowsSucceeded")]
        getter resync_rows_succeeded : Int64?

        # Records the current state of table resynchronization in the migration task. This parameter can have
        # the following values: Not enabled – Resync is not enabled for the table in the migration task.
        # Pending – The tables are waiting for resync. In progress – Resync in progress for some records in
        # the table. No primary key – The table could not be resynced because it has no primary key. Last
        # resync at: date/time – Resync session is finished at time. Time provided in UTC format.

        @[JSON::Field(key: "ResyncState")]
        getter resync_state : String?

        # The schema name.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        # The name of the table.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # The state of the tables described. Valid states: Table does not exist | Before load | Full load |
        # Table completed | Table cancelled | Table error | Table is being reloaded

        @[JSON::Field(key: "TableState")]
        getter table_state : String?

        # The number of update actions performed on a table.

        @[JSON::Field(key: "Updates")]
        getter updates : Int64?

        # The number of records that failed validation.

        @[JSON::Field(key: "ValidationFailedRecords")]
        getter validation_failed_records : Int64?

        # The number of records that have yet to be validated.

        @[JSON::Field(key: "ValidationPendingRecords")]
        getter validation_pending_records : Int64?

        # The validation state of the table. This parameter can have the following values: Not enabled –
        # Validation isn't enabled for the table in the migration task. Pending records – Some records in the
        # table are waiting for validation. Mismatched records – Some records in the table don't match between
        # the source and target. Suspended records – Some records in the table couldn't be validated. No
        # primary key –The table couldn't be validated because it has no primary key. Table error – The table
        # wasn't validated because it's in an error state and some data wasn't migrated. Validated – All rows
        # in the table are validated. If the table is updated, the status can change from Validated. Error –
        # The table couldn't be validated because of an unexpected error. Pending validation – The table is
        # waiting validation. Preparing table – Preparing the table enabled in the migration task for
        # validation. Pending revalidation – All rows in the table are pending validation after the table was
        # updated.

        @[JSON::Field(key: "ValidationState")]
        getter validation_state : String?

        # Additional details about the state of validation.

        @[JSON::Field(key: "ValidationStateDetails")]
        getter validation_state_details : String?

        # The number of records that couldn't be validated.

        @[JSON::Field(key: "ValidationSuspendedRecords")]
        getter validation_suspended_records : Int64?

        def initialize(
          @applied_ddls : Int64? = nil,
          @applied_deletes : Int64? = nil,
          @applied_inserts : Int64? = nil,
          @applied_updates : Int64? = nil,
          @ddls : Int64? = nil,
          @deletes : Int64? = nil,
          @full_load_condtnl_chk_failed_rows : Int64? = nil,
          @full_load_end_time : Time? = nil,
          @full_load_error_rows : Int64? = nil,
          @full_load_reloaded : Bool? = nil,
          @full_load_rows : Int64? = nil,
          @full_load_start_time : Time? = nil,
          @inserts : Int64? = nil,
          @last_update_time : Time? = nil,
          @resync_progress : Float64? = nil,
          @resync_rows_attempted : Int64? = nil,
          @resync_rows_failed : Int64? = nil,
          @resync_rows_succeeded : Int64? = nil,
          @resync_state : String? = nil,
          @schema_name : String? = nil,
          @table_name : String? = nil,
          @table_state : String? = nil,
          @updates : Int64? = nil,
          @validation_failed_records : Int64? = nil,
          @validation_pending_records : Int64? = nil,
          @validation_state : String? = nil,
          @validation_state_details : String? = nil,
          @validation_suspended_records : Int64? = nil
        )
        end
      end

      # Provides the name of the schema and table to be reloaded.

      struct TableToReload
        include JSON::Serializable

        # The schema name of the table to be reloaded.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String

        # The table name of the table to be reloaded.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @schema_name : String,
          @table_name : String
        )
        end
      end

      # A user-defined key-value pair that describes metadata added to an DMS resource and that is used by
      # operations such as the following: AddTagsToResource ListTagsForResource RemoveTagsFromResource

      struct Tag
        include JSON::Serializable

        # A key is the required name of the tag. The string value can be 1-128 Unicode characters in length
        # and can't be prefixed with "aws:" or "dms:". The string can only contain only the set of Unicode
        # letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regular expressions:
        # "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The Amazon Resource Name (ARN) string that uniquely identifies the resource for which the tag is
        # created.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # A value is the optional value of the tag. The string value can be 1-256 Unicode characters in length
        # and can't be prefixed with "aws:" or "dms:". The string can only contain only the set of Unicode
        # letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regular expressions:
        # "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @resource_arn : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Defines settings for a target data provider for a data migration.

      struct TargetDataSetting
        include JSON::Serializable

        # This setting determines how DMS handles the target tables before starting a data migration, either
        # by leaving them untouched, dropping and recreating them, or truncating the existing data in the
        # target tables.

        @[JSON::Field(key: "TablePreparationMode")]
        getter table_preparation_mode : String?

        def initialize(
          @table_preparation_mode : String? = nil
        )
        end
      end


      struct TestConnectionMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        # The Amazon Resource Name (ARN) of the replication instance.

        @[JSON::Field(key: "ReplicationInstanceArn")]
        getter replication_instance_arn : String

        def initialize(
          @endpoint_arn : String,
          @replication_instance_arn : String
        )
        end
      end


      struct TestConnectionResponse
        include JSON::Serializable

        # The connection tested.

        @[JSON::Field(key: "Connection")]
        getter connection : Types::Connection?

        def initialize(
          @connection : Types::Connection? = nil
        )
        end
      end

      # Provides information that defines an Amazon Timestream endpoint.

      struct TimestreamSettings
        include JSON::Serializable

        # Database name for the endpoint.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # Set this attribute to specify the default magnetic duration applied to the Amazon Timestream tables
        # in days. This is the number of days that records remain in magnetic store before being discarded.
        # For more information, see Storage in the Amazon Timestream Developer Guide .

        @[JSON::Field(key: "MagneticDuration")]
        getter magnetic_duration : Int32

        # Set this attribute to specify the length of time to store all of the tables in memory that are
        # migrated into Amazon Timestream from the source database. Time is measured in units of hours. When
        # Timestream data comes in, it first resides in memory for the specified duration, which allows quick
        # access to it.

        @[JSON::Field(key: "MemoryDuration")]
        getter memory_duration : Int32

        # Set this attribute to true to specify that DMS only applies inserts and updates, and not deletes.
        # Amazon Timestream does not allow deleting records, so if this value is false , DMS nulls out the
        # corresponding record in the Timestream database rather than deleting it.

        @[JSON::Field(key: "CdcInsertsAndUpdates")]
        getter cdc_inserts_and_updates : Bool?

        # Set this attribute to true to enable memory store writes. When this value is false , DMS does not
        # write records that are older in days than the value specified in MagneticDuration , because Amazon
        # Timestream does not allow memory writes by default. For more information, see Storage in the Amazon
        # Timestream Developer Guide .

        @[JSON::Field(key: "EnableMagneticStoreWrites")]
        getter enable_magnetic_store_writes : Bool?

        def initialize(
          @database_name : String,
          @magnetic_duration : Int32,
          @memory_duration : Int32,
          @cdc_inserts_and_updates : Bool? = nil,
          @enable_magnetic_store_writes : Bool? = nil
        )
        end
      end


      struct UpdateSubscriptionsToEventBridgeMessage
        include JSON::Serializable

        # When set to true, this operation migrates DMS subscriptions for Amazon SNS notifications no matter
        # what your replication instance version is. If not set or set to false, this operation runs only when
        # all your replication instances are from DMS version 3.4.5 or higher.

        @[JSON::Field(key: "ForceMove")]
        getter force_move : Bool?

        def initialize(
          @force_move : Bool? = nil
        )
        end
      end


      struct UpdateSubscriptionsToEventBridgeResponse
        include JSON::Serializable

        # A string that indicates how many event subscriptions were migrated and how many remain to be
        # migrated.

        @[JSON::Field(key: "Result")]
        getter result : String?

        def initialize(
          @result : String? = nil
        )
        end
      end

      # An upgrade dependency is preventing the database migration.

      struct UpgradeDependencyFailureFault
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the status of a security group associated with the virtual private cloud (VPC) hosting
      # your replication and DB instances.

      struct VpcSecurityGroupMembership
        include JSON::Serializable

        # The status of the VPC security group.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The VPC security group ID.

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
