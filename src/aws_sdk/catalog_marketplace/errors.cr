module AwsSdk
  module MarketplaceCatalog
    module Errors
      class ServiceError < Exception
      end

      # Access is denied. HTTP status code: 403
      class AccessDeniedException < ServiceError
      end

      # There was an internal service exception. HTTP status code: 500
      class InternalServiceException < ServiceError
      end

      # The resource is currently in use.
      class ResourceInUseException < ServiceError
      end

      # The specified resource wasn't found. HTTP status code: 404
      class ResourceNotFoundException < ServiceError
      end

      # Currently, the specified resource is not supported.
      class ResourceNotSupportedException < ServiceError
      end

      # The maximum number of open requests per account has been exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # Too many requests. HTTP status code: 429
      class ThrottlingException < ServiceError
      end

      # An error occurred during validation. HTTP status code: 422
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceNotSupportedException"
          ResourceNotSupportedException.new(message)
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
