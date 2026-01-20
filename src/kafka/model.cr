module Aws
  module Kafka
    module Model
      API_VERSION = "2018-11-14"
      TARGET_PREFIX = ""
      SIGNING_NAME = "kafka"
      ENDPOINT_PREFIX = "kafka"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kafka-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://kafka.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://kafka-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kafka.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://kafka.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_ASSOCIATE_SCRAM_SECRET = OperationModel.new(
        name: "BatchAssociateScramSecret",
        http_method: "POST",
        request_uri: "/v1/clusters/{clusterArn}/scram-secrets"
      )

      BATCH_DISASSOCIATE_SCRAM_SECRET = OperationModel.new(
        name: "BatchDisassociateScramSecret",
        http_method: "PATCH",
        request_uri: "/v1/clusters/{clusterArn}/scram-secrets"
      )

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/v1/clusters"
      )

      CREATE_CLUSTER_V2 = OperationModel.new(
        name: "CreateClusterV2",
        http_method: "POST",
        request_uri: "/api/v2/clusters"
      )

      CREATE_CONFIGURATION = OperationModel.new(
        name: "CreateConfiguration",
        http_method: "POST",
        request_uri: "/v1/configurations"
      )

      CREATE_REPLICATOR = OperationModel.new(
        name: "CreateReplicator",
        http_method: "POST",
        request_uri: "/replication/v1/replicators"
      )

      CREATE_VPC_CONNECTION = OperationModel.new(
        name: "CreateVpcConnection",
        http_method: "POST",
        request_uri: "/v1/vpc-connection"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "DELETE",
        request_uri: "/v1/clusters/{clusterArn}"
      )

      DELETE_CLUSTER_POLICY = OperationModel.new(
        name: "DeleteClusterPolicy",
        http_method: "DELETE",
        request_uri: "/v1/clusters/{clusterArn}/policy"
      )

      DELETE_CONFIGURATION = OperationModel.new(
        name: "DeleteConfiguration",
        http_method: "DELETE",
        request_uri: "/v1/configurations/{arn}"
      )

      DELETE_REPLICATOR = OperationModel.new(
        name: "DeleteReplicator",
        http_method: "DELETE",
        request_uri: "/replication/v1/replicators/{replicatorArn}"
      )

      DELETE_VPC_CONNECTION = OperationModel.new(
        name: "DeleteVpcConnection",
        http_method: "DELETE",
        request_uri: "/v1/vpc-connection/{arn}"
      )

      DESCRIBE_CLUSTER = OperationModel.new(
        name: "DescribeCluster",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}"
      )

      DESCRIBE_CLUSTER_OPERATION = OperationModel.new(
        name: "DescribeClusterOperation",
        http_method: "GET",
        request_uri: "/v1/operations/{clusterOperationArn}"
      )

      DESCRIBE_CLUSTER_OPERATION_V2 = OperationModel.new(
        name: "DescribeClusterOperationV2",
        http_method: "GET",
        request_uri: "/api/v2/operations/{clusterOperationArn}"
      )

      DESCRIBE_CLUSTER_V2 = OperationModel.new(
        name: "DescribeClusterV2",
        http_method: "GET",
        request_uri: "/api/v2/clusters/{clusterArn}"
      )

      DESCRIBE_CONFIGURATION = OperationModel.new(
        name: "DescribeConfiguration",
        http_method: "GET",
        request_uri: "/v1/configurations/{arn}"
      )

      DESCRIBE_CONFIGURATION_REVISION = OperationModel.new(
        name: "DescribeConfigurationRevision",
        http_method: "GET",
        request_uri: "/v1/configurations/{arn}/revisions/{revision}"
      )

      DESCRIBE_REPLICATOR = OperationModel.new(
        name: "DescribeReplicator",
        http_method: "GET",
        request_uri: "/replication/v1/replicators/{replicatorArn}"
      )

      DESCRIBE_TOPIC = OperationModel.new(
        name: "DescribeTopic",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}/topics/{topicName}"
      )

      DESCRIBE_TOPIC_PARTITIONS = OperationModel.new(
        name: "DescribeTopicPartitions",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}/topics/{topicName}/partitions"
      )

      DESCRIBE_VPC_CONNECTION = OperationModel.new(
        name: "DescribeVpcConnection",
        http_method: "GET",
        request_uri: "/v1/vpc-connection/{arn}"
      )

      GET_BOOTSTRAP_BROKERS = OperationModel.new(
        name: "GetBootstrapBrokers",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}/bootstrap-brokers"
      )

      GET_CLUSTER_POLICY = OperationModel.new(
        name: "GetClusterPolicy",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}/policy"
      )

      GET_COMPATIBLE_KAFKA_VERSIONS = OperationModel.new(
        name: "GetCompatibleKafkaVersions",
        http_method: "GET",
        request_uri: "/v1/compatible-kafka-versions"
      )

      LIST_CLIENT_VPC_CONNECTIONS = OperationModel.new(
        name: "ListClientVpcConnections",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}/client-vpc-connections"
      )

      LIST_CLUSTER_OPERATIONS = OperationModel.new(
        name: "ListClusterOperations",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}/operations"
      )

      LIST_CLUSTER_OPERATIONS_V2 = OperationModel.new(
        name: "ListClusterOperationsV2",
        http_method: "GET",
        request_uri: "/api/v2/clusters/{clusterArn}/operations"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "GET",
        request_uri: "/v1/clusters"
      )

      LIST_CLUSTERS_V2 = OperationModel.new(
        name: "ListClustersV2",
        http_method: "GET",
        request_uri: "/api/v2/clusters"
      )

      LIST_CONFIGURATION_REVISIONS = OperationModel.new(
        name: "ListConfigurationRevisions",
        http_method: "GET",
        request_uri: "/v1/configurations/{arn}/revisions"
      )

      LIST_CONFIGURATIONS = OperationModel.new(
        name: "ListConfigurations",
        http_method: "GET",
        request_uri: "/v1/configurations"
      )

      LIST_KAFKA_VERSIONS = OperationModel.new(
        name: "ListKafkaVersions",
        http_method: "GET",
        request_uri: "/v1/kafka-versions"
      )

      LIST_NODES = OperationModel.new(
        name: "ListNodes",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}/nodes"
      )

      LIST_REPLICATORS = OperationModel.new(
        name: "ListReplicators",
        http_method: "GET",
        request_uri: "/replication/v1/replicators"
      )

      LIST_SCRAM_SECRETS = OperationModel.new(
        name: "ListScramSecrets",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}/scram-secrets"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/tags/{resourceArn}"
      )

      LIST_TOPICS = OperationModel.new(
        name: "ListTopics",
        http_method: "GET",
        request_uri: "/v1/clusters/{clusterArn}/topics"
      )

      LIST_VPC_CONNECTIONS = OperationModel.new(
        name: "ListVpcConnections",
        http_method: "GET",
        request_uri: "/v1/vpc-connections"
      )

      PUT_CLUSTER_POLICY = OperationModel.new(
        name: "PutClusterPolicy",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/policy"
      )

      REBOOT_BROKER = OperationModel.new(
        name: "RebootBroker",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/reboot-broker"
      )

      REJECT_CLIENT_VPC_CONNECTION = OperationModel.new(
        name: "RejectClientVpcConnection",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/client-vpc-connection"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v1/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v1/tags/{resourceArn}"
      )

      UPDATE_BROKER_COUNT = OperationModel.new(
        name: "UpdateBrokerCount",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/nodes/count"
      )

      UPDATE_BROKER_STORAGE = OperationModel.new(
        name: "UpdateBrokerStorage",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/nodes/storage"
      )

      UPDATE_BROKER_TYPE = OperationModel.new(
        name: "UpdateBrokerType",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/nodes/type"
      )

      UPDATE_CLUSTER_CONFIGURATION = OperationModel.new(
        name: "UpdateClusterConfiguration",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/configuration"
      )

      UPDATE_CLUSTER_KAFKA_VERSION = OperationModel.new(
        name: "UpdateClusterKafkaVersion",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/version"
      )

      UPDATE_CONFIGURATION = OperationModel.new(
        name: "UpdateConfiguration",
        http_method: "PUT",
        request_uri: "/v1/configurations/{arn}"
      )

      UPDATE_CONNECTIVITY = OperationModel.new(
        name: "UpdateConnectivity",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/connectivity"
      )

      UPDATE_MONITORING = OperationModel.new(
        name: "UpdateMonitoring",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/monitoring"
      )

      UPDATE_REBALANCING = OperationModel.new(
        name: "UpdateRebalancing",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/rebalancing"
      )

      UPDATE_REPLICATION_INFO = OperationModel.new(
        name: "UpdateReplicationInfo",
        http_method: "PUT",
        request_uri: "/replication/v1/replicators/{replicatorArn}/replication-info"
      )

      UPDATE_SECURITY = OperationModel.new(
        name: "UpdateSecurity",
        http_method: "PATCH",
        request_uri: "/v1/clusters/{clusterArn}/security"
      )

      UPDATE_STORAGE = OperationModel.new(
        name: "UpdateStorage",
        http_method: "PUT",
        request_uri: "/v1/clusters/{clusterArn}/storage"
      )
    end
  end
end
