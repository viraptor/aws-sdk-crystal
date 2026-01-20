require "json"

module Aws
  module LexRuntimeV2
    module Types


      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains information about the contexts that a user is using in a session. You can configure Amazon
      # Lex V2 to set a context when an intent is fulfilled, or you can set a context using the , , or
      # operations. Use a context to indicate to Amazon Lex V2 intents that should be used as follow-up
      # intents. For example, if the active context is order-fulfilled , only intents that have
      # order-fulfilled configured as a trigger are considered for follow up.

      struct ActiveContext
        include JSON::Serializable

        # A list of contexts active for the request. A context can be activated when a previous intent is
        # fulfilled, or by including the context in the request. If you don't specify a list of contexts,
        # Amazon Lex V2 will use the current list of contexts for the session. If you specify an empty list,
        # all contexts for the session are cleared.

        @[JSON::Field(key: "contextAttributes")]
        getter context_attributes : Hash(String, String)

        # The name of the context.

        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates the number of turns or seconds that the context is active. Once the time to live expires,
        # the context is no longer returned in a response.

        @[JSON::Field(key: "timeToLive")]
        getter time_to_live : Types::ActiveContextTimeToLive

        def initialize(
          @context_attributes : Hash(String, String),
          @name : String,
          @time_to_live : Types::ActiveContextTimeToLive
        )
        end
      end

      # The time that a context is active. You can specify the time to live in seconds or in conversation
      # turns.

      struct ActiveContextTimeToLive
        include JSON::Serializable

        # The number of seconds that the context is active. You can specify between 5 and 86400 seconds (24
        # hours).

        @[JSON::Field(key: "timeToLiveInSeconds")]
        getter time_to_live_in_seconds : Int32

        # The number of turns that the context is active. You can specify up to 20 turns. Each request and
        # response from the bot is a turn.

        @[JSON::Field(key: "turnsToLive")]
        getter turns_to_live : Int32

        def initialize(
          @time_to_live_in_seconds : Int32,
          @turns_to_live : Int32
        )
        end
      end

      # Represents a chunk of audio sent from the client application to Amazon Lex V2. The audio is all or
      # part of an utterance from the user. Amazon Lex V2 accumulates audio chunks until it recognizes a
      # natural pause in speech before processing the input.

      struct AudioInputEvent
        include JSON::Serializable

        # The encoding used for the audio chunk. You must use 8 KHz PCM 16-bit mono-channel little-endian
        # format. The value of the field should be: audio/lpcm; sample-rate=8000; sample-size-bits=16;
        # channel-count=1; is-big-endian=false

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # An encoded stream of audio.

        @[JSON::Field(key: "audioChunk")]
        getter audio_chunk : Bytes?

        # A timestamp set by the client of the date and time that the event was sent to Amazon Lex V2.

        @[JSON::Field(key: "clientTimestampMillis")]
        getter client_timestamp_millis : Int64?

        # A unique identifier that your application assigns to the event. You can use this to identify events
        # in logs.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        def initialize(
          @content_type : String,
          @audio_chunk : Bytes? = nil,
          @client_timestamp_millis : Int64? = nil,
          @event_id : String? = nil
        )
        end
      end

      # An event sent from Amazon Lex V2 to your client application containing audio to play to the user.

      struct AudioResponseEvent
        include JSON::Serializable

        # A chunk of the audio to play.

        @[JSON::Field(key: "audioChunk")]
        getter audio_chunk : Bytes?

        # The encoding of the audio chunk. This is the same as the encoding configure in the contentType field
        # of the ConfigurationEvent .

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # A unique identifier of the event sent by Amazon Lex V2. The identifier is in the form RESPONSE-N ,
        # where N is a number starting with one and incremented for each event sent by Amazon Lex V2 in the
        # current session.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        def initialize(
          @audio_chunk : Bytes? = nil,
          @content_type : String? = nil,
          @event_id : String? = nil
        )
        end
      end


      struct BadGatewayException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A button that appears on a response card show to the user.

      struct Button
        include JSON::Serializable

        # The text that is displayed on the button.

        @[JSON::Field(key: "text")]
        getter text : String

        # The value returned to Amazon Lex V2 when a user chooses the button.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @text : String,
          @value : String
        )
        end
      end

      # Provides a score that indicates the confidence that Amazon Lex V2 has that an intent is the one that
      # satisfies the user's intent.

      struct ConfidenceScore
        include JSON::Serializable

        # A score that indicates how confident Amazon Lex V2 is that an intent satisfies the user's intent.
        # Ranges between 0.00 and 1.00. Higher scores indicate higher confidence.

        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @score : Float64? = nil
        )
        end
      end

      # The initial event sent from the application to Amazon Lex V2 to configure the conversation,
      # including session and request attributes and the response content type.

      struct ConfigurationEvent
        include JSON::Serializable

        # The message that Amazon Lex V2 returns in the response can be either text or speech based on the
        # responseContentType value. If the value is text/plain;charset=utf-8 , Amazon Lex V2 returns text in
        # the response. If the value begins with audio/ , Amazon Lex V2 returns speech in the response. Amazon
        # Lex V2 uses Amazon Polly to generate the speech using the configuration that you specified in the
        # requestContentType parameter. For example, if you specify audio/mpeg as the value, Amazon Lex V2
        # returns speech in the MPEG format. If the value is audio/pcm , the speech returned is audio/pcm in
        # 16-bit, little-endian format. The following are the accepted values: audio/mpeg audio/ogg audio/pcm
        # audio/* (defaults to mpeg) text/plain; charset=utf-8

        @[JSON::Field(key: "responseContentType")]
        getter response_content_type : String

        # A timestamp set by the client of the date and time that the event was sent to Amazon Lex V2.

        @[JSON::Field(key: "clientTimestampMillis")]
        getter client_timestamp_millis : Int64?

        # Determines whether Amazon Lex V2 should send audio responses to the client application. Set this
        # field to false when the client is operating in a playback mode where audio responses are played to
        # the user. If the client isn't operating in playback mode, such as a text chat application, set this
        # to true so that Amazon Lex V2 doesn't wait for the prompt to finish playing on the client.

        @[JSON::Field(key: "disablePlayback")]
        getter disable_playback : Bool?

        # A unique identifier that your application assigns to the event. You can use this to identify events
        # in logs.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # Request-specific information passed between the client application and Amazon Lex V2. The namespace
        # x-amz-lex: is reserved for special attributes. Don't create any request attributes for prefix
        # x-amz-lex: .

        @[JSON::Field(key: "requestAttributes")]
        getter request_attributes : Hash(String, String)?


        @[JSON::Field(key: "sessionState")]
        getter session_state : Types::SessionState?

        # A list of messages to send to the user. If you set the welcomeMessage field, you must also set the
        # DialogAction structure's type field.

        @[JSON::Field(key: "welcomeMessages")]
        getter welcome_messages : Array(Types::Message)?

        def initialize(
          @response_content_type : String,
          @client_timestamp_millis : Int64? = nil,
          @disable_playback : Bool? = nil,
          @event_id : String? = nil,
          @request_attributes : Hash(String, String)? = nil,
          @session_state : Types::SessionState? = nil,
          @welcome_messages : Array(Types::Message)? = nil
        )
        end
      end


      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A DTMF character sent from the client application. DTMF characters are typically sent from a phone
      # keypad to represent numbers. For example, you can have Amazon Lex V2 process a credit card number
      # input from a phone.

      struct DTMFInputEvent
        include JSON::Serializable

        # The DTMF character that the user pressed. The allowed characters are A - D, 0 - 9, # and *.

        @[JSON::Field(key: "inputCharacter")]
        getter input_character : String

        # A timestamp set by the client of the date and time that the event was sent to Amazon Lex V2.

        @[JSON::Field(key: "clientTimestampMillis")]
        getter client_timestamp_millis : Int64?

        # A unique identifier that your application assigns to the event. You can use this to identify events
        # in logs.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        def initialize(
          @input_character : String,
          @client_timestamp_millis : Int64? = nil,
          @event_id : String? = nil
        )
        end
      end


      struct DeleteSessionRequest
        include JSON::Serializable

        # The alias identifier in use for the bot that contains the session data.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The identifier of the bot that contains the session data.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The locale where the session is in use.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The identifier of the session to delete.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @locale_id : String,
          @session_id : String
        )
        end
      end


      struct DeleteSessionResponse
        include JSON::Serializable

        # The alias identifier in use for the bot that contained the session data.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String?

        # The identifier of the bot that contained the session data.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The locale where the session was used.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String?

        # The identifier of the deleted session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @bot_alias_id : String? = nil,
          @bot_id : String? = nil,
          @locale_id : String? = nil,
          @session_id : String? = nil
        )
        end
      end


      struct DependencyFailedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The next action that Amazon Lex V2 should take.

      struct DialogAction
        include JSON::Serializable

        # The next action that the bot should take in its interaction with the user. The following values are
        # possible: Close – Indicates that there will not be a response from the user. For example, the
        # statement "Your order has been placed" does not require a response. ConfirmIntent – The next action
        # is asking the user if the intent is complete and ready to be fulfilled. This is a yes/no question
        # such as "Place the order?" Delegate – The next action is determined by Amazon Lex V2. ElicitIntent –
        # The next action is to elicit an intent from the user. ElicitSlot – The next action is to elicit a
        # slot value from the user.

        @[JSON::Field(key: "type")]
        getter type : String

        # Configures the slot to use spell-by-letter or spell-by-word style. When you use a style on a slot,
        # users can spell out their input to make it clear to your bot. Spell by letter - "b" "o" "b" Spell by
        # word - "b as in boy" "o as in oscar" "b as in boy" For more information, see Using spelling to enter
        # slot values .

        @[JSON::Field(key: "slotElicitationStyle")]
        getter slot_elicitation_style : String?

        # The name of the slot that should be elicited from the user.

        @[JSON::Field(key: "slotToElicit")]
        getter slot_to_elicit : String?

        # The name of the constituent sub slot of the composite slot specified in slotToElicit that should be
        # elicited from the user.

        @[JSON::Field(key: "subSlotToElicit")]
        getter sub_slot_to_elicit : Types::ElicitSubSlot?

        def initialize(
          @type : String,
          @slot_elicitation_style : String? = nil,
          @slot_to_elicit : String? = nil,
          @sub_slot_to_elicit : Types::ElicitSubSlot? = nil
        )
        end
      end

      # A notification from the client that it is disconnecting from Amazon Lex V2. Sending a
      # DisconnectionEvent event is optional, but can help identify a conversation in logs.

      struct DisconnectionEvent
        include JSON::Serializable

        # A timestamp set by the client of the date and time that the event was sent to Amazon Lex V2.

        @[JSON::Field(key: "clientTimestampMillis")]
        getter client_timestamp_millis : Int64?

        # A unique identifier that your application assigns to the event. You can use this to identify events
        # in logs.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        def initialize(
          @client_timestamp_millis : Int64? = nil,
          @event_id : String? = nil
        )
        end
      end

      # The specific constituent sub slot of the composite slot to elicit in dialog action.

      struct ElicitSubSlot
        include JSON::Serializable

        # The name of the slot that should be elicited from the user.

        @[JSON::Field(key: "name")]
        getter name : String

        # The field is not supported.

        @[JSON::Field(key: "subSlotToElicit")]
        getter sub_slot_to_elicit : Types::ElicitSubSlot?

        def initialize(
          @name : String,
          @sub_slot_to_elicit : Types::ElicitSubSlot? = nil
        )
        end
      end


      struct GetSessionRequest
        include JSON::Serializable

        # The alias identifier in use for the bot that contains the session data.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The identifier of the bot that contains the session data.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The locale where the session is in use.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The identifier of the session to return.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @locale_id : String,
          @session_id : String
        )
        end
      end


      struct GetSessionResponse
        include JSON::Serializable

        # A list of intents that Amazon Lex V2 determined might satisfy the user's utterance. Each
        # interpretation includes the intent, a score that indicates how confident Amazon Lex V2 is that the
        # interpretation is the correct one, and an optional sentiment response that indicates the sentiment
        # expressed in the utterance.

        @[JSON::Field(key: "interpretations")]
        getter interpretations : Array(Types::Interpretation)?

        # A list of messages that were last sent to the user. The messages are ordered based on the order that
        # your returned the messages from your Lambda function or the order that messages are defined in the
        # bot.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?

        # The identifier of the returned session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # Represents the current state of the dialog between the user and the bot. You can use this to
        # determine the progress of the conversation and what the next action might be.

        @[JSON::Field(key: "sessionState")]
        getter session_state : Types::SessionState?

        def initialize(
          @interpretations : Array(Types::Interpretation)? = nil,
          @messages : Array(Types::Message)? = nil,
          @session_id : String? = nil,
          @session_state : Types::SessionState? = nil
        )
        end
      end

      # Event that Amazon Lex V2 sends to indicate that the stream is still open between the client
      # application and Amazon Lex V2

      struct HeartbeatEvent
        include JSON::Serializable

        # A unique identifier of the event sent by Amazon Lex V2. The identifier is in the form RESPONSE-N ,
        # where N is a number starting with one and incremented for each event sent by Amazon Lex V2 in the
        # current session.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        def initialize(
          @event_id : String? = nil
        )
        end
      end

      # A card that is shown to the user by a messaging platform. You define the contents of the card, the
      # card is displayed by the platform. When you use a response card, the response from the user is
      # constrained to the text associated with a button on the card.

      struct ImageResponseCard
        include JSON::Serializable

        # The title to display on the response card. The format of the title is determined by the platform
        # displaying the response card.

        @[JSON::Field(key: "title")]
        getter title : String

        # A list of buttons that should be displayed on the response card. The arrangement of the buttons is
        # determined by the platform that displays the button.

        @[JSON::Field(key: "buttons")]
        getter buttons : Array(Types::Button)?

        # The URL of an image to display on the response card. The image URL must be publicly available so
        # that the platform displaying the response card has access to the image.

        @[JSON::Field(key: "imageUrl")]
        getter image_url : String?

        # The subtitle to display on the response card. The format of the subtitle is determined by the
        # platform displaying the response card.

        @[JSON::Field(key: "subtitle")]
        getter subtitle : String?

        def initialize(
          @title : String,
          @buttons : Array(Types::Button)? = nil,
          @image_url : String? = nil,
          @subtitle : String? = nil
        )
        end
      end

      # The current intent that Amazon Lex V2 is attempting to fulfill.

      struct Intent
        include JSON::Serializable

        # The name of the intent.

        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates whether the intent has been Confirmed , Denied , or None if the confirmation stage has not
        # yet been reached.

        @[JSON::Field(key: "confirmationState")]
        getter confirmation_state : String?

        # A map of all of the slots for the intent. The name of the slot maps to the value of the slot. If a
        # slot has not been filled, the value is null.

        @[JSON::Field(key: "slots")]
        getter slots : Hash(String, Types::Slot)?

        # Indicates the fulfillment state for the intent. The meanings of each value are as follows: Failed –
        # The bot failed to fulfill the intent. Fulfilled – The bot has completed fulfillment of the intent.
        # FulfillmentInProgress – The bot is in the middle of fulfilling the intent. InProgress – The bot is
        # in the middle of eliciting the slot values that are necessary to fulfill the intent.
        # ReadyForFulfillment – The bot has elicited all the slot values for the intent and is ready to
        # fulfill the intent. Waiting – The bot is waiting for a response from the user (limited to streaming
        # conversations).

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @name : String,
          @confirmation_state : String? = nil,
          @slots : Hash(String, Types::Slot)? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains the current state of the conversation between the client application and Amazon Lex V2.

      struct IntentResultEvent
        include JSON::Serializable

        # A unique identifier of the event sent by Amazon Lex V2. The identifier is in the form RESPONSE-N ,
        # where N is a number starting with one and incremented for each event sent by Amazon Lex V2 in the
        # current session.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # Indicates whether the input to the operation was text, speech, or from a touch-tone keypad.

        @[JSON::Field(key: "inputMode")]
        getter input_mode : String?

        # A list of intents that Amazon Lex V2 determined might satisfy the user's utterance. Each
        # interpretation includes the intent, a score that indicates how confident Amazon Lex V2 is that the
        # interpretation is the correct one, and an optional sentiment response that indicates the sentiment
        # expressed in the utterance.

        @[JSON::Field(key: "interpretations")]
        getter interpretations : Array(Types::Interpretation)?

        # The bot member that is processing the intent.

        @[JSON::Field(key: "recognizedBotMember")]
        getter recognized_bot_member : Types::RecognizedBotMember?

        # The attributes sent in the request.

        @[JSON::Field(key: "requestAttributes")]
        getter request_attributes : Hash(String, String)?

        # The identifier of the session in use.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?


        @[JSON::Field(key: "sessionState")]
        getter session_state : Types::SessionState?

        def initialize(
          @event_id : String? = nil,
          @input_mode : String? = nil,
          @interpretations : Array(Types::Interpretation)? = nil,
          @recognized_bot_member : Types::RecognizedBotMember? = nil,
          @request_attributes : Hash(String, String)? = nil,
          @session_id : String? = nil,
          @session_state : Types::SessionState? = nil
        )
        end
      end


      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An object containing information about an intent that Amazon Lex V2 determined might satisfy the
      # user's utterance. The intents are ordered by the confidence score.

      struct Interpretation
        include JSON::Serializable

        # A list of intents that might satisfy the user's utterance. The intents are ordered by the confidence
        # score.

        @[JSON::Field(key: "intent")]
        getter intent : Types::Intent?

        # Specifies the service that interpreted the input.

        @[JSON::Field(key: "interpretationSource")]
        getter interpretation_source : String?

        # Determines the threshold where Amazon Lex V2 will insert the AMAZON.FallbackIntent ,
        # AMAZON.KendraSearchIntent , or both when returning alternative intents in a response.
        # AMAZON.FallbackIntent and AMAZON.KendraSearchIntent are only inserted if they are configured for the
        # bot.

        @[JSON::Field(key: "nluConfidence")]
        getter nlu_confidence : Types::ConfidenceScore?

        # The sentiment expressed in an utterance. When the bot is configured to send utterances to Amazon
        # Comprehend for sentiment analysis, this field contains the result of the analysis.

        @[JSON::Field(key: "sentimentResponse")]
        getter sentiment_response : Types::SentimentResponse?

        def initialize(
          @intent : Types::Intent? = nil,
          @interpretation_source : String? = nil,
          @nlu_confidence : Types::ConfidenceScore? = nil,
          @sentiment_response : Types::SentimentResponse? = nil
        )
        end
      end

      # Container for text that is returned to the customer..

      struct Message
        include JSON::Serializable

        # Indicates the type of response.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The text of the message.

        @[JSON::Field(key: "content")]
        getter content : String?


        @[JSON::Field(key: "imageResponseCard")]
        getter image_response_card : Types::ImageResponseCard?

        def initialize(
          @content_type : String,
          @content : String? = nil,
          @image_response_card : Types::ImageResponseCard? = nil
        )
        end
      end

      # Event sent from the client application to Amazon Lex V2 to indicate that playback of audio is
      # complete and that Amazon Lex V2 should start processing the user's input.

      struct PlaybackCompletionEvent
        include JSON::Serializable

        # A timestamp set by the client of the date and time that the event was sent to Amazon Lex V2.

        @[JSON::Field(key: "clientTimestampMillis")]
        getter client_timestamp_millis : Int64?

        # A unique identifier that your application assigns to the event. You can use this to identify events
        # in logs.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        def initialize(
          @client_timestamp_millis : Int64? = nil,
          @event_id : String? = nil
        )
        end
      end

      # Event sent from Amazon Lex V2 to indicate to the client application should stop playback of audio.
      # For example, if the client is playing a prompt that asks for the user's telephone number, the user
      # might start to say the phone number before the prompt is complete. Amazon Lex V2 sends this event to
      # the client application to indicate that the user is responding and that Amazon Lex V2 is processing
      # their input.

      struct PlaybackInterruptionEvent
        include JSON::Serializable

        # The identifier of the event that contained the audio, DTMF, or text that caused the interruption.

        @[JSON::Field(key: "causedByEventId")]
        getter caused_by_event_id : String?

        # A unique identifier of the event sent by Amazon Lex V2. The identifier is in the form RESPONSE-N ,
        # where N is a number starting with one and incremented for each event sent by Amazon Lex V2 in the
        # current session.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # Indicates the type of user input that Amazon Lex V2 detected.

        @[JSON::Field(key: "eventReason")]
        getter event_reason : String?

        def initialize(
          @caused_by_event_id : String? = nil,
          @event_id : String? = nil,
          @event_reason : String? = nil
        )
        end
      end


      struct PutSessionRequest
        include JSON::Serializable

        # The alias identifier of the bot that receives the session data.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The identifier of the bot that receives the session data.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The locale where the session is in use.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The identifier of the session that receives the session data.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # Sets the state of the session with the user. You can use this to set the current intent, attributes,
        # context, and dialog action. Use the dialog action to determine the next step that Amazon Lex V2
        # should use in the conversation with the user.

        @[JSON::Field(key: "sessionState")]
        getter session_state : Types::SessionState

        # A list of messages to send to the user. Messages are sent in the order that they are defined in the
        # list.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?

        # Request-specific information passed between Amazon Lex V2 and the client application. The namespace
        # x-amz-lex: is reserved for special attributes. Don't create any request attributes with the prefix
        # x-amz-lex: .

        @[JSON::Field(key: "requestAttributes")]
        getter request_attributes : Hash(String, String)?

        # The message that Amazon Lex V2 returns in the response can be either text or speech depending on the
        # value of this parameter. If the value is text/plain; charset=utf-8 , Amazon Lex V2 returns text in
        # the response.

        @[JSON::Field(key: "ResponseContentType")]
        getter response_content_type : String?

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @locale_id : String,
          @session_id : String,
          @session_state : Types::SessionState,
          @messages : Array(Types::Message)? = nil,
          @request_attributes : Hash(String, String)? = nil,
          @response_content_type : String? = nil
        )
        end
      end


      struct PutSessionResponse
        include JSON::Serializable

        # If the requested content type was audio, the audio version of the message to convey to the user.

        @[JSON::Field(key: "audioStream")]
        getter audio_stream : Bytes?

        # The type of response. Same as the type specified in the responseContentType field in the request.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # A list of messages that were last sent to the user. The messages are ordered based on how you return
        # the messages from you Lambda function or the order that the messages are defined in the bot.

        @[JSON::Field(key: "x-amz-lex-messages")]
        getter messages : String?

        # A base-64-encoded gzipped field that provides request-specific information passed between the client
        # application and Amazon Lex V2. These are the same as the requestAttribute parameter in the call to
        # the PutSession operation.

        @[JSON::Field(key: "x-amz-lex-request-attributes")]
        getter request_attributes : String?

        # The identifier of the session that received the data.

        @[JSON::Field(key: "x-amz-lex-session-id")]
        getter session_id : String?

        # A base-64-encoded gzipped field that represents the current state of the dialog between the user and
        # the bot. Use this to determine the progress of the conversation and what the next action may be.

        @[JSON::Field(key: "x-amz-lex-session-state")]
        getter session_state : String?

        def initialize(
          @audio_stream : Bytes? = nil,
          @content_type : String? = nil,
          @messages : String? = nil,
          @request_attributes : String? = nil,
          @session_id : String? = nil,
          @session_state : String? = nil
        )
        end
      end


      struct RecognizeTextRequest
        include JSON::Serializable

        # The alias identifier in use for the bot that processes the request.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The identifier of the bot that processes the request.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The locale where the session is in use.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # The identifier of the user session that is having the conversation.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The text that the user entered. Amazon Lex V2 interprets this text.

        @[JSON::Field(key: "text")]
        getter text : String

        # Request-specific information passed between the client application and Amazon Lex V2 The namespace
        # x-amz-lex: is reserved for special attributes. Don't create any request attributes with the prefix
        # x-amz-lex: .

        @[JSON::Field(key: "requestAttributes")]
        getter request_attributes : Hash(String, String)?

        # The current state of the dialog between the user and the bot.

        @[JSON::Field(key: "sessionState")]
        getter session_state : Types::SessionState?

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @locale_id : String,
          @session_id : String,
          @text : String,
          @request_attributes : Hash(String, String)? = nil,
          @session_state : Types::SessionState? = nil
        )
        end
      end


      struct RecognizeTextResponse
        include JSON::Serializable

        # A list of intents that Amazon Lex V2 determined might satisfy the user's utterance. Each
        # interpretation includes the intent, a score that indicates now confident Amazon Lex V2 is that the
        # interpretation is the correct one, and an optional sentiment response that indicates the sentiment
        # expressed in the utterance.

        @[JSON::Field(key: "interpretations")]
        getter interpretations : Array(Types::Interpretation)?

        # A list of messages last sent to the user. The messages are ordered based on the order that you
        # returned the messages from your Lambda function or the order that the messages are defined in the
        # bot.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?

        # The bot member that recognized the text.

        @[JSON::Field(key: "recognizedBotMember")]
        getter recognized_bot_member : Types::RecognizedBotMember?

        # The attributes sent in the request.

        @[JSON::Field(key: "requestAttributes")]
        getter request_attributes : Hash(String, String)?

        # The identifier of the session in use.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # Represents the current state of the dialog between the user and the bot. Use this to determine the
        # progress of the conversation and what the next action may be.

        @[JSON::Field(key: "sessionState")]
        getter session_state : Types::SessionState?

        def initialize(
          @interpretations : Array(Types::Interpretation)? = nil,
          @messages : Array(Types::Message)? = nil,
          @recognized_bot_member : Types::RecognizedBotMember? = nil,
          @request_attributes : Hash(String, String)? = nil,
          @session_id : String? = nil,
          @session_state : Types::SessionState? = nil
        )
        end
      end


      struct RecognizeUtteranceRequest
        include JSON::Serializable

        # The alias identifier in use for the bot that should receive the request.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The identifier of the bot that should receive the request.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The locale where the session is in use.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # Indicates the format for audio input or that the content is text. The header must start with one of
        # the following prefixes: PCM format, audio data must be in little-endian byte order. audio/l16;
        # rate=16000; channels=1 audio/x-l16; sample-rate=16000; channel-count=1 audio/lpcm; sample-rate=8000;
        # sample-size-bits=16; channel-count=1; is-big-endian=false Opus format
        # audio/x-cbr-opus-with-preamble;preamble-size=0;bit-rate=256000;frame-size-milliseconds=4 Text format
        # text/plain; charset=utf-8

        @[JSON::Field(key: "Content-Type")]
        getter request_content_type : String

        # The identifier of the session in use.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # User input in PCM or Opus audio format or text format as described in the requestContentType
        # parameter.

        @[JSON::Field(key: "inputStream")]
        getter input_stream : Bytes?

        # Request-specific information passed between the client application and Amazon Lex V2 The namespace
        # x-amz-lex: is reserved for special attributes. Don't create any request attributes for prefix
        # x-amz-lex: . The requestAttributes field must be compressed using gzip and then base64 encoded
        # before sending to Amazon Lex V2.

        @[JSON::Field(key: "x-amz-lex-request-attributes")]
        getter request_attributes : String?

        # The message that Amazon Lex V2 returns in the response can be either text or speech based on the
        # responseContentType value. If the value is text/plain;charset=utf-8 , Amazon Lex V2 returns text in
        # the response. If the value begins with audio/ , Amazon Lex V2 returns speech in the response. Amazon
        # Lex V2 uses Amazon Polly to generate the speech using the configuration that you specified in the
        # responseContentType parameter. For example, if you specify audio/mpeg as the value, Amazon Lex V2
        # returns speech in the MPEG format. If the value is audio/pcm , the speech returned is audio/pcm at
        # 16 KHz in 16-bit, little-endian format. The following are the accepted values: audio/mpeg audio/ogg
        # audio/pcm (16 KHz) audio/* (defaults to mpeg) text/plain; charset=utf-8

        @[JSON::Field(key: "Response-Content-Type")]
        getter response_content_type : String?

        # Sets the state of the session with the user. You can use this to set the current intent, attributes,
        # context, and dialog action. Use the dialog action to determine the next step that Amazon Lex V2
        # should use in the conversation with the user. The sessionState field must be compressed using gzip
        # and then base64 encoded before sending to Amazon Lex V2.

        @[JSON::Field(key: "x-amz-lex-session-state")]
        getter session_state : String?

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @locale_id : String,
          @request_content_type : String,
          @session_id : String,
          @input_stream : Bytes? = nil,
          @request_attributes : String? = nil,
          @response_content_type : String? = nil,
          @session_state : String? = nil
        )
        end
      end


      struct RecognizeUtteranceResponse
        include JSON::Serializable

        # The prompt or statement to send to the user. This is based on the bot configuration and context. For
        # example, if Amazon Lex V2 did not understand the user intent, it sends the clarificationPrompt
        # configured for the bot. If the intent requires confirmation before taking the fulfillment action, it
        # sends the confirmationPrompt . Another example: Suppose that the Lambda function successfully
        # fulfilled the intent, and sent a message to convey to the user. Then Amazon Lex V2 sends that
        # message in the response.

        @[JSON::Field(key: "audioStream")]
        getter audio_stream : Bytes?

        # Content type as specified in the responseContentType in the request.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Indicates whether the input mode to the operation was text, speech, or from a touch-tone keypad.

        @[JSON::Field(key: "x-amz-lex-input-mode")]
        getter input_mode : String?

        # The text used to process the request. If the input was an audio stream, the inputTranscript field
        # contains the text extracted from the audio stream. This is the text that is actually processed to
        # recognize intents and slot values. You can use this information to determine if Amazon Lex V2 is
        # correctly processing the audio that you send. The inputTranscript field is compressed with gzip and
        # then base64 encoded. Before you can use the contents of the field, you must decode and decompress
        # the contents. See the example for a simple function to decode and decompress the contents.

        @[JSON::Field(key: "x-amz-lex-input-transcript")]
        getter input_transcript : String?

        # A list of intents that Amazon Lex V2 determined might satisfy the user's utterance. Each
        # interpretation includes the intent, a score that indicates how confident Amazon Lex V2 is that the
        # interpretation is the correct one, and an optional sentiment response that indicates the sentiment
        # expressed in the utterance. The interpretations field is compressed with gzip and then base64
        # encoded. Before you can use the contents of the field, you must decode and decompress the contents.
        # See the example for a simple function to decode and decompress the contents.

        @[JSON::Field(key: "x-amz-lex-interpretations")]
        getter interpretations : String?

        # A list of messages that were last sent to the user. The messages are ordered based on the order that
        # you returned the messages from your Lambda function or the order that the messages are defined in
        # the bot. The messages field is compressed with gzip and then base64 encoded. Before you can use the
        # contents of the field, you must decode and decompress the contents. See the example for a simple
        # function to decode and decompress the contents.

        @[JSON::Field(key: "x-amz-lex-messages")]
        getter messages : String?

        # The bot member that recognized the utterance.

        @[JSON::Field(key: "x-amz-lex-recognized-bot-member")]
        getter recognized_bot_member : String?

        # The attributes sent in the request. The requestAttributes field is compressed with gzip and then
        # base64 encoded. Before you can use the contents of the field, you must decode and decompress the
        # contents.

        @[JSON::Field(key: "x-amz-lex-request-attributes")]
        getter request_attributes : String?

        # The identifier of the session in use.

        @[JSON::Field(key: "x-amz-lex-session-id")]
        getter session_id : String?

        # Represents the current state of the dialog between the user and the bot. Use this to determine the
        # progress of the conversation and what the next action might be. The sessionState field is compressed
        # with gzip and then base64 encoded. Before you can use the contents of the field, you must decode and
        # decompress the contents. See the example for a simple function to decode and decompress the
        # contents.

        @[JSON::Field(key: "x-amz-lex-session-state")]
        getter session_state : String?

        def initialize(
          @audio_stream : Bytes? = nil,
          @content_type : String? = nil,
          @input_mode : String? = nil,
          @input_transcript : String? = nil,
          @interpretations : String? = nil,
          @messages : String? = nil,
          @recognized_bot_member : String? = nil,
          @request_attributes : String? = nil,
          @session_id : String? = nil,
          @session_state : String? = nil
        )
        end
      end

      # The bot member that processes the request.

      struct RecognizedBotMember
        include JSON::Serializable

        # The identifier of the bot member that processes the request.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The name of the bot member that processes the request.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        def initialize(
          @bot_id : String,
          @bot_name : String? = nil
        )
        end
      end


      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Provides an array of phrases that should be given preference when resolving values for a slot.

      struct RuntimeHintDetails
        include JSON::Serializable

        # One or more strings that Amazon Lex V2 should look for in the input to the bot. Each phrase is given
        # preference when deciding on slot values.

        @[JSON::Field(key: "runtimeHintValues")]
        getter runtime_hint_values : Array(Types::RuntimeHintValue)?

        # A map of constituent sub slot names inside a composite slot in the intent and the phrases that
        # should be added for each sub slot. Inside each composite slot hints, this structure provides a
        # mechanism to add granular sub slot phrases. Only sub slot hints are supported for composite slots.
        # The intent name, composite slot name and the constituent sub slot names must exist.

        @[JSON::Field(key: "subSlotHints")]
        getter sub_slot_hints : Hash(String, Types::RuntimeHintDetails)?

        def initialize(
          @runtime_hint_values : Array(Types::RuntimeHintValue)? = nil,
          @sub_slot_hints : Hash(String, Types::RuntimeHintDetails)? = nil
        )
        end
      end

      # Provides the phrase that Amazon Lex V2 should look for in the user's input to the bot.

      struct RuntimeHintValue
        include JSON::Serializable

        # The phrase that Amazon Lex V2 should look for in the user's input to the bot.

        @[JSON::Field(key: "phrase")]
        getter phrase : String

        def initialize(
          @phrase : String
        )
        end
      end

      # You can provide Amazon Lex V2 with hints to the phrases that a customer is likely to use for a slot.
      # When a slot with hints is resolved, the phrases in the runtime hints are preferred in the
      # resolution. You can provide hints for a maximum of 100 intents. You can provide a maximum of 100
      # slots. Before you can use runtime hints with an existing bot, you must first rebuild the bot. For
      # more information, see Using runtime hints to improve recognition of slot values .

      struct RuntimeHints
        include JSON::Serializable

        # A list of the slots in the intent that should have runtime hints added, and the phrases that should
        # be added for each slot. The first level of the slotHints map is the name of the intent. The second
        # level is the name of the slot within the intent. For more information, see Using hints to improve
        # accuracy . The intent name and slot name must exist.

        @[JSON::Field(key: "slotHints")]
        getter slot_hints : Hash(String, Hash(String, Types::RuntimeHintDetails))?

        def initialize(
          @slot_hints : Hash(String, Hash(String, Types::RuntimeHintDetails))? = nil
        )
        end
      end

      # Provides information about the sentiment expressed in a user's response in a conversation.
      # Sentiments are determined using Amazon Comprehend. Sentiments are only returned if they are enabled
      # for the bot. For more information, see Determine Sentiment in the Amazon Comprehend developer guide
      # .

      struct SentimentResponse
        include JSON::Serializable

        # The overall sentiment expressed in the user's response. This is the sentiment most likely expressed
        # by the user based on the analysis by Amazon Comprehend.

        @[JSON::Field(key: "sentiment")]
        getter sentiment : String?


        @[JSON::Field(key: "sentimentScore")]
        getter sentiment_score : Types::SentimentScore?

        def initialize(
          @sentiment : String? = nil,
          @sentiment_score : Types::SentimentScore? = nil
        )
        end
      end

      # The individual sentiment responses for the utterance.

      struct SentimentScore
        include JSON::Serializable

        # The level of confidence that Amazon Comprehend has in the accuracy of its detection of the MIXED
        # sentiment.

        @[JSON::Field(key: "mixed")]
        getter mixed : Float64?

        # The level of confidence that Amazon Comprehend has in the accuracy of its detection of the NEGATIVE
        # sentiment.

        @[JSON::Field(key: "negative")]
        getter negative : Float64?

        # The level of confidence that Amazon Comprehend has in the accuracy of its detection of the NEUTRAL
        # sentiment.

        @[JSON::Field(key: "neutral")]
        getter neutral : Float64?

        # The level of confidence that Amazon Comprehend has in the accuracy of its detection of the POSITIVE
        # sentiment.

        @[JSON::Field(key: "positive")]
        getter positive : Float64?

        def initialize(
          @mixed : Float64? = nil,
          @negative : Float64? = nil,
          @neutral : Float64? = nil,
          @positive : Float64? = nil
        )
        end
      end

      # The state of the user's session with Amazon Lex V2.

      struct SessionState
        include JSON::Serializable

        # One or more contexts that indicate to Amazon Lex V2 the context of a request. When a context is
        # active, Amazon Lex V2 considers intents with the matching context as a trigger as the next intent in
        # a session.

        @[JSON::Field(key: "activeContexts")]
        getter active_contexts : Array(Types::ActiveContext)?

        # The next step that Amazon Lex V2 should take in the conversation with a user.

        @[JSON::Field(key: "dialogAction")]
        getter dialog_action : Types::DialogAction?

        # The active intent that Amazon Lex V2 is processing.

        @[JSON::Field(key: "intent")]
        getter intent : Types::Intent?

        # A unique identifier for a specific request.

        @[JSON::Field(key: "originatingRequestId")]
        getter originating_request_id : String?

        # Hints for phrases that a customer is likely to use for a slot. Amazon Lex V2 uses the hints to help
        # determine the correct value of a slot.

        @[JSON::Field(key: "runtimeHints")]
        getter runtime_hints : Types::RuntimeHints?

        # Map of key/value pairs representing session-specific context information. It contains application
        # information passed between Amazon Lex V2 and a client application.

        @[JSON::Field(key: "sessionAttributes")]
        getter session_attributes : Hash(String, String)?

        def initialize(
          @active_contexts : Array(Types::ActiveContext)? = nil,
          @dialog_action : Types::DialogAction? = nil,
          @intent : Types::Intent? = nil,
          @originating_request_id : String? = nil,
          @runtime_hints : Types::RuntimeHints? = nil,
          @session_attributes : Hash(String, String)? = nil
        )
        end
      end

      # A value that Amazon Lex V2 uses to fulfill an intent.

      struct Slot
        include JSON::Serializable

        # When the shape value is List , it indicates that the values field contains a list of slot values.
        # When the value is Scalar , it indicates that the value field contains a single value.

        @[JSON::Field(key: "shape")]
        getter shape : String?

        # The constituent sub slots of a composite slot.

        @[JSON::Field(key: "subSlots")]
        getter sub_slots : Hash(String, Types::Slot)?

        # The current value of the slot.

        @[JSON::Field(key: "value")]
        getter value : Types::Value?

        # A list of one or more values that the user provided for the slot. For example, if a for a slot that
        # elicits pizza toppings, the values might be "pepperoni" and "pineapple."

        @[JSON::Field(key: "values")]
        getter values : Array(Types::Slot)?

        def initialize(
          @shape : String? = nil,
          @sub_slots : Hash(String, Types::Slot)? = nil,
          @value : Types::Value? = nil,
          @values : Array(Types::Slot)? = nil
        )
        end
      end


      struct StartConversationRequest
        include JSON::Serializable

        # The alias identifier in use for the bot that processes the request.

        @[JSON::Field(key: "botAliasId")]
        getter bot_alias_id : String

        # The identifier of the bot to process the request.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The locale where the session is in use.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        # Represents the stream of events to Amazon Lex V2 from your application. The events are encoded as
        # HTTP/2 data frames.

        @[JSON::Field(key: "requestEventStream")]
        getter request_event_stream : Types::StartConversationRequestEventStream

        # The identifier of the user session that is having the conversation.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The conversation type that you are using the Amazon Lex V2. If the conversation mode is AUDIO you
        # can send both audio and DTMF information. If the mode is TEXT you can only send text.

        @[JSON::Field(key: "x-amz-lex-conversation-mode")]
        getter conversation_mode : String?

        def initialize(
          @bot_alias_id : String,
          @bot_id : String,
          @locale_id : String,
          @request_event_stream : Types::StartConversationRequestEventStream,
          @session_id : String,
          @conversation_mode : String? = nil
        )
        end
      end

      # Represents a stream of events between your application and Amazon Lex V2.

      struct StartConversationRequestEventStream
        include JSON::Serializable

        # Speech audio sent from your client application to Amazon Lex V2. Audio starts accumulating when
        # Amazon Lex V2 identifies a voice and continues until a natural pause in the speech is found before
        # processing.

        @[JSON::Field(key: "AudioInputEvent")]
        getter audio_input_event : Types::AudioInputEvent?

        # Configuration information sent from your client application to Amazon Lex V2

        @[JSON::Field(key: "ConfigurationEvent")]
        getter configuration_event : Types::ConfigurationEvent?

        # DTMF information sent to Amazon Lex V2 by your application. Amazon Lex V2 accumulates the DMTF
        # information from when the user sends the first character and ends when there's a pause longer that
        # the value configured for the end timeout. when there's a digit that is the configured end character.
        # when Amazon Lex V2 accumulates characters equal to the maximum DTMF character configuration.

        @[JSON::Field(key: "DTMFInputEvent")]
        getter dtmf_input_event : Types::DTMFInputEvent?

        # Event sent from the client application to indicate to Amazon Lex V2 that the conversation is over.

        @[JSON::Field(key: "DisconnectionEvent")]
        getter disconnection_event : Types::DisconnectionEvent?

        # Event sent from the client application to Amazon Lex V2 to indicate that it has finished playing
        # audio and that Amazon Lex V2 should start listening for user input.

        @[JSON::Field(key: "PlaybackCompletionEvent")]
        getter playback_completion_event : Types::PlaybackCompletionEvent?

        # Text sent from your client application to Amazon Lex V2. Each TextInputEvent is processed
        # individually.

        @[JSON::Field(key: "TextInputEvent")]
        getter text_input_event : Types::TextInputEvent?

        def initialize(
          @audio_input_event : Types::AudioInputEvent? = nil,
          @configuration_event : Types::ConfigurationEvent? = nil,
          @dtmf_input_event : Types::DTMFInputEvent? = nil,
          @disconnection_event : Types::DisconnectionEvent? = nil,
          @playback_completion_event : Types::PlaybackCompletionEvent? = nil,
          @text_input_event : Types::TextInputEvent? = nil
        )
        end
      end


      struct StartConversationResponse
        include JSON::Serializable

        # Represents the stream of events from Amazon Lex V2 to your application. The events are encoded as
        # HTTP/2 data frames.

        @[JSON::Field(key: "responseEventStream")]
        getter response_event_stream : Types::StartConversationResponseEventStream?

        def initialize(
          @response_event_stream : Types::StartConversationResponseEventStream? = nil
        )
        end
      end

      # Represents a stream of events between Amazon Lex V2 and your application.

      struct StartConversationResponseEventStream
        include JSON::Serializable

        # Exception thrown when the credentials passed with the request are invalid or expired. Also thrown
        # when the credentials in the request do not have permission to access the StartConversation
        # operation.

        @[JSON::Field(key: "AccessDeniedException")]
        getter access_denied_exception : Types::AccessDeniedException?


        @[JSON::Field(key: "AudioResponseEvent")]
        getter audio_response_event : Types::AudioResponseEvent?


        @[JSON::Field(key: "BadGatewayException")]
        getter bad_gateway_exception : Types::BadGatewayException?

        # Exception thrown when two clients are using the same AWS account, Amazon Lex V2 bot, and session ID.

        @[JSON::Field(key: "ConflictException")]
        getter conflict_exception : Types::ConflictException?


        @[JSON::Field(key: "DependencyFailedException")]
        getter dependency_failed_exception : Types::DependencyFailedException?


        @[JSON::Field(key: "HeartbeatEvent")]
        getter heartbeat_event : Types::HeartbeatEvent?

        # Event sent from Amazon Lex V2 to the client application containing the current state of the
        # conversation between the user and Amazon Lex V2.

        @[JSON::Field(key: "IntentResultEvent")]
        getter intent_result_event : Types::IntentResultEvent?

        # An error occurred with Amazon Lex V2.

        @[JSON::Field(key: "InternalServerException")]
        getter internal_server_exception : Types::InternalServerException?


        @[JSON::Field(key: "PlaybackInterruptionEvent")]
        getter playback_interruption_event : Types::PlaybackInterruptionEvent?

        # Exception thrown if one of the input parameters points to a resource that does not exist. For
        # example, if the bot ID specified does not exist.

        @[JSON::Field(key: "ResourceNotFoundException")]
        getter resource_not_found_exception : Types::ResourceNotFoundException?


        @[JSON::Field(key: "TextResponseEvent")]
        getter text_response_event : Types::TextResponseEvent?

        # Exception thrown when your application exceeds the maximum number of concurrent requests.

        @[JSON::Field(key: "ThrottlingException")]
        getter throttling_exception : Types::ThrottlingException?


        @[JSON::Field(key: "TranscriptEvent")]
        getter transcript_event : Types::TranscriptEvent?

        # Exception thrown when one or more parameters could not be validated. The message contains the name
        # of the field that isn't valid.

        @[JSON::Field(key: "ValidationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @access_denied_exception : Types::AccessDeniedException? = nil,
          @audio_response_event : Types::AudioResponseEvent? = nil,
          @bad_gateway_exception : Types::BadGatewayException? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @dependency_failed_exception : Types::DependencyFailedException? = nil,
          @heartbeat_event : Types::HeartbeatEvent? = nil,
          @intent_result_event : Types::IntentResultEvent? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @playback_interruption_event : Types::PlaybackInterruptionEvent? = nil,
          @resource_not_found_exception : Types::ResourceNotFoundException? = nil,
          @text_response_event : Types::TextResponseEvent? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @transcript_event : Types::TranscriptEvent? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end

      # The event sent from your client application to Amazon Lex V2 with text input from the user.

      struct TextInputEvent
        include JSON::Serializable

        # The text from the user. Amazon Lex V2 processes this as a complete statement.

        @[JSON::Field(key: "text")]
        getter text : String

        # A timestamp set by the client of the date and time that the event was sent to Amazon Lex V2.

        @[JSON::Field(key: "clientTimestampMillis")]
        getter client_timestamp_millis : Int64?

        # A unique identifier that your application assigns to the event. You can use this to identify events
        # in logs.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        def initialize(
          @text : String,
          @client_timestamp_millis : Int64? = nil,
          @event_id : String? = nil
        )
        end
      end

      # The event sent from Amazon Lex V2 to your application with text to present to the user.

      struct TextResponseEvent
        include JSON::Serializable

        # A unique identifier of the event sent by Amazon Lex V2. The identifier is in the form RESPONSE-N ,
        # where N is a number starting with one and incremented for each event sent by Amazon Lex V2 in the
        # current session.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # A list of messages to send to the user. Messages are ordered based on the order that you returned
        # the messages from your Lambda function or the order that the messages are defined in the bot.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?

        def initialize(
          @event_id : String? = nil,
          @messages : Array(Types::Message)? = nil
        )
        end
      end


      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Event sent from Amazon Lex V2 to your client application that contains a transcript of voice audio.

      struct TranscriptEvent
        include JSON::Serializable

        # A unique identifier of the event sent by Amazon Lex V2. The identifier is in the form RESPONSE-N ,
        # where N is a number starting with one and incremented for each event sent by Amazon Lex V2 in the
        # current session.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The transcript of the voice audio from the user.

        @[JSON::Field(key: "transcript")]
        getter transcript : String?

        def initialize(
          @event_id : String? = nil,
          @transcript : String? = nil
        )
        end
      end


      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information about the value provided for a slot and Amazon Lex V2's interpretation.

      struct Value
        include JSON::Serializable

        # The value that Amazon Lex V2 determines for the slot, given the user input. The actual value depends
        # on the setting of the value selection strategy for the bot. You can choose to use the value entered
        # by the user, or you can have Amazon Lex V2 choose the first value in the resolvedValues list.

        @[JSON::Field(key: "interpretedValue")]
        getter interpreted_value : String

        # The part of the user's response to the slot elicitation that Amazon Lex V2 determines is relevant to
        # the slot value.

        @[JSON::Field(key: "originalValue")]
        getter original_value : String?

        # A list of values that Amazon Lex V2 determines are possible resolutions for the user input. The
        # first value matches the interpretedValue .

        @[JSON::Field(key: "resolvedValues")]
        getter resolved_values : Array(String)?

        def initialize(
          @interpreted_value : String,
          @original_value : String? = nil,
          @resolved_values : Array(String)? = nil
        )
        end
      end
    end
  end
end
