require "json"

module AwsSdk
  module LexRuntimeService
    module Types

      # A context is a variable that contains information about the current state of the conversation
      # between a user and Amazon Lex. Context can be set automatically by Amazon Lex when an intent is
      # fulfilled, or it can be set at runtime using the PutContent , PutText , or PutSession operation.

      struct ActiveContext
        include JSON::Serializable

        # The name of the context.

        @[JSON::Field(key: "name")]
        getter name : String

        # State variables for the current context. You can use these values as default values for slots in
        # subsequent events.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)

        # The length of time or number of turns that a context remains active.

        @[JSON::Field(key: "timeToLive")]
        getter time_to_live : Types::ActiveContextTimeToLive

        def initialize(
          @name : String,
          @parameters : Hash(String, String),
          @time_to_live : Types::ActiveContextTimeToLive
        )
        end
      end

      # The length of time or number of turns that a context remains active.

      struct ActiveContextTimeToLive
        include JSON::Serializable

        # The number of seconds that the context should be active after it is first sent in a PostContent or
        # PostText response. You can set the value between 5 and 86,400 seconds (24 hours).

        @[JSON::Field(key: "timeToLiveInSeconds")]
        getter time_to_live_in_seconds : Int32?

        # The number of conversation turns that the context should be active. A conversation turn is one
        # PostContent or PostText request and the corresponding response from Amazon Lex.

        @[JSON::Field(key: "turnsToLive")]
        getter turns_to_live : Int32?

        def initialize(
          @time_to_live_in_seconds : Int32? = nil,
          @turns_to_live : Int32? = nil
        )
        end
      end

      # Either the Amazon Lex bot is still building, or one of the dependent services (Amazon Polly, AWS
      # Lambda) failed with an internal service error.

      struct BadGatewayException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Request validation failed, there is no usable message in the context, or the bot build failed, is
      # still in progress, or contains unbuilt changes.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents an option to be shown on the client platform (Facebook, Slack, etc.)

      struct Button
        include JSON::Serializable

        # Text that is visible to the user on the button.

        @[JSON::Field(key: "text")]
        getter text : String

        # The value sent to Amazon Lex when a user chooses the button. For example, consider button text
        # "NYC." When the user chooses the button, the value sent can be "New York City."

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @text : String,
          @value : String
        )
        end
      end

      # Two clients are using the same AWS account, Amazon Lex bot, and user ID.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteSessionRequest
        include JSON::Serializable

        # The alias in use for the bot that contains the session data.

        @[JSON::Field(key: "botAlias")]
        getter bot_alias : String

        # The name of the bot that contains the session data.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The identifier of the user associated with the session data.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @bot_alias : String,
          @bot_name : String,
          @user_id : String
        )
        end
      end


      struct DeleteSessionResponse
        include JSON::Serializable

        # The alias in use for the bot associated with the session data.

        @[JSON::Field(key: "botAlias")]
        getter bot_alias : String?

        # The name of the bot associated with the session data.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # The unique identifier for the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The ID of the client application user.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @bot_alias : String? = nil,
          @bot_name : String? = nil,
          @session_id : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # One of the dependencies, such as AWS Lambda or Amazon Polly, threw an exception. For example, If
      # Amazon Lex does not have sufficient permissions to call a Lambda function. If a Lambda function
      # takes longer than 30 seconds to execute. If a fulfillment Lambda function returns a Delegate dialog
      # action without removing any slot values.

      struct DependencyFailedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the next action that the bot should take in its interaction with the user and provides
      # information about the context in which the action takes place. Use the DialogAction data type to set
      # the interaction to a specific state, or to return the interaction to a previous state.

      struct DialogAction
        include JSON::Serializable

        # The next action that the bot should take in its interaction with the user. The possible values are:
        # ConfirmIntent - The next action is asking the user if the intent is complete and ready to be
        # fulfilled. This is a yes/no question such as "Place the order?" Close - Indicates that the there
        # will not be a response from the user. For example, the statement "Your order has been placed" does
        # not require a response. Delegate - The next action is determined by Amazon Lex. ElicitIntent - The
        # next action is to determine the intent that the user wants to fulfill. ElicitSlot - The next action
        # is to elicit a slot value from the user.

        @[JSON::Field(key: "type")]
        getter type : String

        # The fulfillment state of the intent. The possible values are: Failed - The Lambda function
        # associated with the intent failed to fulfill the intent. Fulfilled - The intent has fulfilled by the
        # Lambda function associated with the intent. ReadyForFulfillment - All of the information necessary
        # for the intent is present and the intent ready to be fulfilled by the client application.

        @[JSON::Field(key: "fulfillmentState")]
        getter fulfillment_state : String?

        # The name of the intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # The message that should be shown to the user. If you don't specify a message, Amazon Lex will use
        # the message configured for the intent.

        @[JSON::Field(key: "message")]
        getter message : String?

        # PlainText - The message contains plain UTF-8 text. CustomPayload - The message is a custom format
        # for the client. SSML - The message contains text formatted for voice output. Composite - The message
        # contains an escaped JSON object containing one or more messages. For more information, see Message
        # Groups .

        @[JSON::Field(key: "messageFormat")]
        getter message_format : String?

        # The name of the slot that should be elicited from the user.

        @[JSON::Field(key: "slotToElicit")]
        getter slot_to_elicit : String?

        # Map of the slots that have been gathered and their values.

        @[JSON::Field(key: "slots")]
        getter slots : Hash(String, String)?

        def initialize(
          @type : String,
          @fulfillment_state : String? = nil,
          @intent_name : String? = nil,
          @message : String? = nil,
          @message_format : String? = nil,
          @slot_to_elicit : String? = nil,
          @slots : Hash(String, String)? = nil
        )
        end
      end

      # Represents an option rendered to the user when a prompt is shown. It could be an image, a button, a
      # link, or text.

      struct GenericAttachment
        include JSON::Serializable

        # The URL of an attachment to the response card.

        @[JSON::Field(key: "attachmentLinkUrl")]
        getter attachment_link_url : String?

        # The list of options to show to the user.

        @[JSON::Field(key: "buttons")]
        getter buttons : Array(Types::Button)?

        # The URL of an image that is displayed to the user.

        @[JSON::Field(key: "imageUrl")]
        getter image_url : String?

        # The subtitle shown below the title.

        @[JSON::Field(key: "subTitle")]
        getter sub_title : String?

        # The title of the option.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @attachment_link_url : String? = nil,
          @buttons : Array(Types::Button)? = nil,
          @image_url : String? = nil,
          @sub_title : String? = nil,
          @title : String? = nil
        )
        end
      end


      struct GetSessionRequest
        include JSON::Serializable

        # The alias in use for the bot that contains the session data.

        @[JSON::Field(key: "botAlias")]
        getter bot_alias : String

        # The name of the bot that contains the session data.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The ID of the client application user. Amazon Lex uses this to identify a user's conversation with
        # your bot.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A string used to filter the intents returned in the recentIntentSummaryView structure. When you
        # specify a filter, only intents with their checkpointLabel field set to that string are returned.

        @[JSON::Field(key: "checkpointLabelFilter")]
        getter checkpoint_label_filter : String?

        def initialize(
          @bot_alias : String,
          @bot_name : String,
          @user_id : String,
          @checkpoint_label_filter : String? = nil
        )
        end
      end


      struct GetSessionResponse
        include JSON::Serializable

        # A list of active contexts for the session. A context can be set when an intent is fulfilled or by
        # calling the PostContent , PostText , or PutSession operation. You can use a context to control the
        # intents that can follow up an intent, or to modify the operation of your application.

        @[JSON::Field(key: "activeContexts")]
        getter active_contexts : Array(Types::ActiveContext)?

        # Describes the current state of the bot.

        @[JSON::Field(key: "dialogAction")]
        getter dialog_action : Types::DialogAction?

        # An array of information about the intents used in the session. The array can contain a maximum of
        # three summaries. If more than three intents are used in the session, the recentIntentSummaryView
        # operation contains information about the last three intents used. If you set the
        # checkpointLabelFilter parameter in the request, the array contains only the intents with the
        # specified label.

        @[JSON::Field(key: "recentIntentSummaryView")]
        getter recent_intent_summary_view : Array(Types::IntentSummary)?

        # Map of key/value pairs representing the session-specific context information. It contains
        # application information passed between Amazon Lex and a client application.

        @[JSON::Field(key: "sessionAttributes")]
        getter session_attributes : Hash(String, String)?

        # A unique identifier for the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @active_contexts : Array(Types::ActiveContext)? = nil,
          @dialog_action : Types::DialogAction? = nil,
          @recent_intent_summary_view : Array(Types::IntentSummary)? = nil,
          @session_attributes : Hash(String, String)? = nil,
          @session_id : String? = nil
        )
        end
      end

      # Provides a score that indicates the confidence that Amazon Lex has that an intent is the one that
      # satisfies the user's intent.

      struct IntentConfidence
        include JSON::Serializable

        # A score that indicates how confident Amazon Lex is that an intent satisfies the user's intent.
        # Ranges between 0.00 and 1.00. Higher scores indicate higher confidence.

        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @score : Float64? = nil
        )
        end
      end

      # Provides information about the state of an intent. You can use this information to get the current
      # state of an intent so that you can process the intent, or so that you can return the intent to its
      # previous state.

      struct IntentSummary
        include JSON::Serializable

        # The next action that the bot should take in its interaction with the user. The possible values are:
        # ConfirmIntent - The next action is asking the user if the intent is complete and ready to be
        # fulfilled. This is a yes/no question such as "Place the order?" Close - Indicates that the there
        # will not be a response from the user. For example, the statement "Your order has been placed" does
        # not require a response. ElicitIntent - The next action is to determine the intent that the user
        # wants to fulfill. ElicitSlot - The next action is to elicit a slot value from the user.

        @[JSON::Field(key: "dialogActionType")]
        getter dialog_action_type : String

        # A user-defined label that identifies a particular intent. You can use this label to return to a
        # previous intent. Use the checkpointLabelFilter parameter of the GetSessionRequest operation to
        # filter the intents returned by the operation to those with only the specified label.

        @[JSON::Field(key: "checkpointLabel")]
        getter checkpoint_label : String?

        # The status of the intent after the user responds to the confirmation prompt. If the user confirms
        # the intent, Amazon Lex sets this field to Confirmed . If the user denies the intent, Amazon Lex sets
        # this value to Denied . The possible values are: Confirmed - The user has responded "Yes" to the
        # confirmation prompt, confirming that the intent is complete and that it is ready to be fulfilled.
        # Denied - The user has responded "No" to the confirmation prompt. None - The user has never been
        # prompted for confirmation; or, the user was prompted but did not confirm or deny the prompt.

        @[JSON::Field(key: "confirmationStatus")]
        getter confirmation_status : String?

        # The fulfillment state of the intent. The possible values are: Failed - The Lambda function
        # associated with the intent failed to fulfill the intent. Fulfilled - The intent has fulfilled by the
        # Lambda function associated with the intent. ReadyForFulfillment - All of the information necessary
        # for the intent is present and the intent ready to be fulfilled by the client application.

        @[JSON::Field(key: "fulfillmentState")]
        getter fulfillment_state : String?

        # The name of the intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # The next slot to elicit from the user. If there is not slot to elicit, the field is blank.

        @[JSON::Field(key: "slotToElicit")]
        getter slot_to_elicit : String?

        # Map of the slots that have been gathered and their values.

        @[JSON::Field(key: "slots")]
        getter slots : Hash(String, String)?

        def initialize(
          @dialog_action_type : String,
          @checkpoint_label : String? = nil,
          @confirmation_status : String? = nil,
          @fulfillment_state : String? = nil,
          @intent_name : String? = nil,
          @slot_to_elicit : String? = nil,
          @slots : Hash(String, String)? = nil
        )
        end
      end

      # Internal service error. Retry the call.

      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exceeded a limit.

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

      # This exception is not used.

      struct LoopDetectedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The accept header in the request does not have a valid value.

      struct NotAcceptableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource (such as the Amazon Lex bot or an alias) that is referred to is not found.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PostContentRequest
        include JSON::Serializable

        # Alias of the Amazon Lex bot.

        @[JSON::Field(key: "botAlias")]
        getter bot_alias : String

        # Name of the Amazon Lex bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # You pass this value as the Content-Type HTTP header. Indicates the audio format or text. The header
        # value must start with one of the following prefixes: PCM format, audio data must be in little-endian
        # byte order. audio/l16; rate=16000; channels=1 audio/x-l16; sample-rate=16000; channel-count=1
        # audio/lpcm; sample-rate=8000; sample-size-bits=16; channel-count=1; is-big-endian=false Opus format
        # audio/x-cbr-opus-with-preamble; preamble-size=0; bit-rate=256000; frame-size-milliseconds=4 Text
        # format text/plain; charset=utf-8

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String

        # User input in PCM or Opus audio format or text format as described in the Content-Type HTTP header.
        # You can stream audio data to Amazon Lex or you can create a local buffer that captures all of the
        # audio data before sending. In general, you get better performance if you stream audio data rather
        # than buffering the data locally.

        @[JSON::Field(key: "inputStream")]
        getter input_stream : Bytes

        # The ID of the client application user. Amazon Lex uses this to identify a user's conversation with
        # your bot. At runtime, each request must contain the userID field. To decide the user ID to use for
        # your application, consider the following factors. The userID field must not contain any personally
        # identifiable information of the user, for example, name, personal identification numbers, or other
        # end user personal information. If you want a user to start a conversation on one device and continue
        # on another device, use a user-specific identifier. If you want the same user to be able to have two
        # independent conversations on two different devices, choose a device-specific identifier. A user
        # can't have two independent conversations with two different versions of the same bot. For example, a
        # user can't have a conversation with the PROD and BETA versions of the same bot. If you anticipate
        # that a user will need to have conversation with two different versions, for example, while testing,
        # include the bot alias in the user ID to separate the two conversations.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # You pass this value as the Accept HTTP header. The message Amazon Lex returns in the response can be
        # either text or speech based on the Accept HTTP header value in the request. If the value is
        # text/plain; charset=utf-8 , Amazon Lex returns text in the response. If the value begins with audio/
        # , Amazon Lex returns speech in the response. Amazon Lex uses Amazon Polly to generate the speech
        # (using the configuration you specified in the Accept header). For example, if you specify audio/mpeg
        # as the value, Amazon Lex returns speech in the MPEG format. If the value is audio/pcm , the speech
        # returned is audio/pcm in 16-bit, little endian format. The following are the accepted values:
        # audio/mpeg audio/ogg audio/pcm text/plain; charset=utf-8 audio/* (defaults to mpeg)

        @[JSON::Field(key: "Accept")]
        getter accept : String?

        # A list of contexts active for the request. A context can be activated when a previous intent is
        # fulfilled, or by including the context in the request, If you don't specify a list of contexts,
        # Amazon Lex will use the current list of contexts for the session. If you specify an empty list, all
        # contexts for the session are cleared.

        @[JSON::Field(key: "x-amz-lex-active-contexts")]
        getter active_contexts : String?

        # You pass this value as the x-amz-lex-request-attributes HTTP header. Request-specific information
        # passed between Amazon Lex and a client application. The value must be a JSON serialized and base64
        # encoded map with string keys and values. The total size of the requestAttributes and
        # sessionAttributes headers is limited to 12 KB. The namespace x-amz-lex: is reserved for special
        # attributes. Don't create any request attributes with the prefix x-amz-lex: . For more information,
        # see Setting Request Attributes .

        @[JSON::Field(key: "x-amz-lex-request-attributes")]
        getter request_attributes : String?

        # You pass this value as the x-amz-lex-session-attributes HTTP header. Application-specific
        # information passed between Amazon Lex and a client application. The value must be a JSON serialized
        # and base64 encoded map with string keys and values. The total size of the sessionAttributes and
        # requestAttributes headers is limited to 12 KB. For more information, see Setting Session Attributes
        # .

        @[JSON::Field(key: "x-amz-lex-session-attributes")]
        getter session_attributes : String?

        def initialize(
          @bot_alias : String,
          @bot_name : String,
          @content_type : String,
          @input_stream : Bytes,
          @user_id : String,
          @accept : String? = nil,
          @active_contexts : String? = nil,
          @request_attributes : String? = nil,
          @session_attributes : String? = nil
        )
        end
      end


      struct PostContentResponse
        include JSON::Serializable

        # A list of active contexts for the session. A context can be set when an intent is fulfilled or by
        # calling the PostContent , PostText , or PutSession operation. You can use a context to control the
        # intents that can follow up an intent, or to modify the operation of your application.

        @[JSON::Field(key: "x-amz-lex-active-contexts")]
        getter active_contexts : String?

        # One to four alternative intents that may be applicable to the user's intent. Each alternative
        # includes a score that indicates how confident Amazon Lex is that the intent matches the user's
        # intent. The intents are sorted by the confidence score.

        @[JSON::Field(key: "x-amz-lex-alternative-intents")]
        getter alternative_intents : String?

        # The prompt (or statement) to convey to the user. This is based on the bot configuration and context.
        # For example, if Amazon Lex did not understand the user intent, it sends the clarificationPrompt
        # configured for the bot. If the intent requires confirmation before taking the fulfillment action, it
        # sends the confirmationPrompt . Another example: Suppose that the Lambda function successfully
        # fulfilled the intent, and sent a message to convey to the user. Then Amazon Lex sends that message
        # in the response.

        @[JSON::Field(key: "audioStream")]
        getter audio_stream : Bytes?

        # The version of the bot that responded to the conversation. You can use this information to help
        # determine if one version of a bot is performing better than another version.

        @[JSON::Field(key: "x-amz-lex-bot-version")]
        getter bot_version : String?

        # Content type as specified in the Accept HTTP header in the request.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Identifies the current state of the user interaction. Amazon Lex returns one of the following values
        # as dialogState . The client can optionally use this information to customize the user interface.
        # ElicitIntent - Amazon Lex wants to elicit the user's intent. Consider the following examples: For
        # example, a user might utter an intent ("I want to order a pizza"). If Amazon Lex cannot infer the
        # user intent from this utterance, it will return this dialog state. ConfirmIntent - Amazon Lex is
        # expecting a "yes" or "no" response. For example, Amazon Lex wants user confirmation before
        # fulfilling an intent. Instead of a simple "yes" or "no" response, a user might respond with
        # additional information. For example, "yes, but make it a thick crust pizza" or "no, I want to order
        # a drink." Amazon Lex can process such additional information (in these examples, update the crust
        # type slot or change the intent from OrderPizza to OrderDrink). ElicitSlot - Amazon Lex is expecting
        # the value of a slot for the current intent. For example, suppose that in the response Amazon Lex
        # sends this message: "What size pizza would you like?". A user might reply with the slot value (e.g.,
        # "medium"). The user might also provide additional information in the response (e.g., "medium thick
        # crust pizza"). Amazon Lex can process such additional information appropriately. Fulfilled - Conveys
        # that the Lambda function has successfully fulfilled the intent. ReadyForFulfillment - Conveys that
        # the client has to fulfill the request. Failed - Conveys that the conversation with the user failed.
        # This can happen for various reasons, including that the user does not provide an appropriate
        # response to prompts from the service (you can configure how many times Amazon Lex can prompt a user
        # for specific information), or if the Lambda function fails to fulfill the intent.

        @[JSON::Field(key: "x-amz-lex-dialog-state")]
        getter dialog_state : String?

        # The text used to process the request. If the input was an audio stream, the encodedInputTranscript
        # field contains the text extracted from the audio stream. This is the text that is actually processed
        # to recognize intents and slot values. You can use this information to determine if Amazon Lex is
        # correctly processing the audio that you send. The encodedInputTranscript field is base-64 encoded.
        # You must decode the field before you can use the value.

        @[JSON::Field(key: "x-amz-lex-encoded-input-transcript")]
        getter encoded_input_transcript : String?

        # The message to convey to the user. The message can come from the bot's configuration or from a
        # Lambda function. If the intent is not configured with a Lambda function, or if the Lambda function
        # returned Delegate as the dialogAction.type in its response, Amazon Lex decides on the next course of
        # action and selects an appropriate message from the bot's configuration based on the current
        # interaction context. For example, if Amazon Lex isn't able to understand user input, it uses a
        # clarification prompt message. When you create an intent you can assign messages to groups. When
        # messages are assigned to groups Amazon Lex returns one message from each group in the response. The
        # message field is an escaped JSON string containing the messages. For more information about the
        # structure of the JSON string returned, see msg-prompts-formats . If the Lambda function returns a
        # message, Amazon Lex passes it to the client in its response. The encodedMessage field is base-64
        # encoded. You must decode the field before you can use the value.

        @[JSON::Field(key: "x-amz-lex-encoded-message")]
        getter encoded_message : String?

        # The text used to process the request. You can use this field only in the de-DE, en-AU, en-GB, en-US,
        # es-419, es-ES, es-US, fr-CA, fr-FR, and it-IT locales. In all other locales, the inputTranscript
        # field is null. You should use the encodedInputTranscript field instead. If the input was an audio
        # stream, the inputTranscript field contains the text extracted from the audio stream. This is the
        # text that is actually processed to recognize intents and slot values. You can use this information
        # to determine if Amazon Lex is correctly processing the audio that you send.

        @[JSON::Field(key: "x-amz-lex-input-transcript")]
        getter input_transcript : String?

        # Current user intent that Amazon Lex is aware of.

        @[JSON::Field(key: "x-amz-lex-intent-name")]
        getter intent_name : String?

        # You can only use this field in the de-DE, en-AU, en-GB, en-US, es-419, es-ES, es-US, fr-CA, fr-FR,
        # and it-IT locales. In all other locales, the message field is null. You should use the
        # encodedMessage field instead. The message to convey to the user. The message can come from the bot's
        # configuration or from a Lambda function. If the intent is not configured with a Lambda function, or
        # if the Lambda function returned Delegate as the dialogAction.type in its response, Amazon Lex
        # decides on the next course of action and selects an appropriate message from the bot's configuration
        # based on the current interaction context. For example, if Amazon Lex isn't able to understand user
        # input, it uses a clarification prompt message. When you create an intent you can assign messages to
        # groups. When messages are assigned to groups Amazon Lex returns one message from each group in the
        # response. The message field is an escaped JSON string containing the messages. For more information
        # about the structure of the JSON string returned, see msg-prompts-formats . If the Lambda function
        # returns a message, Amazon Lex passes it to the client in its response.

        @[JSON::Field(key: "x-amz-lex-message")]
        getter message : String?

        # The format of the response message. One of the following values: PlainText - The message contains
        # plain UTF-8 text. CustomPayload - The message is a custom format for the client. SSML - The message
        # contains text formatted for voice output. Composite - The message contains an escaped JSON object
        # containing one or more messages from the groups that messages were assigned to when the intent was
        # created.

        @[JSON::Field(key: "x-amz-lex-message-format")]
        getter message_format : String?

        # Provides a score that indicates how confident Amazon Lex is that the returned intent is the one that
        # matches the user's intent. The score is between 0.0 and 1.0. The score is a relative score, not an
        # absolute score. The score may change based on improvements to Amazon Lex.

        @[JSON::Field(key: "x-amz-lex-nlu-intent-confidence")]
        getter nlu_intent_confidence : String?

        # The sentiment expressed in an utterance. When the bot is configured to send utterances to Amazon
        # Comprehend for sentiment analysis, this field contains the result of the analysis.

        @[JSON::Field(key: "x-amz-lex-sentiment")]
        getter sentiment_response : String?

        # Map of key/value pairs representing the session-specific context information.

        @[JSON::Field(key: "x-amz-lex-session-attributes")]
        getter session_attributes : String?

        # The unique identifier for the session.

        @[JSON::Field(key: "x-amz-lex-session-id")]
        getter session_id : String?

        # If the dialogState value is ElicitSlot , returns the name of the slot for which Amazon Lex is
        # eliciting a value.

        @[JSON::Field(key: "x-amz-lex-slot-to-elicit")]
        getter slot_to_elicit : String?

        # Map of zero or more intent slots (name/value pairs) Amazon Lex detected from the user input during
        # the conversation. The field is base-64 encoded. Amazon Lex creates a resolution list containing
        # likely values for a slot. The value that it returns is determined by the valueSelectionStrategy
        # selected when the slot type was created or updated. If valueSelectionStrategy is set to
        # ORIGINAL_VALUE , the value provided by the user is returned, if the user value is similar to the
        # slot values. If valueSelectionStrategy is set to TOP_RESOLUTION Amazon Lex returns the first value
        # in the resolution list or, if there is no resolution list, null. If you don't specify a
        # valueSelectionStrategy , the default is ORIGINAL_VALUE .

        @[JSON::Field(key: "x-amz-lex-slots")]
        getter slots : String?

        def initialize(
          @active_contexts : String? = nil,
          @alternative_intents : String? = nil,
          @audio_stream : Bytes? = nil,
          @bot_version : String? = nil,
          @content_type : String? = nil,
          @dialog_state : String? = nil,
          @encoded_input_transcript : String? = nil,
          @encoded_message : String? = nil,
          @input_transcript : String? = nil,
          @intent_name : String? = nil,
          @message : String? = nil,
          @message_format : String? = nil,
          @nlu_intent_confidence : String? = nil,
          @sentiment_response : String? = nil,
          @session_attributes : String? = nil,
          @session_id : String? = nil,
          @slot_to_elicit : String? = nil,
          @slots : String? = nil
        )
        end
      end


      struct PostTextRequest
        include JSON::Serializable

        # The alias of the Amazon Lex bot.

        @[JSON::Field(key: "botAlias")]
        getter bot_alias : String

        # The name of the Amazon Lex bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The text that the user entered (Amazon Lex interprets this text).

        @[JSON::Field(key: "inputText")]
        getter input_text : String

        # The ID of the client application user. Amazon Lex uses this to identify a user's conversation with
        # your bot. At runtime, each request must contain the userID field. To decide the user ID to use for
        # your application, consider the following factors. The userID field must not contain any personally
        # identifiable information of the user, for example, name, personal identification numbers, or other
        # end user personal information. If you want a user to start a conversation on one device and continue
        # on another device, use a user-specific identifier. If you want the same user to be able to have two
        # independent conversations on two different devices, choose a device-specific identifier. A user
        # can't have two independent conversations with two different versions of the same bot. For example, a
        # user can't have a conversation with the PROD and BETA versions of the same bot. If you anticipate
        # that a user will need to have conversation with two different versions, for example, while testing,
        # include the bot alias in the user ID to separate the two conversations.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A list of contexts active for the request. A context can be activated when a previous intent is
        # fulfilled, or by including the context in the request, If you don't specify a list of contexts,
        # Amazon Lex will use the current list of contexts for the session. If you specify an empty list, all
        # contexts for the session are cleared.

        @[JSON::Field(key: "activeContexts")]
        getter active_contexts : Array(Types::ActiveContext)?

        # Request-specific information passed between Amazon Lex and a client application. The namespace
        # x-amz-lex: is reserved for special attributes. Don't create any request attributes with the prefix
        # x-amz-lex: . For more information, see Setting Request Attributes .

        @[JSON::Field(key: "requestAttributes")]
        getter request_attributes : Hash(String, String)?

        # Application-specific information passed between Amazon Lex and a client application. For more
        # information, see Setting Session Attributes .

        @[JSON::Field(key: "sessionAttributes")]
        getter session_attributes : Hash(String, String)?

        def initialize(
          @bot_alias : String,
          @bot_name : String,
          @input_text : String,
          @user_id : String,
          @active_contexts : Array(Types::ActiveContext)? = nil,
          @request_attributes : Hash(String, String)? = nil,
          @session_attributes : Hash(String, String)? = nil
        )
        end
      end


      struct PostTextResponse
        include JSON::Serializable

        # A list of active contexts for the session. A context can be set when an intent is fulfilled or by
        # calling the PostContent , PostText , or PutSession operation. You can use a context to control the
        # intents that can follow up an intent, or to modify the operation of your application.

        @[JSON::Field(key: "activeContexts")]
        getter active_contexts : Array(Types::ActiveContext)?

        # One to four alternative intents that may be applicable to the user's intent. Each alternative
        # includes a score that indicates how confident Amazon Lex is that the intent matches the user's
        # intent. The intents are sorted by the confidence score.

        @[JSON::Field(key: "alternativeIntents")]
        getter alternative_intents : Array(Types::PredictedIntent)?

        # The version of the bot that responded to the conversation. You can use this information to help
        # determine if one version of a bot is performing better than another version.

        @[JSON::Field(key: "botVersion")]
        getter bot_version : String?

        # Identifies the current state of the user interaction. Amazon Lex returns one of the following values
        # as dialogState . The client can optionally use this information to customize the user interface.
        # ElicitIntent - Amazon Lex wants to elicit user intent. For example, a user might utter an intent ("I
        # want to order a pizza"). If Amazon Lex cannot infer the user intent from this utterance, it will
        # return this dialogState. ConfirmIntent - Amazon Lex is expecting a "yes" or "no" response. For
        # example, Amazon Lex wants user confirmation before fulfilling an intent. Instead of a simple "yes"
        # or "no," a user might respond with additional information. For example, "yes, but make it thick
        # crust pizza" or "no, I want to order a drink". Amazon Lex can process such additional information
        # (in these examples, update the crust type slot value, or change intent from OrderPizza to
        # OrderDrink). ElicitSlot - Amazon Lex is expecting a slot value for the current intent. For example,
        # suppose that in the response Amazon Lex sends this message: "What size pizza would you like?". A
        # user might reply with the slot value (e.g., "medium"). The user might also provide additional
        # information in the response (e.g., "medium thick crust pizza"). Amazon Lex can process such
        # additional information appropriately. Fulfilled - Conveys that the Lambda function configured for
        # the intent has successfully fulfilled the intent. ReadyForFulfillment - Conveys that the client has
        # to fulfill the intent. Failed - Conveys that the conversation with the user failed. This can happen
        # for various reasons including that the user did not provide an appropriate response to prompts from
        # the service (you can configure how many times Amazon Lex can prompt a user for specific
        # information), or the Lambda function failed to fulfill the intent.

        @[JSON::Field(key: "dialogState")]
        getter dialog_state : String?

        # The current user intent that Amazon Lex is aware of.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # The message to convey to the user. The message can come from the bot's configuration or from a
        # Lambda function. If the intent is not configured with a Lambda function, or if the Lambda function
        # returned Delegate as the dialogAction.type its response, Amazon Lex decides on the next course of
        # action and selects an appropriate message from the bot's configuration based on the current
        # interaction context. For example, if Amazon Lex isn't able to understand user input, it uses a
        # clarification prompt message. When you create an intent you can assign messages to groups. When
        # messages are assigned to groups Amazon Lex returns one message from each group in the response. The
        # message field is an escaped JSON string containing the messages. For more information about the
        # structure of the JSON string returned, see msg-prompts-formats . If the Lambda function returns a
        # message, Amazon Lex passes it to the client in its response.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The format of the response message. One of the following values: PlainText - The message contains
        # plain UTF-8 text. CustomPayload - The message is a custom format defined by the Lambda function.
        # SSML - The message contains text formatted for voice output. Composite - The message contains an
        # escaped JSON object containing one or more messages from the groups that messages were assigned to
        # when the intent was created.

        @[JSON::Field(key: "messageFormat")]
        getter message_format : String?

        # Provides a score that indicates how confident Amazon Lex is that the returned intent is the one that
        # matches the user's intent. The score is between 0.0 and 1.0. For more information, see Confidence
        # Scores . The score is a relative score, not an absolute score. The score may change based on
        # improvements to Amazon Lex.

        @[JSON::Field(key: "nluIntentConfidence")]
        getter nlu_intent_confidence : Types::IntentConfidence?

        # Represents the options that the user has to respond to the current prompt. Response Card can come
        # from the bot configuration (in the Amazon Lex console, choose the settings button next to a slot) or
        # from a code hook (Lambda function).

        @[JSON::Field(key: "responseCard")]
        getter response_card : Types::ResponseCard?

        # The sentiment expressed in and utterance. When the bot is configured to send utterances to Amazon
        # Comprehend for sentiment analysis, this field contains the result of the analysis.

        @[JSON::Field(key: "sentimentResponse")]
        getter sentiment_response : Types::SentimentResponse?

        # A map of key-value pairs representing the session-specific context information.

        @[JSON::Field(key: "sessionAttributes")]
        getter session_attributes : Hash(String, String)?

        # A unique identifier for the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # If the dialogState value is ElicitSlot , returns the name of the slot for which Amazon Lex is
        # eliciting a value.

        @[JSON::Field(key: "slotToElicit")]
        getter slot_to_elicit : String?

        # The intent slots that Amazon Lex detected from the user input in the conversation. Amazon Lex
        # creates a resolution list containing likely values for a slot. The value that it returns is
        # determined by the valueSelectionStrategy selected when the slot type was created or updated. If
        # valueSelectionStrategy is set to ORIGINAL_VALUE , the value provided by the user is returned, if the
        # user value is similar to the slot values. If valueSelectionStrategy is set to TOP_RESOLUTION Amazon
        # Lex returns the first value in the resolution list or, if there is no resolution list, null. If you
        # don't specify a valueSelectionStrategy , the default is ORIGINAL_VALUE .

        @[JSON::Field(key: "slots")]
        getter slots : Hash(String, String)?

        def initialize(
          @active_contexts : Array(Types::ActiveContext)? = nil,
          @alternative_intents : Array(Types::PredictedIntent)? = nil,
          @bot_version : String? = nil,
          @dialog_state : String? = nil,
          @intent_name : String? = nil,
          @message : String? = nil,
          @message_format : String? = nil,
          @nlu_intent_confidence : Types::IntentConfidence? = nil,
          @response_card : Types::ResponseCard? = nil,
          @sentiment_response : Types::SentimentResponse? = nil,
          @session_attributes : Hash(String, String)? = nil,
          @session_id : String? = nil,
          @slot_to_elicit : String? = nil,
          @slots : Hash(String, String)? = nil
        )
        end
      end

      # An intent that Amazon Lex suggests satisfies the user's intent. Includes the name of the intent, the
      # confidence that Amazon Lex has that the user's intent is satisfied, and the slots defined for the
      # intent.

      struct PredictedIntent
        include JSON::Serializable

        # The name of the intent that Amazon Lex suggests satisfies the user's intent.

        @[JSON::Field(key: "intentName")]
        getter intent_name : String?

        # Indicates how confident Amazon Lex is that an intent satisfies the user's intent.

        @[JSON::Field(key: "nluIntentConfidence")]
        getter nlu_intent_confidence : Types::IntentConfidence?

        # The slot and slot values associated with the predicted intent.

        @[JSON::Field(key: "slots")]
        getter slots : Hash(String, String)?

        def initialize(
          @intent_name : String? = nil,
          @nlu_intent_confidence : Types::IntentConfidence? = nil,
          @slots : Hash(String, String)? = nil
        )
        end
      end


      struct PutSessionRequest
        include JSON::Serializable

        # The alias in use for the bot that contains the session data.

        @[JSON::Field(key: "botAlias")]
        getter bot_alias : String

        # The name of the bot that contains the session data.

        @[JSON::Field(key: "botName")]
        getter bot_name : String

        # The ID of the client application user. Amazon Lex uses this to identify a user's conversation with
        # your bot.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The message that Amazon Lex returns in the response can be either text or speech based depending on
        # the value of this field. If the value is text/plain; charset=utf-8 , Amazon Lex returns text in the
        # response. If the value begins with audio/ , Amazon Lex returns speech in the response. Amazon Lex
        # uses Amazon Polly to generate the speech in the configuration that you specify. For example, if you
        # specify audio/mpeg as the value, Amazon Lex returns speech in the MPEG format. If the value is
        # audio/pcm , the speech is returned as audio/pcm in 16-bit, little endian format. The following are
        # the accepted values: audio/mpeg audio/ogg audio/pcm audio/* (defaults to mpeg) text/plain;
        # charset=utf-8

        @[JSON::Field(key: "Accept")]
        getter accept : String?

        # A list of contexts active for the request. A context can be activated when a previous intent is
        # fulfilled, or by including the context in the request, If you don't specify a list of contexts,
        # Amazon Lex will use the current list of contexts for the session. If you specify an empty list, all
        # contexts for the session are cleared.

        @[JSON::Field(key: "activeContexts")]
        getter active_contexts : Array(Types::ActiveContext)?

        # Sets the next action that the bot should take to fulfill the conversation.

        @[JSON::Field(key: "dialogAction")]
        getter dialog_action : Types::DialogAction?

        # A summary of the recent intents for the bot. You can use the intent summary view to set a checkpoint
        # label on an intent and modify attributes of intents. You can also use it to remove or add intent
        # summary objects to the list. An intent that you modify or add to the list must make sense for the
        # bot. For example, the intent name must be valid for the bot. You must provide valid values for:
        # intentName slot names slotToElict If you send the recentIntentSummaryView parameter in a PutSession
        # request, the contents of the new summary view replaces the old summary view. For example, if a
        # GetSession request returns three intents in the summary view and you call PutSession with one intent
        # in the summary view, the next call to GetSession will only return one intent.

        @[JSON::Field(key: "recentIntentSummaryView")]
        getter recent_intent_summary_view : Array(Types::IntentSummary)?

        # Map of key/value pairs representing the session-specific context information. It contains
        # application information passed between Amazon Lex and a client application.

        @[JSON::Field(key: "sessionAttributes")]
        getter session_attributes : Hash(String, String)?

        def initialize(
          @bot_alias : String,
          @bot_name : String,
          @user_id : String,
          @accept : String? = nil,
          @active_contexts : Array(Types::ActiveContext)? = nil,
          @dialog_action : Types::DialogAction? = nil,
          @recent_intent_summary_view : Array(Types::IntentSummary)? = nil,
          @session_attributes : Hash(String, String)? = nil
        )
        end
      end


      struct PutSessionResponse
        include JSON::Serializable

        # A list of active contexts for the session.

        @[JSON::Field(key: "x-amz-lex-active-contexts")]
        getter active_contexts : String?

        # The audio version of the message to convey to the user.

        @[JSON::Field(key: "audioStream")]
        getter audio_stream : Bytes?

        # Content type as specified in the Accept HTTP header in the request.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # ConfirmIntent - Amazon Lex is expecting a "yes" or "no" response to confirm the intent before
        # fulfilling an intent. ElicitIntent - Amazon Lex wants to elicit the user's intent. ElicitSlot -
        # Amazon Lex is expecting the value of a slot for the current intent. Failed - Conveys that the
        # conversation with the user has failed. This can happen for various reasons, including the user does
        # not provide an appropriate response to prompts from the service, or if the Lambda function fails to
        # fulfill the intent. Fulfilled - Conveys that the Lambda function has sucessfully fulfilled the
        # intent. ReadyForFulfillment - Conveys that the client has to fulfill the intent.

        @[JSON::Field(key: "x-amz-lex-dialog-state")]
        getter dialog_state : String?

        # The next message that should be presented to the user. The encodedMessage field is base-64 encoded.
        # You must decode the field before you can use the value.

        @[JSON::Field(key: "x-amz-lex-encoded-message")]
        getter encoded_message : String?

        # The name of the current intent.

        @[JSON::Field(key: "x-amz-lex-intent-name")]
        getter intent_name : String?

        # The next message that should be presented to the user. You can only use this field in the de-DE,
        # en-AU, en-GB, en-US, es-419, es-ES, es-US, fr-CA, fr-FR, and it-IT locales. In all other locales,
        # the message field is null. You should use the encodedMessage field instead.

        @[JSON::Field(key: "x-amz-lex-message")]
        getter message : String?

        # The format of the response message. One of the following values: PlainText - The message contains
        # plain UTF-8 text. CustomPayload - The message is a custom format for the client. SSML - The message
        # contains text formatted for voice output. Composite - The message contains an escaped JSON object
        # containing one or more messages from the groups that messages were assigned to when the intent was
        # created.

        @[JSON::Field(key: "x-amz-lex-message-format")]
        getter message_format : String?

        # Map of key/value pairs representing session-specific context information.

        @[JSON::Field(key: "x-amz-lex-session-attributes")]
        getter session_attributes : String?

        # A unique identifier for the session.

        @[JSON::Field(key: "x-amz-lex-session-id")]
        getter session_id : String?

        # If the dialogState is ElicitSlot , returns the name of the slot for which Amazon Lex is eliciting a
        # value.

        @[JSON::Field(key: "x-amz-lex-slot-to-elicit")]
        getter slot_to_elicit : String?

        # Map of zero or more intent slots Amazon Lex detected from the user input during the conversation.
        # Amazon Lex creates a resolution list containing likely values for a slot. The value that it returns
        # is determined by the valueSelectionStrategy selected when the slot type was created or updated. If
        # valueSelectionStrategy is set to ORIGINAL_VALUE , the value provided by the user is returned, if the
        # user value is similar to the slot values. If valueSelectionStrategy is set to TOP_RESOLUTION Amazon
        # Lex returns the first value in the resolution list or, if there is no resolution list, null. If you
        # don't specify a valueSelectionStrategy the default is ORIGINAL_VALUE .

        @[JSON::Field(key: "x-amz-lex-slots")]
        getter slots : String?

        def initialize(
          @active_contexts : String? = nil,
          @audio_stream : Bytes? = nil,
          @content_type : String? = nil,
          @dialog_state : String? = nil,
          @encoded_message : String? = nil,
          @intent_name : String? = nil,
          @message : String? = nil,
          @message_format : String? = nil,
          @session_attributes : String? = nil,
          @session_id : String? = nil,
          @slot_to_elicit : String? = nil,
          @slots : String? = nil
        )
        end
      end

      # The input speech is too long.

      struct RequestTimeoutException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # If you configure a response card when creating your bots, Amazon Lex substitutes the session
      # attributes and slot values that are available, and then returns it. The response card can also come
      # from a Lambda function ( dialogCodeHook and fulfillmentActivity on an intent).

      struct ResponseCard
        include JSON::Serializable

        # The content type of the response.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # An array of attachment objects representing options.

        @[JSON::Field(key: "genericAttachments")]
        getter generic_attachments : Array(Types::GenericAttachment)?

        # The version of the response card format.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @content_type : String? = nil,
          @generic_attachments : Array(Types::GenericAttachment)? = nil,
          @version : String? = nil
        )
        end
      end

      # The sentiment expressed in an utterance. When the bot is configured to send utterances to Amazon
      # Comprehend for sentiment analysis, this field structure contains the result of the analysis.

      struct SentimentResponse
        include JSON::Serializable

        # The inferred sentiment that Amazon Comprehend has the highest confidence in.

        @[JSON::Field(key: "sentimentLabel")]
        getter sentiment_label : String?

        # The likelihood that the sentiment was correctly inferred.

        @[JSON::Field(key: "sentimentScore")]
        getter sentiment_score : String?

        def initialize(
          @sentiment_label : String? = nil,
          @sentiment_score : String? = nil
        )
        end
      end

      # The Content-Type header ( PostContent API) has an invalid value.

      struct UnsupportedMediaTypeException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
