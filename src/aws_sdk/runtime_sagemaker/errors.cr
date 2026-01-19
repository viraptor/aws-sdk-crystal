module AwsSdk
  module SageMakerRuntimeHTTP2
    module Errors
      class ServiceError < Exception
      end

      # The input fails to satisfy the constraints specified by an AWS service.
      class InputValidationError < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure.
      class InternalServerError < ServiceError
      end

      # Internal stream failure that occurs during streaming.
      class InternalStreamFailure < ServiceError
      end

      # An error occurred while processing the model.
      class ModelError < ServiceError
      end

      # Model stream error that occurs during streaming.
      class ModelStreamError < ServiceError
      end

      # The request has failed due to a temporary failure of the server.
      class ServiceUnavailableError < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InputValidationError"
          InputValidationError.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InternalStreamFailure"
          InternalStreamFailure.new(message)
        when "ModelError"
          ModelError.new(message)
        when "ModelStreamError"
          ModelStreamError.new(message)
        when "ServiceUnavailableError"
          ServiceUnavailableError.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
