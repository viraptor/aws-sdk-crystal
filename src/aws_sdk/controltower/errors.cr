module AwsSdk
  module ControlTower
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Updating or deleting the resource can cause an inconsistent state.

      class ConflictException < ServiceError
      end

      # An unexpected error occurred during processing of a request.

      class InternalServerException < ServiceError
      end

      # The request references a resource that does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request would cause a service quota to be exceeded. See Service quotas .

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input does not satisfy the constraints specified by an Amazon Web Services service.

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
