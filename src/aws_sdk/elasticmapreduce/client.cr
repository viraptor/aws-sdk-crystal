module AwsSdk
  module EMR
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

      # Adds an instance fleet to a running cluster. The instance fleet configuration is available only in
      # Amazon EMR releases 4.8.0 and later, excluding 5.0.x.
      def add_instance_fleet(
        cluster_id : String,
        instance_fleet : Types::InstanceFleetConfig
      ) : Types::AddInstanceFleetOutput
        input = Types::AddInstanceFleetInput.new(cluster_id: cluster_id, instance_fleet: instance_fleet)
        add_instance_fleet(input)
      end
      def add_instance_fleet(input : Types::AddInstanceFleetInput) : Types::AddInstanceFleetOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_INSTANCE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddInstanceFleetOutput, "AddInstanceFleet")
      end

      # Adds one or more instance groups to a running cluster.
      def add_instance_groups(
        instance_groups : Array(Types::InstanceGroupConfig),
        job_flow_id : String
      ) : Types::AddInstanceGroupsOutput
        input = Types::AddInstanceGroupsInput.new(instance_groups: instance_groups, job_flow_id: job_flow_id)
        add_instance_groups(input)
      end
      def add_instance_groups(input : Types::AddInstanceGroupsInput) : Types::AddInstanceGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_INSTANCE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddInstanceGroupsOutput, "AddInstanceGroups")
      end

      # AddJobFlowSteps adds new steps to a running cluster. A maximum of 256 steps are allowed in each job
      # flow. If your cluster is long-running (such as a Hive data warehouse) or complex, you may require
      # more than 256 steps to process your data. You can bypass the 256-step limitation in various ways,
      # including using SSH to connect to the master node and submitting queries directly to the software
      # running on the master node, such as Hive and Hadoop. A step specifies the location of a JAR file
      # stored either on the master node of the cluster or in Amazon S3. Each step is performed by the main
      # function of the main class of the JAR file. The main class can be specified either in the manifest
      # of the JAR or by using the MainFunction parameter of the step. Amazon EMR executes each step in the
      # order listed. For a step to be considered complete, the main function must exit with a zero exit
      # code and all Hadoop jobs started while the step was running must have completed and run
      # successfully. You can only add steps to a cluster that is in one of the following states: STARTING,
      # BOOTSTRAPPING, RUNNING, or WAITING. The string values passed into HadoopJarStep object cannot exceed
      # a total of 10240 characters.
      def add_job_flow_steps(
        job_flow_id : String,
        steps : Array(Types::StepConfig),
        execution_role_arn : String? = nil
      ) : Types::AddJobFlowStepsOutput
        input = Types::AddJobFlowStepsInput.new(job_flow_id: job_flow_id, steps: steps, execution_role_arn: execution_role_arn)
        add_job_flow_steps(input)
      end
      def add_job_flow_steps(input : Types::AddJobFlowStepsInput) : Types::AddJobFlowStepsOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_JOB_FLOW_STEPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddJobFlowStepsOutput, "AddJobFlowSteps")
      end

      # Adds tags to an Amazon EMR resource, such as a cluster or an Amazon EMR Studio. Tags make it easier
      # to associate resources in various ways, such as grouping clusters to track your Amazon EMR resource
      # allocation costs. For more information, see Tag Clusters .
      def add_tags(
        resource_id : String,
        tags : Array(Types::Tag)
      ) : Types::AddTagsOutput
        input = Types::AddTagsInput.new(resource_id: resource_id, tags: tags)
        add_tags(input)
      end
      def add_tags(input : Types::AddTagsInput) : Types::AddTagsOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsOutput, "AddTags")
      end

      # Cancels a pending step or steps in a running cluster. Available only in Amazon EMR versions 4.8.0
      # and later, excluding version 5.0.0. A maximum of 256 steps are allowed in each CancelSteps request.
      # CancelSteps is idempotent but asynchronous; it does not guarantee that a step will be canceled, even
      # if the request is successfully submitted. When you use Amazon EMR releases 5.28.0 and later, you can
      # cancel steps that are in a PENDING or RUNNING state. In earlier versions of Amazon EMR, you can only
      # cancel steps that are in a PENDING state.
      def cancel_steps(
        cluster_id : String,
        step_ids : Array(String),
        step_cancellation_option : String? = nil
      ) : Types::CancelStepsOutput
        input = Types::CancelStepsInput.new(cluster_id: cluster_id, step_ids: step_ids, step_cancellation_option: step_cancellation_option)
        cancel_steps(input)
      end
      def cancel_steps(input : Types::CancelStepsInput) : Types::CancelStepsOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_STEPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelStepsOutput, "CancelSteps")
      end

      # Creates a persistent application user interface.
      def create_persistent_app_ui(
        target_resource_arn : String,
        emr_containers_config : Types::EMRContainersConfig? = nil,
        profiler_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        x_referer : String? = nil
      ) : Types::CreatePersistentAppUIOutput
        input = Types::CreatePersistentAppUIInput.new(target_resource_arn: target_resource_arn, emr_containers_config: emr_containers_config, profiler_type: profiler_type, tags: tags, x_referer: x_referer)
        create_persistent_app_ui(input)
      end
      def create_persistent_app_ui(input : Types::CreatePersistentAppUIInput) : Types::CreatePersistentAppUIOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PERSISTENT_APP_UI, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePersistentAppUIOutput, "CreatePersistentAppUI")
      end

      # Creates a security configuration, which is stored in the service and can be specified when a cluster
      # is created.
      def create_security_configuration(
        name : String,
        security_configuration : String
      ) : Types::CreateSecurityConfigurationOutput
        input = Types::CreateSecurityConfigurationInput.new(name: name, security_configuration: security_configuration)
        create_security_configuration(input)
      end
      def create_security_configuration(input : Types::CreateSecurityConfigurationInput) : Types::CreateSecurityConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SECURITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSecurityConfigurationOutput, "CreateSecurityConfiguration")
      end

      # Creates a new Amazon EMR Studio.
      def create_studio(
        auth_mode : String,
        default_s3_location : String,
        engine_security_group_id : String,
        name : String,
        service_role : String,
        subnet_ids : Array(String),
        vpc_id : String,
        workspace_security_group_id : String,
        description : String? = nil,
        encryption_key_arn : String? = nil,
        idc_instance_arn : String? = nil,
        idc_user_assignment : String? = nil,
        idp_auth_url : String? = nil,
        idp_relay_state_parameter_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        trusted_identity_propagation_enabled : Bool? = nil,
        user_role : String? = nil
      ) : Types::CreateStudioOutput
        input = Types::CreateStudioInput.new(auth_mode: auth_mode, default_s3_location: default_s3_location, engine_security_group_id: engine_security_group_id, name: name, service_role: service_role, subnet_ids: subnet_ids, vpc_id: vpc_id, workspace_security_group_id: workspace_security_group_id, description: description, encryption_key_arn: encryption_key_arn, idc_instance_arn: idc_instance_arn, idc_user_assignment: idc_user_assignment, idp_auth_url: idp_auth_url, idp_relay_state_parameter_name: idp_relay_state_parameter_name, tags: tags, trusted_identity_propagation_enabled: trusted_identity_propagation_enabled, user_role: user_role)
        create_studio(input)
      end
      def create_studio(input : Types::CreateStudioInput) : Types::CreateStudioOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_STUDIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStudioOutput, "CreateStudio")
      end

      # Maps a user or group to the Amazon EMR Studio specified by StudioId , and applies a session policy
      # to refine Studio permissions for that user or group. Use CreateStudioSessionMapping to assign users
      # to a Studio when you use IAM Identity Center authentication. For instructions on how to assign users
      # to a Studio when you use IAM authentication, see Assign a user or group to your EMR Studio .
      def create_studio_session_mapping(
        identity_type : String,
        session_policy_arn : String,
        studio_id : String,
        identity_id : String? = nil,
        identity_name : String? = nil
      ) : Nil
        input = Types::CreateStudioSessionMappingInput.new(identity_type: identity_type, session_policy_arn: session_policy_arn, studio_id: studio_id, identity_id: identity_id, identity_name: identity_name)
        create_studio_session_mapping(input)
      end
      def create_studio_session_mapping(input : Types::CreateStudioSessionMappingInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::CREATE_STUDIO_SESSION_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a security configuration.
      def delete_security_configuration(
        name : String
      ) : Types::DeleteSecurityConfigurationOutput
        input = Types::DeleteSecurityConfigurationInput.new(name: name)
        delete_security_configuration(input)
      end
      def delete_security_configuration(input : Types::DeleteSecurityConfigurationInput) : Types::DeleteSecurityConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_SECURITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSecurityConfigurationOutput, "DeleteSecurityConfiguration")
      end

      # Removes an Amazon EMR Studio from the Studio metadata store.
      def delete_studio(
        studio_id : String
      ) : Nil
        input = Types::DeleteStudioInput.new(studio_id: studio_id)
        delete_studio(input)
      end
      def delete_studio(input : Types::DeleteStudioInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_STUDIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes a user or group from an Amazon EMR Studio.
      def delete_studio_session_mapping(
        identity_type : String,
        studio_id : String,
        identity_id : String? = nil,
        identity_name : String? = nil
      ) : Nil
        input = Types::DeleteStudioSessionMappingInput.new(identity_type: identity_type, studio_id: studio_id, identity_id: identity_id, identity_name: identity_name)
        delete_studio_session_mapping(input)
      end
      def delete_studio_session_mapping(input : Types::DeleteStudioSessionMappingInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_STUDIO_SESSION_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Provides cluster-level details including status, hardware and software configuration, VPC settings,
      # and so on.
      def describe_cluster(
        cluster_id : String
      ) : Types::DescribeClusterOutput
        input = Types::DescribeClusterInput.new(cluster_id: cluster_id)
        describe_cluster(input)
      end
      def describe_cluster(input : Types::DescribeClusterInput) : Types::DescribeClusterOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClusterOutput, "DescribeCluster")
      end

      # This API is no longer supported and will eventually be removed. We recommend you use ListClusters ,
      # DescribeCluster , ListSteps , ListInstanceGroups and ListBootstrapActions instead. DescribeJobFlows
      # returns a list of job flows that match all of the supplied parameters. The parameters can include a
      # list of job flow IDs, job flow states, and restrictions on job flow creation date and time.
      # Regardless of supplied parameters, only job flows created within the last two months are returned.
      # If no parameters are supplied, then job flows matching either of the following criteria are
      # returned: Job flows created and completed in the last two weeks Job flows created within the last
      # two months that are in one of the following states: RUNNING , WAITING , SHUTTING_DOWN , STARTING
      # Amazon EMR can return a maximum of 512 job flow descriptions.
      def describe_job_flows(
        created_after : Time? = nil,
        created_before : Time? = nil,
        job_flow_ids : Array(String)? = nil,
        job_flow_states : Array(String)? = nil
      ) : Types::DescribeJobFlowsOutput
        input = Types::DescribeJobFlowsInput.new(created_after: created_after, created_before: created_before, job_flow_ids: job_flow_ids, job_flow_states: job_flow_states)
        describe_job_flows(input)
      end
      def describe_job_flows(input : Types::DescribeJobFlowsInput) : Types::DescribeJobFlowsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_JOB_FLOWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeJobFlowsOutput, "DescribeJobFlows")
      end

      # Provides details of a notebook execution.
      def describe_notebook_execution(
        notebook_execution_id : String
      ) : Types::DescribeNotebookExecutionOutput
        input = Types::DescribeNotebookExecutionInput.new(notebook_execution_id: notebook_execution_id)
        describe_notebook_execution(input)
      end
      def describe_notebook_execution(input : Types::DescribeNotebookExecutionInput) : Types::DescribeNotebookExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_NOTEBOOK_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeNotebookExecutionOutput, "DescribeNotebookExecution")
      end

      # Describes a persistent application user interface.
      def describe_persistent_app_ui(
        persistent_app_ui_id : String
      ) : Types::DescribePersistentAppUIOutput
        input = Types::DescribePersistentAppUIInput.new(persistent_app_ui_id: persistent_app_ui_id)
        describe_persistent_app_ui(input)
      end
      def describe_persistent_app_ui(input : Types::DescribePersistentAppUIInput) : Types::DescribePersistentAppUIOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PERSISTENT_APP_UI, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePersistentAppUIOutput, "DescribePersistentAppUI")
      end

      # Provides Amazon EMR release label details, such as the releases available the Region where the API
      # request is run, and the available applications for a specific Amazon EMR release label. Can also
      # list Amazon EMR releases that support a specified version of Spark.
      def describe_release_label(
        max_results : Int32? = nil,
        next_token : String? = nil,
        release_label : String? = nil
      ) : Types::DescribeReleaseLabelOutput
        input = Types::DescribeReleaseLabelInput.new(max_results: max_results, next_token: next_token, release_label: release_label)
        describe_release_label(input)
      end
      def describe_release_label(input : Types::DescribeReleaseLabelInput) : Types::DescribeReleaseLabelOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RELEASE_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReleaseLabelOutput, "DescribeReleaseLabel")
      end

      # Provides the details of a security configuration by returning the configuration JSON.
      def describe_security_configuration(
        name : String
      ) : Types::DescribeSecurityConfigurationOutput
        input = Types::DescribeSecurityConfigurationInput.new(name: name)
        describe_security_configuration(input)
      end
      def describe_security_configuration(input : Types::DescribeSecurityConfigurationInput) : Types::DescribeSecurityConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SECURITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSecurityConfigurationOutput, "DescribeSecurityConfiguration")
      end

      # Provides more detail about the cluster step.
      def describe_step(
        cluster_id : String,
        step_id : String
      ) : Types::DescribeStepOutput
        input = Types::DescribeStepInput.new(cluster_id: cluster_id, step_id: step_id)
        describe_step(input)
      end
      def describe_step(input : Types::DescribeStepInput) : Types::DescribeStepOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STEP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStepOutput, "DescribeStep")
      end

      # Returns details for the specified Amazon EMR Studio including ID, Name, VPC, Studio access URL, and
      # so on.
      def describe_studio(
        studio_id : String
      ) : Types::DescribeStudioOutput
        input = Types::DescribeStudioInput.new(studio_id: studio_id)
        describe_studio(input)
      end
      def describe_studio(input : Types::DescribeStudioInput) : Types::DescribeStudioOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STUDIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStudioOutput, "DescribeStudio")
      end

      # Returns the auto-termination policy for an Amazon EMR cluster.
      def get_auto_termination_policy(
        cluster_id : String
      ) : Types::GetAutoTerminationPolicyOutput
        input = Types::GetAutoTerminationPolicyInput.new(cluster_id: cluster_id)
        get_auto_termination_policy(input)
      end
      def get_auto_termination_policy(input : Types::GetAutoTerminationPolicyInput) : Types::GetAutoTerminationPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_AUTO_TERMINATION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAutoTerminationPolicyOutput, "GetAutoTerminationPolicy")
      end

      # Returns the Amazon EMR block public access configuration for your Amazon Web Services account in the
      # current Region. For more information see Configure Block Public Access for Amazon EMR in the Amazon
      # EMR Management Guide .
      def get_block_public_access_configuration : Types::GetBlockPublicAccessConfigurationOutput
        input = Types::GetBlockPublicAccessConfigurationInput.new
        get_block_public_access_configuration(input)
      end
      def get_block_public_access_configuration(input : Types::GetBlockPublicAccessConfigurationInput) : Types::GetBlockPublicAccessConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::GET_BLOCK_PUBLIC_ACCESS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBlockPublicAccessConfigurationOutput, "GetBlockPublicAccessConfiguration")
      end

      # Provides temporary, HTTP basic credentials that are associated with a given runtime IAM role and
      # used by a cluster with fine-grained access control activated. You can use these credentials to
      # connect to cluster endpoints that support username and password authentication.
      def get_cluster_session_credentials(
        cluster_id : String,
        execution_role_arn : String? = nil
      ) : Types::GetClusterSessionCredentialsOutput
        input = Types::GetClusterSessionCredentialsInput.new(cluster_id: cluster_id, execution_role_arn: execution_role_arn)
        get_cluster_session_credentials(input)
      end
      def get_cluster_session_credentials(input : Types::GetClusterSessionCredentialsInput) : Types::GetClusterSessionCredentialsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CLUSTER_SESSION_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetClusterSessionCredentialsOutput, "GetClusterSessionCredentials")
      end

      # Fetches the attached managed scaling policy for an Amazon EMR cluster.
      def get_managed_scaling_policy(
        cluster_id : String
      ) : Types::GetManagedScalingPolicyOutput
        input = Types::GetManagedScalingPolicyInput.new(cluster_id: cluster_id)
        get_managed_scaling_policy(input)
      end
      def get_managed_scaling_policy(input : Types::GetManagedScalingPolicyInput) : Types::GetManagedScalingPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_MANAGED_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetManagedScalingPolicyOutput, "GetManagedScalingPolicy")
      end

      # The presigned URL properties for the cluster's application user interface.
      def get_on_cluster_app_ui_presigned_url(
        cluster_id : String,
        application_id : String? = nil,
        dry_run : Bool? = nil,
        execution_role_arn : String? = nil,
        on_cluster_app_ui_type : String? = nil
      ) : Types::GetOnClusterAppUIPresignedURLOutput
        input = Types::GetOnClusterAppUIPresignedURLInput.new(cluster_id: cluster_id, application_id: application_id, dry_run: dry_run, execution_role_arn: execution_role_arn, on_cluster_app_ui_type: on_cluster_app_ui_type)
        get_on_cluster_app_ui_presigned_url(input)
      end
      def get_on_cluster_app_ui_presigned_url(input : Types::GetOnClusterAppUIPresignedURLInput) : Types::GetOnClusterAppUIPresignedURLOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ON_CLUSTER_APP_UI_PRESIGNED_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOnClusterAppUIPresignedURLOutput, "GetOnClusterAppUIPresignedURL")
      end

      # The presigned URL properties for the cluster's application user interface.
      def get_persistent_app_ui_presigned_url(
        persistent_app_ui_id : String,
        application_id : String? = nil,
        auth_proxy_call : Bool? = nil,
        execution_role_arn : String? = nil,
        persistent_app_ui_type : String? = nil
      ) : Types::GetPersistentAppUIPresignedURLOutput
        input = Types::GetPersistentAppUIPresignedURLInput.new(persistent_app_ui_id: persistent_app_ui_id, application_id: application_id, auth_proxy_call: auth_proxy_call, execution_role_arn: execution_role_arn, persistent_app_ui_type: persistent_app_ui_type)
        get_persistent_app_ui_presigned_url(input)
      end
      def get_persistent_app_ui_presigned_url(input : Types::GetPersistentAppUIPresignedURLInput) : Types::GetPersistentAppUIPresignedURLOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PERSISTENT_APP_UI_PRESIGNED_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPersistentAppUIPresignedURLOutput, "GetPersistentAppUIPresignedURL")
      end

      # Fetches mapping details for the specified Amazon EMR Studio and identity (user or group).
      def get_studio_session_mapping(
        identity_type : String,
        studio_id : String,
        identity_id : String? = nil,
        identity_name : String? = nil
      ) : Types::GetStudioSessionMappingOutput
        input = Types::GetStudioSessionMappingInput.new(identity_type: identity_type, studio_id: studio_id, identity_id: identity_id, identity_name: identity_name)
        get_studio_session_mapping(input)
      end
      def get_studio_session_mapping(input : Types::GetStudioSessionMappingInput) : Types::GetStudioSessionMappingOutput
        request = Protocol::JsonRpc.build_request(Model::GET_STUDIO_SESSION_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetStudioSessionMappingOutput, "GetStudioSessionMapping")
      end

      # Provides information about the bootstrap actions associated with a cluster.
      def list_bootstrap_actions(
        cluster_id : String,
        marker : String? = nil
      ) : Types::ListBootstrapActionsOutput
        input = Types::ListBootstrapActionsInput.new(cluster_id: cluster_id, marker: marker)
        list_bootstrap_actions(input)
      end
      def list_bootstrap_actions(input : Types::ListBootstrapActionsInput) : Types::ListBootstrapActionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BOOTSTRAP_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBootstrapActionsOutput, "ListBootstrapActions")
      end

      # Provides the status of all clusters visible to this Amazon Web Services account. Allows you to
      # filter the list of clusters based on certain criteria; for example, filtering by cluster creation
      # date and time or by status. This call returns a maximum of 50 clusters in unsorted order per call,
      # but returns a marker to track the paging of the cluster list across multiple ListClusters calls.
      def list_clusters(
        cluster_states : Array(String)? = nil,
        created_after : Time? = nil,
        created_before : Time? = nil,
        marker : String? = nil
      ) : Types::ListClustersOutput
        input = Types::ListClustersInput.new(cluster_states: cluster_states, created_after: created_after, created_before: created_before, marker: marker)
        list_clusters(input)
      end
      def list_clusters(input : Types::ListClustersInput) : Types::ListClustersOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListClustersOutput, "ListClusters")
      end

      # Lists all available details about the instance fleets in a cluster. The instance fleet configuration
      # is available only in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions.
      def list_instance_fleets(
        cluster_id : String,
        marker : String? = nil
      ) : Types::ListInstanceFleetsOutput
        input = Types::ListInstanceFleetsInput.new(cluster_id: cluster_id, marker: marker)
        list_instance_fleets(input)
      end
      def list_instance_fleets(input : Types::ListInstanceFleetsInput) : Types::ListInstanceFleetsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_INSTANCE_FLEETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInstanceFleetsOutput, "ListInstanceFleets")
      end

      # Provides all available details about the instance groups in a cluster.
      def list_instance_groups(
        cluster_id : String,
        marker : String? = nil
      ) : Types::ListInstanceGroupsOutput
        input = Types::ListInstanceGroupsInput.new(cluster_id: cluster_id, marker: marker)
        list_instance_groups(input)
      end
      def list_instance_groups(input : Types::ListInstanceGroupsInput) : Types::ListInstanceGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_INSTANCE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInstanceGroupsOutput, "ListInstanceGroups")
      end

      # Provides information for all active Amazon EC2 instances and Amazon EC2 instances terminated in the
      # last 30 days, up to a maximum of 2,000. Amazon EC2 instances in any of the following states are
      # considered active: AWAITING_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.
      def list_instances(
        cluster_id : String,
        instance_fleet_id : String? = nil,
        instance_fleet_type : String? = nil,
        instance_group_id : String? = nil,
        instance_group_types : Array(String)? = nil,
        instance_states : Array(String)? = nil,
        marker : String? = nil
      ) : Types::ListInstancesOutput
        input = Types::ListInstancesInput.new(cluster_id: cluster_id, instance_fleet_id: instance_fleet_id, instance_fleet_type: instance_fleet_type, instance_group_id: instance_group_id, instance_group_types: instance_group_types, instance_states: instance_states, marker: marker)
        list_instances(input)
      end
      def list_instances(input : Types::ListInstancesInput) : Types::ListInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInstancesOutput, "ListInstances")
      end

      # Provides summaries of all notebook executions. You can filter the list based on multiple criteria
      # such as status, time range, and editor id. Returns a maximum of 50 notebook executions and a marker
      # to track the paging of a longer notebook execution list across multiple ListNotebookExecutions
      # calls.
      def list_notebook_executions(
        editor_id : String? = nil,
        execution_engine_id : String? = nil,
        from : Time? = nil,
        marker : String? = nil,
        status : String? = nil,
        to : Time? = nil
      ) : Types::ListNotebookExecutionsOutput
        input = Types::ListNotebookExecutionsInput.new(editor_id: editor_id, execution_engine_id: execution_engine_id, from: from, marker: marker, status: status, to: to)
        list_notebook_executions(input)
      end
      def list_notebook_executions(input : Types::ListNotebookExecutionsInput) : Types::ListNotebookExecutionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_NOTEBOOK_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNotebookExecutionsOutput, "ListNotebookExecutions")
      end

      # Retrieves release labels of Amazon EMR services in the Region where the API is called.
      def list_release_labels(
        filters : Types::ReleaseLabelFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListReleaseLabelsOutput
        input = Types::ListReleaseLabelsInput.new(filters: filters, max_results: max_results, next_token: next_token)
        list_release_labels(input)
      end
      def list_release_labels(input : Types::ListReleaseLabelsInput) : Types::ListReleaseLabelsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_RELEASE_LABELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReleaseLabelsOutput, "ListReleaseLabels")
      end

      # Lists all the security configurations visible to this account, providing their creation dates and
      # times, and their names. This call returns a maximum of 50 clusters per call, but returns a marker to
      # track the paging of the cluster list across multiple ListSecurityConfigurations calls.
      def list_security_configurations(
        marker : String? = nil
      ) : Types::ListSecurityConfigurationsOutput
        input = Types::ListSecurityConfigurationsInput.new(marker: marker)
        list_security_configurations(input)
      end
      def list_security_configurations(input : Types::ListSecurityConfigurationsInput) : Types::ListSecurityConfigurationsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SECURITY_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSecurityConfigurationsOutput, "ListSecurityConfigurations")
      end

      # Provides a list of steps for the cluster in reverse order unless you specify stepIds with the
      # request or filter by StepStates . You can specify a maximum of 10 stepIDs . The CLI automatically
      # paginates results to return a list greater than 50 steps. To return more than 50 steps using the
      # CLI, specify a Marker , which is a pagination token that indicates the next set of steps to
      # retrieve.
      def list_steps(
        cluster_id : String,
        marker : String? = nil,
        step_ids : Array(String)? = nil,
        step_states : Array(String)? = nil
      ) : Types::ListStepsOutput
        input = Types::ListStepsInput.new(cluster_id: cluster_id, marker: marker, step_ids: step_ids, step_states: step_states)
        list_steps(input)
      end
      def list_steps(input : Types::ListStepsInput) : Types::ListStepsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STEPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStepsOutput, "ListSteps")
      end

      # Returns a list of all user or group session mappings for the Amazon EMR Studio specified by StudioId
      # .
      def list_studio_session_mappings(
        identity_type : String? = nil,
        marker : String? = nil,
        studio_id : String? = nil
      ) : Types::ListStudioSessionMappingsOutput
        input = Types::ListStudioSessionMappingsInput.new(identity_type: identity_type, marker: marker, studio_id: studio_id)
        list_studio_session_mappings(input)
      end
      def list_studio_session_mappings(input : Types::ListStudioSessionMappingsInput) : Types::ListStudioSessionMappingsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STUDIO_SESSION_MAPPINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStudioSessionMappingsOutput, "ListStudioSessionMappings")
      end

      # Returns a list of all Amazon EMR Studios associated with the Amazon Web Services account. The list
      # includes details such as ID, Studio Access URL, and creation time for each Studio.
      def list_studios(
        marker : String? = nil
      ) : Types::ListStudiosOutput
        input = Types::ListStudiosInput.new(marker: marker)
        list_studios(input)
      end
      def list_studios(input : Types::ListStudiosInput) : Types::ListStudiosOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STUDIOS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStudiosOutput, "ListStudios")
      end

      # A list of the instance types that Amazon EMR supports. You can filter the list by Amazon Web
      # Services Region and Amazon EMR release.
      def list_supported_instance_types(
        release_label : String,
        marker : String? = nil
      ) : Types::ListSupportedInstanceTypesOutput
        input = Types::ListSupportedInstanceTypesInput.new(release_label: release_label, marker: marker)
        list_supported_instance_types(input)
      end
      def list_supported_instance_types(input : Types::ListSupportedInstanceTypesInput) : Types::ListSupportedInstanceTypesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SUPPORTED_INSTANCE_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSupportedInstanceTypesOutput, "ListSupportedInstanceTypes")
      end

      # Modifies the number of steps that can be executed concurrently for the cluster specified using
      # ClusterID.
      def modify_cluster(
        cluster_id : String,
        extended_support : Bool? = nil,
        step_concurrency_level : Int32? = nil
      ) : Types::ModifyClusterOutput
        input = Types::ModifyClusterInput.new(cluster_id: cluster_id, extended_support: extended_support, step_concurrency_level: step_concurrency_level)
        modify_cluster(input)
      end
      def modify_cluster(input : Types::ModifyClusterInput) : Types::ModifyClusterOutput
        request = Protocol::JsonRpc.build_request(Model::MODIFY_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyClusterOutput, "ModifyCluster")
      end

      # Modifies the target On-Demand and target Spot capacities for the instance fleet with the specified
      # InstanceFleetID within the cluster specified using ClusterID. The call either succeeds or fails
      # atomically. The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and
      # later, excluding 5.0.x versions.
      def modify_instance_fleet(
        cluster_id : String,
        instance_fleet : Types::InstanceFleetModifyConfig
      ) : Nil
        input = Types::ModifyInstanceFleetInput.new(cluster_id: cluster_id, instance_fleet: instance_fleet)
        modify_instance_fleet(input)
      end
      def modify_instance_fleet(input : Types::ModifyInstanceFleetInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::MODIFY_INSTANCE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # ModifyInstanceGroups modifies the number of nodes and configuration settings of an instance group.
      # The input parameters include the new target instance count for the group and the instance group ID.
      # The call will either succeed or fail atomically.
      def modify_instance_groups(
        cluster_id : String? = nil,
        instance_groups : Array(Types::InstanceGroupModifyConfig)? = nil
      ) : Nil
        input = Types::ModifyInstanceGroupsInput.new(cluster_id: cluster_id, instance_groups: instance_groups)
        modify_instance_groups(input)
      end
      def modify_instance_groups(input : Types::ModifyInstanceGroupsInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::MODIFY_INSTANCE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates or updates an automatic scaling policy for a core instance group or task instance group in
      # an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds
      # and terminates Amazon EC2 instances in response to the value of a CloudWatch metric.
      def put_auto_scaling_policy(
        auto_scaling_policy : Types::AutoScalingPolicy,
        cluster_id : String,
        instance_group_id : String
      ) : Types::PutAutoScalingPolicyOutput
        input = Types::PutAutoScalingPolicyInput.new(auto_scaling_policy: auto_scaling_policy, cluster_id: cluster_id, instance_group_id: instance_group_id)
        put_auto_scaling_policy(input)
      end
      def put_auto_scaling_policy(input : Types::PutAutoScalingPolicyInput) : Types::PutAutoScalingPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_AUTO_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAutoScalingPolicyOutput, "PutAutoScalingPolicy")
      end

      # Auto-termination is supported in Amazon EMR releases 5.30.0 and 6.1.0 and later. For more
      # information, see Using an auto-termination policy . Creates or updates an auto-termination policy
      # for an Amazon EMR cluster. An auto-termination policy defines the amount of idle time in seconds
      # after which a cluster automatically terminates. For alternative cluster termination options, see
      # Control cluster termination .
      def put_auto_termination_policy(
        cluster_id : String,
        auto_termination_policy : Types::AutoTerminationPolicy? = nil
      ) : Types::PutAutoTerminationPolicyOutput
        input = Types::PutAutoTerminationPolicyInput.new(cluster_id: cluster_id, auto_termination_policy: auto_termination_policy)
        put_auto_termination_policy(input)
      end
      def put_auto_termination_policy(input : Types::PutAutoTerminationPolicyInput) : Types::PutAutoTerminationPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_AUTO_TERMINATION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAutoTerminationPolicyOutput, "PutAutoTerminationPolicy")
      end

      # Creates or updates an Amazon EMR block public access configuration for your Amazon Web Services
      # account in the current Region. For more information see Configure Block Public Access for Amazon EMR
      # in the Amazon EMR Management Guide .
      def put_block_public_access_configuration(
        block_public_access_configuration : Types::BlockPublicAccessConfiguration
      ) : Types::PutBlockPublicAccessConfigurationOutput
        input = Types::PutBlockPublicAccessConfigurationInput.new(block_public_access_configuration: block_public_access_configuration)
        put_block_public_access_configuration(input)
      end
      def put_block_public_access_configuration(input : Types::PutBlockPublicAccessConfigurationInput) : Types::PutBlockPublicAccessConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_BLOCK_PUBLIC_ACCESS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutBlockPublicAccessConfigurationOutput, "PutBlockPublicAccessConfiguration")
      end

      # Creates or updates a managed scaling policy for an Amazon EMR cluster. The managed scaling policy
      # defines the limits for resources, such as Amazon EC2 instances that can be added or terminated from
      # a cluster. The policy only applies to the core and task nodes. The master node cannot be scaled
      # after initial configuration.
      def put_managed_scaling_policy(
        cluster_id : String,
        managed_scaling_policy : Types::ManagedScalingPolicy
      ) : Types::PutManagedScalingPolicyOutput
        input = Types::PutManagedScalingPolicyInput.new(cluster_id: cluster_id, managed_scaling_policy: managed_scaling_policy)
        put_managed_scaling_policy(input)
      end
      def put_managed_scaling_policy(input : Types::PutManagedScalingPolicyInput) : Types::PutManagedScalingPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_MANAGED_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutManagedScalingPolicyOutput, "PutManagedScalingPolicy")
      end

      # Removes an automatic scaling policy from a specified instance group within an Amazon EMR cluster.
      def remove_auto_scaling_policy(
        cluster_id : String,
        instance_group_id : String
      ) : Types::RemoveAutoScalingPolicyOutput
        input = Types::RemoveAutoScalingPolicyInput.new(cluster_id: cluster_id, instance_group_id: instance_group_id)
        remove_auto_scaling_policy(input)
      end
      def remove_auto_scaling_policy(input : Types::RemoveAutoScalingPolicyInput) : Types::RemoveAutoScalingPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::REMOVE_AUTO_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveAutoScalingPolicyOutput, "RemoveAutoScalingPolicy")
      end

      # Removes an auto-termination policy from an Amazon EMR cluster.
      def remove_auto_termination_policy(
        cluster_id : String
      ) : Types::RemoveAutoTerminationPolicyOutput
        input = Types::RemoveAutoTerminationPolicyInput.new(cluster_id: cluster_id)
        remove_auto_termination_policy(input)
      end
      def remove_auto_termination_policy(input : Types::RemoveAutoTerminationPolicyInput) : Types::RemoveAutoTerminationPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::REMOVE_AUTO_TERMINATION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveAutoTerminationPolicyOutput, "RemoveAutoTerminationPolicy")
      end

      # Removes a managed scaling policy from a specified Amazon EMR cluster.
      def remove_managed_scaling_policy(
        cluster_id : String
      ) : Types::RemoveManagedScalingPolicyOutput
        input = Types::RemoveManagedScalingPolicyInput.new(cluster_id: cluster_id)
        remove_managed_scaling_policy(input)
      end
      def remove_managed_scaling_policy(input : Types::RemoveManagedScalingPolicyInput) : Types::RemoveManagedScalingPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::REMOVE_MANAGED_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveManagedScalingPolicyOutput, "RemoveManagedScalingPolicy")
      end

      # Removes tags from an Amazon EMR resource, such as a cluster or Amazon EMR Studio. Tags make it
      # easier to associate resources in various ways, such as grouping clusters to track your Amazon EMR
      # resource allocation costs. For more information, see Tag Clusters . The following example removes
      # the stack tag with value Prod from a cluster:
      def remove_tags(
        resource_id : String,
        tag_keys : Array(String)
      ) : Types::RemoveTagsOutput
        input = Types::RemoveTagsInput.new(resource_id: resource_id, tag_keys: tag_keys)
        remove_tags(input)
      end
      def remove_tags(input : Types::RemoveTagsInput) : Types::RemoveTagsOutput
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveTagsOutput, "RemoveTags")
      end

      # RunJobFlow creates and starts running a new cluster (job flow). The cluster runs the steps
      # specified. After the steps complete, the cluster stops and the HDFS partition is lost. To prevent
      # loss of data, configure the last step of the job flow to store results in Amazon S3. If the
      # JobFlowInstancesConfig KeepJobFlowAliveWhenNoSteps parameter is set to TRUE , the cluster
      # transitions to the WAITING state rather than shutting down after the steps have completed. For
      # additional protection, you can set the JobFlowInstancesConfig TerminationProtected parameter to TRUE
      # to lock the cluster and prevent it from being terminated by API call, user intervention, or in the
      # event of a job flow error. A maximum of 256 steps are allowed in each job flow. If your cluster is
      # long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to
      # process your data. You can bypass the 256-step limitation in various ways, including using the SSH
      # shell to connect to the master node and submitting queries directly to the software running on the
      # master node, such as Hive and Hadoop. For long-running clusters, we recommend that you periodically
      # store your results. The instance fleets configuration is available only in Amazon EMR releases 4.8.0
      # and later, excluding 5.0.x versions. The RunJobFlow request can contain InstanceFleets parameters or
      # InstanceGroups parameters, but not both.
      def run_job_flow(
        instances : Types::JobFlowInstancesConfig,
        name : String,
        additional_info : String? = nil,
        ami_version : String? = nil,
        applications : Array(Types::Application)? = nil,
        auto_scaling_role : String? = nil,
        auto_termination_policy : Types::AutoTerminationPolicy? = nil,
        bootstrap_actions : Array(Types::BootstrapActionConfig)? = nil,
        configurations : Array(Types::Configuration)? = nil,
        custom_ami_id : String? = nil,
        ebs_root_volume_iops : Int32? = nil,
        ebs_root_volume_size : Int32? = nil,
        ebs_root_volume_throughput : Int32? = nil,
        extended_support : Bool? = nil,
        job_flow_role : String? = nil,
        kerberos_attributes : Types::KerberosAttributes? = nil,
        log_encryption_kms_key_id : String? = nil,
        log_uri : String? = nil,
        managed_scaling_policy : Types::ManagedScalingPolicy? = nil,
        monitoring_configuration : Types::MonitoringConfiguration? = nil,
        new_supported_products : Array(Types::SupportedProductConfig)? = nil,
        os_release_label : String? = nil,
        placement_group_configs : Array(Types::PlacementGroupConfig)? = nil,
        release_label : String? = nil,
        repo_upgrade_on_boot : String? = nil,
        scale_down_behavior : String? = nil,
        security_configuration : String? = nil,
        service_role : String? = nil,
        step_concurrency_level : Int32? = nil,
        steps : Array(Types::StepConfig)? = nil,
        supported_products : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        visible_to_all_users : Bool? = nil
      ) : Types::RunJobFlowOutput
        input = Types::RunJobFlowInput.new(instances: instances, name: name, additional_info: additional_info, ami_version: ami_version, applications: applications, auto_scaling_role: auto_scaling_role, auto_termination_policy: auto_termination_policy, bootstrap_actions: bootstrap_actions, configurations: configurations, custom_ami_id: custom_ami_id, ebs_root_volume_iops: ebs_root_volume_iops, ebs_root_volume_size: ebs_root_volume_size, ebs_root_volume_throughput: ebs_root_volume_throughput, extended_support: extended_support, job_flow_role: job_flow_role, kerberos_attributes: kerberos_attributes, log_encryption_kms_key_id: log_encryption_kms_key_id, log_uri: log_uri, managed_scaling_policy: managed_scaling_policy, monitoring_configuration: monitoring_configuration, new_supported_products: new_supported_products, os_release_label: os_release_label, placement_group_configs: placement_group_configs, release_label: release_label, repo_upgrade_on_boot: repo_upgrade_on_boot, scale_down_behavior: scale_down_behavior, security_configuration: security_configuration, service_role: service_role, step_concurrency_level: step_concurrency_level, steps: steps, supported_products: supported_products, tags: tags, visible_to_all_users: visible_to_all_users)
        run_job_flow(input)
      end
      def run_job_flow(input : Types::RunJobFlowInput) : Types::RunJobFlowOutput
        request = Protocol::JsonRpc.build_request(Model::RUN_JOB_FLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RunJobFlowOutput, "RunJobFlow")
      end

      # You can use the SetKeepJobFlowAliveWhenNoSteps to configure a cluster (job flow) to terminate after
      # the step execution, i.e., all your steps are executed. If you want a transient cluster that shuts
      # down after the last of the current executing steps are completed, you can configure
      # SetKeepJobFlowAliveWhenNoSteps to false. If you want a long running cluster, configure
      # SetKeepJobFlowAliveWhenNoSteps to true. For more information, see Managing Cluster Termination in
      # the Amazon EMR Management Guide .
      def set_keep_job_flow_alive_when_no_steps(
        job_flow_ids : Array(String),
        keep_job_flow_alive_when_no_steps : Bool
      ) : Nil
        input = Types::SetKeepJobFlowAliveWhenNoStepsInput.new(job_flow_ids: job_flow_ids, keep_job_flow_alive_when_no_steps: keep_job_flow_alive_when_no_steps)
        set_keep_job_flow_alive_when_no_steps(input)
      end
      def set_keep_job_flow_alive_when_no_steps(input : Types::SetKeepJobFlowAliveWhenNoStepsInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::SET_KEEP_JOB_FLOW_ALIVE_WHEN_NO_STEPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # SetTerminationProtection locks a cluster (job flow) so the Amazon EC2 instances in the cluster
      # cannot be terminated by user intervention, an API call, or in the event of a job-flow error. The
      # cluster still terminates upon successful completion of the job flow. Calling
      # SetTerminationProtection on a cluster is similar to calling the Amazon EC2 DisableAPITermination API
      # on all Amazon EC2 instances in a cluster. SetTerminationProtection is used to prevent accidental
      # termination of a cluster and to ensure that in the event of an error, the instances persist so that
      # you can recover any data stored in their ephemeral instance storage. To terminate a cluster that has
      # been locked by setting SetTerminationProtection to true , you must first unlock the job flow by a
      # subsequent call to SetTerminationProtection in which you set the value to false . For more
      # information, see Managing Cluster Termination in the Amazon EMR Management Guide .
      def set_termination_protection(
        job_flow_ids : Array(String),
        termination_protected : Bool
      ) : Nil
        input = Types::SetTerminationProtectionInput.new(job_flow_ids: job_flow_ids, termination_protected: termination_protected)
        set_termination_protection(input)
      end
      def set_termination_protection(input : Types::SetTerminationProtectionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::SET_TERMINATION_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Specify whether to enable unhealthy node replacement, which lets Amazon EMR gracefully replace core
      # nodes on a cluster if any nodes become unhealthy. For example, a node becomes unhealthy if disk
      # usage is above 90%. If unhealthy node replacement is on and TerminationProtected are off, Amazon EMR
      # immediately terminates the unhealthy core nodes. To use unhealthy node replacement and retain
      # unhealthy core nodes, use to turn on termination protection. In such cases, Amazon EMR adds the
      # unhealthy nodes to a denylist, reducing job interruptions and failures. If unhealthy node
      # replacement is on, Amazon EMR notifies YARN and other applications on the cluster to stop scheduling
      # tasks with these nodes, moves the data, and then terminates the nodes. For more information, see
      # graceful node replacement in the Amazon EMR Management Guide .
      def set_unhealthy_node_replacement(
        job_flow_ids : Array(String),
        unhealthy_node_replacement : Bool
      ) : Nil
        input = Types::SetUnhealthyNodeReplacementInput.new(job_flow_ids: job_flow_ids, unhealthy_node_replacement: unhealthy_node_replacement)
        set_unhealthy_node_replacement(input)
      end
      def set_unhealthy_node_replacement(input : Types::SetUnhealthyNodeReplacementInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::SET_UNHEALTHY_NODE_REPLACEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # The SetVisibleToAllUsers parameter is no longer supported. Your cluster may be visible to all users
      # in your account. To restrict cluster access using an IAM policy, see Identity and Access Management
      # for Amazon EMR . Sets the Cluster$VisibleToAllUsers value for an Amazon EMR cluster. When true , IAM
      # principals in the Amazon Web Services account can perform Amazon EMR cluster actions that their IAM
      # policies allow. When false , only the IAM principal that created the cluster and the Amazon Web
      # Services account root user can perform Amazon EMR actions on the cluster, regardless of IAM
      # permissions policies attached to other IAM principals. This action works on running clusters. When
      # you create a cluster, use the RunJobFlowInput$VisibleToAllUsers parameter. For more information, see
      # Understanding the Amazon EMR Cluster VisibleToAllUsers Setting in the Amazon EMR Management Guide .
      def set_visible_to_all_users(
        job_flow_ids : Array(String),
        visible_to_all_users : Bool
      ) : Nil
        input = Types::SetVisibleToAllUsersInput.new(job_flow_ids: job_flow_ids, visible_to_all_users: visible_to_all_users)
        set_visible_to_all_users(input)
      end
      def set_visible_to_all_users(input : Types::SetVisibleToAllUsersInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::SET_VISIBLE_TO_ALL_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Starts a notebook execution.
      def start_notebook_execution(
        execution_engine : Types::ExecutionEngineConfig,
        service_role : String,
        editor_id : String? = nil,
        environment_variables : Hash(String, String)? = nil,
        notebook_execution_name : String? = nil,
        notebook_instance_security_group_id : String? = nil,
        notebook_params : String? = nil,
        notebook_s3_location : Types::NotebookS3LocationFromInput? = nil,
        output_notebook_format : String? = nil,
        output_notebook_s3_location : Types::OutputNotebookS3LocationFromInput? = nil,
        relative_path : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartNotebookExecutionOutput
        input = Types::StartNotebookExecutionInput.new(execution_engine: execution_engine, service_role: service_role, editor_id: editor_id, environment_variables: environment_variables, notebook_execution_name: notebook_execution_name, notebook_instance_security_group_id: notebook_instance_security_group_id, notebook_params: notebook_params, notebook_s3_location: notebook_s3_location, output_notebook_format: output_notebook_format, output_notebook_s3_location: output_notebook_s3_location, relative_path: relative_path, tags: tags)
        start_notebook_execution(input)
      end
      def start_notebook_execution(input : Types::StartNotebookExecutionInput) : Types::StartNotebookExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::START_NOTEBOOK_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartNotebookExecutionOutput, "StartNotebookExecution")
      end

      # Stops a notebook execution.
      def stop_notebook_execution(
        notebook_execution_id : String
      ) : Nil
        input = Types::StopNotebookExecutionInput.new(notebook_execution_id: notebook_execution_id)
        stop_notebook_execution(input)
      end
      def stop_notebook_execution(input : Types::StopNotebookExecutionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_NOTEBOOK_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # TerminateJobFlows shuts a list of clusters (job flows) down. When a job flow is shut down, any step
      # not yet completed is canceled and the Amazon EC2 instances on which the cluster is running are
      # stopped. Any log files not already saved are uploaded to Amazon S3 if a LogUri was specified when
      # the cluster was created. The maximum number of clusters allowed is 10. The call to TerminateJobFlows
      # is asynchronous. Depending on the configuration of the cluster, it may take up to 1-5 minutes for
      # the cluster to completely terminate and release allocated resources, such as Amazon EC2 instances.
      def terminate_job_flows(
        job_flow_ids : Array(String)
      ) : Nil
        input = Types::TerminateJobFlowsInput.new(job_flow_ids: job_flow_ids)
        terminate_job_flows(input)
      end
      def terminate_job_flows(input : Types::TerminateJobFlowsInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_JOB_FLOWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates an Amazon EMR Studio configuration, including attributes such as name, description, and
      # subnets.
      def update_studio(
        studio_id : String,
        default_s3_location : String? = nil,
        description : String? = nil,
        encryption_key_arn : String? = nil,
        name : String? = nil,
        subnet_ids : Array(String)? = nil
      ) : Nil
        input = Types::UpdateStudioInput.new(studio_id: studio_id, default_s3_location: default_s3_location, description: description, encryption_key_arn: encryption_key_arn, name: name, subnet_ids: subnet_ids)
        update_studio(input)
      end
      def update_studio(input : Types::UpdateStudioInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STUDIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the session policy attached to the user or group for the specified Amazon EMR Studio.
      def update_studio_session_mapping(
        identity_type : String,
        session_policy_arn : String,
        studio_id : String,
        identity_id : String? = nil,
        identity_name : String? = nil
      ) : Nil
        input = Types::UpdateStudioSessionMappingInput.new(identity_type: identity_type, session_policy_arn: session_policy_arn, studio_id: studio_id, identity_id: identity_id, identity_name: identity_name)
        update_studio_session_mapping(input)
      end
      def update_studio_session_mapping(input : Types::UpdateStudioSessionMappingInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STUDIO_SESSION_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
