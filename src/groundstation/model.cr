module Aws
  module GroundStation
    module Model
      API_VERSION = "2019-05-23"
      TARGET_PREFIX = ""
      SIGNING_NAME = "groundstation"
      ENDPOINT_PREFIX = "groundstation"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://groundstation-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://groundstation-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://groundstation.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://groundstation.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_CONTACT = OperationModel.new(
        name: "CancelContact",
        http_method: "DELETE",
        request_uri: "/contact/{contactId}"
      )

      CREATE_CONFIG = OperationModel.new(
        name: "CreateConfig",
        http_method: "POST",
        request_uri: "/config"
      )

      CREATE_DATAFLOW_ENDPOINT_GROUP = OperationModel.new(
        name: "CreateDataflowEndpointGroup",
        http_method: "POST",
        request_uri: "/dataflowEndpointGroup"
      )

      CREATE_DATAFLOW_ENDPOINT_GROUP_V2 = OperationModel.new(
        name: "CreateDataflowEndpointGroupV2",
        http_method: "POST",
        request_uri: "/dataflowEndpointGroupV2"
      )

      CREATE_EPHEMERIS = OperationModel.new(
        name: "CreateEphemeris",
        http_method: "POST",
        request_uri: "/ephemeris"
      )

      CREATE_MISSION_PROFILE = OperationModel.new(
        name: "CreateMissionProfile",
        http_method: "POST",
        request_uri: "/missionprofile"
      )

      DELETE_CONFIG = OperationModel.new(
        name: "DeleteConfig",
        http_method: "DELETE",
        request_uri: "/config/{configType}/{configId}"
      )

      DELETE_DATAFLOW_ENDPOINT_GROUP = OperationModel.new(
        name: "DeleteDataflowEndpointGroup",
        http_method: "DELETE",
        request_uri: "/dataflowEndpointGroup/{dataflowEndpointGroupId}"
      )

      DELETE_EPHEMERIS = OperationModel.new(
        name: "DeleteEphemeris",
        http_method: "DELETE",
        request_uri: "/ephemeris/{ephemerisId}"
      )

      DELETE_MISSION_PROFILE = OperationModel.new(
        name: "DeleteMissionProfile",
        http_method: "DELETE",
        request_uri: "/missionprofile/{missionProfileId}"
      )

      DESCRIBE_CONTACT = OperationModel.new(
        name: "DescribeContact",
        http_method: "GET",
        request_uri: "/contact/{contactId}"
      )

      DESCRIBE_EPHEMERIS = OperationModel.new(
        name: "DescribeEphemeris",
        http_method: "GET",
        request_uri: "/ephemeris/{ephemerisId}"
      )

      GET_AGENT_CONFIGURATION = OperationModel.new(
        name: "GetAgentConfiguration",
        http_method: "GET",
        request_uri: "/agent/{agentId}/configuration"
      )

      GET_AGENT_TASK_RESPONSE_URL = OperationModel.new(
        name: "GetAgentTaskResponseUrl",
        http_method: "GET",
        request_uri: "/agentResponseUrl/{agentId}/{taskId}"
      )

      GET_CONFIG = OperationModel.new(
        name: "GetConfig",
        http_method: "GET",
        request_uri: "/config/{configType}/{configId}"
      )

      GET_DATAFLOW_ENDPOINT_GROUP = OperationModel.new(
        name: "GetDataflowEndpointGroup",
        http_method: "GET",
        request_uri: "/dataflowEndpointGroup/{dataflowEndpointGroupId}"
      )

      GET_MINUTE_USAGE = OperationModel.new(
        name: "GetMinuteUsage",
        http_method: "POST",
        request_uri: "/minute-usage"
      )

      GET_MISSION_PROFILE = OperationModel.new(
        name: "GetMissionProfile",
        http_method: "GET",
        request_uri: "/missionprofile/{missionProfileId}"
      )

      GET_SATELLITE = OperationModel.new(
        name: "GetSatellite",
        http_method: "GET",
        request_uri: "/satellite/{satelliteId}"
      )

      LIST_CONFIGS = OperationModel.new(
        name: "ListConfigs",
        http_method: "GET",
        request_uri: "/config"
      )

      LIST_CONTACTS = OperationModel.new(
        name: "ListContacts",
        http_method: "POST",
        request_uri: "/contacts"
      )

      LIST_DATAFLOW_ENDPOINT_GROUPS = OperationModel.new(
        name: "ListDataflowEndpointGroups",
        http_method: "GET",
        request_uri: "/dataflowEndpointGroup"
      )

      LIST_EPHEMERIDES = OperationModel.new(
        name: "ListEphemerides",
        http_method: "POST",
        request_uri: "/ephemerides"
      )

      LIST_GROUND_STATIONS = OperationModel.new(
        name: "ListGroundStations",
        http_method: "GET",
        request_uri: "/groundstation"
      )

      LIST_MISSION_PROFILES = OperationModel.new(
        name: "ListMissionProfiles",
        http_method: "GET",
        request_uri: "/missionprofile"
      )

      LIST_SATELLITES = OperationModel.new(
        name: "ListSatellites",
        http_method: "GET",
        request_uri: "/satellite"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      REGISTER_AGENT = OperationModel.new(
        name: "RegisterAgent",
        http_method: "POST",
        request_uri: "/agent"
      )

      RESERVE_CONTACT = OperationModel.new(
        name: "ReserveContact",
        http_method: "POST",
        request_uri: "/contact"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_AGENT_STATUS = OperationModel.new(
        name: "UpdateAgentStatus",
        http_method: "PUT",
        request_uri: "/agent/{agentId}"
      )

      UPDATE_CONFIG = OperationModel.new(
        name: "UpdateConfig",
        http_method: "PUT",
        request_uri: "/config/{configType}/{configId}"
      )

      UPDATE_EPHEMERIS = OperationModel.new(
        name: "UpdateEphemeris",
        http_method: "PUT",
        request_uri: "/ephemeris/{ephemerisId}"
      )

      UPDATE_MISSION_PROFILE = OperationModel.new(
        name: "UpdateMissionProfile",
        http_method: "PUT",
        request_uri: "/missionprofile/{missionProfileId}"
      )
    end
  end
end
