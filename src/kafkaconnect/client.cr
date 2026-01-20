module Aws
  module KafkaConnect
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates a connector using the specified properties.

      def create_connector(
        capacity : Types::Capacity,
        connector_configuration : Hash(String, String),
        connector_name : String,
        kafka_cluster : Types::KafkaCluster,
        kafka_cluster_client_authentication : Types::KafkaClusterClientAuthentication,
        kafka_cluster_encryption_in_transit : Types::KafkaClusterEncryptionInTransit,
        kafka_connect_version : String,
        plugins : Array(Types::Plugin),
        service_execution_role_arn : String,
        connector_description : String? = nil,
        log_delivery : Types::LogDelivery? = nil,
        network_type : String? = nil,
        tags : Hash(String, String)? = nil,
        worker_configuration : Types::WorkerConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateConnectorRequest.new(capacity: capacity, connector_configuration: connector_configuration, connector_name: connector_name, kafka_cluster: kafka_cluster, kafka_cluster_client_authentication: kafka_cluster_client_authentication, kafka_cluster_encryption_in_transit: kafka_cluster_encryption_in_transit, kafka_connect_version: kafka_connect_version, plugins: plugins, service_execution_role_arn: service_execution_role_arn, connector_description: connector_description, log_delivery: log_delivery, network_type: network_type, tags: tags, worker_configuration: worker_configuration)
        create_connector(input)
      end

      def create_connector(input : Types::CreateConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom plugin using the specified properties.

      def create_custom_plugin(
        content_type : String,
        location : Types::CustomPluginLocation,
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCustomPluginRequest.new(content_type: content_type, location: location, name: name, description: description, tags: tags)
        create_custom_plugin(input)
      end

      def create_custom_plugin(input : Types::CreateCustomPluginRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_PLUGIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a worker configuration using the specified properties.

      def create_worker_configuration(
        name : String,
        properties_file_content : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateWorkerConfigurationRequest.new(name: name, properties_file_content: properties_file_content, description: description, tags: tags)
        create_worker_configuration(input)
      end

      def create_worker_configuration(input : Types::CreateWorkerConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified connector.

      def delete_connector(
        connector_arn : String,
        current_version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteConnectorRequest.new(connector_arn: connector_arn, current_version: current_version)
        delete_connector(input)
      end

      def delete_connector(input : Types::DeleteConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom plugin.

      def delete_custom_plugin(
        custom_plugin_arn : String
      ) : Protocol::Request
        input = Types::DeleteCustomPluginRequest.new(custom_plugin_arn: custom_plugin_arn)
        delete_custom_plugin(input)
      end

      def delete_custom_plugin(input : Types::DeleteCustomPluginRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_PLUGIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified worker configuration.

      def delete_worker_configuration(
        worker_configuration_arn : String
      ) : Protocol::Request
        input = Types::DeleteWorkerConfigurationRequest.new(worker_configuration_arn: worker_configuration_arn)
        delete_worker_configuration(input)
      end

      def delete_worker_configuration(input : Types::DeleteWorkerConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns summary information about the connector.

      def describe_connector(
        connector_arn : String
      ) : Protocol::Request
        input = Types::DescribeConnectorRequest.new(connector_arn: connector_arn)
        describe_connector(input)
      end

      def describe_connector(input : Types::DescribeConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the specified connector's operations.

      def describe_connector_operation(
        connector_operation_arn : String
      ) : Protocol::Request
        input = Types::DescribeConnectorOperationRequest.new(connector_operation_arn: connector_operation_arn)
        describe_connector_operation(input)
      end

      def describe_connector_operation(input : Types::DescribeConnectorOperationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONNECTOR_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A summary description of the custom plugin.

      def describe_custom_plugin(
        custom_plugin_arn : String
      ) : Protocol::Request
        input = Types::DescribeCustomPluginRequest.new(custom_plugin_arn: custom_plugin_arn)
        describe_custom_plugin(input)
      end

      def describe_custom_plugin(input : Types::DescribeCustomPluginRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CUSTOM_PLUGIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a worker configuration.

      def describe_worker_configuration(
        worker_configuration_arn : String
      ) : Protocol::Request
        input = Types::DescribeWorkerConfigurationRequest.new(worker_configuration_arn: worker_configuration_arn)
        describe_worker_configuration(input)
      end

      def describe_worker_configuration(input : Types::DescribeWorkerConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_WORKER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about a connector's operation(s).

      def list_connector_operations(
        connector_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorOperationsRequest.new(connector_arn: connector_arn, max_results: max_results, next_token: next_token)
        list_connector_operations(input)
      end

      def list_connector_operations(input : Types::ListConnectorOperationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTOR_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the connectors in this account and Region. The list is limited to connectors
      # whose name starts with the specified prefix. The response also includes a description of each of the
      # listed connectors.

      def list_connectors(
        connector_name_prefix : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorsRequest.new(connector_name_prefix: connector_name_prefix, max_results: max_results, next_token: next_token)
        list_connectors(input)
      end

      def list_connectors(input : Types::ListConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all of the custom plugins in this account and Region.

      def list_custom_plugins(
        max_results : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomPluginsRequest.new(max_results: max_results, name_prefix: name_prefix, next_token: next_token)
        list_custom_plugins(input)
      end

      def list_custom_plugins(input : Types::ListCustomPluginsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_PLUGINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the tags attached to the specified resource.

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

      # Returns a list of all of the worker configurations in this account and Region.

      def list_worker_configurations(
        max_results : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkerConfigurationsRequest.new(max_results: max_results, name_prefix: name_prefix, next_token: next_token)
        list_worker_configurations(input)
      end

      def list_worker_configurations(input : Types::ListWorkerConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKER_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches tags to the specified resource.

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

      # Removes tags from the specified resource.

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

      # Updates the specified connector. For request body, specify only one parameter: either capacity or
      # connectorConfiguration .

      def update_connector(
        connector_arn : String,
        current_version : String,
        capacity : Types::CapacityUpdate? = nil,
        connector_configuration : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectorRequest.new(connector_arn: connector_arn, current_version: current_version, capacity: capacity, connector_configuration: connector_configuration)
        update_connector(input)
      end

      def update_connector(input : Types::UpdateConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
