module AwsSdk
  module AccessAnalyzer
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # A conflict exception error.
      class ConflictException < ServiceError
      end

      # Internal server error.
      class InternalServerException < ServiceError
      end

      # The specified parameter is invalid.
      class InvalidParameterException < ServiceError
      end

      # The specified resource could not be found.
      class ResourceNotFoundException < ServiceError
      end

      # Service quote met error.
      class ServiceQuotaExceededException < ServiceError
      end

      # Throttling limit exceeded error.
      class ThrottlingException < ServiceError
      end

      # The specified entity could not be processed.
      class UnprocessableEntityException < ServiceError
      end

      # Validation exception error.
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
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnprocessableEntityException"
          UnprocessableEntityException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
