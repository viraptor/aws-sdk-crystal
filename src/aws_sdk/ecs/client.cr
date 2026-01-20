module AwsSdk
  module ECS
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

      # Creates a capacity provider. Capacity providers are associated with a cluster and are used in
      # capacity provider strategies to facilitate cluster auto scaling. You can create capacity providers
      # for Amazon ECS Managed Instances and EC2 instances. Fargate has the predefined FARGATE and
      # FARGATE_SPOT capacity providers.

      def create_capacity_provider(
        name : String,
        auto_scaling_group_provider : Types::AutoScalingGroupProvider? = nil,
        cluster : String? = nil,
        managed_instances_provider : Types::CreateManagedInstancesProviderConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCapacityProviderResponse

        input = Types::CreateCapacityProviderRequest.new(name: name, auto_scaling_group_provider: auto_scaling_group_provider, cluster: cluster, managed_instances_provider: managed_instances_provider, tags: tags)
        create_capacity_provider(input)
      end

      def create_capacity_provider(input : Types::CreateCapacityProviderRequest) : Types::CreateCapacityProviderResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CAPACITY_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCapacityProviderResponse, "CreateCapacityProvider")
      end

      # Creates a new Amazon ECS cluster. By default, your account receives a default cluster when you
      # launch your first container instance. However, you can create your own cluster with a unique name.
      # When you call the CreateCluster API operation, Amazon ECS attempts to create the Amazon ECS
      # service-linked role for your account. This is so that it can manage required resources in other
      # Amazon Web Services services on your behalf. However, if the user that makes the call doesn't have
      # permissions to create the service-linked role, it isn't created. For more information, see Using
      # service-linked roles for Amazon ECS in the Amazon Elastic Container Service Developer Guide .

      def create_cluster(
        capacity_providers : Array(String)? = nil,
        cluster_name : String? = nil,
        configuration : Types::ClusterConfiguration? = nil,
        default_capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
        service_connect_defaults : Types::ClusterServiceConnectDefaultsRequest? = nil,
        settings : Array(Types::ClusterSetting)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateClusterResponse

        input = Types::CreateClusterRequest.new(capacity_providers: capacity_providers, cluster_name: cluster_name, configuration: configuration, default_capacity_provider_strategy: default_capacity_provider_strategy, service_connect_defaults: service_connect_defaults, settings: settings, tags: tags)
        create_cluster(input)
      end

      def create_cluster(input : Types::CreateClusterRequest) : Types::CreateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateClusterResponse, "CreateCluster")
      end

      # Creates an Express service that simplifies deploying containerized web applications on Amazon ECS
      # with managed Amazon Web Services infrastructure. This operation provisions and configures
      # Application Load Balancers, target groups, security groups, and auto-scaling policies automatically.
      # Specify a primary container configuration with your application image and basic settings. Amazon ECS
      # creates the necessary Amazon Web Services resources for traffic distribution, health monitoring,
      # network access control, and capacity management. Provide an execution role for task operations and
      # an infrastructure role for managing Amazon Web Services resources on your behalf.

      def create_express_gateway_service(
        execution_role_arn : String,
        infrastructure_role_arn : String,
        primary_container : Types::ExpressGatewayContainer,
        cluster : String? = nil,
        cpu : String? = nil,
        health_check_path : String? = nil,
        memory : String? = nil,
        network_configuration : Types::ExpressGatewayServiceNetworkConfiguration? = nil,
        scaling_target : Types::ExpressGatewayScalingTarget? = nil,
        service_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        task_role_arn : String? = nil
      ) : Types::CreateExpressGatewayServiceResponse

        input = Types::CreateExpressGatewayServiceRequest.new(execution_role_arn: execution_role_arn, infrastructure_role_arn: infrastructure_role_arn, primary_container: primary_container, cluster: cluster, cpu: cpu, health_check_path: health_check_path, memory: memory, network_configuration: network_configuration, scaling_target: scaling_target, service_name: service_name, tags: tags, task_role_arn: task_role_arn)
        create_express_gateway_service(input)
      end

      def create_express_gateway_service(input : Types::CreateExpressGatewayServiceRequest) : Types::CreateExpressGatewayServiceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EXPRESS_GATEWAY_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateExpressGatewayServiceResponse, "CreateExpressGatewayService")
      end

      # Runs and maintains your desired number of tasks from a specified task definition. If the number of
      # tasks running in a service drops below the desiredCount , Amazon ECS runs another copy of the task
      # in the specified cluster. To update an existing service, use UpdateService . On March 21, 2024, a
      # change was made to resolve the task definition revision before authorization. When a task definition
      # revision is not specified, authorization will occur using the latest revision of a task definition.
      # Amazon Elastic Inference (EI) is no longer available to customers. In addition to maintaining the
      # desired count of tasks in your service, you can optionally run your service behind one or more load
      # balancers. The load balancers distribute traffic across the tasks that are associated with the
      # service. For more information, see Service load balancing in the Amazon Elastic Container Service
      # Developer Guide . You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the volume
      # when creating or updating a service. volumeConfigurations is only supported for REPLICA service and
      # not DAEMON service. For more information, see Amazon EBS volumes in the Amazon Elastic Container
      # Service Developer Guide . Tasks for services that don't use a load balancer are considered healthy
      # if they're in the RUNNING state. Tasks for services that use a load balancer are considered healthy
      # if they're in the RUNNING state and are reported as healthy by the load balancer. There are two
      # service scheduler strategies available: REPLICA - The replica scheduling strategy places and
      # maintains your desired number of tasks across your cluster. By default, the service scheduler
      # spreads tasks across Availability Zones. You can use task placement strategies and constraints to
      # customize task placement decisions. For more information, see Service scheduler concepts in the
      # Amazon Elastic Container Service Developer Guide . DAEMON - The daemon scheduling strategy deploys
      # exactly one task on each active container instance that meets all of the task placement constraints
      # that you specify in your cluster. The service scheduler also evaluates the task placement
      # constraints for running tasks. It also stops tasks that don't meet the placement constraints. When
      # using this strategy, you don't need to specify a desired number of tasks, a task placement strategy,
      # or use Service Auto Scaling policies. For more information, see Amazon ECS services in the Amazon
      # Elastic Container Service Developer Guide . The deployment controller is the mechanism that
      # determines how tasks are deployed for your service. The valid options are: ECS When you create a
      # service which uses the ECS deployment controller, you can choose between the following deployment
      # strategies (which you can set in the “ strategy ” field in “ deploymentConfiguration ”): : ROLLING :
      # When you create a service which uses the rolling update ( ROLLING ) deployment strategy, the Amazon
      # ECS service scheduler replaces the currently running tasks with new tasks. The number of tasks that
      # Amazon ECS adds or removes from the service during a rolling update is controlled by the service
      # deployment configuration. For more information, see Deploy Amazon ECS services by replacing tasks in
      # the Amazon Elastic Container Service Developer Guide . Rolling update deployments are best suited
      # for the following scenarios: Gradual service updates: You need to update your service incrementally
      # without taking the entire service offline at once. Limited resource requirements: You want to avoid
      # the additional resource costs of running two complete environments simultaneously (as required by
      # blue/green deployments). Acceptable deployment time: Your application can tolerate a longer
      # deployment process, as rolling updates replace tasks one by one. No need for instant roll back: Your
      # service can tolerate a rollback process that takes minutes rather than seconds. Simple deployment
      # process: You prefer a straightforward deployment approach without the complexity of managing
      # multiple environments, target groups, and listeners. No load balancer requirement: Your service
      # doesn't use or require a load balancer, Application Load Balancer, Network Load Balancer, or Service
      # Connect (which are required for blue/green deployments). Stateful applications: Your application
      # maintains state that makes it difficult to run two parallel environments. Cost sensitivity: You want
      # to minimize deployment costs by not running duplicate environments during deployment. Rolling
      # updates are the default deployment strategy for services and provide a balance between deployment
      # safety and resource efficiency for many common application scenarios. BLUE_GREEN : A blue/green
      # deployment strategy ( BLUE_GREEN ) is a release methodology that reduces downtime and risk by
      # running two identical production environments called blue and green. With Amazon ECS blue/green
      # deployments, you can validate new service revisions before directing production traffic to them.
      # This approach provides a safer way to deploy changes with the ability to quickly roll back if
      # needed. For more information, see Amazon ECS blue/green deployments in the Amazon Elastic Container
      # Service Developer Guide . Amazon ECS blue/green deployments are best suited for the following
      # scenarios: Service validation: When you need to validate new service revisions before directing
      # production traffic to them Zero downtime: When your service requires zero-downtime deployments
      # Instant roll back: When you need the ability to quickly roll back if issues are detected Load
      # balancer requirement: When your service uses Application Load Balancer, Network Load Balancer, or
      # Service Connect LINEAR : A linear deployment strategy ( LINEAR ) gradually shifts traffic from the
      # current production environment to a new environment in equal percentage increments. With Amazon ECS
      # linear deployments, you can control the pace of traffic shifting and validate new service revisions
      # with increasing amounts of production traffic. Linear deployments are best suited for the following
      # scenarios: Gradual validation: When you want to gradually validate your new service version with
      # increasing traffic Performance monitoring: When you need time to monitor metrics and performance
      # during the deployment Risk minimization: When you want to minimize risk by exposing the new version
      # to production traffic incrementally Load balancer requirement: When your service uses Application
      # Load Balancer or Service Connect CANARY : A canary deployment strategy ( CANARY ) shifts a small
      # percentage of traffic to the new service revision first, then shifts the remaining traffic all at
      # once after a specified time period. This allows you to test the new version with a subset of users
      # before full deployment. Canary deployments are best suited for the following scenarios: Feature
      # testing: When you want to test new features with a small subset of users before full rollout
      # Production validation: When you need to validate performance and functionality with real production
      # traffic Blast radius control: When you want to minimize blast radius if issues are discovered in the
      # new version Load balancer requirement: When your service uses Application Load Balancer or Service
      # Connect External Use a third-party deployment controller. Blue/green deployment (powered by
      # CodeDeploy) CodeDeploy installs an updated version of the application as a new replacement task set
      # and reroutes production traffic from the original application task set to the replacement task set.
      # The original task set is terminated after a successful deployment. Use this deployment controller to
      # verify a new deployment of a service before sending production traffic to it. When creating a
      # service that uses the EXTERNAL deployment controller, you can specify only parameters that aren't
      # controlled at the task set level. The only required parameter is the service name. You control your
      # services using the CreateTaskSet . For more information, see Amazon ECS deployment types in the
      # Amazon Elastic Container Service Developer Guide . When the service scheduler launches new tasks, it
      # determines task placement. For information about task placement and task placement strategies, see
      # Amazon ECS task placement in the Amazon Elastic Container Service Developer Guide

      def create_service(
        service_name : String,
        availability_zone_rebalancing : String? = nil,
        capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
        client_token : String? = nil,
        cluster : String? = nil,
        deployment_configuration : Types::DeploymentConfiguration? = nil,
        deployment_controller : Types::DeploymentController? = nil,
        desired_count : Int32? = nil,
        enable_ecs_managed_tags : Bool? = nil,
        enable_execute_command : Bool? = nil,
        health_check_grace_period_seconds : Int32? = nil,
        launch_type : String? = nil,
        load_balancers : Array(Types::LoadBalancer)? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        placement_constraints : Array(Types::PlacementConstraint)? = nil,
        placement_strategy : Array(Types::PlacementStrategy)? = nil,
        platform_version : String? = nil,
        propagate_tags : String? = nil,
        role : String? = nil,
        scheduling_strategy : String? = nil,
        service_connect_configuration : Types::ServiceConnectConfiguration? = nil,
        service_registries : Array(Types::ServiceRegistry)? = nil,
        tags : Array(Types::Tag)? = nil,
        task_definition : String? = nil,
        volume_configurations : Array(Types::ServiceVolumeConfiguration)? = nil,
        vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)? = nil
      ) : Types::CreateServiceResponse

        input = Types::CreateServiceRequest.new(service_name: service_name, availability_zone_rebalancing: availability_zone_rebalancing, capacity_provider_strategy: capacity_provider_strategy, client_token: client_token, cluster: cluster, deployment_configuration: deployment_configuration, deployment_controller: deployment_controller, desired_count: desired_count, enable_ecs_managed_tags: enable_ecs_managed_tags, enable_execute_command: enable_execute_command, health_check_grace_period_seconds: health_check_grace_period_seconds, launch_type: launch_type, load_balancers: load_balancers, network_configuration: network_configuration, placement_constraints: placement_constraints, placement_strategy: placement_strategy, platform_version: platform_version, propagate_tags: propagate_tags, role: role, scheduling_strategy: scheduling_strategy, service_connect_configuration: service_connect_configuration, service_registries: service_registries, tags: tags, task_definition: task_definition, volume_configurations: volume_configurations, vpc_lattice_configurations: vpc_lattice_configurations)
        create_service(input)
      end

      def create_service(input : Types::CreateServiceRequest) : Types::CreateServiceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServiceResponse, "CreateService")
      end

      # Create a task set in the specified cluster and service. This is used when a service uses the
      # EXTERNAL deployment controller type. For more information, see Amazon ECS deployment types in the
      # Amazon Elastic Container Service Developer Guide . On March 21, 2024, a change was made to resolve
      # the task definition revision before authorization. When a task definition revision is not specified,
      # authorization will occur using the latest revision of a task definition. For information about the
      # maximum number of task sets and other quotas, see Amazon ECS service quotas in the Amazon Elastic
      # Container Service Developer Guide .

      def create_task_set(
        cluster : String,
        service : String,
        task_definition : String,
        capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
        client_token : String? = nil,
        external_id : String? = nil,
        launch_type : String? = nil,
        load_balancers : Array(Types::LoadBalancer)? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        platform_version : String? = nil,
        scale : Types::Scale? = nil,
        service_registries : Array(Types::ServiceRegistry)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTaskSetResponse

        input = Types::CreateTaskSetRequest.new(cluster: cluster, service: service, task_definition: task_definition, capacity_provider_strategy: capacity_provider_strategy, client_token: client_token, external_id: external_id, launch_type: launch_type, load_balancers: load_balancers, network_configuration: network_configuration, platform_version: platform_version, scale: scale, service_registries: service_registries, tags: tags)
        create_task_set(input)
      end

      def create_task_set(input : Types::CreateTaskSetRequest) : Types::CreateTaskSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TASK_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTaskSetResponse, "CreateTaskSet")
      end

      # Disables an account setting for a specified user, role, or the root user for an account.

      def delete_account_setting(
        name : String,
        principal_arn : String? = nil
      ) : Types::DeleteAccountSettingResponse

        input = Types::DeleteAccountSettingRequest.new(name: name, principal_arn: principal_arn)
        delete_account_setting(input)
      end

      def delete_account_setting(input : Types::DeleteAccountSettingRequest) : Types::DeleteAccountSettingResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACCOUNT_SETTING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAccountSettingResponse, "DeleteAccountSetting")
      end

      # Deletes one or more custom attributes from an Amazon ECS resource.

      def delete_attributes(
        attributes : Array(Types::Attribute),
        cluster : String? = nil
      ) : Types::DeleteAttributesResponse

        input = Types::DeleteAttributesRequest.new(attributes: attributes, cluster: cluster)
        delete_attributes(input)
      end

      def delete_attributes(input : Types::DeleteAttributesRequest) : Types::DeleteAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAttributesResponse, "DeleteAttributes")
      end

      # Deletes the specified capacity provider. The FARGATE and FARGATE_SPOT capacity providers are
      # reserved and can't be deleted. You can disassociate them from a cluster using either
      # PutClusterCapacityProviders or by deleting the cluster. Prior to a capacity provider being deleted,
      # the capacity provider must be removed from the capacity provider strategy from all services. The
      # UpdateService API can be used to remove a capacity provider from a service's capacity provider
      # strategy. When updating a service, the forceNewDeployment option can be used to ensure that any
      # tasks using the Amazon EC2 instance capacity provided by the capacity provider are transitioned to
      # use the capacity from the remaining capacity providers. Only capacity providers that aren't
      # associated with a cluster can be deleted. To remove a capacity provider from a cluster, you can
      # either use PutClusterCapacityProviders or delete the cluster.

      def delete_capacity_provider(
        capacity_provider : String,
        cluster : String? = nil
      ) : Types::DeleteCapacityProviderResponse

        input = Types::DeleteCapacityProviderRequest.new(capacity_provider: capacity_provider, cluster: cluster)
        delete_capacity_provider(input)
      end

      def delete_capacity_provider(input : Types::DeleteCapacityProviderRequest) : Types::DeleteCapacityProviderResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CAPACITY_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCapacityProviderResponse, "DeleteCapacityProvider")
      end

      # Deletes the specified cluster. The cluster transitions to the INACTIVE state. Clusters with an
      # INACTIVE status might remain discoverable in your account for a period of time. However, this
      # behavior is subject to change in the future. We don't recommend that you rely on INACTIVE clusters
      # persisting. You must deregister all container instances from this cluster before you may delete it.
      # You can list the container instances in a cluster with ListContainerInstances and deregister them
      # with DeregisterContainerInstance .

      def delete_cluster(
        cluster : String
      ) : Types::DeleteClusterResponse

        input = Types::DeleteClusterRequest.new(cluster: cluster)
        delete_cluster(input)
      end

      def delete_cluster(input : Types::DeleteClusterRequest) : Types::DeleteClusterResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteClusterResponse, "DeleteCluster")
      end

      # Deletes an Express service and removes all associated Amazon Web Services resources. This operation
      # stops service tasks, removes the Application Load Balancer, target groups, security groups,
      # auto-scaling policies, and other managed infrastructure components. The service enters a DRAINING
      # state where existing tasks complete current requests without starting new tasks. After all tasks
      # stop, the service and infrastructure are permanently removed. This operation cannot be reversed.
      # Back up important data and verify the service is no longer needed before deletion.

      def delete_express_gateway_service(
        service_arn : String
      ) : Types::DeleteExpressGatewayServiceResponse

        input = Types::DeleteExpressGatewayServiceRequest.new(service_arn: service_arn)
        delete_express_gateway_service(input)
      end

      def delete_express_gateway_service(input : Types::DeleteExpressGatewayServiceRequest) : Types::DeleteExpressGatewayServiceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_EXPRESS_GATEWAY_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteExpressGatewayServiceResponse, "DeleteExpressGatewayService")
      end

      # Deletes a specified service within a cluster. You can delete a service if you have no running tasks
      # in it and the desired task count is zero. If the service is actively maintaining tasks, you can't
      # delete it, and you must update the service to a desired task count of zero. For more information,
      # see UpdateService . When you delete a service, if there are still running tasks that require
      # cleanup, the service status moves from ACTIVE to DRAINING , and the service is no longer visible in
      # the console or in the ListServices API operation. After all tasks have transitioned to either
      # STOPPING or STOPPED status, the service status moves from DRAINING to INACTIVE . Services in the
      # DRAINING or INACTIVE status can still be viewed with the DescribeServices API operation. However, in
      # the future, INACTIVE services may be cleaned up and purged from Amazon ECS record keeping, and
      # DescribeServices calls on those services return a ServiceNotFoundException error. If you attempt to
      # create a new service with the same name as an existing service in either ACTIVE or DRAINING status,
      # you receive an error.

      def delete_service(
        service : String,
        cluster : String? = nil,
        force : Bool? = nil
      ) : Types::DeleteServiceResponse

        input = Types::DeleteServiceRequest.new(service: service, cluster: cluster, force: force)
        delete_service(input)
      end

      def delete_service(input : Types::DeleteServiceRequest) : Types::DeleteServiceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceResponse, "DeleteService")
      end

      # Deletes one or more task definitions. You must deregister a task definition revision before you
      # delete it. For more information, see DeregisterTaskDefinition . When you delete a task definition
      # revision, it is immediately transitions from the INACTIVE to DELETE_IN_PROGRESS . Existing tasks and
      # services that reference a DELETE_IN_PROGRESS task definition revision continue to run without
      # disruption. Existing services that reference a DELETE_IN_PROGRESS task definition revision can still
      # scale up or down by modifying the service's desired count. You can't use a DELETE_IN_PROGRESS task
      # definition revision to run new tasks or create new services. You also can't update an existing
      # service to reference a DELETE_IN_PROGRESS task definition revision. A task definition revision will
      # stay in DELETE_IN_PROGRESS status until all the associated tasks and services have been terminated.
      # When you delete all INACTIVE task definition revisions, the task definition name is not displayed in
      # the console and not returned in the API. If a task definition revisions are in the
      # DELETE_IN_PROGRESS state, the task definition name is displayed in the console and returned in the
      # API. The task definition name is retained by Amazon ECS and the revision is incremented the next
      # time you create a task definition with that name.

      def delete_task_definitions(
        task_definitions : Array(String)
      ) : Types::DeleteTaskDefinitionsResponse

        input = Types::DeleteTaskDefinitionsRequest.new(task_definitions: task_definitions)
        delete_task_definitions(input)
      end

      def delete_task_definitions(input : Types::DeleteTaskDefinitionsRequest) : Types::DeleteTaskDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TASK_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTaskDefinitionsResponse, "DeleteTaskDefinitions")
      end

      # Deletes a specified task set within a service. This is used when a service uses the EXTERNAL
      # deployment controller type. For more information, see Amazon ECS deployment types in the Amazon
      # Elastic Container Service Developer Guide .

      def delete_task_set(
        cluster : String,
        service : String,
        task_set : String,
        force : Bool? = nil
      ) : Types::DeleteTaskSetResponse

        input = Types::DeleteTaskSetRequest.new(cluster: cluster, service: service, task_set: task_set, force: force)
        delete_task_set(input)
      end

      def delete_task_set(input : Types::DeleteTaskSetRequest) : Types::DeleteTaskSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TASK_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTaskSetResponse, "DeleteTaskSet")
      end

      # Deregisters an Amazon ECS container instance from the specified cluster. This instance is no longer
      # available to run tasks. If you intend to use the container instance for some other purpose after
      # deregistration, we recommend that you stop all of the tasks running on the container instance before
      # deregistration. That prevents any orphaned tasks from consuming resources. Deregistering a container
      # instance removes the instance from a cluster, but it doesn't terminate the EC2 instance. If you are
      # finished using the instance, be sure to terminate it in the Amazon EC2 console to stop billing. If
      # you terminate a running container instance, Amazon ECS automatically deregisters the instance from
      # your cluster (stopped container instances or instances with disconnected agents aren't automatically
      # deregistered when terminated).

      def deregister_container_instance(
        container_instance : String,
        cluster : String? = nil,
        force : Bool? = nil
      ) : Types::DeregisterContainerInstanceResponse

        input = Types::DeregisterContainerInstanceRequest.new(container_instance: container_instance, cluster: cluster, force: force)
        deregister_container_instance(input)
      end

      def deregister_container_instance(input : Types::DeregisterContainerInstanceRequest) : Types::DeregisterContainerInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_CONTAINER_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterContainerInstanceResponse, "DeregisterContainerInstance")
      end

      # Deregisters the specified task definition by family and revision. Upon deregistration, the task
      # definition is marked as INACTIVE . Existing tasks and services that reference an INACTIVE task
      # definition continue to run without disruption. Existing services that reference an INACTIVE task
      # definition can still scale up or down by modifying the service's desired count. If you want to
      # delete a task definition revision, you must first deregister the task definition revision. You can't
      # use an INACTIVE task definition to run new tasks or create new services, and you can't update an
      # existing service to reference an INACTIVE task definition. However, there may be up to a 10-minute
      # window following deregistration where these restrictions have not yet taken effect. At this time,
      # INACTIVE task definitions remain discoverable in your account indefinitely. However, this behavior
      # is subject to change in the future. We don't recommend that you rely on INACTIVE task definitions
      # persisting beyond the lifecycle of any associated tasks and services. You must deregister a task
      # definition revision before you delete it. For more information, see DeleteTaskDefinitions .

      def deregister_task_definition(
        task_definition : String
      ) : Types::DeregisterTaskDefinitionResponse

        input = Types::DeregisterTaskDefinitionRequest.new(task_definition: task_definition)
        deregister_task_definition(input)
      end

      def deregister_task_definition(input : Types::DeregisterTaskDefinitionRequest) : Types::DeregisterTaskDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_TASK_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterTaskDefinitionResponse, "DeregisterTaskDefinition")
      end

      # Describes one or more of your capacity providers.

      def describe_capacity_providers(
        capacity_providers : Array(String)? = nil,
        cluster : String? = nil,
        include : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeCapacityProvidersResponse

        input = Types::DescribeCapacityProvidersRequest.new(capacity_providers: capacity_providers, cluster: cluster, include: include, max_results: max_results, next_token: next_token)
        describe_capacity_providers(input)
      end

      def describe_capacity_providers(input : Types::DescribeCapacityProvidersRequest) : Types::DescribeCapacityProvidersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CAPACITY_PROVIDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCapacityProvidersResponse, "DescribeCapacityProviders")
      end

      # Describes one or more of your clusters. For CLI examples, see describe-clusters.rst on GitHub.

      def describe_clusters(
        clusters : Array(String)? = nil,
        include : Array(String)? = nil
      ) : Types::DescribeClustersResponse

        input = Types::DescribeClustersRequest.new(clusters: clusters, include: include)
        describe_clusters(input)
      end

      def describe_clusters(input : Types::DescribeClustersRequest) : Types::DescribeClustersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClustersResponse, "DescribeClusters")
      end

      # Describes one or more container instances. Returns metadata about each container instance requested.

      def describe_container_instances(
        container_instances : Array(String),
        cluster : String? = nil,
        include : Array(String)? = nil
      ) : Types::DescribeContainerInstancesResponse

        input = Types::DescribeContainerInstancesRequest.new(container_instances: container_instances, cluster: cluster, include: include)
        describe_container_instances(input)
      end

      def describe_container_instances(input : Types::DescribeContainerInstancesRequest) : Types::DescribeContainerInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONTAINER_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeContainerInstancesResponse, "DescribeContainerInstances")
      end

      # Retrieves detailed information about an Express service, including current status, configuration,
      # managed infrastructure, and service revisions. Returns comprehensive service details, active service
      # revisions, ingress paths with endpoints, and managed Amazon Web Services resource status including
      # load balancers and auto-scaling policies. Use the include parameter to retrieve additional
      # information such as resource tags.

      def describe_express_gateway_service(
        service_arn : String,
        include : Array(String)? = nil
      ) : Types::DescribeExpressGatewayServiceResponse

        input = Types::DescribeExpressGatewayServiceRequest.new(service_arn: service_arn, include: include)
        describe_express_gateway_service(input)
      end

      def describe_express_gateway_service(input : Types::DescribeExpressGatewayServiceRequest) : Types::DescribeExpressGatewayServiceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXPRESS_GATEWAY_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExpressGatewayServiceResponse, "DescribeExpressGatewayService")
      end

      # Describes one or more of your service deployments. A service deployment happens when you release a
      # software update for the service. For more information, see View service history using Amazon ECS
      # service deployments .

      def describe_service_deployments(
        service_deployment_arns : Array(String)
      ) : Types::DescribeServiceDeploymentsResponse

        input = Types::DescribeServiceDeploymentsRequest.new(service_deployment_arns: service_deployment_arns)
        describe_service_deployments(input)
      end

      def describe_service_deployments(input : Types::DescribeServiceDeploymentsRequest) : Types::DescribeServiceDeploymentsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVICE_DEPLOYMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServiceDeploymentsResponse, "DescribeServiceDeployments")
      end

      # Describes one or more service revisions. A service revision is a version of the service that
      # includes the values for the Amazon ECS resources (for example, task definition) and the environment
      # resources (for example, load balancers, subnets, and security groups). For more information, see
      # Amazon ECS service revisions . You can't describe a service revision that was created before October
      # 25, 2024.

      def describe_service_revisions(
        service_revision_arns : Array(String)
      ) : Types::DescribeServiceRevisionsResponse

        input = Types::DescribeServiceRevisionsRequest.new(service_revision_arns: service_revision_arns)
        describe_service_revisions(input)
      end

      def describe_service_revisions(input : Types::DescribeServiceRevisionsRequest) : Types::DescribeServiceRevisionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVICE_REVISIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServiceRevisionsResponse, "DescribeServiceRevisions")
      end

      # Describes the specified services running in your cluster.

      def describe_services(
        services : Array(String),
        cluster : String? = nil,
        include : Array(String)? = nil
      ) : Types::DescribeServicesResponse

        input = Types::DescribeServicesRequest.new(services: services, cluster: cluster, include: include)
        describe_services(input)
      end

      def describe_services(input : Types::DescribeServicesRequest) : Types::DescribeServicesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServicesResponse, "DescribeServices")
      end

      # Describes a task definition. You can specify a family and revision to find information about a
      # specific task definition, or you can simply specify the family to find the latest ACTIVE revision in
      # that family. You can only describe INACTIVE task definitions while an active task or service
      # references them.

      def describe_task_definition(
        task_definition : String,
        include : Array(String)? = nil
      ) : Types::DescribeTaskDefinitionResponse

        input = Types::DescribeTaskDefinitionRequest.new(task_definition: task_definition, include: include)
        describe_task_definition(input)
      end

      def describe_task_definition(input : Types::DescribeTaskDefinitionRequest) : Types::DescribeTaskDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TASK_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTaskDefinitionResponse, "DescribeTaskDefinition")
      end

      # Describes the task sets in the specified cluster and service. This is used when a service uses the
      # EXTERNAL deployment controller type. For more information, see Amazon ECS Deployment Types in the
      # Amazon Elastic Container Service Developer Guide .

      def describe_task_sets(
        cluster : String,
        service : String,
        include : Array(String)? = nil,
        task_sets : Array(String)? = nil
      ) : Types::DescribeTaskSetsResponse

        input = Types::DescribeTaskSetsRequest.new(cluster: cluster, service: service, include: include, task_sets: task_sets)
        describe_task_sets(input)
      end

      def describe_task_sets(input : Types::DescribeTaskSetsRequest) : Types::DescribeTaskSetsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TASK_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTaskSetsResponse, "DescribeTaskSets")
      end

      # Describes a specified task or tasks. Currently, stopped tasks appear in the returned results for at
      # least one hour. If you have tasks with tags, and then delete the cluster, the tagged tasks are
      # returned in the response. If you create a new cluster with the same name as the deleted cluster, the
      # tagged tasks are not included in the response.

      def describe_tasks(
        tasks : Array(String),
        cluster : String? = nil,
        include : Array(String)? = nil
      ) : Types::DescribeTasksResponse

        input = Types::DescribeTasksRequest.new(tasks: tasks, cluster: cluster, include: include)
        describe_tasks(input)
      end

      def describe_tasks(input : Types::DescribeTasksRequest) : Types::DescribeTasksResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTasksResponse, "DescribeTasks")
      end

      # This action is only used by the Amazon ECS agent, and it is not intended for use outside of the
      # agent. Returns an endpoint for the Amazon ECS agent to poll for updates.

      def discover_poll_endpoint(
        cluster : String? = nil,
        container_instance : String? = nil
      ) : Types::DiscoverPollEndpointResponse

        input = Types::DiscoverPollEndpointRequest.new(cluster: cluster, container_instance: container_instance)
        discover_poll_endpoint(input)
      end

      def discover_poll_endpoint(input : Types::DiscoverPollEndpointRequest) : Types::DiscoverPollEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::DISCOVER_POLL_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DiscoverPollEndpointResponse, "DiscoverPollEndpoint")
      end

      # Runs a command remotely on a container within a task. If you use a condition key in your IAM policy
      # to refine the conditions for the policy statement, for example limit the actions to a specific
      # cluster, you receive an AccessDeniedException when there is a mismatch between the condition key
      # value and the corresponding parameter value. For information about required permissions and
      # considerations, see Using Amazon ECS Exec for debugging in the Amazon ECS Developer Guide .

      def execute_command(
        command : String,
        interactive : Bool,
        task : String,
        cluster : String? = nil,
        container : String? = nil
      ) : Types::ExecuteCommandResponse

        input = Types::ExecuteCommandRequest.new(command: command, interactive: interactive, task: task, cluster: cluster, container: container)
        execute_command(input)
      end

      def execute_command(input : Types::ExecuteCommandRequest) : Types::ExecuteCommandResponse
        request = Protocol::JsonRpc.build_request(Model::EXECUTE_COMMAND, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExecuteCommandResponse, "ExecuteCommand")
      end

      # Retrieves the protection status of tasks in an Amazon ECS service.

      def get_task_protection(
        cluster : String,
        tasks : Array(String)? = nil
      ) : Types::GetTaskProtectionResponse

        input = Types::GetTaskProtectionRequest.new(cluster: cluster, tasks: tasks)
        get_task_protection(input)
      end

      def get_task_protection(input : Types::GetTaskProtectionRequest) : Types::GetTaskProtectionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TASK_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTaskProtectionResponse, "GetTaskProtection")
      end

      # Lists the account settings for a specified principal.

      def list_account_settings(
        effective_settings : Bool? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        principal_arn : String? = nil,
        value : String? = nil
      ) : Types::ListAccountSettingsResponse

        input = Types::ListAccountSettingsRequest.new(effective_settings: effective_settings, max_results: max_results, name: name, next_token: next_token, principal_arn: principal_arn, value: value)
        list_account_settings(input)
      end

      def list_account_settings(input : Types::ListAccountSettingsRequest) : Types::ListAccountSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountSettingsResponse, "ListAccountSettings")
      end

      # Lists the attributes for Amazon ECS resources within a specified target type and cluster. When you
      # specify a target type and cluster, ListAttributes returns a list of attribute objects, one for each
      # attribute on each resource. You can filter the list of results to a single attribute name to only
      # return results that have that name. You can also filter the results by attribute name and value. You
      # can do this, for example, to see which container instances in a cluster are running a Linux AMI (
      # ecs.os-type=linux ).

      def list_attributes(
        target_type : String,
        attribute_name : String? = nil,
        attribute_value : String? = nil,
        cluster : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAttributesResponse

        input = Types::ListAttributesRequest.new(target_type: target_type, attribute_name: attribute_name, attribute_value: attribute_value, cluster: cluster, max_results: max_results, next_token: next_token)
        list_attributes(input)
      end

      def list_attributes(input : Types::ListAttributesRequest) : Types::ListAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAttributesResponse, "ListAttributes")
      end

      # Returns a list of existing clusters.

      def list_clusters(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListClustersResponse

        input = Types::ListClustersRequest.new(max_results: max_results, next_token: next_token)
        list_clusters(input)
      end

      def list_clusters(input : Types::ListClustersRequest) : Types::ListClustersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListClustersResponse, "ListClusters")
      end

      # Returns a list of container instances in a specified cluster. You can filter the results of a
      # ListContainerInstances operation with cluster query language statements inside the filter parameter.
      # For more information, see Cluster Query Language in the Amazon Elastic Container Service Developer
      # Guide .

      def list_container_instances(
        cluster : String? = nil,
        filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListContainerInstancesResponse

        input = Types::ListContainerInstancesRequest.new(cluster: cluster, filter: filter, max_results: max_results, next_token: next_token, status: status)
        list_container_instances(input)
      end

      def list_container_instances(input : Types::ListContainerInstancesRequest) : Types::ListContainerInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONTAINER_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListContainerInstancesResponse, "ListContainerInstances")
      end

      # This operation lists all the service deployments that meet the specified filter criteria. A service
      # deployment happens when you release a software update for the service. You route traffic from the
      # running service revisions to the new service revison and control the number of running tasks. This
      # API returns the values that you use for the request parameters in DescribeServiceRevisions .

      def list_service_deployments(
        service : String,
        cluster : String? = nil,
        created_at : Types::CreatedAt? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : Array(String)? = nil
      ) : Types::ListServiceDeploymentsResponse

        input = Types::ListServiceDeploymentsRequest.new(service: service, cluster: cluster, created_at: created_at, max_results: max_results, next_token: next_token, status: status)
        list_service_deployments(input)
      end

      def list_service_deployments(input : Types::ListServiceDeploymentsRequest) : Types::ListServiceDeploymentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_DEPLOYMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceDeploymentsResponse, "ListServiceDeployments")
      end

      # Returns a list of services. You can filter the results by cluster, launch type, and scheduling
      # strategy.

      def list_services(
        cluster : String? = nil,
        launch_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_management_type : String? = nil,
        scheduling_strategy : String? = nil
      ) : Types::ListServicesResponse

        input = Types::ListServicesRequest.new(cluster: cluster, launch_type: launch_type, max_results: max_results, next_token: next_token, resource_management_type: resource_management_type, scheduling_strategy: scheduling_strategy)
        list_services(input)
      end

      def list_services(input : Types::ListServicesRequest) : Types::ListServicesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServicesResponse, "ListServices")
      end

      # This operation lists all of the services that are associated with a Cloud Map namespace. This list
      # might include services in different clusters. In contrast, ListServices can only list services in
      # one cluster at a time. If you need to filter the list of services in a single cluster by various
      # parameters, use ListServices . For more information, see Service Connect in the Amazon Elastic
      # Container Service Developer Guide .

      def list_services_by_namespace(
        namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServicesByNamespaceResponse

        input = Types::ListServicesByNamespaceRequest.new(namespace: namespace, max_results: max_results, next_token: next_token)
        list_services_by_namespace(input)
      end

      def list_services_by_namespace(input : Types::ListServicesByNamespaceRequest) : Types::ListServicesByNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICES_BY_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServicesByNamespaceResponse, "ListServicesByNamespace")
      end

      # List the tags for an Amazon ECS resource.

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

      # Returns a list of task definition families that are registered to your account. This list includes
      # task definition families that no longer have any ACTIVE task definition revisions. You can filter
      # out task definition families that don't contain any ACTIVE task definition revisions by setting the
      # status parameter to ACTIVE . You can also filter the results with the familyPrefix parameter.

      def list_task_definition_families(
        family_prefix : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListTaskDefinitionFamiliesResponse

        input = Types::ListTaskDefinitionFamiliesRequest.new(family_prefix: family_prefix, max_results: max_results, next_token: next_token, status: status)
        list_task_definition_families(input)
      end

      def list_task_definition_families(input : Types::ListTaskDefinitionFamiliesRequest) : Types::ListTaskDefinitionFamiliesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TASK_DEFINITION_FAMILIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTaskDefinitionFamiliesResponse, "ListTaskDefinitionFamilies")
      end

      # Returns a list of task definitions that are registered to your account. You can filter the results
      # by family name with the familyPrefix parameter or by status with the status parameter.

      def list_task_definitions(
        family_prefix : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : String? = nil,
        status : String? = nil
      ) : Types::ListTaskDefinitionsResponse

        input = Types::ListTaskDefinitionsRequest.new(family_prefix: family_prefix, max_results: max_results, next_token: next_token, sort: sort, status: status)
        list_task_definitions(input)
      end

      def list_task_definitions(input : Types::ListTaskDefinitionsRequest) : Types::ListTaskDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TASK_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTaskDefinitionsResponse, "ListTaskDefinitions")
      end

      # Returns a list of tasks. You can filter the results by cluster, task definition family, container
      # instance, launch type, what IAM principal started the task, or by the desired status of the task.
      # Recently stopped tasks might appear in the returned results.

      def list_tasks(
        cluster : String? = nil,
        container_instance : String? = nil,
        desired_status : String? = nil,
        family : String? = nil,
        launch_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_name : String? = nil,
        started_by : String? = nil
      ) : Types::ListTasksResponse

        input = Types::ListTasksRequest.new(cluster: cluster, container_instance: container_instance, desired_status: desired_status, family: family, launch_type: launch_type, max_results: max_results, next_token: next_token, service_name: service_name, started_by: started_by)
        list_tasks(input)
      end

      def list_tasks(input : Types::ListTasksRequest) : Types::ListTasksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTasksResponse, "ListTasks")
      end

      # Modifies an account setting. Account settings are set on a per-Region basis. If you change the root
      # user account setting, the default settings are reset for users and roles that do not have specified
      # individual account settings. For more information, see Account Settings in the Amazon Elastic
      # Container Service Developer Guide .

      def put_account_setting(
        name : String,
        value : String,
        principal_arn : String? = nil
      ) : Types::PutAccountSettingResponse

        input = Types::PutAccountSettingRequest.new(name: name, value: value, principal_arn: principal_arn)
        put_account_setting(input)
      end

      def put_account_setting(input : Types::PutAccountSettingRequest) : Types::PutAccountSettingResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_ACCOUNT_SETTING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAccountSettingResponse, "PutAccountSetting")
      end

      # Modifies an account setting for all users on an account for whom no individual account setting has
      # been specified. Account settings are set on a per-Region basis.

      def put_account_setting_default(
        name : String,
        value : String
      ) : Types::PutAccountSettingDefaultResponse

        input = Types::PutAccountSettingDefaultRequest.new(name: name, value: value)
        put_account_setting_default(input)
      end

      def put_account_setting_default(input : Types::PutAccountSettingDefaultRequest) : Types::PutAccountSettingDefaultResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_ACCOUNT_SETTING_DEFAULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAccountSettingDefaultResponse, "PutAccountSettingDefault")
      end

      # Create or update an attribute on an Amazon ECS resource. If the attribute doesn't exist, it's
      # created. If the attribute exists, its value is replaced with the specified value. To delete an
      # attribute, use DeleteAttributes . For more information, see Attributes in the Amazon Elastic
      # Container Service Developer Guide .

      def put_attributes(
        attributes : Array(Types::Attribute),
        cluster : String? = nil
      ) : Types::PutAttributesResponse

        input = Types::PutAttributesRequest.new(attributes: attributes, cluster: cluster)
        put_attributes(input)
      end

      def put_attributes(input : Types::PutAttributesRequest) : Types::PutAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAttributesResponse, "PutAttributes")
      end

      # Modifies the available capacity providers and the default capacity provider strategy for a cluster.
      # You must specify both the available capacity providers and a default capacity provider strategy for
      # the cluster. If the specified cluster has existing capacity providers associated with it, you must
      # specify all existing capacity providers in addition to any new ones you want to add. Any existing
      # capacity providers that are associated with a cluster that are omitted from a
      # PutClusterCapacityProviders API call will be disassociated with the cluster. You can only
      # disassociate an existing capacity provider from a cluster if it's not being used by any existing
      # tasks. When creating a service or running a task on a cluster, if no capacity provider or launch
      # type is specified, then the cluster's default capacity provider strategy is used. We recommend that
      # you define a default capacity provider strategy for your cluster. However, you must specify an empty
      # array ( [] ) to bypass defining a default strategy. Amazon ECS Managed Instances doesn't support
      # this, because when you create a capacity provider with Amazon ECS Managed Instances, it becomes
      # available only within the specified cluster.

      def put_cluster_capacity_providers(
        capacity_providers : Array(String),
        cluster : String,
        default_capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)
      ) : Types::PutClusterCapacityProvidersResponse

        input = Types::PutClusterCapacityProvidersRequest.new(capacity_providers: capacity_providers, cluster: cluster, default_capacity_provider_strategy: default_capacity_provider_strategy)
        put_cluster_capacity_providers(input)
      end

      def put_cluster_capacity_providers(input : Types::PutClusterCapacityProvidersRequest) : Types::PutClusterCapacityProvidersResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_CLUSTER_CAPACITY_PROVIDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutClusterCapacityProvidersResponse, "PutClusterCapacityProviders")
      end

      # This action is only used by the Amazon ECS agent, and it is not intended for use outside of the
      # agent. Registers an EC2 instance into the specified cluster. This instance becomes available to
      # place containers on.

      def register_container_instance(
        attributes : Array(Types::Attribute)? = nil,
        cluster : String? = nil,
        container_instance_arn : String? = nil,
        instance_identity_document : String? = nil,
        instance_identity_document_signature : String? = nil,
        platform_devices : Array(Types::PlatformDevice)? = nil,
        tags : Array(Types::Tag)? = nil,
        total_resources : Array(Types::Resource)? = nil,
        version_info : Types::VersionInfo? = nil
      ) : Types::RegisterContainerInstanceResponse

        input = Types::RegisterContainerInstanceRequest.new(attributes: attributes, cluster: cluster, container_instance_arn: container_instance_arn, instance_identity_document: instance_identity_document, instance_identity_document_signature: instance_identity_document_signature, platform_devices: platform_devices, tags: tags, total_resources: total_resources, version_info: version_info)
        register_container_instance(input)
      end

      def register_container_instance(input : Types::RegisterContainerInstanceRequest) : Types::RegisterContainerInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_CONTAINER_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterContainerInstanceResponse, "RegisterContainerInstance")
      end

      # Registers a new task definition from the supplied family and containerDefinitions . Optionally, you
      # can add data volumes to your containers with the volumes parameter. For more information about task
      # definition parameters and defaults, see Amazon ECS Task Definitions in the Amazon Elastic Container
      # Service Developer Guide . You can specify a role for your task with the taskRoleArn parameter. When
      # you specify a role for a task, its containers can then use the latest versions of the CLI or SDKs to
      # make API requests to the Amazon Web Services services that are specified in the policy that's
      # associated with the role. For more information, see IAM Roles for Tasks in the Amazon Elastic
      # Container Service Developer Guide . You can specify a Docker networking mode for the containers in
      # your task definition with the networkMode parameter. If you specify the awsvpc network mode, the
      # task is allocated an elastic network interface, and you must specify a NetworkConfiguration when you
      # create a service or run a task with the task definition. For more information, see Task Networking
      # in the Amazon Elastic Container Service Developer Guide .

      def register_task_definition(
        container_definitions : Array(Types::ContainerDefinition),
        family : String,
        cpu : String? = nil,
        enable_fault_injection : Bool? = nil,
        ephemeral_storage : Types::EphemeralStorage? = nil,
        execution_role_arn : String? = nil,
        inference_accelerators : Array(Types::InferenceAccelerator)? = nil,
        ipc_mode : String? = nil,
        memory : String? = nil,
        network_mode : String? = nil,
        pid_mode : String? = nil,
        placement_constraints : Array(Types::TaskDefinitionPlacementConstraint)? = nil,
        proxy_configuration : Types::ProxyConfiguration? = nil,
        requires_compatibilities : Array(String)? = nil,
        runtime_platform : Types::RuntimePlatform? = nil,
        tags : Array(Types::Tag)? = nil,
        task_role_arn : String? = nil,
        volumes : Array(Types::Volume)? = nil
      ) : Types::RegisterTaskDefinitionResponse

        input = Types::RegisterTaskDefinitionRequest.new(container_definitions: container_definitions, family: family, cpu: cpu, enable_fault_injection: enable_fault_injection, ephemeral_storage: ephemeral_storage, execution_role_arn: execution_role_arn, inference_accelerators: inference_accelerators, ipc_mode: ipc_mode, memory: memory, network_mode: network_mode, pid_mode: pid_mode, placement_constraints: placement_constraints, proxy_configuration: proxy_configuration, requires_compatibilities: requires_compatibilities, runtime_platform: runtime_platform, tags: tags, task_role_arn: task_role_arn, volumes: volumes)
        register_task_definition(input)
      end

      def register_task_definition(input : Types::RegisterTaskDefinitionRequest) : Types::RegisterTaskDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_TASK_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterTaskDefinitionResponse, "RegisterTaskDefinition")
      end

      # Starts a new task using the specified task definition. On March 21, 2024, a change was made to
      # resolve the task definition revision before authorization. When a task definition revision is not
      # specified, authorization will occur using the latest revision of a task definition. Amazon Elastic
      # Inference (EI) is no longer available to customers. You can allow Amazon ECS to place tasks for you,
      # or you can customize how Amazon ECS places tasks using placement constraints and placement
      # strategies. For more information, see Scheduling Tasks in the Amazon Elastic Container Service
      # Developer Guide . Alternatively, you can use StartTask to use your own scheduler or place tasks
      # manually on specific container instances. You can attach Amazon EBS volumes to Amazon ECS tasks by
      # configuring the volume when creating or updating a service. For more information, see Amazon EBS
      # volumes in the Amazon Elastic Container Service Developer Guide . The Amazon ECS API follows an
      # eventual consistency model. This is because of the distributed nature of the system supporting the
      # API. This means that the result of an API command you run that affects your Amazon ECS resources
      # might not be immediately visible to all subsequent commands you run. Keep this in mind when you
      # carry out an API command that immediately follows a previous API command. To manage eventual
      # consistency, you can do the following: Confirm the state of the resource before you run a command to
      # modify it. Run the DescribeTasks command using an exponential backoff algorithm to ensure that you
      # allow enough time for the previous command to propagate through the system. To do this, run the
      # DescribeTasks command repeatedly, starting with a couple of seconds of wait time and increasing
      # gradually up to five minutes of wait time. Add wait time between subsequent commands, even if the
      # DescribeTasks command returns an accurate response. Apply an exponential backoff algorithm starting
      # with a couple of seconds of wait time, and increase gradually up to about five minutes of wait time.
      # If you get a ConflictException error, the RunTask request could not be processed due to conflicts.
      # The provided clientToken is already in use with a different RunTask request. The resourceIds are the
      # existing task ARNs which are already associated with the clientToken . To fix this issue: Run
      # RunTask with a unique clientToken . Run RunTask with the clientToken and the original set of
      # parameters If you get a ClientException error, the RunTask could not be processed because you use
      # managed scaling and there is a capacity error because the quota of tasks in the PROVISIONING per
      # cluster has been reached. For information about the service quotas, see Amazon ECS service quotas .

      def run_task(
        task_definition : String,
        capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
        client_token : String? = nil,
        cluster : String? = nil,
        count : Int32? = nil,
        enable_ecs_managed_tags : Bool? = nil,
        enable_execute_command : Bool? = nil,
        group : String? = nil,
        launch_type : String? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        overrides : Types::TaskOverride? = nil,
        placement_constraints : Array(Types::PlacementConstraint)? = nil,
        placement_strategy : Array(Types::PlacementStrategy)? = nil,
        platform_version : String? = nil,
        propagate_tags : String? = nil,
        reference_id : String? = nil,
        started_by : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_configurations : Array(Types::TaskVolumeConfiguration)? = nil
      ) : Types::RunTaskResponse

        input = Types::RunTaskRequest.new(task_definition: task_definition, capacity_provider_strategy: capacity_provider_strategy, client_token: client_token, cluster: cluster, count: count, enable_ecs_managed_tags: enable_ecs_managed_tags, enable_execute_command: enable_execute_command, group: group, launch_type: launch_type, network_configuration: network_configuration, overrides: overrides, placement_constraints: placement_constraints, placement_strategy: placement_strategy, platform_version: platform_version, propagate_tags: propagate_tags, reference_id: reference_id, started_by: started_by, tags: tags, volume_configurations: volume_configurations)
        run_task(input)
      end

      def run_task(input : Types::RunTaskRequest) : Types::RunTaskResponse
        request = Protocol::JsonRpc.build_request(Model::RUN_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RunTaskResponse, "RunTask")
      end

      # Starts a new task from the specified task definition on the specified container instance or
      # instances. On March 21, 2024, a change was made to resolve the task definition revision before
      # authorization. When a task definition revision is not specified, authorization will occur using the
      # latest revision of a task definition. Amazon Elastic Inference (EI) is no longer available to
      # customers. Alternatively, you can use RunTask to place tasks for you. For more information, see
      # Scheduling Tasks in the Amazon Elastic Container Service Developer Guide . You can attach Amazon EBS
      # volumes to Amazon ECS tasks by configuring the volume when creating or updating a service. For more
      # information, see Amazon EBS volumes in the Amazon Elastic Container Service Developer Guide .

      def start_task(
        container_instances : Array(String),
        task_definition : String,
        cluster : String? = nil,
        enable_ecs_managed_tags : Bool? = nil,
        enable_execute_command : Bool? = nil,
        group : String? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        overrides : Types::TaskOverride? = nil,
        propagate_tags : String? = nil,
        reference_id : String? = nil,
        started_by : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_configurations : Array(Types::TaskVolumeConfiguration)? = nil
      ) : Types::StartTaskResponse

        input = Types::StartTaskRequest.new(container_instances: container_instances, task_definition: task_definition, cluster: cluster, enable_ecs_managed_tags: enable_ecs_managed_tags, enable_execute_command: enable_execute_command, group: group, network_configuration: network_configuration, overrides: overrides, propagate_tags: propagate_tags, reference_id: reference_id, started_by: started_by, tags: tags, volume_configurations: volume_configurations)
        start_task(input)
      end

      def start_task(input : Types::StartTaskRequest) : Types::StartTaskResponse
        request = Protocol::JsonRpc.build_request(Model::START_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartTaskResponse, "StartTask")
      end

      # Stops an ongoing service deployment. The following stop types are avaiable: ROLLBACK - This option
      # rolls back the service deployment to the previous service revision. You can use this option even if
      # you didn't configure the service deployment for the rollback option. For more information, see
      # Stopping Amazon ECS service deployments in the Amazon Elastic Container Service Developer Guide .

      def stop_service_deployment(
        service_deployment_arn : String,
        stop_type : String? = nil
      ) : Types::StopServiceDeploymentResponse

        input = Types::StopServiceDeploymentRequest.new(service_deployment_arn: service_deployment_arn, stop_type: stop_type)
        stop_service_deployment(input)
      end

      def stop_service_deployment(input : Types::StopServiceDeploymentRequest) : Types::StopServiceDeploymentResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_SERVICE_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopServiceDeploymentResponse, "StopServiceDeployment")
      end

      # Stops a running task. Any tags associated with the task will be deleted. When you call StopTask on a
      # task, the equivalent of docker stop is issued to the containers running in the task. This results in
      # a stop signal value and a default 30-second timeout, after which the SIGKILL value is sent and the
      # containers are forcibly stopped. This signal can be defined in your container image with the
      # STOPSIGNAL instruction and will default to SIGTERM . If the container handles the SIGTERM value
      # gracefully and exits within 30 seconds from receiving it, no SIGKILL value is sent. For Windows
      # containers, POSIX signals do not work and runtime stops the container by sending a
      # CTRL_SHUTDOWN_EVENT . For more information, see Unable to react to graceful shutdown of (Windows)
      # container #25982 on GitHub. The default 30-second timeout can be configured on the Amazon ECS
      # container agent with the ECS_CONTAINER_STOP_TIMEOUT variable. For more information, see Amazon ECS
      # Container Agent Configuration in the Amazon Elastic Container Service Developer Guide .

      def stop_task(
        task : String,
        cluster : String? = nil,
        reason : String? = nil
      ) : Types::StopTaskResponse

        input = Types::StopTaskRequest.new(task: task, cluster: cluster, reason: reason)
        stop_task(input)
      end

      def stop_task(input : Types::StopTaskRequest) : Types::StopTaskResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopTaskResponse, "StopTask")
      end

      # This action is only used by the Amazon ECS agent, and it is not intended for use outside of the
      # agent. Sent to acknowledge that an attachment changed states.

      def submit_attachment_state_changes(
        attachments : Array(Types::AttachmentStateChange),
        cluster : String? = nil
      ) : Types::SubmitAttachmentStateChangesResponse

        input = Types::SubmitAttachmentStateChangesRequest.new(attachments: attachments, cluster: cluster)
        submit_attachment_state_changes(input)
      end

      def submit_attachment_state_changes(input : Types::SubmitAttachmentStateChangesRequest) : Types::SubmitAttachmentStateChangesResponse
        request = Protocol::JsonRpc.build_request(Model::SUBMIT_ATTACHMENT_STATE_CHANGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SubmitAttachmentStateChangesResponse, "SubmitAttachmentStateChanges")
      end

      # This action is only used by the Amazon ECS agent, and it is not intended for use outside of the
      # agent. Sent to acknowledge that a container changed states.

      def submit_container_state_change(
        cluster : String? = nil,
        container_name : String? = nil,
        exit_code : Int32? = nil,
        network_bindings : Array(Types::NetworkBinding)? = nil,
        reason : String? = nil,
        runtime_id : String? = nil,
        status : String? = nil,
        task : String? = nil
      ) : Types::SubmitContainerStateChangeResponse

        input = Types::SubmitContainerStateChangeRequest.new(cluster: cluster, container_name: container_name, exit_code: exit_code, network_bindings: network_bindings, reason: reason, runtime_id: runtime_id, status: status, task: task)
        submit_container_state_change(input)
      end

      def submit_container_state_change(input : Types::SubmitContainerStateChangeRequest) : Types::SubmitContainerStateChangeResponse
        request = Protocol::JsonRpc.build_request(Model::SUBMIT_CONTAINER_STATE_CHANGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SubmitContainerStateChangeResponse, "SubmitContainerStateChange")
      end

      # This action is only used by the Amazon ECS agent, and it is not intended for use outside of the
      # agent. Sent to acknowledge that a task changed states.

      def submit_task_state_change(
        attachments : Array(Types::AttachmentStateChange)? = nil,
        cluster : String? = nil,
        containers : Array(Types::ContainerStateChange)? = nil,
        execution_stopped_at : Time? = nil,
        managed_agents : Array(Types::ManagedAgentStateChange)? = nil,
        pull_started_at : Time? = nil,
        pull_stopped_at : Time? = nil,
        reason : String? = nil,
        status : String? = nil,
        task : String? = nil
      ) : Types::SubmitTaskStateChangeResponse

        input = Types::SubmitTaskStateChangeRequest.new(attachments: attachments, cluster: cluster, containers: containers, execution_stopped_at: execution_stopped_at, managed_agents: managed_agents, pull_started_at: pull_started_at, pull_stopped_at: pull_stopped_at, reason: reason, status: status, task: task)
        submit_task_state_change(input)
      end

      def submit_task_state_change(input : Types::SubmitTaskStateChangeRequest) : Types::SubmitTaskStateChangeResponse
        request = Protocol::JsonRpc.build_request(Model::SUBMIT_TASK_STATE_CHANGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SubmitTaskStateChangeResponse, "SubmitTaskStateChange")
      end

      # Associates the specified tags to a resource with the specified resourceArn . If existing tags on a
      # resource aren't specified in the request parameters, they aren't changed. When a resource is
      # deleted, the tags that are associated with that resource are deleted as well.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
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

      # Deletes specified tags from a resource.

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

      # Modifies the parameters for a capacity provider. These changes only apply to new Amazon ECS Managed
      # Instances, or EC2 instances, not existing ones.

      def update_capacity_provider(
        name : String,
        auto_scaling_group_provider : Types::AutoScalingGroupProviderUpdate? = nil,
        cluster : String? = nil,
        managed_instances_provider : Types::UpdateManagedInstancesProviderConfiguration? = nil
      ) : Types::UpdateCapacityProviderResponse

        input = Types::UpdateCapacityProviderRequest.new(name: name, auto_scaling_group_provider: auto_scaling_group_provider, cluster: cluster, managed_instances_provider: managed_instances_provider)
        update_capacity_provider(input)
      end

      def update_capacity_provider(input : Types::UpdateCapacityProviderRequest) : Types::UpdateCapacityProviderResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CAPACITY_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCapacityProviderResponse, "UpdateCapacityProvider")
      end

      # Updates the cluster.

      def update_cluster(
        cluster : String,
        configuration : Types::ClusterConfiguration? = nil,
        service_connect_defaults : Types::ClusterServiceConnectDefaultsRequest? = nil,
        settings : Array(Types::ClusterSetting)? = nil
      ) : Types::UpdateClusterResponse

        input = Types::UpdateClusterRequest.new(cluster: cluster, configuration: configuration, service_connect_defaults: service_connect_defaults, settings: settings)
        update_cluster(input)
      end

      def update_cluster(input : Types::UpdateClusterRequest) : Types::UpdateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClusterResponse, "UpdateCluster")
      end

      # Modifies the settings to use for a cluster.

      def update_cluster_settings(
        cluster : String,
        settings : Array(Types::ClusterSetting)
      ) : Types::UpdateClusterSettingsResponse

        input = Types::UpdateClusterSettingsRequest.new(cluster: cluster, settings: settings)
        update_cluster_settings(input)
      end

      def update_cluster_settings(input : Types::UpdateClusterSettingsRequest) : Types::UpdateClusterSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLUSTER_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClusterSettingsResponse, "UpdateClusterSettings")
      end

      # Updates the Amazon ECS container agent on a specified container instance. Updating the Amazon ECS
      # container agent doesn't interrupt running tasks or services on the container instance. The process
      # for updating the agent differs depending on whether your container instance was launched with the
      # Amazon ECS-optimized AMI or another operating system. The UpdateContainerAgent API isn't supported
      # for container instances using the Amazon ECS-optimized Amazon Linux 2 (arm64) AMI. To update the
      # container agent, you can update the ecs-init package. This updates the agent. For more information,
      # see Updating the Amazon ECS container agent in the Amazon Elastic Container Service Developer Guide
      # . Agent updates with the UpdateContainerAgent API operation do not apply to Windows container
      # instances. We recommend that you launch new container instances to update the agent version in your
      # Windows clusters. The UpdateContainerAgent API requires an Amazon ECS-optimized AMI or Amazon Linux
      # AMI with the ecs-init service installed and running. For help updating the Amazon ECS container
      # agent on other operating systems, see Manually updating the Amazon ECS container agent in the Amazon
      # Elastic Container Service Developer Guide .

      def update_container_agent(
        container_instance : String,
        cluster : String? = nil
      ) : Types::UpdateContainerAgentResponse

        input = Types::UpdateContainerAgentRequest.new(container_instance: container_instance, cluster: cluster)
        update_container_agent(input)
      end

      def update_container_agent(input : Types::UpdateContainerAgentRequest) : Types::UpdateContainerAgentResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONTAINER_AGENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateContainerAgentResponse, "UpdateContainerAgent")
      end

      # Modifies the status of an Amazon ECS container instance. Once a container instance has reached an
      # ACTIVE state, you can change the status of a container instance to DRAINING to manually remove an
      # instance from a cluster, for example to perform system updates, update the Docker daemon, or scale
      # down the cluster size. A container instance can't be changed to DRAINING until it has reached an
      # ACTIVE status. If the instance is in any other status, an error will be received. When you set a
      # container instance to DRAINING , Amazon ECS prevents new tasks from being scheduled for placement on
      # the container instance and replacement service tasks are started on other container instances in the
      # cluster if the resources are available. Service tasks on the container instance that are in the
      # PENDING state are stopped immediately. Service tasks on the container instance that are in the
      # RUNNING state are stopped and replaced according to the service's deployment configuration
      # parameters, minimumHealthyPercent and maximumPercent . You can change the deployment configuration
      # of your service using UpdateService . If minimumHealthyPercent is below 100%, the scheduler can
      # ignore desiredCount temporarily during task replacement. For example, desiredCount is four tasks, a
      # minimum of 50% allows the scheduler to stop two existing tasks before starting two new tasks. If the
      # minimum is 100%, the service scheduler can't remove existing tasks until the replacement tasks are
      # considered healthy. Tasks for services that do not use a load balancer are considered healthy if
      # they're in the RUNNING state. Tasks for services that use a load balancer are considered healthy if
      # they're in the RUNNING state and are reported as healthy by the load balancer. The maximumPercent
      # parameter represents an upper limit on the number of running tasks during task replacement. You can
      # use this to define the replacement batch size. For example, if desiredCount is four tasks, a maximum
      # of 200% starts four new tasks before stopping the four tasks to be drained, provided that the
      # cluster resources required to do this are available. If the maximum is 100%, then replacement tasks
      # can't start until the draining tasks have stopped. Any PENDING or RUNNING tasks that do not belong
      # to a service aren't affected. You must wait for them to finish or stop them manually. A container
      # instance has completed draining when it has no more RUNNING tasks. You can verify this using
      # ListTasks . When a container instance has been drained, you can set a container instance to ACTIVE
      # status and once it has reached that status the Amazon ECS scheduler can begin scheduling tasks on
      # the instance again.

      def update_container_instances_state(
        container_instances : Array(String),
        status : String,
        cluster : String? = nil
      ) : Types::UpdateContainerInstancesStateResponse

        input = Types::UpdateContainerInstancesStateRequest.new(container_instances: container_instances, status: status, cluster: cluster)
        update_container_instances_state(input)
      end

      def update_container_instances_state(input : Types::UpdateContainerInstancesStateRequest) : Types::UpdateContainerInstancesStateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONTAINER_INSTANCES_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateContainerInstancesStateResponse, "UpdateContainerInstancesState")
      end

      # Updates an existing Express service configuration. Modifies container settings, resource allocation,
      # auto-scaling configuration, and other service parameters without recreating the service. Amazon ECS
      # creates a new service revision with updated configuration and performs a rolling deployment to
      # replace existing tasks. The service remains available during updates, ensuring zero-downtime
      # deployments. Some parameters like the infrastructure role cannot be modified after service creation
      # and require creating a new service.

      def update_express_gateway_service(
        service_arn : String,
        cpu : String? = nil,
        execution_role_arn : String? = nil,
        health_check_path : String? = nil,
        memory : String? = nil,
        network_configuration : Types::ExpressGatewayServiceNetworkConfiguration? = nil,
        primary_container : Types::ExpressGatewayContainer? = nil,
        scaling_target : Types::ExpressGatewayScalingTarget? = nil,
        task_role_arn : String? = nil
      ) : Types::UpdateExpressGatewayServiceResponse

        input = Types::UpdateExpressGatewayServiceRequest.new(service_arn: service_arn, cpu: cpu, execution_role_arn: execution_role_arn, health_check_path: health_check_path, memory: memory, network_configuration: network_configuration, primary_container: primary_container, scaling_target: scaling_target, task_role_arn: task_role_arn)
        update_express_gateway_service(input)
      end

      def update_express_gateway_service(input : Types::UpdateExpressGatewayServiceRequest) : Types::UpdateExpressGatewayServiceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EXPRESS_GATEWAY_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateExpressGatewayServiceResponse, "UpdateExpressGatewayService")
      end

      # Modifies the parameters of a service. On March 21, 2024, a change was made to resolve the task
      # definition revision before authorization. When a task definition revision is not specified,
      # authorization will occur using the latest revision of a task definition. For services using the
      # rolling update ( ECS ) you can update the desired count, deployment configuration, network
      # configuration, load balancers, service registries, enable ECS managed tags option, propagate tags
      # option, task placement constraints and strategies, and task definition. When you update any of these
      # parameters, Amazon ECS starts new tasks with the new configuration. You can attach Amazon EBS
      # volumes to Amazon ECS tasks by configuring the volume when starting or running a task, or when
      # creating or updating a service. For more information, see Amazon EBS volumes in the Amazon Elastic
      # Container Service Developer Guide . You can update your volume configurations and trigger a new
      # deployment. volumeConfigurations is only supported for REPLICA service and not DAEMON service. If
      # you leave volumeConfigurations null , it doesn't trigger a new deployment. For more information on
      # volumes, see Amazon EBS volumes in the Amazon Elastic Container Service Developer Guide . For
      # services using the blue/green ( CODE_DEPLOY ) deployment controller, only the desired count,
      # deployment configuration, health check grace period, task placement constraints and strategies,
      # enable ECS managed tags option, and propagate tags can be updated using this API. If the network
      # configuration, platform version, task definition, or load balancer need to be updated, create a new
      # CodeDeploy deployment. For more information, see CreateDeployment in the CodeDeploy API Reference .
      # For services using an external deployment controller, you can update only the desired count, task
      # placement constraints and strategies, health check grace period, enable ECS managed tags option, and
      # propagate tags option, using this API. If the launch type, load balancer, network configuration,
      # platform version, or task definition need to be updated, create a new task set For more information,
      # see CreateTaskSet . You can add to or subtract from the number of instantiations of a task
      # definition in a service by specifying the cluster that the service is running in and a new
      # desiredCount parameter. You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the
      # volume when starting or running a task, or when creating or updating a service. For more
      # information, see Amazon EBS volumes in the Amazon Elastic Container Service Developer Guide . If you
      # have updated the container image of your application, you can create a new task definition with that
      # image and deploy it to your service. The service scheduler uses the minimum healthy percent and
      # maximum percent parameters (in the service's deployment configuration) to determine the deployment
      # strategy. If your updated Docker image uses the same tag as what is in the existing task definition
      # for your service (for example, my_image:latest ), you don't need to create a new revision of your
      # task definition. You can update the service using the forceNewDeployment option. The new tasks
      # launched by the deployment pull the current image/tag combination from your repository when they
      # start. You can also update the deployment configuration of a service. When a deployment is triggered
      # by updating the task definition of a service, the service scheduler uses the deployment
      # configuration parameters, minimumHealthyPercent and maximumPercent , to determine the deployment
      # strategy. If minimumHealthyPercent is below 100%, the scheduler can ignore desiredCount temporarily
      # during a deployment. For example, if desiredCount is four tasks, a minimum of 50% allows the
      # scheduler to stop two existing tasks before starting two new tasks. Tasks for services that don't
      # use a load balancer are considered healthy if they're in the RUNNING state. Tasks for services that
      # use a load balancer are considered healthy if they're in the RUNNING state and are reported as
      # healthy by the load balancer. The maximumPercent parameter represents an upper limit on the number
      # of running tasks during a deployment. You can use it to define the deployment batch size. For
      # example, if desiredCount is four tasks, a maximum of 200% starts four new tasks before stopping the
      # four older tasks (provided that the cluster resources required to do this are available). When
      # UpdateService stops a task during a deployment, the equivalent of docker stop is issued to the
      # containers running in the task. This results in a SIGTERM and a 30-second timeout. After this,
      # SIGKILL is sent and the containers are forcibly stopped. If the container handles the SIGTERM
      # gracefully and exits within 30 seconds from receiving it, no SIGKILL is sent. When the service
      # scheduler launches new tasks, it determines task placement in your cluster with the following logic.
      # Determine which of the container instances in your cluster can support your service's task
      # definition. For example, they have the required CPU, memory, ports, and container instance
      # attributes. By default, the service scheduler attempts to balance tasks across Availability Zones in
      # this manner even though you can choose a different placement strategy. Sort the valid container
      # instances by the fewest number of running tasks for this service in the same Availability Zone as
      # the instance. For example, if zone A has one running service task and zones B and C each have zero,
      # valid container instances in either zone B or C are considered optimal for placement. Place the new
      # service task on a valid container instance in an optimal Availability Zone (based on the previous
      # steps), favoring container instances with the fewest number of running tasks for this service. When
      # the service scheduler stops running tasks, it attempts to maintain balance across the Availability
      # Zones in your cluster using the following logic: Sort the container instances by the largest number
      # of running tasks for this service in the same Availability Zone as the instance. For example, if
      # zone A has one running service task and zones B and C each have two, container instances in either
      # zone B or C are considered optimal for termination. Stop the task on a container instance in an
      # optimal Availability Zone (based on the previous steps), favoring container instances with the
      # largest number of running tasks for this service.

      def update_service(
        service : String,
        availability_zone_rebalancing : String? = nil,
        capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
        cluster : String? = nil,
        deployment_configuration : Types::DeploymentConfiguration? = nil,
        deployment_controller : Types::DeploymentController? = nil,
        desired_count : Int32? = nil,
        enable_ecs_managed_tags : Bool? = nil,
        enable_execute_command : Bool? = nil,
        force_new_deployment : Bool? = nil,
        health_check_grace_period_seconds : Int32? = nil,
        load_balancers : Array(Types::LoadBalancer)? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        placement_constraints : Array(Types::PlacementConstraint)? = nil,
        placement_strategy : Array(Types::PlacementStrategy)? = nil,
        platform_version : String? = nil,
        propagate_tags : String? = nil,
        service_connect_configuration : Types::ServiceConnectConfiguration? = nil,
        service_registries : Array(Types::ServiceRegistry)? = nil,
        task_definition : String? = nil,
        volume_configurations : Array(Types::ServiceVolumeConfiguration)? = nil,
        vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)? = nil
      ) : Types::UpdateServiceResponse

        input = Types::UpdateServiceRequest.new(service: service, availability_zone_rebalancing: availability_zone_rebalancing, capacity_provider_strategy: capacity_provider_strategy, cluster: cluster, deployment_configuration: deployment_configuration, deployment_controller: deployment_controller, desired_count: desired_count, enable_ecs_managed_tags: enable_ecs_managed_tags, enable_execute_command: enable_execute_command, force_new_deployment: force_new_deployment, health_check_grace_period_seconds: health_check_grace_period_seconds, load_balancers: load_balancers, network_configuration: network_configuration, placement_constraints: placement_constraints, placement_strategy: placement_strategy, platform_version: platform_version, propagate_tags: propagate_tags, service_connect_configuration: service_connect_configuration, service_registries: service_registries, task_definition: task_definition, volume_configurations: volume_configurations, vpc_lattice_configurations: vpc_lattice_configurations)
        update_service(input)
      end

      def update_service(input : Types::UpdateServiceRequest) : Types::UpdateServiceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceResponse, "UpdateService")
      end

      # Modifies which task set in a service is the primary task set. Any parameters that are updated on the
      # primary task set in a service will transition to the service. This is used when a service uses the
      # EXTERNAL deployment controller type. For more information, see Amazon ECS Deployment Types in the
      # Amazon Elastic Container Service Developer Guide .

      def update_service_primary_task_set(
        cluster : String,
        primary_task_set : String,
        service : String
      ) : Types::UpdateServicePrimaryTaskSetResponse

        input = Types::UpdateServicePrimaryTaskSetRequest.new(cluster: cluster, primary_task_set: primary_task_set, service: service)
        update_service_primary_task_set(input)
      end

      def update_service_primary_task_set(input : Types::UpdateServicePrimaryTaskSetRequest) : Types::UpdateServicePrimaryTaskSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_PRIMARY_TASK_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServicePrimaryTaskSetResponse, "UpdateServicePrimaryTaskSet")
      end

      # Updates the protection status of a task. You can set protectionEnabled to true to protect your task
      # from termination during scale-in events from Service Autoscaling or deployments . Task-protection,
      # by default, expires after 2 hours at which point Amazon ECS clears the protectionEnabled property
      # making the task eligible for termination by a subsequent scale-in event. You can specify a custom
      # expiration period for task protection from 1 minute to up to 2,880 minutes (48 hours). To specify
      # the custom expiration period, set the expiresInMinutes property. The expiresInMinutes property is
      # always reset when you invoke this operation for a task that already has protectionEnabled set to
      # true . You can keep extending the protection expiration period of a task by invoking this operation
      # repeatedly. To learn more about Amazon ECS task protection, see Task scale-in protection in the
      # Amazon Elastic Container Service Developer Guide . This operation is only supported for tasks
      # belonging to an Amazon ECS service. Invoking this operation for a standalone task will result in an
      # TASK_NOT_VALID failure. For more information, see API failure reasons . If you prefer to set task
      # protection from within the container, we recommend using the Task scale-in protection endpoint .

      def update_task_protection(
        cluster : String,
        protection_enabled : Bool,
        tasks : Array(String),
        expires_in_minutes : Int32? = nil
      ) : Types::UpdateTaskProtectionResponse

        input = Types::UpdateTaskProtectionRequest.new(cluster: cluster, protection_enabled: protection_enabled, tasks: tasks, expires_in_minutes: expires_in_minutes)
        update_task_protection(input)
      end

      def update_task_protection(input : Types::UpdateTaskProtectionRequest) : Types::UpdateTaskProtectionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TASK_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTaskProtectionResponse, "UpdateTaskProtection")
      end

      # Modifies a task set. This is used when a service uses the EXTERNAL deployment controller type. For
      # more information, see Amazon ECS Deployment Types in the Amazon Elastic Container Service Developer
      # Guide .

      def update_task_set(
        cluster : String,
        scale : Types::Scale,
        service : String,
        task_set : String
      ) : Types::UpdateTaskSetResponse

        input = Types::UpdateTaskSetRequest.new(cluster: cluster, scale: scale, service: service, task_set: task_set)
        update_task_set(input)
      end

      def update_task_set(input : Types::UpdateTaskSetRequest) : Types::UpdateTaskSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TASK_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTaskSetResponse, "UpdateTaskSet")
      end
    end
  end
end
