module AwsSdk
  module SageMakerRuntime
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

      # After you deploy a model into production using Amazon SageMaker AI hosting services, your client
      # applications use this API to get inferences from the model hosted at the specified endpoint. For an
      # overview of Amazon SageMaker AI, see How It Works . Amazon SageMaker AI strips all POST headers
      # except those supported by the API. Amazon SageMaker AI might add additional headers. You should not
      # rely on the behavior of headers outside those enumerated in the request syntax. Calls to
      # InvokeEndpoint are authenticated by using Amazon Web Services Signature Version 4. For information,
      # see Authenticating Requests (Amazon Web Services Signature Version 4) in the Amazon S3 API Reference
      # . A customer's model containers must respond to requests within 60 seconds. The model itself can
      # have a maximum processing time of 60 seconds before responding to invocations. If your model is
      # going to take 50-60 seconds of processing time, the SDK socket timeout should be set to be 70
      # seconds. Endpoints are scoped to an individual account, and are not public. The URL does not contain
      # the account ID, but Amazon SageMaker AI determines the account ID from the authentication token that
      # is supplied by the caller.

      def invoke_endpoint(
        body : Bytes,
        endpoint_name : String,
        accept : String? = nil,
        content_type : String? = nil,
        custom_attributes : String? = nil,
        enable_explanations : String? = nil,
        inference_component_name : String? = nil,
        inference_id : String? = nil,
        session_id : String? = nil,
        target_container_hostname : String? = nil,
        target_model : String? = nil,
        target_variant : String? = nil
      ) : Protocol::Request
        input = Types::InvokeEndpointInput.new(body: body, endpoint_name: endpoint_name, accept: accept, content_type: content_type, custom_attributes: custom_attributes, enable_explanations: enable_explanations, inference_component_name: inference_component_name, inference_id: inference_id, session_id: session_id, target_container_hostname: target_container_hostname, target_model: target_model, target_variant: target_variant)
        invoke_endpoint(input)
      end

      def invoke_endpoint(input : Types::InvokeEndpointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # After you deploy a model into production using Amazon SageMaker AI hosting services, your client
      # applications use this API to get inferences from the model hosted at the specified endpoint in an
      # asynchronous manner. Inference requests sent to this API are enqueued for asynchronous processing.
      # The processing of the inference request may or may not complete before you receive a response from
      # this API. The response from this API will not contain the result of the inference request but
      # contain information about where you can locate it. Amazon SageMaker AI strips all POST headers
      # except those supported by the API. Amazon SageMaker AI might add additional headers. You should not
      # rely on the behavior of headers outside those enumerated in the request syntax. Calls to
      # InvokeEndpointAsync are authenticated by using Amazon Web Services Signature Version 4. For
      # information, see Authenticating Requests (Amazon Web Services Signature Version 4) in the Amazon S3
      # API Reference .

      def invoke_endpoint_async(
        endpoint_name : String,
        input_location : String,
        accept : String? = nil,
        content_type : String? = nil,
        custom_attributes : String? = nil,
        inference_id : String? = nil,
        invocation_timeout_seconds : Int32? = nil,
        request_ttl_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::InvokeEndpointAsyncInput.new(endpoint_name: endpoint_name, input_location: input_location, accept: accept, content_type: content_type, custom_attributes: custom_attributes, inference_id: inference_id, invocation_timeout_seconds: invocation_timeout_seconds, request_ttl_seconds: request_ttl_seconds)
        invoke_endpoint_async(input)
      end

      def invoke_endpoint_async(input : Types::InvokeEndpointAsyncInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_ENDPOINT_ASYNC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invokes a model at the specified endpoint to return the inference response as a stream. The
      # inference stream provides the response payload incrementally as a series of parts. Before you can
      # get an inference stream, you must have access to a model that's deployed using Amazon SageMaker AI
      # hosting services, and the container for that model must support inference streaming. For more
      # information that can help you use this API, see the following sections in the Amazon SageMaker AI
      # Developer Guide : For information about how to add streaming support to a model, see How Containers
      # Serve Requests . For information about how to process the streaming response, see Invoke real-time
      # endpoints . Before you can use this operation, your IAM permissions must allow the
      # sagemaker:InvokeEndpoint action. For more information about Amazon SageMaker AI actions for IAM
      # policies, see Actions, resources, and condition keys for Amazon SageMaker AI in the IAM Service
      # Authorization Reference . Amazon SageMaker AI strips all POST headers except those supported by the
      # API. Amazon SageMaker AI might add additional headers. You should not rely on the behavior of
      # headers outside those enumerated in the request syntax. Calls to InvokeEndpointWithResponseStream
      # are authenticated by using Amazon Web Services Signature Version 4. For information, see
      # Authenticating Requests (Amazon Web Services Signature Version 4) in the Amazon S3 API Reference .

      def invoke_endpoint_with_response_stream(
        body : Bytes,
        endpoint_name : String,
        accept : String? = nil,
        content_type : String? = nil,
        custom_attributes : String? = nil,
        inference_component_name : String? = nil,
        inference_id : String? = nil,
        session_id : String? = nil,
        target_container_hostname : String? = nil,
        target_variant : String? = nil
      ) : Protocol::Request
        input = Types::InvokeEndpointWithResponseStreamInput.new(body: body, endpoint_name: endpoint_name, accept: accept, content_type: content_type, custom_attributes: custom_attributes, inference_component_name: inference_component_name, inference_id: inference_id, session_id: session_id, target_container_hostname: target_container_hostname, target_variant: target_variant)
        invoke_endpoint_with_response_stream(input)
      end

      def invoke_endpoint_with_response_stream(input : Types::InvokeEndpointWithResponseStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_ENDPOINT_WITH_RESPONSE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
