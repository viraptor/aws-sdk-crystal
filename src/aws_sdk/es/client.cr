module AwsSdk
  module OpenSearch
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

      # Allows the destination Amazon OpenSearch Service domain owner to accept an inbound cross-cluster
      # search connection request. For more information, see Cross-cluster search for Amazon OpenSearch
      # Service .
      def accept_inbound_connection(
        connection_id : String
      ) : Protocol::Request
        input = Types::AcceptInboundConnectionRequest.new(connection_id: connection_id)
        accept_inbound_connection(input)
      end
      def accept_inbound_connection(input : Types::AcceptInboundConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_INBOUND_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new direct-query data source to the specified domain. For more information, see Creating
      # Amazon OpenSearch Service data source integrations with Amazon S3 .
      def add_data_source(
        data_source_type : Types::DataSourceType,
        domain_name : String,
        name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::AddDataSourceRequest.new(data_source_type: data_source_type, domain_name: domain_name, name: name, description: description)
        add_data_source(input)
      end
      def add_data_source(input : Types::AddDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a new data source in Amazon OpenSearch Service so that you can perform direct queries on
      # external data.
      def add_direct_query_data_source(
        data_source_name : String,
        data_source_type : Types::DirectQueryDataSourceType,
        open_search_arns : Array(String),
        description : String? = nil,
        tag_list : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::AddDirectQueryDataSourceRequest.new(data_source_name: data_source_name, data_source_type: data_source_type, open_search_arns: open_search_arns, description: description, tag_list: tag_list)
        add_direct_query_data_source(input)
      end
      def add_direct_query_data_source(input : Types::AddDirectQueryDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_DIRECT_QUERY_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches tags to an existing Amazon OpenSearch Service domain, data source, or application. Tags are
      # a set of case-sensitive key-value pairs. A domain, data source, or application can have up to 10
      # tags. For more information, see Tagging Amazon OpenSearch Service resources .
      def add_tags(
        arn : String,
        tag_list : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::AddTagsRequest.new(arn: arn, tag_list: tag_list)
        add_tags(input)
      end
      def add_tags(input : Types::AddTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a package with an Amazon OpenSearch Service domain. For more information, see Custom
      # packages for Amazon OpenSearch Service .
      def associate_package(
        domain_name : String,
        package_id : String,
        association_configuration : Types::PackageAssociationConfiguration? = nil,
        prerequisite_package_id_list : Array(String)? = nil
      ) : Protocol::Request
        input = Types::AssociatePackageRequest.new(domain_name: domain_name, package_id: package_id, association_configuration: association_configuration, prerequisite_package_id_list: prerequisite_package_id_list)
        associate_package(input)
      end
      def associate_package(input : Types::AssociatePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Operation in the Amazon OpenSearch Service API for associating multiple packages with a domain
      # simultaneously.
      def associate_packages(
        domain_name : String,
        package_list : Array(Types::PackageDetailsForAssociation)
      ) : Protocol::Request
        input = Types::AssociatePackagesRequest.new(domain_name: domain_name, package_list: package_list)
        associate_packages(input)
      end
      def associate_packages(input : Types::AssociatePackagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides access to an Amazon OpenSearch Service domain through the use of an interface VPC endpoint.
      def authorize_vpc_endpoint_access(
        domain_name : String,
        account : String? = nil,
        service : String? = nil
      ) : Protocol::Request
        input = Types::AuthorizeVpcEndpointAccessRequest.new(domain_name: domain_name, account: account, service: service)
        authorize_vpc_endpoint_access(input)
      end
      def authorize_vpc_endpoint_access(input : Types::AuthorizeVpcEndpointAccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::AUTHORIZE_VPC_ENDPOINT_ACCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a pending configuration change on an Amazon OpenSearch Service domain.
      def cancel_domain_config_change(
        domain_name : String,
        dry_run : Bool? = nil
      ) : Protocol::Request
        input = Types::CancelDomainConfigChangeRequest.new(domain_name: domain_name, dry_run: dry_run)
        cancel_domain_config_change(input)
      end
      def cancel_domain_config_change(input : Types::CancelDomainConfigChangeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_DOMAIN_CONFIG_CHANGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a scheduled service software update for an Amazon OpenSearch Service domain. You can only
      # perform this operation before the AutomatedUpdateDate and when the domain's UpdateStatus is
      # PENDING_UPDATE . For more information, see Service software updates in Amazon OpenSearch Service .
      def cancel_service_software_update(
        domain_name : String
      ) : Protocol::Request
        input = Types::CancelServiceSoftwareUpdateRequest.new(domain_name: domain_name)
        cancel_service_software_update(input)
      end
      def cancel_service_software_update(input : Types::CancelServiceSoftwareUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_SERVICE_SOFTWARE_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an OpenSearch UI application. For more information, see Using the OpenSearch user interface
      # in Amazon OpenSearch Service .
      def create_application(
        name : String,
        app_configs : Array(Types::AppConfig)? = nil,
        client_token : String? = nil,
        data_sources : Array(Types::DataSource)? = nil,
        iam_identity_center_options : Types::IamIdentityCenterOptionsInput? = nil,
        kms_key_arn : String? = nil,
        tag_list : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(name: name, app_configs: app_configs, client_token: client_token, data_sources: data_sources, iam_identity_center_options: iam_identity_center_options, kms_key_arn: kms_key_arn, tag_list: tag_list)
        create_application(input)
      end
      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon OpenSearch Service domain. For more information, see Creating and managing Amazon
      # OpenSearch Service domains .
      def create_domain(
        domain_name : String,
        aiml_options : Types::AIMLOptionsInput? = nil,
        access_policies : String? = nil,
        advanced_options : Hash(String, String)? = nil,
        advanced_security_options : Types::AdvancedSecurityOptionsInput? = nil,
        auto_tune_options : Types::AutoTuneOptionsInput? = nil,
        cluster_config : Types::ClusterConfig? = nil,
        cognito_options : Types::CognitoOptions? = nil,
        domain_endpoint_options : Types::DomainEndpointOptions? = nil,
        ebs_options : Types::EBSOptions? = nil,
        encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
        engine_version : String? = nil,
        ip_address_type : String? = nil,
        identity_center_options : Types::IdentityCenterOptionsInput? = nil,
        log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
        node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
        off_peak_window_options : Types::OffPeakWindowOptions? = nil,
        snapshot_options : Types::SnapshotOptions? = nil,
        software_update_options : Types::SoftwareUpdateOptions? = nil,
        tag_list : Array(Types::Tag)? = nil,
        vpc_options : Types::VPCOptions? = nil
      ) : Protocol::Request
        input = Types::CreateDomainRequest.new(domain_name: domain_name, aiml_options: aiml_options, access_policies: access_policies, advanced_options: advanced_options, advanced_security_options: advanced_security_options, auto_tune_options: auto_tune_options, cluster_config: cluster_config, cognito_options: cognito_options, domain_endpoint_options: domain_endpoint_options, ebs_options: ebs_options, encryption_at_rest_options: encryption_at_rest_options, engine_version: engine_version, ip_address_type: ip_address_type, identity_center_options: identity_center_options, log_publishing_options: log_publishing_options, node_to_node_encryption_options: node_to_node_encryption_options, off_peak_window_options: off_peak_window_options, snapshot_options: snapshot_options, software_update_options: software_update_options, tag_list: tag_list, vpc_options: vpc_options)
        create_domain(input)
      end
      def create_domain(input : Types::CreateDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an OpenSearch index with optional automatic semantic enrichment for specified text fields.
      # Automatic semantic enrichment enables semantic search capabilities without requiring machine
      # learning expertise, improving search relevance by up to 20% by understanding search intent and
      # contextual meaning beyond keyword matching. The semantic enrichment process has zero impact on
      # search latency as sparse encodings are stored directly within the index during indexing. For more
      # information, see Automatic semantic enrichment .
      def create_index(
        domain_name : String,
        index_name : String,
        index_schema : Types::IndexSchema
      ) : Protocol::Request
        input = Types::CreateIndexRequest.new(domain_name: domain_name, index_name: index_name, index_schema: index_schema)
        create_index(input)
      end
      def create_index(input : Types::CreateIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new cross-cluster search connection from a source Amazon OpenSearch Service domain to a
      # destination domain. For more information, see Cross-cluster search for Amazon OpenSearch Service .
      def create_outbound_connection(
        connection_alias : String,
        local_domain_info : Types::DomainInformationContainer,
        remote_domain_info : Types::DomainInformationContainer,
        connection_mode : String? = nil,
        connection_properties : Types::ConnectionProperties? = nil
      ) : Protocol::Request
        input = Types::CreateOutboundConnectionRequest.new(connection_alias: connection_alias, local_domain_info: local_domain_info, remote_domain_info: remote_domain_info, connection_mode: connection_mode, connection_properties: connection_properties)
        create_outbound_connection(input)
      end
      def create_outbound_connection(input : Types::CreateOutboundConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_OUTBOUND_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a package for use with Amazon OpenSearch Service domains. For more information, see Custom
      # packages for Amazon OpenSearch Service .
      def create_package(
        package_name : String,
        package_source : Types::PackageSource,
        package_type : String,
        engine_version : String? = nil,
        package_configuration : Types::PackageConfiguration? = nil,
        package_description : String? = nil,
        package_encryption_options : Types::PackageEncryptionOptions? = nil,
        package_vending_options : Types::PackageVendingOptions? = nil
      ) : Protocol::Request
        input = Types::CreatePackageRequest.new(package_name: package_name, package_source: package_source, package_type: package_type, engine_version: engine_version, package_configuration: package_configuration, package_description: package_description, package_encryption_options: package_encryption_options, package_vending_options: package_vending_options)
        create_package(input)
      end
      def create_package(input : Types::CreatePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon OpenSearch Service-managed VPC endpoint.
      def create_vpc_endpoint(
        domain_arn : String,
        vpc_options : Types::VPCOptions,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateVpcEndpointRequest.new(domain_arn: domain_arn, vpc_options: vpc_options, client_token: client_token)
        create_vpc_endpoint(input)
      end
      def create_vpc_endpoint(input : Types::CreateVpcEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VPC_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified OpenSearch application.
      def delete_application(
        id : String
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(id: id)
        delete_application(input)
      end
      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a direct-query data source. For more information, see Deleting an Amazon OpenSearch Service
      # data source with Amazon S3 .
      def delete_data_source(
        domain_name : String,
        name : String
      ) : Protocol::Request
        input = Types::DeleteDataSourceRequest.new(domain_name: domain_name, name: name)
        delete_data_source(input)
      end
      def delete_data_source(input : Types::DeleteDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a previously configured direct query data source from Amazon OpenSearch Service.
      def delete_direct_query_data_source(
        data_source_name : String
      ) : Protocol::Request
        input = Types::DeleteDirectQueryDataSourceRequest.new(data_source_name: data_source_name)
        delete_direct_query_data_source(input)
      end
      def delete_direct_query_data_source(input : Types::DeleteDirectQueryDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DIRECT_QUERY_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon OpenSearch Service domain and all of its data. You can't recover a domain after
      # you delete it.
      def delete_domain(
        domain_name : String
      ) : Protocol::Request
        input = Types::DeleteDomainRequest.new(domain_name: domain_name)
        delete_domain(input)
      end
      def delete_domain(input : Types::DeleteDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the destination Amazon OpenSearch Service domain owner to delete an existing inbound
      # cross-cluster search connection. For more information, see Cross-cluster search for Amazon
      # OpenSearch Service .
      def delete_inbound_connection(
        connection_id : String
      ) : Protocol::Request
        input = Types::DeleteInboundConnectionRequest.new(connection_id: connection_id)
        delete_inbound_connection(input)
      end
      def delete_inbound_connection(input : Types::DeleteInboundConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INBOUND_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an OpenSearch index. This operation permanently removes the index and cannot be undone.
      def delete_index(
        domain_name : String,
        index_name : String
      ) : Protocol::Request
        input = Types::DeleteIndexRequest.new(domain_name: domain_name, index_name: index_name)
        delete_index(input)
      end
      def delete_index(input : Types::DeleteIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the source Amazon OpenSearch Service domain owner to delete an existing outbound
      # cross-cluster search connection. For more information, see Cross-cluster search for Amazon
      # OpenSearch Service .
      def delete_outbound_connection(
        connection_id : String
      ) : Protocol::Request
        input = Types::DeleteOutboundConnectionRequest.new(connection_id: connection_id)
        delete_outbound_connection(input)
      end
      def delete_outbound_connection(input : Types::DeleteOutboundConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OUTBOUND_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon OpenSearch Service package. For more information, see Custom packages for Amazon
      # OpenSearch Service .
      def delete_package(
        package_id : String
      ) : Protocol::Request
        input = Types::DeletePackageRequest.new(package_id: package_id)
        delete_package(input)
      end
      def delete_package(input : Types::DeletePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon OpenSearch Service-managed interface VPC endpoint.
      def delete_vpc_endpoint(
        vpc_endpoint_id : String
      ) : Protocol::Request
        input = Types::DeleteVpcEndpointRequest.new(vpc_endpoint_id: vpc_endpoint_id)
        delete_vpc_endpoint(input)
      end
      def delete_vpc_endpoint(input : Types::DeleteVpcEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VPC_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the domain configuration for the specified Amazon OpenSearch Service domain, including the
      # domain ID, domain service endpoint, and domain ARN.
      def describe_domain(
        domain_name : String
      ) : Protocol::Request
        input = Types::DescribeDomainRequest.new(domain_name: domain_name)
        describe_domain(input)
      end
      def describe_domain(input : Types::DescribeDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of optimizations that Auto-Tune has made to an Amazon OpenSearch Service domain.
      # For more information, see Auto-Tune for Amazon OpenSearch Service .
      def describe_domain_auto_tunes(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeDomainAutoTunesRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        describe_domain_auto_tunes(input)
      end
      def describe_domain_auto_tunes(input : Types::DescribeDomainAutoTunesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOMAIN_AUTO_TUNES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the current blue/green deployment happening on an Amazon OpenSearch
      # Service domain. For more information, see Making configuration changes in Amazon OpenSearch Service
      # .
      def describe_domain_change_progress(
        domain_name : String,
        change_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeDomainChangeProgressRequest.new(domain_name: domain_name, change_id: change_id)
        describe_domain_change_progress(input)
      end
      def describe_domain_change_progress(input : Types::DescribeDomainChangeProgressRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOMAIN_CHANGE_PROGRESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the configuration of an Amazon OpenSearch Service domain.
      def describe_domain_config(
        domain_name : String
      ) : Protocol::Request
        input = Types::DescribeDomainConfigRequest.new(domain_name: domain_name)
        describe_domain_config(input)
      end
      def describe_domain_config(input : Types::DescribeDomainConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOMAIN_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about domain and node health, the standby Availability Zone, number of nodes per
      # Availability Zone, and shard count per node.
      def describe_domain_health(
        domain_name : String
      ) : Protocol::Request
        input = Types::DescribeDomainHealthRequest.new(domain_name: domain_name)
        describe_domain_health(input)
      end
      def describe_domain_health(input : Types::DescribeDomainHealthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOMAIN_HEALTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about domain and nodes, including data nodes, master nodes, ultrawarm nodes,
      # Availability Zone(s), standby nodes, node configurations, and node states.
      def describe_domain_nodes(
        domain_name : String
      ) : Protocol::Request
        input = Types::DescribeDomainNodesRequest.new(domain_name: domain_name)
        describe_domain_nodes(input)
      end
      def describe_domain_nodes(input : Types::DescribeDomainNodesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOMAIN_NODES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns domain configuration information about the specified Amazon OpenSearch Service domains.
      def describe_domains(
        domain_names : Array(String)
      ) : Protocol::Request
        input = Types::DescribeDomainsRequest.new(domain_names: domain_names)
        describe_domains(input)
      end
      def describe_domains(input : Types::DescribeDomainsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the progress of a pre-update dry run analysis on an Amazon OpenSearch Service domain. For
      # more information, see Determining whether a change will cause a blue/green deployment .
      def describe_dry_run_progress(
        domain_name : String,
        dry_run_id : String? = nil,
        load_dry_run_config : Bool? = nil
      ) : Protocol::Request
        input = Types::DescribeDryRunProgressRequest.new(domain_name: domain_name, dry_run_id: dry_run_id, load_dry_run_config: load_dry_run_config)
        describe_dry_run_progress(input)
      end
      def describe_dry_run_progress(input : Types::DescribeDryRunProgressRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DRY_RUN_PROGRESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the inbound cross-cluster search connections for a destination (remote) Amazon OpenSearch
      # Service domain. For more information, see Cross-cluster search for Amazon OpenSearch Service .
      def describe_inbound_connections(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeInboundConnectionsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_inbound_connections(input)
      end
      def describe_inbound_connections(input : Types::DescribeInboundConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INBOUND_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the instance count, storage, and master node limits for a given OpenSearch or
      # Elasticsearch version and instance type.
      def describe_instance_type_limits(
        engine_version : String,
        instance_type : String,
        domain_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeInstanceTypeLimitsRequest.new(engine_version: engine_version, instance_type: instance_type, domain_name: domain_name)
        describe_instance_type_limits(input)
      end
      def describe_instance_type_limits(input : Types::DescribeInstanceTypeLimitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INSTANCE_TYPE_LIMITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the outbound cross-cluster connections for a local (source) Amazon OpenSearch Service
      # domain. For more information, see Cross-cluster search for Amazon OpenSearch Service .
      def describe_outbound_connections(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeOutboundConnectionsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_outbound_connections(input)
      end
      def describe_outbound_connections(input : Types::DescribeOutboundConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_OUTBOUND_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes all packages available to OpenSearch Service. For more information, see Custom packages
      # for Amazon OpenSearch Service .
      def describe_packages(
        filters : Array(Types::DescribePackagesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribePackagesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_packages(input)
      end
      def describe_packages(input : Types::DescribePackagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the available Amazon OpenSearch Service Reserved Instance offerings for a given Region.
      # For more information, see Reserved Instances in Amazon OpenSearch Service .
      def describe_reserved_instance_offerings(
        max_results : Int32? = nil,
        next_token : String? = nil,
        reserved_instance_offering_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeReservedInstanceOfferingsRequest.new(max_results: max_results, next_token: next_token, reserved_instance_offering_id: reserved_instance_offering_id)
        describe_reserved_instance_offerings(input)
      end
      def describe_reserved_instance_offerings(input : Types::DescribeReservedInstanceOfferingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESERVED_INSTANCE_OFFERINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the Amazon OpenSearch Service instances that you have reserved in a given Region. For more
      # information, see Reserved Instances in Amazon OpenSearch Service .
      def describe_reserved_instances(
        max_results : Int32? = nil,
        next_token : String? = nil,
        reserved_instance_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeReservedInstancesRequest.new(max_results: max_results, next_token: next_token, reserved_instance_id: reserved_instance_id)
        describe_reserved_instances(input)
      end
      def describe_reserved_instances(input : Types::DescribeReservedInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESERVED_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes one or more Amazon OpenSearch Service-managed VPC endpoints.
      def describe_vpc_endpoints(
        vpc_endpoint_ids : Array(String)
      ) : Protocol::Request
        input = Types::DescribeVpcEndpointsRequest.new(vpc_endpoint_ids: vpc_endpoint_ids)
        describe_vpc_endpoints(input)
      end
      def describe_vpc_endpoints(input : Types::DescribeVpcEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VPC_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a package from the specified Amazon OpenSearch Service domain. The package can't be in use
      # with any OpenSearch index for the dissociation to succeed. The package is still available in
      # OpenSearch Service for association later. For more information, see Custom packages for Amazon
      # OpenSearch Service .
      def dissociate_package(
        domain_name : String,
        package_id : String
      ) : Protocol::Request
        input = Types::DissociatePackageRequest.new(domain_name: domain_name, package_id: package_id)
        dissociate_package(input)
      end
      def dissociate_package(input : Types::DissociatePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISSOCIATE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Dissociates multiple packages from a domain simultaneously.
      def dissociate_packages(
        domain_name : String,
        package_list : Array(String)
      ) : Protocol::Request
        input = Types::DissociatePackagesRequest.new(domain_name: domain_name, package_list: package_list)
        dissociate_packages(input)
      end
      def dissociate_packages(input : Types::DissociatePackagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISSOCIATE_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the configuration and status of an existing OpenSearch application.
      def get_application(
        id : String
      ) : Protocol::Request
        input = Types::GetApplicationRequest.new(id: id)
        get_application(input)
      end
      def get_application(input : Types::GetApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a map of OpenSearch or Elasticsearch versions and the versions you can upgrade them to.
      def get_compatible_versions(
        domain_name : String? = nil
      ) : Protocol::Request
        input = Types::GetCompatibleVersionsRequest.new(domain_name: domain_name)
        get_compatible_versions(input)
      end
      def get_compatible_versions(input : Types::GetCompatibleVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPATIBLE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a direct query data source.
      def get_data_source(
        domain_name : String,
        name : String
      ) : Protocol::Request
        input = Types::GetDataSourceRequest.new(domain_name: domain_name, name: name)
        get_data_source(input)
      end
      def get_data_source(input : Types::GetDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the ARN of the current default application. If the default application isn't set, the operation
      # returns a resource not found error.
      def get_default_application_setting : Protocol::Request
        input = Types::GetDefaultApplicationSettingRequest.new
        get_default_application_setting(input)
      end
      def get_default_application_setting(input : Types::GetDefaultApplicationSettingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEFAULT_APPLICATION_SETTING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed configuration information for a specific direct query data source in Amazon
      # OpenSearch Service.
      def get_direct_query_data_source(
        data_source_name : String
      ) : Protocol::Request
        input = Types::GetDirectQueryDataSourceRequest.new(data_source_name: data_source_name)
        get_direct_query_data_source(input)
      end
      def get_direct_query_data_source(input : Types::GetDirectQueryDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DIRECT_QUERY_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The status of the maintenance action.
      def get_domain_maintenance_status(
        domain_name : String,
        maintenance_id : String
      ) : Protocol::Request
        input = Types::GetDomainMaintenanceStatusRequest.new(domain_name: domain_name, maintenance_id: maintenance_id)
        get_domain_maintenance_status(input)
      end
      def get_domain_maintenance_status(input : Types::GetDomainMaintenanceStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_MAINTENANCE_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an OpenSearch index including its schema and semantic enrichment
      # configuration. Use this operation to view the current index structure and semantic search settings.
      def get_index(
        domain_name : String,
        index_name : String
      ) : Protocol::Request
        input = Types::GetIndexRequest.new(domain_name: domain_name, index_name: index_name)
        get_index(input)
      end
      def get_index(input : Types::GetIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Amazon OpenSearch Service package versions, along with their creation time, commit
      # message, and plugin properties (if the package is a zip plugin package). For more information, see
      # Custom packages for Amazon OpenSearch Service .
      def get_package_version_history(
        package_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetPackageVersionHistoryRequest.new(package_id: package_id, max_results: max_results, next_token: next_token)
        get_package_version_history(input)
      end
      def get_package_version_history(input : Types::GetPackageVersionHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PACKAGE_VERSION_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the complete history of the last 10 upgrades performed on an Amazon OpenSearch Service
      # domain.
      def get_upgrade_history(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetUpgradeHistoryRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        get_upgrade_history(input)
      end
      def get_upgrade_history(input : Types::GetUpgradeHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_UPGRADE_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the most recent status of the last upgrade or upgrade eligibility check performed on an
      # Amazon OpenSearch Service domain.
      def get_upgrade_status(
        domain_name : String
      ) : Protocol::Request
        input = Types::GetUpgradeStatusRequest.new(domain_name: domain_name)
        get_upgrade_status(input)
      end
      def get_upgrade_status(input : Types::GetUpgradeStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_UPGRADE_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all OpenSearch applications under your account.
      def list_applications(
        max_results : Int32? = nil,
        next_token : String? = nil,
        statuses : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(max_results: max_results, next_token: next_token, statuses: statuses)
        list_applications(input)
      end
      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists direct-query data sources for a specific domain. For more information, see For more
      # information, see Working with Amazon OpenSearch Service direct queries with Amazon S3 .
      def list_data_sources(
        domain_name : String
      ) : Protocol::Request
        input = Types::ListDataSourcesRequest.new(domain_name: domain_name)
        list_data_sources(input)
      end
      def list_data_sources(input : Types::ListDataSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists an inventory of all the direct query data sources that you have configured within Amazon
      # OpenSearch Service.
      def list_direct_query_data_sources(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDirectQueryDataSourcesRequest.new(next_token: next_token)
        list_direct_query_data_sources(input)
      end
      def list_direct_query_data_sources(input : Types::ListDirectQueryDataSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DIRECT_QUERY_DATA_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of maintenance actions for the domain.
      def list_domain_maintenances(
        domain_name : String,
        action : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainMaintenancesRequest.new(domain_name: domain_name, action: action, max_results: max_results, next_token: next_token, status: status)
        list_domain_maintenances(input)
      end
      def list_domain_maintenances(input : Types::ListDomainMaintenancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_MAINTENANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the names of all Amazon OpenSearch Service domains owned by the current user in the active
      # Region.
      def list_domain_names(
        engine_type : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainNamesRequest.new(engine_type: engine_type)
        list_domain_names(input)
      end
      def list_domain_names(input : Types::ListDomainNamesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_NAMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Amazon OpenSearch Service domains associated with a given package. For more information,
      # see Custom packages for Amazon OpenSearch Service .
      def list_domains_for_package(
        package_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainsForPackageRequest.new(package_id: package_id, max_results: max_results, next_token: next_token)
        list_domains_for_package(input)
      end
      def list_domains_for_package(input : Types::ListDomainsForPackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAINS_FOR_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all instance types and available features for a given OpenSearch or Elasticsearch version.
      def list_instance_type_details(
        engine_version : String,
        domain_name : String? = nil,
        instance_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        retrieve_a_zs : Bool? = nil
      ) : Protocol::Request
        input = Types::ListInstanceTypeDetailsRequest.new(engine_version: engine_version, domain_name: domain_name, instance_type: instance_type, max_results: max_results, next_token: next_token, retrieve_a_zs: retrieve_a_zs)
        list_instance_type_details(input)
      end
      def list_instance_type_details(input : Types::ListInstanceTypeDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INSTANCE_TYPE_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all packages associated with an Amazon OpenSearch Service domain. For more information, see
      # Custom packages for Amazon OpenSearch Service .
      def list_packages_for_domain(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPackagesForDomainRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_packages_for_domain(input)
      end
      def list_packages_for_domain(input : Types::ListPackagesForDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGES_FOR_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of configuration changes that are scheduled for a domain. These changes can be
      # service software updates or blue/green Auto-Tune enhancements .
      def list_scheduled_actions(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListScheduledActionsRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_scheduled_actions(input)
      end
      def list_scheduled_actions(input : Types::ListScheduledActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEDULED_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns all resource tags for an Amazon OpenSearch Service domain, data source, or application. For
      # more information, see Tagging Amazon OpenSearch Service resources .
      def list_tags(
        arn : String
      ) : Protocol::Request
        input = Types::ListTagsRequest.new(arn: arn)
        list_tags(input)
      end
      def list_tags(input : Types::ListTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all versions of OpenSearch and Elasticsearch that Amazon OpenSearch Service supports.
      def list_versions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVersionsRequest.new(max_results: max_results, next_token: next_token)
        list_versions(input)
      end
      def list_versions(input : Types::ListVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about each Amazon Web Services principal that is allowed to access a given
      # Amazon OpenSearch Service domain through the use of an interface VPC endpoint.
      def list_vpc_endpoint_access(
        domain_name : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVpcEndpointAccessRequest.new(domain_name: domain_name, next_token: next_token)
        list_vpc_endpoint_access(input)
      end
      def list_vpc_endpoint_access(input : Types::ListVpcEndpointAccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VPC_ENDPOINT_ACCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all Amazon OpenSearch Service-managed VPC endpoints in the current Amazon Web Services
      # account and Region.
      def list_vpc_endpoints(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVpcEndpointsRequest.new(next_token: next_token)
        list_vpc_endpoints(input)
      end
      def list_vpc_endpoints(input : Types::ListVpcEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VPC_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all Amazon OpenSearch Service-managed VPC endpoints associated with a particular domain.
      def list_vpc_endpoints_for_domain(
        domain_name : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVpcEndpointsForDomainRequest.new(domain_name: domain_name, next_token: next_token)
        list_vpc_endpoints_for_domain(input)
      end
      def list_vpc_endpoints_for_domain(input : Types::ListVpcEndpointsForDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VPC_ENDPOINTS_FOR_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to purchase Amazon OpenSearch Service Reserved Instances.
      def purchase_reserved_instance_offering(
        reservation_name : String,
        reserved_instance_offering_id : String,
        instance_count : Int32? = nil
      ) : Protocol::Request
        input = Types::PurchaseReservedInstanceOfferingRequest.new(reservation_name: reservation_name, reserved_instance_offering_id: reserved_instance_offering_id, instance_count: instance_count)
        purchase_reserved_instance_offering(input)
      end
      def purchase_reserved_instance_offering(input : Types::PurchaseReservedInstanceOfferingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PURCHASE_RESERVED_INSTANCE_OFFERING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the default application to the application with the specified ARN. To remove the default
      # application, use the GetDefaultApplicationSetting operation to get the current default and then call
      # the PutDefaultApplicationSetting with the current applications ARN and the setAsDefault parameter
      # set to false .
      def put_default_application_setting(
        application_arn : String,
        set_as_default : Bool
      ) : Protocol::Request
        input = Types::PutDefaultApplicationSettingRequest.new(application_arn: application_arn, set_as_default: set_as_default)
        put_default_application_setting(input)
      end
      def put_default_application_setting(input : Types::PutDefaultApplicationSettingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DEFAULT_APPLICATION_SETTING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the remote Amazon OpenSearch Service domain owner to reject an inbound cross-cluster
      # connection request.
      def reject_inbound_connection(
        connection_id : String
      ) : Protocol::Request
        input = Types::RejectInboundConnectionRequest.new(connection_id: connection_id)
        reject_inbound_connection(input)
      end
      def reject_inbound_connection(input : Types::RejectInboundConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_INBOUND_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified set of tags from an Amazon OpenSearch Service domain, data source, or
      # application. For more information, see Tagging Amazon OpenSearch Service resources .
      def remove_tags(
        arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::RemoveTagsRequest.new(arn: arn, tag_keys: tag_keys)
        remove_tags(input)
      end
      def remove_tags(input : Types::RemoveTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Revokes access to an Amazon OpenSearch Service domain that was provided through an interface VPC
      # endpoint.
      def revoke_vpc_endpoint_access(
        domain_name : String,
        account : String? = nil,
        service : String? = nil
      ) : Protocol::Request
        input = Types::RevokeVpcEndpointAccessRequest.new(domain_name: domain_name, account: account, service: service)
        revoke_vpc_endpoint_access(input)
      end
      def revoke_vpc_endpoint_access(input : Types::RevokeVpcEndpointAccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_VPC_ENDPOINT_ACCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the node maintenance process on the data node. These processes can include a node reboot, an
      # Opensearch or Elasticsearch process restart, or a Dashboard or Kibana restart.
      def start_domain_maintenance(
        action : String,
        domain_name : String,
        node_id : String? = nil
      ) : Protocol::Request
        input = Types::StartDomainMaintenanceRequest.new(action: action, domain_name: domain_name, node_id: node_id)
        start_domain_maintenance(input)
      end
      def start_domain_maintenance(input : Types::StartDomainMaintenanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DOMAIN_MAINTENANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Schedules a service software update for an Amazon OpenSearch Service domain. For more information,
      # see Service software updates in Amazon OpenSearch Service .
      def start_service_software_update(
        domain_name : String,
        desired_start_time : Int64? = nil,
        schedule_at : String? = nil
      ) : Protocol::Request
        input = Types::StartServiceSoftwareUpdateRequest.new(domain_name: domain_name, desired_start_time: desired_start_time, schedule_at: schedule_at)
        start_service_software_update(input)
      end
      def start_service_software_update(input : Types::StartServiceSoftwareUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SERVICE_SOFTWARE_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration and settings of an existing OpenSearch application.
      def update_application(
        id : String,
        app_configs : Array(Types::AppConfig)? = nil,
        data_sources : Array(Types::DataSource)? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationRequest.new(id: id, app_configs: app_configs, data_sources: data_sources)
        update_application(input)
      end
      def update_application(input : Types::UpdateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a direct-query data source. For more information, see Working with Amazon OpenSearch Service
      # data source integrations with Amazon S3 .
      def update_data_source(
        data_source_type : Types::DataSourceType,
        domain_name : String,
        name : String,
        description : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSourceRequest.new(data_source_type: data_source_type, domain_name: domain_name, name: name, description: description, status: status)
        update_data_source(input)
      end
      def update_data_source(input : Types::UpdateDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration or properties of an existing direct query data source in Amazon OpenSearch
      # Service.
      def update_direct_query_data_source(
        data_source_name : String,
        data_source_type : Types::DirectQueryDataSourceType,
        open_search_arns : Array(String),
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDirectQueryDataSourceRequest.new(data_source_name: data_source_name, data_source_type: data_source_type, open_search_arns: open_search_arns, description: description)
        update_direct_query_data_source(input)
      end
      def update_direct_query_data_source(input : Types::UpdateDirectQueryDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DIRECT_QUERY_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the cluster configuration of the specified Amazon OpenSearch Service domain.
      def update_domain_config(
        domain_name : String,
        aiml_options : Types::AIMLOptionsInput? = nil,
        access_policies : String? = nil,
        advanced_options : Hash(String, String)? = nil,
        advanced_security_options : Types::AdvancedSecurityOptionsInput? = nil,
        auto_tune_options : Types::AutoTuneOptions? = nil,
        cluster_config : Types::ClusterConfig? = nil,
        cognito_options : Types::CognitoOptions? = nil,
        domain_endpoint_options : Types::DomainEndpointOptions? = nil,
        dry_run : Bool? = nil,
        dry_run_mode : String? = nil,
        ebs_options : Types::EBSOptions? = nil,
        encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
        ip_address_type : String? = nil,
        identity_center_options : Types::IdentityCenterOptionsInput? = nil,
        log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
        node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
        off_peak_window_options : Types::OffPeakWindowOptions? = nil,
        snapshot_options : Types::SnapshotOptions? = nil,
        software_update_options : Types::SoftwareUpdateOptions? = nil,
        vpc_options : Types::VPCOptions? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainConfigRequest.new(domain_name: domain_name, aiml_options: aiml_options, access_policies: access_policies, advanced_options: advanced_options, advanced_security_options: advanced_security_options, auto_tune_options: auto_tune_options, cluster_config: cluster_config, cognito_options: cognito_options, domain_endpoint_options: domain_endpoint_options, dry_run: dry_run, dry_run_mode: dry_run_mode, ebs_options: ebs_options, encryption_at_rest_options: encryption_at_rest_options, ip_address_type: ip_address_type, identity_center_options: identity_center_options, log_publishing_options: log_publishing_options, node_to_node_encryption_options: node_to_node_encryption_options, off_peak_window_options: off_peak_window_options, snapshot_options: snapshot_options, software_update_options: software_update_options, vpc_options: vpc_options)
        update_domain_config(input)
      end
      def update_domain_config(input : Types::UpdateDomainConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing OpenSearch index schema and semantic enrichment configuration. This operation
      # allows modification of field mappings and semantic search settings for text fields. Changes to
      # semantic enrichment configuration will apply to newly ingested documents.
      def update_index(
        domain_name : String,
        index_name : String,
        index_schema : Types::IndexSchema
      ) : Protocol::Request
        input = Types::UpdateIndexRequest.new(domain_name: domain_name, index_name: index_name, index_schema: index_schema)
        update_index(input)
      end
      def update_index(input : Types::UpdateIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a package for use with Amazon OpenSearch Service domains. For more information, see Custom
      # packages for Amazon OpenSearch Service .
      def update_package(
        package_id : String,
        package_source : Types::PackageSource,
        commit_message : String? = nil,
        package_configuration : Types::PackageConfiguration? = nil,
        package_description : String? = nil,
        package_encryption_options : Types::PackageEncryptionOptions? = nil
      ) : Protocol::Request
        input = Types::UpdatePackageRequest.new(package_id: package_id, package_source: package_source, commit_message: commit_message, package_configuration: package_configuration, package_description: package_description, package_encryption_options: package_encryption_options)
        update_package(input)
      end
      def update_package(input : Types::UpdatePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the scope of a package. Scope of the package defines users who can view and associate a
      # package.
      def update_package_scope(
        operation : String,
        package_id : String,
        package_user_list : Array(String)
      ) : Protocol::Request
        input = Types::UpdatePackageScopeRequest.new(operation: operation, package_id: package_id, package_user_list: package_user_list)
        update_package_scope(input)
      end
      def update_package_scope(input : Types::UpdatePackageScopeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGE_SCOPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Reschedules a planned domain configuration change for a later time. This change can be a scheduled
      # service software update or a blue/green Auto-Tune enhancement .
      def update_scheduled_action(
        action_id : String,
        action_type : String,
        domain_name : String,
        schedule_at : String,
        desired_start_time : Int64? = nil
      ) : Protocol::Request
        input = Types::UpdateScheduledActionRequest.new(action_id: action_id, action_type: action_type, domain_name: domain_name, schedule_at: schedule_at, desired_start_time: desired_start_time)
        update_scheduled_action(input)
      end
      def update_scheduled_action(input : Types::UpdateScheduledActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCHEDULED_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies an Amazon OpenSearch Service-managed interface VPC endpoint.
      def update_vpc_endpoint(
        vpc_endpoint_id : String,
        vpc_options : Types::VPCOptions
      ) : Protocol::Request
        input = Types::UpdateVpcEndpointRequest.new(vpc_endpoint_id: vpc_endpoint_id, vpc_options: vpc_options)
        update_vpc_endpoint(input)
      end
      def update_vpc_endpoint(input : Types::UpdateVpcEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VPC_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to either upgrade your Amazon OpenSearch Service domain or perform an upgrade eligibility
      # check to a compatible version of OpenSearch or Elasticsearch.
      def upgrade_domain(
        domain_name : String,
        target_version : String,
        advanced_options : Hash(String, String)? = nil,
        perform_check_only : Bool? = nil
      ) : Protocol::Request
        input = Types::UpgradeDomainRequest.new(domain_name: domain_name, target_version: target_version, advanced_options: advanced_options, perform_check_only: perform_check_only)
        upgrade_domain(input)
      end
      def upgrade_domain(input : Types::UpgradeDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPGRADE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
