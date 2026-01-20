module AwsSdk
  module Drs
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

      # Associate a Source Network to an existing CloudFormation Stack and modify launch templates to use
      # this network. Can be used for reverting to previously deployed CloudFormation stacks.

      def associate_source_network_stack(
        cfn_stack_name : String,
        source_network_id : String
      ) : Protocol::Request
        input = Types::AssociateSourceNetworkStackRequest.new(cfn_stack_name: cfn_stack_name, source_network_id: source_network_id)
        associate_source_network_stack(input)
      end

      def associate_source_network_stack(input : Types::AssociateSourceNetworkStackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SOURCE_NETWORK_STACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create an extended source server in the target Account based on the source server in staging
      # account.

      def create_extended_source_server(
        source_server_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateExtendedSourceServerRequest.new(source_server_arn: source_server_arn, tags: tags)
        create_extended_source_server(input)
      end

      def create_extended_source_server(input : Types::CreateExtendedSourceServerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EXTENDED_SOURCE_SERVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Launch Configuration Template.

      def create_launch_configuration_template(
        copy_private_ip : Bool? = nil,
        copy_tags : Bool? = nil,
        export_bucket_arn : String? = nil,
        launch_disposition : String? = nil,
        launch_into_source_instance : Bool? = nil,
        licensing : Types::Licensing? = nil,
        post_launch_enabled : Bool? = nil,
        tags : Hash(String, String)? = nil,
        target_instance_type_right_sizing_method : String? = nil
      ) : Protocol::Request
        input = Types::CreateLaunchConfigurationTemplateRequest.new(copy_private_ip: copy_private_ip, copy_tags: copy_tags, export_bucket_arn: export_bucket_arn, launch_disposition: launch_disposition, launch_into_source_instance: launch_into_source_instance, licensing: licensing, post_launch_enabled: post_launch_enabled, tags: tags, target_instance_type_right_sizing_method: target_instance_type_right_sizing_method)
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
        pit_policy : Array(Types::PITPolicyRule),
        replication_server_instance_type : String,
        replication_servers_security_groups_i_ds : Array(String),
        staging_area_subnet_id : String,
        staging_area_tags : Hash(String, String),
        use_dedicated_replication_server : Bool,
        auto_replicate_new_disks : Bool? = nil,
        ebs_encryption_key_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateReplicationConfigurationTemplateRequest.new(associate_default_security_group: associate_default_security_group, bandwidth_throttling: bandwidth_throttling, create_public_ip: create_public_ip, data_plane_routing: data_plane_routing, default_large_staging_disk_type: default_large_staging_disk_type, ebs_encryption: ebs_encryption, pit_policy: pit_policy, replication_server_instance_type: replication_server_instance_type, replication_servers_security_groups_i_ds: replication_servers_security_groups_i_ds, staging_area_subnet_id: staging_area_subnet_id, staging_area_tags: staging_area_tags, use_dedicated_replication_server: use_dedicated_replication_server, auto_replicate_new_disks: auto_replicate_new_disks, ebs_encryption_key_arn: ebs_encryption_key_arn, tags: tags)
        create_replication_configuration_template(input)
      end

      def create_replication_configuration_template(input : Types::CreateReplicationConfigurationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REPLICATION_CONFIGURATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new Source Network resource for a provided VPC ID.

      def create_source_network(
        origin_account_id : String,
        origin_region : String,
        vpc_id : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSourceNetworkRequest.new(origin_account_id: origin_account_id, origin_region: origin_region, vpc_id: vpc_id, tags: tags)
        create_source_network(input)
      end

      def create_source_network(input : Types::CreateSourceNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SOURCE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a single Job by ID.

      def delete_job(
        job_id : String
      ) : Protocol::Request
        input = Types::DeleteJobRequest.new(job_id: job_id)
        delete_job(input)
      end

      def delete_job(input : Types::DeleteJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resource launch action.

      def delete_launch_action(
        action_id : String,
        resource_id : String
      ) : Protocol::Request
        input = Types::DeleteLaunchActionRequest.new(action_id: action_id, resource_id: resource_id)
        delete_launch_action(input)
      end

      def delete_launch_action(input : Types::DeleteLaunchActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LAUNCH_ACTION, input, endpoint)
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

      # Deletes a single Recovery Instance by ID. This deletes the Recovery Instance resource from Elastic
      # Disaster Recovery. The Recovery Instance must be disconnected first in order to delete it.

      def delete_recovery_instance(
        recovery_instance_id : String
      ) : Protocol::Request
        input = Types::DeleteRecoveryInstanceRequest.new(recovery_instance_id: recovery_instance_id)
        delete_recovery_instance(input)
      end

      def delete_recovery_instance(input : Types::DeleteRecoveryInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RECOVERY_INSTANCE, input, endpoint)
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

      # Delete Source Network resource.

      def delete_source_network(
        source_network_id : String
      ) : Protocol::Request
        input = Types::DeleteSourceNetworkRequest.new(source_network_id: source_network_id)
        delete_source_network(input)
      end

      def delete_source_network(input : Types::DeleteSourceNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SOURCE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a single Source Server by ID. The Source Server must be disconnected first.

      def delete_source_server(
        source_server_id : String
      ) : Protocol::Request
        input = Types::DeleteSourceServerRequest.new(source_server_id: source_server_id)
        delete_source_server(input)
      end

      def delete_source_server(input : Types::DeleteSourceServerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SOURCE_SERVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a detailed Job log with pagination.

      def describe_job_log_items(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeJobLogItemsRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        describe_job_log_items(input)
      end

      def describe_job_log_items(input : Types::DescribeJobLogItemsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_LOG_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Jobs. Use the JobsID and fromDate and toDate filters to limit which jobs are
      # returned. The response is sorted by creationDataTime - latest date first. Jobs are created by the
      # StartRecovery, TerminateRecoveryInstances and StartFailbackLaunch APIs. Jobs are also created by
      # DiagnosticLaunch and TerminateDiagnosticInstances, which are APIs available only to *Support* and
      # only used in response to relevant support tickets.

      def describe_jobs(
        filters : Types::DescribeJobsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeJobsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
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

      # Lists all Recovery Instances or multiple Recovery Instances by ID.

      def describe_recovery_instances(
        filters : Types::DescribeRecoveryInstancesRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeRecoveryInstancesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_recovery_instances(input)
      end

      def describe_recovery_instances(input : Types::DescribeRecoveryInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RECOVERY_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Recovery Snapshots for a single Source Server.

      def describe_recovery_snapshots(
        source_server_id : String,
        filters : Types::DescribeRecoverySnapshotsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order : String? = nil
      ) : Protocol::Request
        input = Types::DescribeRecoverySnapshotsRequest.new(source_server_id: source_server_id, filters: filters, max_results: max_results, next_token: next_token, order: order)
        describe_recovery_snapshots(input)
      end

      def describe_recovery_snapshots(input : Types::DescribeRecoverySnapshotsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RECOVERY_SNAPSHOTS, input, endpoint)
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

      # Lists all Source Networks or multiple Source Networks filtered by ID.

      def describe_source_networks(
        filters : Types::DescribeSourceNetworksRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeSourceNetworksRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_source_networks(input)
      end

      def describe_source_networks(input : Types::DescribeSourceNetworksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SOURCE_NETWORKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Source Servers or multiple Source Servers filtered by ID.

      def describe_source_servers(
        filters : Types::DescribeSourceServersRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeSourceServersRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_source_servers(input)
      end

      def describe_source_servers(input : Types::DescribeSourceServersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SOURCE_SERVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disconnect a Recovery Instance from Elastic Disaster Recovery. Data replication is stopped
      # immediately. All AWS resources created by Elastic Disaster Recovery for enabling the replication of
      # the Recovery Instance will be terminated / deleted within 90 minutes. If the agent on the Recovery
      # Instance has not been prevented from communicating with the Elastic Disaster Recovery service, then
      # it will receive a command to uninstall itself (within approximately 10 minutes). The following
      # properties of the Recovery Instance will be changed immediately:
      # dataReplicationInfo.dataReplicationState will be set to DISCONNECTED; The totalStorageBytes property
      # for each of dataReplicationInfo.replicatedDisks will be set to zero; dataReplicationInfo.lagDuration
      # and dataReplicationInfo.lagDuration will be nullified.

      def disconnect_recovery_instance(
        recovery_instance_id : String
      ) : Protocol::Request
        input = Types::DisconnectRecoveryInstanceRequest.new(recovery_instance_id: recovery_instance_id)
        disconnect_recovery_instance(input)
      end

      def disconnect_recovery_instance(input : Types::DisconnectRecoveryInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISCONNECT_RECOVERY_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disconnects a specific Source Server from Elastic Disaster Recovery. Data replication is stopped
      # immediately. All AWS resources created by Elastic Disaster Recovery for enabling the replication of
      # the Source Server will be terminated / deleted within 90 minutes. You cannot disconnect a Source
      # Server if it has a Recovery Instance. If the agent on the Source Server has not been prevented from
      # communicating with the Elastic Disaster Recovery service, then it will receive a command to
      # uninstall itself (within approximately 10 minutes). The following properties of the SourceServer
      # will be changed immediately: dataReplicationInfo.dataReplicationState will be set to DISCONNECTED;
      # The totalStorageBytes property for each of dataReplicationInfo.replicatedDisks will be set to zero;
      # dataReplicationInfo.lagDuration and dataReplicationInfo.lagDuration will be nullified.

      def disconnect_source_server(
        source_server_id : String
      ) : Protocol::Request
        input = Types::DisconnectSourceServerRequest.new(source_server_id: source_server_id)
        disconnect_source_server(input)
      end

      def disconnect_source_server(input : Types::DisconnectSourceServerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISCONNECT_SOURCE_SERVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Export the Source Network CloudFormation template to an S3 bucket.

      def export_source_network_cfn_template(
        source_network_id : String
      ) : Protocol::Request
        input = Types::ExportSourceNetworkCfnTemplateRequest.new(source_network_id: source_network_id)
        export_source_network_cfn_template(input)
      end

      def export_source_network_cfn_template(input : Types::ExportSourceNetworkCfnTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_SOURCE_NETWORK_CFN_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Failback ReplicationConfigurations, filtered by Recovery Instance ID.

      def get_failback_replication_configuration(
        recovery_instance_id : String
      ) : Protocol::Request
        input = Types::GetFailbackReplicationConfigurationRequest.new(recovery_instance_id: recovery_instance_id)
        get_failback_replication_configuration(input)
      end

      def get_failback_replication_configuration(input : Types::GetFailbackReplicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FAILBACK_REPLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a LaunchConfiguration, filtered by Source Server IDs.

      def get_launch_configuration(
        source_server_id : String
      ) : Protocol::Request
        input = Types::GetLaunchConfigurationRequest.new(source_server_id: source_server_id)
        get_launch_configuration(input)
      end

      def get_launch_configuration(input : Types::GetLaunchConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LAUNCH_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a ReplicationConfiguration, filtered by Source Server ID.

      def get_replication_configuration(
        source_server_id : String
      ) : Protocol::Request
        input = Types::GetReplicationConfigurationRequest.new(source_server_id: source_server_id)
        get_replication_configuration(input)
      end

      def get_replication_configuration(input : Types::GetReplicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REPLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initialize Elastic Disaster Recovery.

      def initialize_service : Protocol::Request
        input = Types::InitializeServiceRequest.new
        initialize_service(input)
      end

      def initialize_service(input : Types::InitializeServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INITIALIZE_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of source servers on a staging account that are extensible, which means that: a. The
      # source server is not already extended into this Account. b. The source server on the Account we’re
      # reading from is not an extension of another source server.

      def list_extensible_source_servers(
        staging_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListExtensibleSourceServersRequest.new(staging_account_id: staging_account_id, max_results: max_results, next_token: next_token)
        list_extensible_source_servers(input)
      end

      def list_extensible_source_servers(input : Types::ListExtensibleSourceServersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXTENSIBLE_SOURCE_SERVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists resource launch actions.

      def list_launch_actions(
        resource_id : String,
        filters : Types::LaunchActionsRequestFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLaunchActionsRequest.new(resource_id: resource_id, filters: filters, max_results: max_results, next_token: next_token)
        list_launch_actions(input)
      end

      def list_launch_actions(input : Types::ListLaunchActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LAUNCH_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array of staging accounts for existing extended source servers.

      def list_staging_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStagingAccountsRequest.new(max_results: max_results, next_token: next_token)
        list_staging_accounts(input)
      end

      def list_staging_accounts(input : Types::ListStagingAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STAGING_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all tags for your Elastic Disaster Recovery resources.

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

      # Puts a resource launch action.

      def put_launch_action(
        action_code : String,
        action_id : String,
        action_version : String,
        active : Bool,
        category : String,
        description : String,
        name : String,
        optional : Bool,
        order : Int32,
        resource_id : String,
        parameters : Hash(String, Types::LaunchActionParameter)? = nil
      ) : Protocol::Request
        input = Types::PutLaunchActionRequest.new(action_code: action_code, action_id: action_id, action_version: action_version, active: active, category: category, description: description, name: name, optional: optional, order: order, resource_id: resource_id, parameters: parameters)
        put_launch_action(input)
      end

      def put_launch_action(input : Types::PutLaunchActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_LAUNCH_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # WARNING: RetryDataReplication is deprecated. Causes the data replication initiation sequence to
      # begin immediately upon next Handshake for the specified Source Server ID, regardless of when the
      # previous initiation started. This command will work only if the Source Server is stalled or is in a
      # DISCONNECTED or STOPPED state.

      def retry_data_replication(
        source_server_id : String
      ) : Protocol::Request
        input = Types::RetryDataReplicationRequest.new(source_server_id: source_server_id)
        retry_data_replication(input)
      end

      def retry_data_replication(input : Types::RetryDataReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETRY_DATA_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start replication to origin / target region - applies only to protected instances that originated in
      # EC2. For recovery instances on target region - starts replication back to origin region. For
      # failback instances on origin region - starts replication to target region to re-protect them.

      def reverse_replication(
        recovery_instance_id : String
      ) : Protocol::Request
        input = Types::ReverseReplicationRequest.new(recovery_instance_id: recovery_instance_id)
        reverse_replication(input)
      end

      def reverse_replication(input : Types::ReverseReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVERSE_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a Job for launching the machine that is being failed back to from the specified Recovery
      # Instance. This will run conversion on the failback client and will reboot your machine, thus
      # completing the failback process.

      def start_failback_launch(
        recovery_instance_i_ds : Array(String),
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartFailbackLaunchRequest.new(recovery_instance_i_ds: recovery_instance_i_ds, tags: tags)
        start_failback_launch(input)
      end

      def start_failback_launch(input : Types::StartFailbackLaunchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_FAILBACK_LAUNCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Launches Recovery Instances for the specified Source Servers. For each Source Server you may choose
      # a point in time snapshot to launch from, or use an on demand snapshot.

      def start_recovery(
        source_servers : Array(Types::StartRecoveryRequestSourceServer),
        is_drill : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartRecoveryRequest.new(source_servers: source_servers, is_drill: is_drill, tags: tags)
        start_recovery(input)
      end

      def start_recovery(input : Types::StartRecoveryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_RECOVERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts replication for a stopped Source Server. This action would make the Source Server protected
      # again and restart billing for it.

      def start_replication(
        source_server_id : String
      ) : Protocol::Request
        input = Types::StartReplicationRequest.new(source_server_id: source_server_id)
        start_replication(input)
      end

      def start_replication(input : Types::StartReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deploy VPC for the specified Source Network and modify launch templates to use this network. The VPC
      # will be deployed using a dedicated CloudFormation stack.

      def start_source_network_recovery(
        source_networks : Array(Types::StartSourceNetworkRecoveryRequestNetworkEntry),
        deploy_as_new : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartSourceNetworkRecoveryRequest.new(source_networks: source_networks, deploy_as_new: deploy_as_new, tags: tags)
        start_source_network_recovery(input)
      end

      def start_source_network_recovery(input : Types::StartSourceNetworkRecoveryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SOURCE_NETWORK_RECOVERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts replication for a Source Network. This action would make the Source Network protected.

      def start_source_network_replication(
        source_network_id : String
      ) : Protocol::Request
        input = Types::StartSourceNetworkReplicationRequest.new(source_network_id: source_network_id)
        start_source_network_replication(input)
      end

      def start_source_network_replication(input : Types::StartSourceNetworkReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SOURCE_NETWORK_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the failback process for a specified Recovery Instance. This changes the Failback State of the
      # Recovery Instance back to FAILBACK_NOT_STARTED.

      def stop_failback(
        recovery_instance_id : String
      ) : Protocol::Request
        input = Types::StopFailbackRequest.new(recovery_instance_id: recovery_instance_id)
        stop_failback(input)
      end

      def stop_failback(input : Types::StopFailbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_FAILBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops replication for a Source Server. This action would make the Source Server unprotected, delete
      # its existing snapshots and stop billing for it.

      def stop_replication(
        source_server_id : String
      ) : Protocol::Request
        input = Types::StopReplicationRequest.new(source_server_id: source_server_id)
        stop_replication(input)
      end

      def stop_replication(input : Types::StopReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops replication for a Source Network. This action would make the Source Network unprotected.

      def stop_source_network_replication(
        source_network_id : String
      ) : Protocol::Request
        input = Types::StopSourceNetworkReplicationRequest.new(source_network_id: source_network_id)
        stop_source_network_replication(input)
      end

      def stop_source_network_replication(input : Types::StopSourceNetworkReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_SOURCE_NETWORK_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or overwrites only the specified tags for the specified Elastic Disaster Recovery resource or
      # resources. When you specify an existing tag key, the value is overwritten with the new value. Each
      # resource can have a maximum of 50 tags. Each tag consists of a key and optional value.

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

      # Initiates a Job for terminating the EC2 resources associated with the specified Recovery Instances,
      # and then will delete the Recovery Instances from the Elastic Disaster Recovery service.

      def terminate_recovery_instances(
        recovery_instance_i_ds : Array(String)
      ) : Protocol::Request
        input = Types::TerminateRecoveryInstancesRequest.new(recovery_instance_i_ds: recovery_instance_i_ds)
        terminate_recovery_instances(input)
      end

      def terminate_recovery_instances(input : Types::TerminateRecoveryInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TERMINATE_RECOVERY_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified set of tags from the specified set of Elastic Disaster Recovery resources.

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

      # Allows you to update the failback replication configuration of a Recovery Instance by ID.

      def update_failback_replication_configuration(
        recovery_instance_id : String,
        bandwidth_throttling : Int64? = nil,
        name : String? = nil,
        use_private_ip : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateFailbackReplicationConfigurationRequest.new(recovery_instance_id: recovery_instance_id, bandwidth_throttling: bandwidth_throttling, name: name, use_private_ip: use_private_ip)
        update_failback_replication_configuration(input)
      end

      def update_failback_replication_configuration(input : Types::UpdateFailbackReplicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FAILBACK_REPLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a LaunchConfiguration by Source Server ID.

      def update_launch_configuration(
        source_server_id : String,
        copy_private_ip : Bool? = nil,
        copy_tags : Bool? = nil,
        launch_disposition : String? = nil,
        launch_into_instance_properties : Types::LaunchIntoInstanceProperties? = nil,
        licensing : Types::Licensing? = nil,
        name : String? = nil,
        post_launch_enabled : Bool? = nil,
        target_instance_type_right_sizing_method : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLaunchConfigurationRequest.new(source_server_id: source_server_id, copy_private_ip: copy_private_ip, copy_tags: copy_tags, launch_disposition: launch_disposition, launch_into_instance_properties: launch_into_instance_properties, licensing: licensing, name: name, post_launch_enabled: post_launch_enabled, target_instance_type_right_sizing_method: target_instance_type_right_sizing_method)
        update_launch_configuration(input)
      end

      def update_launch_configuration(input : Types::UpdateLaunchConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LAUNCH_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Launch Configuration Template by ID.

      def update_launch_configuration_template(
        launch_configuration_template_id : String,
        copy_private_ip : Bool? = nil,
        copy_tags : Bool? = nil,
        export_bucket_arn : String? = nil,
        launch_disposition : String? = nil,
        launch_into_source_instance : Bool? = nil,
        licensing : Types::Licensing? = nil,
        post_launch_enabled : Bool? = nil,
        target_instance_type_right_sizing_method : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLaunchConfigurationTemplateRequest.new(launch_configuration_template_id: launch_configuration_template_id, copy_private_ip: copy_private_ip, copy_tags: copy_tags, export_bucket_arn: export_bucket_arn, launch_disposition: launch_disposition, launch_into_source_instance: launch_into_source_instance, licensing: licensing, post_launch_enabled: post_launch_enabled, target_instance_type_right_sizing_method: target_instance_type_right_sizing_method)
        update_launch_configuration_template(input)
      end

      def update_launch_configuration_template(input : Types::UpdateLaunchConfigurationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LAUNCH_CONFIGURATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to update a ReplicationConfiguration by Source Server ID.

      def update_replication_configuration(
        source_server_id : String,
        associate_default_security_group : Bool? = nil,
        auto_replicate_new_disks : Bool? = nil,
        bandwidth_throttling : Int64? = nil,
        create_public_ip : Bool? = nil,
        data_plane_routing : String? = nil,
        default_large_staging_disk_type : String? = nil,
        ebs_encryption : String? = nil,
        ebs_encryption_key_arn : String? = nil,
        name : String? = nil,
        pit_policy : Array(Types::PITPolicyRule)? = nil,
        replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)? = nil,
        replication_server_instance_type : String? = nil,
        replication_servers_security_groups_i_ds : Array(String)? = nil,
        staging_area_subnet_id : String? = nil,
        staging_area_tags : Hash(String, String)? = nil,
        use_dedicated_replication_server : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateReplicationConfigurationRequest.new(source_server_id: source_server_id, associate_default_security_group: associate_default_security_group, auto_replicate_new_disks: auto_replicate_new_disks, bandwidth_throttling: bandwidth_throttling, create_public_ip: create_public_ip, data_plane_routing: data_plane_routing, default_large_staging_disk_type: default_large_staging_disk_type, ebs_encryption: ebs_encryption, ebs_encryption_key_arn: ebs_encryption_key_arn, name: name, pit_policy: pit_policy, replicated_disks: replicated_disks, replication_server_instance_type: replication_server_instance_type, replication_servers_security_groups_i_ds: replication_servers_security_groups_i_ds, staging_area_subnet_id: staging_area_subnet_id, staging_area_tags: staging_area_tags, use_dedicated_replication_server: use_dedicated_replication_server)
        update_replication_configuration(input)
      end

      def update_replication_configuration(input : Types::UpdateReplicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a ReplicationConfigurationTemplate by ID.

      def update_replication_configuration_template(
        replication_configuration_template_id : String,
        arn : String? = nil,
        associate_default_security_group : Bool? = nil,
        auto_replicate_new_disks : Bool? = nil,
        bandwidth_throttling : Int64? = nil,
        create_public_ip : Bool? = nil,
        data_plane_routing : String? = nil,
        default_large_staging_disk_type : String? = nil,
        ebs_encryption : String? = nil,
        ebs_encryption_key_arn : String? = nil,
        pit_policy : Array(Types::PITPolicyRule)? = nil,
        replication_server_instance_type : String? = nil,
        replication_servers_security_groups_i_ds : Array(String)? = nil,
        staging_area_subnet_id : String? = nil,
        staging_area_tags : Hash(String, String)? = nil,
        use_dedicated_replication_server : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateReplicationConfigurationTemplateRequest.new(replication_configuration_template_id: replication_configuration_template_id, arn: arn, associate_default_security_group: associate_default_security_group, auto_replicate_new_disks: auto_replicate_new_disks, bandwidth_throttling: bandwidth_throttling, create_public_ip: create_public_ip, data_plane_routing: data_plane_routing, default_large_staging_disk_type: default_large_staging_disk_type, ebs_encryption: ebs_encryption, ebs_encryption_key_arn: ebs_encryption_key_arn, pit_policy: pit_policy, replication_server_instance_type: replication_server_instance_type, replication_servers_security_groups_i_ds: replication_servers_security_groups_i_ds, staging_area_subnet_id: staging_area_subnet_id, staging_area_tags: staging_area_tags, use_dedicated_replication_server: use_dedicated_replication_server)
        update_replication_configuration_template(input)
      end

      def update_replication_configuration_template(input : Types::UpdateReplicationConfigurationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPLICATION_CONFIGURATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
