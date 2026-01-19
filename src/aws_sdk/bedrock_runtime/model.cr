module AwsSdk
  module BedrockRuntime
    module Model
      API_VERSION = "2023-09-30"
      TARGET_PREFIX = ""
      SIGNING_NAME = "bedrock"
      ENDPOINT_PREFIX = "bedrock-runtime"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-runtime-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-runtime-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-runtime.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-runtime.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      APPLY_GUARDRAIL = OperationModel.new(
        name: "ApplyGuardrail",
        http_method: "POST",
        request_uri: "/guardrail/{guardrailIdentifier}/version/{guardrailVersion}/apply"
      )

      CONVERSE = OperationModel.new(
        name: "Converse",
        http_method: "POST",
        request_uri: "/model/{modelId}/converse"
      )

      CONVERSE_STREAM = OperationModel.new(
        name: "ConverseStream",
        http_method: "POST",
        request_uri: "/model/{modelId}/converse-stream"
      )

      COUNT_TOKENS = OperationModel.new(
        name: "CountTokens",
        http_method: "POST",
        request_uri: "/model/{modelId}/count-tokens"
      )

      GET_ASYNC_INVOKE = OperationModel.new(
        name: "GetAsyncInvoke",
        http_method: "GET",
        request_uri: "/async-invoke/{invocationArn}"
      )

      INVOKE_MODEL = OperationModel.new(
        name: "InvokeModel",
        http_method: "POST",
        request_uri: "/model/{modelId}/invoke"
      )

      INVOKE_MODEL_WITH_BIDIRECTIONAL_STREAM = OperationModel.new(
        name: "InvokeModelWithBidirectionalStream",
        http_method: "POST",
        request_uri: "/model/{modelId}/invoke-with-bidirectional-stream"
      )

      INVOKE_MODEL_WITH_RESPONSE_STREAM = OperationModel.new(
        name: "InvokeModelWithResponseStream",
        http_method: "POST",
        request_uri: "/model/{modelId}/invoke-with-response-stream"
      )

      LIST_ASYNC_INVOKES = OperationModel.new(
        name: "ListAsyncInvokes",
        http_method: "GET",
        request_uri: "/async-invoke"
      )

      START_ASYNC_INVOKE = OperationModel.new(
        name: "StartAsyncInvoke",
        http_method: "POST",
        request_uri: "/async-invoke"
      )
    end
  end
end
