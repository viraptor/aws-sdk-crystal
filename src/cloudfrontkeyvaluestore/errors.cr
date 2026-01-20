module Aws
  module CloudFrontKeyValueStore
    module Errors
      class ServiceError < Exception
      end

      # Access denied.

      class AccessDeniedException < ServiceError
      end

      # Resource is not in expected state.

      class ConflictException < ServiceError
      end

      # Internal server error.

      class InternalServerException < ServiceError
      end

      # Resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # Limit exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # Validation failed.

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
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
