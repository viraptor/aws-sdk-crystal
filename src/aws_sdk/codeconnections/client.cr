module AwsSdk
  module CodeConnections
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a connection that can then be given to other Amazon Web Services services like CodePipeline
      # so that it can access third-party code repositories. The connection is in pending status until the
      # third-party connection handshake is completed from the console.
      def create_connection(
        connection_name : String,
        host_arn : String? = nil,
        provider_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateConnectionOutput
        input = Types::CreateConnectionInput.new(connection_name: connection_name, host_arn: host_arn, provider_type: provider_type, tags: tags)
        create_connection(input)
      end
      def create_connection(input : Types::CreateConnectionInput) : Types::CreateConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConnectionOutput, "CreateConnection")
      end

      # Creates a resource that represents the infrastructure where a third-party provider is installed. The
      # host is used when you create connections to an installed third-party provider type, such as GitHub
      # Enterprise Server. You create one host for all connections to that provider. A host created through
      # the CLI or the SDK is in `PENDING` status by default. You can make its status `AVAILABLE` by setting
      # up the host in the console.
      def create_host(
        name : String,
        provider_endpoint : String,
        provider_type : String,
        tags : Array(Types::Tag)? = nil,
        vpc_configuration : Types::VpcConfiguration? = nil
      ) : Types::CreateHostOutput
        input = Types::CreateHostInput.new(name: name, provider_endpoint: provider_endpoint, provider_type: provider_type, tags: tags, vpc_configuration: vpc_configuration)
        create_host(input)
      end
      def create_host(input : Types::CreateHostInput) : Types::CreateHostOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_HOST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHostOutput, "CreateHost")
      end

      # Creates a link to a specified external Git repository. A repository link allows Git sync to monitor
      # and sync changes to files in a specified Git repository.
      def create_repository_link(
        connection_arn : String,
        owner_id : String,
        repository_name : String,
        encryption_key_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRepositoryLinkOutput
        input = Types::CreateRepositoryLinkInput.new(connection_arn: connection_arn, owner_id: owner_id, repository_name: repository_name, encryption_key_arn: encryption_key_arn, tags: tags)
        create_repository_link(input)
      end
      def create_repository_link(input : Types::CreateRepositoryLinkInput) : Types::CreateRepositoryLinkOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPOSITORY_LINK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRepositoryLinkOutput, "CreateRepositoryLink")
      end

      # Creates a sync configuration which allows Amazon Web Services to sync content from a Git repository
      # to update a specified Amazon Web Services resource. Parameters for the sync configuration are
      # determined by the sync type.
      def create_sync_configuration(
        branch : String,
        config_file : String,
        repository_link_id : String,
        resource_name : String,
        role_arn : String,
        sync_type : String,
        publish_deployment_status : String? = nil,
        pull_request_comment : String? = nil,
        trigger_resource_update_on : String? = nil
      ) : Types::CreateSyncConfigurationOutput
        input = Types::CreateSyncConfigurationInput.new(branch: branch, config_file: config_file, repository_link_id: repository_link_id, resource_name: resource_name, role_arn: role_arn, sync_type: sync_type, publish_deployment_status: publish_deployment_status, pull_request_comment: pull_request_comment, trigger_resource_update_on: trigger_resource_update_on)
        create_sync_configuration(input)
      end
      def create_sync_configuration(input : Types::CreateSyncConfigurationInput) : Types::CreateSyncConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SYNC_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSyncConfigurationOutput, "CreateSyncConfiguration")
      end

      # The connection to be deleted.
      def delete_connection(
        connection_arn : String
      ) : Types::DeleteConnectionOutput
        input = Types::DeleteConnectionInput.new(connection_arn: connection_arn)
        delete_connection(input)
      end
      def delete_connection(input : Types::DeleteConnectionInput) : Types::DeleteConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConnectionOutput, "DeleteConnection")
      end

      # The host to be deleted. Before you delete a host, all connections associated to the host must be
      # deleted. A host cannot be deleted if it is in the VPC_CONFIG_INITIALIZING or VPC_CONFIG_DELETING
      # state.
      def delete_host(
        host_arn : String
      ) : Types::DeleteHostOutput
        input = Types::DeleteHostInput.new(host_arn: host_arn)
        delete_host(input)
      end
      def delete_host(input : Types::DeleteHostInput) : Types::DeleteHostOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_HOST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteHostOutput, "DeleteHost")
      end

      # Deletes the association between your connection and a specified external Git repository.
      def delete_repository_link(
        repository_link_id : String
      ) : Types::DeleteRepositoryLinkOutput
        input = Types::DeleteRepositoryLinkInput.new(repository_link_id: repository_link_id)
        delete_repository_link(input)
      end
      def delete_repository_link(input : Types::DeleteRepositoryLinkInput) : Types::DeleteRepositoryLinkOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPOSITORY_LINK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRepositoryLinkOutput, "DeleteRepositoryLink")
      end

      # Deletes the sync configuration for a specified repository and connection.
      def delete_sync_configuration(
        resource_name : String,
        sync_type : String
      ) : Types::DeleteSyncConfigurationOutput
        input = Types::DeleteSyncConfigurationInput.new(resource_name: resource_name, sync_type: sync_type)
        delete_sync_configuration(input)
      end
      def delete_sync_configuration(input : Types::DeleteSyncConfigurationInput) : Types::DeleteSyncConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_SYNC_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSyncConfigurationOutput, "DeleteSyncConfiguration")
      end

      # Returns the connection ARN and details such as status, owner, and provider type.
      def get_connection(
        connection_arn : String
      ) : Types::GetConnectionOutput
        input = Types::GetConnectionInput.new(connection_arn: connection_arn)
        get_connection(input)
      end
      def get_connection(input : Types::GetConnectionInput) : Types::GetConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConnectionOutput, "GetConnection")
      end

      # Returns the host ARN and details such as status, provider type, endpoint, and, if applicable, the
      # VPC configuration.
      def get_host(
        host_arn : String
      ) : Types::GetHostOutput
        input = Types::GetHostInput.new(host_arn: host_arn)
        get_host(input)
      end
      def get_host(input : Types::GetHostInput) : Types::GetHostOutput
        request = Protocol::JsonRpc.build_request(Model::GET_HOST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetHostOutput, "GetHost")
      end

      # Returns details about a repository link. A repository link allows Git sync to monitor and sync
      # changes from files in a specified Git repository.
      def get_repository_link(
        repository_link_id : String
      ) : Types::GetRepositoryLinkOutput
        input = Types::GetRepositoryLinkInput.new(repository_link_id: repository_link_id)
        get_repository_link(input)
      end
      def get_repository_link(input : Types::GetRepositoryLinkInput) : Types::GetRepositoryLinkOutput
        request = Protocol::JsonRpc.build_request(Model::GET_REPOSITORY_LINK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRepositoryLinkOutput, "GetRepositoryLink")
      end

      # Returns details about the sync status for a repository. A repository sync uses Git sync to push and
      # pull changes from your remote repository.
      def get_repository_sync_status(
        branch : String,
        repository_link_id : String,
        sync_type : String
      ) : Types::GetRepositorySyncStatusOutput
        input = Types::GetRepositorySyncStatusInput.new(branch: branch, repository_link_id: repository_link_id, sync_type: sync_type)
        get_repository_sync_status(input)
      end
      def get_repository_sync_status(input : Types::GetRepositorySyncStatusInput) : Types::GetRepositorySyncStatusOutput
        request = Protocol::JsonRpc.build_request(Model::GET_REPOSITORY_SYNC_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRepositorySyncStatusOutput, "GetRepositorySyncStatus")
      end

      # Returns the status of the sync with the Git repository for a specific Amazon Web Services resource.
      def get_resource_sync_status(
        resource_name : String,
        sync_type : String
      ) : Types::GetResourceSyncStatusOutput
        input = Types::GetResourceSyncStatusInput.new(resource_name: resource_name, sync_type: sync_type)
        get_resource_sync_status(input)
      end
      def get_resource_sync_status(input : Types::GetResourceSyncStatusInput) : Types::GetResourceSyncStatusOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_SYNC_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceSyncStatusOutput, "GetResourceSyncStatus")
      end

      # Returns a list of the most recent sync blockers.
      def get_sync_blocker_summary(
        resource_name : String,
        sync_type : String
      ) : Types::GetSyncBlockerSummaryOutput
        input = Types::GetSyncBlockerSummaryInput.new(resource_name: resource_name, sync_type: sync_type)
        get_sync_blocker_summary(input)
      end
      def get_sync_blocker_summary(input : Types::GetSyncBlockerSummaryInput) : Types::GetSyncBlockerSummaryOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SYNC_BLOCKER_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSyncBlockerSummaryOutput, "GetSyncBlockerSummary")
      end

      # Returns details about a sync configuration, including the sync type and resource name. A sync
      # configuration allows the configuration to sync (push and pull) changes from the remote repository
      # for a specified branch in a Git repository.
      def get_sync_configuration(
        resource_name : String,
        sync_type : String
      ) : Types::GetSyncConfigurationOutput
        input = Types::GetSyncConfigurationInput.new(resource_name: resource_name, sync_type: sync_type)
        get_sync_configuration(input)
      end
      def get_sync_configuration(input : Types::GetSyncConfigurationInput) : Types::GetSyncConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SYNC_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSyncConfigurationOutput, "GetSyncConfiguration")
      end

      # Lists the connections associated with your account.
      def list_connections(
        host_arn_filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        provider_type_filter : String? = nil
      ) : Types::ListConnectionsOutput
        input = Types::ListConnectionsInput.new(host_arn_filter: host_arn_filter, max_results: max_results, next_token: next_token, provider_type_filter: provider_type_filter)
        list_connections(input)
      end
      def list_connections(input : Types::ListConnectionsInput) : Types::ListConnectionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConnectionsOutput, "ListConnections")
      end

      # Lists the hosts associated with your account.
      def list_hosts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListHostsOutput
        input = Types::ListHostsInput.new(max_results: max_results, next_token: next_token)
        list_hosts(input)
      end
      def list_hosts(input : Types::ListHostsInput) : Types::ListHostsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_HOSTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHostsOutput, "ListHosts")
      end

      # Lists the repository links created for connections in your account.
      def list_repository_links(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRepositoryLinksOutput
        input = Types::ListRepositoryLinksInput.new(max_results: max_results, next_token: next_token)
        list_repository_links(input)
      end
      def list_repository_links(input : Types::ListRepositoryLinksInput) : Types::ListRepositoryLinksOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REPOSITORY_LINKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRepositoryLinksOutput, "ListRepositoryLinks")
      end

      # Lists the repository sync definitions for repository links in your account.
      def list_repository_sync_definitions(
        repository_link_id : String,
        sync_type : String
      ) : Types::ListRepositorySyncDefinitionsOutput
        input = Types::ListRepositorySyncDefinitionsInput.new(repository_link_id: repository_link_id, sync_type: sync_type)
        list_repository_sync_definitions(input)
      end
      def list_repository_sync_definitions(input : Types::ListRepositorySyncDefinitionsInput) : Types::ListRepositorySyncDefinitionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REPOSITORY_SYNC_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRepositorySyncDefinitionsOutput, "ListRepositorySyncDefinitions")
      end

      # Returns a list of sync configurations for a specified repository.
      def list_sync_configurations(
        repository_link_id : String,
        sync_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSyncConfigurationsOutput
        input = Types::ListSyncConfigurationsInput.new(repository_link_id: repository_link_id, sync_type: sync_type, max_results: max_results, next_token: next_token)
        list_sync_configurations(input)
      end
      def list_sync_configurations(input : Types::ListSyncConfigurationsInput) : Types::ListSyncConfigurationsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SYNC_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSyncConfigurationsOutput, "ListSyncConfigurations")
      end

      # Gets the set of key-value pairs (metadata) that are used to manage the resource.
      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceOutput
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a
      # resource.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceOutput
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Types::TagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceOutput, "TagResource")
      end

      # Removes tags from an Amazon Web Services resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceOutput
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Types::UntagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceOutput, "UntagResource")
      end

      # Updates a specified host with the provided configurations.
      def update_host(
        host_arn : String,
        provider_endpoint : String? = nil,
        vpc_configuration : Types::VpcConfiguration? = nil
      ) : Types::UpdateHostOutput
        input = Types::UpdateHostInput.new(host_arn: host_arn, provider_endpoint: provider_endpoint, vpc_configuration: vpc_configuration)
        update_host(input)
      end
      def update_host(input : Types::UpdateHostInput) : Types::UpdateHostOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HOST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHostOutput, "UpdateHost")
      end

      # Updates the association between your connection and a specified external Git repository. A
      # repository link allows Git sync to monitor and sync changes to files in a specified Git repository.
      def update_repository_link(
        repository_link_id : String,
        connection_arn : String? = nil,
        encryption_key_arn : String? = nil
      ) : Types::UpdateRepositoryLinkOutput
        input = Types::UpdateRepositoryLinkInput.new(repository_link_id: repository_link_id, connection_arn: connection_arn, encryption_key_arn: encryption_key_arn)
        update_repository_link(input)
      end
      def update_repository_link(input : Types::UpdateRepositoryLinkInput) : Types::UpdateRepositoryLinkOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REPOSITORY_LINK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRepositoryLinkOutput, "UpdateRepositoryLink")
      end

      # Allows you to update the status of a sync blocker, resolving the blocker and allowing syncing to
      # continue.
      def update_sync_blocker(
        id : String,
        resolved_reason : String,
        resource_name : String,
        sync_type : String
      ) : Types::UpdateSyncBlockerOutput
        input = Types::UpdateSyncBlockerInput.new(id: id, resolved_reason: resolved_reason, resource_name: resource_name, sync_type: sync_type)
        update_sync_blocker(input)
      end
      def update_sync_blocker(input : Types::UpdateSyncBlockerInput) : Types::UpdateSyncBlockerOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SYNC_BLOCKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSyncBlockerOutput, "UpdateSyncBlocker")
      end

      # Updates the sync configuration for your connection and a specified external Git repository.
      def update_sync_configuration(
        resource_name : String,
        sync_type : String,
        branch : String? = nil,
        config_file : String? = nil,
        publish_deployment_status : String? = nil,
        pull_request_comment : String? = nil,
        repository_link_id : String? = nil,
        role_arn : String? = nil,
        trigger_resource_update_on : String? = nil
      ) : Types::UpdateSyncConfigurationOutput
        input = Types::UpdateSyncConfigurationInput.new(resource_name: resource_name, sync_type: sync_type, branch: branch, config_file: config_file, publish_deployment_status: publish_deployment_status, pull_request_comment: pull_request_comment, repository_link_id: repository_link_id, role_arn: role_arn, trigger_resource_update_on: trigger_resource_update_on)
        update_sync_configuration(input)
      end
      def update_sync_configuration(input : Types::UpdateSyncConfigurationInput) : Types::UpdateSyncConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SYNC_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSyncConfigurationOutput, "UpdateSyncConfiguration")
      end
    end
  end
end
