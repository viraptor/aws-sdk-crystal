module AwsSdk
  module DataPipeline
    module Errors
      class ServiceError < Exception
      end

      # An internal service error occurred.

      class InternalServiceError < ServiceError
      end

      # The request was not valid. Verify that your request was properly formatted, that the signature was
      # generated with the correct credentials, and that you haven't exceeded any of the service limits for
      # your account.

      class InvalidRequestException < ServiceError
      end

      # The specified pipeline has been deleted.

      class PipelineDeletedException < ServiceError
      end

      # The specified pipeline was not found. Verify that you used the correct user and account identifiers.

      class PipelineNotFoundException < ServiceError
      end

      # The specified task was not found.

      class TaskNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServiceError"
          InternalServiceError.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "PipelineDeletedException"
          PipelineDeletedException.new(message)
        when "PipelineNotFoundException"
          PipelineNotFoundException.new(message)
        when "TaskNotFoundException"
          TaskNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
