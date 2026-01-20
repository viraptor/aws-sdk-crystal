module AwsSdk
  module AppIntegrations
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # A resource with the specified name already exists.

      class DuplicateResourceException < ServiceError
      end

      # Request processing failed due to an error or failure with the service.

      class InternalServiceError < ServiceError
      end

      # The request is not valid.

      class InvalidRequestException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The allowed quota for the resource has been exceeded.

      class ResourceQuotaExceededException < ServiceError
      end

      # The throttling limit has been exceeded.

      class ThrottlingException < ServiceError
      end

      # The operation is not supported.

      class UnsupportedOperationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "DuplicateResourceException"
          DuplicateResourceException.new(message)
        when "InternalServiceError"
          InternalServiceError.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceQuotaExceededException"
          ResourceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
