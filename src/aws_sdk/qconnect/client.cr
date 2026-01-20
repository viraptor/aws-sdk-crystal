module AwsSdk
  module QConnect
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
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Activates a specific version of the Amazon Q in Connect message template. After the version is
      # activated, the previous active version will be deactivated automatically. You can use the
      # $ACTIVE_VERSION qualifier later to reference the version that is in active status.

      def activate_message_template(
        knowledge_base_id : String,
        message_template_id : String,
        version_number : Int64
      ) : Protocol::Request
        input = Types::ActivateMessageTemplateRequest.new(knowledge_base_id: knowledge_base_id, message_template_id: message_template_id, version_number: version_number)
        activate_message_template(input)
      end

      def activate_message_template(input : Types::ActivateMessageTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACTIVATE_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q in Connect AI Agent.

      def create_ai_agent(
        assistant_id : String,
        configuration : Types::AIAgentConfiguration,
        name : String,
        type : String,
        visibility_status : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAIAgentRequest.new(assistant_id: assistant_id, configuration: configuration, name: name, type: type, visibility_status: visibility_status, client_token: client_token, description: description, tags: tags)
        create_ai_agent(input)
      end

      def create_ai_agent(input : Types::CreateAIAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AI_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and Amazon Q in Connect AI Agent version.

      def create_ai_agent_version(
        ai_agent_id : String,
        assistant_id : String,
        client_token : String? = nil,
        modified_time : Time? = nil
      ) : Protocol::Request
        input = Types::CreateAIAgentVersionRequest.new(ai_agent_id: ai_agent_id, assistant_id: assistant_id, client_token: client_token, modified_time: modified_time)
        create_ai_agent_version(input)
      end

      def create_ai_agent_version(input : Types::CreateAIAgentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AI_AGENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q in Connect AI Guardrail.

      def create_ai_guardrail(
        assistant_id : String,
        blocked_input_messaging : String,
        blocked_outputs_messaging : String,
        name : String,
        visibility_status : String,
        client_token : String? = nil,
        content_policy_config : Types::AIGuardrailContentPolicyConfig? = nil,
        contextual_grounding_policy_config : Types::AIGuardrailContextualGroundingPolicyConfig? = nil,
        description : String? = nil,
        sensitive_information_policy_config : Types::AIGuardrailSensitiveInformationPolicyConfig? = nil,
        tags : Hash(String, String)? = nil,
        topic_policy_config : Types::AIGuardrailTopicPolicyConfig? = nil,
        word_policy_config : Types::AIGuardrailWordPolicyConfig? = nil
      ) : Protocol::Request
        input = Types::CreateAIGuardrailRequest.new(assistant_id: assistant_id, blocked_input_messaging: blocked_input_messaging, blocked_outputs_messaging: blocked_outputs_messaging, name: name, visibility_status: visibility_status, client_token: client_token, content_policy_config: content_policy_config, contextual_grounding_policy_config: contextual_grounding_policy_config, description: description, sensitive_information_policy_config: sensitive_information_policy_config, tags: tags, topic_policy_config: topic_policy_config, word_policy_config: word_policy_config)
        create_ai_guardrail(input)
      end

      def create_ai_guardrail(input : Types::CreateAIGuardrailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AI_GUARDRAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q in Connect AI Guardrail version.

      def create_ai_guardrail_version(
        ai_guardrail_id : String,
        assistant_id : String,
        client_token : String? = nil,
        modified_time : Time? = nil
      ) : Protocol::Request
        input = Types::CreateAIGuardrailVersionRequest.new(ai_guardrail_id: ai_guardrail_id, assistant_id: assistant_id, client_token: client_token, modified_time: modified_time)
        create_ai_guardrail_version(input)
      end

      def create_ai_guardrail_version(input : Types::CreateAIGuardrailVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AI_GUARDRAIL_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q in Connect AI Prompt.

      def create_ai_prompt(
        api_format : String,
        assistant_id : String,
        model_id : String,
        name : String,
        template_configuration : Types::AIPromptTemplateConfiguration,
        template_type : String,
        type : String,
        visibility_status : String,
        client_token : String? = nil,
        description : String? = nil,
        inference_configuration : Types::AIPromptInferenceConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAIPromptRequest.new(api_format: api_format, assistant_id: assistant_id, model_id: model_id, name: name, template_configuration: template_configuration, template_type: template_type, type: type, visibility_status: visibility_status, client_token: client_token, description: description, inference_configuration: inference_configuration, tags: tags)
        create_ai_prompt(input)
      end

      def create_ai_prompt(input : Types::CreateAIPromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AI_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q in Connect AI Prompt version.

      def create_ai_prompt_version(
        ai_prompt_id : String,
        assistant_id : String,
        client_token : String? = nil,
        modified_time : Time? = nil
      ) : Protocol::Request
        input = Types::CreateAIPromptVersionRequest.new(ai_prompt_id: ai_prompt_id, assistant_id: assistant_id, client_token: client_token, modified_time: modified_time)
        create_ai_prompt_version(input)
      end

      def create_ai_prompt_version(input : Types::CreateAIPromptVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AI_PROMPT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q in Connect assistant.

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

      # Creates an association between an Amazon Q in Connect assistant and another resource. Currently, the
      # only supported association is with a knowledge base. An assistant can have only a single
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

      # Creates Amazon Q in Connect content. Before to calling this API, use StartContentUpload to upload an
      # asset.

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

      # Creates an association between a content resource in a knowledge base and step-by-step guides .
      # Step-by-step guides offer instructions to agents for resolving common customer issues. You create a
      # content association to integrate Amazon Q in Connect and step-by-step guides. After you integrate
      # Amazon Q and step-by-step guides, when Amazon Q provides a recommendation to an agent based on the
      # intent that it's detected, it also provides them with the option to start the step-by-step guide
      # that you have associated with the content. Note the following limitations: You can create only one
      # content association for each content resource in a knowledge base. You can associate a step-by-step
      # guide with multiple content resources. For more information, see Integrate Amazon Q in Connect with
      # step-by-step guides in the Amazon Connect Administrator Guide .

      def create_content_association(
        association : Types::ContentAssociationContents,
        association_type : String,
        content_id : String,
        knowledge_base_id : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateContentAssociationRequest.new(association: association, association_type: association_type, content_id: content_id, knowledge_base_id: knowledge_base_id, client_token: client_token, tags: tags)
        create_content_association(input)
      end

      def create_content_association(input : Types::CreateContentAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTENT_ASSOCIATION, input, endpoint)
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
        tags : Hash(String, String)? = nil,
        vector_ingestion_configuration : Types::VectorIngestionConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateKnowledgeBaseRequest.new(knowledge_base_type: knowledge_base_type, name: name, client_token: client_token, description: description, rendering_configuration: rendering_configuration, server_side_encryption_configuration: server_side_encryption_configuration, source_configuration: source_configuration, tags: tags, vector_ingestion_configuration: vector_ingestion_configuration)
        create_knowledge_base(input)
      end

      def create_knowledge_base(input : Types::CreateKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q in Connect message template. The name of the message template has to be unique
      # for each knowledge base. The channel subtype of the message template is immutable and cannot be
      # modified after creation. After the message template is created, you can use the $LATEST qualifier to
      # reference the created message template.

      def create_message_template(
        channel_subtype : String,
        knowledge_base_id : String,
        client_token : String? = nil,
        content : Types::MessageTemplateContentProvider? = nil,
        default_attributes : Types::MessageTemplateAttributes? = nil,
        description : String? = nil,
        grouping_configuration : Types::GroupingConfiguration? = nil,
        language : String? = nil,
        name : String? = nil,
        source_configuration : Types::MessageTemplateSourceConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMessageTemplateRequest.new(channel_subtype: channel_subtype, knowledge_base_id: knowledge_base_id, client_token: client_token, content: content, default_attributes: default_attributes, description: description, grouping_configuration: grouping_configuration, language: language, name: name, source_configuration: source_configuration, tags: tags)
        create_message_template(input)
      end

      def create_message_template(input : Types::CreateMessageTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uploads an attachment file to the specified Amazon Q in Connect message template. The name of the
      # message template attachment has to be unique for each message template referenced by the $LATEST
      # qualifier. The body of the attachment file should be encoded using base64 encoding. After the file
      # is uploaded, you can use the pre-signed Amazon S3 URL returned in response to download the uploaded
      # file.

      def create_message_template_attachment(
        body : String,
        content_disposition : String,
        knowledge_base_id : String,
        message_template_id : String,
        name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateMessageTemplateAttachmentRequest.new(body: body, content_disposition: content_disposition, knowledge_base_id: knowledge_base_id, message_template_id: message_template_id, name: name, client_token: client_token)
        create_message_template_attachment(input)
      end

      def create_message_template_attachment(input : Types::CreateMessageTemplateAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MESSAGE_TEMPLATE_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Amazon Q in Connect message template version from the current content and
      # configuration of a message template. Versions are immutable and monotonically increasing. Once a
      # version is created, you can reference a specific version of the message template by passing in
      # &lt;message-template-id&gt;:&lt;versionNumber&gt; as the message template identifier. An error is
      # displayed if the supplied messageTemplateContentSha256 is different from the
      # messageTemplateContentSha256 of the message template with $LATEST qualifier. If multiple
      # CreateMessageTemplateVersion requests are made while the message template remains the same, only the
      # first invocation creates a new version and the succeeding requests will return the same response as
      # the first invocation.

      def create_message_template_version(
        knowledge_base_id : String,
        message_template_id : String,
        message_template_content_sha256 : String? = nil
      ) : Protocol::Request
        input = Types::CreateMessageTemplateVersionRequest.new(knowledge_base_id: knowledge_base_id, message_template_id: message_template_id, message_template_content_sha256: message_template_content_sha256)
        create_message_template_version(input)
      end

      def create_message_template_version(input : Types::CreateMessageTemplateVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MESSAGE_TEMPLATE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q in Connect quick response.

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
      # Connect creates a new Amazon Q in Connect session for each contact on which Amazon Q in Connect is
      # enabled.

      def create_session(
        assistant_id : String,
        name : String,
        ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)? = nil,
        client_token : String? = nil,
        contact_arn : String? = nil,
        description : String? = nil,
        orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)? = nil,
        remove_orchestrator_configuration_list : Bool? = nil,
        tag_filter : Types::TagFilter? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSessionRequest.new(assistant_id: assistant_id, name: name, ai_agent_configuration: ai_agent_configuration, client_token: client_token, contact_arn: contact_arn, description: description, orchestrator_configuration_list: orchestrator_configuration_list, remove_orchestrator_configuration_list: remove_orchestrator_configuration_list, tag_filter: tag_filter, tags: tags)
        create_session(input)
      end

      def create_session(input : Types::CreateSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deactivates a specific version of the Amazon Q in Connect message template . After the version is
      # deactivated, you can no longer use the $ACTIVE_VERSION qualifier to reference the version in active
      # status.

      def deactivate_message_template(
        knowledge_base_id : String,
        message_template_id : String,
        version_number : Int64
      ) : Protocol::Request
        input = Types::DeactivateMessageTemplateRequest.new(knowledge_base_id: knowledge_base_id, message_template_id: message_template_id, version_number: version_number)
        deactivate_message_template(input)
      end

      def deactivate_message_template(input : Types::DeactivateMessageTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEACTIVATE_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q in Connect AI Agent.

      def delete_ai_agent(
        ai_agent_id : String,
        assistant_id : String
      ) : Protocol::Request
        input = Types::DeleteAIAgentRequest.new(ai_agent_id: ai_agent_id, assistant_id: assistant_id)
        delete_ai_agent(input)
      end

      def delete_ai_agent(input : Types::DeleteAIAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AI_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q in Connect AI Agent Version.

      def delete_ai_agent_version(
        ai_agent_id : String,
        assistant_id : String,
        version_number : Int64
      ) : Protocol::Request
        input = Types::DeleteAIAgentVersionRequest.new(ai_agent_id: ai_agent_id, assistant_id: assistant_id, version_number: version_number)
        delete_ai_agent_version(input)
      end

      def delete_ai_agent_version(input : Types::DeleteAIAgentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AI_AGENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q in Connect AI Guardrail.

      def delete_ai_guardrail(
        ai_guardrail_id : String,
        assistant_id : String
      ) : Protocol::Request
        input = Types::DeleteAIGuardrailRequest.new(ai_guardrail_id: ai_guardrail_id, assistant_id: assistant_id)
        delete_ai_guardrail(input)
      end

      def delete_ai_guardrail(input : Types::DeleteAIGuardrailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AI_GUARDRAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete and Amazon Q in Connect AI Guardrail version.

      def delete_ai_guardrail_version(
        ai_guardrail_id : String,
        assistant_id : String,
        version_number : Int64
      ) : Protocol::Request
        input = Types::DeleteAIGuardrailVersionRequest.new(ai_guardrail_id: ai_guardrail_id, assistant_id: assistant_id, version_number: version_number)
        delete_ai_guardrail_version(input)
      end

      def delete_ai_guardrail_version(input : Types::DeleteAIGuardrailVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AI_GUARDRAIL_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q in Connect AI Prompt.

      def delete_ai_prompt(
        ai_prompt_id : String,
        assistant_id : String
      ) : Protocol::Request
        input = Types::DeleteAIPromptRequest.new(ai_prompt_id: ai_prompt_id, assistant_id: assistant_id)
        delete_ai_prompt(input)
      end

      def delete_ai_prompt(input : Types::DeleteAIPromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AI_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete and Amazon Q in Connect AI Prompt version.

      def delete_ai_prompt_version(
        ai_prompt_id : String,
        assistant_id : String,
        version_number : Int64
      ) : Protocol::Request
        input = Types::DeleteAIPromptVersionRequest.new(ai_prompt_id: ai_prompt_id, assistant_id: assistant_id, version_number: version_number)
        delete_ai_prompt_version(input)
      end

      def delete_ai_prompt_version(input : Types::DeleteAIPromptVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AI_PROMPT_VERSION, input, endpoint)
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

      # Deletes the content association. For more information about content associations--what they are and
      # when they are used--see Integrate Amazon Q in Connect with step-by-step guides in the Amazon Connect
      # Administrator Guide .

      def delete_content_association(
        content_association_id : String,
        content_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::DeleteContentAssociationRequest.new(content_association_id: content_association_id, content_id: content_id, knowledge_base_id: knowledge_base_id)
        delete_content_association(input)
      end

      def delete_content_association(input : Types::DeleteContentAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTENT_ASSOCIATION, input, endpoint)
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

      # Deletes an Amazon Q in Connect message template entirely or a specific version of the message
      # template if version is supplied in the request. You can provide the message template identifier as
      # &lt;message-template-id&gt;:&lt;versionNumber&gt; to delete a specific version of the message
      # template. If it is not supplied, the message template and all available versions will be deleted.

      def delete_message_template(
        knowledge_base_id : String,
        message_template_id : String
      ) : Protocol::Request
        input = Types::DeleteMessageTemplateRequest.new(knowledge_base_id: knowledge_base_id, message_template_id: message_template_id)
        delete_message_template(input)
      end

      def delete_message_template(input : Types::DeleteMessageTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the attachment file from the Amazon Q in Connect message template that is referenced by
      # $LATEST qualifier. Attachments on available message template versions will remain unchanged.

      def delete_message_template_attachment(
        attachment_id : String,
        knowledge_base_id : String,
        message_template_id : String
      ) : Protocol::Request
        input = Types::DeleteMessageTemplateAttachmentRequest.new(attachment_id: attachment_id, knowledge_base_id: knowledge_base_id, message_template_id: message_template_id)
        delete_message_template_attachment(input)
      end

      def delete_message_template_attachment(input : Types::DeleteMessageTemplateAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MESSAGE_TEMPLATE_ATTACHMENT, input, endpoint)
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

      # Gets an Amazon Q in Connect AI Agent.

      def get_ai_agent(
        ai_agent_id : String,
        assistant_id : String
      ) : Protocol::Request
        input = Types::GetAIAgentRequest.new(ai_agent_id: ai_agent_id, assistant_id: assistant_id)
        get_ai_agent(input)
      end

      def get_ai_agent(input : Types::GetAIAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AI_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Amazon Q in Connect AI Guardrail.

      def get_ai_guardrail(
        ai_guardrail_id : String,
        assistant_id : String
      ) : Protocol::Request
        input = Types::GetAIGuardrailRequest.new(ai_guardrail_id: ai_guardrail_id, assistant_id: assistant_id)
        get_ai_guardrail(input)
      end

      def get_ai_guardrail(input : Types::GetAIGuardrailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AI_GUARDRAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets and Amazon Q in Connect AI Prompt.

      def get_ai_prompt(
        ai_prompt_id : String,
        assistant_id : String
      ) : Protocol::Request
        input = Types::GetAIPromptRequest.new(ai_prompt_id: ai_prompt_id, assistant_id: assistant_id)
        get_ai_prompt(input)
      end

      def get_ai_prompt(input : Types::GetAIPromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AI_PROMPT, input, endpoint)
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

      # Returns the content association. For more information about content associations--what they are and
      # when they are used--see Integrate Amazon Q in Connect with step-by-step guides in the Amazon Connect
      # Administrator Guide .

      def get_content_association(
        content_association_id : String,
        content_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetContentAssociationRequest.new(content_association_id: content_association_id, content_id: content_id, knowledge_base_id: knowledge_base_id)
        get_content_association(input)
      end

      def get_content_association(input : Types::GetContentAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTENT_ASSOCIATION, input, endpoint)
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

      # Retrieves the Amazon Q in Connect message template. The message template identifier can contain an
      # optional qualifier, for example, &lt;message-template-id&gt;:&lt;qualifier&gt; , which is either an
      # actual version number or an Amazon Q Connect managed qualifier $ACTIVE_VERSION | $LATEST . If it is
      # not supplied, then $LATEST is assumed implicitly.

      def get_message_template(
        knowledge_base_id : String,
        message_template_id : String
      ) : Protocol::Request
        input = Types::GetMessageTemplateRequest.new(knowledge_base_id: knowledge_base_id, message_template_id: message_template_id)
        get_message_template(input)
      end

      def get_message_template(input : Types::GetMessageTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves next message on an Amazon Q in Connect session.

      def get_next_message(
        assistant_id : String,
        next_message_token : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetNextMessageRequest.new(assistant_id: assistant_id, next_message_token: next_message_token, session_id: session_id)
        get_next_message(input)
      end

      def get_next_message(input : Types::GetNextMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NEXT_MESSAGE, input, endpoint)
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

      # This API will be discontinued starting June 1, 2024. To receive generative responses after March 1,
      # 2024, you will need to create a new Assistant in the Amazon Connect console and integrate the Amazon
      # Q in Connect JavaScript library (amazon-q-connectjs) into your applications. Retrieves
      # recommendations for the specified session. To avoid retrieving the same recommendations in
      # subsequent calls, use NotifyRecommendationsReceived . This API supports long-polling behavior with
      # the waitTimeSeconds parameter. Short poll is the default behavior and only returns recommendations
      # already available. To perform a manual query against an assistant, use QueryAssistant .

      def get_recommendations(
        assistant_id : String,
        session_id : String,
        max_results : Int32? = nil,
        next_chunk_token : String? = nil,
        recommendation_type : String? = nil,
        wait_time_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::GetRecommendationsRequest.new(assistant_id: assistant_id, session_id: session_id, max_results: max_results, next_chunk_token: next_chunk_token, recommendation_type: recommendation_type, wait_time_seconds: wait_time_seconds)
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

      # List AI Agent versions.

      def list_ai_agent_versions(
        ai_agent_id : String,
        assistant_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        origin : String? = nil
      ) : Protocol::Request
        input = Types::ListAIAgentVersionsRequest.new(ai_agent_id: ai_agent_id, assistant_id: assistant_id, max_results: max_results, next_token: next_token, origin: origin)
        list_ai_agent_versions(input)
      end

      def list_ai_agent_versions(input : Types::ListAIAgentVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AI_AGENT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists AI Agents.

      def list_ai_agents(
        assistant_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        origin : String? = nil
      ) : Protocol::Request
        input = Types::ListAIAgentsRequest.new(assistant_id: assistant_id, max_results: max_results, next_token: next_token, origin: origin)
        list_ai_agents(input)
      end

      def list_ai_agents(input : Types::ListAIAgentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AI_AGENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists AI Guardrail versions.

      def list_ai_guardrail_versions(
        ai_guardrail_id : String,
        assistant_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAIGuardrailVersionsRequest.new(ai_guardrail_id: ai_guardrail_id, assistant_id: assistant_id, max_results: max_results, next_token: next_token)
        list_ai_guardrail_versions(input)
      end

      def list_ai_guardrail_versions(input : Types::ListAIGuardrailVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AI_GUARDRAIL_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the AI Guardrails available on the Amazon Q in Connect assistant.

      def list_ai_guardrails(
        assistant_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAIGuardrailsRequest.new(assistant_id: assistant_id, max_results: max_results, next_token: next_token)
        list_ai_guardrails(input)
      end

      def list_ai_guardrails(input : Types::ListAIGuardrailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AI_GUARDRAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists AI Prompt versions.

      def list_ai_prompt_versions(
        ai_prompt_id : String,
        assistant_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        origin : String? = nil
      ) : Protocol::Request
        input = Types::ListAIPromptVersionsRequest.new(ai_prompt_id: ai_prompt_id, assistant_id: assistant_id, max_results: max_results, next_token: next_token, origin: origin)
        list_ai_prompt_versions(input)
      end

      def list_ai_prompt_versions(input : Types::ListAIPromptVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AI_PROMPT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the AI Prompts available on the Amazon Q in Connect assistant.

      def list_ai_prompts(
        assistant_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        origin : String? = nil
      ) : Protocol::Request
        input = Types::ListAIPromptsRequest.new(assistant_id: assistant_id, max_results: max_results, next_token: next_token, origin: origin)
        list_ai_prompts(input)
      end

      def list_ai_prompts(input : Types::ListAIPromptsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AI_PROMPTS, input, endpoint)
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

      # Lists the content associations. For more information about content associations--what they are and
      # when they are used--see Integrate Amazon Q in Connect with step-by-step guides in the Amazon Connect
      # Administrator Guide .

      def list_content_associations(
        content_id : String,
        knowledge_base_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListContentAssociationsRequest.new(content_id: content_id, knowledge_base_id: knowledge_base_id, max_results: max_results, next_token: next_token)
        list_content_associations(input)
      end

      def list_content_associations(input : Types::ListContentAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTENT_ASSOCIATIONS, input, endpoint)
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

      # Lists all the available versions for the specified Amazon Q in Connect message template.

      def list_message_template_versions(
        knowledge_base_id : String,
        message_template_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMessageTemplateVersionsRequest.new(knowledge_base_id: knowledge_base_id, message_template_id: message_template_id, max_results: max_results, next_token: next_token)
        list_message_template_versions(input)
      end

      def list_message_template_versions(input : Types::ListMessageTemplateVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MESSAGE_TEMPLATE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the available Amazon Q in Connect message templates for the specified knowledge base.

      def list_message_templates(
        knowledge_base_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMessageTemplatesRequest.new(knowledge_base_id: knowledge_base_id, max_results: max_results, next_token: next_token)
        list_message_templates(input)
      end

      def list_message_templates(input : Types::ListMessageTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MESSAGE_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists messages on an Amazon Q in Connect session.

      def list_messages(
        assistant_id : String,
        session_id : String,
        filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMessagesRequest.new(assistant_id: assistant_id, session_id: session_id, filter: filter, max_results: max_results, next_token: next_token)
        list_messages(input)
      end

      def list_messages(input : Types::ListMessagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MESSAGES, input, endpoint)
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

      # Retrieves AI agent execution traces for a session, providing granular visibility into agent
      # orchestration flows, LLM interactions, and tool invocations.

      def list_spans(
        assistant_id : String,
        session_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSpansRequest.new(assistant_id: assistant_id, session_id: session_id, max_results: max_results, next_token: next_token)
        list_spans(input)
      end

      def list_spans(input : Types::ListSpansRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SPANS, input, endpoint)
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

      # Provides feedback against the specified assistant for the specified target. This API only supports
      # generative targets.

      def put_feedback(
        assistant_id : String,
        content_feedback : Types::ContentFeedbackData,
        target_id : String,
        target_type : String
      ) : Protocol::Request
        input = Types::PutFeedbackRequest.new(assistant_id: assistant_id, content_feedback: content_feedback, target_id: target_id, target_type: target_type)
        put_feedback(input)
      end

      def put_feedback(input : Types::PutFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API will be discontinued starting June 1, 2024. To receive generative responses after March 1,
      # 2024, you will need to create a new Assistant in the Amazon Connect console and integrate the Amazon
      # Q in Connect JavaScript library (amazon-q-connectjs) into your applications. Performs a manual
      # search against the specified assistant. To retrieve recommendations for an assistant, use
      # GetRecommendations .

      def query_assistant(
        assistant_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        override_knowledge_base_search_type : String? = nil,
        query_condition : Array(Types::QueryCondition)? = nil,
        query_input_data : Types::QueryInputData? = nil,
        query_text : String? = nil,
        session_id : String? = nil
      ) : Protocol::Request
        input = Types::QueryAssistantRequest.new(assistant_id: assistant_id, max_results: max_results, next_token: next_token, override_knowledge_base_search_type: override_knowledge_base_search_type, query_condition: query_condition, query_input_data: query_input_data, query_text: query_text, session_id: session_id)
        query_assistant(input)
      end

      def query_assistant(input : Types::QueryAssistantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::QUERY_ASSISTANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the AI Agent that is set for use by default on an Amazon Q in Connect Assistant.

      def remove_assistant_ai_agent(
        ai_agent_type : String,
        assistant_id : String,
        orchestrator_use_case : String? = nil
      ) : Protocol::Request
        input = Types::RemoveAssistantAIAgentRequest.new(ai_agent_type: ai_agent_type, assistant_id: assistant_id, orchestrator_use_case: orchestrator_use_case)
        remove_assistant_ai_agent(input)
      end

      def remove_assistant_ai_agent(input : Types::RemoveAssistantAIAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_ASSISTANT_AI_AGENT, input, endpoint)
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

      # Renders the Amazon Q in Connect message template based on the attribute values provided and
      # generates the message content. For any variable present in the message template, if the attribute
      # value is neither provided in the attribute request parameter nor the default attribute of the
      # message template, the rendered message content will keep the variable placeholder as it is and
      # return the attribute keys that are missing.

      def render_message_template(
        attributes : Types::MessageTemplateAttributes,
        knowledge_base_id : String,
        message_template_id : String
      ) : Protocol::Request
        input = Types::RenderMessageTemplateRequest.new(attributes: attributes, knowledge_base_id: knowledge_base_id, message_template_id: message_template_id)
        render_message_template(input)
      end

      def render_message_template(input : Types::RenderMessageTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RENDER_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves content from knowledge sources based on a query.

      def retrieve(
        assistant_id : String,
        retrieval_configuration : Types::RetrievalConfiguration,
        retrieval_query : String
      ) : Protocol::Request
        input = Types::RetrieveRequest.new(assistant_id: assistant_id, retrieval_configuration: retrieval_configuration, retrieval_query: retrieval_query)
        retrieve(input)
      end

      def retrieve(input : Types::RetrieveRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETRIEVE, input, endpoint)
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

      # Searches for Amazon Q in Connect message templates in the specified knowledge base.

      def search_message_templates(
        knowledge_base_id : String,
        search_expression : Types::MessageTemplateSearchExpression,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchMessageTemplatesRequest.new(knowledge_base_id: knowledge_base_id, search_expression: search_expression, max_results: max_results, next_token: next_token)
        search_message_templates(input)
      end

      def search_message_templates(input : Types::SearchMessageTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_MESSAGE_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches existing Amazon Q in Connect quick responses in an Amazon Q in Connect knowledge base.

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

      # Submits a message to the Amazon Q in Connect session.

      def send_message(
        assistant_id : String,
        message : Types::MessageInput,
        session_id : String,
        type : String,
        ai_agent_id : String? = nil,
        client_token : String? = nil,
        configuration : Types::MessageConfiguration? = nil,
        conversation_context : Types::ConversationContext? = nil,
        metadata : Hash(String, String)? = nil,
        orchestrator_use_case : String? = nil
      ) : Protocol::Request
        input = Types::SendMessageRequest.new(assistant_id: assistant_id, message: message, session_id: session_id, type: type, ai_agent_id: ai_agent_id, client_token: client_token, configuration: configuration, conversation_context: conversation_context, metadata: metadata, orchestrator_use_case: orchestrator_use_case)
        send_message(input)
      end

      def send_message(input : Types::SendMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_MESSAGE, input, endpoint)
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

      # Start an asynchronous job to import Amazon Q in Connect resources from an uploaded source file.
      # Before calling this API, use StartContentUpload to upload an asset that contains the resource data.
      # For importing Amazon Q in Connect quick responses, you need to upload a csv file including the quick
      # responses. For information about how to format the csv file for importing quick responses, see
      # Import quick responses .

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

      # Updates an AI Agent.

      def update_ai_agent(
        ai_agent_id : String,
        assistant_id : String,
        visibility_status : String,
        client_token : String? = nil,
        configuration : Types::AIAgentConfiguration? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAIAgentRequest.new(ai_agent_id: ai_agent_id, assistant_id: assistant_id, visibility_status: visibility_status, client_token: client_token, configuration: configuration, description: description)
        update_ai_agent(input)
      end

      def update_ai_agent(input : Types::UpdateAIAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AI_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an AI Guardrail.

      def update_ai_guardrail(
        ai_guardrail_id : String,
        assistant_id : String,
        blocked_input_messaging : String,
        blocked_outputs_messaging : String,
        visibility_status : String,
        client_token : String? = nil,
        content_policy_config : Types::AIGuardrailContentPolicyConfig? = nil,
        contextual_grounding_policy_config : Types::AIGuardrailContextualGroundingPolicyConfig? = nil,
        description : String? = nil,
        sensitive_information_policy_config : Types::AIGuardrailSensitiveInformationPolicyConfig? = nil,
        topic_policy_config : Types::AIGuardrailTopicPolicyConfig? = nil,
        word_policy_config : Types::AIGuardrailWordPolicyConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateAIGuardrailRequest.new(ai_guardrail_id: ai_guardrail_id, assistant_id: assistant_id, blocked_input_messaging: blocked_input_messaging, blocked_outputs_messaging: blocked_outputs_messaging, visibility_status: visibility_status, client_token: client_token, content_policy_config: content_policy_config, contextual_grounding_policy_config: contextual_grounding_policy_config, description: description, sensitive_information_policy_config: sensitive_information_policy_config, topic_policy_config: topic_policy_config, word_policy_config: word_policy_config)
        update_ai_guardrail(input)
      end

      def update_ai_guardrail(input : Types::UpdateAIGuardrailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AI_GUARDRAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an AI Prompt.

      def update_ai_prompt(
        ai_prompt_id : String,
        assistant_id : String,
        visibility_status : String,
        client_token : String? = nil,
        description : String? = nil,
        inference_configuration : Types::AIPromptInferenceConfiguration? = nil,
        model_id : String? = nil,
        template_configuration : Types::AIPromptTemplateConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateAIPromptRequest.new(ai_prompt_id: ai_prompt_id, assistant_id: assistant_id, visibility_status: visibility_status, client_token: client_token, description: description, inference_configuration: inference_configuration, model_id: model_id, template_configuration: template_configuration)
        update_ai_prompt(input)
      end

      def update_ai_prompt(input : Types::UpdateAIPromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AI_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the AI Agent that is set for use by default on an Amazon Q in Connect Assistant.

      def update_assistant_ai_agent(
        ai_agent_type : String,
        assistant_id : String,
        configuration : Types::AIAgentConfigurationData,
        orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)? = nil
      ) : Protocol::Request
        input = Types::UpdateAssistantAIAgentRequest.new(ai_agent_type: ai_agent_type, assistant_id: assistant_id, configuration: configuration, orchestrator_configuration_list: orchestrator_configuration_list)
        update_assistant_ai_agent(input)
      end

      def update_assistant_ai_agent(input : Types::UpdateAssistantAIAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSISTANT_AI_AGENT, input, endpoint)
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
      # EXTERNAL. Include a single variable in ${variable} format; this interpolated by Amazon Q in Connect
      # using ingested content. For example, if you ingest a Salesforce article, it has an Id value, and you
      # can set the template URI to
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

      # Updates the Amazon Q in Connect message template. Partial update is supported. If any field is not
      # supplied, it will remain unchanged for the message template that is referenced by the $LATEST
      # qualifier. Any modification will only apply to the message template that is referenced by the
      # $LATEST qualifier. The fields for all available versions will remain unchanged.

      def update_message_template(
        knowledge_base_id : String,
        message_template_id : String,
        content : Types::MessageTemplateContentProvider? = nil,
        default_attributes : Types::MessageTemplateAttributes? = nil,
        language : String? = nil,
        source_configuration : Types::MessageTemplateSourceConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateMessageTemplateRequest.new(knowledge_base_id: knowledge_base_id, message_template_id: message_template_id, content: content, default_attributes: default_attributes, language: language, source_configuration: source_configuration)
        update_message_template(input)
      end

      def update_message_template(input : Types::UpdateMessageTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Amazon Q in Connect message template metadata. Note that any modification to the message
      # template’s name, description and grouping configuration will applied to the message template pointed
      # by the $LATEST qualifier and all available versions. Partial update is supported. If any field is
      # not supplied, it will remain unchanged for the message template.

      def update_message_template_metadata(
        knowledge_base_id : String,
        message_template_id : String,
        description : String? = nil,
        grouping_configuration : Types::GroupingConfiguration? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMessageTemplateMetadataRequest.new(knowledge_base_id: knowledge_base_id, message_template_id: message_template_id, description: description, grouping_configuration: grouping_configuration, name: name)
        update_message_template_metadata(input)
      end

      def update_message_template_metadata(input : Types::UpdateMessageTemplateMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MESSAGE_TEMPLATE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Amazon Q in Connect quick response.

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

      # Updates a session. A session is a contextual container used for generating recommendations. Amazon
      # Connect updates the existing Amazon Q in Connect session for each contact on which Amazon Q in
      # Connect is enabled.

      def update_session(
        assistant_id : String,
        session_id : String,
        ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)? = nil,
        description : String? = nil,
        orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)? = nil,
        remove_orchestrator_configuration_list : Bool? = nil,
        tag_filter : Types::TagFilter? = nil
      ) : Protocol::Request
        input = Types::UpdateSessionRequest.new(assistant_id: assistant_id, session_id: session_id, ai_agent_configuration: ai_agent_configuration, description: description, orchestrator_configuration_list: orchestrator_configuration_list, remove_orchestrator_configuration_list: remove_orchestrator_configuration_list, tag_filter: tag_filter)
        update_session(input)
      end

      def update_session(input : Types::UpdateSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the data stored on an Amazon Q in Connect Session.

      def update_session_data(
        assistant_id : String,
        data : Array(Types::RuntimeSessionData),
        session_id : String,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSessionDataRequest.new(assistant_id: assistant_id, data: data, session_id: session_id, namespace: namespace)
        update_session_data(input)
      end

      def update_session_data(input : Types::UpdateSessionDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SESSION_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
