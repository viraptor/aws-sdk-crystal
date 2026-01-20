module Aws
  module GameLift
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

      # This API works with the following fleet types: EC2, Anywhere, Container Registers a player's
      # acceptance or rejection of a proposed FlexMatch match. A matchmaking configuration may require
      # player acceptance; if so, then matches built with that configuration cannot be completed unless all
      # players accept the proposed match within a specified time limit. When FlexMatch builds a match, all
      # the matchmaking tickets involved in the proposed match are placed into status REQUIRES_ACCEPTANCE .
      # This is a trigger for your game to get acceptance from all players in each ticket. Calls to this
      # action are only valid for tickets that are in this status; calls for tickets not in this status
      # result in an error. To register acceptance, specify the ticket ID, one or more players, and an
      # acceptance response. When all players have accepted, Amazon GameLift Servers advances the
      # matchmaking tickets to status PLACING , and attempts to create a new game session for the match. If
      # any player rejects the match, or if acceptances are not received before a specified timeout, the
      # proposed match is dropped. Each matchmaking ticket in the failed match is handled as follows: If the
      # ticket has one or more players who rejected the match or failed to respond, the ticket status is set
      # CANCELLED and processing is terminated. If all players in the ticket accepted the match, the ticket
      # status is returned to SEARCHING to find a new match. Learn more Add FlexMatch to a game client
      # FlexMatch events (reference)

      def accept_match(
        acceptance_type : String,
        player_ids : Array(String),
        ticket_id : String
      ) : Types::AcceptMatchOutput

        input = Types::AcceptMatchInput.new(acceptance_type: acceptance_type, player_ids: player_ids, ticket_id: ticket_id)
        accept_match(input)
      end

      def accept_match(input : Types::AcceptMatchInput) : Types::AcceptMatchOutput
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_MATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptMatchOutput, "AcceptMatch")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Locates an available game server and
      # temporarily reserves it to host gameplay and players. This operation is called from a game client or
      # client service (such as a matchmaker) to request hosting resources for a new game session. In
      # response, Amazon GameLift Servers FleetIQ locates an available game server, places it in CLAIMED
      # status for 60 seconds, and returns connection information that players can use to connect to the
      # game server. To claim a game server, identify a game server group. You can also specify a game
      # server ID, although this approach bypasses Amazon GameLift Servers FleetIQ placement optimization.
      # Optionally, include game data to pass to the game server at the start of a game session, such as a
      # game map or player information. Add filter options to further restrict how a game server is chosen,
      # such as only allowing game servers on ACTIVE instances to be claimed. When a game server is
      # successfully claimed, connection information is returned. A claimed game server's utilization status
      # remains AVAILABLE while the claim status is set to CLAIMED for up to 60 seconds. This time period
      # gives the game server time to update its status to UTILIZED after players join. If the game server's
      # status is not updated within 60 seconds, the game server reverts to unclaimed status and is
      # available to be claimed by another request. The claim time period is a fixed value and is not
      # configurable. If you try to claim a specific game server, this request will fail in the following
      # cases: If the game server utilization status is UTILIZED . If the game server claim status is
      # CLAIMED . If the game server is running on an instance in DRAINING status and the provided filter
      # option does not allow placing on DRAINING instances. Learn more Amazon GameLift Servers FleetIQ
      # Guide

      def claim_game_server(
        game_server_group_name : String,
        filter_option : Types::ClaimFilterOption? = nil,
        game_server_data : String? = nil,
        game_server_id : String? = nil
      ) : Types::ClaimGameServerOutput

        input = Types::ClaimGameServerInput.new(game_server_group_name: game_server_group_name, filter_option: filter_option, game_server_data: game_server_data, game_server_id: game_server_id)
        claim_game_server(input)
      end

      def claim_game_server(input : Types::ClaimGameServerInput) : Types::ClaimGameServerOutput
        request = Protocol::JsonRpc.build_request(Model::CLAIM_GAME_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ClaimGameServerOutput, "ClaimGameServer")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Creates an alias for a
      # fleet. In most situations, you can use an alias ID in place of a fleet ID. An alias provides a level
      # of abstraction for a fleet that is useful when redirecting player traffic from one fleet to another,
      # such as when updating your game build. Amazon GameLift Servers supports two types of routing
      # strategies for aliases: simple and terminal. A simple alias points to an active fleet. A terminal
      # alias is used to display messaging or link to a URL instead of routing players to an active fleet.
      # For example, you might use a terminal alias when a game version is no longer supported and you want
      # to direct players to an upgrade site. To create a fleet alias, specify an alias name, routing
      # strategy, and optional description. Each simple alias can point to only one fleet, but a fleet can
      # have multiple aliases. If successful, a new alias record is returned, including an alias ID and an
      # ARN. You can reassign an alias to another fleet by calling UpdateAlias . Related actions All APIs by
      # task

      def create_alias(
        name : String,
        routing_strategy : Types::RoutingStrategy,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAliasOutput

        input = Types::CreateAliasInput.new(name: name, routing_strategy: routing_strategy, description: description, tags: tags)
        create_alias(input)
      end

      def create_alias(input : Types::CreateAliasInput) : Types::CreateAliasOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAliasOutput, "CreateAlias")
      end

      # This API works with the following fleet types: EC2, Anywhere Creates a new Amazon GameLift Servers
      # build resource for your game server binary files. Combine game server binaries into a zip file for
      # use with Amazon GameLift Servers. When setting up a new game build for Amazon GameLift Servers, we
      # recommend using the CLI command upload-build . This helper command combines two tasks: (1) it
      # uploads your build files from a file directory to an Amazon GameLift Servers Amazon S3 location, and
      # (2) it creates a new build resource. You can use the CreateBuild operation in the following
      # scenarios: Create a new game build with build files that are in an Amazon S3 location under an
      # Amazon Web Services account that you control. To use this option, you give Amazon GameLift Servers
      # access to the Amazon S3 bucket. With permissions in place, specify a build name, operating system,
      # and the Amazon S3 storage location of your game build. Upload your build files to a Amazon GameLift
      # Servers Amazon S3 location. To use this option, specify a build name and operating system. This
      # operation creates a new build resource and also returns an Amazon S3 location with temporary access
      # credentials. Use the credentials to manually upload your build files to the specified Amazon S3
      # location. For more information, see Uploading Objects in the Amazon S3 Developer Guide . After you
      # upload build files to the Amazon GameLift Servers Amazon S3 location, you can't update them. If
      # successful, this operation creates a new build resource with a unique build ID and places it in
      # INITIALIZED status. A build must be in READY status before you can create fleets with it. Learn more
      # Uploading Your Game Create a Build with Files in Amazon S3 All APIs by task

      def create_build(
        name : String? = nil,
        operating_system : String? = nil,
        server_sdk_version : String? = nil,
        storage_location : Types::S3Location? = nil,
        tags : Array(Types::Tag)? = nil,
        version : String? = nil
      ) : Types::CreateBuildOutput

        input = Types::CreateBuildInput.new(name: name, operating_system: operating_system, server_sdk_version: server_sdk_version, storage_location: storage_location, tags: tags, version: version)
        create_build(input)
      end

      def create_build(input : Types::CreateBuildInput) : Types::CreateBuildOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_BUILD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBuildOutput, "CreateBuild")
      end

      # This API works with the following fleet types: Container Creates a managed fleet of Amazon Elastic
      # Compute Cloud (Amazon EC2) instances to host your containerized game servers. Use this operation to
      # define how to deploy a container architecture onto each fleet instance and configure fleet settings.
      # You can create a container fleet in any Amazon Web Services Regions that Amazon GameLift Servers
      # supports for multi-location fleets. A container fleet can be deployed to a single location or
      # multiple locations. Container fleets are deployed with Amazon Linux 2023 as the instance operating
      # system. Define the fleet's container architecture using container group definitions. Each fleet can
      # have one of the following container group types: The game server container group runs your game
      # server build and dependent software. Amazon GameLift Servers deploys one or more replicas of this
      # container group to each fleet instance. The number of replicas depends on the computing capabilities
      # of the fleet instance in use. An optional per-instance container group might be used to run other
      # software that only needs to run once per instance, such as background services, logging, or test
      # processes. One per-instance container group is deployed to each fleet instance. Each container group
      # can include the definition for one or more containers. A container definition specifies a container
      # image that is stored in an Amazon Elastic Container Registry (Amazon ECR) public or private
      # repository. Request options Use this operation to make the following types of requests. Most fleet
      # settings have default values, so you can create a working fleet with a minimal configuration and
      # default values, which you can customize later. Create a fleet with no container groups. You can
      # configure a container fleet and then add container group definitions later. In this scenario, no
      # fleet instances are deployed, and the fleet can't host game sessions until you add a game server
      # container group definition. Provide the following required parameter values: FleetRoleArn Create a
      # fleet with a game server container group. Provide the following required parameter values:
      # FleetRoleArn GameServerContainerGroupDefinitionName Create a fleet with a game server container
      # group and a per-instance container group. Provide the following required parameter values:
      # FleetRoleArn GameServerContainerGroupDefinitionName PerInstanceContainerGroupDefinitionName Results
      # If successful, this operation creates a new container fleet resource, places it in PENDING status,
      # and initiates the fleet creation workflow . For fleets with container groups, this workflow starts a
      # fleet deployment and transitions the status to ACTIVE . Fleets without a container group are placed
      # in CREATED status. You can update most of the properties of a fleet, including container group
      # definitions, and deploy the update across all fleet instances. Use UpdateContainerFleet to deploy a
      # new game server version update across the container fleet. A managed fleet's runtime environment
      # depends on the Amazon Machine Image (AMI) version it uses. When a new fleet is created, Amazon
      # GameLift Servers assigns the latest available AMI version to the fleet, and all compute instances in
      # that fleet are deployed with that version. To update the AMI version, you must create a new fleet.
      # As a best practice, we recommend replacing your managed fleets every 30 days to maintain a secure
      # and up-to-date runtime environment for your hosted game servers. For guidance, see Security best
      # practices for Amazon GameLift Servers .

      def create_container_fleet(
        fleet_role_arn : String,
        billing_type : String? = nil,
        description : String? = nil,
        game_server_container_group_definition_name : String? = nil,
        game_server_container_groups_per_instance : Int32? = nil,
        game_session_creation_limit_policy : Types::GameSessionCreationLimitPolicy? = nil,
        instance_connection_port_range : Types::ConnectionPortRange? = nil,
        instance_inbound_permissions : Array(Types::IpPermission)? = nil,
        instance_type : String? = nil,
        locations : Array(Types::LocationConfiguration)? = nil,
        log_configuration : Types::LogConfiguration? = nil,
        metric_groups : Array(String)? = nil,
        new_game_session_protection_policy : String? = nil,
        per_instance_container_group_definition_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateContainerFleetOutput

        input = Types::CreateContainerFleetInput.new(fleet_role_arn: fleet_role_arn, billing_type: billing_type, description: description, game_server_container_group_definition_name: game_server_container_group_definition_name, game_server_container_groups_per_instance: game_server_container_groups_per_instance, game_session_creation_limit_policy: game_session_creation_limit_policy, instance_connection_port_range: instance_connection_port_range, instance_inbound_permissions: instance_inbound_permissions, instance_type: instance_type, locations: locations, log_configuration: log_configuration, metric_groups: metric_groups, new_game_session_protection_policy: new_game_session_protection_policy, per_instance_container_group_definition_name: per_instance_container_group_definition_name, tags: tags)
        create_container_fleet(input)
      end

      def create_container_fleet(input : Types::CreateContainerFleetInput) : Types::CreateContainerFleetOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTAINER_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContainerFleetOutput, "CreateContainerFleet")
      end

      # This API works with the following fleet types: Container Creates a ContainerGroupDefinition that
      # describes a set of containers for hosting your game server with Amazon GameLift Servers managed
      # containers hosting. An Amazon GameLift Servers container group is similar to a container task or
      # pod. Use container group definitions when you create a container fleet with CreateContainerFleet . A
      # container group definition determines how Amazon GameLift Servers deploys your containers to each
      # instance in a container fleet. You can maintain multiple versions of a container group definition.
      # There are two types of container groups: A game server container group has the containers that run
      # your game server application and supporting software. A game server container group can have these
      # container types: Game server container. This container runs your game server. You can define one
      # game server container in a game server container group. Support container. This container runs
      # software in parallel with your game server. You can define up to 8 support containers in a game
      # server group. When building a game server container group definition, you can choose to bundle your
      # game server executable and all dependent software into a single game server container.
      # Alternatively, you can separate the software into one game server container and one or more support
      # containers. On a container fleet instance, a game server container group can be deployed multiple
      # times (depending on the compute resources of the instance). This means that all containers in the
      # container group are replicated together. A per-instance container group has containers for processes
      # that aren't replicated on a container fleet instance. This might include background services,
      # logging, test processes, or processes that need to persist independently of the game server
      # container group. When building a per-instance container group, you can define up to 10 support
      # containers. This operation requires Identity and Access Management (IAM) permissions to access
      # container images in Amazon ECR repositories. See IAM permissions for Amazon GameLift Servers for
      # help setting the appropriate permissions. Request options Use this operation to make the following
      # types of requests. You can specify values for the minimum required parameters and customize optional
      # values later. Create a game server container group definition. Provide the following required
      # parameter values: Name ContainerGroupType ( GAME_SERVER ) OperatingSystem (omit to use default
      # value) TotalMemoryLimitMebibytes (omit to use default value) TotalVcpuLimit (omit to use default
      # value) At least one GameServerContainerDefinition ContainerName ImageUrl PortConfiguration
      # ServerSdkVersion (omit to use default value) Create a per-instance container group definition.
      # Provide the following required parameter values: Name ContainerGroupType ( PER_INSTANCE )
      # OperatingSystem (omit to use default value) TotalMemoryLimitMebibytes (omit to use default value)
      # TotalVcpuLimit (omit to use default value) At least one SupportContainerDefinition ContainerName
      # ImageUrl Results If successful, this request creates a ContainerGroupDefinition resource and assigns
      # a unique ARN value. You can update most properties of a container group definition by calling
      # UpdateContainerGroupDefinition , and optionally save the update as a new version.

      def create_container_group_definition(
        name : String,
        operating_system : String,
        total_memory_limit_mebibytes : Int32,
        total_vcpu_limit : Float64,
        container_group_type : String? = nil,
        game_server_container_definition : Types::GameServerContainerDefinitionInput? = nil,
        support_container_definitions : Array(Types::SupportContainerDefinitionInput)? = nil,
        tags : Array(Types::Tag)? = nil,
        version_description : String? = nil
      ) : Types::CreateContainerGroupDefinitionOutput

        input = Types::CreateContainerGroupDefinitionInput.new(name: name, operating_system: operating_system, total_memory_limit_mebibytes: total_memory_limit_mebibytes, total_vcpu_limit: total_vcpu_limit, container_group_type: container_group_type, game_server_container_definition: game_server_container_definition, support_container_definitions: support_container_definitions, tags: tags, version_description: version_description)
        create_container_group_definition(input)
      end

      def create_container_group_definition(input : Types::CreateContainerGroupDefinitionInput) : Types::CreateContainerGroupDefinitionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTAINER_GROUP_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContainerGroupDefinitionOutput, "CreateContainerGroupDefinition")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Creates a fleet of compute
      # resources to host your game servers. Use this operation to set up a fleet for the following compute
      # types: Managed EC2 fleet An EC2 fleet is a set of Amazon Elastic Compute Cloud (Amazon EC2)
      # instances. Your game server build is deployed to each fleet instance. Amazon GameLift Servers
      # manages the fleet's instances and controls the lifecycle of game server processes, which host game
      # sessions for players. EC2 fleets can have instances in multiple locations. Each instance in the
      # fleet is designated a Compute . To create an EC2 fleet, provide these required parameters: Either
      # BuildId or ScriptId ComputeType set to EC2 (the default value) EC2InboundPermissions EC2InstanceType
      # FleetType Name RuntimeConfiguration with at least one ServerProcesses configuration If successful,
      # this operation creates a new fleet resource and places it in NEW status while Amazon GameLift
      # Servers initiates the fleet creation workflow . To debug your fleet, fetch logs, view performance
      # metrics or other actions on the fleet, create a development fleet with port 22/3389 open. As a best
      # practice, we recommend opening ports for remote access only when you need them and closing them when
      # you're finished. When the fleet status is ACTIVE, you can adjust capacity settings and turn
      # autoscaling on/off for each location. A managed fleet's runtime environment depends on the Amazon
      # Machine Image (AMI) version it uses. When a new fleet is created, Amazon GameLift Servers assigns
      # the latest available AMI version to the fleet, and all compute instances in that fleet are deployed
      # with that version. To update the AMI version, you must create a new fleet. As a best practice, we
      # recommend replacing your managed fleets every 30 days to maintain a secure and up-to-date runtime
      # environment for your hosted game servers. For guidance, see Security best practices for Amazon
      # GameLift Servers . Anywhere fleet An Anywhere fleet represents compute resources that are not owned
      # or managed by Amazon GameLift Servers. You might create an Anywhere fleet with your local machine
      # for testing, or use one to host game servers with on-premises hardware or other game hosting
      # solutions. To create an Anywhere fleet, provide these required parameters: ComputeType set to
      # ANYWHERE Locations specifying a custom location Name If successful, this operation creates a new
      # fleet resource and places it in ACTIVE status. You can register computes with a fleet in ACTIVE
      # status. Learn more Setting up fleets Debug fleet creation issues Multi-location fleets

      def create_fleet(
        name : String,
        anywhere_configuration : Types::AnywhereConfiguration? = nil,
        build_id : String? = nil,
        certificate_configuration : Types::CertificateConfiguration? = nil,
        compute_type : String? = nil,
        description : String? = nil,
        ec2_inbound_permissions : Array(Types::IpPermission)? = nil,
        ec2_instance_type : String? = nil,
        fleet_type : String? = nil,
        instance_role_arn : String? = nil,
        instance_role_credentials_provider : String? = nil,
        locations : Array(Types::LocationConfiguration)? = nil,
        log_paths : Array(String)? = nil,
        metric_groups : Array(String)? = nil,
        new_game_session_protection_policy : String? = nil,
        peer_vpc_aws_account_id : String? = nil,
        peer_vpc_id : String? = nil,
        resource_creation_limit_policy : Types::ResourceCreationLimitPolicy? = nil,
        runtime_configuration : Types::RuntimeConfiguration? = nil,
        script_id : String? = nil,
        server_launch_parameters : String? = nil,
        server_launch_path : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFleetOutput

        input = Types::CreateFleetInput.new(name: name, anywhere_configuration: anywhere_configuration, build_id: build_id, certificate_configuration: certificate_configuration, compute_type: compute_type, description: description, ec2_inbound_permissions: ec2_inbound_permissions, ec2_instance_type: ec2_instance_type, fleet_type: fleet_type, instance_role_arn: instance_role_arn, instance_role_credentials_provider: instance_role_credentials_provider, locations: locations, log_paths: log_paths, metric_groups: metric_groups, new_game_session_protection_policy: new_game_session_protection_policy, peer_vpc_aws_account_id: peer_vpc_aws_account_id, peer_vpc_id: peer_vpc_id, resource_creation_limit_policy: resource_creation_limit_policy, runtime_configuration: runtime_configuration, script_id: script_id, server_launch_parameters: server_launch_parameters, server_launch_path: server_launch_path, tags: tags)
        create_fleet(input)
      end

      def create_fleet(input : Types::CreateFleetInput) : Types::CreateFleetOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFleetOutput, "CreateFleet")
      end

      # This API works with the following fleet types: EC2, Container Adds remote locations to an EC2 and
      # begins populating the new locations with instances. The new instances conform to the fleet's
      # instance type, auto-scaling, and other configuration settings. You can't add remote locations to a
      # fleet that resides in an Amazon Web Services Region that doesn't support multiple locations. Fleets
      # created prior to March 2021 can't support multiple locations. To add fleet locations, specify the
      # fleet to be updated and provide a list of one or more locations. If successful, this operation
      # returns the list of added locations with their status set to NEW . Amazon GameLift Servers initiates
      # the process of starting an instance in each added location. You can track the status of each new
      # location by monitoring location creation events using DescribeFleetEvents . Learn more Setting up
      # fleets Update fleet locations Amazon GameLift Servers service locations for managed hosting.

      def create_fleet_locations(
        fleet_id : String,
        locations : Array(Types::LocationConfiguration)
      ) : Types::CreateFleetLocationsOutput

        input = Types::CreateFleetLocationsInput.new(fleet_id: fleet_id, locations: locations)
        create_fleet_locations(input)
      end

      def create_fleet_locations(input : Types::CreateFleetLocationsInput) : Types::CreateFleetLocationsOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_FLEET_LOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFleetLocationsOutput, "CreateFleetLocations")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Creates a Amazon GameLift Servers
      # FleetIQ game server group for managing game hosting on a collection of Amazon Elastic Compute Cloud
      # instances for game hosting. This operation creates the game server group, creates an Auto Scaling
      # group in your Amazon Web Services account, and establishes a link between the two groups. You can
      # view the status of your game server groups in the Amazon GameLift Servers console. Game server group
      # metrics and events are emitted to Amazon CloudWatch. Before creating a new game server group, you
      # must have the following: An Amazon Elastic Compute Cloud launch template that specifies how to
      # launch Amazon Elastic Compute Cloud instances with your game server build. For more information, see
      # Launching an Instance from a Launch Template in the Amazon Elastic Compute Cloud User Guide . An IAM
      # role that extends limited access to your Amazon Web Services account to allow Amazon GameLift
      # Servers FleetIQ to create and interact with the Auto Scaling group. For more information, see Create
      # IAM roles for cross-service interaction in the Amazon GameLift Servers FleetIQ Developer Guide . To
      # create a new game server group, specify a unique group name, IAM role and Amazon Elastic Compute
      # Cloud launch template, and provide a list of instance types that can be used in the group. You must
      # also set initial maximum and minimum limits on the group's instance count. You can optionally set an
      # Auto Scaling policy with target tracking based on a Amazon GameLift Servers FleetIQ metric. Once the
      # game server group and corresponding Auto Scaling group are created, you have full access to change
      # the Auto Scaling group's configuration as needed. Several properties that are set when creating a
      # game server group, including maximum/minimum size and auto-scaling policy settings, must be updated
      # directly in the Auto Scaling group. Keep in mind that some Auto Scaling group properties are
      # periodically updated by Amazon GameLift Servers FleetIQ as part of its balancing activities to
      # optimize for availability and cost. Learn more Amazon GameLift Servers FleetIQ Guide

      def create_game_server_group(
        game_server_group_name : String,
        instance_definitions : Array(Types::InstanceDefinition),
        launch_template : Types::LaunchTemplateSpecification,
        max_size : Int32,
        min_size : Int32,
        role_arn : String,
        auto_scaling_policy : Types::GameServerGroupAutoScalingPolicy? = nil,
        balancing_strategy : String? = nil,
        game_server_protection_policy : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_subnets : Array(String)? = nil
      ) : Types::CreateGameServerGroupOutput

        input = Types::CreateGameServerGroupInput.new(game_server_group_name: game_server_group_name, instance_definitions: instance_definitions, launch_template: launch_template, max_size: max_size, min_size: min_size, role_arn: role_arn, auto_scaling_policy: auto_scaling_policy, balancing_strategy: balancing_strategy, game_server_protection_policy: game_server_protection_policy, tags: tags, vpc_subnets: vpc_subnets)
        create_game_server_group(input)
      end

      def create_game_server_group(input : Types::CreateGameServerGroupInput) : Types::CreateGameServerGroupOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_GAME_SERVER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGameServerGroupOutput, "CreateGameServerGroup")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Creates a multiplayer game
      # session for players in a specific fleet location. This operation prompts an available server process
      # to start a game session and retrieves connection information for the new game session. As an
      # alternative, consider using the Amazon GameLift Servers game session placement feature with
      # StartGameSessionPlacement , which uses the FleetIQ algorithm and queues to optimize the placement
      # process. When creating a game session, you specify exactly where you want to place it and provide a
      # set of game session configuration settings. The target fleet must be in ACTIVE status. You can use
      # this operation in the following ways: To create a game session on an instance in a fleet's home
      # Region, provide a fleet or alias ID along with your game session configuration. To create a game
      # session on an instance in a fleet's remote location, provide a fleet or alias ID and a location
      # name, along with your game session configuration. To create a game session on an instance in an
      # Anywhere fleet, specify the fleet's custom location. If successful, Amazon GameLift Servers
      # initiates a workflow to start a new game session and returns a GameSession object containing the
      # game session configuration and status. When the game session status is ACTIVE , it is updated with
      # connection information and you can create player sessions for the game session. By default, newly
      # created game sessions are open to new players. You can restrict new player access by using
      # UpdateGameSession to change the game session's player session creation policy. Amazon GameLift
      # Servers retains logs for active for 14 days. To access the logs, call GetGameSessionLogUrl to
      # download the log files. Available in Amazon GameLift Servers Local. Learn more Start a game session
      # All APIs by task

      def create_game_session(
        maximum_player_session_count : Int32,
        alias_id : String? = nil,
        creator_id : String? = nil,
        fleet_id : String? = nil,
        game_properties : Array(Types::GameProperty)? = nil,
        game_session_data : String? = nil,
        game_session_id : String? = nil,
        idempotency_token : String? = nil,
        location : String? = nil,
        name : String? = nil
      ) : Types::CreateGameSessionOutput

        input = Types::CreateGameSessionInput.new(maximum_player_session_count: maximum_player_session_count, alias_id: alias_id, creator_id: creator_id, fleet_id: fleet_id, game_properties: game_properties, game_session_data: game_session_data, game_session_id: game_session_id, idempotency_token: idempotency_token, location: location, name: name)
        create_game_session(input)
      end

      def create_game_session(input : Types::CreateGameSessionInput) : Types::CreateGameSessionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_GAME_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGameSessionOutput, "CreateGameSession")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Creates a placement queue
      # that processes requests for new game sessions. A queue uses FleetIQ algorithms to locate the best
      # available placement locations for a new game session, and then prompts the game server process to
      # start a new game session. A game session queue is configured with a set of destinations (Amazon
      # GameLift Servers fleets or aliases) that determine where the queue can place new game sessions.
      # These destinations can span multiple Amazon Web Services Regions, can use different instance types,
      # and can include both Spot and On-Demand fleets. If the queue includes multi-location fleets, the
      # queue can place game sessions in any of a fleet's remote locations. You can configure a queue to
      # determine how it selects the best available placement for a new game session. Queues can prioritize
      # placement decisions based on a combination of location, hosting cost, and player latency. You can
      # set up the queue to use the default prioritization or provide alternate instructions using
      # PriorityConfiguration . Request options Use this operation to make these common types of requests.
      # Create a queue with the minimum required parameters. Name Destinations (This parameter isn't
      # required, but a queue can't make placements without at least one destination.) Create a queue with
      # placement notification. Queues that have high placement activity must use a notification system,
      # such as with Amazon Simple Notification Service (Amazon SNS) or Amazon CloudWatch. Required
      # parameters Name and Destinations NotificationTarget Create a queue with custom prioritization
      # settings. These custom settings replace the default prioritization configuration for a queue.
      # Required parameters Name and Destinations PriorityConfiguration Create a queue with special rules
      # for processing player latency data. Required parameters Name and Destinations PlayerLatencyPolicies
      # Results If successful, this operation returns a new GameSessionQueue object with an assigned queue
      # ARN. Use the queue's name or ARN when submitting new game session requests with
      # StartGameSessionPlacement or StartMatchmaking . Learn more Design a game session queue Create a game
      # session queue Related actions CreateGameSessionQueue | DescribeGameSessionQueues |
      # UpdateGameSessionQueue | DeleteGameSessionQueue | All APIs by task

      def create_game_session_queue(
        name : String,
        custom_event_data : String? = nil,
        destinations : Array(Types::GameSessionQueueDestination)? = nil,
        filter_configuration : Types::FilterConfiguration? = nil,
        notification_target : String? = nil,
        player_latency_policies : Array(Types::PlayerLatencyPolicy)? = nil,
        priority_configuration : Types::PriorityConfiguration? = nil,
        tags : Array(Types::Tag)? = nil,
        timeout_in_seconds : Int32? = nil
      ) : Types::CreateGameSessionQueueOutput

        input = Types::CreateGameSessionQueueInput.new(name: name, custom_event_data: custom_event_data, destinations: destinations, filter_configuration: filter_configuration, notification_target: notification_target, player_latency_policies: player_latency_policies, priority_configuration: priority_configuration, tags: tags, timeout_in_seconds: timeout_in_seconds)
        create_game_session_queue(input)
      end

      def create_game_session_queue(input : Types::CreateGameSessionQueueInput) : Types::CreateGameSessionQueueOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_GAME_SESSION_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGameSessionQueueOutput, "CreateGameSessionQueue")
      end

      # This API works with the following fleet types: Anywhere Creates a custom location for use in an
      # Anywhere fleet.

      def create_location(
        location_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLocationOutput

        input = Types::CreateLocationInput.new(location_name: location_name, tags: tags)
        create_location(input)
      end

      def create_location(input : Types::CreateLocationInput) : Types::CreateLocationOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationOutput, "CreateLocation")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Defines a new matchmaking
      # configuration for use with FlexMatch. Whether your are using FlexMatch with Amazon GameLift Servers
      # hosting or as a standalone matchmaking service, the matchmaking configuration sets out rules for
      # matching players and forming teams. If you're also using Amazon GameLift Servers hosting, it defines
      # how to start game sessions for each match. Your matchmaking system can use multiple configurations
      # to handle different game scenarios. All matchmaking requests identify the matchmaking configuration
      # to use and provide player attributes consistent with that configuration. To create a matchmaking
      # configuration, you must provide the following: configuration name and FlexMatch mode (with or
      # without Amazon GameLift Servers hosting); a rule set that specifies how to evaluate players and find
      # acceptable matches; whether player acceptance is required; and the maximum time allowed for a
      # matchmaking attempt. When using FlexMatch with Amazon GameLift Servers hosting, you also need to
      # identify the game session queue to use when starting a game session for the match. In addition, you
      # must set up an Amazon Simple Notification Service topic to receive matchmaking notifications.
      # Provide the topic ARN in the matchmaking configuration. Learn more Design a FlexMatch matchmaker Set
      # up FlexMatch event notification

      def create_matchmaking_configuration(
        acceptance_required : Bool,
        name : String,
        request_timeout_seconds : Int32,
        rule_set_name : String,
        acceptance_timeout_seconds : Int32? = nil,
        additional_player_count : Int32? = nil,
        backfill_mode : String? = nil,
        custom_event_data : String? = nil,
        description : String? = nil,
        flex_match_mode : String? = nil,
        game_properties : Array(Types::GameProperty)? = nil,
        game_session_data : String? = nil,
        game_session_queue_arns : Array(String)? = nil,
        notification_target : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateMatchmakingConfigurationOutput

        input = Types::CreateMatchmakingConfigurationInput.new(acceptance_required: acceptance_required, name: name, request_timeout_seconds: request_timeout_seconds, rule_set_name: rule_set_name, acceptance_timeout_seconds: acceptance_timeout_seconds, additional_player_count: additional_player_count, backfill_mode: backfill_mode, custom_event_data: custom_event_data, description: description, flex_match_mode: flex_match_mode, game_properties: game_properties, game_session_data: game_session_data, game_session_queue_arns: game_session_queue_arns, notification_target: notification_target, tags: tags)
        create_matchmaking_configuration(input)
      end

      def create_matchmaking_configuration(input : Types::CreateMatchmakingConfigurationInput) : Types::CreateMatchmakingConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_MATCHMAKING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMatchmakingConfigurationOutput, "CreateMatchmakingConfiguration")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Creates a new rule set for
      # FlexMatch matchmaking. A rule set describes the type of match to create, such as the number and size
      # of teams. It also sets the parameters for acceptable player matches, such as minimum skill level or
      # character type. To create a matchmaking rule set, provide unique rule set name and the rule set body
      # in JSON format. Rule sets must be defined in the same Region as the matchmaking configuration they
      # are used with. Since matchmaking rule sets cannot be edited, it is a good idea to check the rule set
      # syntax using ValidateMatchmakingRuleSet before creating a new rule set. Learn more Build a rule set
      # Design a matchmaker Matchmaking with FlexMatch

      def create_matchmaking_rule_set(
        name : String,
        rule_set_body : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateMatchmakingRuleSetOutput

        input = Types::CreateMatchmakingRuleSetInput.new(name: name, rule_set_body: rule_set_body, tags: tags)
        create_matchmaking_rule_set(input)
      end

      def create_matchmaking_rule_set(input : Types::CreateMatchmakingRuleSetInput) : Types::CreateMatchmakingRuleSetOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_MATCHMAKING_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMatchmakingRuleSetOutput, "CreateMatchmakingRuleSet")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Reserves an open player slot
      # in a game session for a player. New player sessions can be created in any game session with an open
      # slot that is in ACTIVE status and has a player creation policy of ACCEPT_ALL . You can add a group
      # of players to a game session with CreatePlayerSessions . To create a player session, specify a game
      # session ID, player ID, and optionally a set of player data. If successful, a slot is reserved in the
      # game session for the player and a new PlayerSessions object is returned with a player session ID.
      # The player references the player session ID when sending a connection request to the game session,
      # and the game server can use it to validate the player reservation with the Amazon GameLift Servers
      # service. Player sessions cannot be updated. The maximum number of players per game session is 200.
      # It is not adjustable. Related actions All APIs by task

      def create_player_session(
        game_session_id : String,
        player_id : String,
        player_data : String? = nil
      ) : Types::CreatePlayerSessionOutput

        input = Types::CreatePlayerSessionInput.new(game_session_id: game_session_id, player_id: player_id, player_data: player_data)
        create_player_session(input)
      end

      def create_player_session(input : Types::CreatePlayerSessionInput) : Types::CreatePlayerSessionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PLAYER_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePlayerSessionOutput, "CreatePlayerSession")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Reserves open slots in a
      # game session for a group of players. New player sessions can be created in any game session with an
      # open slot that is in ACTIVE status and has a player creation policy of ACCEPT_ALL . To add a single
      # player to a game session, use CreatePlayerSession To create player sessions, specify a game session
      # ID and a list of player IDs. Optionally, provide a set of player data for each player ID. If
      # successful, a slot is reserved in the game session for each player, and new PlayerSession objects
      # are returned with player session IDs. Each player references their player session ID when sending a
      # connection request to the game session, and the game server can use it to validate the player
      # reservation with the Amazon GameLift Servers service. Player sessions cannot be updated. The maximum
      # number of players per game session is 200. It is not adjustable. Related actions All APIs by task

      def create_player_sessions(
        game_session_id : String,
        player_ids : Array(String),
        player_data_map : Hash(String, String)? = nil
      ) : Types::CreatePlayerSessionsOutput

        input = Types::CreatePlayerSessionsInput.new(game_session_id: game_session_id, player_ids: player_ids, player_data_map: player_data_map)
        create_player_sessions(input)
      end

      def create_player_sessions(input : Types::CreatePlayerSessionsInput) : Types::CreatePlayerSessionsOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PLAYER_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePlayerSessionsOutput, "CreatePlayerSessions")
      end

      # This API works with the following fleet types: EC2, Anywhere Creates a new script record for your
      # Amazon GameLift Servers Realtime script. Realtime scripts are JavaScript that provide configuration
      # settings and optional custom game logic for your game. The script is deployed when you create a
      # Amazon GameLift Servers Realtime fleet to host your game sessions. Script logic is executed during
      # an active game session. To create a new script record, specify a script name and provide the script
      # file(s). The script files and all dependencies must be zipped into a single file. You can pull the
      # zip file from either of these locations: A locally available directory. Use the ZipFile parameter
      # for this option. An Amazon Simple Storage Service (Amazon S3) bucket under your Amazon Web Services
      # account. Use the StorageLocation parameter for this option. You'll need to have an Identity Access
      # Management (IAM) role that allows the Amazon GameLift Servers service to access your S3 bucket. If
      # the call is successful, a new script record is created with a unique script ID. If the script file
      # is provided as a local file, the file is uploaded to an Amazon GameLift Servers-owned S3 bucket and
      # the script record's storage location reflects this location. If the script file is provided as an S3
      # bucket, Amazon GameLift Servers accesses the file at this storage location as needed for deployment.
      # Learn more Amazon GameLift Servers Amazon GameLift Servers Realtime Set Up a Role for Amazon
      # GameLift Servers Access Related actions All APIs by task

      def create_script(
        name : String? = nil,
        storage_location : Types::S3Location? = nil,
        tags : Array(Types::Tag)? = nil,
        version : String? = nil,
        zip_file : Bytes? = nil
      ) : Types::CreateScriptOutput

        input = Types::CreateScriptInput.new(name: name, storage_location: storage_location, tags: tags, version: version, zip_file: zip_file)
        create_script(input)
      end

      def create_script(input : Types::CreateScriptInput) : Types::CreateScriptOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SCRIPT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateScriptOutput, "CreateScript")
      end

      # This API works with the following fleet types: EC2 Requests authorization to create or delete a peer
      # connection between the VPC for your Amazon GameLift Servers fleet and a virtual private cloud (VPC)
      # in your Amazon Web Services account. VPC peering enables the game servers on your fleet to
      # communicate directly with other Amazon Web Services resources. After you've received authorization,
      # use CreateVpcPeeringConnection to establish the peering connection. For more information, see VPC
      # Peering with Amazon GameLift Servers Fleets . You can peer with VPCs that are owned by any Amazon
      # Web Services account you have access to, including the account that you use to manage your Amazon
      # GameLift Servers fleets. You cannot peer with VPCs that are in different Regions. To request
      # authorization to create a connection, call this operation from the Amazon Web Services account with
      # the VPC that you want to peer to your Amazon GameLift Servers fleet. For example, to enable your
      # game servers to retrieve data from a DynamoDB table, use the account that manages that DynamoDB
      # resource. Identify the following values: (1) The ID of the VPC that you want to peer with, and (2)
      # the ID of the Amazon Web Services account that you use to manage Amazon GameLift Servers. If
      # successful, VPC peering is authorized for the specified VPC. To request authorization to delete a
      # connection, call this operation from the Amazon Web Services account with the VPC that is peered
      # with your Amazon GameLift Servers fleet. Identify the following values: (1) VPC ID that you want to
      # delete the peering connection for, and (2) ID of the Amazon Web Services account that you use to
      # manage Amazon GameLift Servers. The authorization remains valid for 24 hours unless it is canceled.
      # You must create or delete the peering connection while the authorization is valid. Related actions
      # All APIs by task

      def create_vpc_peering_authorization(
        game_lift_aws_account_id : String,
        peer_vpc_id : String
      ) : Types::CreateVpcPeeringAuthorizationOutput

        input = Types::CreateVpcPeeringAuthorizationInput.new(game_lift_aws_account_id: game_lift_aws_account_id, peer_vpc_id: peer_vpc_id)
        create_vpc_peering_authorization(input)
      end

      def create_vpc_peering_authorization(input : Types::CreateVpcPeeringAuthorizationInput) : Types::CreateVpcPeeringAuthorizationOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_VPC_PEERING_AUTHORIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVpcPeeringAuthorizationOutput, "CreateVpcPeeringAuthorization")
      end

      # This API works with the following fleet types: EC2 Establishes a VPC peering connection between a
      # virtual private cloud (VPC) in an Amazon Web Services account with the VPC for your Amazon GameLift
      # Servers fleet. VPC peering enables the game servers on your fleet to communicate directly with other
      # Amazon Web Services resources. You can peer with VPCs in any Amazon Web Services account that you
      # have access to, including the account that you use to manage your Amazon GameLift Servers fleets.
      # You cannot peer with VPCs that are in different Regions. For more information, see VPC Peering with
      # Amazon GameLift Servers Fleets . Before calling this operation to establish the peering connection,
      # you first need to use CreateVpcPeeringAuthorization and identify the VPC you want to peer with. Once
      # the authorization for the specified VPC is issued, you have 24 hours to establish the connection.
      # These two operations handle all tasks necessary to peer the two VPCs, including acceptance, updating
      # routing tables, etc. To establish the connection, call this operation from the Amazon Web Services
      # account that is used to manage the Amazon GameLift Servers fleets. Identify the following values:
      # (1) The ID of the fleet you want to be enable a VPC peering connection for; (2) The Amazon Web
      # Services account with the VPC that you want to peer with; and (3) The ID of the VPC you want to peer
      # with. This operation is asynchronous. If successful, a connection request is created. You can use
      # continuous polling to track the request's status using DescribeVpcPeeringConnections , or by
      # monitoring fleet events for success or failure using DescribeFleetEvents . Related actions All APIs
      # by task

      def create_vpc_peering_connection(
        fleet_id : String,
        peer_vpc_aws_account_id : String,
        peer_vpc_id : String
      ) : Types::CreateVpcPeeringConnectionOutput

        input = Types::CreateVpcPeeringConnectionInput.new(fleet_id: fleet_id, peer_vpc_aws_account_id: peer_vpc_aws_account_id, peer_vpc_id: peer_vpc_id)
        create_vpc_peering_connection(input)
      end

      def create_vpc_peering_connection(input : Types::CreateVpcPeeringConnectionInput) : Types::CreateVpcPeeringConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_VPC_PEERING_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVpcPeeringConnectionOutput, "CreateVpcPeeringConnection")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Deletes an alias. This
      # operation removes all record of the alias. Game clients attempting to access a server process using
      # the deleted alias receive an error. To delete an alias, specify the alias ID to be deleted. Related
      # actions All APIs by task

      def delete_alias(
        alias_id : String
      ) : Nil

        input = Types::DeleteAliasInput.new(alias_id: alias_id)
        delete_alias(input)
      end

      def delete_alias(input : Types::DeleteAliasInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This API works with the following fleet types: EC2 Deletes a build. This operation permanently
      # deletes the build resource and any uploaded build files. Deleting a build does not affect the status
      # of any active fleets using the build, but you can no longer create new fleets with the deleted
      # build. To delete a build, specify the build ID. Learn more Upload a Custom Server Build All APIs by
      # task

      def delete_build(
        build_id : String
      ) : Nil

        input = Types::DeleteBuildInput.new(build_id: build_id)
        delete_build(input)
      end

      def delete_build(input : Types::DeleteBuildInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_BUILD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This API works with the following fleet types: Container Deletes all resources and information
      # related to a container fleet and shuts down currently running fleet instances, including those in
      # remote locations. The container fleet must be in ACTIVE status to be deleted. To delete a fleet,
      # specify the fleet ID to be terminated. During the deletion process, the fleet status is changed to
      # DELETING . Learn more Setting up Amazon GameLift Servers Fleets

      def delete_container_fleet(
        fleet_id : String
      ) : Types::DeleteContainerFleetOutput

        input = Types::DeleteContainerFleetInput.new(fleet_id: fleet_id)
        delete_container_fleet(input)
      end

      def delete_container_fleet(input : Types::DeleteContainerFleetInput) : Types::DeleteContainerFleetOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTAINER_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContainerFleetOutput, "DeleteContainerFleet")
      end

      # This API works with the following fleet types: Container Request options: Deletes a container group
      # definition. Delete an entire container group definition, including all versions. Specify the
      # container group definition name, or use an ARN value without the version number. Delete a particular
      # version. Specify the container group definition name and a version number, or use an ARN value that
      # includes the version number. Keep the newest versions and delete all older versions. Specify the
      # container group definition name and the number of versions to retain. For example, set
      # VersionCountToRetain to 5 to delete all but the five most recent versions. Result If successful,
      # Amazon GameLift Servers removes the container group definition versions that you request deletion
      # for. This request will fail for any requested versions if the following is true: If the version is
      # being used in an active fleet If the version is being deployed to a fleet in a deployment that's
      # currently in progress. If the version is designated as a rollback definition in a fleet deployment
      # that's currently in progress. Learn more Manage a container group definition

      def delete_container_group_definition(
        name : String,
        version_count_to_retain : Int32? = nil,
        version_number : Int32? = nil
      ) : Types::DeleteContainerGroupDefinitionOutput

        input = Types::DeleteContainerGroupDefinitionInput.new(name: name, version_count_to_retain: version_count_to_retain, version_number: version_number)
        delete_container_group_definition(input)
      end

      def delete_container_group_definition(input : Types::DeleteContainerGroupDefinitionInput) : Types::DeleteContainerGroupDefinitionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTAINER_GROUP_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContainerGroupDefinitionOutput, "DeleteContainerGroupDefinition")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Deletes all resources and
      # information related to a fleet and shuts down any currently running fleet instances, including those
      # in remote locations. If the fleet being deleted has a VPC peering connection, you first need to get
      # a valid authorization (good for 24 hours) by calling CreateVpcPeeringAuthorization . You don't need
      # to explicitly delete the VPC peering connection. To delete a fleet, specify the fleet ID to be
      # terminated. During the deletion process, the fleet status is changed to DELETING . When completed,
      # the status switches to TERMINATED and the fleet event FLEET_DELETED is emitted. Learn more Setting
      # up Amazon GameLift Servers Fleets

      def delete_fleet(
        fleet_id : String
      ) : Nil

        input = Types::DeleteFleetInput.new(fleet_id: fleet_id)
        delete_fleet(input)
      end

      def delete_fleet(input : Types::DeleteFleetInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This API works with the following fleet types: EC2, Container Removes locations from a
      # multi-location fleet. When deleting a location, all game server process and all instances that are
      # still active in the location are shut down. To delete fleet locations, identify the fleet ID and
      # provide a list of the locations to be deleted. If successful, GameLift sets the location status to
      # DELETING , and begins to shut down existing server processes and terminate instances in each
      # location being deleted. When completed, the location status changes to TERMINATED . Learn more
      # Setting up Amazon GameLift Servers fleets

      def delete_fleet_locations(
        fleet_id : String,
        locations : Array(String)
      ) : Types::DeleteFleetLocationsOutput

        input = Types::DeleteFleetLocationsInput.new(fleet_id: fleet_id, locations: locations)
        delete_fleet_locations(input)
      end

      def delete_fleet_locations(input : Types::DeleteFleetLocationsInput) : Types::DeleteFleetLocationsOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLEET_LOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFleetLocationsOutput, "DeleteFleetLocations")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Terminates a game server group and
      # permanently deletes the game server group record. You have several options for how these resources
      # are impacted when deleting the game server group. Depending on the type of delete operation
      # selected, this operation might affect these resources: The game server group The corresponding Auto
      # Scaling group All game servers that are currently running in the group To delete a game server
      # group, identify the game server group to delete and specify the type of delete operation to
      # initiate. Game server groups can only be deleted if they are in ACTIVE or ERROR status. If the
      # delete request is successful, a series of operations are kicked off. The game server group status is
      # changed to DELETE_SCHEDULED , which prevents new game servers from being registered and stops
      # automatic scaling activity. Once all game servers in the game server group are deregistered, Amazon
      # GameLift Servers FleetIQ can begin deleting resources. If any of the delete operations fail, the
      # game server group is placed in ERROR status. Amazon GameLift Servers FleetIQ emits delete events to
      # Amazon CloudWatch. Learn more Amazon GameLift Servers FleetIQ Guide

      def delete_game_server_group(
        game_server_group_name : String,
        delete_option : String? = nil
      ) : Types::DeleteGameServerGroupOutput

        input = Types::DeleteGameServerGroupInput.new(game_server_group_name: game_server_group_name, delete_option: delete_option)
        delete_game_server_group(input)
      end

      def delete_game_server_group(input : Types::DeleteGameServerGroupInput) : Types::DeleteGameServerGroupOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_GAME_SERVER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGameServerGroupOutput, "DeleteGameServerGroup")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Deletes a game session
      # queue. Once a queue is successfully deleted, unfulfilled StartGameSessionPlacement requests that
      # reference the queue will fail. To delete a queue, specify the queue name.

      def delete_game_session_queue(
        name : String
      ) : Types::DeleteGameSessionQueueOutput

        input = Types::DeleteGameSessionQueueInput.new(name: name)
        delete_game_session_queue(input)
      end

      def delete_game_session_queue(input : Types::DeleteGameSessionQueueInput) : Types::DeleteGameSessionQueueOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_GAME_SESSION_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGameSessionQueueOutput, "DeleteGameSessionQueue")
      end

      # This API works with the following fleet types: Anywhere Deletes a custom location. Before deleting a
      # custom location, review any fleets currently using the custom location and deregister the location
      # if it is in use. For more information, see DeregisterCompute .

      def delete_location(
        location_name : String
      ) : Types::DeleteLocationOutput

        input = Types::DeleteLocationInput.new(location_name: location_name)
        delete_location(input)
      end

      def delete_location(input : Types::DeleteLocationInput) : Types::DeleteLocationOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_LOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLocationOutput, "DeleteLocation")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Permanently removes a
      # FlexMatch matchmaking configuration. To delete, specify the configuration name. A matchmaking
      # configuration cannot be deleted if it is being used in any active matchmaking tickets.

      def delete_matchmaking_configuration(
        name : String
      ) : Types::DeleteMatchmakingConfigurationOutput

        input = Types::DeleteMatchmakingConfigurationInput.new(name: name)
        delete_matchmaking_configuration(input)
      end

      def delete_matchmaking_configuration(input : Types::DeleteMatchmakingConfigurationInput) : Types::DeleteMatchmakingConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_MATCHMAKING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMatchmakingConfigurationOutput, "DeleteMatchmakingConfiguration")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Deletes an existing
      # matchmaking rule set. To delete the rule set, provide the rule set name. Rule sets cannot be deleted
      # if they are currently being used by a matchmaking configuration. Learn more Build a rule set

      def delete_matchmaking_rule_set(
        name : String
      ) : Types::DeleteMatchmakingRuleSetOutput

        input = Types::DeleteMatchmakingRuleSetInput.new(name: name)
        delete_matchmaking_rule_set(input)
      end

      def delete_matchmaking_rule_set(input : Types::DeleteMatchmakingRuleSetInput) : Types::DeleteMatchmakingRuleSetOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_MATCHMAKING_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMatchmakingRuleSetOutput, "DeleteMatchmakingRuleSet")
      end

      # This API works with the following fleet types: EC2 Deletes a fleet scaling policy. Once deleted, the
      # policy is no longer in force and Amazon GameLift Servers removes all record of it. To delete a
      # scaling policy, specify both the scaling policy name and the fleet ID it is associated with. To
      # temporarily suspend scaling policies, use StopFleetActions . This operation suspends all policies
      # for the fleet.

      def delete_scaling_policy(
        fleet_id : String,
        name : String
      ) : Nil

        input = Types::DeleteScalingPolicyInput.new(fleet_id: fleet_id, name: name)
        delete_scaling_policy(input)
      end

      def delete_scaling_policy(input : Types::DeleteScalingPolicyInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This API works with the following fleet types: EC2 Deletes a Realtime script. This operation
      # permanently deletes the script record. If script files were uploaded, they are also deleted (files
      # stored in an S3 bucket are not deleted). To delete a script, specify the script ID. Before deleting
      # a script, be sure to terminate all fleets that are deployed with the script being deleted. Fleet
      # instances periodically check for script updates, and if the script record no longer exists, the
      # instance will go into an error state and be unable to host game sessions. Learn more Amazon GameLift
      # Servers Amazon GameLift Servers Realtime Related actions All APIs by task

      def delete_script(
        script_id : String
      ) : Nil

        input = Types::DeleteScriptInput.new(script_id: script_id)
        delete_script(input)
      end

      def delete_script(input : Types::DeleteScriptInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCRIPT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This API works with the following fleet types: EC2 Cancels a pending VPC peering authorization for
      # the specified VPC. If you need to delete an existing VPC peering connection, use
      # DeleteVpcPeeringConnection . Related actions All APIs by task

      def delete_vpc_peering_authorization(
        game_lift_aws_account_id : String,
        peer_vpc_id : String
      ) : Types::DeleteVpcPeeringAuthorizationOutput

        input = Types::DeleteVpcPeeringAuthorizationInput.new(game_lift_aws_account_id: game_lift_aws_account_id, peer_vpc_id: peer_vpc_id)
        delete_vpc_peering_authorization(input)
      end

      def delete_vpc_peering_authorization(input : Types::DeleteVpcPeeringAuthorizationInput) : Types::DeleteVpcPeeringAuthorizationOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_VPC_PEERING_AUTHORIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVpcPeeringAuthorizationOutput, "DeleteVpcPeeringAuthorization")
      end

      # This API works with the following fleet types: EC2 Removes a VPC peering connection. To delete the
      # connection, you must have a valid authorization for the VPC peering connection that you want to
      # delete.. Once a valid authorization exists, call this operation from the Amazon Web Services account
      # that is used to manage the Amazon GameLift Servers fleets. Identify the connection to delete by the
      # connection ID and fleet ID. If successful, the connection is removed. Related actions All APIs by
      # task

      def delete_vpc_peering_connection(
        fleet_id : String,
        vpc_peering_connection_id : String
      ) : Types::DeleteVpcPeeringConnectionOutput

        input = Types::DeleteVpcPeeringConnectionInput.new(fleet_id: fleet_id, vpc_peering_connection_id: vpc_peering_connection_id)
        delete_vpc_peering_connection(input)
      end

      def delete_vpc_peering_connection(input : Types::DeleteVpcPeeringConnectionInput) : Types::DeleteVpcPeeringConnectionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_VPC_PEERING_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVpcPeeringConnectionOutput, "DeleteVpcPeeringConnection")
      end

      # This API works with the following fleet types: Anywhere Removes a compute resource from an Anywhere
      # fleet. Deregistered computes can no longer host game sessions through Amazon GameLift Servers. Use
      # this operation with an Anywhere fleet that doesn't use the Amazon GameLift Servers Agent For
      # Anywhere fleets with the Agent, the Agent handles all compute registry tasks for you. To deregister
      # a compute, call this operation from the compute that's being deregistered and specify the compute
      # name and the fleet ID.

      def deregister_compute(
        compute_name : String,
        fleet_id : String
      ) : Types::DeregisterComputeOutput

        input = Types::DeregisterComputeInput.new(compute_name: compute_name, fleet_id: fleet_id)
        deregister_compute(input)
      end

      def deregister_compute(input : Types::DeregisterComputeInput) : Types::DeregisterComputeOutput
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_COMPUTE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterComputeOutput, "DeregisterCompute")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Removes the game server from a game
      # server group. As a result of this operation, the deregistered game server can no longer be claimed
      # and will not be returned in a list of active game servers. To deregister a game server, specify the
      # game server group and game server ID. If successful, this operation emits a CloudWatch event with
      # termination timestamp and reason. Learn more Amazon GameLift Servers FleetIQ Guide

      def deregister_game_server(
        game_server_group_name : String,
        game_server_id : String
      ) : Nil

        input = Types::DeregisterGameServerInput.new(game_server_group_name: game_server_group_name, game_server_id: game_server_id)
        deregister_game_server(input)
      end

      def deregister_game_server(input : Types::DeregisterGameServerInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_GAME_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves properties for an
      # alias. This operation returns all alias metadata and settings. To get an alias's target fleet ID
      # only, use ResolveAlias . To get alias properties, specify the alias ID. If successful, the requested
      # alias record is returned. Related actions All APIs by task

      def describe_alias(
        alias_id : String
      ) : Types::DescribeAliasOutput

        input = Types::DescribeAliasInput.new(alias_id: alias_id)
        describe_alias(input)
      end

      def describe_alias(input : Types::DescribeAliasInput) : Types::DescribeAliasOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAliasOutput, "DescribeAlias")
      end

      # This API works with the following fleet types: EC2 Retrieves properties for a custom game build. To
      # request a build resource, specify a build ID. If successful, an object containing the build
      # properties is returned. Learn more Upload a Custom Server Build All APIs by task

      def describe_build(
        build_id : String
      ) : Types::DescribeBuildOutput

        input = Types::DescribeBuildInput.new(build_id: build_id)
        describe_build(input)
      end

      def describe_build(input : Types::DescribeBuildInput) : Types::DescribeBuildOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUILD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBuildOutput, "DescribeBuild")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves properties for a
      # specific compute resource in an Amazon GameLift Servers fleet. You can list all computes in a fleet
      # by calling ListCompute . Request options Provide the fleet ID and compute name. The compute name
      # varies depending on the type of fleet. For a compute in a managed EC2 fleet, provide an instance ID.
      # Each instance in the fleet is a compute. For a compute in a managed container fleet, provide a
      # compute name. In a container fleet, each game server container group on a fleet instance is assigned
      # a compute name. For a compute in an Anywhere fleet, provide a registered compute name. Anywhere
      # fleet computes are created when you register a hosting resource with the fleet. Results If
      # successful, this operation returns details for the requested compute resource. Depending on the
      # fleet's compute type, the result includes the following information: For a managed EC2 fleet, this
      # operation returns information about the EC2 instance. For an Anywhere fleet, this operation returns
      # information about the registered compute.

      def describe_compute(
        compute_name : String,
        fleet_id : String
      ) : Types::DescribeComputeOutput

        input = Types::DescribeComputeInput.new(compute_name: compute_name, fleet_id: fleet_id)
        describe_compute(input)
      end

      def describe_compute(input : Types::DescribeComputeInput) : Types::DescribeComputeOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COMPUTE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeComputeOutput, "DescribeCompute")
      end

      # This API works with the following fleet types: Container Retrieves the properties for a container
      # fleet. When requesting attributes for multiple fleets, use the pagination parameters to retrieve
      # results as a set of sequential pages. Request options Get container fleet properties for a single
      # fleet. Provide either the fleet ID or ARN value. Results If successful, a ContainerFleet object is
      # returned. This object includes the fleet properties, including information about the most recent
      # deployment. Some API operations limit the number of fleet IDs that allowed in one request. If a
      # request exceeds this limit, the request fails and the error message contains the maximum allowed
      # number.

      def describe_container_fleet(
        fleet_id : String
      ) : Types::DescribeContainerFleetOutput

        input = Types::DescribeContainerFleetInput.new(fleet_id: fleet_id)
        describe_container_fleet(input)
      end

      def describe_container_fleet(input : Types::DescribeContainerFleetInput) : Types::DescribeContainerFleetOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONTAINER_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeContainerFleetOutput, "DescribeContainerFleet")
      end

      # This API works with the following fleet types: Container Retrieves the properties of a container
      # group definition, including all container definitions in the group. Request options: Retrieve the
      # latest version of a container group definition. Specify the container group definition name only, or
      # use an ARN value without a version number. Retrieve a particular version. Specify the container
      # group definition name and a version number, or use an ARN value that includes the version number.
      # Results: If successful, this operation returns the complete properties of a container group
      # definition version. Learn more Manage a container group definition

      def describe_container_group_definition(
        name : String,
        version_number : Int32? = nil
      ) : Types::DescribeContainerGroupDefinitionOutput

        input = Types::DescribeContainerGroupDefinitionInput.new(name: name, version_number: version_number)
        describe_container_group_definition(input)
      end

      def describe_container_group_definition(input : Types::DescribeContainerGroupDefinitionInput) : Types::DescribeContainerGroupDefinitionOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONTAINER_GROUP_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeContainerGroupDefinitionOutput, "DescribeContainerGroupDefinition")
      end

      # This API works with the following fleet types: EC2 Retrieves the instance limits and current
      # utilization for an Amazon Web Services Region or location. Instance limits control the number of
      # instances, per instance type, per location, that your Amazon Web Services account can use. Learn
      # more at Amazon EC2 Instance Types . The information returned includes the maximum number of
      # instances allowed and your account's current usage across all fleets. This information can affect
      # your ability to scale your Amazon GameLift Servers fleets. You can request a limit increase for your
      # account by using the Service limits page in the Amazon GameLift Servers console. Instance limits
      # differ based on whether the instances are deployed in a fleet's home Region or in a remote location.
      # For remote locations, limits also differ based on the combination of home Region and remote
      # location. All requests must specify an Amazon Web Services Region (either explicitly or as your
      # default settings). To get the limit for a remote location, you must also specify the location. For
      # example, the following requests all return different results: Request specifies the Region
      # ap-northeast-1 with no location. The result is limits and usage data on all instance types that are
      # deployed in us-east-2 , by all of the fleets that reside in ap-northeast-1 . Request specifies the
      # Region us-east-1 with location ca-central-1 . The result is limits and usage data on all instance
      # types that are deployed in ca-central-1 , by all of the fleets that reside in us-east-2 . These
      # limits do not affect fleets in any other Regions that deploy instances to ca-central-1 . Request
      # specifies the Region eu-west-1 with location ca-central-1 . The result is limits and usage data on
      # all instance types that are deployed in ca-central-1 , by all of the fleets that reside in eu-west-1
      # . This operation can be used in the following ways: To get limit and usage data for all instance
      # types that are deployed in an Amazon Web Services Region by fleets that reside in the same Region:
      # Specify the Region only. Optionally, specify a single instance type to retrieve information for. To
      # get limit and usage data for all instance types that are deployed to a remote location by fleets
      # that reside in different Amazon Web Services Region: Provide both the Amazon Web Services Region and
      # the remote location. Optionally, specify a single instance type to retrieve information for. If
      # successful, an EC2InstanceLimits object is returned with limits and usage data for each requested
      # instance type. Learn more Setting up Amazon GameLift Servers fleets

      def describe_ec2_instance_limits(
        ec2_instance_type : String? = nil,
        location : String? = nil
      ) : Types::DescribeEC2InstanceLimitsOutput

        input = Types::DescribeEC2InstanceLimitsInput.new(ec2_instance_type: ec2_instance_type, location: location)
        describe_ec2_instance_limits(input)
      end

      def describe_ec2_instance_limits(input : Types::DescribeEC2InstanceLimitsInput) : Types::DescribeEC2InstanceLimitsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EC2_INSTANCE_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEC2InstanceLimitsOutput, "DescribeEC2InstanceLimits")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves core fleet-wide
      # properties for fleets in an Amazon Web Services Region. Properties include the computing hardware
      # and deployment configuration for instances in the fleet. You can use this operation in the following
      # ways: To get attributes for specific fleets, provide a list of fleet IDs or fleet ARNs. To get
      # attributes for all fleets, do not provide a fleet identifier. When requesting attributes for
      # multiple fleets, use the pagination parameters to retrieve results as a set of sequential pages. If
      # successful, a FleetAttributes object is returned for each fleet requested, unless the fleet
      # identifier is not found. Some API operations limit the number of fleet IDs that allowed in one
      # request. If a request exceeds this limit, the request fails and the error message contains the
      # maximum allowed number. Learn more Setting up Amazon GameLift Servers fleets

      def describe_fleet_attributes(
        fleet_ids : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetAttributesOutput

        input = Types::DescribeFleetAttributesInput.new(fleet_ids: fleet_ids, limit: limit, next_token: next_token)
        describe_fleet_attributes(input)
      end

      def describe_fleet_attributes(input : Types::DescribeFleetAttributesInput) : Types::DescribeFleetAttributesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetAttributesOutput, "DescribeFleetAttributes")
      end

      # This API works with the following fleet types: EC2, Container Retrieves the resource capacity
      # settings for one or more fleets. For a container fleet, this operation also returns counts for game
      # server container groups. With multi-location fleets, this operation retrieves data for the fleet's
      # home Region only. To retrieve capacity for remote locations, see
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetLocationCapacity.html .
      # This operation can be used in the following ways: To get capacity data for one or more specific
      # fleets, provide a list of fleet IDs or fleet ARNs. To get capacity data for all fleets, do not
      # provide a fleet identifier. When requesting multiple fleets, use the pagination parameters to
      # retrieve results as a set of sequential pages. If successful, a FleetCapacity object is returned for
      # each requested fleet ID. Each FleetCapacity object includes a Location property, which is set to the
      # fleet's home Region. Capacity values are returned only for fleets that currently exist. Some API
      # operations may limit the number of fleet IDs that are allowed in one request. If a request exceeds
      # this limit, the request fails and the error message includes the maximum allowed. Learn more Setting
      # up Amazon GameLift Servers fleets GameLift metrics for fleets

      def describe_fleet_capacity(
        fleet_ids : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetCapacityOutput

        input = Types::DescribeFleetCapacityInput.new(fleet_ids: fleet_ids, limit: limit, next_token: next_token)
        describe_fleet_capacity(input)
      end

      def describe_fleet_capacity(input : Types::DescribeFleetCapacityInput) : Types::DescribeFleetCapacityOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_CAPACITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetCapacityOutput, "DescribeFleetCapacity")
      end

      # This API works with the following fleet types: Container Retrieves information about a managed
      # container fleet deployment. Request options Get information about the latest deployment for a
      # specific fleet. Provide the fleet ID or ARN. Get information about a specific deployment. Provide
      # the fleet ID or ARN and the deployment ID. Results If successful, a FleetDeployment object is
      # returned.

      def describe_fleet_deployment(
        fleet_id : String,
        deployment_id : String? = nil
      ) : Types::DescribeFleetDeploymentOutput

        input = Types::DescribeFleetDeploymentInput.new(fleet_id: fleet_id, deployment_id: deployment_id)
        describe_fleet_deployment(input)
      end

      def describe_fleet_deployment(input : Types::DescribeFleetDeploymentInput) : Types::DescribeFleetDeploymentOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetDeploymentOutput, "DescribeFleetDeployment")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves entries from a
      # fleet's event log. Fleet events are initiated by changes in status, such as during fleet creation
      # and termination, changes in capacity, etc. If a fleet has multiple locations, events are also
      # initiated by changes to status and capacity in remote locations. You can specify a time range to
      # limit the result set. Use the pagination parameters to retrieve results as a set of sequential
      # pages. If successful, a collection of event log entries matching the request are returned. Learn
      # more Setting up Amazon GameLift Servers fleets

      def describe_fleet_events(
        fleet_id : String,
        end_time : Time? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Types::DescribeFleetEventsOutput

        input = Types::DescribeFleetEventsInput.new(fleet_id: fleet_id, end_time: end_time, limit: limit, next_token: next_token, start_time: start_time)
        describe_fleet_events(input)
      end

      def describe_fleet_events(input : Types::DescribeFleetEventsInput) : Types::DescribeFleetEventsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetEventsOutput, "DescribeFleetEvents")
      end

      # This API works with the following fleet types: EC2, Container Retrieves information on a fleet's
      # remote locations, including life-cycle status and any suspended fleet activity. This operation can
      # be used in the following ways: To get data for specific locations, provide a fleet identifier and a
      # list of locations. Location data is returned in the order that it is requested. To get data for all
      # locations, provide a fleet identifier only. Location data is returned in no particular order. When
      # requesting attributes for multiple locations, use the pagination parameters to retrieve results as a
      # set of sequential pages. If successful, a LocationAttributes object is returned for each requested
      # location. If the fleet does not have a requested location, no information is returned. This
      # operation does not return the home Region. To get information on a fleet's home Region, call
      # DescribeFleetAttributes . Learn more Setting up Amazon GameLift Servers fleets Amazon GameLift
      # Servers service locations for managed hosting

      def describe_fleet_location_attributes(
        fleet_id : String,
        limit : Int32? = nil,
        locations : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetLocationAttributesOutput

        input = Types::DescribeFleetLocationAttributesInput.new(fleet_id: fleet_id, limit: limit, locations: locations, next_token: next_token)
        describe_fleet_location_attributes(input)
      end

      def describe_fleet_location_attributes(input : Types::DescribeFleetLocationAttributesInput) : Types::DescribeFleetLocationAttributesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_LOCATION_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetLocationAttributesOutput, "DescribeFleetLocationAttributes")
      end

      # This API works with the following fleet types: EC2, Container Retrieves the resource capacity
      # settings for a fleet location. The data returned includes the current capacity (number of EC2
      # instances) and some scaling settings for the requested fleet location. For a managed container
      # fleet, this operation also returns counts for game server container groups. Use this operation to
      # retrieve capacity information for a fleet's remote location or home Region (you can also retrieve
      # home Region capacity by calling DescribeFleetCapacity ). To retrieve capacity data, identify a fleet
      # and location. If successful, a FleetCapacity object is returned for the requested fleet location.
      # Learn more Setting up Amazon GameLift Servers fleets Amazon GameLift Servers service locations for
      # managed hosting GameLift metrics for fleets

      def describe_fleet_location_capacity(
        fleet_id : String,
        location : String
      ) : Types::DescribeFleetLocationCapacityOutput

        input = Types::DescribeFleetLocationCapacityInput.new(fleet_id: fleet_id, location: location)
        describe_fleet_location_capacity(input)
      end

      def describe_fleet_location_capacity(input : Types::DescribeFleetLocationCapacityInput) : Types::DescribeFleetLocationCapacityOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_LOCATION_CAPACITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetLocationCapacityOutput, "DescribeFleetLocationCapacity")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves current usage data
      # for a fleet location. Utilization data provides a snapshot of current game hosting activity at the
      # requested location. Use this operation to retrieve utilization information for a fleet's remote
      # location or home Region (you can also retrieve home Region utilization by calling
      # DescribeFleetUtilization ). To retrieve utilization data, identify a fleet and location. If
      # successful, a FleetUtilization object is returned for the requested fleet location. Learn more
      # Setting up Amazon GameLift Servers fleets Amazon GameLift Servers service locations for managed
      # hosting GameLift metrics for fleets

      def describe_fleet_location_utilization(
        fleet_id : String,
        location : String
      ) : Types::DescribeFleetLocationUtilizationOutput

        input = Types::DescribeFleetLocationUtilizationInput.new(fleet_id: fleet_id, location: location)
        describe_fleet_location_utilization(input)
      end

      def describe_fleet_location_utilization(input : Types::DescribeFleetLocationUtilizationInput) : Types::DescribeFleetLocationUtilizationOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_LOCATION_UTILIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetLocationUtilizationOutput, "DescribeFleetLocationUtilization")
      end

      # This API works with the following fleet types: EC2, Container Retrieves a fleet's inbound connection
      # permissions. Connection permissions specify IP addresses and port settings that incoming traffic can
      # use to access server processes in the fleet. Game server processes that are running in the fleet
      # must use a port that falls within this range. Use this operation in the following ways: To retrieve
      # the port settings for a fleet, identify the fleet's unique identifier. To check the status of recent
      # updates to a fleet remote location, specify the fleet ID and a location. Port setting updates can
      # take time to propagate across all locations. If successful, a set of IpPermission objects is
      # returned for the requested fleet ID. When specifying a location, this operation returns a pending
      # status. If the requested fleet has been deleted, the result set is empty. Learn more Setting up
      # Amazon GameLift Servers fleets

      def describe_fleet_port_settings(
        fleet_id : String,
        location : String? = nil
      ) : Types::DescribeFleetPortSettingsOutput

        input = Types::DescribeFleetPortSettingsInput.new(fleet_id: fleet_id, location: location)
        describe_fleet_port_settings(input)
      end

      def describe_fleet_port_settings(input : Types::DescribeFleetPortSettingsInput) : Types::DescribeFleetPortSettingsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_PORT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetPortSettingsOutput, "DescribeFleetPortSettings")
      end

      # This API works with the following fleet types: EC2, Container Retrieves utilization statistics for
      # one or more fleets. Utilization data provides a snapshot of how the fleet's hosting resources are
      # currently being used. For fleets with remote locations, this operation retrieves data for the
      # fleet's home Region only. See DescribeFleetLocationUtilization to get utilization statistics for a
      # fleet's remote locations. This operation can be used in the following ways: To get utilization data
      # for one or more specific fleets, provide a list of fleet IDs or fleet ARNs. To get utilization data
      # for all fleets, do not provide a fleet identifier. When requesting multiple fleets, use the
      # pagination parameters to retrieve results as a set of sequential pages. If successful, a
      # FleetUtilization object is returned for each requested fleet ID, unless the fleet identifier is not
      # found. Each fleet utilization object includes a Location property, which is set to the fleet's home
      # Region. Some API operations may limit the number of fleet IDs allowed in one request. If a request
      # exceeds this limit, the request fails and the error message includes the maximum allowed. Learn more
      # Setting up Amazon GameLift Servers Fleets GameLift Metrics for Fleets

      def describe_fleet_utilization(
        fleet_ids : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetUtilizationOutput

        input = Types::DescribeFleetUtilizationInput.new(fleet_ids: fleet_ids, limit: limit, next_token: next_token)
        describe_fleet_utilization(input)
      end

      def describe_fleet_utilization(input : Types::DescribeFleetUtilizationInput) : Types::DescribeFleetUtilizationOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_UTILIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetUtilizationOutput, "DescribeFleetUtilization")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Retrieves information for a registered
      # game server. Information includes game server status, health check info, and the instance that the
      # game server is running on. To retrieve game server information, specify the game server ID. If
      # successful, the requested game server object is returned. Learn more Amazon GameLift Servers FleetIQ
      # Guide

      def describe_game_server(
        game_server_group_name : String,
        game_server_id : String
      ) : Types::DescribeGameServerOutput

        input = Types::DescribeGameServerInput.new(game_server_group_name: game_server_group_name, game_server_id: game_server_id)
        describe_game_server(input)
      end

      def describe_game_server(input : Types::DescribeGameServerInput) : Types::DescribeGameServerOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GAME_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGameServerOutput, "DescribeGameServer")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Retrieves information on a game server
      # group. This operation returns only properties related to Amazon GameLift Servers FleetIQ. To view or
      # update properties for the corresponding Auto Scaling group, such as launch template, auto scaling
      # policies, and maximum/minimum group size, access the Auto Scaling group directly. To get attributes
      # for a game server group, provide a group name or ARN value. If successful, a GameServerGroup object
      # is returned. Learn more Amazon GameLift Servers FleetIQ Guide

      def describe_game_server_group(
        game_server_group_name : String
      ) : Types::DescribeGameServerGroupOutput

        input = Types::DescribeGameServerGroupInput.new(game_server_group_name: game_server_group_name)
        describe_game_server_group(input)
      end

      def describe_game_server_group(input : Types::DescribeGameServerGroupInput) : Types::DescribeGameServerGroupOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GAME_SERVER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGameServerGroupOutput, "DescribeGameServerGroup")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Retrieves status information about the
      # Amazon EC2 instances associated with a Amazon GameLift Servers FleetIQ game server group. Use this
      # operation to detect when instances are active or not available to host new game servers. To request
      # status for all instances in the game server group, provide a game server group ID only. To request
      # status for specific instances, provide the game server group ID and one or more instance IDs. Use
      # the pagination parameters to retrieve results in sequential segments. If successful, a collection of
      # GameServerInstance objects is returned. This operation is not designed to be called with every game
      # server claim request; this practice can cause you to exceed your API limit, which results in errors.
      # Instead, as a best practice, cache the results and refresh your cache no more than once every 10
      # seconds. Learn more Amazon GameLift Servers FleetIQ Guide

      def describe_game_server_instances(
        game_server_group_name : String,
        instance_ids : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeGameServerInstancesOutput

        input = Types::DescribeGameServerInstancesInput.new(game_server_group_name: game_server_group_name, instance_ids: instance_ids, limit: limit, next_token: next_token)
        describe_game_server_instances(input)
      end

      def describe_game_server_instances(input : Types::DescribeGameServerInstancesInput) : Types::DescribeGameServerInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GAME_SERVER_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGameServerInstancesOutput, "DescribeGameServerInstances")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves additional game
      # session properties, including the game session protection policy in force, a set of one or more game
      # sessions in a specific fleet location. You can optionally filter the results by current game session
      # status. This operation can be used in the following ways: To retrieve details for all game sessions
      # that are currently running on all locations in a fleet, provide a fleet or alias ID, with an
      # optional status filter. This approach returns details from the fleet's home Region and all remote
      # locations. To retrieve details for all game sessions that are currently running on a specific fleet
      # location, provide a fleet or alias ID and a location name, with optional status filter. The location
      # can be the fleet's home Region or any remote location. To retrieve details for a specific game
      # session, provide the game session ID. This approach looks for the game session ID in all fleets that
      # reside in the Amazon Web Services Region defined in the request. Use the pagination parameters to
      # retrieve results as a set of sequential pages. If successful, a GameSessionDetail object is returned
      # for each game session that matches the request. Learn more Find a game session All APIs by task

      def describe_game_session_details(
        alias_id : String? = nil,
        fleet_id : String? = nil,
        game_session_id : String? = nil,
        limit : Int32? = nil,
        location : String? = nil,
        next_token : String? = nil,
        status_filter : String? = nil
      ) : Types::DescribeGameSessionDetailsOutput

        input = Types::DescribeGameSessionDetailsInput.new(alias_id: alias_id, fleet_id: fleet_id, game_session_id: game_session_id, limit: limit, location: location, next_token: next_token, status_filter: status_filter)
        describe_game_session_details(input)
      end

      def describe_game_session_details(input : Types::DescribeGameSessionDetailsInput) : Types::DescribeGameSessionDetailsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GAME_SESSION_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGameSessionDetailsOutput, "DescribeGameSessionDetails")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves information,
      # including current status, about a game session placement request. To get game session placement
      # details, specify the placement ID. This operation is not designed to be continually called to track
      # game session status. This practice can cause you to exceed your API limit, which results in errors.
      # Instead, you must configure an Amazon Simple Notification Service (SNS) topic to receive
      # notifications from FlexMatch or queues. Continuously polling with DescribeGameSessionPlacement
      # should only be used for games in development with low game session usage.

      def describe_game_session_placement(
        placement_id : String
      ) : Types::DescribeGameSessionPlacementOutput

        input = Types::DescribeGameSessionPlacementInput.new(placement_id: placement_id)
        describe_game_session_placement(input)
      end

      def describe_game_session_placement(input : Types::DescribeGameSessionPlacementInput) : Types::DescribeGameSessionPlacementOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GAME_SESSION_PLACEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGameSessionPlacementOutput, "DescribeGameSessionPlacement")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves the properties for
      # one or more game session queues. When requesting multiple queues, use the pagination parameters to
      # retrieve results as a set of sequential pages. When specifying a list of queues, objects are
      # returned only for queues that currently exist in the Region. Learn more View Your Queues

      def describe_game_session_queues(
        limit : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::DescribeGameSessionQueuesOutput

        input = Types::DescribeGameSessionQueuesInput.new(limit: limit, names: names, next_token: next_token)
        describe_game_session_queues(input)
      end

      def describe_game_session_queues(input : Types::DescribeGameSessionQueuesInput) : Types::DescribeGameSessionQueuesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GAME_SESSION_QUEUES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGameSessionQueuesOutput, "DescribeGameSessionQueues")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves a set of one or
      # more game sessions in a specific fleet location. You can optionally filter the results by current
      # game session status. This operation can be used in the following ways: To retrieve all game sessions
      # that are currently running on all locations in a fleet, provide a fleet or alias ID, with an
      # optional status filter. This approach returns all game sessions in the fleet's home Region and all
      # remote locations. To retrieve all game sessions that are currently running on a specific fleet
      # location, provide a fleet or alias ID and a location name, with optional status filter. The location
      # can be the fleet's home Region or any remote location. To retrieve a specific game session, provide
      # the game session ID. This approach looks for the game session ID in all fleets that reside in the
      # Amazon Web Services Region defined in the request. Use the pagination parameters to retrieve results
      # as a set of sequential pages. If successful, a GameSession object is returned for each game session
      # that matches the request. This operation is not designed to be continually called to track game
      # session status. This practice can cause you to exceed your API limit, which results in errors.
      # Instead, you must configure an Amazon Simple Notification Service (SNS) topic to receive
      # notifications from FlexMatch or queues. Continuously polling with DescribeGameSessions should only
      # be used for games in development with low game session usage. Available in Amazon GameLift Servers
      # Local. Learn more Find a game session All APIs by task

      def describe_game_sessions(
        alias_id : String? = nil,
        fleet_id : String? = nil,
        game_session_id : String? = nil,
        limit : Int32? = nil,
        location : String? = nil,
        next_token : String? = nil,
        status_filter : String? = nil
      ) : Types::DescribeGameSessionsOutput

        input = Types::DescribeGameSessionsInput.new(alias_id: alias_id, fleet_id: fleet_id, game_session_id: game_session_id, limit: limit, location: location, next_token: next_token, status_filter: status_filter)
        describe_game_sessions(input)
      end

      def describe_game_sessions(input : Types::DescribeGameSessionsInput) : Types::DescribeGameSessionsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GAME_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGameSessionsOutput, "DescribeGameSessions")
      end

      # This API works with the following fleet types: EC2 Retrieves information about the EC2 instances in
      # an Amazon GameLift Servers managed fleet, including instance ID, connection data, and status. You
      # can use this operation with a multi-location fleet to get location-specific instance information. As
      # an alternative, use the operations
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListCompute and
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeCompute to retrieve information
      # for compute resources, including EC2 and Anywhere fleets. You can call this operation in the
      # following ways: To get information on all instances in a fleet's home Region, specify the fleet ID.
      # To get information on all instances in a fleet's remote location, specify the fleet ID and location
      # name. To get information on a specific instance in a fleet, specify the fleet ID and instance ID.
      # Use the pagination parameters to retrieve results as a set of sequential pages. If successful, this
      # operation returns Instance objects for each requested instance, listed in no particular order. If
      # you call this operation for an Anywhere fleet, you receive an InvalidRequestException. Learn more
      # Remotely connect to fleet instances Debug fleet issues Related actions All APIs by task

      def describe_instances(
        fleet_id : String,
        instance_id : String? = nil,
        limit : Int32? = nil,
        location : String? = nil,
        next_token : String? = nil
      ) : Types::DescribeInstancesOutput

        input = Types::DescribeInstancesInput.new(fleet_id: fleet_id, instance_id: instance_id, limit: limit, location: location, next_token: next_token)
        describe_instances(input)
      end

      def describe_instances(input : Types::DescribeInstancesInput) : Types::DescribeInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstancesOutput, "DescribeInstances")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves one or more
      # matchmaking tickets. Use this operation to retrieve ticket information, including--after a
      # successful match is made--connection information for the resulting new game session. To request
      # matchmaking tickets, provide a list of up to 10 ticket IDs. If the request is successful, a ticket
      # object is returned for each requested ID that currently exists. This operation is not designed to be
      # continually called to track matchmaking ticket status. This practice can cause you to exceed your
      # API limit, which results in errors. Instead, as a best practice, set up an Amazon Simple
      # Notification Service to receive notifications, and provide the topic ARN in the matchmaking
      # configuration. Learn more Add FlexMatch to a game client Set Up FlexMatch event notification

      def describe_matchmaking(
        ticket_ids : Array(String)
      ) : Types::DescribeMatchmakingOutput

        input = Types::DescribeMatchmakingInput.new(ticket_ids: ticket_ids)
        describe_matchmaking(input)
      end

      def describe_matchmaking(input : Types::DescribeMatchmakingInput) : Types::DescribeMatchmakingOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MATCHMAKING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMatchmakingOutput, "DescribeMatchmaking")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves the details of
      # FlexMatch matchmaking configurations. This operation offers the following options: (1) retrieve all
      # matchmaking configurations, (2) retrieve configurations for a specified list, or (3) retrieve all
      # configurations that use a specified rule set name. When requesting multiple items, use the
      # pagination parameters to retrieve results as a set of sequential pages. If successful, a
      # configuration is returned for each requested name. When specifying a list of names, only
      # configurations that currently exist are returned. Learn more Setting up FlexMatch matchmakers

      def describe_matchmaking_configurations(
        limit : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil,
        rule_set_name : String? = nil
      ) : Types::DescribeMatchmakingConfigurationsOutput

        input = Types::DescribeMatchmakingConfigurationsInput.new(limit: limit, names: names, next_token: next_token, rule_set_name: rule_set_name)
        describe_matchmaking_configurations(input)
      end

      def describe_matchmaking_configurations(input : Types::DescribeMatchmakingConfigurationsInput) : Types::DescribeMatchmakingConfigurationsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MATCHMAKING_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMatchmakingConfigurationsOutput, "DescribeMatchmakingConfigurations")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves the details for
      # FlexMatch matchmaking rule sets. You can request all existing rule sets for the Region, or provide a
      # list of one or more rule set names. When requesting multiple items, use the pagination parameters to
      # retrieve results as a set of sequential pages. If successful, a rule set is returned for each
      # requested name. Learn more Build a rule set

      def describe_matchmaking_rule_sets(
        limit : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::DescribeMatchmakingRuleSetsOutput

        input = Types::DescribeMatchmakingRuleSetsInput.new(limit: limit, names: names, next_token: next_token)
        describe_matchmaking_rule_sets(input)
      end

      def describe_matchmaking_rule_sets(input : Types::DescribeMatchmakingRuleSetsInput) : Types::DescribeMatchmakingRuleSetsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MATCHMAKING_RULE_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMatchmakingRuleSetsOutput, "DescribeMatchmakingRuleSets")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves properties for one
      # or more player sessions. This action can be used in the following ways: To retrieve a specific
      # player session, provide the player session ID only. To retrieve all player sessions in a game
      # session, provide the game session ID only. To retrieve all player sessions for a specific player,
      # provide a player ID only. To request player sessions, specify either a player session ID, game
      # session ID, or player ID. You can filter this request by player session status. If you provide a
      # specific PlayerSessionId or PlayerId , Amazon GameLift Servers ignores the filter criteria. Use the
      # pagination parameters to retrieve results as a set of sequential pages. If successful, a
      # PlayerSession object is returned for each session that matches the request. Related actions All APIs
      # by task

      def describe_player_sessions(
        game_session_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        player_id : String? = nil,
        player_session_id : String? = nil,
        player_session_status_filter : String? = nil
      ) : Types::DescribePlayerSessionsOutput

        input = Types::DescribePlayerSessionsInput.new(game_session_id: game_session_id, limit: limit, next_token: next_token, player_id: player_id, player_session_id: player_session_id, player_session_status_filter: player_session_status_filter)
        describe_player_sessions(input)
      end

      def describe_player_sessions(input : Types::DescribePlayerSessionsInput) : Types::DescribePlayerSessionsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PLAYER_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePlayerSessionsOutput, "DescribePlayerSessions")
      end

      # This API works with the following fleet types: EC2 Retrieves a fleet's runtime configuration
      # settings. The runtime configuration determines which server processes run, and how, on computes in
      # the fleet. For managed EC2 fleets, the runtime configuration describes server processes that run on
      # each fleet instance. You can update a fleet's runtime configuration at any time using
      # UpdateRuntimeConfiguration . To get the current runtime configuration for a fleet, provide the fleet
      # ID. If successful, a RuntimeConfiguration object is returned for the requested fleet. If the
      # requested fleet has been deleted, the result set is empty. Learn more Setting up Amazon GameLift
      # Servers fleets Running multiple processes on a fleet

      def describe_runtime_configuration(
        fleet_id : String
      ) : Types::DescribeRuntimeConfigurationOutput

        input = Types::DescribeRuntimeConfigurationInput.new(fleet_id: fleet_id)
        describe_runtime_configuration(input)
      end

      def describe_runtime_configuration(input : Types::DescribeRuntimeConfigurationInput) : Types::DescribeRuntimeConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RUNTIME_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRuntimeConfigurationOutput, "DescribeRuntimeConfiguration")
      end

      # This API works with the following fleet types: EC2 Retrieves all scaling policies applied to a
      # fleet. To get a fleet's scaling policies, specify the fleet ID. You can filter this request by
      # policy status, such as to retrieve only active scaling policies. Use the pagination parameters to
      # retrieve results as a set of sequential pages. If successful, set of ScalingPolicy objects is
      # returned for the fleet. A fleet may have all of its scaling policies suspended. This operation does
      # not affect the status of the scaling policies, which remains ACTIVE.

      def describe_scaling_policies(
        fleet_id : String,
        limit : Int32? = nil,
        location : String? = nil,
        next_token : String? = nil,
        status_filter : String? = nil
      ) : Types::DescribeScalingPoliciesOutput

        input = Types::DescribeScalingPoliciesInput.new(fleet_id: fleet_id, limit: limit, location: location, next_token: next_token, status_filter: status_filter)
        describe_scaling_policies(input)
      end

      def describe_scaling_policies(input : Types::DescribeScalingPoliciesInput) : Types::DescribeScalingPoliciesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCALING_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeScalingPoliciesOutput, "DescribeScalingPolicies")
      end

      # This API works with the following fleet types: EC2 Retrieves properties for a Realtime script. To
      # request a script record, specify the script ID. If successful, an object containing the script
      # properties is returned. Learn more Amazon GameLift Servers Amazon GameLift Servers Realtime Related
      # actions All APIs by task

      def describe_script(
        script_id : String
      ) : Types::DescribeScriptOutput

        input = Types::DescribeScriptInput.new(script_id: script_id)
        describe_script(input)
      end

      def describe_script(input : Types::DescribeScriptInput) : Types::DescribeScriptOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCRIPT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeScriptOutput, "DescribeScript")
      end

      # This API works with the following fleet types: EC2 Retrieves valid VPC peering authorizations that
      # are pending for the Amazon Web Services account. This operation returns all VPC peering
      # authorizations and requests for peering. This includes those initiated and received by this account.
      # Related actions All APIs by task

      def describe_vpc_peering_authorizations : Types::DescribeVpcPeeringAuthorizationsOutput
        input = Types::DescribeVpcPeeringAuthorizationsInput.new
        describe_vpc_peering_authorizations(input)
      end

      def describe_vpc_peering_authorizations(input : Types::DescribeVpcPeeringAuthorizationsInput) : Types::DescribeVpcPeeringAuthorizationsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VPC_PEERING_AUTHORIZATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeVpcPeeringAuthorizationsOutput, "DescribeVpcPeeringAuthorizations")
      end

      # This API works with the following fleet types: EC2 Retrieves information on VPC peering connections.
      # Use this operation to get peering information for all fleets or for one specific fleet ID. To
      # retrieve connection information, call this operation from the Amazon Web Services account that is
      # used to manage the Amazon GameLift Servers fleets. Specify a fleet ID or leave the parameter empty
      # to retrieve all connection records. If successful, the retrieved information includes both active
      # and pending connections. Active connections identify the IpV4 CIDR block that the VPC uses to
      # connect. Related actions All APIs by task

      def describe_vpc_peering_connections(
        fleet_id : String? = nil
      ) : Types::DescribeVpcPeeringConnectionsOutput

        input = Types::DescribeVpcPeeringConnectionsInput.new(fleet_id: fleet_id)
        describe_vpc_peering_connections(input)
      end

      def describe_vpc_peering_connections(input : Types::DescribeVpcPeeringConnectionsInput) : Types::DescribeVpcPeeringConnectionsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VPC_PEERING_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeVpcPeeringConnectionsOutput, "DescribeVpcPeeringConnections")
      end

      # This API works with the following fleet types: EC2, Container Requests authorization to remotely
      # connect to a hosting resource in a Amazon GameLift Servers managed fleet. This operation is not used
      # with Amazon GameLift Servers Anywhere fleets. Request options Provide the fleet ID and compute name.
      # The compute name varies depending on the type of fleet. For a compute in a managed EC2 fleet,
      # provide an instance ID. Each instance in the fleet is a compute. For a compute in a managed
      # container fleet, provide a compute name. In a container fleet, each game server container group on a
      # fleet instance is assigned a compute name. Results If successful, this operation returns a set of
      # temporary Amazon Web Services credentials, including a two-part access key and a session token. With
      # a managed EC2 fleet (where compute type is EC2 ), use these credentials with Amazon EC2 Systems
      # Manager (SSM) to start a session with the compute. For more details, see Starting a session (CLI) in
      # the Amazon EC2 Systems Manager User Guide .

      def get_compute_access(
        compute_name : String,
        fleet_id : String
      ) : Types::GetComputeAccessOutput

        input = Types::GetComputeAccessInput.new(compute_name: compute_name, fleet_id: fleet_id)
        get_compute_access(input)
      end

      def get_compute_access(input : Types::GetComputeAccessInput) : Types::GetComputeAccessOutput
        request = Protocol::JsonRpc.build_request(Model::GET_COMPUTE_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComputeAccessOutput, "GetComputeAccess")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Requests an authentication
      # token from Amazon GameLift Servers for a compute resource in an Amazon GameLift Servers fleet. Game
      # servers that are running on the compute use this token to communicate with the Amazon GameLift
      # Servers service, such as when calling the Amazon GameLift Servers server SDK action InitSDK() .
      # Authentication tokens are valid for a limited time span, so you need to request a fresh token before
      # the current token expires. Request options For managed EC2 fleets (compute type EC2 ), auth token
      # retrieval and refresh is handled automatically. All game servers that are running on all fleet
      # instances have access to a valid auth token. For Anywhere fleets (compute type ANYWHERE ), if you're
      # using the Amazon GameLift Servers Agent, auth token retrieval and refresh is handled automatically
      # for any compute where the Agent is running. If you're not using the Agent, create a mechanism to
      # retrieve and refresh auth tokens for computes that are running game server processes. Learn more
      # Create an Anywhere fleet Test your integration Server SDK reference guides (for version 5.x)

      def get_compute_auth_token(
        compute_name : String,
        fleet_id : String
      ) : Types::GetComputeAuthTokenOutput

        input = Types::GetComputeAuthTokenInput.new(compute_name: compute_name, fleet_id: fleet_id)
        get_compute_auth_token(input)
      end

      def get_compute_auth_token(input : Types::GetComputeAuthTokenInput) : Types::GetComputeAuthTokenOutput
        request = Protocol::JsonRpc.build_request(Model::GET_COMPUTE_AUTH_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComputeAuthTokenOutput, "GetComputeAuthToken")
      end

      # This API works with the following fleet types: EC2 Retrieves the location of stored game session
      # logs for a specified game session on Amazon GameLift Servers managed fleets. When a game session is
      # terminated, Amazon GameLift Servers automatically stores the logs in Amazon S3 and retains them for
      # 14 days. Use this URL to download the logs. See the Amazon Web Services Service Limits page for
      # maximum log file sizes. Log files that exceed this limit are not saved. All APIs by task

      def get_game_session_log_url(
        game_session_id : String
      ) : Types::GetGameSessionLogUrlOutput

        input = Types::GetGameSessionLogUrlInput.new(game_session_id: game_session_id)
        get_game_session_log_url(input)
      end

      def get_game_session_log_url(input : Types::GetGameSessionLogUrlInput) : Types::GetGameSessionLogUrlOutput
        request = Protocol::JsonRpc.build_request(Model::GET_GAME_SESSION_LOG_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetGameSessionLogUrlOutput, "GetGameSessionLogUrl")
      end

      # This API works with the following fleet types: EC2 Requests authorization to remotely connect to an
      # instance in an Amazon GameLift Servers managed fleet. Use this operation to connect to instances
      # with game servers that use Amazon GameLift Servers server SDK 4.x or earlier. To connect to
      # instances with game servers that use server SDK 5.x or later, call
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetComputeAccess . To request access to
      # an instance, specify IDs for the instance and the fleet it belongs to. You can retrieve instance IDs
      # for a fleet by calling DescribeInstances with the fleet ID. If successful, this operation returns an
      # IP address and credentials. The returned credentials match the operating system of the instance, as
      # follows: For a Windows instance: returns a user name and secret (password) for use with a Windows
      # Remote Desktop client. For a Linux instance: returns a user name and secret (RSA private key) for
      # use with an SSH client. You must save the secret to a .pem file. If you're using the CLI, see the
      # example Get credentials for a Linux instance for tips on automatically saving the secret to a .pem
      # file. Learn more Remotely connect to fleet instances Debug fleet issues Related actions All APIs by
      # task

      def get_instance_access(
        fleet_id : String,
        instance_id : String
      ) : Types::GetInstanceAccessOutput

        input = Types::GetInstanceAccessInput.new(fleet_id: fleet_id, instance_id: instance_id)
        get_instance_access(input)
      end

      def get_instance_access(input : Types::GetInstanceAccessInput) : Types::GetInstanceAccessOutput
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstanceAccessOutput, "GetInstanceAccess")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves all aliases for
      # this Amazon Web Services account. You can filter the result set by alias name and/or routing
      # strategy type. Use the pagination parameters to retrieve results in sequential pages. Returned
      # aliases are not listed in any particular order. Related actions All APIs by task

      def list_aliases(
        limit : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        routing_strategy_type : String? = nil
      ) : Types::ListAliasesOutput

        input = Types::ListAliasesInput.new(limit: limit, name: name, next_token: next_token, routing_strategy_type: routing_strategy_type)
        list_aliases(input)
      end

      def list_aliases(input : Types::ListAliasesInput) : Types::ListAliasesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAliasesOutput, "ListAliases")
      end

      # This API works with the following fleet types: EC2 Retrieves build resources for all builds
      # associated with the Amazon Web Services account in use. You can limit results to builds that are in
      # a specific status by using the Status parameter. Use the pagination parameters to retrieve results
      # in Build resources are not listed in any particular order. Learn more Upload a Custom Server Build
      # All APIs by task

      def list_builds(
        limit : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListBuildsOutput

        input = Types::ListBuildsInput.new(limit: limit, next_token: next_token, status: status)
        list_builds(input)
      end

      def list_builds(input : Types::ListBuildsInput) : Types::ListBuildsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BUILDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBuildsOutput, "ListBuilds")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves information on the
      # compute resources in an Amazon GameLift Servers fleet. Use the pagination parameters to retrieve
      # results in a set of sequential pages. Request options Retrieve a list of all computes in a fleet.
      # Specify a fleet ID. Retrieve a list of all computes in a specific fleet location. Specify a fleet ID
      # and location. Results If successful, this operation returns information on a set of computes.
      # Depending on the type of fleet, the result includes the following information: For a managed EC2
      # fleet (compute type EC2 ), this operation returns information about the EC2 instance. Compute names
      # are EC2 instance IDs. For an Anywhere fleet (compute type ANYWHERE ), this operation returns compute
      # names and details from when the compute was registered with RegisterCompute . This includes
      # GameLiftServiceSdkEndpoint or GameLiftAgentEndpoint .

      def list_compute(
        fleet_id : String,
        compute_status : String? = nil,
        container_group_definition_name : String? = nil,
        limit : Int32? = nil,
        location : String? = nil,
        next_token : String? = nil
      ) : Types::ListComputeOutput

        input = Types::ListComputeInput.new(fleet_id: fleet_id, compute_status: compute_status, container_group_definition_name: container_group_definition_name, limit: limit, location: location, next_token: next_token)
        list_compute(input)
      end

      def list_compute(input : Types::ListComputeInput) : Types::ListComputeOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPUTE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComputeOutput, "ListCompute")
      end

      # This API works with the following fleet types: Container Retrieves a collection of container fleet
      # resources in an Amazon Web Services Region. For fleets that have multiple locations, this operation
      # retrieves fleets based on their home Region only. Request options Get a list of all fleets. Call
      # this operation without specifying a container group definition. Get a list of fleets filtered by
      # container group definition. Provide the container group definition name or ARN value. To get a list
      # of all Amazon GameLift Servers Realtime fleets with a specific configuration script, provide the
      # script ID. Use the pagination parameters to retrieve results as a set of sequential pages. If
      # successful, this operation returns a collection of container fleets that match the request
      # parameters. A NextToken value is also returned if there are more result pages to retrieve. Fleet IDs
      # are returned in no particular order.

      def list_container_fleets(
        container_group_definition_name : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListContainerFleetsOutput

        input = Types::ListContainerFleetsInput.new(container_group_definition_name: container_group_definition_name, limit: limit, next_token: next_token)
        list_container_fleets(input)
      end

      def list_container_fleets(input : Types::ListContainerFleetsInput) : Types::ListContainerFleetsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CONTAINER_FLEETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListContainerFleetsOutput, "ListContainerFleets")
      end

      # This API works with the following fleet types: Container Retrieves all versions of a container group
      # definition. Use the pagination parameters to retrieve results in a set of sequential pages. Request
      # options: Get all versions of a specified container group definition. Specify the container group
      # definition name or ARN value. (If the ARN value has a version number, it's ignored.) Results: If
      # successful, this operation returns the complete properties of a set of container group definition
      # versions that match the request. This operation returns the list of container group definitions in
      # descending version order (latest first). Learn more Manage a container group definition

      def list_container_group_definition_versions(
        name : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListContainerGroupDefinitionVersionsOutput

        input = Types::ListContainerGroupDefinitionVersionsInput.new(name: name, limit: limit, next_token: next_token)
        list_container_group_definition_versions(input)
      end

      def list_container_group_definition_versions(input : Types::ListContainerGroupDefinitionVersionsInput) : Types::ListContainerGroupDefinitionVersionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CONTAINER_GROUP_DEFINITION_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListContainerGroupDefinitionVersionsOutput, "ListContainerGroupDefinitionVersions")
      end

      # This API works with the following fleet types: Container Retrieves container group definitions for
      # the Amazon Web Services account and Amazon Web Services Region. Use the pagination parameters to
      # retrieve results in a set of sequential pages. This operation returns only the latest version of
      # each definition. To retrieve all versions of a container group definition, use
      # ListContainerGroupDefinitionVersions . Request options: Retrieve the most recent versions of all
      # container group definitions. Retrieve the most recent versions of all container group definitions,
      # filtered by type. Specify the container group type to filter on. Results: If successful, this
      # operation returns the complete properties of a set of container group definition versions that match
      # the request. This operation returns the list of container group definitions in no particular order.

      def list_container_group_definitions(
        container_group_type : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListContainerGroupDefinitionsOutput

        input = Types::ListContainerGroupDefinitionsInput.new(container_group_type: container_group_type, limit: limit, next_token: next_token)
        list_container_group_definitions(input)
      end

      def list_container_group_definitions(input : Types::ListContainerGroupDefinitionsInput) : Types::ListContainerGroupDefinitionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CONTAINER_GROUP_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListContainerGroupDefinitionsOutput, "ListContainerGroupDefinitions")
      end

      # This API works with the following fleet types: Container Retrieves a collection of container fleet
      # deployments in an Amazon Web Services Region. Use the pagination parameters to retrieve results as a
      # set of sequential pages. Request options Get a list of all deployments. Call this operation without
      # specifying a fleet ID. Get a list of all deployments for a fleet. Specify the container fleet ID or
      # ARN value. Results If successful, this operation returns a list of deployments that match the
      # request parameters. A NextToken value is also returned if there are more result pages to retrieve.
      # Deployments are returned starting with the latest.

      def list_fleet_deployments(
        fleet_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFleetDeploymentsOutput

        input = Types::ListFleetDeploymentsInput.new(fleet_id: fleet_id, limit: limit, next_token: next_token)
        list_fleet_deployments(input)
      end

      def list_fleet_deployments(input : Types::ListFleetDeploymentsInput) : Types::ListFleetDeploymentsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_FLEET_DEPLOYMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFleetDeploymentsOutput, "ListFleetDeployments")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves a collection of
      # fleet resources in an Amazon Web Services Region. You can filter the result set to find only those
      # fleets that are deployed with a specific build or script. For fleets that have multiple locations,
      # this operation retrieves fleets based on their home Region only. You can use operation in the
      # following ways: To get a list of all fleets in a Region, don't provide a build or script identifier.
      # To get a list of all fleets where a specific game build is deployed, provide the build ID. To get a
      # list of all Amazon GameLift Servers Realtime fleets with a specific configuration script, provide
      # the script ID. Use the pagination parameters to retrieve results as a set of sequential pages. If
      # successful, this operation returns a list of fleet IDs that match the request parameters. A
      # NextToken value is also returned if there are more result pages to retrieve. Fleet IDs are returned
      # in no particular order.

      def list_fleets(
        build_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        script_id : String? = nil
      ) : Types::ListFleetsOutput

        input = Types::ListFleetsInput.new(build_id: build_id, limit: limit, next_token: next_token, script_id: script_id)
        list_fleets(input)
      end

      def list_fleets(input : Types::ListFleetsInput) : Types::ListFleetsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_FLEETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFleetsOutput, "ListFleets")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Lists a game server groups.

      def list_game_server_groups(
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGameServerGroupsOutput

        input = Types::ListGameServerGroupsInput.new(limit: limit, next_token: next_token)
        list_game_server_groups(input)
      end

      def list_game_server_groups(input : Types::ListGameServerGroupsInput) : Types::ListGameServerGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_GAME_SERVER_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGameServerGroupsOutput, "ListGameServerGroups")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Retrieves information on all game
      # servers that are currently active in a specified game server group. You can opt to sort the list by
      # game server age. Use the pagination parameters to retrieve results in a set of sequential segments.
      # Learn more Amazon GameLift Servers FleetIQ Guide

      def list_game_servers(
        game_server_group_name : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListGameServersOutput

        input = Types::ListGameServersInput.new(game_server_group_name: game_server_group_name, limit: limit, next_token: next_token, sort_order: sort_order)
        list_game_servers(input)
      end

      def list_game_servers(input : Types::ListGameServersInput) : Types::ListGameServersOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_GAME_SERVERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGameServersOutput, "ListGameServers")
      end

      # This API works with the following fleet types: Anywhere Lists all custom and Amazon Web Services
      # locations where Amazon GameLift Servers can host game servers. Note that if you call this API using
      # a location that doesn't have a service endpoint, such as one that can only be a remote location in a
      # multi-location fleet, the API returns an error. Consult the table of supported locations in Amazon
      # GameLift Servers service locations to identify home Regions that support single and multi-location
      # fleets. Learn more Service locations

      def list_locations(
        filters : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLocationsOutput

        input = Types::ListLocationsInput.new(filters: filters, limit: limit, next_token: next_token)
        list_locations(input)
      end

      def list_locations(input : Types::ListLocationsInput) : Types::ListLocationsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_LOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLocationsOutput, "ListLocations")
      end

      # This API works with the following fleet types: EC2 Retrieves script records for all Realtime scripts
      # that are associated with the Amazon Web Services account in use. Learn more Amazon GameLift Servers
      # Amazon GameLift Servers Realtime Related actions All APIs by task

      def list_scripts(
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListScriptsOutput

        input = Types::ListScriptsInput.new(limit: limit, next_token: next_token)
        list_scripts(input)
      end

      def list_scripts(input : Types::ListScriptsInput) : Types::ListScriptsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SCRIPTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListScriptsOutput, "ListScripts")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves all tags assigned
      # to a Amazon GameLift Servers resource. Use resource tags to organize Amazon Web Services resources
      # for a range of purposes. This operation handles the permissions necessary to manage tags for Amazon
      # GameLift Servers resources that support tagging. To list tags for a resource, specify the unique ARN
      # value for the resource. Learn more Tagging Amazon Web Services Resources in the Amazon Web Services
      # General Reference Amazon Web Services Tagging Strategies Related actions All APIs by task

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

      # This API works with the following fleet types: EC2 Creates or updates a scaling policy for a fleet.
      # Scaling policies are used to automatically scale a fleet's hosting capacity to meet player demand.
      # An active scaling policy instructs Amazon GameLift Servers to track a fleet metric and automatically
      # change the fleet's capacity when a certain threshold is reached. There are two types of scaling
      # policies: target-based and rule-based. Use a target-based policy to quickly and efficiently manage
      # fleet scaling; this option is the most commonly used. Use rule-based policies when you need to exert
      # fine-grained control over auto-scaling. Fleets can have multiple scaling policies of each type in
      # force at the same time; you can have one target-based policy, one or multiple rule-based scaling
      # policies, or both. We recommend caution, however, because multiple auto-scaling policies can have
      # unintended consequences. Learn more about how to work with auto-scaling in Set Up Fleet Automatic
      # Scaling . Target-based policy A target-based policy tracks a single metric:
      # PercentAvailableGameSessions. This metric tells us how much of a fleet's hosting capacity is ready
      # to host game sessions but is not currently in use. This is the fleet's buffer; it measures the
      # additional player demand that the fleet could handle at current capacity. With a target-based
      # policy, you set your ideal buffer size and leave it to Amazon GameLift Servers to take whatever
      # action is needed to maintain that target. For example, you might choose to maintain a 10% buffer for
      # a fleet that has the capacity to host 100 simultaneous game sessions. This policy tells Amazon
      # GameLift Servers to take action whenever the fleet's available capacity falls below or rises above
      # 10 game sessions. Amazon GameLift Servers will start new instances or stop unused instances in order
      # to return to the 10% buffer. To create or update a target-based policy, specify a fleet ID and name,
      # and set the policy type to "TargetBased". Specify the metric to track (PercentAvailableGameSessions)
      # and reference a TargetConfiguration object with your desired buffer value. Exclude all other
      # parameters. On a successful request, the policy name is returned. The scaling policy is
      # automatically in force as soon as it's successfully created. If the fleet's auto-scaling actions are
      # temporarily suspended, the new policy will be in force once the fleet actions are restarted.
      # Rule-based policy A rule-based policy tracks specified fleet metric, sets a threshold value, and
      # specifies the type of action to initiate when triggered. With a rule-based policy, you can select
      # from several available fleet metrics. Each policy specifies whether to scale up or scale down (and
      # by how much), so you need one policy for each type of action. For example, a policy may make the
      # following statement: "If the percentage of idle instances is greater than 20% for more than 15
      # minutes, then reduce the fleet capacity by 10%." A policy's rule statement has the following
      # structure: If [MetricName] is [ComparisonOperator] [Threshold] for [EvaluationPeriods] minutes, then
      # [ScalingAdjustmentType] to/by [ScalingAdjustment] . To implement the example, the rule statement
      # would look like this: If [PercentIdleInstances] is [GreaterThanThreshold] [20] for [15] minutes,
      # then [PercentChangeInCapacity] to/by [10] . To create or update a scaling policy, specify a unique
      # combination of name and fleet ID, and set the policy type to "RuleBased". Specify the parameter
      # values for a policy rule statement. On a successful request, the policy name is returned. Scaling
      # policies are automatically in force as soon as they're successfully created. If the fleet's
      # auto-scaling actions are temporarily suspended, the new policy will be in force once the fleet
      # actions are restarted.

      def put_scaling_policy(
        fleet_id : String,
        metric_name : String,
        name : String,
        comparison_operator : String? = nil,
        evaluation_periods : Int32? = nil,
        policy_type : String? = nil,
        scaling_adjustment : Int32? = nil,
        scaling_adjustment_type : String? = nil,
        target_configuration : Types::TargetConfiguration? = nil,
        threshold : Float64? = nil
      ) : Types::PutScalingPolicyOutput

        input = Types::PutScalingPolicyInput.new(fleet_id: fleet_id, metric_name: metric_name, name: name, comparison_operator: comparison_operator, evaluation_periods: evaluation_periods, policy_type: policy_type, scaling_adjustment: scaling_adjustment, scaling_adjustment_type: scaling_adjustment_type, target_configuration: target_configuration, threshold: threshold)
        put_scaling_policy(input)
      end

      def put_scaling_policy(input : Types::PutScalingPolicyInput) : Types::PutScalingPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutScalingPolicyOutput, "PutScalingPolicy")
      end

      # This API works with the following fleet types: Anywhere, Container Registers a compute resource in
      # an Amazon GameLift Servers Anywhere fleet. For an Anywhere fleet that's running the Amazon GameLift
      # Servers Agent, the Agent handles all compute registry tasks for you. For an Anywhere fleet that
      # doesn't use the Agent, call this operation to register fleet computes. To register a compute, give
      # the compute a name (must be unique within the fleet) and specify the compute resource's DNS name or
      # IP address. Provide a fleet ID and a fleet location to associate with the compute being registered.
      # You can optionally include the path to a TLS certificate on the compute resource. If successful,
      # this operation returns compute details, including an Amazon GameLift Servers SDK endpoint or Agent
      # endpoint. Game server processes running on the compute can use this endpoint to communicate with the
      # Amazon GameLift Servers service. Each server process includes the SDK endpoint in its call to the
      # Amazon GameLift Servers server SDK action InitSDK() . To view compute details, call DescribeCompute
      # with the compute name. Learn more Create an Anywhere fleet Test your integration Server SDK
      # reference guides (for version 5.x)

      def register_compute(
        compute_name : String,
        fleet_id : String,
        certificate_path : String? = nil,
        dns_name : String? = nil,
        ip_address : String? = nil,
        location : String? = nil
      ) : Types::RegisterComputeOutput

        input = Types::RegisterComputeInput.new(compute_name: compute_name, fleet_id: fleet_id, certificate_path: certificate_path, dns_name: dns_name, ip_address: ip_address, location: location)
        register_compute(input)
      end

      def register_compute(input : Types::RegisterComputeInput) : Types::RegisterComputeOutput
        request = Protocol::JsonRpc.build_request(Model::REGISTER_COMPUTE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterComputeOutput, "RegisterCompute")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Creates a new game server resource and
      # notifies Amazon GameLift Servers FleetIQ that the game server is ready to host gameplay and players.
      # This operation is called by a game server process that is running on an instance in a game server
      # group. Registering game servers enables Amazon GameLift Servers FleetIQ to track available game
      # servers and enables game clients and services to claim a game server for a new game session. To
      # register a game server, identify the game server group and instance where the game server is
      # running, and provide a unique identifier for the game server. You can also include connection and
      # game server data. Once a game server is successfully registered, it is put in status AVAILABLE . A
      # request to register a game server may fail if the instance it is running on is in the process of
      # shutting down as part of instance balancing or scale-down activity. Learn more Amazon GameLift
      # Servers FleetIQ Guide

      def register_game_server(
        game_server_group_name : String,
        game_server_id : String,
        instance_id : String,
        connection_info : String? = nil,
        game_server_data : String? = nil
      ) : Types::RegisterGameServerOutput

        input = Types::RegisterGameServerInput.new(game_server_group_name: game_server_group_name, game_server_id: game_server_id, instance_id: instance_id, connection_info: connection_info, game_server_data: game_server_data)
        register_game_server(input)
      end

      def register_game_server(input : Types::RegisterGameServerInput) : Types::RegisterGameServerOutput
        request = Protocol::JsonRpc.build_request(Model::REGISTER_GAME_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterGameServerOutput, "RegisterGameServer")
      end

      # This API works with the following fleet types: EC2 Retrieves a fresh set of credentials for use when
      # uploading a new set of game build files to Amazon GameLift Servers's Amazon S3. This is done as part
      # of the build creation process; see CreateBuild . To request new credentials, specify the build ID as
      # returned with an initial CreateBuild request. If successful, a new set of credentials are returned,
      # along with the S3 storage location associated with the build ID. Learn more Create a Build with
      # Files in S3 All APIs by task

      def request_upload_credentials(
        build_id : String
      ) : Types::RequestUploadCredentialsOutput

        input = Types::RequestUploadCredentialsInput.new(build_id: build_id)
        request_upload_credentials(input)
      end

      def request_upload_credentials(input : Types::RequestUploadCredentialsInput) : Types::RequestUploadCredentialsOutput
        request = Protocol::JsonRpc.build_request(Model::REQUEST_UPLOAD_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RequestUploadCredentialsOutput, "RequestUploadCredentials")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Attempts to retrieve a fleet
      # ID that is associated with an alias. Specify a unique alias identifier. If the alias has a SIMPLE
      # routing strategy, Amazon GameLift Servers returns a fleet ID. If the alias has a TERMINAL routing
      # strategy, the result is a TerminalRoutingStrategyException . Related actions All APIs by task

      def resolve_alias(
        alias_id : String
      ) : Types::ResolveAliasOutput

        input = Types::ResolveAliasInput.new(alias_id: alias_id)
        resolve_alias(input)
      end

      def resolve_alias(input : Types::ResolveAliasInput) : Types::ResolveAliasOutput
        request = Protocol::JsonRpc.build_request(Model::RESOLVE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResolveAliasOutput, "ResolveAlias")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Reinstates activity on a game server
      # group after it has been suspended. A game server group might be suspended by the
      # SuspendGameServerGroup operation, or it might be suspended involuntarily due to a configuration
      # problem. In the second case, you can manually resume activity on the group once the configuration
      # problem has been resolved. Refer to the game server group status and status reason for more
      # information on why group activity is suspended. To resume activity, specify a game server group ARN
      # and the type of activity to be resumed. If successful, a GameServerGroup object is returned showing
      # that the resumed activity is no longer listed in SuspendedActions . Learn more Amazon GameLift
      # Servers FleetIQ Guide

      def resume_game_server_group(
        game_server_group_name : String,
        resume_actions : Array(String)
      ) : Types::ResumeGameServerGroupOutput

        input = Types::ResumeGameServerGroupInput.new(game_server_group_name: game_server_group_name, resume_actions: resume_actions)
        resume_game_server_group(input)
      end

      def resume_game_server_group(input : Types::ResumeGameServerGroupInput) : Types::ResumeGameServerGroupOutput
        request = Protocol::JsonRpc.build_request(Model::RESUME_GAME_SERVER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResumeGameServerGroupOutput, "ResumeGameServerGroup")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Retrieves all active game
      # sessions that match a set of search criteria and sorts them into a specified order. This operation
      # is not designed to continually track game session status because that practice can cause you to
      # exceed your API limit and generate errors. Instead, configure an Amazon Simple Notification Service
      # (Amazon SNS) topic to receive notifications from a matchmaker or a game session placement queue.
      # When searching for game sessions, you specify exactly where you want to search and provide a search
      # filter expression, a sort expression, or both. A search request can search only one fleet, but it
      # can search all of a fleet's locations. This operation can be used in the following ways: To search
      # all game sessions that are currently running on all locations in a fleet, provide a fleet or alias
      # ID. This approach returns game sessions in the fleet's home Region and all remote locations that fit
      # the search criteria. To search all game sessions that are currently running on a specific fleet
      # location, provide a fleet or alias ID and a location name. For location, you can specify a fleet's
      # home Region or any remote location. Use the pagination parameters to retrieve results as a set of
      # sequential pages. If successful, a GameSession object is returned for each game session that matches
      # the request. Search finds game sessions that are in ACTIVE status only. To retrieve information on
      # game sessions in other statuses, use DescribeGameSessions . To set search and sort criteria, create
      # a filter expression using the following game session attributes. For game session search examples,
      # see the Examples section of this topic. gameSessionId -- A unique identifier for the game session.
      # You can use either a GameSessionId or GameSessionArn value. gameSessionName -- Name assigned to a
      # game session. Game session names do not need to be unique to a game session. gameSessionProperties
      # -- A set of key-value pairs that can store custom data in a game session. For example: {"Key":
      # "difficulty", "Value": "novice"} . The filter expression must specify the
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameProperty -- a Key and a string
      # Value to search for the game sessions. For example, to search for the above key-value pair, specify
      # the following search filter: gameSessionProperties.difficulty = "novice" . All game property values
      # are searched as strings. For examples of searching game sessions, see the ones below, and also see
      # Search game sessions by game property . maximumSessions -- Maximum number of player sessions allowed
      # for a game session. creationTimeMillis -- Value indicating when a game session was created. It is
      # expressed in Unix time as milliseconds. playerSessionCount -- Number of players currently connected
      # to a game session. This value changes rapidly as players join the session or drop out.
      # hasAvailablePlayerSessions -- Boolean value indicating whether a game session has reached its
      # maximum number of players. It is highly recommended that all search requests include this filter
      # attribute to optimize search performance and return only sessions that players can join. Returned
      # values for playerSessionCount and hasAvailablePlayerSessions change quickly as players join sessions
      # and others drop out. Results should be considered a snapshot in time. Be sure to refresh search
      # results often, and handle sessions that fill up before a player can join. All APIs by task

      def search_game_sessions(
        alias_id : String? = nil,
        filter_expression : String? = nil,
        fleet_id : String? = nil,
        limit : Int32? = nil,
        location : String? = nil,
        next_token : String? = nil,
        sort_expression : String? = nil
      ) : Types::SearchGameSessionsOutput

        input = Types::SearchGameSessionsInput.new(alias_id: alias_id, filter_expression: filter_expression, fleet_id: fleet_id, limit: limit, location: location, next_token: next_token, sort_expression: sort_expression)
        search_game_sessions(input)
      end

      def search_game_sessions(input : Types::SearchGameSessionsInput) : Types::SearchGameSessionsOutput
        request = Protocol::JsonRpc.build_request(Model::SEARCH_GAME_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchGameSessionsOutput, "SearchGameSessions")
      end

      # This API works with the following fleet types: EC2, Container Resumes certain types of activity on
      # fleet instances that were suspended with StopFleetActions . For multi-location fleets, fleet actions
      # are managed separately for each location. Currently, this operation is used to restart a fleet's
      # auto-scaling activity. This operation can be used in the following ways: To restart actions on
      # instances in the fleet's home Region, provide a fleet ID and the type of actions to resume. To
      # restart actions on instances in one of the fleet's remote locations, provide a fleet ID, a location
      # name, and the type of actions to resume. If successful, Amazon GameLift Servers once again initiates
      # scaling events as triggered by the fleet's scaling policies. If actions on the fleet location were
      # never stopped, this operation will have no effect. Learn more Setting up Amazon GameLift Servers
      # fleets

      def start_fleet_actions(
        actions : Array(String),
        fleet_id : String,
        location : String? = nil
      ) : Types::StartFleetActionsOutput

        input = Types::StartFleetActionsInput.new(actions: actions, fleet_id: fleet_id, location: location)
        start_fleet_actions(input)
      end

      def start_fleet_actions(input : Types::StartFleetActionsInput) : Types::StartFleetActionsOutput
        request = Protocol::JsonRpc.build_request(Model::START_FLEET_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFleetActionsOutput, "StartFleetActions")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Makes a request to start a
      # new game session using a game session queue. When processing a placement request, Amazon GameLift
      # Servers looks for the best possible available resource to host the game session, based on how the
      # queue is configured to prioritize factors such as resource cost, latency, and location. After
      # selecting an available resource, Amazon GameLift Servers prompts the resource to start a game
      # session. A placement request can include a list of players to create a set of player sessions. The
      # request can also include information to pass to the new game session, such as to specify a game map
      # or other options. Request options Use this operation to make the following types of requests.
      # Request a placement using the queue's default prioritization process (see the default prioritization
      # described in PriorityConfiguration ). Include these required parameters: GameSessionQueueName
      # MaximumPlayerSessionCount PlacementID Request a placement and prioritize based on latency. Include
      # these parameters: Required parameters GameSessionQueueName , MaximumPlayerSessionCount , PlacementID
      # . PlayerLatencies . Include a set of latency values for destinations in the queue. When a request
      # includes latency data, Amazon GameLift Servers automatically reorder the queue's locations priority
      # list based on lowest available latency values. If a request includes latency data for multiple
      # players, Amazon GameLift Servers calculates each location's average latency for all players and
      # reorders to find the lowest latency across all players. Don't include PriorityConfigurationOverride
      # . Prioritize based on a custom list of locations. If you're using a queue that's configured to
      # prioritize location first (see PriorityConfiguration for game session queues), you can optionally
      # use the PriorityConfigurationOverride parameter to substitute a different location priority list for
      # this placement request. Amazon GameLift Servers searches each location on the priority override list
      # to find an available hosting resource for the new game session. Specify a fallback strategy to use
      # in the event that Amazon GameLift Servers fails to place the game session in any of the locations on
      # the override list. Request a placement and prioritized based on a custom list of locations. You can
      # request new player sessions for a group of players. Include the DesiredPlayerSessions parameter and
      # include at minimum a unique player ID for each. You can also include player-specific data to pass to
      # the new game session. Result If successful, this operation generates a new game session placement
      # request and adds it to the game session queue for processing. You can track the status of individual
      # placement requests by calling DescribeGameSessionPlacement or by monitoring queue notifications.
      # When the request status is FULFILLED , a new game session has started and the placement request is
      # updated with connection information for the game session (IP address and port). If the request
      # included player session data, Amazon GameLift Servers creates a player session for each player ID in
      # the request. The request results in a InvalidRequestException in the following situations: If the
      # request includes both PlayerLatencies and PriorityConfigurationOverride parameters. If the request
      # includes the PriorityConfigurationOverride parameter and specifies a queue that doesn't prioritize
      # locations. Amazon GameLift Servers continues to retry each placement request until it reaches the
      # queue's timeout setting. If a request times out, you can resubmit the request to the same queue or
      # try a different queue.

      def start_game_session_placement(
        game_session_queue_name : String,
        maximum_player_session_count : Int32,
        placement_id : String,
        desired_player_sessions : Array(Types::DesiredPlayerSession)? = nil,
        game_properties : Array(Types::GameProperty)? = nil,
        game_session_data : String? = nil,
        game_session_name : String? = nil,
        player_latencies : Array(Types::PlayerLatency)? = nil,
        priority_configuration_override : Types::PriorityConfigurationOverride? = nil
      ) : Types::StartGameSessionPlacementOutput

        input = Types::StartGameSessionPlacementInput.new(game_session_queue_name: game_session_queue_name, maximum_player_session_count: maximum_player_session_count, placement_id: placement_id, desired_player_sessions: desired_player_sessions, game_properties: game_properties, game_session_data: game_session_data, game_session_name: game_session_name, player_latencies: player_latencies, priority_configuration_override: priority_configuration_override)
        start_game_session_placement(input)
      end

      def start_game_session_placement(input : Types::StartGameSessionPlacementInput) : Types::StartGameSessionPlacementOutput
        request = Protocol::JsonRpc.build_request(Model::START_GAME_SESSION_PLACEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartGameSessionPlacementOutput, "StartGameSessionPlacement")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Finds new players to fill
      # open slots in currently running game sessions. The backfill match process is essentially identical
      # to the process of forming new matches. Backfill requests use the same matchmaker that was used to
      # make the original match, and they provide matchmaking data for all players currently in the game
      # session. FlexMatch uses this information to select new players so that backfilled match continues to
      # meet the original match requirements. When using FlexMatch with Amazon GameLift Servers managed
      # hosting, you can request a backfill match from a client service by calling this operation with a
      # GameSessions ID. You also have the option of making backfill requests directly from your game
      # server. In response to a request, FlexMatch creates player sessions for the new players, updates the
      # GameSession resource, and sends updated matchmaking data to the game server. You can request a
      # backfill match at any point after a game session is started. Each game session can have only one
      # active backfill request at a time; a subsequent request automatically replaces the earlier request.
      # When using FlexMatch as a standalone component, request a backfill match by calling this operation
      # without a game session identifier. As with newly formed matches, matchmaking results are returned in
      # a matchmaking event so that your game can update the game session that is being backfilled. To
      # request a backfill match, specify a unique ticket ID, the original matchmaking configuration, and
      # matchmaking data for all current players in the game session being backfilled. Optionally, specify
      # the GameSession ARN. If successful, a match backfill ticket is created and returned with status set
      # to QUEUED. Track the status of backfill tickets using the same method for tracking tickets for new
      # matches. Only game sessions created by FlexMatch are supported for match backfill. Learn more
      # Backfill existing games with FlexMatch Matchmaking events (reference) How Amazon GameLift Servers
      # FlexMatch works

      def start_match_backfill(
        configuration_name : String,
        players : Array(Types::Player),
        game_session_arn : String? = nil,
        ticket_id : String? = nil
      ) : Types::StartMatchBackfillOutput

        input = Types::StartMatchBackfillInput.new(configuration_name: configuration_name, players: players, game_session_arn: game_session_arn, ticket_id: ticket_id)
        start_match_backfill(input)
      end

      def start_match_backfill(input : Types::StartMatchBackfillInput) : Types::StartMatchBackfillOutput
        request = Protocol::JsonRpc.build_request(Model::START_MATCH_BACKFILL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMatchBackfillOutput, "StartMatchBackfill")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Uses FlexMatch to create a
      # game match for a group of players based on custom matchmaking rules. With games that use Amazon
      # GameLift Servers managed hosting, this operation also triggers Amazon GameLift Servers to find
      # hosting resources and start a new game session for the new match. Each matchmaking request includes
      # information on one or more players and specifies the FlexMatch matchmaker to use. When a request is
      # for multiple players, FlexMatch attempts to build a match that includes all players in the request,
      # placing them in the same team and finding additional players as needed to fill the match. To start
      # matchmaking, provide a unique ticket ID, specify a matchmaking configuration, and include the
      # players to be matched. You must also include any player attributes that are required by the
      # matchmaking configuration's rule set. If successful, a matchmaking ticket is returned with status
      # set to QUEUED . Track matchmaking events to respond as needed and acquire game session connection
      # information for successfully completed matches. Ticket status updates are tracked using event
      # notification through Amazon Simple Notification Service, which is defined in the matchmaking
      # configuration. Learn more Add FlexMatch to a game client Set Up FlexMatch event notification How
      # Amazon GameLift Servers FlexMatch works

      def start_matchmaking(
        configuration_name : String,
        players : Array(Types::Player),
        ticket_id : String? = nil
      ) : Types::StartMatchmakingOutput

        input = Types::StartMatchmakingInput.new(configuration_name: configuration_name, players: players, ticket_id: ticket_id)
        start_matchmaking(input)
      end

      def start_matchmaking(input : Types::StartMatchmakingInput) : Types::StartMatchmakingOutput
        request = Protocol::JsonRpc.build_request(Model::START_MATCHMAKING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMatchmakingOutput, "StartMatchmaking")
      end

      # This API works with the following fleet types: EC2, Container Suspends certain types of activity in
      # a fleet location. Currently, this operation is used to stop auto-scaling activity. For
      # multi-location fleets, fleet actions are managed separately for each location. Stopping fleet
      # actions has several potential purposes. It allows you to temporarily stop auto-scaling activity but
      # retain your scaling policies for use in the future. For multi-location fleets, you can set up
      # fleet-wide auto-scaling, and then opt out of it for certain locations. This operation can be used in
      # the following ways: To stop actions on instances in the fleet's home Region, provide a fleet ID and
      # the type of actions to suspend. To stop actions on instances in one of the fleet's remote locations,
      # provide a fleet ID, a location name, and the type of actions to suspend. If successful, Amazon
      # GameLift Servers no longer initiates scaling events except in response to manual changes using
      # UpdateFleetCapacity . To restart fleet actions again, call StartFleetActions . Learn more Setting up
      # Amazon GameLift Servers Fleets

      def stop_fleet_actions(
        actions : Array(String),
        fleet_id : String,
        location : String? = nil
      ) : Types::StopFleetActionsOutput

        input = Types::StopFleetActionsInput.new(actions: actions, fleet_id: fleet_id, location: location)
        stop_fleet_actions(input)
      end

      def stop_fleet_actions(input : Types::StopFleetActionsInput) : Types::StopFleetActionsOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_FLEET_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopFleetActionsOutput, "StopFleetActions")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Cancels a game session
      # placement that's in PENDING status. To stop a placement, provide the placement ID value. Results If
      # successful, this operation removes the placement request from the queue and moves the
      # GameSessionPlacement to CANCELLED status. This operation results in an InvalidRequestExecption (400)
      # error if a game session has already been created for this placement. You can clean up an unneeded
      # game session by calling TerminateGameSession .

      def stop_game_session_placement(
        placement_id : String
      ) : Types::StopGameSessionPlacementOutput

        input = Types::StopGameSessionPlacementInput.new(placement_id: placement_id)
        stop_game_session_placement(input)
      end

      def stop_game_session_placement(input : Types::StopGameSessionPlacementInput) : Types::StopGameSessionPlacementOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_GAME_SESSION_PLACEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopGameSessionPlacementOutput, "StopGameSessionPlacement")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Cancels a matchmaking ticket
      # or match backfill ticket that is currently being processed. To stop the matchmaking operation,
      # specify the ticket ID. If successful, work on the ticket is stopped, and the ticket status is
      # changed to CANCELLED . This call is also used to turn off automatic backfill for an individual game
      # session. This is for game sessions that are created with a matchmaking configuration that has
      # automatic backfill enabled. The ticket ID is included in the MatchmakerData of an updated game
      # session object, which is provided to the game server. If the operation is successful, the service
      # sends back an empty JSON struct with the HTTP 200 response (not an empty HTTP body). Learn more Add
      # FlexMatch to a game client

      def stop_matchmaking(
        ticket_id : String
      ) : Types::StopMatchmakingOutput

        input = Types::StopMatchmakingInput.new(ticket_id: ticket_id)
        stop_matchmaking(input)
      end

      def stop_matchmaking(input : Types::StopMatchmakingInput) : Types::StopMatchmakingOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_MATCHMAKING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopMatchmakingOutput, "StopMatchmaking")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Temporarily stops activity on a game
      # server group without terminating instances or the game server group. You can restart activity by
      # calling ResumeGameServerGroup . You can suspend the following activity: Instance type replacement -
      # This activity evaluates the current game hosting viability of all Spot instance types that are
      # defined for the game server group. It updates the Auto Scaling group to remove nonviable Spot
      # Instance types, which have a higher chance of game server interruptions. It then balances capacity
      # across the remaining viable Spot Instance types. When this activity is suspended, the Auto Scaling
      # group continues with its current balance, regardless of viability. Instance protection, utilization
      # metrics, and capacity scaling activities continue to be active. To suspend activity, specify a game
      # server group ARN and the type of activity to be suspended. If successful, a GameServerGroup object
      # is returned showing that the activity is listed in SuspendedActions . Learn more Amazon GameLift
      # Servers FleetIQ Guide

      def suspend_game_server_group(
        game_server_group_name : String,
        suspend_actions : Array(String)
      ) : Types::SuspendGameServerGroupOutput

        input = Types::SuspendGameServerGroupInput.new(game_server_group_name: game_server_group_name, suspend_actions: suspend_actions)
        suspend_game_server_group(input)
      end

      def suspend_game_server_group(input : Types::SuspendGameServerGroupInput) : Types::SuspendGameServerGroupOutput
        request = Protocol::JsonRpc.build_request(Model::SUSPEND_GAME_SERVER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SuspendGameServerGroupOutput, "SuspendGameServerGroup")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Assigns a tag to an Amazon
      # GameLift Servers resource. You can use tags to organize resources, create IAM permissions policies
      # to manage access to groups of resources, customize Amazon Web Services cost breakdowns, and more.
      # This operation handles the permissions necessary to manage tags for Amazon GameLift Servers
      # resources that support tagging. To add a tag to a resource, specify the unique ARN value for the
      # resource and provide a tag list containing one or more tags. The operation succeeds even if the list
      # includes tags that are already assigned to the resource. Learn more Tagging Amazon Web Services
      # Resources in the Amazon Web Services General Reference Amazon Web Services Tagging Strategies
      # Related actions All APIs by task

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

      # This API works with the following fleet types: EC2, Anywhere, Container Ends a game session that's
      # currently in progress. Use this action to terminate any game session that isn't in ERROR status.
      # Terminating a game session is the most efficient way to free up a server process when it's hosting a
      # game session that's in a bad state or not ending properly. You can use this action to terminate a
      # game session that's being hosted on any type of Amazon GameLift Servers fleet compute, including
      # computes for managed EC2, managed container, and Anywhere fleets. The game server must be integrated
      # with Amazon GameLift Servers server SDK 5.x or greater. Request options Request termination for a
      # single game session. Provide the game session ID and the termination mode. There are two potential
      # methods for terminating a game session: Initiate a graceful termination using the normal game
      # session shutdown sequence. With this mode, the Amazon GameLift Servers service prompts the server
      # process that's hosting the game session by calling the server SDK callback method
      # OnProcessTerminate() . The callback implementation is part of the custom game server code. It might
      # involve a variety of actions to gracefully end a game session, such as notifying players, before
      # stopping the server process. Force an immediate game session termination. With this mode, the Amazon
      # GameLift Servers service takes action to stop the server process, which ends the game session
      # without the normal game session shutdown sequence. Results If successful, game session termination
      # is initiated. During this activity, the game session status is changed to TERMINATING . When
      # completed, the server process that was hosting the game session has been stopped and replaced with a
      # new server process that's ready to host a new game session. The old game session's status is changed
      # to TERMINATED with a status reason that indicates the termination method used. Learn more Add Amazon
      # GameLift Servers to your game server Amazon GameLift Servers server SDK 5 reference guide for
      # OnProcessTerminate() ( C++ ) ( C# ) ( Unreal ) ( Go )

      def terminate_game_session(
        game_session_id : String,
        termination_mode : String
      ) : Types::TerminateGameSessionOutput

        input = Types::TerminateGameSessionInput.new(game_session_id: game_session_id, termination_mode: termination_mode)
        terminate_game_session(input)
      end

      def terminate_game_session(input : Types::TerminateGameSessionInput) : Types::TerminateGameSessionOutput
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_GAME_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TerminateGameSessionOutput, "TerminateGameSession")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Removes a tag assigned to a
      # Amazon GameLift Servers resource. You can use resource tags to organize Amazon Web Services
      # resources for a range of purposes. This operation handles the permissions necessary to manage tags
      # for Amazon GameLift Servers resources that support tagging. To remove a tag from a resource, specify
      # the unique ARN value for the resource and provide a string list containing one or more tags to
      # remove. This operation succeeds even if the list includes tags that aren't assigned to the resource.
      # Learn more Tagging Amazon Web Services Resources in the Amazon Web Services General Reference Amazon
      # Web Services Tagging Strategies Related actions All APIs by task

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

      # This API works with the following fleet types: EC2, Anywhere, Container Updates properties for an
      # alias. Specify the unique identifier of the alias to be updated and the new property values. When
      # reassigning an alias to a new fleet, provide an updated routing strategy. If successful, the updated
      # alias record is returned. Related actions All APIs by task

      def update_alias(
        alias_id : String,
        description : String? = nil,
        name : String? = nil,
        routing_strategy : Types::RoutingStrategy? = nil
      ) : Types::UpdateAliasOutput

        input = Types::UpdateAliasInput.new(alias_id: alias_id, description: description, name: name, routing_strategy: routing_strategy)
        update_alias(input)
      end

      def update_alias(input : Types::UpdateAliasInput) : Types::UpdateAliasOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAliasOutput, "UpdateAlias")
      end

      # This API works with the following fleet types: EC2 Updates metadata in a build resource, including
      # the build name and version. To update the metadata, specify the build ID to update and provide the
      # new values. If successful, a build object containing the updated metadata is returned. Learn more
      # Upload a Custom Server Build All APIs by task

      def update_build(
        build_id : String,
        name : String? = nil,
        version : String? = nil
      ) : Types::UpdateBuildOutput

        input = Types::UpdateBuildInput.new(build_id: build_id, name: name, version: version)
        update_build(input)
      end

      def update_build(input : Types::UpdateBuildInput) : Types::UpdateBuildOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BUILD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBuildOutput, "UpdateBuild")
      end

      # This API works with the following fleet types: Container Updates the properties of a managed
      # container fleet. Depending on the properties being updated, this operation might initiate a fleet
      # deployment. You can track deployments for a fleet using
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetDeployment.html . A
      # managed fleet's runtime environment, which depends on the fleet's Amazon Machine Image {AMI}
      # version, can't be updated. You must create a new fleet. As a best practice, we recommend replacing
      # your managed fleets every 30 days to maintain a secure and up-to-date runtime environment for your
      # hosted game servers. For guidance, see Security best practices for Amazon GameLift Servers . Request
      # options As with CreateContainerFleet, many fleet properties use common defaults or are calculated
      # based on the fleet's container group definitions. Update fleet properties that result in a fleet
      # deployment. Include only those properties that you want to change. Specify deployment configuration
      # settings. Update fleet properties that don't result in a fleet deployment. Include only those
      # properties that you want to change. Changes to the following properties initiate a fleet deployment:
      # GameServerContainerGroupDefinition PerInstanceContainerGroupDefinition
      # GameServerContainerGroupsPerInstance InstanceInboundPermissions InstanceConnectionPortRange
      # LogConfiguration Results If successful, this operation updates the container fleet resource, and
      # might initiate a new deployment of fleet resources using the deployment configuration provided. A
      # deployment replaces existing fleet instances with new instances that are deployed with the updated
      # fleet properties. The fleet is placed in UPDATING status until the deployment is complete, then
      # return to ACTIVE . You can have only one update deployment active at a time for a fleet. If a second
      # update request initiates a deployment while another deployment is in progress, the first deployment
      # is cancelled.

      def update_container_fleet(
        fleet_id : String,
        deployment_configuration : Types::DeploymentConfiguration? = nil,
        description : String? = nil,
        game_server_container_group_definition_name : String? = nil,
        game_server_container_groups_per_instance : Int32? = nil,
        game_session_creation_limit_policy : Types::GameSessionCreationLimitPolicy? = nil,
        instance_connection_port_range : Types::ConnectionPortRange? = nil,
        instance_inbound_permission_authorizations : Array(Types::IpPermission)? = nil,
        instance_inbound_permission_revocations : Array(Types::IpPermission)? = nil,
        log_configuration : Types::LogConfiguration? = nil,
        metric_groups : Array(String)? = nil,
        new_game_session_protection_policy : String? = nil,
        per_instance_container_group_definition_name : String? = nil,
        remove_attributes : Array(String)? = nil
      ) : Types::UpdateContainerFleetOutput

        input = Types::UpdateContainerFleetInput.new(fleet_id: fleet_id, deployment_configuration: deployment_configuration, description: description, game_server_container_group_definition_name: game_server_container_group_definition_name, game_server_container_groups_per_instance: game_server_container_groups_per_instance, game_session_creation_limit_policy: game_session_creation_limit_policy, instance_connection_port_range: instance_connection_port_range, instance_inbound_permission_authorizations: instance_inbound_permission_authorizations, instance_inbound_permission_revocations: instance_inbound_permission_revocations, log_configuration: log_configuration, metric_groups: metric_groups, new_game_session_protection_policy: new_game_session_protection_policy, per_instance_container_group_definition_name: per_instance_container_group_definition_name, remove_attributes: remove_attributes)
        update_container_fleet(input)
      end

      def update_container_fleet(input : Types::UpdateContainerFleetInput) : Types::UpdateContainerFleetOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONTAINER_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateContainerFleetOutput, "UpdateContainerFleet")
      end

      # This API works with the following fleet types: Container Updates properties in an existing container
      # group definition. This operation doesn't replace the definition. Instead, it creates a new version
      # of the definition and saves it separately. You can access all versions that you choose to retain.
      # The only property you can't update is the container group type. Request options: Update based on the
      # latest version of the container group definition. Specify the container group definition name only,
      # or use an ARN value without a version number. Provide updated values for the properties that you
      # want to change only. All other values remain the same as the latest version. Update based on a
      # specific version of the container group definition. Specify the container group definition name and
      # a source version number, or use an ARN value with a version number. Provide updated values for the
      # properties that you want to change only. All other values remain the same as the source version.
      # Change a game server container definition. Provide the updated container definition. Add or change a
      # support container definition. Provide a complete set of container definitions, including the updated
      # definition. Remove a support container definition. Provide a complete set of container definitions,
      # excluding the definition to remove. If the container group has only one support container
      # definition, provide an empty set. Results: If successful, this operation returns the complete
      # properties of the new container group definition version. If the container group definition version
      # is used in an active fleets, the update automatically initiates a new fleet deployment of the new
      # version. You can track a fleet's deployments using ListFleetDeployments .

      def update_container_group_definition(
        name : String,
        game_server_container_definition : Types::GameServerContainerDefinitionInput? = nil,
        operating_system : String? = nil,
        source_version_number : Int32? = nil,
        support_container_definitions : Array(Types::SupportContainerDefinitionInput)? = nil,
        total_memory_limit_mebibytes : Int32? = nil,
        total_vcpu_limit : Float64? = nil,
        version_description : String? = nil
      ) : Types::UpdateContainerGroupDefinitionOutput

        input = Types::UpdateContainerGroupDefinitionInput.new(name: name, game_server_container_definition: game_server_container_definition, operating_system: operating_system, source_version_number: source_version_number, support_container_definitions: support_container_definitions, total_memory_limit_mebibytes: total_memory_limit_mebibytes, total_vcpu_limit: total_vcpu_limit, version_description: version_description)
        update_container_group_definition(input)
      end

      def update_container_group_definition(input : Types::UpdateContainerGroupDefinitionInput) : Types::UpdateContainerGroupDefinitionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONTAINER_GROUP_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateContainerGroupDefinitionOutput, "UpdateContainerGroupDefinition")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Updates a fleet's mutable
      # attributes, such as game session protection and resource creation limits. To update fleet
      # attributes, specify the fleet ID and the property values that you want to change. If successful,
      # Amazon GameLift Servers returns the identifiers for the updated fleet. A managed fleet's runtime
      # environment, which depends on the fleet's Amazon Machine Image {AMI} version, can't be updated. You
      # must create a new fleet. As a best practice, we recommend replacing your managed fleets every 30
      # days to maintain a secure and up-to-date runtime environment for your hosted game servers. For
      # guidance, see Security best practices for Amazon GameLift Servers . Learn more Setting up Amazon
      # GameLift Servers fleets

      def update_fleet_attributes(
        fleet_id : String,
        anywhere_configuration : Types::AnywhereConfiguration? = nil,
        description : String? = nil,
        metric_groups : Array(String)? = nil,
        name : String? = nil,
        new_game_session_protection_policy : String? = nil,
        resource_creation_limit_policy : Types::ResourceCreationLimitPolicy? = nil
      ) : Types::UpdateFleetAttributesOutput

        input = Types::UpdateFleetAttributesInput.new(fleet_id: fleet_id, anywhere_configuration: anywhere_configuration, description: description, metric_groups: metric_groups, name: name, new_game_session_protection_policy: new_game_session_protection_policy, resource_creation_limit_policy: resource_creation_limit_policy)
        update_fleet_attributes(input)
      end

      def update_fleet_attributes(input : Types::UpdateFleetAttributesInput) : Types::UpdateFleetAttributesOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FLEET_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFleetAttributesOutput, "UpdateFleetAttributes")
      end

      # This API works with the following fleet types: EC2, Container Updates capacity settings for a
      # managed EC2 fleet or managed container fleet. For these fleets, you adjust capacity by changing the
      # number of instances in the fleet. Fleet capacity determines the number of game sessions and players
      # that the fleet can host based on its configuration. For fleets with multiple locations, use this
      # operation to manage capacity settings in each location individually. Use this operation to set these
      # fleet capacity properties: Minimum/maximum size: Set hard limits on the number of Amazon EC2
      # instances allowed. If Amazon GameLift Servers receives a request--either through manual update or
      # automatic scaling--it won't change the capacity to a value outside of this range. Desired capacity:
      # As an alternative to automatic scaling, manually set the number of Amazon EC2 instances to be
      # maintained. Before changing a fleet's desired capacity, check the maximum capacity of the fleet's
      # Amazon EC2 instance type by calling DescribeEC2InstanceLimits . To update capacity for a fleet's
      # home Region, or if the fleet has no remote locations, omit the Location parameter. The fleet must be
      # in ACTIVE status. To update capacity for a fleet's remote location, set the Location parameter to
      # the location to update. The location must be in ACTIVE status. If successful, Amazon GameLift
      # Servers updates the capacity settings and returns the identifiers for the updated fleet and/or
      # location. If a requested change to desired capacity exceeds the instance type's limit, the
      # LimitExceeded exception occurs. Updates often prompt an immediate change in fleet capacity, such as
      # when current capacity is different than the new desired capacity or outside the new limits. In this
      # scenario, Amazon GameLift Servers automatically initiates steps to add or remove instances in the
      # fleet location. You can track a fleet's current capacity by calling DescribeFleetCapacity or
      # DescribeFleetLocationCapacity . Learn more Scaling fleet capacity

      def update_fleet_capacity(
        fleet_id : String,
        desired_instances : Int32? = nil,
        location : String? = nil,
        max_size : Int32? = nil,
        min_size : Int32? = nil
      ) : Types::UpdateFleetCapacityOutput

        input = Types::UpdateFleetCapacityInput.new(fleet_id: fleet_id, desired_instances: desired_instances, location: location, max_size: max_size, min_size: min_size)
        update_fleet_capacity(input)
      end

      def update_fleet_capacity(input : Types::UpdateFleetCapacityInput) : Types::UpdateFleetCapacityOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FLEET_CAPACITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFleetCapacityOutput, "UpdateFleetCapacity")
      end

      # This API works with the following fleet types: EC2, Container Updates permissions that allow inbound
      # traffic to connect to game sessions in the fleet. To update settings, specify the fleet ID to be
      # updated and specify the changes to be made. List the permissions you want to add in
      # InboundPermissionAuthorizations , and permissions you want to remove in InboundPermissionRevocations
      # . Permissions to be removed must match existing fleet permissions. If successful, the fleet ID for
      # the updated fleet is returned. For fleets with remote locations, port setting updates can take time
      # to propagate across all locations. You can check the status of updates in each location by calling
      # DescribeFleetPortSettings with a location name. Learn more Setting up Amazon GameLift Servers fleets

      def update_fleet_port_settings(
        fleet_id : String,
        inbound_permission_authorizations : Array(Types::IpPermission)? = nil,
        inbound_permission_revocations : Array(Types::IpPermission)? = nil
      ) : Types::UpdateFleetPortSettingsOutput

        input = Types::UpdateFleetPortSettingsInput.new(fleet_id: fleet_id, inbound_permission_authorizations: inbound_permission_authorizations, inbound_permission_revocations: inbound_permission_revocations)
        update_fleet_port_settings(input)
      end

      def update_fleet_port_settings(input : Types::UpdateFleetPortSettingsInput) : Types::UpdateFleetPortSettingsOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FLEET_PORT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFleetPortSettingsOutput, "UpdateFleetPortSettings")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Updates information about a registered
      # game server to help Amazon GameLift Servers FleetIQ track game server availability. This operation
      # is called by a game server process that is running on an instance in a game server group. Use this
      # operation to update the following types of game server information. You can make all three types of
      # updates in the same request: To update the game server's utilization status from AVAILABLE (when the
      # game server is available to be claimed) to UTILIZED (when the game server is currently hosting
      # games). Identify the game server and game server group and specify the new utilization status. You
      # can't change the status from to UTILIZED to AVAILABLE . To report health status, identify the game
      # server and game server group and set health check to HEALTHY . If a game server does not report
      # health status for a certain length of time, the game server is no longer considered healthy. As a
      # result, it will be eventually deregistered from the game server group to avoid affecting utilization
      # metrics. The best practice is to report health every 60 seconds. To change game server metadata,
      # provide updated game server data. Once a game server is successfully updated, the relevant statuses
      # and timestamps are updated. Learn more Amazon GameLift Servers FleetIQ Guide

      def update_game_server(
        game_server_group_name : String,
        game_server_id : String,
        game_server_data : String? = nil,
        health_check : String? = nil,
        utilization_status : String? = nil
      ) : Types::UpdateGameServerOutput

        input = Types::UpdateGameServerInput.new(game_server_group_name: game_server_group_name, game_server_id: game_server_id, game_server_data: game_server_data, health_check: health_check, utilization_status: utilization_status)
        update_game_server(input)
      end

      def update_game_server(input : Types::UpdateGameServerInput) : Types::UpdateGameServerOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GAME_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGameServerOutput, "UpdateGameServer")
      end

      # This API works with the following fleet types: EC2 (FleetIQ) Updates Amazon GameLift Servers
      # FleetIQ-specific properties for a game server group. Many Auto Scaling group properties are updated
      # on the Auto Scaling group directly, including the launch template, Auto Scaling policies, and
      # maximum/minimum/desired instance counts. To update the game server group, specify the game server
      # group ID and provide the updated values. Before applying the updates, the new values are validated
      # to ensure that Amazon GameLift Servers FleetIQ can continue to perform instance balancing activity.
      # If successful, a GameServerGroup object is returned. Learn more Amazon GameLift Servers FleetIQ
      # Guide

      def update_game_server_group(
        game_server_group_name : String,
        balancing_strategy : String? = nil,
        game_server_protection_policy : String? = nil,
        instance_definitions : Array(Types::InstanceDefinition)? = nil,
        role_arn : String? = nil
      ) : Types::UpdateGameServerGroupOutput

        input = Types::UpdateGameServerGroupInput.new(game_server_group_name: game_server_group_name, balancing_strategy: balancing_strategy, game_server_protection_policy: game_server_protection_policy, instance_definitions: instance_definitions, role_arn: role_arn)
        update_game_server_group(input)
      end

      def update_game_server_group(input : Types::UpdateGameServerGroupInput) : Types::UpdateGameServerGroupOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GAME_SERVER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGameServerGroupOutput, "UpdateGameServerGroup")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Updates the mutable
      # properties of a game session. To update a game session, specify the game session ID and the values
      # you want to change. If successful, the updated GameSession object is returned. All APIs by task

      def update_game_session(
        game_session_id : String,
        game_properties : Array(Types::GameProperty)? = nil,
        maximum_player_session_count : Int32? = nil,
        name : String? = nil,
        player_session_creation_policy : String? = nil,
        protection_policy : String? = nil
      ) : Types::UpdateGameSessionOutput

        input = Types::UpdateGameSessionInput.new(game_session_id: game_session_id, game_properties: game_properties, maximum_player_session_count: maximum_player_session_count, name: name, player_session_creation_policy: player_session_creation_policy, protection_policy: protection_policy)
        update_game_session(input)
      end

      def update_game_session(input : Types::UpdateGameSessionInput) : Types::UpdateGameSessionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GAME_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGameSessionOutput, "UpdateGameSession")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Updates the configuration of
      # a game session queue, which determines how the queue processes new game session requests. To update
      # settings, specify the queue name to be updated and provide the new settings. When updating
      # destinations, provide a complete list of destinations. Learn more Using Multi-Region Queues

      def update_game_session_queue(
        name : String,
        custom_event_data : String? = nil,
        destinations : Array(Types::GameSessionQueueDestination)? = nil,
        filter_configuration : Types::FilterConfiguration? = nil,
        notification_target : String? = nil,
        player_latency_policies : Array(Types::PlayerLatencyPolicy)? = nil,
        priority_configuration : Types::PriorityConfiguration? = nil,
        timeout_in_seconds : Int32? = nil
      ) : Types::UpdateGameSessionQueueOutput

        input = Types::UpdateGameSessionQueueInput.new(name: name, custom_event_data: custom_event_data, destinations: destinations, filter_configuration: filter_configuration, notification_target: notification_target, player_latency_policies: player_latency_policies, priority_configuration: priority_configuration, timeout_in_seconds: timeout_in_seconds)
        update_game_session_queue(input)
      end

      def update_game_session_queue(input : Types::UpdateGameSessionQueueInput) : Types::UpdateGameSessionQueueOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GAME_SESSION_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGameSessionQueueOutput, "UpdateGameSessionQueue")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Updates settings for a
      # FlexMatch matchmaking configuration. These changes affect all matches and game sessions that are
      # created after the update. To update settings, specify the configuration name to be updated and
      # provide the new settings. Learn more Design a FlexMatch matchmaker

      def update_matchmaking_configuration(
        name : String,
        acceptance_required : Bool? = nil,
        acceptance_timeout_seconds : Int32? = nil,
        additional_player_count : Int32? = nil,
        backfill_mode : String? = nil,
        custom_event_data : String? = nil,
        description : String? = nil,
        flex_match_mode : String? = nil,
        game_properties : Array(Types::GameProperty)? = nil,
        game_session_data : String? = nil,
        game_session_queue_arns : Array(String)? = nil,
        notification_target : String? = nil,
        request_timeout_seconds : Int32? = nil,
        rule_set_name : String? = nil
      ) : Types::UpdateMatchmakingConfigurationOutput

        input = Types::UpdateMatchmakingConfigurationInput.new(name: name, acceptance_required: acceptance_required, acceptance_timeout_seconds: acceptance_timeout_seconds, additional_player_count: additional_player_count, backfill_mode: backfill_mode, custom_event_data: custom_event_data, description: description, flex_match_mode: flex_match_mode, game_properties: game_properties, game_session_data: game_session_data, game_session_queue_arns: game_session_queue_arns, notification_target: notification_target, request_timeout_seconds: request_timeout_seconds, rule_set_name: rule_set_name)
        update_matchmaking_configuration(input)
      end

      def update_matchmaking_configuration(input : Types::UpdateMatchmakingConfigurationInput) : Types::UpdateMatchmakingConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MATCHMAKING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMatchmakingConfigurationOutput, "UpdateMatchmakingConfiguration")
      end

      # This API works with the following fleet types: EC2 Updates the runtime configuration for the
      # specified fleet. The runtime configuration tells Amazon GameLift Servers how to launch server
      # processes on computes in managed EC2 and Anywhere fleets. You can update a fleet's runtime
      # configuration at any time after the fleet is created; it does not need to be in ACTIVE status. To
      # update runtime configuration, specify the fleet ID and provide a RuntimeConfiguration with an
      # updated set of server process configurations. If successful, the fleet's runtime configuration
      # settings are updated. Fleet computes that run game server processes regularly check for and receive
      # updated runtime configurations. The computes immediately take action to comply with the new
      # configuration by launching new server processes or by not replacing existing processes when they
      # shut down. Updating a fleet's runtime configuration never affects existing server processes. Learn
      # more Setting up Amazon GameLift Servers fleets

      def update_runtime_configuration(
        fleet_id : String,
        runtime_configuration : Types::RuntimeConfiguration
      ) : Types::UpdateRuntimeConfigurationOutput

        input = Types::UpdateRuntimeConfigurationInput.new(fleet_id: fleet_id, runtime_configuration: runtime_configuration)
        update_runtime_configuration(input)
      end

      def update_runtime_configuration(input : Types::UpdateRuntimeConfigurationInput) : Types::UpdateRuntimeConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RUNTIME_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRuntimeConfigurationOutput, "UpdateRuntimeConfiguration")
      end

      # This API works with the following fleet types: EC2 Updates Realtime script metadata and content. To
      # update script metadata, specify the script ID and provide updated name and/or version values. To
      # update script content, provide an updated zip file by pointing to either a local file or an Amazon
      # S3 bucket location. You can use either method regardless of how the original script was uploaded.
      # Use the Version parameter to track updates to the script. If the call is successful, the updated
      # metadata is stored in the script record and a revised script is uploaded to the Amazon GameLift
      # Servers service. Once the script is updated and acquired by a fleet instance, the new version is
      # used for all new game sessions. Learn more Amazon GameLift Servers Amazon GameLift Servers Realtime
      # Related actions All APIs by task

      def update_script(
        script_id : String,
        name : String? = nil,
        storage_location : Types::S3Location? = nil,
        version : String? = nil,
        zip_file : Bytes? = nil
      ) : Types::UpdateScriptOutput

        input = Types::UpdateScriptInput.new(script_id: script_id, name: name, storage_location: storage_location, version: version, zip_file: zip_file)
        update_script(input)
      end

      def update_script(input : Types::UpdateScriptInput) : Types::UpdateScriptOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SCRIPT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateScriptOutput, "UpdateScript")
      end

      # This API works with the following fleet types: EC2, Anywhere, Container Validates the syntax of a
      # matchmaking rule or rule set. This operation checks that the rule set is using syntactically correct
      # JSON and that it conforms to allowed property expressions. To validate syntax, provide a rule set
      # JSON string. Learn more Build a rule set

      def validate_matchmaking_rule_set(
        rule_set_body : String
      ) : Types::ValidateMatchmakingRuleSetOutput

        input = Types::ValidateMatchmakingRuleSetInput.new(rule_set_body: rule_set_body)
        validate_matchmaking_rule_set(input)
      end

      def validate_matchmaking_rule_set(input : Types::ValidateMatchmakingRuleSetInput) : Types::ValidateMatchmakingRuleSetOutput
        request = Protocol::JsonRpc.build_request(Model::VALIDATE_MATCHMAKING_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ValidateMatchmakingRuleSetOutput, "ValidateMatchmakingRuleSet")
      end
    end
  end
end
