module AwsSdk
  module Grafana
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient permissions to perform this action.

      class AccessDeniedException < ServiceError
      end

      # A resource was in an inconsistent state during an update or a deletion.

      class ConflictException < ServiceError
      end

      # Unexpected error while processing the request. Retry the request.

      class InternalServerException < ServiceError
      end

      # The request references a resource that does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request would cause a service quota to be exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied because of request throttling. Retry the request.

      class ThrottlingException < ServiceError
      end

      # The value of a parameter in the request caused an error.

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
