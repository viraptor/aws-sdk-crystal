require "json"

module AwsSdk
  module SageMakerRuntimeHTTP2
    module Types

      # The input fails to satisfy the constraints specified by an AWS service.
      struct InputValidationError
        include JSON::Serializable

        # Error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct InternalServerError
        include JSON::Serializable

        # Error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Internal stream failure that occurs during streaming.
      struct InternalStreamFailure
        include JSON::Serializable

        # Error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct InvokeEndpointWithBidirectionalStreamInput
        include JSON::Serializable

        # The request payload stream.
        @[JSON::Field(key: "Body")]
        getter body : Types::RequestStreamEvent

        # The name of the endpoint to invoke.
        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        # Model invocation path.
        @[JSON::Field(key: "X-Amzn-SageMaker-Model-Invocation-Path")]
        getter model_invocation_path : String?

        # Model query string.
        @[JSON::Field(key: "X-Amzn-SageMaker-Model-Query-String")]
        getter model_query_string : String?

        # Target variant for the request.
        @[JSON::Field(key: "X-Amzn-SageMaker-Target-Variant")]
        getter target_variant : String?

        def initialize(
          @body : Types::RequestStreamEvent,
          @endpoint_name : String,
          @model_invocation_path : String? = nil,
          @model_query_string : String? = nil,
          @target_variant : String? = nil
        )
        end
      end

      struct InvokeEndpointWithBidirectionalStreamOutput
        include JSON::Serializable

        # The response payload stream.
        @[JSON::Field(key: "Body")]
        getter body : Types::ResponseStreamEvent

        # The invoked production variant.
        @[JSON::Field(key: "X-Amzn-Invoked-Production-Variant")]
        getter invoked_production_variant : String?

        def initialize(
          @body : Types::ResponseStreamEvent,
          @invoked_production_variant : String? = nil
        )
        end
      end

      # An error occurred while processing the model.
      struct ModelError
        include JSON::Serializable

        # Error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # CloudWatch log stream ARN.
        @[JSON::Field(key: "LogStreamArn")]
        getter log_stream_arn : String?

        # Error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Original error message from the model.
        @[JSON::Field(key: "OriginalMessage")]
        getter original_message : String?

        # HTTP status code returned by model.
        @[JSON::Field(key: "OriginalStatusCode")]
        getter original_status_code : Int32?

        def initialize(
          @error_code : String? = nil,
          @log_stream_arn : String? = nil,
          @message : String? = nil,
          @original_message : String? = nil,
          @original_status_code : Int32? = nil
        )
        end
      end

      # Model stream error that occurs during streaming.
      struct ModelStreamError
        include JSON::Serializable

        # Error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Request payload part structure.
      struct RequestPayloadPart
        include JSON::Serializable

        # The payload bytes.
        @[JSON::Field(key: "Bytes")]
        getter bytes : Bytes?

        # Completion state header. Can be one of these possible values: "PARTIAL", "COMPLETE".
        @[JSON::Field(key: "CompletionState")]
        getter completion_state : String?

        # Data type header. Can be one of these possible values: "UTF8", "BINARY".
        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # Padding string for alignment.
        @[JSON::Field(key: "P")]
        getter p : String?

        def initialize(
          @bytes : Bytes? = nil,
          @completion_state : String? = nil,
          @data_type : String? = nil,
          @p : String? = nil
        )
        end
      end

      # Request stream event union.
      struct RequestStreamEvent
        include JSON::Serializable

        # Payload part event.
        @[JSON::Field(key: "PayloadPart")]
        getter payload_part : Types::RequestPayloadPart?

        def initialize(
          @payload_part : Types::RequestPayloadPart? = nil
        )
        end
      end

      # Response payload part structure.
      struct ResponsePayloadPart
        include JSON::Serializable

        # The payload bytes.
        @[JSON::Field(key: "Bytes")]
        getter bytes : Bytes?

        # Completion state header. Can be one of these possible values: "PARTIAL", "COMPLETE".
        @[JSON::Field(key: "CompletionState")]
        getter completion_state : String?

        # Data type header. Can be one of these possible values: "UTF8", "BINARY".
        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # Padding string for alignment.
        @[JSON::Field(key: "P")]
        getter p : String?

        def initialize(
          @bytes : Bytes? = nil,
          @completion_state : String? = nil,
          @data_type : String? = nil,
          @p : String? = nil
        )
        end
      end

      # Response stream event union.
      struct ResponseStreamEvent
        include JSON::Serializable

        # Internal stream failure event.
        @[JSON::Field(key: "InternalStreamFailure")]
        getter internal_stream_failure : Types::InternalStreamFailure?

        # Model stream error event.
        @[JSON::Field(key: "ModelStreamError")]
        getter model_stream_error : Types::ModelStreamError?

        # Payload part event.
        @[JSON::Field(key: "PayloadPart")]
        getter payload_part : Types::ResponsePayloadPart?

        def initialize(
          @internal_stream_failure : Types::InternalStreamFailure? = nil,
          @model_stream_error : Types::ModelStreamError? = nil,
          @payload_part : Types::ResponsePayloadPart? = nil
        )
        end
      end

      # The request has failed due to a temporary failure of the server.
      struct ServiceUnavailableError
        include JSON::Serializable

        # Error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end
    end
  end
end
