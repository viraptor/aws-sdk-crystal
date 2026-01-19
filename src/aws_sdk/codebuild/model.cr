module AwsSdk
  module CodeBuild
    module Model
      API_VERSION = "2016-10-06"
      TARGET_PREFIX = "CodeBuild_20161006"
      SIGNING_NAME = "codebuild"
      ENDPOINT_PREFIX = "codebuild"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codebuild-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codebuild-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codebuild.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codebuild.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_DELETE_BUILDS = OperationModel.new(
        name: "BatchDeleteBuilds",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_BUILD_BATCHES = OperationModel.new(
        name: "BatchGetBuildBatches",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_BUILDS = OperationModel.new(
        name: "BatchGetBuilds",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_COMMAND_EXECUTIONS = OperationModel.new(
        name: "BatchGetCommandExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_FLEETS = OperationModel.new(
        name: "BatchGetFleets",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_PROJECTS = OperationModel.new(
        name: "BatchGetProjects",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_REPORT_GROUPS = OperationModel.new(
        name: "BatchGetReportGroups",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_REPORTS = OperationModel.new(
        name: "BatchGetReports",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_SANDBOXES = OperationModel.new(
        name: "BatchGetSandboxes",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLEET = OperationModel.new(
        name: "CreateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROJECT = OperationModel.new(
        name: "CreateProject",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPORT_GROUP = OperationModel.new(
        name: "CreateReportGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WEBHOOK = OperationModel.new(
        name: "CreateWebhook",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BUILD_BATCH = OperationModel.new(
        name: "DeleteBuildBatch",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLEET = OperationModel.new(
        name: "DeleteFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROJECT = OperationModel.new(
        name: "DeleteProject",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPORT = OperationModel.new(
        name: "DeleteReport",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPORT_GROUP = OperationModel.new(
        name: "DeleteReportGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SOURCE_CREDENTIALS = OperationModel.new(
        name: "DeleteSourceCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WEBHOOK = OperationModel.new(
        name: "DeleteWebhook",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CODE_COVERAGES = OperationModel.new(
        name: "DescribeCodeCoverages",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TEST_CASES = OperationModel.new(
        name: "DescribeTestCases",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPORT_GROUP_TREND = OperationModel.new(
        name: "GetReportGroupTrend",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_SOURCE_CREDENTIALS = OperationModel.new(
        name: "ImportSourceCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      INVALIDATE_PROJECT_CACHE = OperationModel.new(
        name: "InvalidateProjectCache",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BUILD_BATCHES = OperationModel.new(
        name: "ListBuildBatches",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BUILD_BATCHES_FOR_PROJECT = OperationModel.new(
        name: "ListBuildBatchesForProject",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BUILDS = OperationModel.new(
        name: "ListBuilds",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BUILDS_FOR_PROJECT = OperationModel.new(
        name: "ListBuildsForProject",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMMAND_EXECUTIONS_FOR_SANDBOX = OperationModel.new(
        name: "ListCommandExecutionsForSandbox",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CURATED_ENVIRONMENT_IMAGES = OperationModel.new(
        name: "ListCuratedEnvironmentImages",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLEETS = OperationModel.new(
        name: "ListFleets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROJECTS = OperationModel.new(
        name: "ListProjects",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPORT_GROUPS = OperationModel.new(
        name: "ListReportGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPORTS = OperationModel.new(
        name: "ListReports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPORTS_FOR_REPORT_GROUP = OperationModel.new(
        name: "ListReportsForReportGroup",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SANDBOXES = OperationModel.new(
        name: "ListSandboxes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SANDBOXES_FOR_PROJECT = OperationModel.new(
        name: "ListSandboxesForProject",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SHARED_PROJECTS = OperationModel.new(
        name: "ListSharedProjects",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SHARED_REPORT_GROUPS = OperationModel.new(
        name: "ListSharedReportGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SOURCE_CREDENTIALS = OperationModel.new(
        name: "ListSourceCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      RETRY_BUILD = OperationModel.new(
        name: "RetryBuild",
        http_method: "POST",
        request_uri: "/"
      )

      RETRY_BUILD_BATCH = OperationModel.new(
        name: "RetryBuildBatch",
        http_method: "POST",
        request_uri: "/"
      )

      START_BUILD = OperationModel.new(
        name: "StartBuild",
        http_method: "POST",
        request_uri: "/"
      )

      START_BUILD_BATCH = OperationModel.new(
        name: "StartBuildBatch",
        http_method: "POST",
        request_uri: "/"
      )

      START_COMMAND_EXECUTION = OperationModel.new(
        name: "StartCommandExecution",
        http_method: "POST",
        request_uri: "/"
      )

      START_SANDBOX = OperationModel.new(
        name: "StartSandbox",
        http_method: "POST",
        request_uri: "/"
      )

      START_SANDBOX_CONNECTION = OperationModel.new(
        name: "StartSandboxConnection",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_BUILD = OperationModel.new(
        name: "StopBuild",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_BUILD_BATCH = OperationModel.new(
        name: "StopBuildBatch",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_SANDBOX = OperationModel.new(
        name: "StopSandbox",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FLEET = OperationModel.new(
        name: "UpdateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROJECT = OperationModel.new(
        name: "UpdateProject",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROJECT_VISIBILITY = OperationModel.new(
        name: "UpdateProjectVisibility",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REPORT_GROUP = OperationModel.new(
        name: "UpdateReportGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WEBHOOK = OperationModel.new(
        name: "UpdateWebhook",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
