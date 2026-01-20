module Aws
  module Braket
    module Model
      API_VERSION = "2019-09-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "braket"
      ENDPOINT_PREFIX = "braket"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://braket-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://braket-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://braket.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://braket.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_JOB = OperationModel.new(
        name: "CancelJob",
        http_method: "PUT",
        request_uri: "/job/{jobArn}/cancel"
      )

      CANCEL_QUANTUM_TASK = OperationModel.new(
        name: "CancelQuantumTask",
        http_method: "PUT",
        request_uri: "/quantum-task/{quantumTaskArn}/cancel"
      )

      CREATE_JOB = OperationModel.new(
        name: "CreateJob",
        http_method: "POST",
        request_uri: "/job"
      )

      CREATE_QUANTUM_TASK = OperationModel.new(
        name: "CreateQuantumTask",
        http_method: "POST",
        request_uri: "/quantum-task"
      )

      CREATE_SPENDING_LIMIT = OperationModel.new(
        name: "CreateSpendingLimit",
        http_method: "POST",
        request_uri: "/spending-limit"
      )

      DELETE_SPENDING_LIMIT = OperationModel.new(
        name: "DeleteSpendingLimit",
        http_method: "DELETE",
        request_uri: "/spending-limit/{spendingLimitArn}/delete"
      )

      GET_DEVICE = OperationModel.new(
        name: "GetDevice",
        http_method: "GET",
        request_uri: "/device/{deviceArn}"
      )

      GET_JOB = OperationModel.new(
        name: "GetJob",
        http_method: "GET",
        request_uri: "/job/{jobArn}"
      )

      GET_QUANTUM_TASK = OperationModel.new(
        name: "GetQuantumTask",
        http_method: "GET",
        request_uri: "/quantum-task/{quantumTaskArn}"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      SEARCH_DEVICES = OperationModel.new(
        name: "SearchDevices",
        http_method: "POST",
        request_uri: "/devices"
      )

      SEARCH_JOBS = OperationModel.new(
        name: "SearchJobs",
        http_method: "POST",
        request_uri: "/jobs"
      )

      SEARCH_QUANTUM_TASKS = OperationModel.new(
        name: "SearchQuantumTasks",
        http_method: "POST",
        request_uri: "/quantum-tasks"
      )

      SEARCH_SPENDING_LIMITS = OperationModel.new(
        name: "SearchSpendingLimits",
        http_method: "POST",
        request_uri: "/spending-limits"
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

      UPDATE_SPENDING_LIMIT = OperationModel.new(
        name: "UpdateSpendingLimit",
        http_method: "PATCH",
        request_uri: "/spending-limit/{spendingLimitArn}/update"
      )
    end
  end
end
