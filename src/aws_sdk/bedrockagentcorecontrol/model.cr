module AwsSdk
  module BedrockAgentCoreControl
    module Model
      API_VERSION = "2023-06-05"
      TARGET_PREFIX = ""
      SIGNING_NAME = "bedrock-agentcore"
      ENDPOINT_PREFIX = "bedrock-agentcore-control"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agentcore-control-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agentcore-control-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agentcore-control.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agentcore-control.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_AGENT_RUNTIME = OperationModel.new(
        name: "CreateAgentRuntime",
        http_method: "PUT",
        request_uri: "/runtimes/"
      )

      CREATE_AGENT_RUNTIME_ENDPOINT = OperationModel.new(
        name: "CreateAgentRuntimeEndpoint",
        http_method: "PUT",
        request_uri: "/runtimes/{agentRuntimeId}/runtime-endpoints/"
      )

      CREATE_API_KEY_CREDENTIAL_PROVIDER = OperationModel.new(
        name: "CreateApiKeyCredentialProvider",
        http_method: "POST",
        request_uri: "/identities/CreateApiKeyCredentialProvider"
      )

      CREATE_BROWSER = OperationModel.new(
        name: "CreateBrowser",
        http_method: "PUT",
        request_uri: "/browsers"
      )

      CREATE_CODE_INTERPRETER = OperationModel.new(
        name: "CreateCodeInterpreter",
        http_method: "PUT",
        request_uri: "/code-interpreters"
      )

      CREATE_EVALUATOR = OperationModel.new(
        name: "CreateEvaluator",
        http_method: "POST",
        request_uri: "/evaluators/create"
      )

      CREATE_GATEWAY = OperationModel.new(
        name: "CreateGateway",
        http_method: "POST",
        request_uri: "/gateways/"
      )

      CREATE_GATEWAY_TARGET = OperationModel.new(
        name: "CreateGatewayTarget",
        http_method: "POST",
        request_uri: "/gateways/{gatewayIdentifier}/targets/"
      )

      CREATE_MEMORY = OperationModel.new(
        name: "CreateMemory",
        http_method: "POST",
        request_uri: "/memories/create"
      )

      CREATE_OAUTH2_CREDENTIAL_PROVIDER = OperationModel.new(
        name: "CreateOauth2CredentialProvider",
        http_method: "POST",
        request_uri: "/identities/CreateOauth2CredentialProvider"
      )

      CREATE_ONLINE_EVALUATION_CONFIG = OperationModel.new(
        name: "CreateOnlineEvaluationConfig",
        http_method: "POST",
        request_uri: "/online-evaluation-configs/create"
      )

      CREATE_POLICY = OperationModel.new(
        name: "CreatePolicy",
        http_method: "POST",
        request_uri: "/policy-engines/{policyEngineId}/policies"
      )

      CREATE_POLICY_ENGINE = OperationModel.new(
        name: "CreatePolicyEngine",
        http_method: "POST",
        request_uri: "/policy-engines"
      )

      CREATE_WORKLOAD_IDENTITY = OperationModel.new(
        name: "CreateWorkloadIdentity",
        http_method: "POST",
        request_uri: "/identities/CreateWorkloadIdentity"
      )

      DELETE_AGENT_RUNTIME = OperationModel.new(
        name: "DeleteAgentRuntime",
        http_method: "DELETE",
        request_uri: "/runtimes/{agentRuntimeId}/"
      )

      DELETE_AGENT_RUNTIME_ENDPOINT = OperationModel.new(
        name: "DeleteAgentRuntimeEndpoint",
        http_method: "DELETE",
        request_uri: "/runtimes/{agentRuntimeId}/runtime-endpoints/{endpointName}/"
      )

      DELETE_API_KEY_CREDENTIAL_PROVIDER = OperationModel.new(
        name: "DeleteApiKeyCredentialProvider",
        http_method: "POST",
        request_uri: "/identities/DeleteApiKeyCredentialProvider"
      )

      DELETE_BROWSER = OperationModel.new(
        name: "DeleteBrowser",
        http_method: "DELETE",
        request_uri: "/browsers/{browserId}"
      )

      DELETE_CODE_INTERPRETER = OperationModel.new(
        name: "DeleteCodeInterpreter",
        http_method: "DELETE",
        request_uri: "/code-interpreters/{codeInterpreterId}"
      )

      DELETE_EVALUATOR = OperationModel.new(
        name: "DeleteEvaluator",
        http_method: "DELETE",
        request_uri: "/evaluators/{evaluatorId}"
      )

      DELETE_GATEWAY = OperationModel.new(
        name: "DeleteGateway",
        http_method: "DELETE",
        request_uri: "/gateways/{gatewayIdentifier}/"
      )

      DELETE_GATEWAY_TARGET = OperationModel.new(
        name: "DeleteGatewayTarget",
        http_method: "DELETE",
        request_uri: "/gateways/{gatewayIdentifier}/targets/{targetId}/"
      )

      DELETE_MEMORY = OperationModel.new(
        name: "DeleteMemory",
        http_method: "DELETE",
        request_uri: "/memories/{memoryId}/delete"
      )

      DELETE_OAUTH2_CREDENTIAL_PROVIDER = OperationModel.new(
        name: "DeleteOauth2CredentialProvider",
        http_method: "POST",
        request_uri: "/identities/DeleteOauth2CredentialProvider"
      )

      DELETE_ONLINE_EVALUATION_CONFIG = OperationModel.new(
        name: "DeleteOnlineEvaluationConfig",
        http_method: "DELETE",
        request_uri: "/online-evaluation-configs/{onlineEvaluationConfigId}"
      )

      DELETE_POLICY = OperationModel.new(
        name: "DeletePolicy",
        http_method: "DELETE",
        request_uri: "/policy-engines/{policyEngineId}/policies/{policyId}"
      )

      DELETE_POLICY_ENGINE = OperationModel.new(
        name: "DeletePolicyEngine",
        http_method: "DELETE",
        request_uri: "/policy-engines/{policyEngineId}"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "DELETE",
        request_uri: "/resourcepolicy/{resourceArn}"
      )

      DELETE_WORKLOAD_IDENTITY = OperationModel.new(
        name: "DeleteWorkloadIdentity",
        http_method: "POST",
        request_uri: "/identities/DeleteWorkloadIdentity"
      )

      GET_AGENT_RUNTIME = OperationModel.new(
        name: "GetAgentRuntime",
        http_method: "GET",
        request_uri: "/runtimes/{agentRuntimeId}/"
      )

      GET_AGENT_RUNTIME_ENDPOINT = OperationModel.new(
        name: "GetAgentRuntimeEndpoint",
        http_method: "GET",
        request_uri: "/runtimes/{agentRuntimeId}/runtime-endpoints/{endpointName}/"
      )

      GET_API_KEY_CREDENTIAL_PROVIDER = OperationModel.new(
        name: "GetApiKeyCredentialProvider",
        http_method: "POST",
        request_uri: "/identities/GetApiKeyCredentialProvider"
      )

      GET_BROWSER = OperationModel.new(
        name: "GetBrowser",
        http_method: "GET",
        request_uri: "/browsers/{browserId}"
      )

      GET_CODE_INTERPRETER = OperationModel.new(
        name: "GetCodeInterpreter",
        http_method: "GET",
        request_uri: "/code-interpreters/{codeInterpreterId}"
      )

      GET_EVALUATOR = OperationModel.new(
        name: "GetEvaluator",
        http_method: "GET",
        request_uri: "/evaluators/{evaluatorId}"
      )

      GET_GATEWAY = OperationModel.new(
        name: "GetGateway",
        http_method: "GET",
        request_uri: "/gateways/{gatewayIdentifier}/"
      )

      GET_GATEWAY_TARGET = OperationModel.new(
        name: "GetGatewayTarget",
        http_method: "GET",
        request_uri: "/gateways/{gatewayIdentifier}/targets/{targetId}/"
      )

      GET_MEMORY = OperationModel.new(
        name: "GetMemory",
        http_method: "GET",
        request_uri: "/memories/{memoryId}/details"
      )

      GET_OAUTH2_CREDENTIAL_PROVIDER = OperationModel.new(
        name: "GetOauth2CredentialProvider",
        http_method: "POST",
        request_uri: "/identities/GetOauth2CredentialProvider"
      )

      GET_ONLINE_EVALUATION_CONFIG = OperationModel.new(
        name: "GetOnlineEvaluationConfig",
        http_method: "GET",
        request_uri: "/online-evaluation-configs/{onlineEvaluationConfigId}"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "GET",
        request_uri: "/policy-engines/{policyEngineId}/policies/{policyId}"
      )

      GET_POLICY_ENGINE = OperationModel.new(
        name: "GetPolicyEngine",
        http_method: "GET",
        request_uri: "/policy-engines/{policyEngineId}"
      )

      GET_POLICY_GENERATION = OperationModel.new(
        name: "GetPolicyGeneration",
        http_method: "GET",
        request_uri: "/policy-engines/{policyEngineId}/policy-generations/{policyGenerationId}"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "GET",
        request_uri: "/resourcepolicy/{resourceArn}"
      )

      GET_TOKEN_VAULT = OperationModel.new(
        name: "GetTokenVault",
        http_method: "POST",
        request_uri: "/identities/get-token-vault"
      )

      GET_WORKLOAD_IDENTITY = OperationModel.new(
        name: "GetWorkloadIdentity",
        http_method: "POST",
        request_uri: "/identities/GetWorkloadIdentity"
      )

      LIST_AGENT_RUNTIME_ENDPOINTS = OperationModel.new(
        name: "ListAgentRuntimeEndpoints",
        http_method: "POST",
        request_uri: "/runtimes/{agentRuntimeId}/runtime-endpoints/"
      )

      LIST_AGENT_RUNTIME_VERSIONS = OperationModel.new(
        name: "ListAgentRuntimeVersions",
        http_method: "POST",
        request_uri: "/runtimes/{agentRuntimeId}/versions/"
      )

      LIST_AGENT_RUNTIMES = OperationModel.new(
        name: "ListAgentRuntimes",
        http_method: "POST",
        request_uri: "/runtimes/"
      )

      LIST_API_KEY_CREDENTIAL_PROVIDERS = OperationModel.new(
        name: "ListApiKeyCredentialProviders",
        http_method: "POST",
        request_uri: "/identities/ListApiKeyCredentialProviders"
      )

      LIST_BROWSERS = OperationModel.new(
        name: "ListBrowsers",
        http_method: "POST",
        request_uri: "/browsers"
      )

      LIST_CODE_INTERPRETERS = OperationModel.new(
        name: "ListCodeInterpreters",
        http_method: "POST",
        request_uri: "/code-interpreters"
      )

      LIST_EVALUATORS = OperationModel.new(
        name: "ListEvaluators",
        http_method: "POST",
        request_uri: "/evaluators"
      )

      LIST_GATEWAY_TARGETS = OperationModel.new(
        name: "ListGatewayTargets",
        http_method: "GET",
        request_uri: "/gateways/{gatewayIdentifier}/targets/"
      )

      LIST_GATEWAYS = OperationModel.new(
        name: "ListGateways",
        http_method: "GET",
        request_uri: "/gateways/"
      )

      LIST_MEMORIES = OperationModel.new(
        name: "ListMemories",
        http_method: "POST",
        request_uri: "/memories/"
      )

      LIST_OAUTH2_CREDENTIAL_PROVIDERS = OperationModel.new(
        name: "ListOauth2CredentialProviders",
        http_method: "POST",
        request_uri: "/identities/ListOauth2CredentialProviders"
      )

      LIST_ONLINE_EVALUATION_CONFIGS = OperationModel.new(
        name: "ListOnlineEvaluationConfigs",
        http_method: "POST",
        request_uri: "/online-evaluation-configs"
      )

      LIST_POLICIES = OperationModel.new(
        name: "ListPolicies",
        http_method: "GET",
        request_uri: "/policy-engines/{policyEngineId}/policies"
      )

      LIST_POLICY_ENGINES = OperationModel.new(
        name: "ListPolicyEngines",
        http_method: "GET",
        request_uri: "/policy-engines"
      )

      LIST_POLICY_GENERATION_ASSETS = OperationModel.new(
        name: "ListPolicyGenerationAssets",
        http_method: "GET",
        request_uri: "/policy-engines/{policyEngineId}/policy-generations/{policyGenerationId}/assets"
      )

      LIST_POLICY_GENERATIONS = OperationModel.new(
        name: "ListPolicyGenerations",
        http_method: "GET",
        request_uri: "/policy-engines/{policyEngineId}/policy-generations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_WORKLOAD_IDENTITIES = OperationModel.new(
        name: "ListWorkloadIdentities",
        http_method: "POST",
        request_uri: "/identities/ListWorkloadIdentities"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "PUT",
        request_uri: "/resourcepolicy/{resourceArn}"
      )

      SET_TOKEN_VAULT_CMK = OperationModel.new(
        name: "SetTokenVaultCMK",
        http_method: "POST",
        request_uri: "/identities/set-token-vault-cmk"
      )

      START_POLICY_GENERATION = OperationModel.new(
        name: "StartPolicyGeneration",
        http_method: "POST",
        request_uri: "/policy-engines/{policyEngineId}/policy-generations"
      )

      SYNCHRONIZE_GATEWAY_TARGETS = OperationModel.new(
        name: "SynchronizeGatewayTargets",
        http_method: "PUT",
        request_uri: "/gateways/{gatewayIdentifier}/synchronizeTargets"
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

      UPDATE_AGENT_RUNTIME = OperationModel.new(
        name: "UpdateAgentRuntime",
        http_method: "PUT",
        request_uri: "/runtimes/{agentRuntimeId}/"
      )

      UPDATE_AGENT_RUNTIME_ENDPOINT = OperationModel.new(
        name: "UpdateAgentRuntimeEndpoint",
        http_method: "PUT",
        request_uri: "/runtimes/{agentRuntimeId}/runtime-endpoints/{endpointName}/"
      )

      UPDATE_API_KEY_CREDENTIAL_PROVIDER = OperationModel.new(
        name: "UpdateApiKeyCredentialProvider",
        http_method: "POST",
        request_uri: "/identities/UpdateApiKeyCredentialProvider"
      )

      UPDATE_EVALUATOR = OperationModel.new(
        name: "UpdateEvaluator",
        http_method: "PUT",
        request_uri: "/evaluators/{evaluatorId}"
      )

      UPDATE_GATEWAY = OperationModel.new(
        name: "UpdateGateway",
        http_method: "PUT",
        request_uri: "/gateways/{gatewayIdentifier}/"
      )

      UPDATE_GATEWAY_TARGET = OperationModel.new(
        name: "UpdateGatewayTarget",
        http_method: "PUT",
        request_uri: "/gateways/{gatewayIdentifier}/targets/{targetId}/"
      )

      UPDATE_MEMORY = OperationModel.new(
        name: "UpdateMemory",
        http_method: "PUT",
        request_uri: "/memories/{memoryId}/update"
      )

      UPDATE_OAUTH2_CREDENTIAL_PROVIDER = OperationModel.new(
        name: "UpdateOauth2CredentialProvider",
        http_method: "POST",
        request_uri: "/identities/UpdateOauth2CredentialProvider"
      )

      UPDATE_ONLINE_EVALUATION_CONFIG = OperationModel.new(
        name: "UpdateOnlineEvaluationConfig",
        http_method: "PUT",
        request_uri: "/online-evaluation-configs/{onlineEvaluationConfigId}"
      )

      UPDATE_POLICY = OperationModel.new(
        name: "UpdatePolicy",
        http_method: "PUT",
        request_uri: "/policy-engines/{policyEngineId}/policies/{policyId}"
      )

      UPDATE_POLICY_ENGINE = OperationModel.new(
        name: "UpdatePolicyEngine",
        http_method: "PUT",
        request_uri: "/policy-engines/{policyEngineId}"
      )

      UPDATE_WORKLOAD_IDENTITY = OperationModel.new(
        name: "UpdateWorkloadIdentity",
        http_method: "POST",
        request_uri: "/identities/UpdateWorkloadIdentity"
      )
    end
  end
end
