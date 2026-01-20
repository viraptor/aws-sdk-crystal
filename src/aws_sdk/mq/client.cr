module AwsSdk
  module Mq
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

      # Creates a broker. Note: This API is asynchronous. To create a broker, you must either use the
      # AmazonMQFullAccess IAM policy or include the following EC2 permissions in your IAM policy.
      # ec2:CreateNetworkInterface This permission is required to allow Amazon MQ to create an elastic
      # network interface (ENI) on behalf of your account. ec2:CreateNetworkInterfacePermission This
      # permission is required to attach the ENI to the broker instance. ec2:DeleteNetworkInterface
      # ec2:DeleteNetworkInterfacePermission ec2:DetachNetworkInterface ec2:DescribeInternetGateways
      # ec2:DescribeNetworkInterfaces ec2:DescribeNetworkInterfacePermissions ec2:DescribeRouteTables
      # ec2:DescribeSecurityGroups ec2:DescribeSubnets ec2:DescribeVpcs For more information, see Create an
      # IAM User and Get Your Amazon Web Services Credentials and Never Modify or Delete the Amazon MQ
      # Elastic Network Interface in the Amazon MQ Developer Guide .

      def create_broker(
        broker_name : String,
        deployment_mode : String,
        engine_type : String,
        host_instance_type : String,
        publicly_accessible : Bool,
        authentication_strategy : String? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        configuration : Types::ConfigurationId? = nil,
        creator_request_id : String? = nil,
        data_replication_mode : String? = nil,
        data_replication_primary_broker_arn : String? = nil,
        encryption_options : Types::EncryptionOptions? = nil,
        engine_version : String? = nil,
        ldap_server_metadata : Types::LdapServerMetadataInput? = nil,
        logs : Types::Logs? = nil,
        maintenance_window_start_time : Types::WeeklyStartTime? = nil,
        security_groups : Array(String)? = nil,
        storage_type : String? = nil,
        subnet_ids : Array(String)? = nil,
        tags : Hash(String, String)? = nil,
        users : Array(Types::User)? = nil
      ) : Protocol::Request
        input = Types::CreateBrokerRequest.new(broker_name: broker_name, deployment_mode: deployment_mode, engine_type: engine_type, host_instance_type: host_instance_type, publicly_accessible: publicly_accessible, authentication_strategy: authentication_strategy, auto_minor_version_upgrade: auto_minor_version_upgrade, configuration: configuration, creator_request_id: creator_request_id, data_replication_mode: data_replication_mode, data_replication_primary_broker_arn: data_replication_primary_broker_arn, encryption_options: encryption_options, engine_version: engine_version, ldap_server_metadata: ldap_server_metadata, logs: logs, maintenance_window_start_time: maintenance_window_start_time, security_groups: security_groups, storage_type: storage_type, subnet_ids: subnet_ids, tags: tags, users: users)
        create_broker(input)
      end

      def create_broker(input : Types::CreateBrokerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BROKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new configuration for the specified configuration name. Amazon MQ uses the default
      # configuration (the engine type and version).

      def create_configuration(
        engine_type : String,
        name : String,
        authentication_strategy : String? = nil,
        engine_version : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfigurationRequest.new(engine_type: engine_type, name: name, authentication_strategy: authentication_strategy, engine_version: engine_version, tags: tags)
        create_configuration(input)
      end

      def create_configuration(input : Types::CreateConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add a tag to a resource.

      def create_tags(
        resource_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTagsRequest.new(resource_arn: resource_arn, tags: tags)
        create_tags(input)
      end

      def create_tags(input : Types::CreateTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an ActiveMQ user. Do not add personally identifiable information (PII) or other confidential
      # or sensitive information in broker usernames. Broker usernames are accessible to other Amazon Web
      # Services services, including CloudWatch Logs. Broker usernames are not intended to be used for
      # private or sensitive data.

      def create_user(
        broker_id : String,
        password : String,
        username : String,
        console_access : Bool? = nil,
        groups : Array(String)? = nil,
        replication_user : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateUserRequest.new(broker_id: broker_id, password: password, username: username, console_access: console_access, groups: groups, replication_user: replication_user)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a broker. Note: This API is asynchronous.

      def delete_broker(
        broker_id : String
      ) : Protocol::Request
        input = Types::DeleteBrokerRequest.new(broker_id: broker_id)
        delete_broker(input)
      end

      def delete_broker(input : Types::DeleteBrokerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BROKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified configuration.

      def delete_configuration(
        configuration_id : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationRequest.new(configuration_id: configuration_id)
        delete_configuration(input)
      end

      def delete_configuration(input : Types::DeleteConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from a resource.

      def delete_tags(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::DeleteTagsRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        delete_tags(input)
      end

      def delete_tags(input : Types::DeleteTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an ActiveMQ user.

      def delete_user(
        broker_id : String,
        username : String
      ) : Protocol::Request
        input = Types::DeleteUserRequest.new(broker_id: broker_id, username: username)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the specified broker.

      def describe_broker(
        broker_id : String
      ) : Protocol::Request
        input = Types::DescribeBrokerRequest.new(broker_id: broker_id)
        describe_broker(input)
      end

      def describe_broker(input : Types::DescribeBrokerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BROKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe available engine types and versions.

      def describe_broker_engine_types(
        engine_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeBrokerEngineTypesRequest.new(engine_type: engine_type, max_results: max_results, next_token: next_token)
        describe_broker_engine_types(input)
      end

      def describe_broker_engine_types(input : Types::DescribeBrokerEngineTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BROKER_ENGINE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe available broker instance options.

      def describe_broker_instance_options(
        engine_type : String? = nil,
        host_instance_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        storage_type : String? = nil
      ) : Protocol::Request
        input = Types::DescribeBrokerInstanceOptionsRequest.new(engine_type: engine_type, host_instance_type: host_instance_type, max_results: max_results, next_token: next_token, storage_type: storage_type)
        describe_broker_instance_options(input)
      end

      def describe_broker_instance_options(input : Types::DescribeBrokerInstanceOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BROKER_INSTANCE_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the specified configuration.

      def describe_configuration(
        configuration_id : String
      ) : Protocol::Request
        input = Types::DescribeConfigurationRequest.new(configuration_id: configuration_id)
        describe_configuration(input)
      end

      def describe_configuration(input : Types::DescribeConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the specified configuration revision for the specified configuration.

      def describe_configuration_revision(
        configuration_id : String,
        configuration_revision : String
      ) : Protocol::Request
        input = Types::DescribeConfigurationRevisionRequest.new(configuration_id: configuration_id, configuration_revision: configuration_revision)
        describe_configuration_revision(input)
      end

      def describe_configuration_revision(input : Types::DescribeConfigurationRevisionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONFIGURATION_REVISION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an ActiveMQ user.

      def describe_user(
        broker_id : String,
        username : String
      ) : Protocol::Request
        input = Types::DescribeUserRequest.new(broker_id: broker_id, username: username)
        describe_user(input)
      end

      def describe_user(input : Types::DescribeUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all brokers.

      def list_brokers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBrokersRequest.new(max_results: max_results, next_token: next_token)
        list_brokers(input)
      end

      def list_brokers(input : Types::ListBrokersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BROKERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all revisions for the specified configuration.

      def list_configuration_revisions(
        configuration_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationRevisionsRequest.new(configuration_id: configuration_id, max_results: max_results, next_token: next_token)
        list_configuration_revisions(input)
      end

      def list_configuration_revisions(input : Types::ListConfigurationRevisionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_REVISIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all configurations.

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

      # Lists tags for a resource.

      def list_tags(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsRequest.new(resource_arn: resource_arn)
        list_tags(input)
      end

      def list_tags(input : Types::ListTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all ActiveMQ users.

      def list_users(
        broker_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUsersRequest.new(broker_id: broker_id, max_results: max_results, next_token: next_token)
        list_users(input)
      end

      def list_users(input : Types::ListUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Promotes a data replication replica broker to the primary broker role.

      def promote(
        broker_id : String,
        mode : String
      ) : Protocol::Request
        input = Types::PromoteRequest.new(broker_id: broker_id, mode: mode)
        promote(input)
      end

      def promote(input : Types::PromoteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PROMOTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Reboots a broker. Note: This API is asynchronous.

      def reboot_broker(
        broker_id : String
      ) : Protocol::Request
        input = Types::RebootBrokerRequest.new(broker_id: broker_id)
        reboot_broker(input)
      end

      def reboot_broker(input : Types::RebootBrokerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REBOOT_BROKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a pending configuration change to a broker.

      def update_broker(
        broker_id : String,
        authentication_strategy : String? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        configuration : Types::ConfigurationId? = nil,
        data_replication_mode : String? = nil,
        engine_version : String? = nil,
        host_instance_type : String? = nil,
        ldap_server_metadata : Types::LdapServerMetadataInput? = nil,
        logs : Types::Logs? = nil,
        maintenance_window_start_time : Types::WeeklyStartTime? = nil,
        security_groups : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateBrokerRequest.new(broker_id: broker_id, authentication_strategy: authentication_strategy, auto_minor_version_upgrade: auto_minor_version_upgrade, configuration: configuration, data_replication_mode: data_replication_mode, engine_version: engine_version, host_instance_type: host_instance_type, ldap_server_metadata: ldap_server_metadata, logs: logs, maintenance_window_start_time: maintenance_window_start_time, security_groups: security_groups)
        update_broker(input)
      end

      def update_broker(input : Types::UpdateBrokerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BROKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified configuration.

      def update_configuration(
        configuration_id : String,
        data : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConfigurationRequest.new(configuration_id: configuration_id, data: data, description: description)
        update_configuration(input)
      end

      def update_configuration(input : Types::UpdateConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the information for an ActiveMQ user.

      def update_user(
        broker_id : String,
        username : String,
        console_access : Bool? = nil,
        groups : Array(String)? = nil,
        password : String? = nil,
        replication_user : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateUserRequest.new(broker_id: broker_id, username: username, console_access: console_access, groups: groups, password: password, replication_user: replication_user)
        update_user(input)
      end

      def update_user(input : Types::UpdateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
