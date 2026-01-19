module AwsSdk
  module SFN
    module Model
      API_VERSION = "2016-11-23"
      TARGET_PREFIX = "AWSStepFunctions"
      SIGNING_NAME = "states"
      ENDPOINT_PREFIX = "states"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://states-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://states.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://states-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://states.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://states.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ACTIVITY = OperationModel.new(
        name: "CreateActivity",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STATE_MACHINE = OperationModel.new(
        name: "CreateStateMachine",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STATE_MACHINE_ALIAS = OperationModel.new(
        name: "CreateStateMachineAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACTIVITY = OperationModel.new(
        name: "DeleteActivity",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STATE_MACHINE = OperationModel.new(
        name: "DeleteStateMachine",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STATE_MACHINE_ALIAS = OperationModel.new(
        name: "DeleteStateMachineAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STATE_MACHINE_VERSION = OperationModel.new(
        name: "DeleteStateMachineVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACTIVITY = OperationModel.new(
        name: "DescribeActivity",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXECUTION = OperationModel.new(
        name: "DescribeExecution",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAP_RUN = OperationModel.new(
        name: "DescribeMapRun",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STATE_MACHINE = OperationModel.new(
        name: "DescribeStateMachine",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STATE_MACHINE_ALIAS = OperationModel.new(
        name: "DescribeStateMachineAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STATE_MACHINE_FOR_EXECUTION = OperationModel.new(
        name: "DescribeStateMachineForExecution",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACTIVITY_TASK = OperationModel.new(
        name: "GetActivityTask",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EXECUTION_HISTORY = OperationModel.new(
        name: "GetExecutionHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACTIVITIES = OperationModel.new(
        name: "ListActivities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXECUTIONS = OperationModel.new(
        name: "ListExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MAP_RUNS = OperationModel.new(
        name: "ListMapRuns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STATE_MACHINE_ALIASES = OperationModel.new(
        name: "ListStateMachineAliases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STATE_MACHINE_VERSIONS = OperationModel.new(
        name: "ListStateMachineVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STATE_MACHINES = OperationModel.new(
        name: "ListStateMachines",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUBLISH_STATE_MACHINE_VERSION = OperationModel.new(
        name: "PublishStateMachineVersion",
        http_method: "POST",
        request_uri: "/"
      )

      REDRIVE_EXECUTION = OperationModel.new(
        name: "RedriveExecution",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_TASK_FAILURE = OperationModel.new(
        name: "SendTaskFailure",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_TASK_HEARTBEAT = OperationModel.new(
        name: "SendTaskHeartbeat",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_TASK_SUCCESS = OperationModel.new(
        name: "SendTaskSuccess",
        http_method: "POST",
        request_uri: "/"
      )

      START_EXECUTION = OperationModel.new(
        name: "StartExecution",
        http_method: "POST",
        request_uri: "/"
      )

      START_SYNC_EXECUTION = OperationModel.new(
        name: "StartSyncExecution",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_EXECUTION = OperationModel.new(
        name: "StopExecution",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_STATE = OperationModel.new(
        name: "TestState",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MAP_RUN = OperationModel.new(
        name: "UpdateMapRun",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STATE_MACHINE = OperationModel.new(
        name: "UpdateStateMachine",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STATE_MACHINE_ALIAS = OperationModel.new(
        name: "UpdateStateMachineAlias",
        http_method: "POST",
        request_uri: "/"
      )

      VALIDATE_STATE_MACHINE_DEFINITION = OperationModel.new(
        name: "ValidateStateMachineDefinition",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
