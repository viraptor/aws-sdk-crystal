require "json"
require "time"

module AwsSdk
  module GameLift
    module Types


      struct AcceptMatchInput
        include JSON::Serializable

        # Player response to the proposed match.

        @[JSON::Field(key: "AcceptanceType")]
        getter acceptance_type : String

        # A unique identifier for a player delivering the response. This parameter can include one or multiple
        # player IDs.

        @[JSON::Field(key: "PlayerIds")]
        getter player_ids : Array(String)

        # A unique identifier for a matchmaking ticket. The ticket must be in status REQUIRES_ACCEPTANCE ;
        # otherwise this request will fail.

        @[JSON::Field(key: "TicketId")]
        getter ticket_id : String

        def initialize(
          @acceptance_type : String,
          @player_ids : Array(String),
          @ticket_id : String
        )
        end
      end


      struct AcceptMatchOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Properties that describe an alias resource. Related actions All APIs by task

      struct Alias
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers alias resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::alias/alias-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 . In a GameLift
        # alias ARN, the resource ID matches the alias ID value.

        @[JSON::Field(key: "AliasArn")]
        getter alias_arn : String?

        # A unique identifier for the alias. Alias IDs are unique within a Region.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String?

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A human-readable description of an alias.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The time that this data object was last modified. Format is a number expressed in Unix time as
        # milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # A descriptive label that is associated with an alias. Alias names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The routing configuration, including routing type and fleet target, for the alias.

        @[JSON::Field(key: "RoutingStrategy")]
        getter routing_strategy : Types::RoutingStrategy?

        def initialize(
          @alias_arn : String? = nil,
          @alias_id : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @routing_strategy : Types::RoutingStrategy? = nil
        )
        end
      end

      # Amazon GameLift Servers configuration options for your Anywhere fleets.

      struct AnywhereConfiguration
        include JSON::Serializable

        # The cost to run your fleet per hour. Amazon GameLift Servers uses the provided cost of your fleet to
        # balance usage in queues. For more information about queues, see Setting up queues in the Amazon
        # GameLift Servers Developer Guide .

        @[JSON::Field(key: "Cost")]
        getter cost : String

        def initialize(
          @cost : String
        )
        end
      end

      # Values for use in player attribute key-value pairs. This object lets you specify an attribute value
      # using any of the valid data types: string, number, string array, or data map. Each AttributeValue
      # object can use only one of the available properties.

      struct AttributeValue
        include JSON::Serializable

        # For number values, expressed as double.

        @[JSON::Field(key: "N")]
        getter n : Float64?

        # For single string values. Maximum string length is 100 characters.

        @[JSON::Field(key: "S")]
        getter s : String?

        # For a map of up to 10 data type:value pairs. Maximum length for each string value is 100 characters.

        @[JSON::Field(key: "SDM")]
        getter sdm : Hash(String, Float64)?

        # For a list of up to 100 strings. Maximum length for each string is 100 characters. Duplicate values
        # are not recognized; all occurrences of the repeated value after the first of a repeated value are
        # ignored.

        @[JSON::Field(key: "SL")]
        getter sl : Array(String)?

        def initialize(
          @n : Float64? = nil,
          @s : String? = nil,
          @sdm : Hash(String, Float64)? = nil,
          @sl : Array(String)? = nil
        )
        end
      end

      # Amazon Web Services account security credentials that allow interactions with Amazon GameLift
      # Servers resources. The credentials are temporary and valid for a limited time span. You can request
      # fresh credentials at any time. Amazon Web Services security credentials consist of three parts: an
      # access key ID, a secret access key, and a session token. You must use all three parts together to
      # authenticate your access requests. You need Amazon Web Services credentials for the following tasks:
      # To upload a game server build directly to Amazon GameLift Servers S3 storage using CreateBuild . To
      # get access for this task, call
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_RequestUploadCredentials.html . To
      # remotely connect to an active Amazon GameLift Servers fleet instances. To get remote access, call
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetComputeAccess.html .

      struct AwsCredentials
        include JSON::Serializable

        # The access key ID that identifies the temporary security credentials.

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String?

        # The secret access key that can be used to sign requests.

        @[JSON::Field(key: "SecretAccessKey")]
        getter secret_access_key : String?

        # The token that users must pass to the service API to use the temporary credentials.

        @[JSON::Field(key: "SessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      # Properties describing a custom game build. All APIs by task

      struct Build
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers build resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::build/build-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 . In a GameLift
        # build ARN, the resource ID matches the BuildId value.

        @[JSON::Field(key: "BuildArn")]
        getter build_arn : String?

        # A unique identifier for the build.

        @[JSON::Field(key: "BuildId")]
        getter build_id : String?

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A descriptive label that is associated with a build. Build names do not need to be unique. It can be
        # set using CreateBuild or UpdateBuild .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Operating system that the game server binaries are built to run on. This value determines the type
        # of fleet resources that you can use for this build. Amazon Linux 2 (AL2) will reach end of support
        # on 6/30/2025. See more details in the Amazon Linux 2 FAQs . For game servers that are hosted on AL2
        # and use server SDK version 4.x for Amazon GameLift Servers, first update the game server build to
        # server SDK 5.x, and then deploy to AL2023 instances. See Migrate to server SDK version 5.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # The Amazon GameLift Servers Server SDK version used to develop your game server.

        @[JSON::Field(key: "ServerSdkVersion")]
        getter server_sdk_version : String?

        # File size of the uploaded game build, expressed in bytes. When the build status is INITIALIZED or
        # when using a custom Amazon S3 storage location, this value is 0.

        @[JSON::Field(key: "SizeOnDisk")]
        getter size_on_disk : Int64?

        # Current status of the build. Possible build statuses include the following: INITIALIZED -- A new
        # build has been defined, but no files have been uploaded. You cannot create fleets for builds that
        # are in this status. When a build is successfully created, the build status is set to this value.
        # READY -- The game build has been successfully uploaded. You can now create new fleets for this
        # build. FAILED -- The game build upload failed. You cannot create new fleets for this build.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Version information that is associated with a build or script. Version strings do not need to be
        # unique.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @build_arn : String? = nil,
          @build_id : String? = nil,
          @creation_time : Time? = nil,
          @name : String? = nil,
          @operating_system : String? = nil,
          @server_sdk_version : String? = nil,
          @size_on_disk : Int64? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Determines whether a TLS/SSL certificate is generated for a fleet. This feature must be enabled when
      # creating the fleet. All instances in a fleet share the same certificate. The certificate can be
      # retrieved by calling the Amazon GameLift Servers Server SDK operation GetInstanceCertificate .

      struct CertificateConfiguration
        include JSON::Serializable

        # Indicates whether a TLS/SSL certificate is generated for a fleet. Valid values include: GENERATED -
        # Generate a TLS/SSL certificate for this fleet. DISABLED - (default) Do not generate a TLS/SSL
        # certificate for this fleet.

        @[JSON::Field(key: "CertificateType")]
        getter certificate_type : String

        def initialize(
          @certificate_type : String
        )
        end
      end

      # Filters which game servers may be claimed when calling ClaimGameServer .

      struct ClaimFilterOption
        include JSON::Serializable

        # List of instance statuses that game servers may be claimed on. If provided, the list must contain
        # the ACTIVE status.

        @[JSON::Field(key: "InstanceStatuses")]
        getter instance_statuses : Array(String)?

        def initialize(
          @instance_statuses : Array(String)? = nil
        )
        end
      end


      struct ClaimGameServerInput
        include JSON::Serializable

        # A unique identifier for the game server group where the game server is running. If you are not
        # specifying a game server to claim, this value identifies where you want Amazon GameLift Servers
        # FleetIQ to look for an available game server to claim.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # Object that restricts how a claimed game server is chosen.

        @[JSON::Field(key: "FilterOption")]
        getter filter_option : Types::ClaimFilterOption?

        # A set of custom game server properties, formatted as a single string value. This data is passed to a
        # game client or service when it requests information on game servers.

        @[JSON::Field(key: "GameServerData")]
        getter game_server_data : String?

        # A custom string that uniquely identifies the game server to claim. If this parameter is left empty,
        # Amazon GameLift Servers FleetIQ searches for an available game server in the specified game server
        # group.

        @[JSON::Field(key: "GameServerId")]
        getter game_server_id : String?

        def initialize(
          @game_server_group_name : String,
          @filter_option : Types::ClaimFilterOption? = nil,
          @game_server_data : String? = nil,
          @game_server_id : String? = nil
        )
        end
      end


      struct ClaimGameServerOutput
        include JSON::Serializable

        # Object that describes the newly claimed game server.

        @[JSON::Field(key: "GameServer")]
        getter game_server : Types::GameServer?

        def initialize(
          @game_server : Types::GameServer? = nil
        )
        end
      end

      # An Amazon GameLift Servers compute resource for hosting your game servers. Computes in an Amazon
      # GameLift Servers fleet differs depending on the fleet's compute type property as follows: For
      # managed EC2 fleets, a compute is an EC2 instance. For Anywhere fleets, a compute is a computing
      # resource that you provide and is registered to the fleet.

      struct Compute
        include JSON::Serializable

        # The ARN that is assigned to a compute resource and uniquely identifies it. ARNs are unique across
        # locations. Instances in managed EC2 fleets are not assigned a Compute ARN.

        @[JSON::Field(key: "ComputeArn")]
        getter compute_arn : String?

        # A descriptive label for the compute resource. For instances in a managed EC2 fleet, the compute name
        # is the same value as the InstanceId ID.

        @[JSON::Field(key: "ComputeName")]
        getter compute_name : String?

        # Current status of the compute. A compute must have an ACTIVE status to host game sessions. Valid
        # values include PENDING , ACTIVE , TERMINATING , and IMPAIRED . While the ComputeStatus enum type is
        # valid for Container based servers, the result may also include other non-enumerated string values
        # such as "Active" for fleets which are not Container-based.

        @[JSON::Field(key: "ComputeStatus")]
        getter compute_status : String?

        # A set of attributes for each container in the compute.

        @[JSON::Field(key: "ContainerAttributes")]
        getter container_attributes : Array(Types::ContainerAttribute)?

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The DNS name of a compute resource. Amazon GameLift Servers requires a DNS name or IP address for a
        # compute.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # The Amazon Resource Name (ARN) of the fleet that the compute belongs to.

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that the compute belongs to.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The endpoint of the Amazon GameLift Servers Agent.

        @[JSON::Field(key: "GameLiftAgentEndpoint")]
        getter game_lift_agent_endpoint : String?

        # The Amazon GameLift Servers SDK endpoint connection for a registered compute resource in an Anywhere
        # fleet. The game servers on the compute use this endpoint to connect to the Amazon GameLift Servers
        # service.

        @[JSON::Field(key: "GameLiftServiceSdkEndpoint")]
        getter game_lift_service_sdk_endpoint : String?

        # The game server container group definition for the compute.

        @[JSON::Field(key: "GameServerContainerGroupDefinitionArn")]
        getter game_server_container_group_definition_arn : String?

        # The InstanceID of the EC2 instance that is hosting the compute.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The IP address of a compute resource. Amazon GameLift Servers requires a DNS name or IP address for
        # a compute.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The name of the custom location you added to the fleet that this compute resource resides in.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The type of operating system on the compute resource. Amazon Linux 2 (AL2) will reach end of support
        # on 6/30/2025. See more details in the Amazon Linux 2 FAQs . For game servers that are hosted on AL2
        # and use server SDK version 4.x for Amazon GameLift Servers, first update the game server build to
        # server SDK 5.x, and then deploy to AL2023 instances. See Migrate to server SDK version 5.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # The Amazon EC2 instance type that the fleet uses. For registered computes in an Amazon GameLift
        # Servers Anywhere fleet, this property is empty.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @compute_arn : String? = nil,
          @compute_name : String? = nil,
          @compute_status : String? = nil,
          @container_attributes : Array(Types::ContainerAttribute)? = nil,
          @creation_time : Time? = nil,
          @dns_name : String? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @game_lift_agent_endpoint : String? = nil,
          @game_lift_service_sdk_endpoint : String? = nil,
          @game_server_container_group_definition_arn : String? = nil,
          @instance_id : String? = nil,
          @ip_address : String? = nil,
          @location : String? = nil,
          @operating_system : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The set of port numbers to open on each instance in a container fleet. Connection ports are used by
      # inbound traffic to connect with processes that are running in containers on the fleet.

      struct ConnectionPortRange
        include JSON::Serializable

        # Starting value for the port range.

        @[JSON::Field(key: "FromPort")]
        getter from_port : Int32

        # Ending value for the port. Port numbers are end-inclusive. This value must be equal to or greater
        # than FromPort .

        @[JSON::Field(key: "ToPort")]
        getter to_port : Int32

        def initialize(
          @from_port : Int32,
          @to_port : Int32
        )
        end
      end

      # A unique identifier for a container in a container fleet compute. Returned by: DescribeCompute

      struct ContainerAttribute
        include JSON::Serializable

        # The identifier for a container that's running in a compute.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String?

        # The runtime ID for the container that's running in a compute. This value is unique within the
        # compute.

        @[JSON::Field(key: "ContainerRuntimeId")]
        getter container_runtime_id : String?

        def initialize(
          @container_name : String? = nil,
          @container_runtime_id : String? = nil
        )
        end
      end

      # A container's dependency on another container in the same container group. The dependency impacts
      # how the dependent container is able to start or shut down based the status of the other container.
      # For example, ContainerA is configured with the following dependency: a START dependency on
      # ContainerB . This means that ContainerA can't start until ContainerB has started. It also means that
      # ContainerA must shut down before ContainerB . Part of: GameServerContainerDefinition ,
      # GameServerContainerDefinitionInput , SupportContainerDefinition , SupportContainerDefinitionInput

      struct ContainerDependency
        include JSON::Serializable

        # The condition that the dependency container must reach before the dependent container can start.
        # Valid conditions include: START - The dependency container must have started. COMPLETE - The
        # dependency container has run to completion (exits). Use this condition with nonessential containers,
        # such as those that run a script and then exit. The dependency container can't be an essential
        # container. SUCCESS - The dependency container has run to completion and exited with a zero status.
        # The dependency container can't be an essential container. HEALTHY - The dependency container has
        # passed its Docker health check. Use this condition with dependency containers that have health
        # checks configured. This condition is confirmed at container group startup only.

        @[JSON::Field(key: "Condition")]
        getter condition : String

        # A descriptive label for the container definition that this container depends on.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @condition : String,
          @container_name : String
        )
        end
      end

      # An environment variable to set inside a container, in the form of a key-value pair. Part of:
      # GameServerContainerDefinition , GameServerContainerDefinitionInput , SupportContainerDefinition ,
      # SupportContainerDefinitionInput

      struct ContainerEnvironment
        include JSON::Serializable

        # The environment variable name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The environment variable value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Describes an Amazon GameLift Servers managed container fleet.

      struct ContainerFleet
        include JSON::Serializable

        # Indicates whether the fleet uses On-Demand or Spot instances for this fleet. Learn more about when
        # to use On-Demand versus Spot Instances . You can't update this fleet property. By default, this
        # property is set to ON_DEMAND .

        @[JSON::Field(key: "BillingType")]
        getter billing_type : String?

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Information about the most recent deployment for the container fleet.

        @[JSON::Field(key: "DeploymentDetails")]
        getter deployment_details : Types::DeploymentDetails?

        # A meaningful description of the container fleet.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 . In a GameLift
        # fleet ARN, the resource ID matches the FleetId value.

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the container fleet to retrieve.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The unique identifier for an Identity and Access Management (IAM) role with permissions to run your
        # containers on resources that are managed by Amazon GameLift Servers. See Set up an IAM service role
        # . This fleet property can't be changed.

        @[JSON::Field(key: "FleetRoleArn")]
        getter fleet_role_arn : String?

        # The Amazon Resource Name ( ARN ) that is assigned to the fleet's game server container group. The
        # ARN value also identifies the specific container group definition version in use.

        @[JSON::Field(key: "GameServerContainerGroupDefinitionArn")]
        getter game_server_container_group_definition_arn : String?

        # The name of the fleet's game server container group definition, which describes how to deploy
        # containers with your game server build and support software onto each fleet instance.

        @[JSON::Field(key: "GameServerContainerGroupDefinitionName")]
        getter game_server_container_group_definition_name : String?

        # The number of times to replicate the game server container group on each fleet instance.

        @[JSON::Field(key: "GameServerContainerGroupsPerInstance")]
        getter game_server_container_groups_per_instance : Int32?

        # A policy that limits the number of game sessions that each individual player can create on instances
        # in this fleet. The limit applies for a specified span of time.

        @[JSON::Field(key: "GameSessionCreationLimitPolicy")]
        getter game_session_creation_limit_policy : Types::GameSessionCreationLimitPolicy?


        @[JSON::Field(key: "InstanceConnectionPortRange")]
        getter instance_connection_port_range : Types::ConnectionPortRange?

        # The IP address ranges and port settings that allow inbound traffic to access game server processes
        # and other processes on this fleet.

        @[JSON::Field(key: "InstanceInboundPermissions")]
        getter instance_inbound_permissions : Array(Types::IpPermission)?

        # The Amazon EC2 instance type to use for all instances in the fleet. Instance type determines the
        # computing resources and processing power that's available to host your game servers. This includes
        # including CPU, memory, storage, and networking capacity. You can't update this fleet property.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # Information about the container fleet's remote locations where fleet instances are deployed.

        @[JSON::Field(key: "LocationAttributes")]
        getter location_attributes : Array(Types::ContainerFleetLocationAttributes)?

        # The method that is used to collect container logs for the fleet. Amazon GameLift Servers saves all
        # standard output for each container in logs, including game session logs. CLOUDWATCH -- Send logs to
        # an Amazon CloudWatch log group that you define. Each container emits a log stream, which is
        # organized in the log group. S3 -- Store logs in an Amazon S3 bucket that you define. NONE -- Don't
        # collect container logs.

        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The calculated maximum number of game server container group that can be deployed on each fleet
        # instance. The calculation depends on the resource needs of the container group and the CPU and
        # memory resources of the fleet's instance type.

        @[JSON::Field(key: "MaximumGameServerContainerGroupsPerInstance")]
        getter maximum_game_server_container_groups_per_instance : Int32?

        # The name of an Amazon Web Services CloudWatch metric group to add this fleet to. Metric groups
        # aggregate metrics for multiple fleets.

        @[JSON::Field(key: "MetricGroups")]
        getter metric_groups : Array(String)?

        # Determines whether Amazon GameLift Servers can shut down game sessions on the fleet that are
        # actively running and hosting players. Amazon GameLift Servers might prompt an instance shutdown when
        # scaling down fleet capacity or when retiring unhealthy instances. You can also set game session
        # protection for individual game sessions using UpdateGameSession . NoProtection -- Game sessions can
        # be shut down during active gameplay. FullProtection -- Game sessions in ACTIVE status can't be shut
        # down.

        @[JSON::Field(key: "NewGameSessionProtectionPolicy")]
        getter new_game_session_protection_policy : String?

        # The Amazon Resource Name ( ARN ) that is assigned to the fleet's per-instance container group. The
        # ARN value also identifies the specific container group definition version in use.

        @[JSON::Field(key: "PerInstanceContainerGroupDefinitionArn")]
        getter per_instance_container_group_definition_arn : String?

        # The name of the fleet's per-instance container group definition.

        @[JSON::Field(key: "PerInstanceContainerGroupDefinitionName")]
        getter per_instance_container_group_definition_name : String?

        # The current status of the container fleet. PENDING -- A new container fleet has been requested.
        # CREATING -- A new container fleet resource is being created. CREATED -- A new container fleet
        # resource has been created. No fleet instances have been deployed. ACTIVATING -- New container fleet
        # instances are being deployed. ACTIVE -- The container fleet has been deployed and is ready to host
        # game sessions. UPDATING -- Updates to the container fleet is being updated. A deployment is in
        # progress.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @billing_type : String? = nil,
          @creation_time : Time? = nil,
          @deployment_details : Types::DeploymentDetails? = nil,
          @description : String? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @fleet_role_arn : String? = nil,
          @game_server_container_group_definition_arn : String? = nil,
          @game_server_container_group_definition_name : String? = nil,
          @game_server_container_groups_per_instance : Int32? = nil,
          @game_session_creation_limit_policy : Types::GameSessionCreationLimitPolicy? = nil,
          @instance_connection_port_range : Types::ConnectionPortRange? = nil,
          @instance_inbound_permissions : Array(Types::IpPermission)? = nil,
          @instance_type : String? = nil,
          @location_attributes : Array(Types::ContainerFleetLocationAttributes)? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @maximum_game_server_container_groups_per_instance : Int32? = nil,
          @metric_groups : Array(String)? = nil,
          @new_game_session_protection_policy : String? = nil,
          @per_instance_container_group_definition_arn : String? = nil,
          @per_instance_container_group_definition_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about a location in a multi-location container fleet.

      struct ContainerFleetLocationAttributes
        include JSON::Serializable

        # A location identifier.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The status of fleet activity in the location. PENDING -- A new container fleet has been requested.
        # CREATING -- A new container fleet resource is being created. CREATED -- A new container fleet
        # resource has been created. No fleet instances have been deployed. ACTIVATING -- New container fleet
        # instances are being deployed. ACTIVE -- The container fleet has been deployed and is ready to host
        # game sessions. UPDATING -- Updates to the container fleet is being updated. A deployment is in
        # progress.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @location : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The properties that describe a container group resource. You can update all properties of a
      # container group definition properties. Updates to a container group definition are saved as new
      # versions. Used with: CreateContainerGroupDefinition Returned by: DescribeContainerGroupDefinition ,
      # ListContainerGroupDefinitions , UpdateContainerGroupDefinition

      struct ContainerGroupDefinition
        include JSON::Serializable

        # A descriptive identifier for the container group definition. The name value is unique in an Amazon
        # Web Services Region.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name ( ARN ) that is assigned to an Amazon GameLift Servers
        # ContainerGroupDefinition resource. It uniquely identifies the resource across all Amazon Web
        # Services Regions. Format is arn:aws:gamelift:[region]::containergroupdefinition/[container group
        # definition name]:[version] .

        @[JSON::Field(key: "ContainerGroupDefinitionArn")]
        getter container_group_definition_arn : String?

        # The type of container group. Container group type determines how Amazon GameLift Servers deploys the
        # container group on each fleet instance.

        @[JSON::Field(key: "ContainerGroupType")]
        getter container_group_type : String?

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The definition for the game server container in this group. This property is used only when the
        # container group type is GAME_SERVER . This container definition specifies a container image with the
        # game server build.

        @[JSON::Field(key: "GameServerContainerDefinition")]
        getter game_server_container_definition : Types::GameServerContainerDefinition?

        # The platform that all containers in the container group definition run on. Amazon Linux 2 (AL2) will
        # reach end of support on 6/30/2025. See more details in the Amazon Linux 2 FAQs . For game servers
        # that are hosted on AL2 and use server SDK version 4.x for Amazon GameLift Servers, first update the
        # game server build to server SDK 5.x, and then deploy to AL2023 instances. See Migrate to server SDK
        # version 5.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # Current status of the container group definition resource. Values include: COPYING -- Amazon
        # GameLift Servers is in the process of making copies of all container images that are defined in the
        # group. While in this state, the resource can't be used to create a container fleet. READY -- Amazon
        # GameLift Servers has copied the registry images for all containers that are defined in the group.
        # You can use a container group definition in this status to create a container fleet. FAILED --
        # Amazon GameLift Servers failed to create a valid container group definition resource. For more
        # details on the cause of the failure, see StatusReason . A container group definition resource in
        # failed status will be deleted within a few minutes.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about a container group definition that's in FAILED status. Possible reasons
        # include: An internal issue prevented Amazon GameLift Servers from creating the container group
        # definition resource. Delete the failed resource and call CreateContainerGroupDefinition again. An
        # access-denied message means that you don't have permissions to access the container image on ECR.
        # See IAM permission examples for help setting up required IAM permissions for Amazon GameLift
        # Servers. The ImageUri value for at least one of the containers in the container group definition was
        # invalid or not found in the current Amazon Web Services account. At least one of the container
        # images referenced in the container group definition exceeds the allowed size. For size limits, see
        # Amazon GameLift Servers endpoints and quotas . At least one of the container images referenced in
        # the container group definition uses a different operating system than the one defined for the
        # container group.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The set of definitions for support containers in this group. A container group definition might have
        # zero support container definitions. Support container can be used in any type of container group.

        @[JSON::Field(key: "SupportContainerDefinitions")]
        getter support_container_definitions : Array(Types::SupportContainerDefinition)?

        # The amount of memory (in MiB) on a fleet instance to allocate for the container group. All
        # containers in the group share these resources. You can set a limit for each container definition in
        # the group. If individual containers have limits, this total value must be greater than any
        # individual container's memory limit.

        @[JSON::Field(key: "TotalMemoryLimitMebibytes")]
        getter total_memory_limit_mebibytes : Int32?

        # The amount of vCPU units on a fleet instance to allocate for the container group (1 vCPU is equal to
        # 1024 CPU units). All containers in the group share these resources. You can set a limit for each
        # container definition in the group. If individual containers have limits, this total value must be
        # equal to or greater than the sum of the limits for each container in the group.

        @[JSON::Field(key: "TotalVcpuLimit")]
        getter total_vcpu_limit : Float64?

        # An optional description that was provided for a container group definition update. Each version can
        # have a unique description.

        @[JSON::Field(key: "VersionDescription")]
        getter version_description : String?

        # Indicates the version of a particular container group definition. This number is incremented
        # automatically when you update a container group definition. You can view, update, or delete
        # individual versions or the entire container group definition.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32?

        def initialize(
          @name : String,
          @container_group_definition_arn : String? = nil,
          @container_group_type : String? = nil,
          @creation_time : Time? = nil,
          @game_server_container_definition : Types::GameServerContainerDefinition? = nil,
          @operating_system : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @support_container_definitions : Array(Types::SupportContainerDefinition)? = nil,
          @total_memory_limit_mebibytes : Int32? = nil,
          @total_vcpu_limit : Float64? = nil,
          @version_description : String? = nil,
          @version_number : Int32? = nil
        )
        end
      end

      # Instructions on when and how to check the health of a support container in a container fleet. These
      # properties override any Docker health checks that are set in the container image. For more
      # information on container health checks, see HealthCheck command in the Amazon Elastic Container
      # Service API . Game server containers don't have a health check parameter; Amazon GameLift Servers
      # automatically handles health checks for these containers. The following example instructs the
      # container to initiate a health check command every 60 seconds and wait 10 seconds for it to succeed.
      # If it fails, retry the command 3 times before flagging the container as unhealthy. It also tells the
      # container to wait 100 seconds after launch before counting failed health checks. {"Command": [
      # "CMD-SHELL", "ps cax | grep "processmanager" || exit 1" ], "Interval": 60, "Timeout": 10, "Retries":
      # 3, "StartPeriod": 100 } Part of: SupportContainerDefinition , SupportContainerDefinitionInput

      struct ContainerHealthCheck
        include JSON::Serializable

        # A string array that specifies the command that the container runs to determine if it's healthy.

        @[JSON::Field(key: "Command")]
        getter command : Array(String)

        # The time period (in seconds) between each health check.

        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The number of times to retry a failed health check before flagging the container unhealthy. The
        # first run of the command does not count as a retry.

        @[JSON::Field(key: "Retries")]
        getter retries : Int32?

        # The optional grace period (in seconds) to give a container time to bootstrap before the first failed
        # health check counts toward the number of retries.

        @[JSON::Field(key: "StartPeriod")]
        getter start_period : Int32?

        # The time period (in seconds) to wait for a health check to succeed before counting a failed health
        # check.

        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        def initialize(
          @command : Array(String),
          @interval : Int32? = nil,
          @retries : Int32? = nil,
          @start_period : Int32? = nil,
          @timeout : Int32? = nil
        )
        end
      end

      # A unique identifier for a container in a compute on a managed container fleet instance. This
      # information makes it possible to remotely connect to a specific container on a fleet instance.
      # Related to: ContainerAttribute Use with: GetComputeAccess

      struct ContainerIdentifier
        include JSON::Serializable

        # The identifier for a container that's running in a compute.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String?

        # The runtime ID for the container that's running in a compute. This value is unique within the
        # compute. It is returned as a ContainerAttribute value in a Compute object.

        @[JSON::Field(key: "ContainerRuntimeId")]
        getter container_runtime_id : String?

        def initialize(
          @container_name : String? = nil,
          @container_runtime_id : String? = nil
        )
        end
      end

      # A mount point that binds a container to a file or directory on the host system. Part of:
      # GameServerContainerDefinition ,
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput.html
      # , SupportContainerDefinition ,
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinitionInput.html

      struct ContainerMountPoint
        include JSON::Serializable

        # The path to the source file or directory.

        @[JSON::Field(key: "InstancePath")]
        getter instance_path : String

        # The type of access for the container.

        @[JSON::Field(key: "AccessLevel")]
        getter access_level : String?

        # The mount path on the container. If this property isn't set, the instance path is used.

        @[JSON::Field(key: "ContainerPath")]
        getter container_path : String?

        def initialize(
          @instance_path : String,
          @access_level : String? = nil,
          @container_path : String? = nil
        )
        end
      end

      # A set of port ranges that can be opened on the container. A process that's running in the container
      # can bind to a port number, making it accessible to inbound traffic when it's mapped to a container
      # fleet's connection port. Each container port range specifies a network protocol. When the
      # configuration supports more than one protocol, we recommend that you use a different range for each
      # protocol. If your ranges have overlapping port numbers, Amazon GameLift Servers maps a duplicated
      # container port number to different connection ports. For example, if you include 1935 in port ranges
      # for both TCP and UDP, it might result in the following mappings: container port 1935 (tcp) =&gt;
      # connection port 2001 container port 1935 (udp) =&gt; connection port 2002 Part of:
      # GameServerContainerDefinition , GameServerContainerDefinitionInput , SupportContainerDefinition ,
      # SupportContainerDefinitionInput

      struct ContainerPortConfiguration
        include JSON::Serializable

        # A set of one or more container port number ranges. The ranges can't overlap if the ranges' network
        # protocols are the same. Overlapping ranges with different protocols is allowed but not recommended.

        @[JSON::Field(key: "ContainerPortRanges")]
        getter container_port_ranges : Array(Types::ContainerPortRange)

        def initialize(
          @container_port_ranges : Array(Types::ContainerPortRange)
        )
        end
      end

      # A set of one or more port numbers that can be opened on the container, and the supported network
      # protocol. Part of: ContainerPortConfiguration

      struct ContainerPortRange
        include JSON::Serializable

        # A starting value for the range of allowed port numbers.

        @[JSON::Field(key: "FromPort")]
        getter from_port : Int32

        # The network protocol that these ports support.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # An ending value for the range of allowed port numbers. Port numbers are end-inclusive. This value
        # must be equal to or greater than FromPort .

        @[JSON::Field(key: "ToPort")]
        getter to_port : Int32

        def initialize(
          @from_port : Int32,
          @protocol : String,
          @to_port : Int32
        )
        end
      end


      struct CreateAliasInput
        include JSON::Serializable

        # A descriptive label that is associated with an alias. Alias names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The routing configuration, including routing type and fleet target, for the alias.

        @[JSON::Field(key: "RoutingStrategy")]
        getter routing_strategy : Types::RoutingStrategy

        # A human-readable description of the alias.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of labels to assign to the new alias resource. Tags are developer-defined key-value pairs.
        # Tagging Amazon Web Services resources are useful for resource management, access management and cost
        # allocation. For more information, see Tagging Amazon Web Services Resources in the Amazon Web
        # Services General Reference .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @routing_strategy : Types::RoutingStrategy,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAliasOutput
        include JSON::Serializable

        # The newly created alias resource.

        @[JSON::Field(key: "Alias")]
        getter alias : Types::Alias?

        def initialize(
          @alias : Types::Alias? = nil
        )
        end
      end


      struct CreateBuildInput
        include JSON::Serializable

        # A descriptive label that is associated with a build. Build names do not need to be unique. You can
        # change this value later.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The operating system that your game server binaries run on. This value determines the type of fleet
        # resources that you use for this build. If your game build contains multiple executables, they all
        # must run on the same operating system. You must specify a valid operating system in this request.
        # There is no default value. You can't change a build's operating system later. Amazon Linux 2 (AL2)
        # will reach end of support on 6/30/2025. See more details in the Amazon Linux 2 FAQs . For game
        # servers that are hosted on AL2 and use server SDK version 4.x for Amazon GameLift Servers, first
        # update the game server build to server SDK 5.x, and then deploy to AL2023 instances. See Migrate to
        # server SDK version 5.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # A server SDK version you used when integrating your game server build with Amazon GameLift Servers.
        # For more information see Integrate games with custom game servers . By default Amazon GameLift
        # Servers sets this value to 4.0.2 .

        @[JSON::Field(key: "ServerSdkVersion")]
        getter server_sdk_version : String?

        # Information indicating where your game build files are stored. Use this parameter only when creating
        # a build with files stored in an Amazon S3 bucket that you own. The storage location must specify an
        # Amazon S3 bucket name and key. The location must also specify a role ARN that you set up to allow
        # Amazon GameLift Servers to access your Amazon S3 bucket. The S3 bucket and your new build must be in
        # the same Region. If a StorageLocation is specified, the size of your file can be found in your
        # Amazon S3 bucket. Amazon GameLift Servers will report a SizeOnDisk of 0.

        @[JSON::Field(key: "StorageLocation")]
        getter storage_location : Types::S3Location?

        # A list of labels to assign to the new build resource. Tags are developer defined key-value pairs.
        # Tagging Amazon Web Services resources are useful for resource management, access management and cost
        # allocation. For more information, see Tagging Amazon Web Services Resources in the Amazon Web
        # Services General Reference . Once the resource is created, you can use TagResource , UntagResource ,
        # and ListTagsForResource to add, remove, and view tags. The maximum tag limit may be lower than
        # stated. See the Amazon Web Services General Reference for actual tagging limits.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Version information that is associated with a build or script. Version strings do not need to be
        # unique. You can change this value later.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @name : String? = nil,
          @operating_system : String? = nil,
          @server_sdk_version : String? = nil,
          @storage_location : Types::S3Location? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateBuildOutput
        include JSON::Serializable

        # The newly created build resource, including a unique build IDs and status.

        @[JSON::Field(key: "Build")]
        getter build : Types::Build?

        # Amazon S3 location for your game build file, including bucket name and key.

        @[JSON::Field(key: "StorageLocation")]
        getter storage_location : Types::S3Location?

        # This element is returned only when the operation is called without a storage location. It contains
        # credentials to use when you are uploading a build file to an Amazon S3 bucket that is owned by
        # Amazon GameLift Servers. Credentials have a limited life span. To refresh these credentials, call
        # RequestUploadCredentials .

        @[JSON::Field(key: "UploadCredentials")]
        getter upload_credentials : Types::AwsCredentials?

        def initialize(
          @build : Types::Build? = nil,
          @storage_location : Types::S3Location? = nil,
          @upload_credentials : Types::AwsCredentials? = nil
        )
        end
      end


      struct CreateContainerFleetInput
        include JSON::Serializable

        # The unique identifier for an Identity and Access Management (IAM) role with permissions to run your
        # containers on resources that are managed by Amazon GameLift Servers. Use an IAM service role with
        # the GameLiftContainerFleetPolicy managed policy attached. For more information, see Set up an IAM
        # service role . You can't change this fleet property after the fleet is created. IAM role ARN values
        # use the following pattern: arn:aws:iam::[Amazon Web Services account]:role/[role name] .

        @[JSON::Field(key: "FleetRoleArn")]
        getter fleet_role_arn : String

        # Indicates whether to use On-Demand or Spot instances for this fleet. Learn more about when to use
        # On-Demand versus Spot Instances . This fleet property can't be changed after the fleet is created.
        # By default, this property is set to ON_DEMAND . You can't update this fleet property later.

        @[JSON::Field(key: "BillingType")]
        getter billing_type : String?

        # A meaningful description of the container fleet.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A container group definition resource that describes how to deploy containers with your game server
        # build and support software onto each fleet instance. You can specify the container group
        # definition's name to use the latest version. Alternatively, provide an ARN value with a specific
        # version number. Create a container group definition by calling CreateContainerGroupDefinition . This
        # operation creates a ContainerGroupDefinition resource.

        @[JSON::Field(key: "GameServerContainerGroupDefinitionName")]
        getter game_server_container_group_definition_name : String?

        # The number of times to replicate the game server container group on each fleet instance. By default,
        # Amazon GameLift Servers calculates the maximum number of game server container groups that can fit
        # on each instance. This calculation is based on the CPU and memory resources of the fleet's instance
        # type). To use the calculated maximum, don't set this parameter. If you set this number manually,
        # Amazon GameLift Servers uses your value as long as it's less than the calculated maximum.

        @[JSON::Field(key: "GameServerContainerGroupsPerInstance")]
        getter game_server_container_groups_per_instance : Int32?

        # A policy that limits the number of game sessions that each individual player can create on instances
        # in this fleet. The limit applies for a specified span of time.

        @[JSON::Field(key: "GameSessionCreationLimitPolicy")]
        getter game_session_creation_limit_policy : Types::GameSessionCreationLimitPolicy?

        # The set of port numbers to open on each fleet instance. A fleet's connection ports map to container
        # ports that are configured in the fleet's container group definitions. By default, Amazon GameLift
        # Servers calculates an optimal port range based on your fleet configuration. To use the calculated
        # range, don't set this parameter. The values are: Port range: 4192 to a number calculated based on
        # your fleet configuration. Amazon GameLift Servers uses the following formula: 4192 + [# of game
        # server container groups per fleet instance] * [# of container ports in the game server container
        # group definition] + [# of container ports in the game server container group definition] You can
        # also choose to manually set this parameter. When manually setting this parameter, you must use port
        # numbers that match the fleet's inbound permissions port range. If you set values manually, Amazon
        # GameLift Servers no longer calculates a port range for you, even if you later remove the manual
        # settings.

        @[JSON::Field(key: "InstanceConnectionPortRange")]
        getter instance_connection_port_range : Types::ConnectionPortRange?

        # The IP address ranges and port settings that allow inbound traffic to access game server processes
        # and other processes on this fleet. As a best practice, when remotely accessing a fleet instance, we
        # recommend opening ports only when you need them and closing them when you're finished. By default,
        # Amazon GameLift Servers calculates an optimal port range based on your fleet configuration. To use
        # the calculated range, don't set this parameter. The values are: Protocol: UDP Port range: 4192 to a
        # number calculated based on your fleet configuration. Amazon GameLift Servers uses the following
        # formula: 4192 + [# of game server container groups per fleet instance] * [# of container ports in
        # the game server container group definition] + [# of container ports in the game server container
        # group definition] You can also choose to manually set this parameter. When manually setting this
        # parameter, you must use port numbers that match the fleet's connection port range. If you set values
        # manually, Amazon GameLift Servers no longer calculates a port range for you, even if you later
        # remove the manual settings.

        @[JSON::Field(key: "InstanceInboundPermissions")]
        getter instance_inbound_permissions : Array(Types::IpPermission)?

        # The Amazon EC2 instance type to use for all instances in the fleet. For multi-location fleets, the
        # instance type must be available in the home region and all remote locations. Instance type
        # determines the computing resources and processing power that's available to host your game servers.
        # This includes including CPU, memory, storage, and networking capacity. By default, Amazon GameLift
        # Servers selects an instance type that fits the needs of your container groups and is available in
        # all selected fleet locations. You can also choose to manually set this parameter. See Amazon Elastic
        # Compute Cloud Instance Types for detailed descriptions of Amazon EC2 instance types. You can't
        # update this fleet property later.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # A set of locations to deploy container fleet instances to. You can add any Amazon Web Services
        # Region or Local Zone that's supported by Amazon GameLift Servers. Provide a list of one or more
        # Amazon Web Services Region codes, such as us-west-2 , or Local Zone names. Also include the fleet's
        # home Region, which is the Amazon Web Services Region where the fleet is created. For a list of
        # supported Regions and Local Zones, see Amazon GameLift Servers service locations for managed
        # hosting.

        @[JSON::Field(key: "Locations")]
        getter locations : Array(Types::LocationConfiguration)?

        # A method for collecting container logs for the fleet. Amazon GameLift Servers saves all standard
        # output for each container in logs, including game session logs. You can select from the following
        # methods: CLOUDWATCH -- Send logs to an Amazon CloudWatch log group that you define. Each container
        # emits a log stream, which is organized in the log group. S3 -- Store logs in an Amazon S3 bucket
        # that you define. NONE -- Don't collect container logs. By default, this property is set to
        # CLOUDWATCH . Amazon GameLift Servers requires permissions to send logs other Amazon Web Services
        # services in your account. These permissions are included in the IAM fleet role for this container
        # fleet (see FleetRoleArn) .

        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The name of an Amazon Web Services CloudWatch metric group to add this fleet to. You can use a
        # metric group to aggregate metrics for multiple fleets. You can specify an existing metric group name
        # or use a new name to create a new metric group. Each fleet can have only one metric group, but you
        # can change this value at any time.

        @[JSON::Field(key: "MetricGroups")]
        getter metric_groups : Array(String)?

        # Determines whether Amazon GameLift Servers can shut down game sessions on the fleet that are
        # actively running and hosting players. Amazon GameLift Servers might prompt an instance shutdown when
        # scaling down fleet capacity or when retiring unhealthy instances. You can also set game session
        # protection for individual game sessions using UpdateGameSession . NoProtection -- Game sessions can
        # be shut down during active gameplay. FullProtection -- Game sessions in ACTIVE status can't be shut
        # down. By default, this property is set to NoProtection .

        @[JSON::Field(key: "NewGameSessionProtectionPolicy")]
        getter new_game_session_protection_policy : String?

        # The name of a container group definition resource that describes a set of axillary software. A fleet
        # instance has one process for executables in this container group. A per-instance container group is
        # optional. You can update the fleet to add or remove a per-instance container group at any time. You
        # can specify the container group definition's name to use the latest version. Alternatively, provide
        # an ARN value with a specific version number. Create a container group definition by calling
        # https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html .
        # This operation creates a
        # https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html resource.

        @[JSON::Field(key: "PerInstanceContainerGroupDefinitionName")]
        getter per_instance_container_group_definition_name : String?

        # A list of labels to assign to the new fleet resource. Tags are developer-defined key-value pairs.
        # Tagging Amazon Web Services resources are useful for resource management, access management and cost
        # allocation. For more information, see Tagging Amazon Web Services Resources in the Amazon Web
        # Services General Reference .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @fleet_role_arn : String,
          @billing_type : String? = nil,
          @description : String? = nil,
          @game_server_container_group_definition_name : String? = nil,
          @game_server_container_groups_per_instance : Int32? = nil,
          @game_session_creation_limit_policy : Types::GameSessionCreationLimitPolicy? = nil,
          @instance_connection_port_range : Types::ConnectionPortRange? = nil,
          @instance_inbound_permissions : Array(Types::IpPermission)? = nil,
          @instance_type : String? = nil,
          @locations : Array(Types::LocationConfiguration)? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @metric_groups : Array(String)? = nil,
          @new_game_session_protection_policy : String? = nil,
          @per_instance_container_group_definition_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateContainerFleetOutput
        include JSON::Serializable

        # The properties for the new container fleet, including current status. All fleets are initially
        # placed in PENDING status.

        @[JSON::Field(key: "ContainerFleet")]
        getter container_fleet : Types::ContainerFleet?

        def initialize(
          @container_fleet : Types::ContainerFleet? = nil
        )
        end
      end


      struct CreateContainerGroupDefinitionInput
        include JSON::Serializable

        # A descriptive identifier for the container group definition. The name value must be unique in an
        # Amazon Web Services Region.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The platform that all containers in the group use. Containers in a group must run on the same
        # operating system. Default value: AMAZON_LINUX_2023 Amazon Linux 2 (AL2) will reach end of support on
        # 6/30/2025. See more details in the Amazon Linux 2 FAQs . For game servers that are hosted on AL2 and
        # use server SDK version 4.x for Amazon GameLift Servers, first update the game server build to server
        # SDK 5.x, and then deploy to AL2023 instances. See Migrate to server SDK version 5.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String

        # The maximum amount of memory (in MiB) to allocate to the container group. All containers in the
        # group share this memory. If you specify memory limits for an individual container, the total value
        # must be greater than any individual container's memory limit. Default value: 1024

        @[JSON::Field(key: "TotalMemoryLimitMebibytes")]
        getter total_memory_limit_mebibytes : Int32

        # The maximum amount of vCPU units to allocate to the container group (1 vCPU is equal to 1024 CPU
        # units). All containers in the group share this memory. If you specify vCPU limits for individual
        # containers, the total value must be equal to or greater than the sum of the CPU limits for all
        # containers in the group. Default value: 1

        @[JSON::Field(key: "TotalVcpuLimit")]
        getter total_vcpu_limit : Float64

        # The type of container group being defined. Container group type determines how Amazon GameLift
        # Servers deploys the container group on each fleet instance. Default value: GAME_SERVER

        @[JSON::Field(key: "ContainerGroupType")]
        getter container_group_type : String?

        # The definition for the game server container in this group. Define a game server container only when
        # the container group type is GAME_SERVER . Game server containers specify a container image with your
        # game server build. You can pass in your container definitions as a JSON file.

        @[JSON::Field(key: "GameServerContainerDefinition")]
        getter game_server_container_definition : Types::GameServerContainerDefinitionInput?

        # One or more definition for support containers in this group. You can define a support container in
        # any type of container group. You can pass in your container definitions as a JSON file.

        @[JSON::Field(key: "SupportContainerDefinitions")]
        getter support_container_definitions : Array(Types::SupportContainerDefinitionInput)?

        # A list of labels to assign to the container group definition resource. Tags are developer-defined
        # key-value pairs. Tagging Amazon Web Services resources are useful for resource management, access
        # management and cost allocation. For more information, see Tagging Amazon Web Services Resources in
        # the Amazon Web Services General Reference .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A description for the initial version of this container group definition.

        @[JSON::Field(key: "VersionDescription")]
        getter version_description : String?

        def initialize(
          @name : String,
          @operating_system : String,
          @total_memory_limit_mebibytes : Int32,
          @total_vcpu_limit : Float64,
          @container_group_type : String? = nil,
          @game_server_container_definition : Types::GameServerContainerDefinitionInput? = nil,
          @support_container_definitions : Array(Types::SupportContainerDefinitionInput)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version_description : String? = nil
        )
        end
      end


      struct CreateContainerGroupDefinitionOutput
        include JSON::Serializable

        # The properties of the new container group definition resource. You can use this resource to create a
        # container fleet.

        @[JSON::Field(key: "ContainerGroupDefinition")]
        getter container_group_definition : Types::ContainerGroupDefinition?

        def initialize(
          @container_group_definition : Types::ContainerGroupDefinition? = nil
        )
        end
      end


      struct CreateFleetInput
        include JSON::Serializable

        # A descriptive label that is associated with a fleet. Fleet names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Amazon GameLift Servers Anywhere configuration options.

        @[JSON::Field(key: "AnywhereConfiguration")]
        getter anywhere_configuration : Types::AnywhereConfiguration?

        # The unique identifier for a custom game server build to be deployed to a fleet with compute type EC2
        # . You can use either the build ID or ARN. The build must be uploaded to Amazon GameLift Servers and
        # in READY status. This fleet property can't be changed after the fleet is created.

        @[JSON::Field(key: "BuildId")]
        getter build_id : String?

        # Prompts Amazon GameLift Servers to generate a TLS/SSL certificate for the fleet. Amazon GameLift
        # Servers uses the certificates to encrypt traffic between game clients and the game servers running
        # on Amazon GameLift Servers. By default, the CertificateConfiguration is DISABLED . You can't change
        # this property after you create the fleet. Certificate Manager (ACM) certificates expire after 13
        # months. Certificate expiration can cause fleets to fail, preventing players from connecting to
        # instances in the fleet. We recommend you replace fleets before 13 months, consider using fleet
        # aliases for a smooth transition. ACM isn't available in all Amazon Web Services regions. A fleet
        # creation request with certificate generation enabled in an unsupported Region, fails with a 4xx
        # error. For more information about the supported Regions, see Supported Regions in the Certificate
        # Manager User Guide .

        @[JSON::Field(key: "CertificateConfiguration")]
        getter certificate_configuration : Types::CertificateConfiguration?

        # The type of compute resource used to host your game servers. EC2 – The game server build is deployed
        # to Amazon EC2 instances for cloud hosting. This is the default setting. ANYWHERE – Game servers and
        # supporting software are deployed to compute resources that you provide and manage. With this compute
        # type, you can also set the AnywhereConfiguration parameter.

        @[JSON::Field(key: "ComputeType")]
        getter compute_type : String?

        # A description for the fleet.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The IP address ranges and port settings that allow inbound traffic to access game server processes
        # and other processes on this fleet. Set this parameter for managed EC2 fleets. You can leave this
        # parameter empty when creating the fleet, but you must call
        # https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateFleetPortSettings to set it
        # before players can connect to game sessions. As a best practice, we recommend opening ports for
        # remote access only when you need them and closing them when you're finished. For Amazon GameLift
        # Servers Realtime fleets, Amazon GameLift Servers automatically sets TCP and UDP ranges.

        @[JSON::Field(key: "EC2InboundPermissions")]
        getter ec2_inbound_permissions : Array(Types::IpPermission)?

        # The Amazon GameLift Servers-supported Amazon EC2 instance type to use with managed EC2 fleets.
        # Instance type determines the computing resources that will be used to host your game servers,
        # including CPU, memory, storage, and networking capacity. See Amazon Elastic Compute Cloud Instance
        # Types for detailed descriptions of Amazon EC2 instance types.

        @[JSON::Field(key: "EC2InstanceType")]
        getter ec2_instance_type : String?

        # Indicates whether to use On-Demand or Spot instances for this fleet. By default, this property is
        # set to ON_DEMAND . Learn more about when to use On-Demand versus Spot Instances . This fleet
        # property can't be changed after the fleet is created.

        @[JSON::Field(key: "FleetType")]
        getter fleet_type : String?

        # A unique identifier for an IAM role that manages access to your Amazon Web Services services. With
        # an instance role ARN set, any application that runs on an instance in this fleet can assume the
        # role, including install scripts, server processes, and daemons (background processes). Create a role
        # or look up a role's ARN by using the IAM dashboard in the Amazon Web Services Management Console.
        # Learn more about using on-box credentials for your game servers at Access external resources from a
        # game server . This fleet property can't be changed after the fleet is created.

        @[JSON::Field(key: "InstanceRoleArn")]
        getter instance_role_arn : String?

        # Prompts Amazon GameLift Servers to generate a shared credentials file for the IAM role that's
        # defined in InstanceRoleArn . The shared credentials file is stored on each fleet instance and
        # refreshed as needed. Use shared credentials for applications that are deployed along with the game
        # server executable, if the game server is integrated with server SDK version 5.x. For more
        # information about using shared credentials, see Communicate with other Amazon Web Services resources
        # from your fleets .

        @[JSON::Field(key: "InstanceRoleCredentialsProvider")]
        getter instance_role_credentials_provider : String?

        # A set of remote locations to deploy additional instances to and manage as a multi-location fleet.
        # Use this parameter when creating a fleet in Amazon Web Services Regions that support multiple
        # locations. You can add any Amazon Web Services Region or Local Zone that's supported by Amazon
        # GameLift Servers. Provide a list of one or more Amazon Web Services Region codes, such as us-west-2
        # , or Local Zone names. When using this parameter, Amazon GameLift Servers requires you to include
        # your home location in the request. For a list of supported Regions and Local Zones, see Amazon
        # GameLift Servers service locations for managed hosting.

        @[JSON::Field(key: "Locations")]
        getter locations : Array(Types::LocationConfiguration)?

        # This parameter is no longer used. To specify where Amazon GameLift Servers should store log files
        # once a server process shuts down, use the Amazon GameLift Servers server API ProcessReady() and
        # specify one or more directory paths in logParameters . For more information, see Initialize the
        # server process in the Amazon GameLift Servers Developer Guide .

        @[JSON::Field(key: "LogPaths")]
        getter log_paths : Array(String)?

        # The name of an Amazon Web Services CloudWatch metric group to add this fleet to. A metric group is
        # used to aggregate the metrics for multiple fleets. You can specify an existing metric group name or
        # set a new name to create a new metric group. A fleet can be included in only one metric group at a
        # time.

        @[JSON::Field(key: "MetricGroups")]
        getter metric_groups : Array(String)?

        # The status of termination protection for active game sessions on the fleet. By default, this
        # property is set to NoProtection . You can also set game session protection for an individual game
        # session by calling UpdateGameSession . NoProtection - Game sessions can be terminated during active
        # gameplay as a result of a scale-down event. FullProtection - Game sessions in ACTIVE status cannot
        # be terminated during a scale-down event.

        @[JSON::Field(key: "NewGameSessionProtectionPolicy")]
        getter new_game_session_protection_policy : String?

        # Used when peering your Amazon GameLift Servers fleet with a VPC, the unique identifier for the
        # Amazon Web Services account that owns the VPC. You can find your account ID in the Amazon Web
        # Services Management Console under account settings.

        @[JSON::Field(key: "PeerVpcAwsAccountId")]
        getter peer_vpc_aws_account_id : String?

        # A unique identifier for a VPC with resources to be accessed by your Amazon GameLift Servers fleet.
        # The VPC must be in the same Region as your fleet. To look up a VPC ID, use the VPC Dashboard in the
        # Amazon Web Services Management Console. Learn more about VPC peering in VPC Peering with Amazon
        # GameLift Servers Fleets .

        @[JSON::Field(key: "PeerVpcId")]
        getter peer_vpc_id : String?

        # A policy that limits the number of game sessions that an individual player can create on instances
        # in this fleet within a specified span of time.

        @[JSON::Field(key: "ResourceCreationLimitPolicy")]
        getter resource_creation_limit_policy : Types::ResourceCreationLimitPolicy?

        # Instructions for how to launch and run server processes on the fleet. Set runtime configuration for
        # managed EC2 fleets. For an Anywhere fleets, set this parameter only if the fleet is running the
        # Amazon GameLift Servers Agent. The runtime configuration defines one or more server process
        # configurations. Each server process identifies a game executable or Realtime script file and the
        # number of processes to run concurrently. This parameter replaces the parameters ServerLaunchPath and
        # ServerLaunchParameters , which are still supported for backward compatibility.

        @[JSON::Field(key: "RuntimeConfiguration")]
        getter runtime_configuration : Types::RuntimeConfiguration?

        # The unique identifier for a Realtime configuration script to be deployed to a fleet with compute
        # type EC2 . You can use either the script ID or ARN. Scripts must be uploaded to Amazon GameLift
        # Servers prior to creating the fleet. This fleet property can't be changed after the fleet is
        # created.

        @[JSON::Field(key: "ScriptId")]
        getter script_id : String?

        # This parameter is no longer used. Specify server launch parameters using the RuntimeConfiguration
        # parameter. Requests that use this parameter instead continue to be valid.

        @[JSON::Field(key: "ServerLaunchParameters")]
        getter server_launch_parameters : String?

        # This parameter is no longer used. Specify a server launch path using the RuntimeConfiguration
        # parameter. Requests that use this parameter instead continue to be valid.

        @[JSON::Field(key: "ServerLaunchPath")]
        getter server_launch_path : String?

        # A list of labels to assign to the new fleet resource. Tags are developer-defined key-value pairs.
        # Tagging Amazon Web Services resources are useful for resource management, access management and cost
        # allocation. For more information, see Tagging Amazon Web Services Resources in the Amazon Web
        # Services General Reference .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @anywhere_configuration : Types::AnywhereConfiguration? = nil,
          @build_id : String? = nil,
          @certificate_configuration : Types::CertificateConfiguration? = nil,
          @compute_type : String? = nil,
          @description : String? = nil,
          @ec2_inbound_permissions : Array(Types::IpPermission)? = nil,
          @ec2_instance_type : String? = nil,
          @fleet_type : String? = nil,
          @instance_role_arn : String? = nil,
          @instance_role_credentials_provider : String? = nil,
          @locations : Array(Types::LocationConfiguration)? = nil,
          @log_paths : Array(String)? = nil,
          @metric_groups : Array(String)? = nil,
          @new_game_session_protection_policy : String? = nil,
          @peer_vpc_aws_account_id : String? = nil,
          @peer_vpc_id : String? = nil,
          @resource_creation_limit_policy : Types::ResourceCreationLimitPolicy? = nil,
          @runtime_configuration : Types::RuntimeConfiguration? = nil,
          @script_id : String? = nil,
          @server_launch_parameters : String? = nil,
          @server_launch_path : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateFleetLocationsInput
        include JSON::Serializable

        # A unique identifier for the fleet to add locations to. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # A list of locations to deploy additional instances to and manage as part of the fleet. You can add
        # any Amazon GameLift Servers-supported Amazon Web Services Region as a remote location, in the form
        # of an Amazon Web Services Region code such as us-west-2 .

        @[JSON::Field(key: "Locations")]
        getter locations : Array(Types::LocationConfiguration)

        def initialize(
          @fleet_id : String,
          @locations : Array(Types::LocationConfiguration)
        )
        end
      end


      struct CreateFleetLocationsOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that was updated with new locations.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The remote locations that are being added to the fleet, and the life-cycle status of each location.
        # For new locations, the status is set to NEW . During location creation, Amazon GameLift Servers
        # updates each location's status as instances are deployed there and prepared for game hosting. This
        # list does not include the fleet home Region or any remote locations that were already added to the
        # fleet.

        @[JSON::Field(key: "LocationStates")]
        getter location_states : Array(Types::LocationState)?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @location_states : Array(Types::LocationState)? = nil
        )
        end
      end


      struct CreateFleetOutput
        include JSON::Serializable

        # The properties for the new fleet, including the current status. All fleets are placed in NEW status
        # on creation.

        @[JSON::Field(key: "FleetAttributes")]
        getter fleet_attributes : Types::FleetAttributes?

        # The fleet's locations and life-cycle status of each location. For new fleets, the status of all
        # locations is set to NEW . During fleet creation, Amazon GameLift Servers updates each location
        # status as instances are deployed there and prepared for game hosting. This list includes an entry
        # for the fleet's home Region. For fleets with no remote locations, only one entry, representing the
        # home Region, is returned.

        @[JSON::Field(key: "LocationStates")]
        getter location_states : Array(Types::LocationState)?

        def initialize(
          @fleet_attributes : Types::FleetAttributes? = nil,
          @location_states : Array(Types::LocationState)? = nil
        )
        end
      end


      struct CreateGameServerGroupInput
        include JSON::Serializable

        # An identifier for the new game server group. This value is used to generate unique ARN identifiers
        # for the Amazon EC2 Auto Scaling group and the Amazon GameLift Servers FleetIQ game server group. The
        # name must be unique per Region per Amazon Web Services account.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # The Amazon EC2 instance types and sizes to use in the Auto Scaling group. The instance definitions
        # must specify at least two different instance types that are supported by Amazon GameLift Servers
        # FleetIQ. For more information on instance types, see EC2 Instance Types in the Amazon Elastic
        # Compute Cloud User Guide . You can optionally specify capacity weighting for each instance type. If
        # no weight value is specified for an instance type, it is set to the default value "1". For more
        # information about capacity weighting, see Instance Weighting for Amazon EC2 Auto Scaling in the
        # Amazon EC2 Auto Scaling User Guide.

        @[JSON::Field(key: "InstanceDefinitions")]
        getter instance_definitions : Array(Types::InstanceDefinition)

        # The Amazon EC2 launch template that contains configuration settings and game server code to be
        # deployed to all instances in the game server group. You can specify the template using either the
        # template name or ID. For help with creating a launch template, see Creating a Launch Template for an
        # Auto Scaling Group in the Amazon Elastic Compute Cloud Auto Scaling User Guide . After the Auto
        # Scaling group is created, update this value directly in the Auto Scaling group using the Amazon Web
        # Services console or APIs. If you specify network interfaces in your launch template, you must
        # explicitly set the property AssociatePublicIpAddress to "true". If no network interface is specified
        # in the launch template, Amazon GameLift Servers FleetIQ uses your account's default VPC.

        @[JSON::Field(key: "LaunchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification

        # The maximum number of instances allowed in the Amazon EC2 Auto Scaling group. During automatic
        # scaling events, Amazon GameLift Servers FleetIQ and EC2 do not scale up the group above this
        # maximum. After the Auto Scaling group is created, update this value directly in the Auto Scaling
        # group using the Amazon Web Services console or APIs.

        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32

        # The minimum number of instances allowed in the Amazon EC2 Auto Scaling group. During automatic
        # scaling events, Amazon GameLift Servers FleetIQ and Amazon EC2 do not scale down the group below
        # this minimum. In production, this value should be set to at least 1. After the Auto Scaling group is
        # created, update this value directly in the Auto Scaling group using the Amazon Web Services console
        # or APIs.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32

        # The Amazon Resource Name ( ARN ) for an IAM role that allows Amazon GameLift Servers to access your
        # Amazon EC2 Auto Scaling groups.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # Configuration settings to define a scaling policy for the Auto Scaling group that is optimized for
        # game hosting. The scaling policy uses the metric "PercentUtilizedGameServers" to maintain a buffer
        # of idle game servers that can immediately accommodate new games and players. After the Auto Scaling
        # group is created, update this value directly in the Auto Scaling group using the Amazon Web Services
        # console or APIs.

        @[JSON::Field(key: "AutoScalingPolicy")]
        getter auto_scaling_policy : Types::GameServerGroupAutoScalingPolicy?

        # Indicates how Amazon GameLift Servers FleetIQ balances the use of Spot Instances and On-Demand
        # Instances in the game server group. Method options include the following: SPOT_ONLY - Only Spot
        # Instances are used in the game server group. If Spot Instances are unavailable or not viable for
        # game hosting, the game server group provides no hosting capacity until Spot Instances can again be
        # used. Until then, no new instances are started, and the existing nonviable Spot Instances are
        # terminated (after current gameplay ends) and are not replaced. SPOT_PREFERRED - (default value) Spot
        # Instances are used whenever available in the game server group. If Spot Instances are unavailable,
        # the game server group continues to provide hosting capacity by falling back to On-Demand Instances.
        # Existing nonviable Spot Instances are terminated (after current gameplay ends) and are replaced with
        # new On-Demand Instances. ON_DEMAND_ONLY - Only On-Demand Instances are used in the game server
        # group. No Spot Instances are used, even when available, while this balancing strategy is in force.

        @[JSON::Field(key: "BalancingStrategy")]
        getter balancing_strategy : String?

        # A flag that indicates whether instances in the game server group are protected from early
        # termination. Unprotected instances that have active game servers running might be terminated during
        # a scale-down event, causing players to be dropped from the game. Protected instances cannot be
        # terminated while there are active game servers running except in the event of a forced game server
        # group deletion (see ). An exception to this is with Spot Instances, which can be terminated by
        # Amazon Web Services regardless of protection status. This property is set to NO_PROTECTION by
        # default.

        @[JSON::Field(key: "GameServerProtectionPolicy")]
        getter game_server_protection_policy : String?

        # A list of labels to assign to the new game server group resource. Tags are developer-defined
        # key-value pairs. Tagging Amazon Web Services resources is useful for resource management, access
        # management, and cost allocation. For more information, see Tagging Amazon Web Services Resources in
        # the Amazon Web Services General Reference .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A list of virtual private cloud (VPC) subnets to use with instances in the game server group. By
        # default, all Amazon GameLift Servers FleetIQ-supported Availability Zones are used. You can use this
        # parameter to specify VPCs that you've set up. This property cannot be updated after the game server
        # group is created, and the corresponding Auto Scaling group will always use the property value that
        # is set with this request, even if the Auto Scaling group is updated directly.

        @[JSON::Field(key: "VpcSubnets")]
        getter vpc_subnets : Array(String)?

        def initialize(
          @game_server_group_name : String,
          @instance_definitions : Array(Types::InstanceDefinition),
          @launch_template : Types::LaunchTemplateSpecification,
          @max_size : Int32,
          @min_size : Int32,
          @role_arn : String,
          @auto_scaling_policy : Types::GameServerGroupAutoScalingPolicy? = nil,
          @balancing_strategy : String? = nil,
          @game_server_protection_policy : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_subnets : Array(String)? = nil
        )
        end
      end


      struct CreateGameServerGroupOutput
        include JSON::Serializable

        # The newly created game server group object, including the new ARN value for the Amazon GameLift
        # Servers FleetIQ game server group and the object's status. The Amazon EC2 Auto Scaling group ARN is
        # initially null, since the group has not yet been created. This value is added once the game server
        # group status reaches ACTIVE .

        @[JSON::Field(key: "GameServerGroup")]
        getter game_server_group : Types::GameServerGroup?

        def initialize(
          @game_server_group : Types::GameServerGroup? = nil
        )
        end
      end


      struct CreateGameSessionInput
        include JSON::Serializable

        # The maximum number of players that can be connected simultaneously to the game session.

        @[JSON::Field(key: "MaximumPlayerSessionCount")]
        getter maximum_player_session_count : Int32

        # A unique identifier for the alias associated with the fleet to create a game session in. You can use
        # either the alias ID or ARN value. Each request must reference either a fleet ID or alias ID, but not
        # both.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String?

        # A unique identifier for a player or entity creating the game session. If you add a resource creation
        # limit policy to a fleet, the CreateGameSession operation requires a CreatorId . Amazon GameLift
        # Servers limits the number of game session creation requests with the same CreatorId in a specified
        # time period. If you your fleet doesn't have a resource creation limit policy and you provide a
        # CreatorId in your CreateGameSession requests, Amazon GameLift Servers limits requests to one request
        # per CreatorId per second. To not limit CreateGameSession requests with the same CreatorId , don't
        # provide a CreatorId in your CreateGameSession request.

        @[JSON::Field(key: "CreatorId")]
        getter creator_id : String?

        # A unique identifier for the fleet to create a game session in. You can use either the fleet ID or
        # ARN value. Each request must reference either a fleet ID or alias ID, but not both.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # A set of key-value pairs that can store custom data in a game session. For example: {"Key":
        # "difficulty", "Value": "novice"} . For an example, see Create a game session with custom properties
        # .

        @[JSON::Field(key: "GameProperties")]
        getter game_properties : Array(Types::GameProperty)?

        # A set of custom game session properties, formatted as a single string value. This data is passed to
        # a game server process with a request to start a new game session. For more information, see Start a
        # game session .

        @[JSON::Field(key: "GameSessionData")]
        getter game_session_data : String?

        # This parameter is deprecated. Use IdempotencyToken instead. Custom string that uniquely identifies a
        # request for a new game session. Maximum token length is 48 characters. If provided, this string is
        # included in the new game session's ID.

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String?

        # Custom string that uniquely identifies the new game session request. This is useful for ensuring
        # that game session requests with the same idempotency token are processed only once. Subsequent
        # requests with the same string return the original GameSession object, with an updated status.
        # Maximum token length is 48 characters. If provided, this string is included in the new game
        # session's ID. A game session ARN has the following format:
        # arn:aws:gamelift:&lt;location&gt;::gamesession/&lt;fleet ID&gt;/&lt;custom ID string or idempotency
        # token&gt; . Idempotency tokens remain in use for 30 days after a game session has ended; game
        # session objects are retained for this time period and then deleted.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # A fleet's remote location to place the new game session in. If this parameter is not set, the new
        # game session is placed in the fleet's home Region. Specify a remote location with an Amazon Web
        # Services Region code such as us-west-2 . When using an Anywhere fleet, this parameter is required
        # and must be set to the Anywhere fleet's custom location.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # A descriptive label that is associated with a game session. Session names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @maximum_player_session_count : Int32,
          @alias_id : String? = nil,
          @creator_id : String? = nil,
          @fleet_id : String? = nil,
          @game_properties : Array(Types::GameProperty)? = nil,
          @game_session_data : String? = nil,
          @game_session_id : String? = nil,
          @idempotency_token : String? = nil,
          @location : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateGameSessionOutput
        include JSON::Serializable

        # Object that describes the newly created game session record.

        @[JSON::Field(key: "GameSession")]
        getter game_session : Types::GameSession?

        def initialize(
          @game_session : Types::GameSession? = nil
        )
        end
      end


      struct CreateGameSessionQueueInput
        include JSON::Serializable

        # A descriptive label that is associated with game session queue. Queue names must be unique within
        # each Region.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Information to be added to all events that are related to this game session queue.

        @[JSON::Field(key: "CustomEventData")]
        getter custom_event_data : String?

        # A list of fleets and/or fleet aliases that can be used to fulfill game session placement requests in
        # the queue. Destinations are identified by either a fleet ARN or a fleet alias ARN, and are listed in
        # order of placement preference.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::GameSessionQueueDestination)?

        # A list of locations where a queue is allowed to place new game sessions. Locations are specified in
        # the form of Amazon Web Services Region codes, such as us-west-2 . If this parameter is not set, game
        # sessions can be placed in any queue location.

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # An SNS topic ARN that is set up to receive game session placement notifications. See Setting up
        # notifications for game session placement .

        @[JSON::Field(key: "NotificationTarget")]
        getter notification_target : String?

        # A set of policies that enforce a sliding cap on player latency when processing game sessions
        # placement requests. Use multiple policies to gradually relax the cap over time if Amazon GameLift
        # Servers can't make a placement. Policies are evaluated in order starting with the lowest maximum
        # latency value.

        @[JSON::Field(key: "PlayerLatencyPolicies")]
        getter player_latency_policies : Array(Types::PlayerLatencyPolicy)?

        # Custom settings to use when prioritizing destinations and locations for game session placements.
        # This configuration replaces the FleetIQ default prioritization process. Priority types that are not
        # explicitly named will be automatically applied at the end of the prioritization process.

        @[JSON::Field(key: "PriorityConfiguration")]
        getter priority_configuration : Types::PriorityConfiguration?

        # A list of labels to assign to the new game session queue resource. Tags are developer-defined
        # key-value pairs. Tagging Amazon Web Services resources are useful for resource management, access
        # management and cost allocation. For more information, see Tagging Amazon Web Services Resources in
        # the Amazon Web Services General Reference .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The maximum time, in seconds, that a new game session placement request remains in the queue. When a
        # request exceeds this time, the game session placement changes to a TIMED_OUT status. If you don't
        # specify a request timeout, the queue uses a default value.

        @[JSON::Field(key: "TimeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        def initialize(
          @name : String,
          @custom_event_data : String? = nil,
          @destinations : Array(Types::GameSessionQueueDestination)? = nil,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @notification_target : String? = nil,
          @player_latency_policies : Array(Types::PlayerLatencyPolicy)? = nil,
          @priority_configuration : Types::PriorityConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_in_seconds : Int32? = nil
        )
        end
      end


      struct CreateGameSessionQueueOutput
        include JSON::Serializable

        # An object that describes the newly created game session queue.

        @[JSON::Field(key: "GameSessionQueue")]
        getter game_session_queue : Types::GameSessionQueue?

        def initialize(
          @game_session_queue : Types::GameSessionQueue? = nil
        )
        end
      end


      struct CreateLocationInput
        include JSON::Serializable

        # A descriptive name for the custom location.

        @[JSON::Field(key: "LocationName")]
        getter location_name : String

        # A list of labels to assign to the new resource. Tags are developer-defined key-value pairs. Tagging
        # Amazon Web Services resources are useful for resource management, access management, and cost
        # allocation. For more information, see Tagging Amazon Web Services Resources in the Amazon Web
        # Services General Rareference .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @location_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateLocationOutput
        include JSON::Serializable

        # The details of the custom location you created.

        @[JSON::Field(key: "Location")]
        getter location : Types::LocationModel?

        def initialize(
          @location : Types::LocationModel? = nil
        )
        end
      end


      struct CreateMatchmakingConfigurationInput
        include JSON::Serializable

        # A flag that determines whether a match that was created with this configuration must be accepted by
        # the matched players. To require acceptance, set to TRUE . With this option enabled, matchmaking
        # tickets use the status REQUIRES_ACCEPTANCE to indicate when a completed potential match is waiting
        # for player acceptance.

        @[JSON::Field(key: "AcceptanceRequired")]
        getter acceptance_required : Bool

        # A unique identifier for the matchmaking configuration. This name is used to identify the
        # configuration associated with a matchmaking request or ticket.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The maximum duration, in seconds, that a matchmaking ticket can remain in process before timing out.
        # Requests that fail due to timing out can be resubmitted as needed.

        @[JSON::Field(key: "RequestTimeoutSeconds")]
        getter request_timeout_seconds : Int32

        # A unique identifier for the matchmaking rule set to use with this configuration. You can use either
        # the rule set name or ARN value. A matchmaking configuration can only use rule sets that are defined
        # in the same Region.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        # The length of time (in seconds) to wait for players to accept a proposed match, if acceptance is
        # required.

        @[JSON::Field(key: "AcceptanceTimeoutSeconds")]
        getter acceptance_timeout_seconds : Int32?

        # The number of player slots in a match to keep open for future players. For example, if the
        # configuration's rule set specifies a match for a single 12-person team, and the additional player
        # count is set to 2, only 10 players are selected for the match. This parameter is not used if
        # FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "AdditionalPlayerCount")]
        getter additional_player_count : Int32?

        # The method used to backfill game sessions that are created with this matchmaking configuration.
        # Specify MANUAL when your game manages backfill requests manually or does not use the match backfill
        # feature. Specify AUTOMATIC to have Amazon GameLift Servers create a backfill request whenever a game
        # session has one or more open slots. Learn more about manual and automatic backfill in Backfill
        # Existing Games with FlexMatch . Automatic backfill is not available when FlexMatchMode is set to
        # STANDALONE .

        @[JSON::Field(key: "BackfillMode")]
        getter backfill_mode : String?

        # Information to be added to all events related to this matchmaking configuration.

        @[JSON::Field(key: "CustomEventData")]
        getter custom_event_data : String?

        # A human-readable description of the matchmaking configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether this matchmaking configuration is being used with Amazon GameLift Servers hosting
        # or as a standalone matchmaking solution. STANDALONE - FlexMatch forms matches and returns match
        # information, including players and team assignments, in a MatchmakingSucceeded event. WITH_QUEUE -
        # FlexMatch forms matches and uses the specified Amazon GameLift Servers queue to start a game session
        # for the match.

        @[JSON::Field(key: "FlexMatchMode")]
        getter flex_match_mode : String?

        # A set of key-value pairs that can store custom data in a game session. For example: {"Key":
        # "difficulty", "Value": "novice"} . This information is added to the new GameSession object that is
        # created for a successful match. This parameter is not used if FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "GameProperties")]
        getter game_properties : Array(Types::GameProperty)?

        # A set of custom game session properties, formatted as a single string value. This data is passed to
        # a game server process with a request to start a new game session. For more information, see Start a
        # game session . This information is added to the new GameSession object that is created for a
        # successful match. This parameter is not used if FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "GameSessionData")]
        getter game_session_data : String?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers game session queue
        # resource and uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::gamesessionqueue/&lt;queue name&gt; . Queues can be located in any
        # Region. Queues are used to start new Amazon GameLift Servers-hosted game sessions for matches that
        # are created with this matchmaking configuration. If FlexMatchMode is set to STANDALONE , do not set
        # this parameter.

        @[JSON::Field(key: "GameSessionQueueArns")]
        getter game_session_queue_arns : Array(String)?

        # An SNS topic ARN that is set up to receive matchmaking notifications. See Setting up notifications
        # for matchmaking for more information.

        @[JSON::Field(key: "NotificationTarget")]
        getter notification_target : String?

        # A list of labels to assign to the new matchmaking configuration resource. Tags are developer-defined
        # key-value pairs. Tagging Amazon Web Services resources are useful for resource management, access
        # management and cost allocation. For more information, see Tagging Amazon Web Services Resources in
        # the Amazon Web Services General Reference .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @acceptance_required : Bool,
          @name : String,
          @request_timeout_seconds : Int32,
          @rule_set_name : String,
          @acceptance_timeout_seconds : Int32? = nil,
          @additional_player_count : Int32? = nil,
          @backfill_mode : String? = nil,
          @custom_event_data : String? = nil,
          @description : String? = nil,
          @flex_match_mode : String? = nil,
          @game_properties : Array(Types::GameProperty)? = nil,
          @game_session_data : String? = nil,
          @game_session_queue_arns : Array(String)? = nil,
          @notification_target : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateMatchmakingConfigurationOutput
        include JSON::Serializable

        # Object that describes the newly created matchmaking configuration.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::MatchmakingConfiguration?

        def initialize(
          @configuration : Types::MatchmakingConfiguration? = nil
        )
        end
      end


      struct CreateMatchmakingRuleSetInput
        include JSON::Serializable

        # A unique identifier for the matchmaking rule set. A matchmaking configuration identifies the rule
        # set it uses by this name value. Note that the rule set name is different from the optional name
        # field in the rule set body.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A collection of matchmaking rules, formatted as a JSON string. Comments are not allowed in JSON, but
        # most elements support a description field.

        @[JSON::Field(key: "RuleSetBody")]
        getter rule_set_body : String

        # A list of labels to assign to the new matchmaking rule set resource. Tags are developer-defined
        # key-value pairs. Tagging Amazon Web Services resources are useful for resource management, access
        # management and cost allocation. For more information, see Tagging Amazon Web Services Resources in
        # the Amazon Web Services General Reference .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @rule_set_body : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateMatchmakingRuleSetOutput
        include JSON::Serializable

        # The newly created matchmaking rule set.

        @[JSON::Field(key: "RuleSet")]
        getter rule_set : Types::MatchmakingRuleSet

        def initialize(
          @rule_set : Types::MatchmakingRuleSet
        )
        end
      end


      struct CreatePlayerSessionInput
        include JSON::Serializable

        # A unique identifier for the game session to add a player to.

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String

        # A unique identifier for a player. Player IDs are developer-defined.

        @[JSON::Field(key: "PlayerId")]
        getter player_id : String

        # Developer-defined information related to a player. Amazon GameLift Servers does not use this data,
        # so it can be formatted as needed for use in the game.

        @[JSON::Field(key: "PlayerData")]
        getter player_data : String?

        def initialize(
          @game_session_id : String,
          @player_id : String,
          @player_data : String? = nil
        )
        end
      end


      struct CreatePlayerSessionOutput
        include JSON::Serializable

        # Object that describes the newly created player session record.

        @[JSON::Field(key: "PlayerSession")]
        getter player_session : Types::PlayerSession?

        def initialize(
          @player_session : Types::PlayerSession? = nil
        )
        end
      end


      struct CreatePlayerSessionsInput
        include JSON::Serializable

        # A unique identifier for the game session to add players to.

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String

        # List of unique identifiers for the players to be added.

        @[JSON::Field(key: "PlayerIds")]
        getter player_ids : Array(String)

        # Map of string pairs, each specifying a player ID and a set of developer-defined information related
        # to the player. Amazon GameLift Servers does not use this data, so it can be formatted as needed for
        # use in the game. Any player data strings for player IDs that are not included in the PlayerIds
        # parameter are ignored.

        @[JSON::Field(key: "PlayerDataMap")]
        getter player_data_map : Hash(String, String)?

        def initialize(
          @game_session_id : String,
          @player_ids : Array(String),
          @player_data_map : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePlayerSessionsOutput
        include JSON::Serializable

        # A collection of player session objects created for the added players.

        @[JSON::Field(key: "PlayerSessions")]
        getter player_sessions : Array(Types::PlayerSession)?

        def initialize(
          @player_sessions : Array(Types::PlayerSession)? = nil
        )
        end
      end


      struct CreateScriptInput
        include JSON::Serializable

        # A descriptive label that is associated with a script. Script names do not need to be unique. You can
        # use UpdateScript to change this value later.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The location of the Amazon S3 bucket where a zipped file containing your Realtime scripts is stored.
        # The storage location must specify the Amazon S3 bucket name, the zip file name (the "key"), and a
        # role ARN that allows Amazon GameLift Servers to access the Amazon S3 storage location. The S3 bucket
        # must be in the same Region where you want to create a new script. By default, Amazon GameLift
        # Servers uploads the latest version of the zip file; if you have S3 object versioning turned on, you
        # can use the ObjectVersion parameter to specify an earlier version.

        @[JSON::Field(key: "StorageLocation")]
        getter storage_location : Types::S3Location?

        # A list of labels to assign to the new script resource. Tags are developer-defined key-value pairs.
        # Tagging Amazon Web Services resources are useful for resource management, access management and cost
        # allocation. For more information, see Tagging Amazon Web Services Resources in the Amazon Web
        # Services General Reference . Once the resource is created, you can use TagResource , UntagResource ,
        # and ListTagsForResource to add, remove, and view tags. The maximum tag limit may be lower than
        # stated. See the Amazon Web Services General Reference for actual tagging limits.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Version information that is associated with a build or script. Version strings do not need to be
        # unique. You can use UpdateScript to change this value later.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # A data object containing your Realtime scripts and dependencies as a zip file. The zip file can have
        # one or multiple files. Maximum size of a zip file is 5 MB. When using the Amazon Web Services CLI
        # tool to create a script, this parameter is set to the zip file name. It must be prepended with the
        # string "fileb://" to indicate that the file data is a binary object. For example: --zip-file
        # fileb://myRealtimeScript.zip .

        @[JSON::Field(key: "ZipFile")]
        getter zip_file : Bytes?

        def initialize(
          @name : String? = nil,
          @storage_location : Types::S3Location? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version : String? = nil,
          @zip_file : Bytes? = nil
        )
        end
      end


      struct CreateScriptOutput
        include JSON::Serializable

        # The newly created script record with a unique script ID and ARN. The new script's storage location
        # reflects an Amazon S3 location: (1) If the script was uploaded from an S3 bucket under your account,
        # the storage location reflects the information that was provided in the CreateScript request; (2) If
        # the script file was uploaded from a local zip file, the storage location reflects an S3 location
        # controls by the Amazon GameLift Servers service.

        @[JSON::Field(key: "Script")]
        getter script : Types::Script?

        def initialize(
          @script : Types::Script? = nil
        )
        end
      end


      struct CreateVpcPeeringAuthorizationInput
        include JSON::Serializable

        # A unique identifier for the Amazon Web Services account that you use to manage your Amazon GameLift
        # Servers fleet. You can find your Account ID in the Amazon Web Services Management Console under
        # account settings.

        @[JSON::Field(key: "GameLiftAwsAccountId")]
        getter game_lift_aws_account_id : String

        # A unique identifier for a VPC with resources to be accessed by your Amazon GameLift Servers fleet.
        # The VPC must be in the same Region as your fleet. To look up a VPC ID, use the VPC Dashboard in the
        # Amazon Web Services Management Console. Learn more about VPC peering in VPC Peering with Amazon
        # GameLift Servers Fleets .

        @[JSON::Field(key: "PeerVpcId")]
        getter peer_vpc_id : String

        def initialize(
          @game_lift_aws_account_id : String,
          @peer_vpc_id : String
        )
        end
      end


      struct CreateVpcPeeringAuthorizationOutput
        include JSON::Serializable

        # Details on the requested VPC peering authorization, including expiration.

        @[JSON::Field(key: "VpcPeeringAuthorization")]
        getter vpc_peering_authorization : Types::VpcPeeringAuthorization?

        def initialize(
          @vpc_peering_authorization : Types::VpcPeeringAuthorization? = nil
        )
        end
      end


      struct CreateVpcPeeringConnectionInput
        include JSON::Serializable

        # A unique identifier for the fleet. You can use either the fleet ID or ARN value. This tells Amazon
        # GameLift Servers which GameLift VPC to peer with.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # A unique identifier for the Amazon Web Services account with the VPC that you want to peer your
        # Amazon GameLift Servers fleet with. You can find your Account ID in the Amazon Web Services
        # Management Console under account settings.

        @[JSON::Field(key: "PeerVpcAwsAccountId")]
        getter peer_vpc_aws_account_id : String

        # A unique identifier for a VPC with resources to be accessed by your Amazon GameLift Servers fleet.
        # The VPC must be in the same Region as your fleet. To look up a VPC ID, use the VPC Dashboard in the
        # Amazon Web Services Management Console. Learn more about VPC peering in VPC Peering with Amazon
        # GameLift Servers Fleets .

        @[JSON::Field(key: "PeerVpcId")]
        getter peer_vpc_id : String

        def initialize(
          @fleet_id : String,
          @peer_vpc_aws_account_id : String,
          @peer_vpc_id : String
        )
        end
      end


      struct CreateVpcPeeringConnectionOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAliasInput
        include JSON::Serializable

        # A unique identifier of the alias that you want to delete. You can use either the alias ID or ARN
        # value.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String

        def initialize(
          @alias_id : String
        )
        end
      end


      struct DeleteBuildInput
        include JSON::Serializable

        # A unique identifier for the build to delete. You can use either the build ID or ARN value.

        @[JSON::Field(key: "BuildId")]
        getter build_id : String

        def initialize(
          @build_id : String
        )
        end
      end


      struct DeleteContainerFleetInput
        include JSON::Serializable

        # A unique identifier for the container fleet to delete. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        def initialize(
          @fleet_id : String
        )
        end
      end


      struct DeleteContainerFleetOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteContainerGroupDefinitionInput
        include JSON::Serializable

        # The unique identifier for the container group definition to delete. You can use either the Name or
        # ARN value.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The number of most recent versions to keep while deleting all older versions.

        @[JSON::Field(key: "VersionCountToRetain")]
        getter version_count_to_retain : Int32?

        # The specific version to delete.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32?

        def initialize(
          @name : String,
          @version_count_to_retain : Int32? = nil,
          @version_number : Int32? = nil
        )
        end
      end


      struct DeleteContainerGroupDefinitionOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFleetInput
        include JSON::Serializable

        # A unique identifier for the fleet to be deleted. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        def initialize(
          @fleet_id : String
        )
        end
      end


      struct DeleteFleetLocationsInput
        include JSON::Serializable

        # A unique identifier for the fleet to delete locations for. You can use either the fleet ID or ARN
        # value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The list of fleet locations to delete. Specify locations in the form of an Amazon Web Services
        # Region code, such as us-west-2 .

        @[JSON::Field(key: "Locations")]
        getter locations : Array(String)

        def initialize(
          @fleet_id : String,
          @locations : Array(String)
        )
        end
      end


      struct DeleteFleetLocationsOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that location attributes are being deleted for.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The remote locations that are being deleted, with each location status set to DELETING .

        @[JSON::Field(key: "LocationStates")]
        getter location_states : Array(Types::LocationState)?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @location_states : Array(Types::LocationState)? = nil
        )
        end
      end


      struct DeleteGameServerGroupInput
        include JSON::Serializable

        # A unique identifier for the game server group. Use either the name or ARN value.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # The type of delete to perform. Options include the following: SAFE_DELETE – (default) Terminates the
        # game server group and Amazon EC2 Auto Scaling group only when it has no game servers that are in
        # UTILIZED status. FORCE_DELETE – Terminates the game server group, including all active game servers
        # regardless of their utilization status, and the Amazon EC2 Auto Scaling group. RETAIN – Does a safe
        # delete of the game server group but retains the Amazon EC2 Auto Scaling group as is.

        @[JSON::Field(key: "DeleteOption")]
        getter delete_option : String?

        def initialize(
          @game_server_group_name : String,
          @delete_option : String? = nil
        )
        end
      end


      struct DeleteGameServerGroupOutput
        include JSON::Serializable

        # An object that describes the deleted game server group resource, with status updated to
        # DELETE_SCHEDULED .

        @[JSON::Field(key: "GameServerGroup")]
        getter game_server_group : Types::GameServerGroup?

        def initialize(
          @game_server_group : Types::GameServerGroup? = nil
        )
        end
      end


      struct DeleteGameSessionQueueInput
        include JSON::Serializable

        # A descriptive label that is associated with game session queue. Queue names must be unique within
        # each Region. You can use either the queue ID or ARN value.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteGameSessionQueueOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLocationInput
        include JSON::Serializable

        # The location name of the custom location to be deleted.

        @[JSON::Field(key: "LocationName")]
        getter location_name : String

        def initialize(
          @location_name : String
        )
        end
      end


      struct DeleteLocationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMatchmakingConfigurationInput
        include JSON::Serializable

        # A unique identifier for the matchmaking configuration. You can use either the configuration name or
        # ARN value.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteMatchmakingConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMatchmakingRuleSetInput
        include JSON::Serializable

        # A unique identifier for the matchmaking rule set to be deleted. (Note: The rule set name is
        # different from the optional "name" field in the rule set body.) You can use either the rule set name
        # or ARN value.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteMatchmakingRuleSetOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteScalingPolicyInput
        include JSON::Serializable

        # A unique identifier for the fleet to be deleted. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # A descriptive label that is associated with a fleet's scaling policy. Policy names do not need to be
        # unique.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @fleet_id : String,
          @name : String
        )
        end
      end


      struct DeleteScriptInput
        include JSON::Serializable

        # A unique identifier for the Realtime script to delete. You can use either the script ID or ARN
        # value.

        @[JSON::Field(key: "ScriptId")]
        getter script_id : String

        def initialize(
          @script_id : String
        )
        end
      end


      struct DeleteVpcPeeringAuthorizationInput
        include JSON::Serializable

        # A unique identifier for the Amazon Web Services account that you use to manage your Amazon GameLift
        # Servers fleet. You can find your Account ID in the Amazon Web Services Management Console under
        # account settings.

        @[JSON::Field(key: "GameLiftAwsAccountId")]
        getter game_lift_aws_account_id : String

        # A unique identifier for a VPC with resources to be accessed by your Amazon GameLift Servers fleet.
        # The VPC must be in the same Region as your fleet. To look up a VPC ID, use the VPC Dashboard in the
        # Amazon Web Services Management Console. Learn more about VPC peering in VPC Peering with Amazon
        # GameLift Servers Fleets .

        @[JSON::Field(key: "PeerVpcId")]
        getter peer_vpc_id : String

        def initialize(
          @game_lift_aws_account_id : String,
          @peer_vpc_id : String
        )
        end
      end


      struct DeleteVpcPeeringAuthorizationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteVpcPeeringConnectionInput
        include JSON::Serializable

        # A unique identifier for the fleet. This fleet specified must match the fleet referenced in the VPC
        # peering connection record. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # A unique identifier for a VPC peering connection.

        @[JSON::Field(key: "VpcPeeringConnectionId")]
        getter vpc_peering_connection_id : String

        def initialize(
          @fleet_id : String,
          @vpc_peering_connection_id : String
        )
        end
      end


      struct DeleteVpcPeeringConnectionOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Set of rules for processing a deployment for a container fleet update.

      struct DeploymentConfiguration
        include JSON::Serializable

        # Determines what actions to take if a deployment fails. If the fleet is multi-location, this strategy
        # applies across all fleet locations. With a rollback strategy, updated fleet instances are rolled
        # back to the last successful deployment. Alternatively, you can maintain a few impaired containers
        # for the purpose of debugging, while all other tasks return to the last successful deployment.

        @[JSON::Field(key: "ImpairmentStrategy")]
        getter impairment_strategy : String?

        # Sets a minimum level of healthy tasks to maintain during deployment activity.

        @[JSON::Field(key: "MinimumHealthyPercentage")]
        getter minimum_healthy_percentage : Int32?

        # Determines how fleet deployment activity affects active game sessions on the fleet. With protection,
        # a deployment honors game session protection, and delays actions that would interrupt a protected
        # active game session until the game session ends. Without protection, deployment activity can shut
        # down all running tasks, including active game sessions, regardless of game session protection.

        @[JSON::Field(key: "ProtectionStrategy")]
        getter protection_strategy : String?

        def initialize(
          @impairment_strategy : String? = nil,
          @minimum_healthy_percentage : Int32? = nil,
          @protection_strategy : String? = nil
        )
        end
      end

      # Information about the most recent deployment for the container fleet.

      struct DeploymentDetails
        include JSON::Serializable

        # A unique identifier for a fleet deployment.

        @[JSON::Field(key: "LatestDeploymentId")]
        getter latest_deployment_id : String?

        def initialize(
          @latest_deployment_id : String? = nil
        )
        end
      end


      struct DeregisterComputeInput
        include JSON::Serializable

        # The unique identifier of the compute resource to deregister. For an Anywhere fleet compute, use the
        # registered compute name.

        @[JSON::Field(key: "ComputeName")]
        getter compute_name : String

        # A unique identifier for the fleet the compute resource is currently registered to.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        def initialize(
          @compute_name : String,
          @fleet_id : String
        )
        end
      end


      struct DeregisterComputeOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterGameServerInput
        include JSON::Serializable

        # A unique identifier for the game server group where the game server is running.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # A custom string that uniquely identifies the game server to deregister.

        @[JSON::Field(key: "GameServerId")]
        getter game_server_id : String

        def initialize(
          @game_server_group_name : String,
          @game_server_id : String
        )
        end
      end


      struct DescribeAliasInput
        include JSON::Serializable

        # The unique identifier for the fleet alias that you want to retrieve. You can use either the alias ID
        # or ARN value.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String

        def initialize(
          @alias_id : String
        )
        end
      end


      struct DescribeAliasOutput
        include JSON::Serializable

        # The requested alias resource.

        @[JSON::Field(key: "Alias")]
        getter alias : Types::Alias?

        def initialize(
          @alias : Types::Alias? = nil
        )
        end
      end


      struct DescribeBuildInput
        include JSON::Serializable

        # A unique identifier for the build to retrieve properties for. You can use either the build ID or ARN
        # value.

        @[JSON::Field(key: "BuildId")]
        getter build_id : String

        def initialize(
          @build_id : String
        )
        end
      end


      struct DescribeBuildOutput
        include JSON::Serializable

        # Set of properties describing the requested build.

        @[JSON::Field(key: "Build")]
        getter build : Types::Build?

        def initialize(
          @build : Types::Build? = nil
        )
        end
      end


      struct DescribeComputeInput
        include JSON::Serializable

        # The unique identifier of the compute resource to retrieve properties for. For a managed container
        # fleet or Anywhere fleet, use a compute name. For an EC2 fleet, use an instance ID. To retrieve a
        # fleet's compute identifiers, call ListCompute .

        @[JSON::Field(key: "ComputeName")]
        getter compute_name : String

        # A unique identifier for the fleet that the compute belongs to. You can use either the fleet ID or
        # ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        def initialize(
          @compute_name : String,
          @fleet_id : String
        )
        end
      end


      struct DescribeComputeOutput
        include JSON::Serializable

        # The set of properties for the requested compute resource.

        @[JSON::Field(key: "Compute")]
        getter compute : Types::Compute?

        def initialize(
          @compute : Types::Compute? = nil
        )
        end
      end


      struct DescribeContainerFleetInput
        include JSON::Serializable

        # A unique identifier for the container fleet to retrieve. You can use either the fleet ID or ARN
        # value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        def initialize(
          @fleet_id : String
        )
        end
      end


      struct DescribeContainerFleetOutput
        include JSON::Serializable

        # The properties for the requested container fleet, including current status.

        @[JSON::Field(key: "ContainerFleet")]
        getter container_fleet : Types::ContainerFleet?

        def initialize(
          @container_fleet : Types::ContainerFleet? = nil
        )
        end
      end


      struct DescribeContainerGroupDefinitionInput
        include JSON::Serializable

        # The unique identifier for the container group definition to retrieve properties for. You can use
        # either the Name or ARN value.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The specific version to retrieve.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32?

        def initialize(
          @name : String,
          @version_number : Int32? = nil
        )
        end
      end


      struct DescribeContainerGroupDefinitionOutput
        include JSON::Serializable

        # The properties of the requested container group definition resource.

        @[JSON::Field(key: "ContainerGroupDefinition")]
        getter container_group_definition : Types::ContainerGroupDefinition?

        def initialize(
          @container_group_definition : Types::ContainerGroupDefinition? = nil
        )
        end
      end


      struct DescribeEC2InstanceLimitsInput
        include JSON::Serializable

        # Name of an Amazon EC2 instance type that is supported in Amazon GameLift Servers. A fleet instance
        # type determines the computing resources of each instance in the fleet, including CPU, memory,
        # storage, and networking capacity. Do not specify a value for this parameter to retrieve limits for
        # all instance types.

        @[JSON::Field(key: "EC2InstanceType")]
        getter ec2_instance_type : String?

        # The name of a remote location to request instance limits for, in the form of an Amazon Web Services
        # Region code such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @ec2_instance_type : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct DescribeEC2InstanceLimitsOutput
        include JSON::Serializable

        # The maximum number of instances for the specified instance type.

        @[JSON::Field(key: "EC2InstanceLimits")]
        getter ec2_instance_limits : Array(Types::EC2InstanceLimit)?

        def initialize(
          @ec2_instance_limits : Array(Types::EC2InstanceLimit)? = nil
        )
        end
      end


      struct DescribeFleetAttributesInput
        include JSON::Serializable

        # A list of unique fleet identifiers to retrieve attributes for. You can use either the fleet ID or
        # ARN value. To retrieve attributes for all current fleets, do not include this parameter.

        @[JSON::Field(key: "FleetIds")]
        getter fleet_ids : Array(String)?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages. This parameter is ignored when the request specifies one or a list of fleet
        # IDs.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value. This parameter is ignored when the request specifies one or a list of fleet IDs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_ids : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetAttributesOutput
        include JSON::Serializable

        # A collection of objects containing attribute metadata for each requested fleet ID. Attribute objects
        # are returned only for fleets that currently exist.

        @[JSON::Field(key: "FleetAttributes")]
        getter fleet_attributes : Array(Types::FleetAttributes)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_attributes : Array(Types::FleetAttributes)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetCapacityInput
        include JSON::Serializable

        # A unique identifier for the fleet to retrieve capacity information for. You can use either the fleet
        # ID or ARN value. Leave this parameter empty to retrieve capacity information for all fleets.

        @[JSON::Field(key: "FleetIds")]
        getter fleet_ids : Array(String)?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages. This parameter is ignored when the request specifies one or a list of fleet
        # IDs.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value. This parameter is ignored when the request specifies one or a list of fleet IDs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_ids : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetCapacityOutput
        include JSON::Serializable

        # A collection of objects that contains capacity information for each requested fleet ID. Capacity
        # objects are returned only for fleets that currently exist. Changes in desired instance value can
        # take up to 1 minute to be reflected.

        @[JSON::Field(key: "FleetCapacity")]
        getter fleet_capacity : Array(Types::FleetCapacity)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_capacity : Array(Types::FleetCapacity)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetDeploymentInput
        include JSON::Serializable

        # A unique identifier for the container fleet. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # A unique identifier for the deployment to return information for.

        @[JSON::Field(key: "DeploymentId")]
        getter deployment_id : String?

        def initialize(
          @fleet_id : String,
          @deployment_id : String? = nil
        )
        end
      end


      struct DescribeFleetDeploymentOutput
        include JSON::Serializable

        # The requested deployment information.

        @[JSON::Field(key: "FleetDeployment")]
        getter fleet_deployment : Types::FleetDeployment?

        # If the deployment is for a multi-location fleet, the requests returns the deployment status in each
        # fleet location.

        @[JSON::Field(key: "LocationalDeployments")]
        getter locational_deployments : Hash(String, Types::LocationalDeployment)?

        def initialize(
          @fleet_deployment : Types::FleetDeployment? = nil,
          @locational_deployments : Hash(String, Types::LocationalDeployment)? = nil
        )
        end
      end


      struct DescribeFleetEventsInput
        include JSON::Serializable

        # A unique identifier for the fleet to get event logs for. You can use either the fleet ID or ARN
        # value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The most recent date to retrieve event logs for. If no end time is specified, this call returns
        # entries from the specified start time up to the present. Format is a number expressed in Unix time
        # as milliseconds (ex: "1469498468.057").

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The earliest date to retrieve event logs for. If no start time is specified, this call returns
        # entries starting from when the fleet was created to the specified end time. Format is a number
        # expressed in Unix time as milliseconds (ex: "1469498468.057").

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @fleet_id : String,
          @end_time : Time? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct DescribeFleetEventsOutput
        include JSON::Serializable

        # A collection of objects containing event log entries for the specified fleet.

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetLocationAttributesInput
        include JSON::Serializable

        # A unique identifier for the fleet to retrieve remote locations for. You can use either the fleet ID
        # or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages. This limit is not currently enforced.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A list of fleet locations to retrieve information for. Specify locations in the form of an Amazon
        # Web Services Region code, such as us-west-2 .

        @[JSON::Field(key: "Locations")]
        getter locations : Array(String)?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_id : String,
          @limit : Int32? = nil,
          @locations : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetLocationAttributesOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that location attributes were requested for.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # Location-specific information on the requested fleet's remote locations.

        @[JSON::Field(key: "LocationAttributes")]
        getter location_attributes : Array(Types::LocationAttributes)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @location_attributes : Array(Types::LocationAttributes)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetLocationCapacityInput
        include JSON::Serializable

        # A unique identifier for the fleet to request location capacity for. You can use either the fleet ID
        # or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The fleet location to retrieve capacity information for. Specify a location in the form of an Amazon
        # Web Services Region code, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String

        def initialize(
          @fleet_id : String,
          @location : String
        )
        end
      end


      struct DescribeFleetLocationCapacityOutput
        include JSON::Serializable

        # Resource capacity information for the requested fleet location. Capacity objects are returned only
        # for fleets and locations that currently exist. Changes in desired instance value can take up to 1
        # minute to be reflected.

        @[JSON::Field(key: "FleetCapacity")]
        getter fleet_capacity : Types::FleetCapacity?

        def initialize(
          @fleet_capacity : Types::FleetCapacity? = nil
        )
        end
      end


      struct DescribeFleetLocationUtilizationInput
        include JSON::Serializable

        # A unique identifier for the fleet to request location utilization for. You can use either the fleet
        # ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The fleet location to retrieve utilization information for. Specify a location in the form of an
        # Amazon Web Services Region code, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String

        def initialize(
          @fleet_id : String,
          @location : String
        )
        end
      end


      struct DescribeFleetLocationUtilizationOutput
        include JSON::Serializable

        # Utilization information for the requested fleet location. Utilization objects are returned only for
        # fleets and locations that currently exist.

        @[JSON::Field(key: "FleetUtilization")]
        getter fleet_utilization : Types::FleetUtilization?

        def initialize(
          @fleet_utilization : Types::FleetUtilization? = nil
        )
        end
      end


      struct DescribeFleetPortSettingsInput
        include JSON::Serializable

        # A unique identifier for the fleet to retrieve port settings for. You can use either the fleet ID or
        # ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # A remote location to check for status of port setting updates. Use the Amazon Web Services Region
        # code format, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @fleet_id : String,
          @location : String? = nil
        )
        end
      end


      struct DescribeFleetPortSettingsOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that was requested.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The port settings for the requested fleet ID.

        @[JSON::Field(key: "InboundPermissions")]
        getter inbound_permissions : Array(Types::IpPermission)?

        # The requested fleet location, expressed as an Amazon Web Services Region code, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The current status of updates to the fleet's port settings in the requested fleet location. A status
        # of PENDING_UPDATE indicates that an update was requested for the fleet but has not yet been
        # completed for the location.

        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @inbound_permissions : Array(Types::IpPermission)? = nil,
          @location : String? = nil,
          @update_status : String? = nil
        )
        end
      end


      struct DescribeFleetUtilizationInput
        include JSON::Serializable

        # A unique identifier for the fleet to retrieve utilization data for. You can use either the fleet ID
        # or ARN value. To retrieve attributes for all current fleets, do not include this parameter.

        @[JSON::Field(key: "FleetIds")]
        getter fleet_ids : Array(String)?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages. This parameter is ignored when the request specifies one or a list of fleet
        # IDs.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value. This parameter is ignored when the request specifies one or a list of fleet IDs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_ids : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeFleetUtilizationOutput
        include JSON::Serializable

        # A collection of objects containing utilization information for each requested fleet ID. Utilization
        # objects are returned only for fleets that currently exist.

        @[JSON::Field(key: "FleetUtilization")]
        getter fleet_utilization : Array(Types::FleetUtilization)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_utilization : Array(Types::FleetUtilization)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeGameServerGroupInput
        include JSON::Serializable

        # A unique identifier for the game server group. Use either the name or ARN value.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        def initialize(
          @game_server_group_name : String
        )
        end
      end


      struct DescribeGameServerGroupOutput
        include JSON::Serializable

        # An object with the property settings for the requested game server group resource.

        @[JSON::Field(key: "GameServerGroup")]
        getter game_server_group : Types::GameServerGroup?

        def initialize(
          @game_server_group : Types::GameServerGroup? = nil
        )
        end
      end


      struct DescribeGameServerInput
        include JSON::Serializable

        # A unique identifier for the game server group where the game server is running.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # A custom string that uniquely identifies the game server information to be retrieved.

        @[JSON::Field(key: "GameServerId")]
        getter game_server_id : String

        def initialize(
          @game_server_group_name : String,
          @game_server_id : String
        )
        end
      end


      struct DescribeGameServerInstancesInput
        include JSON::Serializable

        # A unique identifier for the game server group. Use either the name or ARN value.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # The Amazon EC2 instance IDs that you want to retrieve status on. Amazon EC2 instance IDs use a
        # 17-character format, for example: i-1234567890abcdef0 . To retrieve all instances in the game server
        # group, leave this parameter empty.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @game_server_group_name : String,
          @instance_ids : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeGameServerInstancesOutput
        include JSON::Serializable

        # The collection of requested game server instances.

        @[JSON::Field(key: "GameServerInstances")]
        getter game_server_instances : Array(Types::GameServerInstance)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @game_server_instances : Array(Types::GameServerInstance)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeGameServerOutput
        include JSON::Serializable

        # Object that describes the requested game server.

        @[JSON::Field(key: "GameServer")]
        getter game_server : Types::GameServer?

        def initialize(
          @game_server : Types::GameServer? = nil
        )
        end
      end


      struct DescribeGameSessionDetailsInput
        include JSON::Serializable

        # A unique identifier for the alias associated with the fleet to retrieve all game sessions for. You
        # can use either the alias ID or ARN value.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String?

        # A unique identifier for the fleet to retrieve all game sessions active on the fleet. You can use
        # either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # A unique identifier for the game session to retrieve.

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A fleet location to get game session details for. You can specify a fleet's home Region or a remote
        # location. Use the Amazon Web Services Region code format, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Game session status to filter results on. Possible game session statuses include ACTIVE , TERMINATED
        # , ACTIVATING and TERMINATING (the last two are transitory).

        @[JSON::Field(key: "StatusFilter")]
        getter status_filter : String?

        def initialize(
          @alias_id : String? = nil,
          @fleet_id : String? = nil,
          @game_session_id : String? = nil,
          @limit : Int32? = nil,
          @location : String? = nil,
          @next_token : String? = nil,
          @status_filter : String? = nil
        )
        end
      end


      struct DescribeGameSessionDetailsOutput
        include JSON::Serializable

        # A collection of properties for each game session that matches the request.

        @[JSON::Field(key: "GameSessionDetails")]
        getter game_session_details : Array(Types::GameSessionDetail)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @game_session_details : Array(Types::GameSessionDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeGameSessionPlacementInput
        include JSON::Serializable

        # A unique identifier for a game session placement to retrieve.

        @[JSON::Field(key: "PlacementId")]
        getter placement_id : String

        def initialize(
          @placement_id : String
        )
        end
      end


      struct DescribeGameSessionPlacementOutput
        include JSON::Serializable

        # Object that describes the requested game session placement.

        @[JSON::Field(key: "GameSessionPlacement")]
        getter game_session_placement : Types::GameSessionPlacement?

        def initialize(
          @game_session_placement : Types::GameSessionPlacement? = nil
        )
        end
      end


      struct DescribeGameSessionQueuesInput
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages. You can request up to 50 results.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A list of queue names to retrieve information for. You can use either the queue ID or ARN value. To
        # request settings for all queues, leave this parameter empty.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeGameSessionQueuesOutput
        include JSON::Serializable

        # A collection of objects that describe the requested game session queues.

        @[JSON::Field(key: "GameSessionQueues")]
        getter game_session_queues : Array(Types::GameSessionQueue)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @game_session_queues : Array(Types::GameSessionQueue)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeGameSessionsInput
        include JSON::Serializable

        # A unique identifier for the alias associated with the fleet to retrieve game sessions for. You can
        # use either the alias ID or ARN value.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String?

        # A unique identifier for the fleet to retrieve game sessions for. You can use either the fleet ID or
        # ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # A unique identifier for the game session to retrieve.

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A fleet location to get game sessions for. You can specify a fleet's home Region or a remote
        # location. Use the Amazon Web Services Region code format, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Game session status to filter results on. You can filter on the following states: ACTIVE ,
        # TERMINATED , ACTIVATING , and TERMINATING . The last two are transitory and used for only very brief
        # periods of time.

        @[JSON::Field(key: "StatusFilter")]
        getter status_filter : String?

        def initialize(
          @alias_id : String? = nil,
          @fleet_id : String? = nil,
          @game_session_id : String? = nil,
          @limit : Int32? = nil,
          @location : String? = nil,
          @next_token : String? = nil,
          @status_filter : String? = nil
        )
        end
      end


      struct DescribeGameSessionsOutput
        include JSON::Serializable

        # A collection of properties for each game session that matches the request.

        @[JSON::Field(key: "GameSessions")]
        getter game_sessions : Array(Types::GameSession)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @game_sessions : Array(Types::GameSession)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstancesInput
        include JSON::Serializable

        # A unique identifier for the fleet to retrieve instance information for. You can use either the fleet
        # ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # A unique identifier for an instance to retrieve. Specify an instance ID or leave blank to retrieve
        # all instances in the fleet.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The name of a location to retrieve instance information for, in the form of an Amazon Web Services
        # Region code such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_id : String,
          @instance_id : String? = nil,
          @limit : Int32? = nil,
          @location : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstancesOutput
        include JSON::Serializable

        # A collection of objects containing properties for each instance returned.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instances : Array(Types::Instance)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMatchmakingConfigurationsInput
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages. This parameter is limited to 10.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A unique identifier for the matchmaking configuration(s) to retrieve. You can use either the
        # configuration name or ARN value. To request all existing configurations, leave this parameter empty.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A unique identifier for the matchmaking rule set. You can use either the rule set name or ARN value.
        # Use this parameter to retrieve all matchmaking configurations that use this rule set.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String?

        def initialize(
          @limit : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil,
          @rule_set_name : String? = nil
        )
        end
      end


      struct DescribeMatchmakingConfigurationsOutput
        include JSON::Serializable

        # A collection of requested matchmaking configurations.

        @[JSON::Field(key: "Configurations")]
        getter configurations : Array(Types::MatchmakingConfiguration)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configurations : Array(Types::MatchmakingConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMatchmakingInput
        include JSON::Serializable

        # A unique identifier for a matchmaking ticket. You can include up to 10 ID values.

        @[JSON::Field(key: "TicketIds")]
        getter ticket_ids : Array(String)

        def initialize(
          @ticket_ids : Array(String)
        )
        end
      end


      struct DescribeMatchmakingOutput
        include JSON::Serializable

        # A collection of existing matchmaking ticket objects matching the request.

        @[JSON::Field(key: "TicketList")]
        getter ticket_list : Array(Types::MatchmakingTicket)?

        def initialize(
          @ticket_list : Array(Types::MatchmakingTicket)? = nil
        )
        end
      end


      struct DescribeMatchmakingRuleSetsInput
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A list of one or more matchmaking rule set names to retrieve details for. (Note: The rule set name
        # is different from the optional "name" field in the rule set body.) You can use either the rule set
        # name or ARN value.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMatchmakingRuleSetsOutput
        include JSON::Serializable

        # A collection of requested matchmaking rule set objects.

        @[JSON::Field(key: "RuleSets")]
        getter rule_sets : Array(Types::MatchmakingRuleSet)

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @rule_sets : Array(Types::MatchmakingRuleSet),
          @next_token : String? = nil
        )
        end
      end


      struct DescribePlayerSessionsInput
        include JSON::Serializable

        # A unique identifier for the game session to retrieve player sessions for.

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages. If a player session ID is specified, this parameter is ignored.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value. If a player session ID is specified, this parameter is ignored.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A unique identifier for a player to retrieve player sessions for.

        @[JSON::Field(key: "PlayerId")]
        getter player_id : String?

        # A unique identifier for a player session to retrieve.

        @[JSON::Field(key: "PlayerSessionId")]
        getter player_session_id : String?

        # Player session status to filter results on. Note that when a PlayerSessionId or PlayerId is provided
        # in a DescribePlayerSessions request, then the PlayerSessionStatusFilter has no effect on the
        # response. Possible player session statuses include the following: RESERVED -- The player session
        # request has been received, but the player has not yet connected to the server process and/or been
        # validated. ACTIVE -- The player has been validated by the server process and is currently connected.
        # COMPLETED -- The player connection has been dropped. TIMEDOUT -- A player session request was
        # received, but the player did not connect and/or was not validated within the timeout limit (60
        # seconds).

        @[JSON::Field(key: "PlayerSessionStatusFilter")]
        getter player_session_status_filter : String?

        def initialize(
          @game_session_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @player_id : String? = nil,
          @player_session_id : String? = nil,
          @player_session_status_filter : String? = nil
        )
        end
      end


      struct DescribePlayerSessionsOutput
        include JSON::Serializable

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A collection of objects containing properties for each player session that matches the request.

        @[JSON::Field(key: "PlayerSessions")]
        getter player_sessions : Array(Types::PlayerSession)?

        def initialize(
          @next_token : String? = nil,
          @player_sessions : Array(Types::PlayerSession)? = nil
        )
        end
      end


      struct DescribeRuntimeConfigurationInput
        include JSON::Serializable

        # A unique identifier for the fleet to get the runtime configuration for. You can use either the fleet
        # ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        def initialize(
          @fleet_id : String
        )
        end
      end


      struct DescribeRuntimeConfigurationOutput
        include JSON::Serializable

        # Instructions that describe how server processes are launched and maintained on computes in the
        # fleet.

        @[JSON::Field(key: "RuntimeConfiguration")]
        getter runtime_configuration : Types::RuntimeConfiguration?

        def initialize(
          @runtime_configuration : Types::RuntimeConfiguration? = nil
        )
        end
      end


      struct DescribeScalingPoliciesInput
        include JSON::Serializable

        # A unique identifier for the fleet for which to retrieve scaling policies. You can use either the
        # fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The fleet location. If you don't specify this value, the response contains the scaling policies of
        # every location in the fleet.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Scaling policy status to filter results on. A scaling policy is only in force when in an ACTIVE
        # status. ACTIVE -- The scaling policy is currently in force. UPDATEREQUESTED -- A request to update
        # the scaling policy has been received. UPDATING -- A change is being made to the scaling policy.
        # DELETEREQUESTED -- A request to delete the scaling policy has been received. DELETING -- The scaling
        # policy is being deleted. DELETED -- The scaling policy has been deleted. ERROR -- An error occurred
        # in creating the policy. It should be removed and recreated.

        @[JSON::Field(key: "StatusFilter")]
        getter status_filter : String?

        def initialize(
          @fleet_id : String,
          @limit : Int32? = nil,
          @location : String? = nil,
          @next_token : String? = nil,
          @status_filter : String? = nil
        )
        end
      end


      struct DescribeScalingPoliciesOutput
        include JSON::Serializable

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A collection of objects containing the scaling policies matching the request.

        @[JSON::Field(key: "ScalingPolicies")]
        getter scaling_policies : Array(Types::ScalingPolicy)?

        def initialize(
          @next_token : String? = nil,
          @scaling_policies : Array(Types::ScalingPolicy)? = nil
        )
        end
      end


      struct DescribeScriptInput
        include JSON::Serializable

        # A unique identifier for the Realtime script to retrieve properties for. You can use either the
        # script ID or ARN value.

        @[JSON::Field(key: "ScriptId")]
        getter script_id : String

        def initialize(
          @script_id : String
        )
        end
      end


      struct DescribeScriptOutput
        include JSON::Serializable

        # A set of properties describing the requested script.

        @[JSON::Field(key: "Script")]
        getter script : Types::Script?

        def initialize(
          @script : Types::Script? = nil
        )
        end
      end


      struct DescribeVpcPeeringAuthorizationsInput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeVpcPeeringAuthorizationsOutput
        include JSON::Serializable

        # A collection of objects that describe all valid VPC peering operations for the current Amazon Web
        # Services account.

        @[JSON::Field(key: "VpcPeeringAuthorizations")]
        getter vpc_peering_authorizations : Array(Types::VpcPeeringAuthorization)?

        def initialize(
          @vpc_peering_authorizations : Array(Types::VpcPeeringAuthorization)? = nil
        )
        end
      end


      struct DescribeVpcPeeringConnectionsInput
        include JSON::Serializable

        # A unique identifier for the fleet. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        def initialize(
          @fleet_id : String? = nil
        )
        end
      end


      struct DescribeVpcPeeringConnectionsOutput
        include JSON::Serializable

        # A collection of VPC peering connection records that match the request.

        @[JSON::Field(key: "VpcPeeringConnections")]
        getter vpc_peering_connections : Array(Types::VpcPeeringConnection)?

        def initialize(
          @vpc_peering_connections : Array(Types::VpcPeeringConnection)? = nil
        )
        end
      end

      # Player information for use when creating player sessions using a game session placement request.

      struct DesiredPlayerSession
        include JSON::Serializable

        # Developer-defined information related to a player. Amazon GameLift Servers does not use this data,
        # so it can be formatted as needed for use in the game.

        @[JSON::Field(key: "PlayerData")]
        getter player_data : String?

        # A unique identifier for a player to associate with the player session.

        @[JSON::Field(key: "PlayerId")]
        getter player_id : String?

        def initialize(
          @player_data : String? = nil,
          @player_id : String? = nil
        )
        end
      end

      # Resource capacity settings. Fleet capacity is measured in Amazon EC2 instances. Pending and
      # terminating counts are non-zero when the fleet capacity is adjusting to a scaling event or if access
      # to resources is temporarily affected.

      struct EC2InstanceCounts
        include JSON::Serializable

        # Actual number of instances that are ready to host game sessions.

        @[JSON::Field(key: "ACTIVE")]
        getter active : Int32?

        # Requested number of active instances. Amazon GameLift Servers takes action as needed to maintain the
        # desired number of instances. Capacity is scaled up or down by changing the desired instances. A
        # change in the desired instances value can take up to 1 minute to be reflected when viewing a fleet's
        # capacity settings.

        @[JSON::Field(key: "DESIRED")]
        getter desired : Int32?

        # Number of active instances that are not currently hosting a game session.

        @[JSON::Field(key: "IDLE")]
        getter idle : Int32?

        # The maximum instance count value allowed.

        @[JSON::Field(key: "MAXIMUM")]
        getter maximum : Int32?

        # The minimum instance count value allowed.

        @[JSON::Field(key: "MINIMUM")]
        getter minimum : Int32?

        # Number of instances that are starting but not yet active.

        @[JSON::Field(key: "PENDING")]
        getter pending : Int32?

        # Number of instances that are no longer active but haven't yet been terminated.

        @[JSON::Field(key: "TERMINATING")]
        getter terminating : Int32?

        def initialize(
          @active : Int32? = nil,
          @desired : Int32? = nil,
          @idle : Int32? = nil,
          @maximum : Int32? = nil,
          @minimum : Int32? = nil,
          @pending : Int32? = nil,
          @terminating : Int32? = nil
        )
        end
      end

      # The Amazon GameLift Servers service limits for an Amazon EC2 instance type and current utilization.
      # Amazon GameLift Servers allows Amazon Web Services accounts a maximum number of instances, per
      # instance type, per Amazon Web Services Region or location, for use with Amazon GameLift Servers. You
      # can request an limit increase for your account by using the Service limits page in the Amazon
      # GameLift Servers console.

      struct EC2InstanceLimit
        include JSON::Serializable

        # The number of instances for the specified type and location that are currently being used by the
        # Amazon Web Services account.

        @[JSON::Field(key: "CurrentInstances")]
        getter current_instances : Int32?

        # The name of an Amazon EC2 instance type. See Amazon Elastic Compute Cloud Instance Types for
        # detailed descriptions.

        @[JSON::Field(key: "EC2InstanceType")]
        getter ec2_instance_type : String?

        # The number of instances that is allowed for the specified instance type and location.

        @[JSON::Field(key: "InstanceLimit")]
        getter instance_limit : Int32?

        # An Amazon Web Services Region code, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @current_instances : Int32? = nil,
          @ec2_instance_type : String? = nil,
          @instance_limit : Int32? = nil,
          @location : String? = nil
        )
        end
      end

      # Log entry describing an event that involves Amazon GameLift Servers resources (such as a fleet). In
      # addition to tracking activity, event codes and messages can provide additional information for
      # troubleshooting and debugging problems.

      struct Event
        include JSON::Serializable

        # The number of times that this event occurred.

        @[JSON::Field(key: "Count")]
        getter count : Int64?

        # The type of event being logged. Fleet state transition events: FLEET_CREATED -- A fleet resource was
        # successfully created with a status of NEW . Event messaging includes the fleet ID.
        # FLEET_STATE_DOWNLOADING -- Fleet status changed from NEW to DOWNLOADING . Amazon GameLift Servers is
        # downloading the compressed build and running install scripts. FLEET_STATE_VALIDATING -- Fleet status
        # changed from DOWNLOADING to VALIDATING . Amazon GameLift Servers has successfully installed build
        # and is now validating the build files. FLEET_STATE_BUILDING -- Fleet status changed from VALIDATING
        # to BUILDING . Amazon GameLift Servers has successfully verified the build files and is now launching
        # a fleet instance. FLEET_STATE_ACTIVATING -- Fleet status changed from BUILDING to ACTIVATING .
        # Amazon GameLift Servers is launching a game server process on the fleet instance and is testing its
        # connectivity with the Amazon GameLift Servers service. FLEET_STATE_ACTIVE -- The fleet's status
        # changed from ACTIVATING to ACTIVE . The fleet is now ready to host game sessions. FLEET_STATE_ERROR
        # -- The Fleet's status changed to ERROR . Describe the fleet event message for more details. Fleet
        # creation events (ordered by fleet creation activity): FLEET_BINARY_DOWNLOAD_FAILED -- The build
        # failed to download to the fleet instance. FLEET_CREATION_EXTRACTING_BUILD -- The game server build
        # was successfully downloaded to an instance, and Amazon GameLift Serversis now extracting the build
        # files from the uploaded build. Failure at this stage prevents a fleet from moving to ACTIVE status.
        # Logs for this stage display a list of the files that are extracted and saved on the instance. Access
        # the logs by using the URL in PreSignedLogUrl . FLEET_CREATION_RUNNING_INSTALLER -- The game server
        # build files were successfully extracted, and Amazon GameLift Servers is now running the build's
        # install script (if one is included). Failure in this stage prevents a fleet from moving to ACTIVE
        # status. Logs for this stage list the installation steps and whether or not the install completed
        # successfully. Access the logs by using the URL in PreSignedLogUrl .
        # FLEET_CREATION_COMPLETED_INSTALLER -- The game server build files were successfully installed and
        # validation of the installation will begin soon. FLEET_CREATION_FAILED_INSTALLER -- The installed
        # failed while attempting to install the build files. This event indicates that the failure occurred
        # before Amazon GameLift Servers could start validation. FLEET_CREATION_VALIDATING_RUNTIME_CONFIG --
        # The build process was successful, and the GameLift is now verifying that the game server launch
        # paths, which are specified in the fleet's runtime configuration, exist. If any listed launch path
        # exists, Amazon GameLift Servers tries to launch a game server process and waits for the process to
        # report ready. Failures in this stage prevent a fleet from moving to ACTIVE status. Logs for this
        # stage list the launch paths in the runtime configuration and indicate whether each is found. Access
        # the logs by using the URL in PreSignedLogUrl . FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND -- Validation
        # of the runtime configuration failed because the executable specified in a launch path does not exist
        # on the instance. FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE -- Validation of the runtime
        # configuration failed because the executable specified in a launch path failed to run on the fleet
        # instance. FLEET_VALIDATION_TIMED_OUT -- Validation of the fleet at the end of creation timed out.
        # Try fleet creation again. FLEET_ACTIVATION_FAILED -- The fleet failed to successfully complete one
        # of the steps in the fleet activation process. This event code indicates that the game build was
        # successfully downloaded to a fleet instance, built, and validated, but was not able to start a
        # server process. For more information, see Debug Fleet Creation Issues .
        # FLEET_ACTIVATION_FAILED_NO_INSTANCES -- Fleet creation was not able to obtain any instances based on
        # the input fleet attributes. Try again at a different time or choose a different combination of fleet
        # attributes such as fleet type, instance type, etc. FLEET_INITIALIZATION_FAILED -- A generic
        # exception occurred during fleet creation. Describe the fleet event message for more details. VPC
        # peering events: FLEET_VPC_PEERING_SUCCEEDED -- A VPC peering connection has been established between
        # the VPC for an Amazon GameLift Servers fleet and a VPC in your Amazon Web Services account.
        # FLEET_VPC_PEERING_FAILED -- A requested VPC peering connection has failed. Event details and status
        # information provide additional detail. A common reason for peering failure is that the two VPCs have
        # overlapping CIDR blocks of IPv4 addresses. To resolve this, change the CIDR block for the VPC in
        # your Amazon Web Services account. For more information on VPC peering failures, see
        # https://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/invalid-peering-configurations.html
        # FLEET_VPC_PEERING_DELETED -- A VPC peering connection has been successfully deleted. Spot instance
        # events: INSTANCE_INTERRUPTED -- A spot instance was interrupted by EC2 with a two-minute
        # notification. INSTANCE_RECYCLED -- A spot instance was determined to have a high risk of
        # interruption and is scheduled to be recycled once it has no active game sessions. Server process
        # events: SERVER_PROCESS_INVALID_PATH -- The game server executable or script could not be found based
        # on the Fleet runtime configuration. Check that the launch path is correct based on the operating
        # system of the Fleet. SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT -- The server process did not call
        # InitSDK() within the time expected (5 minutes). Check your game session log to see why InitSDK() was
        # not called in time. This event is not emitted for managed container fleets and Anywhere fleets
        # unless they're deployed with the Amazon GameLift Servers Agent. SERVER_PROCESS_PROCESS_READY_TIMEOUT
        # -- The server process did not call ProcessReady() within the time expected (5 minutes) after calling
        # InitSDK() . Check your game session log to see why ProcessReady() was not called in time.
        # SERVER_PROCESS_CRASHED -- The server process exited without calling ProcessEnding() . Check your
        # game session log to see why ProcessEnding() was not called. SERVER_PROCESS_TERMINATED_UNHEALTHY --
        # The server process did not report a valid health check for too long and was therefore terminated by
        # GameLift. Check your game session log to see if the thread became stuck processing a synchronous
        # task for too long. SERVER_PROCESS_FORCE_TERMINATED -- The server process did not exit cleanly within
        # the time expected after OnProcessTerminate() was sent. Check your game session log to see why
        # termination took longer than expected. SERVER_PROCESS_PROCESS_EXIT_TIMEOUT -- The server process did
        # not exit cleanly within the time expected (30 seconds) after calling ProcessEnding() . Check your
        # game session log to see why termination took longer than expected. Game session events:
        # GAME_SESSION_ACTIVATION_TIMEOUT -- GameSession failed to activate within the expected time. Check
        # your game session log to see why ActivateGameSession() took longer to complete than expected. Other
        # fleet events: FLEET_SCALING_EVENT -- A change was made to the fleet's capacity settings (desired
        # instances, minimum/maximum scaling limits). Event messaging includes the new capacity settings.
        # FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED -- A change was made to the fleet's game session
        # protection policy setting. Event messaging includes both the old and new policy setting.
        # FLEET_DELETED -- A request to delete a fleet was initiated. GENERIC_EVENT -- An unspecified event
        # has occurred.

        @[JSON::Field(key: "EventCode")]
        getter event_code : String?

        # A unique identifier for a fleet event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String?

        # Time stamp indicating when this event occurred. Format is a number expressed in Unix time as
        # milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "EventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter event_time : Time?

        # Additional information related to the event.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # Location of stored logs with additional detail that is related to the event. This is useful for
        # debugging issues. The URL is valid for 15 minutes. You can also access fleet creation logs through
        # the Amazon GameLift Servers console.

        @[JSON::Field(key: "PreSignedLogUrl")]
        getter pre_signed_log_url : String?

        # A unique identifier for an event resource, such as a fleet ID.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @count : Int64? = nil,
          @event_code : String? = nil,
          @event_id : String? = nil,
          @event_time : Time? = nil,
          @message : String? = nil,
          @pre_signed_log_url : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # A list of fleet locations where a game session queue can place new game sessions. You can use a
      # filter to temporarily exclude specific locations from receiving placements. For queues that have
      # multi-location fleets, you can use a filter configuration allow placement with some, but not all, of
      # a fleet's locations.

      struct FilterConfiguration
        include JSON::Serializable

        # A list of locations to allow game session placement in, in the form of Amazon Web Services Region
        # codes such as us-west-2 .

        @[JSON::Field(key: "AllowedLocations")]
        getter allowed_locations : Array(String)?

        def initialize(
          @allowed_locations : Array(String)? = nil
        )
        end
      end

      # Describes an Amazon GameLift Servers fleet of game hosting resources. Attributes differ based on the
      # fleet's compute type, as follows: EC2 fleet attributes identify a Build resource (for fleets with
      # customer game server builds) or a Script resource (for Amazon GameLift Servers Realtime fleets).
      # Amazon GameLift Servers Anywhere fleets have an abbreviated set of attributes, because most fleet
      # configurations are set directly on the fleet's computes. Attributes include fleet identifiers and
      # descriptive properties, creation/termination time, and fleet status. Returned by:
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetAttributes

      struct FleetAttributes
        include JSON::Serializable

        # A set of attributes that are specific to an Anywhere fleet.

        @[JSON::Field(key: "AnywhereConfiguration")]
        getter anywhere_configuration : Types::AnywhereConfiguration?

        # The Amazon Resource Name ( ARN ) associated with the Amazon GameLift Servers build resource that is
        # deployed on instances in this fleet. In a GameLift build ARN, the resource ID matches the BuildId
        # value. This attribute is used with fleets where ComputeType is "EC2".

        @[JSON::Field(key: "BuildArn")]
        getter build_arn : String?

        # A unique identifier for the build resource that is deployed on instances in this fleet. This
        # attribute is used with fleets where ComputeType is "EC2".

        @[JSON::Field(key: "BuildId")]
        getter build_id : String?

        # Determines whether a TLS/SSL certificate is generated for a fleet. This feature must be enabled when
        # creating the fleet. All instances in a fleet share the same certificate.

        @[JSON::Field(key: "CertificateConfiguration")]
        getter certificate_configuration : Types::CertificateConfiguration?

        # The type of compute resource used to host your game servers. You can use your own compute resources
        # with Amazon GameLift Servers Anywhere or use Amazon EC2 instances with managed Amazon GameLift
        # Servers.

        @[JSON::Field(key: "ComputeType")]
        getter compute_type : String?

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A human-readable description of the fleet.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 . In a GameLift
        # fleet ARN, the resource ID matches the FleetId value.

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # Indicates whether the fleet uses On-Demand or Spot instances. For more information, see On-Demand
        # versus Spot Instances . This fleet property can't be changed after the fleet is created.

        @[JSON::Field(key: "FleetType")]
        getter fleet_type : String?

        # A unique identifier for an IAM role that manages access to your Amazon Web Services services. With
        # an instance role ARN set, any application that runs on an instance in this fleet can assume the
        # role, including install scripts, server processes, and daemons (background processes). Create a role
        # or look up a role's ARN by using the IAM dashboard in the Amazon Web Services Management Console.
        # Learn more about using on-box credentials for your game servers at Access external resources from a
        # game server . This attribute is used with fleets where ComputeType is EC2 .

        @[JSON::Field(key: "InstanceRoleArn")]
        getter instance_role_arn : String?

        # Indicates that fleet instances maintain a shared credentials file for the IAM role defined in
        # InstanceRoleArn . Shared credentials allow applications that are deployed with the game server
        # executable to communicate with other Amazon Web Services resources. This property is used only when
        # the game server is integrated with the server SDK version 5.x. For more information about using
        # shared credentials, see Communicate with other Amazon Web Services resources from your fleets . This
        # attribute is used with fleets where ComputeType is EC2 .

        @[JSON::Field(key: "InstanceRoleCredentialsProvider")]
        getter instance_role_credentials_provider : String?

        # The Amazon EC2 instance type that the fleet uses. Instance type determines the computing resources
        # of each instance in the fleet, including CPU, memory, storage, and networking capacity. See Amazon
        # Elastic Compute Cloud Instance Types for detailed descriptions. This attribute is used with fleets
        # where ComputeType is EC2 .

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # This parameter is no longer used. Game session log paths are now defined using the Amazon GameLift
        # Servers server API ProcessReady() logParameters . See more information in the Server API Reference .

        @[JSON::Field(key: "LogPaths")]
        getter log_paths : Array(String)?

        # Name of a metric group that metrics for this fleet are added to. In Amazon CloudWatch, you can view
        # aggregated metrics for fleets that are in a metric group. A fleet can be included in only one metric
        # group at a time. This attribute is used with fleets where ComputeType is EC2 .

        @[JSON::Field(key: "MetricGroups")]
        getter metric_groups : Array(String)?

        # A descriptive label that is associated with a fleet. Fleet names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of game session protection to set on all new instances that are started in the fleet. This
        # attribute is used with fleets where ComputeType is EC2 . NoProtection -- The game session can be
        # terminated during a scale-down event. FullProtection -- If the game session is in an ACTIVE status,
        # it cannot be terminated during a scale-down event.

        @[JSON::Field(key: "NewGameSessionProtectionPolicy")]
        getter new_game_session_protection_policy : String?

        # The operating system of the fleet's computing resources. A fleet's operating system is determined by
        # the OS of the build or script that is deployed on this fleet. This attribute is used with fleets
        # where ComputeType is EC2 . Amazon Linux 2 (AL2) will reach end of support on 6/30/2025. See more
        # details in the Amazon Linux 2 FAQs . For game servers that are hosted on AL2 and use server SDK
        # version 4.x for Amazon GameLift Servers, first update the game server build to server SDK 5.x, and
        # then deploy to AL2023 instances. See Migrate to server SDK version 5.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?


        @[JSON::Field(key: "ResourceCreationLimitPolicy")]
        getter resource_creation_limit_policy : Types::ResourceCreationLimitPolicy?

        # The Amazon Resource Name ( ARN ) associated with the GameLift script resource that is deployed on
        # instances in this fleet. In a GameLift script ARN, the resource ID matches the ScriptId value.

        @[JSON::Field(key: "ScriptArn")]
        getter script_arn : String?

        # A unique identifier for the Realtime script resource that is deployed on instances in this fleet.
        # This attribute is used with fleets where ComputeType is "EC2".

        @[JSON::Field(key: "ScriptId")]
        getter script_id : String?

        # This parameter is no longer used. Server launch parameters are now defined using the fleet's runtime
        # configuration. Requests that use this parameter continue to be valid.

        @[JSON::Field(key: "ServerLaunchParameters")]
        getter server_launch_parameters : String?

        # This parameter is no longer used. Server launch paths are now defined using the fleet's
        # RuntimeConfiguration . Requests that use this parameter continue to be valid.

        @[JSON::Field(key: "ServerLaunchPath")]
        getter server_launch_path : String?

        # Current status of the fleet. Possible fleet statuses include the following: NEW -- A new fleet
        # resource has been defined and Amazon GameLift Servers has started creating the fleet. Desired
        # instances is set to 1. DOWNLOADING/VALIDATING/BUILDING -- Amazon GameLift Servers is download the
        # game server build, running install scripts, and then validating the build files. When complete,
        # Amazon GameLift Servers launches a fleet instance. ACTIVATING -- Amazon GameLift Servers is
        # launching a game server process and testing its connectivity with the Amazon GameLift Servers
        # service. ACTIVE -- The fleet is now ready to host game sessions. ERROR -- An error occurred when
        # downloading, validating, building, or activating the fleet. DELETING -- Hosts are responding to a
        # delete fleet request. TERMINATED -- The fleet no longer exists.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A list of fleet activity that has been suspended using StopFleetActions . This includes fleet
        # auto-scaling. This attribute is used with fleets where ComputeType is EC2 .

        @[JSON::Field(key: "StoppedActions")]
        getter stopped_actions : Array(String)?

        # A time stamp indicating when this data object was terminated. Format is a number expressed in Unix
        # time as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "TerminationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter termination_time : Time?

        def initialize(
          @anywhere_configuration : Types::AnywhereConfiguration? = nil,
          @build_arn : String? = nil,
          @build_id : String? = nil,
          @certificate_configuration : Types::CertificateConfiguration? = nil,
          @compute_type : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @fleet_type : String? = nil,
          @instance_role_arn : String? = nil,
          @instance_role_credentials_provider : String? = nil,
          @instance_type : String? = nil,
          @log_paths : Array(String)? = nil,
          @metric_groups : Array(String)? = nil,
          @name : String? = nil,
          @new_game_session_protection_policy : String? = nil,
          @operating_system : String? = nil,
          @resource_creation_limit_policy : Types::ResourceCreationLimitPolicy? = nil,
          @script_arn : String? = nil,
          @script_id : String? = nil,
          @server_launch_parameters : String? = nil,
          @server_launch_path : String? = nil,
          @status : String? = nil,
          @stopped_actions : Array(String)? = nil,
          @termination_time : Time? = nil
        )
        end
      end

      # Current resource capacity settings for managed EC2 fleets and managed container fleets. For
      # multi-location fleets, location values might refer to a fleet's remote location or its home Region.
      # Returned by: DescribeFleetCapacity , DescribeFleetLocationCapacity , UpdateFleetCapacity

      struct FleetCapacity
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet associated with the location.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The number and status of game server container groups deployed in a container fleet.

        @[JSON::Field(key: "GameServerContainerGroupCounts")]
        getter game_server_container_group_counts : Types::GameServerContainerGroupCounts?

        # The current number of instances in the fleet, listed by instance status. Counts for pending and
        # terminating instances might be non-zero if the fleet is adjusting to a scaling event or if access to
        # resources is temporarily affected.

        @[JSON::Field(key: "InstanceCounts")]
        getter instance_counts : Types::EC2InstanceCounts?

        # The Amazon EC2 instance type that is used for instances in a fleet. Instance type determines the
        # computing resources in use, including CPU, memory, storage, and networking capacity. See Amazon
        # Elastic Compute Cloud Instance Types for detailed descriptions.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The fleet location for the instance count information, expressed as an Amazon Web Services Region
        # code, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @game_server_container_group_counts : Types::GameServerContainerGroupCounts? = nil,
          @instance_counts : Types::EC2InstanceCounts? = nil,
          @instance_type : String? = nil,
          @location : String? = nil
        )
        end
      end

      # The specified fleet has no available instances to fulfill a CreateGameSession request. Clients can
      # retry such requests immediately or after a waiting period.

      struct FleetCapacityExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a container fleet deployment with updates to the fleet.

      struct FleetDeployment
        include JSON::Serializable

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Instructions for how to deploy updates to a container fleet and what actions to take if the
        # deployment fails.

        @[JSON::Field(key: "DeploymentConfiguration")]
        getter deployment_configuration : Types::DeploymentConfiguration?

        # A unique identifier for the deployment.

        @[JSON::Field(key: "DeploymentId")]
        getter deployment_id : String?

        # The status of fleet deployment activity in the location. IN_PROGRESS -- The deployment is in
        # progress. IMPAIRED -- The deployment failed and the fleet has some impaired containers. COMPLETE --
        # The deployment has completed successfully. ROLLBACK_IN_PROGRESS -- The deployment failed and
        # rollback has been initiated. ROLLBACK_IN_COMPLETE -- The deployment failed and rollback has been
        # completed. CANCELLED -- The deployment was cancelled.

        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        # A unique identifier for the container fleet.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The unique identifier for the version of the game server container group definition that is being
        # deployed.

        @[JSON::Field(key: "GameServerBinaryArn")]
        getter game_server_binary_arn : String?

        # The unique identifier for the version of the per-instance container group definition that is being
        # deployed.

        @[JSON::Field(key: "PerInstanceBinaryArn")]
        getter per_instance_binary_arn : String?

        # The unique identifier for the version of the game server container group definition to roll back to
        # if deployment fails. Amazon GameLift Servers sets this property to the container group definition
        # version that the fleet used when it was last active.

        @[JSON::Field(key: "RollbackGameServerBinaryArn")]
        getter rollback_game_server_binary_arn : String?

        # The unique identifier for the version of the per-instance container group definition to roll back to
        # if deployment fails. Amazon GameLift Servers sets this property to the container group definition
        # version that the fleet used when it was last active.

        @[JSON::Field(key: "RollbackPerInstanceBinaryArn")]
        getter rollback_per_instance_binary_arn : String?

        def initialize(
          @creation_time : Time? = nil,
          @deployment_configuration : Types::DeploymentConfiguration? = nil,
          @deployment_id : String? = nil,
          @deployment_status : String? = nil,
          @fleet_id : String? = nil,
          @game_server_binary_arn : String? = nil,
          @per_instance_binary_arn : String? = nil,
          @rollback_game_server_binary_arn : String? = nil,
          @rollback_per_instance_binary_arn : String? = nil
        )
        end
      end

      # Current resource utilization statistics in a specified fleet or location. The location value might
      # refer to a fleet's remote location or its home region.

      struct FleetUtilization
        include JSON::Serializable

        # The number of active game sessions that are currently being hosted across all instances in the fleet
        # location.

        @[JSON::Field(key: "ActiveGameSessionCount")]
        getter active_game_session_count : Int32?

        # The number of server processes in ACTIVE status that are currently running across all instances in
        # the fleet location.

        @[JSON::Field(key: "ActiveServerProcessCount")]
        getter active_server_process_count : Int32?

        # The number of active player sessions that are currently being hosted across all instances in the
        # fleet location.

        @[JSON::Field(key: "CurrentPlayerSessionCount")]
        getter current_player_session_count : Int32?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet associated with the location.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The fleet location for the fleet utilization information, expressed as an Amazon Web Services Region
        # code, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The maximum number of players allowed across all game sessions that are currently being hosted
        # across all instances in the fleet location.

        @[JSON::Field(key: "MaximumPlayerSessionCount")]
        getter maximum_player_session_count : Int32?

        def initialize(
          @active_game_session_count : Int32? = nil,
          @active_server_process_count : Int32? = nil,
          @current_player_session_count : Int32? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @location : String? = nil,
          @maximum_player_session_count : Int32? = nil
        )
        end
      end

      # This key-value pair can store custom data about a game session. For example, you might use a
      # GameProperty to track a game session's map, level of difficulty, or remaining time. The difficulty
      # level could be specified like this: {"Key": "difficulty", "Value":"Novice"} . You can set game
      # properties when creating a game session. You can also modify game properties of an active game
      # session. When searching for game sessions, you can filter on game property keys and values. You
      # can't delete game properties from a game session. For examples of working with game properties, see
      # Create a game session with properties .

      struct GameProperty
        include JSON::Serializable

        # The game property identifier.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The game property value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Properties describing a game server that is running on an instance in a game server group. A game
      # server is created by a successful call to RegisterGameServer and deleted by calling
      # DeregisterGameServer . A game server is claimed to host a game session by calling ClaimGameServer .

      struct GameServer
        include JSON::Serializable

        # Indicates when an available game server has been reserved for gameplay but has not yet started
        # hosting a game. Once it is claimed, the game server remains in CLAIMED status for a maximum of one
        # minute. During this time, game clients connect to the game server to start the game and trigger the
        # game server to update its utilization status. After one minute, the game server claim status reverts
        # to null.

        @[JSON::Field(key: "ClaimStatus")]
        getter claim_status : String?

        # The port and IP address that must be used to establish a client connection to the game server.

        @[JSON::Field(key: "ConnectionInfo")]
        getter connection_info : String?

        # A set of custom game server properties, formatted as a single string value. This data is passed to a
        # game client or service when it requests information on game servers.

        @[JSON::Field(key: "GameServerData")]
        getter game_server_data : String?

        # The ARN identifier for the game server group where the game server is located.

        @[JSON::Field(key: "GameServerGroupArn")]
        getter game_server_group_arn : String?

        # A unique identifier for the game server group where the game server is running.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String?

        # A custom string that uniquely identifies the game server. Game server IDs are developer-defined and
        # are unique across all game server groups in an Amazon Web Services account.

        @[JSON::Field(key: "GameServerId")]
        getter game_server_id : String?

        # The unique identifier for the instance where the game server is running. This ID is available in the
        # instance metadata. EC2 instance IDs use a 17-character format, for example: i-1234567890abcdef0 .

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # Timestamp that indicates the last time the game server was claimed. The format is a number expressed
        # in Unix time as milliseconds (for example "1469498468.057" ). This value is used to calculate when a
        # claimed game server's status should revert to null.

        @[JSON::Field(key: "LastClaimTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_claim_time : Time?

        # Timestamp that indicates the last time the game server was updated with health status. The format is
        # a number expressed in Unix time as milliseconds (for example "1469498468.057" ). After game server
        # registration, this property is only changed when a game server update specifies a health check
        # value.

        @[JSON::Field(key: "LastHealthCheckTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_health_check_time : Time?

        # Timestamp that indicates when the game server registered. The format is a number expressed in Unix
        # time as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "RegistrationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter registration_time : Time?

        # Indicates whether the game server is currently available for new games or is busy. Possible statuses
        # include: AVAILABLE - The game server is available to be claimed. A game server that has been claimed
        # remains in this status until it reports game hosting activity. UTILIZED - The game server is
        # currently hosting a game session with players.

        @[JSON::Field(key: "UtilizationStatus")]
        getter utilization_status : String?

        def initialize(
          @claim_status : String? = nil,
          @connection_info : String? = nil,
          @game_server_data : String? = nil,
          @game_server_group_arn : String? = nil,
          @game_server_group_name : String? = nil,
          @game_server_id : String? = nil,
          @instance_id : String? = nil,
          @last_claim_time : Time? = nil,
          @last_health_check_time : Time? = nil,
          @registration_time : Time? = nil,
          @utilization_status : String? = nil
        )
        end
      end

      # Describes the game server container in an existing game server container group. A game server
      # container identifies a container image with your game server build. A game server container is
      # automatically considered essential; if an essential container fails, the entire container group
      # restarts. You can update a container definition and deploy the updates to an existing fleet. When
      # creating or updating a game server container group definition, use the property
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput .
      # Part of: ContainerGroupDefinition Returned by: DescribeContainerGroupDefinition ,
      # ListContainerGroupDefinitions , UpdateContainerGroupDefinition

      struct GameServerContainerDefinition
        include JSON::Serializable

        # The container definition identifier. Container names are unique within a container group definition.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String?

        # Indicates that the container relies on the status of other containers in the same container group
        # during startup and shutdown sequences. A container might have dependencies on multiple containers.

        @[JSON::Field(key: "DependsOn")]
        getter depends_on : Array(Types::ContainerDependency)?

        # A set of environment variables that's passed to the container on startup. See the
        # ContainerDefinition::environment parameter in the Amazon Elastic Container Service API Reference .

        @[JSON::Field(key: "EnvironmentOverride")]
        getter environment_override : Array(Types::ContainerEnvironment)?

        # The URI to the image that Amazon GameLift Servers uses when deploying this container to a container
        # fleet. For a more specific identifier, see ResolvedImageDigest .

        @[JSON::Field(key: "ImageUri")]
        getter image_uri : String?

        # A mount point that binds a path inside the container to a file or directory on the host system and
        # lets it access the file or directory.

        @[JSON::Field(key: "MountPoints")]
        getter mount_points : Array(Types::ContainerMountPoint)?

        # The set of ports that are available to bind to processes in the container. For example, a game
        # server process requires a container port to allow game clients to connect to it. Container ports
        # aren't directly accessed by inbound traffic. Amazon GameLift Servers maps these container ports to
        # externally accessible connection ports, which are assigned as needed from the container fleet's
        # ConnectionPortRange .

        @[JSON::Field(key: "PortConfiguration")]
        getter port_configuration : Types::ContainerPortConfiguration?

        # A unique and immutable identifier for the container image. The digest is a SHA 256 hash of the
        # container image manifest.

        @[JSON::Field(key: "ResolvedImageDigest")]
        getter resolved_image_digest : String?

        # The Amazon GameLift Servers server SDK version that the game server is integrated with. Only game
        # servers using 5.2.0 or higher are compatible with container fleets.

        @[JSON::Field(key: "ServerSdkVersion")]
        getter server_sdk_version : String?

        def initialize(
          @container_name : String? = nil,
          @depends_on : Array(Types::ContainerDependency)? = nil,
          @environment_override : Array(Types::ContainerEnvironment)? = nil,
          @image_uri : String? = nil,
          @mount_points : Array(Types::ContainerMountPoint)? = nil,
          @port_configuration : Types::ContainerPortConfiguration? = nil,
          @resolved_image_digest : String? = nil,
          @server_sdk_version : String? = nil
        )
        end
      end

      # Describes the configuration for a container that runs your game server executable. This definition
      # includes container configuration, resources, and start instructions. Use this data type when
      # creating or updating a game server container group definition. For properties of a deployed
      # container, see GameServerContainerDefinition . A game server container is automatically considered
      # essential; if an essential container fails, the entire container group restarts. Use with:
      # CreateContainerGroupDefinition , UpdateContainerGroupDefinition

      struct GameServerContainerDefinitionInput
        include JSON::Serializable

        # A string that uniquely identifies the container definition within a container group.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        # The location of the container image to deploy to a container fleet. Provide an image in an Amazon
        # Elastic Container Registry public or private repository. The repository must be in the same Amazon
        # Web Services account and Amazon Web Services Region where you're creating the container group
        # definition. For limits on image size, see Amazon GameLift Servers endpoints and quotas . You can use
        # any of the following image URI formats: Image ID only: [AWS account].dkr.ecr.[AWS
        # region].amazonaws.com/[repository ID] Image ID and digest: [AWS account].dkr.ecr.[AWS
        # region].amazonaws.com/[repository ID]@[digest] Image ID and tag: [AWS account].dkr.ecr.[AWS
        # region].amazonaws.com/[repository ID]:[tag]

        @[JSON::Field(key: "ImageUri")]
        getter image_uri : String

        # A set of ports that Amazon GameLift Servers can assign to processes in a container. The container
        # port configuration must have enough ports for each container process that accepts inbound traffic
        # connections. For example, a game server process requires a container port to allow game clients to
        # connect to it. A container port configuration can have can have one or more container port ranges.
        # Each range specifies starting and ending values as well as the supported network protocol. Container
        # ports aren't directly accessed by inbound traffic. Amazon GameLift Servers maps each container port
        # to an externally accessible connection port (see the container fleet property ConnectionPortRange ).

        @[JSON::Field(key: "PortConfiguration")]
        getter port_configuration : Types::ContainerPortConfiguration

        # The Amazon GameLift Servers server SDK version that the game server is integrated with. Only game
        # servers using 5.2.0 or higher are compatible with container fleets.

        @[JSON::Field(key: "ServerSdkVersion")]
        getter server_sdk_version : String

        # Establishes dependencies between this container and the status of other containers in the same
        # container group. A container can have dependencies on multiple different containers. You can use
        # dependencies to establish a startup/shutdown sequence across the container group. For example, you
        # might specify that ContainerB has a START dependency on ContainerA . This dependency means that
        # ContainerB can't start until after ContainerA has started. This dependency is reversed on shutdown,
        # which means that ContainerB must shut down before ContainerA can shut down.

        @[JSON::Field(key: "DependsOn")]
        getter depends_on : Array(Types::ContainerDependency)?

        # A set of environment variables to pass to the container on startup. See the
        # ContainerDefinition::environment parameter in the Amazon Elastic Container Service API Reference .

        @[JSON::Field(key: "EnvironmentOverride")]
        getter environment_override : Array(Types::ContainerEnvironment)?

        # A mount point that binds a path inside the container to a file or directory on the host system and
        # lets it access the file or directory.

        @[JSON::Field(key: "MountPoints")]
        getter mount_points : Array(Types::ContainerMountPoint)?

        def initialize(
          @container_name : String,
          @image_uri : String,
          @port_configuration : Types::ContainerPortConfiguration,
          @server_sdk_version : String,
          @depends_on : Array(Types::ContainerDependency)? = nil,
          @environment_override : Array(Types::ContainerEnvironment)? = nil,
          @mount_points : Array(Types::ContainerMountPoint)? = nil
        )
        end
      end

      # The number and status of game server container groups that are deployed across a container fleet.
      # Combine this count with the number of server processes that each game server container group runs to
      # learn how many game sessions the fleet is capable of hosting concurrently. For example, if a fleet
      # has 50 game server container groups, and the game server container in each group runs 1 game server
      # process, then the fleet has the capacity to run host 50 game sessions at a time. Returned by:
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetCapacity.html ,
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetLocationCapacity.html

      struct GameServerContainerGroupCounts
        include JSON::Serializable

        # The number of container groups that have active game sessions.

        @[JSON::Field(key: "ACTIVE")]
        getter active : Int32?

        # The number of container groups that have no active game sessions.

        @[JSON::Field(key: "IDLE")]
        getter idle : Int32?

        # The number of container groups that are starting up but haven't yet registered.

        @[JSON::Field(key: "PENDING")]
        getter pending : Int32?

        # The number of container groups that are in the process of shutting down.

        @[JSON::Field(key: "TERMINATING")]
        getter terminating : Int32?

        def initialize(
          @active : Int32? = nil,
          @idle : Int32? = nil,
          @pending : Int32? = nil,
          @terminating : Int32? = nil
        )
        end
      end

      # Properties that describe a game server group resource. A game server group manages certain
      # properties related to a corresponding Amazon EC2 Auto Scaling group. A game server group is created
      # by a successful call to CreateGameServerGroup and deleted by calling DeleteGameServerGroup . Game
      # server group activity can be temporarily suspended and resumed by calling SuspendGameServerGroup and
      # ResumeGameServerGroup , respectively.

      struct GameServerGroup
        include JSON::Serializable

        # A generated unique ID for the Amazon EC2 Auto Scaling group that is associated with this game server
        # group.

        @[JSON::Field(key: "AutoScalingGroupArn")]
        getter auto_scaling_group_arn : String?

        # Indicates how Amazon GameLift Servers FleetIQ balances the use of Spot Instances and On-Demand
        # Instances in the game server group. Method options include the following: SPOT_ONLY - Only Spot
        # Instances are used in the game server group. If Spot Instances are unavailable or not viable for
        # game hosting, the game server group provides no hosting capacity until Spot Instances can again be
        # used. Until then, no new instances are started, and the existing nonviable Spot Instances are
        # terminated (after current gameplay ends) and are not replaced. SPOT_PREFERRED - (default value) Spot
        # Instances are used whenever available in the game server group. If Spot Instances are unavailable,
        # the game server group continues to provide hosting capacity by falling back to On-Demand Instances.
        # Existing nonviable Spot Instances are terminated (after current gameplay ends) and are replaced with
        # new On-Demand Instances. ON_DEMAND_ONLY - Only On-Demand Instances are used in the game server
        # group. No Spot Instances are used, even when available, while this balancing strategy is in force.

        @[JSON::Field(key: "BalancingStrategy")]
        getter balancing_strategy : String?

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A generated unique ID for the game server group.

        @[JSON::Field(key: "GameServerGroupArn")]
        getter game_server_group_arn : String?

        # A developer-defined identifier for the game server group. The name is unique for each Region in each
        # Amazon Web Services account.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String?

        # A flag that indicates whether instances in the game server group are protected from early
        # termination. Unprotected instances that have active game servers running might be terminated during
        # a scale-down event, causing players to be dropped from the game. Protected instances cannot be
        # terminated while there are active game servers running except in the event of a forced game server
        # group deletion (see ). An exception to this is with Spot Instances, which can be terminated by
        # Amazon Web Services regardless of protection status.

        @[JSON::Field(key: "GameServerProtectionPolicy")]
        getter game_server_protection_policy : String?

        # The set of Amazon EC2 instance types that Amazon GameLift Servers FleetIQ can use when balancing and
        # automatically scaling instances in the corresponding Auto Scaling group.

        @[JSON::Field(key: "InstanceDefinitions")]
        getter instance_definitions : Array(Types::InstanceDefinition)?

        # A timestamp that indicates when this game server group was last updated.

        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The Amazon Resource Name ( ARN ) for an IAM role that allows Amazon GameLift Servers to access your
        # Amazon EC2 Auto Scaling groups.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The current status of the game server group. Possible statuses include: NEW - Amazon GameLift
        # Servers FleetIQ has validated the CreateGameServerGroup() request. ACTIVATING - Amazon GameLift
        # Servers FleetIQ is setting up a game server group, which includes creating an Auto Scaling group in
        # your Amazon Web Services account. ACTIVE - The game server group has been successfully created.
        # DELETE_SCHEDULED - A request to delete the game server group has been received. DELETING - Amazon
        # GameLift Servers FleetIQ has received a valid DeleteGameServerGroup() request and is processing it.
        # Amazon GameLift Servers FleetIQ must first complete and release hosts before it deletes the Auto
        # Scaling group and the game server group. DELETED - The game server group has been successfully
        # deleted. ERROR - The asynchronous processes of activating or deleting a game server group has
        # failed, resulting in an error state.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the current game server group status. This information might provide
        # additional insight on groups that are in ERROR status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # A list of activities that are currently suspended for this game server group. If this property is
        # empty, all activities are occurring.

        @[JSON::Field(key: "SuspendedActions")]
        getter suspended_actions : Array(String)?

        def initialize(
          @auto_scaling_group_arn : String? = nil,
          @balancing_strategy : String? = nil,
          @creation_time : Time? = nil,
          @game_server_group_arn : String? = nil,
          @game_server_group_name : String? = nil,
          @game_server_protection_policy : String? = nil,
          @instance_definitions : Array(Types::InstanceDefinition)? = nil,
          @last_updated_time : Time? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @suspended_actions : Array(String)? = nil
        )
        end
      end

      # Configuration settings for intelligent automatic scaling that uses target tracking. These settings
      # are used to add an Auto Scaling policy when creating the corresponding Auto Scaling group. After the
      # Auto Scaling group is created, all updates to Auto Scaling policies, including changing this policy
      # and adding or removing other policies, is done directly on the Auto Scaling group.

      struct GameServerGroupAutoScalingPolicy
        include JSON::Serializable

        # Settings for a target-based scaling policy applied to Auto Scaling group. These settings are used to
        # create a target-based policy that tracks the Amazon GameLift Servers FleetIQ metric
        # "PercentUtilizedGameServers" and specifies a target value for the metric. As player usage changes,
        # the policy triggers to adjust the game server group capacity so that the metric returns to the
        # target value.

        @[JSON::Field(key: "TargetTrackingConfiguration")]
        getter target_tracking_configuration : Types::TargetTrackingConfiguration

        # Length of time, in seconds, it takes for a new instance to start new game server processes and
        # register with Amazon GameLift Servers FleetIQ. Specifying a warm-up time can be useful, particularly
        # with game servers that take a long time to start up, because it avoids prematurely starting new
        # instances.

        @[JSON::Field(key: "EstimatedInstanceWarmup")]
        getter estimated_instance_warmup : Int32?

        def initialize(
          @target_tracking_configuration : Types::TargetTrackingConfiguration,
          @estimated_instance_warmup : Int32? = nil
        )
        end
      end

      # Additional properties, including status, that describe an EC2 instance in a game server group.
      # Instance configurations are set with game server group properties (see DescribeGameServerGroup and
      # with the EC2 launch template that was used when creating the game server group. Retrieve game server
      # instances for a game server group by calling DescribeGameServerInstances .

      struct GameServerInstance
        include JSON::Serializable

        # A generated unique identifier for the game server group that includes the game server instance.

        @[JSON::Field(key: "GameServerGroupArn")]
        getter game_server_group_arn : String?

        # A developer-defined identifier for the game server group that includes the game server instance. The
        # name is unique for each Region in each Amazon Web Services account.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String?

        # The unique identifier for the instance where the game server is running. This ID is available in the
        # instance metadata. EC2 instance IDs use a 17-character format, for example: i-1234567890abcdef0 .

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # Current status of the game server instance

        @[JSON::Field(key: "InstanceStatus")]
        getter instance_status : String?

        def initialize(
          @game_server_group_arn : String? = nil,
          @game_server_group_name : String? = nil,
          @instance_id : String? = nil,
          @instance_status : String? = nil
        )
        end
      end

      # Properties describing a game session. A game session in ACTIVE status can host players. When a game
      # session ends, its status is set to TERMINATED . Amazon GameLift Servers retains a game session
      # resource for 30 days after the game session ends. You can reuse idempotency token values after this
      # time. Game session logs are retained for 14 days. All APIs by task

      struct GameSession
        include JSON::Serializable

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A unique identifier for a player. This ID is used to enforce a resource protection policy (if one
        # exists), that limits the number of game sessions a player can create.

        @[JSON::Field(key: "CreatorId")]
        getter creator_id : String?

        # Number of players currently in the game session.

        @[JSON::Field(key: "CurrentPlayerSessionCount")]
        getter current_player_session_count : Int32?

        # The DNS identifier assigned to the instance that is running the game session. Values have the
        # following format: TLS-enabled fleets: &lt;unique identifier&gt;.&lt;region
        # identifier&gt;.amazongamelift.com . Non-TLS-enabled fleets: ec2-&lt;unique
        # identifier&gt;.compute.amazonaws.com . (See Amazon EC2 Instance IP Addressing .) When connecting to
        # a game session that is running on a TLS-enabled fleet, you must use the DNS name, not the IP
        # address.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # The Amazon Resource Name ( ARN ) associated with the GameLift fleet that this game session is
        # running on.

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that the game session is running on.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # A set of key-value pairs that can store custom data in a game session. For example: {"Key":
        # "difficulty", "Value": "novice"} .

        @[JSON::Field(key: "GameProperties")]
        getter game_properties : Array(Types::GameProperty)?

        # A set of custom game session properties, formatted as a single string value. This data is passed to
        # a game server process with a request to start a new game session. For more information, see Start a
        # game session .

        @[JSON::Field(key: "GameSessionData")]
        getter game_session_data : String?

        # A unique identifier for the game session. A game session ARN has the following format:
        # arn:aws:gamelift:&lt;location&gt;::gamesession/&lt;fleet ID&gt;/&lt;custom ID string or idempotency
        # token&gt; .

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String?

        # The IP address of the game session. To connect to a Amazon GameLift Servers game server, an app
        # needs both the IP address and port number.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The fleet location where the game session is running. This value might specify the fleet's home
        # Region or a remote location. Location is expressed as an Amazon Web Services Region code such as
        # us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # Information about the matchmaking process that resulted in the game session, if matchmaking was
        # used. Data is in JSON syntax, formatted as a string. Information includes the matchmaker ID as well
        # as player attributes and team assignments. For more details on matchmaker data, see Match Data .
        # Matchmaker data is updated whenever new players are added during a successful backfill (see
        # StartMatchBackfill ).

        @[JSON::Field(key: "MatchmakerData")]
        getter matchmaker_data : String?

        # The maximum number of players that can be connected simultaneously to the game session.

        @[JSON::Field(key: "MaximumPlayerSessionCount")]
        getter maximum_player_session_count : Int32?

        # A descriptive label that is associated with a game session. Session names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates whether the game session is accepting new players.

        @[JSON::Field(key: "PlayerSessionCreationPolicy")]
        getter player_session_creation_policy : String?

        # The port number for the game session. To connect to a Amazon GameLift Servers game server, an app
        # needs both the IP address and port number.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Current status of the game session. A game session must have an ACTIVE status to have player
        # sessions.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Provides additional information about game session status. INTERRUPTED -- The game session was
        # hosted on an EC2 Spot instance that was reclaimed, causing the active game session to be stopped.
        # TRIGGERED_ON_PROCESS_TERMINATE – The game session was stopped by calling TerminateGameSession with
        # the termination mode TRIGGER_ON_PROCESS_TERMINATE . FORCE_TERMINATED – The game session was stopped
        # by calling TerminateGameSession with the termination mode FORCE_TERMINATE .

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # A time stamp indicating when this data object was terminated. Format is a number expressed in Unix
        # time as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "TerminationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter termination_time : Time?

        def initialize(
          @creation_time : Time? = nil,
          @creator_id : String? = nil,
          @current_player_session_count : Int32? = nil,
          @dns_name : String? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @game_properties : Array(Types::GameProperty)? = nil,
          @game_session_data : String? = nil,
          @game_session_id : String? = nil,
          @ip_address : String? = nil,
          @location : String? = nil,
          @matchmaker_data : String? = nil,
          @maximum_player_session_count : Int32? = nil,
          @name : String? = nil,
          @player_session_creation_policy : String? = nil,
          @port : Int32? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @termination_time : Time? = nil
        )
        end
      end

      # Connection information for a new game session that is created in response to a start matchmaking
      # request. Once a match is made, the FlexMatch engine creates a new game session for it. This
      # information, including the game session endpoint and player sessions for each player in the original
      # matchmaking request, is added to the matchmaking ticket.

      struct GameSessionConnectionInfo
        include JSON::Serializable

        # The DNS identifier assigned to the instance that is running the game session. Values have the
        # following format: TLS-enabled fleets: &lt;unique identifier&gt;.&lt;region
        # identifier&gt;.amazongamelift.com . Non-TLS-enabled fleets: ec2-&lt;unique
        # identifier&gt;.compute.amazonaws.com . (See Amazon EC2 Instance IP Addressing .) When connecting to
        # a game session that is running on a TLS-enabled fleet, you must use the DNS name, not the IP
        # address.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # A unique identifier for the game session. Use the game session ID.

        @[JSON::Field(key: "GameSessionArn")]
        getter game_session_arn : String?

        # The IP address of the game session. To connect to a Amazon GameLift Servers game server, an app
        # needs both the IP address and port number.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # A collection of player session IDs, one for each player ID that was included in the original
        # matchmaking request.

        @[JSON::Field(key: "MatchedPlayerSessions")]
        getter matched_player_sessions : Array(Types::MatchedPlayerSession)?

        # The port number for the game session. To connect to a Amazon GameLift Servers game server, an app
        # needs both the IP address and port number.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        def initialize(
          @dns_name : String? = nil,
          @game_session_arn : String? = nil,
          @ip_address : String? = nil,
          @matched_player_sessions : Array(Types::MatchedPlayerSession)? = nil,
          @port : Int32? = nil
        )
        end
      end

      # A policy that puts limits on the number of game sessions that a player can create within a specified
      # span of time. With this policy, you can control players' ability to consume available resources. The
      # policy is evaluated when a player tries to create a new game session. On receiving a
      # CreateGameSession request, Amazon GameLift Servers checks that the player (identified by CreatorId )
      # has created fewer than game session limit in the specified time period.

      struct GameSessionCreationLimitPolicy
        include JSON::Serializable

        # A policy that puts limits on the number of game sessions that a player can create within a specified
        # span of time. With this policy, you can control players' ability to consume available resources. The
        # policy evaluates when a player tries to create a new game session. On receiving a CreateGameSession
        # request, Amazon GameLift Servers checks that the player (identified by CreatorId ) has created fewer
        # than game session limit in the specified time period.

        @[JSON::Field(key: "NewGameSessionsPerCreator")]
        getter new_game_sessions_per_creator : Int32?

        # The time span used in evaluating the resource creation limit policy.

        @[JSON::Field(key: "PolicyPeriodInMinutes")]
        getter policy_period_in_minutes : Int32?

        def initialize(
          @new_game_sessions_per_creator : Int32? = nil,
          @policy_period_in_minutes : Int32? = nil
        )
        end
      end

      # A game session's properties plus the protection policy currently in force.

      struct GameSessionDetail
        include JSON::Serializable

        # Object that describes a game session.

        @[JSON::Field(key: "GameSession")]
        getter game_session : Types::GameSession?

        # Current status of protection for the game session. NoProtection -- The game session can be
        # terminated during a scale-down event. FullProtection -- If the game session is in an ACTIVE status,
        # it cannot be terminated during a scale-down event.

        @[JSON::Field(key: "ProtectionPolicy")]
        getter protection_policy : String?

        def initialize(
          @game_session : Types::GameSession? = nil,
          @protection_policy : String? = nil
        )
        end
      end

      # The game instance is currently full and cannot allow the requested player(s) to join. Clients can
      # retry such requests immediately or after a waiting period.

      struct GameSessionFullException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a potential game session placement, including the full details of the original placement
      # request and the current status. If the game session placement status is PENDING , the properties for
      # game session ID/ARN, region, IP address/DNS, and port aren't final. A game session is not active and
      # ready to accept players until placement status reaches FULFILLED . When the placement is in PENDING
      # status, Amazon GameLift Servers may attempt to place a game session multiple times before
      # succeeding. With each attempt it creates a
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameSession object and updates this
      # placement object with the new game session properties.

      struct GameSessionPlacement
        include JSON::Serializable

        # The DNS identifier assigned to the instance that is running the game session. Values have the
        # following format: TLS-enabled fleets: &lt;unique identifier&gt;.&lt;region
        # identifier&gt;.amazongamelift.com . Non-TLS-enabled fleets: ec2-&lt;unique
        # identifier&gt;.compute.amazonaws.com . (See Amazon EC2 Instance IP Addressing .) When connecting to
        # a game session that is running on a TLS-enabled fleet, you must use the DNS name, not the IP
        # address.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # Time stamp indicating when this request was completed, canceled, or timed out.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # A set of key-value pairs that can store custom data in a game session. For example: {"Key":
        # "difficulty", "Value": "novice"} .

        @[JSON::Field(key: "GameProperties")]
        getter game_properties : Array(Types::GameProperty)?

        # Identifier for the game session created by this placement request. This identifier is unique across
        # all Regions. This value isn't final until placement status is FULFILLED .

        @[JSON::Field(key: "GameSessionArn")]
        getter game_session_arn : String?

        # A set of custom game session properties, formatted as a single string value. This data is passed to
        # a game server process with a request to start a new game session. For more information, see Start a
        # game session .

        @[JSON::Field(key: "GameSessionData")]
        getter game_session_data : String?

        # A unique identifier for the game session. This value isn't final until placement status is FULFILLED
        # .

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String?

        # A descriptive label that is associated with a game session. Session names do not need to be unique.

        @[JSON::Field(key: "GameSessionName")]
        getter game_session_name : String?

        # A descriptive label that is associated with game session queue. Queue names must be unique within
        # each Region.

        @[JSON::Field(key: "GameSessionQueueName")]
        getter game_session_queue_name : String?

        # Name of the Region where the game session created by this placement request is running. This value
        # isn't final until placement status is FULFILLED .

        @[JSON::Field(key: "GameSessionRegion")]
        getter game_session_region : String?

        # The IP address of the game session. To connect to a Amazon GameLift Servers game server, an app
        # needs both the IP address and port number. This value isn't final until placement status is
        # FULFILLED .

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # Information on the matchmaking process for this game. Data is in JSON syntax, formatted as a string.
        # It identifies the matchmaking configuration used to create the match, and contains data on all
        # players assigned to the match, including player attributes and team assignments. For more details on
        # matchmaker data, see Match Data .

        @[JSON::Field(key: "MatchmakerData")]
        getter matchmaker_data : String?

        # The maximum number of players that can be connected simultaneously to the game session.

        @[JSON::Field(key: "MaximumPlayerSessionCount")]
        getter maximum_player_session_count : Int32?

        # A collection of information on player sessions created in response to the game session placement
        # request. These player sessions are created only after a new game session is successfully placed
        # (placement status is FULFILLED ). This information includes the player ID, provided in the placement
        # request, and a corresponding player session ID.

        @[JSON::Field(key: "PlacedPlayerSessions")]
        getter placed_player_sessions : Array(Types::PlacedPlayerSession)?

        # A unique identifier for a game session placement.

        @[JSON::Field(key: "PlacementId")]
        getter placement_id : String?

        # A set of values, expressed in milliseconds, that indicates the amount of latency that a player
        # experiences when connected to Amazon Web Services Regions.

        @[JSON::Field(key: "PlayerLatencies")]
        getter player_latencies : Array(Types::PlayerLatency)?

        # The port number for the game session. To connect to a Amazon GameLift Servers game server, an app
        # needs both the IP address and port number. This value isn't final until placement status is
        # FULFILLED .

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # An alternative priority list of locations that's included with a game session placement request.
        # When provided, the list overrides a queue's location order list for this game session placement
        # request only. The list might include Amazon Web Services Regions, local zones, and custom locations
        # (for Anywhere fleets). The fallback strategy tells Amazon GameLift Servers what action to take (if
        # any) in the event that it failed to place a new game session.

        @[JSON::Field(key: "PriorityConfigurationOverride")]
        getter priority_configuration_override : Types::PriorityConfigurationOverride?

        # Time stamp indicating when this request was placed in the queue. Format is a number expressed in
        # Unix time as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Current status of the game session placement request. PENDING -- The placement request is in the
        # queue waiting to be processed. Game session properties are not yet final. FULFILLED -- A new game
        # session has been successfully placed. Game session properties are now final. CANCELLED -- The
        # placement request was canceled. TIMED_OUT -- A new game session was not successfully created before
        # the time limit expired. You can resubmit the placement request as needed. FAILED -- Amazon GameLift
        # Servers is not able to complete the process of placing the game session. Common reasons are the game
        # session terminated before the placement process was completed, or an unexpected internal error.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @dns_name : String? = nil,
          @end_time : Time? = nil,
          @game_properties : Array(Types::GameProperty)? = nil,
          @game_session_arn : String? = nil,
          @game_session_data : String? = nil,
          @game_session_id : String? = nil,
          @game_session_name : String? = nil,
          @game_session_queue_name : String? = nil,
          @game_session_region : String? = nil,
          @ip_address : String? = nil,
          @matchmaker_data : String? = nil,
          @maximum_player_session_count : Int32? = nil,
          @placed_player_sessions : Array(Types::PlacedPlayerSession)? = nil,
          @placement_id : String? = nil,
          @player_latencies : Array(Types::PlayerLatency)? = nil,
          @port : Int32? = nil,
          @priority_configuration_override : Types::PriorityConfigurationOverride? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Configuration for a game session placement mechanism that processes requests for new game sessions.
      # A queue can be used on its own or as part of a matchmaking solution.

      struct GameSessionQueue
        include JSON::Serializable

        # Information that is added to all events that are related to this game session queue.

        @[JSON::Field(key: "CustomEventData")]
        getter custom_event_data : String?

        # A list of fleets and/or fleet aliases that can be used to fulfill game session placement requests in
        # the queue. Destinations are identified by either a fleet ARN or a fleet alias ARN, and are listed in
        # order of placement preference.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::GameSessionQueueDestination)?

        # A list of locations where a queue is allowed to place new game sessions. Locations are specified in
        # the form of Amazon Web Services Region codes, such as us-west-2 . If this parameter is not set, game
        # sessions can be placed in any queue location.

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers game session queue
        # resource and uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::gamesessionqueue/&lt;queue name&gt; . In a Amazon GameLift Servers
        # game session queue ARN, the resource ID matches the Name value.

        @[JSON::Field(key: "GameSessionQueueArn")]
        getter game_session_queue_arn : String?

        # A descriptive label that is associated with game session queue. Queue names must be unique within
        # each Region.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An SNS topic ARN that is set up to receive game session placement notifications. See Setting up
        # notifications for game session placement .

        @[JSON::Field(key: "NotificationTarget")]
        getter notification_target : String?

        # A set of policies that enforce a sliding cap on player latency when processing game sessions
        # placement requests. Use multiple policies to gradually relax the cap over time if Amazon GameLift
        # Servers can't make a placement. Policies are evaluated in order starting with the lowest maximum
        # latency value.

        @[JSON::Field(key: "PlayerLatencyPolicies")]
        getter player_latency_policies : Array(Types::PlayerLatencyPolicy)?

        # Custom settings to use when prioritizing destinations and locations for game session placements.
        # This configuration replaces the FleetIQ default prioritization process. Priority types that are not
        # explicitly named will be automatically applied at the end of the prioritization process.

        @[JSON::Field(key: "PriorityConfiguration")]
        getter priority_configuration : Types::PriorityConfiguration?

        # The maximum time, in seconds, that a new game session placement request remains in the queue. When a
        # request exceeds this time, the game session placement changes to a TIMED_OUT status.

        @[JSON::Field(key: "TimeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        def initialize(
          @custom_event_data : String? = nil,
          @destinations : Array(Types::GameSessionQueueDestination)? = nil,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @game_session_queue_arn : String? = nil,
          @name : String? = nil,
          @notification_target : String? = nil,
          @player_latency_policies : Array(Types::PlayerLatencyPolicy)? = nil,
          @priority_configuration : Types::PriorityConfiguration? = nil,
          @timeout_in_seconds : Int32? = nil
        )
        end
      end

      # A fleet or alias designated in a game session queue. Queues fulfill requests for new game sessions
      # by placing a new game session on any of the queue's destinations.

      struct GameSessionQueueDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is assigned to fleet or fleet alias. ARNs, which include a fleet
        # ID or alias ID and a Region name, provide a unique identifier across all Regions.

        @[JSON::Field(key: "DestinationArn")]
        getter destination_arn : String?

        def initialize(
          @destination_arn : String? = nil
        )
        end
      end


      struct GetComputeAccessInput
        include JSON::Serializable

        # A unique identifier for the compute resource that you want to connect to. For an EC2 fleet, use an
        # instance ID. For a managed container fleet, use a compute name. You can retrieve a fleet's compute
        # names by calling ListCompute .

        @[JSON::Field(key: "ComputeName")]
        getter compute_name : String

        # A unique identifier for the fleet that holds the compute resource that you want to connect to. You
        # can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        def initialize(
          @compute_name : String,
          @fleet_id : String
        )
        end
      end


      struct GetComputeAccessOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to an Amazon GameLift Servers compute resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::compute/compute-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "ComputeArn")]
        getter compute_arn : String?

        # The identifier of the compute resource to be accessed. This value might be either a compute name or
        # an instance ID.

        @[JSON::Field(key: "ComputeName")]
        getter compute_name : String?

        # For a managed container fleet, a list of containers on the compute. Use the container runtime ID
        # with Docker commands to connect to a specific container.

        @[JSON::Field(key: "ContainerIdentifiers")]
        getter container_identifiers : Array(Types::ContainerIdentifier)?

        # A set of temporary Amazon Web Services credentials for use when connecting to the compute resource
        # with Amazon EC2 Systems Manager (SSM).

        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::AwsCredentials?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # The ID of the fleet that holds the compute resource to be accessed.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The instance ID where the compute resource is running.

        @[JSON::Field(key: "Target")]
        getter target : String?

        def initialize(
          @compute_arn : String? = nil,
          @compute_name : String? = nil,
          @container_identifiers : Array(Types::ContainerIdentifier)? = nil,
          @credentials : Types::AwsCredentials? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @target : String? = nil
        )
        end
      end


      struct GetComputeAuthTokenInput
        include JSON::Serializable

        # The name of the compute resource you are requesting the authentication token for. For an Anywhere
        # fleet compute, use the registered compute name. For an EC2 fleet instance, use the instance ID.

        @[JSON::Field(key: "ComputeName")]
        getter compute_name : String

        # A unique identifier for the fleet that the compute is registered to.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        def initialize(
          @compute_name : String,
          @fleet_id : String
        )
        end
      end


      struct GetComputeAuthTokenOutput
        include JSON::Serializable

        # A valid temporary authentication token.

        @[JSON::Field(key: "AuthToken")]
        getter auth_token : String?

        # The Amazon Resource Name ( ARN ) that is assigned to an Amazon GameLift Servers compute resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::compute/compute-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "ComputeArn")]
        getter compute_arn : String?

        # The name of the compute resource that the authentication token is issued to.

        @[JSON::Field(key: "ComputeName")]
        getter compute_name : String?

        # The amount of time until the authentication token is no longer valid.

        @[JSON::Field(key: "ExpirationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_timestamp : Time?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that the compute is registered to.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        def initialize(
          @auth_token : String? = nil,
          @compute_arn : String? = nil,
          @compute_name : String? = nil,
          @expiration_timestamp : Time? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil
        )
        end
      end


      struct GetGameSessionLogUrlInput
        include JSON::Serializable

        # A unique identifier for the game session to get logs for.

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String

        def initialize(
          @game_session_id : String
        )
        end
      end


      struct GetGameSessionLogUrlOutput
        include JSON::Serializable

        # Location of the requested game session logs, available for download. This URL is valid for 15
        # minutes, after which S3 will reject any download request using this URL. You can request a new URL
        # any time within the 14-day period that the logs are retained.

        @[JSON::Field(key: "PreSignedUrl")]
        getter pre_signed_url : String?

        def initialize(
          @pre_signed_url : String? = nil
        )
        end
      end


      struct GetInstanceAccessInput
        include JSON::Serializable

        # A unique identifier for the fleet that contains the instance you want to access. You can request
        # access to instances in EC2 fleets with the following statuses: ACTIVATING , ACTIVE , or ERROR . Use
        # either a fleet ID or an ARN value. You can access fleets in ERROR status for a short period of time
        # before Amazon GameLift Servers deletes them.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # A unique identifier for the instance you want to access. You can access an instance in any status.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        def initialize(
          @fleet_id : String,
          @instance_id : String
        )
        end
      end


      struct GetInstanceAccessOutput
        include JSON::Serializable

        # The connection information for a fleet instance, including IP address and access credentials.

        @[JSON::Field(key: "InstanceAccess")]
        getter instance_access : Types::InstanceAccess?

        def initialize(
          @instance_access : Types::InstanceAccess? = nil
        )
        end
      end

      # A game session with this custom ID string already exists in this fleet. Resolve this conflict before
      # retrying this request.

      struct IdempotentParameterMismatchException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a virtual computing instance that runs game server processes and hosts game sessions. In
      # Amazon GameLift Servers, one or more instances make up a managed EC2 fleet.

      struct Instance
        include JSON::Serializable

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The DNS identifier assigned to the instance that is running the game session. Values have the
        # following format: TLS-enabled fleets: &lt;unique identifier&gt;.&lt;region
        # identifier&gt;.amazongamelift.com . Non-TLS-enabled fleets: ec2-&lt;unique
        # identifier&gt;.compute.amazonaws.com . (See Amazon EC2 Instance IP Addressing .) When connecting to
        # a game session that is running on a TLS-enabled fleet, you must use the DNS name, not the IP
        # address.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that the instance belongs to.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # A unique identifier for the instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # IP address that is assigned to the instance.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The fleet location of the instance, expressed as an Amazon Web Services Region code, such as
        # us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # Operating system that is running on this EC2 instance. Amazon Linux 2 (AL2) will reach end of
        # support on 6/30/2025. See more details in the Amazon Linux 2 FAQs . For game servers that are hosted
        # on AL2 and use server SDK version 4.x for Amazon GameLift Servers, first update the game server
        # build to server SDK 5.x, and then deploy to AL2023 instances. See Migrate to server SDK version 5.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # Current status of the instance. Possible statuses include the following: PENDING -- The instance is
        # in the process of being created and launching server processes as defined in the fleet's run-time
        # configuration. ACTIVE -- The instance has been successfully created and at least one server process
        # has successfully launched and reported back to Amazon GameLift Servers that it is ready to host a
        # game session. The instance is now considered ready to host game sessions. TERMINATING -- The
        # instance is in the process of shutting down. This may happen to reduce capacity during a scaling
        # down event or to recycle resources in the event of a problem.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # EC2 instance type that defines the computing resources of this instance.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @creation_time : Time? = nil,
          @dns_name : String? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @instance_id : String? = nil,
          @ip_address : String? = nil,
          @location : String? = nil,
          @operating_system : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information and credentials that you can use to remotely connect to an instance in an EC2 managed
      # fleet. This data type is returned in response to a call to
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetInstanceAccess .

      struct InstanceAccess
        include JSON::Serializable

        # Security credentials that are required to access the instance.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::InstanceCredentials?

        # A unique identifier for the fleet containing the instance to be accessed.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # A unique identifier for the instance to be accessed.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # IP address assigned to the instance.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # Operating system that is running on the instance.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        def initialize(
          @credentials : Types::InstanceCredentials? = nil,
          @fleet_id : String? = nil,
          @instance_id : String? = nil,
          @ip_address : String? = nil,
          @operating_system : String? = nil
        )
        end
      end

      # A set of credentials that allow remote access to an instance in an EC2 managed fleet. These
      # credentials are returned in response to a call to
      # https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetInstanceAccess , which requests
      # access for instances that are running game servers with the Amazon GameLift Servers server SDK
      # version 4.x or earlier.

      struct InstanceCredentials
        include JSON::Serializable

        # Secret string. For Windows instances, the secret is a password for use with Windows Remote Desktop.
        # For Linux instances, it's a private key for use with SSH.

        @[JSON::Field(key: "Secret")]
        getter secret : String?

        # A user name for logging in.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @secret : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # An allowed instance type for a game server group. All game server groups must have at least two
      # instance types defined for it. Amazon GameLift Servers FleetIQ periodically evaluates each defined
      # instance type for viability. It then updates the Auto Scaling group with the list of viable instance
      # types.

      struct InstanceDefinition
        include JSON::Serializable

        # An Amazon EC2 instance type designation.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # Instance weighting that indicates how much this instance type contributes to the total capacity of a
        # game server group. Instance weights are used by Amazon GameLift Servers FleetIQ to calculate the
        # instance type's cost per unit hour and better identify the most cost-effective options. For detailed
        # information on weighting instance capacity, see Instance Weighting in the Amazon Elastic Compute
        # Cloud Auto Scaling User Guide . Default value is "1".

        @[JSON::Field(key: "WeightedCapacity")]
        getter weighted_capacity : String?

        def initialize(
          @instance_type : String,
          @weighted_capacity : String? = nil
        )
        end
      end

      # The service encountered an unrecoverable internal failure while processing the request. Clients can
      # retry such requests immediately or after a waiting period.

      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a resource associated with
      # the request and/or the fleet. Resolve the conflict before retrying.

      struct InvalidFleetStatusException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a resource associated with
      # the request and/or the game instance. Resolve the conflict before retrying.

      struct InvalidGameSessionStatusException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameter values in the request are invalid. Correct the invalid parameter values before
      # retrying.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A range of IP addresses and port settings that allow inbound traffic to connect to processes on an
      # instance in a fleet. Processes are assigned an IP address/port number combination, which must fall
      # into the fleet's allowed ranges. For Amazon GameLift Servers Realtime fleets, Amazon GameLift
      # Servers automatically opens two port ranges, one for TCP messaging and one for UDP.

      struct IpPermission
        include JSON::Serializable

        # A starting value for a range of allowed port numbers. For fleets using Linux builds, only ports 22
        # and 1026-60000 are valid. For fleets using Windows builds, only ports 1026-60000 are valid.

        @[JSON::Field(key: "FromPort")]
        getter from_port : Int32

        # A range of allowed IP addresses. This value must be expressed in CIDR notation. Example: "
        # 000.000.000.000/[subnet mask] " or optionally the shortened version " 0.0.0.0/[subnet mask] ".

        @[JSON::Field(key: "IpRange")]
        getter ip_range : String

        # The network communication protocol used by the fleet.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # An ending value for a range of allowed port numbers. Port numbers are end-inclusive. This value must
        # be equal to or greater than FromPort . For fleets using Linux builds, only ports 22 and 1026-60000
        # are valid. For fleets using Windows builds, only ports 1026-60000 are valid.

        @[JSON::Field(key: "ToPort")]
        getter to_port : Int32

        def initialize(
          @from_port : Int32,
          @ip_range : String,
          @protocol : String,
          @to_port : Int32
        )
        end
      end

      # An Amazon Elastic Compute Cloud launch template that contains configuration settings and game server
      # code to be deployed to all instances in a game server group. The launch template is specified when
      # creating a new game server group.

      struct LaunchTemplateSpecification
        include JSON::Serializable

        # A unique identifier for an existing Amazon EC2 launch template.

        @[JSON::Field(key: "LaunchTemplateId")]
        getter launch_template_id : String?

        # A readable identifier for an existing Amazon EC2 launch template.

        @[JSON::Field(key: "LaunchTemplateName")]
        getter launch_template_name : String?

        # The version of the Amazon EC2 launch template to use. If no version is specified, the default
        # version will be used. With Amazon EC2, you can specify a default version for a launch template. If
        # none is set, the default is the first version created.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @launch_template_id : String? = nil,
          @launch_template_name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # The requested operation would cause the resource to exceed the allowed service limit. Resolve the
      # issue before retrying.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAliasesInput
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A descriptive label that is associated with an alias. Alias names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The routing type to filter results on. Use this parameter to retrieve only aliases with a certain
        # routing type. To retrieve all aliases, leave this parameter empty. Possible routing types include
        # the following: SIMPLE -- The alias resolves to one specific fleet. Use this type when routing to
        # active fleets. TERMINAL -- The alias does not resolve to a fleet but instead can be used to display
        # a message to the user. A terminal alias throws a TerminalRoutingStrategyException with the
        # RoutingStrategy message embedded.

        @[JSON::Field(key: "RoutingStrategyType")]
        getter routing_strategy_type : String?

        def initialize(
          @limit : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @routing_strategy_type : String? = nil
        )
        end
      end


      struct ListAliasesOutput
        include JSON::Serializable

        # A collection of alias resources that match the request parameters.

        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(Types::Alias)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aliases : Array(Types::Alias)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBuildsInput
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Build status to filter results by. To retrieve all builds, leave this parameter empty. Possible
        # build statuses include the following: INITIALIZED -- A new build has been defined, but no files have
        # been uploaded. You cannot create fleets for builds that are in this status. When a build is
        # successfully created, the build status is set to this value. READY -- The game build has been
        # successfully uploaded. You can now create new fleets for this build. FAILED -- The game build upload
        # failed. You cannot create new fleets for this build.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListBuildsOutput
        include JSON::Serializable

        # A collection of build resources that match the request.

        @[JSON::Field(key: "Builds")]
        getter builds : Array(Types::Build)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @builds : Array(Types::Build)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComputeInput
        include JSON::Serializable

        # A unique identifier for the fleet to retrieve compute resources for.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The status of computes in a managed container fleet, based on the success of the latest update
        # deployment. ACTIVE -- The compute is deployed with the correct container definitions. It is ready to
        # process game servers and host game sessions. IMPAIRED -- An update deployment to the compute failed,
        # and the compute is deployed with incorrect container definitions.

        @[JSON::Field(key: "ComputeStatus")]
        getter compute_status : String?

        # For computes in a managed container fleet, the name of the deployed container group definition.

        @[JSON::Field(key: "ContainerGroupDefinitionName")]
        getter container_group_definition_name : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The name of a location to retrieve compute resources for. For an Amazon GameLift Servers Anywhere
        # fleet, use a custom location. For a managed fleet, provide a Amazon Web Services Region or Local
        # Zone code (for example: us-west-2 or us-west-2-lax-1 ).

        @[JSON::Field(key: "Location")]
        getter location : String?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_id : String,
          @compute_status : String? = nil,
          @container_group_definition_name : String? = nil,
          @limit : Int32? = nil,
          @location : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComputeOutput
        include JSON::Serializable

        # A list of compute resources in the specified fleet.

        @[JSON::Field(key: "ComputeList")]
        getter compute_list : Array(Types::Compute)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @compute_list : Array(Types::Compute)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContainerFleetsInput
        include JSON::Serializable

        # The container group definition to filter the list on. Use this parameter to retrieve only those
        # fleets that use the specified container group definition. You can specify the container group
        # definition's name to get fleets with the latest versions. Alternatively, provide an ARN value to get
        # fleets with a specific version number.

        @[JSON::Field(key: "ContainerGroupDefinitionName")]
        getter container_group_definition_name : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @container_group_definition_name : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContainerFleetsOutput
        include JSON::Serializable

        # A collection of container fleet objects for all fleets that match the request criteria.

        @[JSON::Field(key: "ContainerFleets")]
        getter container_fleets : Array(Types::ContainerFleet)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @container_fleets : Array(Types::ContainerFleet)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContainerGroupDefinitionVersionsInput
        include JSON::Serializable

        # The unique identifier for the container group definition to retrieve properties for. You can use
        # either the Name or ARN value.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContainerGroupDefinitionVersionsOutput
        include JSON::Serializable

        # A result set of container group definitions that match the request.

        @[JSON::Field(key: "ContainerGroupDefinitions")]
        getter container_group_definitions : Array(Types::ContainerGroupDefinition)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @container_group_definitions : Array(Types::ContainerGroupDefinition)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContainerGroupDefinitionsInput
        include JSON::Serializable

        # The type of container group to retrieve. Container group type determines how Amazon GameLift Servers
        # deploys the container group on each fleet instance.

        @[JSON::Field(key: "ContainerGroupType")]
        getter container_group_type : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @container_group_type : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContainerGroupDefinitionsOutput
        include JSON::Serializable

        # A result set of container group definitions that match the request.

        @[JSON::Field(key: "ContainerGroupDefinitions")]
        getter container_group_definitions : Array(Types::ContainerGroupDefinition)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @container_group_definitions : Array(Types::ContainerGroupDefinition)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFleetDeploymentsInput
        include JSON::Serializable

        # A unique identifier for the container fleet. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFleetDeploymentsOutput
        include JSON::Serializable

        # The requested deployment information.

        @[JSON::Field(key: "FleetDeployments")]
        getter fleet_deployments : Array(Types::FleetDeployment)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_deployments : Array(Types::FleetDeployment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFleetsInput
        include JSON::Serializable

        # A unique identifier for the build to request fleets for. Use this parameter to return only fleets
        # using a specified build. Use either the build ID or ARN value.

        @[JSON::Field(key: "BuildId")]
        getter build_id : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A unique identifier for the Realtime script to request fleets for. Use this parameter to return only
        # fleets using a specified script. Use either the script ID or ARN value.

        @[JSON::Field(key: "ScriptId")]
        getter script_id : String?

        def initialize(
          @build_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @script_id : String? = nil
        )
        end
      end


      struct ListFleetsOutput
        include JSON::Serializable

        # A set of fleet IDs that match the list request.

        @[JSON::Field(key: "FleetIds")]
        getter fleet_ids : Array(String)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fleet_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGameServerGroupsInput
        include JSON::Serializable

        # The game server groups' limit.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGameServerGroupsOutput
        include JSON::Serializable

        # The game server groups' game server groups.

        @[JSON::Field(key: "GameServerGroups")]
        getter game_server_groups : Array(Types::GameServerGroup)?

        # Specify the pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @game_server_groups : Array(Types::GameServerGroup)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGameServersInput
        include JSON::Serializable

        # An identifier for the game server group to retrieve a list of game servers from. Use either the name
        # or ARN value.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Indicates how to sort the returned data based on game server registration timestamp. Use ASCENDING
        # to retrieve oldest game servers first, or use DESCENDING to retrieve newest game servers first. If
        # this parameter is left empty, game servers are returned in no particular order.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @game_server_group_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListGameServersOutput
        include JSON::Serializable

        # A collection of game server objects that match the request.

        @[JSON::Field(key: "GameServers")]
        getter game_servers : Array(Types::GameServer)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @game_servers : Array(Types::GameServer)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLocationsInput
        include JSON::Serializable

        # Filters the list for AWS or CUSTOM locations. Use this parameter to narrow down results to only
        # Amazon Web Services-managed locations (Amazon EC2 or container) or only your custom locations (such
        # as an Amazon GameLift Servers Anywhere fleet).

        @[JSON::Field(key: "Filters")]
        getter filters : Array(String)?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLocationsOutput
        include JSON::Serializable

        # A collection of locations, including both Amazon Web Services and custom locations. Each location
        # includes a name and ping beacon information that can be used to measure network latency between
        # player devices and the location.

        @[JSON::Field(key: "Locations")]
        getter locations : Array(Types::LocationModel)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @locations : Array(Types::LocationModel)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListScriptsInput
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListScriptsOutput
        include JSON::Serializable

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A set of properties describing the requested script.

        @[JSON::Field(key: "Scripts")]
        getter scripts : Array(Types::Script)?

        def initialize(
          @next_token : String? = nil,
          @scripts : Array(Types::Script)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that uniquely identifies the Amazon GameLift Servers resource that
        # you want to retrieve tags for. Amazon GameLift Servers includes resource ARNs in the data object for
        # the resource. You can retrieve the ARN by calling a List or Describe operation for the resource
        # type.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The collection of tags assigned to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Details about a location in a multi-location fleet.

      struct LocationAttributes
        include JSON::Serializable

        # A fleet location and its current life-cycle state.

        @[JSON::Field(key: "LocationState")]
        getter location_state : Types::LocationState?

        # A list of fleet actions that have been suspended in the fleet location.

        @[JSON::Field(key: "StoppedActions")]
        getter stopped_actions : Array(String)?

        # The status of fleet activity updates to the location. The status PENDING_UPDATE indicates that
        # StopFleetActions or StartFleetActions has been requested but the update has not yet been completed
        # for the location.

        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : String?

        def initialize(
          @location_state : Types::LocationState? = nil,
          @stopped_actions : Array(String)? = nil,
          @update_status : String? = nil
        )
        end
      end

      # A remote location where a multi-location fleet can deploy game servers for game hosting.

      struct LocationConfiguration
        include JSON::Serializable

        # An Amazon Web Services Region code, such as us-west-2 . For a list of supported Regions and Local
        # Zones, see Amazon GameLift Servers service locations for managed hosting.

        @[JSON::Field(key: "Location")]
        getter location : String

        def initialize(
          @location : String
        )
        end
      end

      # Properties of a location, which can include its name, ARN (for custom locations), and ping beacon
      # information.

      struct LocationModel
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a custom location resource and uniquely
        # identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::location/location-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "LocationArn")]
        getter location_arn : String?

        # The location's name.

        @[JSON::Field(key: "LocationName")]
        getter location_name : String?

        # Information about the UDP ping beacon for this location.

        @[JSON::Field(key: "PingBeacon")]
        getter ping_beacon : Types::PingBeacon?

        def initialize(
          @location_arn : String? = nil,
          @location_name : String? = nil,
          @ping_beacon : Types::PingBeacon? = nil
        )
        end
      end

      # A fleet location and its life-cycle state. A location state object might be used to describe a
      # fleet's remote location or home Region. Life-cycle state tracks the progress of launching the first
      # instance in a new location and preparing it for game hosting, and then removing all instances and
      # deleting the location from the fleet. NEW -- A new fleet location has been defined and desired
      # instances is set to 1. DOWNLOADING/VALIDATING/BUILDING/ACTIVATING -- Amazon GameLift Servers is
      # setting up the new fleet location, creating new instances with the game build or Realtime script and
      # starting server processes. ACTIVE -- Hosts can now accept game sessions. ERROR -- An error occurred
      # when downloading, validating, building, or activating the fleet location. DELETING -- Hosts are
      # responding to a delete fleet location request. TERMINATED -- The fleet location no longer exists.
      # NOT_FOUND -- The fleet location was not found. This could be because the custom location was removed
      # or not created.

      struct LocationState
        include JSON::Serializable

        # The fleet location, expressed as an Amazon Web Services Region code such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The life-cycle status of a fleet location.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @location : String? = nil,
          @status : String? = nil
        )
        end
      end

      # For a multi-location container fleet, describes the progress of a deployment across all fleet
      # locations.

      struct LocationalDeployment
        include JSON::Serializable

        # The status of fleet deployment activity in the location. IN_PROGRESS -- The deployment is in
        # progress. IMPAIRED -- The deployment failed and the fleet has some impaired containers. COMPLETE --
        # The deployment has completed successfully. ROLLBACK_IN_PROGRESS -- The deployment failed and
        # rollback has been initiated. ROLLBACK_IN_COMPLETE -- The deployment failed and rollback has been
        # completed. CANCELLED -- The deployment was cancelled.

        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        def initialize(
          @deployment_status : String? = nil
        )
        end
      end

      # A method for collecting container logs for the fleet. Amazon GameLift Servers saves all standard
      # output for each container in logs, including game session logs. You can select from the following
      # methods:

      struct LogConfiguration
        include JSON::Serializable

        # The type of log collection to use for a fleet. CLOUDWATCH -- (default value) Send logs to an Amazon
        # CloudWatch log group that you define. Each container emits a log stream, which is organized in the
        # log group. S3 -- Store logs in an Amazon S3 bucket that you define. This bucket must reside in the
        # fleet's home Amazon Web Services Region. NONE -- Don't collect container logs.

        @[JSON::Field(key: "LogDestination")]
        getter log_destination : String?

        # If log destination is CLOUDWATCH , logs are sent to the specified log group in Amazon CloudWatch.

        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String?

        # If log destination is S3 , logs are sent to the specified Amazon S3 bucket name.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        def initialize(
          @log_destination : String? = nil,
          @log_group_arn : String? = nil,
          @s3_bucket_name : String? = nil
        )
        end
      end

      # Represents a new player session that is created as a result of a successful FlexMatch match. A
      # successful match automatically creates new player sessions for every player ID in the original
      # matchmaking request. When players connect to the match's game session, they must include both player
      # ID and player session ID in order to claim their assigned player slot.

      struct MatchedPlayerSession
        include JSON::Serializable

        # A unique identifier for a player

        @[JSON::Field(key: "PlayerId")]
        getter player_id : String?

        # A unique identifier for a player session

        @[JSON::Field(key: "PlayerSessionId")]
        getter player_session_id : String?

        def initialize(
          @player_id : String? = nil,
          @player_session_id : String? = nil
        )
        end
      end

      # Guidelines for use with FlexMatch to match players into games. All matchmaking requests must specify
      # a matchmaking configuration.

      struct MatchmakingConfiguration
        include JSON::Serializable

        # A flag that indicates whether a match that was created with this configuration must be accepted by
        # the matched players. To require acceptance, set to TRUE. When this option is enabled, matchmaking
        # tickets use the status REQUIRES_ACCEPTANCE to indicate when a completed potential match is waiting
        # for player acceptance.

        @[JSON::Field(key: "AcceptanceRequired")]
        getter acceptance_required : Bool?

        # The length of time (in seconds) to wait for players to accept a proposed match, if acceptance is
        # required. If any player rejects the match or fails to accept before the timeout, the ticket
        # continues to look for an acceptable match.

        @[JSON::Field(key: "AcceptanceTimeoutSeconds")]
        getter acceptance_timeout_seconds : Int32?

        # The number of player slots in a match to keep open for future players. For example, if the
        # configuration's rule set specifies a match for a single 12-person team, and the additional player
        # count is set to 2, only 10 players are selected for the match. This parameter is not used when
        # FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "AdditionalPlayerCount")]
        getter additional_player_count : Int32?

        # The method used to backfill game sessions created with this matchmaking configuration. MANUAL
        # indicates that the game makes backfill requests or does not use the match backfill feature.
        # AUTOMATIC indicates that GameLift creates backfill requests whenever a game session has one or more
        # open slots. Learn more about manual and automatic backfill in Backfill existing games with FlexMatch
        # . Automatic backfill is not available when FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "BackfillMode")]
        getter backfill_mode : String?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers matchmaking
        # configuration resource and uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::matchmakingconfiguration/&lt;matchmaking configuration name&gt; .
        # In a Amazon GameLift Servers configuration ARN, the resource ID matches the Name value.

        @[JSON::Field(key: "ConfigurationArn")]
        getter configuration_arn : String?

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Information to attach to all events related to the matchmaking configuration.

        @[JSON::Field(key: "CustomEventData")]
        getter custom_event_data : String?

        # A descriptive label that is associated with matchmaking configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether this matchmaking configuration is being used with Amazon GameLift Servers hosting
        # or as a standalone matchmaking solution. STANDALONE - FlexMatch forms matches and returns match
        # information, including players and team assignments, in a MatchmakingSucceeded event. WITH_QUEUE -
        # FlexMatch forms matches and uses the specified Amazon GameLift Servers queue to start a game session
        # for the match.

        @[JSON::Field(key: "FlexMatchMode")]
        getter flex_match_mode : String?

        # A set of key-value pairs that can store custom data in a game session. For example: {"Key":
        # "difficulty", "Value": "novice"} . This information is added to the new GameSession object that is
        # created for a successful match. This parameter is not used when FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "GameProperties")]
        getter game_properties : Array(Types::GameProperty)?

        # A set of custom game session properties, formatted as a single string value. This data is passed to
        # a game server process with a request to start a new game session. For more information, see Start a
        # game session . This information is added to the new GameSession object that is created for a
        # successful match. This parameter is not used when FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "GameSessionData")]
        getter game_session_data : String?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers game session queue
        # resource and uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::gamesessionqueue/&lt;queue name&gt; . Queues can be located in any
        # Region. Queues are used to start new Amazon GameLift Servers-hosted game sessions for matches that
        # are created with this matchmaking configuration. This property is not set when FlexMatchMode is set
        # to STANDALONE .

        @[JSON::Field(key: "GameSessionQueueArns")]
        getter game_session_queue_arns : Array(String)?

        # A unique identifier for the matchmaking configuration. This name is used to identify the
        # configuration associated with a matchmaking request or ticket.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An SNS topic ARN that is set up to receive matchmaking notifications.

        @[JSON::Field(key: "NotificationTarget")]
        getter notification_target : String?

        # The maximum duration, in seconds, that a matchmaking ticket can remain in process before timing out.
        # Requests that fail due to timing out can be resubmitted as needed.

        @[JSON::Field(key: "RequestTimeoutSeconds")]
        getter request_timeout_seconds : Int32?

        # The Amazon Resource Name ( ARN ) associated with the GameLift matchmaking rule set resource that
        # this configuration uses.

        @[JSON::Field(key: "RuleSetArn")]
        getter rule_set_arn : String?

        # A unique identifier for the matchmaking rule set to use with this configuration. A matchmaking
        # configuration can only use rule sets that are defined in the same Region.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String?

        def initialize(
          @acceptance_required : Bool? = nil,
          @acceptance_timeout_seconds : Int32? = nil,
          @additional_player_count : Int32? = nil,
          @backfill_mode : String? = nil,
          @configuration_arn : String? = nil,
          @creation_time : Time? = nil,
          @custom_event_data : String? = nil,
          @description : String? = nil,
          @flex_match_mode : String? = nil,
          @game_properties : Array(Types::GameProperty)? = nil,
          @game_session_data : String? = nil,
          @game_session_queue_arns : Array(String)? = nil,
          @name : String? = nil,
          @notification_target : String? = nil,
          @request_timeout_seconds : Int32? = nil,
          @rule_set_arn : String? = nil,
          @rule_set_name : String? = nil
        )
        end
      end

      # Set of rule statements, used with FlexMatch, that determine how to build your player matches. Each
      # rule set describes a type of group to be created and defines the parameters for acceptable player
      # matches. A rule set may define the following elements for a match. For detailed information and
      # examples showing how to construct a rule set, see Build a FlexMatch rule set . Teams -- Required. A
      # rule set must define one or multiple teams for the match and set minimum and maximum team sizes. For
      # example, a rule set might describe a 4x4 match that requires all eight slots to be filled. Player
      # attributes -- Optional. These attributes specify a set of player characteristics to evaluate when
      # looking for a match. Matchmaking requests that use a rule set with player attributes must provide
      # the corresponding attribute values. For example, an attribute might specify a player's skill or
      # level. Rules -- Optional. Rules define how to evaluate potential players for a match based on player
      # attributes. A rule might specify minimum requirements for individual players, teams, or entire
      # matches. For example, a rule might require each player to meet a certain skill level, each team to
      # have at least one player in a certain role, or the match to have a minimum average skill level. or
      # may describe an entire group--such as all teams must be evenly matched or have at least one player
      # in a certain role. Expansions -- Optional. Expansions allow you to relax the rules after a period of
      # time when no acceptable matches are found. This feature lets you balance getting players into games
      # in a reasonable amount of time instead of making them wait indefinitely for the best possible match.
      # For example, you might use an expansion to increase the maximum skill variance between players after
      # 30 seconds.

      struct MatchmakingRuleSet
        include JSON::Serializable

        # A collection of matchmaking rules, formatted as a JSON string. Comments are not allowed in JSON, but
        # most elements support a description field.

        @[JSON::Field(key: "RuleSetBody")]
        getter rule_set_body : String

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers matchmaking rule set
        # resource and uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::matchmakingruleset/&lt;ruleset name&gt; . In a GameLift rule set
        # ARN, the resource ID matches the RuleSetName value.

        @[JSON::Field(key: "RuleSetArn")]
        getter rule_set_arn : String?

        # A unique identifier for the matchmaking rule set

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String?

        def initialize(
          @rule_set_body : String,
          @creation_time : Time? = nil,
          @rule_set_arn : String? = nil,
          @rule_set_name : String? = nil
        )
        end
      end

      # Ticket generated to track the progress of a matchmaking request. Each ticket is uniquely identified
      # by a ticket ID, supplied by the requester, when creating a matchmaking request.

      struct MatchmakingTicket
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) associated with the GameLift matchmaking configuration resource
        # that is used with this ticket.

        @[JSON::Field(key: "ConfigurationArn")]
        getter configuration_arn : String?

        # Name of the matchmaking configuration that is used with this ticket. Matchmaking configurations
        # determine how players are grouped into a match and how a new game session is created for the match.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String?

        # Time stamp indicating when the matchmaking request stopped being processed due to successful
        # completion, timeout, or cancellation. Format is a number expressed in Unix time as milliseconds (for
        # example "1469498468.057" ).

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Average amount of time (in seconds) that players are currently waiting for a match. If there is not
        # enough recent data, this property may be empty.

        @[JSON::Field(key: "EstimatedWaitTime")]
        getter estimated_wait_time : Int32?

        # Connection information for a new game session. Once a match is made, the FlexMatch engine creates a
        # new game session for it. This information is added to the matchmaking ticket, which you can be
        # retrieve by calling DescribeMatchmaking .

        @[JSON::Field(key: "GameSessionConnectionInfo")]
        getter game_session_connection_info : Types::GameSessionConnectionInfo?

        # A set of Player objects, each representing a player to find matches for. Players are identified by a
        # unique player ID and may include latency data for use during matchmaking. If the ticket is in status
        # COMPLETED , the Player objects include the team the players were assigned to in the resulting match.

        @[JSON::Field(key: "Players")]
        getter players : Array(Types::Player)?

        # Time stamp indicating when this matchmaking request was received. Format is a number expressed in
        # Unix time as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Current status of the matchmaking request. QUEUED -- The matchmaking request has been received and
        # is currently waiting to be processed. SEARCHING -- The matchmaking request is currently being
        # processed. REQUIRES_ACCEPTANCE -- A match has been proposed and the players must accept the match.
        # This status is used only with requests that use a matchmaking configuration with a player acceptance
        # requirement. PLACING -- The FlexMatch engine has matched players and is in the process of placing a
        # new game session for the match. COMPLETED -- Players have been matched and a game session is ready
        # to host the players. A ticket in this state contains the necessary connection information for
        # players. FAILED -- The matchmaking request was not completed. CANCELLED -- The matchmaking request
        # was canceled. This may be the result of a StopMatchmaking operation or a proposed match that one or
        # more players failed to accept. TIMED_OUT -- The matchmaking request was not successful within the
        # duration specified in the matchmaking configuration. Matchmaking requests that fail to successfully
        # complete (statuses FAILED, CANCELLED, TIMED_OUT) can be resubmitted as new requests with new ticket
        # IDs.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the current status.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # Code to explain the current status. For example, a status reason may indicate when a ticket has
        # returned to SEARCHING status after a proposed match fails to receive player acceptances.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # A unique identifier for a matchmaking ticket.

        @[JSON::Field(key: "TicketId")]
        getter ticket_id : String?

        def initialize(
          @configuration_arn : String? = nil,
          @configuration_name : String? = nil,
          @end_time : Time? = nil,
          @estimated_wait_time : Int32? = nil,
          @game_session_connection_info : Types::GameSessionConnectionInfo? = nil,
          @players : Array(Types::Player)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @status_reason : String? = nil,
          @ticket_id : String? = nil
        )
        end
      end

      # The requested resources was not found. The resource was either not created yet or deleted.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because Amazon GameLift Servers has not yet finished validating this compute.
      # We recommend attempting 8 to 10 retries over 3 to 5 minutes with exponential backoffs and jitter .

      struct NotReadyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified game server group has no available game servers to fulfill a ClaimGameServer request.
      # Clients can retry such requests immediately or after a waiting period.

      struct OutOfCapacityException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a UDP ping beacon that can be used to measure network latency between a player
      # device and an Amazon GameLift Servers hosting location.

      struct PingBeacon
        include JSON::Serializable

        # The domain name and port of the UDP ping beacon.

        @[JSON::Field(key: "UDPEndpoint")]
        getter udp_endpoint : Types::UDPEndpoint?

        def initialize(
          @udp_endpoint : Types::UDPEndpoint? = nil
        )
        end
      end

      # Information about a player session. This object contains only the player ID and player session ID.
      # To retrieve full details on a player session, call DescribePlayerSessions with the player session
      # ID.

      struct PlacedPlayerSession
        include JSON::Serializable

        # A unique identifier for a player that is associated with this player session.

        @[JSON::Field(key: "PlayerId")]
        getter player_id : String?

        # A unique identifier for a player session.

        @[JSON::Field(key: "PlayerSessionId")]
        getter player_session_id : String?

        def initialize(
          @player_id : String? = nil,
          @player_session_id : String? = nil
        )
        end
      end

      # Represents a player in matchmaking. When starting a matchmaking request, a player has a player ID,
      # attributes, and may have latency data. Team information is added after a match has been successfully
      # completed.

      struct Player
        include JSON::Serializable

        # A set of values, expressed in milliseconds, that indicates the amount of latency that a player
        # experiences when connected to Amazon Web Services Regions. If this property is present, FlexMatch
        # considers placing the match only in Regions for which latency is reported. If a matchmaker has a
        # rule that evaluates player latency, players must report latency in order to be matched. If no
        # latency is reported in this scenario, FlexMatch assumes that no Regions are available to the player
        # and the ticket is not matchable.

        @[JSON::Field(key: "LatencyInMs")]
        getter latency_in_ms : Hash(String, Int32)?

        # A collection of key:value pairs containing player information for use in matchmaking. Player
        # attribute keys must match the playerAttributes used in a matchmaking rule set. Example:
        # "PlayerAttributes": {"skill": {"N": "23"}, "gameMode": {"S": "deathmatch"}} . You can provide up to
        # 10 PlayerAttributes .

        @[JSON::Field(key: "PlayerAttributes")]
        getter player_attributes : Hash(String, Types::AttributeValue)?

        # A unique identifier for a player

        @[JSON::Field(key: "PlayerId")]
        getter player_id : String?

        # Name of the team that the player is assigned to in a match. Team names are defined in a matchmaking
        # rule set.

        @[JSON::Field(key: "Team")]
        getter team : String?

        def initialize(
          @latency_in_ms : Hash(String, Int32)? = nil,
          @player_attributes : Hash(String, Types::AttributeValue)? = nil,
          @player_id : String? = nil,
          @team : String? = nil
        )
        end
      end

      # Regional latency information for a player, used when requesting a new game session. This value
      # indicates the amount of time lag that exists when the player is connected to a fleet in the
      # specified Region. The relative difference between a player's latency values for multiple Regions are
      # used to determine which fleets are best suited to place a new game session for the player.

      struct PlayerLatency
        include JSON::Serializable

        # Amount of time that represents the time lag experienced by the player when connected to the
        # specified Region.

        @[JSON::Field(key: "LatencyInMilliseconds")]
        getter latency_in_milliseconds : Float64?

        # A unique identifier for a player associated with the latency data.

        @[JSON::Field(key: "PlayerId")]
        getter player_id : String?

        # Name of the Region that is associated with the latency value.

        @[JSON::Field(key: "RegionIdentifier")]
        getter region_identifier : String?

        def initialize(
          @latency_in_milliseconds : Float64? = nil,
          @player_id : String? = nil,
          @region_identifier : String? = nil
        )
        end
      end

      # Sets a latency cap for individual players when placing a game session. With a latency policy in
      # force, a game session cannot be placed in a fleet location where a player reports latency higher
      # than the cap. Latency policies are used only with placement request that provide player latency
      # information. Player latency policies can be stacked to gradually relax latency requirements over
      # time.

      struct PlayerLatencyPolicy
        include JSON::Serializable

        # The maximum latency value that is allowed for any player, in milliseconds. All policies must have a
        # value set for this property.

        @[JSON::Field(key: "MaximumIndividualPlayerLatencyMilliseconds")]
        getter maximum_individual_player_latency_milliseconds : Int32?

        # The length of time, in seconds, that the policy is enforced while placing a new game session. A null
        # value for this property means that the policy is enforced until the queue times out.

        @[JSON::Field(key: "PolicyDurationSeconds")]
        getter policy_duration_seconds : Int32?

        def initialize(
          @maximum_individual_player_latency_milliseconds : Int32? = nil,
          @policy_duration_seconds : Int32? = nil
        )
        end
      end

      # Represents a player session. Player sessions are created either for a specific game session, or as
      # part of a game session placement or matchmaking request. A player session can represents a reserved
      # player slot in a game session (when status is RESERVED ) or actual player activity in a game session
      # (when status is ACTIVE ). A player session object, including player data, is automatically passed to
      # a game session when the player connects to the game session and is validated. After the game session
      # ends, player sessions information is retained for 30 days and then removed. Related actions All APIs
      # by task

      struct PlayerSession
        include JSON::Serializable

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The DNS identifier assigned to the instance that is running the game session. Values have the
        # following format: TLS-enabled fleets: &lt;unique identifier&gt;.&lt;region
        # identifier&gt;.amazongamelift.com . Non-TLS-enabled fleets: ec2-&lt;unique
        # identifier&gt;.compute.amazonaws.com . (See Amazon EC2 Instance IP Addressing .) When connecting to
        # a game session that is running on a TLS-enabled fleet, you must use the DNS name, not the IP
        # address.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # The Amazon Resource Name ( ARN ) associated with the GameLift fleet that the player's game session
        # is running on.

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that the player's game session is running on.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # A unique identifier for the game session that the player session is connected to.

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String?

        # The IP address of the game session. To connect to a Amazon GameLift Servers game server, an app
        # needs both the IP address and port number.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # Developer-defined information related to a player. Amazon GameLift Servers does not use this data,
        # so it can be formatted as needed for use in the game.

        @[JSON::Field(key: "PlayerData")]
        getter player_data : String?

        # A unique identifier for a player that is associated with this player session.

        @[JSON::Field(key: "PlayerId")]
        getter player_id : String?

        # A unique identifier for a player session.

        @[JSON::Field(key: "PlayerSessionId")]
        getter player_session_id : String?

        # Port number for the game session. To connect to a Amazon GameLift Servers server process, an app
        # needs both the IP address and port number.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Current status of the player session. Possible player session statuses include the following:
        # RESERVED -- The player session request has been received, but the player has not yet connected to
        # the server process and/or been validated. ACTIVE -- The player has been validated by the server
        # process and is currently connected. COMPLETED -- The player connection has been dropped. TIMEDOUT --
        # A player session request was received, but the player did not connect and/or was not validated
        # within the timeout limit (60 seconds).

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A time stamp indicating when this data object was terminated. Format is a number expressed in Unix
        # time as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "TerminationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter termination_time : Time?

        def initialize(
          @creation_time : Time? = nil,
          @dns_name : String? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @game_session_id : String? = nil,
          @ip_address : String? = nil,
          @player_data : String? = nil,
          @player_id : String? = nil,
          @player_session_id : String? = nil,
          @port : Int32? = nil,
          @status : String? = nil,
          @termination_time : Time? = nil
        )
        end
      end

      # Custom prioritization settings to use with a game session queue. Prioritization settings determine
      # how the queue selects a game hosting resource to start a new game session. This configuration
      # replaces the default prioritization process for queues. By default, a queue makes game session
      # placements based on the following criteria: When a game session request does not include player
      # latency data, Amazon GameLift Servers places game sessions based on the following priorities: (1)
      # the queue's default destination order, and (2) for multi-location fleets, an alphabetic list of
      # locations. When a game session request includes player latency data, Amazon GameLift Servers
      # re-orders the queue's destinations to make placements where the average player latency is lowest. It
      # reorders based the following priorities: (1) the lowest average latency across all players, (2) the
      # lowest hosting cost, (3) the queue's default destination order, and (4) for multi-location fleets,
      # an alphabetic list of locations.

      struct PriorityConfiguration
        include JSON::Serializable

        # The prioritization order to use for fleet locations, when the PriorityOrder property includes
        # LOCATION . Locations can include Amazon Web Services Region codes (such as us-west-2 ), local zones,
        # and custom locations (for Anywhere fleets). Each location must be listed only once. For details, see
        # Amazon GameLift Servers service locations.

        @[JSON::Field(key: "LocationOrder")]
        getter location_order : Array(String)?

        # A custom sequence to use when prioritizing where to place new game sessions. Each priority type is
        # listed once. LATENCY -- Amazon GameLift Servers prioritizes locations where the average player
        # latency is lowest. Player latency data is provided in each game session placement request. COST --
        # Amazon GameLift Servers prioritizes queue destinations with the lowest current hosting costs. Cost
        # is evaluated based on the destination's location, instance type, and fleet type (Spot or On-Demand).
        # DESTINATION -- Amazon GameLift Servers prioritizes based on the list order of destinations in the
        # queue configuration. LOCATION -- Amazon GameLift Servers prioritizes based on the provided order of
        # locations, as defined in LocationOrder .

        @[JSON::Field(key: "PriorityOrder")]
        getter priority_order : Array(String)?

        def initialize(
          @location_order : Array(String)? = nil,
          @priority_order : Array(String)? = nil
        )
        end
      end

      # An alternate list of prioritized locations for use with a game session queue. When this property is
      # included in a StartGameSessionPlacement request, the alternate list overrides the queue's default
      # location priorities, as defined in the queue's PriorityConfiguration setting ( LocationOrder ). The
      # override is valid for an individual placement request only. Use this property only with queues that
      # have a PriorityConfiguration setting that prioritizes LOCATION first. A priority configuration
      # override list does not override a queue's FilterConfiguration setting, if the queue has one. Filter
      # configurations are used to limit placements to a subset of the locations in a queue's destinations.
      # If the override list includes a location that's not on in the FilterConfiguration allowed list,
      # Amazon GameLift Servers won't attempt to place a game session there.

      struct PriorityConfigurationOverride
        include JSON::Serializable

        # A prioritized list of hosting locations. The list can include Amazon Web Services Regions (such as
        # us-west-2 ), local zones, and custom locations (for Anywhere fleets). Each location must be listed
        # only once. For details, see Amazon GameLift Servers service locations.

        @[JSON::Field(key: "LocationOrder")]
        getter location_order : Array(String)

        # Instructions for how to proceed if placement fails in every location on the priority override list.
        # Valid strategies include: DEFAULT_AFTER_SINGLE_PASS -- After attempting to place a new game session
        # in every location on the priority override list, try to place a game session in queue's other
        # locations. This is the default behavior. NONE -- Limit placements to locations on the priority
        # override list only.

        @[JSON::Field(key: "PlacementFallbackStrategy")]
        getter placement_fallback_strategy : String?

        def initialize(
          @location_order : Array(String),
          @placement_fallback_strategy : String? = nil
        )
        end
      end


      struct PutScalingPolicyInput
        include JSON::Serializable

        # A unique identifier for the fleet to apply this policy to. You can use either the fleet ID or ARN
        # value. The fleet cannot be in any of the following statuses: ERROR or DELETING.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # Name of the Amazon GameLift Servers-defined metric that is used to trigger a scaling adjustment. For
        # detailed descriptions of fleet metrics, see Monitor Amazon GameLift Servers with Amazon CloudWatch .
        # ActivatingGameSessions -- Game sessions in the process of being created. ActiveGameSessions -- Game
        # sessions that are currently running. ActiveInstances -- Fleet instances that are currently running
        # at least one game session. AvailableGameSessions -- Additional game sessions that fleet could host
        # simultaneously, given current capacity. AvailablePlayerSessions -- Empty player slots in currently
        # active game sessions. This includes game sessions that are not currently accepting players. Reserved
        # player slots are not included. CurrentPlayerSessions -- Player slots in active game sessions that
        # are being used by a player or are reserved for a player. IdleInstances -- Active instances that are
        # currently hosting zero game sessions. PercentAvailableGameSessions -- Unused percentage of the total
        # number of game sessions that a fleet could host simultaneously, given current capacity. Use this
        # metric for a target-based scaling policy. PercentIdleInstances -- Percentage of the total number of
        # active instances that are hosting zero game sessions. QueueDepth -- Pending game session placement
        # requests, in any queue, where the current fleet is the top-priority destination. WaitTime -- Current
        # wait time for pending game session placement requests, in any queue, where the current fleet is the
        # top-priority destination.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # A descriptive label that is associated with a fleet's scaling policy. Policy names do not need to be
        # unique. A fleet can have only one scaling policy with the same name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Comparison operator to use when measuring the metric against the threshold value.

        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String?

        # Length of time (in minutes) the metric must be at or beyond the threshold before a scaling event is
        # triggered.

        @[JSON::Field(key: "EvaluationPeriods")]
        getter evaluation_periods : Int32?

        # The type of scaling policy to create. For a target-based policy, set the parameter MetricName to
        # 'PercentAvailableGameSessions' and specify a TargetConfiguration . For a rule-based policy set the
        # following parameters: MetricName , ComparisonOperator , Threshold , EvaluationPeriods ,
        # ScalingAdjustmentType , and ScalingAdjustment .

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        # Amount of adjustment to make, based on the scaling adjustment type.

        @[JSON::Field(key: "ScalingAdjustment")]
        getter scaling_adjustment : Int32?

        # The type of adjustment to make to a fleet's instance count: ChangeInCapacity -- add (or subtract)
        # the scaling adjustment value from the current instance count. Positive values scale up while
        # negative values scale down. ExactCapacity -- set the instance count to the scaling adjustment value.
        # PercentChangeInCapacity -- increase or reduce the current instance count by the scaling adjustment,
        # read as a percentage. Positive values scale up while negative values scale down; for example, a
        # value of "-10" scales the fleet down by 10%.

        @[JSON::Field(key: "ScalingAdjustmentType")]
        getter scaling_adjustment_type : String?

        # An object that contains settings for a target-based scaling policy.

        @[JSON::Field(key: "TargetConfiguration")]
        getter target_configuration : Types::TargetConfiguration?

        # Metric value used to trigger a scaling event.

        @[JSON::Field(key: "Threshold")]
        getter threshold : Float64?

        def initialize(
          @fleet_id : String,
          @metric_name : String,
          @name : String,
          @comparison_operator : String? = nil,
          @evaluation_periods : Int32? = nil,
          @policy_type : String? = nil,
          @scaling_adjustment : Int32? = nil,
          @scaling_adjustment_type : String? = nil,
          @target_configuration : Types::TargetConfiguration? = nil,
          @threshold : Float64? = nil
        )
        end
      end


      struct PutScalingPolicyOutput
        include JSON::Serializable

        # A descriptive label that is associated with a fleet's scaling policy. Policy names do not need to be
        # unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end


      struct RegisterComputeInput
        include JSON::Serializable

        # A descriptive label for the compute resource.

        @[JSON::Field(key: "ComputeName")]
        getter compute_name : String

        # A unique identifier for the fleet to register the compute to. You can use either the fleet ID or ARN
        # value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The path to a TLS certificate on your compute resource. Amazon GameLift Servers doesn't validate the
        # path and certificate.

        @[JSON::Field(key: "CertificatePath")]
        getter certificate_path : String?

        # The DNS name of the compute resource. Amazon GameLift Servers requires either a DNS name or IP
        # address.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # The IP address of the compute resource. Amazon GameLift Servers requires either a DNS name or IP
        # address. When registering an Anywhere fleet, an IP address is required.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The name of a custom location to associate with the compute resource being registered. This
        # parameter is required when registering a compute for an Anywhere fleet.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @compute_name : String,
          @fleet_id : String,
          @certificate_path : String? = nil,
          @dns_name : String? = nil,
          @ip_address : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct RegisterComputeOutput
        include JSON::Serializable

        # The details of the compute resource you registered.

        @[JSON::Field(key: "Compute")]
        getter compute : Types::Compute?

        def initialize(
          @compute : Types::Compute? = nil
        )
        end
      end


      struct RegisterGameServerInput
        include JSON::Serializable

        # A unique identifier for the game server group where the game server is running.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # A custom string that uniquely identifies the game server to register. Game server IDs are
        # developer-defined and must be unique across all game server groups in your Amazon Web Services
        # account.

        @[JSON::Field(key: "GameServerId")]
        getter game_server_id : String

        # The unique identifier for the instance where the game server is running. This ID is available in the
        # instance metadata. EC2 instance IDs use a 17-character format, for example: i-1234567890abcdef0 .

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # Information that is needed to make inbound client connections to the game server. This might include
        # the IP address and port, DNS name, and other information.

        @[JSON::Field(key: "ConnectionInfo")]
        getter connection_info : String?

        # A set of custom game server properties, formatted as a single string value. This data is passed to a
        # game client or service when it requests information on game servers.

        @[JSON::Field(key: "GameServerData")]
        getter game_server_data : String?

        def initialize(
          @game_server_group_name : String,
          @game_server_id : String,
          @instance_id : String,
          @connection_info : String? = nil,
          @game_server_data : String? = nil
        )
        end
      end


      struct RegisterGameServerOutput
        include JSON::Serializable

        # Object that describes the newly registered game server.

        @[JSON::Field(key: "GameServer")]
        getter game_server : Types::GameServer?

        def initialize(
          @game_server : Types::GameServer? = nil
        )
        end
      end


      struct RequestUploadCredentialsInput
        include JSON::Serializable

        # A unique identifier for the build to get credentials for. You can use either the build ID or ARN
        # value.

        @[JSON::Field(key: "BuildId")]
        getter build_id : String

        def initialize(
          @build_id : String
        )
        end
      end


      struct RequestUploadCredentialsOutput
        include JSON::Serializable

        # Amazon S3 path and key, identifying where the game build files are stored.

        @[JSON::Field(key: "StorageLocation")]
        getter storage_location : Types::S3Location?

        # Amazon Web Services credentials required when uploading a game build to the storage location. These
        # credentials have a limited lifespan and are valid only for the build they were issued for.

        @[JSON::Field(key: "UploadCredentials")]
        getter upload_credentials : Types::AwsCredentials?

        def initialize(
          @storage_location : Types::S3Location? = nil,
          @upload_credentials : Types::AwsCredentials? = nil
        )
        end
      end


      struct ResolveAliasInput
        include JSON::Serializable

        # The unique identifier of the alias that you want to retrieve a fleet ID for. You can use either the
        # alias ID or ARN value.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String

        def initialize(
          @alias_id : String
        )
        end
      end


      struct ResolveAliasOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) associated with the GameLift fleet resource that this alias points
        # to.

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # The fleet identifier that the alias is pointing to.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil
        )
        end
      end

      # A policy that puts limits on the number of game sessions that a player can create within a specified
      # span of time. With this policy, you can control players' ability to consume available resources. The
      # policy is evaluated when a player tries to create a new game session. On receiving a
      # CreateGameSession request, Amazon GameLift Servers checks that the player (identified by CreatorId )
      # has created fewer than game session limit in the specified time period.

      struct ResourceCreationLimitPolicy
        include JSON::Serializable

        # A policy that puts limits on the number of game sessions that a player can create within a specified
        # span of time. With this policy, you can control players' ability to consume available resources. The
        # policy is evaluated when a player tries to create a new game session. On receiving a
        # CreateGameSession request, Amazon GameLift Servers checks that the player (identified by CreatorId )
        # has created fewer than game session limit in the specified time period.

        @[JSON::Field(key: "NewGameSessionsPerCreator")]
        getter new_game_sessions_per_creator : Int32?

        # The time span used in evaluating the resource creation limit policy.

        @[JSON::Field(key: "PolicyPeriodInMinutes")]
        getter policy_period_in_minutes : Int32?

        def initialize(
          @new_game_sessions_per_creator : Int32? = nil,
          @policy_period_in_minutes : Int32? = nil
        )
        end
      end


      struct ResumeGameServerGroupInput
        include JSON::Serializable

        # A unique identifier for the game server group. Use either the name or ARN value.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # The activity to resume for this game server group.

        @[JSON::Field(key: "ResumeActions")]
        getter resume_actions : Array(String)

        def initialize(
          @game_server_group_name : String,
          @resume_actions : Array(String)
        )
        end
      end


      struct ResumeGameServerGroupOutput
        include JSON::Serializable

        # An object that describes the game server group resource, with the SuspendedActions property updated
        # to reflect the resumed activity.

        @[JSON::Field(key: "GameServerGroup")]
        getter game_server_group : Types::GameServerGroup?

        def initialize(
          @game_server_group : Types::GameServerGroup? = nil
        )
        end
      end

      # The routing configuration for a fleet alias. Related actions All APIs by task

      struct RoutingStrategy
        include JSON::Serializable

        # A unique identifier for the fleet that the alias points to. This value is the fleet ID, not the
        # fleet ARN.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The message text to be used with a terminal routing strategy.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The type of routing strategy for the alias. Possible routing types include the following: SIMPLE -
        # The alias resolves to one specific fleet. Use this type when routing to active fleets. TERMINAL -
        # The alias does not resolve to a fleet but instead can be used to display a message to the user. A
        # terminal alias throws a TerminalRoutingStrategyException with the message embedded.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @fleet_id : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A set of instructions that define the set of server processes to run on computes in a fleet. Server
      # processes run either an executable in a custom game build or a Amazon GameLift Servers Realtime
      # script. Amazon GameLift Servers launches the processes, manages their life cycle, and replaces them
      # as needed. Computes check regularly for an updated runtime configuration. An Amazon GameLift Servers
      # instance is limited to 50 processes running concurrently. To calculate the total number of processes
      # defined in a runtime configuration, add the values of the ConcurrentExecutions parameter for each
      # server process. Learn more about Running Multiple Processes on a Fleet .

      struct RuntimeConfiguration
        include JSON::Serializable

        # The maximum amount of time (in seconds) allowed to launch a new game session and have it report
        # ready to host players. During this time, the game session is in status ACTIVATING . If the game
        # session does not become active before the timeout, it is ended and the game session status is
        # changed to TERMINATED .

        @[JSON::Field(key: "GameSessionActivationTimeoutSeconds")]
        getter game_session_activation_timeout_seconds : Int32?

        # The number of game sessions in status ACTIVATING to allow on an instance or compute. This setting
        # limits the instance resources that can be used for new game activations at any one time.

        @[JSON::Field(key: "MaxConcurrentGameSessionActivations")]
        getter max_concurrent_game_session_activations : Int32?

        # A collection of server process configurations that identify what server processes to run on fleet
        # computes.

        @[JSON::Field(key: "ServerProcesses")]
        getter server_processes : Array(Types::ServerProcess)?

        def initialize(
          @game_session_activation_timeout_seconds : Int32? = nil,
          @max_concurrent_game_session_activations : Int32? = nil,
          @server_processes : Array(Types::ServerProcess)? = nil
        )
        end
      end

      # The location in Amazon S3 where build or script files are stored for access by Amazon GameLift
      # Servers.

      struct S3Location
        include JSON::Serializable

        # An Amazon S3 bucket identifier. Thename of the S3 bucket. Amazon GameLift Servers doesn't support
        # uploading from Amazon S3 buckets with names that contain a dot (.).

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The name of the zip file that contains the build files or script files.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The version of the file, if object versioning is turned on for the bucket. Amazon GameLift Servers
        # uses this information when retrieving files from an S3 bucket that you own. Use this parameter to
        # specify a specific version of the file. If not set, the latest version of the file is retrieved.

        @[JSON::Field(key: "ObjectVersion")]
        getter object_version : String?

        # The Amazon Resource Name ( ARN ) for an IAM role that allows Amazon GameLift Servers to access the
        # S3 bucket.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil,
          @object_version : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Rule that controls how a fleet is scaled. Scaling policies are uniquely identified by the
      # combination of name and fleet ID.

      struct ScalingPolicy
        include JSON::Serializable

        # Comparison operator to use when measuring a metric against the threshold value.

        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String?

        # Length of time (in minutes) the metric must be at or beyond the threshold before a scaling event is
        # triggered.

        @[JSON::Field(key: "EvaluationPeriods")]
        getter evaluation_periods : Int32?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that is associated with this scaling policy.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The fleet location.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # Name of the Amazon GameLift Servers-defined metric that is used to trigger a scaling adjustment. For
        # detailed descriptions of fleet metrics, see Monitor Amazon GameLift Servers with Amazon CloudWatch .
        # ActivatingGameSessions -- Game sessions in the process of being created. ActiveGameSessions -- Game
        # sessions that are currently running. ActiveInstances -- Fleet instances that are currently running
        # at least one game session. AvailableGameSessions -- Additional game sessions that fleet could host
        # simultaneously, given current capacity. AvailablePlayerSessions -- Empty player slots in currently
        # active game sessions. This includes game sessions that are not currently accepting players. Reserved
        # player slots are not included. CurrentPlayerSessions -- Player slots in active game sessions that
        # are being used by a player or are reserved for a player. IdleInstances -- Active instances that are
        # currently hosting zero game sessions. PercentAvailableGameSessions -- Unused percentage of the total
        # number of game sessions that a fleet could host simultaneously, given current capacity. Use this
        # metric for a target-based scaling policy. PercentIdleInstances -- Percentage of the total number of
        # active instances that are hosting zero game sessions. QueueDepth -- Pending game session placement
        # requests, in any queue, where the current fleet is the top-priority destination. WaitTime -- Current
        # wait time for pending game session placement requests, in any queue, where the current fleet is the
        # top-priority destination.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # A descriptive label that is associated with a fleet's scaling policy. Policy names do not need to be
        # unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of scaling policy to create. For a target-based policy, set the parameter MetricName to
        # 'PercentAvailableGameSessions' and specify a TargetConfiguration . For a rule-based policy set the
        # following parameters: MetricName , ComparisonOperator , Threshold , EvaluationPeriods ,
        # ScalingAdjustmentType , and ScalingAdjustment .

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        # Amount of adjustment to make, based on the scaling adjustment type.

        @[JSON::Field(key: "ScalingAdjustment")]
        getter scaling_adjustment : Int32?

        # The type of adjustment to make to a fleet's instance count. ChangeInCapacity -- add (or subtract)
        # the scaling adjustment value from the current instance count. Positive values scale up while
        # negative values scale down. ExactCapacity -- set the instance count to the scaling adjustment value.
        # PercentChangeInCapacity -- increase or reduce the current instance count by the scaling adjustment,
        # read as a percentage. Positive values scale up while negative values scale down.

        @[JSON::Field(key: "ScalingAdjustmentType")]
        getter scaling_adjustment_type : String?

        # Current status of the scaling policy. The scaling policy can be in force only when in an ACTIVE
        # status. Scaling policies can be suspended for individual fleets. If the policy is suspended for a
        # fleet, the policy status does not change. ACTIVE -- The scaling policy can be used for auto-scaling
        # a fleet. UPDATE_REQUESTED -- A request to update the scaling policy has been received. UPDATING -- A
        # change is being made to the scaling policy. DELETE_REQUESTED -- A request to delete the scaling
        # policy has been received. DELETING -- The scaling policy is being deleted. DELETED -- The scaling
        # policy has been deleted. ERROR -- An error occurred in creating the policy. It should be removed and
        # recreated.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # An object that contains settings for a target-based scaling policy.

        @[JSON::Field(key: "TargetConfiguration")]
        getter target_configuration : Types::TargetConfiguration?

        # Metric value used to trigger a scaling event.

        @[JSON::Field(key: "Threshold")]
        getter threshold : Float64?

        # The current status of the fleet's scaling policies in a requested fleet location. The status
        # PENDING_UPDATE indicates that an update was requested for the fleet but has not yet been completed
        # for the location.

        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : String?

        def initialize(
          @comparison_operator : String? = nil,
          @evaluation_periods : Int32? = nil,
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @location : String? = nil,
          @metric_name : String? = nil,
          @name : String? = nil,
          @policy_type : String? = nil,
          @scaling_adjustment : Int32? = nil,
          @scaling_adjustment_type : String? = nil,
          @status : String? = nil,
          @target_configuration : Types::TargetConfiguration? = nil,
          @threshold : Float64? = nil,
          @update_status : String? = nil
        )
        end
      end

      # Properties describing a Realtime script. Related actions All APIs by task

      struct Script
        include JSON::Serializable

        # A time stamp indicating when this data object was created. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A descriptive label that is associated with a script. Script names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers script resource and
        # uniquely identifies it. ARNs are unique across all Regions. In a GameLift script ARN, the resource
        # ID matches the ScriptId value.

        @[JSON::Field(key: "ScriptArn")]
        getter script_arn : String?

        # A unique identifier for the Realtime script

        @[JSON::Field(key: "ScriptId")]
        getter script_id : String?

        # The file size of the uploaded Realtime script, expressed in bytes. When files are uploaded from an
        # S3 location, this value remains at "0".

        @[JSON::Field(key: "SizeOnDisk")]
        getter size_on_disk : Int64?

        # The location of the Amazon S3 bucket where a zipped file containing your Realtime scripts is stored.
        # The storage location must specify the Amazon S3 bucket name, the zip file name (the "key"), and a
        # role ARN that allows Amazon GameLift Servers to access the Amazon S3 storage location. The S3 bucket
        # must be in the same Region where you want to create a new script. By default, Amazon GameLift
        # Servers uploads the latest version of the zip file; if you have S3 object versioning turned on, you
        # can use the ObjectVersion parameter to specify an earlier version.

        @[JSON::Field(key: "StorageLocation")]
        getter storage_location : Types::S3Location?

        # Version information that is associated with a build or script. Version strings do not need to be
        # unique.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @creation_time : Time? = nil,
          @name : String? = nil,
          @script_arn : String? = nil,
          @script_id : String? = nil,
          @size_on_disk : Int64? = nil,
          @storage_location : Types::S3Location? = nil,
          @version : String? = nil
        )
        end
      end


      struct SearchGameSessionsInput
        include JSON::Serializable

        # A unique identifier for the alias associated with the fleet to search for active game sessions. You
        # can use either the alias ID or ARN value. Each request must reference either a fleet ID or alias ID,
        # but not both.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String?

        # String containing the search criteria for the session search. If no filter expression is included,
        # the request returns results for all game sessions in the fleet that are in ACTIVE status. A filter
        # expression can contain one or multiple conditions. Each condition consists of the following: Operand
        # -- Name of a game session attribute. Valid values are gameSessionName , gameSessionId ,
        # gameSessionProperties , maximumSessions , creationTimeMillis , playerSessionCount ,
        # hasAvailablePlayerSessions . Comparator -- Valid comparators are: = , &lt;&gt; , &lt; , &gt; , &lt;=
        # , &gt;= . Value -- Value to be searched for. Values may be numbers, boolean values (true/false) or
        # strings depending on the operand. String values are case sensitive and must be enclosed in single
        # quotes. Special characters must be escaped. Boolean and string values can only be used with the
        # comparators = and &lt;&gt; . For example, the following filter expression searches on
        # gameSessionName : " FilterExpression": "gameSessionName = 'Matt\\'s Awesome Game 1'" . To chain
        # multiple conditions in a single expression, use the logical keywords AND , OR , and NOT and
        # parentheses as needed. For example: x AND y AND NOT z , NOT (x OR y) . Session search evaluates
        # conditions from left to right using the following precedence rules: = , &lt;&gt; , &lt; , &gt; ,
        # &lt;= , &gt;= Parentheses NOT AND OR For example, this filter expression retrieves game sessions
        # hosting at least ten players that have an open player slot: "maximumSessions&gt;=10 AND
        # hasAvailablePlayerSessions=true" .

        @[JSON::Field(key: "FilterExpression")]
        getter filter_expression : String?

        # A unique identifier for the fleet to search for active game sessions. You can use either the fleet
        # ID or ARN value. Each request must reference either a fleet ID or alias ID, but not both.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages. The maximum number of results returned is 20, even if this value is not set or
        # is set higher than 20.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A fleet location to search for game sessions. You can specify a fleet's home Region or a remote
        # location. Use the Amazon Web Services Region code format, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # A token that indicates the start of the next sequential page of results. Use the token that is
        # returned with a previous call to this operation. To start at the beginning of the result set, do not
        # specify a value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Instructions on how to sort the search results. If no sort expression is included, the request
        # returns results in random order. A sort expression consists of the following elements: Operand --
        # Name of a game session attribute. Valid values are gameSessionName , gameSessionId ,
        # gameSessionProperties , maximumSessions , creationTimeMillis , playerSessionCount ,
        # hasAvailablePlayerSessions . Order -- Valid sort orders are ASC (ascending) and DESC (descending).
        # For example, this sort expression returns the oldest active sessions first: "SortExpression":
        # "creationTimeMillis ASC" . Results with a null value for the sort operand are returned at the end of
        # the list.

        @[JSON::Field(key: "SortExpression")]
        getter sort_expression : String?

        def initialize(
          @alias_id : String? = nil,
          @filter_expression : String? = nil,
          @fleet_id : String? = nil,
          @limit : Int32? = nil,
          @location : String? = nil,
          @next_token : String? = nil,
          @sort_expression : String? = nil
        )
        end
      end


      struct SearchGameSessionsOutput
        include JSON::Serializable

        # A collection of objects containing game session properties for each session that matches the
        # request.

        @[JSON::Field(key: "GameSessions")]
        getter game_sessions : Array(Types::GameSession)?

        # A token that indicates where to resume retrieving results on the next call to this operation. If no
        # token is returned, these results represent the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @game_sessions : Array(Types::GameSession)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A set of instructions for launching server processes on fleet computes. Server processes run either
      # an executable in a custom game build or a Amazon GameLift Servers Realtime script. Server process
      # configurations are part of a fleet's runtime configuration.

      struct ServerProcess
        include JSON::Serializable

        # The number of server processes using this configuration that run concurrently on each instance or
        # compute.

        @[JSON::Field(key: "ConcurrentExecutions")]
        getter concurrent_executions : Int32

        # The location of a game build executable or Realtime script. Game builds and Realtime scripts are
        # installed on instances at the root: Windows (custom game builds only): C:\game . Example: "
        # C:\game\MyGame\server.exe " Linux: /local/game . Examples: " /local/game/MyGame/server.exe " or "
        # /local/game/MyRealtimeScript.js " Amazon GameLift Servers doesn't support the use of setup scripts
        # that launch the game executable. For custom game builds, this parameter must indicate the executable
        # that calls the server SDK operations initSDK() and ProcessReady() .

        @[JSON::Field(key: "LaunchPath")]
        getter launch_path : String

        # An optional list of parameters to pass to the server executable or Realtime script on launch.

        @[JSON::Field(key: "Parameters")]
        getter parameters : String?

        def initialize(
          @concurrent_executions : Int32,
          @launch_path : String,
          @parameters : String? = nil
        )
        end
      end


      struct StartFleetActionsInput
        include JSON::Serializable

        # List of actions to restart on the fleet.

        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)

        # A unique identifier for the fleet to restart actions on. You can use either the fleet ID or ARN
        # value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The fleet location to restart fleet actions for. Specify a location in the form of an Amazon Web
        # Services Region code, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @actions : Array(String),
          @fleet_id : String,
          @location : String? = nil
        )
        end
      end


      struct StartFleetActionsOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet to restart actions on.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil
        )
        end
      end


      struct StartGameSessionPlacementInput
        include JSON::Serializable

        # Name of the queue to use to place the new game session. You can use either the queue name or ARN
        # value.

        @[JSON::Field(key: "GameSessionQueueName")]
        getter game_session_queue_name : String

        # The maximum number of players that can be connected simultaneously to the game session.

        @[JSON::Field(key: "MaximumPlayerSessionCount")]
        getter maximum_player_session_count : Int32

        # A unique identifier to assign to the new game session placement. This value is developer-defined.
        # The value must be unique across all Regions and cannot be reused.

        @[JSON::Field(key: "PlacementId")]
        getter placement_id : String

        # Set of information on each player to create a player session for.

        @[JSON::Field(key: "DesiredPlayerSessions")]
        getter desired_player_sessions : Array(Types::DesiredPlayerSession)?

        # A set of key-value pairs that can store custom data in a game session. For example: {"Key":
        # "difficulty", "Value": "novice"} .

        @[JSON::Field(key: "GameProperties")]
        getter game_properties : Array(Types::GameProperty)?

        # A set of custom game session properties, formatted as a single string value. This data is passed to
        # a game server process with a request to start a new game session. For more information, see Start a
        # game session .

        @[JSON::Field(key: "GameSessionData")]
        getter game_session_data : String?

        # A descriptive label that is associated with a game session. Session names do not need to be unique.

        @[JSON::Field(key: "GameSessionName")]
        getter game_session_name : String?

        # A set of values, expressed in milliseconds, that indicates the amount of latency that a player
        # experiences when connected to Amazon Web Services Regions. This information is used to try to place
        # the new game session where it can offer the best possible gameplay experience for the players.

        @[JSON::Field(key: "PlayerLatencies")]
        getter player_latencies : Array(Types::PlayerLatency)?

        # A prioritized list of locations to use for the game session placement and instructions on how to use
        # it. This list overrides a queue's prioritized location list for this game session placement request
        # only. You can include Amazon Web Services Regions, local zones, and custom locations (for Anywhere
        # fleets). You can choose to limit placements to locations on the override list only, or you can
        # prioritize locations on the override list first and then fall back to the queue's other locations if
        # needed. Choose a fallback strategy to use in the event that Amazon GameLift Servers fails to place a
        # game session in any of the locations on the priority override list.

        @[JSON::Field(key: "PriorityConfigurationOverride")]
        getter priority_configuration_override : Types::PriorityConfigurationOverride?

        def initialize(
          @game_session_queue_name : String,
          @maximum_player_session_count : Int32,
          @placement_id : String,
          @desired_player_sessions : Array(Types::DesiredPlayerSession)? = nil,
          @game_properties : Array(Types::GameProperty)? = nil,
          @game_session_data : String? = nil,
          @game_session_name : String? = nil,
          @player_latencies : Array(Types::PlayerLatency)? = nil,
          @priority_configuration_override : Types::PriorityConfigurationOverride? = nil
        )
        end
      end


      struct StartGameSessionPlacementOutput
        include JSON::Serializable

        # Object that describes the newly created game session placement. This object includes all the
        # information provided in the request, as well as start/end time stamps and placement status.

        @[JSON::Field(key: "GameSessionPlacement")]
        getter game_session_placement : Types::GameSessionPlacement?

        def initialize(
          @game_session_placement : Types::GameSessionPlacement? = nil
        )
        end
      end


      struct StartMatchBackfillInput
        include JSON::Serializable

        # Name of the matchmaker to use for this request. You can use either the configuration name or ARN
        # value. The ARN of the matchmaker that was used with the original game session is listed in the
        # GameSession object, MatchmakerData property.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String

        # Match information on all players that are currently assigned to the game session. This information
        # is used by the matchmaker to find new players and add them to the existing game. You can include up
        # to 199 Players in a StartMatchBackfill request. PlayerID, PlayerAttributes, Team -- This information
        # is maintained in the GameSession object, MatchmakerData property, for all players who are currently
        # assigned to the game session. The matchmaker data is in JSON syntax, formatted as a string. For more
        # details, see Match Data . The backfill request must specify the team membership for every player. Do
        # not specify team if you are not using backfill. LatencyInMs -- If the matchmaker uses player
        # latency, include a latency value, in milliseconds, for the Region that the game session is currently
        # in. Do not include latency values for any other Region.

        @[JSON::Field(key: "Players")]
        getter players : Array(Types::Player)

        # A unique identifier for the game session. Use the game session ID. When using FlexMatch as a
        # standalone matchmaking solution, this parameter is not needed.

        @[JSON::Field(key: "GameSessionArn")]
        getter game_session_arn : String?

        # A unique identifier for a matchmaking ticket. If no ticket ID is specified here, Amazon GameLift
        # Servers will generate one in the form of a UUID. Use this identifier to track the match backfill
        # ticket status and retrieve match results.

        @[JSON::Field(key: "TicketId")]
        getter ticket_id : String?

        def initialize(
          @configuration_name : String,
          @players : Array(Types::Player),
          @game_session_arn : String? = nil,
          @ticket_id : String? = nil
        )
        end
      end


      struct StartMatchBackfillOutput
        include JSON::Serializable

        # Ticket representing the backfill matchmaking request. This object includes the information in the
        # request, ticket status, and match results as generated during the matchmaking process.

        @[JSON::Field(key: "MatchmakingTicket")]
        getter matchmaking_ticket : Types::MatchmakingTicket?

        def initialize(
          @matchmaking_ticket : Types::MatchmakingTicket? = nil
        )
        end
      end


      struct StartMatchmakingInput
        include JSON::Serializable

        # Name of the matchmaking configuration to use for this request. Matchmaking configurations must exist
        # in the same Region as this request. You can use either the configuration name or ARN value.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String

        # Information on each player to be matched. This information must include a player ID, and may contain
        # player attributes and latency data to be used in the matchmaking process. After a successful match,
        # Player objects contain the name of the team the player is assigned to. You can include up to 10
        # Players in a StartMatchmaking request.

        @[JSON::Field(key: "Players")]
        getter players : Array(Types::Player)

        # A unique identifier for a matchmaking ticket. If no ticket ID is specified here, Amazon GameLift
        # Servers will generate one in the form of a UUID. Use this identifier to track the matchmaking ticket
        # status and retrieve match results.

        @[JSON::Field(key: "TicketId")]
        getter ticket_id : String?

        def initialize(
          @configuration_name : String,
          @players : Array(Types::Player),
          @ticket_id : String? = nil
        )
        end
      end


      struct StartMatchmakingOutput
        include JSON::Serializable

        # Ticket representing the matchmaking request. This object include the information included in the
        # request, ticket status, and match results as generated during the matchmaking process.

        @[JSON::Field(key: "MatchmakingTicket")]
        getter matchmaking_ticket : Types::MatchmakingTicket?

        def initialize(
          @matchmaking_ticket : Types::MatchmakingTicket? = nil
        )
        end
      end


      struct StopFleetActionsInput
        include JSON::Serializable

        # List of actions to suspend on the fleet.

        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)

        # A unique identifier for the fleet to stop actions on. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The fleet location to stop fleet actions for. Specify a location in the form of an Amazon Web
        # Services Region code, such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @actions : Array(String),
          @fleet_id : String,
          @location : String? = nil
        )
        end
      end


      struct StopFleetActionsOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet to stop actions on.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil
        )
        end
      end


      struct StopGameSessionPlacementInput
        include JSON::Serializable

        # A unique identifier for a game session placement to stop.

        @[JSON::Field(key: "PlacementId")]
        getter placement_id : String

        def initialize(
          @placement_id : String
        )
        end
      end


      struct StopGameSessionPlacementOutput
        include JSON::Serializable

        # Object that describes the canceled game session placement, with CANCELLED status and an end time
        # stamp.

        @[JSON::Field(key: "GameSessionPlacement")]
        getter game_session_placement : Types::GameSessionPlacement?

        def initialize(
          @game_session_placement : Types::GameSessionPlacement? = nil
        )
        end
      end


      struct StopMatchmakingInput
        include JSON::Serializable

        # A unique identifier for a matchmaking ticket.

        @[JSON::Field(key: "TicketId")]
        getter ticket_id : String

        def initialize(
          @ticket_id : String
        )
        end
      end


      struct StopMatchmakingOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a support container in a container group. A support container might be in a game server
      # container group or a per-instance container group. Support containers don't run game server
      # processes. You can update a support container definition and deploy the updates to an existing
      # fleet. When creating or updating a game server container group definition, use the property
      # GameServerContainerDefinitionInput . Part of: ContainerGroupDefinition Returned by:
      # DescribeContainerGroupDefinition , ListContainerGroupDefinitions , UpdateContainerGroupDefinition

      struct SupportContainerDefinition
        include JSON::Serializable

        # The container definition identifier. Container names are unique within a container group definition.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String?

        # Indicates that the container relies on the status of other containers in the same container group
        # during its startup and shutdown sequences. A container might have dependencies on multiple
        # containers.

        @[JSON::Field(key: "DependsOn")]
        getter depends_on : Array(Types::ContainerDependency)?

        # A set of environment variables that's passed to the container on startup. See the
        # ContainerDefinition::environment parameter in the Amazon Elastic Container Service API Reference .

        @[JSON::Field(key: "EnvironmentOverride")]
        getter environment_override : Array(Types::ContainerEnvironment)?

        # Indicates whether the container is vital to the container group. If an essential container fails,
        # the entire container group restarts.

        @[JSON::Field(key: "Essential")]
        getter essential : Bool?

        # A configuration for a non-terminal health check. A support container automatically restarts if it
        # stops functioning or if it fails this health check.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : Types::ContainerHealthCheck?

        # The URI to the image that Amazon GameLift Servers deploys to a container fleet. For a more specific
        # identifier, see ResolvedImageDigest .

        @[JSON::Field(key: "ImageUri")]
        getter image_uri : String?

        # The amount of memory that Amazon GameLift Servers makes available to the container. If memory limits
        # aren't set for an individual container, the container shares the container group's total memory
        # allocation. Related data type: ContainerGroupDefinition TotalMemoryLimitMebibytes

        @[JSON::Field(key: "MemoryHardLimitMebibytes")]
        getter memory_hard_limit_mebibytes : Int32?

        # A mount point that binds a path inside the container to a file or directory on the host system and
        # lets it access the file or directory.

        @[JSON::Field(key: "MountPoints")]
        getter mount_points : Array(Types::ContainerMountPoint)?

        # A set of ports that allow access to the container from external users. Processes running in the
        # container can bind to a one of these ports. Container ports aren't directly accessed by inbound
        # traffic. Amazon GameLift Servers maps these container ports to externally accessible connection
        # ports, which are assigned as needed from the container fleet's ConnectionPortRange .

        @[JSON::Field(key: "PortConfiguration")]
        getter port_configuration : Types::ContainerPortConfiguration?

        # A unique and immutable identifier for the container image. The digest is a SHA 256 hash of the
        # container image manifest.

        @[JSON::Field(key: "ResolvedImageDigest")]
        getter resolved_image_digest : String?

        # The number of vCPU units that are reserved for the container. If no resources are reserved, the
        # container shares the total vCPU limit for the container group. Related data type:
        # ContainerGroupDefinition TotalVcpuLimit

        @[JSON::Field(key: "Vcpu")]
        getter vcpu : Float64?

        def initialize(
          @container_name : String? = nil,
          @depends_on : Array(Types::ContainerDependency)? = nil,
          @environment_override : Array(Types::ContainerEnvironment)? = nil,
          @essential : Bool? = nil,
          @health_check : Types::ContainerHealthCheck? = nil,
          @image_uri : String? = nil,
          @memory_hard_limit_mebibytes : Int32? = nil,
          @mount_points : Array(Types::ContainerMountPoint)? = nil,
          @port_configuration : Types::ContainerPortConfiguration? = nil,
          @resolved_image_digest : String? = nil,
          @vcpu : Float64? = nil
        )
        end
      end

      # Describes a support container in a container group. You can define a support container in either a
      # game server container group or a per-instance container group. Support containers don't run game
      # server processes. This definition includes container configuration, resources, and start
      # instructions. Use this data type when creating or updating a container group definition. For
      # properties of a deployed support container, see SupportContainerDefinition . Use with:
      # CreateContainerGroupDefinition , UpdateContainerGroupDefinition

      struct SupportContainerDefinitionInput
        include JSON::Serializable

        # A string that uniquely identifies the container definition within a container group.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        # The location of the container image to deploy to a container fleet. Provide an image in an Amazon
        # Elastic Container Registry public or private repository. The repository must be in the same Amazon
        # Web Services account and Amazon Web Services Region where you're creating the container group
        # definition. For limits on image size, see Amazon GameLift Servers endpoints and quotas . You can use
        # any of the following image URI formats: Image ID only: [AWS account].dkr.ecr.[AWS
        # region].amazonaws.com/[repository ID] Image ID and digest: [AWS account].dkr.ecr.[AWS
        # region].amazonaws.com/[repository ID]@[digest] Image ID and tag: [AWS account].dkr.ecr.[AWS
        # region].amazonaws.com/[repository ID]:[tag]

        @[JSON::Field(key: "ImageUri")]
        getter image_uri : String

        # Establishes dependencies between this container and the status of other containers in the same
        # container group. A container can have dependencies on multiple different containers. . You can use
        # dependencies to establish a startup/shutdown sequence across the container group. For example, you
        # might specify that ContainerB has a START dependency on ContainerA . This dependency means that
        # ContainerB can't start until after ContainerA has started. This dependency is reversed on shutdown,
        # which means that ContainerB must shut down before ContainerA can shut down.

        @[JSON::Field(key: "DependsOn")]
        getter depends_on : Array(Types::ContainerDependency)?

        # A set of environment variables to pass to the container on startup. See the
        # ContainerDefinition::environment parameter in the Amazon Elastic Container Service API Reference .

        @[JSON::Field(key: "EnvironmentOverride")]
        getter environment_override : Array(Types::ContainerEnvironment)?

        # Flags the container as vital for the container group to function properly. If an essential container
        # fails, the entire container group restarts. At least one support container in a per-instance
        # container group must be essential. When flagging a container as essential, also configure a health
        # check so that the container can signal that it's healthy.

        @[JSON::Field(key: "Essential")]
        getter essential : Bool?

        # Configuration for a non-terminal health check. A container automatically restarts if it stops
        # functioning. With a health check, you can define additional reasons to flag a container as unhealthy
        # and restart it. If an essential container fails a health check, the entire container group restarts.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : Types::ContainerHealthCheck?

        # A specified amount of memory (in MiB) to reserve for this container. If you don't specify a
        # container-specific memory limit, the container shares the container group's total memory allocation.
        # Related data type: ContainerGroupDefinition TotalMemoryLimitMebibytes

        @[JSON::Field(key: "MemoryHardLimitMebibytes")]
        getter memory_hard_limit_mebibytes : Int32?

        # A mount point that binds a path inside the container to a file or directory on the host system and
        # lets it access the file or directory.

        @[JSON::Field(key: "MountPoints")]
        getter mount_points : Array(Types::ContainerMountPoint)?

        # A set of ports that Amazon GameLift Servers can assign to processes in a container. The container
        # port configuration must have enough ports for each container process that accepts inbound traffic
        # connections. A container port configuration can have can have one or more container port ranges.
        # Each range specifies starting and ending values as well as the supported network protocol. Container
        # ports aren't directly accessed by inbound traffic. Amazon GameLift Servers maps each container port
        # to an externally accessible connection port (see the container fleet property ConnectionPortRange ).

        @[JSON::Field(key: "PortConfiguration")]
        getter port_configuration : Types::ContainerPortConfiguration?

        # The number of vCPU units to reserve for this container. The container can use more resources when
        # needed, if available. If you don't reserve CPU units for this container, it shares the container
        # group's total vCPU limit. Related data type: ContainerGroupDefinition TotalCpuLimit

        @[JSON::Field(key: "Vcpu")]
        getter vcpu : Float64?

        def initialize(
          @container_name : String,
          @image_uri : String,
          @depends_on : Array(Types::ContainerDependency)? = nil,
          @environment_override : Array(Types::ContainerEnvironment)? = nil,
          @essential : Bool? = nil,
          @health_check : Types::ContainerHealthCheck? = nil,
          @memory_hard_limit_mebibytes : Int32? = nil,
          @mount_points : Array(Types::ContainerMountPoint)? = nil,
          @port_configuration : Types::ContainerPortConfiguration? = nil,
          @vcpu : Float64? = nil
        )
        end
      end


      struct SuspendGameServerGroupInput
        include JSON::Serializable

        # A unique identifier for the game server group. Use either the name or ARN value.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # The activity to suspend for this game server group.

        @[JSON::Field(key: "SuspendActions")]
        getter suspend_actions : Array(String)

        def initialize(
          @game_server_group_name : String,
          @suspend_actions : Array(String)
        )
        end
      end


      struct SuspendGameServerGroupOutput
        include JSON::Serializable

        # An object that describes the game server group resource, with the SuspendedActions property updated
        # to reflect the suspended activity.

        @[JSON::Field(key: "GameServerGroup")]
        getter game_server_group : Types::GameServerGroup?

        def initialize(
          @game_server_group : Types::GameServerGroup? = nil
        )
        end
      end

      # A label that you can assign to a Amazon GameLift Servers resource. Learn more Tagging Amazon Web
      # Services Resources in the Amazon Web Services General Reference Amazon Web Services Tagging
      # Strategies Related actions All APIs by task

      struct Tag
        include JSON::Serializable

        # The key for a developer-defined key value pair for tagging an Amazon Web Services resource.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for a developer-defined key value pair for tagging an Amazon Web Services resource.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that uniquely identifies the Amazon GameLift Servers resource that
        # you want to assign tags to. Amazon GameLift Servers includes resource ARNs in the data object for
        # the resource. You can retrieve the ARN by calling a List or Describe operation for the resource
        # type.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of one or more tags to assign to the specified Amazon GameLift Servers resource. Tags are
        # developer-defined and structured as key-value pairs. The maximum tag limit may be lower than stated.
        # See Tagging Amazon Web Services Resources for tagging limits.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The requested tagging operation did not succeed. This may be due to invalid tag format or the
      # maximum tag limit may have been exceeded. Resolve the issue before retrying.

      struct TaggingFailedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Settings for a target-based scaling policy. A target-based policy tracks a particular fleet metric
      # specifies a target value for the metric. As player usage changes, the policy triggers Amazon
      # GameLift Servers to adjust capacity so that the metric returns to the target value. The target
      # configuration specifies settings as needed for the target based policy, including the target value.

      struct TargetConfiguration
        include JSON::Serializable

        # Desired value to use with a target-based scaling policy. The value must be relevant for whatever
        # metric the scaling policy is using. For example, in a policy using the metric
        # PercentAvailableGameSessions, the target value should be the preferred size of the fleet's buffer
        # (the percent of capacity that should be idle and ready for new game sessions).

        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        def initialize(
          @target_value : Float64
        )
        end
      end

      # Settings for a target-based scaling policy as part of a GameServerGroupAutoScalingPolicy . These
      # settings are used to create a target-based policy that tracks the Amazon GameLift Servers FleetIQ
      # metric "PercentUtilizedGameServers" and specifies a target value for the metric. As player usage
      # changes, the policy triggers to adjust the game server group capacity so that the metric returns to
      # the target value.

      struct TargetTrackingConfiguration
        include JSON::Serializable

        # Desired value to use with a game server group target-based scaling policy.

        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        def initialize(
          @target_value : Float64
        )
        end
      end

      # The service is unable to resolve the routing for a particular alias because it has a terminal
      # RoutingStrategy associated with it. The message returned in this exception is the message defined in
      # the routing strategy itself. Such requests should only be retried if the routing strategy for the
      # specified alias is modified.

      struct TerminalRoutingStrategyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct TerminateGameSessionInput
        include JSON::Serializable

        # A unique identifier for the game session to be terminated. A game session ARN has the following
        # format: arn:aws:gamelift:&lt;location&gt;::gamesession/&lt;fleet ID&gt;/&lt;custom ID string or
        # idempotency token&gt; .

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String

        # The method to use to terminate the game session. Available methods include:
        # TRIGGER_ON_PROCESS_TERMINATE – Prompts the Amazon GameLift Servers service to send an
        # OnProcessTerminate() callback to the server process and initiate the normal game session shutdown
        # sequence. The OnProcessTerminate method, which is implemented in the game server code, must include
        # a call to the server SDK action ProcessEnding() , which is how the server process signals to Amazon
        # GameLift Servers that a game session is ending. If the server process doesn't call ProcessEnding() ,
        # the game session termination won't conclude successfully. FORCE_TERMINATE – Prompts the Amazon
        # GameLift Servers service to stop the server process immediately. Amazon GameLift Servers takes
        # action (depending on the type of fleet) to shut down the server process without the normal game
        # session shutdown sequence. This method is not available for game sessions that are running on
        # Anywhere fleets unless the fleet is deployed with the Amazon GameLift Servers Agent. In this
        # scenario, a force terminate request results in an invalid or bad request exception.

        @[JSON::Field(key: "TerminationMode")]
        getter termination_mode : String

        def initialize(
          @game_session_id : String,
          @termination_mode : String
        )
        end
      end


      struct TerminateGameSessionOutput
        include JSON::Serializable


        @[JSON::Field(key: "GameSession")]
        getter game_session : Types::GameSession?

        def initialize(
          @game_session : Types::GameSession? = nil
        )
        end
      end

      # The domain name and port information for a UDP endpoint.

      struct UDPEndpoint
        include JSON::Serializable

        # The domain name of the UDP endpoint.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The port number of the UDP endpoint.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        def initialize(
          @domain : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # The client failed authentication. Clients should not retry such requests.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested operation is not supported in the Region specified.

      struct UnsupportedRegionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that uniquely identifies the Amazon GameLift Servers resource that
        # you want to remove tags from. Amazon GameLift Servers includes resource ARNs in the data object for
        # the resource. You can retrieve the ARN by calling a List or Describe operation for the resource
        # type.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of one or more tag keys to remove from the specified Amazon GameLift Servers resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAliasInput
        include JSON::Serializable

        # A unique identifier for the alias that you want to update. You can use either the alias ID or ARN
        # value.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String

        # A human-readable description of the alias.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A descriptive label that is associated with an alias. Alias names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The routing configuration, including routing type and fleet target, for the alias.

        @[JSON::Field(key: "RoutingStrategy")]
        getter routing_strategy : Types::RoutingStrategy?

        def initialize(
          @alias_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @routing_strategy : Types::RoutingStrategy? = nil
        )
        end
      end


      struct UpdateAliasOutput
        include JSON::Serializable

        # The updated alias resource.

        @[JSON::Field(key: "Alias")]
        getter alias : Types::Alias?

        def initialize(
          @alias : Types::Alias? = nil
        )
        end
      end


      struct UpdateBuildInput
        include JSON::Serializable

        # A unique identifier for the build to update. You can use either the build ID or ARN value.

        @[JSON::Field(key: "BuildId")]
        getter build_id : String

        # A descriptive label that is associated with a build. Build names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Version information that is associated with a build or script. Version strings do not need to be
        # unique.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @build_id : String,
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdateBuildOutput
        include JSON::Serializable

        # The updated build resource.

        @[JSON::Field(key: "Build")]
        getter build : Types::Build?

        def initialize(
          @build : Types::Build? = nil
        )
        end
      end


      struct UpdateContainerFleetInput
        include JSON::Serializable

        # A unique identifier for the container fleet to update. You can use either the fleet ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # Instructions for how to deploy updates to a container fleet, if the fleet update initiates a
        # deployment. The deployment configuration lets you determine how to replace fleet instances and what
        # actions to take if the deployment fails.

        @[JSON::Field(key: "DeploymentConfiguration")]
        getter deployment_configuration : Types::DeploymentConfiguration?

        # A meaningful description of the container fleet.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name or ARN value of a new game server container group definition to deploy on the fleet. If
        # you're updating the fleet to a specific version of a container group definition, use the ARN value
        # and include the version number. If you're updating the fleet to the latest version of a container
        # group definition, you can use the name value. You can't remove a fleet's game server container group
        # definition, you can only update or replace it with another definition. Update a container group
        # definition by calling UpdateContainerGroupDefinition . This operation creates a
        # ContainerGroupDefinition resource with an incremented version.

        @[JSON::Field(key: "GameServerContainerGroupDefinitionName")]
        getter game_server_container_group_definition_name : String?

        # The number of times to replicate the game server container group on each fleet instance. By default,
        # Amazon GameLift Servers calculates the maximum number of game server container groups that can fit
        # on each instance. You can remove this property value to use the calculated value, or set it
        # manually. If you set this number manually, Amazon GameLift Servers uses your value as long as it's
        # less than the calculated maximum.

        @[JSON::Field(key: "GameServerContainerGroupsPerInstance")]
        getter game_server_container_groups_per_instance : Int32?

        # A policy that limits the number of game sessions that each individual player can create on instances
        # in this fleet. The limit applies for a specified span of time.

        @[JSON::Field(key: "GameSessionCreationLimitPolicy")]
        getter game_session_creation_limit_policy : Types::GameSessionCreationLimitPolicy?

        # A revised set of port numbers to open on each fleet instance. By default, Amazon GameLift Servers
        # calculates an optimal port range based on your fleet configuration. If you previously set this
        # parameter manually, you can't reset this to use the calculated settings.

        @[JSON::Field(key: "InstanceConnectionPortRange")]
        getter instance_connection_port_range : Types::ConnectionPortRange?

        # A set of ports to add to the container fleet's inbound permissions.

        @[JSON::Field(key: "InstanceInboundPermissionAuthorizations")]
        getter instance_inbound_permission_authorizations : Array(Types::IpPermission)?

        # A set of ports to remove from the container fleet's inbound permissions.

        @[JSON::Field(key: "InstanceInboundPermissionRevocations")]
        getter instance_inbound_permission_revocations : Array(Types::IpPermission)?

        # The method for collecting container logs for the fleet.

        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The name of an Amazon Web Services CloudWatch metric group to add this fleet to.

        @[JSON::Field(key: "MetricGroups")]
        getter metric_groups : Array(String)?

        # The game session protection policy to apply to all new game sessions that are started in this fleet.
        # Game sessions that already exist are not affected.

        @[JSON::Field(key: "NewGameSessionProtectionPolicy")]
        getter new_game_session_protection_policy : String?

        # The name or ARN value of a new per-instance container group definition to deploy on the fleet. If
        # you're updating the fleet to a specific version of a container group definition, use the ARN value
        # and include the version number. If you're updating the fleet to the latest version of a container
        # group definition, you can use the name value. Update a container group definition by calling
        # UpdateContainerGroupDefinition . This operation creates a ContainerGroupDefinition resource with an
        # incremented version. To remove a fleet's per-instance container group definition, leave this
        # parameter empty and use the parameter RemoveAttributes .

        @[JSON::Field(key: "PerInstanceContainerGroupDefinitionName")]
        getter per_instance_container_group_definition_name : String?

        # If set, this update removes a fleet's per-instance container group definition. You can't remove a
        # fleet's game server container group definition.

        @[JSON::Field(key: "RemoveAttributes")]
        getter remove_attributes : Array(String)?

        def initialize(
          @fleet_id : String,
          @deployment_configuration : Types::DeploymentConfiguration? = nil,
          @description : String? = nil,
          @game_server_container_group_definition_name : String? = nil,
          @game_server_container_groups_per_instance : Int32? = nil,
          @game_session_creation_limit_policy : Types::GameSessionCreationLimitPolicy? = nil,
          @instance_connection_port_range : Types::ConnectionPortRange? = nil,
          @instance_inbound_permission_authorizations : Array(Types::IpPermission)? = nil,
          @instance_inbound_permission_revocations : Array(Types::IpPermission)? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @metric_groups : Array(String)? = nil,
          @new_game_session_protection_policy : String? = nil,
          @per_instance_container_group_definition_name : String? = nil,
          @remove_attributes : Array(String)? = nil
        )
        end
      end


      struct UpdateContainerFleetOutput
        include JSON::Serializable

        # A collection of container fleet objects for all fleets that match the request criteria.

        @[JSON::Field(key: "ContainerFleet")]
        getter container_fleet : Types::ContainerFleet?

        def initialize(
          @container_fleet : Types::ContainerFleet? = nil
        )
        end
      end


      struct UpdateContainerGroupDefinitionInput
        include JSON::Serializable

        # A descriptive identifier for the container group definition. The name value must be unique in an
        # Amazon Web Services Region.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An updated definition for the game server container in this group. Define a game server container
        # only when the container group type is GAME_SERVER . You can pass in your container definitions as a
        # JSON file.

        @[JSON::Field(key: "GameServerContainerDefinition")]
        getter game_server_container_definition : Types::GameServerContainerDefinitionInput?

        # The platform that all containers in the group use. Containers in a group must run on the same
        # operating system. Amazon Linux 2 (AL2) will reach end of support on 6/30/2025. See more details in
        # the Amazon Linux 2 FAQs . For game servers that are hosted on AL2 and use server SDK version 4.x for
        # Amazon GameLift Servers, first update the game server build to server SDK 5.x, and then deploy to
        # AL2023 instances. See Migrate to server SDK version 5.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # The container group definition version to update. The new version starts with values from the source
        # version, and then updates values included in this request.

        @[JSON::Field(key: "SourceVersionNumber")]
        getter source_version_number : Int32?

        # One or more definitions for support containers in this group. You can define a support container in
        # any type of container group. You can pass in your container definitions as a JSON file.

        @[JSON::Field(key: "SupportContainerDefinitions")]
        getter support_container_definitions : Array(Types::SupportContainerDefinitionInput)?

        # The maximum amount of memory (in MiB) to allocate to the container group. All containers in the
        # group share this memory. If you specify memory limits for an individual container, the total value
        # must be greater than any individual container's memory limit.

        @[JSON::Field(key: "TotalMemoryLimitMebibytes")]
        getter total_memory_limit_mebibytes : Int32?

        # The maximum amount of vCPU units to allocate to the container group (1 vCPU is equal to 1024 CPU
        # units). All containers in the group share this memory. If you specify vCPU limits for individual
        # containers, the total value must be equal to or greater than the sum of the CPU limits for all
        # containers in the group.

        @[JSON::Field(key: "TotalVcpuLimit")]
        getter total_vcpu_limit : Float64?

        # A description for this update to the container group definition.

        @[JSON::Field(key: "VersionDescription")]
        getter version_description : String?

        def initialize(
          @name : String,
          @game_server_container_definition : Types::GameServerContainerDefinitionInput? = nil,
          @operating_system : String? = nil,
          @source_version_number : Int32? = nil,
          @support_container_definitions : Array(Types::SupportContainerDefinitionInput)? = nil,
          @total_memory_limit_mebibytes : Int32? = nil,
          @total_vcpu_limit : Float64? = nil,
          @version_description : String? = nil
        )
        end
      end


      struct UpdateContainerGroupDefinitionOutput
        include JSON::Serializable

        # The properties of the updated container group definition version.

        @[JSON::Field(key: "ContainerGroupDefinition")]
        getter container_group_definition : Types::ContainerGroupDefinition?

        def initialize(
          @container_group_definition : Types::ContainerGroupDefinition? = nil
        )
        end
      end


      struct UpdateFleetAttributesInput
        include JSON::Serializable

        # A unique identifier for the fleet to update attribute metadata for. You can use either the fleet ID
        # or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # Amazon GameLift Servers Anywhere configuration options.

        @[JSON::Field(key: "AnywhereConfiguration")]
        getter anywhere_configuration : Types::AnywhereConfiguration?

        # A human-readable description of a fleet.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of a metric group to add this fleet to. Use a metric group in Amazon CloudWatch to
        # aggregate the metrics from multiple fleets. Provide an existing metric group name, or create a new
        # metric group by providing a new name. A fleet can only be in one metric group at a time.

        @[JSON::Field(key: "MetricGroups")]
        getter metric_groups : Array(String)?

        # A descriptive label that is associated with a fleet. Fleet names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The game session protection policy to apply to all new game sessions created in this fleet. Game
        # sessions that already exist are not affected. You can set protection for individual game sessions
        # using UpdateGameSession . NoProtection -- The game session can be terminated during a scale-down
        # event. FullProtection -- If the game session is in an ACTIVE status, it cannot be terminated during
        # a scale-down event.

        @[JSON::Field(key: "NewGameSessionProtectionPolicy")]
        getter new_game_session_protection_policy : String?

        # Policy settings that limit the number of game sessions an individual player can create over a span
        # of time.

        @[JSON::Field(key: "ResourceCreationLimitPolicy")]
        getter resource_creation_limit_policy : Types::ResourceCreationLimitPolicy?

        def initialize(
          @fleet_id : String,
          @anywhere_configuration : Types::AnywhereConfiguration? = nil,
          @description : String? = nil,
          @metric_groups : Array(String)? = nil,
          @name : String? = nil,
          @new_game_session_protection_policy : String? = nil,
          @resource_creation_limit_policy : Types::ResourceCreationLimitPolicy? = nil
        )
        end
      end


      struct UpdateFleetAttributesOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that was updated.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil
        )
        end
      end


      struct UpdateFleetCapacityInput
        include JSON::Serializable

        # A unique identifier for the fleet to update capacity settings for. You can use either the fleet ID
        # or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # The number of Amazon EC2 instances you want to maintain in the specified fleet location. This value
        # must fall between the minimum and maximum size limits. Changes in desired instance value can take up
        # to 1 minute to be reflected when viewing the fleet's capacity settings.

        @[JSON::Field(key: "DesiredInstances")]
        getter desired_instances : Int32?

        # The name of a remote location to update fleet capacity settings for, in the form of an Amazon Web
        # Services Region code such as us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The maximum number of instances that are allowed in the specified fleet location. If this parameter
        # is not set, the default is 1.

        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32?

        # The minimum number of instances that are allowed in the specified fleet location. If this parameter
        # is not set, the default is 0.

        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32?

        def initialize(
          @fleet_id : String,
          @desired_instances : Int32? = nil,
          @location : String? = nil,
          @max_size : Int32? = nil,
          @min_size : Int32? = nil
        )
        end
      end


      struct UpdateFleetCapacityOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that was updated.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # The remote location being updated, expressed as an Amazon Web Services Region code, such as
        # us-west-2 .

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct UpdateFleetPortSettingsInput
        include JSON::Serializable

        # A unique identifier for the fleet to update port settings for. You can use either the fleet ID or
        # ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # A collection of port settings to be added to the fleet resource.

        @[JSON::Field(key: "InboundPermissionAuthorizations")]
        getter inbound_permission_authorizations : Array(Types::IpPermission)?

        # A collection of port settings to be removed from the fleet resource.

        @[JSON::Field(key: "InboundPermissionRevocations")]
        getter inbound_permission_revocations : Array(Types::IpPermission)?

        def initialize(
          @fleet_id : String,
          @inbound_permission_authorizations : Array(Types::IpPermission)? = nil,
          @inbound_permission_revocations : Array(Types::IpPermission)? = nil
        )
        end
      end


      struct UpdateFleetPortSettingsOutput
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers fleet resource and
        # uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912 .

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet that was updated.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil
        )
        end
      end


      struct UpdateGameServerGroupInput
        include JSON::Serializable

        # A unique identifier for the game server group. Use either the name or ARN value.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # Indicates how Amazon GameLift Servers FleetIQ balances the use of Spot Instances and On-Demand
        # Instances in the game server group. Method options include the following: SPOT_ONLY - Only Spot
        # Instances are used in the game server group. If Spot Instances are unavailable or not viable for
        # game hosting, the game server group provides no hosting capacity until Spot Instances can again be
        # used. Until then, no new instances are started, and the existing nonviable Spot Instances are
        # terminated (after current gameplay ends) and are not replaced. SPOT_PREFERRED - (default value) Spot
        # Instances are used whenever available in the game server group. If Spot Instances are unavailable,
        # the game server group continues to provide hosting capacity by falling back to On-Demand Instances.
        # Existing nonviable Spot Instances are terminated (after current gameplay ends) and are replaced with
        # new On-Demand Instances. ON_DEMAND_ONLY - Only On-Demand Instances are used in the game server
        # group. No Spot Instances are used, even when available, while this balancing strategy is in force.

        @[JSON::Field(key: "BalancingStrategy")]
        getter balancing_strategy : String?

        # A flag that indicates whether instances in the game server group are protected from early
        # termination. Unprotected instances that have active game servers running might be terminated during
        # a scale-down event, causing players to be dropped from the game. Protected instances cannot be
        # terminated while there are active game servers running except in the event of a forced game server
        # group deletion (see ). An exception to this is with Spot Instances, which can be terminated by
        # Amazon Web Services regardless of protection status. This property is set to NO_PROTECTION by
        # default.

        @[JSON::Field(key: "GameServerProtectionPolicy")]
        getter game_server_protection_policy : String?

        # An updated list of Amazon EC2 instance types to use in the Auto Scaling group. The instance
        # definitions must specify at least two different instance types that are supported by Amazon GameLift
        # Servers FleetIQ. This updated list replaces the entire current list of instance definitions for the
        # game server group. For more information on instance types, see EC2 Instance Types in the Amazon EC2
        # User Guide . You can optionally specify capacity weighting for each instance type. If no weight
        # value is specified for an instance type, it is set to the default value "1". For more information
        # about capacity weighting, see Instance Weighting for Amazon EC2 Auto Scaling in the Amazon EC2 Auto
        # Scaling User Guide.

        @[JSON::Field(key: "InstanceDefinitions")]
        getter instance_definitions : Array(Types::InstanceDefinition)?

        # The Amazon Resource Name ( ARN ) for an IAM role that allows Amazon GameLift Servers to access your
        # Amazon EC2 Auto Scaling groups.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @game_server_group_name : String,
          @balancing_strategy : String? = nil,
          @game_server_protection_policy : String? = nil,
          @instance_definitions : Array(Types::InstanceDefinition)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateGameServerGroupOutput
        include JSON::Serializable

        # An object that describes the game server group resource with updated properties.

        @[JSON::Field(key: "GameServerGroup")]
        getter game_server_group : Types::GameServerGroup?

        def initialize(
          @game_server_group : Types::GameServerGroup? = nil
        )
        end
      end


      struct UpdateGameServerInput
        include JSON::Serializable

        # A unique identifier for the game server group where the game server is running.

        @[JSON::Field(key: "GameServerGroupName")]
        getter game_server_group_name : String

        # A custom string that uniquely identifies the game server to update.

        @[JSON::Field(key: "GameServerId")]
        getter game_server_id : String

        # A set of custom game server properties, formatted as a single string value. This data is passed to a
        # game client or service when it requests information on game servers.

        @[JSON::Field(key: "GameServerData")]
        getter game_server_data : String?

        # Indicates health status of the game server. A request that includes this parameter updates the game
        # server's LastHealthCheckTime timestamp.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : String?

        # Indicates if the game server is available or is currently hosting gameplay. You can update a game
        # server status from AVAILABLE to UTILIZED , but you can't change a the status from UTILIZED to
        # AVAILABLE .

        @[JSON::Field(key: "UtilizationStatus")]
        getter utilization_status : String?

        def initialize(
          @game_server_group_name : String,
          @game_server_id : String,
          @game_server_data : String? = nil,
          @health_check : String? = nil,
          @utilization_status : String? = nil
        )
        end
      end


      struct UpdateGameServerOutput
        include JSON::Serializable

        # Object that describes the newly updated game server.

        @[JSON::Field(key: "GameServer")]
        getter game_server : Types::GameServer?

        def initialize(
          @game_server : Types::GameServer? = nil
        )
        end
      end


      struct UpdateGameSessionInput
        include JSON::Serializable

        # A unique identifier for the game session to update.

        @[JSON::Field(key: "GameSessionId")]
        getter game_session_id : String

        # A set of key-value pairs that can store custom data in a game session. For example: {"Key":
        # "difficulty", "Value": "novice"} . You can use this parameter to modify game properties in an active
        # game session. This action adds new properties and modifies existing properties. There is no way to
        # delete properties. For an example, see Update the value of a game property .

        @[JSON::Field(key: "GameProperties")]
        getter game_properties : Array(Types::GameProperty)?

        # The maximum number of players that can be connected simultaneously to the game session.

        @[JSON::Field(key: "MaximumPlayerSessionCount")]
        getter maximum_player_session_count : Int32?

        # A descriptive label that is associated with a game session. Session names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A policy that determines whether the game session is accepting new players.

        @[JSON::Field(key: "PlayerSessionCreationPolicy")]
        getter player_session_creation_policy : String?

        # Game session protection policy to apply to this game session only. NoProtection -- The game session
        # can be terminated during a scale-down event. FullProtection -- If the game session is in an ACTIVE
        # status, it cannot be terminated during a scale-down event.

        @[JSON::Field(key: "ProtectionPolicy")]
        getter protection_policy : String?

        def initialize(
          @game_session_id : String,
          @game_properties : Array(Types::GameProperty)? = nil,
          @maximum_player_session_count : Int32? = nil,
          @name : String? = nil,
          @player_session_creation_policy : String? = nil,
          @protection_policy : String? = nil
        )
        end
      end


      struct UpdateGameSessionOutput
        include JSON::Serializable

        # The updated game session properties.

        @[JSON::Field(key: "GameSession")]
        getter game_session : Types::GameSession?

        def initialize(
          @game_session : Types::GameSession? = nil
        )
        end
      end


      struct UpdateGameSessionQueueInput
        include JSON::Serializable

        # A descriptive label that is associated with game session queue. Queue names must be unique within
        # each Region. You can use either the queue ID or ARN value.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Information to be added to all events that are related to this game session queue.

        @[JSON::Field(key: "CustomEventData")]
        getter custom_event_data : String?

        # A list of fleets and/or fleet aliases that can be used to fulfill game session placement requests in
        # the queue. Destinations are identified by either a fleet ARN or a fleet alias ARN, and are listed in
        # order of placement preference. When updating this list, provide a complete list of destinations.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::GameSessionQueueDestination)?

        # A list of locations where a queue is allowed to place new game sessions. Locations are specified in
        # the form of Amazon Web Services Region codes, such as us-west-2 . If this parameter is not set, game
        # sessions can be placed in any queue location. To remove an existing filter configuration, pass in an
        # empty set.

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # An SNS topic ARN that is set up to receive game session placement notifications. See Setting up
        # notifications for game session placement .

        @[JSON::Field(key: "NotificationTarget")]
        getter notification_target : String?

        # A set of policies that enforce a sliding cap on player latency when processing game sessions
        # placement requests. Use multiple policies to gradually relax the cap over time if Amazon GameLift
        # Servers can't make a placement. Policies are evaluated in order starting with the lowest maximum
        # latency value. When updating policies, provide a complete collection of policies.

        @[JSON::Field(key: "PlayerLatencyPolicies")]
        getter player_latency_policies : Array(Types::PlayerLatencyPolicy)?

        # Custom settings to use when prioritizing destinations and locations for game session placements.
        # This configuration replaces the FleetIQ default prioritization process. Priority types that are not
        # explicitly named will be automatically applied at the end of the prioritization process. To remove
        # an existing priority configuration, pass in an empty set.

        @[JSON::Field(key: "PriorityConfiguration")]
        getter priority_configuration : Types::PriorityConfiguration?

        # The maximum time, in seconds, that a new game session placement request remains in the queue. When a
        # request exceeds this time, the game session placement changes to a TIMED_OUT status.

        @[JSON::Field(key: "TimeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        def initialize(
          @name : String,
          @custom_event_data : String? = nil,
          @destinations : Array(Types::GameSessionQueueDestination)? = nil,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @notification_target : String? = nil,
          @player_latency_policies : Array(Types::PlayerLatencyPolicy)? = nil,
          @priority_configuration : Types::PriorityConfiguration? = nil,
          @timeout_in_seconds : Int32? = nil
        )
        end
      end


      struct UpdateGameSessionQueueOutput
        include JSON::Serializable

        # An object that describes the newly updated game session queue.

        @[JSON::Field(key: "GameSessionQueue")]
        getter game_session_queue : Types::GameSessionQueue?

        def initialize(
          @game_session_queue : Types::GameSessionQueue? = nil
        )
        end
      end


      struct UpdateMatchmakingConfigurationInput
        include JSON::Serializable

        # A unique identifier for the matchmaking configuration to update. You can use either the
        # configuration name or ARN value.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A flag that indicates whether a match that was created with this configuration must be accepted by
        # the matched players. To require acceptance, set to TRUE. With this option enabled, matchmaking
        # tickets use the status REQUIRES_ACCEPTANCE to indicate when a completed potential match is waiting
        # for player acceptance.

        @[JSON::Field(key: "AcceptanceRequired")]
        getter acceptance_required : Bool?

        # The length of time (in seconds) to wait for players to accept a proposed match, if acceptance is
        # required.

        @[JSON::Field(key: "AcceptanceTimeoutSeconds")]
        getter acceptance_timeout_seconds : Int32?

        # The number of player slots in a match to keep open for future players. For example, if the
        # configuration's rule set specifies a match for a single 12-person team, and the additional player
        # count is set to 2, only 10 players are selected for the match. This parameter is not used if
        # FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "AdditionalPlayerCount")]
        getter additional_player_count : Int32?

        # The method that is used to backfill game sessions created with this matchmaking configuration.
        # Specify MANUAL when your game manages backfill requests manually or does not use the match backfill
        # feature. Specify AUTOMATIC to have GameLift create a match backfill request whenever a game session
        # has one or more open slots. Learn more about manual and automatic backfill in Backfill Existing
        # Games with FlexMatch . Automatic backfill is not available when FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "BackfillMode")]
        getter backfill_mode : String?

        # Information to add to all events related to the matchmaking configuration.

        @[JSON::Field(key: "CustomEventData")]
        getter custom_event_data : String?

        # A description for the matchmaking configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether this matchmaking configuration is being used with Amazon GameLift Servers hosting
        # or as a standalone matchmaking solution. STANDALONE - FlexMatch forms matches and returns match
        # information, including players and team assignments, in a MatchmakingSucceeded event. WITH_QUEUE -
        # FlexMatch forms matches and uses the specified Amazon GameLift Servers queue to start a game session
        # for the match.

        @[JSON::Field(key: "FlexMatchMode")]
        getter flex_match_mode : String?

        # A set of key-value pairs that can store custom data in a game session. For example: {"Key":
        # "difficulty", "Value": "novice"} . This information is added to the new GameSession object that is
        # created for a successful match. This parameter is not used if FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "GameProperties")]
        getter game_properties : Array(Types::GameProperty)?

        # A set of custom game session properties, formatted as a single string value. This data is passed to
        # a game server process with a request to start a new game session. For more information, see Start a
        # game session . This information is added to the game session that is created for a successful match.
        # This parameter is not used if FlexMatchMode is set to STANDALONE .

        @[JSON::Field(key: "GameSessionData")]
        getter game_session_data : String?

        # The Amazon Resource Name ( ARN ) that is assigned to a Amazon GameLift Servers game session queue
        # resource and uniquely identifies it. ARNs are unique across all Regions. Format is
        # arn:aws:gamelift:&lt;region&gt;::gamesessionqueue/&lt;queue name&gt; . Queues can be located in any
        # Region. Queues are used to start new Amazon GameLift Servers-hosted game sessions for matches that
        # are created with this matchmaking configuration. If FlexMatchMode is set to STANDALONE , do not set
        # this parameter.

        @[JSON::Field(key: "GameSessionQueueArns")]
        getter game_session_queue_arns : Array(String)?

        # An SNS topic ARN that is set up to receive matchmaking notifications. See Setting up notifications
        # for matchmaking for more information.

        @[JSON::Field(key: "NotificationTarget")]
        getter notification_target : String?

        # The maximum duration, in seconds, that a matchmaking ticket can remain in process before timing out.
        # Requests that fail due to timing out can be resubmitted as needed.

        @[JSON::Field(key: "RequestTimeoutSeconds")]
        getter request_timeout_seconds : Int32?

        # A unique identifier for the matchmaking rule set to use with this configuration. You can use either
        # the rule set name or ARN value. A matchmaking configuration can only use rule sets that are defined
        # in the same Region.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String?

        def initialize(
          @name : String,
          @acceptance_required : Bool? = nil,
          @acceptance_timeout_seconds : Int32? = nil,
          @additional_player_count : Int32? = nil,
          @backfill_mode : String? = nil,
          @custom_event_data : String? = nil,
          @description : String? = nil,
          @flex_match_mode : String? = nil,
          @game_properties : Array(Types::GameProperty)? = nil,
          @game_session_data : String? = nil,
          @game_session_queue_arns : Array(String)? = nil,
          @notification_target : String? = nil,
          @request_timeout_seconds : Int32? = nil,
          @rule_set_name : String? = nil
        )
        end
      end


      struct UpdateMatchmakingConfigurationOutput
        include JSON::Serializable

        # The updated matchmaking configuration.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::MatchmakingConfiguration?

        def initialize(
          @configuration : Types::MatchmakingConfiguration? = nil
        )
        end
      end


      struct UpdateRuntimeConfigurationInput
        include JSON::Serializable

        # A unique identifier for the fleet to update runtime configuration for. You can use either the fleet
        # ID or ARN value.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String

        # Instructions for launching server processes on fleet computes. Server processes run either a custom
        # game build executable or a Amazon GameLift Servers Realtime script. The runtime configuration lists
        # the types of server processes to run, how to launch them, and the number of processes to run
        # concurrently.

        @[JSON::Field(key: "RuntimeConfiguration")]
        getter runtime_configuration : Types::RuntimeConfiguration

        def initialize(
          @fleet_id : String,
          @runtime_configuration : Types::RuntimeConfiguration
        )
        end
      end


      struct UpdateRuntimeConfigurationOutput
        include JSON::Serializable

        # The runtime configuration currently in use by computes in the fleet. If the update is successful,
        # all property changes are shown.

        @[JSON::Field(key: "RuntimeConfiguration")]
        getter runtime_configuration : Types::RuntimeConfiguration?

        def initialize(
          @runtime_configuration : Types::RuntimeConfiguration? = nil
        )
        end
      end


      struct UpdateScriptInput
        include JSON::Serializable

        # A unique identifier for the Realtime script to update. You can use either the script ID or ARN
        # value.

        @[JSON::Field(key: "ScriptId")]
        getter script_id : String

        # A descriptive label that is associated with a script. Script names do not need to be unique.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The location of the Amazon S3 bucket where a zipped file containing your Realtime scripts is stored.
        # The storage location must specify the Amazon S3 bucket name, the zip file name (the "key"), and a
        # role ARN that allows Amazon GameLift Servers to access the Amazon S3 storage location. The S3 bucket
        # must be in the same Region where you want to create a new script. By default, Amazon GameLift
        # Servers uploads the latest version of the zip file; if you have S3 object versioning turned on, you
        # can use the ObjectVersion parameter to specify an earlier version.

        @[JSON::Field(key: "StorageLocation")]
        getter storage_location : Types::S3Location?

        # Version information that is associated with a build or script. Version strings do not need to be
        # unique.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # A data object containing your Realtime scripts and dependencies as a zip file. The zip file can have
        # one or multiple files. Maximum size of a zip file is 5 MB. When using the Amazon Web Services CLI
        # tool to create a script, this parameter is set to the zip file name. It must be prepended with the
        # string "fileb://" to indicate that the file data is a binary object. For example: --zip-file
        # fileb://myRealtimeScript.zip .

        @[JSON::Field(key: "ZipFile")]
        getter zip_file : Bytes?

        def initialize(
          @script_id : String,
          @name : String? = nil,
          @storage_location : Types::S3Location? = nil,
          @version : String? = nil,
          @zip_file : Bytes? = nil
        )
        end
      end


      struct UpdateScriptOutput
        include JSON::Serializable

        # The newly created script record with a unique script ID. The new script's storage location reflects
        # an Amazon S3 location: (1) If the script was uploaded from an S3 bucket under your account, the
        # storage location reflects the information that was provided in the CreateScript request; (2) If the
        # script file was uploaded from a local zip file, the storage location reflects an S3 location
        # controls by the Amazon GameLift Servers service.

        @[JSON::Field(key: "Script")]
        getter script : Types::Script?

        def initialize(
          @script : Types::Script? = nil
        )
        end
      end


      struct ValidateMatchmakingRuleSetInput
        include JSON::Serializable

        # A collection of matchmaking rules to validate, formatted as a JSON string.

        @[JSON::Field(key: "RuleSetBody")]
        getter rule_set_body : String

        def initialize(
          @rule_set_body : String
        )
        end
      end


      struct ValidateMatchmakingRuleSetOutput
        include JSON::Serializable

        # A response indicating whether the rule set is valid.

        @[JSON::Field(key: "Valid")]
        getter valid : Bool?

        def initialize(
          @valid : Bool? = nil
        )
        end
      end

      # Represents an authorization for a VPC peering connection between the VPC for an Amazon GameLift
      # Servers fleet and another VPC on an account you have access to. This authorization must exist and be
      # valid for the peering connection to be established. Authorizations are valid for 24 hours after they
      # are issued. Related actions All APIs by task

      struct VpcPeeringAuthorization
        include JSON::Serializable

        # Time stamp indicating when this authorization was issued. Format is a number expressed in Unix time
        # as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Time stamp indicating when this authorization expires (24 hours after issuance). Format is a number
        # expressed in Unix time as milliseconds (for example "1469498468.057" ).

        @[JSON::Field(key: "ExpirationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time?

        # A unique identifier for the Amazon Web Services account that you use to manage your Amazon GameLift
        # Servers fleet. You can find your Account ID in the Amazon Web Services Management Console under
        # account settings.

        @[JSON::Field(key: "GameLiftAwsAccountId")]
        getter game_lift_aws_account_id : String?

        # The authorization's peer VPC Amazon Web Services account ID.

        @[JSON::Field(key: "PeerVpcAwsAccountId")]
        getter peer_vpc_aws_account_id : String?

        # A unique identifier for a VPC with resources to be accessed by your Amazon GameLift Servers fleet.
        # The VPC must be in the same Region as your fleet. To look up a VPC ID, use the VPC Dashboard in the
        # Amazon Web Services Management Console. Learn more about VPC peering in VPC Peering with Amazon
        # GameLift Servers Fleets .

        @[JSON::Field(key: "PeerVpcId")]
        getter peer_vpc_id : String?

        def initialize(
          @creation_time : Time? = nil,
          @expiration_time : Time? = nil,
          @game_lift_aws_account_id : String? = nil,
          @peer_vpc_aws_account_id : String? = nil,
          @peer_vpc_id : String? = nil
        )
        end
      end

      # Represents a peering connection between a VPC on one of your Amazon Web Services accounts and the
      # VPC for your Amazon GameLift Servers fleets. This record may be for an active peering connection or
      # a pending connection that has not yet been established. Related actions All APIs by task

      struct VpcPeeringConnection
        include JSON::Serializable

        # The Amazon Resource Name ( ARN ) associated with the GameLift fleet resource for this connection.

        @[JSON::Field(key: "FleetArn")]
        getter fleet_arn : String?

        # A unique identifier for the fleet. This ID determines the ID of the Amazon GameLift Servers VPC for
        # your fleet.

        @[JSON::Field(key: "FleetId")]
        getter fleet_id : String?

        # A unique identifier for the VPC that contains the Amazon GameLift Servers fleet for this connection.
        # This VPC is managed by Amazon GameLift Servers and does not appear in your Amazon Web Services
        # account.

        @[JSON::Field(key: "GameLiftVpcId")]
        getter game_lift_vpc_id : String?

        # CIDR block of IPv4 addresses assigned to the VPC peering connection for the GameLift VPC. The peered
        # VPC also has an IPv4 CIDR block associated with it; these blocks cannot overlap or the peering
        # connection cannot be created.

        @[JSON::Field(key: "IpV4CidrBlock")]
        getter ip_v4_cidr_block : String?

        # A unique identifier for a VPC with resources to be accessed by your Amazon GameLift Servers fleet.
        # The VPC must be in the same Region as your fleet. To look up a VPC ID, use the VPC Dashboard in the
        # Amazon Web Services Management Console. Learn more about VPC peering in VPC Peering with Amazon
        # GameLift Servers Fleets .

        @[JSON::Field(key: "PeerVpcId")]
        getter peer_vpc_id : String?

        # The status information about the connection. Status indicates if a connection is pending,
        # successful, or failed.

        @[JSON::Field(key: "Status")]
        getter status : Types::VpcPeeringConnectionStatus?

        # A unique identifier that is automatically assigned to the connection record. This ID is referenced
        # in VPC peering connection events, and is used when deleting a connection.

        @[JSON::Field(key: "VpcPeeringConnectionId")]
        getter vpc_peering_connection_id : String?

        def initialize(
          @fleet_arn : String? = nil,
          @fleet_id : String? = nil,
          @game_lift_vpc_id : String? = nil,
          @ip_v4_cidr_block : String? = nil,
          @peer_vpc_id : String? = nil,
          @status : Types::VpcPeeringConnectionStatus? = nil,
          @vpc_peering_connection_id : String? = nil
        )
        end
      end

      # Represents status information for a VPC peering connection. Status codes and messages are provided
      # from EC2 (see VpcPeeringConnectionStateReason ). Connection status information is also communicated
      # as a fleet event.

      struct VpcPeeringConnectionStatus
        include JSON::Serializable

        # Code indicating the status of a VPC peering connection.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # Additional messaging associated with the connection status.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end
    end
  end
end
