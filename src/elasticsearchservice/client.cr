module Aws
  module ElasticsearchService
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

      # Allows the destination domain owner to accept an inbound cross-cluster search connection request.

      def accept_inbound_cross_cluster_search_connection(
        cross_cluster_search_connection_id : String
      ) : Protocol::Request
        input = Types::AcceptInboundCrossClusterSearchConnectionRequest.new(cross_cluster_search_connection_id: cross_cluster_search_connection_id)
        accept_inbound_cross_cluster_search_connection(input)
      end

      def accept_inbound_cross_cluster_search_connection(input : Types::AcceptInboundCrossClusterSearchConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_INBOUND_CROSS_CLUSTER_SEARCH_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches tags to an existing Elasticsearch domain. Tags are a set of case-sensitive key value pairs.
      # An Elasticsearch domain may have up to 10 tags. See Tagging Amazon Elasticsearch Service Domains for
      # more information.

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

      # Associates a package with an Amazon ES domain.

      def associate_package(
        domain_name : String,
        package_id : String
      ) : Protocol::Request
        input = Types::AssociatePackageRequest.new(domain_name: domain_name, package_id: package_id)
        associate_package(input)
      end

      def associate_package(input : Types::AssociatePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides access to an Amazon OpenSearch Service domain through the use of an interface VPC endpoint.

      def authorize_vpc_endpoint_access(
        account : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::AuthorizeVpcEndpointAccessRequest.new(account: account, domain_name: domain_name)
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

      # Cancels a scheduled service software update for an Amazon ES domain. You can only perform this
      # operation before the AutomatedUpdateDate and when the UpdateStatus is in the PENDING_UPDATE state.

      def cancel_elasticsearch_service_software_update(
        domain_name : String
      ) : Protocol::Request
        input = Types::CancelElasticsearchServiceSoftwareUpdateRequest.new(domain_name: domain_name)
        cancel_elasticsearch_service_software_update(input)
      end

      def cancel_elasticsearch_service_software_update(input : Types::CancelElasticsearchServiceSoftwareUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_ELASTICSEARCH_SERVICE_SOFTWARE_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Elasticsearch domain. For more information, see Creating Elasticsearch Domains in the
      # Amazon Elasticsearch Service Developer Guide .

      def create_elasticsearch_domain(
        domain_name : String,
        access_policies : String? = nil,
        advanced_options : Hash(String, String)? = nil,
        advanced_security_options : Types::AdvancedSecurityOptionsInput? = nil,
        auto_tune_options : Types::AutoTuneOptionsInput? = nil,
        cognito_options : Types::CognitoOptions? = nil,
        domain_endpoint_options : Types::DomainEndpointOptions? = nil,
        ebs_options : Types::EBSOptions? = nil,
        elasticsearch_cluster_config : Types::ElasticsearchClusterConfig? = nil,
        elasticsearch_version : String? = nil,
        encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
        log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
        node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
        snapshot_options : Types::SnapshotOptions? = nil,
        tag_list : Array(Types::Tag)? = nil,
        vpc_options : Types::VPCOptions? = nil
      ) : Protocol::Request
        input = Types::CreateElasticsearchDomainRequest.new(domain_name: domain_name, access_policies: access_policies, advanced_options: advanced_options, advanced_security_options: advanced_security_options, auto_tune_options: auto_tune_options, cognito_options: cognito_options, domain_endpoint_options: domain_endpoint_options, ebs_options: ebs_options, elasticsearch_cluster_config: elasticsearch_cluster_config, elasticsearch_version: elasticsearch_version, encryption_at_rest_options: encryption_at_rest_options, log_publishing_options: log_publishing_options, node_to_node_encryption_options: node_to_node_encryption_options, snapshot_options: snapshot_options, tag_list: tag_list, vpc_options: vpc_options)
        create_elasticsearch_domain(input)
      end

      def create_elasticsearch_domain(input : Types::CreateElasticsearchDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ELASTICSEARCH_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new cross-cluster search connection from a source domain to a destination domain.

      def create_outbound_cross_cluster_search_connection(
        connection_alias : String,
        destination_domain_info : Types::DomainInformation,
        source_domain_info : Types::DomainInformation
      ) : Protocol::Request
        input = Types::CreateOutboundCrossClusterSearchConnectionRequest.new(connection_alias: connection_alias, destination_domain_info: destination_domain_info, source_domain_info: source_domain_info)
        create_outbound_cross_cluster_search_connection(input)
      end

      def create_outbound_cross_cluster_search_connection(input : Types::CreateOutboundCrossClusterSearchConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_OUTBOUND_CROSS_CLUSTER_SEARCH_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a package for use with Amazon ES domains.

      def create_package(
        package_name : String,
        package_source : Types::PackageSource,
        package_type : String,
        package_description : String? = nil
      ) : Protocol::Request
        input = Types::CreatePackageRequest.new(package_name: package_name, package_source: package_source, package_type: package_type, package_description: package_description)
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

      # Permanently deletes the specified Elasticsearch domain and all of its data. Once a domain is
      # deleted, it cannot be recovered.

      def delete_elasticsearch_domain(
        domain_name : String
      ) : Protocol::Request
        input = Types::DeleteElasticsearchDomainRequest.new(domain_name: domain_name)
        delete_elasticsearch_domain(input)
      end

      def delete_elasticsearch_domain(input : Types::DeleteElasticsearchDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ELASTICSEARCH_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the service-linked role that Elasticsearch Service uses to manage and maintain VPC domains.
      # Role deletion will fail if any existing VPC domains use the role. You must delete any such
      # Elasticsearch domains before deleting the role. See Deleting Elasticsearch Service Role in VPC
      # Endpoints for Amazon Elasticsearch Service Domains .


      def delete_elasticsearch_service_role : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ELASTICSEARCH_SERVICE_ROLE, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the destination domain owner to delete an existing inbound cross-cluster search connection.

      def delete_inbound_cross_cluster_search_connection(
        cross_cluster_search_connection_id : String
      ) : Protocol::Request
        input = Types::DeleteInboundCrossClusterSearchConnectionRequest.new(cross_cluster_search_connection_id: cross_cluster_search_connection_id)
        delete_inbound_cross_cluster_search_connection(input)
      end

      def delete_inbound_cross_cluster_search_connection(input : Types::DeleteInboundCrossClusterSearchConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INBOUND_CROSS_CLUSTER_SEARCH_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the source domain owner to delete an existing outbound cross-cluster search connection.

      def delete_outbound_cross_cluster_search_connection(
        cross_cluster_search_connection_id : String
      ) : Protocol::Request
        input = Types::DeleteOutboundCrossClusterSearchConnectionRequest.new(cross_cluster_search_connection_id: cross_cluster_search_connection_id)
        delete_outbound_cross_cluster_search_connection(input)
      end

      def delete_outbound_cross_cluster_search_connection(input : Types::DeleteOutboundCrossClusterSearchConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OUTBOUND_CROSS_CLUSTER_SEARCH_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the package.

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

      # Provides scheduled Auto-Tune action details for the Elasticsearch domain, such as Auto-Tune action
      # type, description, severity, and scheduled date.

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

      # Returns information about the current blue/green deployment happening on a domain, including a
      # change ID, status, and progress stages.

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

      # Returns domain configuration information about the specified Elasticsearch domain, including the
      # domain ID, domain endpoint, and domain ARN.

      def describe_elasticsearch_domain(
        domain_name : String
      ) : Protocol::Request
        input = Types::DescribeElasticsearchDomainRequest.new(domain_name: domain_name)
        describe_elasticsearch_domain(input)
      end

      def describe_elasticsearch_domain(input : Types::DescribeElasticsearchDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ELASTICSEARCH_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides cluster configuration information about the specified Elasticsearch domain, such as the
      # state, creation date, update version, and update date for cluster options.

      def describe_elasticsearch_domain_config(
        domain_name : String
      ) : Protocol::Request
        input = Types::DescribeElasticsearchDomainConfigRequest.new(domain_name: domain_name)
        describe_elasticsearch_domain_config(input)
      end

      def describe_elasticsearch_domain_config(input : Types::DescribeElasticsearchDomainConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ELASTICSEARCH_DOMAIN_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns domain configuration information about the specified Elasticsearch domains, including the
      # domain ID, domain endpoint, and domain ARN.

      def describe_elasticsearch_domains(
        domain_names : Array(String)
      ) : Protocol::Request
        input = Types::DescribeElasticsearchDomainsRequest.new(domain_names: domain_names)
        describe_elasticsearch_domains(input)
      end

      def describe_elasticsearch_domains(input : Types::DescribeElasticsearchDomainsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ELASTICSEARCH_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe Elasticsearch Limits for a given InstanceType and ElasticsearchVersion. When modifying
      # existing Domain, specify the DomainName to know what Limits are supported for modifying.

      def describe_elasticsearch_instance_type_limits(
        elasticsearch_version : String,
        instance_type : String,
        domain_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeElasticsearchInstanceTypeLimitsRequest.new(elasticsearch_version: elasticsearch_version, instance_type: instance_type, domain_name: domain_name)
        describe_elasticsearch_instance_type_limits(input)
      end

      def describe_elasticsearch_instance_type_limits(input : Types::DescribeElasticsearchInstanceTypeLimitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ELASTICSEARCH_INSTANCE_TYPE_LIMITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the inbound cross-cluster search connections for a destination domain.

      def describe_inbound_cross_cluster_search_connections(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeInboundCrossClusterSearchConnectionsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_inbound_cross_cluster_search_connections(input)
      end

      def describe_inbound_cross_cluster_search_connections(input : Types::DescribeInboundCrossClusterSearchConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INBOUND_CROSS_CLUSTER_SEARCH_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the outbound cross-cluster search connections for a source domain.

      def describe_outbound_cross_cluster_search_connections(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeOutboundCrossClusterSearchConnectionsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_outbound_cross_cluster_search_connections(input)
      end

      def describe_outbound_cross_cluster_search_connections(input : Types::DescribeOutboundCrossClusterSearchConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_OUTBOUND_CROSS_CLUSTER_SEARCH_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes all packages available to Amazon ES. Includes options for filtering, limiting the number
      # of results, and pagination.

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

      # Lists available reserved Elasticsearch instance offerings.

      def describe_reserved_elasticsearch_instance_offerings(
        max_results : Int32? = nil,
        next_token : String? = nil,
        reserved_elasticsearch_instance_offering_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeReservedElasticsearchInstanceOfferingsRequest.new(max_results: max_results, next_token: next_token, reserved_elasticsearch_instance_offering_id: reserved_elasticsearch_instance_offering_id)
        describe_reserved_elasticsearch_instance_offerings(input)
      end

      def describe_reserved_elasticsearch_instance_offerings(input : Types::DescribeReservedElasticsearchInstanceOfferingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESERVED_ELASTICSEARCH_INSTANCE_OFFERINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about reserved Elasticsearch instances for this account.

      def describe_reserved_elasticsearch_instances(
        max_results : Int32? = nil,
        next_token : String? = nil,
        reserved_elasticsearch_instance_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeReservedElasticsearchInstancesRequest.new(max_results: max_results, next_token: next_token, reserved_elasticsearch_instance_id: reserved_elasticsearch_instance_id)
        describe_reserved_elasticsearch_instances(input)
      end

      def describe_reserved_elasticsearch_instances(input : Types::DescribeReservedElasticsearchInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESERVED_ELASTICSEARCH_INSTANCES, input, endpoint)
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

      # Dissociates a package from the Amazon ES domain.

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

      # Returns a list of upgrade compatible Elastisearch versions. You can optionally pass a DomainName to
      # get all upgrade compatible Elasticsearch versions for that specific domain.

      def get_compatible_elasticsearch_versions(
        domain_name : String? = nil
      ) : Protocol::Request
        input = Types::GetCompatibleElasticsearchVersionsRequest.new(domain_name: domain_name)
        get_compatible_elasticsearch_versions(input)
      end

      def get_compatible_elasticsearch_versions(input : Types::GetCompatibleElasticsearchVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPATIBLE_ELASTICSEARCH_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of versions of the package, along with their creation time and commit message.

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

      # Retrieves the complete history of the last 10 upgrades that were performed on the domain.

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

      # Retrieves the latest status of the last upgrade or upgrade eligibility check that was performed on
      # the domain.

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

      # Returns the name of all Elasticsearch domains owned by the current user's account.

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

      # Lists all Amazon ES domains associated with the package.

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

      # List all Elasticsearch instance types that are supported for given ElasticsearchVersion

      def list_elasticsearch_instance_types(
        elasticsearch_version : String,
        domain_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListElasticsearchInstanceTypesRequest.new(elasticsearch_version: elasticsearch_version, domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_elasticsearch_instance_types(input)
      end

      def list_elasticsearch_instance_types(input : Types::ListElasticsearchInstanceTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ELASTICSEARCH_INSTANCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all supported Elasticsearch versions

      def list_elasticsearch_versions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListElasticsearchVersionsRequest.new(max_results: max_results, next_token: next_token)
        list_elasticsearch_versions(input)
      end

      def list_elasticsearch_versions(input : Types::ListElasticsearchVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ELASTICSEARCH_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all packages associated with the Amazon ES domain.

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

      # Returns all tags for the given Elasticsearch domain.

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

      # Retrieves information about each principal that is allowed to access a given Amazon OpenSearch
      # Service domain through the use of an interface VPC endpoint.

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

      # Retrieves all Amazon OpenSearch Service-managed VPC endpoints in the current account and Region.

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

      # Allows you to purchase reserved Elasticsearch instances.

      def purchase_reserved_elasticsearch_instance_offering(
        reservation_name : String,
        reserved_elasticsearch_instance_offering_id : String,
        instance_count : Int32? = nil
      ) : Protocol::Request
        input = Types::PurchaseReservedElasticsearchInstanceOfferingRequest.new(reservation_name: reservation_name, reserved_elasticsearch_instance_offering_id: reserved_elasticsearch_instance_offering_id, instance_count: instance_count)
        purchase_reserved_elasticsearch_instance_offering(input)
      end

      def purchase_reserved_elasticsearch_instance_offering(input : Types::PurchaseReservedElasticsearchInstanceOfferingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PURCHASE_RESERVED_ELASTICSEARCH_INSTANCE_OFFERING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the destination domain owner to reject an inbound cross-cluster search connection request.

      def reject_inbound_cross_cluster_search_connection(
        cross_cluster_search_connection_id : String
      ) : Protocol::Request
        input = Types::RejectInboundCrossClusterSearchConnectionRequest.new(cross_cluster_search_connection_id: cross_cluster_search_connection_id)
        reject_inbound_cross_cluster_search_connection(input)
      end

      def reject_inbound_cross_cluster_search_connection(input : Types::RejectInboundCrossClusterSearchConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_INBOUND_CROSS_CLUSTER_SEARCH_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified set of tags from the specified Elasticsearch domain.

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
        account : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::RevokeVpcEndpointAccessRequest.new(account: account, domain_name: domain_name)
        revoke_vpc_endpoint_access(input)
      end

      def revoke_vpc_endpoint_access(input : Types::RevokeVpcEndpointAccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_VPC_ENDPOINT_ACCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Schedules a service software update for an Amazon ES domain.

      def start_elasticsearch_service_software_update(
        domain_name : String
      ) : Protocol::Request
        input = Types::StartElasticsearchServiceSoftwareUpdateRequest.new(domain_name: domain_name)
        start_elasticsearch_service_software_update(input)
      end

      def start_elasticsearch_service_software_update(input : Types::StartElasticsearchServiceSoftwareUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ELASTICSEARCH_SERVICE_SOFTWARE_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the cluster configuration of the specified Elasticsearch domain, setting as setting the
      # instance type and the number of instances.

      def update_elasticsearch_domain_config(
        domain_name : String,
        access_policies : String? = nil,
        advanced_options : Hash(String, String)? = nil,
        advanced_security_options : Types::AdvancedSecurityOptionsInput? = nil,
        auto_tune_options : Types::AutoTuneOptions? = nil,
        cognito_options : Types::CognitoOptions? = nil,
        domain_endpoint_options : Types::DomainEndpointOptions? = nil,
        dry_run : Bool? = nil,
        ebs_options : Types::EBSOptions? = nil,
        elasticsearch_cluster_config : Types::ElasticsearchClusterConfig? = nil,
        encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
        log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
        node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
        snapshot_options : Types::SnapshotOptions? = nil,
        vpc_options : Types::VPCOptions? = nil
      ) : Protocol::Request
        input = Types::UpdateElasticsearchDomainConfigRequest.new(domain_name: domain_name, access_policies: access_policies, advanced_options: advanced_options, advanced_security_options: advanced_security_options, auto_tune_options: auto_tune_options, cognito_options: cognito_options, domain_endpoint_options: domain_endpoint_options, dry_run: dry_run, ebs_options: ebs_options, elasticsearch_cluster_config: elasticsearch_cluster_config, encryption_at_rest_options: encryption_at_rest_options, log_publishing_options: log_publishing_options, node_to_node_encryption_options: node_to_node_encryption_options, snapshot_options: snapshot_options, vpc_options: vpc_options)
        update_elasticsearch_domain_config(input)
      end

      def update_elasticsearch_domain_config(input : Types::UpdateElasticsearchDomainConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ELASTICSEARCH_DOMAIN_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a package for use with Amazon ES domains.

      def update_package(
        package_id : String,
        package_source : Types::PackageSource,
        commit_message : String? = nil,
        package_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePackageRequest.new(package_id: package_id, package_source: package_source, commit_message: commit_message, package_description: package_description)
        update_package(input)
      end

      def update_package(input : Types::UpdatePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGE, input, endpoint)
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

      # Allows you to either upgrade your domain or perform an Upgrade eligibility check to a compatible
      # Elasticsearch version.

      def upgrade_elasticsearch_domain(
        domain_name : String,
        target_version : String,
        perform_check_only : Bool? = nil
      ) : Protocol::Request
        input = Types::UpgradeElasticsearchDomainRequest.new(domain_name: domain_name, target_version: target_version, perform_check_only: perform_check_only)
        upgrade_elasticsearch_domain(input)
      end

      def upgrade_elasticsearch_domain(input : Types::UpgradeElasticsearchDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPGRADE_ELASTICSEARCH_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
