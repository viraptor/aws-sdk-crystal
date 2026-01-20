module Aws
  module CodeCatalyst
    module Model
      API_VERSION = "2022-09-28"
      TARGET_PREFIX = ""
      SIGNING_NAME = "codecatalyst"
      ENDPOINT_PREFIX = "codecatalyst"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"not","argv":[{"fn":"isSet","argv":[{"ref":"Region"}]}]},{"fn":"aws.partition","argv":["us-west-2"],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},false]}],"error":"Partition does not support FIPS.","type":"error"},{"conditions":[],"endpoint":{"url":"https://codecatalyst-fips.global.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codecatalyst.global.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]},{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},false]}],"error":"Partition does not support FIPS.","type":"error"},{"conditions":[],"endpoint":{"url":"https://codecatalyst-fips.global.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codecatalyst.global.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ACCESS_TOKEN = OperationModel.new(
        name: "CreateAccessToken",
        http_method: "PUT",
        request_uri: "/v1/accessTokens"
      )

      CREATE_DEV_ENVIRONMENT = OperationModel.new(
        name: "CreateDevEnvironment",
        http_method: "PUT",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/devEnvironments"
      )

      CREATE_PROJECT = OperationModel.new(
        name: "CreateProject",
        http_method: "PUT",
        request_uri: "/v1/spaces/{spaceName}/projects"
      )

      CREATE_SOURCE_REPOSITORY = OperationModel.new(
        name: "CreateSourceRepository",
        http_method: "PUT",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/sourceRepositories/{name}"
      )

      CREATE_SOURCE_REPOSITORY_BRANCH = OperationModel.new(
        name: "CreateSourceRepositoryBranch",
        http_method: "PUT",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/sourceRepositories/{sourceRepositoryName}/branches/{name}"
      )

      DELETE_ACCESS_TOKEN = OperationModel.new(
        name: "DeleteAccessToken",
        http_method: "DELETE",
        request_uri: "/v1/accessTokens/{id}"
      )

      DELETE_DEV_ENVIRONMENT = OperationModel.new(
        name: "DeleteDevEnvironment",
        http_method: "DELETE",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/devEnvironments/{id}"
      )

      DELETE_PROJECT = OperationModel.new(
        name: "DeleteProject",
        http_method: "DELETE",
        request_uri: "/v1/spaces/{spaceName}/projects/{name}"
      )

      DELETE_SOURCE_REPOSITORY = OperationModel.new(
        name: "DeleteSourceRepository",
        http_method: "DELETE",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/sourceRepositories/{name}"
      )

      DELETE_SPACE = OperationModel.new(
        name: "DeleteSpace",
        http_method: "DELETE",
        request_uri: "/v1/spaces/{name}"
      )

      GET_DEV_ENVIRONMENT = OperationModel.new(
        name: "GetDevEnvironment",
        http_method: "GET",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/devEnvironments/{id}"
      )

      GET_PROJECT = OperationModel.new(
        name: "GetProject",
        http_method: "GET",
        request_uri: "/v1/spaces/{spaceName}/projects/{name}"
      )

      GET_SOURCE_REPOSITORY = OperationModel.new(
        name: "GetSourceRepository",
        http_method: "GET",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/sourceRepositories/{name}"
      )

      GET_SOURCE_REPOSITORY_CLONE_URLS = OperationModel.new(
        name: "GetSourceRepositoryCloneUrls",
        http_method: "GET",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/sourceRepositories/{sourceRepositoryName}/cloneUrls"
      )

      GET_SPACE = OperationModel.new(
        name: "GetSpace",
        http_method: "GET",
        request_uri: "/v1/spaces/{name}"
      )

      GET_SUBSCRIPTION = OperationModel.new(
        name: "GetSubscription",
        http_method: "GET",
        request_uri: "/v1/spaces/{spaceName}/subscription"
      )

      GET_USER_DETAILS = OperationModel.new(
        name: "GetUserDetails",
        http_method: "GET",
        request_uri: "/userDetails"
      )

      GET_WORKFLOW = OperationModel.new(
        name: "GetWorkflow",
        http_method: "GET",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/workflows/{id}"
      )

      GET_WORKFLOW_RUN = OperationModel.new(
        name: "GetWorkflowRun",
        http_method: "GET",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/workflowRuns/{id}"
      )

      LIST_ACCESS_TOKENS = OperationModel.new(
        name: "ListAccessTokens",
        http_method: "POST",
        request_uri: "/v1/accessTokens"
      )

      LIST_DEV_ENVIRONMENT_SESSIONS = OperationModel.new(
        name: "ListDevEnvironmentSessions",
        http_method: "POST",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/devEnvironments/{devEnvironmentId}/sessions"
      )

      LIST_DEV_ENVIRONMENTS = OperationModel.new(
        name: "ListDevEnvironments",
        http_method: "POST",
        request_uri: "/v1/spaces/{spaceName}/devEnvironments"
      )

      LIST_EVENT_LOGS = OperationModel.new(
        name: "ListEventLogs",
        http_method: "POST",
        request_uri: "/v1/spaces/{spaceName}/eventLogs"
      )

      LIST_PROJECTS = OperationModel.new(
        name: "ListProjects",
        http_method: "POST",
        request_uri: "/v1/spaces/{spaceName}/projects"
      )

      LIST_SOURCE_REPOSITORIES = OperationModel.new(
        name: "ListSourceRepositories",
        http_method: "POST",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/sourceRepositories"
      )

      LIST_SOURCE_REPOSITORY_BRANCHES = OperationModel.new(
        name: "ListSourceRepositoryBranches",
        http_method: "POST",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/sourceRepositories/{sourceRepositoryName}/branches"
      )

      LIST_SPACES = OperationModel.new(
        name: "ListSpaces",
        http_method: "POST",
        request_uri: "/v1/spaces"
      )

      LIST_WORKFLOW_RUNS = OperationModel.new(
        name: "ListWorkflowRuns",
        http_method: "POST",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/workflowRuns"
      )

      LIST_WORKFLOWS = OperationModel.new(
        name: "ListWorkflows",
        http_method: "POST",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/workflows"
      )

      START_DEV_ENVIRONMENT = OperationModel.new(
        name: "StartDevEnvironment",
        http_method: "PUT",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/devEnvironments/{id}/start"
      )

      START_DEV_ENVIRONMENT_SESSION = OperationModel.new(
        name: "StartDevEnvironmentSession",
        http_method: "PUT",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/devEnvironments/{id}/session"
      )

      START_WORKFLOW_RUN = OperationModel.new(
        name: "StartWorkflowRun",
        http_method: "PUT",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/workflowRuns"
      )

      STOP_DEV_ENVIRONMENT = OperationModel.new(
        name: "StopDevEnvironment",
        http_method: "PUT",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/devEnvironments/{id}/stop"
      )

      STOP_DEV_ENVIRONMENT_SESSION = OperationModel.new(
        name: "StopDevEnvironmentSession",
        http_method: "DELETE",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/devEnvironments/{id}/session/{sessionId}"
      )

      UPDATE_DEV_ENVIRONMENT = OperationModel.new(
        name: "UpdateDevEnvironment",
        http_method: "PATCH",
        request_uri: "/v1/spaces/{spaceName}/projects/{projectName}/devEnvironments/{id}"
      )

      UPDATE_PROJECT = OperationModel.new(
        name: "UpdateProject",
        http_method: "PATCH",
        request_uri: "/v1/spaces/{spaceName}/projects/{name}"
      )

      UPDATE_SPACE = OperationModel.new(
        name: "UpdateSpace",
        http_method: "PATCH",
        request_uri: "/v1/spaces/{name}"
      )

      VERIFY_SESSION = OperationModel.new(
        name: "VerifySession",
        http_method: "GET",
        request_uri: "/session"
      )
    end
  end
end
