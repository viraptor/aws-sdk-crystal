module AwsSdk
  module Panorama
    module Errors
      class ServiceError < Exception
      end

      # The requestor does not have permission to access the target action or resource.
      class AccessDeniedException < ServiceError
      end

      # The target resource is in use.
      class ConflictException < ServiceError
      end

      # An internal error occurred.
      class InternalServerException < ServiceError
      end

      # The target resource was not found.
      class ResourceNotFoundException < ServiceError
      end

      # The request would cause a limit to be exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request contains an invalid parameter value.
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
