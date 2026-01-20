require "json"
require "time"

module AwsSdk
  module LexModelBuildingService
    module Types

      # Your IAM user or role does not have permission to call the Amazon Lex V2 APIs required to migrate
      # your bot.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is not well formed. For example, a value is invalid or a required field is missing.
      # Check the field values, and try again.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about a bot alias.

      struct BotAliasMetadata
        include JSON::Serializable

        # The name of the bot to which the alias points.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The version of the Amazon Lex bot to which the alias points.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Checksum of the bot alias.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # Settings that determine how Amazon Lex uses conversation logs for the alias.

        @[JSON::Field(key: "conversationLogs")]
        getter conversation_logs : Types::ConversationLogsResponse?

        # The date that the bot alias was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the bot alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date that the bot alias was updated. When you create a resource, the creation date and last
        # updated date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the bot alias.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @bot_name : String? = nil,
          @bot_version : String? = nil,
          @checksum : String? = nil,
          @conversation_logs : Types::ConversationLogsResponse? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Represents an association between an Amazon Lex bot and an external messaging platform.

      struct BotChannelAssociation
        include JSON::Serializable

        # An alias pointing to the specific version of the Amazon Lex bot to which this association is being
        # made.

        @[JSON::Field(key: "botAlias")]
        getter bot_alias : String?

        # Provides information necessary to communicate with the messaging platform.

        @[JSON::Field(key: "botConfiguration")]
        getter bot_configuration : Hash(String, String)?

        # The name of the Amazon Lex bot to which this association is being made. Currently, Amazon Lex
        # supports associations with Facebook and Slack, and Twilio.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The date that the association between the Amazon Lex bot and the channel was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A text description of the association you are creating.

        @[JSON::Field(key: "description")]
        getter description : String?

        # If status is FAILED , Amazon Lex provides the reason that it failed to create the association.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The name of the association between the bot and the channel.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the bot channel. CREATED - The channel has been created and is ready for use.
        # IN_PROGRESS - Channel creation is in progress. FAILED - There was an error creating the channel. For
        # information about the reason for the failure, see the failureReason field.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Specifies the type of association by indicating the type of channel being established between the
        # Amazon Lex bot and the external messaging platform.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @bot_alias : String? = nil,
          @bot_configuration : Hash(String, String)? = nil,
          @bot_name : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @failure_reason : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides information about a bot. .

      struct BotMetadata
        include JSON::Serializable

        # The date that the bot was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date that the bot was updated. When you create a bot, the creation date and last updated date
        # are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the bot.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the bot.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The version of the bot. For a new bot, the version is always $LATEST .

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @created_date : Time? = nil,
          @description : String? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Provides metadata for a built-in intent.

      struct BuiltinIntentMetadata
        include JSON::Serializable

        # A unique identifier for the built-in intent. To find the signature for an intent, see Standard
        # Built-in Intents in the Alexa Skills Kit .

        @[JSON::Field(key: "signature")]
        getter signature : String?

        # A list of identifiers for the locales that the intent supports.

        @[JSON::Field(key: "supportedLocales")]
        getter supported_locales : Array(String)?

        def initialize(
          @signature : String? = nil,
          @supported_locales : Array(String)? = nil
        )
        end
      end

      # Provides information about a slot used in a built-in intent.

      struct BuiltinIntentSlot
        include JSON::Serializable

        # A list of the slots defined for the intent.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Provides information about a built in slot type.

      struct BuiltinSlotTypeMetadata
        include JSON::Serializable

        # A unique identifier for the built-in slot type. To find the signature for a slot type, see Slot Type
        # Reference in the Alexa Skills Kit .

        @[JSON::Field(key: "signature")]
        getter signature : String?

        # A list of target locales for the slot.

        @[JSON::Field(key: "supportedLocales")]
        getter supported_locales : Array(String)?

        def initialize(
          @signature : String? = nil,
          @supported_locales : Array(String)? = nil
        )
        end
      end

      # Specifies a Lambda function that verifies requests to a bot or fulfills the user's request to a
      # bot..

      struct CodeHook
        include JSON::Serializable

        # The version of the request-response that you want Amazon Lex to use to invoke your Lambda function.
        # For more information, see using-lambda .

        @[JSON::Field(key: "messageVersion")]
        getter message_version : String

        # The Amazon Resource Name (ARN) of the Lambda function.

        @[JSON::Field(key: "uri")]
        getter uri : String

        def initialize(
          @message_version : String,
          @uri : String
        )
        end
      end

      # There was a conflict processing the request. Try your request again.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides the settings needed for conversation logs.

      struct ConversationLogsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an IAM role with permission to write to your CloudWatch Logs for
        # text logs and your S3 bucket for audio logs. If audio encryption is enabled, this role also provides
        # access permission for the AWS KMS key used for encrypting audio logs. For more information, see
        # Creating an IAM Role and Policy for Conversation Logs .

        @[JSON::Field(key: "iamRoleArn")]
        getter iam_role_arn : String

        # The settings for your conversation logs. You can log the conversation text, conversation audio, or
        # both.

        @[JSON::Field(key: "logSettings")]
        getter log_settings : Array(Types::LogSettingsRequest)

        def initialize(
          @iam_role_arn : String,
          @log_settings : Array(Types::LogSettingsRequest)
        )
        end
      end

      # Contains information about conversation log settings.

      struct ConversationLogsResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role used to write your logs to CloudWatch Logs or an S3
        # bucket.

        @[JSON::Field(key: "iamRoleArn")]
        getter iam_role_arn : String?

        # The settings for your conversation logs. You can log text, audio, or both.

        @[JSON::Field(key: "logSettings")]
        getter log_settings : Array(Types::LogSettingsResponse)?

        def initialize(
          @iam_role_arn : String? = nil,
          @log_settings : Array(Types::LogSettingsResponse)? = nil
        )
        end
      end


      struct CreateBotVersionRequest
        include JSON::Serializable

        # The name of the bot that you want to create a new version of. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        # Identifies a specific revision of the $LATEST version of the bot. If you specify a checksum and the
        # $LATEST version of the bot has a different checksum, a PreconditionFailedException exception is
        # returned and Amazon Lex doesn't publish a new version. If you don't specify a checksum, Amazon Lex
        # publishes the $LATEST version.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        def initialize(
          @name : String,
          @checksum : String? = nil
        )
        end
      end


      struct CreateBotVersionResponse
        include JSON::Serializable

        # The message that Amazon Lex uses to cancel a conversation. For more information, see PutBot .

        @[JSON::Field(key: "abortStatement")]
        getter abort_statement : Types::Statement?

        # Checksum identifying the version of the bot that was created.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # For each Amazon Lex bot created with the Amazon Lex Model Building Service, you must specify whether
        # your use of Amazon Lex is related to a website, program, or other application that is directed or
        # targeted, in whole or in part, to children under age 13 and subject to the Children's Online Privacy
        # Protection Act (COPPA) by specifying true or false in the childDirected field. By specifying true in
        # the childDirected field, you confirm that your use of Amazon Lex is related to a website, program,
        # or other application that is directed or targeted, in whole or in part, to children under age 13 and
        # subject to COPPA. By specifying false in the childDirected field, you confirm that your use of
        # Amazon Lex is not related to a website, program, or other application that is directed or targeted,
        # in whole or in part, to children under age 13 and subject to COPPA. You may not specify a default
        # value for the childDirected field that does not accurately reflect whether your use of Amazon Lex is
        # related to a website, program, or other application that is directed or targeted, in whole or in
        # part, to children under age 13 and subject to COPPA. If your use of Amazon Lex relates to a website,
        # program, or other application that is directed in whole or in part, to children under age 13, you
        # must obtain any required verifiable parental consent under COPPA. For information regarding the use
        # of Amazon Lex in connection with websites, programs, or other applications that are directed or
        # targeted, in whole or in part, to children under age 13, see the Amazon Lex FAQ.

        @[JSON::Field(key: "childDirected")]
        getter child_directed : Bool?

        # The message that Amazon Lex uses when it doesn't understand the user's request. For more
        # information, see PutBot .

        @[JSON::Field(key: "clarificationPrompt")]
        getter clarification_prompt : Types::Prompt?

        # The date when the bot version was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether utterances entered by the user should be sent to Amazon Comprehend for sentiment
        # analysis.

        @[JSON::Field(key: "detectSentiment")]
        getter detect_sentiment : Bool?

        # Indicates whether the bot uses accuracy improvements. true indicates that the bot is using the
        # improvements, otherwise, false .

        @[JSON::Field(key: "enableModelImprovements")]
        getter enable_model_improvements : Bool?

        # If status is FAILED , Amazon Lex provides the reason that it failed to build the bot.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The maximum time in seconds that Amazon Lex retains the data gathered in a conversation. For more
        # information, see PutBot .

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # An array of Intent objects. For more information, see PutBot .

        @[JSON::Field(key: "intents")]
        getter intents : Array(Types::Intent)?

        # The date when the $LATEST version of this bot was updated.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # Specifies the target locale for the bot.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The name of the bot.

        @[JSON::Field(key: "name")]
        getter name : String?

        # When you send a request to create or update a bot, Amazon Lex sets the status response element to
        # BUILDING . After Amazon Lex builds the bot, it sets status to READY . If Amazon Lex can't build the
        # bot, it sets status to FAILED . Amazon Lex returns the reason for the failure in the failureReason
        # response element.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The version of the bot.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The Amazon Polly voice ID that Amazon Lex uses for voice interactions with the user.

        @[JSON::Field(key: "voiceId")]
        getter voice_id : String?

        def initialize(
          @abort_statement : Types::Statement? = nil,
          @checksum : String? = nil,
          @child_directed : Bool? = nil,
          @clarification_prompt : Types::Prompt? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @detect_sentiment : Bool? = nil,
          @enable_model_improvements : Bool? = nil,
          @failure_reason : String? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @intents : Array(Types::Intent)? = nil,
          @last_updated_date : Time? = nil,
          @locale : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @version : String? = nil,
          @voice_id : String? = nil
        )
        end
      end


      struct CreateIntentVersionRequest
        include JSON::Serializable

        # The name of the intent that you want to create a new version of. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        # Checksum of the $LATEST version of the intent that should be used to create the new version. If you
        # specify a checksum and the $LATEST version of the intent has a different checksum, Amazon Lex
        # returns a PreconditionFailedException exception and doesn't publish a new version. If you don't
        # specify a checksum, Amazon Lex publishes the $LATEST version.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        def initialize(
          @name : String,
          @checksum : String? = nil
        )
        end
      end


      struct CreateIntentVersionResponse
        include JSON::Serializable

        # Checksum of the intent version created.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # After the Lambda function specified in the fulfillmentActivity field fulfills the intent, Amazon Lex
        # conveys this statement to the user.

        @[JSON::Field(key: "conclusionStatement")]
        getter conclusion_statement : Types::Statement?

        # If defined, the prompt that Amazon Lex uses to confirm the user's intent before fulfilling it.

        @[JSON::Field(key: "confirmationPrompt")]
        getter confirmation_prompt : Types::Prompt?

        # The date that the intent was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # If defined, Amazon Lex invokes this Lambda function for each user input.

        @[JSON::Field(key: "dialogCodeHook")]
        getter dialog_code_hook : Types::CodeHook?

        # If defined, Amazon Lex uses this prompt to solicit additional user activity after the intent is
        # fulfilled.

        @[JSON::Field(key: "followUpPrompt")]
        getter follow_up_prompt : Types::FollowUpPrompt?

        # Describes how the intent is fulfilled.

        @[JSON::Field(key: "fulfillmentActivity")]
        getter fulfillment_activity : Types::FulfillmentActivity?

        # An array of InputContext objects that lists the contexts that must be active for Amazon Lex to
        # choose the intent in a conversation with the user.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # Configuration information, if any, for connecting an Amazon Kendra index with the
        # AMAZON.KendraSearchIntent intent.

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::KendraConfiguration?

        # The date that the intent was updated.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the intent.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of OutputContext objects that lists the contexts that the intent activates when the intent
        # is fulfilled.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # A unique identifier for a built-in intent.

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        # If the user answers "no" to the question defined in confirmationPrompt , Amazon Lex responds with
        # this statement to acknowledge that the intent was canceled.

        @[JSON::Field(key: "rejectionStatement")]
        getter rejection_statement : Types::Statement?

        # An array of sample utterances configured for the intent.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(String)?

        # An array of slot types that defines the information required to fulfill the intent.

        @[JSON::Field(key: "slots")]
        getter slots : Array(Types::Slot)?

        # The version number assigned to the new version of the intent.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @checksum : String? = nil,
          @conclusion_statement : Types::Statement? = nil,
          @confirmation_prompt : Types::Prompt? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @dialog_code_hook : Types::CodeHook? = nil,
          @follow_up_prompt : Types::FollowUpPrompt? = nil,
          @fulfillment_activity : Types::FulfillmentActivity? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @kendra_configuration : Types::KendraConfiguration? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil,
          @rejection_statement : Types::Statement? = nil,
          @sample_utterances : Array(String)? = nil,
          @slots : Array(Types::Slot)? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateSlotTypeVersionRequest
        include JSON::Serializable

        # The name of the slot type that you want to create a new version for. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        # Checksum for the $LATEST version of the slot type that you want to publish. If you specify a
        # checksum and the $LATEST version of the slot type has a different checksum, Amazon Lex returns a
        # PreconditionFailedException exception and doesn't publish the new version. If you don't specify a
        # checksum, Amazon Lex publishes the $LATEST version.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        def initialize(
          @name : String,
          @checksum : String? = nil
        )
        end
      end


      struct CreateSlotTypeVersionResponse
        include JSON::Serializable

        # Checksum of the $LATEST version of the slot type.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # The date that the slot type was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of EnumerationValue objects that defines the values that the slot type can take.

        @[JSON::Field(key: "enumerationValues")]
        getter enumeration_values : Array(Types::EnumerationValue)?

        # The date that the slot type was updated. When you create a resource, the creation date and last
        # update date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the slot type.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The built-in slot type used a the parent of the slot type.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # Configuration information that extends the parent built-in slot type.

        @[JSON::Field(key: "slotTypeConfigurations")]
        getter slot_type_configurations : Array(Types::SlotTypeConfiguration)?

        # The strategy that Amazon Lex uses to determine the value of the slot. For more information, see
        # PutSlotType .

        @[JSON::Field(key: "valueSelectionStrategy")]
        getter value_selection_strategy : String?

        # The version assigned to the new slot type version.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @checksum : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @enumeration_values : Array(Types::EnumerationValue)? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_configurations : Array(Types::SlotTypeConfiguration)? = nil,
          @value_selection_strategy : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct DeleteBotAliasRequest
        include JSON::Serializable

        # The name of the bot that the alias points to.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The name of the alias to delete. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @bot_name : String,
          @name : String
        )
        end
      end


      struct DeleteBotChannelAssociationRequest
        include JSON::Serializable

        # An alias that points to the specific version of the Amazon Lex bot to which this association is
        # being made.

        @[JSON::Field(key: "aliasName")]
        getter bot_alias : String

        # The name of the Amazon Lex bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The name of the association. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @bot_alias : String,
          @bot_name : String,
          @name : String
        )
        end
      end


      struct DeleteBotRequest
        include JSON::Serializable

        # The name of the bot. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteBotVersionRequest
        include JSON::Serializable

        # The name of the bot.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the bot to delete. You cannot delete the $LATEST version of the bot. To delete the
        # $LATEST version, use the DeleteBot operation.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @name : String,
          @version : String
        )
        end
      end


      struct DeleteIntentRequest
        include JSON::Serializable

        # The name of the intent. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteIntentVersionRequest
        include JSON::Serializable

        # The name of the intent.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the intent to delete. You cannot delete the $LATEST version of the intent. To delete
        # the $LATEST version, use the DeleteIntent operation.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @name : String,
          @version : String
        )
        end
      end


      struct DeleteSlotTypeRequest
        include JSON::Serializable

        # The name of the slot type. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteSlotTypeVersionRequest
        include JSON::Serializable

        # The name of the slot type.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the slot type to delete. You cannot delete the $LATEST version of the slot type. To
        # delete the $LATEST version, use the DeleteSlotType operation.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @name : String,
          @version : String
        )
        end
      end


      struct DeleteUtterancesRequest
        include JSON::Serializable

        # The name of the bot that stored the utterances.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The unique identifier for the user that made the utterances. This is the user ID that was sent in
        # the PostContent or PostText operation request that contained the utterance.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @bot_name : String,
          @user_id : String
        )
        end
      end

      # Each slot type can have a set of values. Each enumeration value represents a value the slot type can
      # take. For example, a pizza ordering bot could have a slot type that specifies the type of crust that
      # the pizza should have. The slot type could include the values thick thin stuffed

      struct EnumerationValue
        include JSON::Serializable

        # The value of the slot type.

        @[JSON::Field(key: "value")]
        getter value : String

        # Additional values related to the slot type value.

        @[JSON::Field(key: "synonyms")]
        getter synonyms : Array(String)?

        def initialize(
          @value : String,
          @synonyms : Array(String)? = nil
        )
        end
      end

      # A prompt for additional activity after an intent is fulfilled. For example, after the OrderPizza
      # intent is fulfilled, you might prompt the user to find out whether the user wants to order drinks.

      struct FollowUpPrompt
        include JSON::Serializable

        # Prompts for information from the user.

        @[JSON::Field(key: "prompt")]
        getter prompt : Types::Prompt

        # If the user answers "no" to the question defined in the prompt field, Amazon Lex responds with this
        # statement to acknowledge that the intent was canceled.

        @[JSON::Field(key: "rejectionStatement")]
        getter rejection_statement : Types::Statement

        def initialize(
          @prompt : Types::Prompt,
          @rejection_statement : Types::Statement
        )
        end
      end

      # Describes how the intent is fulfilled after the user provides all of the information required for
      # the intent. You can provide a Lambda function to process the intent, or you can return the intent
      # information to the client application. We recommend that you use a Lambda function so that the
      # relevant logic lives in the Cloud and limit the client-side code primarily to presentation. If you
      # need to update the logic, you only update the Lambda function; you don't need to upgrade your client
      # application. Consider the following examples: In a pizza ordering application, after the user
      # provides all of the information for placing an order, you use a Lambda function to place an order
      # with a pizzeria. In a gaming application, when a user says "pick up a rock," this information must
      # go back to the client application so that it can perform the operation and update the graphics. In
      # this case, you want Amazon Lex to return the intent data to the client.

      struct FulfillmentActivity
        include JSON::Serializable

        # How the intent should be fulfilled, either by running a Lambda function or by returning the slot
        # data to the client application.

        @[JSON::Field(key: "type")]
        getter type : String

        # A description of the Lambda function that is run to fulfill the intent.

        @[JSON::Field(key: "codeHook")]
        getter code_hook : Types::CodeHook?

        def initialize(
          @type : String,
          @code_hook : Types::CodeHook? = nil
        )
        end
      end


      struct GetBotAliasRequest
        include JSON::Serializable

        # The name of the bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The name of the bot alias. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @bot_name : String,
          @name : String
        )
        end
      end


      struct GetBotAliasResponse
        include JSON::Serializable

        # The name of the bot that the alias points to.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The version of the bot that the alias points to.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Checksum of the bot alias.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # The settings that determine how Amazon Lex uses conversation logs for the alias.

        @[JSON::Field(key: "conversationLogs")]
        getter conversation_logs : Types::ConversationLogsResponse?

        # The date that the bot alias was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the bot alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date that the bot alias was updated. When you create a resource, the creation date and the last
        # updated date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the bot alias.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @bot_name : String? = nil,
          @bot_version : String? = nil,
          @checksum : String? = nil,
          @conversation_logs : Types::ConversationLogsResponse? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil
        )
        end
      end


      struct GetBotAliasesRequest
        include JSON::Serializable

        # The name of the bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The maximum number of aliases to return in the response. The default is 50. .

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Substring to match in bot alias names. An alias will be returned if any part of its name matches the
        # substring. For example, "xyz" matches both "xyzabc" and "abcxyz."

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # A pagination token for fetching the next page of aliases. If the response to this call is truncated,
        # Amazon Lex returns a pagination token in the response. To fetch the next page of aliases, specify
        # the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_name : String,
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBotAliasesResponse
        include JSON::Serializable

        # An array of BotAliasMetadata objects, each describing a bot alias.

        @[JSON::Field(key: "BotAliases")]
        getter bot_aliases : Array(Types::BotAliasMetadata)?

        # A pagination token for fetching next page of aliases. If the response to this call is truncated,
        # Amazon Lex returns a pagination token in the response. To fetch the next page of aliases, specify
        # the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_aliases : Array(Types::BotAliasMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBotChannelAssociationRequest
        include JSON::Serializable

        # An alias pointing to the specific version of the Amazon Lex bot to which this association is being
        # made.

        @[JSON::Field(key: "aliasName")]
        getter bot_alias : String

        # The name of the Amazon Lex bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The name of the association between the bot and the channel. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @bot_alias : String,
          @bot_name : String,
          @name : String
        )
        end
      end


      struct GetBotChannelAssociationResponse
        include JSON::Serializable

        # An alias pointing to the specific version of the Amazon Lex bot to which this association is being
        # made.

        @[JSON::Field(key: "botAlias")]
        getter bot_alias : String?

        # Provides information that the messaging platform needs to communicate with the Amazon Lex bot.

        @[JSON::Field(key: "botConfiguration")]
        getter bot_configuration : Hash(String, String)?

        # The name of the Amazon Lex bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The date that the association between the bot and the channel was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the association between the bot and the channel.

        @[JSON::Field(key: "description")]
        getter description : String?

        # If status is FAILED , Amazon Lex provides the reason that it failed to create the association.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The name of the association between the bot and the channel.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the bot channel. CREATED - The channel has been created and is ready for use.
        # IN_PROGRESS - Channel creation is in progress. FAILED - There was an error creating the channel. For
        # information about the reason for the failure, see the failureReason field.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the messaging platform.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @bot_alias : String? = nil,
          @bot_configuration : Hash(String, String)? = nil,
          @bot_name : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @failure_reason : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetBotChannelAssociationsRequest
        include JSON::Serializable

        # An alias pointing to the specific version of the Amazon Lex bot to which this association is being
        # made.

        @[JSON::Field(key: "aliasName")]
        getter bot_alias : String

        # The name of the Amazon Lex bot in the association.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The maximum number of associations to return in the response. The default is 50.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Substring to match in channel association names. An association will be returned if any part of its
        # name matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz." To return all bot
        # channel associations, use a hyphen ("-") as the nameContains parameter.

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # A pagination token for fetching the next page of associations. If the response to this call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of
        # associations, specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_alias : String,
          @bot_name : String,
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBotChannelAssociationsResponse
        include JSON::Serializable

        # An array of objects, one for each association, that provides information about the Amazon Lex bot
        # and its association with the channel.

        @[JSON::Field(key: "botChannelAssociations")]
        getter bot_channel_associations : Array(Types::BotChannelAssociation)?

        # A pagination token that fetches the next page of associations. If the response to this call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of
        # associations, specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bot_channel_associations : Array(Types::BotChannelAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBotRequest
        include JSON::Serializable

        # The name of the bot. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version or alias of the bot.

        @[JSON::Field(key: "versionoralias")]
        getter version_or_alias : String

        def initialize(
          @name : String,
          @version_or_alias : String
        )
        end
      end


      struct GetBotResponse
        include JSON::Serializable

        # The message that Amazon Lex returns when the user elects to end the conversation without completing
        # it. For more information, see PutBot .

        @[JSON::Field(key: "abortStatement")]
        getter abort_statement : Types::Statement?

        # Checksum of the bot used to identify a specific revision of the bot's $LATEST version.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # For each Amazon Lex bot created with the Amazon Lex Model Building Service, you must specify whether
        # your use of Amazon Lex is related to a website, program, or other application that is directed or
        # targeted, in whole or in part, to children under age 13 and subject to the Children's Online Privacy
        # Protection Act (COPPA) by specifying true or false in the childDirected field. By specifying true in
        # the childDirected field, you confirm that your use of Amazon Lex is related to a website, program,
        # or other application that is directed or targeted, in whole or in part, to children under age 13 and
        # subject to COPPA. By specifying false in the childDirected field, you confirm that your use of
        # Amazon Lex is not related to a website, program, or other application that is directed or targeted,
        # in whole or in part, to children under age 13 and subject to COPPA. You may not specify a default
        # value for the childDirected field that does not accurately reflect whether your use of Amazon Lex is
        # related to a website, program, or other application that is directed or targeted, in whole or in
        # part, to children under age 13 and subject to COPPA. If your use of Amazon Lex relates to a website,
        # program, or other application that is directed in whole or in part, to children under age 13, you
        # must obtain any required verifiable parental consent under COPPA. For information regarding the use
        # of Amazon Lex in connection with websites, programs, or other applications that are directed or
        # targeted, in whole or in part, to children under age 13, see the Amazon Lex FAQ.

        @[JSON::Field(key: "childDirected")]
        getter child_directed : Bool?

        # The message Amazon Lex uses when it doesn't understand the user's request. For more information, see
        # PutBot .

        @[JSON::Field(key: "clarificationPrompt")]
        getter clarification_prompt : Types::Prompt?

        # The date that the bot was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether user utterances should be sent to Amazon Comprehend for sentiment analysis.

        @[JSON::Field(key: "detectSentiment")]
        getter detect_sentiment : Bool?

        # Indicates whether the bot uses accuracy improvements. true indicates that the bot is using the
        # improvements, otherwise, false .

        @[JSON::Field(key: "enableModelImprovements")]
        getter enable_model_improvements : Bool?

        # If status is FAILED , Amazon Lex explains why it failed to build the bot.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The maximum time in seconds that Amazon Lex retains the data gathered in a conversation. For more
        # information, see PutBot .

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # An array of intent objects. For more information, see PutBot .

        @[JSON::Field(key: "intents")]
        getter intents : Array(Types::Intent)?

        # The date that the bot was updated. When you create a resource, the creation date and last updated
        # date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The target locale for the bot.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The name of the bot.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The score that determines where Amazon Lex inserts the AMAZON.FallbackIntent ,
        # AMAZON.KendraSearchIntent , or both when returning alternative intents in a PostContent or PostText
        # response. AMAZON.FallbackIntent is inserted if the confidence score for all intents is below this
        # value. AMAZON.KendraSearchIntent is only inserted if it is configured for the bot.

        @[JSON::Field(key: "nluIntentConfidenceThreshold")]
        getter nlu_intent_confidence_threshold : Float64?

        # The status of the bot. When the status is BUILDING Amazon Lex is building the bot for testing and
        # use. If the status of the bot is READY_BASIC_TESTING , you can test the bot using the exact
        # utterances specified in the bot's intents. When the bot is ready for full testing or to run, the
        # status is READY . If there was a problem with building the bot, the status is FAILED and the
        # failureReason field explains why the bot did not build. If the bot was saved but not built, the
        # status is NOT_BUILT .

        @[JSON::Field(key: "status")]
        getter status : String?

        # The version of the bot. For a new bot, the version is always $LATEST .

        @[JSON::Field(key: "version")]
        getter version : String?

        # The Amazon Polly voice ID that Amazon Lex uses for voice interaction with the user. For more
        # information, see PutBot .

        @[JSON::Field(key: "voiceId")]
        getter voice_id : String?

        def initialize(
          @abort_statement : Types::Statement? = nil,
          @checksum : String? = nil,
          @child_directed : Bool? = nil,
          @clarification_prompt : Types::Prompt? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @detect_sentiment : Bool? = nil,
          @enable_model_improvements : Bool? = nil,
          @failure_reason : String? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @intents : Array(Types::Intent)? = nil,
          @last_updated_date : Time? = nil,
          @locale : String? = nil,
          @name : String? = nil,
          @nlu_intent_confidence_threshold : Float64? = nil,
          @status : String? = nil,
          @version : String? = nil,
          @voice_id : String? = nil
        )
        end
      end


      struct GetBotVersionsRequest
        include JSON::Serializable

        # The name of the bot for which versions should be returned.

        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of bot versions to return in the response. The default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for fetching the next page of bot versions. If the response to this call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of
        # versions, specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBotVersionsResponse
        include JSON::Serializable

        # An array of BotMetadata objects, one for each numbered version of the bot plus one for the $LATEST
        # version.

        @[JSON::Field(key: "bots")]
        getter bots : Array(Types::BotMetadata)?

        # A pagination token for fetching the next page of bot versions. If the response to this call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of
        # versions, specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bots : Array(Types::BotMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBotsRequest
        include JSON::Serializable

        # The maximum number of bots to return in the response that the request will return. The default is
        # 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Substring to match in bot names. A bot will be returned if any part of its name matches the
        # substring. For example, "xyz" matches both "xyzabc" and "abcxyz."

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # A pagination token that fetches the next page of bots. If the response to this call is truncated,
        # Amazon Lex returns a pagination token in the response. To fetch the next page of bots, specify the
        # pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBotsResponse
        include JSON::Serializable

        # An array of botMetadata objects, with one entry for each bot.

        @[JSON::Field(key: "bots")]
        getter bots : Array(Types::BotMetadata)?

        # If the response is truncated, it includes a pagination token that you can specify in your next
        # request to fetch the next page of bots.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bots : Array(Types::BotMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBuiltinIntentRequest
        include JSON::Serializable

        # The unique identifier for a built-in intent. To find the signature for an intent, see Standard
        # Built-in Intents in the Alexa Skills Kit .

        @[JSON::Field(key: "signature")]
        getter signature : String

        def initialize(
          @signature : String
        )
        end
      end


      struct GetBuiltinIntentResponse
        include JSON::Serializable

        # The unique identifier for a built-in intent.

        @[JSON::Field(key: "signature")]
        getter signature : String?

        # An array of BuiltinIntentSlot objects, one entry for each slot type in the intent.

        @[JSON::Field(key: "slots")]
        getter slots : Array(Types::BuiltinIntentSlot)?

        # A list of locales that the intent supports.

        @[JSON::Field(key: "supportedLocales")]
        getter supported_locales : Array(String)?

        def initialize(
          @signature : String? = nil,
          @slots : Array(Types::BuiltinIntentSlot)? = nil,
          @supported_locales : Array(String)? = nil
        )
        end
      end


      struct GetBuiltinIntentsRequest
        include JSON::Serializable

        # A list of locales that the intent supports.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of intents to return in the response. The default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token that fetches the next page of intents. If this API call is truncated, Amazon Lex
        # returns a pagination token in the response. To fetch the next page of intents, use the pagination
        # token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Substring to match in built-in intent signatures. An intent will be returned if any part of its
        # signature matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz." To find the
        # signature for an intent, see Standard Built-in Intents in the Alexa Skills Kit .

        @[JSON::Field(key: "signatureContains")]
        getter signature_contains : String?

        def initialize(
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @signature_contains : String? = nil
        )
        end
      end


      struct GetBuiltinIntentsResponse
        include JSON::Serializable

        # An array of builtinIntentMetadata objects, one for each intent in the response.

        @[JSON::Field(key: "intents")]
        getter intents : Array(Types::BuiltinIntentMetadata)?

        # A pagination token that fetches the next page of intents. If the response to this API call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of intents,
        # specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @intents : Array(Types::BuiltinIntentMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBuiltinSlotTypesRequest
        include JSON::Serializable

        # A list of locales that the slot type supports.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of slot types to return in the response. The default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token that fetches the next page of slot types. If the response to this API call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of slot
        # types, specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Substring to match in built-in slot type signatures. A slot type will be returned if any part of its
        # signature matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz."

        @[JSON::Field(key: "signatureContains")]
        getter signature_contains : String?

        def initialize(
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @signature_contains : String? = nil
        )
        end
      end


      struct GetBuiltinSlotTypesResponse
        include JSON::Serializable

        # If the response is truncated, the response includes a pagination token that you can use in your next
        # request to fetch the next page of slot types.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of BuiltInSlotTypeMetadata objects, one entry for each slot type returned.

        @[JSON::Field(key: "slotTypes")]
        getter slot_types : Array(Types::BuiltinSlotTypeMetadata)?

        def initialize(
          @next_token : String? = nil,
          @slot_types : Array(Types::BuiltinSlotTypeMetadata)? = nil
        )
        end
      end


      struct GetExportRequest
        include JSON::Serializable

        # The format of the exported data.

        @[JSON::Field(key: "exportType")]
        getter export_type : String

        # The name of the bot to export.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of resource to export.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The version of the bot to export.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @export_type : String,
          @name : String,
          @resource_type : String,
          @version : String
        )
        end
      end


      struct GetExportResponse
        include JSON::Serializable

        # The status of the export. IN_PROGRESS - The export is in progress. READY - The export is complete.
        # FAILED - The export could not be completed.

        @[JSON::Field(key: "exportStatus")]
        getter export_status : String?

        # The format of the exported data.

        @[JSON::Field(key: "exportType")]
        getter export_type : String?

        # If status is FAILED , Amazon Lex provides the reason that it failed to export the resource.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The name of the bot being exported.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of the exported resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # An S3 pre-signed URL that provides the location of the exported resource. The exported resource is a
        # ZIP archive that contains the exported resource in JSON format. The structure of the archive may
        # change. Your code should not rely on the archive structure.

        @[JSON::Field(key: "url")]
        getter url : String?

        # The version of the bot being exported.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @export_status : String? = nil,
          @export_type : String? = nil,
          @failure_reason : String? = nil,
          @name : String? = nil,
          @resource_type : String? = nil,
          @url : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetImportRequest
        include JSON::Serializable

        # The identifier of the import job information to return.

        @[JSON::Field(key: "importId")]
        getter import_id : String

        def initialize(
          @import_id : String
        )
        end
      end


      struct GetImportResponse
        include JSON::Serializable

        # A timestamp for the date and time that the import job was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A string that describes why an import job failed to complete.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : Array(String)?

        # The identifier for the specific import job.

        @[JSON::Field(key: "importId")]
        getter import_id : String?

        # The status of the import job. If the status is FAILED , you can get the reason for the failure from
        # the failureReason field.

        @[JSON::Field(key: "importStatus")]
        getter import_status : String?

        # The action taken when there was a conflict between an existing resource and a resource in the import
        # file.

        @[JSON::Field(key: "mergeStrategy")]
        getter merge_strategy : String?

        # The name given to the import job.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of resource imported.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @created_date : Time? = nil,
          @failure_reason : Array(String)? = nil,
          @import_id : String? = nil,
          @import_status : String? = nil,
          @merge_strategy : String? = nil,
          @name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct GetIntentRequest
        include JSON::Serializable

        # The name of the intent. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the intent.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @name : String,
          @version : String
        )
        end
      end


      struct GetIntentResponse
        include JSON::Serializable

        # Checksum of the intent.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # After the Lambda function specified in the fulfillmentActivity element fulfills the intent, Amazon
        # Lex conveys this statement to the user.

        @[JSON::Field(key: "conclusionStatement")]
        getter conclusion_statement : Types::Statement?

        # If defined in the bot, Amazon Lex uses prompt to confirm the intent before fulfilling the user's
        # request. For more information, see PutIntent .

        @[JSON::Field(key: "confirmationPrompt")]
        getter confirmation_prompt : Types::Prompt?

        # The date that the intent was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # If defined in the bot, Amazon Amazon Lex invokes this Lambda function for each user input. For more
        # information, see PutIntent .

        @[JSON::Field(key: "dialogCodeHook")]
        getter dialog_code_hook : Types::CodeHook?

        # If defined in the bot, Amazon Lex uses this prompt to solicit additional user activity after the
        # intent is fulfilled. For more information, see PutIntent .

        @[JSON::Field(key: "followUpPrompt")]
        getter follow_up_prompt : Types::FollowUpPrompt?

        # Describes how the intent is fulfilled. For more information, see PutIntent .

        @[JSON::Field(key: "fulfillmentActivity")]
        getter fulfillment_activity : Types::FulfillmentActivity?

        # An array of InputContext objects that lists the contexts that must be active for Amazon Lex to
        # choose the intent in a conversation with the user.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # Configuration information, if any, to connect to an Amazon Kendra index with the
        # AMAZON.KendraSearchIntent intent.

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::KendraConfiguration?

        # The date that the intent was updated. When you create a resource, the creation date and the last
        # updated date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the intent.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of OutputContext objects that lists the contexts that the intent activates when the intent
        # is fulfilled.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # A unique identifier for a built-in intent.

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        # If the user answers "no" to the question defined in confirmationPrompt , Amazon Lex responds with
        # this statement to acknowledge that the intent was canceled.

        @[JSON::Field(key: "rejectionStatement")]
        getter rejection_statement : Types::Statement?

        # An array of sample utterances configured for the intent.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(String)?

        # An array of intent slots configured for the intent.

        @[JSON::Field(key: "slots")]
        getter slots : Array(Types::Slot)?

        # The version of the intent.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @checksum : String? = nil,
          @conclusion_statement : Types::Statement? = nil,
          @confirmation_prompt : Types::Prompt? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @dialog_code_hook : Types::CodeHook? = nil,
          @follow_up_prompt : Types::FollowUpPrompt? = nil,
          @fulfillment_activity : Types::FulfillmentActivity? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @kendra_configuration : Types::KendraConfiguration? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil,
          @rejection_statement : Types::Statement? = nil,
          @sample_utterances : Array(String)? = nil,
          @slots : Array(Types::Slot)? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetIntentVersionsRequest
        include JSON::Serializable

        # The name of the intent for which versions should be returned.

        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of intent versions to return in the response. The default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for fetching the next page of intent versions. If the response to this call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of
        # versions, specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetIntentVersionsResponse
        include JSON::Serializable

        # An array of IntentMetadata objects, one for each numbered version of the intent plus one for the
        # $LATEST version.

        @[JSON::Field(key: "intents")]
        getter intents : Array(Types::IntentMetadata)?

        # A pagination token for fetching the next page of intent versions. If the response to this call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of
        # versions, specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @intents : Array(Types::IntentMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetIntentsRequest
        include JSON::Serializable

        # The maximum number of intents to return in the response. The default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Substring to match in intent names. An intent will be returned if any part of its name matches the
        # substring. For example, "xyz" matches both "xyzabc" and "abcxyz."

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # A pagination token that fetches the next page of intents. If the response to this API call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of intents,
        # specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetIntentsResponse
        include JSON::Serializable

        # An array of Intent objects. For more information, see PutBot .

        @[JSON::Field(key: "intents")]
        getter intents : Array(Types::IntentMetadata)?

        # If the response is truncated, the response includes a pagination token that you can specify in your
        # next request to fetch the next page of intents.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @intents : Array(Types::IntentMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetMigrationRequest
        include JSON::Serializable

        # The unique identifier of the migration to view. The migrationID is returned by the operation.

        @[JSON::Field(key: "migrationId")]
        getter migration_id : String

        def initialize(
          @migration_id : String
        )
        end
      end


      struct GetMigrationResponse
        include JSON::Serializable

        # A list of alerts and warnings that indicate issues with the migration for the Amazon Lex V1 bot to
        # Amazon Lex V2. You receive a warning when an Amazon Lex V1 feature has a different implementation if
        # Amazon Lex V2. For more information, see Migrating a bot in the Amazon Lex V2 developer guide .

        @[JSON::Field(key: "alerts")]
        getter alerts : Array(Types::MigrationAlert)?

        # The unique identifier of the migration. This is the same as the identifier used when calling the
        # GetMigration operation.

        @[JSON::Field(key: "migrationId")]
        getter migration_id : String?

        # Indicates the status of the migration. When the status is COMPLETE the migration is finished and the
        # bot is available in Amazon Lex V2. There may be alerts and warnings that need to be resolved to
        # complete the migration.

        @[JSON::Field(key: "migrationStatus")]
        getter migration_status : String?

        # The strategy used to conduct the migration. CREATE_NEW - Creates a new Amazon Lex V2 bot and
        # migrates the Amazon Lex V1 bot to the new bot. UPDATE_EXISTING - Overwrites the existing Amazon Lex
        # V2 bot metadata and the locale being migrated. It doesn't change any other locales in the Amazon Lex
        # V2 bot. If the locale doesn't exist, a new locale is created in the Amazon Lex V2 bot.

        @[JSON::Field(key: "migrationStrategy")]
        getter migration_strategy : String?

        # The date and time that the migration started.

        @[JSON::Field(key: "migrationTimestamp")]
        getter migration_timestamp : Time?

        # The locale of the Amazon Lex V1 bot migrated to Amazon Lex V2.

        @[JSON::Field(key: "v1BotLocale")]
        getter v1_bot_locale : String?

        # The name of the Amazon Lex V1 bot migrated to Amazon Lex V2.

        @[JSON::Field(key: "v1BotName")]
        getter v1_bot_name : String?

        # The version of the Amazon Lex V1 bot migrated to Amazon Lex V2.

        @[JSON::Field(key: "v1BotVersion")]
        getter v1_bot_version : String?

        # The unique identifier of the Amazon Lex V2 bot that the Amazon Lex V1 is being migrated to.

        @[JSON::Field(key: "v2BotId")]
        getter v2_bot_id : String?

        # The IAM role that Amazon Lex uses to run the Amazon Lex V2 bot.

        @[JSON::Field(key: "v2BotRole")]
        getter v2_bot_role : String?

        def initialize(
          @alerts : Array(Types::MigrationAlert)? = nil,
          @migration_id : String? = nil,
          @migration_status : String? = nil,
          @migration_strategy : String? = nil,
          @migration_timestamp : Time? = nil,
          @v1_bot_locale : String? = nil,
          @v1_bot_name : String? = nil,
          @v1_bot_version : String? = nil,
          @v2_bot_id : String? = nil,
          @v2_bot_role : String? = nil
        )
        end
      end


      struct GetMigrationsRequest
        include JSON::Serializable

        # The maximum number of migrations to return in the response. The default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Filters the list to contain only migrations in the specified state.

        @[JSON::Field(key: "migrationStatusEquals")]
        getter migration_status_equals : String?

        # A pagination token that fetches the next page of migrations. If the response to this operation is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of
        # migrations, specify the pagination token in the request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The field to sort the list of migrations by. You can sort by the Amazon Lex V1 bot name or the date
        # and time that the migration was started.

        @[JSON::Field(key: "sortByAttribute")]
        getter sort_by_attribute : String?

        # The order so sort the list.

        @[JSON::Field(key: "sortByOrder")]
        getter sort_by_order : String?

        # Filters the list to contain only bots whose name contains the specified string. The string is
        # matched anywhere in bot name.

        @[JSON::Field(key: "v1BotNameContains")]
        getter v1_bot_name_contains : String?

        def initialize(
          @max_results : Int32? = nil,
          @migration_status_equals : String? = nil,
          @next_token : String? = nil,
          @sort_by_attribute : String? = nil,
          @sort_by_order : String? = nil,
          @v1_bot_name_contains : String? = nil
        )
        end
      end


      struct GetMigrationsResponse
        include JSON::Serializable

        # An array of summaries for migrations from Amazon Lex V1 to Amazon Lex V2. To see details of the
        # migration, use the migrationId from the summary in a call to the operation.

        @[JSON::Field(key: "migrationSummaries")]
        getter migration_summaries : Array(Types::MigrationSummary)?

        # If the response is truncated, it includes a pagination token that you can specify in your next
        # request to fetch the next page of migrations.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @migration_summaries : Array(Types::MigrationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetSlotTypeRequest
        include JSON::Serializable

        # The name of the slot type. The name is case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the slot type.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @name : String,
          @version : String
        )
        end
      end


      struct GetSlotTypeResponse
        include JSON::Serializable

        # Checksum of the $LATEST version of the slot type.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # The date that the slot type was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of EnumerationValue objects that defines the values that the slot type can take.

        @[JSON::Field(key: "enumerationValues")]
        getter enumeration_values : Array(Types::EnumerationValue)?

        # The date that the slot type was updated. When you create a resource, the creation date and last
        # update date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the slot type.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The built-in slot type used as a parent for the slot type.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # Configuration information that extends the parent built-in slot type.

        @[JSON::Field(key: "slotTypeConfigurations")]
        getter slot_type_configurations : Array(Types::SlotTypeConfiguration)?

        # The strategy that Amazon Lex uses to determine the value of the slot. For more information, see
        # PutSlotType .

        @[JSON::Field(key: "valueSelectionStrategy")]
        getter value_selection_strategy : String?

        # The version of the slot type.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @checksum : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @enumeration_values : Array(Types::EnumerationValue)? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_configurations : Array(Types::SlotTypeConfiguration)? = nil,
          @value_selection_strategy : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetSlotTypeVersionsRequest
        include JSON::Serializable

        # The name of the slot type for which versions should be returned.

        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of slot type versions to return in the response. The default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for fetching the next page of slot type versions. If the response to this call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of
        # versions, specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetSlotTypeVersionsResponse
        include JSON::Serializable

        # A pagination token for fetching the next page of slot type versions. If the response to this call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of
        # versions, specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of SlotTypeMetadata objects, one for each numbered version of the slot type plus one for
        # the $LATEST version.

        @[JSON::Field(key: "slotTypes")]
        getter slot_types : Array(Types::SlotTypeMetadata)?

        def initialize(
          @next_token : String? = nil,
          @slot_types : Array(Types::SlotTypeMetadata)? = nil
        )
        end
      end


      struct GetSlotTypesRequest
        include JSON::Serializable

        # The maximum number of slot types to return in the response. The default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Substring to match in slot type names. A slot type will be returned if any part of its name matches
        # the substring. For example, "xyz" matches both "xyzabc" and "abcxyz."

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # A pagination token that fetches the next page of slot types. If the response to this API call is
        # truncated, Amazon Lex returns a pagination token in the response. To fetch next page of slot types,
        # specify the pagination token in the next request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetSlotTypesResponse
        include JSON::Serializable

        # If the response is truncated, it includes a pagination token that you can specify in your next
        # request to fetch the next page of slot types.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects, one for each slot type, that provides information such as the name of the slot
        # type, the version, and a description.

        @[JSON::Field(key: "slotTypes")]
        getter slot_types : Array(Types::SlotTypeMetadata)?

        def initialize(
          @next_token : String? = nil,
          @slot_types : Array(Types::SlotTypeMetadata)? = nil
        )
        end
      end


      struct GetUtterancesViewRequest
        include JSON::Serializable

        # The name of the bot for which utterance information should be returned.

        @[JSON::Field(key: "botname")]
        getter bot_name : String

        # An array of bot versions for which utterance information should be returned. The limit is 5 versions
        # per request.

        @[JSON::Field(key: "bot_versions")]
        getter bot_versions : Array(String)

        # To return utterances that were recognized and handled, use Detected . To return utterances that were
        # not recognized, use Missed .

        @[JSON::Field(key: "status_type")]
        getter status_type : String

        def initialize(
          @bot_name : String,
          @bot_versions : Array(String),
          @status_type : String
        )
        end
      end


      struct GetUtterancesViewResponse
        include JSON::Serializable

        # The name of the bot for which utterance information was returned.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # An array of UtteranceList objects, each containing a list of UtteranceData objects describing the
        # utterances that were processed by your bot. The response contains a maximum of 100 UtteranceData
        # objects for each version. Amazon Lex returns the most frequent utterances received by the bot in the
        # last 15 days.

        @[JSON::Field(key: "utterances")]
        getter utterances : Array(Types::UtteranceList)?

        def initialize(
          @bot_name : String? = nil,
          @utterances : Array(Types::UtteranceList)? = nil
        )
        end
      end

      # The name of a context that must be active for an intent to be selected by Amazon Lex.

      struct InputContext
        include JSON::Serializable

        # The name of the context.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Identifies the specific version of an intent.

      struct Intent
        include JSON::Serializable

        # The name of the intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String

        # The version of the intent.

        @[JSON::Field(key: "intentVersion")]
        getter intent_version : String

        def initialize(
          @intent_name : String,
          @intent_version : String
        )
        end
      end

      # Provides information about an intent.

      struct IntentMetadata
        include JSON::Serializable

        # The date that the intent was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date that the intent was updated. When you create an intent, the creation date and last updated
        # date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the intent.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The version of the intent.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @created_date : Time? = nil,
          @description : String? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # An internal Amazon Lex error occurred. Try your request again.

      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides configuration information for the AMAZON.KendraSearchIntent intent. When you use this
      # intent, Amazon Lex searches the specified Amazon Kendra index and returns documents from the index
      # that match the user's utterance. For more information, see AMAZON.KendraSearchIntent .

      struct KendraConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Kendra index that you want the
        # AMAZON.KendraSearchIntent intent to search. The index must be in the same account and Region as the
        # Amazon Lex bot. If the Amazon Kendra index does not exist, you get an exception when you call the
        # PutIntent operation.

        @[JSON::Field(key: "kendraIndex")]
        getter kendra_index : String

        # The Amazon Resource Name (ARN) of an IAM role that has permission to search the Amazon Kendra index.
        # The role must be in the same account and Region as the Amazon Lex bot. If the role does not exist,
        # you get an exception when you call the PutIntent operation.

        @[JSON::Field(key: "role")]
        getter role : String

        # A query filter that Amazon Lex sends to Amazon Kendra to filter the response from the query. The
        # filter is in the format defined by Amazon Kendra. For more information, see Filtering queries . You
        # can override this filter string with a new filter string at runtime.

        @[JSON::Field(key: "queryFilterString")]
        getter query_filter_string : String?

        def initialize(
          @kendra_index : String,
          @role : String,
          @query_filter_string : String? = nil
        )
        end
      end

      # The request exceeded a limit. Try your request again.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : String?

        def initialize(
          @message : String? = nil,
          @retry_after_seconds : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to get a list of tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with a resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Settings used to configure delivery mode and destination for conversation logs.

      struct LogSettingsRequest
        include JSON::Serializable

        # Where the logs will be delivered. Text logs are delivered to a CloudWatch Logs log group. Audio logs
        # are delivered to an S3 bucket.

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The type of logging to enable. Text logs are delivered to a CloudWatch Logs log group. Audio logs
        # are delivered to an S3 bucket.

        @[JSON::Field(key: "logType")]
        getter log_type : String

        # The Amazon Resource Name (ARN) of the CloudWatch Logs log group or S3 bucket where the logs should
        # be delivered.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The Amazon Resource Name (ARN) of the AWS KMS customer managed key for encrypting audio logs
        # delivered to an S3 bucket. The key does not apply to CloudWatch Logs and is optional for S3 buckets.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @destination : String,
          @log_type : String,
          @resource_arn : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # The settings for conversation logs.

      struct LogSettingsResponse
        include JSON::Serializable

        # The destination where logs are delivered.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The Amazon Resource Name (ARN) of the key used to encrypt audio logs in an S3 bucket.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The type of logging that is enabled.

        @[JSON::Field(key: "logType")]
        getter log_type : String?

        # The Amazon Resource Name (ARN) of the CloudWatch Logs log group or S3 bucket where the logs are
        # delivered.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The resource prefix is the first part of the S3 object key within the S3 bucket that you specified
        # to contain audio logs. For CloudWatch Logs it is the prefix of the log stream name within the log
        # group that you specified.

        @[JSON::Field(key: "resourcePrefix")]
        getter resource_prefix : String?

        def initialize(
          @destination : String? = nil,
          @kms_key_arn : String? = nil,
          @log_type : String? = nil,
          @resource_arn : String? = nil,
          @resource_prefix : String? = nil
        )
        end
      end

      # The message object that provides the message text and its type.

      struct Message
        include JSON::Serializable

        # The text of the message.

        @[JSON::Field(key: "content")]
        getter content : String

        # The content type of the message string.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # Identifies the message group that the message belongs to. When a group is assigned to a message,
        # Amazon Lex returns one message from each group in the response.

        @[JSON::Field(key: "groupNumber")]
        getter group_number : Int32?

        def initialize(
          @content : String,
          @content_type : String,
          @group_number : Int32? = nil
        )
        end
      end

      # Provides information about alerts and warnings that Amazon Lex sends during a migration. The alerts
      # include information about how to resolve the issue.

      struct MigrationAlert
        include JSON::Serializable

        # Additional details about the alert.

        @[JSON::Field(key: "details")]
        getter details : Array(String)?

        # A message that describes why the alert was issued.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A link to the Amazon Lex documentation that describes how to resolve the alert.

        @[JSON::Field(key: "referenceURLs")]
        getter reference_ur_ls : Array(String)?

        # The type of alert. There are two kinds of alerts: ERROR - There was an issue with the migration that
        # can't be resolved. The migration stops. WARN - There was an issue with the migration that requires
        # manual changes to the new Amazon Lex V2 bot. The migration continues.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @details : Array(String)? = nil,
          @message : String? = nil,
          @reference_ur_ls : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides information about migrating a bot from Amazon Lex V1 to Amazon Lex V2.

      struct MigrationSummary
        include JSON::Serializable

        # The unique identifier that Amazon Lex assigned to the migration.

        @[JSON::Field(key: "migrationId")]
        getter migration_id : String?

        # The status of the operation. When the status is COMPLETE the bot is available in Amazon Lex V2.
        # There may be alerts and warnings that need to be resolved to complete the migration.

        @[JSON::Field(key: "migrationStatus")]
        getter migration_status : String?

        # The strategy used to conduct the migration.

        @[JSON::Field(key: "migrationStrategy")]
        getter migration_strategy : String?

        # The date and time that the migration started.

        @[JSON::Field(key: "migrationTimestamp")]
        getter migration_timestamp : Time?

        # The locale of the Amazon Lex V1 bot that is the source of the migration.

        @[JSON::Field(key: "v1BotLocale")]
        getter v1_bot_locale : String?

        # The name of the Amazon Lex V1 bot that is the source of the migration.

        @[JSON::Field(key: "v1BotName")]
        getter v1_bot_name : String?

        # The version of the Amazon Lex V1 bot that is the source of the migration.

        @[JSON::Field(key: "v1BotVersion")]
        getter v1_bot_version : String?

        # The unique identifier of the Amazon Lex V2 that is the destination of the migration.

        @[JSON::Field(key: "v2BotId")]
        getter v2_bot_id : String?

        # The IAM role that Amazon Lex uses to run the Amazon Lex V2 bot.

        @[JSON::Field(key: "v2BotRole")]
        getter v2_bot_role : String?

        def initialize(
          @migration_id : String? = nil,
          @migration_status : String? = nil,
          @migration_strategy : String? = nil,
          @migration_timestamp : Time? = nil,
          @v1_bot_locale : String? = nil,
          @v1_bot_name : String? = nil,
          @v1_bot_version : String? = nil,
          @v2_bot_id : String? = nil,
          @v2_bot_role : String? = nil
        )
        end
      end

      # The resource specified in the request was not found. Check the resource and try again.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specification of an output context that is set when an intent is fulfilled.

      struct OutputContext
        include JSON::Serializable

        # The name of the context.

        @[JSON::Field(key: "name")]
        getter name : String

        # The number of seconds that the context should be active after it is first sent in a PostContent or
        # PostText response. You can set the value between 5 and 86,400 seconds (24 hours).

        @[JSON::Field(key: "timeToLiveInSeconds")]
        getter time_to_live_in_seconds : Int32

        # The number of conversation turns that the context should be active. A conversation turn is one
        # PostContent or PostText request and the corresponding response from Amazon Lex.

        @[JSON::Field(key: "turnsToLive")]
        getter turns_to_live : Int32

        def initialize(
          @name : String,
          @time_to_live_in_seconds : Int32,
          @turns_to_live : Int32
        )
        end
      end

      # The checksum of the resource that you are trying to change does not match the checksum in the
      # request. Check the resource's checksum and try again.

      struct PreconditionFailedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Obtains information from the user. To define a prompt, provide one or more messages and specify the
      # number of attempts to get information from the user. If you provide more than one message, Amazon
      # Lex chooses one of the messages to use to prompt the user. For more information, see how-it-works .

      struct Prompt
        include JSON::Serializable

        # The number of times to prompt the user for information.

        @[JSON::Field(key: "maxAttempts")]
        getter max_attempts : Int32

        # An array of objects, each of which provides a message string and its type. You can specify the
        # message string in plain text or in Speech Synthesis Markup Language (SSML).

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)

        # A response card. Amazon Lex uses this prompt at runtime, in the PostText API response. It
        # substitutes session attributes and slot values for placeholders in the response card. For more
        # information, see ex-resp-card .

        @[JSON::Field(key: "responseCard")]
        getter response_card : String?

        def initialize(
          @max_attempts : Int32,
          @messages : Array(Types::Message),
          @response_card : String? = nil
        )
        end
      end


      struct PutBotAliasRequest
        include JSON::Serializable

        # The name of the bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The version of the bot.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String

        # The name of the alias. The name is not case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        # Identifies a specific revision of the $LATEST version. When you create a new bot alias, leave the
        # checksum field blank. If you specify a checksum you get a BadRequestException exception. When you
        # want to update a bot alias, set the checksum field to the checksum of the most recent revision of
        # the $LATEST version. If you don't specify the checksum field, or if the checksum does not match the
        # $LATEST version, you get a PreconditionFailedException exception.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # Settings for conversation logs for the alias.

        @[JSON::Field(key: "conversationLogs")]
        getter conversation_logs : Types::ConversationLogsRequest?

        # A description of the alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of tags to add to the bot alias. You can only add tags when you create an alias, you can't
        # use the PutBotAlias operation to update the tags on a bot alias. To update tags, use the TagResource
        # operation.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @bot_name : String,
          @bot_version : String,
          @name : String,
          @checksum : String? = nil,
          @conversation_logs : Types::ConversationLogsRequest? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutBotAliasResponse
        include JSON::Serializable

        # The name of the bot that the alias points to.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The version of the bot that the alias points to.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # The checksum for the current version of the alias.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # The settings that determine how Amazon Lex uses conversation logs for the alias.

        @[JSON::Field(key: "conversationLogs")]
        getter conversation_logs : Types::ConversationLogsResponse?

        # The date that the bot alias was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date that the bot alias was updated. When you create a resource, the creation date and the last
        # updated date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the alias.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of tags associated with a bot.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @bot_name : String? = nil,
          @bot_version : String? = nil,
          @checksum : String? = nil,
          @conversation_logs : Types::ConversationLogsResponse? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutBotRequest
        include JSON::Serializable

        # For each Amazon Lex bot created with the Amazon Lex Model Building Service, you must specify whether
        # your use of Amazon Lex is related to a website, program, or other application that is directed or
        # targeted, in whole or in part, to children under age 13 and subject to the Children's Online Privacy
        # Protection Act (COPPA) by specifying true or false in the childDirected field. By specifying true in
        # the childDirected field, you confirm that your use of Amazon Lex is related to a website, program,
        # or other application that is directed or targeted, in whole or in part, to children under age 13 and
        # subject to COPPA. By specifying false in the childDirected field, you confirm that your use of
        # Amazon Lex is not related to a website, program, or other application that is directed or targeted,
        # in whole or in part, to children under age 13 and subject to COPPA. You may not specify a default
        # value for the childDirected field that does not accurately reflect whether your use of Amazon Lex is
        # related to a website, program, or other application that is directed or targeted, in whole or in
        # part, to children under age 13 and subject to COPPA. If your use of Amazon Lex relates to a website,
        # program, or other application that is directed in whole or in part, to children under age 13, you
        # must obtain any required verifiable parental consent under COPPA. For information regarding the use
        # of Amazon Lex in connection with websites, programs, or other applications that are directed or
        # targeted, in whole or in part, to children under age 13, see the Amazon Lex FAQ.

        @[JSON::Field(key: "childDirected")]
        getter child_directed : Bool

        # Specifies the target locale for the bot. Any intent used in the bot must be compatible with the
        # locale of the bot. The default is en-US .

        @[JSON::Field(key: "locale")]
        getter locale : String

        # The name of the bot. The name is not case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String

        # When Amazon Lex can't understand the user's input in context, it tries to elicit the information a
        # few times. After that, Amazon Lex sends the message defined in abortStatement to the user, and then
        # cancels the conversation. To set the number of retries, use the valueElicitationPrompt field for the
        # slot type. For example, in a pizza ordering bot, Amazon Lex might ask a user "What type of crust
        # would you like?" If the user's response is not one of the expected responses (for example, "thin
        # crust, "deep dish," etc.), Amazon Lex tries to elicit a correct response a few more times. For
        # example, in a pizza ordering application, OrderPizza might be one of the intents. This intent might
        # require the CrustType slot. You specify the valueElicitationPrompt field when you create the
        # CrustType slot. If you have defined a fallback intent the cancel statement will not be sent to the
        # user, the fallback intent is used instead. For more information, see AMAZON.FallbackIntent .

        @[JSON::Field(key: "abortStatement")]
        getter abort_statement : Types::Statement?

        # Identifies a specific revision of the $LATEST version. When you create a new bot, leave the checksum
        # field blank. If you specify a checksum you get a BadRequestException exception. When you want to
        # update a bot, set the checksum field to the checksum of the most recent revision of the $LATEST
        # version. If you don't specify the checksum field, or if the checksum does not match the $LATEST
        # version, you get a PreconditionFailedException exception.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # When Amazon Lex doesn't understand the user's intent, it uses this message to get clarification. To
        # specify how many times Amazon Lex should repeat the clarification prompt, use the maxAttempts field.
        # If Amazon Lex still doesn't understand, it sends the message in the abortStatement field. When you
        # create a clarification prompt, make sure that it suggests the correct response from the user. for
        # example, for a bot that orders pizza and drinks, you might create this clarification prompt: "What
        # would you like to do? You can say 'Order a pizza' or 'Order a drink.'" If you have defined a
        # fallback intent, it will be invoked if the clarification prompt is repeated the number of times
        # defined in the maxAttempts field. For more information, see AMAZON.FallbackIntent . If you don't
        # define a clarification prompt, at runtime Amazon Lex will return a 400 Bad Request exception in
        # three cases: Follow-up prompt - When the user responds to a follow-up prompt but does not provide an
        # intent. For example, in response to a follow-up prompt that says "Would you like anything else
        # today?" the user says "Yes." Amazon Lex will return a 400 Bad Request exception because it does not
        # have a clarification prompt to send to the user to get an intent. Lambda function - When using a
        # Lambda function, you return an ElicitIntent dialog type. Since Amazon Lex does not have a
        # clarification prompt to get an intent from the user, it returns a 400 Bad Request exception.
        # PutSession operation - When using the PutSession operation, you send an ElicitIntent dialog type.
        # Since Amazon Lex does not have a clarification prompt to get an intent from the user, it returns a
        # 400 Bad Request exception.

        @[JSON::Field(key: "clarificationPrompt")]
        getter clarification_prompt : Types::Prompt?

        # When set to true a new numbered version of the bot is created. This is the same as calling the
        # CreateBotVersion operation. If you don't specify createVersion , the default is false .

        @[JSON::Field(key: "createVersion")]
        getter create_version : Bool?

        # A description of the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # When set to true user utterances are sent to Amazon Comprehend for sentiment analysis. If you don't
        # specify detectSentiment , the default is false .

        @[JSON::Field(key: "detectSentiment")]
        getter detect_sentiment : Bool?

        # Set to true to enable access to natural language understanding improvements. When you set the
        # enableModelImprovements parameter to true you can use the nluIntentConfidenceThreshold parameter to
        # configure confidence scores. For more information, see Confidence Scores . You can only set the
        # enableModelImprovements parameter in certain Regions. If you set the parameter to true , your bot
        # has access to accuracy improvements. The Regions where you can set the enableModelImprovements
        # parameter to true are: US East (N. Virginia) (us-east-1) US West (Oregon) (us-west-2) Asia Pacific
        # (Sydney) (ap-southeast-2) EU (Ireland) (eu-west-1) In other Regions, the enableModelImprovements
        # parameter is set to true by default. In these Regions setting the parameter to false throws a
        # ValidationException exception.

        @[JSON::Field(key: "enableModelImprovements")]
        getter enable_model_improvements : Bool?

        # The maximum time in seconds that Amazon Lex retains the data gathered in a conversation. A user
        # interaction session remains active for the amount of time specified. If no conversation occurs
        # during this time, the session expires and Amazon Lex deletes any data provided before the timeout.
        # For example, suppose that a user chooses the OrderPizza intent, but gets sidetracked halfway through
        # placing an order. If the user doesn't complete the order within the specified time, Amazon Lex
        # discards the slot information that it gathered, and the user must start over. If you don't include
        # the idleSessionTTLInSeconds element in a PutBot operation request, Amazon Lex uses the default
        # value. This is also true if the request replaces an existing bot. The default is 300 seconds (5
        # minutes).

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # An array of Intent objects. Each intent represents a command that a user can express. For example, a
        # pizza ordering bot might support an OrderPizza intent. For more information, see how-it-works .

        @[JSON::Field(key: "intents")]
        getter intents : Array(Types::Intent)?

        # Determines the threshold where Amazon Lex will insert the AMAZON.FallbackIntent ,
        # AMAZON.KendraSearchIntent , or both when returning alternative intents in a PostContent or PostText
        # response. AMAZON.FallbackIntent and AMAZON.KendraSearchIntent are only inserted if they are
        # configured for the bot. You must set the enableModelImprovements parameter to true to use confidence
        # scores in the following regions. US East (N. Virginia) (us-east-1) US West (Oregon) (us-west-2) Asia
        # Pacific (Sydney) (ap-southeast-2) EU (Ireland) (eu-west-1) In other Regions, the
        # enableModelImprovements parameter is set to true by default. For example, suppose a bot is
        # configured with the confidence threshold of 0.80 and the AMAZON.FallbackIntent . Amazon Lex returns
        # three alternative intents with the following confidence scores: IntentA (0.70), IntentB (0.60),
        # IntentC (0.50). The response from the PostText operation would be: AMAZON.FallbackIntent IntentA
        # IntentB IntentC

        @[JSON::Field(key: "nluIntentConfidenceThreshold")]
        getter nlu_intent_confidence_threshold : Float64?

        # If you set the processBehavior element to BUILD , Amazon Lex builds the bot so that it can be run.
        # If you set the element to SAVE Amazon Lex saves the bot, but doesn't build it. If you don't specify
        # this value, the default value is BUILD .

        @[JSON::Field(key: "processBehavior")]
        getter process_behavior : String?

        # A list of tags to add to the bot. You can only add tags when you create a bot, you can't use the
        # PutBot operation to update the tags on a bot. To update tags, use the TagResource operation.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon Polly voice ID that you want Amazon Lex to use for voice interactions with the user. The
        # locale configured for the voice must match the locale of the bot. For more information, see Voices
        # in Amazon Polly in the Amazon Polly Developer Guide .

        @[JSON::Field(key: "voiceId")]
        getter voice_id : String?

        def initialize(
          @child_directed : Bool,
          @locale : String,
          @name : String,
          @abort_statement : Types::Statement? = nil,
          @checksum : String? = nil,
          @clarification_prompt : Types::Prompt? = nil,
          @create_version : Bool? = nil,
          @description : String? = nil,
          @detect_sentiment : Bool? = nil,
          @enable_model_improvements : Bool? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @intents : Array(Types::Intent)? = nil,
          @nlu_intent_confidence_threshold : Float64? = nil,
          @process_behavior : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @voice_id : String? = nil
        )
        end
      end


      struct PutBotResponse
        include JSON::Serializable

        # The message that Amazon Lex uses to cancel a conversation. For more information, see PutBot .

        @[JSON::Field(key: "abortStatement")]
        getter abort_statement : Types::Statement?

        # Checksum of the bot that you created.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # For each Amazon Lex bot created with the Amazon Lex Model Building Service, you must specify whether
        # your use of Amazon Lex is related to a website, program, or other application that is directed or
        # targeted, in whole or in part, to children under age 13 and subject to the Children's Online Privacy
        # Protection Act (COPPA) by specifying true or false in the childDirected field. By specifying true in
        # the childDirected field, you confirm that your use of Amazon Lex is related to a website, program,
        # or other application that is directed or targeted, in whole or in part, to children under age 13 and
        # subject to COPPA. By specifying false in the childDirected field, you confirm that your use of
        # Amazon Lex is not related to a website, program, or other application that is directed or targeted,
        # in whole or in part, to children under age 13 and subject to COPPA. You may not specify a default
        # value for the childDirected field that does not accurately reflect whether your use of Amazon Lex is
        # related to a website, program, or other application that is directed or targeted, in whole or in
        # part, to children under age 13 and subject to COPPA. If your use of Amazon Lex relates to a website,
        # program, or other application that is directed in whole or in part, to children under age 13, you
        # must obtain any required verifiable parental consent under COPPA. For information regarding the use
        # of Amazon Lex in connection with websites, programs, or other applications that are directed or
        # targeted, in whole or in part, to children under age 13, see the Amazon Lex FAQ.

        @[JSON::Field(key: "childDirected")]
        getter child_directed : Bool?

        # The prompts that Amazon Lex uses when it doesn't understand the user's intent. For more information,
        # see PutBot .

        @[JSON::Field(key: "clarificationPrompt")]
        getter clarification_prompt : Types::Prompt?

        # True if a new version of the bot was created. If the createVersion field was not specified in the
        # request, the createVersion field is set to false in the response.

        @[JSON::Field(key: "createVersion")]
        getter create_version : Bool?

        # The date that the bot was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the bot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # true if the bot is configured to send user utterances to Amazon Comprehend for sentiment analysis.
        # If the detectSentiment field was not specified in the request, the detectSentiment field is false in
        # the response.

        @[JSON::Field(key: "detectSentiment")]
        getter detect_sentiment : Bool?

        # Indicates whether the bot uses accuracy improvements. true indicates that the bot is using the
        # improvements, otherwise, false .

        @[JSON::Field(key: "enableModelImprovements")]
        getter enable_model_improvements : Bool?

        # If status is FAILED , Amazon Lex provides the reason that it failed to build the bot.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The maximum length of time that Amazon Lex retains the data gathered in a conversation. For more
        # information, see PutBot .

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # An array of Intent objects. For more information, see PutBot .

        @[JSON::Field(key: "intents")]
        getter intents : Array(Types::Intent)?

        # The date that the bot was updated. When you create a resource, the creation date and last updated
        # date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The target locale for the bot.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The name of the bot.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The score that determines where Amazon Lex inserts the AMAZON.FallbackIntent ,
        # AMAZON.KendraSearchIntent , or both when returning alternative intents in a PostContent or PostText
        # response. AMAZON.FallbackIntent is inserted if the confidence score for all intents is below this
        # value. AMAZON.KendraSearchIntent is only inserted if it is configured for the bot.

        @[JSON::Field(key: "nluIntentConfidenceThreshold")]
        getter nlu_intent_confidence_threshold : Float64?

        # When you send a request to create a bot with processBehavior set to BUILD , Amazon Lex sets the
        # status response element to BUILDING . In the READY_BASIC_TESTING state you can test the bot with
        # user inputs that exactly match the utterances configured for the bot's intents and values in the
        # slot types. If Amazon Lex can't build the bot, Amazon Lex sets status to FAILED . Amazon Lex returns
        # the reason for the failure in the failureReason response element. When you set processBehavior to
        # SAVE , Amazon Lex sets the status code to NOT BUILT . When the bot is in the READY state you can
        # test and publish the bot.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of tags associated with the bot.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The version of the bot. For a new bot, the version is always $LATEST .

        @[JSON::Field(key: "version")]
        getter version : String?

        # The Amazon Polly voice ID that Amazon Lex uses for voice interaction with the user. For more
        # information, see PutBot .

        @[JSON::Field(key: "voiceId")]
        getter voice_id : String?

        def initialize(
          @abort_statement : Types::Statement? = nil,
          @checksum : String? = nil,
          @child_directed : Bool? = nil,
          @clarification_prompt : Types::Prompt? = nil,
          @create_version : Bool? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @detect_sentiment : Bool? = nil,
          @enable_model_improvements : Bool? = nil,
          @failure_reason : String? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @intents : Array(Types::Intent)? = nil,
          @last_updated_date : Time? = nil,
          @locale : String? = nil,
          @name : String? = nil,
          @nlu_intent_confidence_threshold : Float64? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version : String? = nil,
          @voice_id : String? = nil
        )
        end
      end


      struct PutIntentRequest
        include JSON::Serializable

        # The name of the intent. The name is not case sensitive. The name can't match a built-in intent name,
        # or a built-in intent name with "AMAZON." removed. For example, because there is a built-in intent
        # called AMAZON.HelpIntent , you can't create a custom intent called HelpIntent . For a list of
        # built-in intents, see Standard Built-in Intents in the Alexa Skills Kit .

        @[JSON::Field(key: "name")]
        getter name : String

        # Identifies a specific revision of the $LATEST version. When you create a new intent, leave the
        # checksum field blank. If you specify a checksum you get a BadRequestException exception. When you
        # want to update a intent, set the checksum field to the checksum of the most recent revision of the
        # $LATEST version. If you don't specify the checksum field, or if the checksum does not match the
        # $LATEST version, you get a PreconditionFailedException exception.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # The statement that you want Amazon Lex to convey to the user after the intent is successfully
        # fulfilled by the Lambda function. This element is relevant only if you provide a Lambda function in
        # the fulfillmentActivity . If you return the intent to the client application, you can't specify this
        # element. The followUpPrompt and conclusionStatement are mutually exclusive. You can specify only
        # one.

        @[JSON::Field(key: "conclusionStatement")]
        getter conclusion_statement : Types::Statement?

        # Prompts the user to confirm the intent. This question should have a yes or no answer. Amazon Lex
        # uses this prompt to ensure that the user acknowledges that the intent is ready for fulfillment. For
        # example, with the OrderPizza intent, you might want to confirm that the order is correct before
        # placing it. For other intents, such as intents that simply respond to user questions, you might not
        # need to ask the user for confirmation before providing the information. You you must provide both
        # the rejectionStatement and the confirmationPrompt , or neither.

        @[JSON::Field(key: "confirmationPrompt")]
        getter confirmation_prompt : Types::Prompt?

        # When set to true a new numbered version of the intent is created. This is the same as calling the
        # CreateIntentVersion operation. If you do not specify createVersion , the default is false .

        @[JSON::Field(key: "createVersion")]
        getter create_version : Bool?

        # A description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies a Lambda function to invoke for each user input. You can invoke this Lambda function to
        # personalize user interaction. For example, suppose your bot determines that the user is John. Your
        # Lambda function might retrieve John's information from a backend database and prepopulate some of
        # the values. For example, if you find that John is gluten intolerant, you might set the corresponding
        # intent slot, GlutenIntolerant , to true. You might find John's phone number and set the
        # corresponding session attribute.

        @[JSON::Field(key: "dialogCodeHook")]
        getter dialog_code_hook : Types::CodeHook?

        # Amazon Lex uses this prompt to solicit additional activity after fulfilling an intent. For example,
        # after the OrderPizza intent is fulfilled, you might prompt the user to order a drink. The action
        # that Amazon Lex takes depends on the user's response, as follows: If the user says "Yes" it responds
        # with the clarification prompt that is configured for the bot. if the user says "Yes" and continues
        # with an utterance that triggers an intent it starts a conversation for the intent. If the user says
        # "No" it responds with the rejection statement configured for the the follow-up prompt. If it doesn't
        # recognize the utterance it repeats the follow-up prompt again. The followUpPrompt field and the
        # conclusionStatement field are mutually exclusive. You can specify only one.

        @[JSON::Field(key: "followUpPrompt")]
        getter follow_up_prompt : Types::FollowUpPrompt?

        # Required. Describes how the intent is fulfilled. For example, after a user provides all of the
        # information for a pizza order, fulfillmentActivity defines how the bot places an order with a local
        # pizza store. You might configure Amazon Lex to return all of the intent information to the client
        # application, or direct it to invoke a Lambda function that can process the intent (for example,
        # place an order with a pizzeria).

        @[JSON::Field(key: "fulfillmentActivity")]
        getter fulfillment_activity : Types::FulfillmentActivity?

        # An array of InputContext objects that lists the contexts that must be active for Amazon Lex to
        # choose the intent in a conversation with the user.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # Configuration information required to use the AMAZON.KendraSearchIntent intent to connect to an
        # Amazon Kendra index. For more information, see AMAZON.KendraSearchIntent .

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::KendraConfiguration?

        # An array of OutputContext objects that lists the contexts that the intent activates when the intent
        # is fulfilled.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # A unique identifier for the built-in intent to base this intent on. To find the signature for an
        # intent, see Standard Built-in Intents in the Alexa Skills Kit .

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        # When the user answers "no" to the question defined in confirmationPrompt , Amazon Lex responds with
        # this statement to acknowledge that the intent was canceled. You must provide both the
        # rejectionStatement and the confirmationPrompt , or neither.

        @[JSON::Field(key: "rejectionStatement")]
        getter rejection_statement : Types::Statement?

        # An array of utterances (strings) that a user might say to signal the intent. For example, "I want
        # {PizzaSize} pizza", "Order {Quantity} {PizzaSize} pizzas". In each utterance, a slot name is
        # enclosed in curly braces.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(String)?

        # An array of intent slots. At runtime, Amazon Lex elicits required slot values from the user using
        # prompts defined in the slots. For more information, see how-it-works .

        @[JSON::Field(key: "slots")]
        getter slots : Array(Types::Slot)?

        def initialize(
          @name : String,
          @checksum : String? = nil,
          @conclusion_statement : Types::Statement? = nil,
          @confirmation_prompt : Types::Prompt? = nil,
          @create_version : Bool? = nil,
          @description : String? = nil,
          @dialog_code_hook : Types::CodeHook? = nil,
          @follow_up_prompt : Types::FollowUpPrompt? = nil,
          @fulfillment_activity : Types::FulfillmentActivity? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @kendra_configuration : Types::KendraConfiguration? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil,
          @rejection_statement : Types::Statement? = nil,
          @sample_utterances : Array(String)? = nil,
          @slots : Array(Types::Slot)? = nil
        )
        end
      end


      struct PutIntentResponse
        include JSON::Serializable

        # Checksum of the $LATEST version of the intent created or updated.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # After the Lambda function specified in the fulfillmentActivity intent fulfills the intent, Amazon
        # Lex conveys this statement to the user.

        @[JSON::Field(key: "conclusionStatement")]
        getter conclusion_statement : Types::Statement?

        # If defined in the intent, Amazon Lex prompts the user to confirm the intent before fulfilling it.

        @[JSON::Field(key: "confirmationPrompt")]
        getter confirmation_prompt : Types::Prompt?

        # True if a new version of the intent was created. If the createVersion field was not specified in the
        # request, the createVersion field is set to false in the response.

        @[JSON::Field(key: "createVersion")]
        getter create_version : Bool?

        # The date that the intent was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the intent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # If defined in the intent, Amazon Lex invokes this Lambda function for each user input.

        @[JSON::Field(key: "dialogCodeHook")]
        getter dialog_code_hook : Types::CodeHook?

        # If defined in the intent, Amazon Lex uses this prompt to solicit additional user activity after the
        # intent is fulfilled.

        @[JSON::Field(key: "followUpPrompt")]
        getter follow_up_prompt : Types::FollowUpPrompt?

        # If defined in the intent, Amazon Lex invokes this Lambda function to fulfill the intent after the
        # user provides all of the information required by the intent.

        @[JSON::Field(key: "fulfillmentActivity")]
        getter fulfillment_activity : Types::FulfillmentActivity?

        # An array of InputContext objects that lists the contexts that must be active for Amazon Lex to
        # choose the intent in a conversation with the user.

        @[JSON::Field(key: "inputContexts")]
        getter input_contexts : Array(Types::InputContext)?

        # Configuration information, if any, required to connect to an Amazon Kendra index and use the
        # AMAZON.KendraSearchIntent intent.

        @[JSON::Field(key: "kendraConfiguration")]
        getter kendra_configuration : Types::KendraConfiguration?

        # The date that the intent was updated. When you create a resource, the creation date and last update
        # dates are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the intent.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of OutputContext objects that lists the contexts that the intent activates when the intent
        # is fulfilled.

        @[JSON::Field(key: "outputContexts")]
        getter output_contexts : Array(Types::OutputContext)?

        # A unique identifier for the built-in intent that this intent is based on.

        @[JSON::Field(key: "parentIntentSignature")]
        getter parent_intent_signature : String?

        # If the user answers "no" to the question defined in confirmationPrompt Amazon Lex responds with this
        # statement to acknowledge that the intent was canceled.

        @[JSON::Field(key: "rejectionStatement")]
        getter rejection_statement : Types::Statement?

        # An array of sample utterances that are configured for the intent.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(String)?

        # An array of intent slots that are configured for the intent.

        @[JSON::Field(key: "slots")]
        getter slots : Array(Types::Slot)?

        # The version of the intent. For a new intent, the version is always $LATEST .

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @checksum : String? = nil,
          @conclusion_statement : Types::Statement? = nil,
          @confirmation_prompt : Types::Prompt? = nil,
          @create_version : Bool? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @dialog_code_hook : Types::CodeHook? = nil,
          @follow_up_prompt : Types::FollowUpPrompt? = nil,
          @fulfillment_activity : Types::FulfillmentActivity? = nil,
          @input_contexts : Array(Types::InputContext)? = nil,
          @kendra_configuration : Types::KendraConfiguration? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @output_contexts : Array(Types::OutputContext)? = nil,
          @parent_intent_signature : String? = nil,
          @rejection_statement : Types::Statement? = nil,
          @sample_utterances : Array(String)? = nil,
          @slots : Array(Types::Slot)? = nil,
          @version : String? = nil
        )
        end
      end


      struct PutSlotTypeRequest
        include JSON::Serializable

        # The name of the slot type. The name is not case sensitive. The name can't match a built-in slot type
        # name, or a built-in slot type name with "AMAZON." removed. For example, because there is a built-in
        # slot type called AMAZON.DATE , you can't create a custom slot type called DATE . For a list of
        # built-in slot types, see Slot Type Reference in the Alexa Skills Kit .

        @[JSON::Field(key: "name")]
        getter name : String

        # Identifies a specific revision of the $LATEST version. When you create a new slot type, leave the
        # checksum field blank. If you specify a checksum you get a BadRequestException exception. When you
        # want to update a slot type, set the checksum field to the checksum of the most recent revision of
        # the $LATEST version. If you don't specify the checksum field, or if the checksum does not match the
        # $LATEST version, you get a PreconditionFailedException exception.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # When set to true a new numbered version of the slot type is created. This is the same as calling the
        # CreateSlotTypeVersion operation. If you do not specify createVersion , the default is false .

        @[JSON::Field(key: "createVersion")]
        getter create_version : Bool?

        # A description of the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of EnumerationValue objects that defines the values that the slot type can take. Each value
        # can have a list of synonyms , which are additional values that help train the machine learning model
        # about the values that it resolves for a slot. A regular expression slot type doesn't require
        # enumeration values. All other slot types require a list of enumeration values. When Amazon Lex
        # resolves a slot value, it generates a resolution list that contains up to five possible values for
        # the slot. If you are using a Lambda function, this resolution list is passed to the function. If you
        # are not using a Lambda function you can choose to return the value that the user entered or the
        # first value in the resolution list as the slot value. The valueSelectionStrategy field indicates the
        # option to use.

        @[JSON::Field(key: "enumerationValues")]
        getter enumeration_values : Array(Types::EnumerationValue)?

        # The built-in slot type used as the parent of the slot type. When you define a parent slot type, the
        # new slot type has all of the same configuration as the parent. Only AMAZON.AlphaNumeric is
        # supported.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # Configuration information that extends the parent built-in slot type. The configuration is added to
        # the settings for the parent slot type.

        @[JSON::Field(key: "slotTypeConfigurations")]
        getter slot_type_configurations : Array(Types::SlotTypeConfiguration)?

        # Determines the slot resolution strategy that Amazon Lex uses to return slot type values. The field
        # can be set to one of the following values: ORIGINAL_VALUE - Returns the value entered by the user,
        # if the user value is similar to the slot value. TOP_RESOLUTION - If there is a resolution list for
        # the slot, return the first value in the resolution list as the slot type value. If there is no
        # resolution list, null is returned. If you don't specify the valueSelectionStrategy , the default is
        # ORIGINAL_VALUE .

        @[JSON::Field(key: "valueSelectionStrategy")]
        getter value_selection_strategy : String?

        def initialize(
          @name : String,
          @checksum : String? = nil,
          @create_version : Bool? = nil,
          @description : String? = nil,
          @enumeration_values : Array(Types::EnumerationValue)? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_configurations : Array(Types::SlotTypeConfiguration)? = nil,
          @value_selection_strategy : String? = nil
        )
        end
      end


      struct PutSlotTypeResponse
        include JSON::Serializable

        # Checksum of the $LATEST version of the slot type.

        @[JSON::Field(key: "checksum")]
        getter checksum : String?

        # True if a new version of the slot type was created. If the createVersion field was not specified in
        # the request, the createVersion field is set to false in the response.

        @[JSON::Field(key: "createVersion")]
        getter create_version : Bool?

        # The date that the slot type was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of EnumerationValue objects that defines the values that the slot type can take.

        @[JSON::Field(key: "enumerationValues")]
        getter enumeration_values : Array(Types::EnumerationValue)?

        # The date that the slot type was updated. When you create a slot type, the creation date and last
        # update date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the slot type.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The built-in slot type used as the parent of the slot type.

        @[JSON::Field(key: "parentSlotTypeSignature")]
        getter parent_slot_type_signature : String?

        # Configuration information that extends the parent built-in slot type.

        @[JSON::Field(key: "slotTypeConfigurations")]
        getter slot_type_configurations : Array(Types::SlotTypeConfiguration)?

        # The slot resolution strategy that Amazon Lex uses to determine the value of the slot. For more
        # information, see PutSlotType .

        @[JSON::Field(key: "valueSelectionStrategy")]
        getter value_selection_strategy : String?

        # The version of the slot type. For a new slot type, the version is always $LATEST .

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @checksum : String? = nil,
          @create_version : Bool? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @enumeration_values : Array(Types::EnumerationValue)? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @parent_slot_type_signature : String? = nil,
          @slot_type_configurations : Array(Types::SlotTypeConfiguration)? = nil,
          @value_selection_strategy : String? = nil,
          @version : String? = nil
        )
        end
      end

      # The resource that you are attempting to delete is referred to by another resource. Use this
      # information to remove references to the resource that you are trying to delete. The body of the
      # exception contains a JSON object that describes the resource. { "resourceType": BOT | BOTALIAS |
      # BOTCHANNEL | INTENT, "resourceReference": { "name": string , "version": string } }

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "exampleReference")]
        getter example_reference : Types::ResourceReference?


        @[JSON::Field(key: "referenceType")]
        getter reference_type : String?

        def initialize(
          @example_reference : Types::ResourceReference? = nil,
          @reference_type : String? = nil
        )
        end
      end

      # Describes the resource that refers to the resource that you are attempting to delete. This object is
      # returned as part of the ResourceInUseException exception.

      struct ResourceReference
        include JSON::Serializable

        # The name of the resource that is using the resource that you are trying to delete.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The version of the resource that is using the resource that you are trying to delete.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Identifies the version of a specific slot.

      struct Slot
        include JSON::Serializable

        # The name of the slot.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether the slot is required or optional.

        @[JSON::Field(key: "slotConstraint")]
        getter slot_constraint : String

        # A list of default values for the slot. Default values are used when Amazon Lex hasn't determined a
        # value for a slot. You can specify default values from context variables, session attributes, and
        # defined values.

        @[JSON::Field(key: "defaultValueSpec")]
        getter default_value_spec : Types::SlotDefaultValueSpec?

        # A description of the slot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Determines whether a slot is obfuscated in conversation logs and stored utterances. When you
        # obfuscate a slot, the value is replaced by the slot name in curly braces ({}). For example, if the
        # slot name is "full_name", obfuscated values are replaced with "{full_name}". For more information,
        # see Slot Obfuscation .

        @[JSON::Field(key: "obfuscationSetting")]
        getter obfuscation_setting : String?

        # Directs Amazon Lex the order in which to elicit this slot value from the user. For example, if the
        # intent has two slots with priorities 1 and 2, AWS Amazon Lex first elicits a value for the slot with
        # priority 1. If multiple slots share the same priority, the order in which Amazon Lex elicits values
        # is arbitrary.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # A set of possible responses for the slot type used by text-based clients. A user chooses an option
        # from the response card, instead of using text to reply.

        @[JSON::Field(key: "responseCard")]
        getter response_card : String?

        # If you know a specific pattern with which users might respond to an Amazon Lex request for a slot
        # value, you can provide those utterances to improve accuracy. This is optional. In most cases, Amazon
        # Lex is capable of understanding user utterances.

        @[JSON::Field(key: "sampleUtterances")]
        getter sample_utterances : Array(String)?

        # The type of the slot, either a custom slot type that you defined or one of the built-in slot types.

        @[JSON::Field(key: "slotType")]
        getter slot_type : String?

        # The version of the slot type.

        @[JSON::Field(key: "slotTypeVersion")]
        getter slot_type_version : String?

        # The prompt that Amazon Lex uses to elicit the slot value from the user.

        @[JSON::Field(key: "valueElicitationPrompt")]
        getter value_elicitation_prompt : Types::Prompt?

        def initialize(
          @name : String,
          @slot_constraint : String,
          @default_value_spec : Types::SlotDefaultValueSpec? = nil,
          @description : String? = nil,
          @obfuscation_setting : String? = nil,
          @priority : Int32? = nil,
          @response_card : String? = nil,
          @sample_utterances : Array(String)? = nil,
          @slot_type : String? = nil,
          @slot_type_version : String? = nil,
          @value_elicitation_prompt : Types::Prompt? = nil
        )
        end
      end

      # A default value for a slot.

      struct SlotDefaultValue
        include JSON::Serializable

        # The default value for the slot. You can specify one of the following: #context-name.slot-name - The
        # slot value "slot-name" in the context "context-name." {attribute} - The slot value of the session
        # attribute "attribute." 'value' - The discrete value "value."

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String

        def initialize(
          @default_value : String
        )
        end
      end

      # Contains the default values for a slot. Default values are used when Amazon Lex hasn't determined a
      # value for a slot.

      struct SlotDefaultValueSpec
        include JSON::Serializable

        # The default values for a slot. You can specify more than one default. For example, you can specify a
        # default value to use from a matching context variable, a session attribute, or a fixed value. The
        # default value chosen is selected based on the order that you specify them in the list. For example,
        # if you specify a context variable and a fixed value in that order, Amazon Lex uses the context
        # variable if it is available, else it uses the fixed value.

        @[JSON::Field(key: "defaultValueList")]
        getter default_value_list : Array(Types::SlotDefaultValue)

        def initialize(
          @default_value_list : Array(Types::SlotDefaultValue)
        )
        end
      end

      # Provides configuration information for a slot type.

      struct SlotTypeConfiguration
        include JSON::Serializable

        # A regular expression used to validate the value of a slot.

        @[JSON::Field(key: "regexConfiguration")]
        getter regex_configuration : Types::SlotTypeRegexConfiguration?

        def initialize(
          @regex_configuration : Types::SlotTypeRegexConfiguration? = nil
        )
        end
      end

      # Provides information about a slot type..

      struct SlotTypeMetadata
        include JSON::Serializable

        # The date that the slot type was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # A description of the slot type.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date that the slot type was updated. When you create a resource, the creation date and last
        # updated date are the same.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the slot type.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The version of the slot type.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @created_date : Time? = nil,
          @description : String? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Provides a regular expression used to validate the value of a slot.

      struct SlotTypeRegexConfiguration
        include JSON::Serializable

        # A regular expression used to validate the value of a slot. Use a standard regular expression. Amazon
        # Lex supports the following characters in the regular expression: A-Z, a-z 0-9 Unicode characters ("\
        # u&lt;Unicode&gt;") Represent Unicode characters with four digits, for example "\u0041" or "\u005A".
        # The following regular expression operators are not supported: Infinite repeaters: *, +, or {x,} with
        # no upper bound. Wild card (.)

        @[JSON::Field(key: "pattern")]
        getter pattern : String

        def initialize(
          @pattern : String
        )
        end
      end


      struct StartImportRequest
        include JSON::Serializable

        # Specifies the action that the StartImport operation should take when there is an existing resource
        # with the same name. FAIL_ON_CONFLICT - The import operation is stopped on the first conflict between
        # a resource in the import file and an existing resource. The name of the resource causing the
        # conflict is in the failureReason field of the response to the GetImport operation. OVERWRITE_LATEST
        # - The import operation proceeds even if there is a conflict with an existing resource. The $LASTEST
        # version of the existing resource is overwritten with the data from the import file.

        @[JSON::Field(key: "mergeStrategy")]
        getter merge_strategy : String

        # A zip archive in binary format. The archive should contain one file, a JSON file containing the
        # resource to import. The resource should match the type specified in the resourceType field.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes

        # Specifies the type of resource to export. Each resource also exports any resources that it depends
        # on. A bot exports dependent intents. An intent exports dependent slot types.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # A list of tags to add to the imported bot. You can only add tags when you import a bot, you can't
        # add tags to an intent or slot type.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @merge_strategy : String,
          @payload : Bytes,
          @resource_type : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartImportResponse
        include JSON::Serializable

        # A timestamp for the date and time that the import job was requested.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # The identifier for the specific import job.

        @[JSON::Field(key: "importId")]
        getter import_id : String?

        # The status of the import job. If the status is FAILED , you can get the reason for the failure using
        # the GetImport operation.

        @[JSON::Field(key: "importStatus")]
        getter import_status : String?

        # The action to take when there is a merge conflict.

        @[JSON::Field(key: "mergeStrategy")]
        getter merge_strategy : String?

        # The name given to the import job.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of resource to import.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # A list of tags added to the imported bot.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @created_date : Time? = nil,
          @import_id : String? = nil,
          @import_status : String? = nil,
          @merge_strategy : String? = nil,
          @name : String? = nil,
          @resource_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartMigrationRequest
        include JSON::Serializable

        # The strategy used to conduct the migration. CREATE_NEW - Creates a new Amazon Lex V2 bot and
        # migrates the Amazon Lex V1 bot to the new bot. UPDATE_EXISTING - Overwrites the existing Amazon Lex
        # V2 bot metadata and the locale being migrated. It doesn't change any other locales in the Amazon Lex
        # V2 bot. If the locale doesn't exist, a new locale is created in the Amazon Lex V2 bot.

        @[JSON::Field(key: "migrationStrategy")]
        getter migration_strategy : String

        # The name of the Amazon Lex V1 bot that you are migrating to Amazon Lex V2.

        @[JSON::Field(key: "v1BotName")]
        getter v1_bot_name : String

        # The version of the bot to migrate to Amazon Lex V2. You can migrate the $LATEST version as well as
        # any numbered version.

        @[JSON::Field(key: "v1BotVersion")]
        getter v1_bot_version : String

        # The name of the Amazon Lex V2 bot that you are migrating the Amazon Lex V1 bot to. If the Amazon Lex
        # V2 bot doesn't exist, you must use the CREATE_NEW migration strategy. If the Amazon Lex V2 bot
        # exists, you must use the UPDATE_EXISTING migration strategy to change the contents of the Amazon Lex
        # V2 bot.

        @[JSON::Field(key: "v2BotName")]
        getter v2_bot_name : String

        # The IAM role that Amazon Lex uses to run the Amazon Lex V2 bot.

        @[JSON::Field(key: "v2BotRole")]
        getter v2_bot_role : String

        def initialize(
          @migration_strategy : String,
          @v1_bot_name : String,
          @v1_bot_version : String,
          @v2_bot_name : String,
          @v2_bot_role : String
        )
        end
      end


      struct StartMigrationResponse
        include JSON::Serializable

        # The unique identifier that Amazon Lex assigned to the migration.

        @[JSON::Field(key: "migrationId")]
        getter migration_id : String?

        # The strategy used to conduct the migration.

        @[JSON::Field(key: "migrationStrategy")]
        getter migration_strategy : String?

        # The date and time that the migration started.

        @[JSON::Field(key: "migrationTimestamp")]
        getter migration_timestamp : Time?

        # The locale used for the Amazon Lex V1 bot.

        @[JSON::Field(key: "v1BotLocale")]
        getter v1_bot_locale : String?

        # The name of the Amazon Lex V1 bot that you are migrating to Amazon Lex V2.

        @[JSON::Field(key: "v1BotName")]
        getter v1_bot_name : String?

        # The version of the bot to migrate to Amazon Lex V2.

        @[JSON::Field(key: "v1BotVersion")]
        getter v1_bot_version : String?

        # The unique identifier for the Amazon Lex V2 bot.

        @[JSON::Field(key: "v2BotId")]
        getter v2_bot_id : String?

        # The IAM role that Amazon Lex uses to run the Amazon Lex V2 bot.

        @[JSON::Field(key: "v2BotRole")]
        getter v2_bot_role : String?

        def initialize(
          @migration_id : String? = nil,
          @migration_strategy : String? = nil,
          @migration_timestamp : Time? = nil,
          @v1_bot_locale : String? = nil,
          @v1_bot_name : String? = nil,
          @v1_bot_version : String? = nil,
          @v2_bot_id : String? = nil,
          @v2_bot_role : String? = nil
        )
        end
      end

      # A collection of messages that convey information to the user. At runtime, Amazon Lex selects the
      # message to convey.

      struct Statement
        include JSON::Serializable

        # A collection of message objects.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)

        # At runtime, if the client is using the PostText API, Amazon Lex includes the response card in the
        # response. It substitutes all of the session attributes and slot values for placeholders in the
        # response card.

        @[JSON::Field(key: "responseCard")]
        getter response_card : String?

        def initialize(
          @messages : Array(Types::Message),
          @response_card : String? = nil
        )
        end
      end

      # A list of key/value pairs that identify a bot, bot alias, or bot channel. Tag keys and values can
      # consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - @.

      struct Tag
        include JSON::Serializable

        # The key for the tag. Keys are not case-sensitive and must be unique.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value associated with a key. The value may be an empty string but it can't be null.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bot, bot alias, or bot channel to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag keys to add to the resource. If a tag key already exists, the existing value is
        # replaced with the new value.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove the tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag keys to remove from the resource. If a tag key does not exist on the resource, it is
        # ignored.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about a single utterance that was made to your bot.

      struct UtteranceData
        include JSON::Serializable

        # The number of times that the utterance was processed.

        @[JSON::Field(key: "count")]
        getter count : Int32?

        # The total number of individuals that used the utterance.

        @[JSON::Field(key: "distinctUsers")]
        getter distinct_users : Int32?

        # The date that the utterance was first recorded.

        @[JSON::Field(key: "firstUtteredDate")]
        getter first_uttered_date : Time?

        # The date that the utterance was last recorded.

        @[JSON::Field(key: "lastUtteredDate")]
        getter last_uttered_date : Time?

        # The text that was entered by the user or the text representation of an audio clip.

        @[JSON::Field(key: "utteranceString")]
        getter utterance_string : String?

        def initialize(
          @count : Int32? = nil,
          @distinct_users : Int32? = nil,
          @first_uttered_date : Time? = nil,
          @last_uttered_date : Time? = nil,
          @utterance_string : String? = nil
        )
        end
      end

      # Provides a list of utterances that have been made to a specific version of your bot. The list
      # contains a maximum of 100 utterances.

      struct UtteranceList
        include JSON::Serializable

        # The version of the bot that processed the list.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # One or more UtteranceData objects that contain information about the utterances that have been made
        # to a bot. The maximum number of object is 100.

        @[JSON::Field(key: "utterances")]
        getter utterances : Array(Types::UtteranceData)?

        def initialize(
          @bot_version : String? = nil,
          @utterances : Array(Types::UtteranceData)? = nil
        )
        end
      end
    end
  end
end
