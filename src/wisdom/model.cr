module Aws
  module Wisdom
    module Model
      API_VERSION = "2020-10-19"
      TARGET_PREFIX = ""
      SIGNING_NAME = "wisdom"
      ENDPOINT_PREFIX = "wisdom"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://wisdom-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://wisdom-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://wisdom.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://wisdom.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

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

      CREATE_KNOWLEDGE_BASE = OperationModel.new(
        name: "CreateKnowledgeBase",
        http_method: "POST",
        request_uri: "/knowledgeBases"
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

      DELETE_QUICK_RESPONSE = OperationModel.new(
        name: "DeleteQuickResponse",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/quickResponses/{quickResponseId}"
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

      LIST_QUICK_RESPONSES = OperationModel.new(
        name: "ListQuickResponses",
        http_method: "GET",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/quickResponses"
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

      QUERY_ASSISTANT = OperationModel.new(
        name: "QueryAssistant",
        http_method: "POST",
        request_uri: "/assistants/{assistantId}/query"
      )

      REMOVE_KNOWLEDGE_BASE_TEMPLATE_URI = OperationModel.new(
        name: "RemoveKnowledgeBaseTemplateUri",
        http_method: "DELETE",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/templateUri"
      )

      SEARCH_CONTENT = OperationModel.new(
        name: "SearchContent",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/search"
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

      UPDATE_QUICK_RESPONSE = OperationModel.new(
        name: "UpdateQuickResponse",
        http_method: "POST",
        request_uri: "/knowledgeBases/{knowledgeBaseId}/quickResponses/{quickResponseId}"
      )
    end
  end
end
