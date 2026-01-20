module AwsSdk
  module WellArchitected
    module Errors
      class ServiceError < Exception
      end

      # User does not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The resource has already been processed, was deleted, or is too large.

      class ConflictException < ServiceError
      end

      # There is a problem with the Well-Architected Tool API service.

      class InternalServerException < ServiceError
      end

      # The requested resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The user has reached their resource quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # Request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The user input is not valid.

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
