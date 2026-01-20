require "json"
require "time"

module AwsSdk
  module KafkaConnect
    module Types

      # The details of the Apache Kafka cluster to which the connector is connected.

      struct ApacheKafkaCluster
        include JSON::Serializable

        # The bootstrap servers of the cluster.

        @[JSON::Field(key: "bootstrapServers")]
        getter bootstrap_servers : String

        # Details of an Amazon VPC which has network connectivity to the Apache Kafka cluster.

        @[JSON::Field(key: "vpc")]
        getter vpc : Types::Vpc

        def initialize(
          @bootstrap_servers : String,
          @vpc : Types::Vpc
        )
        end
      end

      # The description of the Apache Kafka cluster to which the connector is connected.

      struct ApacheKafkaClusterDescription
        include JSON::Serializable

        # The bootstrap servers of the cluster.

        @[JSON::Field(key: "bootstrapServers")]
        getter bootstrap_servers : String?

        # Details of an Amazon VPC which has network connectivity to the Apache Kafka cluster.

        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcDescription?

        def initialize(
          @bootstrap_servers : String? = nil,
          @vpc : Types::VpcDescription? = nil
        )
        end
      end

      # Specifies how the connector scales.

      struct AutoScaling
        include JSON::Serializable

        # The maximum number of workers allocated to the connector.

        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32

        # The number of microcontroller units (MCUs) allocated to each connector worker. The valid values are
        # 1,2,4,8.

        @[JSON::Field(key: "mcuCount")]
        getter mcu_count : Int32

        # The minimum number of workers allocated to the connector.

        @[JSON::Field(key: "minWorkerCount")]
        getter min_worker_count : Int32

        # The sacle-in policy for the connector.

        @[JSON::Field(key: "scaleInPolicy")]
        getter scale_in_policy : Types::ScaleInPolicy?

        # The sacle-out policy for the connector.

        @[JSON::Field(key: "scaleOutPolicy")]
        getter scale_out_policy : Types::ScaleOutPolicy?

        def initialize(
          @max_worker_count : Int32,
          @mcu_count : Int32,
          @min_worker_count : Int32,
          @scale_in_policy : Types::ScaleInPolicy? = nil,
          @scale_out_policy : Types::ScaleOutPolicy? = nil
        )
        end
      end

      # Information about the auto scaling parameters for the connector.

      struct AutoScalingDescription
        include JSON::Serializable

        # The maximum number of workers allocated to the connector.

        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32?

        # The number of microcontroller units (MCUs) allocated to each connector worker. The valid values are
        # 1,2,4,8.

        @[JSON::Field(key: "mcuCount")]
        getter mcu_count : Int32?

        # The minimum number of workers allocated to the connector.

        @[JSON::Field(key: "minWorkerCount")]
        getter min_worker_count : Int32?

        # The sacle-in policy for the connector.

        @[JSON::Field(key: "scaleInPolicy")]
        getter scale_in_policy : Types::ScaleInPolicyDescription?

        # The sacle-out policy for the connector.&gt;

        @[JSON::Field(key: "scaleOutPolicy")]
        getter scale_out_policy : Types::ScaleOutPolicyDescription?

        def initialize(
          @max_worker_count : Int32? = nil,
          @mcu_count : Int32? = nil,
          @min_worker_count : Int32? = nil,
          @scale_in_policy : Types::ScaleInPolicyDescription? = nil,
          @scale_out_policy : Types::ScaleOutPolicyDescription? = nil
        )
        end
      end

      # The updates to the auto scaling parameters for the connector.

      struct AutoScalingUpdate
        include JSON::Serializable

        # The target maximum number of workers allocated to the connector.

        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32

        # The target number of microcontroller units (MCUs) allocated to each connector worker. The valid
        # values are 1,2,4,8.

        @[JSON::Field(key: "mcuCount")]
        getter mcu_count : Int32

        # The target minimum number of workers allocated to the connector.

        @[JSON::Field(key: "minWorkerCount")]
        getter min_worker_count : Int32

        # The target sacle-in policy for the connector.

        @[JSON::Field(key: "scaleInPolicy")]
        getter scale_in_policy : Types::ScaleInPolicyUpdate

        # The target sacle-out policy for the connector.

        @[JSON::Field(key: "scaleOutPolicy")]
        getter scale_out_policy : Types::ScaleOutPolicyUpdate

        def initialize(
          @max_worker_count : Int32,
          @mcu_count : Int32,
          @min_worker_count : Int32,
          @scale_in_policy : Types::ScaleInPolicyUpdate,
          @scale_out_policy : Types::ScaleOutPolicyUpdate
        )
        end
      end

      # HTTP Status Code 400: Bad request due to incorrect input. Correct your request and then retry it.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the capacity of the connector, whether it is auto scaled or provisioned.

      struct Capacity
        include JSON::Serializable

        # Information about the auto scaling parameters for the connector.

        @[JSON::Field(key: "autoScaling")]
        getter auto_scaling : Types::AutoScaling?

        # Details about a fixed capacity allocated to a connector.

        @[JSON::Field(key: "provisionedCapacity")]
        getter provisioned_capacity : Types::ProvisionedCapacity?

        def initialize(
          @auto_scaling : Types::AutoScaling? = nil,
          @provisioned_capacity : Types::ProvisionedCapacity? = nil
        )
        end
      end

      # A description of the connector's capacity.

      struct CapacityDescription
        include JSON::Serializable

        # Describes the connector's auto scaling capacity.

        @[JSON::Field(key: "autoScaling")]
        getter auto_scaling : Types::AutoScalingDescription?

        # Describes a connector's provisioned capacity.

        @[JSON::Field(key: "provisionedCapacity")]
        getter provisioned_capacity : Types::ProvisionedCapacityDescription?

        def initialize(
          @auto_scaling : Types::AutoScalingDescription? = nil,
          @provisioned_capacity : Types::ProvisionedCapacityDescription? = nil
        )
        end
      end

      # The target capacity for the connector. The capacity can be auto scaled or provisioned.

      struct CapacityUpdate
        include JSON::Serializable

        # The target auto scaling setting.

        @[JSON::Field(key: "autoScaling")]
        getter auto_scaling : Types::AutoScalingUpdate?

        # The target settings for provisioned capacity.

        @[JSON::Field(key: "provisionedCapacity")]
        getter provisioned_capacity : Types::ProvisionedCapacityUpdate?

        def initialize(
          @auto_scaling : Types::AutoScalingUpdate? = nil,
          @provisioned_capacity : Types::ProvisionedCapacityUpdate? = nil
        )
        end
      end

      # The settings for delivering connector logs to Amazon CloudWatch Logs.

      struct CloudWatchLogsLogDelivery
        include JSON::Serializable

        # Whether log delivery to Amazon CloudWatch Logs is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The name of the CloudWatch log group that is the destination for log delivery.

        @[JSON::Field(key: "logGroup")]
        getter log_group : String?

        def initialize(
          @enabled : Bool,
          @log_group : String? = nil
        )
        end
      end

      # A description of the log delivery settings.

      struct CloudWatchLogsLogDeliveryDescription
        include JSON::Serializable

        # Whether log delivery to Amazon CloudWatch Logs is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The name of the CloudWatch log group that is the destination for log delivery.

        @[JSON::Field(key: "logGroup")]
        getter log_group : String?

        def initialize(
          @enabled : Bool? = nil,
          @log_group : String? = nil
        )
        end
      end

      # HTTP Status Code 409: Conflict. A resource with this name already exists. Retry your request with
      # another name.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details of a step that is involved in a connector's operation.

      struct ConnectorOperationStep
        include JSON::Serializable

        # The step state of the operation.

        @[JSON::Field(key: "stepState")]
        getter step_state : String?

        # The step type of the operation.

        @[JSON::Field(key: "stepType")]
        getter step_type : String?

        def initialize(
          @step_state : String? = nil,
          @step_type : String? = nil
        )
        end
      end

      # Summary of a connector operation.

      struct ConnectorOperationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector operation.

        @[JSON::Field(key: "connectorOperationArn")]
        getter connector_operation_arn : String?

        # The state of the connector operation.

        @[JSON::Field(key: "connectorOperationState")]
        getter connector_operation_state : String?

        # The type of connector operation performed.

        @[JSON::Field(key: "connectorOperationType")]
        getter connector_operation_type : String?

        # The time when operation was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time when operation ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        def initialize(
          @connector_operation_arn : String? = nil,
          @connector_operation_state : String? = nil,
          @connector_operation_type : String? = nil,
          @creation_time : Time? = nil,
          @end_time : Time? = nil
        )
        end
      end

      # Summary of a connector.

      struct ConnectorSummary
        include JSON::Serializable

        # The connector's compute capacity settings.

        @[JSON::Field(key: "capacity")]
        getter capacity : Types::CapacityDescription?

        # The Amazon Resource Name (ARN) of the connector.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        # The description of the connector.

        @[JSON::Field(key: "connectorDescription")]
        getter connector_description : String?

        # The name of the connector.

        @[JSON::Field(key: "connectorName")]
        getter connector_name : String?

        # The state of the connector.

        @[JSON::Field(key: "connectorState")]
        getter connector_state : String?

        # The time that the connector was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The current version of the connector.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        # The details of the Apache Kafka cluster to which the connector is connected.

        @[JSON::Field(key: "kafkaCluster")]
        getter kafka_cluster : Types::KafkaClusterDescription?

        # The type of client authentication used to connect to the Apache Kafka cluster. The value is NONE
        # when no client authentication is used.

        @[JSON::Field(key: "kafkaClusterClientAuthentication")]
        getter kafka_cluster_client_authentication : Types::KafkaClusterClientAuthenticationDescription?

        # Details of encryption in transit to the Apache Kafka cluster.

        @[JSON::Field(key: "kafkaClusterEncryptionInTransit")]
        getter kafka_cluster_encryption_in_transit : Types::KafkaClusterEncryptionInTransitDescription?

        # The version of Kafka Connect. It has to be compatible with both the Apache Kafka cluster's version
        # and the plugins.

        @[JSON::Field(key: "kafkaConnectVersion")]
        getter kafka_connect_version : String?

        # The settings for delivering connector logs to Amazon CloudWatch Logs.

        @[JSON::Field(key: "logDelivery")]
        getter log_delivery : Types::LogDeliveryDescription?

        # The network type of the connector. It gives connectors connectivity to either IPv4 (IPV4) or IPv4
        # and IPv6 (DUAL) destinations. Defaults to IPV4.

        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # Specifies which plugins were used for this connector.

        @[JSON::Field(key: "plugins")]
        getter plugins : Array(Types::PluginDescription)?

        # The Amazon Resource Name (ARN) of the IAM role used by the connector to access Amazon Web Services
        # resources.

        @[JSON::Field(key: "serviceExecutionRoleArn")]
        getter service_execution_role_arn : String?

        # The worker configurations that are in use with the connector.

        @[JSON::Field(key: "workerConfiguration")]
        getter worker_configuration : Types::WorkerConfigurationDescription?

        def initialize(
          @capacity : Types::CapacityDescription? = nil,
          @connector_arn : String? = nil,
          @connector_description : String? = nil,
          @connector_name : String? = nil,
          @connector_state : String? = nil,
          @creation_time : Time? = nil,
          @current_version : String? = nil,
          @kafka_cluster : Types::KafkaClusterDescription? = nil,
          @kafka_cluster_client_authentication : Types::KafkaClusterClientAuthenticationDescription? = nil,
          @kafka_cluster_encryption_in_transit : Types::KafkaClusterEncryptionInTransitDescription? = nil,
          @kafka_connect_version : String? = nil,
          @log_delivery : Types::LogDeliveryDescription? = nil,
          @network_type : String? = nil,
          @plugins : Array(Types::PluginDescription)? = nil,
          @service_execution_role_arn : String? = nil,
          @worker_configuration : Types::WorkerConfigurationDescription? = nil
        )
        end
      end


      struct CreateConnectorRequest
        include JSON::Serializable

        # Information about the capacity allocated to the connector. Exactly one of the two properties must be
        # specified.

        @[JSON::Field(key: "capacity")]
        getter capacity : Types::Capacity

        # A map of keys to values that represent the configuration for the connector.

        @[JSON::Field(key: "connectorConfiguration")]
        getter connector_configuration : Hash(String, String)

        # The name of the connector.

        @[JSON::Field(key: "connectorName")]
        getter connector_name : String

        # Specifies which Apache Kafka cluster to connect to.

        @[JSON::Field(key: "kafkaCluster")]
        getter kafka_cluster : Types::KafkaCluster

        # Details of the client authentication used by the Apache Kafka cluster.

        @[JSON::Field(key: "kafkaClusterClientAuthentication")]
        getter kafka_cluster_client_authentication : Types::KafkaClusterClientAuthentication

        # Details of encryption in transit to the Apache Kafka cluster.

        @[JSON::Field(key: "kafkaClusterEncryptionInTransit")]
        getter kafka_cluster_encryption_in_transit : Types::KafkaClusterEncryptionInTransit

        # The version of Kafka Connect. It has to be compatible with both the Apache Kafka cluster's version
        # and the plugins.

        @[JSON::Field(key: "kafkaConnectVersion")]
        getter kafka_connect_version : String

        # Amazon MSK Connect does not currently support specifying multiple plugins as a list. To use more
        # than one plugin for your connector, you can create a single custom plugin using a ZIP file that
        # bundles multiple plugins together. Specifies which plugin to use for the connector. You must specify
        # a single-element list containing one customPlugin object.

        @[JSON::Field(key: "plugins")]
        getter plugins : Array(Types::Plugin)

        # The Amazon Resource Name (ARN) of the IAM role used by the connector to access the Amazon Web
        # Services resources that it needs. The types of resources depends on the logic of the connector. For
        # example, a connector that has Amazon S3 as a destination must have permissions that allow it to
        # write to the S3 destination bucket.

        @[JSON::Field(key: "serviceExecutionRoleArn")]
        getter service_execution_role_arn : String

        # A summary description of the connector.

        @[JSON::Field(key: "connectorDescription")]
        getter connector_description : String?

        # Details about log delivery.

        @[JSON::Field(key: "logDelivery")]
        getter log_delivery : Types::LogDelivery?

        # The network type of the connector. It gives connectors connectivity to either IPv4 (IPV4) or IPv4
        # and IPv6 (DUAL) destinations. Defaults to IPV4.

        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The tags you want to attach to the connector.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies which worker configuration to use with the connector.

        @[JSON::Field(key: "workerConfiguration")]
        getter worker_configuration : Types::WorkerConfiguration?

        def initialize(
          @capacity : Types::Capacity,
          @connector_configuration : Hash(String, String),
          @connector_name : String,
          @kafka_cluster : Types::KafkaCluster,
          @kafka_cluster_client_authentication : Types::KafkaClusterClientAuthentication,
          @kafka_cluster_encryption_in_transit : Types::KafkaClusterEncryptionInTransit,
          @kafka_connect_version : String,
          @plugins : Array(Types::Plugin),
          @service_execution_role_arn : String,
          @connector_description : String? = nil,
          @log_delivery : Types::LogDelivery? = nil,
          @network_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @worker_configuration : Types::WorkerConfiguration? = nil
        )
        end
      end


      struct CreateConnectorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that Amazon assigned to the connector.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        # The name of the connector.

        @[JSON::Field(key: "connectorName")]
        getter connector_name : String?

        # The state of the connector.

        @[JSON::Field(key: "connectorState")]
        getter connector_state : String?

        def initialize(
          @connector_arn : String? = nil,
          @connector_name : String? = nil,
          @connector_state : String? = nil
        )
        end
      end


      struct CreateCustomPluginRequest
        include JSON::Serializable

        # The type of the plugin file.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # Information about the location of a custom plugin.

        @[JSON::Field(key: "location")]
        getter location : Types::CustomPluginLocation

        # The name of the custom plugin.

        @[JSON::Field(key: "name")]
        getter name : String

        # A summary description of the custom plugin.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags you want to attach to the custom plugin.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_type : String,
          @location : Types::CustomPluginLocation,
          @name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCustomPluginResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that Amazon assigned to the custom plugin.

        @[JSON::Field(key: "customPluginArn")]
        getter custom_plugin_arn : String?

        # The state of the custom plugin.

        @[JSON::Field(key: "customPluginState")]
        getter custom_plugin_state : String?

        # The name of the custom plugin.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The revision of the custom plugin.

        @[JSON::Field(key: "revision")]
        getter revision : Int64?

        def initialize(
          @custom_plugin_arn : String? = nil,
          @custom_plugin_state : String? = nil,
          @name : String? = nil,
          @revision : Int64? = nil
        )
        end
      end


      struct CreateWorkerConfigurationRequest
        include JSON::Serializable

        # The name of the worker configuration.

        @[JSON::Field(key: "name")]
        getter name : String

        # Base64 encoded contents of connect-distributed.properties file.

        @[JSON::Field(key: "propertiesFileContent")]
        getter properties_file_content : String

        # A summary description of the worker configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags you want to attach to the worker configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @properties_file_content : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateWorkerConfigurationResponse
        include JSON::Serializable

        # The time that the worker configuration was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The latest revision of the worker configuration.

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::WorkerConfigurationRevisionSummary?

        # The name of the worker configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) that Amazon assigned to the worker configuration.

        @[JSON::Field(key: "workerConfigurationArn")]
        getter worker_configuration_arn : String?

        # The state of the worker configuration.

        @[JSON::Field(key: "workerConfigurationState")]
        getter worker_configuration_state : String?

        def initialize(
          @creation_time : Time? = nil,
          @latest_revision : Types::WorkerConfigurationRevisionSummary? = nil,
          @name : String? = nil,
          @worker_configuration_arn : String? = nil,
          @worker_configuration_state : String? = nil
        )
        end
      end

      # A plugin is an Amazon Web Services resource that contains the code that defines a connector's logic.

      struct CustomPlugin
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom plugin.

        @[JSON::Field(key: "customPluginArn")]
        getter custom_plugin_arn : String

        # The revision of the custom plugin.

        @[JSON::Field(key: "revision")]
        getter revision : Int64

        def initialize(
          @custom_plugin_arn : String,
          @revision : Int64
        )
        end
      end

      # Details about a custom plugin.

      struct CustomPluginDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom plugin.

        @[JSON::Field(key: "customPluginArn")]
        getter custom_plugin_arn : String?

        # The revision of the custom plugin.

        @[JSON::Field(key: "revision")]
        getter revision : Int64?

        def initialize(
          @custom_plugin_arn : String? = nil,
          @revision : Int64? = nil
        )
        end
      end

      # Details about a custom plugin file.

      struct CustomPluginFileDescription
        include JSON::Serializable

        # The hex-encoded MD5 checksum of the custom plugin file. You can use it to validate the file.

        @[JSON::Field(key: "fileMd5")]
        getter file_md5 : String?

        # The size in bytes of the custom plugin file. You can use it to validate the file.

        @[JSON::Field(key: "fileSize")]
        getter file_size : Int64?

        def initialize(
          @file_md5 : String? = nil,
          @file_size : Int64? = nil
        )
        end
      end

      # Information about the location of a custom plugin.

      struct CustomPluginLocation
        include JSON::Serializable

        # The S3 bucket Amazon Resource Name (ARN), file key, and object version of the plugin file stored in
        # Amazon S3.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location

        def initialize(
          @s3_location : Types::S3Location
        )
        end
      end

      # Information about the location of a custom plugin.

      struct CustomPluginLocationDescription
        include JSON::Serializable

        # The S3 bucket Amazon Resource Name (ARN), file key, and object version of the plugin file stored in
        # Amazon S3.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3LocationDescription?

        def initialize(
          @s3_location : Types::S3LocationDescription? = nil
        )
        end
      end

      # Details about the revision of a custom plugin.

      struct CustomPluginRevisionSummary
        include JSON::Serializable

        # The format of the plugin file.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The time that the custom plugin was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the custom plugin.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Details about the custom plugin file.

        @[JSON::Field(key: "fileDescription")]
        getter file_description : Types::CustomPluginFileDescription?

        # Information about the location of the custom plugin.

        @[JSON::Field(key: "location")]
        getter location : Types::CustomPluginLocationDescription?

        # The revision of the custom plugin.

        @[JSON::Field(key: "revision")]
        getter revision : Int64?

        def initialize(
          @content_type : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @file_description : Types::CustomPluginFileDescription? = nil,
          @location : Types::CustomPluginLocationDescription? = nil,
          @revision : Int64? = nil
        )
        end
      end

      # A summary of the custom plugin.

      struct CustomPluginSummary
        include JSON::Serializable

        # The time that the custom plugin was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the custom plugin.

        @[JSON::Field(key: "customPluginArn")]
        getter custom_plugin_arn : String?

        # The state of the custom plugin.

        @[JSON::Field(key: "customPluginState")]
        getter custom_plugin_state : String?

        # A description of the custom plugin.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The latest revision of the custom plugin.

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::CustomPluginRevisionSummary?

        # The name of the custom plugin.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @creation_time : Time? = nil,
          @custom_plugin_arn : String? = nil,
          @custom_plugin_state : String? = nil,
          @description : String? = nil,
          @latest_revision : Types::CustomPluginRevisionSummary? = nil,
          @name : String? = nil
        )
        end
      end


      struct DeleteConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector that you want to delete.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String

        # The current version of the connector that you want to delete.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        def initialize(
          @connector_arn : String,
          @current_version : String? = nil
        )
        end
      end


      struct DeleteConnectorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector that you requested to delete.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        # The state of the connector that you requested to delete.

        @[JSON::Field(key: "connectorState")]
        getter connector_state : String?

        def initialize(
          @connector_arn : String? = nil,
          @connector_state : String? = nil
        )
        end
      end


      struct DeleteCustomPluginRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom plugin that you want to delete.

        @[JSON::Field(key: "customPluginArn")]
        getter custom_plugin_arn : String

        def initialize(
          @custom_plugin_arn : String
        )
        end
      end


      struct DeleteCustomPluginResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom plugin that you requested to delete.

        @[JSON::Field(key: "customPluginArn")]
        getter custom_plugin_arn : String?

        # The state of the custom plugin.

        @[JSON::Field(key: "customPluginState")]
        getter custom_plugin_state : String?

        def initialize(
          @custom_plugin_arn : String? = nil,
          @custom_plugin_state : String? = nil
        )
        end
      end


      struct DeleteWorkerConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the worker configuration that you want to delete.

        @[JSON::Field(key: "workerConfigurationArn")]
        getter worker_configuration_arn : String

        def initialize(
          @worker_configuration_arn : String
        )
        end
      end


      struct DeleteWorkerConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the worker configuration that you requested to delete.

        @[JSON::Field(key: "workerConfigurationArn")]
        getter worker_configuration_arn : String?

        # The state of the worker configuration.

        @[JSON::Field(key: "workerConfigurationState")]
        getter worker_configuration_state : String?

        def initialize(
          @worker_configuration_arn : String? = nil,
          @worker_configuration_state : String? = nil
        )
        end
      end


      struct DescribeConnectorOperationRequest
        include JSON::Serializable

        # ARN of the connector operation to be described.

        @[JSON::Field(key: "connectorOperationArn")]
        getter connector_operation_arn : String

        def initialize(
          @connector_operation_arn : String
        )
        end
      end


      struct DescribeConnectorOperationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        # The Amazon Resource Name (ARN) of the connector operation.

        @[JSON::Field(key: "connectorOperationArn")]
        getter connector_operation_arn : String?

        # The state of the connector operation.

        @[JSON::Field(key: "connectorOperationState")]
        getter connector_operation_state : String?

        # The type of connector operation performed.

        @[JSON::Field(key: "connectorOperationType")]
        getter connector_operation_type : String?

        # The time when the operation was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time when the operation ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?


        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::StateDescription?

        # The array of operation steps taken.

        @[JSON::Field(key: "operationSteps")]
        getter operation_steps : Array(Types::ConnectorOperationStep)?

        # The origin connector configuration.

        @[JSON::Field(key: "originConnectorConfiguration")]
        getter origin_connector_configuration : Hash(String, String)?

        # The origin worker setting.

        @[JSON::Field(key: "originWorkerSetting")]
        getter origin_worker_setting : Types::WorkerSetting?

        # The target connector configuration.

        @[JSON::Field(key: "targetConnectorConfiguration")]
        getter target_connector_configuration : Hash(String, String)?

        # The target worker setting.

        @[JSON::Field(key: "targetWorkerSetting")]
        getter target_worker_setting : Types::WorkerSetting?

        def initialize(
          @connector_arn : String? = nil,
          @connector_operation_arn : String? = nil,
          @connector_operation_state : String? = nil,
          @connector_operation_type : String? = nil,
          @creation_time : Time? = nil,
          @end_time : Time? = nil,
          @error_info : Types::StateDescription? = nil,
          @operation_steps : Array(Types::ConnectorOperationStep)? = nil,
          @origin_connector_configuration : Hash(String, String)? = nil,
          @origin_worker_setting : Types::WorkerSetting? = nil,
          @target_connector_configuration : Hash(String, String)? = nil,
          @target_worker_setting : Types::WorkerSetting? = nil
        )
        end
      end


      struct DescribeConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector that you want to describe.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String

        def initialize(
          @connector_arn : String
        )
        end
      end


      struct DescribeConnectorResponse
        include JSON::Serializable

        # Information about the capacity of the connector, whether it is auto scaled or provisioned.

        @[JSON::Field(key: "capacity")]
        getter capacity : Types::CapacityDescription?

        # The Amazon Resource Name (ARN) of the connector.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        # A map of keys to values that represent the configuration for the connector.

        @[JSON::Field(key: "connectorConfiguration")]
        getter connector_configuration : Hash(String, String)?

        # A summary description of the connector.

        @[JSON::Field(key: "connectorDescription")]
        getter connector_description : String?

        # The name of the connector.

        @[JSON::Field(key: "connectorName")]
        getter connector_name : String?

        # The state of the connector.

        @[JSON::Field(key: "connectorState")]
        getter connector_state : String?

        # The time the connector was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The current version of the connector.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        # The Apache Kafka cluster that the connector is connected to.

        @[JSON::Field(key: "kafkaCluster")]
        getter kafka_cluster : Types::KafkaClusterDescription?

        # The type of client authentication used to connect to the Apache Kafka cluster. The value is NONE
        # when no client authentication is used.

        @[JSON::Field(key: "kafkaClusterClientAuthentication")]
        getter kafka_cluster_client_authentication : Types::KafkaClusterClientAuthenticationDescription?

        # Details of encryption in transit to the Apache Kafka cluster.

        @[JSON::Field(key: "kafkaClusterEncryptionInTransit")]
        getter kafka_cluster_encryption_in_transit : Types::KafkaClusterEncryptionInTransitDescription?

        # The version of Kafka Connect. It has to be compatible with both the Apache Kafka cluster's version
        # and the plugins.

        @[JSON::Field(key: "kafkaConnectVersion")]
        getter kafka_connect_version : String?

        # Details about delivering logs to Amazon CloudWatch Logs.

        @[JSON::Field(key: "logDelivery")]
        getter log_delivery : Types::LogDeliveryDescription?

        # The network type of the connector. It gives connectors connectivity to either IPv4 (IPV4) or IPv4
        # and IPv6 (DUAL) destinations. Defaults to IPV4.

        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # Specifies which plugins were used for this connector.

        @[JSON::Field(key: "plugins")]
        getter plugins : Array(Types::PluginDescription)?

        # The Amazon Resource Name (ARN) of the IAM role used by the connector to access Amazon Web Services
        # resources.

        @[JSON::Field(key: "serviceExecutionRoleArn")]
        getter service_execution_role_arn : String?

        # Details about the state of a connector.

        @[JSON::Field(key: "stateDescription")]
        getter state_description : Types::StateDescription?

        # Specifies which worker configuration was used for the connector.

        @[JSON::Field(key: "workerConfiguration")]
        getter worker_configuration : Types::WorkerConfigurationDescription?

        def initialize(
          @capacity : Types::CapacityDescription? = nil,
          @connector_arn : String? = nil,
          @connector_configuration : Hash(String, String)? = nil,
          @connector_description : String? = nil,
          @connector_name : String? = nil,
          @connector_state : String? = nil,
          @creation_time : Time? = nil,
          @current_version : String? = nil,
          @kafka_cluster : Types::KafkaClusterDescription? = nil,
          @kafka_cluster_client_authentication : Types::KafkaClusterClientAuthenticationDescription? = nil,
          @kafka_cluster_encryption_in_transit : Types::KafkaClusterEncryptionInTransitDescription? = nil,
          @kafka_connect_version : String? = nil,
          @log_delivery : Types::LogDeliveryDescription? = nil,
          @network_type : String? = nil,
          @plugins : Array(Types::PluginDescription)? = nil,
          @service_execution_role_arn : String? = nil,
          @state_description : Types::StateDescription? = nil,
          @worker_configuration : Types::WorkerConfigurationDescription? = nil
        )
        end
      end


      struct DescribeCustomPluginRequest
        include JSON::Serializable

        # Returns information about a custom plugin.

        @[JSON::Field(key: "customPluginArn")]
        getter custom_plugin_arn : String

        def initialize(
          @custom_plugin_arn : String
        )
        end
      end


      struct DescribeCustomPluginResponse
        include JSON::Serializable

        # The time that the custom plugin was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the custom plugin.

        @[JSON::Field(key: "customPluginArn")]
        getter custom_plugin_arn : String?

        # The state of the custom plugin.

        @[JSON::Field(key: "customPluginState")]
        getter custom_plugin_state : String?

        # The description of the custom plugin.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The latest successfully created revision of the custom plugin. If there are no successfully created
        # revisions, this field will be absent.

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::CustomPluginRevisionSummary?

        # The name of the custom plugin.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Details about the state of a custom plugin.

        @[JSON::Field(key: "stateDescription")]
        getter state_description : Types::StateDescription?

        def initialize(
          @creation_time : Time? = nil,
          @custom_plugin_arn : String? = nil,
          @custom_plugin_state : String? = nil,
          @description : String? = nil,
          @latest_revision : Types::CustomPluginRevisionSummary? = nil,
          @name : String? = nil,
          @state_description : Types::StateDescription? = nil
        )
        end
      end


      struct DescribeWorkerConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the worker configuration that you want to get information about.

        @[JSON::Field(key: "workerConfigurationArn")]
        getter worker_configuration_arn : String

        def initialize(
          @worker_configuration_arn : String
        )
        end
      end


      struct DescribeWorkerConfigurationResponse
        include JSON::Serializable

        # The time that the worker configuration was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the worker configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The latest revision of the custom configuration.

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::WorkerConfigurationRevisionDescription?

        # The name of the worker configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the custom configuration.

        @[JSON::Field(key: "workerConfigurationArn")]
        getter worker_configuration_arn : String?

        # The state of the worker configuration.

        @[JSON::Field(key: "workerConfigurationState")]
        getter worker_configuration_state : String?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @latest_revision : Types::WorkerConfigurationRevisionDescription? = nil,
          @name : String? = nil,
          @worker_configuration_arn : String? = nil,
          @worker_configuration_state : String? = nil
        )
        end
      end

      # The settings for delivering logs to Amazon Kinesis Data Firehose.

      struct FirehoseLogDelivery
        include JSON::Serializable

        # Specifies whether connector logs get delivered to Amazon Kinesis Data Firehose.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The name of the Kinesis Data Firehose delivery stream that is the destination for log delivery.

        @[JSON::Field(key: "deliveryStream")]
        getter delivery_stream : String?

        def initialize(
          @enabled : Bool,
          @delivery_stream : String? = nil
        )
        end
      end

      # A description of the settings for delivering logs to Amazon Kinesis Data Firehose.

      struct FirehoseLogDeliveryDescription
        include JSON::Serializable

        # The name of the Kinesis Data Firehose delivery stream that is the destination for log delivery.

        @[JSON::Field(key: "deliveryStream")]
        getter delivery_stream : String?

        # Specifies whether connector logs get delivered to Amazon Kinesis Data Firehose.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @delivery_stream : String? = nil,
          @enabled : Bool? = nil
        )
        end
      end

      # HTTP Status Code 403: Access forbidden. Correct your credentials and then retry your request.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # HTTP Status Code 500: Unexpected internal server error. Retrying your request might resolve the
      # issue.

      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The details of the Apache Kafka cluster to which the connector is connected.

      struct KafkaCluster
        include JSON::Serializable

        # The Apache Kafka cluster to which the connector is connected.

        @[JSON::Field(key: "apacheKafkaCluster")]
        getter apache_kafka_cluster : Types::ApacheKafkaCluster

        def initialize(
          @apache_kafka_cluster : Types::ApacheKafkaCluster
        )
        end
      end

      # The client authentication information used in order to authenticate with the Apache Kafka cluster.

      struct KafkaClusterClientAuthentication
        include JSON::Serializable

        # The type of client authentication used to connect to the Apache Kafka cluster. Value NONE means that
        # no client authentication is used.

        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String

        def initialize(
          @authentication_type : String
        )
        end
      end

      # The client authentication information used in order to authenticate with the Apache Kafka cluster.

      struct KafkaClusterClientAuthenticationDescription
        include JSON::Serializable

        # The type of client authentication used to connect to the Apache Kafka cluster. Value NONE means that
        # no client authentication is used.

        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        def initialize(
          @authentication_type : String? = nil
        )
        end
      end

      # Details of how to connect to the Apache Kafka cluster.

      struct KafkaClusterDescription
        include JSON::Serializable

        # The Apache Kafka cluster to which the connector is connected.

        @[JSON::Field(key: "apacheKafkaCluster")]
        getter apache_kafka_cluster : Types::ApacheKafkaClusterDescription?

        def initialize(
          @apache_kafka_cluster : Types::ApacheKafkaClusterDescription? = nil
        )
        end
      end

      # Details of encryption in transit to the Apache Kafka cluster.

      struct KafkaClusterEncryptionInTransit
        include JSON::Serializable

        # The type of encryption in transit to the Apache Kafka cluster.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        def initialize(
          @encryption_type : String
        )
        end
      end

      # The description of the encryption in transit to the Apache Kafka cluster.

      struct KafkaClusterEncryptionInTransitDescription
        include JSON::Serializable

        # The type of encryption in transit to the Apache Kafka cluster.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        def initialize(
          @encryption_type : String? = nil
        )
        end
      end


      struct ListConnectorOperationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector for which to list operations.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String

        # Maximum number of connector operations to fetch in one get request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response is truncated, it includes a NextToken. Send this NextToken in a subsequent request
        # to continue listing from where it left off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connector_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorOperationsResponse
        include JSON::Serializable

        # An array of connector operation descriptions.

        @[JSON::Field(key: "connectorOperations")]
        getter connector_operations : Array(Types::ConnectorOperationSummary)?

        # If the response is truncated, it includes a NextToken. Send this NextToken in a subsequent request
        # to continue listing from where it left off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connector_operations : Array(Types::ConnectorOperationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorsRequest
        include JSON::Serializable

        # The name prefix that you want to use to search for and list connectors.

        @[JSON::Field(key: "connectorNamePrefix")]
        getter connector_name_prefix : String?

        # The maximum number of connectors to list in one response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the response of a ListConnectors operation is truncated, it will include a NextToken. Send this
        # NextToken in a subsequent request to continue listing from where the previous operation left off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connector_name_prefix : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorsResponse
        include JSON::Serializable

        # An array of connector descriptions.

        @[JSON::Field(key: "connectors")]
        getter connectors : Array(Types::ConnectorSummary)?

        # If the response of a ListConnectors operation is truncated, it will include a NextToken. Send this
        # NextToken in a subsequent request to continue listing from where it left off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connectors : Array(Types::ConnectorSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomPluginsRequest
        include JSON::Serializable

        # The maximum number of custom plugins to list in one response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Lists custom plugin names that start with the specified text string.

        @[JSON::Field(key: "namePrefix")]
        getter name_prefix : String?

        # If the response of a ListCustomPlugins operation is truncated, it will include a NextToken. Send
        # this NextToken in a subsequent request to continue listing from where the previous operation left
        # off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomPluginsResponse
        include JSON::Serializable

        # An array of custom plugin descriptions.

        @[JSON::Field(key: "customPlugins")]
        getter custom_plugins : Array(Types::CustomPluginSummary)?

        # If the response of a ListCustomPlugins operation is truncated, it will include a NextToken. Send
        # this NextToken in a subsequent request to continue listing from where the previous operation left
        # off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @custom_plugins : Array(Types::CustomPluginSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to list all attached tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Lists the tags attached to the specified resource in the corresponding request.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListWorkerConfigurationsRequest
        include JSON::Serializable

        # The maximum number of worker configurations to list in one response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Lists worker configuration names that start with the specified text string.

        @[JSON::Field(key: "namePrefix")]
        getter name_prefix : String?

        # If the response of a ListWorkerConfigurations operation is truncated, it will include a NextToken.
        # Send this NextToken in a subsequent request to continue listing from where the previous operation
        # left off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkerConfigurationsResponse
        include JSON::Serializable

        # If the response of a ListWorkerConfigurations operation is truncated, it will include a NextToken.
        # Send this NextToken in a subsequent request to continue listing from where the previous operation
        # left off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of worker configuration descriptions.

        @[JSON::Field(key: "workerConfigurations")]
        getter worker_configurations : Array(Types::WorkerConfigurationSummary)?

        def initialize(
          @next_token : String? = nil,
          @worker_configurations : Array(Types::WorkerConfigurationSummary)? = nil
        )
        end
      end

      # Details about log delivery.

      struct LogDelivery
        include JSON::Serializable

        # The workers can send worker logs to different destination types. This configuration specifies the
        # details of these destinations.

        @[JSON::Field(key: "workerLogDelivery")]
        getter worker_log_delivery : Types::WorkerLogDelivery

        def initialize(
          @worker_log_delivery : Types::WorkerLogDelivery
        )
        end
      end

      # The description of the log delivery settings.

      struct LogDeliveryDescription
        include JSON::Serializable

        # The workers can send worker logs to different destination types. This configuration specifies the
        # details of these destinations.

        @[JSON::Field(key: "workerLogDelivery")]
        getter worker_log_delivery : Types::WorkerLogDeliveryDescription?

        def initialize(
          @worker_log_delivery : Types::WorkerLogDeliveryDescription? = nil
        )
        end
      end

      # HTTP Status Code 404: Resource not found due to incorrect input. Correct your request and then retry
      # it.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A plugin is an Amazon Web Services resource that contains the code that defines your connector
      # logic.

      struct Plugin
        include JSON::Serializable

        # Details about a custom plugin.

        @[JSON::Field(key: "customPlugin")]
        getter custom_plugin : Types::CustomPlugin

        def initialize(
          @custom_plugin : Types::CustomPlugin
        )
        end
      end

      # The description of the plugin.

      struct PluginDescription
        include JSON::Serializable

        # Details about a custom plugin.

        @[JSON::Field(key: "customPlugin")]
        getter custom_plugin : Types::CustomPluginDescription?

        def initialize(
          @custom_plugin : Types::CustomPluginDescription? = nil
        )
        end
      end

      # Details about a connector's provisioned capacity.

      struct ProvisionedCapacity
        include JSON::Serializable

        # The number of microcontroller units (MCUs) allocated to each connector worker. The valid values are
        # 1,2,4,8.

        @[JSON::Field(key: "mcuCount")]
        getter mcu_count : Int32

        # The number of workers that are allocated to the connector.

        @[JSON::Field(key: "workerCount")]
        getter worker_count : Int32

        def initialize(
          @mcu_count : Int32,
          @worker_count : Int32
        )
        end
      end

      # The description of a connector's provisioned capacity.

      struct ProvisionedCapacityDescription
        include JSON::Serializable

        # The number of microcontroller units (MCUs) allocated to each connector worker. The valid values are
        # 1,2,4,8.

        @[JSON::Field(key: "mcuCount")]
        getter mcu_count : Int32?

        # The number of workers that are allocated to the connector.

        @[JSON::Field(key: "workerCount")]
        getter worker_count : Int32?

        def initialize(
          @mcu_count : Int32? = nil,
          @worker_count : Int32? = nil
        )
        end
      end

      # An update to a connector's fixed capacity.

      struct ProvisionedCapacityUpdate
        include JSON::Serializable

        # The number of microcontroller units (MCUs) allocated to each connector worker. The valid values are
        # 1,2,4,8.

        @[JSON::Field(key: "mcuCount")]
        getter mcu_count : Int32

        # The number of workers that are allocated to the connector.

        @[JSON::Field(key: "workerCount")]
        getter worker_count : Int32

        def initialize(
          @mcu_count : Int32,
          @worker_count : Int32
        )
        end
      end

      # The location of an object in Amazon S3.

      struct S3Location
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an S3 bucket.

        @[JSON::Field(key: "bucketArn")]
        getter bucket_arn : String

        # The file key for an object in an S3 bucket.

        @[JSON::Field(key: "fileKey")]
        getter file_key : String

        # The version of an object in an S3 bucket.

        @[JSON::Field(key: "objectVersion")]
        getter object_version : String?

        def initialize(
          @bucket_arn : String,
          @file_key : String,
          @object_version : String? = nil
        )
        end
      end

      # The description of the location of an object in Amazon S3.

      struct S3LocationDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an S3 bucket.

        @[JSON::Field(key: "bucketArn")]
        getter bucket_arn : String?

        # The file key for an object in an S3 bucket.

        @[JSON::Field(key: "fileKey")]
        getter file_key : String?

        # The version of an object in an S3 bucket.

        @[JSON::Field(key: "objectVersion")]
        getter object_version : String?

        def initialize(
          @bucket_arn : String? = nil,
          @file_key : String? = nil,
          @object_version : String? = nil
        )
        end
      end

      # Details about delivering logs to Amazon S3.

      struct S3LogDelivery
        include JSON::Serializable

        # Specifies whether connector logs get sent to the specified Amazon S3 destination.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The name of the S3 bucket that is the destination for log delivery.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The S3 prefix that is the destination for log delivery.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @enabled : Bool,
          @bucket : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # The description of the details about delivering logs to Amazon S3.

      struct S3LogDeliveryDescription
        include JSON::Serializable

        # The name of the S3 bucket that is the destination for log delivery.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # Specifies whether connector logs get sent to the specified Amazon S3 destination.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The S3 prefix that is the destination for log delivery.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String? = nil,
          @enabled : Bool? = nil,
          @prefix : String? = nil
        )
        end
      end

      # The scale-in policy for the connector.

      struct ScaleInPolicy
        include JSON::Serializable

        # Specifies the CPU utilization percentage threshold at which you want connector scale in to be
        # triggered.

        @[JSON::Field(key: "cpuUtilizationPercentage")]
        getter cpu_utilization_percentage : Int32

        def initialize(
          @cpu_utilization_percentage : Int32
        )
        end
      end

      # The description of the scale-in policy for the connector.

      struct ScaleInPolicyDescription
        include JSON::Serializable

        # Specifies the CPU utilization percentage threshold at which you want connector scale in to be
        # triggered.

        @[JSON::Field(key: "cpuUtilizationPercentage")]
        getter cpu_utilization_percentage : Int32?

        def initialize(
          @cpu_utilization_percentage : Int32? = nil
        )
        end
      end

      # An update to the connector's scale-in policy.

      struct ScaleInPolicyUpdate
        include JSON::Serializable

        # The target CPU utilization percentage threshold at which you want connector scale in to be
        # triggered.

        @[JSON::Field(key: "cpuUtilizationPercentage")]
        getter cpu_utilization_percentage : Int32

        def initialize(
          @cpu_utilization_percentage : Int32
        )
        end
      end

      # The scale-out policy for the connector.

      struct ScaleOutPolicy
        include JSON::Serializable

        # The CPU utilization percentage threshold at which you want connector scale out to be triggered.

        @[JSON::Field(key: "cpuUtilizationPercentage")]
        getter cpu_utilization_percentage : Int32

        def initialize(
          @cpu_utilization_percentage : Int32
        )
        end
      end

      # The description of the scale-out policy for the connector.

      struct ScaleOutPolicyDescription
        include JSON::Serializable

        # The CPU utilization percentage threshold at which you want connector scale out to be triggered.

        @[JSON::Field(key: "cpuUtilizationPercentage")]
        getter cpu_utilization_percentage : Int32?

        def initialize(
          @cpu_utilization_percentage : Int32? = nil
        )
        end
      end

      # An update to the connector's scale-out policy.

      struct ScaleOutPolicyUpdate
        include JSON::Serializable

        # The target CPU utilization percentage threshold at which you want connector scale out to be
        # triggered.

        @[JSON::Field(key: "cpuUtilizationPercentage")]
        getter cpu_utilization_percentage : Int32

        def initialize(
          @cpu_utilization_percentage : Int32
        )
        end
      end

      # HTTP Status Code 503: Service Unavailable. Retrying your request in some time might resolve the
      # issue.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about the state of a resource.

      struct StateDescription
        include JSON::Serializable

        # A code that describes the state of a resource.

        @[JSON::Field(key: "code")]
        getter code : String?

        # A message that describes the state of a resource.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which you want to attach tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags that you want to attach to the resource.

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

      # HTTP Status Code 429: Limit exceeded. Resource limit reached.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # HTTP Status Code 401: Unauthorized request. The provided credentials couldn't be validated.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which you want to remove tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags that you want to remove from the resource.

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


      struct UpdateConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector that you want to update.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String

        # The current version of the connector that you want to update.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        # The target capacity.

        @[JSON::Field(key: "capacity")]
        getter capacity : Types::CapacityUpdate?

        # A map of keys to values that represent the configuration for the connector.

        @[JSON::Field(key: "connectorConfiguration")]
        getter connector_configuration : Hash(String, String)?

        def initialize(
          @connector_arn : String,
          @current_version : String,
          @capacity : Types::CapacityUpdate? = nil,
          @connector_configuration : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateConnectorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        # The Amazon Resource Name (ARN) of the connector operation.

        @[JSON::Field(key: "connectorOperationArn")]
        getter connector_operation_arn : String?

        # The state of the connector.

        @[JSON::Field(key: "connectorState")]
        getter connector_state : String?

        def initialize(
          @connector_arn : String? = nil,
          @connector_operation_arn : String? = nil,
          @connector_state : String? = nil
        )
        end
      end

      # Information about the VPC in which the connector resides.

      struct Vpc
        include JSON::Serializable

        # The subnets for the connector.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)

        # The security groups for the connector.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @subnets : Array(String),
          @security_groups : Array(String)? = nil
        )
        end
      end

      # The description of the VPC in which the connector resides.

      struct VpcDescription
        include JSON::Serializable

        # The security groups for the connector.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The subnets for the connector.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        def initialize(
          @security_groups : Array(String)? = nil,
          @subnets : Array(String)? = nil
        )
        end
      end

      # The configuration of the workers, which are the processes that run the connector logic.

      struct WorkerConfiguration
        include JSON::Serializable

        # The revision of the worker configuration.

        @[JSON::Field(key: "revision")]
        getter revision : Int64

        # The Amazon Resource Name (ARN) of the worker configuration.

        @[JSON::Field(key: "workerConfigurationArn")]
        getter worker_configuration_arn : String

        def initialize(
          @revision : Int64,
          @worker_configuration_arn : String
        )
        end
      end

      # The description of the worker configuration.

      struct WorkerConfigurationDescription
        include JSON::Serializable

        # The revision of the worker configuration.

        @[JSON::Field(key: "revision")]
        getter revision : Int64?

        # The Amazon Resource Name (ARN) of the worker configuration.

        @[JSON::Field(key: "workerConfigurationArn")]
        getter worker_configuration_arn : String?

        def initialize(
          @revision : Int64? = nil,
          @worker_configuration_arn : String? = nil
        )
        end
      end

      # The description of the worker configuration revision.

      struct WorkerConfigurationRevisionDescription
        include JSON::Serializable

        # The time that the worker configuration was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the worker configuration revision.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Base64 encoded contents of the connect-distributed.properties file.

        @[JSON::Field(key: "propertiesFileContent")]
        getter properties_file_content : String?

        # The description of a revision of the worker configuration.

        @[JSON::Field(key: "revision")]
        getter revision : Int64?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @properties_file_content : String? = nil,
          @revision : Int64? = nil
        )
        end
      end

      # The summary of a worker configuration revision.

      struct WorkerConfigurationRevisionSummary
        include JSON::Serializable

        # The time that a worker configuration revision was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of a worker configuration revision.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The revision of a worker configuration.

        @[JSON::Field(key: "revision")]
        getter revision : Int64?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @revision : Int64? = nil
        )
        end
      end

      # The summary of a worker configuration.

      struct WorkerConfigurationSummary
        include JSON::Serializable

        # The time that a worker configuration was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of a worker configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The latest revision of a worker configuration.

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::WorkerConfigurationRevisionSummary?

        # The name of the worker configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the worker configuration.

        @[JSON::Field(key: "workerConfigurationArn")]
        getter worker_configuration_arn : String?

        # The state of the worker configuration.

        @[JSON::Field(key: "workerConfigurationState")]
        getter worker_configuration_state : String?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @latest_revision : Types::WorkerConfigurationRevisionSummary? = nil,
          @name : String? = nil,
          @worker_configuration_arn : String? = nil,
          @worker_configuration_state : String? = nil
        )
        end
      end

      # Workers can send worker logs to different destination types. This configuration specifies the
      # details of these destinations.

      struct WorkerLogDelivery
        include JSON::Serializable

        # Details about delivering logs to Amazon CloudWatch Logs.

        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogsLogDelivery?

        # Details about delivering logs to Amazon Kinesis Data Firehose.

        @[JSON::Field(key: "firehose")]
        getter firehose : Types::FirehoseLogDelivery?

        # Details about delivering logs to Amazon S3.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3LogDelivery?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogsLogDelivery? = nil,
          @firehose : Types::FirehoseLogDelivery? = nil,
          @s3 : Types::S3LogDelivery? = nil
        )
        end
      end

      # Workers can send worker logs to different destination types. This configuration specifies the
      # details of these destinations.

      struct WorkerLogDeliveryDescription
        include JSON::Serializable

        # Details about delivering logs to Amazon CloudWatch Logs.

        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogsLogDeliveryDescription?

        # Details about delivering logs to Amazon Kinesis Data Firehose.

        @[JSON::Field(key: "firehose")]
        getter firehose : Types::FirehoseLogDeliveryDescription?

        # Details about delivering logs to Amazon S3.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3LogDeliveryDescription?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogsLogDeliveryDescription? = nil,
          @firehose : Types::FirehoseLogDeliveryDescription? = nil,
          @s3 : Types::S3LogDeliveryDescription? = nil
        )
        end
      end

      # Details about worker setting of a connector

      struct WorkerSetting
        include JSON::Serializable


        @[JSON::Field(key: "capacity")]
        getter capacity : Types::CapacityDescription?

        def initialize(
          @capacity : Types::CapacityDescription? = nil
        )
        end
      end
    end
  end
end
