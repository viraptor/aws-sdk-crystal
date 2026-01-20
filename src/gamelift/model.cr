module Aws
  module GameLift
    module Model
      API_VERSION = "2015-10-01"
      TARGET_PREFIX = "GameLift"
      SIGNING_NAME = "gamelift"
      ENDPOINT_PREFIX = "gamelift"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://gamelift-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://gamelift-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://gamelift.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://gamelift.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_MATCH = OperationModel.new(
        name: "AcceptMatch",
        http_method: "POST",
        request_uri: "/"
      )

      CLAIM_GAME_SERVER = OperationModel.new(
        name: "ClaimGameServer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ALIAS = OperationModel.new(
        name: "CreateAlias",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BUILD = OperationModel.new(
        name: "CreateBuild",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONTAINER_FLEET = OperationModel.new(
        name: "CreateContainerFleet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONTAINER_GROUP_DEFINITION = OperationModel.new(
        name: "CreateContainerGroupDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLEET = OperationModel.new(
        name: "CreateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLEET_LOCATIONS = OperationModel.new(
        name: "CreateFleetLocations",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GAME_SERVER_GROUP = OperationModel.new(
        name: "CreateGameServerGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GAME_SESSION = OperationModel.new(
        name: "CreateGameSession",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GAME_SESSION_QUEUE = OperationModel.new(
        name: "CreateGameSessionQueue",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION = OperationModel.new(
        name: "CreateLocation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MATCHMAKING_CONFIGURATION = OperationModel.new(
        name: "CreateMatchmakingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MATCHMAKING_RULE_SET = OperationModel.new(
        name: "CreateMatchmakingRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PLAYER_SESSION = OperationModel.new(
        name: "CreatePlayerSession",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PLAYER_SESSIONS = OperationModel.new(
        name: "CreatePlayerSessions",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SCRIPT = OperationModel.new(
        name: "CreateScript",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_PEERING_AUTHORIZATION = OperationModel.new(
        name: "CreateVpcPeeringAuthorization",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_PEERING_CONNECTION = OperationModel.new(
        name: "CreateVpcPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ALIAS = OperationModel.new(
        name: "DeleteAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BUILD = OperationModel.new(
        name: "DeleteBuild",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTAINER_FLEET = OperationModel.new(
        name: "DeleteContainerFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTAINER_GROUP_DEFINITION = OperationModel.new(
        name: "DeleteContainerGroupDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLEET = OperationModel.new(
        name: "DeleteFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLEET_LOCATIONS = OperationModel.new(
        name: "DeleteFleetLocations",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GAME_SERVER_GROUP = OperationModel.new(
        name: "DeleteGameServerGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GAME_SESSION_QUEUE = OperationModel.new(
        name: "DeleteGameSessionQueue",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOCATION = OperationModel.new(
        name: "DeleteLocation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MATCHMAKING_CONFIGURATION = OperationModel.new(
        name: "DeleteMatchmakingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MATCHMAKING_RULE_SET = OperationModel.new(
        name: "DeleteMatchmakingRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SCALING_POLICY = OperationModel.new(
        name: "DeleteScalingPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SCRIPT = OperationModel.new(
        name: "DeleteScript",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_PEERING_AUTHORIZATION = OperationModel.new(
        name: "DeleteVpcPeeringAuthorization",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_PEERING_CONNECTION = OperationModel.new(
        name: "DeleteVpcPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_COMPUTE = OperationModel.new(
        name: "DeregisterCompute",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_GAME_SERVER = OperationModel.new(
        name: "DeregisterGameServer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ALIAS = OperationModel.new(
        name: "DescribeAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUILD = OperationModel.new(
        name: "DescribeBuild",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COMPUTE = OperationModel.new(
        name: "DescribeCompute",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONTAINER_FLEET = OperationModel.new(
        name: "DescribeContainerFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONTAINER_GROUP_DEFINITION = OperationModel.new(
        name: "DescribeContainerGroupDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EC2_INSTANCE_LIMITS = OperationModel.new(
        name: "DescribeEC2InstanceLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_ATTRIBUTES = OperationModel.new(
        name: "DescribeFleetAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_CAPACITY = OperationModel.new(
        name: "DescribeFleetCapacity",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_DEPLOYMENT = OperationModel.new(
        name: "DescribeFleetDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_EVENTS = OperationModel.new(
        name: "DescribeFleetEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_LOCATION_ATTRIBUTES = OperationModel.new(
        name: "DescribeFleetLocationAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_LOCATION_CAPACITY = OperationModel.new(
        name: "DescribeFleetLocationCapacity",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_LOCATION_UTILIZATION = OperationModel.new(
        name: "DescribeFleetLocationUtilization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_PORT_SETTINGS = OperationModel.new(
        name: "DescribeFleetPortSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_UTILIZATION = OperationModel.new(
        name: "DescribeFleetUtilization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GAME_SERVER = OperationModel.new(
        name: "DescribeGameServer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GAME_SERVER_GROUP = OperationModel.new(
        name: "DescribeGameServerGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GAME_SERVER_INSTANCES = OperationModel.new(
        name: "DescribeGameServerInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GAME_SESSION_DETAILS = OperationModel.new(
        name: "DescribeGameSessionDetails",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GAME_SESSION_PLACEMENT = OperationModel.new(
        name: "DescribeGameSessionPlacement",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GAME_SESSION_QUEUES = OperationModel.new(
        name: "DescribeGameSessionQueues",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GAME_SESSIONS = OperationModel.new(
        name: "DescribeGameSessions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCES = OperationModel.new(
        name: "DescribeInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MATCHMAKING = OperationModel.new(
        name: "DescribeMatchmaking",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MATCHMAKING_CONFIGURATIONS = OperationModel.new(
        name: "DescribeMatchmakingConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MATCHMAKING_RULE_SETS = OperationModel.new(
        name: "DescribeMatchmakingRuleSets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PLAYER_SESSIONS = OperationModel.new(
        name: "DescribePlayerSessions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RUNTIME_CONFIGURATION = OperationModel.new(
        name: "DescribeRuntimeConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCALING_POLICIES = OperationModel.new(
        name: "DescribeScalingPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCRIPT = OperationModel.new(
        name: "DescribeScript",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_PEERING_AUTHORIZATIONS = OperationModel.new(
        name: "DescribeVpcPeeringAuthorizations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_PEERING_CONNECTIONS = OperationModel.new(
        name: "DescribeVpcPeeringConnections",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMPUTE_ACCESS = OperationModel.new(
        name: "GetComputeAccess",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMPUTE_AUTH_TOKEN = OperationModel.new(
        name: "GetComputeAuthToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GAME_SESSION_LOG_URL = OperationModel.new(
        name: "GetGameSessionLogUrl",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_ACCESS = OperationModel.new(
        name: "GetInstanceAccess",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ALIASES = OperationModel.new(
        name: "ListAliases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BUILDS = OperationModel.new(
        name: "ListBuilds",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPUTE = OperationModel.new(
        name: "ListCompute",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONTAINER_FLEETS = OperationModel.new(
        name: "ListContainerFleets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONTAINER_GROUP_DEFINITION_VERSIONS = OperationModel.new(
        name: "ListContainerGroupDefinitionVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONTAINER_GROUP_DEFINITIONS = OperationModel.new(
        name: "ListContainerGroupDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLEET_DEPLOYMENTS = OperationModel.new(
        name: "ListFleetDeployments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLEETS = OperationModel.new(
        name: "ListFleets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GAME_SERVER_GROUPS = OperationModel.new(
        name: "ListGameServerGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GAME_SERVERS = OperationModel.new(
        name: "ListGameServers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOCATIONS = OperationModel.new(
        name: "ListLocations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SCRIPTS = OperationModel.new(
        name: "ListScripts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SCALING_POLICY = OperationModel.new(
        name: "PutScalingPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_COMPUTE = OperationModel.new(
        name: "RegisterCompute",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_GAME_SERVER = OperationModel.new(
        name: "RegisterGameServer",
        http_method: "POST",
        request_uri: "/"
      )

      REQUEST_UPLOAD_CREDENTIALS = OperationModel.new(
        name: "RequestUploadCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      RESOLVE_ALIAS = OperationModel.new(
        name: "ResolveAlias",
        http_method: "POST",
        request_uri: "/"
      )

      RESUME_GAME_SERVER_GROUP = OperationModel.new(
        name: "ResumeGameServerGroup",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_GAME_SESSIONS = OperationModel.new(
        name: "SearchGameSessions",
        http_method: "POST",
        request_uri: "/"
      )

      START_FLEET_ACTIONS = OperationModel.new(
        name: "StartFleetActions",
        http_method: "POST",
        request_uri: "/"
      )

      START_GAME_SESSION_PLACEMENT = OperationModel.new(
        name: "StartGameSessionPlacement",
        http_method: "POST",
        request_uri: "/"
      )

      START_MATCH_BACKFILL = OperationModel.new(
        name: "StartMatchBackfill",
        http_method: "POST",
        request_uri: "/"
      )

      START_MATCHMAKING = OperationModel.new(
        name: "StartMatchmaking",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_FLEET_ACTIONS = OperationModel.new(
        name: "StopFleetActions",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_GAME_SESSION_PLACEMENT = OperationModel.new(
        name: "StopGameSessionPlacement",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_MATCHMAKING = OperationModel.new(
        name: "StopMatchmaking",
        http_method: "POST",
        request_uri: "/"
      )

      SUSPEND_GAME_SERVER_GROUP = OperationModel.new(
        name: "SuspendGameServerGroup",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_GAME_SESSION = OperationModel.new(
        name: "TerminateGameSession",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ALIAS = OperationModel.new(
        name: "UpdateAlias",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BUILD = OperationModel.new(
        name: "UpdateBuild",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONTAINER_FLEET = OperationModel.new(
        name: "UpdateContainerFleet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONTAINER_GROUP_DEFINITION = OperationModel.new(
        name: "UpdateContainerGroupDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FLEET_ATTRIBUTES = OperationModel.new(
        name: "UpdateFleetAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FLEET_CAPACITY = OperationModel.new(
        name: "UpdateFleetCapacity",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FLEET_PORT_SETTINGS = OperationModel.new(
        name: "UpdateFleetPortSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GAME_SERVER = OperationModel.new(
        name: "UpdateGameServer",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GAME_SERVER_GROUP = OperationModel.new(
        name: "UpdateGameServerGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GAME_SESSION = OperationModel.new(
        name: "UpdateGameSession",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GAME_SESSION_QUEUE = OperationModel.new(
        name: "UpdateGameSessionQueue",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MATCHMAKING_CONFIGURATION = OperationModel.new(
        name: "UpdateMatchmakingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RUNTIME_CONFIGURATION = OperationModel.new(
        name: "UpdateRuntimeConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SCRIPT = OperationModel.new(
        name: "UpdateScript",
        http_method: "POST",
        request_uri: "/"
      )

      VALIDATE_MATCHMAKING_RULE_SET = OperationModel.new(
        name: "ValidateMatchmakingRuleSet",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
