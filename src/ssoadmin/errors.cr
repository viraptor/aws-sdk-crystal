module Aws
  module SSOAdmin
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Occurs when a conflict with a previous successful write is detected. This generally occurs when the
      # previous write did not have time to propagate to the host serving the current request. A retry (with
      # appropriate backoff logic) is the recommended response to this exception.

      class ConflictException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception, or failure with an
      # internal server.

      class InternalServerException < ServiceError
      end

      # Indicates that a requested resource is not found.

      class ResourceNotFoundException < ServiceError
      end

      # Indicates that the principal has crossed the permitted number of resources that can be created.

      class ServiceQuotaExceededException < ServiceError
      end

      # Indicates that the principal has crossed the throttling limits of the API operations.

      class ThrottlingException < ServiceError
      end

      # The request failed because it contains a syntax error.

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
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
