module Aws
  module MWAAServerless
    module Model
      API_VERSION = "2024-07-26"
      TARGET_PREFIX = "AmazonMWAAServerless"
      SIGNING_NAME = "airflow-serverless"
      ENDPOINT_PREFIX = "airflow-serverless"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://airflow-serverless-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://airflow-serverless.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_WORKFLOW = OperationModel.new(
        name: "CreateWorkflow",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKFLOW = OperationModel.new(
        name: "DeleteWorkflow",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TASK_INSTANCE = OperationModel.new(
        name: "GetTaskInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKFLOW = OperationModel.new(
        name: "GetWorkflow",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKFLOW_RUN = OperationModel.new(
        name: "GetWorkflowRun",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TASK_INSTANCES = OperationModel.new(
        name: "ListTaskInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKFLOW_RUNS = OperationModel.new(
        name: "ListWorkflowRuns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKFLOW_VERSIONS = OperationModel.new(
        name: "ListWorkflowVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKFLOWS = OperationModel.new(
        name: "ListWorkflows",
        http_method: "POST",
        request_uri: "/"
      )

      START_WORKFLOW_RUN = OperationModel.new(
        name: "StartWorkflowRun",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_WORKFLOW_RUN = OperationModel.new(
        name: "StopWorkflowRun",
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

      UPDATE_WORKFLOW = OperationModel.new(
        name: "UpdateWorkflow",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
