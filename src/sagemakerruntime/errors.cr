module Aws
  module SageMakerRuntime
    module Errors
      class ServiceError < Exception
      end

      # Your request caused an exception with an internal dependency. Contact customer support.

      class InternalDependencyException < ServiceError
      end

      # An internal failure occurred.

      class InternalFailure < ServiceError
      end

      # The stream processing failed because of an unknown error, exception or failure. Try your request
      # again.

      class InternalStreamFailure < ServiceError
      end

      # Model (owned by the customer in the container) returned 4xx or 5xx error code.

      class ModelError < ServiceError
      end

      # Either a serverless endpoint variant's resources are still being provisioned, or a multi-model
      # endpoint is still downloading or loading the target model. Wait and try your request again.

      class ModelNotReadyException < ServiceError
      end

      # An error occurred while streaming the response body. This error can have the following error codes:
      # ModelInvocationTimeExceeded The model failed to finish sending the response within the timeout
      # period allowed by Amazon SageMaker AI. StreamBroken The Transmission Control Protocol (TCP)
      # connection between the client and the model was reset or closed.

      class ModelStreamError < ServiceError
      end

      # The service is unavailable. Try your call again.

      class ServiceUnavailable < ServiceError
      end

      # Inspect your request and try again.

      class ValidationError < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalDependencyException"
          InternalDependencyException.new(message)
        when "InternalFailure"
          InternalFailure.new(message)
        when "InternalStreamFailure"
          InternalStreamFailure.new(message)
        when "ModelError"
          ModelError.new(message)
        when "ModelNotReadyException"
          ModelNotReadyException.new(message)
        when "ModelStreamError"
          ModelStreamError.new(message)
        when "ServiceUnavailable"
          ServiceUnavailable.new(message)
        when "ValidationError"
          ValidationError.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
