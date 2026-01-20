module AwsSdk
  module EMRServerless
    module Model
      API_VERSION = "2021-07-13"
      TARGET_PREFIX = ""
      SIGNING_NAME = "emr-serverless"
      ENDPOINT_PREFIX = "emr-serverless"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://emr-serverless-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://emr-serverless-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://emr-serverless.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://emr-serverless.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_JOB_RUN = OperationModel.new(
        name: "CancelJobRun",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/jobruns/{jobRunId}"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/applications"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}"
      )

      GET_APPLICATION = OperationModel.new(
        name: "GetApplication",
        http_method: "GET",
        request_uri: "/applications/{applicationId}"
      )

      GET_DASHBOARD_FOR_JOB_RUN = OperationModel.new(
        name: "GetDashboardForJobRun",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/jobruns/{jobRunId}/dashboard"
      )

      GET_JOB_RUN = OperationModel.new(
        name: "GetJobRun",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/jobruns/{jobRunId}"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "GET",
        request_uri: "/applications"
      )

      LIST_JOB_RUN_ATTEMPTS = OperationModel.new(
        name: "ListJobRunAttempts",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/jobruns/{jobRunId}/attempts"
      )

      LIST_JOB_RUNS = OperationModel.new(
        name: "ListJobRuns",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/jobruns"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      START_APPLICATION = OperationModel.new(
        name: "StartApplication",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/start"
      )

      START_JOB_RUN = OperationModel.new(
        name: "StartJobRun",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/jobruns"
      )

      STOP_APPLICATION = OperationModel.new(
        name: "StopApplication",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/stop"
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

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "PATCH",
        request_uri: "/applications/{applicationId}"
      )
    end
  end
end
