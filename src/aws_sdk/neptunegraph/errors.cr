module AwsSdk
  module NeptuneGraph
    module Errors
      class ServiceError < Exception
      end

      # Raised in case of an authentication or authorization failure.

      class AccessDeniedException < ServiceError
      end

      # Raised when a conflict is encountered.

      class ConflictException < ServiceError
      end

      # A failure occurred on the server.

      class InternalServerException < ServiceError
      end

      # A specified resource could not be located.

      class ResourceNotFoundException < ServiceError
      end

      # A service quota was exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The exception was interrupted by throttling.

      class ThrottlingException < ServiceError
      end

      # Request cannot be processed due to known reasons. Eg. partition full.

      class UnprocessableException < ServiceError
      end

      # A resource could not be validated.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnprocessableException"
          UnprocessableException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
