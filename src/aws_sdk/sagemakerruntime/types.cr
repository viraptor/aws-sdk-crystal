require "json"

module AwsSdk
  module SageMakerRuntime
    module Types

      # Your request caused an exception with an internal dependency. Contact customer support.

      struct InternalDependencyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An internal failure occurred.

      struct InternalFailure
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The stream processing failed because of an unknown error, exception or failure. Try your request
      # again.

      struct InternalStreamFailure
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct InvokeEndpointAsyncInput
        include JSON::Serializable

        # The name of the endpoint that you specified when you created the endpoint using the CreateEndpoint
        # API.

        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        # The Amazon S3 URI where the inference request payload is stored.

        @[JSON::Field(key: "X-Amzn-SageMaker-InputLocation")]
        getter input_location : String

        # The desired MIME type of the inference response from the model container.

        @[JSON::Field(key: "X-Amzn-SageMaker-Accept")]
        getter accept : String?

        # The MIME type of the input data in the request body.

        @[JSON::Field(key: "X-Amzn-SageMaker-Content-Type")]
        getter content_type : String?

        # Provides additional information about a request for an inference submitted to a model hosted at an
        # Amazon SageMaker AI endpoint. The information is an opaque value that is forwarded verbatim. You
        # could use this value, for example, to provide an ID that you can use to track a request or to
        # provide other metadata that a service endpoint was programmed to process. The value must consist of
        # no more than 1024 visible US-ASCII characters as specified in Section 3.3.6. Field Value Components
        # of the Hypertext Transfer Protocol (HTTP/1.1). The code in your model is responsible for setting or
        # updating any custom attributes in the response. If your code does not set this value in the
        # response, an empty value is returned. For example, if a custom attribute represents the trace ID,
        # your model can prepend the custom attribute with Trace ID: in your post-processing function. This
        # feature is currently supported in the Amazon Web Services SDKs but not in the Amazon SageMaker AI
        # Python SDK.

        @[JSON::Field(key: "X-Amzn-SageMaker-Custom-Attributes")]
        getter custom_attributes : String?

        # The identifier for the inference request. Amazon SageMaker AI will generate an identifier for you if
        # none is specified.

        @[JSON::Field(key: "X-Amzn-SageMaker-Inference-Id")]
        getter inference_id : String?

        # Maximum amount of time in seconds a request can be processed before it is marked as expired. The
        # default is 15 minutes, or 900 seconds.

        @[JSON::Field(key: "X-Amzn-SageMaker-InvocationTimeoutSeconds")]
        getter invocation_timeout_seconds : Int32?

        # Maximum age in seconds a request can be in the queue before it is marked as expired. The default is
        # 6 hours, or 21,600 seconds.

        @[JSON::Field(key: "X-Amzn-SageMaker-RequestTTLSeconds")]
        getter request_ttl_seconds : Int32?

        def initialize(
          @endpoint_name : String,
          @input_location : String,
          @accept : String? = nil,
          @content_type : String? = nil,
          @custom_attributes : String? = nil,
          @inference_id : String? = nil,
          @invocation_timeout_seconds : Int32? = nil,
          @request_ttl_seconds : Int32? = nil
        )
        end
      end


      struct InvokeEndpointAsyncOutput
        include JSON::Serializable

        # The Amazon S3 URI where the inference failure response payload is stored.

        @[JSON::Field(key: "X-Amzn-SageMaker-FailureLocation")]
        getter failure_location : String?

        # Identifier for an inference request. This will be the same as the InferenceId specified in the
        # input. Amazon SageMaker AI will generate an identifier for you if you do not specify one.

        @[JSON::Field(key: "InferenceId")]
        getter inference_id : String?

        # The Amazon S3 URI where the inference response payload is stored.

        @[JSON::Field(key: "X-Amzn-SageMaker-OutputLocation")]
        getter output_location : String?

        def initialize(
          @failure_location : String? = nil,
          @inference_id : String? = nil,
          @output_location : String? = nil
        )
        end
      end


      struct InvokeEndpointInput
        include JSON::Serializable

        # Provides input data, in the format specified in the ContentType request header. Amazon SageMaker AI
        # passes all of the data in the body to the model. For information about the format of the request
        # body, see Common Data Formats-Inference .

        @[JSON::Field(key: "Body")]
        getter body : Bytes

        # The name of the endpoint that you specified when you created the endpoint using the CreateEndpoint
        # API.

        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        # The desired MIME type of the inference response from the model container.

        @[JSON::Field(key: "Accept")]
        getter accept : String?

        # The MIME type of the input data in the request body.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Provides additional information about a request for an inference submitted to a model hosted at an
        # Amazon SageMaker AI endpoint. The information is an opaque value that is forwarded verbatim. You
        # could use this value, for example, to provide an ID that you can use to track a request or to
        # provide other metadata that a service endpoint was programmed to process. The value must consist of
        # no more than 1024 visible US-ASCII characters as specified in Section 3.3.6. Field Value Components
        # of the Hypertext Transfer Protocol (HTTP/1.1). The code in your model is responsible for setting or
        # updating any custom attributes in the response. If your code does not set this value in the
        # response, an empty value is returned. For example, if a custom attribute represents the trace ID,
        # your model can prepend the custom attribute with Trace ID: in your post-processing function. This
        # feature is currently supported in the Amazon Web Services SDKs but not in the Amazon SageMaker AI
        # Python SDK.

        @[JSON::Field(key: "X-Amzn-SageMaker-Custom-Attributes")]
        getter custom_attributes : String?

        # An optional JMESPath expression used to override the EnableExplanations parameter of the
        # ClarifyExplainerConfig API. See the EnableExplanations section in the developer guide for more
        # information.

        @[JSON::Field(key: "X-Amzn-SageMaker-Enable-Explanations")]
        getter enable_explanations : String?

        # If the endpoint hosts one or more inference components, this parameter specifies the name of
        # inference component to invoke.

        @[JSON::Field(key: "X-Amzn-SageMaker-Inference-Component")]
        getter inference_component_name : String?

        # If you provide a value, it is added to the captured data when you enable data capture on the
        # endpoint. For information about data capture, see Capture Data .

        @[JSON::Field(key: "X-Amzn-SageMaker-Inference-Id")]
        getter inference_id : String?

        # Creates a stateful session or identifies an existing one. You can do one of the following: Create a
        # stateful session by specifying the value NEW_SESSION . Send your request to an existing stateful
        # session by specifying the ID of that session. With a stateful session, you can send multiple
        # requests to a stateful model. When you create a session with a stateful model, the model must create
        # the session ID and set the expiration time. The model must also provide that information in the
        # response to your request. You can get the ID and timestamp from the NewSessionId response parameter.
        # For any subsequent request where you specify that session ID, SageMaker AI routes the request to the
        # same instance that supports the session.

        @[JSON::Field(key: "X-Amzn-SageMaker-Session-Id")]
        getter session_id : String?

        # If the endpoint hosts multiple containers and is configured to use direct invocation, this parameter
        # specifies the host name of the container to invoke.

        @[JSON::Field(key: "X-Amzn-SageMaker-Target-Container-Hostname")]
        getter target_container_hostname : String?

        # The model to request for inference when invoking a multi-model endpoint.

        @[JSON::Field(key: "X-Amzn-SageMaker-Target-Model")]
        getter target_model : String?

        # Specify the production variant to send the inference request to when invoking an endpoint that is
        # running two or more variants. Note that this parameter overrides the default behavior for the
        # endpoint, which is to distribute the invocation traffic based on the variant weights. For
        # information about how to use variant targeting to perform a/b testing, see Test models in production

        @[JSON::Field(key: "X-Amzn-SageMaker-Target-Variant")]
        getter target_variant : String?

        def initialize(
          @body : Bytes,
          @endpoint_name : String,
          @accept : String? = nil,
          @content_type : String? = nil,
          @custom_attributes : String? = nil,
          @enable_explanations : String? = nil,
          @inference_component_name : String? = nil,
          @inference_id : String? = nil,
          @session_id : String? = nil,
          @target_container_hostname : String? = nil,
          @target_model : String? = nil,
          @target_variant : String? = nil
        )
        end
      end


      struct InvokeEndpointOutput
        include JSON::Serializable

        # Includes the inference provided by the model. For information about the format of the response body,
        # see Common Data Formats-Inference . If the explainer is activated, the body includes the
        # explanations provided by the model. For more information, see the Response section under Invoke the
        # Endpoint in the Developer Guide.

        @[JSON::Field(key: "Body")]
        getter body : Bytes

        # If you closed a stateful session with your request, the ID of that session.

        @[JSON::Field(key: "X-Amzn-SageMaker-Closed-Session-Id")]
        getter closed_session_id : String?

        # The MIME type of the inference returned from the model container.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Provides additional information in the response about the inference returned by a model hosted at an
        # Amazon SageMaker AI endpoint. The information is an opaque value that is forwarded verbatim. You
        # could use this value, for example, to return an ID received in the CustomAttributes header of a
        # request or other metadata that a service endpoint was programmed to produce. The value must consist
        # of no more than 1024 visible US-ASCII characters as specified in Section 3.3.6. Field Value
        # Components of the Hypertext Transfer Protocol (HTTP/1.1). If the customer wants the custom attribute
        # returned, the model must set the custom attribute to be included on the way back. The code in your
        # model is responsible for setting or updating any custom attributes in the response. If your code
        # does not set this value in the response, an empty value is returned. For example, if a custom
        # attribute represents the trace ID, your model can prepend the custom attribute with Trace ID: in
        # your post-processing function. This feature is currently supported in the Amazon Web Services SDKs
        # but not in the Amazon SageMaker AI Python SDK.

        @[JSON::Field(key: "X-Amzn-SageMaker-Custom-Attributes")]
        getter custom_attributes : String?

        # Identifies the production variant that was invoked.

        @[JSON::Field(key: "x-Amzn-Invoked-Production-Variant")]
        getter invoked_production_variant : String?

        # If you created a stateful session with your request, the ID and expiration time that the model
        # assigns to that session.

        @[JSON::Field(key: "X-Amzn-SageMaker-New-Session-Id")]
        getter new_session_id : String?

        def initialize(
          @body : Bytes,
          @closed_session_id : String? = nil,
          @content_type : String? = nil,
          @custom_attributes : String? = nil,
          @invoked_production_variant : String? = nil,
          @new_session_id : String? = nil
        )
        end
      end


      struct InvokeEndpointWithResponseStreamInput
        include JSON::Serializable

        # Provides input data, in the format specified in the ContentType request header. Amazon SageMaker AI
        # passes all of the data in the body to the model. For information about the format of the request
        # body, see Common Data Formats-Inference .

        @[JSON::Field(key: "Body")]
        getter body : Bytes

        # The name of the endpoint that you specified when you created the endpoint using the CreateEndpoint
        # API.

        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        # The desired MIME type of the inference response from the model container.

        @[JSON::Field(key: "X-Amzn-SageMaker-Accept")]
        getter accept : String?

        # The MIME type of the input data in the request body.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Provides additional information about a request for an inference submitted to a model hosted at an
        # Amazon SageMaker AI endpoint. The information is an opaque value that is forwarded verbatim. You
        # could use this value, for example, to provide an ID that you can use to track a request or to
        # provide other metadata that a service endpoint was programmed to process. The value must consist of
        # no more than 1024 visible US-ASCII characters as specified in Section 3.3.6. Field Value Components
        # of the Hypertext Transfer Protocol (HTTP/1.1). The code in your model is responsible for setting or
        # updating any custom attributes in the response. If your code does not set this value in the
        # response, an empty value is returned. For example, if a custom attribute represents the trace ID,
        # your model can prepend the custom attribute with Trace ID: in your post-processing function. This
        # feature is currently supported in the Amazon Web Services SDKs but not in the Amazon SageMaker AI
        # Python SDK.

        @[JSON::Field(key: "X-Amzn-SageMaker-Custom-Attributes")]
        getter custom_attributes : String?

        # If the endpoint hosts one or more inference components, this parameter specifies the name of
        # inference component to invoke for a streaming response.

        @[JSON::Field(key: "X-Amzn-SageMaker-Inference-Component")]
        getter inference_component_name : String?

        # An identifier that you assign to your request.

        @[JSON::Field(key: "X-Amzn-SageMaker-Inference-Id")]
        getter inference_id : String?

        # The ID of a stateful session to handle your request. You can't create a stateful session by using
        # the InvokeEndpointWithResponseStream action. Instead, you can create one by using the InvokeEndpoint
        # action. In your request, you specify NEW_SESSION for the SessionId request parameter. The response
        # to that request provides the session ID for the NewSessionId response parameter.

        @[JSON::Field(key: "X-Amzn-SageMaker-Session-Id")]
        getter session_id : String?

        # If the endpoint hosts multiple containers and is configured to use direct invocation, this parameter
        # specifies the host name of the container to invoke.

        @[JSON::Field(key: "X-Amzn-SageMaker-Target-Container-Hostname")]
        getter target_container_hostname : String?

        # Specify the production variant to send the inference request to when invoking an endpoint that is
        # running two or more variants. Note that this parameter overrides the default behavior for the
        # endpoint, which is to distribute the invocation traffic based on the variant weights. For
        # information about how to use variant targeting to perform a/b testing, see Test models in production

        @[JSON::Field(key: "X-Amzn-SageMaker-Target-Variant")]
        getter target_variant : String?

        def initialize(
          @body : Bytes,
          @endpoint_name : String,
          @accept : String? = nil,
          @content_type : String? = nil,
          @custom_attributes : String? = nil,
          @inference_component_name : String? = nil,
          @inference_id : String? = nil,
          @session_id : String? = nil,
          @target_container_hostname : String? = nil,
          @target_variant : String? = nil
        )
        end
      end


      struct InvokeEndpointWithResponseStreamOutput
        include JSON::Serializable


        @[JSON::Field(key: "Body")]
        getter body : Types::ResponseStream

        # The MIME type of the inference returned from the model container.

        @[JSON::Field(key: "X-Amzn-SageMaker-Content-Type")]
        getter content_type : String?

        # Provides additional information in the response about the inference returned by a model hosted at an
        # Amazon SageMaker AI endpoint. The information is an opaque value that is forwarded verbatim. You
        # could use this value, for example, to return an ID received in the CustomAttributes header of a
        # request or other metadata that a service endpoint was programmed to produce. The value must consist
        # of no more than 1024 visible US-ASCII characters as specified in Section 3.3.6. Field Value
        # Components of the Hypertext Transfer Protocol (HTTP/1.1). If the customer wants the custom attribute
        # returned, the model must set the custom attribute to be included on the way back. The code in your
        # model is responsible for setting or updating any custom attributes in the response. If your code
        # does not set this value in the response, an empty value is returned. For example, if a custom
        # attribute represents the trace ID, your model can prepend the custom attribute with Trace ID: in
        # your post-processing function. This feature is currently supported in the Amazon Web Services SDKs
        # but not in the Amazon SageMaker AI Python SDK.

        @[JSON::Field(key: "X-Amzn-SageMaker-Custom-Attributes")]
        getter custom_attributes : String?

        # Identifies the production variant that was invoked.

        @[JSON::Field(key: "x-Amzn-Invoked-Production-Variant")]
        getter invoked_production_variant : String?

        def initialize(
          @body : Types::ResponseStream,
          @content_type : String? = nil,
          @custom_attributes : String? = nil,
          @invoked_production_variant : String? = nil
        )
        end
      end

      # Model (owned by the customer in the container) returned 4xx or 5xx error code.

      struct ModelError
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the log stream.

        @[JSON::Field(key: "LogStreamArn")]
        getter log_stream_arn : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Original message.

        @[JSON::Field(key: "OriginalMessage")]
        getter original_message : String?

        # Original status code.

        @[JSON::Field(key: "OriginalStatusCode")]
        getter original_status_code : Int32?

        def initialize(
          @log_stream_arn : String? = nil,
          @message : String? = nil,
          @original_message : String? = nil,
          @original_status_code : Int32? = nil
        )
        end
      end

      # Either a serverless endpoint variant's resources are still being provisioned, or a multi-model
      # endpoint is still downloading or loading the target model. Wait and try your request again.

      struct ModelNotReadyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An error occurred while streaming the response body. This error can have the following error codes:
      # ModelInvocationTimeExceeded The model failed to finish sending the response within the timeout
      # period allowed by Amazon SageMaker AI. StreamBroken The Transmission Control Protocol (TCP)
      # connection between the client and the model was reset or closed.

      struct ModelStreamError
        include JSON::Serializable

        # This error can have the following error codes: ModelInvocationTimeExceeded The model failed to
        # finish sending the response within the timeout period allowed by Amazon SageMaker AI. StreamBroken
        # The Transmission Control Protocol (TCP) connection between the client and the model was reset or
        # closed.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A wrapper for pieces of the payload that's returned in response to a streaming inference request. A
      # streaming inference response consists of one or more payload parts.

      struct PayloadPart
        include JSON::Serializable

        # A blob that contains part of the response for your streaming inference request.

        @[JSON::Field(key: "Bytes")]
        getter bytes : Bytes?

        def initialize(
          @bytes : Bytes? = nil
        )
        end
      end

      # A stream of payload parts. Each part contains a portion of the response for a streaming inference
      # request.

      struct ResponseStream
        include JSON::Serializable

        # The stream processing failed because of an unknown error, exception or failure. Try your request
        # again.

        @[JSON::Field(key: "InternalStreamFailure")]
        getter internal_stream_failure : Types::InternalStreamFailure?

        # An error occurred while streaming the response body. This error can have the following error codes:
        # ModelInvocationTimeExceeded The model failed to finish sending the response within the timeout
        # period allowed by Amazon SageMaker AI. StreamBroken The Transmission Control Protocol (TCP)
        # connection between the client and the model was reset or closed.

        @[JSON::Field(key: "ModelStreamError")]
        getter model_stream_error : Types::ModelStreamError?

        # A wrapper for pieces of the payload that's returned in response to a streaming inference request. A
        # streaming inference response consists of one or more payload parts.

        @[JSON::Field(key: "PayloadPart")]
        getter payload_part : Types::PayloadPart?

        def initialize(
          @internal_stream_failure : Types::InternalStreamFailure? = nil,
          @model_stream_error : Types::ModelStreamError? = nil,
          @payload_part : Types::PayloadPart? = nil
        )
        end
      end

      # The service is unavailable. Try your call again.

      struct ServiceUnavailable
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Inspect your request and try again.

      struct ValidationError
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
