module AwsSdk
  module BedrockAgent
    module Model
      API_VERSION = "2023-06-05"
      TARGET_PREFIX = ""
      SIGNING_NAME = "bedrock"
      ENDPOINT_PREFIX = "bedrock-agent"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agent-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agent-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agent.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-agent.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_AGENT_COLLABORATOR = OperationModel.new(
        name: "AssociateAgentCollaborator",
        http_method: "PUT",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/agentcollaborators/"
      )

      ASSOCIATE_AGENT_KNOWLEDGE_BASE = OperationModel.new(
        name: "AssociateAgentKnowledgeBase",
        http_method: "PUT",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/knowledgebases/"
      )

      CREATE_AGENT = OperationModel.new(
        name: "CreateAgent",
        http_method: "PUT",
        request_uri: "/agents/"
      )

      CREATE_AGENT_ACTION_GROUP = OperationModel.new(
        name: "CreateAgentActionGroup",
        http_method: "PUT",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/actiongroups/"
      )

      CREATE_AGENT_ALIAS = OperationModel.new(
        name: "CreateAgentAlias",
        http_method: "PUT",
        request_uri: "/agents/{agentId}/agentaliases/"
      )

      CREATE_DATA_SOURCE = OperationModel.new(
        name: "CreateDataSource",
        http_method: "PUT",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/"
      )

      CREATE_FLOW = OperationModel.new(
        name: "CreateFlow",
        http_method: "POST",
        request_uri: "/flows/"
      )

      CREATE_FLOW_ALIAS = OperationModel.new(
        name: "CreateFlowAlias",
        http_method: "POST",
        request_uri: "/flows/{flowIdentifier}/aliases"
      )

      CREATE_FLOW_VERSION = OperationModel.new(
        name: "CreateFlowVersion",
        http_method: "POST",
        request_uri: "/flows/{flowIdentifier}/versions"
      )

      CREATE_KNOWLEDGE_BASE = OperationModel.new(
        name: "CreateKnowledgeBase",
        http_method: "PUT",
        request_uri: "/knowledgebases/"
      )

      CREATE_PROMPT = OperationModel.new(
        name: "CreatePrompt",
        http_method: "POST",
        request_uri: "/prompts/"
      )

      CREATE_PROMPT_VERSION = OperationModel.new(
        name: "CreatePromptVersion",
        http_method: "POST",
        request_uri: "/prompts/{promptIdentifier}/versions"
      )

      DELETE_AGENT = OperationModel.new(
        name: "DeleteAgent",
        http_method: "DELETE",
        request_uri: "/agents/{agentId}/"
      )

      DELETE_AGENT_ACTION_GROUP = OperationModel.new(
        name: "DeleteAgentActionGroup",
        http_method: "DELETE",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/actiongroups/{actionGroupId}/"
      )

      DELETE_AGENT_ALIAS = OperationModel.new(
        name: "DeleteAgentAlias",
        http_method: "DELETE",
        request_uri: "/agents/{agentId}/agentaliases/{agentAliasId}/"
      )

      DELETE_AGENT_VERSION = OperationModel.new(
        name: "DeleteAgentVersion",
        http_method: "DELETE",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/"
      )

      DELETE_DATA_SOURCE = OperationModel.new(
        name: "DeleteDataSource",
        http_method: "DELETE",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}"
      )

      DELETE_FLOW = OperationModel.new(
        name: "DeleteFlow",
        http_method: "DELETE",
        request_uri: "/flows/{flowIdentifier}/"
      )

      DELETE_FLOW_ALIAS = OperationModel.new(
        name: "DeleteFlowAlias",
        http_method: "DELETE",
        request_uri: "/flows/{flowIdentifier}/aliases/{aliasIdentifier}"
      )

      DELETE_FLOW_VERSION = OperationModel.new(
        name: "DeleteFlowVersion",
        http_method: "DELETE",
        request_uri: "/flows/{flowIdentifier}/versions/{flowVersion}/"
      )

      DELETE_KNOWLEDGE_BASE = OperationModel.new(
        name: "DeleteKnowledgeBase",
        http_method: "DELETE",
        request_uri: "/knowledgebases/{knowledgeBaseId}"
      )

      DELETE_KNOWLEDGE_BASE_DOCUMENTS = OperationModel.new(
        name: "DeleteKnowledgeBaseDocuments",
        http_method: "POST",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}/documents/deleteDocuments"
      )

      DELETE_PROMPT = OperationModel.new(
        name: "DeletePrompt",
        http_method: "DELETE",
        request_uri: "/prompts/{promptIdentifier}/"
      )

      DISASSOCIATE_AGENT_COLLABORATOR = OperationModel.new(
        name: "DisassociateAgentCollaborator",
        http_method: "DELETE",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/agentcollaborators/{collaboratorId}/"
      )

      DISASSOCIATE_AGENT_KNOWLEDGE_BASE = OperationModel.new(
        name: "DisassociateAgentKnowledgeBase",
        http_method: "DELETE",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/knowledgebases/{knowledgeBaseId}/"
      )

      GET_AGENT = OperationModel.new(
        name: "GetAgent",
        http_method: "GET",
        request_uri: "/agents/{agentId}/"
      )

      GET_AGENT_ACTION_GROUP = OperationModel.new(
        name: "GetAgentActionGroup",
        http_method: "GET",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/actiongroups/{actionGroupId}/"
      )

      GET_AGENT_ALIAS = OperationModel.new(
        name: "GetAgentAlias",
        http_method: "GET",
        request_uri: "/agents/{agentId}/agentaliases/{agentAliasId}/"
      )

      GET_AGENT_COLLABORATOR = OperationModel.new(
        name: "GetAgentCollaborator",
        http_method: "GET",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/agentcollaborators/{collaboratorId}/"
      )

      GET_AGENT_KNOWLEDGE_BASE = OperationModel.new(
        name: "GetAgentKnowledgeBase",
        http_method: "GET",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/knowledgebases/{knowledgeBaseId}/"
      )

      GET_AGENT_VERSION = OperationModel.new(
        name: "GetAgentVersion",
        http_method: "GET",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/"
      )

      GET_DATA_SOURCE = OperationModel.new(
        name: "GetDataSource",
        http_method: "GET",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}"
      )

      GET_FLOW = OperationModel.new(
        name: "GetFlow",
        http_method: "GET",
        request_uri: "/flows/{flowIdentifier}/"
      )

      GET_FLOW_ALIAS = OperationModel.new(
        name: "GetFlowAlias",
        http_method: "GET",
        request_uri: "/flows/{flowIdentifier}/aliases/{aliasIdentifier}"
      )

      GET_FLOW_VERSION = OperationModel.new(
        name: "GetFlowVersion",
        http_method: "GET",
        request_uri: "/flows/{flowIdentifier}/versions/{flowVersion}/"
      )

      GET_INGESTION_JOB = OperationModel.new(
        name: "GetIngestionJob",
        http_method: "GET",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}/ingestionjobs/{ingestionJobId}"
      )

      GET_KNOWLEDGE_BASE = OperationModel.new(
        name: "GetKnowledgeBase",
        http_method: "GET",
        request_uri: "/knowledgebases/{knowledgeBaseId}"
      )

      GET_KNOWLEDGE_BASE_DOCUMENTS = OperationModel.new(
        name: "GetKnowledgeBaseDocuments",
        http_method: "POST",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}/documents/getDocuments"
      )

      GET_PROMPT = OperationModel.new(
        name: "GetPrompt",
        http_method: "GET",
        request_uri: "/prompts/{promptIdentifier}/"
      )

      INGEST_KNOWLEDGE_BASE_DOCUMENTS = OperationModel.new(
        name: "IngestKnowledgeBaseDocuments",
        http_method: "PUT",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}/documents"
      )

      LIST_AGENT_ACTION_GROUPS = OperationModel.new(
        name: "ListAgentActionGroups",
        http_method: "POST",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/actiongroups/"
      )

      LIST_AGENT_ALIASES = OperationModel.new(
        name: "ListAgentAliases",
        http_method: "POST",
        request_uri: "/agents/{agentId}/agentaliases/"
      )

      LIST_AGENT_COLLABORATORS = OperationModel.new(
        name: "ListAgentCollaborators",
        http_method: "POST",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/agentcollaborators/"
      )

      LIST_AGENT_KNOWLEDGE_BASES = OperationModel.new(
        name: "ListAgentKnowledgeBases",
        http_method: "POST",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/knowledgebases/"
      )

      LIST_AGENT_VERSIONS = OperationModel.new(
        name: "ListAgentVersions",
        http_method: "POST",
        request_uri: "/agents/{agentId}/agentversions/"
      )

      LIST_AGENTS = OperationModel.new(
        name: "ListAgents",
        http_method: "POST",
        request_uri: "/agents/"
      )

      LIST_DATA_SOURCES = OperationModel.new(
        name: "ListDataSources",
        http_method: "POST",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/"
      )

      LIST_FLOW_ALIASES = OperationModel.new(
        name: "ListFlowAliases",
        http_method: "GET",
        request_uri: "/flows/{flowIdentifier}/aliases"
      )

      LIST_FLOW_VERSIONS = OperationModel.new(
        name: "ListFlowVersions",
        http_method: "GET",
        request_uri: "/flows/{flowIdentifier}/versions"
      )

      LIST_FLOWS = OperationModel.new(
        name: "ListFlows",
        http_method: "GET",
        request_uri: "/flows/"
      )

      LIST_INGESTION_JOBS = OperationModel.new(
        name: "ListIngestionJobs",
        http_method: "POST",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}/ingestionjobs/"
      )

      LIST_KNOWLEDGE_BASE_DOCUMENTS = OperationModel.new(
        name: "ListKnowledgeBaseDocuments",
        http_method: "POST",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}/documents"
      )

      LIST_KNOWLEDGE_BASES = OperationModel.new(
        name: "ListKnowledgeBases",
        http_method: "POST",
        request_uri: "/knowledgebases/"
      )

      LIST_PROMPTS = OperationModel.new(
        name: "ListPrompts",
        http_method: "GET",
        request_uri: "/prompts/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PREPARE_AGENT = OperationModel.new(
        name: "PrepareAgent",
        http_method: "POST",
        request_uri: "/agents/{agentId}/"
      )

      PREPARE_FLOW = OperationModel.new(
        name: "PrepareFlow",
        http_method: "POST",
        request_uri: "/flows/{flowIdentifier}/"
      )

      START_INGESTION_JOB = OperationModel.new(
        name: "StartIngestionJob",
        http_method: "PUT",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}/ingestionjobs/"
      )

      STOP_INGESTION_JOB = OperationModel.new(
        name: "StopIngestionJob",
        http_method: "POST",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}/ingestionjobs/{ingestionJobId}/stop"
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

      UPDATE_AGENT = OperationModel.new(
        name: "UpdateAgent",
        http_method: "PUT",
        request_uri: "/agents/{agentId}/"
      )

      UPDATE_AGENT_ACTION_GROUP = OperationModel.new(
        name: "UpdateAgentActionGroup",
        http_method: "PUT",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/actiongroups/{actionGroupId}/"
      )

      UPDATE_AGENT_ALIAS = OperationModel.new(
        name: "UpdateAgentAlias",
        http_method: "PUT",
        request_uri: "/agents/{agentId}/agentaliases/{agentAliasId}/"
      )

      UPDATE_AGENT_COLLABORATOR = OperationModel.new(
        name: "UpdateAgentCollaborator",
        http_method: "PUT",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/agentcollaborators/{collaboratorId}/"
      )

      UPDATE_AGENT_KNOWLEDGE_BASE = OperationModel.new(
        name: "UpdateAgentKnowledgeBase",
        http_method: "PUT",
        request_uri: "/agents/{agentId}/agentversions/{agentVersion}/knowledgebases/{knowledgeBaseId}/"
      )

      UPDATE_DATA_SOURCE = OperationModel.new(
        name: "UpdateDataSource",
        http_method: "PUT",
        request_uri: "/knowledgebases/{knowledgeBaseId}/datasources/{dataSourceId}"
      )

      UPDATE_FLOW = OperationModel.new(
        name: "UpdateFlow",
        http_method: "PUT",
        request_uri: "/flows/{flowIdentifier}/"
      )

      UPDATE_FLOW_ALIAS = OperationModel.new(
        name: "UpdateFlowAlias",
        http_method: "PUT",
        request_uri: "/flows/{flowIdentifier}/aliases/{aliasIdentifier}"
      )

      UPDATE_KNOWLEDGE_BASE = OperationModel.new(
        name: "UpdateKnowledgeBase",
        http_method: "PUT",
        request_uri: "/knowledgebases/{knowledgeBaseId}"
      )

      UPDATE_PROMPT = OperationModel.new(
        name: "UpdatePrompt",
        http_method: "PUT",
        request_uri: "/prompts/{promptIdentifier}/"
      )

      VALIDATE_FLOW_DEFINITION = OperationModel.new(
        name: "ValidateFlowDefinition",
        http_method: "POST",
        request_uri: "/flows/validate-definition"
      )
    end
  end
end
