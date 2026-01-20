require "json"
require "time"

module AwsSdk
  module Kafka
    module Types

      # Details of an Amazon MSK Cluster.

      struct AmazonMskCluster
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon MSK cluster.

        @[JSON::Field(key: "mskClusterArn")]
        getter msk_cluster_arn : String

        def initialize(
          @msk_cluster_arn : String
        )
        end
      end

      # Returns information about an error.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "invalidParameter")]
        getter invalid_parameter : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_parameter : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Request body for BatchAssociateScramSecret.

      struct BatchAssociateScramSecretRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # List of AWS Secrets Manager secret ARNs.

        @[JSON::Field(key: "secretArnList")]
        getter secret_arn_list : Array(String)

        def initialize(
          @cluster_arn : String,
          @secret_arn_list : Array(String)
        )
        end
      end

      # Response body for BatchAssociateScramSecret.

      struct BatchAssociateScramSecretResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # List of errors when associating secrets to cluster.

        @[JSON::Field(key: "unprocessedScramSecrets")]
        getter unprocessed_scram_secrets : Array(Types::UnprocessedScramSecret)?

        def initialize(
          @cluster_arn : String? = nil,
          @unprocessed_scram_secrets : Array(Types::UnprocessedScramSecret)? = nil
        )
        end
      end

      # Request body for BatchDisassociateScramSecret.

      struct BatchDisassociateScramSecretRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # List of AWS Secrets Manager secret ARNs.

        @[JSON::Field(key: "secretArnList")]
        getter secret_arn_list : Array(String)

        def initialize(
          @cluster_arn : String,
          @secret_arn_list : Array(String)
        )
        end
      end

      # Response body for BatchDisassociateScramSecret.

      struct BatchDisassociateScramSecretResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # List of errors when disassociating secrets to cluster.

        @[JSON::Field(key: "unprocessedScramSecrets")]
        getter unprocessed_scram_secrets : Array(Types::UnprocessedScramSecret)?

        def initialize(
          @cluster_arn : String? = nil,
          @unprocessed_scram_secrets : Array(Types::UnprocessedScramSecret)? = nil
        )
        end
      end

      # Describes brokers being changed during a broker count update.

      struct BrokerCountUpdateInfo
        include JSON::Serializable

        # List of Broker Ids when creating new Brokers in a cluster.

        @[JSON::Field(key: "createdBrokerIds")]
        getter created_broker_ids : Array(Float64)?

        # List of Broker Ids when deleting existing Brokers in a cluster.

        @[JSON::Field(key: "deletedBrokerIds")]
        getter deleted_broker_ids : Array(Float64)?

        def initialize(
          @created_broker_ids : Array(Float64)? = nil,
          @deleted_broker_ids : Array(Float64)? = nil
        )
        end
      end

      # Specifies the EBS volume upgrade information. The broker identifier must be set to the keyword ALL.
      # This means the changes apply to all the brokers in the cluster.

      struct BrokerEBSVolumeInfo
        include JSON::Serializable

        # The ID of the broker to update.

        @[JSON::Field(key: "kafkaBrokerNodeId")]
        getter kafka_broker_node_id : String

        # EBS volume provisioned throughput information.

        @[JSON::Field(key: "provisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        # Size of the EBS volume to update.

        @[JSON::Field(key: "volumeSizeGB")]
        getter volume_size_gb : Int32?

        def initialize(
          @kafka_broker_node_id : String,
          @provisioned_throughput : Types::ProvisionedThroughput? = nil,
          @volume_size_gb : Int32? = nil
        )
        end
      end

      # The broker logs configuration for this MSK cluster.

      struct BrokerLogs
        include JSON::Serializable

        # Details of the CloudWatch Logs destination for broker logs.

        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogs?

        # Details of the Kinesis Data Firehose delivery stream that is the destination for broker logs.

        @[JSON::Field(key: "firehose")]
        getter firehose : Types::Firehose?

        # Details of the Amazon S3 destination for broker logs.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogs? = nil,
          @firehose : Types::Firehose? = nil,
          @s3 : Types::S3? = nil
        )
        end
      end

      # Describes the setup to be used for Apache Kafka broker nodes in the cluster.

      struct BrokerNodeGroupInfo
        include JSON::Serializable

        # The list of subnets to connect to in the client virtual private cloud (VPC). AWS creates elastic
        # network interfaces inside these subnets. Client applications use elastic network interfaces to
        # produce and consume data. Client subnets can't occupy the Availability Zone with ID use use1-az3.

        @[JSON::Field(key: "clientSubnets")]
        getter client_subnets : Array(String)

        # The type of broker used in the Amazon MSK cluster.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The distribution of broker nodes across Availability Zones.

        @[JSON::Field(key: "brokerAZDistribution")]
        getter broker_az_distribution : String?

        # Information about the broker access configuration.

        @[JSON::Field(key: "connectivityInfo")]
        getter connectivity_info : Types::ConnectivityInfo?

        # The AWS security groups to associate with the elastic network interfaces in order to specify who can
        # connect to and communicate with the Amazon MSK cluster. If you don't specify a security group,
        # Amazon MSK uses the default security group associated with the VPC. If you specify security groups
        # that were shared with you, you must ensure that you have permissions to them. Specifically, you need
        # the ec2:DescribeSecurityGroups permission.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # Contains information about storage volumes attached to MSK broker nodes.

        @[JSON::Field(key: "storageInfo")]
        getter storage_info : Types::StorageInfo?

        # The zoneIds for the cluster.

        @[JSON::Field(key: "zoneIds")]
        getter zone_ids : Array(String)?

        def initialize(
          @client_subnets : Array(String),
          @instance_type : String,
          @broker_az_distribution : String? = nil,
          @connectivity_info : Types::ConnectivityInfo? = nil,
          @security_groups : Array(String)? = nil,
          @storage_info : Types::StorageInfo? = nil,
          @zone_ids : Array(String)? = nil
        )
        end
      end

      # BrokerNodeInfo

      struct BrokerNodeInfo
        include JSON::Serializable

        # The attached elastic network interface of the broker.

        @[JSON::Field(key: "attachedENIId")]
        getter attached_eni_id : String?

        # The ID of the broker.

        @[JSON::Field(key: "brokerId")]
        getter broker_id : Float64?

        # The client subnet to which this broker node belongs.

        @[JSON::Field(key: "clientSubnet")]
        getter client_subnet : String?

        # The virtual private cloud (VPC) of the client.

        @[JSON::Field(key: "clientVpcIpAddress")]
        getter client_vpc_ip_address : String?

        # Information about the version of software currently deployed on the Apache Kafka brokers in the
        # cluster.

        @[JSON::Field(key: "currentBrokerSoftwareInfo")]
        getter current_broker_software_info : Types::BrokerSoftwareInfo?

        # Endpoints for accessing the broker.

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(String)?

        def initialize(
          @attached_eni_id : String? = nil,
          @broker_id : Float64? = nil,
          @client_subnet : String? = nil,
          @client_vpc_ip_address : String? = nil,
          @current_broker_software_info : Types::BrokerSoftwareInfo? = nil,
          @endpoints : Array(String)? = nil
        )
        end
      end

      # Information about the current software installed on the cluster.

      struct BrokerSoftwareInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration used for the cluster. This field isn't visible
        # in this preview release.

        @[JSON::Field(key: "configurationArn")]
        getter configuration_arn : String?

        # The revision of the configuration to use. This field isn't visible in this preview release.

        @[JSON::Field(key: "configurationRevision")]
        getter configuration_revision : Int64?

        # The version of Apache Kafka.

        @[JSON::Field(key: "kafkaVersion")]
        getter kafka_version : String?

        def initialize(
          @configuration_arn : String? = nil,
          @configuration_revision : Int64? = nil,
          @kafka_version : String? = nil
        )
        end
      end

      # Includes all client authentication information.

      struct ClientAuthentication
        include JSON::Serializable


        @[JSON::Field(key: "sasl")]
        getter sasl : Types::Sasl?

        # Details for ClientAuthentication using TLS.

        @[JSON::Field(key: "tls")]
        getter tls : Types::Tls?

        # Contains information about unauthenticated traffic to the cluster.

        @[JSON::Field(key: "unauthenticated")]
        getter unauthenticated : Types::Unauthenticated?

        def initialize(
          @sasl : Types::Sasl? = nil,
          @tls : Types::Tls? = nil,
          @unauthenticated : Types::Unauthenticated? = nil
        )
        end
      end

      # The client VPC connection object.

      struct ClientVpcConnection
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the VPC connection.

        @[JSON::Field(key: "vpcConnectionArn")]
        getter vpc_connection_arn : String

        # The VPC connection authentication type.

        @[JSON::Field(key: "authentication")]
        getter authentication : String?

        # The creation time of the VPC connection.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The owner of the VPC connection.

        @[JSON::Field(key: "owner")]
        getter owner : String?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @vpc_connection_arn : String,
          @authentication : String? = nil,
          @creation_time : Time? = nil,
          @owner : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Details of the CloudWatch Logs destination for broker logs.

      struct CloudWatchLogs
        include JSON::Serializable

        # Specifies whether broker logs get sent to the specified CloudWatch Logs destination.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The CloudWatch log group that is the destination for broker logs.

        @[JSON::Field(key: "logGroup")]
        getter log_group : String?

        def initialize(
          @enabled : Bool,
          @log_group : String? = nil
        )
        end
      end

      # Returns information about a cluster of either the provisioned or the serverless type.

      struct Cluster
        include JSON::Serializable


        @[JSON::Field(key: "activeOperationArn")]
        getter active_operation_arn : String?


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?


        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?


        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?


        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?


        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        # Information about the provisioned cluster.

        @[JSON::Field(key: "provisioned")]
        getter provisioned : Types::Provisioned?

        # Information about the serverless cluster.

        @[JSON::Field(key: "serverless")]
        getter serverless : Types::Serverless?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "stateInfo")]
        getter state_info : Types::StateInfo?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @active_operation_arn : String? = nil,
          @cluster_arn : String? = nil,
          @cluster_name : String? = nil,
          @cluster_type : String? = nil,
          @creation_time : Time? = nil,
          @current_version : String? = nil,
          @provisioned : Types::Provisioned? = nil,
          @serverless : Types::Serverless? = nil,
          @state : String? = nil,
          @state_info : Types::StateInfo? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns information about a cluster.

      struct ClusterInfo
        include JSON::Serializable

        # Arn of active cluster operation.

        @[JSON::Field(key: "activeOperationArn")]
        getter active_operation_arn : String?

        # Information about the brokers.

        @[JSON::Field(key: "brokerNodeGroupInfo")]
        getter broker_node_group_info : Types::BrokerNodeGroupInfo?

        # Includes all client authentication information.

        @[JSON::Field(key: "clientAuthentication")]
        getter client_authentication : Types::ClientAuthentication?

        # The Amazon Resource Name (ARN) that uniquely identifies the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The name of the cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The time when the cluster was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Information about the version of software currently deployed on the Apache Kafka brokers in the
        # cluster.

        @[JSON::Field(key: "currentBrokerSoftwareInfo")]
        getter current_broker_software_info : Types::BrokerSoftwareInfo?

        # The current version of the MSK cluster. Cluster versions aren't simple integers. You can obtain the
        # current version by describing the cluster. An example version is KTVPDKIKX0DER.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        # Determines if there is an action required from the customer.

        @[JSON::Field(key: "customerActionStatus")]
        getter customer_action_status : String?

        # Includes all encryption-related information.

        @[JSON::Field(key: "encryptionInfo")]
        getter encryption_info : Types::EncryptionInfo?

        # Specifies which metrics are gathered for the MSK cluster. This property has the following possible
        # values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and PER_TOPIC_PER_PARTITION. For a list of the
        # metrics associated with each of these levels of monitoring, see Monitoring .

        @[JSON::Field(key: "enhancedMonitoring")]
        getter enhanced_monitoring : String?

        # You can configure your MSK cluster to send broker logs to different destination types. This is a
        # container for the configuration details related to broker logs.

        @[JSON::Field(key: "loggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The number of broker nodes in the cluster.

        @[JSON::Field(key: "numberOfBrokerNodes")]
        getter number_of_broker_nodes : Int32?

        # Settings for open monitoring using Prometheus.

        @[JSON::Field(key: "openMonitoring")]
        getter open_monitoring : Types::OpenMonitoring?

        # Contains information about intelligent rebalancing for new MSK Provisioned clusters with Express
        # brokers. By default, intelligent rebalancing status is ACTIVE.

        @[JSON::Field(key: "rebalancing")]
        getter rebalancing : Types::Rebalancing?

        # The state of the cluster. The possible states are ACTIVE, CREATING, DELETING, FAILED, HEALING,
        # MAINTENANCE, REBOOTING_BROKER, and UPDATING.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Contains information about the state of the Amazon MSK cluster.

        @[JSON::Field(key: "stateInfo")]
        getter state_info : Types::StateInfo?

        # This controls storage mode for supported storage tiers.

        @[JSON::Field(key: "storageMode")]
        getter storage_mode : String?

        # Tags attached to the cluster.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The connection string to use to connect to the Apache ZooKeeper cluster.

        @[JSON::Field(key: "zookeeperConnectString")]
        getter zookeeper_connect_string : String?

        # The connection string to use to connect to zookeeper cluster on Tls port.

        @[JSON::Field(key: "zookeeperConnectStringTls")]
        getter zookeeper_connect_string_tls : String?

        def initialize(
          @active_operation_arn : String? = nil,
          @broker_node_group_info : Types::BrokerNodeGroupInfo? = nil,
          @client_authentication : Types::ClientAuthentication? = nil,
          @cluster_arn : String? = nil,
          @cluster_name : String? = nil,
          @creation_time : Time? = nil,
          @current_broker_software_info : Types::BrokerSoftwareInfo? = nil,
          @current_version : String? = nil,
          @customer_action_status : String? = nil,
          @encryption_info : Types::EncryptionInfo? = nil,
          @enhanced_monitoring : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @number_of_broker_nodes : Int32? = nil,
          @open_monitoring : Types::OpenMonitoring? = nil,
          @rebalancing : Types::Rebalancing? = nil,
          @state : String? = nil,
          @state_info : Types::StateInfo? = nil,
          @storage_mode : String? = nil,
          @tags : Hash(String, String)? = nil,
          @zookeeper_connect_string : String? = nil,
          @zookeeper_connect_string_tls : String? = nil
        )
        end
      end

      # Returns information about a cluster operation.

      struct ClusterOperationInfo
        include JSON::Serializable

        # The ID of the API request that triggered this operation.

        @[JSON::Field(key: "clientRequestId")]
        getter client_request_id : String?

        # ARN of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The time at which operation was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time at which the operation finished.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Describes the error if the operation fails.

        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::ErrorInfo?

        # ARN of the cluster operation.

        @[JSON::Field(key: "operationArn")]
        getter operation_arn : String?

        # State of the cluster operation.

        @[JSON::Field(key: "operationState")]
        getter operation_state : String?

        # Steps completed during the operation.

        @[JSON::Field(key: "operationSteps")]
        getter operation_steps : Array(Types::ClusterOperationStep)?

        # Type of the cluster operation.

        @[JSON::Field(key: "operationType")]
        getter operation_type : String?

        # Information about cluster attributes before a cluster is updated.

        @[JSON::Field(key: "sourceClusterInfo")]
        getter source_cluster_info : Types::MutableClusterInfo?

        # Information about cluster attributes after a cluster is updated.

        @[JSON::Field(key: "targetClusterInfo")]
        getter target_cluster_info : Types::MutableClusterInfo?

        # Description of the VPC connection for CreateVpcConnection and DeleteVpcConnection operations.

        @[JSON::Field(key: "vpcConnectionInfo")]
        getter vpc_connection_info : Types::VpcConnectionInfo?

        def initialize(
          @client_request_id : String? = nil,
          @cluster_arn : String? = nil,
          @creation_time : Time? = nil,
          @end_time : Time? = nil,
          @error_info : Types::ErrorInfo? = nil,
          @operation_arn : String? = nil,
          @operation_state : String? = nil,
          @operation_steps : Array(Types::ClusterOperationStep)? = nil,
          @operation_type : String? = nil,
          @source_cluster_info : Types::MutableClusterInfo? = nil,
          @target_cluster_info : Types::MutableClusterInfo? = nil,
          @vpc_connection_info : Types::VpcConnectionInfo? = nil
        )
        end
      end

      # Step taken during a cluster operation.

      struct ClusterOperationStep
        include JSON::Serializable

        # Information about the step and its status.

        @[JSON::Field(key: "stepInfo")]
        getter step_info : Types::ClusterOperationStepInfo?

        # The name of the step.

        @[JSON::Field(key: "stepName")]
        getter step_name : String?

        def initialize(
          @step_info : Types::ClusterOperationStepInfo? = nil,
          @step_name : String? = nil
        )
        end
      end

      # State information about the operation step.

      struct ClusterOperationStepInfo
        include JSON::Serializable

        # The steps current status.

        @[JSON::Field(key: "stepStatus")]
        getter step_status : String?

        def initialize(
          @step_status : String? = nil
        )
        end
      end

      # Returns information about a cluster operation.

      struct ClusterOperationV2
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?


        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?


        @[JSON::Field(key: "endTime")]
        getter end_time : Time?


        @[JSON::Field(key: "operationArn")]
        getter operation_arn : String?


        @[JSON::Field(key: "operationState")]
        getter operation_state : String?


        @[JSON::Field(key: "operationType")]
        getter operation_type : String?

        # Properties of a provisioned cluster.

        @[JSON::Field(key: "provisioned")]
        getter provisioned : Types::ClusterOperationV2Provisioned?

        # Properties of a serverless cluster.

        @[JSON::Field(key: "serverless")]
        getter serverless : Types::ClusterOperationV2Serverless?


        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_type : String? = nil,
          @end_time : Time? = nil,
          @operation_arn : String? = nil,
          @operation_state : String? = nil,
          @operation_type : String? = nil,
          @provisioned : Types::ClusterOperationV2Provisioned? = nil,
          @serverless : Types::ClusterOperationV2Serverless? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Returns information about a provisioned cluster operation.

      struct ClusterOperationV2Provisioned
        include JSON::Serializable


        @[JSON::Field(key: "operationSteps")]
        getter operation_steps : Array(Types::ClusterOperationStep)?


        @[JSON::Field(key: "sourceClusterInfo")]
        getter source_cluster_info : Types::MutableClusterInfo?


        @[JSON::Field(key: "targetClusterInfo")]
        getter target_cluster_info : Types::MutableClusterInfo?


        @[JSON::Field(key: "vpcConnectionInfo")]
        getter vpc_connection_info : Types::VpcConnectionInfo?

        def initialize(
          @operation_steps : Array(Types::ClusterOperationStep)? = nil,
          @source_cluster_info : Types::MutableClusterInfo? = nil,
          @target_cluster_info : Types::MutableClusterInfo? = nil,
          @vpc_connection_info : Types::VpcConnectionInfo? = nil
        )
        end
      end

      # Returns information about a serverless cluster operation.

      struct ClusterOperationV2Serverless
        include JSON::Serializable

        # Description of the VPC connection for CreateVpcConnection and DeleteVpcConnection operations.

        @[JSON::Field(key: "vpcConnectionInfo")]
        getter vpc_connection_info : Types::VpcConnectionInfoServerless?

        def initialize(
          @vpc_connection_info : Types::VpcConnectionInfoServerless? = nil
        )
        end
      end

      # Returns information about a cluster operation.

      struct ClusterOperationV2Summary
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?


        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?


        @[JSON::Field(key: "endTime")]
        getter end_time : Time?


        @[JSON::Field(key: "operationArn")]
        getter operation_arn : String?


        @[JSON::Field(key: "operationState")]
        getter operation_state : String?


        @[JSON::Field(key: "operationType")]
        getter operation_type : String?


        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_type : String? = nil,
          @end_time : Time? = nil,
          @operation_arn : String? = nil,
          @operation_state : String? = nil,
          @operation_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Contains source Apache Kafka versions and compatible target Apache Kafka versions.

      struct CompatibleKafkaVersion
        include JSON::Serializable


        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?


        @[JSON::Field(key: "targetVersions")]
        getter target_versions : Array(String)?

        def initialize(
          @source_version : String? = nil,
          @target_versions : Array(String)? = nil
        )
        end
      end

      # Represents an MSK Configuration.

      struct Configuration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the configuration was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The description of the configuration.

        @[JSON::Field(key: "description")]
        getter description : String

        # An array of the versions of Apache Kafka with which you can use this MSK configuration. You can use
        # this configuration for an MSK cluster only if the Apache Kafka version specified for the cluster
        # appears in this array.

        @[JSON::Field(key: "kafkaVersions")]
        getter kafka_versions : Array(String)

        # Latest revision of the configuration.

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision

        # The name of the configuration. Configuration names are strings that match the regex
        # "^[0-9A-Za-z-]+$".

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @arn : String,
          @creation_time : Time,
          @description : String,
          @kafka_versions : Array(String),
          @latest_revision : Types::ConfigurationRevision,
          @name : String,
          @state : String
        )
        end
      end

      # Specifies the configuration to use for the brokers.

      struct ConfigurationInfo
        include JSON::Serializable

        # ARN of the configuration to use.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The revision of the configuration to use.

        @[JSON::Field(key: "revision")]
        getter revision : Int64

        def initialize(
          @arn : String,
          @revision : Int64
        )
        end
      end

      # Describes a configuration revision.

      struct ConfigurationRevision
        include JSON::Serializable

        # The time when the configuration revision was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The revision number.

        @[JSON::Field(key: "revision")]
        getter revision : Int64

        # The description of the configuration revision.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @creation_time : Time,
          @revision : Int64,
          @description : String? = nil
        )
        end
      end

      # Returns information about an error.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "invalidParameter")]
        getter invalid_parameter : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_parameter : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Information about the broker access configuration.

      struct ConnectivityInfo
        include JSON::Serializable

        # Public access control for brokers.

        @[JSON::Field(key: "publicAccess")]
        getter public_access : Types::PublicAccess?

        # VpcConnectivity control for brokers.

        @[JSON::Field(key: "vpcConnectivity")]
        getter vpc_connectivity : Types::VpcConnectivity?

        def initialize(
          @public_access : Types::PublicAccess? = nil,
          @vpc_connectivity : Types::VpcConnectivity? = nil
        )
        end
      end

      # Details about consumer group replication.

      struct ConsumerGroupReplication
        include JSON::Serializable

        # List of regular expression patterns indicating the consumer groups to copy.

        @[JSON::Field(key: "consumerGroupsToReplicate")]
        getter consumer_groups_to_replicate : Array(String)

        # List of regular expression patterns indicating the consumer groups that should not be replicated.

        @[JSON::Field(key: "consumerGroupsToExclude")]
        getter consumer_groups_to_exclude : Array(String)?

        # Enables synchronization of consumer groups to target cluster.

        @[JSON::Field(key: "detectAndCopyNewConsumerGroups")]
        getter detect_and_copy_new_consumer_groups : Bool?

        # Enables synchronization of consumer group offsets to target cluster. The translated offsets will be
        # written to topic __consumer_offsets.

        @[JSON::Field(key: "synchroniseConsumerGroupOffsets")]
        getter synchronise_consumer_group_offsets : Bool?

        def initialize(
          @consumer_groups_to_replicate : Array(String),
          @consumer_groups_to_exclude : Array(String)? = nil,
          @detect_and_copy_new_consumer_groups : Bool? = nil,
          @synchronise_consumer_group_offsets : Bool? = nil
        )
        end
      end

      # Details about consumer group replication.

      struct ConsumerGroupReplicationUpdate
        include JSON::Serializable

        # List of regular expression patterns indicating the consumer groups that should not be replicated.

        @[JSON::Field(key: "consumerGroupsToExclude")]
        getter consumer_groups_to_exclude : Array(String)

        # List of regular expression patterns indicating the consumer groups to copy.

        @[JSON::Field(key: "consumerGroupsToReplicate")]
        getter consumer_groups_to_replicate : Array(String)

        # Enables synchronization of consumer groups to target cluster.

        @[JSON::Field(key: "detectAndCopyNewConsumerGroups")]
        getter detect_and_copy_new_consumer_groups : Bool

        # Enables synchronization of consumer group offsets to target cluster. The translated offsets will be
        # written to topic __consumer_offsets.

        @[JSON::Field(key: "synchroniseConsumerGroupOffsets")]
        getter synchronise_consumer_group_offsets : Bool

        def initialize(
          @consumer_groups_to_exclude : Array(String),
          @consumer_groups_to_replicate : Array(String),
          @detect_and_copy_new_consumer_groups : Bool,
          @synchronise_consumer_group_offsets : Bool
        )
        end
      end

      # Controller node information.

      struct ControllerNodeInfo
        include JSON::Serializable

        # Endpoints for accessing the Controller.

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(String)?

        def initialize(
          @endpoints : Array(String)? = nil
        )
        end
      end

      # Creates a cluster.

      struct CreateClusterRequest
        include JSON::Serializable

        # Information about the brokers.

        @[JSON::Field(key: "brokerNodeGroupInfo")]
        getter broker_node_group_info : Types::BrokerNodeGroupInfo

        # The name of the cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # The version of Apache Kafka.

        @[JSON::Field(key: "kafkaVersion")]
        getter kafka_version : String

        # The number of Apache Kafka broker nodes in the Amazon MSK cluster.

        @[JSON::Field(key: "numberOfBrokerNodes")]
        getter number_of_broker_nodes : Int32

        # Includes all client authentication related information.

        @[JSON::Field(key: "clientAuthentication")]
        getter client_authentication : Types::ClientAuthentication?

        # Represents the configuration that you want MSK to use for the cluster.

        @[JSON::Field(key: "configurationInfo")]
        getter configuration_info : Types::ConfigurationInfo?

        # Includes all encryption-related information.

        @[JSON::Field(key: "encryptionInfo")]
        getter encryption_info : Types::EncryptionInfo?

        # Specifies the level of monitoring for the MSK cluster. The possible values are DEFAULT, PER_BROKER,
        # PER_TOPIC_PER_BROKER, and PER_TOPIC_PER_PARTITION.

        @[JSON::Field(key: "enhancedMonitoring")]
        getter enhanced_monitoring : String?

        # LoggingInfo details.

        @[JSON::Field(key: "loggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The settings for open monitoring.

        @[JSON::Field(key: "openMonitoring")]
        getter open_monitoring : Types::OpenMonitoringInfo?

        # Specifies if intelligent rebalancing should be turned on for the new MSK Provisioned cluster with
        # Express brokers. By default, intelligent rebalancing status is ACTIVE for all new clusters.

        @[JSON::Field(key: "rebalancing")]
        getter rebalancing : Types::Rebalancing?

        # This controls storage mode for supported storage tiers.

        @[JSON::Field(key: "storageMode")]
        getter storage_mode : String?

        # Create tags when creating the cluster.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @broker_node_group_info : Types::BrokerNodeGroupInfo,
          @cluster_name : String,
          @kafka_version : String,
          @number_of_broker_nodes : Int32,
          @client_authentication : Types::ClientAuthentication? = nil,
          @configuration_info : Types::ConfigurationInfo? = nil,
          @encryption_info : Types::EncryptionInfo? = nil,
          @enhanced_monitoring : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @open_monitoring : Types::OpenMonitoringInfo? = nil,
          @rebalancing : Types::Rebalancing? = nil,
          @storage_mode : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns information about the created cluster.

      struct CreateClusterResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The name of the MSK cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The state of the cluster. The possible states are ACTIVE, CREATING, DELETING, FAILED, HEALING,
        # MAINTENANCE, REBOOTING_BROKER, and UPDATING.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_name : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Creates a new Amazon MSK cluster of either the provisioned or the serverless type.

      struct CreateClusterV2Request
        include JSON::Serializable


        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # Creates a provisioned cluster.

        @[JSON::Field(key: "provisioned")]
        getter provisioned : Types::ProvisionedRequest?

        # Creates a serverless cluster.

        @[JSON::Field(key: "serverless")]
        getter serverless : Types::ServerlessRequest?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_name : String,
          @provisioned : Types::ProvisionedRequest? = nil,
          @serverless : Types::ServerlessRequest? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns information about the created cluster of either the provisioned or the serverless type.

      struct CreateClusterV2Response
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?


        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?


        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The state of the cluster. The possible states are ACTIVE, CREATING, DELETING, FAILED, HEALING,
        # MAINTENANCE, REBOOTING_BROKER, and UPDATING.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_name : String? = nil,
          @cluster_type : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Request body for CreateConfiguration.

      struct CreateConfigurationRequest
        include JSON::Serializable

        # The name of the configuration. Configuration names are strings that match the regex
        # "^[0-9A-Za-z-]+$".

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "serverProperties")]
        getter server_properties : Bytes

        # The description of the configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The versions of Apache Kafka with which you can use this MSK configuration.

        @[JSON::Field(key: "kafkaVersions")]
        getter kafka_versions : Array(String)?

        def initialize(
          @name : String,
          @server_properties : Bytes,
          @description : String? = nil,
          @kafka_versions : Array(String)? = nil
        )
        end
      end

      # Response body for CreateConfiguration

      struct CreateConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time when the configuration was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Latest revision of the configuration.

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision?

        # The name of the configuration. Configuration names are strings that match the regex
        # "^[0-9A-Za-z-]+$".

        @[JSON::Field(key: "name")]
        getter name : String?

        # The state of the configuration. The possible states are ACTIVE, DELETING and DELETE_FAILED.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @latest_revision : Types::ConfigurationRevision? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Request body for replicator.

      struct CreateReplicatorRequest
        include JSON::Serializable

        # Kafka Clusters to use in setting up sources / targets for replication.

        @[JSON::Field(key: "kafkaClusters")]
        getter kafka_clusters : Array(Types::KafkaCluster)

        # A list of replication configurations, where each configuration targets a given source cluster to
        # target cluster replication flow.

        @[JSON::Field(key: "replicationInfoList")]
        getter replication_info_list : Array(Types::ReplicationInfo)

        # The name of the replicator. Alpha-numeric characters with '-' are allowed.

        @[JSON::Field(key: "replicatorName")]
        getter replicator_name : String

        # The ARN of the IAM role used by the replicator to access resources in the customer's account (e.g
        # source and target clusters)

        @[JSON::Field(key: "serviceExecutionRoleArn")]
        getter service_execution_role_arn : String

        # A summary description of the replicator.

        @[JSON::Field(key: "description")]
        getter description : String?

        # List of tags to attach to created Replicator.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @kafka_clusters : Array(Types::KafkaCluster),
          @replication_info_list : Array(Types::ReplicationInfo),
          @replicator_name : String,
          @service_execution_role_arn : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns information about the created replicator.

      struct CreateReplicatorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replicator.

        @[JSON::Field(key: "replicatorArn")]
        getter replicator_arn : String?

        # Name of the replicator provided by the customer.

        @[JSON::Field(key: "replicatorName")]
        getter replicator_name : String?

        # State of the replicator.

        @[JSON::Field(key: "replicatorState")]
        getter replicator_state : String?

        def initialize(
          @replicator_arn : String? = nil,
          @replicator_name : String? = nil,
          @replicator_state : String? = nil
        )
        end
      end

      # Request body for CreateVpcConnection.

      struct CreateVpcConnectionRequest
        include JSON::Serializable


        @[JSON::Field(key: "authentication")]
        getter authentication : String

        # The list of subnets in the client VPC.

        @[JSON::Field(key: "clientSubnets")]
        getter client_subnets : Array(String)

        # The list of security groups to attach to the VPC connection.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "targetClusterArn")]
        getter target_cluster_arn : String

        # The VPC ID of the VPC connection.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # Create tags when creating the VPC connection.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authentication : String,
          @client_subnets : Array(String),
          @security_groups : Array(String),
          @target_cluster_arn : String,
          @vpc_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Response body for CreateVpcConnection

      struct CreateVpcConnectionResponse
        include JSON::Serializable

        # The authentication type for the VPC connection.

        @[JSON::Field(key: "authentication")]
        getter authentication : String?

        # The list of subnets in the client VPC.

        @[JSON::Field(key: "clientSubnets")]
        getter client_subnets : Array(String)?

        # The time when the VPC connection was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The list of security groups attached to the VPC connection.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The state of the VPC connection. The only possible state is CREATING.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Tags attached to the VPC connection.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the VPC connection.

        @[JSON::Field(key: "vpcConnectionArn")]
        getter vpc_connection_arn : String?

        # The VPC ID of the VPC connection.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @authentication : String? = nil,
          @client_subnets : Array(String)? = nil,
          @creation_time : Time? = nil,
          @security_groups : Array(String)? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_connection_arn : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Request body for DeleteClusterPolicy.

      struct DeleteClusterPolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end

      # Response body for DeleteClusterPolicy.

      struct DeleteClusterPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteClusterRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String


        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        def initialize(
          @cluster_arn : String,
          @current_version : String? = nil
        )
        end
      end

      # Returns information about the deleted cluster.

      struct DeleteClusterResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The state of the cluster. The possible states are ACTIVE, CREATING, DELETING, FAILED, HEALING,
        # MAINTENANCE, REBOOTING_BROKER, and UPDATING.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @cluster_arn : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Request body for DeleteConfiguration.

      struct DeleteConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Response body for DeleteConfiguration.

      struct DeleteConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The state of the configuration. The possible states are ACTIVE, DELETING and DELETE_FAILED.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeleteReplicatorRequest
        include JSON::Serializable


        @[JSON::Field(key: "replicatorArn")]
        getter replicator_arn : String


        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        def initialize(
          @replicator_arn : String,
          @current_version : String? = nil
        )
        end
      end

      # Returns information about the deleted replicator.

      struct DeleteReplicatorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replicator.

        @[JSON::Field(key: "replicatorArn")]
        getter replicator_arn : String?

        # The state of the replicator.

        @[JSON::Field(key: "replicatorState")]
        getter replicator_state : String?

        def initialize(
          @replicator_arn : String? = nil,
          @replicator_state : String? = nil
        )
        end
      end

      # Request body for DeleteVpcConnection.

      struct DeleteVpcConnectionRequest
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Response body for DeleteVpcConnection.

      struct DeleteVpcConnectionResponse
        include JSON::Serializable

        # The state of the VPC connection. The only possible state is DELETING.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The Amazon Resource Name (ARN) of the VPC connection.

        @[JSON::Field(key: "vpcConnectionArn")]
        getter vpc_connection_arn : String?

        def initialize(
          @state : String? = nil,
          @vpc_connection_arn : String? = nil
        )
        end
      end


      struct DescribeClusterOperationRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String

        def initialize(
          @cluster_operation_arn : String
        )
        end
      end

      # Information about a cluster operation.

      struct DescribeClusterOperationResponse
        include JSON::Serializable

        # Cluster operation information

        @[JSON::Field(key: "clusterOperationInfo")]
        getter cluster_operation_info : Types::ClusterOperationInfo?

        def initialize(
          @cluster_operation_info : Types::ClusterOperationInfo? = nil
        )
        end
      end


      struct DescribeClusterOperationV2Request
        include JSON::Serializable


        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String

        def initialize(
          @cluster_operation_arn : String
        )
        end
      end

      # Information about a cluster operation.

      struct DescribeClusterOperationV2Response
        include JSON::Serializable

        # Cluster operation information

        @[JSON::Field(key: "clusterOperationInfo")]
        getter cluster_operation_info : Types::ClusterOperationV2?

        def initialize(
          @cluster_operation_info : Types::ClusterOperationV2? = nil
        )
        end
      end


      struct DescribeClusterRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end

      # Returns information about a cluster.

      struct DescribeClusterResponse
        include JSON::Serializable

        # The cluster information.

        @[JSON::Field(key: "clusterInfo")]
        getter cluster_info : Types::ClusterInfo?

        def initialize(
          @cluster_info : Types::ClusterInfo? = nil
        )
        end
      end


      struct DescribeClusterV2Request
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end

      # Returns information about a cluster of either the provisioned or the serverless type.

      struct DescribeClusterV2Response
        include JSON::Serializable

        # The cluster information.

        @[JSON::Field(key: "clusterInfo")]
        getter cluster_info : Types::Cluster?

        def initialize(
          @cluster_info : Types::Cluster? = nil
        )
        end
      end


      struct DescribeConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Response body for DescribeConfiguration.

      struct DescribeConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time when the configuration was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The versions of Apache Kafka with which you can use this MSK configuration.

        @[JSON::Field(key: "kafkaVersions")]
        getter kafka_versions : Array(String)?

        # Latest revision of the configuration.

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision?

        # The name of the configuration. Configuration names are strings that match the regex
        # "^[0-9A-Za-z-]+$".

        @[JSON::Field(key: "name")]
        getter name : String?

        # The state of the configuration. The possible states are ACTIVE, DELETING and DELETE_FAILED.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @kafka_versions : Array(String)? = nil,
          @latest_revision : Types::ConfigurationRevision? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DescribeConfigurationRevisionRequest
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "revision")]
        getter revision : Int64

        def initialize(
          @arn : String,
          @revision : Int64
        )
        end
      end

      # Response body for DescribeConfigurationRevision.

      struct DescribeConfigurationRevisionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time when the configuration was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The revision number.

        @[JSON::Field(key: "revision")]
        getter revision : Int64?


        @[JSON::Field(key: "serverProperties")]
        getter server_properties : Bytes?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @revision : Int64? = nil,
          @server_properties : Bytes? = nil
        )
        end
      end


      struct DescribeReplicatorRequest
        include JSON::Serializable


        @[JSON::Field(key: "replicatorArn")]
        getter replicator_arn : String

        def initialize(
          @replicator_arn : String
        )
        end
      end

      # Response body for DescribeReplicator.

      struct DescribeReplicatorResponse
        include JSON::Serializable

        # The time when the replicator was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The current version number of the replicator.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        # Whether this resource is a replicator reference.

        @[JSON::Field(key: "isReplicatorReference")]
        getter is_replicator_reference : Bool?

        # Kafka Clusters used in setting up sources / targets for replication.

        @[JSON::Field(key: "kafkaClusters")]
        getter kafka_clusters : Array(Types::KafkaClusterDescription)?

        # A list of replication configurations, where each configuration targets a given source cluster to
        # target cluster replication flow.

        @[JSON::Field(key: "replicationInfoList")]
        getter replication_info_list : Array(Types::ReplicationInfoDescription)?

        # The Amazon Resource Name (ARN) of the replicator.

        @[JSON::Field(key: "replicatorArn")]
        getter replicator_arn : String?

        # The description of the replicator.

        @[JSON::Field(key: "replicatorDescription")]
        getter replicator_description : String?

        # The name of the replicator.

        @[JSON::Field(key: "replicatorName")]
        getter replicator_name : String?

        # The Amazon Resource Name (ARN) of the replicator resource in the region where the replicator was
        # created.

        @[JSON::Field(key: "replicatorResourceArn")]
        getter replicator_resource_arn : String?

        # State of the replicator.

        @[JSON::Field(key: "replicatorState")]
        getter replicator_state : String?

        # The Amazon Resource Name (ARN) of the IAM role used by the replicator to access resources in the
        # customer's account (e.g source and target clusters)

        @[JSON::Field(key: "serviceExecutionRoleArn")]
        getter service_execution_role_arn : String?

        # Details about the state of the replicator.

        @[JSON::Field(key: "stateInfo")]
        getter state_info : Types::ReplicationStateInfo?

        # List of tags attached to the Replicator.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_time : Time? = nil,
          @current_version : String? = nil,
          @is_replicator_reference : Bool? = nil,
          @kafka_clusters : Array(Types::KafkaClusterDescription)? = nil,
          @replication_info_list : Array(Types::ReplicationInfoDescription)? = nil,
          @replicator_arn : String? = nil,
          @replicator_description : String? = nil,
          @replicator_name : String? = nil,
          @replicator_resource_arn : String? = nil,
          @replicator_state : String? = nil,
          @service_execution_role_arn : String? = nil,
          @state_info : Types::ReplicationStateInfo? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Request body for DescribeTopicPartitions.

      struct DescribeTopicPartitionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String


        @[JSON::Field(key: "topicName")]
        getter topic_name : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_arn : String,
          @topic_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response containing partitions details for a topic.

      struct DescribeTopicPartitionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "partitions")]
        getter partitions : Array(Types::TopicPartitionInfo)?

        def initialize(
          @next_token : String? = nil,
          @partitions : Array(Types::TopicPartitionInfo)? = nil
        )
        end
      end

      # Request body for DescribeTopic.

      struct DescribeTopicRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String


        @[JSON::Field(key: "topicName")]
        getter topic_name : String

        def initialize(
          @cluster_arn : String,
          @topic_name : String
        )
        end
      end

      # The response containing details for a topic.

      struct DescribeTopicResponse
        include JSON::Serializable


        @[JSON::Field(key: "configs")]
        getter configs : String?


        @[JSON::Field(key: "partitionCount")]
        getter partition_count : Int32?


        @[JSON::Field(key: "replicationFactor")]
        getter replication_factor : Int32?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "topicArn")]
        getter topic_arn : String?


        @[JSON::Field(key: "topicName")]
        getter topic_name : String?

        def initialize(
          @configs : String? = nil,
          @partition_count : Int32? = nil,
          @replication_factor : Int32? = nil,
          @status : String? = nil,
          @topic_arn : String? = nil,
          @topic_name : String? = nil
        )
        end
      end


      struct DescribeVpcConnectionRequest
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Response body for DescribeVpcConnection.

      struct DescribeVpcConnectionResponse
        include JSON::Serializable

        # The authentication type of the VPC connection.

        @[JSON::Field(key: "authentication")]
        getter authentication : String?

        # The creation time of the VPC connection.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The list of security groups attached to the VPC connection.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The state of the VPC connection. The possible states are AVAILABLE, INACTIVE, DEACTIVATING,
        # DELETING, CREATING, REJECTING, REJECTED and FAILED.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The list of subnets in the client VPC.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        # Tags attached to the VPC connection.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "targetClusterArn")]
        getter target_cluster_arn : String?

        # The Amazon Resource Name (ARN) of the VPC connection.

        @[JSON::Field(key: "vpcConnectionArn")]
        getter vpc_connection_arn : String?

        # The VPC ID of the VPC connection.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @authentication : String? = nil,
          @creation_time : Time? = nil,
          @security_groups : Array(String)? = nil,
          @state : String? = nil,
          @subnets : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @target_cluster_arn : String? = nil,
          @vpc_connection_arn : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Contains information about the EBS storage volumes attached to Apache Kafka broker nodes.

      struct EBSStorageInfo
        include JSON::Serializable

        # EBS volume provisioned throughput information.

        @[JSON::Field(key: "provisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        # The size in GiB of the EBS volume for the data drive on each broker node.

        @[JSON::Field(key: "volumeSize")]
        getter volume_size : Int32?

        def initialize(
          @provisioned_throughput : Types::ProvisionedThroughput? = nil,
          @volume_size : Int32? = nil
        )
        end
      end

      # The data-volume encryption details.

      struct EncryptionAtRest
        include JSON::Serializable

        # The ARN of the AWS KMS key for encrypting data at rest. If you don't specify a KMS key, MSK creates
        # one for you and uses it.

        @[JSON::Field(key: "dataVolumeKMSKeyId")]
        getter data_volume_kms_key_id : String

        def initialize(
          @data_volume_kms_key_id : String
        )
        end
      end

      # The settings for encrypting data in transit.

      struct EncryptionInTransit
        include JSON::Serializable

        # Indicates the encryption setting for data in transit between clients and brokers. You must set it to
        # one of the following values. TLS means that client-broker communication is enabled with TLS only.
        # TLS_PLAINTEXT means that client-broker communication is enabled for both TLS-encrypted, as well as
        # plaintext data. PLAINTEXT means that client-broker communication is enabled in plaintext only. The
        # default value is TLS.

        @[JSON::Field(key: "clientBroker")]
        getter client_broker : String?

        # When set to true, it indicates that data communication among the broker nodes of the cluster is
        # encrypted. When set to false, the communication happens in plaintext. The default value is true.

        @[JSON::Field(key: "inCluster")]
        getter in_cluster : Bool?

        def initialize(
          @client_broker : String? = nil,
          @in_cluster : Bool? = nil
        )
        end
      end

      # Includes encryption-related information, such as the AWS KMS key used for encrypting data at rest
      # and whether you want MSK to encrypt your data in transit.

      struct EncryptionInfo
        include JSON::Serializable

        # The data-volume encryption details.

        @[JSON::Field(key: "encryptionAtRest")]
        getter encryption_at_rest : Types::EncryptionAtRest?

        # The details for encryption in transit.

        @[JSON::Field(key: "encryptionInTransit")]
        getter encryption_in_transit : Types::EncryptionInTransit?

        def initialize(
          @encryption_at_rest : Types::EncryptionAtRest? = nil,
          @encryption_in_transit : Types::EncryptionInTransit? = nil
        )
        end
      end

      # Returns information about an error.

      struct Error
        include JSON::Serializable

        # The parameter that caused the error.

        @[JSON::Field(key: "invalidParameter")]
        getter invalid_parameter : String?

        # The description of the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_parameter : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Returns information about an error state of the cluster.

      struct ErrorInfo
        include JSON::Serializable

        # A number describing the error programmatically.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # An optional field to provide more details about the error.

        @[JSON::Field(key: "errorString")]
        getter error_string : String?

        def initialize(
          @error_code : String? = nil,
          @error_string : String? = nil
        )
        end
      end

      # Firehose details for BrokerLogs.

      struct Firehose
        include JSON::Serializable

        # Specifies whether broker logs get sent to the specified Kinesis Data Firehose delivery stream.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The Kinesis Data Firehose delivery stream that is the destination for broker logs.

        @[JSON::Field(key: "deliveryStream")]
        getter delivery_stream : String?

        def initialize(
          @enabled : Bool,
          @delivery_stream : String? = nil
        )
        end
      end

      # Returns information about an error.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "invalidParameter")]
        getter invalid_parameter : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_parameter : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct GetBootstrapBrokersRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end

      # Returns a string containing one or more hostname:port pairs.

      struct GetBootstrapBrokersResponse
        include JSON::Serializable

        # A string containing one or more hostname:port pairs.

        @[JSON::Field(key: "bootstrapBrokerString")]
        getter bootstrap_broker_string : String?

        # A string that contains one or more DNS names (or IP addresses) and SASL IAM port pairs. The
        # following is an example. { "BootstrapBrokerStringSaslIam":
        # "b-3.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9198,b-1.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9198,b-2.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9198"
        # }

        @[JSON::Field(key: "bootstrapBrokerStringPublicSaslIam")]
        getter bootstrap_broker_string_public_sasl_iam : String?

        # A string containing one or more DNS names (or IP addresses) and SASL SCRAM port pairs. The following
        # is an example. { "BootstrapBrokerStringSaslScram":
        # "b-3.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9196,b-1.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9196,b-2.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9196"
        # }

        @[JSON::Field(key: "bootstrapBrokerStringPublicSaslScram")]
        getter bootstrap_broker_string_public_sasl_scram : String?

        # A string containing one or more DNS names (or IP addresses) and TLS port pairs. The following is an
        # example. { "BootstrapBrokerStringTls":
        # "b-3.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9194,b-1.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9194,b-2.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9194"
        # }

        @[JSON::Field(key: "bootstrapBrokerStringPublicTls")]
        getter bootstrap_broker_string_public_tls : String?

        # A string that contains one or more DNS names (or IP addresses) and SASL IAM port pairs. The
        # following is an example. { "BootstrapBrokerStringSaslIam":
        # "b-3.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9098,b-1.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9098,b-2.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9098"
        # }

        @[JSON::Field(key: "bootstrapBrokerStringSaslIam")]
        getter bootstrap_broker_string_sasl_iam : String?

        # A string containing one or more DNS names (or IP addresses) and SASL SCRAM port pairs. The following
        # is an example. { "BootstrapBrokerStringSaslScram":
        # "b-3.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9096,b-1.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9096,b-2.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9096"
        # }

        @[JSON::Field(key: "bootstrapBrokerStringSaslScram")]
        getter bootstrap_broker_string_sasl_scram : String?

        # A string containing one or more DNS names (or IP addresses) and TLS port pairs. The following is an
        # example. { "BootstrapBrokerStringTls":
        # "b-3.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9094,b-1.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9094,b-2.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9094"
        # }

        @[JSON::Field(key: "bootstrapBrokerStringTls")]
        getter bootstrap_broker_string_tls : String?

        # A string containing one or more dns name (or IP) and SASL IAM port pairs for VPC connectivity.

        @[JSON::Field(key: "bootstrapBrokerStringVpcConnectivitySaslIam")]
        getter bootstrap_broker_string_vpc_connectivity_sasl_iam : String?

        # A string containing one or more dns name (or IP) and SASL SCRAM port pairs for VPC connectivity.

        @[JSON::Field(key: "bootstrapBrokerStringVpcConnectivitySaslScram")]
        getter bootstrap_broker_string_vpc_connectivity_sasl_scram : String?

        # A string containing one or more dns name (or IP) and Tls port pairs for VPC connectivity.

        @[JSON::Field(key: "bootstrapBrokerStringVpcConnectivityTls")]
        getter bootstrap_broker_string_vpc_connectivity_tls : String?

        def initialize(
          @bootstrap_broker_string : String? = nil,
          @bootstrap_broker_string_public_sasl_iam : String? = nil,
          @bootstrap_broker_string_public_sasl_scram : String? = nil,
          @bootstrap_broker_string_public_tls : String? = nil,
          @bootstrap_broker_string_sasl_iam : String? = nil,
          @bootstrap_broker_string_sasl_scram : String? = nil,
          @bootstrap_broker_string_tls : String? = nil,
          @bootstrap_broker_string_vpc_connectivity_sasl_iam : String? = nil,
          @bootstrap_broker_string_vpc_connectivity_sasl_scram : String? = nil,
          @bootstrap_broker_string_vpc_connectivity_tls : String? = nil
        )
        end
      end

      # Request body for GetClusterPolicy.

      struct GetClusterPolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end

      # Returns information about the specified cluster policy.

      struct GetClusterPolicyResponse
        include JSON::Serializable

        # Cluster policy version.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        # Cluster policy attached to the MSK cluster.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @current_version : String? = nil,
          @policy : String? = nil
        )
        end
      end


      struct GetCompatibleKafkaVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        def initialize(
          @cluster_arn : String? = nil
        )
        end
      end

      # Response body for GetCompatibleKafkaVersions.

      struct GetCompatibleKafkaVersionsResponse
        include JSON::Serializable

        # A list of CompatibleKafkaVersion objects.

        @[JSON::Field(key: "compatibleKafkaVersions")]
        getter compatible_kafka_versions : Array(Types::CompatibleKafkaVersion)?

        def initialize(
          @compatible_kafka_versions : Array(Types::CompatibleKafkaVersion)? = nil
        )
        end
      end


      struct Iam
        include JSON::Serializable


        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Returns information about an error.

      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "invalidParameter")]
        getter invalid_parameter : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_parameter : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Indicates whether you want to enable or disable the JMX Exporter.

      struct JmxExporter
        include JSON::Serializable

        # Indicates whether you want to enable or disable the JMX Exporter.

        @[JSON::Field(key: "enabledInBroker")]
        getter enabled_in_broker : Bool

        def initialize(
          @enabled_in_broker : Bool
        )
        end
      end

      # Indicates whether you want to enable or disable the JMX Exporter.

      struct JmxExporterInfo
        include JSON::Serializable

        # JMX Exporter being enabled in broker.

        @[JSON::Field(key: "enabledInBroker")]
        getter enabled_in_broker : Bool

        def initialize(
          @enabled_in_broker : Bool
        )
        end
      end

      # Information about Kafka Cluster to be used as source / target for replication.

      struct KafkaCluster
        include JSON::Serializable

        # Details of an Amazon MSK Cluster.

        @[JSON::Field(key: "amazonMskCluster")]
        getter amazon_msk_cluster : Types::AmazonMskCluster

        # Details of an Amazon VPC which has network connectivity to the Apache Kafka cluster.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::KafkaClusterClientVpcConfig

        def initialize(
          @amazon_msk_cluster : Types::AmazonMskCluster,
          @vpc_config : Types::KafkaClusterClientVpcConfig
        )
        end
      end


      struct KafkaClusterClientVpcConfig
        include JSON::Serializable

        # The list of subnets in the client VPC to connect to.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The security groups to attach to the ENIs for the broker nodes.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @subnet_ids : Array(String),
          @security_group_ids : Array(String)? = nil
        )
        end
      end

      # Information about Kafka Cluster used as source / target for replication.

      struct KafkaClusterDescription
        include JSON::Serializable

        # Details of an Amazon MSK Cluster.

        @[JSON::Field(key: "amazonMskCluster")]
        getter amazon_msk_cluster : Types::AmazonMskCluster?

        # The alias of the Kafka cluster. Used to prefix names of replicated topics.

        @[JSON::Field(key: "kafkaClusterAlias")]
        getter kafka_cluster_alias : String?

        # Details of an Amazon VPC which has network connectivity to the Apache Kafka cluster.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::KafkaClusterClientVpcConfig?

        def initialize(
          @amazon_msk_cluster : Types::AmazonMskCluster? = nil,
          @kafka_cluster_alias : String? = nil,
          @vpc_config : Types::KafkaClusterClientVpcConfig? = nil
        )
        end
      end

      # Summarized information about Kafka Cluster used as source / target for replication.

      struct KafkaClusterSummary
        include JSON::Serializable

        # Details of an Amazon MSK Cluster .

        @[JSON::Field(key: "amazonMskCluster")]
        getter amazon_msk_cluster : Types::AmazonMskCluster?

        # The alias of the Kafka cluster. Used to prefix names of replicated topics.

        @[JSON::Field(key: "kafkaClusterAlias")]
        getter kafka_cluster_alias : String?

        def initialize(
          @amazon_msk_cluster : Types::AmazonMskCluster? = nil,
          @kafka_cluster_alias : String? = nil
        )
        end
      end

      # Information about a Apache Kafka version.

      struct KafkaVersion
        include JSON::Serializable

        # The status of the Apache Kafka version.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Apache Kafka version.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Request body for ListClientVpcConnections.

      struct ListClientVpcConnectionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response contains an array of client VPC connections and a next token if the response is
      # truncated.

      struct ListClientVpcConnectionsResponse
        include JSON::Serializable

        # List containing a ClientVpcConnection object.

        @[JSON::Field(key: "clientVpcConnections")]
        getter client_vpc_connections : Array(Types::ClientVpcConnection)?

        # If the response of ListClientVpcConnections is truncated, it returns a NextToken in the response.
        # This Nexttoken should be sent in the subsequent request to ListClientVpcConnections.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @client_vpc_connections : Array(Types::ClientVpcConnection)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClusterOperationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response contains an array containing cluster operation information and a next token if the
      # response is truncated.

      struct ListClusterOperationsResponse
        include JSON::Serializable

        # An array of cluster operation information objects.

        @[JSON::Field(key: "clusterOperationInfoList")]
        getter cluster_operation_info_list : Array(Types::ClusterOperationInfo)?

        # If the response of ListClusterOperations is truncated, it returns a NextToken in the response. This
        # Nexttoken should be sent in the subsequent request to ListClusterOperations.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_operation_info_list : Array(Types::ClusterOperationInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClusterOperationsV2Request
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response contains an array containing cluster operation information and a next token if the
      # response is truncated.

      struct ListClusterOperationsV2Response
        include JSON::Serializable


        @[JSON::Field(key: "clusterOperationInfoList")]
        getter cluster_operation_info_list : Array(Types::ClusterOperationV2Summary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_operation_info_list : Array(Types::ClusterOperationV2Summary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClustersRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterNameFilter")]
        getter cluster_name_filter : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name_filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response contains an array containing cluster information and a next token if the response is
      # truncated.

      struct ListClustersResponse
        include JSON::Serializable

        # Information on each of the MSK clusters in the response.

        @[JSON::Field(key: "clusterInfoList")]
        getter cluster_info_list : Array(Types::ClusterInfo)?

        # The paginated results marker. When the result of a ListClusters operation is truncated, the call
        # returns NextToken in the response. To get another batch of clusters, provide this token in your next
        # request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_info_list : Array(Types::ClusterInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClustersV2Request
        include JSON::Serializable


        @[JSON::Field(key: "clusterNameFilter")]
        getter cluster_name_filter : String?


        @[JSON::Field(key: "clusterTypeFilter")]
        getter cluster_type_filter : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name_filter : String? = nil,
          @cluster_type_filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response contains an array containing cluster information and a next token if the response is
      # truncated.

      struct ListClustersV2Response
        include JSON::Serializable

        # Information on each of the MSK clusters in the response.

        @[JSON::Field(key: "clusterInfoList")]
        getter cluster_info_list : Array(Types::Cluster)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_info_list : Array(Types::Cluster)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfigurationRevisionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about revisions of an MSK configuration.

      struct ListConfigurationRevisionsResponse
        include JSON::Serializable

        # Paginated results marker.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of ConfigurationRevision objects.

        @[JSON::Field(key: "revisions")]
        getter revisions : Array(Types::ConfigurationRevision)?

        def initialize(
          @next_token : String? = nil,
          @revisions : Array(Types::ConfigurationRevision)? = nil
        )
        end
      end


      struct ListConfigurationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response contains an array of Configuration and a next token if the response is truncated.

      struct ListConfigurationsResponse
        include JSON::Serializable

        # An array of MSK configurations.

        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Types::Configuration)?

        # The paginated results marker. When the result of a ListConfigurations operation is truncated, the
        # call returns NextToken in the response. To get another batch of configurations, provide this token
        # in your next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configurations : Array(Types::Configuration)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListKafkaVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Response for ListKafkaVersions.

      struct ListKafkaVersionsResponse
        include JSON::Serializable

        # An array of Apache Kafka version objects.

        @[JSON::Field(key: "kafkaVersions")]
        getter kafka_versions : Array(Types::KafkaVersion)?

        # Paginated results marker.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @kafka_versions : Array(Types::KafkaVersion)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNodesRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about nodes in the cluster.

      struct ListNodesResponse
        include JSON::Serializable

        # The paginated results marker. When the result of a ListNodes operation is truncated, the call
        # returns NextToken in the response. To get another batch of nodes, provide this token in your next
        # request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List containing a NodeInfo object.

        @[JSON::Field(key: "nodeInfoList")]
        getter node_info_list : Array(Types::NodeInfo)?

        def initialize(
          @next_token : String? = nil,
          @node_info_list : Array(Types::NodeInfo)? = nil
        )
        end
      end


      struct ListReplicatorsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "replicatorNameFilter")]
        getter replicator_name_filter : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @replicator_name_filter : String? = nil
        )
        end
      end

      # The response contains an array containing replicator information and a NextToken if the response is
      # truncated.

      struct ListReplicatorsResponse
        include JSON::Serializable

        # If the response of ListReplicators is truncated, it returns a NextToken in the response. This
        # NextToken should be sent in the subsequent request to ListReplicators.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List containing information of each of the replicators in the account.

        @[JSON::Field(key: "replicators")]
        getter replicators : Array(Types::ReplicatorSummary)?

        def initialize(
          @next_token : String? = nil,
          @replicators : Array(Types::ReplicatorSummary)? = nil
        )
        end
      end


      struct ListScramSecretsRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about scram secrets associated to the cluster.

      struct ListScramSecretsResponse
        include JSON::Serializable

        # Paginated results marker.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of scram secrets associated with the cluster.

        @[JSON::Field(key: "secretArnList")]
        getter secret_arn_list : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @secret_arn_list : Array(String)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # Response of listing tags for a resource.

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The key-value pair for the resource tag.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Request body for ListTopics.

      struct ListTopicsRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "topicNameFilter")]
        getter topic_name_filter : String?

        def initialize(
          @cluster_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @topic_name_filter : String? = nil
        )
        end
      end

      # The response contains an array of topics on a MSK Cluster.

      struct ListTopicsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "topics")]
        getter topics : Array(Types::TopicInfo)?

        def initialize(
          @next_token : String? = nil,
          @topics : Array(Types::TopicInfo)? = nil
        )
        end
      end

      # Request body for ListVpcConnections.

      struct ListVpcConnectionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response contains an array of MSK VPC connections and a next token if the response is truncated.

      struct ListVpcConnectionsResponse
        include JSON::Serializable

        # If the response of ListVpcConnections is truncated, it returns a NextToken in the response. This
        # NextToken should be sent in the subsequent request to ListVpcConnections.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List containing a VpcConnection object.

        @[JSON::Field(key: "vpcConnections")]
        getter vpc_connections : Array(Types::VpcConnection)?

        def initialize(
          @next_token : String? = nil,
          @vpc_connections : Array(Types::VpcConnection)? = nil
        )
        end
      end

      # You can configure your MSK cluster to send broker logs to different destination types. This is a
      # container for the configuration details related to broker logs.

      struct LoggingInfo
        include JSON::Serializable

        # You can configure your MSK cluster to send broker logs to different destination types. This
        # configuration specifies the details of these destinations.

        @[JSON::Field(key: "brokerLogs")]
        getter broker_logs : Types::BrokerLogs

        def initialize(
          @broker_logs : Types::BrokerLogs
        )
        end
      end

      # Information about cluster attributes that can be updated via update APIs.

      struct MutableClusterInfo
        include JSON::Serializable

        # Describes brokers being changed during a broker count update.

        @[JSON::Field(key: "brokerCountUpdateInfo")]
        getter broker_count_update_info : Types::BrokerCountUpdateInfo?

        # Specifies the size of the EBS volume and the ID of the associated broker.

        @[JSON::Field(key: "brokerEBSVolumeInfo")]
        getter broker_ebs_volume_info : Array(Types::BrokerEBSVolumeInfo)?

        # Includes all client authentication related information.

        @[JSON::Field(key: "clientAuthentication")]
        getter client_authentication : Types::ClientAuthentication?

        # Information about the changes in the configuration of the brokers.

        @[JSON::Field(key: "configurationInfo")]
        getter configuration_info : Types::ConfigurationInfo?

        # Information about the broker access configuration.

        @[JSON::Field(key: "connectivityInfo")]
        getter connectivity_info : Types::ConnectivityInfo?

        # Includes all encryption-related information.

        @[JSON::Field(key: "encryptionInfo")]
        getter encryption_info : Types::EncryptionInfo?

        # Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon CloudWatch for this
        # cluster.

        @[JSON::Field(key: "enhancedMonitoring")]
        getter enhanced_monitoring : String?

        # The Amazon MSK broker type that you want all of the brokers in this cluster to be.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The Apache Kafka version.

        @[JSON::Field(key: "kafkaVersion")]
        getter kafka_version : String?

        # LoggingInfo details.

        @[JSON::Field(key: "loggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The number of broker nodes in the cluster.

        @[JSON::Field(key: "numberOfBrokerNodes")]
        getter number_of_broker_nodes : Int32?

        # Settings for open monitoring using Prometheus.

        @[JSON::Field(key: "openMonitoring")]
        getter open_monitoring : Types::OpenMonitoring?

        # Describes the intelligent rebalancing configuration of an MSK Provisioned cluster with Express
        # brokers.

        @[JSON::Field(key: "rebalancing")]
        getter rebalancing : Types::Rebalancing?

        # This controls storage mode for supported storage tiers.

        @[JSON::Field(key: "storageMode")]
        getter storage_mode : String?

        def initialize(
          @broker_count_update_info : Types::BrokerCountUpdateInfo? = nil,
          @broker_ebs_volume_info : Array(Types::BrokerEBSVolumeInfo)? = nil,
          @client_authentication : Types::ClientAuthentication? = nil,
          @configuration_info : Types::ConfigurationInfo? = nil,
          @connectivity_info : Types::ConnectivityInfo? = nil,
          @encryption_info : Types::EncryptionInfo? = nil,
          @enhanced_monitoring : String? = nil,
          @instance_type : String? = nil,
          @kafka_version : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @number_of_broker_nodes : Int32? = nil,
          @open_monitoring : Types::OpenMonitoring? = nil,
          @rebalancing : Types::Rebalancing? = nil,
          @storage_mode : String? = nil
        )
        end
      end

      # Indicates whether you want to enable or disable the Node Exporter.

      struct NodeExporter
        include JSON::Serializable

        # Indicates whether you want to enable or disable the Node Exporter.

        @[JSON::Field(key: "enabledInBroker")]
        getter enabled_in_broker : Bool

        def initialize(
          @enabled_in_broker : Bool
        )
        end
      end

      # Indicates whether you want to enable or disable the Node Exporter.

      struct NodeExporterInfo
        include JSON::Serializable

        # Node Exporter being enabled in broker.

        @[JSON::Field(key: "enabledInBroker")]
        getter enabled_in_broker : Bool

        def initialize(
          @enabled_in_broker : Bool
        )
        end
      end

      # The node information object.

      struct NodeInfo
        include JSON::Serializable

        # The start time.

        @[JSON::Field(key: "addedToClusterTime")]
        getter added_to_cluster_time : String?

        # The broker node info.

        @[JSON::Field(key: "brokerNodeInfo")]
        getter broker_node_info : Types::BrokerNodeInfo?

        # The ControllerNodeInfo.

        @[JSON::Field(key: "controllerNodeInfo")]
        getter controller_node_info : Types::ControllerNodeInfo?

        # The instance type.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The Amazon Resource Name (ARN) of the node.

        @[JSON::Field(key: "nodeARN")]
        getter node_arn : String?

        # The node type.

        @[JSON::Field(key: "nodeType")]
        getter node_type : String?

        # The ZookeeperNodeInfo.

        @[JSON::Field(key: "zookeeperNodeInfo")]
        getter zookeeper_node_info : Types::ZookeeperNodeInfo?

        def initialize(
          @added_to_cluster_time : String? = nil,
          @broker_node_info : Types::BrokerNodeInfo? = nil,
          @controller_node_info : Types::ControllerNodeInfo? = nil,
          @instance_type : String? = nil,
          @node_arn : String? = nil,
          @node_type : String? = nil,
          @zookeeper_node_info : Types::ZookeeperNodeInfo? = nil
        )
        end
      end

      # Returns information about an error.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "invalidParameter")]
        getter invalid_parameter : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_parameter : String? = nil,
          @message : String? = nil
        )
        end
      end

      # JMX and Node monitoring for the MSK cluster.

      struct OpenMonitoring
        include JSON::Serializable

        # Prometheus settings.

        @[JSON::Field(key: "prometheus")]
        getter prometheus : Types::Prometheus

        def initialize(
          @prometheus : Types::Prometheus
        )
        end
      end

      # JMX and Node monitoring for the MSK cluster.

      struct OpenMonitoringInfo
        include JSON::Serializable

        # Prometheus settings.

        @[JSON::Field(key: "prometheus")]
        getter prometheus : Types::PrometheusInfo

        def initialize(
          @prometheus : Types::PrometheusInfo
        )
        end
      end

      # Prometheus settings for open monitoring.

      struct Prometheus
        include JSON::Serializable

        # Indicates whether you want to enable or disable the JMX Exporter.

        @[JSON::Field(key: "jmxExporter")]
        getter jmx_exporter : Types::JmxExporter?

        # Indicates whether you want to enable or disable the Node Exporter.

        @[JSON::Field(key: "nodeExporter")]
        getter node_exporter : Types::NodeExporter?

        def initialize(
          @jmx_exporter : Types::JmxExporter? = nil,
          @node_exporter : Types::NodeExporter? = nil
        )
        end
      end

      # Prometheus settings.

      struct PrometheusInfo
        include JSON::Serializable

        # JMX Exporter settings.

        @[JSON::Field(key: "jmxExporter")]
        getter jmx_exporter : Types::JmxExporterInfo?

        # Node Exporter settings.

        @[JSON::Field(key: "nodeExporter")]
        getter node_exporter : Types::NodeExporterInfo?

        def initialize(
          @jmx_exporter : Types::JmxExporterInfo? = nil,
          @node_exporter : Types::NodeExporterInfo? = nil
        )
        end
      end

      # Describes the provisioned cluster.

      struct Provisioned
        include JSON::Serializable

        # Information about the brokers.

        @[JSON::Field(key: "brokerNodeGroupInfo")]
        getter broker_node_group_info : Types::BrokerNodeGroupInfo


        @[JSON::Field(key: "numberOfBrokerNodes")]
        getter number_of_broker_nodes : Int32

        # Includes all client authentication information.

        @[JSON::Field(key: "clientAuthentication")]
        getter client_authentication : Types::ClientAuthentication?

        # Information about the version of software currently deployed on the Apache Kafka brokers in the
        # cluster.

        @[JSON::Field(key: "currentBrokerSoftwareInfo")]
        getter current_broker_software_info : Types::BrokerSoftwareInfo?

        # Determines if there is an action required from the customer.

        @[JSON::Field(key: "customerActionStatus")]
        getter customer_action_status : String?

        # Includes all encryption-related information.

        @[JSON::Field(key: "encryptionInfo")]
        getter encryption_info : Types::EncryptionInfo?

        # Specifies which metrics are gathered for the MSK cluster. This property has the following possible
        # values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and PER_TOPIC_PER_PARTITION. For a list of the
        # metrics associated with each of these levels of monitoring, see Monitoring .

        @[JSON::Field(key: "enhancedMonitoring")]
        getter enhanced_monitoring : String?

        # You can configure your MSK cluster to send broker logs to different destination types. This is a
        # container for the configuration details related to broker logs.

        @[JSON::Field(key: "loggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # Settings for open monitoring using Prometheus.

        @[JSON::Field(key: "openMonitoring")]
        getter open_monitoring : Types::OpenMonitoringInfo?

        # Specifies whether or not intelligent rebalancing is turned on for a newly created MSK Provisioned
        # cluster with Express brokers. Intelligent rebalancing performs automatic partition balancing
        # operations when you scale your clusters up or down. By default, intelligent rebalancing is ACTIVE
        # for all new Express-based clusters.

        @[JSON::Field(key: "rebalancing")]
        getter rebalancing : Types::Rebalancing?

        # This controls storage mode for supported storage tiers.

        @[JSON::Field(key: "storageMode")]
        getter storage_mode : String?


        @[JSON::Field(key: "zookeeperConnectString")]
        getter zookeeper_connect_string : String?


        @[JSON::Field(key: "zookeeperConnectStringTls")]
        getter zookeeper_connect_string_tls : String?

        def initialize(
          @broker_node_group_info : Types::BrokerNodeGroupInfo,
          @number_of_broker_nodes : Int32,
          @client_authentication : Types::ClientAuthentication? = nil,
          @current_broker_software_info : Types::BrokerSoftwareInfo? = nil,
          @customer_action_status : String? = nil,
          @encryption_info : Types::EncryptionInfo? = nil,
          @enhanced_monitoring : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @open_monitoring : Types::OpenMonitoringInfo? = nil,
          @rebalancing : Types::Rebalancing? = nil,
          @storage_mode : String? = nil,
          @zookeeper_connect_string : String? = nil,
          @zookeeper_connect_string_tls : String? = nil
        )
        end
      end

      # Creates a provisioned cluster.

      struct ProvisionedRequest
        include JSON::Serializable

        # Information about the brokers.

        @[JSON::Field(key: "brokerNodeGroupInfo")]
        getter broker_node_group_info : Types::BrokerNodeGroupInfo


        @[JSON::Field(key: "kafkaVersion")]
        getter kafka_version : String


        @[JSON::Field(key: "numberOfBrokerNodes")]
        getter number_of_broker_nodes : Int32

        # Includes all client authentication related information.

        @[JSON::Field(key: "clientAuthentication")]
        getter client_authentication : Types::ClientAuthentication?

        # Represents the configuration that you want MSK to use for the cluster.

        @[JSON::Field(key: "configurationInfo")]
        getter configuration_info : Types::ConfigurationInfo?

        # Includes all encryption-related information.

        @[JSON::Field(key: "encryptionInfo")]
        getter encryption_info : Types::EncryptionInfo?

        # Specifies the level of monitoring for the MSK cluster. The possible values are DEFAULT, PER_BROKER,
        # PER_TOPIC_PER_BROKER, and PER_TOPIC_PER_PARTITION.

        @[JSON::Field(key: "enhancedMonitoring")]
        getter enhanced_monitoring : String?

        # LoggingInfo details.

        @[JSON::Field(key: "loggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The settings for open monitoring.

        @[JSON::Field(key: "openMonitoring")]
        getter open_monitoring : Types::OpenMonitoringInfo?

        # Specifies if intelligent rebalancing is turned on for your MSK Provisioned cluster with Express
        # brokers. For all new Express-based clusters that you create, intelligent rebalancing is turned on by
        # default.

        @[JSON::Field(key: "rebalancing")]
        getter rebalancing : Types::Rebalancing?

        # This controls storage mode for supported storage tiers.

        @[JSON::Field(key: "storageMode")]
        getter storage_mode : String?

        def initialize(
          @broker_node_group_info : Types::BrokerNodeGroupInfo,
          @kafka_version : String,
          @number_of_broker_nodes : Int32,
          @client_authentication : Types::ClientAuthentication? = nil,
          @configuration_info : Types::ConfigurationInfo? = nil,
          @encryption_info : Types::EncryptionInfo? = nil,
          @enhanced_monitoring : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @open_monitoring : Types::OpenMonitoringInfo? = nil,
          @rebalancing : Types::Rebalancing? = nil,
          @storage_mode : String? = nil
        )
        end
      end

      # Contains information about provisioned throughput for EBS storage volumes attached to kafka broker
      # nodes.

      struct ProvisionedThroughput
        include JSON::Serializable

        # Provisioned throughput is enabled or not.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Throughput value of the EBS volumes for the data drive on each kafka broker node in MiB per second.

        @[JSON::Field(key: "volumeThroughput")]
        getter volume_throughput : Int32?

        def initialize(
          @enabled : Bool? = nil,
          @volume_throughput : Int32? = nil
        )
        end
      end

      # Broker public access control.

      struct PublicAccess
        include JSON::Serializable

        # The value DISABLED indicates that public access is disabled. SERVICE_PROVIDED_EIPS indicates that
        # public access is enabled.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # Request body for PutClusterPolicy.

      struct PutClusterPolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # Cluster policy for cluster.

        @[JSON::Field(key: "policy")]
        getter policy : String

        # Current cluster policy version.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        def initialize(
          @cluster_arn : String,
          @policy : String,
          @current_version : String? = nil
        )
        end
      end

      # Response body for PutClusterPolicy.

      struct PutClusterPolicyResponse
        include JSON::Serializable

        # Cluster policy version.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        def initialize(
          @current_version : String? = nil
        )
        end
      end

      # Includes all rebalancing-related information for the cluster.

      struct Rebalancing
        include JSON::Serializable


        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Request body for RebootBrokerNode action.

      struct RebootBrokerRequest
        include JSON::Serializable

        # The list of broker ids to be rebooted.

        @[JSON::Field(key: "brokerIds")]
        getter broker_ids : Array(String)


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        def initialize(
          @broker_ids : Array(String),
          @cluster_arn : String
        )
        end
      end

      # Response body for RebootBrokers action.

      struct RebootBrokerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Request body for RejectClientVpcConnection.

      struct RejectClientVpcConnectionRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # VPC connection ARN.

        @[JSON::Field(key: "vpcConnectionArn")]
        getter vpc_connection_arn : String

        def initialize(
          @cluster_arn : String,
          @vpc_connection_arn : String
        )
        end
      end

      # Response body for RejectClientVpcConnection.

      struct RejectClientVpcConnectionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies configuration for replication between a source and target Kafka cluster.

      struct ReplicationInfo
        include JSON::Serializable

        # Configuration relating to consumer group replication.

        @[JSON::Field(key: "consumerGroupReplication")]
        getter consumer_group_replication : Types::ConsumerGroupReplication

        # The ARN of the source Kafka cluster.

        @[JSON::Field(key: "sourceKafkaClusterArn")]
        getter source_kafka_cluster_arn : String

        # The compression type to use when producing records to target cluster.

        @[JSON::Field(key: "targetCompressionType")]
        getter target_compression_type : String

        # The ARN of the target Kafka cluster.

        @[JSON::Field(key: "targetKafkaClusterArn")]
        getter target_kafka_cluster_arn : String

        # Configuration relating to topic replication.

        @[JSON::Field(key: "topicReplication")]
        getter topic_replication : Types::TopicReplication

        def initialize(
          @consumer_group_replication : Types::ConsumerGroupReplication,
          @source_kafka_cluster_arn : String,
          @target_compression_type : String,
          @target_kafka_cluster_arn : String,
          @topic_replication : Types::TopicReplication
        )
        end
      end

      # Specifies configuration for replication between a source and target Kafka cluster
      # (sourceKafkaClusterAlias -> targetKafkaClusterAlias)

      struct ReplicationInfoDescription
        include JSON::Serializable

        # Configuration relating to consumer group replication .

        @[JSON::Field(key: "consumerGroupReplication")]
        getter consumer_group_replication : Types::ConsumerGroupReplication?

        # The alias of the source Kafka cluster.

        @[JSON::Field(key: "sourceKafkaClusterAlias")]
        getter source_kafka_cluster_alias : String?

        # The compression type to use when producing records to target cluster.

        @[JSON::Field(key: "targetCompressionType")]
        getter target_compression_type : String?

        # The alias of the target Kafka cluster.

        @[JSON::Field(key: "targetKafkaClusterAlias")]
        getter target_kafka_cluster_alias : String?

        # Configuration relating to topic replication.

        @[JSON::Field(key: "topicReplication")]
        getter topic_replication : Types::TopicReplication?

        def initialize(
          @consumer_group_replication : Types::ConsumerGroupReplication? = nil,
          @source_kafka_cluster_alias : String? = nil,
          @target_compression_type : String? = nil,
          @target_kafka_cluster_alias : String? = nil,
          @topic_replication : Types::TopicReplication? = nil
        )
        end
      end

      # Summarized information of replication between clusters.

      struct ReplicationInfoSummary
        include JSON::Serializable

        # The alias of the source Kafka cluster.

        @[JSON::Field(key: "sourceKafkaClusterAlias")]
        getter source_kafka_cluster_alias : String?

        # The alias of the target Kafka cluster.

        @[JSON::Field(key: "targetKafkaClusterAlias")]
        getter target_kafka_cluster_alias : String?

        def initialize(
          @source_kafka_cluster_alias : String? = nil,
          @target_kafka_cluster_alias : String? = nil
        )
        end
      end

      # Configuration for specifying the position in the topics to start replicating from.

      struct ReplicationStartingPosition
        include JSON::Serializable

        # The type of replication starting position.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # Details about the state of a replicator

      struct ReplicationStateInfo
        include JSON::Serializable

        # Code that describes the current state of the replicator.

        @[JSON::Field(key: "code")]
        getter code : String?

        # Message that describes the state of the replicator.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Configuration for specifying replicated topic names should be the same as their corresponding
      # upstream topics or prefixed with source cluster alias.

      struct ReplicationTopicNameConfiguration
        include JSON::Serializable

        # The type of replicated topic name.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # Information about a replicator.

      struct ReplicatorSummary
        include JSON::Serializable

        # The time the replicator was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The current version of the replicator.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        # Whether this resource is a replicator reference.

        @[JSON::Field(key: "isReplicatorReference")]
        getter is_replicator_reference : Bool?

        # Kafka Clusters used in setting up sources / targets for replication.

        @[JSON::Field(key: "kafkaClustersSummary")]
        getter kafka_clusters_summary : Array(Types::KafkaClusterSummary)?

        # A list of summarized information of replications between clusters.

        @[JSON::Field(key: "replicationInfoSummaryList")]
        getter replication_info_summary_list : Array(Types::ReplicationInfoSummary)?

        # The Amazon Resource Name (ARN) of the replicator.

        @[JSON::Field(key: "replicatorArn")]
        getter replicator_arn : String?

        # The name of the replicator.

        @[JSON::Field(key: "replicatorName")]
        getter replicator_name : String?

        # The Amazon Resource Name (ARN) of the replicator resource in the region where the replicator was
        # created.

        @[JSON::Field(key: "replicatorResourceArn")]
        getter replicator_resource_arn : String?

        # State of the replicator.

        @[JSON::Field(key: "replicatorState")]
        getter replicator_state : String?

        def initialize(
          @creation_time : Time? = nil,
          @current_version : String? = nil,
          @is_replicator_reference : Bool? = nil,
          @kafka_clusters_summary : Array(Types::KafkaClusterSummary)? = nil,
          @replication_info_summary_list : Array(Types::ReplicationInfoSummary)? = nil,
          @replicator_arn : String? = nil,
          @replicator_name : String? = nil,
          @replicator_resource_arn : String? = nil,
          @replicator_state : String? = nil
        )
        end
      end

      # The details of the Amazon S3 destination for broker logs.

      struct S3
        include JSON::Serializable

        # Specifies whether broker logs get sent to the specified Amazon S3 destination.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The name of the S3 bucket that is the destination for broker logs.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The S3 prefix that is the destination for broker logs.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @enabled : Bool,
          @bucket : String? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct Sasl
        include JSON::Serializable


        @[JSON::Field(key: "iam")]
        getter iam : Types::Iam?


        @[JSON::Field(key: "scram")]
        getter scram : Types::Scram?

        def initialize(
          @iam : Types::Iam? = nil,
          @scram : Types::Scram? = nil
        )
        end
      end


      struct Scram
        include JSON::Serializable

        # SASL/SCRAM authentication is enabled or not.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Describes the serverless cluster.

      struct Serverless
        include JSON::Serializable

        # Information on vpc config for the serverless cluster.

        @[JSON::Field(key: "vpcConfigs")]
        getter vpc_configs : Array(Types::VpcConfig)

        # Information about the serverless cluster client authentication.

        @[JSON::Field(key: "clientAuthentication")]
        getter client_authentication : Types::ServerlessClientAuthentication?

        def initialize(
          @vpc_configs : Array(Types::VpcConfig),
          @client_authentication : Types::ServerlessClientAuthentication? = nil
        )
        end
      end

      # Describes the serverless cluster client authentication.

      struct ServerlessClientAuthentication
        include JSON::Serializable

        # Serverless cluster SASL information.

        @[JSON::Field(key: "sasl")]
        getter sasl : Types::ServerlessSasl?

        def initialize(
          @sasl : Types::ServerlessSasl? = nil
        )
        end
      end

      # Creates serverless cluster.

      struct ServerlessRequest
        include JSON::Serializable

        # Information on vpc config for the serverless cluster.

        @[JSON::Field(key: "vpcConfigs")]
        getter vpc_configs : Array(Types::VpcConfig)

        # Information about the serverless cluster client authentication.

        @[JSON::Field(key: "clientAuthentication")]
        getter client_authentication : Types::ServerlessClientAuthentication?

        def initialize(
          @vpc_configs : Array(Types::VpcConfig),
          @client_authentication : Types::ServerlessClientAuthentication? = nil
        )
        end
      end

      # Describes the serverless cluster SASL information.

      struct ServerlessSasl
        include JSON::Serializable


        @[JSON::Field(key: "iam")]
        getter iam : Types::Iam?

        def initialize(
          @iam : Types::Iam? = nil
        )
        end
      end

      # Returns information about an error.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "invalidParameter")]
        getter invalid_parameter : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_parameter : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Contains information about the state of the Amazon MSK cluster.

      struct StateInfo
        include JSON::Serializable

        # If the cluster is in an unusable state, this field contains the code that describes the issue.

        @[JSON::Field(key: "code")]
        getter code : String?

        # If the cluster is in an unusable state, this field contains a message that describes the issue.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Contains information about storage volumes attached to MSK broker nodes.

      struct StorageInfo
        include JSON::Serializable

        # EBS volume information.

        @[JSON::Field(key: "ebsStorageInfo")]
        getter ebs_storage_info : Types::EBSStorageInfo?

        def initialize(
          @ebs_storage_info : Types::EBSStorageInfo? = nil
        )
        end
      end

      # Tag a resource.

      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The key-value pair for the resource tag.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # Details for client authentication using TLS.

      struct Tls
        include JSON::Serializable

        # List of ACM Certificate Authority ARNs.

        @[JSON::Field(key: "certificateAuthorityArnList")]
        getter certificate_authority_arn_list : Array(String)?

        # TLS authentication is enabled or not.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @certificate_authority_arn_list : Array(String)? = nil,
          @enabled : Bool? = nil
        )
        end
      end

      # Returns information about an error.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "invalidParameter")]
        getter invalid_parameter : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_parameter : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Includes identification info about the topic.

      struct TopicInfo
        include JSON::Serializable


        @[JSON::Field(key: "outOfSyncReplicaCount")]
        getter out_of_sync_replica_count : Int32?


        @[JSON::Field(key: "partitionCount")]
        getter partition_count : Int32?


        @[JSON::Field(key: "replicationFactor")]
        getter replication_factor : Int32?


        @[JSON::Field(key: "topicArn")]
        getter topic_arn : String?


        @[JSON::Field(key: "topicName")]
        getter topic_name : String?

        def initialize(
          @out_of_sync_replica_count : Int32? = nil,
          @partition_count : Int32? = nil,
          @replication_factor : Int32? = nil,
          @topic_arn : String? = nil,
          @topic_name : String? = nil
        )
        end
      end

      # Contains information about a topic partition.

      struct TopicPartitionInfo
        include JSON::Serializable


        @[JSON::Field(key: "isr")]
        getter isr : Array(Int32)?


        @[JSON::Field(key: "leader")]
        getter leader : Int32?


        @[JSON::Field(key: "partition")]
        getter partition : Int32?


        @[JSON::Field(key: "replicas")]
        getter replicas : Array(Int32)?

        def initialize(
          @isr : Array(Int32)? = nil,
          @leader : Int32? = nil,
          @partition : Int32? = nil,
          @replicas : Array(Int32)? = nil
        )
        end
      end

      # Details about topic replication.

      struct TopicReplication
        include JSON::Serializable

        # List of regular expression patterns indicating the topics to copy.

        @[JSON::Field(key: "topicsToReplicate")]
        getter topics_to_replicate : Array(String)

        # Whether to periodically configure remote topic ACLs to match their corresponding upstream topics.

        @[JSON::Field(key: "copyAccessControlListsForTopics")]
        getter copy_access_control_lists_for_topics : Bool?

        # Whether to periodically configure remote topics to match their corresponding upstream topics.

        @[JSON::Field(key: "copyTopicConfigurations")]
        getter copy_topic_configurations : Bool?

        # Whether to periodically check for new topics and partitions.

        @[JSON::Field(key: "detectAndCopyNewTopics")]
        getter detect_and_copy_new_topics : Bool?

        # Configuration for specifying the position in the topics to start replicating from.

        @[JSON::Field(key: "startingPosition")]
        getter starting_position : Types::ReplicationStartingPosition?

        # Configuration for specifying replicated topic names same as their corresponding upstream topics or
        # prefixed with source cluster alias.

        @[JSON::Field(key: "topicNameConfiguration")]
        getter topic_name_configuration : Types::ReplicationTopicNameConfiguration?

        # List of regular expression patterns indicating the topics that should not be replicated.

        @[JSON::Field(key: "topicsToExclude")]
        getter topics_to_exclude : Array(String)?

        def initialize(
          @topics_to_replicate : Array(String),
          @copy_access_control_lists_for_topics : Bool? = nil,
          @copy_topic_configurations : Bool? = nil,
          @detect_and_copy_new_topics : Bool? = nil,
          @starting_position : Types::ReplicationStartingPosition? = nil,
          @topic_name_configuration : Types::ReplicationTopicNameConfiguration? = nil,
          @topics_to_exclude : Array(String)? = nil
        )
        end
      end

      # Details for updating the topic replication of a replicator.

      struct TopicReplicationUpdate
        include JSON::Serializable

        # Whether to periodically configure remote topic ACLs to match their corresponding upstream topics.

        @[JSON::Field(key: "copyAccessControlListsForTopics")]
        getter copy_access_control_lists_for_topics : Bool

        # Whether to periodically configure remote topics to match their corresponding upstream topics.

        @[JSON::Field(key: "copyTopicConfigurations")]
        getter copy_topic_configurations : Bool

        # Whether to periodically check for new topics and partitions.

        @[JSON::Field(key: "detectAndCopyNewTopics")]
        getter detect_and_copy_new_topics : Bool

        # List of regular expression patterns indicating the topics that should not be replicated.

        @[JSON::Field(key: "topicsToExclude")]
        getter topics_to_exclude : Array(String)

        # List of regular expression patterns indicating the topics to copy.

        @[JSON::Field(key: "topicsToReplicate")]
        getter topics_to_replicate : Array(String)

        def initialize(
          @copy_access_control_lists_for_topics : Bool,
          @copy_topic_configurations : Bool,
          @detect_and_copy_new_topics : Bool,
          @topics_to_exclude : Array(String),
          @topics_to_replicate : Array(String)
        )
        end
      end

      # Contains information about unauthenticated traffic to the cluster.

      struct Unauthenticated
        include JSON::Serializable

        # Specifies whether you want to enable or disable unauthenticated traffic to your cluster.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Returns information about an error.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "invalidParameter")]
        getter invalid_parameter : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_parameter : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct UnprocessedScramSecret
        include JSON::Serializable


        @[JSON::Field(key: "errorCode")]
        getter error_code : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @secret_arn : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Request body for UpdateBrokerCount.

      struct UpdateBrokerCountRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The current version of the cluster.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        # The number of broker nodes that you want the cluster to have after this operation completes
        # successfully.

        @[JSON::Field(key: "targetNumberOfBrokerNodes")]
        getter target_number_of_broker_nodes : Int32

        def initialize(
          @cluster_arn : String,
          @current_version : String,
          @target_number_of_broker_nodes : Int32
        )
        end
      end

      # Response body for UpdateBrokerCount.

      struct UpdateBrokerCountResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Request object for UpdateBrokerStorage.

      struct UpdateBrokerStorageRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The version of cluster to update from. A successful operation will then generate a new version.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        # Describes the target volume size and the ID of the broker to apply the update to. The value you
        # specify for Target-Volume-in-GiB must be a whole number that is greater than 100 GiB. The storage
        # per broker after the update operation can't exceed 16384 GiB.

        @[JSON::Field(key: "targetBrokerEBSVolumeInfo")]
        getter target_broker_ebs_volume_info : Array(Types::BrokerEBSVolumeInfo)

        def initialize(
          @cluster_arn : String,
          @current_version : String,
          @target_broker_ebs_volume_info : Array(Types::BrokerEBSVolumeInfo)
        )
        end
      end

      # Response body for UpdateBrokerStorage.

      struct UpdateBrokerStorageResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Request body for UpdateBrokerType.

      struct UpdateBrokerTypeRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The current version of the cluster.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        # The Amazon MSK broker type that you want all of the brokers in this cluster to be.

        @[JSON::Field(key: "targetInstanceType")]
        getter target_instance_type : String

        def initialize(
          @cluster_arn : String,
          @current_version : String,
          @target_instance_type : String
        )
        end
      end

      # Response body for UpdateBrokerType.

      struct UpdateBrokerTypeResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Request body for UpdateClusterConfiguration.

      struct UpdateClusterConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # Represents the configuration that you want MSK to use for the cluster.

        @[JSON::Field(key: "configurationInfo")]
        getter configuration_info : Types::ConfigurationInfo

        # The version of the cluster that you want to update.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        def initialize(
          @cluster_arn : String,
          @configuration_info : Types::ConfigurationInfo,
          @current_version : String
        )
        end
      end

      # Response body for UpdateClusterConfiguration.

      struct UpdateClusterConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Request body for UpdateClusterKafkaVersion.

      struct UpdateClusterKafkaVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # Current cluster version.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        # Target Apache Kafka version.

        @[JSON::Field(key: "targetKafkaVersion")]
        getter target_kafka_version : String


        @[JSON::Field(key: "configurationInfo")]
        getter configuration_info : Types::ConfigurationInfo?

        def initialize(
          @cluster_arn : String,
          @current_version : String,
          @target_kafka_version : String,
          @configuration_info : Types::ConfigurationInfo? = nil
        )
        end
      end

      # Response body for UpdateClusterKafkaVersion.

      struct UpdateClusterKafkaVersionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Request body for UpdateConfiguration.

      struct UpdateConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "serverProperties")]
        getter server_properties : Bytes

        # The description of the configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @server_properties : Bytes,
          @description : String? = nil
        )
        end
      end

      # Response body for UpdateConfiguration.

      struct UpdateConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Latest revision of the configuration.

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision?

        def initialize(
          @arn : String? = nil,
          @latest_revision : Types::ConfigurationRevision? = nil
        )
        end
      end

      # Request body for UpdateConnectivity.

      struct UpdateConnectivityRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # Information about the broker access configuration.

        @[JSON::Field(key: "connectivityInfo")]
        getter connectivity_info : Types::ConnectivityInfo

        # The current version of the cluster.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        def initialize(
          @cluster_arn : String,
          @connectivity_info : Types::ConnectivityInfo,
          @current_version : String
        )
        end
      end

      # Response body for UpdateConnectivity.

      struct UpdateConnectivityResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Request body for UpdateMonitoring.

      struct UpdateMonitoringRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The version of cluster to update from. A successful operation will then generate a new version.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        # Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon CloudWatch for this
        # cluster.

        @[JSON::Field(key: "enhancedMonitoring")]
        getter enhanced_monitoring : String?

        # LoggingInfo details.

        @[JSON::Field(key: "loggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The settings for open monitoring.

        @[JSON::Field(key: "openMonitoring")]
        getter open_monitoring : Types::OpenMonitoringInfo?

        def initialize(
          @cluster_arn : String,
          @current_version : String,
          @enhanced_monitoring : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @open_monitoring : Types::OpenMonitoringInfo? = nil
        )
        end
      end

      # Response body for UpdateMonitoring.

      struct UpdateMonitoringResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Request body for UpdateRebalancing.

      struct UpdateRebalancingRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The current version of the cluster.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String


        @[JSON::Field(key: "rebalancing")]
        getter rebalancing : Types::Rebalancing

        def initialize(
          @cluster_arn : String,
          @current_version : String,
          @rebalancing : Types::Rebalancing
        )
        end
      end

      # Response body for UpdateRebalancing.

      struct UpdateRebalancingResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster whose intelligent rebalancing status you've updated.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Parameters for updating replication information between source and target Kafka clusters of a
      # replicator.

      struct UpdateReplicationInfoRequest
        include JSON::Serializable

        # Current replicator version.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String


        @[JSON::Field(key: "replicatorArn")]
        getter replicator_arn : String

        # The ARN of the source Kafka cluster.

        @[JSON::Field(key: "sourceKafkaClusterArn")]
        getter source_kafka_cluster_arn : String

        # The ARN of the target Kafka cluster.

        @[JSON::Field(key: "targetKafkaClusterArn")]
        getter target_kafka_cluster_arn : String

        # Updated consumer group replication information.

        @[JSON::Field(key: "consumerGroupReplication")]
        getter consumer_group_replication : Types::ConsumerGroupReplicationUpdate?

        # Updated topic replication information.

        @[JSON::Field(key: "topicReplication")]
        getter topic_replication : Types::TopicReplicationUpdate?

        def initialize(
          @current_version : String,
          @replicator_arn : String,
          @source_kafka_cluster_arn : String,
          @target_kafka_cluster_arn : String,
          @consumer_group_replication : Types::ConsumerGroupReplicationUpdate? = nil,
          @topic_replication : Types::TopicReplicationUpdate? = nil
        )
        end
      end

      # Updated Replication information of a replicator.

      struct UpdateReplicationInfoResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replicator.

        @[JSON::Field(key: "replicatorArn")]
        getter replicator_arn : String?

        # State of the replicator.

        @[JSON::Field(key: "replicatorState")]
        getter replicator_state : String?

        def initialize(
          @replicator_arn : String? = nil,
          @replicator_state : String? = nil
        )
        end
      end

      # Request body for UpdateSecurity.

      struct UpdateSecurityRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # You can use the DescribeCluster operation to get the current version of the cluster. After the
        # security update is complete, the cluster will have a new version.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        # Includes all client authentication related information.

        @[JSON::Field(key: "clientAuthentication")]
        getter client_authentication : Types::ClientAuthentication?

        # Includes all encryption-related information.

        @[JSON::Field(key: "encryptionInfo")]
        getter encryption_info : Types::EncryptionInfo?

        def initialize(
          @cluster_arn : String,
          @current_version : String,
          @client_authentication : Types::ClientAuthentication? = nil,
          @encryption_info : Types::EncryptionInfo? = nil
        )
        end
      end

      # Response body for UpdateSecurity.

      struct UpdateSecurityResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Request object for UpdateStorageApi.

      struct UpdateStorageRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # The version of cluster to update from. A successful operation will then generate a new version.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String

        # EBS volume provisioned throughput information.

        @[JSON::Field(key: "provisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        # Controls storage mode for supported storage tiers.

        @[JSON::Field(key: "storageMode")]
        getter storage_mode : String?

        # size of the EBS volume to update.

        @[JSON::Field(key: "volumeSizeGB")]
        getter volume_size_gb : Int32?

        def initialize(
          @cluster_arn : String,
          @current_version : String,
          @provisioned_throughput : Types::ProvisionedThroughput? = nil,
          @storage_mode : String? = nil,
          @volume_size_gb : Int32? = nil
        )
        end
      end

      # Response body for UpdateStorageResponse Api.

      struct UpdateStorageResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the cluster operation.

        @[JSON::Field(key: "clusterOperationArn")]
        getter cluster_operation_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_operation_arn : String? = nil
        )
        end
      end

      # Description of the requester that calls the API operation.

      struct UserIdentity
        include JSON::Serializable


        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        # The identity type of the requester that calls the API operation.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @principal_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The configuration of the Amazon VPCs for the cluster.

      struct VpcConfig
        include JSON::Serializable


        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)


        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @subnet_ids : Array(String),
          @security_group_ids : Array(String)? = nil
        )
        end
      end

      # The VPC connection object.

      struct VpcConnection
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "targetClusterArn")]
        getter target_cluster_arn : String

        # The Amazon Resource Name (ARN) of the VPC connection.

        @[JSON::Field(key: "vpcConnectionArn")]
        getter vpc_connection_arn : String

        # The authentication type for the VPC connection.

        @[JSON::Field(key: "authentication")]
        getter authentication : String?

        # The creation time of the VPC connection.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?


        @[JSON::Field(key: "state")]
        getter state : String?

        # The VPC ID of the VPC connection.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @target_cluster_arn : String,
          @vpc_connection_arn : String,
          @authentication : String? = nil,
          @creation_time : Time? = nil,
          @state : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Description of the VPC connection for CreateVpcConnection and DeleteVpcConnection operations.

      struct VpcConnectionInfo
        include JSON::Serializable


        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?


        @[JSON::Field(key: "owner")]
        getter owner : String?

        # Description of the requester that calls the API operation.

        @[JSON::Field(key: "userIdentity")]
        getter user_identity : Types::UserIdentity?


        @[JSON::Field(key: "vpcConnectionArn")]
        getter vpc_connection_arn : String?

        def initialize(
          @creation_time : Time? = nil,
          @owner : String? = nil,
          @user_identity : Types::UserIdentity? = nil,
          @vpc_connection_arn : String? = nil
        )
        end
      end

      # Description of the VPC connection for CreateVpcConnection and DeleteVpcConnection operations.

      struct VpcConnectionInfoServerless
        include JSON::Serializable


        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?


        @[JSON::Field(key: "owner")]
        getter owner : String?


        @[JSON::Field(key: "userIdentity")]
        getter user_identity : Types::UserIdentity?


        @[JSON::Field(key: "vpcConnectionArn")]
        getter vpc_connection_arn : String?

        def initialize(
          @creation_time : Time? = nil,
          @owner : String? = nil,
          @user_identity : Types::UserIdentity? = nil,
          @vpc_connection_arn : String? = nil
        )
        end
      end

      # Broker VPC connectivity access control.

      struct VpcConnectivity
        include JSON::Serializable


        @[JSON::Field(key: "clientAuthentication")]
        getter client_authentication : Types::VpcConnectivityClientAuthentication?

        def initialize(
          @client_authentication : Types::VpcConnectivityClientAuthentication? = nil
        )
        end
      end


      struct VpcConnectivityClientAuthentication
        include JSON::Serializable


        @[JSON::Field(key: "sasl")]
        getter sasl : Types::VpcConnectivitySasl?


        @[JSON::Field(key: "tls")]
        getter tls : Types::VpcConnectivityTls?

        def initialize(
          @sasl : Types::VpcConnectivitySasl? = nil,
          @tls : Types::VpcConnectivityTls? = nil
        )
        end
      end


      struct VpcConnectivityIam
        include JSON::Serializable


        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end


      struct VpcConnectivitySasl
        include JSON::Serializable


        @[JSON::Field(key: "iam")]
        getter iam : Types::VpcConnectivityIam?


        @[JSON::Field(key: "scram")]
        getter scram : Types::VpcConnectivityScram?

        def initialize(
          @iam : Types::VpcConnectivityIam? = nil,
          @scram : Types::VpcConnectivityScram? = nil
        )
        end
      end


      struct VpcConnectivityScram
        include JSON::Serializable

        # SASL/SCRAM authentication for VPC connectivity is on or off.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end


      struct VpcConnectivityTls
        include JSON::Serializable

        # TLS authentication for VPC connectivity is on or off.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Zookeeper node information.

      struct ZookeeperNodeInfo
        include JSON::Serializable

        # The attached elastic network interface of the zookeeper.

        @[JSON::Field(key: "attachedENIId")]
        getter attached_eni_id : String?

        # The virtual private cloud (VPC) IP address of the client.

        @[JSON::Field(key: "clientVpcIpAddress")]
        getter client_vpc_ip_address : String?

        # Endpoints for accessing the ZooKeeper.

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(String)?

        # The role-specific ID for Zookeeper.

        @[JSON::Field(key: "zookeeperId")]
        getter zookeeper_id : Float64?

        # The version of Zookeeper.

        @[JSON::Field(key: "zookeeperVersion")]
        getter zookeeper_version : String?

        def initialize(
          @attached_eni_id : String? = nil,
          @client_vpc_ip_address : String? = nil,
          @endpoints : Array(String)? = nil,
          @zookeeper_id : Float64? = nil,
          @zookeeper_version : String? = nil
        )
        end
      end
    end
  end
end
