module Aws
  module SageMakerRuntimeHTTP2
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

      # Invokes a model endpoint with bidirectional streaming capabilities. This operation establishes a
      # persistent connection that allows you to send multiple requests and receive streaming responses from
      # the model in real-time. Bidirectional streaming is useful for interactive applications such as
      # chatbots, real-time translation, or any scenario where you need to maintain a conversation-like
      # interaction with the model. The connection remains open, allowing you to send additional input and
      # receive responses without establishing a new connection for each request. For an overview of Amazon
      # SageMaker AI, see How It Works . Amazon SageMaker AI strips all POST headers except those supported
      # by the API. Amazon SageMaker AI might add additional headers. You should not rely on the behavior of
      # headers outside those enumerated in the request syntax. Calls to
      # InvokeEndpointWithBidirectionalStream are authenticated by using Amazon Web Services Signature
      # Version 4. For information, see Authenticating Requests (Amazon Web Services Signature Version 4) in
      # the Amazon S3 API Reference . The bidirectional stream maintains the connection until either the
      # client closes it or the model indicates completion. Each request and response in the stream is sent
      # as an event with optional headers for data type and completion state. Endpoints are scoped to an
      # individual account, and are not public. The URL does not contain the account ID, but Amazon
      # SageMaker AI determines the account ID from the authentication token that is supplied by the caller.

      def invoke_endpoint_with_bidirectional_stream(
        body : Types::RequestStreamEvent,
        endpoint_name : String,
        model_invocation_path : String? = nil,
        model_query_string : String? = nil,
        target_variant : String? = nil
      ) : Protocol::Request
        input = Types::InvokeEndpointWithBidirectionalStreamInput.new(body: body, endpoint_name: endpoint_name, model_invocation_path: model_invocation_path, model_query_string: model_query_string, target_variant: target_variant)
        invoke_endpoint_with_bidirectional_stream(input)
      end

      def invoke_endpoint_with_bidirectional_stream(input : Types::InvokeEndpointWithBidirectionalStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_ENDPOINT_WITH_BIDIRECTIONAL_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
