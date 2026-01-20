module Aws
  module QBusiness
    module Model
      API_VERSION = "2023-11-27"
      TARGET_PREFIX = ""
      SIGNING_NAME = "qbusiness"
      ENDPOINT_PREFIX = "qbusiness"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://qbusiness-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://qbusiness.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://qbusiness-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://qbusiness.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_PERMISSION = OperationModel.new(
        name: "AssociatePermission",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/policy"
      )

      BATCH_DELETE_DOCUMENT = OperationModel.new(
        name: "BatchDeleteDocument",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/indices/{indexId}/documents/delete"
      )

      BATCH_PUT_DOCUMENT = OperationModel.new(
        name: "BatchPutDocument",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/indices/{indexId}/documents"
      )

      CANCEL_SUBSCRIPTION = OperationModel.new(
        name: "CancelSubscription",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/subscriptions/{subscriptionId}"
      )

      CHAT = OperationModel.new(
        name: "Chat",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/conversations"
      )

      CHAT_SYNC = OperationModel.new(
        name: "ChatSync",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/conversations?sync"
      )

      CHECK_DOCUMENT_ACCESS = OperationModel.new(
        name: "CheckDocumentAccess",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/index/{indexId}/users/{userId}/documents/{documentId}/check-document-access"
      )

      CREATE_ANONYMOUS_WEB_EXPERIENCE_URL = OperationModel.new(
        name: "CreateAnonymousWebExperienceUrl",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/experiences/{webExperienceId}/anonymous-url"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/applications"
      )

      CREATE_CHAT_RESPONSE_CONFIGURATION = OperationModel.new(
        name: "CreateChatResponseConfiguration",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/chatresponseconfigurations"
      )

      CREATE_DATA_ACCESSOR = OperationModel.new(
        name: "CreateDataAccessor",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/dataaccessors"
      )

      CREATE_DATA_SOURCE = OperationModel.new(
        name: "CreateDataSource",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/indices/{indexId}/datasources"
      )

      CREATE_INDEX = OperationModel.new(
        name: "CreateIndex",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/indices"
      )

      CREATE_PLUGIN = OperationModel.new(
        name: "CreatePlugin",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/plugins"
      )

      CREATE_RETRIEVER = OperationModel.new(
        name: "CreateRetriever",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/retrievers"
      )

      CREATE_SUBSCRIPTION = OperationModel.new(
        name: "CreateSubscription",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/subscriptions"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/users"
      )

      CREATE_WEB_EXPERIENCE = OperationModel.new(
        name: "CreateWebExperience",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/experiences"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}"
      )

      DELETE_ATTACHMENT = OperationModel.new(
        name: "DeleteAttachment",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/conversations/{conversationId}/attachments/{attachmentId}"
      )

      DELETE_CHAT_CONTROLS_CONFIGURATION = OperationModel.new(
        name: "DeleteChatControlsConfiguration",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/chatcontrols"
      )

      DELETE_CHAT_RESPONSE_CONFIGURATION = OperationModel.new(
        name: "DeleteChatResponseConfiguration",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/chatresponseconfigurations/{chatResponseConfigurationId}"
      )

      DELETE_CONVERSATION = OperationModel.new(
        name: "DeleteConversation",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/conversations/{conversationId}"
      )

      DELETE_DATA_ACCESSOR = OperationModel.new(
        name: "DeleteDataAccessor",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/dataaccessors/{dataAccessorId}"
      )

      DELETE_DATA_SOURCE = OperationModel.new(
        name: "DeleteDataSource",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/indices/{indexId}/datasources/{dataSourceId}"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/indices/{indexId}/groups/{groupName}"
      )

      DELETE_INDEX = OperationModel.new(
        name: "DeleteIndex",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/indices/{indexId}"
      )

      DELETE_PLUGIN = OperationModel.new(
        name: "DeletePlugin",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/plugins/{pluginId}"
      )

      DELETE_RETRIEVER = OperationModel.new(
        name: "DeleteRetriever",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/retrievers/{retrieverId}"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/users/{userId}"
      )

      DELETE_WEB_EXPERIENCE = OperationModel.new(
        name: "DeleteWebExperience",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/experiences/{webExperienceId}"
      )

      DISASSOCIATE_PERMISSION = OperationModel.new(
        name: "DisassociatePermission",
        http_method: "DELETE",
        request_uri: "/applications/{applicationId}/policy/{statementId}"
      )

      GET_APPLICATION = OperationModel.new(
        name: "GetApplication",
        http_method: "GET",
        request_uri: "/applications/{applicationId}"
      )

      GET_CHAT_CONTROLS_CONFIGURATION = OperationModel.new(
        name: "GetChatControlsConfiguration",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/chatcontrols"
      )

      GET_CHAT_RESPONSE_CONFIGURATION = OperationModel.new(
        name: "GetChatResponseConfiguration",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/chatresponseconfigurations/{chatResponseConfigurationId}"
      )

      GET_DATA_ACCESSOR = OperationModel.new(
        name: "GetDataAccessor",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/dataaccessors/{dataAccessorId}"
      )

      GET_DATA_SOURCE = OperationModel.new(
        name: "GetDataSource",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/indices/{indexId}/datasources/{dataSourceId}"
      )

      GET_DOCUMENT_CONTENT = OperationModel.new(
        name: "GetDocumentContent",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/index/{indexId}/documents/{documentId}/content"
      )

      GET_GROUP = OperationModel.new(
        name: "GetGroup",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/indices/{indexId}/groups/{groupName}"
      )

      GET_INDEX = OperationModel.new(
        name: "GetIndex",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/indices/{indexId}"
      )

      GET_MEDIA = OperationModel.new(
        name: "GetMedia",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/conversations/{conversationId}/messages/{messageId}/media/{mediaId}"
      )

      GET_PLUGIN = OperationModel.new(
        name: "GetPlugin",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/plugins/{pluginId}"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/policy"
      )

      GET_RETRIEVER = OperationModel.new(
        name: "GetRetriever",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/retrievers/{retrieverId}"
      )

      GET_USER = OperationModel.new(
        name: "GetUser",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/users/{userId}"
      )

      GET_WEB_EXPERIENCE = OperationModel.new(
        name: "GetWebExperience",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/experiences/{webExperienceId}"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "GET",
        request_uri: "/applications"
      )

      LIST_ATTACHMENTS = OperationModel.new(
        name: "ListAttachments",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/attachments"
      )

      LIST_CHAT_RESPONSE_CONFIGURATIONS = OperationModel.new(
        name: "ListChatResponseConfigurations",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/chatresponseconfigurations"
      )

      LIST_CONVERSATIONS = OperationModel.new(
        name: "ListConversations",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/conversations"
      )

      LIST_DATA_ACCESSORS = OperationModel.new(
        name: "ListDataAccessors",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/dataaccessors"
      )

      LIST_DATA_SOURCE_SYNC_JOBS = OperationModel.new(
        name: "ListDataSourceSyncJobs",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/indices/{indexId}/datasources/{dataSourceId}/syncjobs"
      )

      LIST_DATA_SOURCES = OperationModel.new(
        name: "ListDataSources",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/indices/{indexId}/datasources"
      )

      LIST_DOCUMENTS = OperationModel.new(
        name: "ListDocuments",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/index/{indexId}/documents"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/indices/{indexId}/groups"
      )

      LIST_INDICES = OperationModel.new(
        name: "ListIndices",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/indices"
      )

      LIST_MESSAGES = OperationModel.new(
        name: "ListMessages",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/conversations/{conversationId}"
      )

      LIST_PLUGIN_ACTIONS = OperationModel.new(
        name: "ListPluginActions",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/plugins/{pluginId}/actions"
      )

      LIST_PLUGIN_TYPE_ACTIONS = OperationModel.new(
        name: "ListPluginTypeActions",
        http_method: "GET",
        request_uri: "/pluginTypes/{pluginType}/actions"
      )

      LIST_PLUGIN_TYPE_METADATA = OperationModel.new(
        name: "ListPluginTypeMetadata",
        http_method: "GET",
        request_uri: "/pluginTypeMetadata"
      )

      LIST_PLUGINS = OperationModel.new(
        name: "ListPlugins",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/plugins"
      )

      LIST_RETRIEVERS = OperationModel.new(
        name: "ListRetrievers",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/retrievers"
      )

      LIST_SUBSCRIPTIONS = OperationModel.new(
        name: "ListSubscriptions",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/subscriptions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/tags/{resourceARN}"
      )

      LIST_WEB_EXPERIENCES = OperationModel.new(
        name: "ListWebExperiences",
        http_method: "GET",
        request_uri: "/applications/{applicationId}/experiences"
      )

      PUT_FEEDBACK = OperationModel.new(
        name: "PutFeedback",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/conversations/{conversationId}/messages/{messageId}/feedback"
      )

      PUT_GROUP = OperationModel.new(
        name: "PutGroup",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/indices/{indexId}/groups"
      )

      SEARCH_RELEVANT_CONTENT = OperationModel.new(
        name: "SearchRelevantContent",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/relevant-content"
      )

      START_DATA_SOURCE_SYNC_JOB = OperationModel.new(
        name: "StartDataSourceSyncJob",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/indices/{indexId}/datasources/{dataSourceId}/startsync"
      )

      STOP_DATA_SOURCE_SYNC_JOB = OperationModel.new(
        name: "StopDataSourceSyncJob",
        http_method: "POST",
        request_uri: "/applications/{applicationId}/indices/{indexId}/datasources/{dataSourceId}/stopsync"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v1/tags/{resourceARN}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v1/tags/{resourceARN}"
      )

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}"
      )

      UPDATE_CHAT_CONTROLS_CONFIGURATION = OperationModel.new(
        name: "UpdateChatControlsConfiguration",
        http_method: "PATCH",
        request_uri: "/applications/{applicationId}/chatcontrols"
      )

      UPDATE_CHAT_RESPONSE_CONFIGURATION = OperationModel.new(
        name: "UpdateChatResponseConfiguration",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/chatresponseconfigurations/{chatResponseConfigurationId}"
      )

      UPDATE_DATA_ACCESSOR = OperationModel.new(
        name: "UpdateDataAccessor",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/dataaccessors/{dataAccessorId}"
      )

      UPDATE_DATA_SOURCE = OperationModel.new(
        name: "UpdateDataSource",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/indices/{indexId}/datasources/{dataSourceId}"
      )

      UPDATE_INDEX = OperationModel.new(
        name: "UpdateIndex",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/indices/{indexId}"
      )

      UPDATE_PLUGIN = OperationModel.new(
        name: "UpdatePlugin",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/plugins/{pluginId}"
      )

      UPDATE_RETRIEVER = OperationModel.new(
        name: "UpdateRetriever",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/retrievers/{retrieverId}"
      )

      UPDATE_SUBSCRIPTION = OperationModel.new(
        name: "UpdateSubscription",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/subscriptions/{subscriptionId}"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/users/{userId}"
      )

      UPDATE_WEB_EXPERIENCE = OperationModel.new(
        name: "UpdateWebExperience",
        http_method: "PUT",
        request_uri: "/applications/{applicationId}/experiences/{webExperienceId}"
      )
    end
  end
end
