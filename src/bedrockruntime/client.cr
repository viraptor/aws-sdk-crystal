module Aws
  module BedrockRuntime
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

      # The action to apply a guardrail. For troubleshooting some of the common errors you might encounter
      # when using the ApplyGuardrail API, see Troubleshooting Amazon Bedrock API Error Codes in the Amazon
      # Bedrock User Guide

      def apply_guardrail(
        content : Array(Types::GuardrailContentBlock),
        guardrail_identifier : String,
        guardrail_version : String,
        source : String,
        output_scope : String? = nil
      ) : Protocol::Request
        input = Types::ApplyGuardrailRequest.new(content: content, guardrail_identifier: guardrail_identifier, guardrail_version: guardrail_version, source: source, output_scope: output_scope)
        apply_guardrail(input)
      end

      def apply_guardrail(input : Types::ApplyGuardrailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::APPLY_GUARDRAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends messages to the specified Amazon Bedrock model. Converse provides a consistent interface that
      # works with all models that support messages. This allows you to write code once and use it with
      # different models. If a model has unique inference parameters, you can also pass those unique
      # parameters to the model. Amazon Bedrock doesn't store any text, images, or documents that you
      # provide as content. The data is only used to generate the response. You can submit a prompt by
      # including it in the messages field, specifying the modelId of a foundation model or inference
      # profile to run inference on it, and including any other fields that are relevant to your use case.
      # You can also submit a prompt from Prompt management by specifying the ARN of the prompt version and
      # including a map of variables to values in the promptVariables field. You can append more messages to
      # the prompt by using the messages field. If you use a prompt from Prompt management, you can't
      # include the following fields in the request: additionalModelRequestFields , inferenceConfig , system
      # , or toolConfig . Instead, these fields must be defined through Prompt management. For more
      # information, see Use a prompt from Prompt management . For information about the Converse API, see
      # Use the Converse API in the Amazon Bedrock User Guide . To use a guardrail, see Use a guardrail with
      # the Converse API in the Amazon Bedrock User Guide . To use a tool with a model, see Tool use
      # (Function calling) in the Amazon Bedrock User Guide For example code, see Converse API examples in
      # the Amazon Bedrock User Guide . This operation requires permission for the bedrock:InvokeModel
      # action. To deny all inference access to resources that you specify in the modelId field, you need to
      # deny access to the bedrock:InvokeModel and bedrock:InvokeModelWithResponseStream actions. Doing this
      # also denies access to the resource through the base inference actions ( InvokeModel and
      # InvokeModelWithResponseStream ). For more information see Deny access for inference on specific
      # models . For troubleshooting some of the common errors you might encounter when using the Converse
      # API, see Troubleshooting Amazon Bedrock API Error Codes in the Amazon Bedrock User Guide

      def converse(
        model_id : String,
        additional_model_request_fields : Types::Document? = nil,
        additional_model_response_field_paths : Array(String)? = nil,
        guardrail_config : Types::GuardrailConfiguration? = nil,
        inference_config : Types::InferenceConfiguration? = nil,
        messages : Array(Types::Message)? = nil,
        performance_config : Types::PerformanceConfiguration? = nil,
        prompt_variables : Hash(String, Types::PromptVariableValues)? = nil,
        request_metadata : Hash(String, String)? = nil,
        service_tier : Types::ServiceTier? = nil,
        system : Array(Types::SystemContentBlock)? = nil,
        tool_config : Types::ToolConfiguration? = nil
      ) : Protocol::Request
        input = Types::ConverseRequest.new(model_id: model_id, additional_model_request_fields: additional_model_request_fields, additional_model_response_field_paths: additional_model_response_field_paths, guardrail_config: guardrail_config, inference_config: inference_config, messages: messages, performance_config: performance_config, prompt_variables: prompt_variables, request_metadata: request_metadata, service_tier: service_tier, system: system, tool_config: tool_config)
        converse(input)
      end

      def converse(input : Types::ConverseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CONVERSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends messages to the specified Amazon Bedrock model and returns the response in a stream.
      # ConverseStream provides a consistent API that works with all Amazon Bedrock models that support
      # messages. This allows you to write code once and use it with different models. Should a model have
      # unique inference parameters, you can also pass those unique parameters to the model. To find out if
      # a model supports streaming, call GetFoundationModel and check the responseStreamingSupported field
      # in the response. The CLI doesn't support streaming operations in Amazon Bedrock, including
      # ConverseStream . Amazon Bedrock doesn't store any text, images, or documents that you provide as
      # content. The data is only used to generate the response. You can submit a prompt by including it in
      # the messages field, specifying the modelId of a foundation model or inference profile to run
      # inference on it, and including any other fields that are relevant to your use case. You can also
      # submit a prompt from Prompt management by specifying the ARN of the prompt version and including a
      # map of variables to values in the promptVariables field. You can append more messages to the prompt
      # by using the messages field. If you use a prompt from Prompt management, you can't include the
      # following fields in the request: additionalModelRequestFields , inferenceConfig , system , or
      # toolConfig . Instead, these fields must be defined through Prompt management. For more information,
      # see Use a prompt from Prompt management . For information about the Converse API, see Use the
      # Converse API in the Amazon Bedrock User Guide . To use a guardrail, see Use a guardrail with the
      # Converse API in the Amazon Bedrock User Guide . To use a tool with a model, see Tool use (Function
      # calling) in the Amazon Bedrock User Guide For example code, see Conversation streaming example in
      # the Amazon Bedrock User Guide . This operation requires permission for the
      # bedrock:InvokeModelWithResponseStream action. To deny all inference access to resources that you
      # specify in the modelId field, you need to deny access to the bedrock:InvokeModel and
      # bedrock:InvokeModelWithResponseStream actions. Doing this also denies access to the resource through
      # the base inference actions ( InvokeModel and InvokeModelWithResponseStream ). For more information
      # see Deny access for inference on specific models . For troubleshooting some of the common errors you
      # might encounter when using the ConverseStream API, see Troubleshooting Amazon Bedrock API Error
      # Codes in the Amazon Bedrock User Guide

      def converse_stream(
        model_id : String,
        additional_model_request_fields : Types::Document? = nil,
        additional_model_response_field_paths : Array(String)? = nil,
        guardrail_config : Types::GuardrailStreamConfiguration? = nil,
        inference_config : Types::InferenceConfiguration? = nil,
        messages : Array(Types::Message)? = nil,
        performance_config : Types::PerformanceConfiguration? = nil,
        prompt_variables : Hash(String, Types::PromptVariableValues)? = nil,
        request_metadata : Hash(String, String)? = nil,
        service_tier : Types::ServiceTier? = nil,
        system : Array(Types::SystemContentBlock)? = nil,
        tool_config : Types::ToolConfiguration? = nil
      ) : Protocol::Request
        input = Types::ConverseStreamRequest.new(model_id: model_id, additional_model_request_fields: additional_model_request_fields, additional_model_response_field_paths: additional_model_response_field_paths, guardrail_config: guardrail_config, inference_config: inference_config, messages: messages, performance_config: performance_config, prompt_variables: prompt_variables, request_metadata: request_metadata, service_tier: service_tier, system: system, tool_config: tool_config)
        converse_stream(input)
      end

      def converse_stream(input : Types::ConverseStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CONVERSE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the token count for a given inference request. This operation helps you estimate token usage
      # before sending requests to foundation models by returning the token count that would be used if the
      # same input were sent to the model in an inference request. Token counting is model-specific because
      # different models use different tokenization strategies. The token count returned by this operation
      # will match the token count that would be charged if the same input were sent to the model in an
      # InvokeModel or Converse request. You can use this operation to: Estimate costs before sending
      # inference requests. Optimize prompts to fit within token limits. Plan for token usage in your
      # applications. This operation accepts the same input formats as InvokeModel and Converse , allowing
      # you to count tokens for both raw text inputs and structured conversation formats. The following
      # operations are related to CountTokens : InvokeModel - Sends inference requests to foundation models
      # Converse - Sends conversation-based inference requests to foundation models

      def count_tokens(
        input : Types::CountTokensInput,
        model_id : String
      ) : Protocol::Request
        input = Types::CountTokensRequest.new(input: input, model_id: model_id)
        count_tokens(input)
      end

      def count_tokens(input : Types::CountTokensRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COUNT_TOKENS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve information about an asynchronous invocation.

      def get_async_invoke(
        invocation_arn : String
      ) : Protocol::Request
        input = Types::GetAsyncInvokeRequest.new(invocation_arn: invocation_arn)
        get_async_invoke(input)
      end

      def get_async_invoke(input : Types::GetAsyncInvokeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASYNC_INVOKE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invokes the specified Amazon Bedrock model to run inference using the prompt and inference
      # parameters provided in the request body. You use model inference to generate text, images, and
      # embeddings. For example code, see Invoke model code examples in the Amazon Bedrock User Guide . This
      # operation requires permission for the bedrock:InvokeModel action. To deny all inference access to
      # resources that you specify in the modelId field, you need to deny access to the bedrock:InvokeModel
      # and bedrock:InvokeModelWithResponseStream actions. Doing this also denies access to the resource
      # through the Converse API actions ( Converse and ConverseStream ). For more information see Deny
      # access for inference on specific models . For troubleshooting some of the common errors you might
      # encounter when using the InvokeModel API, see Troubleshooting Amazon Bedrock API Error Codes in the
      # Amazon Bedrock User Guide

      def invoke_model(
        model_id : String,
        accept : String? = nil,
        body : Bytes? = nil,
        content_type : String? = nil,
        guardrail_identifier : String? = nil,
        guardrail_version : String? = nil,
        performance_config_latency : String? = nil,
        service_tier : String? = nil,
        trace : String? = nil
      ) : Protocol::Request
        input = Types::InvokeModelRequest.new(model_id: model_id, accept: accept, body: body, content_type: content_type, guardrail_identifier: guardrail_identifier, guardrail_version: guardrail_version, performance_config_latency: performance_config_latency, service_tier: service_tier, trace: trace)
        invoke_model(input)
      end

      def invoke_model(input : Types::InvokeModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invoke the specified Amazon Bedrock model to run inference using the bidirectional stream. The
      # response is returned in a stream that remains open for 8 minutes. A single session can contain
      # multiple prompts and responses from the model. The prompts to the model are provided as audio files
      # and the model's responses are spoken back to the user and transcribed. It is possible for users to
      # interrupt the model's response with a new prompt, which will halt the response speech. The model
      # will retain contextual awareness of the conversation while pivoting to respond to the new prompt.

      def invoke_model_with_bidirectional_stream(
        body : Types::InvokeModelWithBidirectionalStreamInput,
        model_id : String
      ) : Protocol::Request
        input = Types::InvokeModelWithBidirectionalStreamRequest.new(body: body, model_id: model_id)
        invoke_model_with_bidirectional_stream(input)
      end

      def invoke_model_with_bidirectional_stream(input : Types::InvokeModelWithBidirectionalStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_MODEL_WITH_BIDIRECTIONAL_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invoke the specified Amazon Bedrock model to run inference using the prompt and inference parameters
      # provided in the request body. The response is returned in a stream. To see if a model supports
      # streaming, call GetFoundationModel and check the responseStreamingSupported field in the response.
      # The CLI doesn't support streaming operations in Amazon Bedrock, including
      # InvokeModelWithResponseStream . For example code, see Invoke model with streaming code example in
      # the Amazon Bedrock User Guide . This operation requires permissions to perform the
      # bedrock:InvokeModelWithResponseStream action. To deny all inference access to resources that you
      # specify in the modelId field, you need to deny access to the bedrock:InvokeModel and
      # bedrock:InvokeModelWithResponseStream actions. Doing this also denies access to the resource through
      # the Converse API actions ( Converse and ConverseStream ). For more information see Deny access for
      # inference on specific models . For troubleshooting some of the common errors you might encounter
      # when using the InvokeModelWithResponseStream API, see Troubleshooting Amazon Bedrock API Error Codes
      # in the Amazon Bedrock User Guide

      def invoke_model_with_response_stream(
        model_id : String,
        accept : String? = nil,
        body : Bytes? = nil,
        content_type : String? = nil,
        guardrail_identifier : String? = nil,
        guardrail_version : String? = nil,
        performance_config_latency : String? = nil,
        service_tier : String? = nil,
        trace : String? = nil
      ) : Protocol::Request
        input = Types::InvokeModelWithResponseStreamRequest.new(model_id: model_id, accept: accept, body: body, content_type: content_type, guardrail_identifier: guardrail_identifier, guardrail_version: guardrail_version, performance_config_latency: performance_config_latency, service_tier: service_tier, trace: trace)
        invoke_model_with_response_stream(input)
      end

      def invoke_model_with_response_stream(input : Types::InvokeModelWithResponseStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_MODEL_WITH_RESPONSE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists asynchronous invocations.

      def list_async_invokes(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil,
        submit_time_after : Time? = nil,
        submit_time_before : Time? = nil
      ) : Protocol::Request
        input = Types::ListAsyncInvokesRequest.new(max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals, submit_time_after: submit_time_after, submit_time_before: submit_time_before)
        list_async_invokes(input)
      end

      def list_async_invokes(input : Types::ListAsyncInvokesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASYNC_INVOKES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an asynchronous invocation. This operation requires permission for the bedrock:InvokeModel
      # action. To deny all inference access to resources that you specify in the modelId field, you need to
      # deny access to the bedrock:InvokeModel and bedrock:InvokeModelWithResponseStream actions. Doing this
      # also denies access to the resource through the Converse API actions ( Converse and ConverseStream ).
      # For more information see Deny access for inference on specific models .

      def start_async_invoke(
        model_id : String,
        model_input : Types::ModelInputPayload,
        output_data_config : Types::AsyncInvokeOutputDataConfig,
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::StartAsyncInvokeRequest.new(model_id: model_id, model_input: model_input, output_data_config: output_data_config, client_request_token: client_request_token, tags: tags)
        start_async_invoke(input)
      end

      def start_async_invoke(input : Types::StartAsyncInvokeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ASYNC_INVOKE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
