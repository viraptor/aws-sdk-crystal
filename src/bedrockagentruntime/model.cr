module Aws
  module BedrockAgentRuntime
    module Model
      API_VERSION = "2023-07-26"
      TARGET_PREFIX = ""
      SIGNING_NAME = "bedrock"
      ENDPOINT_PREFIX = "bedrock-agent-runtime"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agent-runtime-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agent-runtime-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agent-runtime.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agent-runtime.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_INVOCATION = OperationModel.new(
        name: "CreateInvocation",
        http_method: "PUT",
        request_uri: "/sessions/{sessionIdentifier}/invocations/"
      )

      CREATE_SESSION = OperationModel.new(
        name: "CreateSession",
        http_method: "PUT",
        request_uri: "/sessions/"
      )

      DELETE_AGENT_MEMORY = OperationModel.new(
        name: "DeleteAgentMemory",
        http_method: "DELETE",
        request_uri: "/agents/{agentId}/agentAliases/{agentAliasId}/memories"
      )

      DELETE_SESSION = OperationModel.new(
        name: "DeleteSession",
        http_method: "DELETE",
        request_uri: "/sessions/{sessionIdentifier}/"
      )

      END_SESSION = OperationModel.new(
        name: "EndSession",
        http_method: "PATCH",
        request_uri: "/sessions/{sessionIdentifier}"
      )

      GENERATE_QUERY = OperationModel.new(
        name: "GenerateQuery",
        http_method: "POST",
        request_uri: "/generateQuery"
      )

      GET_AGENT_MEMORY = OperationModel.new(
        name: "GetAgentMemory",
        http_method: "GET",
        request_uri: "/agents/{agentId}/agentAliases/{agentAliasId}/memories"
      )

      GET_EXECUTION_FLOW_SNAPSHOT = OperationModel.new(
        name: "GetExecutionFlowSnapshot",
        http_method: "GET",
        request_uri: "/flows/{flowIdentifier}/aliases/{flowAliasIdentifier}/executions/{executionIdentifier}/flowsnapshot"
      )

      GET_FLOW_EXECUTION = OperationModel.new(
        name: "GetFlowExecution",
        http_method: "GET",
        request_uri: "/flows/{flowIdentifier}/aliases/{flowAliasIdentifier}/executions/{executionIdentifier}"
      )

      GET_INVOCATION_STEP = OperationModel.new(
        name: "GetInvocationStep",
        http_method: "POST",
        request_uri: "/sessions/{sessionIdentifier}/invocationSteps/{invocationStepId}"
      )

      GET_SESSION = OperationModel.new(
        name: "GetSession",
        http_method: "GET",
        request_uri: "/sessions/{sessionIdentifier}/"
      )

      INVOKE_AGENT = OperationModel.new(
        name: "InvokeAgent",
        http_method: "POST",
        request_uri: "/agents/{agentId}/agentAliases/{agentAliasId}/sessions/{sessionId}/text"
      )

      INVOKE_FLOW = OperationModel.new(
        name: "InvokeFlow",
        http_method: "POST",
        request_uri: "/flows/{flowIdentifier}/aliases/{flowAliasIdentifier}"
      )

      INVOKE_INLINE_AGENT = OperationModel.new(
        name: "InvokeInlineAgent",
        http_method: "POST",
        request_uri: "/agents/{sessionId}"
      )

      LIST_FLOW_EXECUTION_EVENTS = OperationModel.new(
        name: "ListFlowExecutionEvents",
        http_method: "GET",
        request_uri: "/flows/{flowIdentifier}/aliases/{flowAliasIdentifier}/executions/{executionIdentifier}/events"
      )

      LIST_FLOW_EXECUTIONS = OperationModel.new(
        name: "ListFlowExecutions",
        http_method: "GET",
        request_uri: "/flows/{flowIdentifier}/executions"
      )

      LIST_INVOCATION_STEPS = OperationModel.new(
        name: "ListInvocationSteps",
        http_method: "POST",
        request_uri: "/sessions/{sessionIdentifier}/invocationSteps/"
      )

      LIST_INVOCATIONS = OperationModel.new(
        name: "ListInvocations",
        http_method: "POST",
        request_uri: "/sessions/{sessionIdentifier}/invocations/"
      )

      LIST_SESSIONS = OperationModel.new(
        name: "ListSessions",
        http_method: "POST",
        request_uri: "/sessions/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      OPTIMIZE_PROMPT = OperationModel.new(
        name: "OptimizePrompt",
        http_method: "POST",
        request_uri: "/optimize-prompt"
      )

      PUT_INVOCATION_STEP = OperationModel.new(
        name: "PutInvocationStep",
        http_method: "PUT",
        request_uri: "/sessions/{sessionIdentifier}/invocationSteps/"
      )

      RERANK = OperationModel.new(
        name: "Rerank",
        http_method: "POST",
        request_uri: "/rerank"
      )

      RETRIEVE = OperationModel.new(
        name: "Retrieve",
        http_method: "POST",
        request_uri: "/knowledgebases/{knowledgeBaseId}/retrieve"
      )

      RETRIEVE_AND_GENERATE = OperationModel.new(
        name: "RetrieveAndGenerate",
        http_method: "POST",
        request_uri: "/retrieveAndGenerate"
      )

      RETRIEVE_AND_GENERATE_STREAM = OperationModel.new(
        name: "RetrieveAndGenerateStream",
        http_method: "POST",
        request_uri: "/retrieveAndGenerateStream"
      )

      START_FLOW_EXECUTION = OperationModel.new(
        name: "StartFlowExecution",
        http_method: "POST",
        request_uri: "/flows/{flowIdentifier}/aliases/{flowAliasIdentifier}/executions"
      )

      STOP_FLOW_EXECUTION = OperationModel.new(
        name: "StopFlowExecution",
        http_method: "POST",
        request_uri: "/flows/{flowIdentifier}/aliases/{flowAliasIdentifier}/executions/{executionIdentifier}/stop"
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

      UPDATE_SESSION = OperationModel.new(
        name: "UpdateSession",
        http_method: "PUT",
        request_uri: "/sessions/{sessionIdentifier}/"
      )
    end
  end
end
