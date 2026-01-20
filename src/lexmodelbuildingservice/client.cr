module Aws
  module LexModelBuildingService
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

      # Creates a new version of the bot based on the $LATEST version. If the $LATEST version of this
      # resource hasn't changed since you created the last version, Amazon Lex doesn't create a new version.
      # It returns the last created version. You can update only the $LATEST version of the bot. You can't
      # update the numbered versions that you create with the CreateBotVersion operation. When you create
      # the first version of a bot, Amazon Lex sets the version to 1. Subsequent versions increment by 1.
      # For more information, see versioning-intro . This operation requires permission for the
      # lex:CreateBotVersion action.

      def create_bot_version(
        name : String,
        checksum : String? = nil
      ) : Protocol::Request
        input = Types::CreateBotVersionRequest.new(name: name, checksum: checksum)
        create_bot_version(input)
      end

      def create_bot_version(input : Types::CreateBotVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BOT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new version of an intent based on the $LATEST version of the intent. If the $LATEST
      # version of this intent hasn't changed since you last updated it, Amazon Lex doesn't create a new
      # version. It returns the last version you created. You can update only the $LATEST version of the
      # intent. You can't update the numbered versions that you create with the CreateIntentVersion
      # operation. When you create a version of an intent, Amazon Lex sets the version to 1. Subsequent
      # versions increment by 1. For more information, see versioning-intro . This operation requires
      # permissions to perform the lex:CreateIntentVersion action.

      def create_intent_version(
        name : String,
        checksum : String? = nil
      ) : Protocol::Request
        input = Types::CreateIntentVersionRequest.new(name: name, checksum: checksum)
        create_intent_version(input)
      end

      def create_intent_version(input : Types::CreateIntentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INTENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new version of a slot type based on the $LATEST version of the specified slot type. If the
      # $LATEST version of this resource has not changed since the last version that you created, Amazon Lex
      # doesn't create a new version. It returns the last version that you created. You can update only the
      # $LATEST version of a slot type. You can't update the numbered versions that you create with the
      # CreateSlotTypeVersion operation. When you create a version of a slot type, Amazon Lex sets the
      # version to 1. Subsequent versions increment by 1. For more information, see versioning-intro . This
      # operation requires permissions for the lex:CreateSlotTypeVersion action.

      def create_slot_type_version(
        name : String,
        checksum : String? = nil
      ) : Protocol::Request
        input = Types::CreateSlotTypeVersionRequest.new(name: name, checksum: checksum)
        create_slot_type_version(input)
      end

      def create_slot_type_version(input : Types::CreateSlotTypeVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SLOT_TYPE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes all versions of the bot, including the $LATEST version. To delete a specific version of the
      # bot, use the DeleteBotVersion operation. The DeleteBot operation doesn't immediately remove the bot
      # schema. Instead, it is marked for deletion and removed later. Amazon Lex stores utterances
      # indefinitely for improving the ability of your bot to respond to user inputs. These utterances are
      # not removed when the bot is deleted. To remove the utterances, use the DeleteUtterances operation.
      # If a bot has an alias, you can't delete it. Instead, the DeleteBot operation returns a
      # ResourceInUseException exception that includes a reference to the alias that refers to the bot. To
      # remove the reference to the bot, delete the alias. If you get the same exception again, delete the
      # referring alias until the DeleteBot operation is successful. This operation requires permissions for
      # the lex:DeleteBot action.

      def delete_bot(
        name : String
      ) : Protocol::Request
        input = Types::DeleteBotRequest.new(name: name)
        delete_bot(input)
      end

      def delete_bot(input : Types::DeleteBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an alias for the specified bot. You can't delete an alias that is used in the association
      # between a bot and a messaging channel. If an alias is used in a channel association, the DeleteBot
      # operation returns a ResourceInUseException exception that includes a reference to the channel
      # association that refers to the bot. You can remove the reference to the alias by deleting the
      # channel association. If you get the same exception again, delete the referring association until the
      # DeleteBotAlias operation is successful.

      def delete_bot_alias(
        bot_name : String,
        name : String
      ) : Protocol::Request
        input = Types::DeleteBotAliasRequest.new(bot_name: bot_name, name: name)
        delete_bot_alias(input)
      end

      def delete_bot_alias(input : Types::DeleteBotAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the association between an Amazon Lex bot and a messaging platform. This operation requires
      # permission for the lex:DeleteBotChannelAssociation action.

      def delete_bot_channel_association(
        bot_alias : String,
        bot_name : String,
        name : String
      ) : Protocol::Request
        input = Types::DeleteBotChannelAssociationRequest.new(bot_alias: bot_alias, bot_name: bot_name, name: name)
        delete_bot_channel_association(input)
      end

      def delete_bot_channel_association(input : Types::DeleteBotChannelAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT_CHANNEL_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific version of a bot. To delete all versions of a bot, use the DeleteBot operation.
      # This operation requires permissions for the lex:DeleteBotVersion action.

      def delete_bot_version(
        name : String,
        version : String
      ) : Protocol::Request
        input = Types::DeleteBotVersionRequest.new(name: name, version: version)
        delete_bot_version(input)
      end

      def delete_bot_version(input : Types::DeleteBotVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes all versions of the intent, including the $LATEST version. To delete a specific version of
      # the intent, use the DeleteIntentVersion operation. You can delete a version of an intent only if it
      # is not referenced. To delete an intent that is referred to in one or more bots (see how-it-works ),
      # you must remove those references first. If you get the ResourceInUseException exception, it provides
      # an example reference that shows where the intent is referenced. To remove the reference to the
      # intent, either update the bot or delete it. If you get the same exception when you attempt to delete
      # the intent again, repeat until the intent has no references and the call to DeleteIntent is
      # successful. This operation requires permission for the lex:DeleteIntent action.

      def delete_intent(
        name : String
      ) : Protocol::Request
        input = Types::DeleteIntentRequest.new(name: name)
        delete_intent(input)
      end

      def delete_intent(input : Types::DeleteIntentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific version of an intent. To delete all versions of a intent, use the DeleteIntent
      # operation. This operation requires permissions for the lex:DeleteIntentVersion action.

      def delete_intent_version(
        name : String,
        version : String
      ) : Protocol::Request
        input = Types::DeleteIntentVersionRequest.new(name: name, version: version)
        delete_intent_version(input)
      end

      def delete_intent_version(input : Types::DeleteIntentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INTENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes all versions of the slot type, including the $LATEST version. To delete a specific version
      # of the slot type, use the DeleteSlotTypeVersion operation. You can delete a version of a slot type
      # only if it is not referenced. To delete a slot type that is referred to in one or more intents, you
      # must remove those references first. If you get the ResourceInUseException exception, the exception
      # provides an example reference that shows the intent where the slot type is referenced. To remove the
      # reference to the slot type, either update the intent or delete it. If you get the same exception
      # when you attempt to delete the slot type again, repeat until the slot type has no references and the
      # DeleteSlotType call is successful. This operation requires permission for the lex:DeleteSlotType
      # action.

      def delete_slot_type(
        name : String
      ) : Protocol::Request
        input = Types::DeleteSlotTypeRequest.new(name: name)
        delete_slot_type(input)
      end

      def delete_slot_type(input : Types::DeleteSlotTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SLOT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific version of a slot type. To delete all versions of a slot type, use the
      # DeleteSlotType operation. This operation requires permissions for the lex:DeleteSlotTypeVersion
      # action.

      def delete_slot_type_version(
        name : String,
        version : String
      ) : Protocol::Request
        input = Types::DeleteSlotTypeVersionRequest.new(name: name, version: version)
        delete_slot_type_version(input)
      end

      def delete_slot_type_version(input : Types::DeleteSlotTypeVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SLOT_TYPE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes stored utterances. Amazon Lex stores the utterances that users send to your bot. Utterances
      # are stored for 15 days for use with the GetUtterancesView operation, and then stored indefinitely
      # for use in improving the ability of your bot to respond to user input. Use the DeleteUtterances
      # operation to manually delete stored utterances for a specific user. When you use the
      # DeleteUtterances operation, utterances stored for improving your bot's ability to respond to user
      # input are deleted immediately. Utterances stored for use with the GetUtterancesView operation are
      # deleted after 15 days. This operation requires permissions for the lex:DeleteUtterances action.

      def delete_utterances(
        bot_name : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DeleteUtterancesRequest.new(bot_name: bot_name, user_id: user_id)
        delete_utterances(input)
      end

      def delete_utterances(input : Types::DeleteUtterancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_UTTERANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata information for a specific bot. You must provide the bot name and the bot version
      # or alias. This operation requires permissions for the lex:GetBot action.

      def get_bot(
        name : String,
        version_or_alias : String
      ) : Protocol::Request
        input = Types::GetBotRequest.new(name: name, version_or_alias: version_or_alias)
        get_bot(input)
      end

      def get_bot(input : Types::GetBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an Amazon Lex bot alias. For more information about aliases, see
      # versioning-aliases . This operation requires permissions for the lex:GetBotAlias action.

      def get_bot_alias(
        bot_name : String,
        name : String
      ) : Protocol::Request
        input = Types::GetBotAliasRequest.new(bot_name: bot_name, name: name)
        get_bot_alias(input)
      end

      def get_bot_alias(input : Types::GetBotAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of aliases for a specified Amazon Lex bot. This operation requires permissions for
      # the lex:GetBotAliases action.

      def get_bot_aliases(
        bot_name : String,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetBotAliasesRequest.new(bot_name: bot_name, max_results: max_results, name_contains: name_contains, next_token: next_token)
        get_bot_aliases(input)
      end

      def get_bot_aliases(input : Types::GetBotAliasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOT_ALIASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the association between an Amazon Lex bot and a messaging platform. This
      # operation requires permissions for the lex:GetBotChannelAssociation action.

      def get_bot_channel_association(
        bot_alias : String,
        bot_name : String,
        name : String
      ) : Protocol::Request
        input = Types::GetBotChannelAssociationRequest.new(bot_alias: bot_alias, bot_name: bot_name, name: name)
        get_bot_channel_association(input)
      end

      def get_bot_channel_association(input : Types::GetBotChannelAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOT_CHANNEL_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all of the channels associated with the specified bot. The
      # GetBotChannelAssociations operation requires permissions for the lex:GetBotChannelAssociations
      # action.

      def get_bot_channel_associations(
        bot_alias : String,
        bot_name : String,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetBotChannelAssociationsRequest.new(bot_alias: bot_alias, bot_name: bot_name, max_results: max_results, name_contains: name_contains, next_token: next_token)
        get_bot_channel_associations(input)
      end

      def get_bot_channel_associations(input : Types::GetBotChannelAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOT_CHANNEL_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about all of the versions of a bot. The GetBotVersions operation returns a
      # BotMetadata object for each version of a bot. For example, if a bot has three numbered versions, the
      # GetBotVersions operation returns four BotMetadata objects in the response, one for each numbered
      # version and one for the $LATEST version. The GetBotVersions operation always returns at least one
      # version, the $LATEST version. This operation requires permissions for the lex:GetBotVersions action.

      def get_bot_versions(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetBotVersionsRequest.new(name: name, max_results: max_results, next_token: next_token)
        get_bot_versions(input)
      end

      def get_bot_versions(input : Types::GetBotVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns bot information as follows: If you provide the nameContains field, the response includes
      # information for the $LATEST version of all bots whose name contains the specified string. If you
      # don't specify the nameContains field, the operation returns information about the $LATEST version of
      # all of your bots. This operation requires permission for the lex:GetBots action.

      def get_bots(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetBotsRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token)
        get_bots(input)
      end

      def get_bots(input : Types::GetBotsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a built-in intent. This operation requires permission for the
      # lex:GetBuiltinIntent action.

      def get_builtin_intent(
        signature : String
      ) : Protocol::Request
        input = Types::GetBuiltinIntentRequest.new(signature: signature)
        get_builtin_intent(input)
      end

      def get_builtin_intent(input : Types::GetBuiltinIntentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BUILTIN_INTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of built-in intents that meet the specified criteria. This operation requires permission
      # for the lex:GetBuiltinIntents action.

      def get_builtin_intents(
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        signature_contains : String? = nil
      ) : Protocol::Request
        input = Types::GetBuiltinIntentsRequest.new(locale: locale, max_results: max_results, next_token: next_token, signature_contains: signature_contains)
        get_builtin_intents(input)
      end

      def get_builtin_intents(input : Types::GetBuiltinIntentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BUILTIN_INTENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of built-in slot types that meet the specified criteria. For a list of built-in slot
      # types, see Slot Type Reference in the Alexa Skills Kit . This operation requires permission for the
      # lex:GetBuiltInSlotTypes action.

      def get_builtin_slot_types(
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        signature_contains : String? = nil
      ) : Protocol::Request
        input = Types::GetBuiltinSlotTypesRequest.new(locale: locale, max_results: max_results, next_token: next_token, signature_contains: signature_contains)
        get_builtin_slot_types(input)
      end

      def get_builtin_slot_types(input : Types::GetBuiltinSlotTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BUILTIN_SLOT_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Exports the contents of a Amazon Lex resource in a specified format.

      def get_export(
        export_type : String,
        name : String,
        resource_type : String,
        version : String
      ) : Protocol::Request
        input = Types::GetExportRequest.new(export_type: export_type, name: name, resource_type: resource_type, version: version)
        get_export(input)
      end

      def get_export(input : Types::GetExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an import job started with the StartImport operation.

      def get_import(
        import_id : String
      ) : Protocol::Request
        input = Types::GetImportRequest.new(import_id: import_id)
        get_import(input)
      end

      def get_import(input : Types::GetImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an intent. In addition to the intent name, you must specify the intent
      # version. This operation requires permissions to perform the lex:GetIntent action.

      def get_intent(
        name : String,
        version : String
      ) : Protocol::Request
        input = Types::GetIntentRequest.new(name: name, version: version)
        get_intent(input)
      end

      def get_intent(input : Types::GetIntentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about all of the versions of an intent. The GetIntentVersions operation returns an
      # IntentMetadata object for each version of an intent. For example, if an intent has three numbered
      # versions, the GetIntentVersions operation returns four IntentMetadata objects in the response, one
      # for each numbered version and one for the $LATEST version. The GetIntentVersions operation always
      # returns at least one version, the $LATEST version. This operation requires permissions for the
      # lex:GetIntentVersions action.

      def get_intent_versions(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetIntentVersionsRequest.new(name: name, max_results: max_results, next_token: next_token)
        get_intent_versions(input)
      end

      def get_intent_versions(input : Types::GetIntentVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTENT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns intent information as follows: If you specify the nameContains field, returns the $LATEST
      # version of all intents that contain the specified string. If you don't specify the nameContains
      # field, returns information about the $LATEST version of all intents. The operation requires
      # permission for the lex:GetIntents action.

      def get_intents(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetIntentsRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token)
        get_intents(input)
      end

      def get_intents(input : Types::GetIntentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides details about an ongoing or complete migration from an Amazon Lex V1 bot to an Amazon Lex
      # V2 bot. Use this operation to view the migration alerts and warnings related to the migration.

      def get_migration(
        migration_id : String
      ) : Protocol::Request
        input = Types::GetMigrationRequest.new(migration_id: migration_id)
        get_migration(input)
      end

      def get_migration(input : Types::GetMigrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MIGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of migrations between Amazon Lex V1 and Amazon Lex V2.

      def get_migrations(
        max_results : Int32? = nil,
        migration_status_equals : String? = nil,
        next_token : String? = nil,
        sort_by_attribute : String? = nil,
        sort_by_order : String? = nil,
        v1_bot_name_contains : String? = nil
      ) : Protocol::Request
        input = Types::GetMigrationsRequest.new(max_results: max_results, migration_status_equals: migration_status_equals, next_token: next_token, sort_by_attribute: sort_by_attribute, sort_by_order: sort_by_order, v1_bot_name_contains: v1_bot_name_contains)
        get_migrations(input)
      end

      def get_migrations(input : Types::GetMigrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MIGRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific version of a slot type. In addition to specifying the slot type
      # name, you must specify the slot type version. This operation requires permissions for the
      # lex:GetSlotType action.

      def get_slot_type(
        name : String,
        version : String
      ) : Protocol::Request
        input = Types::GetSlotTypeRequest.new(name: name, version: version)
        get_slot_type(input)
      end

      def get_slot_type(input : Types::GetSlotTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SLOT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about all versions of a slot type. The GetSlotTypeVersions operation returns a
      # SlotTypeMetadata object for each version of a slot type. For example, if a slot type has three
      # numbered versions, the GetSlotTypeVersions operation returns four SlotTypeMetadata objects in the
      # response, one for each numbered version and one for the $LATEST version. The GetSlotTypeVersions
      # operation always returns at least one version, the $LATEST version. This operation requires
      # permissions for the lex:GetSlotTypeVersions action.

      def get_slot_type_versions(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetSlotTypeVersionsRequest.new(name: name, max_results: max_results, next_token: next_token)
        get_slot_type_versions(input)
      end

      def get_slot_type_versions(input : Types::GetSlotTypeVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SLOT_TYPE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns slot type information as follows: If you specify the nameContains field, returns the $LATEST
      # version of all slot types that contain the specified string. If you don't specify the nameContains
      # field, returns information about the $LATEST version of all slot types. The operation requires
      # permission for the lex:GetSlotTypes action.

      def get_slot_types(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetSlotTypesRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token)
        get_slot_types(input)
      end

      def get_slot_types(input : Types::GetSlotTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SLOT_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use the GetUtterancesView operation to get information about the utterances that your users have
      # made to your bot. You can use this list to tune the utterances that your bot responds to. For
      # example, say that you have created a bot to order flowers. After your users have used your bot for a
      # while, use the GetUtterancesView operation to see the requests that they have made and whether they
      # have been successful. You might find that the utterance "I want flowers" is not being recognized.
      # You could add this utterance to the OrderFlowers intent so that your bot recognizes that utterance.
      # After you publish a new version of a bot, you can get information about the old version and the new
      # so that you can compare the performance across the two versions. Utterance statistics are generated
      # once a day. Data is available for the last 15 days. You can request information for up to 5 versions
      # of your bot in each request. Amazon Lex returns the most frequent utterances received by the bot in
      # the last 15 days. The response contains information about a maximum of 100 utterances for each
      # version. If you set childDirected field to true when you created your bot, if you are using slot
      # obfuscation with one or more slots, or if you opted out of participating in improving Amazon Lex,
      # utterances are not available. This operation requires permissions for the lex:GetUtterancesView
      # action.

      def get_utterances_view(
        bot_name : String,
        bot_versions : Array(String),
        status_type : String
      ) : Protocol::Request
        input = Types::GetUtterancesViewRequest.new(bot_name: bot_name, bot_versions: bot_versions, status_type: status_type)
        get_utterances_view(input)
      end

      def get_utterances_view(input : Types::GetUtterancesViewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_UTTERANCES_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of tags associated with the specified resource. Only bots, bot aliases, and bot channels
      # can have tags associated with them.

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

      # Creates an Amazon Lex conversational bot or replaces an existing bot. When you create or update a
      # bot you are only required to specify a name, a locale, and whether the bot is directed toward
      # children under age 13. You can use this to add intents later, or to remove intents from an existing
      # bot. When you create a bot with the minimum information, the bot is created or updated but Amazon
      # Lex returns the response FAILED . You can build the bot after you add one or more intents. For more
      # information about Amazon Lex bots, see how-it-works . If you specify the name of an existing bot,
      # the fields in the request replace the existing values in the $LATEST version of the bot. Amazon Lex
      # removes any fields that you don't provide values for in the request, except for the idleTTLInSeconds
      # and privacySettings fields, which are set to their default values. If you don't specify values for
      # required fields, Amazon Lex throws an exception. This operation requires permissions for the
      # lex:PutBot action. For more information, see security-iam .

      def put_bot(
        child_directed : Bool,
        locale : String,
        name : String,
        abort_statement : Types::Statement? = nil,
        checksum : String? = nil,
        clarification_prompt : Types::Prompt? = nil,
        create_version : Bool? = nil,
        description : String? = nil,
        detect_sentiment : Bool? = nil,
        enable_model_improvements : Bool? = nil,
        idle_session_ttl_in_seconds : Int32? = nil,
        intents : Array(Types::Intent)? = nil,
        nlu_intent_confidence_threshold : Float64? = nil,
        process_behavior : String? = nil,
        tags : Array(Types::Tag)? = nil,
        voice_id : String? = nil
      ) : Protocol::Request
        input = Types::PutBotRequest.new(child_directed: child_directed, locale: locale, name: name, abort_statement: abort_statement, checksum: checksum, clarification_prompt: clarification_prompt, create_version: create_version, description: description, detect_sentiment: detect_sentiment, enable_model_improvements: enable_model_improvements, idle_session_ttl_in_seconds: idle_session_ttl_in_seconds, intents: intents, nlu_intent_confidence_threshold: nlu_intent_confidence_threshold, process_behavior: process_behavior, tags: tags, voice_id: voice_id)
        put_bot(input)
      end

      def put_bot(input : Types::PutBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an alias for the specified version of the bot or replaces an alias for the specified bot. To
      # change the version of the bot that the alias points to, replace the alias. For more information
      # about aliases, see versioning-aliases . This operation requires permissions for the lex:PutBotAlias
      # action.

      def put_bot_alias(
        bot_name : String,
        bot_version : String,
        name : String,
        checksum : String? = nil,
        conversation_logs : Types::ConversationLogsRequest? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::PutBotAliasRequest.new(bot_name: bot_name, bot_version: bot_version, name: name, checksum: checksum, conversation_logs: conversation_logs, description: description, tags: tags)
        put_bot_alias(input)
      end

      def put_bot_alias(input : Types::PutBotAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_BOT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an intent or replaces an existing intent. To define the interaction between the user and
      # your bot, you use one or more intents. For a pizza ordering bot, for example, you would create an
      # OrderPizza intent. To create an intent or replace an existing intent, you must provide the
      # following: Intent name. For example, OrderPizza . Sample utterances. For example, "Can I order a
      # pizza, please." and "I want to order a pizza." Information to be gathered. You specify slot types
      # for the information that your bot will request from the user. You can specify standard slot types,
      # such as a date or a time, or custom slot types such as the size and crust of a pizza. How the intent
      # will be fulfilled. You can provide a Lambda function or configure the intent to return the intent
      # information to the client application. If you use a Lambda function, when all of the intent
      # information is available, Amazon Lex invokes your Lambda function. If you configure your intent to
      # return the intent information to the client application. You can specify other optional information
      # in the request, such as: A confirmation prompt to ask the user to confirm an intent. For example,
      # "Shall I order your pizza?" A conclusion statement to send to the user after the intent has been
      # fulfilled. For example, "I placed your pizza order." A follow-up prompt that asks the user for
      # additional activity. For example, asking "Do you want to order a drink with your pizza?" If you
      # specify an existing intent name to update the intent, Amazon Lex replaces the values in the $LATEST
      # version of the intent with the values in the request. Amazon Lex removes fields that you don't
      # provide in the request. If you don't specify the required fields, Amazon Lex throws an exception.
      # When you update the $LATEST version of an intent, the status field of any bot that uses the $LATEST
      # version of the intent is set to NOT_BUILT . For more information, see how-it-works . This operation
      # requires permissions for the lex:PutIntent action.

      def put_intent(
        name : String,
        checksum : String? = nil,
        conclusion_statement : Types::Statement? = nil,
        confirmation_prompt : Types::Prompt? = nil,
        create_version : Bool? = nil,
        description : String? = nil,
        dialog_code_hook : Types::CodeHook? = nil,
        follow_up_prompt : Types::FollowUpPrompt? = nil,
        fulfillment_activity : Types::FulfillmentActivity? = nil,
        input_contexts : Array(Types::InputContext)? = nil,
        kendra_configuration : Types::KendraConfiguration? = nil,
        output_contexts : Array(Types::OutputContext)? = nil,
        parent_intent_signature : String? = nil,
        rejection_statement : Types::Statement? = nil,
        sample_utterances : Array(String)? = nil,
        slots : Array(Types::Slot)? = nil
      ) : Protocol::Request
        input = Types::PutIntentRequest.new(name: name, checksum: checksum, conclusion_statement: conclusion_statement, confirmation_prompt: confirmation_prompt, create_version: create_version, description: description, dialog_code_hook: dialog_code_hook, follow_up_prompt: follow_up_prompt, fulfillment_activity: fulfillment_activity, input_contexts: input_contexts, kendra_configuration: kendra_configuration, output_contexts: output_contexts, parent_intent_signature: parent_intent_signature, rejection_statement: rejection_statement, sample_utterances: sample_utterances, slots: slots)
        put_intent(input)
      end

      def put_intent(input : Types::PutIntentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_INTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom slot type or replaces an existing custom slot type. To create a custom slot type,
      # specify a name for the slot type and a set of enumeration values, which are the values that a slot
      # of this type can assume. For more information, see how-it-works . If you specify the name of an
      # existing slot type, the fields in the request replace the existing values in the $LATEST version of
      # the slot type. Amazon Lex removes the fields that you don't provide in the request. If you don't
      # specify required fields, Amazon Lex throws an exception. When you update the $LATEST version of a
      # slot type, if a bot uses the $LATEST version of an intent that contains the slot type, the bot's
      # status field is set to NOT_BUILT . This operation requires permissions for the lex:PutSlotType
      # action.

      def put_slot_type(
        name : String,
        checksum : String? = nil,
        create_version : Bool? = nil,
        description : String? = nil,
        enumeration_values : Array(Types::EnumerationValue)? = nil,
        parent_slot_type_signature : String? = nil,
        slot_type_configurations : Array(Types::SlotTypeConfiguration)? = nil,
        value_selection_strategy : String? = nil
      ) : Protocol::Request
        input = Types::PutSlotTypeRequest.new(name: name, checksum: checksum, create_version: create_version, description: description, enumeration_values: enumeration_values, parent_slot_type_signature: parent_slot_type_signature, slot_type_configurations: slot_type_configurations, value_selection_strategy: value_selection_strategy)
        put_slot_type(input)
      end

      def put_slot_type(input : Types::PutSlotTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SLOT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a job to import a resource to Amazon Lex.

      def start_import(
        merge_strategy : String,
        payload : Bytes,
        resource_type : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::StartImportRequest.new(merge_strategy: merge_strategy, payload: payload, resource_type: resource_type, tags: tags)
        start_import(input)
      end

      def start_import(input : Types::StartImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_IMPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts migrating a bot from Amazon Lex V1 to Amazon Lex V2. Migrate your bot when you want to take
      # advantage of the new features of Amazon Lex V2. For more information, see Migrating a bot in the
      # Amazon Lex developer guide .

      def start_migration(
        migration_strategy : String,
        v1_bot_name : String,
        v1_bot_version : String,
        v2_bot_name : String,
        v2_bot_role : String
      ) : Protocol::Request
        input = Types::StartMigrationRequest.new(migration_strategy: migration_strategy, v1_bot_name: v1_bot_name, v1_bot_version: v1_bot_version, v2_bot_name: v2_bot_name, v2_bot_role: v2_bot_role)
        start_migration(input)
      end

      def start_migration(input : Types::StartMigrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MIGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tags to the specified resource. If a tag key already exists, the existing value
      # is replaced with the new value.

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

      # Removes tags from a bot, bot alias or bot channel.

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
    end
  end
end
