module Aws
  module Amplify
    module Model
      API_VERSION = "2017-07-25"
      TARGET_PREFIX = ""
      SIGNING_NAME = "amplify"
      ENDPOINT_PREFIX = "amplify"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://amplify-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://amplify-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://amplify.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://amplify.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_APP = OperationModel.new(
        name: "CreateApp",
        http_method: "POST",
        request_uri: "/apps"
      )

      CREATE_BACKEND_ENVIRONMENT = OperationModel.new(
        name: "CreateBackendEnvironment",
        http_method: "POST",
        request_uri: "/apps/{appId}/backendenvironments"
      )

      CREATE_BRANCH = OperationModel.new(
        name: "CreateBranch",
        http_method: "POST",
        request_uri: "/apps/{appId}/branches"
      )

      CREATE_DEPLOYMENT = OperationModel.new(
        name: "CreateDeployment",
        http_method: "POST",
        request_uri: "/apps/{appId}/branches/{branchName}/deployments"
      )

      CREATE_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "CreateDomainAssociation",
        http_method: "POST",
        request_uri: "/apps/{appId}/domains"
      )

      CREATE_WEBHOOK = OperationModel.new(
        name: "CreateWebhook",
        http_method: "POST",
        request_uri: "/apps/{appId}/webhooks"
      )

      DELETE_APP = OperationModel.new(
        name: "DeleteApp",
        http_method: "DELETE",
        request_uri: "/apps/{appId}"
      )

      DELETE_BACKEND_ENVIRONMENT = OperationModel.new(
        name: "DeleteBackendEnvironment",
        http_method: "DELETE",
        request_uri: "/apps/{appId}/backendenvironments/{environmentName}"
      )

      DELETE_BRANCH = OperationModel.new(
        name: "DeleteBranch",
        http_method: "DELETE",
        request_uri: "/apps/{appId}/branches/{branchName}"
      )

      DELETE_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "DeleteDomainAssociation",
        http_method: "DELETE",
        request_uri: "/apps/{appId}/domains/{domainName}"
      )

      DELETE_JOB = OperationModel.new(
        name: "DeleteJob",
        http_method: "DELETE",
        request_uri: "/apps/{appId}/branches/{branchName}/jobs/{jobId}"
      )

      DELETE_WEBHOOK = OperationModel.new(
        name: "DeleteWebhook",
        http_method: "DELETE",
        request_uri: "/webhooks/{webhookId}"
      )

      GENERATE_ACCESS_LOGS = OperationModel.new(
        name: "GenerateAccessLogs",
        http_method: "POST",
        request_uri: "/apps/{appId}/accesslogs"
      )

      GET_APP = OperationModel.new(
        name: "GetApp",
        http_method: "GET",
        request_uri: "/apps/{appId}"
      )

      GET_ARTIFACT_URL = OperationModel.new(
        name: "GetArtifactUrl",
        http_method: "GET",
        request_uri: "/artifacts/{artifactId}"
      )

      GET_BACKEND_ENVIRONMENT = OperationModel.new(
        name: "GetBackendEnvironment",
        http_method: "GET",
        request_uri: "/apps/{appId}/backendenvironments/{environmentName}"
      )

      GET_BRANCH = OperationModel.new(
        name: "GetBranch",
        http_method: "GET",
        request_uri: "/apps/{appId}/branches/{branchName}"
      )

      GET_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "GetDomainAssociation",
        http_method: "GET",
        request_uri: "/apps/{appId}/domains/{domainName}"
      )

      GET_JOB = OperationModel.new(
        name: "GetJob",
        http_method: "GET",
        request_uri: "/apps/{appId}/branches/{branchName}/jobs/{jobId}"
      )

      GET_WEBHOOK = OperationModel.new(
        name: "GetWebhook",
        http_method: "GET",
        request_uri: "/webhooks/{webhookId}"
      )

      LIST_APPS = OperationModel.new(
        name: "ListApps",
        http_method: "GET",
        request_uri: "/apps"
      )

      LIST_ARTIFACTS = OperationModel.new(
        name: "ListArtifacts",
        http_method: "GET",
        request_uri: "/apps/{appId}/branches/{branchName}/jobs/{jobId}/artifacts"
      )

      LIST_BACKEND_ENVIRONMENTS = OperationModel.new(
        name: "ListBackendEnvironments",
        http_method: "GET",
        request_uri: "/apps/{appId}/backendenvironments"
      )

      LIST_BRANCHES = OperationModel.new(
        name: "ListBranches",
        http_method: "GET",
        request_uri: "/apps/{appId}/branches"
      )

      LIST_DOMAIN_ASSOCIATIONS = OperationModel.new(
        name: "ListDomainAssociations",
        http_method: "GET",
        request_uri: "/apps/{appId}/domains"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "GET",
        request_uri: "/apps/{appId}/branches/{branchName}/jobs"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_WEBHOOKS = OperationModel.new(
        name: "ListWebhooks",
        http_method: "GET",
        request_uri: "/apps/{appId}/webhooks"
      )

      START_DEPLOYMENT = OperationModel.new(
        name: "StartDeployment",
        http_method: "POST",
        request_uri: "/apps/{appId}/branches/{branchName}/deployments/start"
      )

      START_JOB = OperationModel.new(
        name: "StartJob",
        http_method: "POST",
        request_uri: "/apps/{appId}/branches/{branchName}/jobs"
      )

      STOP_JOB = OperationModel.new(
        name: "StopJob",
        http_method: "DELETE",
        request_uri: "/apps/{appId}/branches/{branchName}/jobs/{jobId}/stop"
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

      UPDATE_APP = OperationModel.new(
        name: "UpdateApp",
        http_method: "POST",
        request_uri: "/apps/{appId}"
      )

      UPDATE_BRANCH = OperationModel.new(
        name: "UpdateBranch",
        http_method: "POST",
        request_uri: "/apps/{appId}/branches/{branchName}"
      )

      UPDATE_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "UpdateDomainAssociation",
        http_method: "POST",
        request_uri: "/apps/{appId}/domains/{domainName}"
      )

      UPDATE_WEBHOOK = OperationModel.new(
        name: "UpdateWebhook",
        http_method: "POST",
        request_uri: "/webhooks/{webhookId}"
      )
    end
  end
end
