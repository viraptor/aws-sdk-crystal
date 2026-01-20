module AwsSdk
  module QBusiness
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

      # Adds or updates a permission policy for a Amazon Q Business application, allowing cross-account
      # access for an ISV. This operation creates a new policy statement for the specified Amazon Q Business
      # application. The policy statement defines the IAM actions that the ISV is allowed to perform on the
      # Amazon Q Business application's resources.

      def associate_permission(
        actions : Array(String),
        application_id : String,
        principal : String,
        statement_id : String,
        conditions : Array(Types::PermissionCondition)? = nil
      ) : Protocol::Request
        input = Types::AssociatePermissionRequest.new(actions: actions, application_id: application_id, principal: principal, statement_id: statement_id, conditions: conditions)
        associate_permission(input)
      end

      def associate_permission(input : Types::AssociatePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Asynchronously deletes one or more documents added using the BatchPutDocument API from an Amazon Q
      # Business index. You can see the progress of the deletion, and any error messages related to the
      # process, by using CloudWatch.

      def batch_delete_document(
        application_id : String,
        documents : Array(Types::DeleteDocument),
        index_id : String,
        data_source_sync_id : String? = nil
      ) : Protocol::Request
        input = Types::BatchDeleteDocumentRequest.new(application_id: application_id, documents: documents, index_id: index_id, data_source_sync_id: data_source_sync_id)
        batch_delete_document(input)
      end

      def batch_delete_document(input : Types::BatchDeleteDocumentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_DOCUMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more documents to an Amazon Q Business index. You use this API to: ingest your
      # structured and unstructured documents and documents stored in an Amazon S3 bucket into an Amazon Q
      # Business index. add custom attributes to documents in an Amazon Q Business index. attach an access
      # control list to the documents added to an Amazon Q Business index. You can see the progress of the
      # deletion, and any error messages related to the process, by using CloudWatch.

      def batch_put_document(
        application_id : String,
        documents : Array(Types::Document),
        index_id : String,
        data_source_sync_id : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::BatchPutDocumentRequest.new(application_id: application_id, documents: documents, index_id: index_id, data_source_sync_id: data_source_sync_id, role_arn: role_arn)
        batch_put_document(input)
      end

      def batch_put_document(input : Types::BatchPutDocumentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_DOCUMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Unsubscribes a user or a group from their pricing tier in an Amazon Q Business application. An
      # unsubscribed user or group loses all Amazon Q Business feature access at the start of next month.

      def cancel_subscription(
        application_id : String,
        subscription_id : String
      ) : Protocol::Request
        input = Types::CancelSubscriptionRequest.new(application_id: application_id, subscription_id: subscription_id)
        cancel_subscription(input)
      end

      def cancel_subscription(input : Types::CancelSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts or continues a streaming Amazon Q Business conversation.

      def chat(
        application_id : String,
        client_token : String? = nil,
        conversation_id : String? = nil,
        input_stream : Types::ChatInputStream? = nil,
        parent_message_id : String? = nil,
        user_groups : Array(String)? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::ChatInput.new(application_id: application_id, client_token: client_token, conversation_id: conversation_id, input_stream: input_stream, parent_message_id: parent_message_id, user_groups: user_groups, user_id: user_id)
        chat(input)
      end

      def chat(input : Types::ChatInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CHAT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts or continues a non-streaming Amazon Q Business conversation.

      def chat_sync(
        application_id : String,
        action_execution : Types::ActionExecution? = nil,
        attachments : Array(Types::AttachmentInput)? = nil,
        attribute_filter : Types::AttributeFilter? = nil,
        auth_challenge_response : Types::AuthChallengeResponse? = nil,
        chat_mode : String? = nil,
        chat_mode_configuration : Types::ChatModeConfiguration? = nil,
        client_token : String? = nil,
        conversation_id : String? = nil,
        parent_message_id : String? = nil,
        user_groups : Array(String)? = nil,
        user_id : String? = nil,
        user_message : String? = nil
      ) : Protocol::Request
        input = Types::ChatSyncInput.new(application_id: application_id, action_execution: action_execution, attachments: attachments, attribute_filter: attribute_filter, auth_challenge_response: auth_challenge_response, chat_mode: chat_mode, chat_mode_configuration: chat_mode_configuration, client_token: client_token, conversation_id: conversation_id, parent_message_id: parent_message_id, user_groups: user_groups, user_id: user_id, user_message: user_message)
        chat_sync(input)
      end

      def chat_sync(input : Types::ChatSyncInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CHAT_SYNC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verifies if a user has access permissions for a specified document and returns the actual ACL
      # attached to the document. Resolves user access on the document via user aliases and groups when
      # verifying user access.

      def check_document_access(
        application_id : String,
        document_id : String,
        index_id : String,
        user_id : String,
        data_source_id : String? = nil
      ) : Protocol::Request
        input = Types::CheckDocumentAccessRequest.new(application_id: application_id, document_id: document_id, index_id: index_id, user_id: user_id, data_source_id: data_source_id)
        check_document_access(input)
      end

      def check_document_access(input : Types::CheckDocumentAccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CHECK_DOCUMENT_ACCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a unique URL for anonymous Amazon Q Business web experience. This URL can only be used once
      # and must be used within 5 minutes after it's generated.

      def create_anonymous_web_experience_url(
        application_id : String,
        web_experience_id : String,
        session_duration_in_minutes : Int32? = nil
      ) : Protocol::Request
        input = Types::CreateAnonymousWebExperienceUrlRequest.new(application_id: application_id, web_experience_id: web_experience_id, session_duration_in_minutes: session_duration_in_minutes)
        create_anonymous_web_experience_url(input)
      end

      def create_anonymous_web_experience_url(input : Types::CreateAnonymousWebExperienceUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ANONYMOUS_WEB_EXPERIENCE_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q Business application. There are new tiers for Amazon Q Business. Not all
      # features in Amazon Q Business Pro are also available in Amazon Q Business Lite. For information on
      # what's included in Amazon Q Business Lite and what's included in Amazon Q Business Pro, see Amazon Q
      # Business tiers . You must use the Amazon Q Business console to assign subscription tiers to users.
      # An Amazon Q Apps service linked role will be created if it's absent in the Amazon Web Services
      # account when QAppsConfiguration is enabled in the request. For more information, see Using
      # service-linked roles for Q Apps . When you create an application, Amazon Q Business may securely
      # transmit data for processing from your selected Amazon Web Services region, but within your
      # geography. For more information, see Cross region inference in Amazon Q Business .

      def create_application(
        display_name : String,
        attachments_configuration : Types::AttachmentsConfiguration? = nil,
        client_ids_for_oidc : Array(String)? = nil,
        client_token : String? = nil,
        description : String? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        iam_identity_provider_arn : String? = nil,
        identity_center_instance_arn : String? = nil,
        identity_type : String? = nil,
        personalization_configuration : Types::PersonalizationConfiguration? = nil,
        q_apps_configuration : Types::QAppsConfiguration? = nil,
        quick_sight_configuration : Types::QuickSightConfiguration? = nil,
        role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(display_name: display_name, attachments_configuration: attachments_configuration, client_ids_for_oidc: client_ids_for_oidc, client_token: client_token, description: description, encryption_configuration: encryption_configuration, iam_identity_provider_arn: iam_identity_provider_arn, identity_center_instance_arn: identity_center_instance_arn, identity_type: identity_type, personalization_configuration: personalization_configuration, q_apps_configuration: q_apps_configuration, quick_sight_configuration: quick_sight_configuration, role_arn: role_arn, tags: tags)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new chat response configuration for an Amazon Q Business application. This operation
      # establishes a set of parameters that define how the system generates and formats responses to user
      # queries in chat interactions.

      def create_chat_response_configuration(
        application_id : String,
        display_name : String,
        response_configurations : Hash(String, Types::ResponseConfiguration),
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateChatResponseConfigurationRequest.new(application_id: application_id, display_name: display_name, response_configurations: response_configurations, client_token: client_token, tags: tags)
        create_chat_response_configuration(input)
      end

      def create_chat_response_configuration(input : Types::CreateChatResponseConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHAT_RESPONSE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new data accessor for an ISV to access data from a Amazon Q Business application. The data
      # accessor is an entity that represents the ISV's access to the Amazon Q Business application's data.
      # It includes the IAM role ARN for the ISV, a friendly name, and a set of action configurations that
      # define the specific actions the ISV is allowed to perform and any associated data filters. When the
      # data accessor is created, an IAM Identity Center application is also created to manage the ISV's
      # identity and authentication for accessing the Amazon Q Business application.

      def create_data_accessor(
        action_configurations : Array(Types::ActionConfiguration),
        application_id : String,
        display_name : String,
        principal : String,
        authentication_detail : Types::DataAccessorAuthenticationDetail? = nil,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDataAccessorRequest.new(action_configurations: action_configurations, application_id: application_id, display_name: display_name, principal: principal, authentication_detail: authentication_detail, client_token: client_token, tags: tags)
        create_data_accessor(input)
      end

      def create_data_accessor(input : Types::CreateDataAccessorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_ACCESSOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data source connector for an Amazon Q Business application. CreateDataSource is a
      # synchronous operation. The operation returns 200 if the data source was successfully created.
      # Otherwise, an exception is raised.

      def create_data_source(
        application_id : String,
        configuration : Types::DataSourceConfiguration,
        display_name : String,
        index_id : String,
        client_token : String? = nil,
        description : String? = nil,
        document_enrichment_configuration : Types::DocumentEnrichmentConfiguration? = nil,
        media_extraction_configuration : Types::MediaExtractionConfiguration? = nil,
        role_arn : String? = nil,
        sync_schedule : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_configuration : Types::DataSourceVpcConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateDataSourceRequest.new(application_id: application_id, configuration: configuration, display_name: display_name, index_id: index_id, client_token: client_token, description: description, document_enrichment_configuration: document_enrichment_configuration, media_extraction_configuration: media_extraction_configuration, role_arn: role_arn, sync_schedule: sync_schedule, tags: tags, vpc_configuration: vpc_configuration)
        create_data_source(input)
      end

      def create_data_source(input : Types::CreateDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q Business index. To determine if index creation has completed, check the Status
      # field returned from a call to DescribeIndex . The Status field is set to ACTIVE when the index is
      # ready to use. Once the index is active, you can index your documents using the BatchPutDocument API
      # or the CreateDataSource API.

      def create_index(
        application_id : String,
        display_name : String,
        capacity_configuration : Types::IndexCapacityConfiguration? = nil,
        client_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::CreateIndexRequest.new(application_id: application_id, display_name: display_name, capacity_configuration: capacity_configuration, client_token: client_token, description: description, tags: tags, type: type)
        create_index(input)
      end

      def create_index(input : Types::CreateIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q Business plugin.

      def create_plugin(
        application_id : String,
        auth_configuration : Types::PluginAuthConfiguration,
        display_name : String,
        type : String,
        client_token : String? = nil,
        custom_plugin_configuration : Types::CustomPluginConfiguration? = nil,
        server_url : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreatePluginRequest.new(application_id: application_id, auth_configuration: auth_configuration, display_name: display_name, type: type, client_token: client_token, custom_plugin_configuration: custom_plugin_configuration, server_url: server_url, tags: tags)
        create_plugin(input)
      end

      def create_plugin(input : Types::CreatePluginRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PLUGIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a retriever to your Amazon Q Business application.

      def create_retriever(
        application_id : String,
        configuration : Types::RetrieverConfiguration,
        display_name : String,
        type : String,
        client_token : String? = nil,
        role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateRetrieverRequest.new(application_id: application_id, configuration: configuration, display_name: display_name, type: type, client_token: client_token, role_arn: role_arn, tags: tags)
        create_retriever(input)
      end

      def create_retriever(input : Types::CreateRetrieverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RETRIEVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Subscribes an IAM Identity Center user or a group to a pricing tier for an Amazon Q Business
      # application. Amazon Q Business offers two subscription tiers: Q_LITE and Q_BUSINESS . Subscription
      # tier determines feature access for the user. For more information on subscriptions and pricing
      # tiers, see Amazon Q Business pricing . For an example IAM role policy for assigning subscriptions,
      # see Set up required permissions in the Amazon Q Business User Guide.

      def create_subscription(
        application_id : String,
        principal : Types::SubscriptionPrincipal,
        type : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateSubscriptionRequest.new(application_id: application_id, principal: principal, type: type, client_token: client_token)
        create_subscription(input)
      end

      def create_subscription(input : Types::CreateSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a universally unique identifier (UUID) mapped to a list of local user ids within an
      # application.

      def create_user(
        application_id : String,
        user_id : String,
        client_token : String? = nil,
        user_aliases : Array(Types::UserAlias)? = nil
      ) : Protocol::Request
        input = Types::CreateUserRequest.new(application_id: application_id, user_id: user_id, client_token: client_token, user_aliases: user_aliases)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Q Business web experience.

      def create_web_experience(
        application_id : String,
        browser_extension_configuration : Types::BrowserExtensionConfiguration? = nil,
        client_token : String? = nil,
        customization_configuration : Types::CustomizationConfiguration? = nil,
        identity_provider_configuration : Types::IdentityProviderConfiguration? = nil,
        origins : Array(String)? = nil,
        role_arn : String? = nil,
        sample_prompts_control_mode : String? = nil,
        subtitle : String? = nil,
        tags : Array(Types::Tag)? = nil,
        title : String? = nil,
        welcome_message : String? = nil
      ) : Protocol::Request
        input = Types::CreateWebExperienceRequest.new(application_id: application_id, browser_extension_configuration: browser_extension_configuration, client_token: client_token, customization_configuration: customization_configuration, identity_provider_configuration: identity_provider_configuration, origins: origins, role_arn: role_arn, sample_prompts_control_mode: sample_prompts_control_mode, subtitle: subtitle, tags: tags, title: title, welcome_message: welcome_message)
        create_web_experience(input)
      end

      def create_web_experience(input : Types::CreateWebExperienceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WEB_EXPERIENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q Business application.

      def delete_application(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(application_id: application_id)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an attachment associated with a specific Amazon Q Business conversation.

      def delete_attachment(
        application_id : String,
        attachment_id : String,
        conversation_id : String,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAttachmentRequest.new(application_id: application_id, attachment_id: attachment_id, conversation_id: conversation_id, user_id: user_id)
        delete_attachment(input)
      end

      def delete_attachment(input : Types::DeleteAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes chat controls configured for an existing Amazon Q Business application.

      def delete_chat_controls_configuration(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteChatControlsConfigurationRequest.new(application_id: application_id)
        delete_chat_controls_configuration(input)
      end

      def delete_chat_controls_configuration(input : Types::DeleteChatControlsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHAT_CONTROLS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified chat response configuration from an Amazon Q Business application.

      def delete_chat_response_configuration(
        application_id : String,
        chat_response_configuration_id : String
      ) : Protocol::Request
        input = Types::DeleteChatResponseConfigurationRequest.new(application_id: application_id, chat_response_configuration_id: chat_response_configuration_id)
        delete_chat_response_configuration(input)
      end

      def delete_chat_response_configuration(input : Types::DeleteChatResponseConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHAT_RESPONSE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q Business web experience conversation.

      def delete_conversation(
        application_id : String,
        conversation_id : String,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteConversationRequest.new(application_id: application_id, conversation_id: conversation_id, user_id: user_id)
        delete_conversation(input)
      end

      def delete_conversation(input : Types::DeleteConversationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONVERSATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified data accessor. This operation permanently removes the data accessor and its
      # associated IAM Identity Center application. Any access granted to the ISV through this data accessor
      # will be revoked.

      def delete_data_accessor(
        application_id : String,
        data_accessor_id : String
      ) : Protocol::Request
        input = Types::DeleteDataAccessorRequest.new(application_id: application_id, data_accessor_id: data_accessor_id)
        delete_data_accessor(input)
      end

      def delete_data_accessor(input : Types::DeleteDataAccessorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_ACCESSOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q Business data source connector. While the data source is being deleted, the
      # Status field returned by a call to the DescribeDataSource API is set to DELETING .

      def delete_data_source(
        application_id : String,
        data_source_id : String,
        index_id : String
      ) : Protocol::Request
        input = Types::DeleteDataSourceRequest.new(application_id: application_id, data_source_id: data_source_id, index_id: index_id)
        delete_data_source(input)
      end

      def delete_data_source(input : Types::DeleteDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a group so that all users and sub groups that belong to the group can no longer access
      # documents only available to that group. For example, after deleting the group "Summer Interns", all
      # interns who belonged to that group no longer see intern-only documents in their chat results. If you
      # want to delete, update, or replace users or sub groups of a group, you need to use the PutGroup
      # operation. For example, if a user in the group "Engineering" leaves the engineering team and another
      # user takes their place, you provide an updated list of users or sub groups that belong to the
      # "Engineering" group when calling PutGroup .

      def delete_group(
        application_id : String,
        group_name : String,
        index_id : String,
        data_source_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteGroupRequest.new(application_id: application_id, group_name: group_name, index_id: index_id, data_source_id: data_source_id)
        delete_group(input)
      end

      def delete_group(input : Types::DeleteGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q Business index.

      def delete_index(
        application_id : String,
        index_id : String
      ) : Protocol::Request
        input = Types::DeleteIndexRequest.new(application_id: application_id, index_id: index_id)
        delete_index(input)
      end

      def delete_index(input : Types::DeleteIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q Business plugin.

      def delete_plugin(
        application_id : String,
        plugin_id : String
      ) : Protocol::Request
        input = Types::DeletePluginRequest.new(application_id: application_id, plugin_id: plugin_id)
        delete_plugin(input)
      end

      def delete_plugin(input : Types::DeletePluginRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PLUGIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the retriever used by an Amazon Q Business application.

      def delete_retriever(
        application_id : String,
        retriever_id : String
      ) : Protocol::Request
        input = Types::DeleteRetrieverRequest.new(application_id: application_id, retriever_id: retriever_id)
        delete_retriever(input)
      end

      def delete_retriever(input : Types::DeleteRetrieverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RETRIEVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a user by email id.

      def delete_user(
        application_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DeleteUserRequest.new(application_id: application_id, user_id: user_id)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q Business web experience.

      def delete_web_experience(
        application_id : String,
        web_experience_id : String
      ) : Protocol::Request
        input = Types::DeleteWebExperienceRequest.new(application_id: application_id, web_experience_id: web_experience_id)
        delete_web_experience(input)
      end

      def delete_web_experience(input : Types::DeleteWebExperienceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WEB_EXPERIENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a permission policy from a Amazon Q Business application, revoking the cross-account access
      # that was previously granted to an ISV. This operation deletes the specified policy statement from
      # the application's permission policy.

      def disassociate_permission(
        application_id : String,
        statement_id : String
      ) : Protocol::Request
        input = Types::DisassociatePermissionRequest.new(application_id: application_id, statement_id: statement_id)
        disassociate_permission(input)
      end

      def disassociate_permission(input : Types::DisassociatePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an existing Amazon Q Business application.

      def get_application(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApplicationRequest.new(application_id: application_id)
        get_application(input)
      end

      def get_application(input : Types::GetApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about chat controls configured for an existing Amazon Q Business application.

      def get_chat_controls_configuration(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetChatControlsConfigurationRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        get_chat_controls_configuration(input)
      end

      def get_chat_controls_configuration(input : Types::GetChatControlsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHAT_CONTROLS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific chat response configuration from an Amazon Q
      # Business application. This operation returns the complete configuration settings and metadata.

      def get_chat_response_configuration(
        application_id : String,
        chat_response_configuration_id : String
      ) : Protocol::Request
        input = Types::GetChatResponseConfigurationRequest.new(application_id: application_id, chat_response_configuration_id: chat_response_configuration_id)
        get_chat_response_configuration(input)
      end

      def get_chat_response_configuration(input : Types::GetChatResponseConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHAT_RESPONSE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specified data accessor. This operation returns details about the data
      # accessor, including its display name, unique identifier, Amazon Resource Name (ARN), the associated
      # Amazon Q Business application and IAM Identity Center application, the IAM role for the ISV, the
      # action configurations, and the timestamps for when the data accessor was created and last updated.

      def get_data_accessor(
        application_id : String,
        data_accessor_id : String
      ) : Protocol::Request
        input = Types::GetDataAccessorRequest.new(application_id: application_id, data_accessor_id: data_accessor_id)
        get_data_accessor(input)
      end

      def get_data_accessor(input : Types::GetDataAccessorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_ACCESSOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an existing Amazon Q Business data source connector.

      def get_data_source(
        application_id : String,
        data_source_id : String,
        index_id : String
      ) : Protocol::Request
        input = Types::GetDataSourceRequest.new(application_id: application_id, data_source_id: data_source_id, index_id: index_id)
        get_data_source(input)
      end

      def get_data_source(input : Types::GetDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the content of a document that was ingested into Amazon Q Business. This API validates
      # user authorization against document ACLs before returning a pre-signed URL for secure document
      # access. You can download or view source documents referenced in chat responses through the URL.

      def get_document_content(
        application_id : String,
        document_id : String,
        index_id : String,
        data_source_id : String? = nil,
        output_format : String? = nil
      ) : Protocol::Request
        input = Types::GetDocumentContentRequest.new(application_id: application_id, document_id: document_id, index_id: index_id, data_source_id: data_source_id, output_format: output_format)
        get_document_content(input)
      end

      def get_document_content(input : Types::GetDocumentContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOCUMENT_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a group by group name.

      def get_group(
        application_id : String,
        group_name : String,
        index_id : String,
        data_source_id : String? = nil
      ) : Protocol::Request
        input = Types::GetGroupRequest.new(application_id: application_id, group_name: group_name, index_id: index_id, data_source_id: data_source_id)
        get_group(input)
      end

      def get_group(input : Types::GetGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an existing Amazon Q Business index.

      def get_index(
        application_id : String,
        index_id : String
      ) : Protocol::Request
        input = Types::GetIndexRequest.new(application_id: application_id, index_id: index_id)
        get_index(input)
      end

      def get_index(input : Types::GetIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the image bytes corresponding to a media object. If you have implemented your own
      # application with the Chat and ChatSync APIs, and have enabled content extraction from visual data in
      # Amazon Q Business, you use the GetMedia API operation to download the images so you can show them in
      # your UI with responses. For more information, see Extracting semantic meaning from images and
      # visuals .

      def get_media(
        application_id : String,
        conversation_id : String,
        media_id : String,
        message_id : String
      ) : Protocol::Request
        input = Types::GetMediaRequest.new(application_id: application_id, conversation_id: conversation_id, media_id: media_id, message_id: message_id)
        get_media(input)
      end

      def get_media(input : Types::GetMediaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEDIA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an existing Amazon Q Business plugin.

      def get_plugin(
        application_id : String,
        plugin_id : String
      ) : Protocol::Request
        input = Types::GetPluginRequest.new(application_id: application_id, plugin_id: plugin_id)
        get_plugin(input)
      end

      def get_plugin(input : Types::GetPluginRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PLUGIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current permission policy for a Amazon Q Business application. The policy is returned
      # as a JSON-formatted string and defines the IAM actions that are allowed or denied for the
      # application's resources.

      def get_policy(
        application_id : String
      ) : Protocol::Request
        input = Types::GetPolicyRequest.new(application_id: application_id)
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an existing retriever used by an Amazon Q Business application.

      def get_retriever(
        application_id : String,
        retriever_id : String
      ) : Protocol::Request
        input = Types::GetRetrieverRequest.new(application_id: application_id, retriever_id: retriever_id)
        get_retriever(input)
      end

      def get_retriever(input : Types::GetRetrieverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RETRIEVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the universally unique identifier (UUID) associated with a local user in a data source.

      def get_user(
        application_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::GetUserRequest.new(application_id: application_id, user_id: user_id)
        get_user(input)
      end

      def get_user(input : Types::GetUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an existing Amazon Q Business web experience.

      def get_web_experience(
        application_id : String,
        web_experience_id : String
      ) : Protocol::Request
        input = Types::GetWebExperienceRequest.new(application_id: application_id, web_experience_id: web_experience_id)
        get_web_experience(input)
      end

      def get_web_experience(input : Types::GetWebExperienceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WEB_EXPERIENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon Q Business applications. Amazon Q Business applications may securely transmit data for
      # processing across Amazon Web Services Regions within your geography. For more information, see Cross
      # region inference in Amazon Q Business .

      def list_applications(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(max_results: max_results, next_token: next_token)
        list_applications(input)
      end

      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of attachments associated with an Amazon Q Business web experience or a list of
      # attachements associated with a specific Amazon Q Business conversation.

      def list_attachments(
        application_id : String,
        conversation_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::ListAttachmentsRequest.new(application_id: application_id, conversation_id: conversation_id, max_results: max_results, next_token: next_token, user_id: user_id)
        list_attachments(input)
      end

      def list_attachments(input : Types::ListAttachmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ATTACHMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all chat response configurations available in a specified Amazon Q Business
      # application. This operation returns summary information about each configuration to help
      # administrators manage and select appropriate response settings.

      def list_chat_response_configurations(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChatResponseConfigurationsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_chat_response_configurations(input)
      end

      def list_chat_response_configurations(input : Types::ListChatResponseConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHAT_RESPONSE_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists one or more Amazon Q Business conversations.

      def list_conversations(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::ListConversationsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token, user_id: user_id)
        list_conversations(input)
      end

      def list_conversations(input : Types::ListConversationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONVERSATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the data accessors for a Amazon Q Business application. This operation returns a paginated
      # list of data accessor summaries, including the friendly name, unique identifier, ARN, associated IAM
      # role, and creation/update timestamps for each data accessor.

      def list_data_accessors(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataAccessorsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_data_accessors(input)
      end

      def list_data_accessors(input : Types::ListDataAccessorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_ACCESSORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about an Amazon Q Business data source connector synchronization.

      def list_data_source_sync_jobs(
        application_id : String,
        data_source_id : String,
        index_id : String,
        end_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil,
        status_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSourceSyncJobsRequest.new(application_id: application_id, data_source_id: data_source_id, index_id: index_id, end_time: end_time, max_results: max_results, next_token: next_token, start_time: start_time, status_filter: status_filter)
        list_data_source_sync_jobs(input)
      end

      def list_data_source_sync_jobs(input : Types::ListDataSourceSyncJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SOURCE_SYNC_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon Q Business data source connectors that you have created.

      def list_data_sources(
        application_id : String,
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSourcesRequest.new(application_id: application_id, index_id: index_id, max_results: max_results, next_token: next_token)
        list_data_sources(input)
      end

      def list_data_sources(input : Types::ListDataSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of documents attached to an index.

      def list_documents(
        application_id : String,
        index_id : String,
        data_source_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDocumentsRequest.new(application_id: application_id, index_id: index_id, data_source_ids: data_source_ids, max_results: max_results, next_token: next_token)
        list_documents(input)
      end

      def list_documents(input : Types::ListDocumentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOCUMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a list of groups that are mapped to users.

      def list_groups(
        application_id : String,
        index_id : String,
        updated_earlier_than : Time,
        data_source_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupsRequest.new(application_id: application_id, index_id: index_id, updated_earlier_than: updated_earlier_than, data_source_id: data_source_id, max_results: max_results, next_token: next_token)
        list_groups(input)
      end

      def list_groups(input : Types::ListGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon Q Business indices you have created.

      def list_indices(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIndicesRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_indices(input)
      end

      def list_indices(input : Types::ListIndicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INDICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of messages associated with an Amazon Q Business web experience.

      def list_messages(
        application_id : String,
        conversation_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::ListMessagesRequest.new(application_id: application_id, conversation_id: conversation_id, max_results: max_results, next_token: next_token, user_id: user_id)
        list_messages(input)
      end

      def list_messages(input : Types::ListMessagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MESSAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists configured Amazon Q Business actions for a specific plugin in an Amazon Q Business
      # application.

      def list_plugin_actions(
        application_id : String,
        plugin_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPluginActionsRequest.new(application_id: application_id, plugin_id: plugin_id, max_results: max_results, next_token: next_token)
        list_plugin_actions(input)
      end

      def list_plugin_actions(input : Types::ListPluginActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PLUGIN_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists configured Amazon Q Business actions for any plugin type—both built-in and custom.

      def list_plugin_type_actions(
        plugin_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPluginTypeActionsRequest.new(plugin_type: plugin_type, max_results: max_results, next_token: next_token)
        list_plugin_type_actions(input)
      end

      def list_plugin_type_actions(input : Types::ListPluginTypeActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PLUGIN_TYPE_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists metadata for all Amazon Q Business plugin types.

      def list_plugin_type_metadata(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPluginTypeMetadataRequest.new(max_results: max_results, next_token: next_token)
        list_plugin_type_metadata(input)
      end

      def list_plugin_type_metadata(input : Types::ListPluginTypeMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PLUGIN_TYPE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists configured Amazon Q Business plugins.

      def list_plugins(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPluginsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_plugins(input)
      end

      def list_plugins(input : Types::ListPluginsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PLUGINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the retriever used by an Amazon Q Business application.

      def list_retrievers(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRetrieversRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_retrievers(input)
      end

      def list_retrievers(input : Types::ListRetrieversRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RETRIEVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all subscriptions created in an Amazon Q Business application.

      def list_subscriptions(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSubscriptionsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_subscriptions(input)
      end

      def list_subscriptions(input : Types::ListSubscriptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUBSCRIPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of tags associated with a specified resource. Amazon Q Business applications and data
      # sources can have tags associated with them.

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

      # Lists one or more Amazon Q Business Web Experiences.

      def list_web_experiences(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWebExperiencesRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_web_experiences(input)
      end

      def list_web_experiences(input : Types::ListWebExperiencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WEB_EXPERIENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables your end user to provide feedback on their Amazon Q Business generated chat responses.

      def put_feedback(
        application_id : String,
        conversation_id : String,
        message_id : String,
        message_copied_at : Time? = nil,
        message_usefulness : Types::MessageUsefulnessFeedback? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::PutFeedbackRequest.new(application_id: application_id, conversation_id: conversation_id, message_id: message_id, message_copied_at: message_copied_at, message_usefulness: message_usefulness, user_id: user_id)
        put_feedback(input)
      end

      def put_feedback(input : Types::PutFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create, or updates, a mapping of users—who have access to a document—to groups. You can also map sub
      # groups to groups. For example, the group "Company Intellectual Property Teams" includes sub groups
      # "Research" and "Engineering". These sub groups include their own list of users or people who work in
      # these teams. Only users who work in research and engineering, and therefore belong in the
      # intellectual property group, can see top-secret company documents in their Amazon Q Business chat
      # results. There are two options for creating groups, either passing group members inline or using an
      # S3 file via the S3PathForGroupMembers field. For inline groups, there is a limit of 1000 members per
      # group and for provided S3 files there is a limit of 100 thousand members. When creating a group
      # using an S3 file, you provide both an S3 file and a RoleArn for Amazon Q Buisness to access the
      # file.

      def put_group(
        application_id : String,
        group_members : Types::GroupMembers,
        group_name : String,
        index_id : String,
        type : String,
        data_source_id : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::PutGroupRequest.new(application_id: application_id, group_members: group_members, group_name: group_name, index_id: index_id, type: type, data_source_id: data_source_id, role_arn: role_arn)
        put_group(input)
      end

      def put_group(input : Types::PutGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for relevant content in a Amazon Q Business application based on a query. This operation
      # takes a search query text, the Amazon Q Business application identifier, and optional filters (such
      # as content source and maximum results) as input. It returns a list of relevant content items, where
      # each item includes the content text, the unique document identifier, the document title, the
      # document URI, any relevant document attributes, and score attributes indicating the confidence level
      # of the relevance.

      def search_relevant_content(
        application_id : String,
        content_source : Types::ContentSource,
        query_text : String,
        attribute_filter : Types::AttributeFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchRelevantContentRequest.new(application_id: application_id, content_source: content_source, query_text: query_text, attribute_filter: attribute_filter, max_results: max_results, next_token: next_token)
        search_relevant_content(input)
      end

      def search_relevant_content(input : Types::SearchRelevantContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_RELEVANT_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a data source connector synchronization job. If a synchronization job is already in progress,
      # Amazon Q Business returns a ConflictException .

      def start_data_source_sync_job(
        application_id : String,
        data_source_id : String,
        index_id : String
      ) : Protocol::Request
        input = Types::StartDataSourceSyncJobRequest.new(application_id: application_id, data_source_id: data_source_id, index_id: index_id)
        start_data_source_sync_job(input)
      end

      def start_data_source_sync_job(input : Types::StartDataSourceSyncJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DATA_SOURCE_SYNC_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops an Amazon Q Business data source connector synchronization job already in progress.

      def stop_data_source_sync_job(
        application_id : String,
        data_source_id : String,
        index_id : String
      ) : Protocol::Request
        input = Types::StopDataSourceSyncJobRequest.new(application_id: application_id, data_source_id: data_source_id, index_id: index_id)
        stop_data_source_sync_job(input)
      end

      def stop_data_source_sync_job(input : Types::StopDataSourceSyncJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_DATA_SOURCE_SYNC_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tag to the specified Amazon Q Business application or data source resource. If
      # the tag already exists, the existing value is replaced with the new value.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from an Amazon Q Business application or a data source.

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

      # Updates an existing Amazon Q Business application. Amazon Q Business applications may securely
      # transmit data for processing across Amazon Web Services Regions within your geography. For more
      # information, see Cross region inference in Amazon Q Business . An Amazon Q Apps service-linked role
      # will be created if it's absent in the Amazon Web Services account when QAppsConfiguration is enabled
      # in the request. For more information, see Using service-linked roles for Q Apps .

      def update_application(
        application_id : String,
        attachments_configuration : Types::AttachmentsConfiguration? = nil,
        auto_subscription_configuration : Types::AutoSubscriptionConfiguration? = nil,
        description : String? = nil,
        display_name : String? = nil,
        identity_center_instance_arn : String? = nil,
        personalization_configuration : Types::PersonalizationConfiguration? = nil,
        q_apps_configuration : Types::QAppsConfiguration? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationRequest.new(application_id: application_id, attachments_configuration: attachments_configuration, auto_subscription_configuration: auto_subscription_configuration, description: description, display_name: display_name, identity_center_instance_arn: identity_center_instance_arn, personalization_configuration: personalization_configuration, q_apps_configuration: q_apps_configuration, role_arn: role_arn)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a set of chat controls configured for an existing Amazon Q Business application.

      def update_chat_controls_configuration(
        application_id : String,
        blocked_phrases_configuration_update : Types::BlockedPhrasesConfigurationUpdate? = nil,
        client_token : String? = nil,
        creator_mode_configuration : Types::CreatorModeConfiguration? = nil,
        hallucination_reduction_configuration : Types::HallucinationReductionConfiguration? = nil,
        orchestration_configuration : Types::OrchestrationConfiguration? = nil,
        response_scope : String? = nil,
        topic_configurations_to_create_or_update : Array(Types::TopicConfiguration)? = nil,
        topic_configurations_to_delete : Array(Types::TopicConfiguration)? = nil
      ) : Protocol::Request
        input = Types::UpdateChatControlsConfigurationRequest.new(application_id: application_id, blocked_phrases_configuration_update: blocked_phrases_configuration_update, client_token: client_token, creator_mode_configuration: creator_mode_configuration, hallucination_reduction_configuration: hallucination_reduction_configuration, orchestration_configuration: orchestration_configuration, response_scope: response_scope, topic_configurations_to_create_or_update: topic_configurations_to_create_or_update, topic_configurations_to_delete: topic_configurations_to_delete)
        update_chat_controls_configuration(input)
      end

      def update_chat_controls_configuration(input : Types::UpdateChatControlsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHAT_CONTROLS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing chat response configuration in an Amazon Q Business application. This operation
      # allows administrators to modify configuration settings, display name, and response parameters to
      # refine how the system generates responses.

      def update_chat_response_configuration(
        application_id : String,
        chat_response_configuration_id : String,
        response_configurations : Hash(String, Types::ResponseConfiguration),
        client_token : String? = nil,
        display_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChatResponseConfigurationRequest.new(application_id: application_id, chat_response_configuration_id: chat_response_configuration_id, response_configurations: response_configurations, client_token: client_token, display_name: display_name)
        update_chat_response_configuration(input)
      end

      def update_chat_response_configuration(input : Types::UpdateChatResponseConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHAT_RESPONSE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing data accessor. This operation allows modifying the action configurations (the
      # allowed actions and associated filters) and the display name of the data accessor. It does not allow
      # changing the IAM role associated with the data accessor or other core properties of the data
      # accessor.

      def update_data_accessor(
        action_configurations : Array(Types::ActionConfiguration),
        application_id : String,
        data_accessor_id : String,
        authentication_detail : Types::DataAccessorAuthenticationDetail? = nil,
        display_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataAccessorRequest.new(action_configurations: action_configurations, application_id: application_id, data_accessor_id: data_accessor_id, authentication_detail: authentication_detail, display_name: display_name)
        update_data_accessor(input)
      end

      def update_data_accessor(input : Types::UpdateDataAccessorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_ACCESSOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Amazon Q Business data source connector.

      def update_data_source(
        application_id : String,
        data_source_id : String,
        index_id : String,
        configuration : Types::DataSourceConfiguration? = nil,
        description : String? = nil,
        display_name : String? = nil,
        document_enrichment_configuration : Types::DocumentEnrichmentConfiguration? = nil,
        media_extraction_configuration : Types::MediaExtractionConfiguration? = nil,
        role_arn : String? = nil,
        sync_schedule : String? = nil,
        vpc_configuration : Types::DataSourceVpcConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSourceRequest.new(application_id: application_id, data_source_id: data_source_id, index_id: index_id, configuration: configuration, description: description, display_name: display_name, document_enrichment_configuration: document_enrichment_configuration, media_extraction_configuration: media_extraction_configuration, role_arn: role_arn, sync_schedule: sync_schedule, vpc_configuration: vpc_configuration)
        update_data_source(input)
      end

      def update_data_source(input : Types::UpdateDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon Q Business index.

      def update_index(
        application_id : String,
        index_id : String,
        capacity_configuration : Types::IndexCapacityConfiguration? = nil,
        description : String? = nil,
        display_name : String? = nil,
        document_attribute_configurations : Array(Types::DocumentAttributeConfiguration)? = nil
      ) : Protocol::Request
        input = Types::UpdateIndexRequest.new(application_id: application_id, index_id: index_id, capacity_configuration: capacity_configuration, description: description, display_name: display_name, document_attribute_configurations: document_attribute_configurations)
        update_index(input)
      end

      def update_index(input : Types::UpdateIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon Q Business plugin.

      def update_plugin(
        application_id : String,
        plugin_id : String,
        auth_configuration : Types::PluginAuthConfiguration? = nil,
        custom_plugin_configuration : Types::CustomPluginConfiguration? = nil,
        display_name : String? = nil,
        server_url : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePluginRequest.new(application_id: application_id, plugin_id: plugin_id, auth_configuration: auth_configuration, custom_plugin_configuration: custom_plugin_configuration, display_name: display_name, server_url: server_url, state: state)
        update_plugin(input)
      end

      def update_plugin(input : Types::UpdatePluginRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PLUGIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the retriever used for your Amazon Q Business application.

      def update_retriever(
        application_id : String,
        retriever_id : String,
        configuration : Types::RetrieverConfiguration? = nil,
        display_name : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRetrieverRequest.new(application_id: application_id, retriever_id: retriever_id, configuration: configuration, display_name: display_name, role_arn: role_arn)
        update_retriever(input)
      end

      def update_retriever(input : Types::UpdateRetrieverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RETRIEVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the pricing tier for an Amazon Q Business subscription. Upgrades are instant. Downgrades
      # apply at the start of the next month. Subscription tier determines feature access for the user. For
      # more information on subscriptions and pricing tiers, see Amazon Q Business pricing .

      def update_subscription(
        application_id : String,
        subscription_id : String,
        type : String
      ) : Protocol::Request
        input = Types::UpdateSubscriptionRequest.new(application_id: application_id, subscription_id: subscription_id, type: type)
        update_subscription(input)
      end

      def update_subscription(input : Types::UpdateSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a information associated with a user id.

      def update_user(
        application_id : String,
        user_id : String,
        user_aliases_to_delete : Array(Types::UserAlias)? = nil,
        user_aliases_to_update : Array(Types::UserAlias)? = nil
      ) : Protocol::Request
        input = Types::UpdateUserRequest.new(application_id: application_id, user_id: user_id, user_aliases_to_delete: user_aliases_to_delete, user_aliases_to_update: user_aliases_to_update)
        update_user(input)
      end

      def update_user(input : Types::UpdateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon Q Business web experience.

      def update_web_experience(
        application_id : String,
        web_experience_id : String,
        authentication_configuration : Types::WebExperienceAuthConfiguration? = nil,
        browser_extension_configuration : Types::BrowserExtensionConfiguration? = nil,
        customization_configuration : Types::CustomizationConfiguration? = nil,
        identity_provider_configuration : Types::IdentityProviderConfiguration? = nil,
        origins : Array(String)? = nil,
        role_arn : String? = nil,
        sample_prompts_control_mode : String? = nil,
        subtitle : String? = nil,
        title : String? = nil,
        welcome_message : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWebExperienceRequest.new(application_id: application_id, web_experience_id: web_experience_id, authentication_configuration: authentication_configuration, browser_extension_configuration: browser_extension_configuration, customization_configuration: customization_configuration, identity_provider_configuration: identity_provider_configuration, origins: origins, role_arn: role_arn, sample_prompts_control_mode: sample_prompts_control_mode, subtitle: subtitle, title: title, welcome_message: welcome_message)
        update_web_experience(input)
      end

      def update_web_experience(input : Types::UpdateWebExperienceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WEB_EXPERIENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
