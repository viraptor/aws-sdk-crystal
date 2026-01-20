module AwsSdk
  module LexRuntimeService
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

      # Removes session information for a specified bot, alias, and user ID.

      def delete_session(
        bot_alias : String,
        bot_name : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DeleteSessionRequest.new(bot_alias: bot_alias, bot_name: bot_name, user_id: user_id)
        delete_session(input)
      end

      def delete_session(input : Types::DeleteSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns session information for a specified bot, alias, and user ID.

      def get_session(
        bot_alias : String,
        bot_name : String,
        user_id : String,
        checkpoint_label_filter : String? = nil
      ) : Protocol::Request
        input = Types::GetSessionRequest.new(bot_alias: bot_alias, bot_name: bot_name, user_id: user_id, checkpoint_label_filter: checkpoint_label_filter)
        get_session(input)
      end

      def get_session(input : Types::GetSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends user input (text or speech) to Amazon Lex. Clients use this API to send text and audio
      # requests to Amazon Lex at runtime. Amazon Lex interprets the user input using the machine learning
      # model that it built for the bot. The PostContent operation supports audio input at 8kHz and 16kHz.
      # You can use 8kHz audio to achieve higher speech recognition accuracy in telephone audio
      # applications. In response, Amazon Lex returns the next message to convey to the user. Consider the
      # following example messages: For a user input "I would like a pizza," Amazon Lex might return a
      # response with a message eliciting slot data (for example, PizzaSize ): "What size pizza would you
      # like?". After the user provides all of the pizza order information, Amazon Lex might return a
      # response with a message to get user confirmation: "Order the pizza?". After the user replies "Yes"
      # to the confirmation prompt, Amazon Lex might return a conclusion statement: "Thank you, your cheese
      # pizza has been ordered.". Not all Amazon Lex messages require a response from the user. For example,
      # conclusion statements do not require a response. Some messages require only a yes or no response. In
      # addition to the message , Amazon Lex provides additional context about the message in the response
      # that you can use to enhance client behavior, such as displaying the appropriate client user
      # interface. Consider the following examples: If the message is to elicit slot data, Amazon Lex
      # returns the following context information: x-amz-lex-dialog-state header set to ElicitSlot
      # x-amz-lex-intent-name header set to the intent name in the current context x-amz-lex-slot-to-elicit
      # header set to the slot name for which the message is eliciting information x-amz-lex-slots header
      # set to a map of slots configured for the intent with their current values If the message is a
      # confirmation prompt, the x-amz-lex-dialog-state header is set to Confirmation and the
      # x-amz-lex-slot-to-elicit header is omitted. If the message is a clarification prompt configured for
      # the intent, indicating that the user intent is not understood, the x-amz-dialog-state header is set
      # to ElicitIntent and the x-amz-slot-to-elicit header is omitted. In addition, Amazon Lex also returns
      # your application-specific sessionAttributes . For more information, see Managing Conversation
      # Context .

      def post_content(
        bot_alias : String,
        bot_name : String,
        content_type : String,
        input_stream : Bytes,
        user_id : String,
        accept : String? = nil,
        active_contexts : String? = nil,
        request_attributes : String? = nil,
        session_attributes : String? = nil
      ) : Protocol::Request
        input = Types::PostContentRequest.new(bot_alias: bot_alias, bot_name: bot_name, content_type: content_type, input_stream: input_stream, user_id: user_id, accept: accept, active_contexts: active_contexts, request_attributes: request_attributes, session_attributes: session_attributes)
        post_content(input)
      end

      def post_content(input : Types::PostContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::POST_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends user input to Amazon Lex. Client applications can use this API to send requests to Amazon Lex
      # at runtime. Amazon Lex then interprets the user input using the machine learning model it built for
      # the bot. In response, Amazon Lex returns the next message to convey to the user an optional
      # responseCard to display. Consider the following example messages: For a user input "I would like a
      # pizza", Amazon Lex might return a response with a message eliciting slot data (for example,
      # PizzaSize): "What size pizza would you like?" After the user provides all of the pizza order
      # information, Amazon Lex might return a response with a message to obtain user confirmation "Proceed
      # with the pizza order?". After the user replies to a confirmation prompt with a "yes", Amazon Lex
      # might return a conclusion statement: "Thank you, your cheese pizza has been ordered.". Not all
      # Amazon Lex messages require a user response. For example, a conclusion statement does not require a
      # response. Some messages require only a "yes" or "no" user response. In addition to the message ,
      # Amazon Lex provides additional context about the message in the response that you might use to
      # enhance client behavior, for example, to display the appropriate client user interface. These are
      # the slotToElicit , dialogState , intentName , and slots fields in the response. Consider the
      # following examples: If the message is to elicit slot data, Amazon Lex returns the following context
      # information: dialogState set to ElicitSlot intentName set to the intent name in the current context
      # slotToElicit set to the slot name for which the message is eliciting information slots set to a map
      # of slots, configured for the intent, with currently known values If the message is a confirmation
      # prompt, the dialogState is set to ConfirmIntent and SlotToElicit is set to null. If the message is a
      # clarification prompt (configured for the intent) that indicates that user intent is not understood,
      # the dialogState is set to ElicitIntent and slotToElicit is set to null. In addition, Amazon Lex also
      # returns your application-specific sessionAttributes . For more information, see Managing
      # Conversation Context .

      def post_text(
        bot_alias : String,
        bot_name : String,
        input_text : String,
        user_id : String,
        active_contexts : Array(Types::ActiveContext)? = nil,
        request_attributes : Hash(String, String)? = nil,
        session_attributes : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::PostTextRequest.new(bot_alias: bot_alias, bot_name: bot_name, input_text: input_text, user_id: user_id, active_contexts: active_contexts, request_attributes: request_attributes, session_attributes: session_attributes)
        post_text(input)
      end

      def post_text(input : Types::PostTextRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::POST_TEXT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new session or modifies an existing session with an Amazon Lex bot. Use this operation to
      # enable your application to set the state of the bot. For more information, see Managing Sessions .

      def put_session(
        bot_alias : String,
        bot_name : String,
        user_id : String,
        accept : String? = nil,
        active_contexts : Array(Types::ActiveContext)? = nil,
        dialog_action : Types::DialogAction? = nil,
        recent_intent_summary_view : Array(Types::IntentSummary)? = nil,
        session_attributes : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::PutSessionRequest.new(bot_alias: bot_alias, bot_name: bot_name, user_id: user_id, accept: accept, active_contexts: active_contexts, dialog_action: dialog_action, recent_intent_summary_view: recent_intent_summary_view, session_attributes: session_attributes)
        put_session(input)
      end

      def put_session(input : Types::PutSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
