module AwsSdk
  module ApplicationSignals
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permissions to perform this action.

      class AccessDeniedException < ServiceError
      end

      # This operation attempted to create a resource that already exists.

      class ConflictException < ServiceError
      end

      # Resource not found.

      class ResourceNotFoundException < ServiceError
      end

      # This request exceeds a service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was throttled because of quota limits.

      class ThrottlingException < ServiceError
      end

      # The resource is not valid.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
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
