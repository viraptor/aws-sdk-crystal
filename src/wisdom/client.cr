module Aws
  module Wisdom
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates an Amazon Connect Wisdom assistant.

      def create_assistant(
        name : String,
        type : String,
        client_token : String? = nil,
        description : String? = nil,
        server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAssistantRequest.new(name: name, type: type, client_token: client_token, description: description, server_side_encryption_configuration: server_side_encryption_configuration, tags: tags)
        create_assistant(input)
      end

      def create_assistant(input : Types::CreateAssistantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSISTANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an association between an Amazon Connect Wisdom assistant and another resource. Currently,
      # the only supported association is with a knowledge base. An assistant can have only a single
      # association.

      def create_assistant_association(
        assistant_id : String,
        association : Types::AssistantAssociationInputData,
        association_type : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAssistantAssociationRequest.new(assistant_id: assistant_id, association: association, association_type: association_type, client_token: client_token, tags: tags)
        create_assistant_association(input)
      end

      def create_assistant_association(input : Types::CreateAssistantAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSISTANT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates Wisdom content. Before to calling this API, use StartContentUpload to upload an asset.

      def create_content(
        knowledge_base_id : String,
        name : String,
        upload_id : String,
        client_token : String? = nil,
        metadata : Hash(String, String)? = nil,
        override_link_out_uri : String? = nil,
        tags : Hash(String, String)? = nil,
        title : String? = nil
      ) : Protocol::Request
        input = Types::CreateContentRequest.new(knowledge_base_id: knowledge_base_id, name: name, upload_id: upload_id, client_token: client_token, metadata: metadata, override_link_out_uri: override_link_out_uri, tags: tags, title: title)
        create_content(input)
      end

      def create_content(input : Types::CreateContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a knowledge base. When using this API, you cannot reuse Amazon AppIntegrations
      # DataIntegrations with external knowledge bases such as Salesforce and ServiceNow. If you do, you'll
      # get an InvalidRequestException error. For example, you're programmatically managing your external
      # knowledge base, and you want to add or remove one of the fields that is being ingested from
      # Salesforce. Do the following: Call DeleteKnowledgeBase . Call DeleteDataIntegration . Call
      # CreateDataIntegration to recreate the DataIntegration or a create different one. Call
      # CreateKnowledgeBase.

      def create_knowledge_base(
        knowledge_base_type : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        rendering_configuration : Types::RenderingConfiguration? = nil,
        server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
        source_configuration : Types::SourceConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateKnowledgeBaseRequest.new(knowledge_base_type: knowledge_base_type, name: name, client_token: client_token, description: description, rendering_configuration: rendering_configuration, server_side_encryption_configuration: server_side_encryption_configuration, source_configuration: source_configuration, tags: tags)
        create_knowledge_base(input)
      end

      def create_knowledge_base(input : Types::CreateKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Wisdom quick response.

      def create_quick_response(
        content : Types::QuickResponseDataProvider,
        knowledge_base_id : String,
        name : String,
        channels : Array(String)? = nil,
        client_token : String? = nil,
        content_type : String? = nil,
        description : String? = nil,
        grouping_configuration : Types::GroupingConfiguration? = nil,
        is_active : Bool? = nil,
        language : String? = nil,
        shortcut_key : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateQuickResponseRequest.new(content: content, knowledge_base_id: knowledge_base_id, name: name, channels: channels, client_token: client_token, content_type: content_type, description: description, grouping_configuration: grouping_configuration, is_active: is_active, language: language, shortcut_key: shortcut_key, tags: tags)
        create_quick_response(input)
      end

      def create_quick_response(input : Types::CreateQuickResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUICK_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a session. A session is a contextual container used for generating recommendations. Amazon
      # Connect creates a new Wisdom session for each contact on which Wisdom is enabled.

      def create_session(
        assistant_id : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSessionRequest.new(assistant_id: assistant_id, name: name, client_token: client_token, description: description, tags: tags)
        create_session(input)
      end

      def create_session(input : Types::CreateSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an assistant.

      def delete_assistant(
        assistant_id : String
      ) : Protocol::Request
        input = Types::DeleteAssistantRequest.new(assistant_id: assistant_id)
        delete_assistant(input)
      end

      def delete_assistant(input : Types::DeleteAssistantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSISTANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an assistant association.

      def delete_assistant_association(
        assistant_association_id : String,
        assistant_id : String
      ) : Protocol::Request
        input = Types::DeleteAssistantAssociationRequest.new(assistant_association_id: assistant_association_id, assistant_id: assistant_id)
        delete_assistant_association(input)
      end

      def delete_assistant_association(input : Types::DeleteAssistantAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSISTANT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the content.

      def delete_content(
        content_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::DeleteContentRequest.new(content_id: content_id, knowledge_base_id: knowledge_base_id)
        delete_content(input)
      end

      def delete_content(input : Types::DeleteContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the quick response import job.

      def delete_import_job(
        import_job_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::DeleteImportJobRequest.new(import_job_id: import_job_id, knowledge_base_id: knowledge_base_id)
        delete_import_job(input)
      end

      def delete_import_job(input : Types::DeleteImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the knowledge base. When you use this API to delete an external knowledge base such as
      # Salesforce or ServiceNow, you must also delete the Amazon AppIntegrations DataIntegration. This is
      # because you can't reuse the DataIntegration after it's been associated with an external knowledge
      # base. However, you can delete and recreate it. See DeleteDataIntegration and CreateDataIntegration
      # in the Amazon AppIntegrations API Reference .

      def delete_knowledge_base(
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::DeleteKnowledgeBaseRequest.new(knowledge_base_id: knowledge_base_id)
        delete_knowledge_base(input)
      end

      def delete_knowledge_base(input : Types::DeleteKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a quick response.

      def delete_quick_response(
        knowledge_base_id : String,
        quick_response_id : String
      ) : Protocol::Request
        input = Types::DeleteQuickResponseRequest.new(knowledge_base_id: knowledge_base_id, quick_response_id: quick_response_id)
        delete_quick_response(input)
      end

      def delete_quick_response(input : Types::DeleteQuickResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUICK_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an assistant.

      def get_assistant(
        assistant_id : String
      ) : Protocol::Request
        input = Types::GetAssistantRequest.new(assistant_id: assistant_id)
        get_assistant(input)
      end

      def get_assistant(input : Types::GetAssistantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSISTANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an assistant association.

      def get_assistant_association(
        assistant_association_id : String,
        assistant_id : String
      ) : Protocol::Request
        input = Types::GetAssistantAssociationRequest.new(assistant_association_id: assistant_association_id, assistant_id: assistant_id)
        get_assistant_association(input)
      end

      def get_assistant_association(input : Types::GetAssistantAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSISTANT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves content, including a pre-signed URL to download the content.

      def get_content(
        content_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetContentRequest.new(content_id: content_id, knowledge_base_id: knowledge_base_id)
        get_content(input)
      end

      def get_content(input : Types::GetContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves summary information about the content.

      def get_content_summary(
        content_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetContentSummaryRequest.new(content_id: content_id, knowledge_base_id: knowledge_base_id)
        get_content_summary(input)
      end

      def get_content_summary(input : Types::GetContentSummaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTENT_SUMMARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the started import job.

      def get_import_job(
        import_job_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetImportJobRequest.new(import_job_id: import_job_id, knowledge_base_id: knowledge_base_id)
        get_import_job(input)
      end

      def get_import_job(input : Types::GetImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the knowledge base.

      def get_knowledge_base(
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetKnowledgeBaseRequest.new(knowledge_base_id: knowledge_base_id)
        get_knowledge_base(input)
      end

      def get_knowledge_base(input : Types::GetKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the quick response.

      def get_quick_response(
        knowledge_base_id : String,
        quick_response_id : String
      ) : Protocol::Request
        input = Types::GetQuickResponseRequest.new(knowledge_base_id: knowledge_base_id, quick_response_id: quick_response_id)
        get_quick_response(input)
      end

      def get_quick_response(input : Types::GetQuickResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUICK_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves recommendations for the specified session. To avoid retrieving the same recommendations in
      # subsequent calls, use NotifyRecommendationsReceived . This API supports long-polling behavior with
      # the waitTimeSeconds parameter. Short poll is the default behavior and only returns recommendations
      # already available. To perform a manual query against an assistant, use QueryAssistant .

      def get_recommendations(
        assistant_id : String,
        session_id : String,
        max_results : Int32? = nil,
        wait_time_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::GetRecommendationsRequest.new(assistant_id: assistant_id, session_id: session_id, max_results: max_results, wait_time_seconds: wait_time_seconds)
        get_recommendations(input)
      end

      def get_recommendations(input : Types::GetRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information for a specified session.

      def get_session(
        assistant_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetSessionRequest.new(assistant_id: assistant_id, session_id: session_id)
        get_session(input)
      end

      def get_session(input : Types::GetSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about assistant associations.

      def list_assistant_associations(
        assistant_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssistantAssociationsRequest.new(assistant_id: assistant_id, max_results: max_results, next_token: next_token)
        list_assistant_associations(input)
      end

      def list_assistant_associations(input : Types::ListAssistantAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSISTANT_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about assistants.

      def list_assistants(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssistantsRequest.new(max_results: max_results, next_token: next_token)
        list_assistants(input)
      end

      def list_assistants(input : Types::ListAssistantsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSISTANTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the content.

      def list_contents(
        knowledge_base_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListContentsRequest.new(knowledge_base_id: knowledge_base_id, max_results: max_results, next_token: next_token)
        list_contents(input)
      end

      def list_contents(input : Types::ListContentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about import jobs.

      def list_import_jobs(
        knowledge_base_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImportJobsRequest.new(knowledge_base_id: knowledge_base_id, max_results: max_results, next_token: next_token)
        list_import_jobs(input)
      end

      def list_import_jobs(input : Types::ListImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the knowledge bases.

      def list_knowledge_bases(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKnowledgeBasesRequest.new(max_results: max_results, next_token: next_token)
        list_knowledge_bases(input)
      end

      def list_knowledge_bases(input : Types::ListKnowledgeBasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KNOWLEDGE_BASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about quick response.

      def list_quick_responses(
        knowledge_base_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListQuickResponsesRequest.new(knowledge_base_id: knowledge_base_id, max_results: max_results, next_token: next_token)
        list_quick_responses(input)
      end

      def list_quick_responses(input : Types::ListQuickResponsesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUICK_RESPONSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for the specified resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified recommendations from the specified assistant's queue of newly available
      # recommendations. You can use this API in conjunction with GetRecommendations and a waitTimeSeconds
      # input for long-polling behavior and avoiding duplicate recommendations.

      def notify_recommendations_received(
        assistant_id : String,
        recommendation_ids : Array(String),
        session_id : String
      ) : Protocol::Request
        input = Types::NotifyRecommendationsReceivedRequest.new(assistant_id: assistant_id, recommendation_ids: recommendation_ids, session_id: session_id)
        notify_recommendations_received(input)
      end

      def notify_recommendations_received(input : Types::NotifyRecommendationsReceivedRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::NOTIFY_RECOMMENDATIONS_RECEIVED, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs a manual search against the specified assistant. To retrieve recommendations for an
      # assistant, use GetRecommendations .

      def query_assistant(
        assistant_id : String,
        query_text : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::QueryAssistantRequest.new(assistant_id: assistant_id, query_text: query_text, max_results: max_results, next_token: next_token)
        query_assistant(input)
      end

      def query_assistant(input : Types::QueryAssistantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::QUERY_ASSISTANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a URI template from a knowledge base.

      def remove_knowledge_base_template_uri(
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::RemoveKnowledgeBaseTemplateUriRequest.new(knowledge_base_id: knowledge_base_id)
        remove_knowledge_base_template_uri(input)
      end

      def remove_knowledge_base_template_uri(input : Types::RemoveKnowledgeBaseTemplateUriRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_KNOWLEDGE_BASE_TEMPLATE_URI, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for content in a specified knowledge base. Can be used to get a specific content resource
      # by its name.

      def search_content(
        knowledge_base_id : String,
        search_expression : Types::SearchExpression,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchContentRequest.new(knowledge_base_id: knowledge_base_id, search_expression: search_expression, max_results: max_results, next_token: next_token)
        search_content(input)
      end

      def search_content(input : Types::SearchContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches existing Wisdom quick responses in a Wisdom knowledge base.

      def search_quick_responses(
        knowledge_base_id : String,
        search_expression : Types::QuickResponseSearchExpression,
        attributes : Hash(String, String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchQuickResponsesRequest.new(knowledge_base_id: knowledge_base_id, search_expression: search_expression, attributes: attributes, max_results: max_results, next_token: next_token)
        search_quick_responses(input)
      end

      def search_quick_responses(input : Types::SearchQuickResponsesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_QUICK_RESPONSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for sessions.

      def search_sessions(
        assistant_id : String,
        search_expression : Types::SearchExpression,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchSessionsRequest.new(assistant_id: assistant_id, search_expression: search_expression, max_results: max_results, next_token: next_token)
        search_sessions(input)
      end

      def search_sessions(input : Types::SearchSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a URL to upload content to a knowledge base. To upload content, first make a PUT request to the
      # returned URL with your file, making sure to include the required headers. Then use CreateContent to
      # finalize the content creation process or UpdateContent to modify an existing resource. You can only
      # upload content to a knowledge base of type CUSTOM.

      def start_content_upload(
        content_type : String,
        knowledge_base_id : String,
        presigned_url_time_to_live : Int32? = nil
      ) : Protocol::Request
        input = Types::StartContentUploadRequest.new(content_type: content_type, knowledge_base_id: knowledge_base_id, presigned_url_time_to_live: presigned_url_time_to_live)
        start_content_upload(input)
      end

      def start_content_upload(input : Types::StartContentUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONTENT_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start an asynchronous job to import Wisdom resources from an uploaded source file. Before calling
      # this API, use StartContentUpload to upload an asset that contains the resource data. For importing
      # Wisdom quick responses, you need to upload a csv file including the quick responses. For information
      # about how to format the csv file for importing quick responses, see Import quick responses .

      def start_import_job(
        import_job_type : String,
        knowledge_base_id : String,
        upload_id : String,
        client_token : String? = nil,
        external_source_configuration : Types::ExternalSourceConfiguration? = nil,
        metadata : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartImportJobRequest.new(import_job_type: import_job_type, knowledge_base_id: knowledge_base_id, upload_id: upload_id, client_token: client_token, external_source_configuration: external_source_configuration, metadata: metadata)
        start_import_job(input)
      end

      def start_import_job(input : Types::StartImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tags to the specified resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified tags from the specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates information about the content.

      def update_content(
        content_id : String,
        knowledge_base_id : String,
        metadata : Hash(String, String)? = nil,
        override_link_out_uri : String? = nil,
        remove_override_link_out_uri : Bool? = nil,
        revision_id : String? = nil,
        title : String? = nil,
        upload_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateContentRequest.new(content_id: content_id, knowledge_base_id: knowledge_base_id, metadata: metadata, override_link_out_uri: override_link_out_uri, remove_override_link_out_uri: remove_override_link_out_uri, revision_id: revision_id, title: title, upload_id: upload_id)
        update_content(input)
      end

      def update_content(input : Types::UpdateContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the template URI of a knowledge base. This is only supported for knowledge bases of type
      # EXTERNAL. Include a single variable in ${variable} format; this interpolated by Wisdom using
      # ingested content. For example, if you ingest a Salesforce article, it has an Id value, and you can
      # set the template URI to
      # https://myInstanceName.lightning.force.com/lightning/r/Knowledge__kav/*${Id}*/view .

      def update_knowledge_base_template_uri(
        knowledge_base_id : String,
        template_uri : String
      ) : Protocol::Request
        input = Types::UpdateKnowledgeBaseTemplateUriRequest.new(knowledge_base_id: knowledge_base_id, template_uri: template_uri)
        update_knowledge_base_template_uri(input)
      end

      def update_knowledge_base_template_uri(input : Types::UpdateKnowledgeBaseTemplateUriRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KNOWLEDGE_BASE_TEMPLATE_URI, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Wisdom quick response.

      def update_quick_response(
        knowledge_base_id : String,
        quick_response_id : String,
        channels : Array(String)? = nil,
        content : Types::QuickResponseDataProvider? = nil,
        content_type : String? = nil,
        description : String? = nil,
        grouping_configuration : Types::GroupingConfiguration? = nil,
        is_active : Bool? = nil,
        language : String? = nil,
        name : String? = nil,
        remove_description : Bool? = nil,
        remove_grouping_configuration : Bool? = nil,
        remove_shortcut_key : Bool? = nil,
        shortcut_key : String? = nil
      ) : Protocol::Request
        input = Types::UpdateQuickResponseRequest.new(knowledge_base_id: knowledge_base_id, quick_response_id: quick_response_id, channels: channels, content: content, content_type: content_type, description: description, grouping_configuration: grouping_configuration, is_active: is_active, language: language, name: name, remove_description: remove_description, remove_grouping_configuration: remove_grouping_configuration, remove_shortcut_key: remove_shortcut_key, shortcut_key: shortcut_key)
        update_quick_response(input)
      end

      def update_quick_response(input : Types::UpdateQuickResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUICK_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
