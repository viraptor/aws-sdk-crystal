module AwsSdk
  module Lambda
    module Model
      API_VERSION = "2015-03-31"
      TARGET_PREFIX = ""
      SIGNING_NAME = "lambda"
      ENDPOINT_PREFIX = "lambda"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lambda-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lambda-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lambda.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://lambda.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_LAYER_VERSION_PERMISSION = OperationModel.new(
        name: "AddLayerVersionPermission",
        http_method: "POST",
        request_uri: "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy"
      )

      ADD_PERMISSION = OperationModel.new(
        name: "AddPermission",
        http_method: "POST",
        request_uri: "/2015-03-31/functions/{FunctionName}/policy"
      )

      CHECKPOINT_DURABLE_EXECUTION = OperationModel.new(
        name: "CheckpointDurableExecution",
        http_method: "POST",
        request_uri: "/2025-12-01/durable-executions/{DurableExecutionArn}/checkpoint"
      )

      CREATE_ALIAS = OperationModel.new(
        name: "CreateAlias",
        http_method: "POST",
        request_uri: "/2015-03-31/functions/{FunctionName}/aliases"
      )

      CREATE_CAPACITY_PROVIDER = OperationModel.new(
        name: "CreateCapacityProvider",
        http_method: "POST",
        request_uri: "/2025-11-30/capacity-providers"
      )

      CREATE_CODE_SIGNING_CONFIG = OperationModel.new(
        name: "CreateCodeSigningConfig",
        http_method: "POST",
        request_uri: "/2020-04-22/code-signing-configs"
      )

      CREATE_EVENT_SOURCE_MAPPING = OperationModel.new(
        name: "CreateEventSourceMapping",
        http_method: "POST",
        request_uri: "/2015-03-31/event-source-mappings"
      )

      CREATE_FUNCTION = OperationModel.new(
        name: "CreateFunction",
        http_method: "POST",
        request_uri: "/2015-03-31/functions"
      )

      CREATE_FUNCTION_URL_CONFIG = OperationModel.new(
        name: "CreateFunctionUrlConfig",
        http_method: "POST",
        request_uri: "/2021-10-31/functions/{FunctionName}/url"
      )

      DELETE_ALIAS = OperationModel.new(
        name: "DeleteAlias",
        http_method: "DELETE",
        request_uri: "/2015-03-31/functions/{FunctionName}/aliases/{Name}"
      )

      DELETE_CAPACITY_PROVIDER = OperationModel.new(
        name: "DeleteCapacityProvider",
        http_method: "DELETE",
        request_uri: "/2025-11-30/capacity-providers/{CapacityProviderName}"
      )

      DELETE_CODE_SIGNING_CONFIG = OperationModel.new(
        name: "DeleteCodeSigningConfig",
        http_method: "DELETE",
        request_uri: "/2020-04-22/code-signing-configs/{CodeSigningConfigArn}"
      )

      DELETE_EVENT_SOURCE_MAPPING = OperationModel.new(
        name: "DeleteEventSourceMapping",
        http_method: "DELETE",
        request_uri: "/2015-03-31/event-source-mappings/{UUID}"
      )

      DELETE_FUNCTION = OperationModel.new(
        name: "DeleteFunction",
        http_method: "DELETE",
        request_uri: "/2015-03-31/functions/{FunctionName}"
      )

      DELETE_FUNCTION_CODE_SIGNING_CONFIG = OperationModel.new(
        name: "DeleteFunctionCodeSigningConfig",
        http_method: "DELETE",
        request_uri: "/2020-06-30/functions/{FunctionName}/code-signing-config"
      )

      DELETE_FUNCTION_CONCURRENCY = OperationModel.new(
        name: "DeleteFunctionConcurrency",
        http_method: "DELETE",
        request_uri: "/2017-10-31/functions/{FunctionName}/concurrency"
      )

      DELETE_FUNCTION_EVENT_INVOKE_CONFIG = OperationModel.new(
        name: "DeleteFunctionEventInvokeConfig",
        http_method: "DELETE",
        request_uri: "/2019-09-25/functions/{FunctionName}/event-invoke-config"
      )

      DELETE_FUNCTION_URL_CONFIG = OperationModel.new(
        name: "DeleteFunctionUrlConfig",
        http_method: "DELETE",
        request_uri: "/2021-10-31/functions/{FunctionName}/url"
      )

      DELETE_LAYER_VERSION = OperationModel.new(
        name: "DeleteLayerVersion",
        http_method: "DELETE",
        request_uri: "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}"
      )

      DELETE_PROVISIONED_CONCURRENCY_CONFIG = OperationModel.new(
        name: "DeleteProvisionedConcurrencyConfig",
        http_method: "DELETE",
        request_uri: "/2019-09-30/functions/{FunctionName}/provisioned-concurrency"
      )

      GET_ACCOUNT_SETTINGS = OperationModel.new(
        name: "GetAccountSettings",
        http_method: "GET",
        request_uri: "/2016-08-19/account-settings"
      )

      GET_ALIAS = OperationModel.new(
        name: "GetAlias",
        http_method: "GET",
        request_uri: "/2015-03-31/functions/{FunctionName}/aliases/{Name}"
      )

      GET_CAPACITY_PROVIDER = OperationModel.new(
        name: "GetCapacityProvider",
        http_method: "GET",
        request_uri: "/2025-11-30/capacity-providers/{CapacityProviderName}"
      )

      GET_CODE_SIGNING_CONFIG = OperationModel.new(
        name: "GetCodeSigningConfig",
        http_method: "GET",
        request_uri: "/2020-04-22/code-signing-configs/{CodeSigningConfigArn}"
      )

      GET_DURABLE_EXECUTION = OperationModel.new(
        name: "GetDurableExecution",
        http_method: "GET",
        request_uri: "/2025-12-01/durable-executions/{DurableExecutionArn}"
      )

      GET_DURABLE_EXECUTION_HISTORY = OperationModel.new(
        name: "GetDurableExecutionHistory",
        http_method: "GET",
        request_uri: "/2025-12-01/durable-executions/{DurableExecutionArn}/history"
      )

      GET_DURABLE_EXECUTION_STATE = OperationModel.new(
        name: "GetDurableExecutionState",
        http_method: "GET",
        request_uri: "/2025-12-01/durable-executions/{DurableExecutionArn}/state"
      )

      GET_EVENT_SOURCE_MAPPING = OperationModel.new(
        name: "GetEventSourceMapping",
        http_method: "GET",
        request_uri: "/2015-03-31/event-source-mappings/{UUID}"
      )

      GET_FUNCTION = OperationModel.new(
        name: "GetFunction",
        http_method: "GET",
        request_uri: "/2015-03-31/functions/{FunctionName}"
      )

      GET_FUNCTION_CODE_SIGNING_CONFIG = OperationModel.new(
        name: "GetFunctionCodeSigningConfig",
        http_method: "GET",
        request_uri: "/2020-06-30/functions/{FunctionName}/code-signing-config"
      )

      GET_FUNCTION_CONCURRENCY = OperationModel.new(
        name: "GetFunctionConcurrency",
        http_method: "GET",
        request_uri: "/2019-09-30/functions/{FunctionName}/concurrency"
      )

      GET_FUNCTION_CONFIGURATION = OperationModel.new(
        name: "GetFunctionConfiguration",
        http_method: "GET",
        request_uri: "/2015-03-31/functions/{FunctionName}/configuration"
      )

      GET_FUNCTION_EVENT_INVOKE_CONFIG = OperationModel.new(
        name: "GetFunctionEventInvokeConfig",
        http_method: "GET",
        request_uri: "/2019-09-25/functions/{FunctionName}/event-invoke-config"
      )

      GET_FUNCTION_RECURSION_CONFIG = OperationModel.new(
        name: "GetFunctionRecursionConfig",
        http_method: "GET",
        request_uri: "/2024-08-31/functions/{FunctionName}/recursion-config"
      )

      GET_FUNCTION_SCALING_CONFIG = OperationModel.new(
        name: "GetFunctionScalingConfig",
        http_method: "GET",
        request_uri: "/2025-11-30/functions/{FunctionName}/function-scaling-config"
      )

      GET_FUNCTION_URL_CONFIG = OperationModel.new(
        name: "GetFunctionUrlConfig",
        http_method: "GET",
        request_uri: "/2021-10-31/functions/{FunctionName}/url"
      )

      GET_LAYER_VERSION = OperationModel.new(
        name: "GetLayerVersion",
        http_method: "GET",
        request_uri: "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}"
      )

      GET_LAYER_VERSION_BY_ARN = OperationModel.new(
        name: "GetLayerVersionByArn",
        http_method: "GET",
        request_uri: "/2018-10-31/layers?find=LayerVersion"
      )

      GET_LAYER_VERSION_POLICY = OperationModel.new(
        name: "GetLayerVersionPolicy",
        http_method: "GET",
        request_uri: "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "GET",
        request_uri: "/2015-03-31/functions/{FunctionName}/policy"
      )

      GET_PROVISIONED_CONCURRENCY_CONFIG = OperationModel.new(
        name: "GetProvisionedConcurrencyConfig",
        http_method: "GET",
        request_uri: "/2019-09-30/functions/{FunctionName}/provisioned-concurrency"
      )

      GET_RUNTIME_MANAGEMENT_CONFIG = OperationModel.new(
        name: "GetRuntimeManagementConfig",
        http_method: "GET",
        request_uri: "/2021-07-20/functions/{FunctionName}/runtime-management-config"
      )

      INVOKE = OperationModel.new(
        name: "Invoke",
        http_method: "POST",
        request_uri: "/2015-03-31/functions/{FunctionName}/invocations"
      )

      INVOKE_ASYNC = OperationModel.new(
        name: "InvokeAsync",
        http_method: "POST",
        request_uri: "/2014-11-13/functions/{FunctionName}/invoke-async"
      )

      INVOKE_WITH_RESPONSE_STREAM = OperationModel.new(
        name: "InvokeWithResponseStream",
        http_method: "POST",
        request_uri: "/2021-11-15/functions/{FunctionName}/response-streaming-invocations"
      )

      LIST_ALIASES = OperationModel.new(
        name: "ListAliases",
        http_method: "GET",
        request_uri: "/2015-03-31/functions/{FunctionName}/aliases"
      )

      LIST_CAPACITY_PROVIDERS = OperationModel.new(
        name: "ListCapacityProviders",
        http_method: "GET",
        request_uri: "/2025-11-30/capacity-providers"
      )

      LIST_CODE_SIGNING_CONFIGS = OperationModel.new(
        name: "ListCodeSigningConfigs",
        http_method: "GET",
        request_uri: "/2020-04-22/code-signing-configs"
      )

      LIST_DURABLE_EXECUTIONS_BY_FUNCTION = OperationModel.new(
        name: "ListDurableExecutionsByFunction",
        http_method: "GET",
        request_uri: "/2025-12-01/functions/{FunctionName}/durable-executions"
      )

      LIST_EVENT_SOURCE_MAPPINGS = OperationModel.new(
        name: "ListEventSourceMappings",
        http_method: "GET",
        request_uri: "/2015-03-31/event-source-mappings"
      )

      LIST_FUNCTION_EVENT_INVOKE_CONFIGS = OperationModel.new(
        name: "ListFunctionEventInvokeConfigs",
        http_method: "GET",
        request_uri: "/2019-09-25/functions/{FunctionName}/event-invoke-config/list"
      )

      LIST_FUNCTION_URL_CONFIGS = OperationModel.new(
        name: "ListFunctionUrlConfigs",
        http_method: "GET",
        request_uri: "/2021-10-31/functions/{FunctionName}/urls"
      )

      LIST_FUNCTION_VERSIONS_BY_CAPACITY_PROVIDER = OperationModel.new(
        name: "ListFunctionVersionsByCapacityProvider",
        http_method: "GET",
        request_uri: "/2025-11-30/capacity-providers/{CapacityProviderName}/function-versions"
      )

      LIST_FUNCTIONS = OperationModel.new(
        name: "ListFunctions",
        http_method: "GET",
        request_uri: "/2015-03-31/functions"
      )

      LIST_FUNCTIONS_BY_CODE_SIGNING_CONFIG = OperationModel.new(
        name: "ListFunctionsByCodeSigningConfig",
        http_method: "GET",
        request_uri: "/2020-04-22/code-signing-configs/{CodeSigningConfigArn}/functions"
      )

      LIST_LAYER_VERSIONS = OperationModel.new(
        name: "ListLayerVersions",
        http_method: "GET",
        request_uri: "/2018-10-31/layers/{LayerName}/versions"
      )

      LIST_LAYERS = OperationModel.new(
        name: "ListLayers",
        http_method: "GET",
        request_uri: "/2018-10-31/layers"
      )

      LIST_PROVISIONED_CONCURRENCY_CONFIGS = OperationModel.new(
        name: "ListProvisionedConcurrencyConfigs",
        http_method: "GET",
        request_uri: "/2019-09-30/functions/{FunctionName}/provisioned-concurrency?List=ALL"
      )

      LIST_TAGS = OperationModel.new(
        name: "ListTags",
        http_method: "GET",
        request_uri: "/2017-03-31/tags/{Resource}"
      )

      LIST_VERSIONS_BY_FUNCTION = OperationModel.new(
        name: "ListVersionsByFunction",
        http_method: "GET",
        request_uri: "/2015-03-31/functions/{FunctionName}/versions"
      )

      PUBLISH_LAYER_VERSION = OperationModel.new(
        name: "PublishLayerVersion",
        http_method: "POST",
        request_uri: "/2018-10-31/layers/{LayerName}/versions"
      )

      PUBLISH_VERSION = OperationModel.new(
        name: "PublishVersion",
        http_method: "POST",
        request_uri: "/2015-03-31/functions/{FunctionName}/versions"
      )

      PUT_FUNCTION_CODE_SIGNING_CONFIG = OperationModel.new(
        name: "PutFunctionCodeSigningConfig",
        http_method: "PUT",
        request_uri: "/2020-06-30/functions/{FunctionName}/code-signing-config"
      )

      PUT_FUNCTION_CONCURRENCY = OperationModel.new(
        name: "PutFunctionConcurrency",
        http_method: "PUT",
        request_uri: "/2017-10-31/functions/{FunctionName}/concurrency"
      )

      PUT_FUNCTION_EVENT_INVOKE_CONFIG = OperationModel.new(
        name: "PutFunctionEventInvokeConfig",
        http_method: "PUT",
        request_uri: "/2019-09-25/functions/{FunctionName}/event-invoke-config"
      )

      PUT_FUNCTION_RECURSION_CONFIG = OperationModel.new(
        name: "PutFunctionRecursionConfig",
        http_method: "PUT",
        request_uri: "/2024-08-31/functions/{FunctionName}/recursion-config"
      )

      PUT_FUNCTION_SCALING_CONFIG = OperationModel.new(
        name: "PutFunctionScalingConfig",
        http_method: "PUT",
        request_uri: "/2025-11-30/functions/{FunctionName}/function-scaling-config"
      )

      PUT_PROVISIONED_CONCURRENCY_CONFIG = OperationModel.new(
        name: "PutProvisionedConcurrencyConfig",
        http_method: "PUT",
        request_uri: "/2019-09-30/functions/{FunctionName}/provisioned-concurrency"
      )

      PUT_RUNTIME_MANAGEMENT_CONFIG = OperationModel.new(
        name: "PutRuntimeManagementConfig",
        http_method: "PUT",
        request_uri: "/2021-07-20/functions/{FunctionName}/runtime-management-config"
      )

      REMOVE_LAYER_VERSION_PERMISSION = OperationModel.new(
        name: "RemoveLayerVersionPermission",
        http_method: "DELETE",
        request_uri: "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy/{StatementId}"
      )

      REMOVE_PERMISSION = OperationModel.new(
        name: "RemovePermission",
        http_method: "DELETE",
        request_uri: "/2015-03-31/functions/{FunctionName}/policy/{StatementId}"
      )

      SEND_DURABLE_EXECUTION_CALLBACK_FAILURE = OperationModel.new(
        name: "SendDurableExecutionCallbackFailure",
        http_method: "POST",
        request_uri: "/2025-12-01/durable-execution-callbacks/{CallbackId}/fail"
      )

      SEND_DURABLE_EXECUTION_CALLBACK_HEARTBEAT = OperationModel.new(
        name: "SendDurableExecutionCallbackHeartbeat",
        http_method: "POST",
        request_uri: "/2025-12-01/durable-execution-callbacks/{CallbackId}/heartbeat"
      )

      SEND_DURABLE_EXECUTION_CALLBACK_SUCCESS = OperationModel.new(
        name: "SendDurableExecutionCallbackSuccess",
        http_method: "POST",
        request_uri: "/2025-12-01/durable-execution-callbacks/{CallbackId}/succeed"
      )

      STOP_DURABLE_EXECUTION = OperationModel.new(
        name: "StopDurableExecution",
        http_method: "POST",
        request_uri: "/2025-12-01/durable-executions/{DurableExecutionArn}/stop"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/2017-03-31/tags/{Resource}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/2017-03-31/tags/{Resource}"
      )

      UPDATE_ALIAS = OperationModel.new(
        name: "UpdateAlias",
        http_method: "PUT",
        request_uri: "/2015-03-31/functions/{FunctionName}/aliases/{Name}"
      )

      UPDATE_CAPACITY_PROVIDER = OperationModel.new(
        name: "UpdateCapacityProvider",
        http_method: "PUT",
        request_uri: "/2025-11-30/capacity-providers/{CapacityProviderName}"
      )

      UPDATE_CODE_SIGNING_CONFIG = OperationModel.new(
        name: "UpdateCodeSigningConfig",
        http_method: "PUT",
        request_uri: "/2020-04-22/code-signing-configs/{CodeSigningConfigArn}"
      )

      UPDATE_EVENT_SOURCE_MAPPING = OperationModel.new(
        name: "UpdateEventSourceMapping",
        http_method: "PUT",
        request_uri: "/2015-03-31/event-source-mappings/{UUID}"
      )

      UPDATE_FUNCTION_CODE = OperationModel.new(
        name: "UpdateFunctionCode",
        http_method: "PUT",
        request_uri: "/2015-03-31/functions/{FunctionName}/code"
      )

      UPDATE_FUNCTION_CONFIGURATION = OperationModel.new(
        name: "UpdateFunctionConfiguration",
        http_method: "PUT",
        request_uri: "/2015-03-31/functions/{FunctionName}/configuration"
      )

      UPDATE_FUNCTION_EVENT_INVOKE_CONFIG = OperationModel.new(
        name: "UpdateFunctionEventInvokeConfig",
        http_method: "POST",
        request_uri: "/2019-09-25/functions/{FunctionName}/event-invoke-config"
      )

      UPDATE_FUNCTION_URL_CONFIG = OperationModel.new(
        name: "UpdateFunctionUrlConfig",
        http_method: "PUT",
        request_uri: "/2021-10-31/functions/{FunctionName}/url"
      )
    end
  end
end
