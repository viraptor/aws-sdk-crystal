module Aws
  module QConnect
    module Model
      API_VERSION = "2020-10-19"
      TARGET_PREFIX = ""
      SIGNING_NAME = "wisdom"
      ENDPOINT_PREFIX = "wisdom"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://wisdom-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://wisdom-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://wisdom.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://wisdom.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACTIVATE_MESSAGE_TEMPLATE = OperationModel.new(
        name: "ActivateMessageTemplate",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}/activate"
      )

      CREATE_AI_AGENT = OperationModel.new(
        name: "CreateAIAgent",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiagents"
      )

      CREATE_AI_AGENT_VERSION = OperationModel.new(
        name: "CreateAIAgentVersion",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiagents/{aiAgentId}/versions"
      )

      CREATE_AI_GUARDRAIL = OperationModel.new(
        name: "CreateAIGuardrail",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiguardrails"
      )

      CREATE_AI_GUARDRAIL_VERSION = OperationModel.new(
        name: "CreateAIGuardrailVersion",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiguardrails/{aiGuardrailId}/versions"
      )

      CREATE_AI_PROMPT = OperationModel.new(
        name: "CreateAIPrompt",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiprompts"
      )

      CREATE_AI_PROMPT_VERSION = OperationModel.new(
        name: "CreateAIPromptVersion",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiprompts/{aiPromptId}/versions"
      )

      CREATE_ASSISTANT = OperationModel.new(
        name: "CreateAssistant",
        http_method: "POST",
        request_uri: "/assistants"
      )

      CREATE_ASSISTANT_ASSOCIATION = OperationModel.new(
        name: "CreateAssistantAssociation",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/associations"
      )

      CREATE_CONTENT = OperationModel.new(
        name: "CreateContent",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents"
      )

      CREATE_CONTENT_ASSOCIATION = OperationModel.new(
        name: "CreateContentAssociation",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents/{contentId}/associations"
      )

      CREATE_KNOWLEDGE_BASE = OperationModel.new(
        name: "CreateKnowledgeBase",
        http_method: "POST",
        request_uri: "/knowledgeBases"
      )

      CREATE_MESSAGE_TEMPLATE = OperationModel.new(
        name: "CreateMessageTemplate",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates"
      )

      CREATE_MESSAGE_TEMPLATE_ATTACHMENT = OperationModel.new(
        name: "CreateMessageTemplateAttachment",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}/attachments"
      )

      CREATE_MESSAGE_TEMPLATE_VERSION = OperationModel.new(
        name: "CreateMessageTemplateVersion",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}/versions"
      )

      CREATE_QUICK_RESPONSE = OperationModel.new(
        name: "CreateQuickResponse",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/quickResponses"
      )

      CREATE_SESSION = OperationModel.new(
        name: "CreateSession",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/sessions"
      )

      DEACTIVATE_MESSAGE_TEMPLATE = OperationModel.new(
        name: "DeactivateMessageTemplate",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}/deactivate"
      )

      DELETE_AI_AGENT = OperationModel.new(
        name: "DeleteAIAgent",
        http_method: "DELETE",
        request_uri: "/assistants/{assistantId}/aiagents/{aiAgentId}"
      )

      DELETE_AI_AGENT_VERSION = OperationModel.new(
        name: "DeleteAIAgentVersion",
        http_method: "DELETE",
        request_uri: "/assistants/{assistantId}/aiagents/{aiAgentId}/versions/{versionNumber}"
      )

      DELETE_AI_GUARDRAIL = OperationModel.new(
        name: "DeleteAIGuardrail",
        http_method: "DELETE",
        request_uri: "/assistants/{assistantId}/aiguardrails/{aiGuardrailId}"
      )

      DELETE_AI_GUARDRAIL_VERSION = OperationModel.new(
        name: "DeleteAIGuardrailVersion",
        http_method: "DELETE",
        request_uri: "/assistants/{assistantId}/aiguardrails/{aiGuardrailId}/versions/{versionNumber}"
      )

      DELETE_AI_PROMPT = OperationModel.new(
        name: "DeleteAIPrompt",
        http_method: "DELETE",
        request_uri: "/assistants/{assistantId}/aiprompts/{aiPromptId}"
      )

      DELETE_AI_PROMPT_VERSION = OperationModel.new(
        name: "DeleteAIPromptVersion",
        http_method: "DELETE",
        request_uri: "/assistants/{assistantId}/aiprompts/{aiPromptId}/versions/{versionNumber}"
      )

      DELETE_ASSISTANT = OperationModel.new(
        name: "DeleteAssistant",
        http_method: "DELETE",
        request_uri: "/assistants/{assistantId}"
      )

      DELETE_ASSISTANT_ASSOCIATION = OperationModel.new(
        name: "DeleteAssistantAssociation",
        http_method: "DELETE",
        request_uri: "/assistants/{assistantId}/associations/{assistantAssociationId}"
      )

      DELETE_CONTENT = OperationModel.new(
        name: "DeleteContent",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents/{contentId}"
      )

      DELETE_CONTENT_ASSOCIATION = OperationModel.new(
        name: "DeleteContentAssociation",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents/{contentId}/associations/{contentAssociationId}"
      )

      DELETE_IMPORT_JOB = OperationModel.new(
        name: "DeleteImportJob",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/importJobs/{importJobId}"
      )

      DELETE_KNOWLEDGE_BASE = OperationModel.new(
        name: "DeleteKnowledgeBase",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}"
      )

      DELETE_MESSAGE_TEMPLATE = OperationModel.new(
        name: "DeleteMessageTemplate",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}"
      )

      DELETE_MESSAGE_TEMPLATE_ATTACHMENT = OperationModel.new(
        name: "DeleteMessageTemplateAttachment",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}/attachments/{attachmentId}"
      )

      DELETE_QUICK_RESPONSE = OperationModel.new(
        name: "DeleteQuickResponse",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/quickResponses/{quickResponseId}"
      )

      GET_AI_AGENT = OperationModel.new(
        name: "GetAIAgent",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/aiagents/{aiAgentId}"
      )

      GET_AI_GUARDRAIL = OperationModel.new(
        name: "GetAIGuardrail",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/aiguardrails/{aiGuardrailId}"
      )

      GET_AI_PROMPT = OperationModel.new(
        name: "GetAIPrompt",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/aiprompts/{aiPromptId}"
      )

      GET_ASSISTANT = OperationModel.new(
        name: "GetAssistant",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}"
      )

      GET_ASSISTANT_ASSOCIATION = OperationModel.new(
        name: "GetAssistantAssociation",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/associations/{assistantAssociationId}"
      )

      GET_CONTENT = OperationModel.new(
        name: "GetContent",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents/{contentId}"
      )

      GET_CONTENT_ASSOCIATION = OperationModel.new(
        name: "GetContentAssociation",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents/{contentId}/associations/{contentAssociationId}"
      )

      GET_CONTENT_SUMMARY = OperationModel.new(
        name: "GetContentSummary",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents/{contentId}/summary"
      )

      GET_IMPORT_JOB = OperationModel.new(
        name: "GetImportJob",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/importJobs/{importJobId}"
      )

      GET_KNOWLEDGE_BASE = OperationModel.new(
        name: "GetKnowledgeBase",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}"
      )

      GET_MESSAGE_TEMPLATE = OperationModel.new(
        name: "GetMessageTemplate",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}"
      )

      GET_NEXT_MESSAGE = OperationModel.new(
        name: "GetNextMessage",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/sessions/{sessionId}/messages/next"
      )

      GET_QUICK_RESPONSE = OperationModel.new(
        name: "GetQuickResponse",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/quickResponses/{quickResponseId}"
      )

      GET_RECOMMENDATIONS = OperationModel.new(
        name: "GetRecommendations",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/sessions/{sessionId}/recommendations"
      )

      GET_SESSION = OperationModel.new(
        name: "GetSession",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/sessions/{sessionId}"
      )

      LIST_AI_AGENT_VERSIONS = OperationModel.new(
        name: "ListAIAgentVersions",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/aiagents/{aiAgentId}/versions"
      )

      LIST_AI_AGENTS = OperationModel.new(
        name: "ListAIAgents",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/aiagents"
      )

      LIST_AI_GUARDRAIL_VERSIONS = OperationModel.new(
        name: "ListAIGuardrailVersions",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/aiguardrails/{aiGuardrailId}/versions"
      )

      LIST_AI_GUARDRAILS = OperationModel.new(
        name: "ListAIGuardrails",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/aiguardrails"
      )

      LIST_AI_PROMPT_VERSIONS = OperationModel.new(
        name: "ListAIPromptVersions",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/aiprompts/{aiPromptId}/versions"
      )

      LIST_AI_PROMPTS = OperationModel.new(
        name: "ListAIPrompts",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/aiprompts"
      )

      LIST_ASSISTANT_ASSOCIATIONS = OperationModel.new(
        name: "ListAssistantAssociations",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/associations"
      )

      LIST_ASSISTANTS = OperationModel.new(
        name: "ListAssistants",
        http_method: "GET",
        request_uri: "/assistants"
      )

      LIST_CONTENT_ASSOCIATIONS = OperationModel.new(
        name: "ListContentAssociations",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents/{contentId}/associations"
      )

      LIST_CONTENTS = OperationModel.new(
        name: "ListContents",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents"
      )

      LIST_IMPORT_JOBS = OperationModel.new(
        name: "ListImportJobs",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/importJobs"
      )

      LIST_KNOWLEDGE_BASES = OperationModel.new(
        name: "ListKnowledgeBases",
        http_method: "GET",
        request_uri: "/knowledgeBases"
      )

      LIST_MESSAGE_TEMPLATE_VERSIONS = OperationModel.new(
        name: "ListMessageTemplateVersions",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}/versions"
      )

      LIST_MESSAGE_TEMPLATES = OperationModel.new(
        name: "ListMessageTemplates",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates"
      )

      LIST_MESSAGES = OperationModel.new(
        name: "ListMessages",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/sessions/{sessionId}/messages"
      )

      LIST_QUICK_RESPONSES = OperationModel.new(
        name: "ListQuickResponses",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/quickResponses"
      )

      LIST_SPANS = OperationModel.new(
        name: "ListSpans",
        http_method: "GET",
        request_uri: "/assistants/{assistantId}/sessions/{sessionId}/spans"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      NOTIFY_RECOMMENDATIONS_RECEIVED = OperationModel.new(
        name: "NotifyRecommendationsReceived",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/sessions/{sessionId}/recommendations/notify"
      )

      PUT_FEEDBACK = OperationModel.new(
        name: "PutFeedback",
        http_method: "PUT",
        request_uri: "/assistants/{assistantId}/feedback"
      )

      QUERY_ASSISTANT = OperationModel.new(
        name: "QueryAssistant",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/query"
      )

      REMOVE_ASSISTANT_AI_AGENT = OperationModel.new(
        name: "RemoveAssistantAIAgent",
        http_method: "DELETE",
        request_uri: "/assistants/{assistantId}/aiagentConfiguration"
      )

      REMOVE_KNOWLEDGE_BASE_TEMPLATE_URI = OperationModel.new(
        name: "RemoveKnowledgeBaseTemplateUri",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/templateUri"
      )

      RENDER_MESSAGE_TEMPLATE = OperationModel.new(
        name: "RenderMessageTemplate",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}/render"
      )

      RETRIEVE = OperationModel.new(
        name: "Retrieve",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/retrieve"
      )

      SEARCH_CONTENT = OperationModel.new(
        name: "SearchContent",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/search"
      )

      SEARCH_MESSAGE_TEMPLATES = OperationModel.new(
        name: "SearchMessageTemplates",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/search/messageTemplates"
      )

      SEARCH_QUICK_RESPONSES = OperationModel.new(
        name: "SearchQuickResponses",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/search/quickResponses"
      )

      SEARCH_SESSIONS = OperationModel.new(
        name: "SearchSessions",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/searchSessions"
      )

      SEND_MESSAGE = OperationModel.new(
        name: "SendMessage",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/sessions/{sessionId}/message"
      )

      START_CONTENT_UPLOAD = OperationModel.new(
        name: "StartContentUpload",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/upload"
      )

      START_IMPORT_JOB = OperationModel.new(
        name: "StartImportJob",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/importJobs"
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

      UPDATE_AI_AGENT = OperationModel.new(
        name: "UpdateAIAgent",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiagents/{aiAgentId}"
      )

      UPDATE_AI_GUARDRAIL = OperationModel.new(
        name: "UpdateAIGuardrail",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiguardrails/{aiGuardrailId}"
      )

      UPDATE_AI_PROMPT = OperationModel.new(
        name: "UpdateAIPrompt",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiprompts/{aiPromptId}"
      )

      UPDATE_ASSISTANT_AI_AGENT = OperationModel.new(
        name: "UpdateAssistantAIAgent",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/aiagentConfiguration"
      )

      UPDATE_CONTENT = OperationModel.new(
        name: "UpdateContent",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/contents/{contentId}"
      )

      UPDATE_KNOWLEDGE_BASE_TEMPLATE_URI = OperationModel.new(
        name: "UpdateKnowledgeBaseTemplateUri",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/templateUri"
      )

      UPDATE_MESSAGE_TEMPLATE = OperationModel.new(
        name: "UpdateMessageTemplate",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}"
      )

      UPDATE_MESSAGE_TEMPLATE_METADATA = OperationModel.new(
        name: "UpdateMessageTemplateMetadata",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/messageTemplates/{messageTemplateId}/metadata"
      )

      UPDATE_QUICK_RESPONSE = OperationModel.new(
        name: "UpdateQuickResponse",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/quickResponses/{quickResponseId}"
      )

      UPDATE_SESSION = OperationModel.new(
        name: "UpdateSession",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/sessions/{sessionId}"
      )

      UPDATE_SESSION_DATA = OperationModel.new(
        name: "UpdateSessionData",
        http_method: "PATCH",
        request_uri: "/assistants/{assistantId}/sessions/{sessionId}/data"
      )
    end
  end
end
