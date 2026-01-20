module AwsSdk
  module LexModelsV2
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

      # Create a batch of custom vocabulary items for a given bot locale's custom vocabulary.

      def batch_create_custom_vocabulary_item(
        bot_id : String,
        bot_version : String,
        custom_vocabulary_item_list : Array(Types::NewCustomVocabularyItem),
        locale_id : String
      ) : Protocol::Request
        input = Types::BatchCreateCustomVocabularyItemRequest.new(bot_id: bot_id, bot_version: bot_version, custom_vocabulary_item_list: custom_vocabulary_item_list, locale_id: locale_id)
        batch_create_custom_vocabulary_item(input)
      end

      def batch_create_custom_vocabulary_item(input : Types::BatchCreateCustomVocabularyItemRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_CUSTOM_VOCABULARY_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a batch of custom vocabulary items for a given bot locale's custom vocabulary.

      def batch_delete_custom_vocabulary_item(
        bot_id : String,
        bot_version : String,
        custom_vocabulary_item_list : Array(Types::CustomVocabularyEntryId),
        locale_id : String
      ) : Protocol::Request
        input = Types::BatchDeleteCustomVocabularyItemRequest.new(bot_id: bot_id, bot_version: bot_version, custom_vocabulary_item_list: custom_vocabulary_item_list, locale_id: locale_id)
        batch_delete_custom_vocabulary_item(input)
      end

      def batch_delete_custom_vocabulary_item(input : Types::BatchDeleteCustomVocabularyItemRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_CUSTOM_VOCABULARY_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a batch of custom vocabulary items for a given bot locale's custom vocabulary.

      def batch_update_custom_vocabulary_item(
        bot_id : String,
        bot_version : String,
        custom_vocabulary_item_list : Array(Types::CustomVocabularyItem),
        locale_id : String
      ) : Protocol::Request
        input = Types::BatchUpdateCustomVocabularyItemRequest.new(bot_id: bot_id, bot_version: bot_version, custom_vocabulary_item_list: custom_vocabulary_item_list, locale_id: locale_id)
        batch_update_custom_vocabulary_item(input)
      end

      def batch_update_custom_vocabulary_item(input : Types::BatchUpdateCustomVocabularyItemRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_CUSTOM_VOCABULARY_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Builds a bot, its intents, and its slot types into a specific locale. A bot can be built into
      # multiple locales. At runtime the locale is used to choose a specific build of the bot.

      def build_bot_locale(
        bot_id : String,
        bot_version : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::BuildBotLocaleRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id)
        build_bot_locale(input)
      end

      def build_bot_locale(input : Types::BuildBotLocaleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BUILD_BOT_LOCALE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Lex conversational bot.

      def create_bot(
        bot_name : String,
        data_privacy : Types::DataPrivacy,
        idle_session_ttl_in_seconds : Int32,
        role_arn : String,
        bot_members : Array(Types::BotMember)? = nil,
        bot_tags : Hash(String, String)? = nil,
        bot_type : String? = nil,
        description : String? = nil,
        error_log_settings : Types::ErrorLogSettings? = nil,
        test_bot_alias_tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateBotRequest.new(bot_name: bot_name, data_privacy: data_privacy, idle_session_ttl_in_seconds: idle_session_ttl_in_seconds, role_arn: role_arn, bot_members: bot_members, bot_tags: bot_tags, bot_type: bot_type, description: description, error_log_settings: error_log_settings, test_bot_alias_tags: test_bot_alias_tags)
        create_bot(input)
      end

      def create_bot(input : Types::CreateBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an alias for the specified version of a bot. Use an alias to enable you to change the
      # version of a bot without updating applications that use the bot. For example, you can create an
      # alias called "PROD" that your applications use to call the Amazon Lex bot.

      def create_bot_alias(
        bot_alias_name : String,
        bot_id : String,
        bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)? = nil,
        bot_version : String? = nil,
        conversation_log_settings : Types::ConversationLogSettings? = nil,
        description : String? = nil,
        sentiment_analysis_settings : Types::SentimentAnalysisSettings? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateBotAliasRequest.new(bot_alias_name: bot_alias_name, bot_id: bot_id, bot_alias_locale_settings: bot_alias_locale_settings, bot_version: bot_version, conversation_log_settings: conversation_log_settings, description: description, sentiment_analysis_settings: sentiment_analysis_settings, tags: tags)
        create_bot_alias(input)
      end

      def create_bot_alias(input : Types::CreateBotAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BOT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a locale in the bot. The locale contains the intents and slot types that the bot uses in
      # conversations with users in the specified language and locale. You must add a locale to a bot before
      # you can add intents and slot types to the bot.

      def create_bot_locale(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        nlu_intent_confidence_threshold : Float64,
        description : String? = nil,
        generative_ai_settings : Types::GenerativeAISettings? = nil,
        speech_detection_sensitivity : String? = nil,
        speech_recognition_settings : Types::SpeechRecognitionSettings? = nil,
        unified_speech_settings : Types::UnifiedSpeechSettings? = nil,
        voice_settings : Types::VoiceSettings? = nil
      ) : Protocol::Request
        input = Types::CreateBotLocaleRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, nlu_intent_confidence_threshold: nlu_intent_confidence_threshold, description: description, generative_ai_settings: generative_ai_settings, speech_detection_sensitivity: speech_detection_sensitivity, speech_recognition_settings: speech_recognition_settings, unified_speech_settings: unified_speech_settings, voice_settings: voice_settings)
        create_bot_locale(input)
      end

      def create_bot_locale(input : Types::CreateBotLocaleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BOT_LOCALE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Action to create a replication of the source bot in the secondary region.

      def create_bot_replica(
        bot_id : String,
        replica_region : String
      ) : Protocol::Request
        input = Types::CreateBotReplicaRequest.new(bot_id: bot_id, replica_region: replica_region)
        create_bot_replica(input)
      end

      def create_bot_replica(input : Types::CreateBotReplicaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BOT_REPLICA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an immutable version of the bot. When you create the first version of a bot, Amazon Lex sets
      # the version number to 1. Subsequent bot versions increase in an increment of 1. The version number
      # will always represent the total number of versions created of the bot, not the current number of
      # versions. If a bot version is deleted, that bot version number will not be reused.

      def create_bot_version(
        bot_id : String,
        bot_version_locale_specification : Hash(String, Types::BotVersionLocaleDetails),
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateBotVersionRequest.new(bot_id: bot_id, bot_version_locale_specification: bot_version_locale_specification, description: description)
        create_bot_version(input)
      end

      def create_bot_version(input : Types::CreateBotVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BOT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a zip archive containing the contents of a bot or a bot locale. The archive contains a
      # directory structure that contains JSON files that define the bot. You can create an archive that
      # contains the complete definition of a bot, or you can specify that the archive contain only the
      # definition of a single bot locale. For more information about exporting bots, and about the
      # structure of the export archive, see Importing and exporting bots

      def create_export(
        file_format : String,
        resource_specification : Types::ExportResourceSpecification,
        file_password : String? = nil
      ) : Protocol::Request
        input = Types::CreateExportRequest.new(file_format: file_format, resource_specification: resource_specification, file_password: file_password)
        create_export(input)
      end

      def create_export(input : Types::CreateExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an intent. To define the interaction between the user and your bot, you define one or more
      # intents. For example, for a pizza ordering bot you would create an OrderPizza intent. When you
      # create an intent, you must provide a name. You can optionally provide the following: Sample
      # utterances. For example, "I want to order a pizza" and "Can I order a pizza." You can't provide
      # utterances for built-in intents. Information to be gathered. You specify slots for the information
      # that you bot requests from the user. You can specify standard slot types, such as date and time, or
      # custom slot types for your application. How the intent is fulfilled. You can provide a Lambda
      # function or configure the intent to return the intent information to your client application. If you
      # use a Lambda function, Amazon Lex invokes the function when all of the intent information is
      # available. A confirmation prompt to send to the user to confirm an intent. For example, "Shall I
      # order your pizza?" A conclusion statement to send to the user after the intent is fulfilled. For
      # example, "I ordered your pizza." A follow-up prompt that asks the user for additional activity. For
      # example, "Do you want a drink with your pizza?"

      def create_intent(
        bot_id : String,
        bot_version : String,
        intent_name : String,
        locale_id : String,
        description : String? = nil,
        dialog_code_hook : Types::DialogCodeHookSettings? = nil,
        fulfillment_code_hook : Types::FulfillmentCodeHookSettings? = nil,
        initial_response_setting : Types::InitialResponseSetting? = nil,
        input_contexts : Array(Types::InputContext)? = nil,
        intent_closing_setting : Types::IntentClosingSetting? = nil,
        intent_confirmation_setting : Types::IntentConfirmationSetting? = nil,
        intent_display_name : String? = nil,
        kendra_configuration : Types::KendraConfiguration? = nil,
        output_contexts : Array(Types::OutputContext)? = nil,
        parent_intent_signature : String? = nil,
        q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration? = nil,
        qn_a_intent_configuration : Types::QnAIntentConfiguration? = nil,
        sample_utterances : Array(Types::SampleUtterance)? = nil
      ) : Protocol::Request
        input = Types::CreateIntentRequest.new(bot_id: bot_id, bot_version: bot_version, intent_name: intent_name, locale_id: locale_id, description: description, dialog_code_hook: dialog_code_hook, fulfillment_code_hook: fulfillment_code_hook, initial_response_setting: initial_response_setting, input_contexts: input_contexts, intent_closing_setting: intent_closing_setting, intent_confirmation_setting: intent_confirmation_setting, intent_display_name: intent_display_name, kendra_configuration: kendra_configuration, output_contexts: output_contexts, parent_intent_signature: parent_intent_signature, q_in_connect_intent_configuration: q_in_connect_intent_configuration, qn_a_intent_configuration: qn_a_intent_configuration, sample_utterances: sample_utterances)
        create_intent(input)
      end

      def create_intent(input : Types::CreateIntentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new resource policy with the specified policy statements.

      def create_resource_policy(
        policy : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::CreateResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn)
        create_resource_policy(input)
      end

      def create_resource_policy(input : Types::CreateResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a new resource policy statement to a bot or bot alias. If a resource policy exists, the
      # statement is added to the current resource policy. If a policy doesn't exist, a new policy is
      # created. You can't create a resource policy statement that allows cross-account access. You need to
      # add the CreateResourcePolicy or UpdateResourcePolicy action to the bot role in order to call the
      # API.

      def create_resource_policy_statement(
        action : Array(String),
        effect : String,
        principal : Array(Types::Principal),
        resource_arn : String,
        statement_id : String,
        condition : Hash(String, Hash(String, String))? = nil,
        expected_revision_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateResourcePolicyStatementRequest.new(action: action, effect: effect, principal: principal, resource_arn: resource_arn, statement_id: statement_id, condition: condition, expected_revision_id: expected_revision_id)
        create_resource_policy_statement(input)
      end

      def create_resource_policy_statement(input : Types::CreateResourcePolicyStatementRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_POLICY_STATEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a slot in an intent. A slot is a variable needed to fulfill an intent. For example, an
      # OrderPizza intent might need slots for size, crust, and number of pizzas. For each slot, you define
      # one or more utterances that Amazon Lex uses to elicit a response from the user.

      def create_slot(
        bot_id : String,
        bot_version : String,
        intent_id : String,
        locale_id : String,
        slot_name : String,
        value_elicitation_setting : Types::SlotValueElicitationSetting,
        description : String? = nil,
        multiple_values_setting : Types::MultipleValuesSetting? = nil,
        obfuscation_setting : Types::ObfuscationSetting? = nil,
        slot_type_id : String? = nil,
        sub_slot_setting : Types::SubSlotSetting? = nil
      ) : Protocol::Request
        input = Types::CreateSlotRequest.new(bot_id: bot_id, bot_version: bot_version, intent_id: intent_id, locale_id: locale_id, slot_name: slot_name, value_elicitation_setting: value_elicitation_setting, description: description, multiple_values_setting: multiple_values_setting, obfuscation_setting: obfuscation_setting, slot_type_id: slot_type_id, sub_slot_setting: sub_slot_setting)
        create_slot(input)
      end

      def create_slot(input : Types::CreateSlotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SLOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom slot type To create a custom slot type, specify a name for the slot type and a set
      # of enumeration values, the values that a slot of this type can assume.

      def create_slot_type(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        slot_type_name : String,
        composite_slot_type_setting : Types::CompositeSlotTypeSetting? = nil,
        description : String? = nil,
        external_source_setting : Types::ExternalSourceSetting? = nil,
        parent_slot_type_signature : String? = nil,
        slot_type_values : Array(Types::SlotTypeValue)? = nil,
        value_selection_setting : Types::SlotValueSelectionSetting? = nil
      ) : Protocol::Request
        input = Types::CreateSlotTypeRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, slot_type_name: slot_type_name, composite_slot_type_setting: composite_slot_type_setting, description: description, external_source_setting: external_source_setting, parent_slot_type_signature: parent_slot_type_signature, slot_type_values: slot_type_values, value_selection_setting: value_selection_setting)
        create_slot_type(input)
      end

      def create_slot_type(input : Types::CreateSlotTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SLOT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a report that describes the differences between the bot and the test set.

      def create_test_set_discrepancy_report(
        target : Types::TestSetDiscrepancyReportResourceTarget,
        test_set_id : String
      ) : Protocol::Request
        input = Types::CreateTestSetDiscrepancyReportRequest.new(target: target, test_set_id: test_set_id)
        create_test_set_discrepancy_report(input)
      end

      def create_test_set_discrepancy_report(input : Types::CreateTestSetDiscrepancyReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TEST_SET_DISCREPANCY_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a pre-signed S3 write URL that you use to upload the zip archive when importing a bot or a bot
      # locale.

      def create_upload_url : Protocol::Request
        input = Types::CreateUploadUrlRequest.new
        create_upload_url(input)
      end

      def create_upload_url(input : Types::CreateUploadUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_UPLOAD_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes all versions of a bot, including the Draft version. To delete a specific version, use the
      # DeleteBotVersion operation. When you delete a bot, all of the resources contained in the bot are
      # also deleted. Deleting a bot removes all locales, intents, slot, and slot types defined for the bot.
      # If a bot has an alias, the DeleteBot operation returns a ResourceInUseException exception. If you
      # want to delete the bot and the alias, set the skipResourceInUseCheck parameter to true .

      def delete_bot(
        bot_id : String,
        skip_resource_in_use_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteBotRequest.new(bot_id: bot_id, skip_resource_in_use_check: skip_resource_in_use_check)
        delete_bot(input)
      end

      def delete_bot(input : Types::DeleteBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified bot alias.

      def delete_bot_alias(
        bot_alias_id : String,
        bot_id : String,
        skip_resource_in_use_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteBotAliasRequest.new(bot_alias_id: bot_alias_id, bot_id: bot_id, skip_resource_in_use_check: skip_resource_in_use_check)
        delete_bot_alias(input)
      end

      def delete_bot_alias(input : Types::DeleteBotAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a locale from a bot. When you delete a locale, all intents, slots, and slot types defined
      # for the locale are also deleted.

      def delete_bot_locale(
        bot_id : String,
        bot_version : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::DeleteBotLocaleRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id)
        delete_bot_locale(input)
      end

      def delete_bot_locale(input : Types::DeleteBotLocaleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT_LOCALE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The action to delete the replicated bot in the secondary region.

      def delete_bot_replica(
        bot_id : String,
        replica_region : String
      ) : Protocol::Request
        input = Types::DeleteBotReplicaRequest.new(bot_id: bot_id, replica_region: replica_region)
        delete_bot_replica(input)
      end

      def delete_bot_replica(input : Types::DeleteBotReplicaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT_REPLICA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific version of a bot. To delete all versions of a bot, use the DeleteBot operation.

      def delete_bot_version(
        bot_id : String,
        bot_version : String,
        skip_resource_in_use_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteBotVersionRequest.new(bot_id: bot_id, bot_version: bot_version, skip_resource_in_use_check: skip_resource_in_use_check)
        delete_bot_version(input)
      end

      def delete_bot_version(input : Types::DeleteBotVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a custom vocabulary from the specified locale in the specified bot.

      def delete_custom_vocabulary(
        bot_id : String,
        bot_version : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::DeleteCustomVocabularyRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id)
        delete_custom_vocabulary(input)
      end

      def delete_custom_vocabulary(input : Types::DeleteCustomVocabularyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_VOCABULARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a previous export and the associated files stored in an S3 bucket.

      def delete_export(
        export_id : String
      ) : Protocol::Request
        input = Types::DeleteExportRequest.new(export_id: export_id)
        delete_export(input)
      end

      def delete_export(input : Types::DeleteExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a previous import and the associated file stored in an S3 bucket.

      def delete_import(
        import_id : String
      ) : Protocol::Request
        input = Types::DeleteImportRequest.new(import_id: import_id)
        delete_import(input)
      end

      def delete_import(input : Types::DeleteImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IMPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified intent. Deleting an intent also deletes the slots associated with the intent.

      def delete_intent(
        bot_id : String,
        bot_version : String,
        intent_id : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::DeleteIntentRequest.new(bot_id: bot_id, bot_version: bot_version, intent_id: intent_id, locale_id: locale_id)
        delete_intent(input)
      end

      def delete_intent(input : Types::DeleteIntentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an existing policy from a bot or bot alias. If the resource doesn't have a policy attached,
      # Amazon Lex returns an exception.

      def delete_resource_policy(
        resource_arn : String,
        expected_revision_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn, expected_revision_id: expected_revision_id)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a policy statement from a resource policy. If you delete the last statement from a policy,
      # the policy is deleted. If you specify a statement ID that doesn't exist in the policy, or if the bot
      # or bot alias doesn't have a policy attached, Amazon Lex returns an exception. You need to add the
      # DeleteResourcePolicy or UpdateResourcePolicy action to the bot role in order to call the API.

      def delete_resource_policy_statement(
        resource_arn : String,
        statement_id : String,
        expected_revision_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyStatementRequest.new(resource_arn: resource_arn, statement_id: statement_id, expected_revision_id: expected_revision_id)
        delete_resource_policy_statement(input)
      end

      def delete_resource_policy_statement(input : Types::DeleteResourcePolicyStatementRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY_STATEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified slot from an intent.

      def delete_slot(
        bot_id : String,
        bot_version : String,
        intent_id : String,
        locale_id : String,
        slot_id : String
      ) : Protocol::Request
        input = Types::DeleteSlotRequest.new(bot_id: bot_id, bot_version: bot_version, intent_id: intent_id, locale_id: locale_id, slot_id: slot_id)
        delete_slot(input)
      end

      def delete_slot(input : Types::DeleteSlotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SLOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a slot type from a bot locale. If a slot is using the slot type, Amazon Lex throws a
      # ResourceInUseException exception. To avoid the exception, set the skipResourceInUseCheck parameter
      # to true .

      def delete_slot_type(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        slot_type_id : String,
        skip_resource_in_use_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteSlotTypeRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, slot_type_id: slot_type_id, skip_resource_in_use_check: skip_resource_in_use_check)
        delete_slot_type(input)
      end

      def delete_slot_type(input : Types::DeleteSlotTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SLOT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The action to delete the selected test set.

      def delete_test_set(
        test_set_id : String
      ) : Protocol::Request
        input = Types::DeleteTestSetRequest.new(test_set_id: test_set_id)
        delete_test_set(input)
      end

      def delete_test_set(input : Types::DeleteTestSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TEST_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes stored utterances. Amazon Lex stores the utterances that users send to your bot. Utterances
      # are stored for 15 days for use with the ListAggregatedUtterances operation, and then stored
      # indefinitely for use in improving the ability of your bot to respond to user input.. Use the
      # DeleteUtterances operation to manually delete utterances for a specific session. When you use the
      # DeleteUtterances operation, utterances stored for improving your bot's ability to respond to user
      # input are deleted immediately. Utterances stored for use with the ListAggregatedUtterances operation
      # are deleted after 15 days.

      def delete_utterances(
        bot_id : String,
        locale_id : String? = nil,
        session_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteUtterancesRequest.new(bot_id: bot_id, locale_id: locale_id, session_id: session_id)
        delete_utterances(input)
      end

      def delete_utterances(input : Types::DeleteUtterancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_UTTERANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides metadata information about a bot.

      def describe_bot(
        bot_id : String
      ) : Protocol::Request
        input = Types::DescribeBotRequest.new(bot_id: bot_id)
        describe_bot(input)
      end

      def describe_bot(input : Types::DescribeBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about a specific bot alias.

      def describe_bot_alias(
        bot_alias_id : String,
        bot_id : String
      ) : Protocol::Request
        input = Types::DescribeBotAliasRequest.new(bot_alias_id: bot_alias_id, bot_id: bot_id)
        describe_bot_alias(input)
      end

      def describe_bot_alias(input : Types::DescribeBotAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BOT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the settings that a bot has for a specific locale.

      def describe_bot_locale(
        bot_id : String,
        bot_version : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::DescribeBotLocaleRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id)
        describe_bot_locale(input)
      end

      def describe_bot_locale(input : Types::DescribeBotLocaleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BOT_LOCALE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides metadata information about a bot recommendation. This information will enable you to get a
      # description on the request inputs, to download associated transcripts after processing is complete,
      # and to download intents and slot-types generated by the bot recommendation.

      def describe_bot_recommendation(
        bot_id : String,
        bot_recommendation_id : String,
        bot_version : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::DescribeBotRecommendationRequest.new(bot_id: bot_id, bot_recommendation_id: bot_recommendation_id, bot_version: bot_version, locale_id: locale_id)
        describe_bot_recommendation(input)
      end

      def describe_bot_recommendation(input : Types::DescribeBotRecommendationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BOT_RECOMMENDATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Monitors the bot replication status through the UI console.

      def describe_bot_replica(
        bot_id : String,
        replica_region : String
      ) : Protocol::Request
        input = Types::DescribeBotReplicaRequest.new(bot_id: bot_id, replica_region: replica_region)
        describe_bot_replica(input)
      end

      def describe_bot_replica(input : Types::DescribeBotReplicaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BOT_REPLICA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a request to generate a bot through natural language description, made
      # through the StartBotResource API. Use the generatedBotLocaleUrl to retrieve the Amazon S3 object
      # containing the bot locale configuration. You can then modify and import this configuration.

      def describe_bot_resource_generation(
        bot_id : String,
        bot_version : String,
        generation_id : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::DescribeBotResourceGenerationRequest.new(bot_id: bot_id, bot_version: bot_version, generation_id: generation_id, locale_id: locale_id)
        describe_bot_resource_generation(input)
      end

      def describe_bot_resource_generation(input : Types::DescribeBotResourceGenerationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BOT_RESOURCE_GENERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides metadata about a version of a bot.

      def describe_bot_version(
        bot_id : String,
        bot_version : String
      ) : Protocol::Request
        input = Types::DescribeBotVersionRequest.new(bot_id: bot_id, bot_version: bot_version)
        describe_bot_version(input)
      end

      def describe_bot_version(input : Types::DescribeBotVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BOT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides metadata information about a custom vocabulary.

      def describe_custom_vocabulary_metadata(
        bot_id : String,
        bot_version : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::DescribeCustomVocabularyMetadataRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id)
        describe_custom_vocabulary_metadata(input)
      end

      def describe_custom_vocabulary_metadata(input : Types::DescribeCustomVocabularyMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CUSTOM_VOCABULARY_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specific export.

      def describe_export(
        export_id : String
      ) : Protocol::Request
        input = Types::DescribeExportRequest.new(export_id: export_id)
        describe_export(input)
      end

      def describe_export(input : Types::DescribeExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specific import.

      def describe_import(
        import_id : String
      ) : Protocol::Request
        input = Types::DescribeImportRequest.new(import_id: import_id)
        describe_import(input)
      end

      def describe_import(input : Types::DescribeImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_IMPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata about an intent.

      def describe_intent(
        bot_id : String,
        bot_version : String,
        intent_id : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::DescribeIntentRequest.new(bot_id: bot_id, bot_version: bot_version, intent_id: intent_id, locale_id: locale_id)
        describe_intent(input)
      end

      def describe_intent(input : Types::DescribeIntentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the resource policy and policy revision for a bot or bot alias.

      def describe_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::DescribeResourcePolicyRequest.new(resource_arn: resource_arn)
        describe_resource_policy(input)
      end

      def describe_resource_policy(input : Types::DescribeResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets metadata information about a slot.

      def describe_slot(
        bot_id : String,
        bot_version : String,
        intent_id : String,
        locale_id : String,
        slot_id : String
      ) : Protocol::Request
        input = Types::DescribeSlotRequest.new(bot_id: bot_id, bot_version: bot_version, intent_id: intent_id, locale_id: locale_id, slot_id: slot_id)
        describe_slot(input)
      end

      def describe_slot(input : Types::DescribeSlotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SLOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets metadata information about a slot type.

      def describe_slot_type(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        slot_type_id : String
      ) : Protocol::Request
        input = Types::DescribeSlotTypeRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, slot_type_id: slot_type_id)
        describe_slot_type(input)
      end

      def describe_slot_type(input : Types::DescribeSlotTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SLOT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets metadata information about the test execution.

      def describe_test_execution(
        test_execution_id : String
      ) : Protocol::Request
        input = Types::DescribeTestExecutionRequest.new(test_execution_id: test_execution_id)
        describe_test_execution(input)
      end

      def describe_test_execution(input : Types::DescribeTestExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TEST_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets metadata information about the test set.

      def describe_test_set(
        test_set_id : String
      ) : Protocol::Request
        input = Types::DescribeTestSetRequest.new(test_set_id: test_set_id)
        describe_test_set(input)
      end

      def describe_test_set(input : Types::DescribeTestSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TEST_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets metadata information about the test set discrepancy report.

      def describe_test_set_discrepancy_report(
        test_set_discrepancy_report_id : String
      ) : Protocol::Request
        input = Types::DescribeTestSetDiscrepancyReportRequest.new(test_set_discrepancy_report_id: test_set_discrepancy_report_id)
        describe_test_set_discrepancy_report(input)
      end

      def describe_test_set_discrepancy_report(input : Types::DescribeTestSetDiscrepancyReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TEST_SET_DISCREPANCY_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets metadata information about the test set generation.

      def describe_test_set_generation(
        test_set_generation_id : String
      ) : Protocol::Request
        input = Types::DescribeTestSetGenerationRequest.new(test_set_generation_id: test_set_generation_id)
        describe_test_set_generation(input)
      end

      def describe_test_set_generation(input : Types::DescribeTestSetGenerationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TEST_SET_GENERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates sample utterances for an intent.

      def generate_bot_element(
        bot_id : String,
        bot_version : String,
        intent_id : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::GenerateBotElementRequest.new(bot_id: bot_id, bot_version: bot_version, intent_id: intent_id, locale_id: locale_id)
        generate_bot_element(input)
      end

      def generate_bot_element(input : Types::GenerateBotElementRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_BOT_ELEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The pre-signed Amazon S3 URL to download the test execution result artifacts.

      def get_test_execution_artifacts_url(
        test_execution_id : String
      ) : Protocol::Request
        input = Types::GetTestExecutionArtifactsUrlRequest.new(test_execution_id: test_execution_id)
        get_test_execution_artifacts_url(input)
      end

      def get_test_execution_artifacts_url(input : Types::GetTestExecutionArtifactsUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEST_EXECUTION_ARTIFACTS_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a list of utterances that users have sent to the bot. Utterances are aggregated by the text
      # of the utterance. For example, all instances where customers used the phrase "I want to order pizza"
      # are aggregated into the same line in the response. You can see both detected utterances and missed
      # utterances. A detected utterance is where the bot properly recognized the utterance and activated
      # the associated intent. A missed utterance was not recognized by the bot and didn't activate an
      # intent. Utterances can be aggregated for a bot alias or for a bot version, but not both at the same
      # time. Utterances statistics are not generated under the following conditions: The childDirected
      # field was set to true when the bot was created. You are using slot obfuscation with one or more
      # slots. You opted out of participating in improving Amazon Lex.

      def list_aggregated_utterances(
        aggregation_duration : Types::UtteranceAggregationDuration,
        bot_id : String,
        locale_id : String,
        bot_alias_id : String? = nil,
        bot_version : String? = nil,
        filters : Array(Types::AggregatedUtterancesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::AggregatedUtterancesSortBy? = nil
      ) : Protocol::Request
        input = Types::ListAggregatedUtterancesRequest.new(aggregation_duration: aggregation_duration, bot_id: bot_id, locale_id: locale_id, bot_alias_id: bot_alias_id, bot_version: bot_version, filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_aggregated_utterances(input)
      end

      def list_aggregated_utterances(input : Types::ListAggregatedUtterancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGGREGATED_UTTERANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The action to list the replicated bots created from the source bot alias.

      def list_bot_alias_replicas(
        bot_id : String,
        replica_region : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBotAliasReplicasRequest.new(bot_id: bot_id, replica_region: replica_region, max_results: max_results, next_token: next_token)
        list_bot_alias_replicas(input)
      end

      def list_bot_alias_replicas(input : Types::ListBotAliasReplicasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOT_ALIAS_REPLICAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of aliases for the specified bot.

      def list_bot_aliases(
        bot_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBotAliasesRequest.new(bot_id: bot_id, max_results: max_results, next_token: next_token)
        list_bot_aliases(input)
      end

      def list_bot_aliases(input : Types::ListBotAliasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOT_ALIASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of locales for the specified bot.

      def list_bot_locales(
        bot_id : String,
        bot_version : String,
        filters : Array(Types::BotLocaleFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::BotLocaleSortBy? = nil
      ) : Protocol::Request
        input = Types::ListBotLocalesRequest.new(bot_id: bot_id, bot_version: bot_version, filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_bot_locales(input)
      end

      def list_bot_locales(input : Types::ListBotLocalesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOT_LOCALES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a list of bot recommendations that meet the specified criteria.

      def list_bot_recommendations(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBotRecommendationsRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, max_results: max_results, next_token: next_token)
        list_bot_recommendations(input)
      end

      def list_bot_recommendations(input : Types::ListBotRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOT_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The action to list the replicated bots.

      def list_bot_replicas(
        bot_id : String
      ) : Protocol::Request
        input = Types::ListBotReplicasRequest.new(bot_id: bot_id)
        list_bot_replicas(input)
      end

      def list_bot_replicas(input : Types::ListBotReplicasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOT_REPLICAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the generation requests made for a bot locale.

      def list_bot_resource_generations(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::GenerationSortBy? = nil
      ) : Protocol::Request
        input = Types::ListBotResourceGenerationsRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_bot_resource_generations(input)
      end

      def list_bot_resource_generations(input : Types::ListBotResourceGenerationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOT_RESOURCE_GENERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Contains information about all the versions replication statuses applicable for Global Resiliency.

      def list_bot_version_replicas(
        bot_id : String,
        replica_region : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::BotVersionReplicaSortBy? = nil
      ) : Protocol::Request
        input = Types::ListBotVersionReplicasRequest.new(bot_id: bot_id, replica_region: replica_region, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_bot_version_replicas(input)
      end

      def list_bot_version_replicas(input : Types::ListBotVersionReplicasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOT_VERSION_REPLICAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about all of the versions of a bot. The ListBotVersions operation returns a summary
      # of each version of a bot. For example, if a bot has three numbered versions, the ListBotVersions
      # operation returns for summaries, one for each numbered version and one for the DRAFT version. The
      # ListBotVersions operation always returns at least one version, the DRAFT version.

      def list_bot_versions(
        bot_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::BotVersionSortBy? = nil
      ) : Protocol::Request
        input = Types::ListBotVersionsRequest.new(bot_id: bot_id, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_bot_versions(input)
      end

      def list_bot_versions(input : Types::ListBotVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of available bots.

      def list_bots(
        filters : Array(Types::BotFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::BotSortBy? = nil
      ) : Protocol::Request
        input = Types::ListBotsRequest.new(filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_bots(input)
      end

      def list_bots(input : Types::ListBotsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of built-in intents provided by Amazon Lex that you can use in your bot. To use a
      # built-in intent as a the base for your own intent, include the built-in intent signature in the
      # parentIntentSignature parameter when you call the CreateIntent operation. For more information, see
      # CreateIntent .

      def list_built_in_intents(
        locale_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::BuiltInIntentSortBy? = nil
      ) : Protocol::Request
        input = Types::ListBuiltInIntentsRequest.new(locale_id: locale_id, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_built_in_intents(input)
      end

      def list_built_in_intents(input : Types::ListBuiltInIntentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BUILT_IN_INTENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of built-in slot types that meet the specified criteria.

      def list_built_in_slot_types(
        locale_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::BuiltInSlotTypeSortBy? = nil
      ) : Protocol::Request
        input = Types::ListBuiltInSlotTypesRequest.new(locale_id: locale_id, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_built_in_slot_types(input)
      end

      def list_built_in_slot_types(input : Types::ListBuiltInSlotTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BUILT_IN_SLOT_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Paginated list of custom vocabulary items for a given bot locale's custom vocabulary.

      def list_custom_vocabulary_items(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomVocabularyItemsRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, max_results: max_results, next_token: next_token)
        list_custom_vocabulary_items(input)
      end

      def list_custom_vocabulary_items(input : Types::ListCustomVocabularyItemsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_VOCABULARY_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the exports for a bot, bot locale, or custom vocabulary. Exports are kept in the list for 7
      # days.

      def list_exports(
        bot_id : String? = nil,
        bot_version : String? = nil,
        filters : Array(Types::ExportFilter)? = nil,
        locale_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::ExportSortBy? = nil
      ) : Protocol::Request
        input = Types::ListExportsRequest.new(bot_id: bot_id, bot_version: bot_version, filters: filters, locale_id: locale_id, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_exports(input)
      end

      def list_exports(input : Types::ListExportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the imports for a bot, bot locale, or custom vocabulary. Imports are kept in the list for 7
      # days.

      def list_imports(
        bot_id : String? = nil,
        bot_version : String? = nil,
        filters : Array(Types::ImportFilter)? = nil,
        locale_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::ImportSortBy? = nil
      ) : Protocol::Request
        input = Types::ListImportsRequest.new(bot_id: bot_id, bot_version: bot_version, filters: filters, locale_id: locale_id, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_imports(input)
      end

      def list_imports(input : Types::ListImportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves summary metrics for the intents in your bot. The following fields are required: metrics –
      # A list of AnalyticsIntentMetric objects. In each object, use the name field to specify the metric to
      # calculate, the statistic field to specify whether to calculate the Sum , Average , or Max number,
      # and the order field to specify whether to sort the results in Ascending or Descending order.
      # startDateTime and endDateTime – Define a time range for which you want to retrieve results. Of the
      # optional fields, you can organize the results in the following ways: Use the filters field to filter
      # the results, the groupBy field to specify categories by which to group the results, and the binBy
      # field to specify time intervals by which to group the results. Use the maxResults field to limit the
      # number of results to return in a single response and the nextToken field to return the next batch of
      # results if the response does not return the full set of results. Note that an order field exists in
      # both binBy and metrics . You can specify only one order in a given request.

      def list_intent_metrics(
        bot_id : String,
        end_date_time : Time,
        metrics : Array(Types::AnalyticsIntentMetric),
        start_date_time : Time,
        bin_by : Array(Types::AnalyticsBinBySpecification)? = nil,
        filters : Array(Types::AnalyticsIntentFilter)? = nil,
        group_by : Array(Types::AnalyticsIntentGroupBySpecification)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIntentMetricsRequest.new(bot_id: bot_id, end_date_time: end_date_time, metrics: metrics, start_date_time: start_date_time, bin_by: bin_by, filters: filters, group_by: group_by, max_results: max_results, next_token: next_token)
        list_intent_metrics(input)
      end

      def list_intent_metrics(input : Types::ListIntentMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INTENT_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves summary statistics for a path of intents that users take over sessions with your bot. The
      # following fields are required: startDateTime and endDateTime – Define a time range for which you
      # want to retrieve results. intentPath – Define an order of intents for which you want to retrieve
      # metrics. Separate intents in the path with a forward slash. For example, populate the intentPath
      # field with /BookCar/BookHotel to see details about how many times users invoked the BookCar and
      # BookHotel intents in that order. Use the optional filters field to filter the results.

      def list_intent_paths(
        bot_id : String,
        end_date_time : Time,
        intent_path : String,
        start_date_time : Time,
        filters : Array(Types::AnalyticsPathFilter)? = nil
      ) : Protocol::Request
        input = Types::ListIntentPathsRequest.new(bot_id: bot_id, end_date_time: end_date_time, intent_path: intent_path, start_date_time: start_date_time, filters: filters)
        list_intent_paths(input)
      end

      def list_intent_paths(input : Types::ListIntentPathsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INTENT_PATHS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves summary metrics for the stages within intents in your bot. The following fields are
      # required: metrics – A list of AnalyticsIntentStageMetric objects. In each object, use the name field
      # to specify the metric to calculate, the statistic field to specify whether to calculate the Sum ,
      # Average , or Max number, and the order field to specify whether to sort the results in Ascending or
      # Descending order. startDateTime and endDateTime – Define a time range for which you want to retrieve
      # results. Of the optional fields, you can organize the results in the following ways: Use the filters
      # field to filter the results, the groupBy field to specify categories by which to group the results,
      # and the binBy field to specify time intervals by which to group the results. Use the maxResults
      # field to limit the number of results to return in a single response and the nextToken field to
      # return the next batch of results if the response does not return the full set of results. Note that
      # an order field exists in both binBy and metrics . You can only specify one order in a given request.

      def list_intent_stage_metrics(
        bot_id : String,
        end_date_time : Time,
        metrics : Array(Types::AnalyticsIntentStageMetric),
        start_date_time : Time,
        bin_by : Array(Types::AnalyticsBinBySpecification)? = nil,
        filters : Array(Types::AnalyticsIntentStageFilter)? = nil,
        group_by : Array(Types::AnalyticsIntentStageGroupBySpecification)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIntentStageMetricsRequest.new(bot_id: bot_id, end_date_time: end_date_time, metrics: metrics, start_date_time: start_date_time, bin_by: bin_by, filters: filters, group_by: group_by, max_results: max_results, next_token: next_token)
        list_intent_stage_metrics(input)
      end

      def list_intent_stage_metrics(input : Types::ListIntentStageMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INTENT_STAGE_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a list of intents that meet the specified criteria.

      def list_intents(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        filters : Array(Types::IntentFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::IntentSortBy? = nil
      ) : Protocol::Request
        input = Types::ListIntentsRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_intents(input)
      end

      def list_intents(input : Types::ListIntentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INTENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of recommended intents provided by the bot recommendation that you can use in your bot.
      # Intents in the response are ordered by relevance.

      def list_recommended_intents(
        bot_id : String,
        bot_recommendation_id : String,
        bot_version : String,
        locale_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecommendedIntentsRequest.new(bot_id: bot_id, bot_recommendation_id: bot_recommendation_id, bot_version: bot_version, locale_id: locale_id, max_results: max_results, next_token: next_token)
        list_recommended_intents(input)
      end

      def list_recommended_intents(input : Types::ListRecommendedIntentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDED_INTENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of metadata for individual user sessions with your bot. The startDateTime and
      # endDateTime fields are required. These fields define a time range for which you want to retrieve
      # results. Of the optional fields, you can organize the results in the following ways: Use the filters
      # field to filter the results and the sortBy field to specify the values by which to sort the results.
      # Use the maxResults field to limit the number of results to return in a single response and the
      # nextToken field to return the next batch of results if the response does not return the full set of
      # results.

      def list_session_analytics_data(
        bot_id : String,
        end_date_time : Time,
        start_date_time : Time,
        filters : Array(Types::AnalyticsSessionFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::SessionDataSortBy? = nil
      ) : Protocol::Request
        input = Types::ListSessionAnalyticsDataRequest.new(bot_id: bot_id, end_date_time: end_date_time, start_date_time: start_date_time, filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_session_analytics_data(input)
      end

      def list_session_analytics_data(input : Types::ListSessionAnalyticsDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSION_ANALYTICS_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves summary metrics for the user sessions with your bot. The following fields are required:
      # metrics – A list of AnalyticsSessionMetric objects. In each object, use the name field to specify
      # the metric to calculate, the statistic field to specify whether to calculate the Sum , Average , or
      # Max number, and the order field to specify whether to sort the results in Ascending or Descending
      # order. startDateTime and endDateTime – Define a time range for which you want to retrieve results.
      # Of the optional fields, you can organize the results in the following ways: Use the filters field to
      # filter the results, the groupBy field to specify categories by which to group the results, and the
      # binBy field to specify time intervals by which to group the results. Use the maxResults field to
      # limit the number of results to return in a single response and the nextToken field to return the
      # next batch of results if the response does not return the full set of results. Note that an order
      # field exists in both binBy and metrics . Currently, you can specify it in either field, but not in
      # both.

      def list_session_metrics(
        bot_id : String,
        end_date_time : Time,
        metrics : Array(Types::AnalyticsSessionMetric),
        start_date_time : Time,
        bin_by : Array(Types::AnalyticsBinBySpecification)? = nil,
        filters : Array(Types::AnalyticsSessionFilter)? = nil,
        group_by : Array(Types::AnalyticsSessionGroupBySpecification)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionMetricsRequest.new(bot_id: bot_id, end_date_time: end_date_time, metrics: metrics, start_date_time: start_date_time, bin_by: bin_by, filters: filters, group_by: group_by, max_results: max_results, next_token: next_token)
        list_session_metrics(input)
      end

      def list_session_metrics(input : Types::ListSessionMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSION_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of slot types that match the specified criteria.

      def list_slot_types(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        filters : Array(Types::SlotTypeFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::SlotTypeSortBy? = nil
      ) : Protocol::Request
        input = Types::ListSlotTypesRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_slot_types(input)
      end

      def list_slot_types(input : Types::ListSlotTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SLOT_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of slots that match the specified criteria.

      def list_slots(
        bot_id : String,
        bot_version : String,
        intent_id : String,
        locale_id : String,
        filters : Array(Types::SlotFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::SlotSortBy? = nil
      ) : Protocol::Request
        input = Types::ListSlotsRequest.new(bot_id: bot_id, bot_version: bot_version, intent_id: intent_id, locale_id: locale_id, filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_slots(input)
      end

      def list_slots(input : Types::ListSlotsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SLOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of tags associated with a resource. Only bots, bot aliases, and bot channels can have
      # tags associated with them.

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

      # Gets a list of test execution result items.

      def list_test_execution_result_items(
        result_filter_by : Types::TestExecutionResultFilterBy,
        test_execution_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTestExecutionResultItemsRequest.new(result_filter_by: result_filter_by, test_execution_id: test_execution_id, max_results: max_results, next_token: next_token)
        list_test_execution_result_items(input)
      end

      def list_test_execution_result_items(input : Types::ListTestExecutionResultItemsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEST_EXECUTION_RESULT_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The list of test set executions.

      def list_test_executions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::TestExecutionSortBy? = nil
      ) : Protocol::Request
        input = Types::ListTestExecutionsRequest.new(max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_test_executions(input)
      end

      def list_test_executions(input : Types::ListTestExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEST_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The list of test set records.

      def list_test_set_records(
        test_set_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTestSetRecordsRequest.new(test_set_id: test_set_id, max_results: max_results, next_token: next_token)
        list_test_set_records(input)
      end

      def list_test_set_records(input : Types::ListTestSetRecordsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEST_SET_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The list of the test sets

      def list_test_sets(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::TestSetSortBy? = nil
      ) : Protocol::Request
        input = Types::ListTestSetsRequest.new(max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_test_sets(input)
      end

      def list_test_sets(input : Types::ListTestSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEST_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # To use this API operation, your IAM role must have permissions to perform the
      # ListAggregatedUtterances operation, which provides access to utterance-related analytics. See
      # Viewing utterance statistics for the IAM policy to apply to the IAM role. Retrieves a list of
      # metadata for individual user utterances to your bot. The following fields are required:
      # startDateTime and endDateTime – Define a time range for which you want to retrieve results. Of the
      # optional fields, you can organize the results in the following ways: Use the filters field to filter
      # the results and the sortBy field to specify the values by which to sort the results. Use the
      # maxResults field to limit the number of results to return in a single response and the nextToken
      # field to return the next batch of results if the response does not return the full set of results.

      def list_utterance_analytics_data(
        bot_id : String,
        end_date_time : Time,
        start_date_time : Time,
        filters : Array(Types::AnalyticsUtteranceFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::UtteranceDataSortBy? = nil
      ) : Protocol::Request
        input = Types::ListUtteranceAnalyticsDataRequest.new(bot_id: bot_id, end_date_time: end_date_time, start_date_time: start_date_time, filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_utterance_analytics_data(input)
      end

      def list_utterance_analytics_data(input : Types::ListUtteranceAnalyticsDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_UTTERANCE_ANALYTICS_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # To use this API operation, your IAM role must have permissions to perform the
      # ListAggregatedUtterances operation, which provides access to utterance-related analytics. See
      # Viewing utterance statistics for the IAM policy to apply to the IAM role. Retrieves summary metrics
      # for the utterances in your bot. The following fields are required: metrics – A list of
      # AnalyticsUtteranceMetric objects. In each object, use the name field to specify the metric to
      # calculate, the statistic field to specify whether to calculate the Sum , Average , or Max number,
      # and the order field to specify whether to sort the results in Ascending or Descending order.
      # startDateTime and endDateTime – Define a time range for which you want to retrieve results. Of the
      # optional fields, you can organize the results in the following ways: Use the filters field to filter
      # the results, the groupBy field to specify categories by which to group the results, and the binBy
      # field to specify time intervals by which to group the results. Use the maxResults field to limit the
      # number of results to return in a single response and the nextToken field to return the next batch of
      # results if the response does not return the full set of results. Note that an order field exists in
      # both binBy and metrics . Currently, you can specify it in either field, but not in both.

      def list_utterance_metrics(
        bot_id : String,
        end_date_time : Time,
        metrics : Array(Types::AnalyticsUtteranceMetric),
        start_date_time : Time,
        attributes : Array(Types::AnalyticsUtteranceAttribute)? = nil,
        bin_by : Array(Types::AnalyticsBinBySpecification)? = nil,
        filters : Array(Types::AnalyticsUtteranceFilter)? = nil,
        group_by : Array(Types::AnalyticsUtteranceGroupBySpecification)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUtteranceMetricsRequest.new(bot_id: bot_id, end_date_time: end_date_time, metrics: metrics, start_date_time: start_date_time, attributes: attributes, bin_by: bin_by, filters: filters, group_by: group_by, max_results: max_results, next_token: next_token)
        list_utterance_metrics(input)
      end

      def list_utterance_metrics(input : Types::ListUtteranceMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_UTTERANCE_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Search for associated transcripts that meet the specified criteria.

      def search_associated_transcripts(
        bot_id : String,
        bot_recommendation_id : String,
        bot_version : String,
        filters : Array(Types::AssociatedTranscriptFilter),
        locale_id : String,
        max_results : Int32? = nil,
        next_index : Int32? = nil,
        search_order : String? = nil
      ) : Protocol::Request
        input = Types::SearchAssociatedTranscriptsRequest.new(bot_id: bot_id, bot_recommendation_id: bot_recommendation_id, bot_version: bot_version, filters: filters, locale_id: locale_id, max_results: max_results, next_index: next_index, search_order: search_order)
        search_associated_transcripts(input)
      end

      def search_associated_transcripts(input : Types::SearchAssociatedTranscriptsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_ASSOCIATED_TRANSCRIPTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this to provide your transcript data, and to start the bot recommendation process.

      def start_bot_recommendation(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        transcript_source_setting : Types::TranscriptSourceSetting,
        encryption_setting : Types::EncryptionSetting? = nil
      ) : Protocol::Request
        input = Types::StartBotRecommendationRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, transcript_source_setting: transcript_source_setting, encryption_setting: encryption_setting)
        start_bot_recommendation(input)
      end

      def start_bot_recommendation(input : Types::StartBotRecommendationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_BOT_RECOMMENDATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a request for the descriptive bot builder to generate a bot locale configuration based on the
      # prompt you provide it. After you make this call, use the DescribeBotResourceGeneration operation to
      # check on the status of the generation and for the generatedBotLocaleUrl when the generation is
      # complete. Use that value to retrieve the Amazon S3 object containing the bot locale configuration.
      # You can then modify and import this configuration.

      def start_bot_resource_generation(
        bot_id : String,
        bot_version : String,
        generation_input_prompt : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::StartBotResourceGenerationRequest.new(bot_id: bot_id, bot_version: bot_version, generation_input_prompt: generation_input_prompt, locale_id: locale_id)
        start_bot_resource_generation(input)
      end

      def start_bot_resource_generation(input : Types::StartBotResourceGenerationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_BOT_RESOURCE_GENERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts importing a bot, bot locale, or custom vocabulary from a zip archive that you uploaded to an
      # S3 bucket.

      def start_import(
        import_id : String,
        merge_strategy : String,
        resource_specification : Types::ImportResourceSpecification,
        file_password : String? = nil
      ) : Protocol::Request
        input = Types::StartImportRequest.new(import_id: import_id, merge_strategy: merge_strategy, resource_specification: resource_specification, file_password: file_password)
        start_import(input)
      end

      def start_import(input : Types::StartImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_IMPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The action to start test set execution.

      def start_test_execution(
        api_mode : String,
        target : Types::TestExecutionTarget,
        test_set_id : String,
        test_execution_modality : String? = nil
      ) : Protocol::Request
        input = Types::StartTestExecutionRequest.new(api_mode: api_mode, target: target, test_set_id: test_set_id, test_execution_modality: test_execution_modality)
        start_test_execution(input)
      end

      def start_test_execution(input : Types::StartTestExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TEST_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The action to start the generation of test set.

      def start_test_set_generation(
        generation_data_source : Types::TestSetGenerationDataSource,
        role_arn : String,
        storage_location : Types::TestSetStorageLocation,
        test_set_name : String,
        description : String? = nil,
        test_set_tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartTestSetGenerationRequest.new(generation_data_source: generation_data_source, role_arn: role_arn, storage_location: storage_location, test_set_name: test_set_name, description: description, test_set_tags: test_set_tags)
        start_test_set_generation(input)
      end

      def start_test_set_generation(input : Types::StartTestSetGenerationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TEST_SET_GENERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stop an already running Bot Recommendation request.

      def stop_bot_recommendation(
        bot_id : String,
        bot_recommendation_id : String,
        bot_version : String,
        locale_id : String
      ) : Protocol::Request
        input = Types::StopBotRecommendationRequest.new(bot_id: bot_id, bot_recommendation_id: bot_recommendation_id, bot_version: bot_version, locale_id: locale_id)
        stop_bot_recommendation(input)
      end

      def stop_bot_recommendation(input : Types::StopBotRecommendationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_BOT_RECOMMENDATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tags to the specified resource. If a tag key already exists, the existing value
      # is replaced with the new value.

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

      # Removes tags from a bot, bot alias, or bot channel.

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

      # Updates the configuration of an existing bot.

      def update_bot(
        bot_id : String,
        bot_name : String,
        data_privacy : Types::DataPrivacy,
        idle_session_ttl_in_seconds : Int32,
        role_arn : String,
        bot_members : Array(Types::BotMember)? = nil,
        bot_type : String? = nil,
        description : String? = nil,
        error_log_settings : Types::ErrorLogSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateBotRequest.new(bot_id: bot_id, bot_name: bot_name, data_privacy: data_privacy, idle_session_ttl_in_seconds: idle_session_ttl_in_seconds, role_arn: role_arn, bot_members: bot_members, bot_type: bot_type, description: description, error_log_settings: error_log_settings)
        update_bot(input)
      end

      def update_bot(input : Types::UpdateBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an existing bot alias.

      def update_bot_alias(
        bot_alias_id : String,
        bot_alias_name : String,
        bot_id : String,
        bot_alias_locale_settings : Hash(String, Types::BotAliasLocaleSettings)? = nil,
        bot_version : String? = nil,
        conversation_log_settings : Types::ConversationLogSettings? = nil,
        description : String? = nil,
        sentiment_analysis_settings : Types::SentimentAnalysisSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateBotAliasRequest.new(bot_alias_id: bot_alias_id, bot_alias_name: bot_alias_name, bot_id: bot_id, bot_alias_locale_settings: bot_alias_locale_settings, bot_version: bot_version, conversation_log_settings: conversation_log_settings, description: description, sentiment_analysis_settings: sentiment_analysis_settings)
        update_bot_alias(input)
      end

      def update_bot_alias(input : Types::UpdateBotAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BOT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings that a bot has for a specific locale.

      def update_bot_locale(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        nlu_intent_confidence_threshold : Float64,
        description : String? = nil,
        generative_ai_settings : Types::GenerativeAISettings? = nil,
        speech_detection_sensitivity : String? = nil,
        speech_recognition_settings : Types::SpeechRecognitionSettings? = nil,
        unified_speech_settings : Types::UnifiedSpeechSettings? = nil,
        voice_settings : Types::VoiceSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateBotLocaleRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, nlu_intent_confidence_threshold: nlu_intent_confidence_threshold, description: description, generative_ai_settings: generative_ai_settings, speech_detection_sensitivity: speech_detection_sensitivity, speech_recognition_settings: speech_recognition_settings, unified_speech_settings: unified_speech_settings, voice_settings: voice_settings)
        update_bot_locale(input)
      end

      def update_bot_locale(input : Types::UpdateBotLocaleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BOT_LOCALE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing bot recommendation request.

      def update_bot_recommendation(
        bot_id : String,
        bot_recommendation_id : String,
        bot_version : String,
        encryption_setting : Types::EncryptionSetting,
        locale_id : String
      ) : Protocol::Request
        input = Types::UpdateBotRecommendationRequest.new(bot_id: bot_id, bot_recommendation_id: bot_recommendation_id, bot_version: bot_version, encryption_setting: encryption_setting, locale_id: locale_id)
        update_bot_recommendation(input)
      end

      def update_bot_recommendation(input : Types::UpdateBotRecommendationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BOT_RECOMMENDATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the password used to protect an export zip archive. The password is not required. If you
      # don't supply a password, Amazon Lex generates a zip file that is not protected by a password. This
      # is the archive that is available at the pre-signed S3 URL provided by the DescribeExport operation.

      def update_export(
        export_id : String,
        file_password : String? = nil
      ) : Protocol::Request
        input = Types::UpdateExportRequest.new(export_id: export_id, file_password: file_password)
        update_export(input)
      end

      def update_export(input : Types::UpdateExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings for an intent.

      def update_intent(
        bot_id : String,
        bot_version : String,
        intent_id : String,
        intent_name : String,
        locale_id : String,
        description : String? = nil,
        dialog_code_hook : Types::DialogCodeHookSettings? = nil,
        fulfillment_code_hook : Types::FulfillmentCodeHookSettings? = nil,
        initial_response_setting : Types::InitialResponseSetting? = nil,
        input_contexts : Array(Types::InputContext)? = nil,
        intent_closing_setting : Types::IntentClosingSetting? = nil,
        intent_confirmation_setting : Types::IntentConfirmationSetting? = nil,
        intent_display_name : String? = nil,
        kendra_configuration : Types::KendraConfiguration? = nil,
        output_contexts : Array(Types::OutputContext)? = nil,
        parent_intent_signature : String? = nil,
        q_in_connect_intent_configuration : Types::QInConnectIntentConfiguration? = nil,
        qn_a_intent_configuration : Types::QnAIntentConfiguration? = nil,
        sample_utterances : Array(Types::SampleUtterance)? = nil,
        slot_priorities : Array(Types::SlotPriority)? = nil
      ) : Protocol::Request
        input = Types::UpdateIntentRequest.new(bot_id: bot_id, bot_version: bot_version, intent_id: intent_id, intent_name: intent_name, locale_id: locale_id, description: description, dialog_code_hook: dialog_code_hook, fulfillment_code_hook: fulfillment_code_hook, initial_response_setting: initial_response_setting, input_contexts: input_contexts, intent_closing_setting: intent_closing_setting, intent_confirmation_setting: intent_confirmation_setting, intent_display_name: intent_display_name, kendra_configuration: kendra_configuration, output_contexts: output_contexts, parent_intent_signature: parent_intent_signature, q_in_connect_intent_configuration: q_in_connect_intent_configuration, qn_a_intent_configuration: qn_a_intent_configuration, sample_utterances: sample_utterances, slot_priorities: slot_priorities)
        update_intent(input)
      end

      def update_intent(input : Types::UpdateIntentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Replaces the existing resource policy for a bot or bot alias with a new one. If the policy doesn't
      # exist, Amazon Lex returns an exception.

      def update_resource_policy(
        policy : String,
        resource_arn : String,
        expected_revision_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn, expected_revision_id: expected_revision_id)
        update_resource_policy(input)
      end

      def update_resource_policy(input : Types::UpdateResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings for a slot.

      def update_slot(
        bot_id : String,
        bot_version : String,
        intent_id : String,
        locale_id : String,
        slot_id : String,
        slot_name : String,
        value_elicitation_setting : Types::SlotValueElicitationSetting,
        description : String? = nil,
        multiple_values_setting : Types::MultipleValuesSetting? = nil,
        obfuscation_setting : Types::ObfuscationSetting? = nil,
        slot_type_id : String? = nil,
        sub_slot_setting : Types::SubSlotSetting? = nil
      ) : Protocol::Request
        input = Types::UpdateSlotRequest.new(bot_id: bot_id, bot_version: bot_version, intent_id: intent_id, locale_id: locale_id, slot_id: slot_id, slot_name: slot_name, value_elicitation_setting: value_elicitation_setting, description: description, multiple_values_setting: multiple_values_setting, obfuscation_setting: obfuscation_setting, slot_type_id: slot_type_id, sub_slot_setting: sub_slot_setting)
        update_slot(input)
      end

      def update_slot(input : Types::UpdateSlotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SLOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an existing slot type.

      def update_slot_type(
        bot_id : String,
        bot_version : String,
        locale_id : String,
        slot_type_id : String,
        slot_type_name : String,
        composite_slot_type_setting : Types::CompositeSlotTypeSetting? = nil,
        description : String? = nil,
        external_source_setting : Types::ExternalSourceSetting? = nil,
        parent_slot_type_signature : String? = nil,
        slot_type_values : Array(Types::SlotTypeValue)? = nil,
        value_selection_setting : Types::SlotValueSelectionSetting? = nil
      ) : Protocol::Request
        input = Types::UpdateSlotTypeRequest.new(bot_id: bot_id, bot_version: bot_version, locale_id: locale_id, slot_type_id: slot_type_id, slot_type_name: slot_type_name, composite_slot_type_setting: composite_slot_type_setting, description: description, external_source_setting: external_source_setting, parent_slot_type_signature: parent_slot_type_signature, slot_type_values: slot_type_values, value_selection_setting: value_selection_setting)
        update_slot_type(input)
      end

      def update_slot_type(input : Types::UpdateSlotTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SLOT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The action to update the test set.

      def update_test_set(
        test_set_id : String,
        test_set_name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTestSetRequest.new(test_set_id: test_set_id, test_set_name: test_set_name, description: description)
        update_test_set(input)
      end

      def update_test_set(input : Types::UpdateTestSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TEST_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
