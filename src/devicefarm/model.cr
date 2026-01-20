module Aws
  module DeviceFarm
    module Model
      API_VERSION = "2015-06-23"
      TARGET_PREFIX = "DeviceFarm_20150623"
      SIGNING_NAME = "devicefarm"
      ENDPOINT_PREFIX = "devicefarm"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://devicefarm-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://devicefarm-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://devicefarm.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://devicefarm.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_DEVICE_POOL = OperationModel.new(
        name: "CreateDevicePool",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCE_PROFILE = OperationModel.new(
        name: "CreateInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NETWORK_PROFILE = OperationModel.new(
        name: "CreateNetworkProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROJECT = OperationModel.new(
        name: "CreateProject",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REMOTE_ACCESS_SESSION = OperationModel.new(
        name: "CreateRemoteAccessSession",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TEST_GRID_PROJECT = OperationModel.new(
        name: "CreateTestGridProject",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TEST_GRID_URL = OperationModel.new(
        name: "CreateTestGridUrl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_UPLOAD = OperationModel.new(
        name: "CreateUpload",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPCE_CONFIGURATION = OperationModel.new(
        name: "CreateVPCEConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DEVICE_POOL = OperationModel.new(
        name: "DeleteDevicePool",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INSTANCE_PROFILE = OperationModel.new(
        name: "DeleteInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_PROFILE = OperationModel.new(
        name: "DeleteNetworkProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROJECT = OperationModel.new(
        name: "DeleteProject",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REMOTE_ACCESS_SESSION = OperationModel.new(
        name: "DeleteRemoteAccessSession",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RUN = OperationModel.new(
        name: "DeleteRun",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TEST_GRID_PROJECT = OperationModel.new(
        name: "DeleteTestGridProject",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_UPLOAD = OperationModel.new(
        name: "DeleteUpload",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPCE_CONFIGURATION = OperationModel.new(
        name: "DeleteVPCEConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_SETTINGS = OperationModel.new(
        name: "GetAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEVICE = OperationModel.new(
        name: "GetDevice",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEVICE_INSTANCE = OperationModel.new(
        name: "GetDeviceInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEVICE_POOL = OperationModel.new(
        name: "GetDevicePool",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEVICE_POOL_COMPATIBILITY = OperationModel.new(
        name: "GetDevicePoolCompatibility",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_PROFILE = OperationModel.new(
        name: "GetInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      GET_JOB = OperationModel.new(
        name: "GetJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_NETWORK_PROFILE = OperationModel.new(
        name: "GetNetworkProfile",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OFFERING_STATUS = OperationModel.new(
        name: "GetOfferingStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PROJECT = OperationModel.new(
        name: "GetProject",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REMOTE_ACCESS_SESSION = OperationModel.new(
        name: "GetRemoteAccessSession",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RUN = OperationModel.new(
        name: "GetRun",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SUITE = OperationModel.new(
        name: "GetSuite",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TEST = OperationModel.new(
        name: "GetTest",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TEST_GRID_PROJECT = OperationModel.new(
        name: "GetTestGridProject",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TEST_GRID_SESSION = OperationModel.new(
        name: "GetTestGridSession",
        http_method: "POST",
        request_uri: "/"
      )

      GET_UPLOAD = OperationModel.new(
        name: "GetUpload",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VPCE_CONFIGURATION = OperationModel.new(
        name: "GetVPCEConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      INSTALL_TO_REMOTE_ACCESS_SESSION = OperationModel.new(
        name: "InstallToRemoteAccessSession",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ARTIFACTS = OperationModel.new(
        name: "ListArtifacts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEVICE_INSTANCES = OperationModel.new(
        name: "ListDeviceInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEVICE_POOLS = OperationModel.new(
        name: "ListDevicePools",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEVICES = OperationModel.new(
        name: "ListDevices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCE_PROFILES = OperationModel.new(
        name: "ListInstanceProfiles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NETWORK_PROFILES = OperationModel.new(
        name: "ListNetworkProfiles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OFFERING_PROMOTIONS = OperationModel.new(
        name: "ListOfferingPromotions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OFFERING_TRANSACTIONS = OperationModel.new(
        name: "ListOfferingTransactions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OFFERINGS = OperationModel.new(
        name: "ListOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROJECTS = OperationModel.new(
        name: "ListProjects",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REMOTE_ACCESS_SESSIONS = OperationModel.new(
        name: "ListRemoteAccessSessions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RUNS = OperationModel.new(
        name: "ListRuns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SAMPLES = OperationModel.new(
        name: "ListSamples",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SUITES = OperationModel.new(
        name: "ListSuites",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TEST_GRID_PROJECTS = OperationModel.new(
        name: "ListTestGridProjects",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TEST_GRID_SESSION_ACTIONS = OperationModel.new(
        name: "ListTestGridSessionActions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TEST_GRID_SESSION_ARTIFACTS = OperationModel.new(
        name: "ListTestGridSessionArtifacts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TEST_GRID_SESSIONS = OperationModel.new(
        name: "ListTestGridSessions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TESTS = OperationModel.new(
        name: "ListTests",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_UNIQUE_PROBLEMS = OperationModel.new(
        name: "ListUniqueProblems",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_UPLOADS = OperationModel.new(
        name: "ListUploads",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VPCE_CONFIGURATIONS = OperationModel.new(
        name: "ListVPCEConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      PURCHASE_OFFERING = OperationModel.new(
        name: "PurchaseOffering",
        http_method: "POST",
        request_uri: "/"
      )

      RENEW_OFFERING = OperationModel.new(
        name: "RenewOffering",
        http_method: "POST",
        request_uri: "/"
      )

      SCHEDULE_RUN = OperationModel.new(
        name: "ScheduleRun",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_JOB = OperationModel.new(
        name: "StopJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_REMOTE_ACCESS_SESSION = OperationModel.new(
        name: "StopRemoteAccessSession",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_RUN = OperationModel.new(
        name: "StopRun",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEVICE_INSTANCE = OperationModel.new(
        name: "UpdateDeviceInstance",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEVICE_POOL = OperationModel.new(
        name: "UpdateDevicePool",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INSTANCE_PROFILE = OperationModel.new(
        name: "UpdateInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NETWORK_PROFILE = OperationModel.new(
        name: "UpdateNetworkProfile",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROJECT = OperationModel.new(
        name: "UpdateProject",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TEST_GRID_PROJECT = OperationModel.new(
        name: "UpdateTestGridProject",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_UPLOAD = OperationModel.new(
        name: "UpdateUpload",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VPCE_CONFIGURATION = OperationModel.new(
        name: "UpdateVPCEConfiguration",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
