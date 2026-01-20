module AwsSdk
  module Kafka
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Associates one or more Scram Secrets with an Amazon MSK cluster.

      def batch_associate_scram_secret(
        cluster_arn : String,
        secret_arn_list : Array(String)
      ) : Protocol::Request
        input = Types::BatchAssociateScramSecretRequest.new(cluster_arn: cluster_arn, secret_arn_list: secret_arn_list)
        batch_associate_scram_secret(input)
      end

      def batch_associate_scram_secret(input : Types::BatchAssociateScramSecretRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ASSOCIATE_SCRAM_SECRET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates one or more Scram Secrets from an Amazon MSK cluster.

      def batch_disassociate_scram_secret(
        cluster_arn : String,
        secret_arn_list : Array(String)
      ) : Protocol::Request
        input = Types::BatchDisassociateScramSecretRequest.new(cluster_arn: cluster_arn, secret_arn_list: secret_arn_list)
        batch_disassociate_scram_secret(input)
      end

      def batch_disassociate_scram_secret(input : Types::BatchDisassociateScramSecretRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DISASSOCIATE_SCRAM_SECRET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new MSK cluster.

      def create_cluster(
        broker_node_group_info : Types::BrokerNodeGroupInfo,
        cluster_name : String,
        kafka_version : String,
        number_of_broker_nodes : Int32,
        client_authentication : Types::ClientAuthentication? = nil,
        configuration_info : Types::ConfigurationInfo? = nil,
        encryption_info : Types::EncryptionInfo? = nil,
        enhanced_monitoring : String? = nil,
        logging_info : Types::LoggingInfo? = nil,
        open_monitoring : Types::OpenMonitoringInfo? = nil,
        rebalancing : Types::Rebalancing? = nil,
        storage_mode : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateClusterRequest.new(broker_node_group_info: broker_node_group_info, cluster_name: cluster_name, kafka_version: kafka_version, number_of_broker_nodes: number_of_broker_nodes, client_authentication: client_authentication, configuration_info: configuration_info, encryption_info: encryption_info, enhanced_monitoring: enhanced_monitoring, logging_info: logging_info, open_monitoring: open_monitoring, rebalancing: rebalancing, storage_mode: storage_mode, tags: tags)
        create_cluster(input)
      end

      def create_cluster(input : Types::CreateClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Amazon MSK cluster of either the provisioned or the serverless type.

      def create_cluster_v2(
        cluster_name : String,
        provisioned : Types::ProvisionedRequest? = nil,
        serverless : Types::ServerlessRequest? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateClusterV2Request.new(cluster_name: cluster_name, provisioned: provisioned, serverless: serverless, tags: tags)
        create_cluster_v2(input)
      end

      def create_cluster_v2(input : Types::CreateClusterV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLUSTER_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new MSK configuration.

      def create_configuration(
        name : String,
        server_properties : Bytes,
        description : String? = nil,
        kafka_versions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfigurationRequest.new(name: name, server_properties: server_properties, description: description, kafka_versions: kafka_versions)
        create_configuration(input)
      end

      def create_configuration(input : Types::CreateConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Kafka Replicator.

      def create_replicator(
        kafka_clusters : Array(Types::KafkaCluster),
        replication_info_list : Array(Types::ReplicationInfo),
        replicator_name : String,
        service_execution_role_arn : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateReplicatorRequest.new(kafka_clusters: kafka_clusters, replication_info_list: replication_info_list, replicator_name: replicator_name, service_execution_role_arn: service_execution_role_arn, description: description, tags: tags)
        create_replicator(input)
      end

      def create_replicator(input : Types::CreateReplicatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REPLICATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Amazon MSK VPC connection.

      def create_vpc_connection(
        authentication : String,
        client_subnets : Array(String),
        security_groups : Array(String),
        target_cluster_arn : String,
        vpc_id : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateVpcConnectionRequest.new(authentication: authentication, client_subnets: client_subnets, security_groups: security_groups, target_cluster_arn: target_cluster_arn, vpc_id: vpc_id, tags: tags)
        create_vpc_connection(input)
      end

      def create_vpc_connection(input : Types::CreateVpcConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VPC_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the request.

      def delete_cluster(
        cluster_arn : String,
        current_version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteClusterRequest.new(cluster_arn: cluster_arn, current_version: current_version)
        delete_cluster(input)
      end

      def delete_cluster(input : Types::DeleteClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the MSK cluster policy specified by the Amazon Resource Name (ARN) in your request.

      def delete_cluster_policy(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::DeleteClusterPolicyRequest.new(cluster_arn: cluster_arn)
        delete_cluster_policy(input)
      end

      def delete_cluster_policy(input : Types::DeleteClusterPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLUSTER_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified MSK configuration. The configuration must be in the ACTIVE or DELETE_FAILED
      # state.

      def delete_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationRequest.new(arn: arn)
        delete_configuration(input)
      end

      def delete_configuration(input : Types::DeleteConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a replicator.

      def delete_replicator(
        replicator_arn : String,
        current_version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteReplicatorRequest.new(replicator_arn: replicator_arn, current_version: current_version)
        delete_replicator(input)
      end

      def delete_replicator(input : Types::DeleteReplicatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REPLICATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the Amazon MSK VPC connection specified in your request.

      def delete_vpc_connection(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteVpcConnectionRequest.new(arn: arn)
        delete_vpc_connection(input)
      end

      def delete_vpc_connection(input : Types::DeleteVpcConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VPC_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of the MSK cluster whose Amazon Resource Name (ARN) is specified in the
      # request.

      def describe_cluster(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::DescribeClusterRequest.new(cluster_arn: cluster_arn)
        describe_cluster(input)
      end

      def describe_cluster(input : Types::DescribeClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of the cluster operation specified by the ARN.

      def describe_cluster_operation(
        cluster_operation_arn : String
      ) : Protocol::Request
        input = Types::DescribeClusterOperationRequest.new(cluster_operation_arn: cluster_operation_arn)
        describe_cluster_operation(input)
      end

      def describe_cluster_operation(input : Types::DescribeClusterOperationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CLUSTER_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of the cluster operation specified by the ARN.

      def describe_cluster_operation_v2(
        cluster_operation_arn : String
      ) : Protocol::Request
        input = Types::DescribeClusterOperationV2Request.new(cluster_operation_arn: cluster_operation_arn)
        describe_cluster_operation_v2(input)
      end

      def describe_cluster_operation_v2(input : Types::DescribeClusterOperationV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CLUSTER_OPERATION_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of the MSK cluster of either the provisioned or the serverless type whose
      # Amazon Resource Name (ARN) is specified in the request.

      def describe_cluster_v2(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::DescribeClusterV2Request.new(cluster_arn: cluster_arn)
        describe_cluster_v2(input)
      end

      def describe_cluster_v2(input : Types::DescribeClusterV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CLUSTER_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of this MSK configuration.

      def describe_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::DescribeConfigurationRequest.new(arn: arn)
        describe_configuration(input)
      end

      def describe_configuration(input : Types::DescribeConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of this revision of the configuration.

      def describe_configuration_revision(
        arn : String,
        revision : Int64
      ) : Protocol::Request
        input = Types::DescribeConfigurationRevisionRequest.new(arn: arn, revision: revision)
        describe_configuration_revision(input)
      end

      def describe_configuration_revision(input : Types::DescribeConfigurationRevisionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONFIGURATION_REVISION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of the Kafka Replicator whose Amazon Resource Name (ARN) is specified in the
      # request.

      def describe_replicator(
        replicator_arn : String
      ) : Protocol::Request
        input = Types::DescribeReplicatorRequest.new(replicator_arn: replicator_arn)
        describe_replicator(input)
      end

      def describe_replicator(input : Types::DescribeReplicatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REPLICATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns topic details of this topic on a MSK cluster.

      def describe_topic(
        cluster_arn : String,
        topic_name : String
      ) : Protocol::Request
        input = Types::DescribeTopicRequest.new(cluster_arn: cluster_arn, topic_name: topic_name)
        describe_topic(input)
      end

      def describe_topic(input : Types::DescribeTopicRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TOPIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns partition details of this topic on a MSK cluster.

      def describe_topic_partitions(
        cluster_arn : String,
        topic_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeTopicPartitionsRequest.new(cluster_arn: cluster_arn, topic_name: topic_name, max_results: max_results, next_token: next_token)
        describe_topic_partitions(input)
      end

      def describe_topic_partitions(input : Types::DescribeTopicPartitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TOPIC_PARTITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays information about the specified Amazon MSK VPC connection.

      def describe_vpc_connection(
        arn : String
      ) : Protocol::Request
        input = Types::DescribeVpcConnectionRequest.new(arn: arn)
        describe_vpc_connection(input)
      end

      def describe_vpc_connection(input : Types::DescribeVpcConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VPC_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of brokers that a client application can use to bootstrap. This list doesn't necessarily
      # include all of the brokers in the cluster. The following Python 3.6 example shows how you can use
      # the Amazon Resource Name (ARN) of a cluster to get its bootstrap brokers. If you don't know the ARN
      # of your cluster, you can use the ListClusters operation to get the ARNs of all the clusters in this
      # account and Region.

      def get_bootstrap_brokers(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::GetBootstrapBrokersRequest.new(cluster_arn: cluster_arn)
        get_bootstrap_brokers(input)
      end

      def get_bootstrap_brokers(input : Types::GetBootstrapBrokersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOOTSTRAP_BROKERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the contents of the specified MSK cluster policy.

      def get_cluster_policy(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::GetClusterPolicyRequest.new(cluster_arn: cluster_arn)
        get_cluster_policy(input)
      end

      def get_cluster_policy(input : Types::GetClusterPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLUSTER_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Apache Kafka versions to which you can update the MSK cluster.

      def get_compatible_kafka_versions(
        cluster_arn : String? = nil
      ) : Protocol::Request
        input = Types::GetCompatibleKafkaVersionsRequest.new(cluster_arn: cluster_arn)
        get_compatible_kafka_versions(input)
      end

      def get_compatible_kafka_versions(input : Types::GetCompatibleKafkaVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPATIBLE_KAFKA_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a list of client VPC connections.

      def list_client_vpc_connections(
        cluster_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClientVpcConnectionsRequest.new(cluster_arn: cluster_arn, max_results: max_results, next_token: next_token)
        list_client_vpc_connections(input)
      end

      def list_client_vpc_connections(input : Types::ListClientVpcConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLIENT_VPC_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the operations that have been performed on the specified MSK cluster.

      def list_cluster_operations(
        cluster_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClusterOperationsRequest.new(cluster_arn: cluster_arn, max_results: max_results, next_token: next_token)
        list_cluster_operations(input)
      end

      def list_cluster_operations(input : Types::ListClusterOperationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTER_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the operations that have been performed on the specified MSK cluster.

      def list_cluster_operations_v2(
        cluster_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClusterOperationsV2Request.new(cluster_arn: cluster_arn, max_results: max_results, next_token: next_token)
        list_cluster_operations_v2(input)
      end

      def list_cluster_operations_v2(input : Types::ListClusterOperationsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTER_OPERATIONS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the MSK clusters in the current Region.

      def list_clusters(
        cluster_name_filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClustersRequest.new(cluster_name_filter: cluster_name_filter, max_results: max_results, next_token: next_token)
        list_clusters(input)
      end

      def list_clusters(input : Types::ListClustersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the MSK clusters in the current Region.

      def list_clusters_v2(
        cluster_name_filter : String? = nil,
        cluster_type_filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClustersV2Request.new(cluster_name_filter: cluster_name_filter, cluster_type_filter: cluster_type_filter, max_results: max_results, next_token: next_token)
        list_clusters_v2(input)
      end

      def list_clusters_v2(input : Types::ListClustersV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTERS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the revisions of an MSK configuration.

      def list_configuration_revisions(
        arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationRevisionsRequest.new(arn: arn, max_results: max_results, next_token: next_token)
        list_configuration_revisions(input)
      end

      def list_configuration_revisions(input : Types::ListConfigurationRevisionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_REVISIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the MSK configurations in this Region.

      def list_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_configurations(input)
      end

      def list_configurations(input : Types::ListConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Apache Kafka versions.

      def list_kafka_versions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKafkaVersionsRequest.new(max_results: max_results, next_token: next_token)
        list_kafka_versions(input)
      end

      def list_kafka_versions(input : Types::ListKafkaVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KAFKA_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the broker nodes in the cluster.

      def list_nodes(
        cluster_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNodesRequest.new(cluster_arn: cluster_arn, max_results: max_results, next_token: next_token)
        list_nodes(input)
      end

      def list_nodes(input : Types::ListNodesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NODES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the replicators.

      def list_replicators(
        max_results : Int32? = nil,
        next_token : String? = nil,
        replicator_name_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListReplicatorsRequest.new(max_results: max_results, next_token: next_token, replicator_name_filter: replicator_name_filter)
        list_replicators(input)
      end

      def list_replicators(input : Types::ListReplicatorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPLICATORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the Scram Secrets associated with an Amazon MSK cluster.

      def list_scram_secrets(
        cluster_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListScramSecretsRequest.new(cluster_arn: cluster_arn, max_results: max_results, next_token: next_token)
        list_scram_secrets(input)
      end

      def list_scram_secrets(input : Types::ListScramSecretsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCRAM_SECRETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the tags associated with the specified resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List topics in a MSK cluster.

      def list_topics(
        cluster_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        topic_name_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListTopicsRequest.new(cluster_arn: cluster_arn, max_results: max_results, next_token: next_token, topic_name_filter: topic_name_filter)
        list_topics(input)
      end

      def list_topics(input : Types::ListTopicsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TOPICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a list of Amazon MSK VPC connections.

      def list_vpc_connections(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVpcConnectionsRequest.new(max_results: max_results, next_token: next_token)
        list_vpc_connections(input)
      end

      def list_vpc_connections(input : Types::ListVpcConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VPC_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates the specified MSK cluster policy. If updating the policy, the currentVersion
      # field is required in the request payload.

      def put_cluster_policy(
        cluster_arn : String,
        policy : String,
        current_version : String? = nil
      ) : Protocol::Request
        input = Types::PutClusterPolicyRequest.new(cluster_arn: cluster_arn, policy: policy, current_version: current_version)
        put_cluster_policy(input)
      end

      def put_cluster_policy(input : Types::PutClusterPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CLUSTER_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Executes a reboot on a broker.

      def reboot_broker(
        broker_ids : Array(String),
        cluster_arn : String
      ) : Protocol::Request
        input = Types::RebootBrokerRequest.new(broker_ids: broker_ids, cluster_arn: cluster_arn)
        reboot_broker(input)
      end

      def reboot_broker(input : Types::RebootBrokerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REBOOT_BROKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end


      def reject_client_vpc_connection(
        cluster_arn : String,
        vpc_connection_arn : String
      ) : Protocol::Request
        input = Types::RejectClientVpcConnectionRequest.new(cluster_arn: cluster_arn, vpc_connection_arn: vpc_connection_arn)
        reject_client_vpc_connection(input)
      end

      def reject_client_vpc_connection(input : Types::RejectClientVpcConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_CLIENT_VPC_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to the specified MSK resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the tags associated with the keys that are provided in the query.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the number of broker nodes in the cluster. You can use this operation to increase the number
      # of brokers in an existing cluster. You can't decrease the number of brokers.

      def update_broker_count(
        cluster_arn : String,
        current_version : String,
        target_number_of_broker_nodes : Int32
      ) : Protocol::Request
        input = Types::UpdateBrokerCountRequest.new(cluster_arn: cluster_arn, current_version: current_version, target_number_of_broker_nodes: target_number_of_broker_nodes)
        update_broker_count(input)
      end

      def update_broker_count(input : Types::UpdateBrokerCountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BROKER_COUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the EBS storage associated with MSK brokers.

      def update_broker_storage(
        cluster_arn : String,
        current_version : String,
        target_broker_ebs_volume_info : Array(Types::BrokerEBSVolumeInfo)
      ) : Protocol::Request
        input = Types::UpdateBrokerStorageRequest.new(cluster_arn: cluster_arn, current_version: current_version, target_broker_ebs_volume_info: target_broker_ebs_volume_info)
        update_broker_storage(input)
      end

      def update_broker_storage(input : Types::UpdateBrokerStorageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BROKER_STORAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates all the brokers in the cluster to the specified type.

      def update_broker_type(
        cluster_arn : String,
        current_version : String,
        target_instance_type : String
      ) : Protocol::Request
        input = Types::UpdateBrokerTypeRequest.new(cluster_arn: cluster_arn, current_version: current_version, target_instance_type: target_instance_type)
        update_broker_type(input)
      end

      def update_broker_type(input : Types::UpdateBrokerTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BROKER_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the cluster with the configuration that is specified in the request body.

      def update_cluster_configuration(
        cluster_arn : String,
        configuration_info : Types::ConfigurationInfo,
        current_version : String
      ) : Protocol::Request
        input = Types::UpdateClusterConfigurationRequest.new(cluster_arn: cluster_arn, configuration_info: configuration_info, current_version: current_version)
        update_cluster_configuration(input)
      end

      def update_cluster_configuration(input : Types::UpdateClusterConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLUSTER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Apache Kafka version for the cluster.

      def update_cluster_kafka_version(
        cluster_arn : String,
        current_version : String,
        target_kafka_version : String,
        configuration_info : Types::ConfigurationInfo? = nil
      ) : Protocol::Request
        input = Types::UpdateClusterKafkaVersionRequest.new(cluster_arn: cluster_arn, current_version: current_version, target_kafka_version: target_kafka_version, configuration_info: configuration_info)
        update_cluster_kafka_version(input)
      end

      def update_cluster_kafka_version(input : Types::UpdateClusterKafkaVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLUSTER_KAFKA_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing MSK configuration. The configuration must be in the Active state.

      def update_configuration(
        arn : String,
        server_properties : Bytes,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConfigurationRequest.new(arn: arn, server_properties: server_properties, description: description)
        update_configuration(input)
      end

      def update_configuration(input : Types::UpdateConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the connectivity configuration for the MSK cluster.

      def update_connectivity(
        cluster_arn : String,
        connectivity_info : Types::ConnectivityInfo,
        current_version : String
      ) : Protocol::Request
        input = Types::UpdateConnectivityRequest.new(cluster_arn: cluster_arn, connectivity_info: connectivity_info, current_version: current_version)
        update_connectivity(input)
      end

      def update_connectivity(input : Types::UpdateConnectivityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTIVITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the monitoring settings for the cluster. You can use this operation to specify which Apache
      # Kafka metrics you want Amazon MSK to send to Amazon CloudWatch. You can also specify settings for
      # open monitoring with Prometheus.

      def update_monitoring(
        cluster_arn : String,
        current_version : String,
        enhanced_monitoring : String? = nil,
        logging_info : Types::LoggingInfo? = nil,
        open_monitoring : Types::OpenMonitoringInfo? = nil
      ) : Protocol::Request
        input = Types::UpdateMonitoringRequest.new(cluster_arn: cluster_arn, current_version: current_version, enhanced_monitoring: enhanced_monitoring, logging_info: logging_info, open_monitoring: open_monitoring)
        update_monitoring(input)
      end

      def update_monitoring(input : Types::UpdateMonitoringRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MONITORING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this resource to update the intelligent rebalancing status of an Amazon MSK Provisioned cluster
      # with Express brokers.

      def update_rebalancing(
        cluster_arn : String,
        current_version : String,
        rebalancing : Types::Rebalancing
      ) : Protocol::Request
        input = Types::UpdateRebalancingRequest.new(cluster_arn: cluster_arn, current_version: current_version, rebalancing: rebalancing)
        update_rebalancing(input)
      end

      def update_rebalancing(input : Types::UpdateRebalancingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REBALANCING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates replication info of a replicator.

      def update_replication_info(
        current_version : String,
        replicator_arn : String,
        source_kafka_cluster_arn : String,
        target_kafka_cluster_arn : String,
        consumer_group_replication : Types::ConsumerGroupReplicationUpdate? = nil,
        topic_replication : Types::TopicReplicationUpdate? = nil
      ) : Protocol::Request
        input = Types::UpdateReplicationInfoRequest.new(current_version: current_version, replicator_arn: replicator_arn, source_kafka_cluster_arn: source_kafka_cluster_arn, target_kafka_cluster_arn: target_kafka_cluster_arn, consumer_group_replication: consumer_group_replication, topic_replication: topic_replication)
        update_replication_info(input)
      end

      def update_replication_info(input : Types::UpdateReplicationInfoRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPLICATION_INFO, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # You can use this operation to update the encrypting and authentication settings for an existing
      # cluster.

      def update_security(
        cluster_arn : String,
        current_version : String,
        client_authentication : Types::ClientAuthentication? = nil,
        encryption_info : Types::EncryptionInfo? = nil
      ) : Protocol::Request
        input = Types::UpdateSecurityRequest.new(cluster_arn: cluster_arn, current_version: current_version, client_authentication: client_authentication, encryption_info: encryption_info)
        update_security(input)
      end

      def update_security(input : Types::UpdateSecurityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SECURITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates cluster broker volume size (or) sets cluster storage mode to TIERED.

      def update_storage(
        cluster_arn : String,
        current_version : String,
        provisioned_throughput : Types::ProvisionedThroughput? = nil,
        storage_mode : String? = nil,
        volume_size_gb : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateStorageRequest.new(cluster_arn: cluster_arn, current_version: current_version, provisioned_throughput: provisioned_throughput, storage_mode: storage_mode, volume_size_gb: volume_size_gb)
        update_storage(input)
      end

      def update_storage(input : Types::UpdateStorageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STORAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
