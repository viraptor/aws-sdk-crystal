module AwsSdk
  module CodeDeploy
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

      # Adds tags to on-premises instances.
      def add_tags_to_on_premises_instances(
        instance_names : Array(String),
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::AddTagsToOnPremisesInstancesInput.new(instance_names: instance_names, tags: tags)
        add_tags_to_on_premises_instances(input)
      end
      def add_tags_to_on_premises_instances(input : Types::AddTagsToOnPremisesInstancesInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS_TO_ON_PREMISES_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Gets information about one or more application revisions. The maximum number of application
      # revisions that can be returned is 25.
      def batch_get_application_revisions(
        application_name : String,
        revisions : Array(Types::RevisionLocation)
      ) : Types::BatchGetApplicationRevisionsOutput
        input = Types::BatchGetApplicationRevisionsInput.new(application_name: application_name, revisions: revisions)
        batch_get_application_revisions(input)
      end
      def batch_get_application_revisions(input : Types::BatchGetApplicationRevisionsInput) : Types::BatchGetApplicationRevisionsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_APPLICATION_REVISIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetApplicationRevisionsOutput, "BatchGetApplicationRevisions")
      end

      # Gets information about one or more applications. The maximum number of applications that can be
      # returned is 100.
      def batch_get_applications(
        application_names : Array(String)
      ) : Types::BatchGetApplicationsOutput
        input = Types::BatchGetApplicationsInput.new(application_names: application_names)
        batch_get_applications(input)
      end
      def batch_get_applications(input : Types::BatchGetApplicationsInput) : Types::BatchGetApplicationsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetApplicationsOutput, "BatchGetApplications")
      end

      # Gets information about one or more deployment groups.
      def batch_get_deployment_groups(
        application_name : String,
        deployment_group_names : Array(String)
      ) : Types::BatchGetDeploymentGroupsOutput
        input = Types::BatchGetDeploymentGroupsInput.new(application_name: application_name, deployment_group_names: deployment_group_names)
        batch_get_deployment_groups(input)
      end
      def batch_get_deployment_groups(input : Types::BatchGetDeploymentGroupsInput) : Types::BatchGetDeploymentGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_DEPLOYMENT_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetDeploymentGroupsOutput, "BatchGetDeploymentGroups")
      end

      # This method works, but is deprecated. Use BatchGetDeploymentTargets instead. Returns an array of one
      # or more instances associated with a deployment. This method works with EC2/On-premises and Lambda
      # compute platforms. The newer BatchGetDeploymentTargets works with all compute platforms. The maximum
      # number of instances that can be returned is 25.
      def batch_get_deployment_instances(
        deployment_id : String,
        instance_ids : Array(String)
      ) : Types::BatchGetDeploymentInstancesOutput
        input = Types::BatchGetDeploymentInstancesInput.new(deployment_id: deployment_id, instance_ids: instance_ids)
        batch_get_deployment_instances(input)
      end
      def batch_get_deployment_instances(input : Types::BatchGetDeploymentInstancesInput) : Types::BatchGetDeploymentInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_DEPLOYMENT_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetDeploymentInstancesOutput, "BatchGetDeploymentInstances")
      end

      # Returns an array of one or more targets associated with a deployment. This method works with all
      # compute types and should be used instead of the deprecated BatchGetDeploymentInstances . The maximum
      # number of targets that can be returned is 25. The type of targets returned depends on the
      # deployment's compute platform or deployment method: EC2/On-premises : Information about Amazon EC2
      # instance targets. Lambda : Information about Lambda functions targets. Amazon ECS : Information
      # about Amazon ECS service targets. CloudFormation : Information about targets of blue/green
      # deployments initiated by a CloudFormation stack update.
      def batch_get_deployment_targets(
        deployment_id : String,
        target_ids : Array(String)
      ) : Types::BatchGetDeploymentTargetsOutput
        input = Types::BatchGetDeploymentTargetsInput.new(deployment_id: deployment_id, target_ids: target_ids)
        batch_get_deployment_targets(input)
      end
      def batch_get_deployment_targets(input : Types::BatchGetDeploymentTargetsInput) : Types::BatchGetDeploymentTargetsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_DEPLOYMENT_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetDeploymentTargetsOutput, "BatchGetDeploymentTargets")
      end

      # Gets information about one or more deployments. The maximum number of deployments that can be
      # returned is 25.
      def batch_get_deployments(
        deployment_ids : Array(String)
      ) : Types::BatchGetDeploymentsOutput
        input = Types::BatchGetDeploymentsInput.new(deployment_ids: deployment_ids)
        batch_get_deployments(input)
      end
      def batch_get_deployments(input : Types::BatchGetDeploymentsInput) : Types::BatchGetDeploymentsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_DEPLOYMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetDeploymentsOutput, "BatchGetDeployments")
      end

      # Gets information about one or more on-premises instances. The maximum number of on-premises
      # instances that can be returned is 25.
      def batch_get_on_premises_instances(
        instance_names : Array(String)
      ) : Types::BatchGetOnPremisesInstancesOutput
        input = Types::BatchGetOnPremisesInstancesInput.new(instance_names: instance_names)
        batch_get_on_premises_instances(input)
      end
      def batch_get_on_premises_instances(input : Types::BatchGetOnPremisesInstancesInput) : Types::BatchGetOnPremisesInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_ON_PREMISES_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetOnPremisesInstancesOutput, "BatchGetOnPremisesInstances")
      end

      # For a blue/green deployment, starts the process of rerouting traffic from instances in the original
      # environment to instances in the replacement environment without waiting for a specified wait time to
      # elapse. (Traffic rerouting, which is achieved by registering instances in the replacement
      # environment with the load balancer, can start as soon as all instances have a status of Ready.)
      def continue_deployment(
        deployment_id : String? = nil,
        deployment_wait_type : String? = nil
      ) : Nil
        input = Types::ContinueDeploymentInput.new(deployment_id: deployment_id, deployment_wait_type: deployment_wait_type)
        continue_deployment(input)
      end
      def continue_deployment(input : Types::ContinueDeploymentInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::CONTINUE_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates an application.
      def create_application(
        application_name : String,
        compute_platform : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateApplicationOutput
        input = Types::CreateApplicationInput.new(application_name: application_name, compute_platform: compute_platform, tags: tags)
        create_application(input)
      end
      def create_application(input : Types::CreateApplicationInput) : Types::CreateApplicationOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationOutput, "CreateApplication")
      end

      # Deploys an application revision through the specified deployment group.
      def create_deployment(
        application_name : String,
        auto_rollback_configuration : Types::AutoRollbackConfiguration? = nil,
        deployment_config_name : String? = nil,
        deployment_group_name : String? = nil,
        description : String? = nil,
        file_exists_behavior : String? = nil,
        ignore_application_stop_failures : Bool? = nil,
        override_alarm_configuration : Types::AlarmConfiguration? = nil,
        revision : Types::RevisionLocation? = nil,
        target_instances : Types::TargetInstances? = nil,
        update_outdated_instances_only : Bool? = nil
      ) : Types::CreateDeploymentOutput
        input = Types::CreateDeploymentInput.new(application_name: application_name, auto_rollback_configuration: auto_rollback_configuration, deployment_config_name: deployment_config_name, deployment_group_name: deployment_group_name, description: description, file_exists_behavior: file_exists_behavior, ignore_application_stop_failures: ignore_application_stop_failures, override_alarm_configuration: override_alarm_configuration, revision: revision, target_instances: target_instances, update_outdated_instances_only: update_outdated_instances_only)
        create_deployment(input)
      end
      def create_deployment(input : Types::CreateDeploymentInput) : Types::CreateDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDeploymentOutput, "CreateDeployment")
      end

      # Creates a deployment configuration.
      def create_deployment_config(
        deployment_config_name : String,
        compute_platform : String? = nil,
        minimum_healthy_hosts : Types::MinimumHealthyHosts? = nil,
        traffic_routing_config : Types::TrafficRoutingConfig? = nil,
        zonal_config : Types::ZonalConfig? = nil
      ) : Types::CreateDeploymentConfigOutput
        input = Types::CreateDeploymentConfigInput.new(deployment_config_name: deployment_config_name, compute_platform: compute_platform, minimum_healthy_hosts: minimum_healthy_hosts, traffic_routing_config: traffic_routing_config, zonal_config: zonal_config)
        create_deployment_config(input)
      end
      def create_deployment_config(input : Types::CreateDeploymentConfigInput) : Types::CreateDeploymentConfigOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_DEPLOYMENT_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDeploymentConfigOutput, "CreateDeploymentConfig")
      end

      # Creates a deployment group to which application revisions are deployed.
      def create_deployment_group(
        application_name : String,
        deployment_group_name : String,
        service_role_arn : String,
        alarm_configuration : Types::AlarmConfiguration? = nil,
        auto_rollback_configuration : Types::AutoRollbackConfiguration? = nil,
        auto_scaling_groups : Array(String)? = nil,
        blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration? = nil,
        deployment_config_name : String? = nil,
        deployment_style : Types::DeploymentStyle? = nil,
        ec2_tag_filters : Array(Types::EC2TagFilter)? = nil,
        ec2_tag_set : Types::EC2TagSet? = nil,
        ecs_services : Array(Types::ECSService)? = nil,
        load_balancer_info : Types::LoadBalancerInfo? = nil,
        on_premises_instance_tag_filters : Array(Types::TagFilter)? = nil,
        on_premises_tag_set : Types::OnPremisesTagSet? = nil,
        outdated_instances_strategy : String? = nil,
        tags : Array(Types::Tag)? = nil,
        termination_hook_enabled : Bool? = nil,
        trigger_configurations : Array(Types::TriggerConfig)? = nil
      ) : Types::CreateDeploymentGroupOutput
        input = Types::CreateDeploymentGroupInput.new(application_name: application_name, deployment_group_name: deployment_group_name, service_role_arn: service_role_arn, alarm_configuration: alarm_configuration, auto_rollback_configuration: auto_rollback_configuration, auto_scaling_groups: auto_scaling_groups, blue_green_deployment_configuration: blue_green_deployment_configuration, deployment_config_name: deployment_config_name, deployment_style: deployment_style, ec2_tag_filters: ec2_tag_filters, ec2_tag_set: ec2_tag_set, ecs_services: ecs_services, load_balancer_info: load_balancer_info, on_premises_instance_tag_filters: on_premises_instance_tag_filters, on_premises_tag_set: on_premises_tag_set, outdated_instances_strategy: outdated_instances_strategy, tags: tags, termination_hook_enabled: termination_hook_enabled, trigger_configurations: trigger_configurations)
        create_deployment_group(input)
      end
      def create_deployment_group(input : Types::CreateDeploymentGroupInput) : Types::CreateDeploymentGroupOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_DEPLOYMENT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDeploymentGroupOutput, "CreateDeploymentGroup")
      end

      # Deletes an application.
      def delete_application(
        application_name : String
      ) : Nil
        input = Types::DeleteApplicationInput.new(application_name: application_name)
        delete_application(input)
      end
      def delete_application(input : Types::DeleteApplicationInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a deployment configuration. A deployment configuration cannot be deleted if it is currently
      # in use. Predefined configurations cannot be deleted.
      def delete_deployment_config(
        deployment_config_name : String
      ) : Nil
        input = Types::DeleteDeploymentConfigInput.new(deployment_config_name: deployment_config_name)
        delete_deployment_config(input)
      end
      def delete_deployment_config(input : Types::DeleteDeploymentConfigInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DEPLOYMENT_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a deployment group.
      def delete_deployment_group(
        application_name : String,
        deployment_group_name : String
      ) : Types::DeleteDeploymentGroupOutput
        input = Types::DeleteDeploymentGroupInput.new(application_name: application_name, deployment_group_name: deployment_group_name)
        delete_deployment_group(input)
      end
      def delete_deployment_group(input : Types::DeleteDeploymentGroupInput) : Types::DeleteDeploymentGroupOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_DEPLOYMENT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDeploymentGroupOutput, "DeleteDeploymentGroup")
      end

      # Deletes a GitHub account connection.
      def delete_git_hub_account_token(
        token_name : String? = nil
      ) : Types::DeleteGitHubAccountTokenOutput
        input = Types::DeleteGitHubAccountTokenInput.new(token_name: token_name)
        delete_git_hub_account_token(input)
      end
      def delete_git_hub_account_token(input : Types::DeleteGitHubAccountTokenInput) : Types::DeleteGitHubAccountTokenOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_GIT_HUB_ACCOUNT_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGitHubAccountTokenOutput, "DeleteGitHubAccountToken")
      end

      # Deletes resources linked to an external ID. This action only applies if you have configured
      # blue/green deployments through CloudFormation. It is not necessary to call this action directly.
      # CloudFormation calls it on your behalf when it needs to delete stack resources. This action is
      # offered publicly in case you need to delete resources to comply with General Data Protection
      # Regulation (GDPR) requirements.
      def delete_resources_by_external_id(
        external_id : String? = nil
      ) : Types::DeleteResourcesByExternalIdOutput
        input = Types::DeleteResourcesByExternalIdInput.new(external_id: external_id)
        delete_resources_by_external_id(input)
      end
      def delete_resources_by_external_id(input : Types::DeleteResourcesByExternalIdInput) : Types::DeleteResourcesByExternalIdOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCES_BY_EXTERNAL_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcesByExternalIdOutput, "DeleteResourcesByExternalId")
      end

      # Deregisters an on-premises instance.
      def deregister_on_premises_instance(
        instance_name : String
      ) : Nil
        input = Types::DeregisterOnPremisesInstanceInput.new(instance_name: instance_name)
        deregister_on_premises_instance(input)
      end
      def deregister_on_premises_instance(input : Types::DeregisterOnPremisesInstanceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_ON_PREMISES_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Gets information about an application.
      def get_application(
        application_name : String
      ) : Types::GetApplicationOutput
        input = Types::GetApplicationInput.new(application_name: application_name)
        get_application(input)
      end
      def get_application(input : Types::GetApplicationInput) : Types::GetApplicationOutput
        request = Protocol::JsonRpc.build_request(Model::GET_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetApplicationOutput, "GetApplication")
      end

      # Gets information about an application revision.
      def get_application_revision(
        application_name : String,
        revision : Types::RevisionLocation
      ) : Types::GetApplicationRevisionOutput
        input = Types::GetApplicationRevisionInput.new(application_name: application_name, revision: revision)
        get_application_revision(input)
      end
      def get_application_revision(input : Types::GetApplicationRevisionInput) : Types::GetApplicationRevisionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_APPLICATION_REVISION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetApplicationRevisionOutput, "GetApplicationRevision")
      end

      # Gets information about a deployment. The content property of the appSpecContent object in the
      # returned revision is always null. Use GetApplicationRevision and the sha256 property of the returned
      # appSpecContent object to get the content of the deployment’s AppSpec file.
      def get_deployment(
        deployment_id : String
      ) : Types::GetDeploymentOutput
        input = Types::GetDeploymentInput.new(deployment_id: deployment_id)
        get_deployment(input)
      end
      def get_deployment(input : Types::GetDeploymentInput) : Types::GetDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeploymentOutput, "GetDeployment")
      end

      # Gets information about a deployment configuration.
      def get_deployment_config(
        deployment_config_name : String
      ) : Types::GetDeploymentConfigOutput
        input = Types::GetDeploymentConfigInput.new(deployment_config_name: deployment_config_name)
        get_deployment_config(input)
      end
      def get_deployment_config(input : Types::GetDeploymentConfigInput) : Types::GetDeploymentConfigOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DEPLOYMENT_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeploymentConfigOutput, "GetDeploymentConfig")
      end

      # Gets information about a deployment group.
      def get_deployment_group(
        application_name : String,
        deployment_group_name : String
      ) : Types::GetDeploymentGroupOutput
        input = Types::GetDeploymentGroupInput.new(application_name: application_name, deployment_group_name: deployment_group_name)
        get_deployment_group(input)
      end
      def get_deployment_group(input : Types::GetDeploymentGroupInput) : Types::GetDeploymentGroupOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DEPLOYMENT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeploymentGroupOutput, "GetDeploymentGroup")
      end

      # Gets information about an instance as part of a deployment.
      def get_deployment_instance(
        deployment_id : String,
        instance_id : String
      ) : Types::GetDeploymentInstanceOutput
        input = Types::GetDeploymentInstanceInput.new(deployment_id: deployment_id, instance_id: instance_id)
        get_deployment_instance(input)
      end
      def get_deployment_instance(input : Types::GetDeploymentInstanceInput) : Types::GetDeploymentInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DEPLOYMENT_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeploymentInstanceOutput, "GetDeploymentInstance")
      end

      # Returns information about a deployment target.
      def get_deployment_target(
        deployment_id : String,
        target_id : String
      ) : Types::GetDeploymentTargetOutput
        input = Types::GetDeploymentTargetInput.new(deployment_id: deployment_id, target_id: target_id)
        get_deployment_target(input)
      end
      def get_deployment_target(input : Types::GetDeploymentTargetInput) : Types::GetDeploymentTargetOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DEPLOYMENT_TARGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeploymentTargetOutput, "GetDeploymentTarget")
      end

      # Gets information about an on-premises instance.
      def get_on_premises_instance(
        instance_name : String
      ) : Types::GetOnPremisesInstanceOutput
        input = Types::GetOnPremisesInstanceInput.new(instance_name: instance_name)
        get_on_premises_instance(input)
      end
      def get_on_premises_instance(input : Types::GetOnPremisesInstanceInput) : Types::GetOnPremisesInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ON_PREMISES_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOnPremisesInstanceOutput, "GetOnPremisesInstance")
      end

      # Lists information about revisions for an application.
      def list_application_revisions(
        application_name : String,
        deployed : String? = nil,
        next_token : String? = nil,
        s3_bucket : String? = nil,
        s3_key_prefix : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListApplicationRevisionsOutput
        input = Types::ListApplicationRevisionsInput.new(application_name: application_name, deployed: deployed, next_token: next_token, s3_bucket: s3_bucket, s3_key_prefix: s3_key_prefix, sort_by: sort_by, sort_order: sort_order)
        list_application_revisions(input)
      end
      def list_application_revisions(input : Types::ListApplicationRevisionsInput) : Types::ListApplicationRevisionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_REVISIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationRevisionsOutput, "ListApplicationRevisions")
      end

      # Lists the applications registered with the user or Amazon Web Services account.
      def list_applications(
        next_token : String? = nil
      ) : Types::ListApplicationsOutput
        input = Types::ListApplicationsInput.new(next_token: next_token)
        list_applications(input)
      end
      def list_applications(input : Types::ListApplicationsInput) : Types::ListApplicationsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationsOutput, "ListApplications")
      end

      # Lists the deployment configurations with the user or Amazon Web Services account.
      def list_deployment_configs(
        next_token : String? = nil
      ) : Types::ListDeploymentConfigsOutput
        input = Types::ListDeploymentConfigsInput.new(next_token: next_token)
        list_deployment_configs(input)
      end
      def list_deployment_configs(input : Types::ListDeploymentConfigsInput) : Types::ListDeploymentConfigsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DEPLOYMENT_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeploymentConfigsOutput, "ListDeploymentConfigs")
      end

      # Lists the deployment groups for an application registered with the Amazon Web Services user or
      # Amazon Web Services account.
      def list_deployment_groups(
        application_name : String,
        next_token : String? = nil
      ) : Types::ListDeploymentGroupsOutput
        input = Types::ListDeploymentGroupsInput.new(application_name: application_name, next_token: next_token)
        list_deployment_groups(input)
      end
      def list_deployment_groups(input : Types::ListDeploymentGroupsInput) : Types::ListDeploymentGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DEPLOYMENT_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeploymentGroupsOutput, "ListDeploymentGroups")
      end

      # The newer BatchGetDeploymentTargets should be used instead because it works with all compute types.
      # ListDeploymentInstances throws an exception if it is used with a compute platform other than
      # EC2/On-premises or Lambda. Lists the instance for a deployment associated with the user or Amazon
      # Web Services account.
      def list_deployment_instances(
        deployment_id : String,
        instance_status_filter : Array(String)? = nil,
        instance_type_filter : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::ListDeploymentInstancesOutput
        input = Types::ListDeploymentInstancesInput.new(deployment_id: deployment_id, instance_status_filter: instance_status_filter, instance_type_filter: instance_type_filter, next_token: next_token)
        list_deployment_instances(input)
      end
      def list_deployment_instances(input : Types::ListDeploymentInstancesInput) : Types::ListDeploymentInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DEPLOYMENT_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeploymentInstancesOutput, "ListDeploymentInstances")
      end

      # Returns an array of target IDs that are associated a deployment.
      def list_deployment_targets(
        deployment_id : String,
        next_token : String? = nil,
        target_filters : Hash(String, Array(String))? = nil
      ) : Types::ListDeploymentTargetsOutput
        input = Types::ListDeploymentTargetsInput.new(deployment_id: deployment_id, next_token: next_token, target_filters: target_filters)
        list_deployment_targets(input)
      end
      def list_deployment_targets(input : Types::ListDeploymentTargetsInput) : Types::ListDeploymentTargetsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DEPLOYMENT_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeploymentTargetsOutput, "ListDeploymentTargets")
      end

      # Lists the deployments in a deployment group for an application registered with the user or Amazon
      # Web Services account.
      def list_deployments(
        application_name : String? = nil,
        create_time_range : Types::TimeRange? = nil,
        deployment_group_name : String? = nil,
        external_id : String? = nil,
        include_only_statuses : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::ListDeploymentsOutput
        input = Types::ListDeploymentsInput.new(application_name: application_name, create_time_range: create_time_range, deployment_group_name: deployment_group_name, external_id: external_id, include_only_statuses: include_only_statuses, next_token: next_token)
        list_deployments(input)
      end
      def list_deployments(input : Types::ListDeploymentsInput) : Types::ListDeploymentsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DEPLOYMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeploymentsOutput, "ListDeployments")
      end

      # Lists the names of stored connections to GitHub accounts.
      def list_git_hub_account_token_names(
        next_token : String? = nil
      ) : Types::ListGitHubAccountTokenNamesOutput
        input = Types::ListGitHubAccountTokenNamesInput.new(next_token: next_token)
        list_git_hub_account_token_names(input)
      end
      def list_git_hub_account_token_names(input : Types::ListGitHubAccountTokenNamesInput) : Types::ListGitHubAccountTokenNamesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_GIT_HUB_ACCOUNT_TOKEN_NAMES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGitHubAccountTokenNamesOutput, "ListGitHubAccountTokenNames")
      end

      # Gets a list of names for one or more on-premises instances. Unless otherwise specified, both
      # registered and deregistered on-premises instance names are listed. To list only registered or
      # deregistered on-premises instance names, use the registration status parameter.
      def list_on_premises_instances(
        next_token : String? = nil,
        registration_status : String? = nil,
        tag_filters : Array(Types::TagFilter)? = nil
      ) : Types::ListOnPremisesInstancesOutput
        input = Types::ListOnPremisesInstancesInput.new(next_token: next_token, registration_status: registration_status, tag_filters: tag_filters)
        list_on_premises_instances(input)
      end
      def list_on_premises_instances(input : Types::ListOnPremisesInstancesInput) : Types::ListOnPremisesInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ON_PREMISES_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOnPremisesInstancesOutput, "ListOnPremisesInstances")
      end

      # Returns a list of tags for the resource identified by a specified Amazon Resource Name (ARN). Tags
      # are used to organize and categorize your CodeDeploy resources.
      def list_tags_for_resource(
        resource_arn : String,
        next_token : String? = nil
      ) : Types::ListTagsForResourceOutput
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn, next_token: next_token)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Sets the result of a Lambda validation function. The function validates lifecycle hooks during a
      # deployment that uses the Lambda or Amazon ECS compute platform. For Lambda deployments, the
      # available lifecycle hooks are BeforeAllowTraffic and AfterAllowTraffic . For Amazon ECS deployments,
      # the available lifecycle hooks are BeforeInstall , AfterInstall , AfterAllowTestTraffic ,
      # BeforeAllowTraffic , and AfterAllowTraffic . Lambda validation functions return Succeeded or Failed
      # . For more information, see AppSpec 'hooks' Section for an Lambda Deployment and AppSpec 'hooks'
      # Section for an Amazon ECS Deployment .
      def put_lifecycle_event_hook_execution_status(
        deployment_id : String? = nil,
        lifecycle_event_hook_execution_id : String? = nil,
        status : String? = nil
      ) : Types::PutLifecycleEventHookExecutionStatusOutput
        input = Types::PutLifecycleEventHookExecutionStatusInput.new(deployment_id: deployment_id, lifecycle_event_hook_execution_id: lifecycle_event_hook_execution_id, status: status)
        put_lifecycle_event_hook_execution_status(input)
      end
      def put_lifecycle_event_hook_execution_status(input : Types::PutLifecycleEventHookExecutionStatusInput) : Types::PutLifecycleEventHookExecutionStatusOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_LIFECYCLE_EVENT_HOOK_EXECUTION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutLifecycleEventHookExecutionStatusOutput, "PutLifecycleEventHookExecutionStatus")
      end

      # Registers with CodeDeploy a revision for the specified application.
      def register_application_revision(
        application_name : String,
        revision : Types::RevisionLocation,
        description : String? = nil
      ) : Nil
        input = Types::RegisterApplicationRevisionInput.new(application_name: application_name, revision: revision, description: description)
        register_application_revision(input)
      end
      def register_application_revision(input : Types::RegisterApplicationRevisionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::REGISTER_APPLICATION_REVISION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Registers an on-premises instance. Only one IAM ARN (an IAM session ARN or IAM user ARN) is
      # supported in the request. You cannot use both.
      def register_on_premises_instance(
        instance_name : String,
        iam_session_arn : String? = nil,
        iam_user_arn : String? = nil
      ) : Nil
        input = Types::RegisterOnPremisesInstanceInput.new(instance_name: instance_name, iam_session_arn: iam_session_arn, iam_user_arn: iam_user_arn)
        register_on_premises_instance(input)
      end
      def register_on_premises_instance(input : Types::RegisterOnPremisesInstanceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::REGISTER_ON_PREMISES_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes one or more tags from one or more on-premises instances.
      def remove_tags_from_on_premises_instances(
        instance_names : Array(String),
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::RemoveTagsFromOnPremisesInstancesInput.new(instance_names: instance_names, tags: tags)
        remove_tags_from_on_premises_instances(input)
      end
      def remove_tags_from_on_premises_instances(input : Types::RemoveTagsFromOnPremisesInstancesInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS_FROM_ON_PREMISES_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # In a blue/green deployment, overrides any specified wait time and starts terminating instances
      # immediately after the traffic routing is complete.
      def skip_wait_time_for_instance_termination(
        deployment_id : String? = nil
      ) : Nil
        input = Types::SkipWaitTimeForInstanceTerminationInput.new(deployment_id: deployment_id)
        skip_wait_time_for_instance_termination(input)
      end
      def skip_wait_time_for_instance_termination(input : Types::SkipWaitTimeForInstanceTerminationInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::SKIP_WAIT_TIME_FOR_INSTANCE_TERMINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Attempts to stop an ongoing deployment.
      def stop_deployment(
        deployment_id : String,
        auto_rollback_enabled : Bool? = nil
      ) : Types::StopDeploymentOutput
        input = Types::StopDeploymentInput.new(deployment_id: deployment_id, auto_rollback_enabled: auto_rollback_enabled)
        stop_deployment(input)
      end
      def stop_deployment(input : Types::StopDeploymentInput) : Types::StopDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopDeploymentOutput, "StopDeployment")
      end

      # Associates the list of tags in the input Tags parameter with the resource identified by the
      # ResourceArn input parameter.
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

      # Disassociates a resource from a list of tags. The resource is identified by the ResourceArn input
      # parameter. The tags are identified by the list of keys in the TagKeys input parameter.
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

      # Changes the name of an application.
      def update_application(
        application_name : String? = nil,
        new_application_name : String? = nil
      ) : Nil
        input = Types::UpdateApplicationInput.new(application_name: application_name, new_application_name: new_application_name)
        update_application(input)
      end
      def update_application(input : Types::UpdateApplicationInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Changes information about a deployment group.
      def update_deployment_group(
        application_name : String,
        current_deployment_group_name : String,
        alarm_configuration : Types::AlarmConfiguration? = nil,
        auto_rollback_configuration : Types::AutoRollbackConfiguration? = nil,
        auto_scaling_groups : Array(String)? = nil,
        blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration? = nil,
        deployment_config_name : String? = nil,
        deployment_style : Types::DeploymentStyle? = nil,
        ec2_tag_filters : Array(Types::EC2TagFilter)? = nil,
        ec2_tag_set : Types::EC2TagSet? = nil,
        ecs_services : Array(Types::ECSService)? = nil,
        load_balancer_info : Types::LoadBalancerInfo? = nil,
        new_deployment_group_name : String? = nil,
        on_premises_instance_tag_filters : Array(Types::TagFilter)? = nil,
        on_premises_tag_set : Types::OnPremisesTagSet? = nil,
        outdated_instances_strategy : String? = nil,
        service_role_arn : String? = nil,
        termination_hook_enabled : Bool? = nil,
        trigger_configurations : Array(Types::TriggerConfig)? = nil
      ) : Types::UpdateDeploymentGroupOutput
        input = Types::UpdateDeploymentGroupInput.new(application_name: application_name, current_deployment_group_name: current_deployment_group_name, alarm_configuration: alarm_configuration, auto_rollback_configuration: auto_rollback_configuration, auto_scaling_groups: auto_scaling_groups, blue_green_deployment_configuration: blue_green_deployment_configuration, deployment_config_name: deployment_config_name, deployment_style: deployment_style, ec2_tag_filters: ec2_tag_filters, ec2_tag_set: ec2_tag_set, ecs_services: ecs_services, load_balancer_info: load_balancer_info, new_deployment_group_name: new_deployment_group_name, on_premises_instance_tag_filters: on_premises_instance_tag_filters, on_premises_tag_set: on_premises_tag_set, outdated_instances_strategy: outdated_instances_strategy, service_role_arn: service_role_arn, termination_hook_enabled: termination_hook_enabled, trigger_configurations: trigger_configurations)
        update_deployment_group(input)
      end
      def update_deployment_group(input : Types::UpdateDeploymentGroupInput) : Types::UpdateDeploymentGroupOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEPLOYMENT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDeploymentGroupOutput, "UpdateDeploymentGroup")
      end
    end
  end
end
