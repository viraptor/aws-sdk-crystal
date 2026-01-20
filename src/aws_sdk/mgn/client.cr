module AwsSdk
  module Mgn
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

      # Archive application.

      def archive_application(
        application_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::ArchiveApplicationRequest.new(application_id: application_id, account_id: account_id)
        archive_application(input)
      end

      def archive_application(input : Types::ArchiveApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ARCHIVE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Archive wave.

      def archive_wave(
        wave_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::ArchiveWaveRequest.new(wave_id: wave_id, account_id: account_id)
        archive_wave(input)
      end

      def archive_wave(input : Types::ArchiveWaveRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ARCHIVE_WAVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate applications to wave.

      def associate_applications(
        application_i_ds : Array(String),
        wave_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::AssociateApplicationsRequest.new(application_i_ds: application_i_ds, wave_id: wave_id, account_id: account_id)
        associate_applications(input)
      end

      def associate_applications(input : Types::AssociateApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate source servers to application.

      def associate_source_servers(
        application_id : String,
        source_server_i_ds : Array(String),
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::AssociateSourceServersRequest.new(application_id: application_id, source_server_i_ds: source_server_i_ds, account_id: account_id)
        associate_source_servers(input)
      end

      def associate_source_servers(input : Types::AssociateSourceServersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SOURCE_SERVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the user to set the SourceServer.LifeCycle.state property for specific Source Server IDs to
      # one of the following: READY_FOR_TEST or READY_FOR_CUTOVER. This command only works if the Source
      # Server is already launchable (dataReplicationInfo.lagDuration is not null.)

      def change_server_life_cycle_state(
        life_cycle : Types::ChangeServerLifeCycleStateSourceServerLifecycle,
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::ChangeServerLifeCycleStateRequest.new(life_cycle: life_cycle, source_server_id: source_server_id, account_id: account_id)
        change_server_life_cycle_state(input)
      end

      def change_server_life_cycle_state(input : Types::ChangeServerLifeCycleStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CHANGE_SERVER_LIFE_CYCLE_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create application.

      def create_application(
        name : String,
        account_id : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(name: name, account_id: account_id, description: description, tags: tags)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create Connector.

      def create_connector(
        name : String,
        ssm_instance_id : String,
        ssm_command_config : Types::ConnectorSsmCommandConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConnectorRequest.new(name: name, ssm_instance_id: ssm_instance_id, ssm_command_config: ssm_command_config, tags: tags)
        create_connector(input)
      end

      def create_connector(input : Types::CreateConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Launch Configuration Template.

      def create_launch_configuration_template(
        associate_public_ip_address : Bool? = nil,
        boot_mode : String? = nil,
        copy_private_ip : Bool? = nil,
        copy_tags : Bool? = nil,
        enable_map_auto_tagging : Bool? = nil,
        enable_parameters_encryption : Bool? = nil,
        large_volume_conf : Types::LaunchTemplateDiskConf? = nil,
        launch_disposition : String? = nil,
        licensing : Types::Licensing? = nil,
        map_auto_tagging_mpe_id : String? = nil,
        parameters_encryption_key : String? = nil,
        post_launch_actions : Types::PostLaunchActions? = nil,
        small_volume_conf : Types::LaunchTemplateDiskConf? = nil,
        small_volume_max_size : Int64? = nil,
        tags : Hash(String, String)? = nil,
        target_instance_type_right_sizing_method : String? = nil
      ) : Protocol::Request
        input = Types::CreateLaunchConfigurationTemplateRequest.new(associate_public_ip_address: associate_public_ip_address, boot_mode: boot_mode, copy_private_ip: copy_private_ip, copy_tags: copy_tags, enable_map_auto_tagging: enable_map_auto_tagging, enable_parameters_encryption: enable_parameters_encryption, large_volume_conf: large_volume_conf, launch_disposition: launch_disposition, licensing: licensing, map_auto_tagging_mpe_id: map_auto_tagging_mpe_id, parameters_encryption_key: parameters_encryption_key, post_launch_actions: post_launch_actions, small_volume_conf: small_volume_conf, small_volume_max_size: small_volume_max_size, tags: tags, target_instance_type_right_sizing_method: target_instance_type_right_sizing_method)
        create_launch_configuration_template(input)
      end

      def create_launch_configuration_template(input : Types::CreateLaunchConfigurationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LAUNCH_CONFIGURATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new ReplicationConfigurationTemplate.

      def create_replication_configuration_template(
        associate_default_security_group : Bool,
        bandwidth_throttling : Int64,
        create_public_ip : Bool,
        data_plane_routing : String,
        default_large_staging_disk_type : String,
        ebs_encryption : String,
        replication_server_instance_type : String,
        replication_servers_security_groups_i_ds : Array(String),
        staging_area_subnet_id : String,
        staging_area_tags : Hash(String, String),
        use_dedicated_replication_server : Bool,
        ebs_encryption_key_arn : String? = nil,
        internet_protocol : String? = nil,
        tags : Hash(String, String)? = nil,
        use_fips_endpoint : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateReplicationConfigurationTemplateRequest.new(associate_default_security_group: associate_default_security_group, bandwidth_throttling: bandwidth_throttling, create_public_ip: create_public_ip, data_plane_routing: data_plane_routing, default_large_staging_disk_type: default_large_staging_disk_type, ebs_encryption: ebs_encryption, replication_server_instance_type: replication_server_instance_type, replication_servers_security_groups_i_ds: replication_servers_security_groups_i_ds, staging_area_subnet_id: staging_area_subnet_id, staging_area_tags: staging_area_tags, use_dedicated_replication_server: use_dedicated_replication_server, ebs_encryption_key_arn: ebs_encryption_key_arn, internet_protocol: internet_protocol, tags: tags, use_fips_endpoint: use_fips_endpoint)
        create_replication_configuration_template(input)
      end

      def create_replication_configuration_template(input : Types::CreateReplicationConfigurationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REPLICATION_CONFIGURATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create wave.

      def create_wave(
        name : String,
        account_id : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateWaveRequest.new(name: name, account_id: account_id, description: description, tags: tags)
        create_wave(input)
      end

      def create_wave(input : Types::CreateWaveRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WAVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete application.

      def delete_application(
        application_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(application_id: application_id, account_id: account_id)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete Connector.

      def delete_connector(
        connector_id : String
      ) : Protocol::Request
        input = Types::DeleteConnectorRequest.new(connector_id: connector_id)
        delete_connector(input)
      end

      def delete_connector(input : Types::DeleteConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a single Job by ID.

      def delete_job(
        job_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteJobRequest.new(job_id: job_id, account_id: account_id)
        delete_job(input)
      end

      def delete_job(input : Types::DeleteJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a single Launch Configuration Template by ID.

      def delete_launch_configuration_template(
        launch_configuration_template_id : String
      ) : Protocol::Request
        input = Types::DeleteLaunchConfigurationTemplateRequest.new(launch_configuration_template_id: launch_configuration_template_id)
        delete_launch_configuration_template(input)
      end

      def delete_launch_configuration_template(input : Types::DeleteLaunchConfigurationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LAUNCH_CONFIGURATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a single Replication Configuration Template by ID

      def delete_replication_configuration_template(
        replication_configuration_template_id : String
      ) : Protocol::Request
        input = Types::DeleteReplicationConfigurationTemplateRequest.new(replication_configuration_template_id: replication_configuration_template_id)
        delete_replication_configuration_template(input)
      end

      def delete_replication_configuration_template(input : Types::DeleteReplicationConfigurationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REPLICATION_CONFIGURATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a single source server by ID.

      def delete_source_server(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteSourceServerRequest.new(source_server_id: source_server_id, account_id: account_id)
        delete_source_server(input)
      end

      def delete_source_server(input : Types::DeleteSourceServerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SOURCE_SERVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a given vCenter client by ID.

      def delete_vcenter_client(
        vcenter_client_id : String
      ) : Protocol::Request
        input = Types::DeleteVcenterClientRequest.new(vcenter_client_id: vcenter_client_id)
        delete_vcenter_client(input)
      end

      def delete_vcenter_client(input : Types::DeleteVcenterClientRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VCENTER_CLIENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete wave.

      def delete_wave(
        wave_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteWaveRequest.new(wave_id: wave_id, account_id: account_id)
        delete_wave(input)
      end

      def delete_wave(input : Types::DeleteWaveRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WAVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed job log items with paging.

      def describe_job_log_items(
        job_id : String,
        account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeJobLogItemsRequest.new(job_id: job_id, account_id: account_id, max_results: max_results, next_token: next_token)
        describe_job_log_items(input)
      end

      def describe_job_log_items(input : Types::DescribeJobLogItemsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_LOG_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Jobs. Use the JobsID and fromDate and toData filters to limit which jobs are
      # returned. The response is sorted by creationDataTime - latest date first. Jobs are normally created
      # by the StartTest, StartCutover, and TerminateTargetInstances APIs. Jobs are also created by
      # DiagnosticLaunch and TerminateDiagnosticInstances, which are APIs available only to *Support* and
      # only used in response to relevant support tickets.

      def describe_jobs(
        account_id : String? = nil,
        filters : Types::DescribeJobsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeJobsRequest.new(account_id: account_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_jobs(input)
      end

      def describe_jobs(input : Types::DescribeJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Launch Configuration Templates, filtered by Launch Configuration Template IDs

      def describe_launch_configuration_templates(
        launch_configuration_template_i_ds : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeLaunchConfigurationTemplatesRequest.new(launch_configuration_template_i_ds: launch_configuration_template_i_ds, max_results: max_results, next_token: next_token)
        describe_launch_configuration_templates(input)
      end

      def describe_launch_configuration_templates(input : Types::DescribeLaunchConfigurationTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_LAUNCH_CONFIGURATION_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all ReplicationConfigurationTemplates, filtered by Source Server IDs.

      def describe_replication_configuration_templates(
        max_results : Int32? = nil,
        next_token : String? = nil,
        replication_configuration_template_i_ds : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DescribeReplicationConfigurationTemplatesRequest.new(max_results: max_results, next_token: next_token, replication_configuration_template_i_ds: replication_configuration_template_i_ds)
        describe_replication_configuration_templates(input)
      end

      def describe_replication_configuration_templates(input : Types::DescribeReplicationConfigurationTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REPLICATION_CONFIGURATION_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all SourceServers or multiple SourceServers by ID.

      def describe_source_servers(
        account_id : String? = nil,
        filters : Types::DescribeSourceServersRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeSourceServersRequest.new(account_id: account_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_source_servers(input)
      end

      def describe_source_servers(input : Types::DescribeSourceServersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SOURCE_SERVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the installed vCenter clients.

      def describe_vcenter_clients(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeVcenterClientsRequest.new(max_results: max_results, next_token: next_token)
        describe_vcenter_clients(input)
      end

      def describe_vcenter_clients(input : Types::DescribeVcenterClientsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VCENTER_CLIENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociate applications from wave.

      def disassociate_applications(
        application_i_ds : Array(String),
        wave_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateApplicationsRequest.new(application_i_ds: application_i_ds, wave_id: wave_id, account_id: account_id)
        disassociate_applications(input)
      end

      def disassociate_applications(input : Types::DisassociateApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociate source servers from application.

      def disassociate_source_servers(
        application_id : String,
        source_server_i_ds : Array(String),
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateSourceServersRequest.new(application_id: application_id, source_server_i_ds: source_server_i_ds, account_id: account_id)
        disassociate_source_servers(input)
      end

      def disassociate_source_servers(input : Types::DisassociateSourceServersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_SOURCE_SERVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disconnects specific Source Servers from Application Migration Service. Data replication is stopped
      # immediately. All AWS resources created by Application Migration Service for enabling the replication
      # of these source servers will be terminated / deleted within 90 minutes. Launched Test or Cutover
      # instances will NOT be terminated. If the agent on the source server has not been prevented from
      # communicating with the Application Migration Service service, then it will receive a command to
      # uninstall itself (within approximately 10 minutes). The following properties of the SourceServer
      # will be changed immediately: dataReplicationInfo.dataReplicationState will be set to DISCONNECTED;
      # The totalStorageBytes property for each of dataReplicationInfo.replicatedDisks will be set to zero;
      # dataReplicationInfo.lagDuration and dataReplicationInfo.lagDuration will be nullified.

      def disconnect_from_service(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DisconnectFromServiceRequest.new(source_server_id: source_server_id, account_id: account_id)
        disconnect_from_service(input)
      end

      def disconnect_from_service(input : Types::DisconnectFromServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISCONNECT_FROM_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Finalizes the cutover immediately for specific Source Servers. All AWS resources created by
      # Application Migration Service for enabling the replication of these source servers will be
      # terminated / deleted within 90 minutes. Launched Test or Cutover instances will NOT be terminated.
      # The AWS Replication Agent will receive a command to uninstall itself (within 10 minutes). The
      # following properties of the SourceServer will be changed immediately:
      # dataReplicationInfo.dataReplicationState will be changed to DISCONNECTED; The
      # SourceServer.lifeCycle.state will be changed to CUTOVER; The totalStorageBytes property fo each of
      # dataReplicationInfo.replicatedDisks will be set to zero; dataReplicationInfo.lagDuration and
      # dataReplicationInfo.lagDuration will be nullified.

      def finalize_cutover(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::FinalizeCutoverRequest.new(source_server_id: source_server_id, account_id: account_id)
        finalize_cutover(input)
      end

      def finalize_cutover(input : Types::FinalizeCutoverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::FINALIZE_CUTOVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all LaunchConfigurations available, filtered by Source Server IDs.

      def get_launch_configuration(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetLaunchConfigurationRequest.new(source_server_id: source_server_id, account_id: account_id)
        get_launch_configuration(input)
      end

      def get_launch_configuration(input : Types::GetLaunchConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LAUNCH_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all ReplicationConfigurations, filtered by Source Server ID.

      def get_replication_configuration(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetReplicationConfigurationRequest.new(source_server_id: source_server_id, account_id: account_id)
        get_replication_configuration(input)
      end

      def get_replication_configuration(input : Types::GetReplicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REPLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initialize Application Migration Service.

      def initialize_service : Protocol::Request
        input = Types::InitializeServiceRequest.new
        initialize_service(input)
      end

      def initialize_service(input : Types::InitializeServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INITIALIZE_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all applications or multiple applications by ID.

      def list_applications(
        account_id : String? = nil,
        filters : Types::ListApplicationsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(account_id: account_id, filters: filters, max_results: max_results, next_token: next_token)
        list_applications(input)
      end

      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List Connectors.

      def list_connectors(
        filters : Types::ListConnectorsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_connectors(input)
      end

      def list_connectors(input : Types::ListConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List export errors.

      def list_export_errors(
        export_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListExportErrorsRequest.new(export_id: export_id, max_results: max_results, next_token: next_token)
        list_export_errors(input)
      end

      def list_export_errors(input : Types::ListExportErrorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPORT_ERRORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List exports.

      def list_exports(
        filters : Types::ListExportsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListExportsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_exports(input)
      end

      def list_exports(input : Types::ListExportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List import errors.

      def list_import_errors(
        import_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImportErrorsRequest.new(import_id: import_id, max_results: max_results, next_token: next_token)
        list_import_errors(input)
      end

      def list_import_errors(input : Types::ListImportErrorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMPORT_ERRORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List imports.

      def list_imports(
        filters : Types::ListImportsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImportsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_imports(input)
      end

      def list_imports(input : Types::ListImportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List Managed Accounts.

      def list_managed_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedAccountsRequest.new(max_results: max_results, next_token: next_token)
        list_managed_accounts(input)
      end

      def list_managed_accounts(input : Types::ListManagedAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List source server post migration custom actions.

      def list_source_server_actions(
        source_server_id : String,
        account_id : String? = nil,
        filters : Types::SourceServerActionsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSourceServerActionsRequest.new(source_server_id: source_server_id, account_id: account_id, filters: filters, max_results: max_results, next_token: next_token)
        list_source_server_actions(input)
      end

      def list_source_server_actions(input : Types::ListSourceServerActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOURCE_SERVER_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all tags for your Application Migration Service resources.

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

      # List template post migration custom actions.

      def list_template_actions(
        launch_configuration_template_id : String,
        filters : Types::TemplateActionsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplateActionsRequest.new(launch_configuration_template_id: launch_configuration_template_id, filters: filters, max_results: max_results, next_token: next_token)
        list_template_actions(input)
      end

      def list_template_actions(input : Types::ListTemplateActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATE_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all waves or multiple waves by ID.

      def list_waves(
        account_id : String? = nil,
        filters : Types::ListWavesRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWavesRequest.new(account_id: account_id, filters: filters, max_results: max_results, next_token: next_token)
        list_waves(input)
      end

      def list_waves(input : Types::ListWavesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WAVES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Archives specific Source Servers by setting the SourceServer.isArchived property to true for
      # specified SourceServers by ID. This command only works for SourceServers with a lifecycle. state
      # which equals DISCONNECTED or CUTOVER.

      def mark_as_archived(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::MarkAsArchivedRequest.new(source_server_id: source_server_id, account_id: account_id)
        mark_as_archived(input)
      end

      def mark_as_archived(input : Types::MarkAsArchivedRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::MARK_AS_ARCHIVED, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Pause Replication.

      def pause_replication(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::PauseReplicationRequest.new(source_server_id: source_server_id, account_id: account_id)
        pause_replication(input)
      end

      def pause_replication(input : Types::PauseReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PAUSE_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Put source server post migration custom action.

      def put_source_server_action(
        action_id : String,
        action_name : String,
        document_identifier : String,
        order : Int32,
        source_server_id : String,
        account_id : String? = nil,
        active : Bool? = nil,
        category : String? = nil,
        description : String? = nil,
        document_version : String? = nil,
        external_parameters : Hash(String, Types::SsmExternalParameter)? = nil,
        must_succeed_for_cutover : Bool? = nil,
        parameters : Hash(String, Array(Types::SsmParameterStoreParameter))? = nil,
        timeout_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::PutSourceServerActionRequest.new(action_id: action_id, action_name: action_name, document_identifier: document_identifier, order: order, source_server_id: source_server_id, account_id: account_id, active: active, category: category, description: description, document_version: document_version, external_parameters: external_parameters, must_succeed_for_cutover: must_succeed_for_cutover, parameters: parameters, timeout_seconds: timeout_seconds)
        put_source_server_action(input)
      end

      def put_source_server_action(input : Types::PutSourceServerActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SOURCE_SERVER_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Put template post migration custom action.

      def put_template_action(
        action_id : String,
        action_name : String,
        document_identifier : String,
        launch_configuration_template_id : String,
        order : Int32,
        active : Bool? = nil,
        category : String? = nil,
        description : String? = nil,
        document_version : String? = nil,
        external_parameters : Hash(String, Types::SsmExternalParameter)? = nil,
        must_succeed_for_cutover : Bool? = nil,
        operating_system : String? = nil,
        parameters : Hash(String, Array(Types::SsmParameterStoreParameter))? = nil,
        timeout_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::PutTemplateActionRequest.new(action_id: action_id, action_name: action_name, document_identifier: document_identifier, launch_configuration_template_id: launch_configuration_template_id, order: order, active: active, category: category, description: description, document_version: document_version, external_parameters: external_parameters, must_succeed_for_cutover: must_succeed_for_cutover, operating_system: operating_system, parameters: parameters, timeout_seconds: timeout_seconds)
        put_template_action(input)
      end

      def put_template_action(input : Types::PutTemplateActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TEMPLATE_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove source server post migration custom action.

      def remove_source_server_action(
        action_id : String,
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::RemoveSourceServerActionRequest.new(action_id: action_id, source_server_id: source_server_id, account_id: account_id)
        remove_source_server_action(input)
      end

      def remove_source_server_action(input : Types::RemoveSourceServerActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_SOURCE_SERVER_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove template post migration custom action.

      def remove_template_action(
        action_id : String,
        launch_configuration_template_id : String
      ) : Protocol::Request
        input = Types::RemoveTemplateActionRequest.new(action_id: action_id, launch_configuration_template_id: launch_configuration_template_id)
        remove_template_action(input)
      end

      def remove_template_action(input : Types::RemoveTemplateActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_TEMPLATE_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resume Replication.

      def resume_replication(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::ResumeReplicationRequest.new(source_server_id: source_server_id, account_id: account_id)
        resume_replication(input)
      end

      def resume_replication(input : Types::ResumeReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESUME_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Causes the data replication initiation sequence to begin immediately upon next Handshake for
      # specified SourceServer IDs, regardless of when the previous initiation started. This command will
      # not work if the SourceServer is not stalled or is in a DISCONNECTED or STOPPED state.

      def retry_data_replication(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::RetryDataReplicationRequest.new(source_server_id: source_server_id, account_id: account_id)
        retry_data_replication(input)
      end

      def retry_data_replication(input : Types::RetryDataReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETRY_DATA_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Launches a Cutover Instance for specific Source Servers. This command starts a LAUNCH job whose
      # initiatedBy property is StartCutover and changes the SourceServer.lifeCycle.state property to
      # CUTTING_OVER.

      def start_cutover(
        source_server_i_ds : Array(String),
        account_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartCutoverRequest.new(source_server_i_ds: source_server_i_ds, account_id: account_id, tags: tags)
        start_cutover(input)
      end

      def start_cutover(input : Types::StartCutoverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CUTOVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start export.

      def start_export(
        s3_bucket : String,
        s3_key : String,
        s3_bucket_owner : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartExportRequest.new(s3_bucket: s3_bucket, s3_key: s3_key, s3_bucket_owner: s3_bucket_owner, tags: tags)
        start_export(input)
      end

      def start_export(input : Types::StartExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start import.

      def start_import(
        s3_bucket_source : Types::S3BucketSource,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartImportRequest.new(s3_bucket_source: s3_bucket_source, client_token: client_token, tags: tags)
        start_import(input)
      end

      def start_import(input : Types::StartImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_IMPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start replication for source server irrespective of its replication type.

      def start_replication(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::StartReplicationRequest.new(source_server_id: source_server_id, account_id: account_id)
        start_replication(input)
      end

      def start_replication(input : Types::StartReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Launches a Test Instance for specific Source Servers. This command starts a LAUNCH job whose
      # initiatedBy property is StartTest and changes the SourceServer.lifeCycle.state property to TESTING.

      def start_test(
        source_server_i_ds : Array(String),
        account_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartTestRequest.new(source_server_i_ds: source_server_i_ds, account_id: account_id, tags: tags)
        start_test(input)
      end

      def start_test(input : Types::StartTestRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stop Replication.

      def stop_replication(
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::StopReplicationRequest.new(source_server_id: source_server_id, account_id: account_id)
        stop_replication(input)
      end

      def stop_replication(input : Types::StopReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or overwrites only the specified tags for the specified Application Migration Service resource
      # or resources. When you specify an existing tag key, the value is overwritten with the new value.
      # Each resource can have a maximum of 50 tags. Each tag consists of a key and optional value.

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

      # Starts a job that terminates specific launched EC2 Test and Cutover instances. This command will not
      # work for any Source Server with a lifecycle.state of TESTING, CUTTING_OVER, or CUTOVER.

      def terminate_target_instances(
        source_server_i_ds : Array(String),
        account_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::TerminateTargetInstancesRequest.new(source_server_i_ds: source_server_i_ds, account_id: account_id, tags: tags)
        terminate_target_instances(input)
      end

      def terminate_target_instances(input : Types::TerminateTargetInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TERMINATE_TARGET_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Unarchive application.

      def unarchive_application(
        application_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::UnarchiveApplicationRequest.new(application_id: application_id, account_id: account_id)
        unarchive_application(input)
      end

      def unarchive_application(input : Types::UnarchiveApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNARCHIVE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Unarchive wave.

      def unarchive_wave(
        wave_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::UnarchiveWaveRequest.new(wave_id: wave_id, account_id: account_id)
        unarchive_wave(input)
      end

      def unarchive_wave(input : Types::UnarchiveWaveRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNARCHIVE_WAVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified set of tags from the specified set of Application Migration Service resources.

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

      # Update application.

      def update_application(
        application_id : String,
        account_id : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationRequest.new(application_id: application_id, account_id: account_id, description: description, name: name)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update Connector.

      def update_connector(
        connector_id : String,
        name : String? = nil,
        ssm_command_config : Types::ConnectorSsmCommandConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectorRequest.new(connector_id: connector_id, name: name, ssm_command_config: ssm_command_config)
        update_connector(input)
      end

      def update_connector(input : Types::UpdateConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates multiple LaunchConfigurations by Source Server ID. bootMode valid values are LEGACY_BIOS |
      # UEFI

      def update_launch_configuration(
        source_server_id : String,
        account_id : String? = nil,
        boot_mode : String? = nil,
        copy_private_ip : Bool? = nil,
        copy_tags : Bool? = nil,
        enable_map_auto_tagging : Bool? = nil,
        launch_disposition : String? = nil,
        licensing : Types::Licensing? = nil,
        map_auto_tagging_mpe_id : String? = nil,
        name : String? = nil,
        post_launch_actions : Types::PostLaunchActions? = nil,
        target_instance_type_right_sizing_method : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLaunchConfigurationRequest.new(source_server_id: source_server_id, account_id: account_id, boot_mode: boot_mode, copy_private_ip: copy_private_ip, copy_tags: copy_tags, enable_map_auto_tagging: enable_map_auto_tagging, launch_disposition: launch_disposition, licensing: licensing, map_auto_tagging_mpe_id: map_auto_tagging_mpe_id, name: name, post_launch_actions: post_launch_actions, target_instance_type_right_sizing_method: target_instance_type_right_sizing_method)
        update_launch_configuration(input)
      end

      def update_launch_configuration(input : Types::UpdateLaunchConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LAUNCH_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Launch Configuration Template by ID.

      def update_launch_configuration_template(
        launch_configuration_template_id : String,
        associate_public_ip_address : Bool? = nil,
        boot_mode : String? = nil,
        copy_private_ip : Bool? = nil,
        copy_tags : Bool? = nil,
        enable_map_auto_tagging : Bool? = nil,
        enable_parameters_encryption : Bool? = nil,
        large_volume_conf : Types::LaunchTemplateDiskConf? = nil,
        launch_disposition : String? = nil,
        licensing : Types::Licensing? = nil,
        map_auto_tagging_mpe_id : String? = nil,
        parameters_encryption_key : String? = nil,
        post_launch_actions : Types::PostLaunchActions? = nil,
        small_volume_conf : Types::LaunchTemplateDiskConf? = nil,
        small_volume_max_size : Int64? = nil,
        target_instance_type_right_sizing_method : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLaunchConfigurationTemplateRequest.new(launch_configuration_template_id: launch_configuration_template_id, associate_public_ip_address: associate_public_ip_address, boot_mode: boot_mode, copy_private_ip: copy_private_ip, copy_tags: copy_tags, enable_map_auto_tagging: enable_map_auto_tagging, enable_parameters_encryption: enable_parameters_encryption, large_volume_conf: large_volume_conf, launch_disposition: launch_disposition, licensing: licensing, map_auto_tagging_mpe_id: map_auto_tagging_mpe_id, parameters_encryption_key: parameters_encryption_key, post_launch_actions: post_launch_actions, small_volume_conf: small_volume_conf, small_volume_max_size: small_volume_max_size, target_instance_type_right_sizing_method: target_instance_type_right_sizing_method)
        update_launch_configuration_template(input)
      end

      def update_launch_configuration_template(input : Types::UpdateLaunchConfigurationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LAUNCH_CONFIGURATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to update multiple ReplicationConfigurations by Source Server ID.

      def update_replication_configuration(
        source_server_id : String,
        account_id : String? = nil,
        associate_default_security_group : Bool? = nil,
        bandwidth_throttling : Int64? = nil,
        create_public_ip : Bool? = nil,
        data_plane_routing : String? = nil,
        default_large_staging_disk_type : String? = nil,
        ebs_encryption : String? = nil,
        ebs_encryption_key_arn : String? = nil,
        internet_protocol : String? = nil,
        name : String? = nil,
        replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)? = nil,
        replication_server_instance_type : String? = nil,
        replication_servers_security_groups_i_ds : Array(String)? = nil,
        staging_area_subnet_id : String? = nil,
        staging_area_tags : Hash(String, String)? = nil,
        use_dedicated_replication_server : Bool? = nil,
        use_fips_endpoint : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateReplicationConfigurationRequest.new(source_server_id: source_server_id, account_id: account_id, associate_default_security_group: associate_default_security_group, bandwidth_throttling: bandwidth_throttling, create_public_ip: create_public_ip, data_plane_routing: data_plane_routing, default_large_staging_disk_type: default_large_staging_disk_type, ebs_encryption: ebs_encryption, ebs_encryption_key_arn: ebs_encryption_key_arn, internet_protocol: internet_protocol, name: name, replicated_disks: replicated_disks, replication_server_instance_type: replication_server_instance_type, replication_servers_security_groups_i_ds: replication_servers_security_groups_i_ds, staging_area_subnet_id: staging_area_subnet_id, staging_area_tags: staging_area_tags, use_dedicated_replication_server: use_dedicated_replication_server, use_fips_endpoint: use_fips_endpoint)
        update_replication_configuration(input)
      end

      def update_replication_configuration(input : Types::UpdateReplicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates multiple ReplicationConfigurationTemplates by ID.

      def update_replication_configuration_template(
        replication_configuration_template_id : String,
        arn : String? = nil,
        associate_default_security_group : Bool? = nil,
        bandwidth_throttling : Int64? = nil,
        create_public_ip : Bool? = nil,
        data_plane_routing : String? = nil,
        default_large_staging_disk_type : String? = nil,
        ebs_encryption : String? = nil,
        ebs_encryption_key_arn : String? = nil,
        internet_protocol : String? = nil,
        replication_server_instance_type : String? = nil,
        replication_servers_security_groups_i_ds : Array(String)? = nil,
        staging_area_subnet_id : String? = nil,
        staging_area_tags : Hash(String, String)? = nil,
        use_dedicated_replication_server : Bool? = nil,
        use_fips_endpoint : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateReplicationConfigurationTemplateRequest.new(replication_configuration_template_id: replication_configuration_template_id, arn: arn, associate_default_security_group: associate_default_security_group, bandwidth_throttling: bandwidth_throttling, create_public_ip: create_public_ip, data_plane_routing: data_plane_routing, default_large_staging_disk_type: default_large_staging_disk_type, ebs_encryption: ebs_encryption, ebs_encryption_key_arn: ebs_encryption_key_arn, internet_protocol: internet_protocol, replication_server_instance_type: replication_server_instance_type, replication_servers_security_groups_i_ds: replication_servers_security_groups_i_ds, staging_area_subnet_id: staging_area_subnet_id, staging_area_tags: staging_area_tags, use_dedicated_replication_server: use_dedicated_replication_server, use_fips_endpoint: use_fips_endpoint)
        update_replication_configuration_template(input)
      end

      def update_replication_configuration_template(input : Types::UpdateReplicationConfigurationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPLICATION_CONFIGURATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update Source Server.

      def update_source_server(
        source_server_id : String,
        account_id : String? = nil,
        connector_action : Types::SourceServerConnectorAction? = nil
      ) : Protocol::Request
        input = Types::UpdateSourceServerRequest.new(source_server_id: source_server_id, account_id: account_id, connector_action: connector_action)
        update_source_server(input)
      end

      def update_source_server(input : Types::UpdateSourceServerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SOURCE_SERVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to change between the AGENT_BASED replication type and the SNAPSHOT_SHIPPING replication
      # type. SNAPSHOT_SHIPPING should be used for agentless replication.

      def update_source_server_replication_type(
        replication_type : String,
        source_server_id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSourceServerReplicationTypeRequest.new(replication_type: replication_type, source_server_id: source_server_id, account_id: account_id)
        update_source_server_replication_type(input)
      end

      def update_source_server_replication_type(input : Types::UpdateSourceServerReplicationTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SOURCE_SERVER_REPLICATION_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update wave.

      def update_wave(
        wave_id : String,
        account_id : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWaveRequest.new(wave_id: wave_id, account_id: account_id, description: description, name: name)
        update_wave(input)
      end

      def update_wave(input : Types::UpdateWaveRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WAVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
