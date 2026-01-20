module Aws
  module Odb
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Registers the Amazon Web Services Marketplace token for your Amazon Web Services account to activate
      # your Oracle Database@Amazon Web Services subscription.

      def accept_marketplace_registration(
        marketplace_registration_token : String
      ) : Types::AcceptMarketplaceRegistrationOutput

        input = Types::AcceptMarketplaceRegistrationInput.new(marketplace_registration_token: marketplace_registration_token)
        accept_marketplace_registration(input)
      end

      def accept_marketplace_registration(input : Types::AcceptMarketplaceRegistrationInput) : Types::AcceptMarketplaceRegistrationOutput
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_MARKETPLACE_REGISTRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptMarketplaceRegistrationOutput, "AcceptMarketplaceRegistration")
      end

      # Associates an Amazon Web Services Identity and Access Management (IAM) service role with a specified
      # resource to enable Amazon Web Services service integration.

      def associate_iam_role_to_resource(
        aws_integration : String,
        iam_role_arn : String,
        resource_arn : String
      ) : Types::AssociateIamRoleToResourceOutput

        input = Types::AssociateIamRoleToResourceInput.new(aws_integration: aws_integration, iam_role_arn: iam_role_arn, resource_arn: resource_arn)
        associate_iam_role_to_resource(input)
      end

      def associate_iam_role_to_resource(input : Types::AssociateIamRoleToResourceInput) : Types::AssociateIamRoleToResourceOutput
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_IAM_ROLE_TO_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateIamRoleToResourceOutput, "AssociateIamRoleToResource")
      end

      # Creates a new Autonomous VM cluster in the specified Exadata infrastructure.

      def create_cloud_autonomous_vm_cluster(
        autonomous_data_storage_size_in_t_bs : Float64,
        cloud_exadata_infrastructure_id : String,
        cpu_core_count_per_node : Int32,
        display_name : String,
        memory_per_oracle_compute_unit_in_g_bs : Int32,
        odb_network_id : String,
        total_container_databases : Int32,
        client_token : String? = nil,
        db_servers : Array(String)? = nil,
        description : String? = nil,
        is_mtls_enabled_vm_cluster : Bool? = nil,
        license_model : String? = nil,
        maintenance_window : Types::MaintenanceWindow? = nil,
        scan_listener_port_non_tls : Int32? = nil,
        scan_listener_port_tls : Int32? = nil,
        tags : Hash(String, String)? = nil,
        time_zone : String? = nil
      ) : Types::CreateCloudAutonomousVmClusterOutput

        input = Types::CreateCloudAutonomousVmClusterInput.new(autonomous_data_storage_size_in_t_bs: autonomous_data_storage_size_in_t_bs, cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id, cpu_core_count_per_node: cpu_core_count_per_node, display_name: display_name, memory_per_oracle_compute_unit_in_g_bs: memory_per_oracle_compute_unit_in_g_bs, odb_network_id: odb_network_id, total_container_databases: total_container_databases, client_token: client_token, db_servers: db_servers, description: description, is_mtls_enabled_vm_cluster: is_mtls_enabled_vm_cluster, license_model: license_model, maintenance_window: maintenance_window, scan_listener_port_non_tls: scan_listener_port_non_tls, scan_listener_port_tls: scan_listener_port_tls, tags: tags, time_zone: time_zone)
        create_cloud_autonomous_vm_cluster(input)
      end

      def create_cloud_autonomous_vm_cluster(input : Types::CreateCloudAutonomousVmClusterInput) : Types::CreateCloudAutonomousVmClusterOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLOUD_AUTONOMOUS_VM_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCloudAutonomousVmClusterOutput, "CreateCloudAutonomousVmCluster")
      end

      # Creates an Exadata infrastructure.

      def create_cloud_exadata_infrastructure(
        compute_count : Int32,
        display_name : String,
        shape : String,
        storage_count : Int32,
        availability_zone : String? = nil,
        availability_zone_id : String? = nil,
        client_token : String? = nil,
        customer_contacts_to_send_to_oci : Array(Types::CustomerContact)? = nil,
        database_server_type : String? = nil,
        maintenance_window : Types::MaintenanceWindow? = nil,
        storage_server_type : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateCloudExadataInfrastructureOutput

        input = Types::CreateCloudExadataInfrastructureInput.new(compute_count: compute_count, display_name: display_name, shape: shape, storage_count: storage_count, availability_zone: availability_zone, availability_zone_id: availability_zone_id, client_token: client_token, customer_contacts_to_send_to_oci: customer_contacts_to_send_to_oci, database_server_type: database_server_type, maintenance_window: maintenance_window, storage_server_type: storage_server_type, tags: tags)
        create_cloud_exadata_infrastructure(input)
      end

      def create_cloud_exadata_infrastructure(input : Types::CreateCloudExadataInfrastructureInput) : Types::CreateCloudExadataInfrastructureOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLOUD_EXADATA_INFRASTRUCTURE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCloudExadataInfrastructureOutput, "CreateCloudExadataInfrastructure")
      end

      # Creates a VM cluster on the specified Exadata infrastructure.

      def create_cloud_vm_cluster(
        cloud_exadata_infrastructure_id : String,
        cpu_core_count : Int32,
        display_name : String,
        gi_version : String,
        hostname : String,
        odb_network_id : String,
        ssh_public_keys : Array(String),
        client_token : String? = nil,
        cluster_name : String? = nil,
        data_collection_options : Types::DataCollectionOptions? = nil,
        data_storage_size_in_t_bs : Float64? = nil,
        db_node_storage_size_in_g_bs : Int32? = nil,
        db_servers : Array(String)? = nil,
        is_local_backup_enabled : Bool? = nil,
        is_sparse_diskgroup_enabled : Bool? = nil,
        license_model : String? = nil,
        memory_size_in_g_bs : Int32? = nil,
        scan_listener_port_tcp : Int32? = nil,
        system_version : String? = nil,
        tags : Hash(String, String)? = nil,
        time_zone : String? = nil
      ) : Types::CreateCloudVmClusterOutput

        input = Types::CreateCloudVmClusterInput.new(cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id, cpu_core_count: cpu_core_count, display_name: display_name, gi_version: gi_version, hostname: hostname, odb_network_id: odb_network_id, ssh_public_keys: ssh_public_keys, client_token: client_token, cluster_name: cluster_name, data_collection_options: data_collection_options, data_storage_size_in_t_bs: data_storage_size_in_t_bs, db_node_storage_size_in_g_bs: db_node_storage_size_in_g_bs, db_servers: db_servers, is_local_backup_enabled: is_local_backup_enabled, is_sparse_diskgroup_enabled: is_sparse_diskgroup_enabled, license_model: license_model, memory_size_in_g_bs: memory_size_in_g_bs, scan_listener_port_tcp: scan_listener_port_tcp, system_version: system_version, tags: tags, time_zone: time_zone)
        create_cloud_vm_cluster(input)
      end

      def create_cloud_vm_cluster(input : Types::CreateCloudVmClusterInput) : Types::CreateCloudVmClusterOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLOUD_VM_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCloudVmClusterOutput, "CreateCloudVmCluster")
      end

      # Creates an ODB network.

      def create_odb_network(
        client_subnet_cidr : String,
        display_name : String,
        availability_zone : String? = nil,
        availability_zone_id : String? = nil,
        backup_subnet_cidr : String? = nil,
        client_token : String? = nil,
        cross_region_s3_restore_sources_to_enable : Array(String)? = nil,
        custom_domain_name : String? = nil,
        default_dns_prefix : String? = nil,
        kms_access : String? = nil,
        kms_policy_document : String? = nil,
        s3_access : String? = nil,
        s3_policy_document : String? = nil,
        sts_access : String? = nil,
        sts_policy_document : String? = nil,
        tags : Hash(String, String)? = nil,
        zero_etl_access : String? = nil
      ) : Types::CreateOdbNetworkOutput

        input = Types::CreateOdbNetworkInput.new(client_subnet_cidr: client_subnet_cidr, display_name: display_name, availability_zone: availability_zone, availability_zone_id: availability_zone_id, backup_subnet_cidr: backup_subnet_cidr, client_token: client_token, cross_region_s3_restore_sources_to_enable: cross_region_s3_restore_sources_to_enable, custom_domain_name: custom_domain_name, default_dns_prefix: default_dns_prefix, kms_access: kms_access, kms_policy_document: kms_policy_document, s3_access: s3_access, s3_policy_document: s3_policy_document, sts_access: sts_access, sts_policy_document: sts_policy_document, tags: tags, zero_etl_access: zero_etl_access)
        create_odb_network(input)
      end

      def create_odb_network(input : Types::CreateOdbNetworkInput) : Types::CreateOdbNetworkOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ODB_NETWORK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOdbNetworkOutput, "CreateOdbNetwork")
      end

      # Creates a peering connection between an ODB network and a VPC. A peering connection enables private
      # connectivity between the networks for application-tier communication.

      def create_odb_peering_connection(
        odb_network_id : String,
        peer_network_id : String,
        client_token : String? = nil,
        display_name : String? = nil,
        peer_network_cidrs_to_be_added : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateOdbPeeringConnectionOutput

        input = Types::CreateOdbPeeringConnectionInput.new(odb_network_id: odb_network_id, peer_network_id: peer_network_id, client_token: client_token, display_name: display_name, peer_network_cidrs_to_be_added: peer_network_cidrs_to_be_added, tags: tags)
        create_odb_peering_connection(input)
      end

      def create_odb_peering_connection(input : Types::CreateOdbPeeringConnectionInput) : Types::CreateOdbPeeringConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ODB_PEERING_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOdbPeeringConnectionOutput, "CreateOdbPeeringConnection")
      end

      # Deletes an Autonomous VM cluster.

      def delete_cloud_autonomous_vm_cluster(
        cloud_autonomous_vm_cluster_id : String
      ) : Types::DeleteCloudAutonomousVmClusterOutput

        input = Types::DeleteCloudAutonomousVmClusterInput.new(cloud_autonomous_vm_cluster_id: cloud_autonomous_vm_cluster_id)
        delete_cloud_autonomous_vm_cluster(input)
      end

      def delete_cloud_autonomous_vm_cluster(input : Types::DeleteCloudAutonomousVmClusterInput) : Types::DeleteCloudAutonomousVmClusterOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLOUD_AUTONOMOUS_VM_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCloudAutonomousVmClusterOutput, "DeleteCloudAutonomousVmCluster")
      end

      # Deletes the specified Exadata infrastructure. Before you use this operation, make sure to delete all
      # of the VM clusters that are hosted on this Exadata infrastructure.

      def delete_cloud_exadata_infrastructure(
        cloud_exadata_infrastructure_id : String
      ) : Types::DeleteCloudExadataInfrastructureOutput

        input = Types::DeleteCloudExadataInfrastructureInput.new(cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id)
        delete_cloud_exadata_infrastructure(input)
      end

      def delete_cloud_exadata_infrastructure(input : Types::DeleteCloudExadataInfrastructureInput) : Types::DeleteCloudExadataInfrastructureOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLOUD_EXADATA_INFRASTRUCTURE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCloudExadataInfrastructureOutput, "DeleteCloudExadataInfrastructure")
      end

      # Deletes the specified VM cluster.

      def delete_cloud_vm_cluster(
        cloud_vm_cluster_id : String
      ) : Types::DeleteCloudVmClusterOutput

        input = Types::DeleteCloudVmClusterInput.new(cloud_vm_cluster_id: cloud_vm_cluster_id)
        delete_cloud_vm_cluster(input)
      end

      def delete_cloud_vm_cluster(input : Types::DeleteCloudVmClusterInput) : Types::DeleteCloudVmClusterOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLOUD_VM_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCloudVmClusterOutput, "DeleteCloudVmCluster")
      end

      # Deletes the specified ODB network.

      def delete_odb_network(
        delete_associated_resources : Bool,
        odb_network_id : String
      ) : Types::DeleteOdbNetworkOutput

        input = Types::DeleteOdbNetworkInput.new(delete_associated_resources: delete_associated_resources, odb_network_id: odb_network_id)
        delete_odb_network(input)
      end

      def delete_odb_network(input : Types::DeleteOdbNetworkInput) : Types::DeleteOdbNetworkOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_ODB_NETWORK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteOdbNetworkOutput, "DeleteOdbNetwork")
      end

      # Deletes an ODB peering connection. When you delete an ODB peering connection, the underlying VPC
      # peering connection is also deleted.

      def delete_odb_peering_connection(
        odb_peering_connection_id : String
      ) : Types::DeleteOdbPeeringConnectionOutput

        input = Types::DeleteOdbPeeringConnectionInput.new(odb_peering_connection_id: odb_peering_connection_id)
        delete_odb_peering_connection(input)
      end

      def delete_odb_peering_connection(input : Types::DeleteOdbPeeringConnectionInput) : Types::DeleteOdbPeeringConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_ODB_PEERING_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteOdbPeeringConnectionOutput, "DeleteOdbPeeringConnection")
      end

      # Disassociates an Amazon Web Services Identity and Access Management (IAM) service role from a
      # specified resource to disable Amazon Web Services service integration.

      def disassociate_iam_role_from_resource(
        aws_integration : String,
        iam_role_arn : String,
        resource_arn : String
      ) : Types::DisassociateIamRoleFromResourceOutput

        input = Types::DisassociateIamRoleFromResourceInput.new(aws_integration: aws_integration, iam_role_arn: iam_role_arn, resource_arn: resource_arn)
        disassociate_iam_role_from_resource(input)
      end

      def disassociate_iam_role_from_resource(input : Types::DisassociateIamRoleFromResourceInput) : Types::DisassociateIamRoleFromResourceOutput
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_IAM_ROLE_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateIamRoleFromResourceOutput, "DisassociateIamRoleFromResource")
      end

      # Gets information about a specific Autonomous VM cluster.

      def get_cloud_autonomous_vm_cluster(
        cloud_autonomous_vm_cluster_id : String
      ) : Types::GetCloudAutonomousVmClusterOutput

        input = Types::GetCloudAutonomousVmClusterInput.new(cloud_autonomous_vm_cluster_id: cloud_autonomous_vm_cluster_id)
        get_cloud_autonomous_vm_cluster(input)
      end

      def get_cloud_autonomous_vm_cluster(input : Types::GetCloudAutonomousVmClusterInput) : Types::GetCloudAutonomousVmClusterOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CLOUD_AUTONOMOUS_VM_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCloudAutonomousVmClusterOutput, "GetCloudAutonomousVmCluster")
      end

      # Returns information about the specified Exadata infrastructure.

      def get_cloud_exadata_infrastructure(
        cloud_exadata_infrastructure_id : String
      ) : Types::GetCloudExadataInfrastructureOutput

        input = Types::GetCloudExadataInfrastructureInput.new(cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id)
        get_cloud_exadata_infrastructure(input)
      end

      def get_cloud_exadata_infrastructure(input : Types::GetCloudExadataInfrastructureInput) : Types::GetCloudExadataInfrastructureOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CLOUD_EXADATA_INFRASTRUCTURE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCloudExadataInfrastructureOutput, "GetCloudExadataInfrastructure")
      end

      # Retrieves information about unallocated resources in a specified Cloud Exadata Infrastructure.

      def get_cloud_exadata_infrastructure_unallocated_resources(
        cloud_exadata_infrastructure_id : String,
        db_servers : Array(String)? = nil
      ) : Types::GetCloudExadataInfrastructureUnallocatedResourcesOutput

        input = Types::GetCloudExadataInfrastructureUnallocatedResourcesInput.new(cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id, db_servers: db_servers)
        get_cloud_exadata_infrastructure_unallocated_resources(input)
      end

      def get_cloud_exadata_infrastructure_unallocated_resources(input : Types::GetCloudExadataInfrastructureUnallocatedResourcesInput) : Types::GetCloudExadataInfrastructureUnallocatedResourcesOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CLOUD_EXADATA_INFRASTRUCTURE_UNALLOCATED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCloudExadataInfrastructureUnallocatedResourcesOutput, "GetCloudExadataInfrastructureUnallocatedResources")
      end

      # Returns information about the specified VM cluster.

      def get_cloud_vm_cluster(
        cloud_vm_cluster_id : String
      ) : Types::GetCloudVmClusterOutput

        input = Types::GetCloudVmClusterInput.new(cloud_vm_cluster_id: cloud_vm_cluster_id)
        get_cloud_vm_cluster(input)
      end

      def get_cloud_vm_cluster(input : Types::GetCloudVmClusterInput) : Types::GetCloudVmClusterOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CLOUD_VM_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCloudVmClusterOutput, "GetCloudVmCluster")
      end

      # Returns information about the specified DB node.

      def get_db_node(
        cloud_vm_cluster_id : String,
        db_node_id : String
      ) : Types::GetDbNodeOutput

        input = Types::GetDbNodeInput.new(cloud_vm_cluster_id: cloud_vm_cluster_id, db_node_id: db_node_id)
        get_db_node(input)
      end

      def get_db_node(input : Types::GetDbNodeInput) : Types::GetDbNodeOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DB_NODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDbNodeOutput, "GetDbNode")
      end

      # Returns information about the specified database server.

      def get_db_server(
        cloud_exadata_infrastructure_id : String,
        db_server_id : String
      ) : Types::GetDbServerOutput

        input = Types::GetDbServerInput.new(cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id, db_server_id: db_server_id)
        get_db_server(input)
      end

      def get_db_server(input : Types::GetDbServerInput) : Types::GetDbServerOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DB_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDbServerOutput, "GetDbServer")
      end

      # Returns the tenancy activation link and onboarding status for your Amazon Web Services account.

      def get_oci_onboarding_status : Types::GetOciOnboardingStatusOutput
        input = Types::GetOciOnboardingStatusInput.new
        get_oci_onboarding_status(input)
      end

      def get_oci_onboarding_status(input : Types::GetOciOnboardingStatusInput) : Types::GetOciOnboardingStatusOutput
        request = Protocol::JsonRpc.build_request(Model::GET_OCI_ONBOARDING_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOciOnboardingStatusOutput, "GetOciOnboardingStatus")
      end

      # Returns information about the specified ODB network.

      def get_odb_network(
        odb_network_id : String
      ) : Types::GetOdbNetworkOutput

        input = Types::GetOdbNetworkInput.new(odb_network_id: odb_network_id)
        get_odb_network(input)
      end

      def get_odb_network(input : Types::GetOdbNetworkInput) : Types::GetOdbNetworkOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ODB_NETWORK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOdbNetworkOutput, "GetOdbNetwork")
      end

      # Retrieves information about an ODB peering connection.

      def get_odb_peering_connection(
        odb_peering_connection_id : String
      ) : Types::GetOdbPeeringConnectionOutput

        input = Types::GetOdbPeeringConnectionInput.new(odb_peering_connection_id: odb_peering_connection_id)
        get_odb_peering_connection(input)
      end

      def get_odb_peering_connection(input : Types::GetOdbPeeringConnectionInput) : Types::GetOdbPeeringConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ODB_PEERING_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOdbPeeringConnectionOutput, "GetOdbPeeringConnection")
      end

      # Initializes the ODB service for the first time in an account.

      def initialize_service(
        oci_identity_domain : Bool? = nil
      ) : Types::InitializeServiceOutput

        input = Types::InitializeServiceInput.new(oci_identity_domain: oci_identity_domain)
        initialize_service(input)
      end

      def initialize_service(input : Types::InitializeServiceInput) : Types::InitializeServiceOutput
        request = Protocol::JsonRpc.build_request(Model::INITIALIZE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InitializeServiceOutput, "InitializeService")
      end

      # Lists all Autonomous VMs in an Autonomous VM cluster.

      def list_autonomous_virtual_machines(
        cloud_autonomous_vm_cluster_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAutonomousVirtualMachinesOutput

        input = Types::ListAutonomousVirtualMachinesInput.new(cloud_autonomous_vm_cluster_id: cloud_autonomous_vm_cluster_id, max_results: max_results, next_token: next_token)
        list_autonomous_virtual_machines(input)
      end

      def list_autonomous_virtual_machines(input : Types::ListAutonomousVirtualMachinesInput) : Types::ListAutonomousVirtualMachinesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTONOMOUS_VIRTUAL_MACHINES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutonomousVirtualMachinesOutput, "ListAutonomousVirtualMachines")
      end

      # Lists all Autonomous VM clusters in a specified Cloud Exadata infrastructure.

      def list_cloud_autonomous_vm_clusters(
        cloud_exadata_infrastructure_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCloudAutonomousVmClustersOutput

        input = Types::ListCloudAutonomousVmClustersInput.new(cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id, max_results: max_results, next_token: next_token)
        list_cloud_autonomous_vm_clusters(input)
      end

      def list_cloud_autonomous_vm_clusters(input : Types::ListCloudAutonomousVmClustersInput) : Types::ListCloudAutonomousVmClustersOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CLOUD_AUTONOMOUS_VM_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCloudAutonomousVmClustersOutput, "ListCloudAutonomousVmClusters")
      end

      # Returns information about the Exadata infrastructures owned by your Amazon Web Services account.

      def list_cloud_exadata_infrastructures(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCloudExadataInfrastructuresOutput

        input = Types::ListCloudExadataInfrastructuresInput.new(max_results: max_results, next_token: next_token)
        list_cloud_exadata_infrastructures(input)
      end

      def list_cloud_exadata_infrastructures(input : Types::ListCloudExadataInfrastructuresInput) : Types::ListCloudExadataInfrastructuresOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CLOUD_EXADATA_INFRASTRUCTURES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCloudExadataInfrastructuresOutput, "ListCloudExadataInfrastructures")
      end

      # Returns information about the VM clusters owned by your Amazon Web Services account or only the ones
      # on the specified Exadata infrastructure.

      def list_cloud_vm_clusters(
        cloud_exadata_infrastructure_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCloudVmClustersOutput

        input = Types::ListCloudVmClustersInput.new(cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id, max_results: max_results, next_token: next_token)
        list_cloud_vm_clusters(input)
      end

      def list_cloud_vm_clusters(input : Types::ListCloudVmClustersInput) : Types::ListCloudVmClustersOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CLOUD_VM_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCloudVmClustersOutput, "ListCloudVmClusters")
      end

      # Returns information about the DB nodes for the specified VM cluster.

      def list_db_nodes(
        cloud_vm_cluster_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDbNodesOutput

        input = Types::ListDbNodesInput.new(cloud_vm_cluster_id: cloud_vm_cluster_id, max_results: max_results, next_token: next_token)
        list_db_nodes(input)
      end

      def list_db_nodes(input : Types::ListDbNodesInput) : Types::ListDbNodesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DB_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDbNodesOutput, "ListDbNodes")
      end

      # Returns information about the database servers that belong to the specified Exadata infrastructure.

      def list_db_servers(
        cloud_exadata_infrastructure_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDbServersOutput

        input = Types::ListDbServersInput.new(cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id, max_results: max_results, next_token: next_token)
        list_db_servers(input)
      end

      def list_db_servers(input : Types::ListDbServersInput) : Types::ListDbServersOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DB_SERVERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDbServersOutput, "ListDbServers")
      end

      # Returns information about the shapes that are available for an Exadata infrastructure.

      def list_db_system_shapes(
        availability_zone : String? = nil,
        availability_zone_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDbSystemShapesOutput

        input = Types::ListDbSystemShapesInput.new(availability_zone: availability_zone, availability_zone_id: availability_zone_id, max_results: max_results, next_token: next_token)
        list_db_system_shapes(input)
      end

      def list_db_system_shapes(input : Types::ListDbSystemShapesInput) : Types::ListDbSystemShapesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DB_SYSTEM_SHAPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDbSystemShapesOutput, "ListDbSystemShapes")
      end

      # Returns information about Oracle Grid Infrastructure (GI) software versions that are available for a
      # VM cluster for the specified shape.

      def list_gi_versions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        shape : String? = nil
      ) : Types::ListGiVersionsOutput

        input = Types::ListGiVersionsInput.new(max_results: max_results, next_token: next_token, shape: shape)
        list_gi_versions(input)
      end

      def list_gi_versions(input : Types::ListGiVersionsInput) : Types::ListGiVersionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_GI_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGiVersionsOutput, "ListGiVersions")
      end

      # Returns information about the ODB networks owned by your Amazon Web Services account.

      def list_odb_networks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListOdbNetworksOutput

        input = Types::ListOdbNetworksInput.new(max_results: max_results, next_token: next_token)
        list_odb_networks(input)
      end

      def list_odb_networks(input : Types::ListOdbNetworksInput) : Types::ListOdbNetworksOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ODB_NETWORKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOdbNetworksOutput, "ListOdbNetworks")
      end

      # Lists all ODB peering connections or those associated with a specific ODB network.

      def list_odb_peering_connections(
        max_results : Int32? = nil,
        next_token : String? = nil,
        odb_network_id : String? = nil
      ) : Types::ListOdbPeeringConnectionsOutput

        input = Types::ListOdbPeeringConnectionsInput.new(max_results: max_results, next_token: next_token, odb_network_id: odb_network_id)
        list_odb_peering_connections(input)
      end

      def list_odb_peering_connections(input : Types::ListOdbPeeringConnectionsInput) : Types::ListOdbPeeringConnectionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ODB_PEERING_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOdbPeeringConnectionsOutput, "ListOdbPeeringConnections")
      end

      # Returns information about the system versions that are available for a VM cluster for the specified
      # giVersion and shape .

      def list_system_versions(
        gi_version : String,
        shape : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSystemVersionsOutput

        input = Types::ListSystemVersionsInput.new(gi_version: gi_version, shape: shape, max_results: max_results, next_token: next_token)
        list_system_versions(input)
      end

      def list_system_versions(input : Types::ListSystemVersionsInput) : Types::ListSystemVersionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SYSTEM_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSystemVersionsOutput, "ListSystemVersions")
      end

      # Returns information about the tags applied to this resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Reboots the specified DB node in a VM cluster.

      def reboot_db_node(
        cloud_vm_cluster_id : String,
        db_node_id : String
      ) : Types::RebootDbNodeOutput

        input = Types::RebootDbNodeInput.new(cloud_vm_cluster_id: cloud_vm_cluster_id, db_node_id: db_node_id)
        reboot_db_node(input)
      end

      def reboot_db_node(input : Types::RebootDbNodeInput) : Types::RebootDbNodeOutput
        request = Protocol::JsonRpc.build_request(Model::REBOOT_DB_NODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RebootDbNodeOutput, "RebootDbNode")
      end

      # Starts the specified DB node in a VM cluster.

      def start_db_node(
        cloud_vm_cluster_id : String,
        db_node_id : String
      ) : Types::StartDbNodeOutput

        input = Types::StartDbNodeInput.new(cloud_vm_cluster_id: cloud_vm_cluster_id, db_node_id: db_node_id)
        start_db_node(input)
      end

      def start_db_node(input : Types::StartDbNodeInput) : Types::StartDbNodeOutput
        request = Protocol::JsonRpc.build_request(Model::START_DB_NODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDbNodeOutput, "StartDbNode")
      end

      # Stops the specified DB node in a VM cluster.

      def stop_db_node(
        cloud_vm_cluster_id : String,
        db_node_id : String
      ) : Types::StopDbNodeOutput

        input = Types::StopDbNodeInput.new(cloud_vm_cluster_id: cloud_vm_cluster_id, db_node_id: db_node_id)
        stop_db_node(input)
      end

      def stop_db_node(input : Types::StopDbNodeInput) : Types::StopDbNodeOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_DB_NODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopDbNodeOutput, "StopDbNode")
      end

      # Applies tags to the specified resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes tags from the specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates the properties of an Exadata infrastructure resource.

      def update_cloud_exadata_infrastructure(
        cloud_exadata_infrastructure_id : String,
        maintenance_window : Types::MaintenanceWindow? = nil
      ) : Types::UpdateCloudExadataInfrastructureOutput

        input = Types::UpdateCloudExadataInfrastructureInput.new(cloud_exadata_infrastructure_id: cloud_exadata_infrastructure_id, maintenance_window: maintenance_window)
        update_cloud_exadata_infrastructure(input)
      end

      def update_cloud_exadata_infrastructure(input : Types::UpdateCloudExadataInfrastructureInput) : Types::UpdateCloudExadataInfrastructureOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLOUD_EXADATA_INFRASTRUCTURE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCloudExadataInfrastructureOutput, "UpdateCloudExadataInfrastructure")
      end

      # Updates properties of a specified ODB network.

      def update_odb_network(
        odb_network_id : String,
        cross_region_s3_restore_sources_to_disable : Array(String)? = nil,
        cross_region_s3_restore_sources_to_enable : Array(String)? = nil,
        display_name : String? = nil,
        kms_access : String? = nil,
        kms_policy_document : String? = nil,
        peered_cidrs_to_be_added : Array(String)? = nil,
        peered_cidrs_to_be_removed : Array(String)? = nil,
        s3_access : String? = nil,
        s3_policy_document : String? = nil,
        sts_access : String? = nil,
        sts_policy_document : String? = nil,
        zero_etl_access : String? = nil
      ) : Types::UpdateOdbNetworkOutput

        input = Types::UpdateOdbNetworkInput.new(odb_network_id: odb_network_id, cross_region_s3_restore_sources_to_disable: cross_region_s3_restore_sources_to_disable, cross_region_s3_restore_sources_to_enable: cross_region_s3_restore_sources_to_enable, display_name: display_name, kms_access: kms_access, kms_policy_document: kms_policy_document, peered_cidrs_to_be_added: peered_cidrs_to_be_added, peered_cidrs_to_be_removed: peered_cidrs_to_be_removed, s3_access: s3_access, s3_policy_document: s3_policy_document, sts_access: sts_access, sts_policy_document: sts_policy_document, zero_etl_access: zero_etl_access)
        update_odb_network(input)
      end

      def update_odb_network(input : Types::UpdateOdbNetworkInput) : Types::UpdateOdbNetworkOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ODB_NETWORK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateOdbNetworkOutput, "UpdateOdbNetwork")
      end

      # Modifies the settings of an Oracle Database@Amazon Web Services peering connection. You can update
      # the display name and add or remove CIDR blocks from the peering connection.

      def update_odb_peering_connection(
        odb_peering_connection_id : String,
        display_name : String? = nil,
        peer_network_cidrs_to_be_added : Array(String)? = nil,
        peer_network_cidrs_to_be_removed : Array(String)? = nil
      ) : Types::UpdateOdbPeeringConnectionOutput

        input = Types::UpdateOdbPeeringConnectionInput.new(odb_peering_connection_id: odb_peering_connection_id, display_name: display_name, peer_network_cidrs_to_be_added: peer_network_cidrs_to_be_added, peer_network_cidrs_to_be_removed: peer_network_cidrs_to_be_removed)
        update_odb_peering_connection(input)
      end

      def update_odb_peering_connection(input : Types::UpdateOdbPeeringConnectionInput) : Types::UpdateOdbPeeringConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ODB_PEERING_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateOdbPeeringConnectionOutput, "UpdateOdbPeeringConnection")
      end
    end
  end
end
