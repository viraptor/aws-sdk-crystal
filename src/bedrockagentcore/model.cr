module Aws
  module BedrockAgentCore
    module Model
      API_VERSION = "2024-02-28"
      TARGET_PREFIX = ""
      SIGNING_NAME = "bedrock-agentcore"
      ENDPOINT_PREFIX = "bedrock-agentcore"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agentcore-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agentcore-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agentcore.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agentcore.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CREATE_MEMORY_RECORDS = OperationModel.new(
        name: "BatchCreateMemoryRecords",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/memoryRecords/batchCreate"
      )

      BATCH_DELETE_MEMORY_RECORDS = OperationModel.new(
        name: "BatchDeleteMemoryRecords",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/memoryRecords/batchDelete"
      )

      BATCH_UPDATE_MEMORY_RECORDS = OperationModel.new(
        name: "BatchUpdateMemoryRecords",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/memoryRecords/batchUpdate"
      )

      COMPLETE_RESOURCE_TOKEN_AUTH = OperationModel.new(
        name: "CompleteResourceTokenAuth",
        http_method: "POST",
        request_uri: "/identities/CompleteResourceTokenAuth"
      )

      CREATE_EVENT = OperationModel.new(
        name: "CreateEvent",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/events"
      )

      DELETE_EVENT = OperationModel.new(
        name: "DeleteEvent",
        http_method: "DELETE",
        request_uri: "/memories/{memoryId}/actor/{actorId}/sessions/{sessionId}/events/{eventId}"
      )

      DELETE_MEMORY_RECORD = OperationModel.new(
        name: "DeleteMemoryRecord",
        http_method: "DELETE",
        request_uri: "/memories/{memoryId}/memoryRecords/{memoryRecordId}"
      )

      EVALUATE = OperationModel.new(
        name: "Evaluate",
        http_method: "POST",
        request_uri: "/evaluations/evaluate/{evaluatorId}"
      )

      GET_AGENT_CARD = OperationModel.new(
        name: "GetAgentCard",
        http_method: "GET",
        request_uri: "/runtimes/{agentRuntimeArn}/invocations/.well-known/agent-card.json"
      )

      GET_BROWSER_SESSION = OperationModel.new(
        name: "GetBrowserSession",
        http_method: "GET",
        request_uri: "/browsers/{browserIdentifier}/sessions/get"
      )

      GET_CODE_INTERPRETER_SESSION = OperationModel.new(
        name: "GetCodeInterpreterSession",
        http_method: "GET",
        request_uri: "/code-interpreters/{codeInterpreterIdentifier}/sessions/get"
      )

      GET_EVENT = OperationModel.new(
        name: "GetEvent",
        http_method: "GET",
        request_uri: "/memories/{memoryId}/actor/{actorId}/sessions/{sessionId}/events/{eventId}"
      )

      GET_MEMORY_RECORD = OperationModel.new(
        name: "GetMemoryRecord",
        http_method: "GET",
        request_uri: "/memories/{memoryId}/memoryRecord/{memoryRecordId}"
      )

      GET_RESOURCE_API_KEY = OperationModel.new(
        name: "GetResourceApiKey",
        http_method: "POST",
        request_uri: "/identities/api-key"
      )

      GET_RESOURCE_OAUTH2_TOKEN = OperationModel.new(
        name: "GetResourceOauth2Token",
        http_method: "POST",
        request_uri: "/identities/oauth2/token"
      )

      GET_WORKLOAD_ACCESS_TOKEN = OperationModel.new(
        name: "GetWorkloadAccessToken",
        http_method: "POST",
        request_uri: "/identities/GetWorkloadAccessToken"
      )

      GET_WORKLOAD_ACCESS_TOKEN_FOR_JWT = OperationModel.new(
        name: "GetWorkloadAccessTokenForJWT",
        http_method: "POST",
        request_uri: "/identities/GetWorkloadAccessTokenForJWT"
      )

      GET_WORKLOAD_ACCESS_TOKEN_FOR_USER_ID = OperationModel.new(
        name: "GetWorkloadAccessTokenForUserId",
        http_method: "POST",
        request_uri: "/identities/GetWorkloadAccessTokenForUserId"
      )

      INVOKE_AGENT_RUNTIME = OperationModel.new(
        name: "InvokeAgentRuntime",
        http_method: "POST",
        request_uri: "/runtimes/{agentRuntimeArn}/invocations"
      )

      INVOKE_CODE_INTERPRETER = OperationModel.new(
        name: "InvokeCodeInterpreter",
        http_method: "POST",
        request_uri: "/code-interpreters/{codeInterpreterIdentifier}/tools/invoke"
      )

      LIST_ACTORS = OperationModel.new(
        name: "ListActors",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/actors"
      )

      LIST_BROWSER_SESSIONS = OperationModel.new(
        name: "ListBrowserSessions",
        http_method: "POST",
        request_uri: "/browsers/{browserIdentifier}/sessions/list"
      )

      LIST_CODE_INTERPRETER_SESSIONS = OperationModel.new(
        name: "ListCodeInterpreterSessions",
        http_method: "POST",
        request_uri: "/code-interpreters/{codeInterpreterIdentifier}/sessions/list"
      )

      LIST_EVENTS = OperationModel.new(
        name: "ListEvents",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/actor/{actorId}/sessions/{sessionId}"
      )

      LIST_MEMORY_EXTRACTION_JOBS = OperationModel.new(
        name: "ListMemoryExtractionJobs",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/extractionJobs"
      )

      LIST_MEMORY_RECORDS = OperationModel.new(
        name: "ListMemoryRecords",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/memoryRecords"
      )

      LIST_SESSIONS = OperationModel.new(
        name: "ListSessions",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/actor/{actorId}/sessions"
      )

      RETRIEVE_MEMORY_RECORDS = OperationModel.new(
        name: "RetrieveMemoryRecords",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/retrieve"
      )

      START_BROWSER_SESSION = OperationModel.new(
        name: "StartBrowserSession",
        http_method: "PUT",
        request_uri: "/browsers/{browserIdentifier}/sessions/start"
      )

      START_CODE_INTERPRETER_SESSION = OperationModel.new(
        name: "StartCodeInterpreterSession",
        http_method: "PUT",
        request_uri: "/code-interpreters/{codeInterpreterIdentifier}/sessions/start"
      )

      START_MEMORY_EXTRACTION_JOB = OperationModel.new(
        name: "StartMemoryExtractionJob",
        http_method: "POST",
        request_uri: "/memories/{memoryId}/extractionJobs/start"
      )

      STOP_BROWSER_SESSION = OperationModel.new(
        name: "StopBrowserSession",
        http_method: "PUT",
        request_uri: "/browsers/{browserIdentifier}/sessions/stop"
      )

      STOP_CODE_INTERPRETER_SESSION = OperationModel.new(
        name: "StopCodeInterpreterSession",
        http_method: "PUT",
        request_uri: "/code-interpreters/{codeInterpreterIdentifier}/sessions/stop"
      )

      STOP_RUNTIME_SESSION = OperationModel.new(
        name: "StopRuntimeSession",
        http_method: "POST",
        request_uri: "/runtimes/{agentRuntimeArn}/stopruntimesession"
      )

      UPDATE_BROWSER_STREAM = OperationModel.new(
        name: "UpdateBrowserStream",
        http_method: "PUT",
        request_uri: "/browsers/{browserIdentifier}/sessions/streams/update"
      )
    end
  end
end
