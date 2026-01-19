module AwsSdk
  module DataPipeline
    module Model
      API_VERSION = "2012-10-29"
      TARGET_PREFIX = "DataPipeline"
      SIGNING_NAME = "datapipeline"
      ENDPOINT_PREFIX = "datapipeline"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://datapipeline-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://datapipeline-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://datapipeline.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://datapipeline.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACTIVATE_PIPELINE = OperationModel.new(
        name: "ActivatePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_TAGS = OperationModel.new(
        name: "AddTags",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PIPELINE = OperationModel.new(
        name: "CreatePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      DEACTIVATE_PIPELINE = OperationModel.new(
        name: "DeactivatePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PIPELINE = OperationModel.new(
        name: "DeletePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_OBJECTS = OperationModel.new(
        name: "DescribeObjects",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PIPELINES = OperationModel.new(
        name: "DescribePipelines",
        http_method: "POST",
        request_uri: "/"
      )

      EVALUATE_EXPRESSION = OperationModel.new(
        name: "EvaluateExpression",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PIPELINE_DEFINITION = OperationModel.new(
        name: "GetPipelineDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PIPELINES = OperationModel.new(
        name: "ListPipelines",
        http_method: "POST",
        request_uri: "/"
      )

      POLL_FOR_TASK = OperationModel.new(
        name: "PollForTask",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PIPELINE_DEFINITION = OperationModel.new(
        name: "PutPipelineDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      QUERY_OBJECTS = OperationModel.new(
        name: "QueryObjects",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS = OperationModel.new(
        name: "RemoveTags",
        http_method: "POST",
        request_uri: "/"
      )

      REPORT_TASK_PROGRESS = OperationModel.new(
        name: "ReportTaskProgress",
        http_method: "POST",
        request_uri: "/"
      )

      REPORT_TASK_RUNNER_HEARTBEAT = OperationModel.new(
        name: "ReportTaskRunnerHeartbeat",
        http_method: "POST",
        request_uri: "/"
      )

      SET_STATUS = OperationModel.new(
        name: "SetStatus",
        http_method: "POST",
        request_uri: "/"
      )

      SET_TASK_STATUS = OperationModel.new(
        name: "SetTaskStatus",
        http_method: "POST",
        request_uri: "/"
      )

      VALIDATE_PIPELINE_DEFINITION = OperationModel.new(
        name: "ValidatePipelineDefinition",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
