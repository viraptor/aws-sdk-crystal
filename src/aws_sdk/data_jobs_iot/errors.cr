module AwsSdk
  module IoTJobsDataPlane
    module Errors
      class ServiceError < Exception
      end

      # The certificate is invalid.
      class CertificateValidationException < ServiceError
      end

      # A conflict has occurred when performing the API request.
      class ConflictException < ServiceError
      end

      # An internal server error occurred when performing the API request.
      class InternalServerException < ServiceError
      end

      # The contents of the request were invalid.
      class InvalidRequestException < ServiceError
      end

      # An update attempted to change the job execution to a state that is invalid because of the job
      # execution's current state (for example, an attempt to change a request in state SUCCESS to state
      # IN_PROGRESS). In this case, the body of the error message also contains the executionState field.
      class InvalidStateTransitionException < ServiceError
      end

      # The specified resource does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # The service quota has been exceeded for this request.
      class ServiceQuotaExceededException < ServiceError
      end

      # The service is temporarily unavailable.
      class ServiceUnavailableException < ServiceError
      end

      # The job is in a terminal state.
      class TerminalStateException < ServiceError
      end

      # The rate exceeds the limit.
      class ThrottlingException < ServiceError
      end

      # A validation error occurred when performing the API request.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CertificateValidationException"
          CertificateValidationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidStateTransitionException"
          InvalidStateTransitionException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TerminalStateException"
          TerminalStateException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
