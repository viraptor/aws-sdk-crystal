module Aws
  module AmplifyBackend
    module Model
      API_VERSION = "2020-08-11"
      TARGET_PREFIX = ""
      SIGNING_NAME = "amplifybackend"
      ENDPOINT_PREFIX = "amplifybackend"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://amplifybackend-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://amplifybackend-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://amplifybackend.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://amplifybackend.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CLONE_BACKEND = OperationModel.new(
        name: "CloneBackend",
        http_method: "POST",
        request_uri: "/backend/{appId}/environments/{backendEnvironmentName}/clone"
      )

      CREATE_BACKEND = OperationModel.new(
        name: "CreateBackend",
        http_method: "POST",
        request_uri: "/backend"
      )

      CREATE_BACKEND_API = OperationModel.new(
        name: "CreateBackendAPI",
        http_method: "POST",
        request_uri: "/backend/{appId}/api"
      )

      CREATE_BACKEND_AUTH = OperationModel.new(
        name: "CreateBackendAuth",
        http_method: "POST",
        request_uri: "/backend/{appId}/auth"
      )

      CREATE_BACKEND_CONFIG = OperationModel.new(
        name: "CreateBackendConfig",
        http_method: "POST",
        request_uri: "/backend/{appId}/config"
      )

      CREATE_BACKEND_STORAGE = OperationModel.new(
        name: "CreateBackendStorage",
        http_method: "POST",
        request_uri: "/backend/{appId}/storage"
      )

      CREATE_TOKEN = OperationModel.new(
        name: "CreateToken",
        http_method: "POST",
        request_uri: "/backend/{appId}/challenge"
      )

      DELETE_BACKEND = OperationModel.new(
        name: "DeleteBackend",
        http_method: "POST",
        request_uri: "/backend/{appId}/environments/{backendEnvironmentName}/remove"
      )

      DELETE_BACKEND_API = OperationModel.new(
        name: "DeleteBackendAPI",
        http_method: "POST",
        request_uri: "/backend/{appId}/api/{backendEnvironmentName}/remove"
      )

      DELETE_BACKEND_AUTH = OperationModel.new(
        name: "DeleteBackendAuth",
        http_method: "POST",
        request_uri: "/backend/{appId}/auth/{backendEnvironmentName}/remove"
      )

      DELETE_BACKEND_STORAGE = OperationModel.new(
        name: "DeleteBackendStorage",
        http_method: "POST",
        request_uri: "/backend/{appId}/storage/{backendEnvironmentName}/remove"
      )

      DELETE_TOKEN = OperationModel.new(
        name: "DeleteToken",
        http_method: "POST",
        request_uri: "/backend/{appId}/challenge/{sessionId}/remove"
      )

      GENERATE_BACKEND_API_MODELS = OperationModel.new(
        name: "GenerateBackendAPIModels",
        http_method: "POST",
        request_uri: "/backend/{appId}/api/{backendEnvironmentName}/generateModels"
      )

      GET_BACKEND = OperationModel.new(
        name: "GetBackend",
        http_method: "POST",
        request_uri: "/backend/{appId}/details"
      )

      GET_BACKEND_API = OperationModel.new(
        name: "GetBackendAPI",
        http_method: "POST",
        request_uri: "/backend/{appId}/api/{backendEnvironmentName}/details"
      )

      GET_BACKEND_API_MODELS = OperationModel.new(
        name: "GetBackendAPIModels",
        http_method: "POST",
        request_uri: "/backend/{appId}/api/{backendEnvironmentName}/getModels"
      )

      GET_BACKEND_AUTH = OperationModel.new(
        name: "GetBackendAuth",
        http_method: "POST",
        request_uri: "/backend/{appId}/auth/{backendEnvironmentName}/details"
      )

      GET_BACKEND_JOB = OperationModel.new(
        name: "GetBackendJob",
        http_method: "GET",
        request_uri: "/backend/{appId}/job/{backendEnvironmentName}/{jobId}"
      )

      GET_BACKEND_STORAGE = OperationModel.new(
        name: "GetBackendStorage",
        http_method: "POST",
        request_uri: "/backend/{appId}/storage/{backendEnvironmentName}/details"
      )

      GET_TOKEN = OperationModel.new(
        name: "GetToken",
        http_method: "GET",
        request_uri: "/backend/{appId}/challenge/{sessionId}"
      )

      IMPORT_BACKEND_AUTH = OperationModel.new(
        name: "ImportBackendAuth",
        http_method: "POST",
        request_uri: "/backend/{appId}/auth/{backendEnvironmentName}/import"
      )

      IMPORT_BACKEND_STORAGE = OperationModel.new(
        name: "ImportBackendStorage",
        http_method: "POST",
        request_uri: "/backend/{appId}/storage/{backendEnvironmentName}/import"
      )

      LIST_BACKEND_JOBS = OperationModel.new(
        name: "ListBackendJobs",
        http_method: "POST",
        request_uri: "/backend/{appId}/job/{backendEnvironmentName}"
      )

      LIST_S3_BUCKETS = OperationModel.new(
        name: "ListS3Buckets",
        http_method: "POST",
        request_uri: "/s3Buckets"
      )

      REMOVE_ALL_BACKENDS = OperationModel.new(
        name: "RemoveAllBackends",
        http_method: "POST",
        request_uri: "/backend/{appId}/remove"
      )

      REMOVE_BACKEND_CONFIG = OperationModel.new(
        name: "RemoveBackendConfig",
        http_method: "POST",
        request_uri: "/backend/{appId}/config/remove"
      )

      UPDATE_BACKEND_API = OperationModel.new(
        name: "UpdateBackendAPI",
        http_method: "POST",
        request_uri: "/backend/{appId}/api/{backendEnvironmentName}"
      )

      UPDATE_BACKEND_AUTH = OperationModel.new(
        name: "UpdateBackendAuth",
        http_method: "POST",
        request_uri: "/backend/{appId}/auth/{backendEnvironmentName}"
      )

      UPDATE_BACKEND_CONFIG = OperationModel.new(
        name: "UpdateBackendConfig",
        http_method: "POST",
        request_uri: "/backend/{appId}/config/update"
      )

      UPDATE_BACKEND_JOB = OperationModel.new(
        name: "UpdateBackendJob",
        http_method: "POST",
        request_uri: "/backend/{appId}/job/{backendEnvironmentName}/{jobId}"
      )

      UPDATE_BACKEND_STORAGE = OperationModel.new(
        name: "UpdateBackendStorage",
        http_method: "POST",
        request_uri: "/backend/{appId}/storage/{backendEnvironmentName}"
      )
    end
  end
end
