require "json"
require "time"

module AwsSdk
  module KinesisAnalyticsV2
    module Types


      struct AddApplicationCloudWatchLoggingOptionRequest
        include JSON::Serializable

        # The Kinesis Data Analytics application name.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Provides the Amazon CloudWatch log stream Amazon Resource Name (ARN).

        @[JSON::Field(key: "CloudWatchLoggingOption")]
        getter cloud_watch_logging_option : Types::CloudWatchLoggingOption

        # A value you use to implement strong concurrency for application updates. You must provide the
        # CurrentApplicationVersionId or the ConditionalToken . You get the application's current
        # ConditionalToken using DescribeApplication . For better concurrency support, use the
        # ConditionalToken parameter instead of CurrentApplicationVersionId .

        @[JSON::Field(key: "ConditionalToken")]
        getter conditional_token : String?

        # The version ID of the SQL-based Kinesis Data Analytics application. You must provide the
        # CurrentApplicationVersionId or the ConditionalToken .You can retrieve the application version ID
        # using DescribeApplication . For better concurrency support, use the ConditionalToken parameter
        # instead of CurrentApplicationVersionId .

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64?

        def initialize(
          @application_name : String,
          @cloud_watch_logging_option : Types::CloudWatchLoggingOption,
          @conditional_token : String? = nil,
          @current_application_version_id : Int64? = nil
        )
        end
      end


      struct AddApplicationCloudWatchLoggingOptionResponse
        include JSON::Serializable

        # The application's ARN.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # The new version ID of the SQL-based Kinesis Data Analytics application. Kinesis Data Analytics
        # updates the ApplicationVersionId each time you change the CloudWatch logging options.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        # The descriptions of the current CloudWatch logging options for the SQL-based Kinesis Data Analytics
        # application.

        @[JSON::Field(key: "CloudWatchLoggingOptionDescriptions")]
        getter cloud_watch_logging_option_descriptions : Array(Types::CloudWatchLoggingOptionDescription)?

        # The operation ID that can be used to track the request.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil,
          @cloud_watch_logging_option_descriptions : Array(Types::CloudWatchLoggingOptionDescription)? = nil,
          @operation_id : String? = nil
        )
        end
      end


      struct AddApplicationInputProcessingConfigurationRequest
        include JSON::Serializable

        # The name of the application to which you want to add the input processing configuration.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The version of the application to which you want to add the input processing configuration. You can
        # use the DescribeApplication operation to get the current application version. If the version
        # specified is not the current version, the ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The ID of the input configuration to add the input processing configuration to. You can get a list
        # of the input IDs for an application using the DescribeApplication operation.

        @[JSON::Field(key: "InputId")]
        getter input_id : String

        # The InputProcessingConfiguration to add to the application.

        @[JSON::Field(key: "InputProcessingConfiguration")]
        getter input_processing_configuration : Types::InputProcessingConfiguration

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @input_id : String,
          @input_processing_configuration : Types::InputProcessingConfiguration
        )
        end
      end


      struct AddApplicationInputProcessingConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # Provides the current application version.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        # The input ID that is associated with the application input. This is the ID that Kinesis Data
        # Analytics assigns to each input configuration that you add to your application.

        @[JSON::Field(key: "InputId")]
        getter input_id : String?

        # The description of the preprocessor that executes on records in this input before the application's
        # code is run.

        @[JSON::Field(key: "InputProcessingConfigurationDescription")]
        getter input_processing_configuration_description : Types::InputProcessingConfigurationDescription?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil,
          @input_id : String? = nil,
          @input_processing_configuration_description : Types::InputProcessingConfigurationDescription? = nil
        )
        end
      end


      struct AddApplicationInputRequest
        include JSON::Serializable

        # The name of your existing application to which you want to add the streaming source.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The current version of your application. You must provide the ApplicationVersionID or the
        # ConditionalToken .You can use the DescribeApplication operation to find the current application
        # version.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The Input to add.

        @[JSON::Field(key: "Input")]
        getter input : Types::Input

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @input : Types::Input
        )
        end
      end


      struct AddApplicationInputResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # Provides the current application version.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        # Describes the application input configuration.

        @[JSON::Field(key: "InputDescriptions")]
        getter input_descriptions : Array(Types::InputDescription)?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil,
          @input_descriptions : Array(Types::InputDescription)? = nil
        )
        end
      end


      struct AddApplicationOutputRequest
        include JSON::Serializable

        # The name of the application to which you want to add the output configuration.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The version of the application to which you want to add the output configuration. You can use the
        # DescribeApplication operation to get the current application version. If the version specified is
        # not the current version, the ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # An array of objects, each describing one output configuration. In the output configuration, you
        # specify the name of an in-application stream, a destination (that is, a Kinesis data stream, a
        # Kinesis Data Firehose delivery stream, or an Amazon Lambda function), and record the formation to
        # use when writing to the destination.

        @[JSON::Field(key: "Output")]
        getter output : Types::Output

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @output : Types::Output
        )
        end
      end


      struct AddApplicationOutputResponse
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # The updated application version ID. Kinesis Data Analytics increments this ID when the application
        # is updated.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        # Describes the application output configuration. For more information, see Configuring Application
        # Output .

        @[JSON::Field(key: "OutputDescriptions")]
        getter output_descriptions : Array(Types::OutputDescription)?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil,
          @output_descriptions : Array(Types::OutputDescription)? = nil
        )
        end
      end


      struct AddApplicationReferenceDataSourceRequest
        include JSON::Serializable

        # The name of an existing application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The version of the application for which you are adding the reference data source. You can use the
        # DescribeApplication operation to get the current application version. If the version specified is
        # not the current version, the ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The reference data source can be an object in your Amazon S3 bucket. Kinesis Data Analytics reads
        # the object and copies the data into the in-application table that is created. You provide an S3
        # bucket, object key name, and the resulting in-application table that is created.

        @[JSON::Field(key: "ReferenceDataSource")]
        getter reference_data_source : Types::ReferenceDataSource

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @reference_data_source : Types::ReferenceDataSource
        )
        end
      end


      struct AddApplicationReferenceDataSourceResponse
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # The updated application version ID. Kinesis Data Analytics increments this ID when the application
        # is updated.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        # Describes reference data sources configured for the application.

        @[JSON::Field(key: "ReferenceDataSourceDescriptions")]
        getter reference_data_source_descriptions : Array(Types::ReferenceDataSourceDescription)?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil,
          @reference_data_source_descriptions : Array(Types::ReferenceDataSourceDescription)? = nil
        )
        end
      end


      struct AddApplicationVpcConfigurationRequest
        include JSON::Serializable

        # The name of an existing application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Description of the VPC to add to the application.

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration

        # A value you use to implement strong concurrency for application updates. You must provide the
        # ApplicationVersionID or the ConditionalToken . You get the application's current ConditionalToken
        # using DescribeApplication . For better concurrency support, use the ConditionalToken parameter
        # instead of CurrentApplicationVersionId .

        @[JSON::Field(key: "ConditionalToken")]
        getter conditional_token : String?

        # The version of the application to which you want to add the VPC configuration. You must provide the
        # CurrentApplicationVersionId or the ConditionalToken . You can use the DescribeApplication operation
        # to get the current application version. If the version specified is not the current version, the
        # ConcurrentModificationException is returned. For better concurrency support, use the
        # ConditionalToken parameter instead of CurrentApplicationVersionId .

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64?

        def initialize(
          @application_name : String,
          @vpc_configuration : Types::VpcConfiguration,
          @conditional_token : String? = nil,
          @current_application_version_id : Int64? = nil
        )
        end
      end


      struct AddApplicationVpcConfigurationResponse
        include JSON::Serializable

        # The ARN of the application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # Provides the current application version. Managed Service for Apache Flink updates the
        # ApplicationVersionId each time you update the application.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        # The operation ID that can be used to track the request.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The parameters of the new VPC configuration.

        @[JSON::Field(key: "VpcConfigurationDescription")]
        getter vpc_configuration_description : Types::VpcConfigurationDescription?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil,
          @operation_id : String? = nil,
          @vpc_configuration_description : Types::VpcConfigurationDescription? = nil
        )
        end
      end

      # Describes code configuration for an application.

      struct ApplicationCodeConfiguration
        include JSON::Serializable

        # Specifies whether the code content is in text or zip format.

        @[JSON::Field(key: "CodeContentType")]
        getter code_content_type : String

        # The location and type of the application code.

        @[JSON::Field(key: "CodeContent")]
        getter code_content : Types::CodeContent?

        def initialize(
          @code_content_type : String,
          @code_content : Types::CodeContent? = nil
        )
        end
      end

      # Describes code configuration for an application.

      struct ApplicationCodeConfigurationDescription
        include JSON::Serializable

        # Specifies whether the code content is in text or zip format.

        @[JSON::Field(key: "CodeContentType")]
        getter code_content_type : String

        # Describes details about the location and format of the application code.

        @[JSON::Field(key: "CodeContentDescription")]
        getter code_content_description : Types::CodeContentDescription?

        def initialize(
          @code_content_type : String,
          @code_content_description : Types::CodeContentDescription? = nil
        )
        end
      end

      # Describes code configuration updates for an application. This is supported for a Managed Service for
      # Apache Flink application or a SQL-based Kinesis Data Analytics application.

      struct ApplicationCodeConfigurationUpdate
        include JSON::Serializable

        # Describes updates to the code content type.

        @[JSON::Field(key: "CodeContentTypeUpdate")]
        getter code_content_type_update : String?

        # Describes updates to the code content of an application.

        @[JSON::Field(key: "CodeContentUpdate")]
        getter code_content_update : Types::CodeContentUpdate?

        def initialize(
          @code_content_type_update : String? = nil,
          @code_content_update : Types::CodeContentUpdate? = nil
        )
        end
      end

      # Specifies the creation parameters for a Managed Service for Apache Flink application.

      struct ApplicationConfiguration
        include JSON::Serializable

        # The code location and type parameters for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "ApplicationCodeConfiguration")]
        getter application_code_configuration : Types::ApplicationCodeConfiguration?

        # The configuration to manage encryption at rest.

        @[JSON::Field(key: "ApplicationEncryptionConfiguration")]
        getter application_encryption_configuration : Types::ApplicationEncryptionConfiguration?

        # Describes whether snapshots are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "ApplicationSnapshotConfiguration")]
        getter application_snapshot_configuration : Types::ApplicationSnapshotConfiguration?

        # Describes whether system rollbacks are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "ApplicationSystemRollbackConfiguration")]
        getter application_system_rollback_configuration : Types::ApplicationSystemRollbackConfiguration?

        # Describes execution properties for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "EnvironmentProperties")]
        getter environment_properties : Types::EnvironmentProperties?

        # The creation and update parameters for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "FlinkApplicationConfiguration")]
        getter flink_application_configuration : Types::FlinkApplicationConfiguration?

        # The creation and update parameters for a SQL-based Kinesis Data Analytics application.

        @[JSON::Field(key: "SqlApplicationConfiguration")]
        getter sql_application_configuration : Types::SqlApplicationConfiguration?

        # The array of descriptions of VPC configurations available to the application.

        @[JSON::Field(key: "VpcConfigurations")]
        getter vpc_configurations : Array(Types::VpcConfiguration)?

        # The configuration parameters for a Managed Service for Apache Flink Studio notebook.

        @[JSON::Field(key: "ZeppelinApplicationConfiguration")]
        getter zeppelin_application_configuration : Types::ZeppelinApplicationConfiguration?

        def initialize(
          @application_code_configuration : Types::ApplicationCodeConfiguration? = nil,
          @application_encryption_configuration : Types::ApplicationEncryptionConfiguration? = nil,
          @application_snapshot_configuration : Types::ApplicationSnapshotConfiguration? = nil,
          @application_system_rollback_configuration : Types::ApplicationSystemRollbackConfiguration? = nil,
          @environment_properties : Types::EnvironmentProperties? = nil,
          @flink_application_configuration : Types::FlinkApplicationConfiguration? = nil,
          @sql_application_configuration : Types::SqlApplicationConfiguration? = nil,
          @vpc_configurations : Array(Types::VpcConfiguration)? = nil,
          @zeppelin_application_configuration : Types::ZeppelinApplicationConfiguration? = nil
        )
        end
      end

      # Describes details about the application code and starting parameters for a Managed Service for
      # Apache Flink application.

      struct ApplicationConfigurationDescription
        include JSON::Serializable

        # The details about the application code for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "ApplicationCodeConfigurationDescription")]
        getter application_code_configuration_description : Types::ApplicationCodeConfigurationDescription?

        # Describes the encryption at rest configuration.

        @[JSON::Field(key: "ApplicationEncryptionConfigurationDescription")]
        getter application_encryption_configuration_description : Types::ApplicationEncryptionConfigurationDescription?

        # Describes whether snapshots are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "ApplicationSnapshotConfigurationDescription")]
        getter application_snapshot_configuration_description : Types::ApplicationSnapshotConfigurationDescription?

        # Describes whether system rollbacks are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "ApplicationSystemRollbackConfigurationDescription")]
        getter application_system_rollback_configuration_description : Types::ApplicationSystemRollbackConfigurationDescription?

        # Describes execution properties for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "EnvironmentPropertyDescriptions")]
        getter environment_property_descriptions : Types::EnvironmentPropertyDescriptions?

        # The details about a Managed Service for Apache Flink application.

        @[JSON::Field(key: "FlinkApplicationConfigurationDescription")]
        getter flink_application_configuration_description : Types::FlinkApplicationConfigurationDescription?

        # The details about the starting properties for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "RunConfigurationDescription")]
        getter run_configuration_description : Types::RunConfigurationDescription?

        # The details about inputs, outputs, and reference data sources for a SQL-based Kinesis Data Analytics
        # application.

        @[JSON::Field(key: "SqlApplicationConfigurationDescription")]
        getter sql_application_configuration_description : Types::SqlApplicationConfigurationDescription?

        # The array of descriptions of VPC configurations available to the application.

        @[JSON::Field(key: "VpcConfigurationDescriptions")]
        getter vpc_configuration_descriptions : Array(Types::VpcConfigurationDescription)?

        # The configuration parameters for a Managed Service for Apache Flink Studio notebook.

        @[JSON::Field(key: "ZeppelinApplicationConfigurationDescription")]
        getter zeppelin_application_configuration_description : Types::ZeppelinApplicationConfigurationDescription?

        def initialize(
          @application_code_configuration_description : Types::ApplicationCodeConfigurationDescription? = nil,
          @application_encryption_configuration_description : Types::ApplicationEncryptionConfigurationDescription? = nil,
          @application_snapshot_configuration_description : Types::ApplicationSnapshotConfigurationDescription? = nil,
          @application_system_rollback_configuration_description : Types::ApplicationSystemRollbackConfigurationDescription? = nil,
          @environment_property_descriptions : Types::EnvironmentPropertyDescriptions? = nil,
          @flink_application_configuration_description : Types::FlinkApplicationConfigurationDescription? = nil,
          @run_configuration_description : Types::RunConfigurationDescription? = nil,
          @sql_application_configuration_description : Types::SqlApplicationConfigurationDescription? = nil,
          @vpc_configuration_descriptions : Array(Types::VpcConfigurationDescription)? = nil,
          @zeppelin_application_configuration_description : Types::ZeppelinApplicationConfigurationDescription? = nil
        )
        end
      end

      # Describes updates to an application's configuration.

      struct ApplicationConfigurationUpdate
        include JSON::Serializable

        # Describes updates to an application's code configuration.

        @[JSON::Field(key: "ApplicationCodeConfigurationUpdate")]
        getter application_code_configuration_update : Types::ApplicationCodeConfigurationUpdate?

        # Represents an update for encryption at rest configuration.

        @[JSON::Field(key: "ApplicationEncryptionConfigurationUpdate")]
        getter application_encryption_configuration_update : Types::ApplicationEncryptionConfigurationUpdate?

        # Describes whether snapshots are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "ApplicationSnapshotConfigurationUpdate")]
        getter application_snapshot_configuration_update : Types::ApplicationSnapshotConfigurationUpdate?

        # Describes whether system rollbacks are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "ApplicationSystemRollbackConfigurationUpdate")]
        getter application_system_rollback_configuration_update : Types::ApplicationSystemRollbackConfigurationUpdate?

        # Describes updates to the environment properties for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "EnvironmentPropertyUpdates")]
        getter environment_property_updates : Types::EnvironmentPropertyUpdates?

        # Describes updates to a Managed Service for Apache Flink application's configuration.

        @[JSON::Field(key: "FlinkApplicationConfigurationUpdate")]
        getter flink_application_configuration_update : Types::FlinkApplicationConfigurationUpdate?

        # Describes updates to a SQL-based Kinesis Data Analytics application's configuration.

        @[JSON::Field(key: "SqlApplicationConfigurationUpdate")]
        getter sql_application_configuration_update : Types::SqlApplicationConfigurationUpdate?

        # Updates to the array of descriptions of VPC configurations available to the application.

        @[JSON::Field(key: "VpcConfigurationUpdates")]
        getter vpc_configuration_updates : Array(Types::VpcConfigurationUpdate)?

        # Updates to the configuration of a Managed Service for Apache Flink Studio notebook.

        @[JSON::Field(key: "ZeppelinApplicationConfigurationUpdate")]
        getter zeppelin_application_configuration_update : Types::ZeppelinApplicationConfigurationUpdate?

        def initialize(
          @application_code_configuration_update : Types::ApplicationCodeConfigurationUpdate? = nil,
          @application_encryption_configuration_update : Types::ApplicationEncryptionConfigurationUpdate? = nil,
          @application_snapshot_configuration_update : Types::ApplicationSnapshotConfigurationUpdate? = nil,
          @application_system_rollback_configuration_update : Types::ApplicationSystemRollbackConfigurationUpdate? = nil,
          @environment_property_updates : Types::EnvironmentPropertyUpdates? = nil,
          @flink_application_configuration_update : Types::FlinkApplicationConfigurationUpdate? = nil,
          @sql_application_configuration_update : Types::SqlApplicationConfigurationUpdate? = nil,
          @vpc_configuration_updates : Array(Types::VpcConfigurationUpdate)? = nil,
          @zeppelin_application_configuration_update : Types::ZeppelinApplicationConfigurationUpdate? = nil
        )
        end
      end

      # Describes the application, including the application Amazon Resource Name (ARN), status, latest
      # version, and input and output configurations.

      struct ApplicationDetail
        include JSON::Serializable

        # The ARN of the application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The status of the application.

        @[JSON::Field(key: "ApplicationStatus")]
        getter application_status : String

        # Provides the current application version. Managed Service for Apache Flink updates the
        # ApplicationVersionId each time you update the application.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64

        # The runtime environment for the application.

        @[JSON::Field(key: "RuntimeEnvironment")]
        getter runtime_environment : String

        # Describes details about the application code and starting parameters for a Managed Service for
        # Apache Flink application.

        @[JSON::Field(key: "ApplicationConfigurationDescription")]
        getter application_configuration_description : Types::ApplicationConfigurationDescription?

        # The description of the application.

        @[JSON::Field(key: "ApplicationDescription")]
        getter application_description : String?

        # The details of the maintenance configuration for the application.

        @[JSON::Field(key: "ApplicationMaintenanceConfigurationDescription")]
        getter application_maintenance_configuration_description : Types::ApplicationMaintenanceConfigurationDescription?

        # To create a Managed Service for Apache Flink Studio notebook, you must set the mode to INTERACTIVE .
        # However, for a Managed Service for Apache Flink application, the mode is optional.

        @[JSON::Field(key: "ApplicationMode")]
        getter application_mode : String?

        # The timestamp that indicates when the application version was created.

        @[JSON::Field(key: "ApplicationVersionCreateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter application_version_create_timestamp : Time?

        # If you reverted the application using RollbackApplication , the application version when
        # RollbackApplication was called.

        @[JSON::Field(key: "ApplicationVersionRolledBackFrom")]
        getter application_version_rolled_back_from : Int64?

        # The version to which you want to roll back the application.

        @[JSON::Field(key: "ApplicationVersionRolledBackTo")]
        getter application_version_rolled_back_to : Int64?

        # The previous application version before the latest application update. RollbackApplication reverts
        # the application to this version.

        @[JSON::Field(key: "ApplicationVersionUpdatedFrom")]
        getter application_version_updated_from : Int64?

        # Describes the application Amazon CloudWatch logging options.

        @[JSON::Field(key: "CloudWatchLoggingOptionDescriptions")]
        getter cloud_watch_logging_option_descriptions : Array(Types::CloudWatchLoggingOptionDescription)?

        # A value you use to implement strong concurrency for application updates.

        @[JSON::Field(key: "ConditionalToken")]
        getter conditional_token : String?

        # The current timestamp when the application was created.

        @[JSON::Field(key: "CreateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_timestamp : Time?

        # The current timestamp when the application was last updated.

        @[JSON::Field(key: "LastUpdateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_timestamp : Time?

        # Specifies the IAM role that the application uses to access external resources.

        @[JSON::Field(key: "ServiceExecutionRole")]
        getter service_execution_role : String?

        def initialize(
          @application_arn : String,
          @application_name : String,
          @application_status : String,
          @application_version_id : Int64,
          @runtime_environment : String,
          @application_configuration_description : Types::ApplicationConfigurationDescription? = nil,
          @application_description : String? = nil,
          @application_maintenance_configuration_description : Types::ApplicationMaintenanceConfigurationDescription? = nil,
          @application_mode : String? = nil,
          @application_version_create_timestamp : Time? = nil,
          @application_version_rolled_back_from : Int64? = nil,
          @application_version_rolled_back_to : Int64? = nil,
          @application_version_updated_from : Int64? = nil,
          @cloud_watch_logging_option_descriptions : Array(Types::CloudWatchLoggingOptionDescription)? = nil,
          @conditional_token : String? = nil,
          @create_timestamp : Time? = nil,
          @last_update_timestamp : Time? = nil,
          @service_execution_role : String? = nil
        )
        end
      end

      # Specifies the configuration to manage encryption at rest.

      struct ApplicationEncryptionConfiguration
        include JSON::Serializable

        # Specifies the type of key used for encryption at rest.

        @[JSON::Field(key: "KeyType")]
        getter key_type : String

        # The key ARN, key ID, alias ARN, or alias name of the KMS key used for encryption at rest.

        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        def initialize(
          @key_type : String,
          @key_id : String? = nil
        )
        end
      end

      # Describes the encryption at rest configuration.

      struct ApplicationEncryptionConfigurationDescription
        include JSON::Serializable

        # Specifies the type of key used for encryption at rest.

        @[JSON::Field(key: "KeyType")]
        getter key_type : String

        # The key ARN, key ID, alias ARN, or alias name of the KMS key used for encryption at rest.

        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        def initialize(
          @key_type : String,
          @key_id : String? = nil
        )
        end
      end

      # Describes configuration updates to encryption at rest.

      struct ApplicationEncryptionConfigurationUpdate
        include JSON::Serializable

        # Specifies the type of key to be used for encryption at rest.

        @[JSON::Field(key: "KeyTypeUpdate")]
        getter key_type_update : String

        # The key ARN, key ID, alias ARN, or alias name of the KMS key to be used for encryption at rest.

        @[JSON::Field(key: "KeyIdUpdate")]
        getter key_id_update : String?

        def initialize(
          @key_type_update : String,
          @key_id_update : String? = nil
        )
        end
      end

      # The details of the maintenance configuration for the application.

      struct ApplicationMaintenanceConfigurationDescription
        include JSON::Serializable

        # The end time for the maintenance window.

        @[JSON::Field(key: "ApplicationMaintenanceWindowEndTime")]
        getter application_maintenance_window_end_time : String

        # The start time for the maintenance window.

        @[JSON::Field(key: "ApplicationMaintenanceWindowStartTime")]
        getter application_maintenance_window_start_time : String

        def initialize(
          @application_maintenance_window_end_time : String,
          @application_maintenance_window_start_time : String
        )
        end
      end

      # Describes the updated maintenance configuration for the application.

      struct ApplicationMaintenanceConfigurationUpdate
        include JSON::Serializable

        # The updated start time for the maintenance window.

        @[JSON::Field(key: "ApplicationMaintenanceWindowStartTimeUpdate")]
        getter application_maintenance_window_start_time_update : String

        def initialize(
          @application_maintenance_window_start_time_update : String
        )
        end
      end

      # A description of the aplication operation that provides information about the updates that were made
      # to the application.

      struct ApplicationOperationInfo
        include JSON::Serializable

        # The timestamp that indicates when the operation finished.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?


        @[JSON::Field(key: "Operation")]
        getter operation : String?


        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?


        @[JSON::Field(key: "OperationStatus")]
        getter operation_status : String?

        # The timestamp that indicates when the operation was created.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @operation : String? = nil,
          @operation_id : String? = nil,
          @operation_status : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # A description of the application operation that provides information about the updates that were
      # made to the application.

      struct ApplicationOperationInfoDetails
        include JSON::Serializable

        # The timestamp that indicates when the operation finished.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time


        @[JSON::Field(key: "Operation")]
        getter operation : String


        @[JSON::Field(key: "OperationStatus")]
        getter operation_status : String

        # The timestamp that indicates when the operation was created.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time


        @[JSON::Field(key: "ApplicationVersionChangeDetails")]
        getter application_version_change_details : Types::ApplicationVersionChangeDetails?


        @[JSON::Field(key: "OperationFailureDetails")]
        getter operation_failure_details : Types::OperationFailureDetails?

        def initialize(
          @end_time : Time,
          @operation : String,
          @operation_status : String,
          @start_time : Time,
          @application_version_change_details : Types::ApplicationVersionChangeDetails? = nil,
          @operation_failure_details : Types::OperationFailureDetails? = nil
        )
        end
      end

      # Specifies the method and snapshot to use when restarting an application using previously saved
      # application state.

      struct ApplicationRestoreConfiguration
        include JSON::Serializable

        # Specifies how the application should be restored.

        @[JSON::Field(key: "ApplicationRestoreType")]
        getter application_restore_type : String

        # The identifier of an existing snapshot of application state to use to restart an application. The
        # application uses this value if RESTORE_FROM_CUSTOM_SNAPSHOT is specified for the
        # ApplicationRestoreType .

        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String?

        def initialize(
          @application_restore_type : String,
          @snapshot_name : String? = nil
        )
        end
      end

      # Describes whether snapshots are enabled for a Managed Service for Apache Flink application.

      struct ApplicationSnapshotConfiguration
        include JSON::Serializable

        # Describes whether snapshots are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "SnapshotsEnabled")]
        getter snapshots_enabled : Bool

        def initialize(
          @snapshots_enabled : Bool
        )
        end
      end

      # Describes whether snapshots are enabled for a Managed Service for Apache Flink application.

      struct ApplicationSnapshotConfigurationDescription
        include JSON::Serializable

        # Describes whether snapshots are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "SnapshotsEnabled")]
        getter snapshots_enabled : Bool

        def initialize(
          @snapshots_enabled : Bool
        )
        end
      end

      # Describes updates to whether snapshots are enabled for a Managed Service for Apache Flink
      # application.

      struct ApplicationSnapshotConfigurationUpdate
        include JSON::Serializable

        # Describes updates to whether snapshots are enabled for an application.

        @[JSON::Field(key: "SnapshotsEnabledUpdate")]
        getter snapshots_enabled_update : Bool

        def initialize(
          @snapshots_enabled_update : Bool
        )
        end
      end

      # Provides application summary information, including the application Amazon Resource Name (ARN),
      # name, and status.

      struct ApplicationSummary
        include JSON::Serializable

        # The ARN of the application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The status of the application.

        @[JSON::Field(key: "ApplicationStatus")]
        getter application_status : String

        # Provides the current application version.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64

        # The runtime environment for the application.

        @[JSON::Field(key: "RuntimeEnvironment")]
        getter runtime_environment : String

        # For a Managed Service for Apache Flink application, the mode is STREAMING . For a Managed Service
        # for Apache Flink Studio notebook, it is INTERACTIVE .

        @[JSON::Field(key: "ApplicationMode")]
        getter application_mode : String?

        def initialize(
          @application_arn : String,
          @application_name : String,
          @application_status : String,
          @application_version_id : Int64,
          @runtime_environment : String,
          @application_mode : String? = nil
        )
        end
      end

      # Describes the system rollback configuration for a Managed Service for Apache Flink application.

      struct ApplicationSystemRollbackConfiguration
        include JSON::Serializable

        # Describes whether system rollbacks are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "RollbackEnabled")]
        getter rollback_enabled : Bool

        def initialize(
          @rollback_enabled : Bool
        )
        end
      end

      # Describes the system rollback configuration for a Managed Service for Apache Flink application.

      struct ApplicationSystemRollbackConfigurationDescription
        include JSON::Serializable

        # Describes whether system rollbacks are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "RollbackEnabled")]
        getter rollback_enabled : Bool

        def initialize(
          @rollback_enabled : Bool
        )
        end
      end

      # Describes the system rollback configuration for a Managed Service for Apache Flink application.

      struct ApplicationSystemRollbackConfigurationUpdate
        include JSON::Serializable

        # Describes whether system rollbacks are enabled for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "RollbackEnabledUpdate")]
        getter rollback_enabled_update : Bool

        def initialize(
          @rollback_enabled_update : Bool
        )
        end
      end

      # Contains information about the version changes that the operation applied to the application.

      struct ApplicationVersionChangeDetails
        include JSON::Serializable

        # The new version that the application was updated to.

        @[JSON::Field(key: "ApplicationVersionUpdatedFrom")]
        getter application_version_updated_from : Int64

        # The version that the operation execution applied to the applicartion.

        @[JSON::Field(key: "ApplicationVersionUpdatedTo")]
        getter application_version_updated_to : Int64

        def initialize(
          @application_version_updated_from : Int64,
          @application_version_updated_to : Int64
        )
        end
      end

      # The summary of the application version.

      struct ApplicationVersionSummary
        include JSON::Serializable

        # The status of the application.

        @[JSON::Field(key: "ApplicationStatus")]
        getter application_status : String

        # The ID of the application version. Managed Service for Apache Flink updates the ApplicationVersionId
        # each time you update the application.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64

        def initialize(
          @application_status : String,
          @application_version_id : Int64
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, provides additional mapping information when the
      # record format uses delimiters, such as CSV. For example, the following sample records use CSV
      # format, where the records use the '\n' as the row delimiter and a comma (",") as the column
      # delimiter: "name1", "address1" "name2", "address2"

      struct CSVMappingParameters
        include JSON::Serializable

        # The column delimiter. For example, in a CSV format, a comma (",") is the typical column delimiter.

        @[JSON::Field(key: "RecordColumnDelimiter")]
        getter record_column_delimiter : String

        # The row delimiter. For example, in a CSV format, '\n' is the typical row delimiter.

        @[JSON::Field(key: "RecordRowDelimiter")]
        getter record_row_delimiter : String

        def initialize(
          @record_column_delimiter : String,
          @record_row_delimiter : String
        )
        end
      end

      # The configuration parameters for the default Amazon Glue database. You use this database for SQL
      # queries that you write in a Managed Service for Apache Flink Studio notebook.

      struct CatalogConfiguration
        include JSON::Serializable

        # The configuration parameters for the default Amazon Glue database. You use this database for Apache
        # Flink SQL queries and table API transforms that you write in a Managed Service for Apache Flink
        # Studio notebook.

        @[JSON::Field(key: "GlueDataCatalogConfiguration")]
        getter glue_data_catalog_configuration : Types::GlueDataCatalogConfiguration

        def initialize(
          @glue_data_catalog_configuration : Types::GlueDataCatalogConfiguration
        )
        end
      end

      # The configuration parameters for the default Amazon Glue database. You use this database for Apache
      # Flink SQL queries and table API transforms that you write in a Managed Service for Apache Flink
      # Studio notebook.

      struct CatalogConfigurationDescription
        include JSON::Serializable

        # The configuration parameters for the default Amazon Glue database. You use this database for SQL
        # queries that you write in a Managed Service for Apache Flink Studio notebook.

        @[JSON::Field(key: "GlueDataCatalogConfigurationDescription")]
        getter glue_data_catalog_configuration_description : Types::GlueDataCatalogConfigurationDescription

        def initialize(
          @glue_data_catalog_configuration_description : Types::GlueDataCatalogConfigurationDescription
        )
        end
      end

      # Updates to the configuration parameters for the default Amazon Glue database. You use this database
      # for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.

      struct CatalogConfigurationUpdate
        include JSON::Serializable

        # Updates to the configuration parameters for the default Amazon Glue database. You use this database
        # for SQL queries that you write in a Managed Service for Apache Flink Studio notebook.

        @[JSON::Field(key: "GlueDataCatalogConfigurationUpdate")]
        getter glue_data_catalog_configuration_update : Types::GlueDataCatalogConfigurationUpdate

        def initialize(
          @glue_data_catalog_configuration_update : Types::GlueDataCatalogConfigurationUpdate
        )
        end
      end

      # Describes an application's checkpointing configuration. Checkpointing is the process of persisting
      # application state for fault tolerance. For more information, see Checkpoints for Fault Tolerance in
      # the Apache Flink Documentation .

      struct CheckpointConfiguration
        include JSON::Serializable

        # Describes whether the application uses Managed Service for Apache Flink' default checkpointing
        # behavior. You must set this property to CUSTOM in order to set the CheckpointingEnabled ,
        # CheckpointInterval , or MinPauseBetweenCheckpoints parameters. If this value is set to DEFAULT , the
        # application will use the following values, even if they are set to other values using APIs or
        # application code: CheckpointingEnabled: true CheckpointInterval: 60000 MinPauseBetweenCheckpoints:
        # 5000

        @[JSON::Field(key: "ConfigurationType")]
        getter configuration_type : String

        # Describes the interval in milliseconds between checkpoint operations. If
        # CheckpointConfiguration.ConfigurationType is DEFAULT , the application will use a CheckpointInterval
        # value of 60000, even if this value is set to another value using this API or in application code.

        @[JSON::Field(key: "CheckpointInterval")]
        getter checkpoint_interval : Int64?

        # Describes whether checkpointing is enabled for a Managed Service for Apache Flink application. If
        # CheckpointConfiguration.ConfigurationType is DEFAULT , the application will use a
        # CheckpointingEnabled value of true , even if this value is set to another value using this API or in
        # application code.

        @[JSON::Field(key: "CheckpointingEnabled")]
        getter checkpointing_enabled : Bool?

        # Describes the minimum time in milliseconds after a checkpoint operation completes that a new
        # checkpoint operation can start. If a checkpoint operation takes longer than the CheckpointInterval ,
        # the application otherwise performs continual checkpoint operations. For more information, see Tuning
        # Checkpointing in the Apache Flink Documentation . If CheckpointConfiguration.ConfigurationType is
        # DEFAULT , the application will use a MinPauseBetweenCheckpoints value of 5000, even if this value is
        # set using this API or in application code.

        @[JSON::Field(key: "MinPauseBetweenCheckpoints")]
        getter min_pause_between_checkpoints : Int64?

        def initialize(
          @configuration_type : String,
          @checkpoint_interval : Int64? = nil,
          @checkpointing_enabled : Bool? = nil,
          @min_pause_between_checkpoints : Int64? = nil
        )
        end
      end

      # Describes checkpointing parameters for a Managed Service for Apache Flink application.

      struct CheckpointConfigurationDescription
        include JSON::Serializable

        # Describes the interval in milliseconds between checkpoint operations. If
        # CheckpointConfiguration.ConfigurationType is DEFAULT , the application will use a CheckpointInterval
        # value of 60000, even if this value is set to another value using this API or in application code.

        @[JSON::Field(key: "CheckpointInterval")]
        getter checkpoint_interval : Int64?

        # Describes whether checkpointing is enabled for a Managed Service for Apache Flink application. If
        # CheckpointConfiguration.ConfigurationType is DEFAULT , the application will use a
        # CheckpointingEnabled value of true , even if this value is set to another value using this API or in
        # application code.

        @[JSON::Field(key: "CheckpointingEnabled")]
        getter checkpointing_enabled : Bool?

        # Describes whether the application uses the default checkpointing behavior in Managed Service for
        # Apache Flink. If this value is set to DEFAULT , the application will use the following values, even
        # if they are set to other values using APIs or application code: CheckpointingEnabled: true
        # CheckpointInterval: 60000 MinPauseBetweenCheckpoints: 5000

        @[JSON::Field(key: "ConfigurationType")]
        getter configuration_type : String?

        # Describes the minimum time in milliseconds after a checkpoint operation completes that a new
        # checkpoint operation can start. If CheckpointConfiguration.ConfigurationType is DEFAULT , the
        # application will use a MinPauseBetweenCheckpoints value of 5000, even if this value is set using
        # this API or in application code.

        @[JSON::Field(key: "MinPauseBetweenCheckpoints")]
        getter min_pause_between_checkpoints : Int64?

        def initialize(
          @checkpoint_interval : Int64? = nil,
          @checkpointing_enabled : Bool? = nil,
          @configuration_type : String? = nil,
          @min_pause_between_checkpoints : Int64? = nil
        )
        end
      end

      # Describes updates to the checkpointing parameters for a Managed Service for Apache Flink
      # application.

      struct CheckpointConfigurationUpdate
        include JSON::Serializable

        # Describes updates to the interval in milliseconds between checkpoint operations. If
        # CheckpointConfiguration.ConfigurationType is DEFAULT , the application will use a CheckpointInterval
        # value of 60000, even if this value is set to another value using this API or in application code.

        @[JSON::Field(key: "CheckpointIntervalUpdate")]
        getter checkpoint_interval_update : Int64?

        # Describes updates to whether checkpointing is enabled for an application. If
        # CheckpointConfiguration.ConfigurationType is DEFAULT , the application will use a
        # CheckpointingEnabled value of true , even if this value is set to another value using this API or in
        # application code.

        @[JSON::Field(key: "CheckpointingEnabledUpdate")]
        getter checkpointing_enabled_update : Bool?

        # Describes updates to whether the application uses the default checkpointing behavior of Managed
        # Service for Apache Flink. You must set this property to CUSTOM in order to set the
        # CheckpointingEnabled , CheckpointInterval , or MinPauseBetweenCheckpoints parameters. If this value
        # is set to DEFAULT , the application will use the following values, even if they are set to other
        # values using APIs or application code: CheckpointingEnabled: true CheckpointInterval: 60000
        # MinPauseBetweenCheckpoints: 5000

        @[JSON::Field(key: "ConfigurationTypeUpdate")]
        getter configuration_type_update : String?

        # Describes updates to the minimum time in milliseconds after a checkpoint operation completes that a
        # new checkpoint operation can start. If CheckpointConfiguration.ConfigurationType is DEFAULT , the
        # application will use a MinPauseBetweenCheckpoints value of 5000, even if this value is set using
        # this API or in application code.

        @[JSON::Field(key: "MinPauseBetweenCheckpointsUpdate")]
        getter min_pause_between_checkpoints_update : Int64?

        def initialize(
          @checkpoint_interval_update : Int64? = nil,
          @checkpointing_enabled_update : Bool? = nil,
          @configuration_type_update : String? = nil,
          @min_pause_between_checkpoints_update : Int64? = nil
        )
        end
      end

      # Provides a description of Amazon CloudWatch logging options, including the log stream Amazon
      # Resource Name (ARN).

      struct CloudWatchLoggingOption
        include JSON::Serializable

        # The ARN of the CloudWatch log to receive application messages.

        @[JSON::Field(key: "LogStreamARN")]
        getter log_stream_arn : String

        def initialize(
          @log_stream_arn : String
        )
        end
      end

      # Describes the Amazon CloudWatch logging option.

      struct CloudWatchLoggingOptionDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch log to receive application messages.

        @[JSON::Field(key: "LogStreamARN")]
        getter log_stream_arn : String

        # The ID of the CloudWatch logging option description.

        @[JSON::Field(key: "CloudWatchLoggingOptionId")]
        getter cloud_watch_logging_option_id : String?

        # The IAM ARN of the role to use to send application messages. Provided for backward compatibility.
        # Applications created with the current API version have an application-level service execution role
        # rather than a resource-level role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @log_stream_arn : String,
          @cloud_watch_logging_option_id : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Describes the Amazon CloudWatch logging option updates.

      struct CloudWatchLoggingOptionUpdate
        include JSON::Serializable

        # The ID of the CloudWatch logging option to update

        @[JSON::Field(key: "CloudWatchLoggingOptionId")]
        getter cloud_watch_logging_option_id : String

        # The Amazon Resource Name (ARN) of the CloudWatch log to receive application messages.

        @[JSON::Field(key: "LogStreamARNUpdate")]
        getter log_stream_arn_update : String?

        def initialize(
          @cloud_watch_logging_option_id : String,
          @log_stream_arn_update : String? = nil
        )
        end
      end

      # Specifies either the application code, or the location of the application code, for a Managed
      # Service for Apache Flink application.

      struct CodeContent
        include JSON::Serializable

        # Information about the Amazon S3 bucket that contains the application code.

        @[JSON::Field(key: "S3ContentLocation")]
        getter s3_content_location : Types::S3ContentLocation?

        # The text-format code for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "TextContent")]
        getter text_content : String?

        # The zip-format code for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "ZipFileContent")]
        getter zip_file_content : Bytes?

        def initialize(
          @s3_content_location : Types::S3ContentLocation? = nil,
          @text_content : String? = nil,
          @zip_file_content : Bytes? = nil
        )
        end
      end

      # Describes details about the code of a Managed Service for Apache Flink application.

      struct CodeContentDescription
        include JSON::Serializable

        # The checksum that can be used to validate zip-format code.

        @[JSON::Field(key: "CodeMD5")]
        getter code_md5 : String?

        # The size in bytes of the application code. Can be used to validate zip-format code.

        @[JSON::Field(key: "CodeSize")]
        getter code_size : Int64?

        # The S3 bucket Amazon Resource Name (ARN), file key, and object version of the application code
        # stored in Amazon S3.

        @[JSON::Field(key: "S3ApplicationCodeLocationDescription")]
        getter s3_application_code_location_description : Types::S3ApplicationCodeLocationDescription?

        # The text-format code

        @[JSON::Field(key: "TextContent")]
        getter text_content : String?

        def initialize(
          @code_md5 : String? = nil,
          @code_size : Int64? = nil,
          @s3_application_code_location_description : Types::S3ApplicationCodeLocationDescription? = nil,
          @text_content : String? = nil
        )
        end
      end

      # Describes an update to the code of an application. Not supported for Apache Zeppelin.

      struct CodeContentUpdate
        include JSON::Serializable

        # Describes an update to the location of code for an application.

        @[JSON::Field(key: "S3ContentLocationUpdate")]
        getter s3_content_location_update : Types::S3ContentLocationUpdate?

        # Describes an update to the text code for an application.

        @[JSON::Field(key: "TextContentUpdate")]
        getter text_content_update : String?

        # Describes an update to the zipped code for an application.

        @[JSON::Field(key: "ZipFileContentUpdate")]
        getter zip_file_content_update : Bytes?

        def initialize(
          @s3_content_location_update : Types::S3ContentLocationUpdate? = nil,
          @text_content_update : String? = nil,
          @zip_file_content_update : Bytes? = nil
        )
        end
      end

      # The user-provided application code (query) is not valid. This can be a simple syntax error.

      struct CodeValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception thrown as a result of concurrent modifications to an application. This error can be the
      # result of attempting to modify an application without using the current application ID.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateApplicationPresignedUrlRequest
        include JSON::Serializable

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The type of the extension for which to create and return a URL. Currently, the only valid extension
        # URL type is FLINK_DASHBOARD_URL .

        @[JSON::Field(key: "UrlType")]
        getter url_type : String

        # The duration in seconds for which the returned URL will be valid.

        @[JSON::Field(key: "SessionExpirationDurationInSeconds")]
        getter session_expiration_duration_in_seconds : Int64?

        def initialize(
          @application_name : String,
          @url_type : String,
          @session_expiration_duration_in_seconds : Int64? = nil
        )
        end
      end


      struct CreateApplicationPresignedUrlResponse
        include JSON::Serializable

        # The URL of the extension.

        @[JSON::Field(key: "AuthorizedUrl")]
        getter authorized_url : String?

        def initialize(
          @authorized_url : String? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # The name of your application (for example, sample-app ).

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The runtime environment for the application.

        @[JSON::Field(key: "RuntimeEnvironment")]
        getter runtime_environment : String

        # The IAM role used by the application to access Kinesis data streams, Kinesis Data Firehose delivery
        # streams, Amazon S3 objects, and other external resources.

        @[JSON::Field(key: "ServiceExecutionRole")]
        getter service_execution_role : String

        # Use this parameter to configure the application.

        @[JSON::Field(key: "ApplicationConfiguration")]
        getter application_configuration : Types::ApplicationConfiguration?

        # A summary description of the application.

        @[JSON::Field(key: "ApplicationDescription")]
        getter application_description : String?

        # Use the STREAMING mode to create a Managed Service for Apache Flink application. To create a Managed
        # Service for Apache Flink Studio notebook, use the INTERACTIVE mode.

        @[JSON::Field(key: "ApplicationMode")]
        getter application_mode : String?

        # Use this parameter to configure an Amazon CloudWatch log stream to monitor application configuration
        # errors.

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Array(Types::CloudWatchLoggingOption)?

        # A list of one or more tags to assign to the application. A tag is a key-value pair that identifies
        # an application. Note that the maximum number of application tags includes system tags. The maximum
        # number of user-defined application tags is 50. For more information, see Using Tagging .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_name : String,
          @runtime_environment : String,
          @service_execution_role : String,
          @application_configuration : Types::ApplicationConfiguration? = nil,
          @application_description : String? = nil,
          @application_mode : String? = nil,
          @cloud_watch_logging_options : Array(Types::CloudWatchLoggingOption)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateApplicationResponse
        include JSON::Serializable

        # In response to your CreateApplication request, Managed Service for Apache Flink returns a response
        # with details of the application it created.

        @[JSON::Field(key: "ApplicationDetail")]
        getter application_detail : Types::ApplicationDetail

        def initialize(
          @application_detail : Types::ApplicationDetail
        )
        end
      end


      struct CreateApplicationSnapshotRequest
        include JSON::Serializable

        # The name of an existing application

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # An identifier for the application snapshot.

        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String

        def initialize(
          @application_name : String,
          @snapshot_name : String
        )
        end
      end


      struct CreateApplicationSnapshotResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies dependency JARs, as well as JAR files that contain user-defined functions (UDF).

      struct CustomArtifactConfiguration
        include JSON::Serializable

        # UDF stands for user-defined functions. This type of artifact must be in an S3 bucket. A
        # DEPENDENCY_JAR can be in either Maven or an S3 bucket.

        @[JSON::Field(key: "ArtifactType")]
        getter artifact_type : String

        # The parameters required to fully specify a Maven reference.

        @[JSON::Field(key: "MavenReference")]
        getter maven_reference : Types::MavenReference?


        @[JSON::Field(key: "S3ContentLocation")]
        getter s3_content_location : Types::S3ContentLocation?

        def initialize(
          @artifact_type : String,
          @maven_reference : Types::MavenReference? = nil,
          @s3_content_location : Types::S3ContentLocation? = nil
        )
        end
      end

      # Specifies a dependency JAR or a JAR of user-defined functions.

      struct CustomArtifactConfigurationDescription
        include JSON::Serializable

        # UDF stands for user-defined functions. This type of artifact must be in an S3 bucket. A
        # DEPENDENCY_JAR can be in either Maven or an S3 bucket.

        @[JSON::Field(key: "ArtifactType")]
        getter artifact_type : String?

        # The parameters that are required to specify a Maven dependency.

        @[JSON::Field(key: "MavenReferenceDescription")]
        getter maven_reference_description : Types::MavenReference?


        @[JSON::Field(key: "S3ContentLocationDescription")]
        getter s3_content_location_description : Types::S3ContentLocation?

        def initialize(
          @artifact_type : String? = nil,
          @maven_reference_description : Types::MavenReference? = nil,
          @s3_content_location_description : Types::S3ContentLocation? = nil
        )
        end
      end


      struct DeleteApplicationCloudWatchLoggingOptionRequest
        include JSON::Serializable

        # The application name.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The CloudWatchLoggingOptionId of the Amazon CloudWatch logging option to delete. You can get the
        # CloudWatchLoggingOptionId by using the DescribeApplication operation.

        @[JSON::Field(key: "CloudWatchLoggingOptionId")]
        getter cloud_watch_logging_option_id : String

        # A value you use to implement strong concurrency for application updates. You must provide the
        # CurrentApplicationVersionId or the ConditionalToken . You get the application's current
        # ConditionalToken using DescribeApplication . For better concurrency support, use the
        # ConditionalToken parameter instead of CurrentApplicationVersionId .

        @[JSON::Field(key: "ConditionalToken")]
        getter conditional_token : String?

        # The version ID of the application. You must provide the CurrentApplicationVersionId or the
        # ConditionalToken . You can retrieve the application version ID using DescribeApplication . For
        # better concurrency support, use the ConditionalToken parameter instead of
        # CurrentApplicationVersionId .

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64?

        def initialize(
          @application_name : String,
          @cloud_watch_logging_option_id : String,
          @conditional_token : String? = nil,
          @current_application_version_id : Int64? = nil
        )
        end
      end


      struct DeleteApplicationCloudWatchLoggingOptionResponse
        include JSON::Serializable

        # The application's Amazon Resource Name (ARN).

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # The version ID of the application. Kinesis Data Analytics updates the ApplicationVersionId each time
        # you change the CloudWatch logging options.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        # The descriptions of the remaining CloudWatch logging options for the application.

        @[JSON::Field(key: "CloudWatchLoggingOptionDescriptions")]
        getter cloud_watch_logging_option_descriptions : Array(Types::CloudWatchLoggingOptionDescription)?

        # The operation ID that can be used to track the request.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil,
          @cloud_watch_logging_option_descriptions : Array(Types::CloudWatchLoggingOptionDescription)? = nil,
          @operation_id : String? = nil
        )
        end
      end


      struct DeleteApplicationInputProcessingConfigurationRequest
        include JSON::Serializable

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The application version. You can use the DescribeApplication operation to get the current
        # application version. If the version specified is not the current version, the
        # ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The ID of the input configuration from which to delete the input processing configuration. You can
        # get a list of the input IDs for an application by using the DescribeApplication operation.

        @[JSON::Field(key: "InputId")]
        getter input_id : String

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @input_id : String
        )
        end
      end


      struct DeleteApplicationInputProcessingConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # The current application version ID.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil
        )
        end
      end


      struct DeleteApplicationOutputRequest
        include JSON::Serializable

        # The application name.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The application version. You can use the DescribeApplication operation to get the current
        # application version. If the version specified is not the current version, the
        # ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The ID of the configuration to delete. Each output configuration that is added to the application
        # (either when the application is created or later) using the AddApplicationOutput operation has a
        # unique ID. You need to provide the ID to uniquely identify the output configuration that you want to
        # delete from the application configuration. You can use the DescribeApplication operation to get the
        # specific OutputId .

        @[JSON::Field(key: "OutputId")]
        getter output_id : String

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @output_id : String
        )
        end
      end


      struct DeleteApplicationOutputResponse
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # The current application version ID.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil
        )
        end
      end


      struct DeleteApplicationReferenceDataSourceRequest
        include JSON::Serializable

        # The name of an existing application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The current application version. You can use the DescribeApplication operation to get the current
        # application version. If the version specified is not the current version, the
        # ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The ID of the reference data source. When you add a reference data source to your application using
        # the AddApplicationReferenceDataSource , Kinesis Data Analytics assigns an ID. You can use the
        # DescribeApplication operation to get the reference ID.

        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @reference_id : String
        )
        end
      end


      struct DeleteApplicationReferenceDataSourceResponse
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # The updated version ID of the application.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil
        )
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # The name of the application to delete.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Use the DescribeApplication operation to get this value.

        @[JSON::Field(key: "CreateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_timestamp : Time

        def initialize(
          @application_name : String,
          @create_timestamp : Time
        )
        end
      end


      struct DeleteApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApplicationSnapshotRequest
        include JSON::Serializable

        # The name of an existing application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The creation timestamp of the application snapshot to delete. You can retrieve this value using or .

        @[JSON::Field(key: "SnapshotCreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter snapshot_creation_timestamp : Time

        # The identifier for the snapshot delete.

        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String

        def initialize(
          @application_name : String,
          @snapshot_creation_timestamp : Time,
          @snapshot_name : String
        )
        end
      end


      struct DeleteApplicationSnapshotResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApplicationVpcConfigurationRequest
        include JSON::Serializable

        # The name of an existing application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The ID of the VPC configuration to delete.

        @[JSON::Field(key: "VpcConfigurationId")]
        getter vpc_configuration_id : String

        # A value you use to implement strong concurrency for application updates. You must provide the
        # CurrentApplicationVersionId or the ConditionalToken . You get the application's current
        # ConditionalToken using DescribeApplication . For better concurrency support, use the
        # ConditionalToken parameter instead of CurrentApplicationVersionId .

        @[JSON::Field(key: "ConditionalToken")]
        getter conditional_token : String?

        # The current application version ID. You must provide the CurrentApplicationVersionId or the
        # ConditionalToken . You can retrieve the application version ID using DescribeApplication . For
        # better concurrency support, use the ConditionalToken parameter instead of
        # CurrentApplicationVersionId .

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64?

        def initialize(
          @application_name : String,
          @vpc_configuration_id : String,
          @conditional_token : String? = nil,
          @current_application_version_id : Int64? = nil
        )
        end
      end


      struct DeleteApplicationVpcConfigurationResponse
        include JSON::Serializable

        # The ARN of the Managed Service for Apache Flink application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # The updated version ID of the application.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64?

        # The operation ID that can be used to track the request.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @application_arn : String? = nil,
          @application_version_id : Int64? = nil,
          @operation_id : String? = nil
        )
        end
      end

      # The information required to deploy a Managed Service for Apache Flink Studio notebook as an
      # application with durable state.

      struct DeployAsApplicationConfiguration
        include JSON::Serializable

        # The description of an Amazon S3 object that contains the Amazon Data Analytics application,
        # including the Amazon Resource Name (ARN) of the S3 bucket, the name of the Amazon S3 object that
        # contains the data, and the version number of the Amazon S3 object that contains the data.

        @[JSON::Field(key: "S3ContentLocation")]
        getter s3_content_location : Types::S3ContentBaseLocation

        def initialize(
          @s3_content_location : Types::S3ContentBaseLocation
        )
        end
      end

      # The configuration information required to deploy an Amazon Data Analytics Studio notebook as an
      # application with durable state.

      struct DeployAsApplicationConfigurationDescription
        include JSON::Serializable

        # The location that holds the data required to specify an Amazon Data Analytics application.

        @[JSON::Field(key: "S3ContentLocationDescription")]
        getter s3_content_location_description : Types::S3ContentBaseLocationDescription

        def initialize(
          @s3_content_location_description : Types::S3ContentBaseLocationDescription
        )
        end
      end

      # Updates to the configuration information required to deploy an Amazon Data Analytics Studio notebook
      # as an application with durable state.

      struct DeployAsApplicationConfigurationUpdate
        include JSON::Serializable

        # Updates to the location that holds the data required to specify an Amazon Data Analytics
        # application.

        @[JSON::Field(key: "S3ContentLocationUpdate")]
        getter s3_content_location_update : Types::S3ContentBaseLocationUpdate?

        def initialize(
          @s3_content_location_update : Types::S3ContentBaseLocationUpdate? = nil
        )
        end
      end

      # A request for information about a specific operation that was performed on a Managed Service for
      # Apache Flink application.

      struct DescribeApplicationOperationRequest
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String


        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        def initialize(
          @application_name : String,
          @operation_id : String
        )
        end
      end

      # Provides details of the operation that corresponds to the operation ID on a Managed Service for
      # Apache Flink application.

      struct DescribeApplicationOperationResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationOperationInfoDetails")]
        getter application_operation_info_details : Types::ApplicationOperationInfoDetails?

        def initialize(
          @application_operation_info_details : Types::ApplicationOperationInfoDetails? = nil
        )
        end
      end


      struct DescribeApplicationRequest
        include JSON::Serializable

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Displays verbose information about a Managed Service for Apache Flink application, including the
        # application's job plan.

        @[JSON::Field(key: "IncludeAdditionalDetails")]
        getter include_additional_details : Bool?

        def initialize(
          @application_name : String,
          @include_additional_details : Bool? = nil
        )
        end
      end


      struct DescribeApplicationResponse
        include JSON::Serializable

        # Provides a description of the application, such as the application's Amazon Resource Name (ARN),
        # status, and latest version.

        @[JSON::Field(key: "ApplicationDetail")]
        getter application_detail : Types::ApplicationDetail

        def initialize(
          @application_detail : Types::ApplicationDetail
        )
        end
      end


      struct DescribeApplicationSnapshotRequest
        include JSON::Serializable

        # The name of an existing application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The identifier of an application snapshot. You can retrieve this value using .

        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String

        def initialize(
          @application_name : String,
          @snapshot_name : String
        )
        end
      end


      struct DescribeApplicationSnapshotResponse
        include JSON::Serializable

        # An object containing information about the application snapshot.

        @[JSON::Field(key: "SnapshotDetails")]
        getter snapshot_details : Types::SnapshotDetails

        def initialize(
          @snapshot_details : Types::SnapshotDetails
        )
        end
      end


      struct DescribeApplicationVersionRequest
        include JSON::Serializable

        # The name of the application for which you want to get the version description.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The ID of the application version for which you want to get the description.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64

        def initialize(
          @application_name : String,
          @application_version_id : Int64
        )
        end
      end


      struct DescribeApplicationVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationVersionDetail")]
        getter application_version_detail : Types::ApplicationDetail?

        def initialize(
          @application_version_detail : Types::ApplicationDetail? = nil
        )
        end
      end

      # Describes the data format when records are written to the destination in a SQL-based Kinesis Data
      # Analytics application.

      struct DestinationSchema
        include JSON::Serializable

        # Specifies the format of the records on the output stream.

        @[JSON::Field(key: "RecordFormatType")]
        getter record_format_type : String

        def initialize(
          @record_format_type : String
        )
        end
      end


      struct DiscoverInputSchemaRequest
        include JSON::Serializable

        # The ARN of the role that is used to access the streaming source.

        @[JSON::Field(key: "ServiceExecutionRole")]
        getter service_execution_role : String

        # The InputProcessingConfiguration to use to preprocess the records before discovering the schema of
        # the records.

        @[JSON::Field(key: "InputProcessingConfiguration")]
        getter input_processing_configuration : Types::InputProcessingConfiguration?

        # The point at which you want Kinesis Data Analytics to start reading records from the specified
        # streaming source for discovery purposes.

        @[JSON::Field(key: "InputStartingPositionConfiguration")]
        getter input_starting_position_configuration : Types::InputStartingPositionConfiguration?

        # The Amazon Resource Name (ARN) of the streaming source.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # Specify this parameter to discover a schema from data in an Amazon S3 object.

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3Configuration?

        def initialize(
          @service_execution_role : String,
          @input_processing_configuration : Types::InputProcessingConfiguration? = nil,
          @input_starting_position_configuration : Types::InputStartingPositionConfiguration? = nil,
          @resource_arn : String? = nil,
          @s3_configuration : Types::S3Configuration? = nil
        )
        end
      end


      struct DiscoverInputSchemaResponse
        include JSON::Serializable

        # The schema inferred from the streaming source. It identifies the format of the data in the streaming
        # source and how each data element maps to corresponding columns in the in-application stream that you
        # can create.

        @[JSON::Field(key: "InputSchema")]
        getter input_schema : Types::SourceSchema?

        # An array of elements, where each element corresponds to a row in a stream record (a stream record
        # can have more than one row).

        @[JSON::Field(key: "ParsedInputRecords")]
        getter parsed_input_records : Array(Array(String))?

        # The stream data that was modified by the processor specified in the InputProcessingConfiguration
        # parameter.

        @[JSON::Field(key: "ProcessedInputRecords")]
        getter processed_input_records : Array(String)?

        # The raw stream data that was sampled to infer the schema.

        @[JSON::Field(key: "RawInputRecords")]
        getter raw_input_records : Array(String)?

        def initialize(
          @input_schema : Types::SourceSchema? = nil,
          @parsed_input_records : Array(Array(String))? = nil,
          @processed_input_records : Array(String)? = nil,
          @raw_input_records : Array(String)? = nil
        )
        end
      end

      # Describes execution properties for a Managed Service for Apache Flink application.

      struct EnvironmentProperties
        include JSON::Serializable

        # Describes the execution property groups.

        @[JSON::Field(key: "PropertyGroups")]
        getter property_groups : Array(Types::PropertyGroup)

        def initialize(
          @property_groups : Array(Types::PropertyGroup)
        )
        end
      end

      # Describes the execution properties for an Apache Flink runtime.

      struct EnvironmentPropertyDescriptions
        include JSON::Serializable

        # Describes the execution property groups.

        @[JSON::Field(key: "PropertyGroupDescriptions")]
        getter property_group_descriptions : Array(Types::PropertyGroup)?

        def initialize(
          @property_group_descriptions : Array(Types::PropertyGroup)? = nil
        )
        end
      end

      # Describes updates to the execution property groups for a Managed Service for Apache Flink
      # application or a Studio notebook.

      struct EnvironmentPropertyUpdates
        include JSON::Serializable

        # Describes updates to the execution property groups.

        @[JSON::Field(key: "PropertyGroups")]
        getter property_groups : Array(Types::PropertyGroup)

        def initialize(
          @property_groups : Array(Types::PropertyGroup)
        )
        end
      end

      # A description of the error that caused an operation to fail.

      struct ErrorInfo
        include JSON::Serializable


        @[JSON::Field(key: "ErrorString")]
        getter error_string : String?

        def initialize(
          @error_string : String? = nil
        )
        end
      end

      # Describes configuration parameters for a Managed Service for Apache Flink application or a Studio
      # notebook.

      struct FlinkApplicationConfiguration
        include JSON::Serializable

        # Describes an application's checkpointing configuration. Checkpointing is the process of persisting
        # application state for fault tolerance. For more information, see Checkpoints for Fault Tolerance in
        # the Apache Flink Documentation .

        @[JSON::Field(key: "CheckpointConfiguration")]
        getter checkpoint_configuration : Types::CheckpointConfiguration?

        # Describes configuration parameters for Amazon CloudWatch logging for an application.

        @[JSON::Field(key: "MonitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        # Describes parameters for how an application executes multiple tasks simultaneously.

        @[JSON::Field(key: "ParallelismConfiguration")]
        getter parallelism_configuration : Types::ParallelismConfiguration?

        def initialize(
          @checkpoint_configuration : Types::CheckpointConfiguration? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @parallelism_configuration : Types::ParallelismConfiguration? = nil
        )
        end
      end

      # Describes configuration parameters for a Managed Service for Apache Flink application.

      struct FlinkApplicationConfigurationDescription
        include JSON::Serializable

        # Describes an application's checkpointing configuration. Checkpointing is the process of persisting
        # application state for fault tolerance.

        @[JSON::Field(key: "CheckpointConfigurationDescription")]
        getter checkpoint_configuration_description : Types::CheckpointConfigurationDescription?

        # The job plan for an application. For more information about the job plan, see Jobs and Scheduling in
        # the Apache Flink Documentation . To retrieve the job plan for the application, use the
        # DescribeApplicationRequest$IncludeAdditionalDetails parameter of the DescribeApplication operation.

        @[JSON::Field(key: "JobPlanDescription")]
        getter job_plan_description : String?

        # Describes configuration parameters for Amazon CloudWatch logging for an application.

        @[JSON::Field(key: "MonitoringConfigurationDescription")]
        getter monitoring_configuration_description : Types::MonitoringConfigurationDescription?

        # Describes parameters for how an application executes multiple tasks simultaneously.

        @[JSON::Field(key: "ParallelismConfigurationDescription")]
        getter parallelism_configuration_description : Types::ParallelismConfigurationDescription?

        def initialize(
          @checkpoint_configuration_description : Types::CheckpointConfigurationDescription? = nil,
          @job_plan_description : String? = nil,
          @monitoring_configuration_description : Types::MonitoringConfigurationDescription? = nil,
          @parallelism_configuration_description : Types::ParallelismConfigurationDescription? = nil
        )
        end
      end

      # Describes updates to the configuration parameters for a Managed Service for Apache Flink
      # application.

      struct FlinkApplicationConfigurationUpdate
        include JSON::Serializable

        # Describes updates to an application's checkpointing configuration. Checkpointing is the process of
        # persisting application state for fault tolerance.

        @[JSON::Field(key: "CheckpointConfigurationUpdate")]
        getter checkpoint_configuration_update : Types::CheckpointConfigurationUpdate?

        # Describes updates to the configuration parameters for Amazon CloudWatch logging for an application.

        @[JSON::Field(key: "MonitoringConfigurationUpdate")]
        getter monitoring_configuration_update : Types::MonitoringConfigurationUpdate?

        # Describes updates to the parameters for how an application executes multiple tasks simultaneously.

        @[JSON::Field(key: "ParallelismConfigurationUpdate")]
        getter parallelism_configuration_update : Types::ParallelismConfigurationUpdate?

        def initialize(
          @checkpoint_configuration_update : Types::CheckpointConfigurationUpdate? = nil,
          @monitoring_configuration_update : Types::MonitoringConfigurationUpdate? = nil,
          @parallelism_configuration_update : Types::ParallelismConfigurationUpdate? = nil
        )
        end
      end

      # Describes the starting parameters for a Managed Service for Apache Flink application.

      struct FlinkRunConfiguration
        include JSON::Serializable

        # When restoring from a snapshot, specifies whether the runtime is allowed to skip a state that cannot
        # be mapped to the new program. This will happen if the program is updated between snapshots to remove
        # stateful parameters, and state data in the snapshot no longer corresponds to valid application data.
        # For more information, see Allowing Non-Restored State in the Apache Flink documentation . This value
        # defaults to false . If you update your application without specifying this parameter,
        # AllowNonRestoredState will be set to false , even if it was previously set to true .

        @[JSON::Field(key: "AllowNonRestoredState")]
        getter allow_non_restored_state : Bool?

        def initialize(
          @allow_non_restored_state : Bool? = nil
        )
        end
      end

      # The configuration of the Glue Data Catalog that you use for Apache Flink SQL queries and table API
      # transforms that you write in an application.

      struct GlueDataCatalogConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the database.

        @[JSON::Field(key: "DatabaseARN")]
        getter database_arn : String

        def initialize(
          @database_arn : String
        )
        end
      end

      # The configuration of the Glue Data Catalog that you use for Apache Flink SQL queries and table API
      # transforms that you write in an application.

      struct GlueDataCatalogConfigurationDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the database.

        @[JSON::Field(key: "DatabaseARN")]
        getter database_arn : String

        def initialize(
          @database_arn : String
        )
        end
      end

      # Updates to the configuration of the Glue Data Catalog that you use for SQL queries that you write in
      # a Managed Service for Apache Flink Studio notebook.

      struct GlueDataCatalogConfigurationUpdate
        include JSON::Serializable

        # The updated Amazon Resource Name (ARN) of the database.

        @[JSON::Field(key: "DatabaseARNUpdate")]
        getter database_arn_update : String

        def initialize(
          @database_arn_update : String
        )
        end
      end

      # When you configure the application input for a SQL-based Kinesis Data Analytics application, you
      # specify the streaming source, the in-application stream name that is created, and the mapping
      # between the two.

      struct Input
        include JSON::Serializable

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns in the in-application stream that is being created. Also used to describe the
        # format of the reference data source.

        @[JSON::Field(key: "InputSchema")]
        getter input_schema : Types::SourceSchema

        # The name prefix to use when creating an in-application stream. Suppose that you specify a prefix "
        # MyInApplicationStream ." Kinesis Data Analytics then creates one or more (as per the
        # InputParallelism count you specified) in-application streams with the names "
        # MyInApplicationStream_001 ," " MyInApplicationStream_002 ," and so on.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String

        # Describes the number of in-application streams to create.

        @[JSON::Field(key: "InputParallelism")]
        getter input_parallelism : Types::InputParallelism?

        # The InputProcessingConfiguration for the input. An input processor transforms records as they are
        # received from the stream, before the application's SQL code executes. Currently, the only input
        # processing configuration available is InputLambdaProcessor .

        @[JSON::Field(key: "InputProcessingConfiguration")]
        getter input_processing_configuration : Types::InputProcessingConfiguration?

        # If the streaming source is an Amazon Kinesis Data Firehose delivery stream, identifies the delivery
        # stream's ARN.

        @[JSON::Field(key: "KinesisFirehoseInput")]
        getter kinesis_firehose_input : Types::KinesisFirehoseInput?

        # If the streaming source is an Amazon Kinesis data stream, identifies the stream's Amazon Resource
        # Name (ARN).

        @[JSON::Field(key: "KinesisStreamsInput")]
        getter kinesis_streams_input : Types::KinesisStreamsInput?

        def initialize(
          @input_schema : Types::SourceSchema,
          @name_prefix : String,
          @input_parallelism : Types::InputParallelism? = nil,
          @input_processing_configuration : Types::InputProcessingConfiguration? = nil,
          @kinesis_firehose_input : Types::KinesisFirehoseInput? = nil,
          @kinesis_streams_input : Types::KinesisStreamsInput? = nil
        )
        end
      end

      # Describes the application input configuration for a SQL-based Kinesis Data Analytics application.

      struct InputDescription
        include JSON::Serializable

        # Returns the in-application stream names that are mapped to the stream source.

        @[JSON::Field(key: "InAppStreamNames")]
        getter in_app_stream_names : Array(String)?

        # The input ID that is associated with the application input. This is the ID that Kinesis Data
        # Analytics assigns to each input configuration that you add to your application.

        @[JSON::Field(key: "InputId")]
        getter input_id : String?

        # Describes the configured parallelism (number of in-application streams mapped to the streaming
        # source).

        @[JSON::Field(key: "InputParallelism")]
        getter input_parallelism : Types::InputParallelism?

        # The description of the preprocessor that executes on records in this input before the application's
        # code is run.

        @[JSON::Field(key: "InputProcessingConfigurationDescription")]
        getter input_processing_configuration_description : Types::InputProcessingConfigurationDescription?

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns in the in-application stream that is being created.

        @[JSON::Field(key: "InputSchema")]
        getter input_schema : Types::SourceSchema?

        # The point at which the application is configured to read from the input stream.

        @[JSON::Field(key: "InputStartingPositionConfiguration")]
        getter input_starting_position_configuration : Types::InputStartingPositionConfiguration?

        # If a Kinesis Data Firehose delivery stream is configured as a streaming source, provides the
        # delivery stream's ARN.

        @[JSON::Field(key: "KinesisFirehoseInputDescription")]
        getter kinesis_firehose_input_description : Types::KinesisFirehoseInputDescription?

        # If a Kinesis data stream is configured as a streaming source, provides the Kinesis data stream's
        # Amazon Resource Name (ARN).

        @[JSON::Field(key: "KinesisStreamsInputDescription")]
        getter kinesis_streams_input_description : Types::KinesisStreamsInputDescription?

        # The in-application name prefix.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        def initialize(
          @in_app_stream_names : Array(String)? = nil,
          @input_id : String? = nil,
          @input_parallelism : Types::InputParallelism? = nil,
          @input_processing_configuration_description : Types::InputProcessingConfigurationDescription? = nil,
          @input_schema : Types::SourceSchema? = nil,
          @input_starting_position_configuration : Types::InputStartingPositionConfiguration? = nil,
          @kinesis_firehose_input_description : Types::KinesisFirehoseInputDescription? = nil,
          @kinesis_streams_input_description : Types::KinesisStreamsInputDescription? = nil,
          @name_prefix : String? = nil
        )
        end
      end

      # An object that contains the Amazon Resource Name (ARN) of the Amazon Lambda function that is used to
      # preprocess records in the stream in a SQL-based Kinesis Data Analytics application.

      struct InputLambdaProcessor
        include JSON::Serializable

        # The ARN of the Amazon Lambda function that operates on records in the stream. To specify an earlier
        # version of the Lambda function than the latest, include the Lambda function version in the Lambda
        # function ARN. For more information about Lambda ARNs, see Example ARNs: Amazon Lambda

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, an object that contains the Amazon Resource Name
      # (ARN) of the Amazon Lambda function that is used to preprocess records in the stream.

      struct InputLambdaProcessorDescription
        include JSON::Serializable

        # The ARN of the Amazon Lambda function that is used to preprocess the records in the stream. To
        # specify an earlier version of the Lambda function than the latest, include the Lambda function
        # version in the Lambda function ARN. For more information about Lambda ARNs, see Example ARNs: Amazon
        # Lambda

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The ARN of the IAM role that is used to access the Amazon Lambda function. Provided for backward
        # compatibility. Applications that are created with the current API version have an application-level
        # service execution role rather than a resource-level role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String,
          @role_arn : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, represents an update to the InputLambdaProcessor
      # that is used to preprocess the records in the stream.

      struct InputLambdaProcessorUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new Amazon Lambda function that is used to preprocess the
        # records in the stream. To specify an earlier version of the Lambda function than the latest, include
        # the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see
        # Example ARNs: Amazon Lambda

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String

        def initialize(
          @resource_arn_update : String
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes the number of in-application streams
      # to create for a given streaming source.

      struct InputParallelism
        include JSON::Serializable

        # The number of in-application streams to create.

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        def initialize(
          @count : Int32? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, provides updates to the parallelism count.

      struct InputParallelismUpdate
        include JSON::Serializable

        # The number of in-application streams to create for the specified streaming source.

        @[JSON::Field(key: "CountUpdate")]
        getter count_update : Int32

        def initialize(
          @count_update : Int32
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes a processor that is used to preprocess
      # the records in the stream before being processed by your application code. Currently, the only input
      # processor available is Amazon Lambda .

      struct InputProcessingConfiguration
        include JSON::Serializable

        # The InputLambdaProcessor that is used to preprocess the records in the stream before being processed
        # by your application code.

        @[JSON::Field(key: "InputLambdaProcessor")]
        getter input_lambda_processor : Types::InputLambdaProcessor

        def initialize(
          @input_lambda_processor : Types::InputLambdaProcessor
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, provides the configuration information about an
      # input processor. Currently, the only input processor available is Amazon Lambda .

      struct InputProcessingConfigurationDescription
        include JSON::Serializable

        # Provides configuration information about the associated InputLambdaProcessorDescription

        @[JSON::Field(key: "InputLambdaProcessorDescription")]
        getter input_lambda_processor_description : Types::InputLambdaProcessorDescription?

        def initialize(
          @input_lambda_processor_description : Types::InputLambdaProcessorDescription? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes updates to an
      # InputProcessingConfiguration .

      struct InputProcessingConfigurationUpdate
        include JSON::Serializable

        # Provides update information for an InputLambdaProcessor .

        @[JSON::Field(key: "InputLambdaProcessorUpdate")]
        getter input_lambda_processor_update : Types::InputLambdaProcessorUpdate

        def initialize(
          @input_lambda_processor_update : Types::InputLambdaProcessorUpdate
        )
        end
      end

      # Describes updates for an SQL-based Kinesis Data Analytics application's input schema.

      struct InputSchemaUpdate
        include JSON::Serializable

        # A list of RecordColumn objects. Each object describes the mapping of the streaming source element to
        # the corresponding column in the in-application stream.

        @[JSON::Field(key: "RecordColumnUpdates")]
        getter record_column_updates : Array(Types::RecordColumn)?

        # Specifies the encoding of the records in the streaming source; for example, UTF-8.

        @[JSON::Field(key: "RecordEncodingUpdate")]
        getter record_encoding_update : String?

        # Specifies the format of the records on the streaming source.

        @[JSON::Field(key: "RecordFormatUpdate")]
        getter record_format_update : Types::RecordFormat?

        def initialize(
          @record_column_updates : Array(Types::RecordColumn)? = nil,
          @record_encoding_update : String? = nil,
          @record_format_update : Types::RecordFormat? = nil
        )
        end
      end

      # Describes the point at which the application reads from the streaming source.

      struct InputStartingPositionConfiguration
        include JSON::Serializable

        # The starting position on the stream. NOW - Start reading just after the most recent record in the
        # stream, and start at the request timestamp that the customer issued. TRIM_HORIZON - Start reading at
        # the last untrimmed record in the stream, which is the oldest record available in the stream. This
        # option is not available for an Amazon Kinesis Data Firehose delivery stream. LAST_STOPPED_POINT -
        # Resume reading from where the application last stopped reading.

        @[JSON::Field(key: "InputStartingPosition")]
        getter input_starting_position : String?

        def initialize(
          @input_starting_position : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes updates to a specific input
      # configuration (identified by the InputId of an application).

      struct InputUpdate
        include JSON::Serializable

        # The input ID of the application input to be updated.

        @[JSON::Field(key: "InputId")]
        getter input_id : String

        # Describes the parallelism updates (the number of in-application streams Kinesis Data Analytics
        # creates for the specific streaming source).

        @[JSON::Field(key: "InputParallelismUpdate")]
        getter input_parallelism_update : Types::InputParallelismUpdate?

        # Describes updates to an InputProcessingConfiguration .

        @[JSON::Field(key: "InputProcessingConfigurationUpdate")]
        getter input_processing_configuration_update : Types::InputProcessingConfigurationUpdate?

        # Describes the data format on the streaming source, and how record elements on the streaming source
        # map to columns of the in-application stream that is created.

        @[JSON::Field(key: "InputSchemaUpdate")]
        getter input_schema_update : Types::InputSchemaUpdate?

        # If a Kinesis Data Firehose delivery stream is the streaming source to be updated, provides an
        # updated stream ARN.

        @[JSON::Field(key: "KinesisFirehoseInputUpdate")]
        getter kinesis_firehose_input_update : Types::KinesisFirehoseInputUpdate?

        # If a Kinesis data stream is the streaming source to be updated, provides an updated stream Amazon
        # Resource Name (ARN).

        @[JSON::Field(key: "KinesisStreamsInputUpdate")]
        getter kinesis_streams_input_update : Types::KinesisStreamsInputUpdate?

        # The name prefix for in-application streams that Kinesis Data Analytics creates for the specific
        # streaming source.

        @[JSON::Field(key: "NamePrefixUpdate")]
        getter name_prefix_update : String?

        def initialize(
          @input_id : String,
          @input_parallelism_update : Types::InputParallelismUpdate? = nil,
          @input_processing_configuration_update : Types::InputProcessingConfigurationUpdate? = nil,
          @input_schema_update : Types::InputSchemaUpdate? = nil,
          @kinesis_firehose_input_update : Types::KinesisFirehoseInputUpdate? = nil,
          @kinesis_streams_input_update : Types::KinesisStreamsInputUpdate? = nil,
          @name_prefix_update : String? = nil
        )
        end
      end

      # The user-provided application configuration is not valid.

      struct InvalidApplicationConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified input parameter value is not valid.

      struct InvalidArgumentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request JSON is not valid for the operation.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, provides additional mapping information when
      # JSON is the record format on the streaming source.

      struct JSONMappingParameters
        include JSON::Serializable

        # The path to the top-level parent that contains the records.

        @[JSON::Field(key: "RecordRowPath")]
        getter record_row_path : String

        def initialize(
          @record_row_path : String
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, identifies a Kinesis Data Firehose delivery
      # stream as the streaming source. You provide the delivery stream's Amazon Resource Name (ARN).

      struct KinesisFirehoseInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the delivery stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # Describes the Amazon Kinesis Data Firehose delivery stream that is configured as the streaming
      # source in the application input configuration.

      struct KinesisFirehoseInputDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the delivery stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The ARN of the IAM role that Kinesis Data Analytics assumes to access the stream. Provided for
        # backward compatibility. Applications that are created with the current API version have an
        # application-level service execution role rather than a resource-level role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String,
          @role_arn : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, when updating application input configuration,
      # provides information about a Kinesis Data Firehose delivery stream as the streaming source.

      struct KinesisFirehoseInputUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the input delivery stream to read.

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String

        def initialize(
          @resource_arn_update : String
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, when configuring application output, identifies
      # a Kinesis Data Firehose delivery stream as the destination. You provide the stream Amazon Resource
      # Name (ARN) of the delivery stream.

      struct KinesisFirehoseOutput
        include JSON::Serializable

        # The ARN of the destination delivery stream to write to.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application's output, describes the Kinesis Data Firehose
      # delivery stream that is configured as its destination.

      struct KinesisFirehoseOutputDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the delivery stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The ARN of the IAM role that Kinesis Data Analytics can assume to access the stream. Provided for
        # backward compatibility. Applications that are created with the current API version have an
        # application-level service execution role rather than a resource-level role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String,
          @role_arn : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, when updating an output configuration using the
      # UpdateApplication operation, provides information about a Kinesis Data Firehose delivery stream that
      # is configured as the destination.

      struct KinesisFirehoseOutputUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the delivery stream to write to.

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String

        def initialize(
          @resource_arn_update : String
        )
        end
      end

      # Identifies a Kinesis data stream as the streaming source. You provide the stream's Amazon Resource
      # Name (ARN).

      struct KinesisStreamsInput
        include JSON::Serializable

        # The ARN of the input Kinesis data stream to read.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes the Kinesis data stream that is
      # configured as the streaming source in the application input configuration.

      struct KinesisStreamsInputDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Kinesis data stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The ARN of the IAM role that Kinesis Data Analytics can assume to access the stream. Provided for
        # backward compatibility. Applications that are created with the current API version have an
        # application-level service execution role rather than a resource-level role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String,
          @role_arn : String? = nil
        )
        end
      end

      # When you update the input configuration for a SQL-based Kinesis Data Analytics application, provides
      # information about a Kinesis stream as the streaming source.

      struct KinesisStreamsInputUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the input Kinesis data stream to read.

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String

        def initialize(
          @resource_arn_update : String
        )
        end
      end

      # When you configure a SQL-based Kinesis Data Analytics application's output, identifies a Kinesis
      # data stream as the destination. You provide the stream Amazon Resource Name (ARN).

      struct KinesisStreamsOutput
        include JSON::Serializable

        # The ARN of the destination Kinesis data stream to write to.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # For an SQL-based Kinesis Data Analytics application's output, describes the Kinesis data stream that
      # is configured as its destination.

      struct KinesisStreamsOutputDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Kinesis data stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The ARN of the IAM role that Kinesis Data Analytics can assume to access the stream. Provided for
        # backward compatibility. Applications that are created with the current API version have an
        # application-level service execution role rather than a resource-level role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String,
          @role_arn : String? = nil
        )
        end
      end

      # When you update a SQL-based Kinesis Data Analytics application's output configuration using the
      # UpdateApplication operation, provides information about a Kinesis data stream that is configured as
      # the destination.

      struct KinesisStreamsOutputUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Kinesis data stream where you want to write the output.

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String

        def initialize(
          @resource_arn_update : String
        )
        end
      end

      # When you configure a SQL-based Kinesis Data Analytics application's output, identifies an Amazon
      # Lambda function as the destination. You provide the function Amazon Resource Name (ARN) of the
      # Lambda function.

      struct LambdaOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination Lambda function to write to. To specify an earlier
        # version of the Lambda function than the latest, include the Lambda function version in the Lambda
        # function ARN. For more information about Lambda ARNs, see Example ARNs: Amazon Lambda

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application's output, describes the Amazon Lambda function
      # that is configured as its destination.

      struct LambdaOutputDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination Lambda function.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The ARN of the IAM role that Kinesis Data Analytics can assume to write to the destination function.
        # Provided for backward compatibility. Applications that are created with the current API version have
        # an application-level service execution role rather than a resource-level role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String,
          @role_arn : String? = nil
        )
        end
      end

      # When you update an SQL-based Kinesis Data Analytics application's output configuration using the
      # UpdateApplication operation, provides information about an Amazon Lambda function that is configured
      # as the destination.

      struct LambdaOutputUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination Amazon Lambda function. To specify an earlier
        # version of the Lambda function than the latest, include the Lambda function version in the Lambda
        # function ARN. For more information about Lambda ARNs, see Example ARNs: Amazon Lambda

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String

        def initialize(
          @resource_arn_update : String
        )
        end
      end

      # The number of allowed resources has been exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A request for a list of operations performed on an application.

      struct ListApplicationOperationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String


        @[JSON::Field(key: "Limit")]
        getter limit : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Operation")]
        getter operation : String?


        @[JSON::Field(key: "OperationStatus")]
        getter operation_status : String?

        def initialize(
          @application_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @operation : String? = nil,
          @operation_status : String? = nil
        )
        end
      end

      # A response that returns a list of operations for an application.

      struct ListApplicationOperationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationOperationInfoList")]
        getter application_operation_info_list : Array(Types::ApplicationOperationInfo)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_operation_info_list : Array(Types::ApplicationOperationInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationSnapshotsRequest
        include JSON::Serializable

        # The name of an existing application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The maximum number of application snapshots to list.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Use this parameter if you receive a NextToken response in a previous request that indicates that
        # there is more output available. Set it to the value of the previous call's NextToken response to
        # indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationSnapshotsResponse
        include JSON::Serializable

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A collection of objects containing information about the application snapshots.

        @[JSON::Field(key: "SnapshotSummaries")]
        getter snapshot_summaries : Array(Types::SnapshotDetails)?

        def initialize(
          @next_token : String? = nil,
          @snapshot_summaries : Array(Types::SnapshotDetails)? = nil
        )
        end
      end


      struct ListApplicationVersionsRequest
        include JSON::Serializable

        # The name of the application for which you want to list all versions.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The maximum number of versions to list in this invocation of the operation.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If a previous invocation of this operation returned a pagination token, pass it into this value to
        # retrieve the next set of results. For more information about pagination, see Using the Amazon
        # Command Line Interface's Pagination Options .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationVersionsResponse
        include JSON::Serializable

        # A list of the application versions and the associated configuration summaries. The list includes
        # application versions that were rolled back. To get the complete description of a specific
        # application version, invoke the DescribeApplicationVersion operation.

        @[JSON::Field(key: "ApplicationVersionSummaries")]
        getter application_version_summaries : Array(Types::ApplicationVersionSummary)?

        # The pagination token for the next set of results, or null if there are no additional results. To
        # retrieve the next set of items, pass this token into a subsequent invocation of this operation. For
        # more information about pagination, see Using the Amazon Command Line Interface's Pagination Options
        # .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_version_summaries : Array(Types::ApplicationVersionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # The maximum number of applications to list.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If a previous command returned a pagination token, pass it into this value to retrieve the next set
        # of results. For more information about pagination, see Using the Amazon Command Line Interface's
        # Pagination Options .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # A list of ApplicationSummary objects.

        @[JSON::Field(key: "ApplicationSummaries")]
        getter application_summaries : Array(Types::ApplicationSummary)

        # The pagination token for the next set of results, or null if there are no additional results. Pass
        # this token into a subsequent command to retrieve the next set of items For more information about
        # pagination, see Using the Amazon Command Line Interface's Pagination Options .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_summaries : Array(Types::ApplicationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the application for which to retrieve tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The key-value tags assigned to the application.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # When you configure a SQL-based Kinesis Data Analytics application's input at the time of creating or
      # updating an application, provides additional mapping information specific to the record format (such
      # as JSON, CSV, or record fields delimited by some delimiter) on the streaming source.

      struct MappingParameters
        include JSON::Serializable

        # Provides additional mapping information when the record format uses delimiters (for example, CSV).

        @[JSON::Field(key: "CSVMappingParameters")]
        getter csv_mapping_parameters : Types::CSVMappingParameters?

        # Provides additional mapping information when JSON is the record format on the streaming source.

        @[JSON::Field(key: "JSONMappingParameters")]
        getter json_mapping_parameters : Types::JSONMappingParameters?

        def initialize(
          @csv_mapping_parameters : Types::CSVMappingParameters? = nil,
          @json_mapping_parameters : Types::JSONMappingParameters? = nil
        )
        end
      end

      # The information required to specify a Maven reference. You can use Maven references to specify
      # dependency JAR files.

      struct MavenReference
        include JSON::Serializable

        # The artifact ID of the Maven reference.

        @[JSON::Field(key: "ArtifactId")]
        getter artifact_id : String

        # The group ID of the Maven reference.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The version of the Maven reference.

        @[JSON::Field(key: "Version")]
        getter version : String

        def initialize(
          @artifact_id : String,
          @group_id : String,
          @version : String
        )
        end
      end

      # Describes configuration parameters for Amazon CloudWatch logging for an application. For more
      # information about CloudWatch logging, see Monitoring .

      struct MonitoringConfiguration
        include JSON::Serializable

        # Describes whether to use the default CloudWatch logging configuration for an application. You must
        # set this property to CUSTOM in order to set the LogLevel or MetricsLevel parameters.

        @[JSON::Field(key: "ConfigurationType")]
        getter configuration_type : String

        # Describes the verbosity of the CloudWatch Logs for an application.

        @[JSON::Field(key: "LogLevel")]
        getter log_level : String?

        # Describes the granularity of the CloudWatch Logs for an application. The Parallelism level is not
        # recommended for applications with a Parallelism over 64 due to excessive costs.

        @[JSON::Field(key: "MetricsLevel")]
        getter metrics_level : String?

        def initialize(
          @configuration_type : String,
          @log_level : String? = nil,
          @metrics_level : String? = nil
        )
        end
      end

      # Describes configuration parameters for CloudWatch logging for an application.

      struct MonitoringConfigurationDescription
        include JSON::Serializable

        # Describes whether to use the default CloudWatch logging configuration for an application.

        @[JSON::Field(key: "ConfigurationType")]
        getter configuration_type : String?

        # Describes the verbosity of the CloudWatch Logs for an application.

        @[JSON::Field(key: "LogLevel")]
        getter log_level : String?

        # Describes the granularity of the CloudWatch Logs for an application.

        @[JSON::Field(key: "MetricsLevel")]
        getter metrics_level : String?

        def initialize(
          @configuration_type : String? = nil,
          @log_level : String? = nil,
          @metrics_level : String? = nil
        )
        end
      end

      # Describes updates to configuration parameters for Amazon CloudWatch logging for an application.

      struct MonitoringConfigurationUpdate
        include JSON::Serializable

        # Describes updates to whether to use the default CloudWatch logging configuration for an application.
        # You must set this property to CUSTOM in order to set the LogLevel or MetricsLevel parameters.

        @[JSON::Field(key: "ConfigurationTypeUpdate")]
        getter configuration_type_update : String?

        # Describes updates to the verbosity of the CloudWatch Logs for an application.

        @[JSON::Field(key: "LogLevelUpdate")]
        getter log_level_update : String?

        # Describes updates to the granularity of the CloudWatch Logs for an application. The Parallelism
        # level is not recommended for applications with a Parallelism over 64 due to excessive costs.

        @[JSON::Field(key: "MetricsLevelUpdate")]
        getter metrics_level_update : String?

        def initialize(
          @configuration_type_update : String? = nil,
          @log_level_update : String? = nil,
          @metrics_level_update : String? = nil
        )
        end
      end

      # Provides a description of the operation failure.

      struct OperationFailureDetails
        include JSON::Serializable


        @[JSON::Field(key: "ErrorInfo")]
        getter error_info : Types::ErrorInfo?

        # The rollback operation ID of the system-rollback operation that executed due to failure in the
        # current operation.

        @[JSON::Field(key: "RollbackOperationId")]
        getter rollback_operation_id : String?

        def initialize(
          @error_info : Types::ErrorInfo? = nil,
          @rollback_operation_id : String? = nil
        )
        end
      end

      # Describes a SQL-based Kinesis Data Analytics application's output configuration, in which you
      # identify an in-application stream and a destination where you want the in-application stream data to
      # be written. The destination can be a Kinesis data stream or a Kinesis Data Firehose delivery stream.

      struct Output
        include JSON::Serializable

        # Describes the data format when records are written to the destination.

        @[JSON::Field(key: "DestinationSchema")]
        getter destination_schema : Types::DestinationSchema

        # The name of the in-application stream.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Identifies a Kinesis Data Firehose delivery stream as the destination.

        @[JSON::Field(key: "KinesisFirehoseOutput")]
        getter kinesis_firehose_output : Types::KinesisFirehoseOutput?

        # Identifies a Kinesis data stream as the destination.

        @[JSON::Field(key: "KinesisStreamsOutput")]
        getter kinesis_streams_output : Types::KinesisStreamsOutput?

        # Identifies an Amazon Lambda function as the destination.

        @[JSON::Field(key: "LambdaOutput")]
        getter lambda_output : Types::LambdaOutput?

        def initialize(
          @destination_schema : Types::DestinationSchema,
          @name : String,
          @kinesis_firehose_output : Types::KinesisFirehoseOutput? = nil,
          @kinesis_streams_output : Types::KinesisStreamsOutput? = nil,
          @lambda_output : Types::LambdaOutput? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes the application output configuration,
      # which includes the in-application stream name and the destination where the stream data is written.
      # The destination can be a Kinesis data stream or a Kinesis Data Firehose delivery stream.

      struct OutputDescription
        include JSON::Serializable

        # The data format used for writing data to the destination.

        @[JSON::Field(key: "DestinationSchema")]
        getter destination_schema : Types::DestinationSchema?

        # Describes the Kinesis Data Firehose delivery stream that is configured as the destination where
        # output is written.

        @[JSON::Field(key: "KinesisFirehoseOutputDescription")]
        getter kinesis_firehose_output_description : Types::KinesisFirehoseOutputDescription?

        # Describes the Kinesis data stream that is configured as the destination where output is written.

        @[JSON::Field(key: "KinesisStreamsOutputDescription")]
        getter kinesis_streams_output_description : Types::KinesisStreamsOutputDescription?

        # Describes the Lambda function that is configured as the destination where output is written.

        @[JSON::Field(key: "LambdaOutputDescription")]
        getter lambda_output_description : Types::LambdaOutputDescription?

        # The name of the in-application stream that is configured as output.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A unique identifier for the output configuration.

        @[JSON::Field(key: "OutputId")]
        getter output_id : String?

        def initialize(
          @destination_schema : Types::DestinationSchema? = nil,
          @kinesis_firehose_output_description : Types::KinesisFirehoseOutputDescription? = nil,
          @kinesis_streams_output_description : Types::KinesisStreamsOutputDescription? = nil,
          @lambda_output_description : Types::LambdaOutputDescription? = nil,
          @name : String? = nil,
          @output_id : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes updates to the output configuration
      # identified by the OutputId .

      struct OutputUpdate
        include JSON::Serializable

        # Identifies the specific output configuration that you want to update.

        @[JSON::Field(key: "OutputId")]
        getter output_id : String

        # Describes the data format when records are written to the destination.

        @[JSON::Field(key: "DestinationSchemaUpdate")]
        getter destination_schema_update : Types::DestinationSchema?

        # Describes a Kinesis Data Firehose delivery stream as the destination for the output.

        @[JSON::Field(key: "KinesisFirehoseOutputUpdate")]
        getter kinesis_firehose_output_update : Types::KinesisFirehoseOutputUpdate?

        # Describes a Kinesis data stream as the destination for the output.

        @[JSON::Field(key: "KinesisStreamsOutputUpdate")]
        getter kinesis_streams_output_update : Types::KinesisStreamsOutputUpdate?

        # Describes an Amazon Lambda function as the destination for the output.

        @[JSON::Field(key: "LambdaOutputUpdate")]
        getter lambda_output_update : Types::LambdaOutputUpdate?

        # If you want to specify a different in-application stream for this output configuration, use this
        # field to specify the new in-application stream name.

        @[JSON::Field(key: "NameUpdate")]
        getter name_update : String?

        def initialize(
          @output_id : String,
          @destination_schema_update : Types::DestinationSchema? = nil,
          @kinesis_firehose_output_update : Types::KinesisFirehoseOutputUpdate? = nil,
          @kinesis_streams_output_update : Types::KinesisStreamsOutputUpdate? = nil,
          @lambda_output_update : Types::LambdaOutputUpdate? = nil,
          @name_update : String? = nil
        )
        end
      end

      # Describes parameters for how a Managed Service for Apache Flink application executes multiple tasks
      # simultaneously. For more information about parallelism, see Parallel Execution in the Apache Flink
      # Documentation .

      struct ParallelismConfiguration
        include JSON::Serializable

        # Describes whether the application uses the default parallelism for the Managed Service for Apache
        # Flink service. You must set this property to CUSTOM in order to change your application's
        # AutoScalingEnabled , Parallelism , or ParallelismPerKPU properties.

        @[JSON::Field(key: "ConfigurationType")]
        getter configuration_type : String

        # Describes whether the Managed Service for Apache Flink service can increase the parallelism of the
        # application in response to increased throughput.

        @[JSON::Field(key: "AutoScalingEnabled")]
        getter auto_scaling_enabled : Bool?

        # Describes the initial number of parallel tasks that a Managed Service for Apache Flink application
        # can perform. If AutoScalingEnabled is set to True, Managed Service for Apache Flink increases the
        # CurrentParallelism value in response to application load. The service can increase the
        # CurrentParallelism value up to the maximum parallelism, which is ParalellismPerKPU times the maximum
        # KPUs for the application. The maximum KPUs for an application is 64 by default, and can be increased
        # by requesting a limit increase. If application load is reduced, the service can reduce the
        # CurrentParallelism value down to the Parallelism setting.

        @[JSON::Field(key: "Parallelism")]
        getter parallelism : Int32?

        # Describes the number of parallel tasks that a Managed Service for Apache Flink application can
        # perform per Kinesis Processing Unit (KPU) used by the application. For more information about KPUs,
        # see Amazon Managed Service for Apache Flink Pricing .

        @[JSON::Field(key: "ParallelismPerKPU")]
        getter parallelism_per_kpu : Int32?

        def initialize(
          @configuration_type : String,
          @auto_scaling_enabled : Bool? = nil,
          @parallelism : Int32? = nil,
          @parallelism_per_kpu : Int32? = nil
        )
        end
      end

      # Describes parameters for how a Managed Service for Apache Flink application executes multiple tasks
      # simultaneously.

      struct ParallelismConfigurationDescription
        include JSON::Serializable

        # Describes whether the Managed Service for Apache Flink service can increase the parallelism of the
        # application in response to increased throughput.

        @[JSON::Field(key: "AutoScalingEnabled")]
        getter auto_scaling_enabled : Bool?

        # Describes whether the application uses the default parallelism for the Managed Service for Apache
        # Flink service.

        @[JSON::Field(key: "ConfigurationType")]
        getter configuration_type : String?

        # Describes the current number of parallel tasks that a Managed Service for Apache Flink application
        # can perform. If AutoScalingEnabled is set to True, Managed Service for Apache Flink can increase
        # this value in response to application load. The service can increase this value up to the maximum
        # parallelism, which is ParalellismPerKPU times the maximum KPUs for the application. The maximum KPUs
        # for an application is 32 by default, and can be increased by requesting a limit increase. If
        # application load is reduced, the service can reduce the CurrentParallelism value down to the
        # Parallelism setting.

        @[JSON::Field(key: "CurrentParallelism")]
        getter current_parallelism : Int32?

        # Describes the initial number of parallel tasks that a Managed Service for Apache Flink application
        # can perform. If AutoScalingEnabled is set to True, then Managed Service for Apache Flink can
        # increase the CurrentParallelism value in response to application load. The service can increase
        # CurrentParallelism up to the maximum parallelism, which is ParalellismPerKPU times the maximum KPUs
        # for the application. The maximum KPUs for an application is 64 by default, and can be increased by
        # requesting a limit increase. If application load is reduced, the service can reduce the
        # CurrentParallelism value down to the Parallelism setting.

        @[JSON::Field(key: "Parallelism")]
        getter parallelism : Int32?

        # Describes the number of parallel tasks that a Managed Service for Apache Flink application can
        # perform per Kinesis Processing Unit (KPU) used by the application.

        @[JSON::Field(key: "ParallelismPerKPU")]
        getter parallelism_per_kpu : Int32?

        def initialize(
          @auto_scaling_enabled : Bool? = nil,
          @configuration_type : String? = nil,
          @current_parallelism : Int32? = nil,
          @parallelism : Int32? = nil,
          @parallelism_per_kpu : Int32? = nil
        )
        end
      end

      # Describes updates to parameters for how an application executes multiple tasks simultaneously.

      struct ParallelismConfigurationUpdate
        include JSON::Serializable

        # Describes updates to whether the Managed Service for Apache Flink service can increase the
        # parallelism of a Managed Service for Apache Flink application in response to increased throughput.

        @[JSON::Field(key: "AutoScalingEnabledUpdate")]
        getter auto_scaling_enabled_update : Bool?

        # Describes updates to whether the application uses the default parallelism for the Managed Service
        # for Apache Flink service, or if a custom parallelism is used. You must set this property to CUSTOM
        # in order to change your application's AutoScalingEnabled , Parallelism , or ParallelismPerKPU
        # properties.

        @[JSON::Field(key: "ConfigurationTypeUpdate")]
        getter configuration_type_update : String?

        # Describes updates to the number of parallel tasks an application can perform per Kinesis Processing
        # Unit (KPU) used by the application.

        @[JSON::Field(key: "ParallelismPerKPUUpdate")]
        getter parallelism_per_kpu_update : Int32?

        # Describes updates to the initial number of parallel tasks an application can perform. If
        # AutoScalingEnabled is set to True, then Managed Service for Apache Flink can increase the
        # CurrentParallelism value in response to application load. The service can increase
        # CurrentParallelism up to the maximum parallelism, which is ParalellismPerKPU times the maximum KPUs
        # for the application. The maximum KPUs for an application is 32 by default, and can be increased by
        # requesting a limit increase. If application load is reduced, the service will reduce
        # CurrentParallelism down to the Parallelism setting.

        @[JSON::Field(key: "ParallelismUpdate")]
        getter parallelism_update : Int32?

        def initialize(
          @auto_scaling_enabled_update : Bool? = nil,
          @configuration_type_update : String? = nil,
          @parallelism_per_kpu_update : Int32? = nil,
          @parallelism_update : Int32? = nil
        )
        end
      end

      # Property key-value pairs passed into an application.

      struct PropertyGroup
        include JSON::Serializable

        # Describes the key of an application execution property key-value pair.

        @[JSON::Field(key: "PropertyGroupId")]
        getter property_group_id : String

        # Describes the value of an application execution property key-value pair.

        @[JSON::Field(key: "PropertyMap")]
        getter property_map : Hash(String, String)

        def initialize(
          @property_group_id : String,
          @property_map : Hash(String, String)
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes the mapping of each data element in
      # the streaming source to the corresponding column in the in-application stream. Also used to describe
      # the format of the reference data source.

      struct RecordColumn
        include JSON::Serializable

        # The name of the column that is created in the in-application input stream or reference table.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of column created in the in-application input stream or reference table.

        @[JSON::Field(key: "SqlType")]
        getter sql_type : String

        # A reference to the data element in the streaming input or the reference data source.

        @[JSON::Field(key: "Mapping")]
        getter mapping : String?

        def initialize(
          @name : String,
          @sql_type : String,
          @mapping : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes the record format and relevant mapping
      # information that should be applied to schematize the records on the stream.

      struct RecordFormat
        include JSON::Serializable

        # The type of record format.

        @[JSON::Field(key: "RecordFormatType")]
        getter record_format_type : String

        # When you configure application input at the time of creating or updating an application, provides
        # additional mapping information specific to the record format (such as JSON, CSV, or record fields
        # delimited by some delimiter) on the streaming source.

        @[JSON::Field(key: "MappingParameters")]
        getter mapping_parameters : Types::MappingParameters?

        def initialize(
          @record_format_type : String,
          @mapping_parameters : Types::MappingParameters? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes the reference data source by providing
      # the source information (Amazon S3 bucket name and object key name), the resulting in-application
      # table name that is created, and the necessary schema to map the data elements in the Amazon S3
      # object to the in-application table.

      struct ReferenceDataSource
        include JSON::Serializable

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns created in the in-application stream.

        @[JSON::Field(key: "ReferenceSchema")]
        getter reference_schema : Types::SourceSchema

        # The name of the in-application table to create.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Identifies the S3 bucket and object that contains the reference data. A SQL-based Kinesis Data
        # Analytics application loads reference data only once. If the data changes, you call the
        # UpdateApplication operation to trigger reloading of data into your application.

        @[JSON::Field(key: "S3ReferenceDataSource")]
        getter s3_reference_data_source : Types::S3ReferenceDataSource?

        def initialize(
          @reference_schema : Types::SourceSchema,
          @table_name : String,
          @s3_reference_data_source : Types::S3ReferenceDataSource? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes the reference data source configured
      # for an application.

      struct ReferenceDataSourceDescription
        include JSON::Serializable

        # The ID of the reference data source. This is the ID that Kinesis Data Analytics assigns when you add
        # the reference data source to your application using the CreateApplication or UpdateApplication
        # operation.

        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String

        # Provides the Amazon S3 bucket name, the object key name that contains the reference data.

        @[JSON::Field(key: "S3ReferenceDataSourceDescription")]
        getter s3_reference_data_source_description : Types::S3ReferenceDataSourceDescription

        # The in-application table name created by the specific reference data source configuration.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns created in the in-application stream.

        @[JSON::Field(key: "ReferenceSchema")]
        getter reference_schema : Types::SourceSchema?

        def initialize(
          @reference_id : String,
          @s3_reference_data_source_description : Types::S3ReferenceDataSourceDescription,
          @table_name : String,
          @reference_schema : Types::SourceSchema? = nil
        )
        end
      end

      # When you update a reference data source configuration for a SQL-based Kinesis Data Analytics
      # application, this object provides all the updated values (such as the source bucket name and object
      # key name), the in-application table name that is created, and updated mapping information that maps
      # the data in the Amazon S3 object to the in-application reference table that is created.

      struct ReferenceDataSourceUpdate
        include JSON::Serializable

        # The ID of the reference data source that is being updated. You can use the DescribeApplication
        # operation to get this value.

        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns created in the in-application stream.

        @[JSON::Field(key: "ReferenceSchemaUpdate")]
        getter reference_schema_update : Types::SourceSchema?

        # Describes the S3 bucket name, object key name, and IAM role that Kinesis Data Analytics can assume
        # to read the Amazon S3 object on your behalf and populate the in-application reference table.

        @[JSON::Field(key: "S3ReferenceDataSourceUpdate")]
        getter s3_reference_data_source_update : Types::S3ReferenceDataSourceUpdate?

        # The in-application table name that is created by this update.

        @[JSON::Field(key: "TableNameUpdate")]
        getter table_name_update : String?

        def initialize(
          @reference_id : String,
          @reference_schema_update : Types::SourceSchema? = nil,
          @s3_reference_data_source_update : Types::S3ReferenceDataSourceUpdate? = nil,
          @table_name_update : String? = nil
        )
        end
      end

      # The application is not available for this operation.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specified application can't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Discovery failed to get a record from the streaming source because of the Kinesis Streams
      # ProvisionedThroughputExceededException . For more information, see GetRecords in the Amazon Kinesis
      # Streams API Reference.

      struct ResourceProvisionedThroughputExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RollbackApplicationRequest
        include JSON::Serializable

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The current application version ID. You can retrieve the application version ID using
        # DescribeApplication .

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64
        )
        end
      end


      struct RollbackApplicationResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationDetail")]
        getter application_detail : Types::ApplicationDetail

        # The operation ID that can be used to track the request.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @application_detail : Types::ApplicationDetail,
          @operation_id : String? = nil
        )
        end
      end

      # Describes the starting parameters for an Managed Service for Apache Flink application.

      struct RunConfiguration
        include JSON::Serializable

        # Describes the restore behavior of a restarting application.

        @[JSON::Field(key: "ApplicationRestoreConfiguration")]
        getter application_restore_configuration : Types::ApplicationRestoreConfiguration?

        # Describes the starting parameters for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "FlinkRunConfiguration")]
        getter flink_run_configuration : Types::FlinkRunConfiguration?

        # Describes the starting parameters for a SQL-based Kinesis Data Analytics application application.

        @[JSON::Field(key: "SqlRunConfigurations")]
        getter sql_run_configurations : Array(Types::SqlRunConfiguration)?

        def initialize(
          @application_restore_configuration : Types::ApplicationRestoreConfiguration? = nil,
          @flink_run_configuration : Types::FlinkRunConfiguration? = nil,
          @sql_run_configurations : Array(Types::SqlRunConfiguration)? = nil
        )
        end
      end

      # Describes the starting properties for a Managed Service for Apache Flink application.

      struct RunConfigurationDescription
        include JSON::Serializable

        # Describes the restore behavior of a restarting application.

        @[JSON::Field(key: "ApplicationRestoreConfigurationDescription")]
        getter application_restore_configuration_description : Types::ApplicationRestoreConfiguration?


        @[JSON::Field(key: "FlinkRunConfigurationDescription")]
        getter flink_run_configuration_description : Types::FlinkRunConfiguration?

        def initialize(
          @application_restore_configuration_description : Types::ApplicationRestoreConfiguration? = nil,
          @flink_run_configuration_description : Types::FlinkRunConfiguration? = nil
        )
        end
      end

      # Describes the updates to the starting parameters for a Managed Service for Apache Flink application.

      struct RunConfigurationUpdate
        include JSON::Serializable

        # Describes updates to the restore behavior of a restarting application.

        @[JSON::Field(key: "ApplicationRestoreConfiguration")]
        getter application_restore_configuration : Types::ApplicationRestoreConfiguration?

        # Describes the starting parameters for a Managed Service for Apache Flink application.

        @[JSON::Field(key: "FlinkRunConfiguration")]
        getter flink_run_configuration : Types::FlinkRunConfiguration?

        def initialize(
          @application_restore_configuration : Types::ApplicationRestoreConfiguration? = nil,
          @flink_run_configuration : Types::FlinkRunConfiguration? = nil
        )
        end
      end

      # Describes the location of an application's code stored in an S3 bucket.

      struct S3ApplicationCodeLocationDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the S3 bucket containing the application code.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The file key for the object containing the application code.

        @[JSON::Field(key: "FileKey")]
        getter file_key : String

        # The version of the object containing the application code.

        @[JSON::Field(key: "ObjectVersion")]
        getter object_version : String?

        def initialize(
          @bucket_arn : String,
          @file_key : String,
          @object_version : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, provides a description of an Amazon S3 data
      # source, including the Amazon Resource Name (ARN) of the S3 bucket and the name of the Amazon S3
      # object that contains the data.

      struct S3Configuration
        include JSON::Serializable

        # The ARN of the S3 bucket that contains the data.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The name of the object that contains the data.

        @[JSON::Field(key: "FileKey")]
        getter file_key : String

        def initialize(
          @bucket_arn : String,
          @file_key : String
        )
        end
      end

      # The S3 bucket that holds the application information.

      struct S3ContentBaseLocation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 bucket.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The base path for the S3 bucket.

        @[JSON::Field(key: "BasePath")]
        getter base_path : String?

        def initialize(
          @bucket_arn : String,
          @base_path : String? = nil
        )
        end
      end

      # The description of the S3 base location that holds the application.

      struct S3ContentBaseLocationDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 bucket.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The base path for the S3 bucket.

        @[JSON::Field(key: "BasePath")]
        getter base_path : String?

        def initialize(
          @bucket_arn : String,
          @base_path : String? = nil
        )
        end
      end

      # The information required to update the S3 base location that holds the application.

      struct S3ContentBaseLocationUpdate
        include JSON::Serializable

        # The updated S3 bucket path.

        @[JSON::Field(key: "BasePathUpdate")]
        getter base_path_update : String?

        # The updated Amazon Resource Name (ARN) of the S3 bucket.

        @[JSON::Field(key: "BucketARNUpdate")]
        getter bucket_arn_update : String?

        def initialize(
          @base_path_update : String? = nil,
          @bucket_arn_update : String? = nil
        )
        end
      end

      # For a Managed Service for Apache Flink application provides a description of an Amazon S3 object,
      # including the Amazon Resource Name (ARN) of the S3 bucket, the name of the Amazon S3 object that
      # contains the data, and the version number of the Amazon S3 object that contains the data.

      struct S3ContentLocation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the S3 bucket containing the application code.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The file key for the object containing the application code.

        @[JSON::Field(key: "FileKey")]
        getter file_key : String

        # The version of the object containing the application code.

        @[JSON::Field(key: "ObjectVersion")]
        getter object_version : String?

        def initialize(
          @bucket_arn : String,
          @file_key : String,
          @object_version : String? = nil
        )
        end
      end

      # Describes an update for the Amazon S3 code content location for an application.

      struct S3ContentLocationUpdate
        include JSON::Serializable

        # The new Amazon Resource Name (ARN) for the S3 bucket containing the application code.

        @[JSON::Field(key: "BucketARNUpdate")]
        getter bucket_arn_update : String?

        # The new file key for the object containing the application code.

        @[JSON::Field(key: "FileKeyUpdate")]
        getter file_key_update : String?

        # The new version of the object containing the application code.

        @[JSON::Field(key: "ObjectVersionUpdate")]
        getter object_version_update : String?

        def initialize(
          @bucket_arn_update : String? = nil,
          @file_key_update : String? = nil,
          @object_version_update : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, identifies the Amazon S3 bucket and object that
      # contains the reference data. A SQL-based Kinesis Data Analytics application loads reference data
      # only once. If the data changes, you call the UpdateApplication operation to trigger reloading of
      # data into your application.

      struct S3ReferenceDataSource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 bucket.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String?

        # The object key name containing the reference data.

        @[JSON::Field(key: "FileKey")]
        getter file_key : String?

        def initialize(
          @bucket_arn : String? = nil,
          @file_key : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, provides the bucket name and object key name
      # that stores the reference data.

      struct S3ReferenceDataSourceDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 bucket.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # Amazon S3 object key name.

        @[JSON::Field(key: "FileKey")]
        getter file_key : String

        # The ARN of the IAM role that Kinesis Data Analytics can assume to read the Amazon S3 object on your
        # behalf to populate the in-application reference table. Provided for backward compatibility.
        # Applications that are created with the current API version have an application-level service
        # execution role rather than a resource-level role.

        @[JSON::Field(key: "ReferenceRoleARN")]
        getter reference_role_arn : String?

        def initialize(
          @bucket_arn : String,
          @file_key : String,
          @reference_role_arn : String? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes the Amazon S3 bucket name and object
      # key name for an in-application reference table.

      struct S3ReferenceDataSourceUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 bucket.

        @[JSON::Field(key: "BucketARNUpdate")]
        getter bucket_arn_update : String?

        # The object key name.

        @[JSON::Field(key: "FileKeyUpdate")]
        getter file_key_update : String?

        def initialize(
          @bucket_arn_update : String? = nil,
          @file_key_update : String? = nil
        )
        end
      end

      # The service cannot complete the request.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides details about a snapshot of application state.

      struct SnapshotDetails
        include JSON::Serializable

        # The current application version ID when the snapshot was created.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64

        # The identifier for the application snapshot.

        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String

        # The status of the application snapshot.

        @[JSON::Field(key: "SnapshotStatus")]
        getter snapshot_status : String

        # Specifies the encryption settings of data at rest for the application snapshot.

        @[JSON::Field(key: "ApplicationEncryptionConfigurationDescription")]
        getter application_encryption_configuration_description : Types::ApplicationEncryptionConfigurationDescription?

        # The Flink Runtime for the application snapshot.

        @[JSON::Field(key: "RuntimeEnvironment")]
        getter runtime_environment : String?

        # The timestamp of the application snapshot.

        @[JSON::Field(key: "SnapshotCreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter snapshot_creation_timestamp : Time?

        def initialize(
          @application_version_id : Int64,
          @snapshot_name : String,
          @snapshot_status : String,
          @application_encryption_configuration_description : Types::ApplicationEncryptionConfigurationDescription? = nil,
          @runtime_environment : String? = nil,
          @snapshot_creation_timestamp : Time? = nil
        )
        end
      end

      # For a SQL-based Kinesis Data Analytics application, describes the format of the data in the
      # streaming source, and how each data element maps to corresponding columns created in the
      # in-application stream.

      struct SourceSchema
        include JSON::Serializable

        # A list of RecordColumn objects.

        @[JSON::Field(key: "RecordColumns")]
        getter record_columns : Array(Types::RecordColumn)

        # Specifies the format of the records on the streaming source.

        @[JSON::Field(key: "RecordFormat")]
        getter record_format : Types::RecordFormat

        # Specifies the encoding of the records in the streaming source. For example, UTF-8.

        @[JSON::Field(key: "RecordEncoding")]
        getter record_encoding : String?

        def initialize(
          @record_columns : Array(Types::RecordColumn),
          @record_format : Types::RecordFormat,
          @record_encoding : String? = nil
        )
        end
      end

      # Describes the inputs, outputs, and reference data sources for a SQL-based Kinesis Data Analytics
      # application.

      struct SqlApplicationConfiguration
        include JSON::Serializable

        # The array of Input objects describing the input streams used by the application.

        @[JSON::Field(key: "Inputs")]
        getter inputs : Array(Types::Input)?

        # The array of Output objects describing the destination streams used by the application.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::Output)?

        # The array of ReferenceDataSource objects describing the reference data sources used by the
        # application.

        @[JSON::Field(key: "ReferenceDataSources")]
        getter reference_data_sources : Array(Types::ReferenceDataSource)?

        def initialize(
          @inputs : Array(Types::Input)? = nil,
          @outputs : Array(Types::Output)? = nil,
          @reference_data_sources : Array(Types::ReferenceDataSource)? = nil
        )
        end
      end

      # Describes the inputs, outputs, and reference data sources for a SQL-based Kinesis Data Analytics
      # application.

      struct SqlApplicationConfigurationDescription
        include JSON::Serializable

        # The array of InputDescription objects describing the input streams used by the application.

        @[JSON::Field(key: "InputDescriptions")]
        getter input_descriptions : Array(Types::InputDescription)?

        # The array of OutputDescription objects describing the destination streams used by the application.

        @[JSON::Field(key: "OutputDescriptions")]
        getter output_descriptions : Array(Types::OutputDescription)?

        # The array of ReferenceDataSourceDescription objects describing the reference data sources used by
        # the application.

        @[JSON::Field(key: "ReferenceDataSourceDescriptions")]
        getter reference_data_source_descriptions : Array(Types::ReferenceDataSourceDescription)?

        def initialize(
          @input_descriptions : Array(Types::InputDescription)? = nil,
          @output_descriptions : Array(Types::OutputDescription)? = nil,
          @reference_data_source_descriptions : Array(Types::ReferenceDataSourceDescription)? = nil
        )
        end
      end

      # Describes updates to the input streams, destination streams, and reference data sources for a
      # SQL-based Kinesis Data Analytics application.

      struct SqlApplicationConfigurationUpdate
        include JSON::Serializable

        # The array of InputUpdate objects describing the new input streams used by the application.

        @[JSON::Field(key: "InputUpdates")]
        getter input_updates : Array(Types::InputUpdate)?

        # The array of OutputUpdate objects describing the new destination streams used by the application.

        @[JSON::Field(key: "OutputUpdates")]
        getter output_updates : Array(Types::OutputUpdate)?

        # The array of ReferenceDataSourceUpdate objects describing the new reference data sources used by the
        # application.

        @[JSON::Field(key: "ReferenceDataSourceUpdates")]
        getter reference_data_source_updates : Array(Types::ReferenceDataSourceUpdate)?

        def initialize(
          @input_updates : Array(Types::InputUpdate)? = nil,
          @output_updates : Array(Types::OutputUpdate)? = nil,
          @reference_data_source_updates : Array(Types::ReferenceDataSourceUpdate)? = nil
        )
        end
      end

      # Describes the starting parameters for a SQL-based Kinesis Data Analytics application.

      struct SqlRunConfiguration
        include JSON::Serializable

        # The input source ID. You can get this ID by calling the DescribeApplication operation.

        @[JSON::Field(key: "InputId")]
        getter input_id : String

        # The point at which you want the application to start processing records from the streaming source.

        @[JSON::Field(key: "InputStartingPositionConfiguration")]
        getter input_starting_position_configuration : Types::InputStartingPositionConfiguration

        def initialize(
          @input_id : String,
          @input_starting_position_configuration : Types::InputStartingPositionConfiguration
        )
        end
      end


      struct StartApplicationRequest
        include JSON::Serializable

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Identifies the run configuration (start parameters) of a Managed Service for Apache Flink
        # application.

        @[JSON::Field(key: "RunConfiguration")]
        getter run_configuration : Types::RunConfiguration?

        def initialize(
          @application_name : String,
          @run_configuration : Types::RunConfiguration? = nil
        )
        end
      end


      struct StartApplicationResponse
        include JSON::Serializable

        # The operation ID that can be used to track the request.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct StopApplicationRequest
        include JSON::Serializable

        # The name of the running application to stop.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Set to true to force the application to stop. If you set Force to true , Managed Service for Apache
        # Flink stops the application without taking a snapshot. Force-stopping your application may lead to
        # data loss or duplication. To prevent data loss or duplicate processing of data during application
        # restarts, we recommend you to take frequent snapshots of your application. You can only force stop a
        # Managed Service for Apache Flink application. You can't force stop a SQL-based Kinesis Data
        # Analytics application. The application must be in the STARTING , UPDATING , STOPPING , AUTOSCALING ,
        # or RUNNING status.

        @[JSON::Field(key: "Force")]
        getter force : Bool?

        def initialize(
          @application_name : String,
          @force : Bool? = nil
        )
        end
      end


      struct StopApplicationResponse
        include JSON::Serializable

        # The operation ID that can be used to track the request.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # A key-value pair (the value is optional) that you can define and assign to Amazon resources. If you
      # specify a tag that already exists, the tag value is replaced with the value that you specify in the
      # request. Note that the maximum number of application tags includes system tags. The maximum number
      # of user-defined application tags is 50. For more information, see Using Tagging .

      struct Tag
        include JSON::Serializable

        # The key of the key-value tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the key-value tag. The value is optional.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the application to assign the tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The key-value tags to assign to the application.

        @[JSON::Field(key: "Tags")]
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

      # Application created with too many tags, or too many tags added to an application. Note that the
      # maximum number of application tags includes system tags. The maximum number of user-defined
      # application tags is 50.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The data format is not valid. Kinesis Data Analytics cannot detect the schema for the given
      # streaming source.

      struct UnableToDetectSchemaException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Stream data that was modified by the processor specified in the InputProcessingConfiguration
        # parameter.

        @[JSON::Field(key: "ProcessedInputRecords")]
        getter processed_input_records : Array(String)?

        # Raw stream data that was sampled to infer the schema.

        @[JSON::Field(key: "RawInputRecords")]
        getter raw_input_records : Array(String)?

        def initialize(
          @message : String? = nil,
          @processed_input_records : Array(String)? = nil,
          @raw_input_records : Array(String)? = nil
        )
        end
      end

      # The request was rejected because a specified parameter is not supported or a specified resource is
      # not valid for this operation.

      struct UnsupportedOperationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the Managed Service for Apache Flink application from which to remove the tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of keys of tags to remove from the specified application.

        @[JSON::Field(key: "TagKeys")]
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


      struct UpdateApplicationMaintenanceConfigurationRequest
        include JSON::Serializable

        # Describes the application maintenance configuration update.

        @[JSON::Field(key: "ApplicationMaintenanceConfigurationUpdate")]
        getter application_maintenance_configuration_update : Types::ApplicationMaintenanceConfigurationUpdate

        # The name of the application for which you want to update the maintenance configuration.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        def initialize(
          @application_maintenance_configuration_update : Types::ApplicationMaintenanceConfigurationUpdate,
          @application_name : String
        )
        end
      end


      struct UpdateApplicationMaintenanceConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String?

        # The application maintenance configuration description after the update.

        @[JSON::Field(key: "ApplicationMaintenanceConfigurationDescription")]
        getter application_maintenance_configuration_description : Types::ApplicationMaintenanceConfigurationDescription?

        def initialize(
          @application_arn : String? = nil,
          @application_maintenance_configuration_description : Types::ApplicationMaintenanceConfigurationDescription? = nil
        )
        end
      end


      struct UpdateApplicationRequest
        include JSON::Serializable

        # The name of the application to update.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Describes application configuration updates.

        @[JSON::Field(key: "ApplicationConfigurationUpdate")]
        getter application_configuration_update : Types::ApplicationConfigurationUpdate?

        # Describes application Amazon CloudWatch logging option updates. You can only update existing
        # CloudWatch logging options with this action. To add a new CloudWatch logging option, use
        # AddApplicationCloudWatchLoggingOption .

        @[JSON::Field(key: "CloudWatchLoggingOptionUpdates")]
        getter cloud_watch_logging_option_updates : Array(Types::CloudWatchLoggingOptionUpdate)?

        # A value you use to implement strong concurrency for application updates. You must provide the
        # CurrentApplicationVersionId or the ConditionalToken . You get the application's current
        # ConditionalToken using DescribeApplication . For better concurrency support, use the
        # ConditionalToken parameter instead of CurrentApplicationVersionId .

        @[JSON::Field(key: "ConditionalToken")]
        getter conditional_token : String?

        # The current application version ID. You must provide the CurrentApplicationVersionId or the
        # ConditionalToken .You can retrieve the application version ID using DescribeApplication . For better
        # concurrency support, use the ConditionalToken parameter instead of CurrentApplicationVersionId .

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64?

        # Describes updates to the application's starting parameters.

        @[JSON::Field(key: "RunConfigurationUpdate")]
        getter run_configuration_update : Types::RunConfigurationUpdate?

        # Updates the Managed Service for Apache Flink runtime environment used to run your code. To avoid
        # issues you must: Ensure your new jar and dependencies are compatible with the new runtime selected.
        # Ensure your new code's state is compatible with the snapshot from which your application will start

        @[JSON::Field(key: "RuntimeEnvironmentUpdate")]
        getter runtime_environment_update : String?

        # Describes updates to the service execution role.

        @[JSON::Field(key: "ServiceExecutionRoleUpdate")]
        getter service_execution_role_update : String?

        def initialize(
          @application_name : String,
          @application_configuration_update : Types::ApplicationConfigurationUpdate? = nil,
          @cloud_watch_logging_option_updates : Array(Types::CloudWatchLoggingOptionUpdate)? = nil,
          @conditional_token : String? = nil,
          @current_application_version_id : Int64? = nil,
          @run_configuration_update : Types::RunConfigurationUpdate? = nil,
          @runtime_environment_update : String? = nil,
          @service_execution_role_update : String? = nil
        )
        end
      end


      struct UpdateApplicationResponse
        include JSON::Serializable

        # Describes application updates.

        @[JSON::Field(key: "ApplicationDetail")]
        getter application_detail : Types::ApplicationDetail

        # The operation ID that can be used to track the request.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @application_detail : Types::ApplicationDetail,
          @operation_id : String? = nil
        )
        end
      end

      # Describes the parameters of a VPC used by the application.

      struct VpcConfiguration
        include JSON::Serializable

        # The array of SecurityGroup IDs used by the VPC configuration.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # The array of Subnet IDs used by the VPC configuration.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String)
        )
        end
      end

      # Describes the parameters of a VPC used by the application.

      struct VpcConfigurationDescription
        include JSON::Serializable

        # The array of SecurityGroup IDs used by the VPC configuration.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # The array of Subnet IDs used by the VPC configuration.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the VPC configuration.

        @[JSON::Field(key: "VpcConfigurationId")]
        getter vpc_configuration_id : String

        # The ID of the associated VPC.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String),
          @vpc_configuration_id : String,
          @vpc_id : String
        )
        end
      end

      # Describes updates to the VPC configuration used by the application.

      struct VpcConfigurationUpdate
        include JSON::Serializable

        # Describes an update to the ID of the VPC configuration.

        @[JSON::Field(key: "VpcConfigurationId")]
        getter vpc_configuration_id : String

        # Describes updates to the array of SecurityGroup IDs used by the VPC configuration.

        @[JSON::Field(key: "SecurityGroupIdUpdates")]
        getter security_group_id_updates : Array(String)?

        # Describes updates to the array of Subnet IDs used by the VPC configuration.

        @[JSON::Field(key: "SubnetIdUpdates")]
        getter subnet_id_updates : Array(String)?

        def initialize(
          @vpc_configuration_id : String,
          @security_group_id_updates : Array(String)? = nil,
          @subnet_id_updates : Array(String)? = nil
        )
        end
      end

      # The configuration of a Managed Service for Apache Flink Studio notebook.

      struct ZeppelinApplicationConfiguration
        include JSON::Serializable

        # The Amazon Glue Data Catalog that you use in queries in a Managed Service for Apache Flink Studio
        # notebook.

        @[JSON::Field(key: "CatalogConfiguration")]
        getter catalog_configuration : Types::CatalogConfiguration?

        # Custom artifacts are dependency JARs and user-defined functions (UDF).

        @[JSON::Field(key: "CustomArtifactsConfiguration")]
        getter custom_artifacts_configuration : Array(Types::CustomArtifactConfiguration)?

        # The information required to deploy a Managed Service for Apache Flink Studio notebook as an
        # application with durable state.

        @[JSON::Field(key: "DeployAsApplicationConfiguration")]
        getter deploy_as_application_configuration : Types::DeployAsApplicationConfiguration?

        # The monitoring configuration of a Managed Service for Apache Flink Studio notebook.

        @[JSON::Field(key: "MonitoringConfiguration")]
        getter monitoring_configuration : Types::ZeppelinMonitoringConfiguration?

        def initialize(
          @catalog_configuration : Types::CatalogConfiguration? = nil,
          @custom_artifacts_configuration : Array(Types::CustomArtifactConfiguration)? = nil,
          @deploy_as_application_configuration : Types::DeployAsApplicationConfiguration? = nil,
          @monitoring_configuration : Types::ZeppelinMonitoringConfiguration? = nil
        )
        end
      end

      # The configuration of a Managed Service for Apache Flink Studio notebook.

      struct ZeppelinApplicationConfigurationDescription
        include JSON::Serializable

        # The monitoring configuration of a Managed Service for Apache Flink Studio notebook.

        @[JSON::Field(key: "MonitoringConfigurationDescription")]
        getter monitoring_configuration_description : Types::ZeppelinMonitoringConfigurationDescription

        # The Amazon Glue Data Catalog that is associated with the Managed Service for Apache Flink Studio
        # notebook.

        @[JSON::Field(key: "CatalogConfigurationDescription")]
        getter catalog_configuration_description : Types::CatalogConfigurationDescription?

        # Custom artifacts are dependency JARs and user-defined functions (UDF).

        @[JSON::Field(key: "CustomArtifactsConfigurationDescription")]
        getter custom_artifacts_configuration_description : Array(Types::CustomArtifactConfigurationDescription)?

        # The parameters required to deploy a Managed Service for Apache Flink Studio notebook as an
        # application with durable state.

        @[JSON::Field(key: "DeployAsApplicationConfigurationDescription")]
        getter deploy_as_application_configuration_description : Types::DeployAsApplicationConfigurationDescription?

        def initialize(
          @monitoring_configuration_description : Types::ZeppelinMonitoringConfigurationDescription,
          @catalog_configuration_description : Types::CatalogConfigurationDescription? = nil,
          @custom_artifacts_configuration_description : Array(Types::CustomArtifactConfigurationDescription)? = nil,
          @deploy_as_application_configuration_description : Types::DeployAsApplicationConfigurationDescription? = nil
        )
        end
      end

      # Updates to the configuration of Managed Service for Apache Flink Studio notebook.

      struct ZeppelinApplicationConfigurationUpdate
        include JSON::Serializable

        # Updates to the configuration of the Amazon Glue Data Catalog that is associated with the Managed
        # Service for Apache Flink Studio notebook.

        @[JSON::Field(key: "CatalogConfigurationUpdate")]
        getter catalog_configuration_update : Types::CatalogConfigurationUpdate?

        # Updates to the customer artifacts. Custom artifacts are dependency JAR files and user-defined
        # functions (UDF).

        @[JSON::Field(key: "CustomArtifactsConfigurationUpdate")]
        getter custom_artifacts_configuration_update : Array(Types::CustomArtifactConfiguration)?


        @[JSON::Field(key: "DeployAsApplicationConfigurationUpdate")]
        getter deploy_as_application_configuration_update : Types::DeployAsApplicationConfigurationUpdate?

        # Updates to the monitoring configuration of a Managed Service for Apache Flink Studio notebook.

        @[JSON::Field(key: "MonitoringConfigurationUpdate")]
        getter monitoring_configuration_update : Types::ZeppelinMonitoringConfigurationUpdate?

        def initialize(
          @catalog_configuration_update : Types::CatalogConfigurationUpdate? = nil,
          @custom_artifacts_configuration_update : Array(Types::CustomArtifactConfiguration)? = nil,
          @deploy_as_application_configuration_update : Types::DeployAsApplicationConfigurationUpdate? = nil,
          @monitoring_configuration_update : Types::ZeppelinMonitoringConfigurationUpdate? = nil
        )
        end
      end

      # Describes configuration parameters for Amazon CloudWatch logging for a Managed Service for Apache
      # Flink Studio notebook. For more information about CloudWatch logging, see Monitoring .

      struct ZeppelinMonitoringConfiguration
        include JSON::Serializable

        # The verbosity of the CloudWatch Logs for an application.

        @[JSON::Field(key: "LogLevel")]
        getter log_level : String

        def initialize(
          @log_level : String
        )
        end
      end

      # The monitoring configuration for Apache Zeppelin within a Managed Service for Apache Flink Studio
      # notebook.

      struct ZeppelinMonitoringConfigurationDescription
        include JSON::Serializable

        # Describes the verbosity of the CloudWatch Logs for an application.

        @[JSON::Field(key: "LogLevel")]
        getter log_level : String?

        def initialize(
          @log_level : String? = nil
        )
        end
      end

      # Updates to the monitoring configuration for Apache Zeppelin within a Managed Service for Apache
      # Flink Studio notebook.

      struct ZeppelinMonitoringConfigurationUpdate
        include JSON::Serializable

        # Updates to the logging level for Apache Zeppelin within a Managed Service for Apache Flink Studio
        # notebook.

        @[JSON::Field(key: "LogLevelUpdate")]
        getter log_level_update : String

        def initialize(
          @log_level_update : String
        )
        end
      end
    end
  end
end
